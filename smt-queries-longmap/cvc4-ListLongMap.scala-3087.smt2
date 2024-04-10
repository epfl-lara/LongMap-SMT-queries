; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43466 () Bool)

(assert start!43466)

(declare-fun b_free!12245 () Bool)

(declare-fun b_next!12245 () Bool)

(assert (=> start!43466 (= b_free!12245 (not b_next!12245))))

(declare-fun tp!43018 () Bool)

(declare-fun b_and!21005 () Bool)

(assert (=> start!43466 (= tp!43018 b_and!21005)))

(declare-fun b!481516 () Bool)

(declare-fun e!283316 () Bool)

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!481516 (= e!283316 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481517 () Bool)

(declare-fun e!283315 () Bool)

(declare-fun tp_is_empty!13757 () Bool)

(assert (=> b!481517 (= e!283315 tp_is_empty!13757)))

(declare-fun mapNonEmpty!22345 () Bool)

(declare-fun mapRes!22345 () Bool)

(declare-fun tp!43017 () Bool)

(declare-fun e!283313 () Bool)

(assert (=> mapNonEmpty!22345 (= mapRes!22345 (and tp!43017 e!283313))))

(declare-datatypes ((V!19413 0))(
  ( (V!19414 (val!6926 Int)) )
))
(declare-datatypes ((ValueCell!6517 0))(
  ( (ValueCellFull!6517 (v!9219 V!19413)) (EmptyCell!6517) )
))
(declare-fun mapValue!22345 () ValueCell!6517)

(declare-datatypes ((array!31177 0))(
  ( (array!31178 (arr!14991 (Array (_ BitVec 32) ValueCell!6517)) (size!15349 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31177)

(declare-fun mapRest!22345 () (Array (_ BitVec 32) ValueCell!6517))

(declare-fun mapKey!22345 () (_ BitVec 32))

(assert (=> mapNonEmpty!22345 (= (arr!14991 _values!1516) (store mapRest!22345 mapKey!22345 mapValue!22345))))

(declare-fun mapIsEmpty!22345 () Bool)

(assert (=> mapIsEmpty!22345 mapRes!22345))

(declare-fun b!481519 () Bool)

(assert (=> b!481519 (= e!283313 tp_is_empty!13757)))

(declare-fun b!481520 () Bool)

(declare-fun e!283317 () Bool)

(assert (=> b!481520 (= e!283317 (not true))))

(declare-fun lt!218550 () (_ BitVec 32))

(declare-datatypes ((array!31179 0))(
  ( (array!31180 (arr!14992 (Array (_ BitVec 32) (_ BitVec 64))) (size!15350 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31179)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31179 (_ BitVec 32)) Bool)

(assert (=> b!481520 (arrayForallSeekEntryOrOpenFound!0 lt!218550 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14126 0))(
  ( (Unit!14127) )
))
(declare-fun lt!218551 () Unit!14126)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31179 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14126)

(assert (=> b!481520 (= lt!218551 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218550))))

(declare-fun arrayScanForKey!0 (array!31179 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481520 (= lt!218550 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(assert (=> b!481520 e!283316))

(declare-fun c!57921 () Bool)

(assert (=> b!481520 (= c!57921 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19413)

(declare-fun lt!218549 () Unit!14126)

(declare-fun zeroValue!1458 () V!19413)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!134 (array!31179 array!31177 (_ BitVec 32) (_ BitVec 32) V!19413 V!19413 (_ BitVec 64) Int) Unit!14126)

(assert (=> b!481520 (= lt!218549 (lemmaKeyInListMapIsInArray!134 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!481521 () Bool)

(declare-fun res!287066 () Bool)

(assert (=> b!481521 (=> (not res!287066) (not e!283317))))

(assert (=> b!481521 (= res!287066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481522 () Bool)

(declare-fun res!287069 () Bool)

(assert (=> b!481522 (=> (not res!287069) (not e!283317))))

(declare-datatypes ((tuple2!9090 0))(
  ( (tuple2!9091 (_1!4556 (_ BitVec 64)) (_2!4556 V!19413)) )
))
(declare-datatypes ((List!9168 0))(
  ( (Nil!9165) (Cons!9164 (h!10020 tuple2!9090) (t!15382 List!9168)) )
))
(declare-datatypes ((ListLongMap!8003 0))(
  ( (ListLongMap!8004 (toList!4017 List!9168)) )
))
(declare-fun contains!2631 (ListLongMap!8003 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2336 (array!31179 array!31177 (_ BitVec 32) (_ BitVec 32) V!19413 V!19413 (_ BitVec 32) Int) ListLongMap!8003)

(assert (=> b!481522 (= res!287069 (contains!2631 (getCurrentListMap!2336 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!481518 () Bool)

(declare-fun e!283314 () Bool)

(assert (=> b!481518 (= e!283314 (and e!283315 mapRes!22345))))

(declare-fun condMapEmpty!22345 () Bool)

(declare-fun mapDefault!22345 () ValueCell!6517)

