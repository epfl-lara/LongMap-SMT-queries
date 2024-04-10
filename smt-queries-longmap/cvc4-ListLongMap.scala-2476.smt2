; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38678 () Bool)

(assert start!38678)

(declare-fun b_free!9215 () Bool)

(declare-fun b_next!9215 () Bool)

(assert (=> start!38678 (= b_free!9215 (not b_next!9215))))

(declare-fun tp!32769 () Bool)

(declare-fun b_and!16601 () Bool)

(assert (=> start!38678 (= tp!32769 b_and!16601)))

(declare-fun bm!28306 () Bool)

(declare-datatypes ((V!14567 0))(
  ( (V!14568 (val!5093 Int)) )
))
(declare-fun minValue!515 () V!14567)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!14567)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((tuple2!6762 0))(
  ( (tuple2!6763 (_1!3392 (_ BitVec 64)) (_2!3392 V!14567)) )
))
(declare-datatypes ((List!6686 0))(
  ( (Nil!6683) (Cons!6682 (h!7538 tuple2!6762) (t!11860 List!6686)) )
))
(declare-datatypes ((ListLongMap!5675 0))(
  ( (ListLongMap!5676 (toList!2853 List!6686)) )
))
(declare-fun call!28310 () ListLongMap!5675)

(declare-fun v!412 () V!14567)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24101 0))(
  ( (array!24102 (arr!11500 (Array (_ BitVec 32) (_ BitVec 64))) (size!11852 (_ BitVec 32))) )
))
(declare-fun lt!187871 () array!24101)

(declare-fun _keys!709 () array!24101)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4705 0))(
  ( (ValueCellFull!4705 (v!7340 V!14567)) (EmptyCell!4705) )
))
(declare-datatypes ((array!24103 0))(
  ( (array!24104 (arr!11501 (Array (_ BitVec 32) ValueCell!4705)) (size!11853 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24103)

(declare-fun c!54779 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1065 (array!24101 array!24103 (_ BitVec 32) (_ BitVec 32) V!14567 V!14567 (_ BitVec 32) Int) ListLongMap!5675)

(assert (=> bm!28306 (= call!28310 (getCurrentListMapNoExtraKeys!1065 (ite c!54779 _keys!709 lt!187871) (ite c!54779 _values!549 (array!24104 (store (arr!11501 _values!549) i!563 (ValueCellFull!4705 v!412)) (size!11853 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401941 () Bool)

(declare-fun res!231443 () Bool)

(declare-fun e!242262 () Bool)

(assert (=> b!401941 (=> (not res!231443) (not e!242262))))

(assert (=> b!401941 (= res!231443 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11852 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401942 () Bool)

(declare-fun res!231445 () Bool)

(declare-fun e!242259 () Bool)

(assert (=> b!401942 (=> (not res!231445) (not e!242259))))

(assert (=> b!401942 (= res!231445 (or (= (select (arr!11500 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11500 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401943 () Bool)

(declare-fun e!242260 () Bool)

(declare-fun call!28309 () ListLongMap!5675)

(assert (=> b!401943 (= e!242260 (= call!28310 call!28309))))

(declare-fun mapNonEmpty!16767 () Bool)

(declare-fun mapRes!16767 () Bool)

(declare-fun tp!32768 () Bool)

(declare-fun e!242263 () Bool)

(assert (=> mapNonEmpty!16767 (= mapRes!16767 (and tp!32768 e!242263))))

(declare-fun mapKey!16767 () (_ BitVec 32))

(declare-fun mapValue!16767 () ValueCell!4705)

(declare-fun mapRest!16767 () (Array (_ BitVec 32) ValueCell!4705))

(assert (=> mapNonEmpty!16767 (= (arr!11501 _values!549) (store mapRest!16767 mapKey!16767 mapValue!16767))))

(declare-fun b!401944 () Bool)

(declare-fun e!242261 () Bool)

(declare-fun e!242264 () Bool)

(assert (=> b!401944 (= e!242261 (and e!242264 mapRes!16767))))

(declare-fun condMapEmpty!16767 () Bool)

(declare-fun mapDefault!16767 () ValueCell!4705)

