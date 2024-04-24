; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43594 () Bool)

(assert start!43594)

(declare-fun b_free!12343 () Bool)

(declare-fun b_next!12343 () Bool)

(assert (=> start!43594 (= b_free!12343 (not b_next!12343))))

(declare-fun tp!43317 () Bool)

(declare-fun b_and!21117 () Bool)

(assert (=> start!43594 (= tp!43317 b_and!21117)))

(declare-fun b!483002 () Bool)

(declare-fun e!284245 () Bool)

(declare-fun e!284247 () Bool)

(declare-fun mapRes!22498 () Bool)

(assert (=> b!483002 (= e!284245 (and e!284247 mapRes!22498))))

(declare-fun condMapEmpty!22498 () Bool)

(declare-datatypes ((V!19545 0))(
  ( (V!19546 (val!6975 Int)) )
))
(declare-datatypes ((ValueCell!6566 0))(
  ( (ValueCellFull!6566 (v!9271 V!19545)) (EmptyCell!6566) )
))
(declare-datatypes ((array!31358 0))(
  ( (array!31359 (arr!15079 (Array (_ BitVec 32) ValueCell!6566)) (size!15437 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31358)

(declare-fun mapDefault!22498 () ValueCell!6566)

(assert (=> b!483002 (= condMapEmpty!22498 (= (arr!15079 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6566)) mapDefault!22498)))))

(declare-fun b!483003 () Bool)

(declare-fun res!287884 () Bool)

(declare-fun e!284246 () Bool)

(assert (=> b!483003 (=> (not res!287884) (not e!284246))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-datatypes ((array!31360 0))(
  ( (array!31361 (arr!15080 (Array (_ BitVec 32) (_ BitVec 64))) (size!15438 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31360)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!483003 (= res!287884 (and (= (size!15437 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15438 _keys!1874) (size!15437 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!483004 () Bool)

(declare-fun e!284244 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!31360 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!483004 (= e!284244 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!22498 () Bool)

(declare-fun tp!43318 () Bool)

(declare-fun e!284242 () Bool)

(assert (=> mapNonEmpty!22498 (= mapRes!22498 (and tp!43318 e!284242))))

(declare-fun mapKey!22498 () (_ BitVec 32))

(declare-fun mapValue!22498 () ValueCell!6566)

(declare-fun mapRest!22498 () (Array (_ BitVec 32) ValueCell!6566))

(assert (=> mapNonEmpty!22498 (= (arr!15079 _values!1516) (store mapRest!22498 mapKey!22498 mapValue!22498))))

(declare-fun b!483005 () Bool)

(declare-fun tp_is_empty!13855 () Bool)

(assert (=> b!483005 (= e!284242 tp_is_empty!13855)))

(declare-fun mapIsEmpty!22498 () Bool)

(assert (=> mapIsEmpty!22498 mapRes!22498))

(declare-fun b!483006 () Bool)

(declare-fun res!287886 () Bool)

(assert (=> b!483006 (=> (not res!287886) (not e!284246))))

(declare-datatypes ((List!9137 0))(
  ( (Nil!9134) (Cons!9133 (h!9989 (_ BitVec 64)) (t!15347 List!9137)) )
))
(declare-fun arrayNoDuplicates!0 (array!31360 (_ BitVec 32) List!9137) Bool)

(assert (=> b!483006 (= res!287886 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9134))))

(declare-fun b!483007 () Bool)

(assert (=> b!483007 (= e!284247 tp_is_empty!13855)))

(declare-fun res!287882 () Bool)

(assert (=> start!43594 (=> (not res!287882) (not e!284246))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43594 (= res!287882 (validMask!0 mask!2352))))

(assert (=> start!43594 e!284246))

(assert (=> start!43594 true))

(assert (=> start!43594 tp_is_empty!13855))

(declare-fun array_inv!10946 (array!31358) Bool)

(assert (=> start!43594 (and (array_inv!10946 _values!1516) e!284245)))

(assert (=> start!43594 tp!43317))

(declare-fun array_inv!10947 (array!31360) Bool)

(assert (=> start!43594 (array_inv!10947 _keys!1874)))

(declare-fun b!483008 () Bool)

(assert (=> b!483008 (= e!284246 (not true))))

(declare-fun lt!218988 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31360 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!483008 (= lt!218988 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!483008 e!284244))

(declare-fun c!58026 () Bool)

(assert (=> b!483008 (= c!58026 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19545)

(declare-fun zeroValue!1458 () V!19545)

(declare-datatypes ((Unit!14121 0))(
  ( (Unit!14122) )
))
(declare-fun lt!218989 () Unit!14121)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!150 (array!31360 array!31358 (_ BitVec 32) (_ BitVec 32) V!19545 V!19545 (_ BitVec 64) Int) Unit!14121)

(assert (=> b!483008 (= lt!218989 (lemmaKeyInListMapIsInArray!150 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!483009 () Bool)

(declare-fun res!287883 () Bool)

(assert (=> b!483009 (=> (not res!287883) (not e!284246))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!483009 (= res!287883 (validKeyInArray!0 k0!1332))))

(declare-fun b!483010 () Bool)

(declare-fun res!287885 () Bool)

(assert (=> b!483010 (=> (not res!287885) (not e!284246))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31360 (_ BitVec 32)) Bool)

(assert (=> b!483010 (= res!287885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!483011 () Bool)

(assert (=> b!483011 (= e!284244 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!483012 () Bool)

(declare-fun res!287881 () Bool)

(assert (=> b!483012 (=> (not res!287881) (not e!284246))))

(declare-datatypes ((tuple2!9072 0))(
  ( (tuple2!9073 (_1!4547 (_ BitVec 64)) (_2!4547 V!19545)) )
))
(declare-datatypes ((List!9138 0))(
  ( (Nil!9135) (Cons!9134 (h!9990 tuple2!9072) (t!15348 List!9138)) )
))
(declare-datatypes ((ListLongMap!7987 0))(
  ( (ListLongMap!7988 (toList!4009 List!9138)) )
))
(declare-fun contains!2643 (ListLongMap!7987 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2323 (array!31360 array!31358 (_ BitVec 32) (_ BitVec 32) V!19545 V!19545 (_ BitVec 32) Int) ListLongMap!7987)

(assert (=> b!483012 (= res!287881 (contains!2643 (getCurrentListMap!2323 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(assert (= (and start!43594 res!287882) b!483003))

(assert (= (and b!483003 res!287884) b!483010))

(assert (= (and b!483010 res!287885) b!483006))

(assert (= (and b!483006 res!287886) b!483012))

(assert (= (and b!483012 res!287881) b!483009))

(assert (= (and b!483009 res!287883) b!483008))

(assert (= (and b!483008 c!58026) b!483004))

(assert (= (and b!483008 (not c!58026)) b!483011))

(assert (= (and b!483002 condMapEmpty!22498) mapIsEmpty!22498))

(assert (= (and b!483002 (not condMapEmpty!22498)) mapNonEmpty!22498))

(get-info :version)

(assert (= (and mapNonEmpty!22498 ((_ is ValueCellFull!6566) mapValue!22498)) b!483005))

(assert (= (and b!483002 ((_ is ValueCellFull!6566) mapDefault!22498)) b!483007))

(assert (= start!43594 b!483002))

(declare-fun m!464313 () Bool)

(assert (=> b!483006 m!464313))

(declare-fun m!464315 () Bool)

(assert (=> b!483010 m!464315))

(declare-fun m!464317 () Bool)

(assert (=> b!483012 m!464317))

(assert (=> b!483012 m!464317))

(declare-fun m!464319 () Bool)

(assert (=> b!483012 m!464319))

(declare-fun m!464321 () Bool)

(assert (=> start!43594 m!464321))

(declare-fun m!464323 () Bool)

(assert (=> start!43594 m!464323))

(declare-fun m!464325 () Bool)

(assert (=> start!43594 m!464325))

(declare-fun m!464327 () Bool)

(assert (=> mapNonEmpty!22498 m!464327))

(declare-fun m!464329 () Bool)

(assert (=> b!483009 m!464329))

(declare-fun m!464331 () Bool)

(assert (=> b!483004 m!464331))

(declare-fun m!464333 () Bool)

(assert (=> b!483008 m!464333))

(declare-fun m!464335 () Bool)

(assert (=> b!483008 m!464335))

(check-sat tp_is_empty!13855 (not b!483010) (not b!483004) (not b!483009) (not b_next!12343) b_and!21117 (not b!483008) (not b!483012) (not start!43594) (not mapNonEmpty!22498) (not b!483006))
(check-sat b_and!21117 (not b_next!12343))
