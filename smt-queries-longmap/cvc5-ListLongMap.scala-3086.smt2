; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43456 () Bool)

(assert start!43456)

(declare-fun b_free!12235 () Bool)

(declare-fun b_next!12235 () Bool)

(assert (=> start!43456 (= b_free!12235 (not b_next!12235))))

(declare-fun tp!42988 () Bool)

(declare-fun b_and!20995 () Bool)

(assert (=> start!43456 (= tp!42988 b_and!20995)))

(declare-fun b!481351 () Bool)

(declare-fun res!286979 () Bool)

(declare-fun e!283224 () Bool)

(assert (=> b!481351 (=> (not res!286979) (not e!283224))))

(declare-datatypes ((array!31157 0))(
  ( (array!31158 (arr!14981 (Array (_ BitVec 32) (_ BitVec 64))) (size!15339 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31157)

(declare-datatypes ((List!9158 0))(
  ( (Nil!9155) (Cons!9154 (h!10010 (_ BitVec 64)) (t!15372 List!9158)) )
))
(declare-fun arrayNoDuplicates!0 (array!31157 (_ BitVec 32) List!9158) Bool)

(assert (=> b!481351 (= res!286979 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9155))))

(declare-fun b!481352 () Bool)

(declare-fun res!286976 () Bool)

(assert (=> b!481352 (=> (not res!286976) (not e!283224))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-datatypes ((V!19401 0))(
  ( (V!19402 (val!6921 Int)) )
))
(declare-datatypes ((ValueCell!6512 0))(
  ( (ValueCellFull!6512 (v!9214 V!19401)) (EmptyCell!6512) )
))
(declare-datatypes ((array!31159 0))(
  ( (array!31160 (arr!14982 (Array (_ BitVec 32) ValueCell!6512)) (size!15340 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31159)

(assert (=> b!481352 (= res!286976 (and (= (size!15340 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15339 _keys!1874) (size!15340 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!286981 () Bool)

(assert (=> start!43456 (=> (not res!286981) (not e!283224))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43456 (= res!286981 (validMask!0 mask!2352))))

(assert (=> start!43456 e!283224))

(assert (=> start!43456 true))

(declare-fun tp_is_empty!13747 () Bool)

(assert (=> start!43456 tp_is_empty!13747))

(declare-fun e!283223 () Bool)

(declare-fun array_inv!10804 (array!31159) Bool)

(assert (=> start!43456 (and (array_inv!10804 _values!1516) e!283223)))

(assert (=> start!43456 tp!42988))

(declare-fun array_inv!10805 (array!31157) Bool)

(assert (=> start!43456 (array_inv!10805 _keys!1874)))

(declare-fun b!481353 () Bool)

(declare-fun e!283222 () Bool)

(assert (=> b!481353 (= e!283222 tp_is_empty!13747)))

(declare-fun b!481354 () Bool)

(declare-fun e!283225 () Bool)

(assert (=> b!481354 (= e!283225 tp_is_empty!13747)))

(declare-fun mapNonEmpty!22330 () Bool)

(declare-fun mapRes!22330 () Bool)

(declare-fun tp!42987 () Bool)

(assert (=> mapNonEmpty!22330 (= mapRes!22330 (and tp!42987 e!283222))))

(declare-fun mapRest!22330 () (Array (_ BitVec 32) ValueCell!6512))

(declare-fun mapKey!22330 () (_ BitVec 32))

(declare-fun mapValue!22330 () ValueCell!6512)

(assert (=> mapNonEmpty!22330 (= (arr!14982 _values!1516) (store mapRest!22330 mapKey!22330 mapValue!22330))))

(declare-fun b!481355 () Bool)

(declare-fun res!286980 () Bool)

(assert (=> b!481355 (=> (not res!286980) (not e!283224))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun minValue!1458 () V!19401)

(declare-fun zeroValue!1458 () V!19401)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9080 0))(
  ( (tuple2!9081 (_1!4551 (_ BitVec 64)) (_2!4551 V!19401)) )
))
(declare-datatypes ((List!9159 0))(
  ( (Nil!9156) (Cons!9155 (h!10011 tuple2!9080) (t!15373 List!9159)) )
))
(declare-datatypes ((ListLongMap!7993 0))(
  ( (ListLongMap!7994 (toList!4012 List!9159)) )
))
(declare-fun contains!2626 (ListLongMap!7993 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2331 (array!31157 array!31159 (_ BitVec 32) (_ BitVec 32) V!19401 V!19401 (_ BitVec 32) Int) ListLongMap!7993)

(assert (=> b!481355 (= res!286980 (contains!2626 (getCurrentListMap!2331 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!481356 () Bool)

(declare-fun res!286978 () Bool)

(assert (=> b!481356 (=> (not res!286978) (not e!283224))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31157 (_ BitVec 32)) Bool)

(assert (=> b!481356 (= res!286978 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapIsEmpty!22330 () Bool)

(assert (=> mapIsEmpty!22330 mapRes!22330))

(declare-fun b!481357 () Bool)

(assert (=> b!481357 (= e!283224 (not true))))

(declare-fun lt!218505 () (_ BitVec 32))

(assert (=> b!481357 (arrayForallSeekEntryOrOpenFound!0 lt!218505 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14116 0))(
  ( (Unit!14117) )
))
(declare-fun lt!218504 () Unit!14116)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31157 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14116)

(assert (=> b!481357 (= lt!218504 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218505))))

(declare-fun arrayScanForKey!0 (array!31157 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481357 (= lt!218505 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun e!283226 () Bool)

(assert (=> b!481357 e!283226))

(declare-fun c!57906 () Bool)

(assert (=> b!481357 (= c!57906 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218506 () Unit!14116)

(declare-fun lemmaKeyInListMapIsInArray!129 (array!31157 array!31159 (_ BitVec 32) (_ BitVec 32) V!19401 V!19401 (_ BitVec 64) Int) Unit!14116)

(assert (=> b!481357 (= lt!218506 (lemmaKeyInListMapIsInArray!129 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun b!481358 () Bool)

(assert (=> b!481358 (= e!283226 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481359 () Bool)

(declare-fun res!286977 () Bool)

(assert (=> b!481359 (=> (not res!286977) (not e!283224))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481359 (= res!286977 (validKeyInArray!0 k!1332))))

(declare-fun b!481360 () Bool)

(declare-fun arrayContainsKey!0 (array!31157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481360 (= e!283226 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun b!481361 () Bool)

(assert (=> b!481361 (= e!283223 (and e!283225 mapRes!22330))))

(declare-fun condMapEmpty!22330 () Bool)

(declare-fun mapDefault!22330 () ValueCell!6512)

