; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77708 () Bool)

(assert start!77708)

(declare-fun b_free!16293 () Bool)

(declare-fun b_next!16293 () Bool)

(assert (=> start!77708 (= b_free!16293 (not b_next!16293))))

(declare-fun tp!57141 () Bool)

(declare-fun b_and!26739 () Bool)

(assert (=> start!77708 (= tp!57141 b_and!26739)))

(declare-fun b!906517 () Bool)

(declare-fun e!508015 () Bool)

(declare-fun e!508010 () Bool)

(assert (=> b!906517 (= e!508015 e!508010)))

(declare-fun res!611783 () Bool)

(assert (=> b!906517 (=> (not res!611783) (not e!508010))))

(declare-datatypes ((V!29913 0))(
  ( (V!29914 (val!9406 Int)) )
))
(declare-datatypes ((tuple2!12244 0))(
  ( (tuple2!12245 (_1!6133 (_ BitVec 64)) (_2!6133 V!29913)) )
))
(declare-datatypes ((List!18050 0))(
  ( (Nil!18047) (Cons!18046 (h!19192 tuple2!12244) (t!25515 List!18050)) )
))
(declare-datatypes ((ListLongMap!10941 0))(
  ( (ListLongMap!10942 (toList!5486 List!18050)) )
))
(declare-fun lt!408949 () ListLongMap!10941)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4531 (ListLongMap!10941 (_ BitVec 64)) Bool)

(assert (=> b!906517 (= res!611783 (contains!4531 lt!408949 k0!1033))))

