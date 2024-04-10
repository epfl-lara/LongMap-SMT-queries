; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38452 () Bool)

(assert start!38452)

(declare-fun b!396710 () Bool)

(declare-fun res!227647 () Bool)

(declare-fun e!240019 () Bool)

(assert (=> b!396710 (=> (not res!227647) (not e!240019))))

(declare-datatypes ((array!23655 0))(
  ( (array!23656 (arr!11277 (Array (_ BitVec 32) (_ BitVec 64))) (size!11629 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23655)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14267 0))(
  ( (V!14268 (val!4980 Int)) )
))
(declare-datatypes ((ValueCell!4592 0))(
  ( (ValueCellFull!4592 (v!7227 V!14267)) (EmptyCell!4592) )
))
(declare-datatypes ((array!23657 0))(
  ( (array!23658 (arr!11278 (Array (_ BitVec 32) ValueCell!4592)) (size!11630 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23657)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!396710 (= res!227647 (and (= (size!11630 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11629 _keys!709) (size!11630 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!396711 () Bool)

(declare-fun res!227645 () Bool)

(assert (=> b!396711 (=> (not res!227645) (not e!240019))))

(declare-datatypes ((List!6532 0))(
  ( (Nil!6529) (Cons!6528 (h!7384 (_ BitVec 64)) (t!11706 List!6532)) )
))
(declare-fun arrayNoDuplicates!0 (array!23655 (_ BitVec 32) List!6532) Bool)

(assert (=> b!396711 (= res!227645 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6529))))

(declare-fun b!396712 () Bool)

(declare-fun res!227641 () Bool)

(assert (=> b!396712 (=> (not res!227641) (not e!240019))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!396712 (= res!227641 (or (= (select (arr!11277 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11277 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16428 () Bool)

(declare-fun mapRes!16428 () Bool)

(declare-fun tp!32223 () Bool)

(declare-fun e!240021 () Bool)

(assert (=> mapNonEmpty!16428 (= mapRes!16428 (and tp!32223 e!240021))))

(declare-fun mapRest!16428 () (Array (_ BitVec 32) ValueCell!4592))

(declare-fun mapKey!16428 () (_ BitVec 32))

(declare-fun mapValue!16428 () ValueCell!4592)

(assert (=> mapNonEmpty!16428 (= (arr!11278 _values!549) (store mapRest!16428 mapKey!16428 mapValue!16428))))

(declare-fun b!396713 () Bool)

(declare-fun res!227644 () Bool)

(assert (=> b!396713 (=> (not res!227644) (not e!240019))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!396713 (= res!227644 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!396714 () Bool)

(declare-fun res!227640 () Bool)

(assert (=> b!396714 (=> (not res!227640) (not e!240019))))

(assert (=> b!396714 (= res!227640 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11629 _keys!709))))))

(declare-fun mapIsEmpty!16428 () Bool)

(assert (=> mapIsEmpty!16428 mapRes!16428))

(declare-fun b!396715 () Bool)

(declare-fun tp_is_empty!9871 () Bool)

(assert (=> b!396715 (= e!240021 tp_is_empty!9871)))

(declare-fun b!396716 () Bool)

(declare-fun e!240024 () Bool)

(assert (=> b!396716 (= e!240019 e!240024)))

(declare-fun res!227648 () Bool)

(assert (=> b!396716 (=> (not res!227648) (not e!240024))))

(declare-fun lt!187193 () array!23655)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23655 (_ BitVec 32)) Bool)

(assert (=> b!396716 (= res!227648 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187193 mask!1025))))

(assert (=> b!396716 (= lt!187193 (array!23656 (store (arr!11277 _keys!709) i!563 k!794) (size!11629 _keys!709)))))

(declare-fun b!396717 () Bool)

(declare-fun res!227646 () Bool)

(assert (=> b!396717 (=> (not res!227646) (not e!240019))))

(assert (=> b!396717 (= res!227646 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!396718 () Bool)

(declare-fun res!227649 () Bool)

(assert (=> b!396718 (=> (not res!227649) (not e!240019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!396718 (= res!227649 (validKeyInArray!0 k!794))))

(declare-fun b!396719 () Bool)

(declare-fun res!227642 () Bool)

(assert (=> b!396719 (=> (not res!227642) (not e!240019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!396719 (= res!227642 (validMask!0 mask!1025))))

(declare-fun res!227643 () Bool)

(assert (=> start!38452 (=> (not res!227643) (not e!240019))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38452 (= res!227643 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11629 _keys!709))))))

(assert (=> start!38452 e!240019))

(assert (=> start!38452 true))

(declare-fun e!240023 () Bool)

(declare-fun array_inv!8270 (array!23657) Bool)

(assert (=> start!38452 (and (array_inv!8270 _values!549) e!240023)))

(declare-fun array_inv!8271 (array!23655) Bool)

(assert (=> start!38452 (array_inv!8271 _keys!709)))

(declare-fun b!396720 () Bool)

(declare-fun e!240020 () Bool)

(assert (=> b!396720 (= e!240020 tp_is_empty!9871)))

(declare-fun b!396721 () Bool)

(assert (=> b!396721 (= e!240023 (and e!240020 mapRes!16428))))

(declare-fun condMapEmpty!16428 () Bool)

(declare-fun mapDefault!16428 () ValueCell!4592)

