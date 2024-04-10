; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43540 () Bool)

(assert start!43540)

(declare-fun b_free!12319 () Bool)

(declare-fun b_next!12319 () Bool)

(assert (=> start!43540 (= b_free!12319 (not b_next!12319))))

(declare-fun tp!43239 () Bool)

(declare-fun b_and!21079 () Bool)

(assert (=> start!43540 (= tp!43239 b_and!21079)))

(declare-fun b!482413 () Bool)

(declare-fun res!287572 () Bool)

(declare-fun e!283901 () Bool)

(assert (=> b!482413 (=> (not res!287572) (not e!283901))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19513 0))(
  ( (V!19514 (val!6963 Int)) )
))
(declare-fun minValue!1458 () V!19513)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19513)

(declare-datatypes ((ValueCell!6554 0))(
  ( (ValueCellFull!6554 (v!9256 V!19513)) (EmptyCell!6554) )
))
(declare-datatypes ((array!31319 0))(
  ( (array!31320 (arr!15062 (Array (_ BitVec 32) ValueCell!6554)) (size!15420 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31319)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31321 0))(
  ( (array!31322 (arr!15063 (Array (_ BitVec 32) (_ BitVec 64))) (size!15421 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31321)

(declare-datatypes ((tuple2!9140 0))(
  ( (tuple2!9141 (_1!4581 (_ BitVec 64)) (_2!4581 V!19513)) )
))
(declare-datatypes ((List!9219 0))(
  ( (Nil!9216) (Cons!9215 (h!10071 tuple2!9140) (t!15433 List!9219)) )
))
(declare-datatypes ((ListLongMap!8053 0))(
  ( (ListLongMap!8054 (toList!4042 List!9219)) )
))
(declare-fun contains!2656 (ListLongMap!8053 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2361 (array!31321 array!31319 (_ BitVec 32) (_ BitVec 32) V!19513 V!19513 (_ BitVec 32) Int) ListLongMap!8053)

(assert (=> b!482413 (= res!287572 (contains!2656 (getCurrentListMap!2361 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun mapNonEmpty!22456 () Bool)

(declare-fun mapRes!22456 () Bool)

(declare-fun tp!43240 () Bool)

(declare-fun e!283900 () Bool)

(assert (=> mapNonEmpty!22456 (= mapRes!22456 (and tp!43240 e!283900))))

(declare-fun mapKey!22456 () (_ BitVec 32))

(declare-fun mapValue!22456 () ValueCell!6554)

(declare-fun mapRest!22456 () (Array (_ BitVec 32) ValueCell!6554))

(assert (=> mapNonEmpty!22456 (= (arr!15062 _values!1516) (store mapRest!22456 mapKey!22456 mapValue!22456))))

(declare-fun b!482414 () Bool)

(declare-fun e!283899 () Bool)

(assert (=> b!482414 (= e!283899 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!482415 () Bool)

(declare-fun tp_is_empty!13831 () Bool)

(assert (=> b!482415 (= e!283900 tp_is_empty!13831)))

(declare-fun b!482416 () Bool)

(declare-fun res!287575 () Bool)

(assert (=> b!482416 (=> (not res!287575) (not e!283901))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482416 (= res!287575 (validKeyInArray!0 k!1332))))

(declare-fun b!482417 () Bool)

(declare-fun res!287571 () Bool)

(assert (=> b!482417 (=> (not res!287571) (not e!283901))))

(declare-datatypes ((List!9220 0))(
  ( (Nil!9217) (Cons!9216 (h!10072 (_ BitVec 64)) (t!15434 List!9220)) )
))
(declare-fun arrayNoDuplicates!0 (array!31321 (_ BitVec 32) List!9220) Bool)

(assert (=> b!482417 (= res!287571 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9217))))

(declare-fun b!482418 () Bool)

(declare-fun arrayContainsKey!0 (array!31321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482418 (= e!283899 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!482419 () Bool)

(declare-fun res!287574 () Bool)

(assert (=> b!482419 (=> (not res!287574) (not e!283901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31321 (_ BitVec 32)) Bool)

(assert (=> b!482419 (= res!287574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482420 () Bool)

(assert (=> b!482420 (= e!283901 (not true))))

(declare-fun lt!218719 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31321 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482420 (= lt!218719 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(assert (=> b!482420 e!283899))

(declare-fun c!57951 () Bool)

(assert (=> b!482420 (= c!57951 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14140 0))(
  ( (Unit!14141) )
))
(declare-fun lt!218718 () Unit!14140)

(declare-fun lemmaKeyInListMapIsInArray!141 (array!31321 array!31319 (_ BitVec 32) (_ BitVec 32) V!19513 V!19513 (_ BitVec 64) Int) Unit!14140)

(assert (=> b!482420 (= lt!218718 (lemmaKeyInListMapIsInArray!141 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!482421 () Bool)

(declare-fun e!283902 () Bool)

(assert (=> b!482421 (= e!283902 tp_is_empty!13831)))

(declare-fun b!482422 () Bool)

(declare-fun e!283898 () Bool)

(assert (=> b!482422 (= e!283898 (and e!283902 mapRes!22456))))

(declare-fun condMapEmpty!22456 () Bool)

(declare-fun mapDefault!22456 () ValueCell!6554)

