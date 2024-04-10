; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43464 () Bool)

(assert start!43464)

(declare-fun b_free!12243 () Bool)

(declare-fun b_next!12243 () Bool)

(assert (=> start!43464 (= b_free!12243 (not b_next!12243))))

(declare-fun tp!43012 () Bool)

(declare-fun b_and!21003 () Bool)

(assert (=> start!43464 (= tp!43012 b_and!21003)))

(declare-fun b!481483 () Bool)

(declare-fun e!283298 () Bool)

(declare-fun tp_is_empty!13755 () Bool)

(assert (=> b!481483 (= e!283298 tp_is_empty!13755)))

(declare-fun mapNonEmpty!22342 () Bool)

(declare-fun mapRes!22342 () Bool)

(declare-fun tp!43011 () Bool)

(declare-fun e!283294 () Bool)

(assert (=> mapNonEmpty!22342 (= mapRes!22342 (and tp!43011 e!283294))))

(declare-fun mapKey!22342 () (_ BitVec 32))

(declare-datatypes ((V!19411 0))(
  ( (V!19412 (val!6925 Int)) )
))
(declare-datatypes ((ValueCell!6516 0))(
  ( (ValueCellFull!6516 (v!9218 V!19411)) (EmptyCell!6516) )
))
(declare-fun mapRest!22342 () (Array (_ BitVec 32) ValueCell!6516))

