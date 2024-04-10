; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38596 () Bool)

(assert start!38596)

(declare-fun b_free!9133 () Bool)

(declare-fun b_next!9133 () Bool)

(assert (=> start!38596 (= b_free!9133 (not b_next!9133))))

(declare-fun tp!32523 () Bool)

(declare-fun b_and!16519 () Bool)

(assert (=> start!38596 (= tp!32523 b_and!16519)))

(declare-fun b!399850 () Bool)

(declare-fun e!241398 () Bool)

(assert (=> b!399850 (= e!241398 (not true))))

(declare-fun e!241404 () Bool)

(assert (=> b!399850 e!241404))

(declare-fun c!54656 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!399850 (= c!54656 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12120 0))(
  ( (Unit!12121) )
))
(declare-fun lt!187624 () Unit!12120)

(declare-datatypes ((V!14459 0))(
  ( (V!14460 (val!5052 Int)) )
))
(declare-fun minValue!515 () V!14459)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4664 0))(
  ( (ValueCellFull!4664 (v!7299 V!14459)) (EmptyCell!4664) )
))
(declare-datatypes ((array!23941 0))(
  ( (array!23942 (arr!11420 (Array (_ BitVec 32) ValueCell!4664)) (size!11772 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23941)

(declare-fun zeroValue!515 () V!14459)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun v!412 () V!14459)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!23943 0))(
  ( (array!23944 (arr!11421 (Array (_ BitVec 32) (_ BitVec 64))) (size!11773 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23943)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!318 (array!23943 array!23941 (_ BitVec 32) (_ BitVec 32) V!14459 V!14459 (_ BitVec 32) (_ BitVec 64) V!14459 (_ BitVec 32) Int) Unit!12120)

(assert (=> b!399850 (= lt!187624 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!318 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399851 () Bool)

(declare-fun e!241403 () Bool)

(assert (=> b!399851 (= e!241403 e!241398)))

(declare-fun res!229969 () Bool)

(assert (=> b!399851 (=> (not res!229969) (not e!241398))))

(declare-fun lt!187625 () array!23943)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23943 (_ BitVec 32)) Bool)

(assert (=> b!399851 (= res!229969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187625 mask!1025))))

(assert (=> b!399851 (= lt!187625 (array!23944 (store (arr!11421 _keys!709) i!563 k!794) (size!11773 _keys!709)))))

(declare-fun mapNonEmpty!16644 () Bool)

(declare-fun mapRes!16644 () Bool)

(declare-fun tp!32522 () Bool)

(declare-fun e!241402 () Bool)

(assert (=> mapNonEmpty!16644 (= mapRes!16644 (and tp!32522 e!241402))))

(declare-fun mapKey!16644 () (_ BitVec 32))

(declare-fun mapRest!16644 () (Array (_ BitVec 32) ValueCell!4664))

(declare-fun mapValue!16644 () ValueCell!4664)

(assert (=> mapNonEmpty!16644 (= (arr!11420 _values!549) (store mapRest!16644 mapKey!16644 mapValue!16644))))

(declare-fun mapIsEmpty!16644 () Bool)

(assert (=> mapIsEmpty!16644 mapRes!16644))

(declare-fun b!399852 () Bool)

(declare-fun res!229970 () Bool)

(assert (=> b!399852 (=> (not res!229970) (not e!241403))))

(declare-fun arrayContainsKey!0 (array!23943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!399852 (= res!229970 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!399853 () Bool)

(declare-fun e!241399 () Bool)

(declare-fun tp_is_empty!10015 () Bool)

(assert (=> b!399853 (= e!241399 tp_is_empty!10015)))

(declare-fun bm!28060 () Bool)

(declare-datatypes ((tuple2!6692 0))(
  ( (tuple2!6693 (_1!3357 (_ BitVec 64)) (_2!3357 V!14459)) )
))
(declare-datatypes ((List!6618 0))(
  ( (Nil!6615) (Cons!6614 (h!7470 tuple2!6692) (t!11792 List!6618)) )
))
(declare-datatypes ((ListLongMap!5605 0))(
  ( (ListLongMap!5606 (toList!2818 List!6618)) )
))
(declare-fun call!28063 () ListLongMap!5605)

(declare-fun getCurrentListMapNoExtraKeys!1035 (array!23943 array!23941 (_ BitVec 32) (_ BitVec 32) V!14459 V!14459 (_ BitVec 32) Int) ListLongMap!5605)

(assert (=> bm!28060 (= call!28063 (getCurrentListMapNoExtraKeys!1035 (ite c!54656 _keys!709 lt!187625) (ite c!54656 _values!549 (array!23942 (store (arr!11420 _values!549) i!563 (ValueCellFull!4664 v!412)) (size!11772 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!399854 () Bool)

(declare-fun res!229967 () Bool)

(assert (=> b!399854 (=> (not res!229967) (not e!241403))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!399854 (= res!229967 (validKeyInArray!0 k!794))))

(declare-fun b!399855 () Bool)

(declare-fun res!229972 () Bool)

(assert (=> b!399855 (=> (not res!229972) (not e!241403))))

(assert (=> b!399855 (= res!229972 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11773 _keys!709))))))

(declare-fun b!399856 () Bool)

(declare-fun res!229966 () Bool)

(assert (=> b!399856 (=> (not res!229966) (not e!241403))))

(assert (=> b!399856 (= res!229966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun call!28064 () ListLongMap!5605)

(declare-fun b!399857 () Bool)

(declare-fun +!1106 (ListLongMap!5605 tuple2!6692) ListLongMap!5605)

(assert (=> b!399857 (= e!241404 (= call!28064 (+!1106 call!28063 (tuple2!6693 k!794 v!412))))))

(declare-fun b!399858 () Bool)

(declare-fun e!241401 () Bool)

(assert (=> b!399858 (= e!241401 (and e!241399 mapRes!16644))))

(declare-fun condMapEmpty!16644 () Bool)

(declare-fun mapDefault!16644 () ValueCell!4664)

