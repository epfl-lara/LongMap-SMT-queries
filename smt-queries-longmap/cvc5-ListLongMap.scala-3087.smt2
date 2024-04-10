; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43462 () Bool)

(assert start!43462)

(declare-fun b_free!12241 () Bool)

(declare-fun b_next!12241 () Bool)

(assert (=> start!43462 (= b_free!12241 (not b_next!12241))))

(declare-fun tp!43005 () Bool)

(declare-fun b_and!21001 () Bool)

(assert (=> start!43462 (= tp!43005 b_and!21001)))

(declare-fun b!481450 () Bool)

(declare-fun res!287032 () Bool)

(declare-fun e!283280 () Bool)

(assert (=> b!481450 (=> (not res!287032) (not e!283280))))

(declare-fun k!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((V!19409 0))(
  ( (V!19410 (val!6924 Int)) )
))
(declare-fun minValue!1458 () V!19409)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19409)

(declare-datatypes ((ValueCell!6515 0))(
  ( (ValueCellFull!6515 (v!9217 V!19409)) (EmptyCell!6515) )
))
(declare-datatypes ((array!31169 0))(
  ( (array!31170 (arr!14987 (Array (_ BitVec 32) ValueCell!6515)) (size!15345 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31169)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31171 0))(
  ( (array!31172 (arr!14988 (Array (_ BitVec 32) (_ BitVec 64))) (size!15346 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31171)

(declare-datatypes ((tuple2!9086 0))(
  ( (tuple2!9087 (_1!4554 (_ BitVec 64)) (_2!4554 V!19409)) )
))
(declare-datatypes ((List!9164 0))(
  ( (Nil!9161) (Cons!9160 (h!10016 tuple2!9086) (t!15378 List!9164)) )
))
(declare-datatypes ((ListLongMap!7999 0))(
  ( (ListLongMap!8000 (toList!4015 List!9164)) )
))
(declare-fun contains!2629 (ListLongMap!7999 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2334 (array!31171 array!31169 (_ BitVec 32) (_ BitVec 32) V!19409 V!19409 (_ BitVec 32) Int) ListLongMap!7999)

(assert (=> b!481450 (= res!287032 (contains!2629 (getCurrentListMap!2334 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k!1332))))

(declare-fun b!481451 () Bool)

(declare-fun e!283279 () Bool)

(assert (=> b!481451 (= e!283279 (ite (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!481452 () Bool)

(declare-fun res!287035 () Bool)

(assert (=> b!481452 (=> (not res!287035) (not e!283280))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481452 (= res!287035 (validKeyInArray!0 k!1332))))

(declare-fun mapIsEmpty!22339 () Bool)

(declare-fun mapRes!22339 () Bool)

(assert (=> mapIsEmpty!22339 mapRes!22339))

(declare-fun b!481453 () Bool)

(declare-fun e!283276 () Bool)

(declare-fun tp_is_empty!13753 () Bool)

(assert (=> b!481453 (= e!283276 tp_is_empty!13753)))

(declare-fun b!481454 () Bool)

(assert (=> b!481454 (= e!283280 (not true))))

(declare-fun lt!218531 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31171 (_ BitVec 32)) Bool)

(assert (=> b!481454 (arrayForallSeekEntryOrOpenFound!0 lt!218531 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14122 0))(
  ( (Unit!14123) )
))
(declare-fun lt!218533 () Unit!14122)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31171 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14122)

(assert (=> b!481454 (= lt!218533 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218531))))

(declare-fun arrayScanForKey!0 (array!31171 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481454 (= lt!218531 (arrayScanForKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(assert (=> b!481454 e!283279))

(declare-fun c!57915 () Bool)

(assert (=> b!481454 (= c!57915 (and (not (= k!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218532 () Unit!14122)

(declare-fun lemmaKeyInListMapIsInArray!132 (array!31171 array!31169 (_ BitVec 32) (_ BitVec 32) V!19409 V!19409 (_ BitVec 64) Int) Unit!14122)

(assert (=> b!481454 (= lt!218532 (lemmaKeyInListMapIsInArray!132 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k!1332 defaultEntry!1519))))

(declare-fun mapNonEmpty!22339 () Bool)

(declare-fun tp!43006 () Bool)

(declare-fun e!283281 () Bool)

(assert (=> mapNonEmpty!22339 (= mapRes!22339 (and tp!43006 e!283281))))

(declare-fun mapKey!22339 () (_ BitVec 32))

(declare-fun mapValue!22339 () ValueCell!6515)

(declare-fun mapRest!22339 () (Array (_ BitVec 32) ValueCell!6515))

(assert (=> mapNonEmpty!22339 (= (arr!14987 _values!1516) (store mapRest!22339 mapKey!22339 mapValue!22339))))

(declare-fun b!481455 () Bool)

(declare-fun arrayContainsKey!0 (array!31171 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481455 (= e!283279 (arrayContainsKey!0 _keys!1874 k!1332 #b00000000000000000000000000000000))))

(declare-fun res!287034 () Bool)

(assert (=> start!43462 (=> (not res!287034) (not e!283280))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43462 (= res!287034 (validMask!0 mask!2352))))

(assert (=> start!43462 e!283280))

(assert (=> start!43462 true))

(assert (=> start!43462 tp_is_empty!13753))

(declare-fun e!283277 () Bool)

(declare-fun array_inv!10810 (array!31169) Bool)

(assert (=> start!43462 (and (array_inv!10810 _values!1516) e!283277)))

(assert (=> start!43462 tp!43005))

(declare-fun array_inv!10811 (array!31171) Bool)

(assert (=> start!43462 (array_inv!10811 _keys!1874)))

(declare-fun b!481456 () Bool)

(declare-fun res!287031 () Bool)

(assert (=> b!481456 (=> (not res!287031) (not e!283280))))

(declare-datatypes ((List!9165 0))(
  ( (Nil!9162) (Cons!9161 (h!10017 (_ BitVec 64)) (t!15379 List!9165)) )
))
(declare-fun arrayNoDuplicates!0 (array!31171 (_ BitVec 32) List!9165) Bool)

(assert (=> b!481456 (= res!287031 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9162))))

(declare-fun b!481457 () Bool)

(declare-fun res!287033 () Bool)

(assert (=> b!481457 (=> (not res!287033) (not e!283280))))

(assert (=> b!481457 (= res!287033 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481458 () Bool)

(declare-fun res!287030 () Bool)

(assert (=> b!481458 (=> (not res!287030) (not e!283280))))

(assert (=> b!481458 (= res!287030 (and (= (size!15345 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15346 _keys!1874) (size!15345 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481459 () Bool)

(assert (=> b!481459 (= e!283281 tp_is_empty!13753)))

(declare-fun b!481460 () Bool)

(assert (=> b!481460 (= e!283277 (and e!283276 mapRes!22339))))

(declare-fun condMapEmpty!22339 () Bool)

(declare-fun mapDefault!22339 () ValueCell!6515)

