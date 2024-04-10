; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38504 () Bool)

(assert start!38504)

(declare-fun mapNonEmpty!16506 () Bool)

(declare-fun mapRes!16506 () Bool)

(declare-fun tp!32301 () Bool)

(declare-fun e!240489 () Bool)

(assert (=> mapNonEmpty!16506 (= mapRes!16506 (and tp!32301 e!240489))))

(declare-datatypes ((V!14335 0))(
  ( (V!14336 (val!5006 Int)) )
))
(declare-datatypes ((ValueCell!4618 0))(
  ( (ValueCellFull!4618 (v!7253 V!14335)) (EmptyCell!4618) )
))
(declare-fun mapValue!16506 () ValueCell!4618)

(declare-datatypes ((array!23759 0))(
  ( (array!23760 (arr!11329 (Array (_ BitVec 32) ValueCell!4618)) (size!11681 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23759)

(declare-fun mapKey!16506 () (_ BitVec 32))

(declare-fun mapRest!16506 () (Array (_ BitVec 32) ValueCell!4618))

(assert (=> mapNonEmpty!16506 (= (arr!11329 _values!549) (store mapRest!16506 mapKey!16506 mapValue!16506))))

(declare-fun res!228427 () Bool)

(declare-fun e!240487 () Bool)

(assert (=> start!38504 (=> (not res!228427) (not e!240487))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!23761 0))(
  ( (array!23762 (arr!11330 (Array (_ BitVec 32) (_ BitVec 64))) (size!11682 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23761)

(assert (=> start!38504 (= res!228427 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11682 _keys!709))))))

(assert (=> start!38504 e!240487))

(assert (=> start!38504 true))

(declare-fun e!240492 () Bool)

(declare-fun array_inv!8302 (array!23759) Bool)

(assert (=> start!38504 (and (array_inv!8302 _values!549) e!240492)))

(declare-fun array_inv!8303 (array!23761) Bool)

(assert (=> start!38504 (array_inv!8303 _keys!709)))

(declare-fun b!397724 () Bool)

(declare-fun res!228426 () Bool)

(assert (=> b!397724 (=> (not res!228426) (not e!240487))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!397724 (= res!228426 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11682 _keys!709))))))

(declare-fun b!397725 () Bool)

(declare-fun e!240490 () Bool)

(assert (=> b!397725 (= e!240487 e!240490)))

(declare-fun res!228420 () Bool)

(assert (=> b!397725 (=> (not res!228420) (not e!240490))))

(declare-fun lt!187349 () array!23761)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23761 (_ BitVec 32)) Bool)

(assert (=> b!397725 (= res!228420 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187349 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(assert (=> b!397725 (= lt!187349 (array!23762 (store (arr!11330 _keys!709) i!563 k!794) (size!11682 _keys!709)))))

(declare-fun b!397726 () Bool)

(declare-fun res!228429 () Bool)

(assert (=> b!397726 (=> (not res!228429) (not e!240487))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!397726 (= res!228429 (and (= (size!11681 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11682 _keys!709) (size!11681 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!397727 () Bool)

(declare-fun res!228424 () Bool)

(assert (=> b!397727 (=> (not res!228424) (not e!240487))))

(assert (=> b!397727 (= res!228424 (or (= (select (arr!11330 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11330 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!397728 () Bool)

(declare-fun res!228423 () Bool)

(assert (=> b!397728 (=> (not res!228423) (not e!240487))))

(declare-datatypes ((List!6556 0))(
  ( (Nil!6553) (Cons!6552 (h!7408 (_ BitVec 64)) (t!11730 List!6556)) )
))
(declare-fun arrayNoDuplicates!0 (array!23761 (_ BitVec 32) List!6556) Bool)

(assert (=> b!397728 (= res!228423 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6553))))

(declare-fun b!397729 () Bool)

(declare-fun res!228421 () Bool)

(assert (=> b!397729 (=> (not res!228421) (not e!240487))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!397729 (= res!228421 (validKeyInArray!0 k!794))))

(declare-fun b!397730 () Bool)

(declare-fun e!240488 () Bool)

(assert (=> b!397730 (= e!240492 (and e!240488 mapRes!16506))))

(declare-fun condMapEmpty!16506 () Bool)

(declare-fun mapDefault!16506 () ValueCell!4618)