(declare-datatypes ((ValueCell!8874 0))(
  ( (ValueCellFull!8874 (v!11911 V!29913)) (EmptyCell!8874) )
))
(declare-datatypes ((array!53464 0))(
  ( (array!53465 (arr!25691 (Array (_ BitVec 32) ValueCell!8874)) (size!26150 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53464)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29913)

(declare-datatypes ((array!53466 0))(
  ( (array!53467 (arr!25692 (Array (_ BitVec 32) (_ BitVec 64))) (size!26151 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53466)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29913)

(declare-fun getCurrentListMap!2752 (array!53466 array!53464 (_ BitVec 32) (_ BitVec 32) V!29913 V!29913 (_ BitVec 32) Int) ListLongMap!10941)

(assert (=> b!906517 (= lt!408949 (getCurrentListMap!2752 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906518 () Bool)

(declare-fun e!508014 () Bool)

(declare-fun tp_is_empty!18711 () Bool)

(assert (=> b!906518 (= e!508014 tp_is_empty!18711)))

(declare-fun mapIsEmpty!29779 () Bool)

(declare-fun mapRes!29779 () Bool)

(assert (=> mapIsEmpty!29779 mapRes!29779))

(declare-fun b!906519 () Bool)

(declare-fun res!611785 () Bool)

(assert (=> b!906519 (=> (not res!611785) (not e!508010))))

(declare-fun i!717 () (_ BitVec 32))

(assert (=> b!906519 (= res!611785 (and (= (select (arr!25692 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!906520 () Bool)

(declare-fun res!611786 () Bool)

(declare-fun e!508016 () Bool)

(assert (=> b!906520 (=> res!611786 e!508016)))

(declare-fun lt!408950 () V!29913)

(declare-fun lt!408947 () ListLongMap!10941)

(declare-fun apply!472 (ListLongMap!10941 (_ BitVec 64)) V!29913)

(assert (=> b!906520 (= res!611786 (not (= (apply!472 lt!408947 k0!1033) lt!408950)))))

(declare-fun b!906521 () Bool)

(declare-fun e!508017 () Bool)

(assert (=> b!906521 (= e!508017 tp_is_empty!18711)))

(declare-fun b!906522 () Bool)

(declare-fun e!508012 () Bool)

(assert (=> b!906522 (= e!508010 (not e!508012))))

(declare-fun res!611788 () Bool)

(assert (=> b!906522 (=> res!611788 e!508012)))

(assert (=> b!906522 (= res!611788 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26151 _keys!1386))))))

(declare-fun get!13507 (ValueCell!8874 V!29913) V!29913)

(declare-fun dynLambda!1349 (Int (_ BitVec 64)) V!29913)

(assert (=> b!906522 (= lt!408950 (get!13507 (select (arr!25691 _values!1152) i!717) (dynLambda!1349 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53466 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!906522 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30766 0))(
  ( (Unit!30767) )
))
(declare-fun lt!408951 () Unit!30766)

(declare-fun lemmaKeyInListMapIsInArray!221 (array!53466 array!53464 (_ BitVec 32) (_ BitVec 32) V!29913 V!29913 (_ BitVec 64) Int) Unit!30766)

(assert (=> b!906522 (= lt!408951 (lemmaKeyInListMapIsInArray!221 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!906523 () Bool)

(declare-fun res!611787 () Bool)

(assert (=> b!906523 (=> (not res!611787) (not e!508015))))

(declare-datatypes ((List!18051 0))(
  ( (Nil!18048) (Cons!18047 (h!19193 (_ BitVec 64)) (t!25516 List!18051)) )
))
(declare-fun arrayNoDuplicates!0 (array!53466 (_ BitVec 32) List!18051) Bool)

(assert (=> b!906523 (= res!611787 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18048))))

(declare-fun mapNonEmpty!29779 () Bool)

(declare-fun tp!57140 () Bool)

(assert (=> mapNonEmpty!29779 (= mapRes!29779 (and tp!57140 e!508017))))

(declare-fun mapValue!29779 () ValueCell!8874)

(declare-fun mapKey!29779 () (_ BitVec 32))

(declare-fun mapRest!29779 () (Array (_ BitVec 32) ValueCell!8874))

(assert (=> mapNonEmpty!29779 (= (arr!25691 _values!1152) (store mapRest!29779 mapKey!29779 mapValue!29779))))

(declare-fun b!906524 () Bool)

(declare-fun res!611782 () Bool)

(assert (=> b!906524 (=> (not res!611782) (not e!508015))))

(assert (=> b!906524 (= res!611782 (and (= (size!26150 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26151 _keys!1386) (size!26150 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!906525 () Bool)

(assert (=> b!906525 (= e!508012 e!508016)))

(declare-fun res!611784 () Bool)

(assert (=> b!906525 (=> res!611784 e!508016)))

(assert (=> b!906525 (= res!611784 (not (contains!4531 lt!408947 k0!1033)))))

(assert (=> b!906525 (= lt!408947 (getCurrentListMap!2752 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun res!611780 () Bool)

(assert (=> start!77708 (=> (not res!611780) (not e!508015))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77708 (= res!611780 (validMask!0 mask!1756))))

(assert (=> start!77708 e!508015))

(declare-fun e!508011 () Bool)

(declare-fun array_inv!20126 (array!53464) Bool)

(assert (=> start!77708 (and (array_inv!20126 _values!1152) e!508011)))

(assert (=> start!77708 tp!57141))

(assert (=> start!77708 true))

(assert (=> start!77708 tp_is_empty!18711))

(declare-fun array_inv!20127 (array!53466) Bool)

(assert (=> start!77708 (array_inv!20127 _keys!1386)))

(declare-fun b!906526 () Bool)

(assert (=> b!906526 (= e!508011 (and e!508014 mapRes!29779))))

(declare-fun condMapEmpty!29779 () Bool)

(declare-fun mapDefault!29779 () ValueCell!8874)

(assert (=> b!906526 (= condMapEmpty!29779 (= (arr!25691 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8874)) mapDefault!29779)))))

(declare-fun b!906527 () Bool)

(assert (=> b!906527 (= e!508016 true)))

(assert (=> b!906527 (= (apply!472 lt!408949 k0!1033) lt!408950)))

(declare-fun lt!408948 () Unit!30766)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!27 (array!53466 array!53464 (_ BitVec 32) (_ BitVec 32) V!29913 V!29913 (_ BitVec 64) V!29913 (_ BitVec 32) Int) Unit!30766)

(assert (=> b!906527 (= lt!408948 (lemmaListMapApplyFromThenApplyFromZero!27 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408950 i!717 defaultEntry!1160))))

(declare-fun b!906528 () Bool)

(declare-fun res!611789 () Bool)

(assert (=> b!906528 (=> (not res!611789) (not e!508015))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53466 (_ BitVec 32)) Bool)

(assert (=> b!906528 (= res!611789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906529 () Bool)

(declare-fun res!611781 () Bool)

(assert (=> b!906529 (=> (not res!611781) (not e!508010))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!906529 (= res!611781 (inRange!0 i!717 mask!1756))))

(assert (= (and start!77708 res!611780) b!906524))

(assert (= (and b!906524 res!611782) b!906528))

(assert (= (and b!906528 res!611789) b!906523))

(assert (= (and b!906523 res!611787) b!906517))

(assert (= (and b!906517 res!611783) b!906529))

(assert (= (and b!906529 res!611781) b!906519))

(assert (= (and b!906519 res!611785) b!906522))

(assert (= (and b!906522 (not res!611788)) b!906525))

(assert (= (and b!906525 (not res!611784)) b!906520))

(assert (= (and b!906520 (not res!611786)) b!906527))

(assert (= (and b!906526 condMapEmpty!29779) mapIsEmpty!29779))

(assert (= (and b!906526 (not condMapEmpty!29779)) mapNonEmpty!29779))

(get-info :version)

(assert (= (and mapNonEmpty!29779 ((_ is ValueCellFull!8874) mapValue!29779)) b!906521))

(assert (= (and b!906526 ((_ is ValueCellFull!8874) mapDefault!29779)) b!906518))

(assert (= start!77708 b!906526))

(declare-fun b_lambda!13167 () Bool)

(assert (=> (not b_lambda!13167) (not b!906522)))

(declare-fun t!25514 () Bool)

(declare-fun tb!5315 () Bool)

(assert (=> (and start!77708 (= defaultEntry!1160 defaultEntry!1160) t!25514) tb!5315))

(declare-fun result!10425 () Bool)

(assert (=> tb!5315 (= result!10425 tp_is_empty!18711)))

(assert (=> b!906522 t!25514))

(declare-fun b_and!26741 () Bool)

(assert (= b_and!26739 (and (=> t!25514 result!10425) b_and!26741)))

(declare-fun m!841895 () Bool)

(assert (=> b!906523 m!841895))

(declare-fun m!841897 () Bool)

(assert (=> b!906522 m!841897))

(declare-fun m!841899 () Bool)

(assert (=> b!906522 m!841899))

(declare-fun m!841901 () Bool)

(assert (=> b!906522 m!841901))

(declare-fun m!841903 () Bool)

(assert (=> b!906522 m!841903))

(assert (=> b!906522 m!841897))

(assert (=> b!906522 m!841901))

(declare-fun m!841905 () Bool)

(assert (=> b!906522 m!841905))

(declare-fun m!841907 () Bool)

(assert (=> start!77708 m!841907))

(declare-fun m!841909 () Bool)

(assert (=> start!77708 m!841909))

(declare-fun m!841911 () Bool)

(assert (=> start!77708 m!841911))

(declare-fun m!841913 () Bool)

(assert (=> b!906528 m!841913))

(declare-fun m!841915 () Bool)

(assert (=> b!906527 m!841915))

(declare-fun m!841917 () Bool)

(assert (=> b!906527 m!841917))

(declare-fun m!841919 () Bool)

(assert (=> b!906520 m!841919))

(declare-fun m!841921 () Bool)

(assert (=> b!906519 m!841921))

(declare-fun m!841923 () Bool)

(assert (=> mapNonEmpty!29779 m!841923))

(declare-fun m!841925 () Bool)

(assert (=> b!906529 m!841925))

(declare-fun m!841927 () Bool)

(assert (=> b!906517 m!841927))

(declare-fun m!841929 () Bool)

(assert (=> b!906517 m!841929))

(declare-fun m!841931 () Bool)

(assert (=> b!906525 m!841931))

(declare-fun m!841933 () Bool)

(assert (=> b!906525 m!841933))

(check-sat (not b!906522) (not b!906520) (not b!906529) (not b_next!16293) (not b!906528) (not b!906525) (not b_lambda!13167) (not b!906517) tp_is_empty!18711 (not start!77708) (not mapNonEmpty!29779) (not b!906523) b_and!26741 (not b!906527))
(check-sat b_and!26741 (not b_next!16293))