(declare-datatypes ((array!31173 0))(
  ( (array!31174 (arr!14989 (Array (_ BitVec 32) ValueCell!6516)) (size!15347 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31173)

(declare-fun mapValue!22342 () ValueCell!6516)

(assert (=> mapNonEmpty!22342 (= (arr!14989 _values!1516) (store mapRest!22342 mapKey!22342 mapValue!22342))))

(declare-fun b!481484 () Bool)

(declare-fun e!283297 () Bool)

(assert (=> b!481484 (= e!283297 (and e!283298 mapRes!22342))))

(declare-fun condMapEmpty!22342 () Bool)

(declare-fun mapDefault!22342 () ValueCell!6516)

(assert (=> b!481484 (= condMapEmpty!22342 (= (arr!14989 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6516)) mapDefault!22342)))))

(declare-fun b!481485 () Bool)

(declare-fun res!287050 () Bool)

(declare-fun e!283296 () Bool)

(assert (=> b!481485 (=> (not res!287050) (not e!283296))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun minValue!1458 () V!19411)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19411)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31175 0))(
  ( (array!31176 (arr!14990 (Array (_ BitVec 32) (_ BitVec 64))) (size!15348 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31175)

(declare-datatypes ((tuple2!9088 0))(
  ( (tuple2!9089 (_1!4555 (_ BitVec 64)) (_2!4555 V!19411)) )
))
(declare-datatypes ((List!9166 0))(
  ( (Nil!9163) (Cons!9162 (h!10018 tuple2!9088) (t!15380 List!9166)) )
))
(declare-datatypes ((ListLongMap!8001 0))(
  ( (ListLongMap!8002 (toList!4016 List!9166)) )
))
(declare-fun contains!2630 (ListLongMap!8001 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2335 (array!31175 array!31173 (_ BitVec 32) (_ BitVec 32) V!19411 V!19411 (_ BitVec 32) Int) ListLongMap!8001)

(assert (=> b!481485 (= res!287050 (contains!2630 (getCurrentListMap!2335 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481486 () Bool)

(declare-fun e!283295 () Bool)

(declare-fun arrayContainsKey!0 (array!31175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!481486 (= e!283295 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!481487 () Bool)

(declare-fun res!287049 () Bool)

(assert (=> b!481487 (=> (not res!287049) (not e!283296))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31175 (_ BitVec 32)) Bool)

(assert (=> b!481487 (= res!287049 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!481488 () Bool)

(assert (=> b!481488 (= e!283294 tp_is_empty!13755)))

(declare-fun res!287048 () Bool)

(assert (=> start!43464 (=> (not res!287048) (not e!283296))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43464 (= res!287048 (validMask!0 mask!2352))))

(assert (=> start!43464 e!283296))

(assert (=> start!43464 true))

(assert (=> start!43464 tp_is_empty!13755))

(declare-fun array_inv!10812 (array!31173) Bool)

(assert (=> start!43464 (and (array_inv!10812 _values!1516) e!283297)))

(assert (=> start!43464 tp!43012))

(declare-fun array_inv!10813 (array!31175) Bool)

(assert (=> start!43464 (array_inv!10813 _keys!1874)))

(declare-fun b!481489 () Bool)

(assert (=> b!481489 (= e!283296 (not true))))

(declare-fun lt!218541 () (_ BitVec 32))

(assert (=> b!481489 (arrayForallSeekEntryOrOpenFound!0 lt!218541 _keys!1874 mask!2352)))

(declare-datatypes ((Unit!14124 0))(
  ( (Unit!14125) )
))
(declare-fun lt!218542 () Unit!14124)

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!31175 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!14124)

(assert (=> b!481489 (= lt!218542 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 _keys!1874 mask!2352 #b00000000000000000000000000000000 lt!218541))))

(declare-fun arrayScanForKey!0 (array!31175 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!481489 (= lt!218541 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!481489 e!283295))

(declare-fun c!57918 () Bool)

(assert (=> b!481489 (= c!57918 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!218540 () Unit!14124)

(declare-fun lemmaKeyInListMapIsInArray!133 (array!31175 array!31173 (_ BitVec 32) (_ BitVec 32) V!19411 V!19411 (_ BitVec 64) Int) Unit!14124)

(assert (=> b!481489 (= lt!218540 (lemmaKeyInListMapIsInArray!133 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!481490 () Bool)

(assert (=> b!481490 (= e!283295 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!22342 () Bool)

(assert (=> mapIsEmpty!22342 mapRes!22342))

(declare-fun b!481491 () Bool)

(declare-fun res!287051 () Bool)

(assert (=> b!481491 (=> (not res!287051) (not e!283296))))

(assert (=> b!481491 (= res!287051 (and (= (size!15347 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15348 _keys!1874) (size!15347 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!481492 () Bool)

(declare-fun res!287053 () Bool)

(assert (=> b!481492 (=> (not res!287053) (not e!283296))))

(declare-datatypes ((List!9167 0))(
  ( (Nil!9164) (Cons!9163 (h!10019 (_ BitVec 64)) (t!15381 List!9167)) )
))
(declare-fun arrayNoDuplicates!0 (array!31175 (_ BitVec 32) List!9167) Bool)

(assert (=> b!481492 (= res!287053 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9164))))

(declare-fun b!481493 () Bool)

(declare-fun res!287052 () Bool)

(assert (=> b!481493 (=> (not res!287052) (not e!283296))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!481493 (= res!287052 (validKeyInArray!0 k0!1332))))

(assert (= (and start!43464 res!287048) b!481491))

(assert (= (and b!481491 res!287051) b!481487))

(assert (= (and b!481487 res!287049) b!481492))

(assert (= (and b!481492 res!287053) b!481485))

(assert (= (and b!481485 res!287050) b!481493))

(assert (= (and b!481493 res!287052) b!481489))

(assert (= (and b!481489 c!57918) b!481486))

(assert (= (and b!481489 (not c!57918)) b!481490))

(assert (= (and b!481484 condMapEmpty!22342) mapIsEmpty!22342))

(assert (= (and b!481484 (not condMapEmpty!22342)) mapNonEmpty!22342))

(get-info :version)

(assert (= (and mapNonEmpty!22342 ((_ is ValueCellFull!6516) mapValue!22342)) b!481488))

(assert (= (and b!481484 ((_ is ValueCellFull!6516) mapDefault!22342)) b!481483))

(assert (= start!43464 b!481484))

(declare-fun m!462927 () Bool)

(assert (=> mapNonEmpty!22342 m!462927))

(declare-fun m!462929 () Bool)

(assert (=> b!481487 m!462929))

(declare-fun m!462931 () Bool)

(assert (=> b!481485 m!462931))

(assert (=> b!481485 m!462931))

(declare-fun m!462933 () Bool)

(assert (=> b!481485 m!462933))

(declare-fun m!462935 () Bool)

(assert (=> b!481492 m!462935))

(declare-fun m!462937 () Bool)

(assert (=> b!481486 m!462937))

(declare-fun m!462939 () Bool)

(assert (=> b!481493 m!462939))

(declare-fun m!462941 () Bool)

(assert (=> b!481489 m!462941))

(declare-fun m!462943 () Bool)

(assert (=> b!481489 m!462943))

(declare-fun m!462945 () Bool)

(assert (=> b!481489 m!462945))

(declare-fun m!462947 () Bool)

(assert (=> b!481489 m!462947))

(declare-fun m!462949 () Bool)

(assert (=> start!43464 m!462949))

(declare-fun m!462951 () Bool)

(assert (=> start!43464 m!462951))

(declare-fun m!462953 () Bool)

(assert (=> start!43464 m!462953))

(check-sat (not b!481487) (not b!481492) (not mapNonEmpty!22342) tp_is_empty!13755 (not b_next!12243) (not start!43464) (not b!481493) (not b!481486) (not b!481485) (not b!481489) b_and!21003)
(check-sat b_and!21003 (not b_next!12243))
