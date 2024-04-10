; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38662 () Bool)

(assert start!38662)

(declare-fun b_free!9199 () Bool)

(declare-fun b_next!9199 () Bool)

(assert (=> start!38662 (= b_free!9199 (not b_next!9199))))

(declare-fun tp!32720 () Bool)

(declare-fun b_and!16585 () Bool)

(assert (=> start!38662 (= tp!32720 b_and!16585)))

(declare-fun b!401533 () Bool)

(declare-fun res!231162 () Bool)

(declare-fun e!242095 () Bool)

(assert (=> b!401533 (=> (not res!231162) (not e!242095))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24069 0))(
  ( (array!24070 (arr!11484 (Array (_ BitVec 32) (_ BitVec 64))) (size!11836 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24069)

(assert (=> b!401533 (= res!231162 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11836 _keys!709))))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14547 0))(
  ( (V!14548 (val!5085 Int)) )
))
(declare-datatypes ((ValueCell!4697 0))(
  ( (ValueCellFull!4697 (v!7332 V!14547)) (EmptyCell!4697) )
))
(declare-datatypes ((array!24071 0))(
  ( (array!24072 (arr!11485 (Array (_ BitVec 32) ValueCell!4697)) (size!11837 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24071)

(declare-fun zeroValue!515 () V!14547)

(declare-datatypes ((tuple2!6748 0))(
  ( (tuple2!6749 (_1!3385 (_ BitVec 64)) (_2!3385 V!14547)) )
))
(declare-datatypes ((List!6672 0))(
  ( (Nil!6669) (Cons!6668 (h!7524 tuple2!6748) (t!11846 List!6672)) )
))
(declare-datatypes ((ListLongMap!5661 0))(
  ( (ListLongMap!5662 (toList!2846 List!6672)) )
))
(declare-fun call!28262 () ListLongMap!5661)

(declare-fun bm!28258 () Bool)

(declare-fun lt!187822 () array!24069)

(declare-fun v!412 () V!14547)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun c!54755 () Bool)

(declare-fun minValue!515 () V!14547)

(declare-fun getCurrentListMapNoExtraKeys!1058 (array!24069 array!24071 (_ BitVec 32) (_ BitVec 32) V!14547 V!14547 (_ BitVec 32) Int) ListLongMap!5661)

(assert (=> bm!28258 (= call!28262 (getCurrentListMapNoExtraKeys!1058 (ite c!54755 lt!187822 _keys!709) (ite c!54755 (array!24072 (store (arr!11485 _values!549) i!563 (ValueCellFull!4697 v!412)) (size!11837 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401534 () Bool)

(declare-fun res!231160 () Bool)

(declare-fun e!242092 () Bool)

(assert (=> b!401534 (=> (not res!231160) (not e!242092))))

(declare-datatypes ((List!6673 0))(
  ( (Nil!6670) (Cons!6669 (h!7525 (_ BitVec 64)) (t!11847 List!6673)) )
))
(declare-fun arrayNoDuplicates!0 (array!24069 (_ BitVec 32) List!6673) Bool)

(assert (=> b!401534 (= res!231160 (arrayNoDuplicates!0 lt!187822 #b00000000000000000000000000000000 Nil!6670))))

(declare-fun b!401535 () Bool)

(declare-fun res!231159 () Bool)

(assert (=> b!401535 (=> (not res!231159) (not e!242092))))

(assert (=> b!401535 (= res!231159 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11836 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401536 () Bool)

(declare-fun e!242096 () Bool)

(declare-fun tp_is_empty!10081 () Bool)

(assert (=> b!401536 (= e!242096 tp_is_empty!10081)))

(declare-fun b!401537 () Bool)

(declare-fun res!231156 () Bool)

(assert (=> b!401537 (=> (not res!231156) (not e!242095))))

(assert (=> b!401537 (= res!231156 (and (= (size!11837 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11836 _keys!709) (size!11837 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!231163 () Bool)

(assert (=> start!38662 (=> (not res!231163) (not e!242095))))

(assert (=> start!38662 (= res!231163 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11836 _keys!709))))))

(assert (=> start!38662 e!242095))

(assert (=> start!38662 tp_is_empty!10081))

(assert (=> start!38662 tp!32720))

(assert (=> start!38662 true))

(declare-fun e!242094 () Bool)

(declare-fun array_inv!8406 (array!24071) Bool)

(assert (=> start!38662 (and (array_inv!8406 _values!549) e!242094)))

(declare-fun array_inv!8407 (array!24069) Bool)

(assert (=> start!38662 (array_inv!8407 _keys!709)))

(declare-fun b!401538 () Bool)

(declare-fun res!231155 () Bool)

(assert (=> b!401538 (=> (not res!231155) (not e!242095))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401538 (= res!231155 (validKeyInArray!0 k!794))))

(declare-fun b!401539 () Bool)

(assert (=> b!401539 (= e!242095 e!242092)))

(declare-fun res!231158 () Bool)

(assert (=> b!401539 (=> (not res!231158) (not e!242092))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24069 (_ BitVec 32)) Bool)

(assert (=> b!401539 (= res!231158 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187822 mask!1025))))

(assert (=> b!401539 (= lt!187822 (array!24070 (store (arr!11484 _keys!709) i!563 k!794) (size!11836 _keys!709)))))

(declare-fun mapIsEmpty!16743 () Bool)

(declare-fun mapRes!16743 () Bool)

(assert (=> mapIsEmpty!16743 mapRes!16743))

(declare-fun bm!28259 () Bool)

(declare-fun call!28261 () ListLongMap!5661)

(assert (=> bm!28259 (= call!28261 (getCurrentListMapNoExtraKeys!1058 (ite c!54755 _keys!709 lt!187822) (ite c!54755 _values!549 (array!24072 (store (arr!11485 _values!549) i!563 (ValueCellFull!4697 v!412)) (size!11837 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401540 () Bool)

(declare-fun res!231165 () Bool)

(assert (=> b!401540 (=> (not res!231165) (not e!242095))))

(assert (=> b!401540 (= res!231165 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16743 () Bool)

(declare-fun tp!32721 () Bool)

(assert (=> mapNonEmpty!16743 (= mapRes!16743 (and tp!32721 e!242096))))

(declare-fun mapValue!16743 () ValueCell!4697)

(declare-fun mapRest!16743 () (Array (_ BitVec 32) ValueCell!4697))

(declare-fun mapKey!16743 () (_ BitVec 32))

(assert (=> mapNonEmpty!16743 (= (arr!11485 _values!549) (store mapRest!16743 mapKey!16743 mapValue!16743))))

(declare-fun b!401541 () Bool)

(declare-fun e!242097 () Bool)

(assert (=> b!401541 (= e!242094 (and e!242097 mapRes!16743))))

(declare-fun condMapEmpty!16743 () Bool)

(declare-fun mapDefault!16743 () ValueCell!4697)

