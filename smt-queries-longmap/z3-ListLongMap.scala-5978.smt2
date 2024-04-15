; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77676 () Bool)

(assert start!77676)

(declare-fun b_free!16279 () Bool)

(declare-fun b_next!16279 () Bool)

(assert (=> start!77676 (= b_free!16279 (not b_next!16279))))

(declare-fun tp!57100 () Bool)

(declare-fun b_and!26685 () Bool)

(assert (=> start!77676 (= tp!57100 b_and!26685)))

(declare-fun b!905991 () Bool)

(declare-fun res!611467 () Bool)

(declare-fun e!507697 () Bool)

(assert (=> b!905991 (=> (not res!611467) (not e!507697))))

(declare-datatypes ((V!29895 0))(
  ( (V!29896 (val!9399 Int)) )
))
(declare-datatypes ((ValueCell!8867 0))(
  ( (ValueCellFull!8867 (v!11903 V!29895)) (EmptyCell!8867) )
))
(declare-datatypes ((array!53413 0))(
  ( (array!53414 (arr!25666 (Array (_ BitVec 32) ValueCell!8867)) (size!26127 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53413)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53415 0))(
  ( (array!53416 (arr!25667 (Array (_ BitVec 32) (_ BitVec 64))) (size!26128 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53415)

(assert (=> b!905991 (= res!611467 (and (= (size!26127 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26128 _keys!1386) (size!26127 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905992 () Bool)

(declare-fun e!507699 () Bool)

(declare-fun tp_is_empty!18697 () Bool)

(assert (=> b!905992 (= e!507699 tp_is_empty!18697)))

(declare-fun mapIsEmpty!29758 () Bool)

(declare-fun mapRes!29758 () Bool)

(assert (=> mapIsEmpty!29758 mapRes!29758))

(declare-fun b!905993 () Bool)

(declare-fun e!507695 () Bool)

(assert (=> b!905993 (= e!507695 tp_is_empty!18697)))

(declare-fun b!905994 () Bool)

(declare-fun e!507694 () Bool)

(declare-fun e!507700 () Bool)

(assert (=> b!905994 (= e!507694 e!507700)))

(declare-fun res!611464 () Bool)

(assert (=> b!905994 (=> res!611464 e!507700)))

(declare-datatypes ((tuple2!12252 0))(
  ( (tuple2!12253 (_1!6137 (_ BitVec 64)) (_2!6137 V!29895)) )
))
(declare-datatypes ((List!18043 0))(
  ( (Nil!18040) (Cons!18039 (h!19185 tuple2!12252) (t!25485 List!18043)) )
))
(declare-datatypes ((ListLongMap!10939 0))(
  ( (ListLongMap!10940 (toList!5485 List!18043)) )
))
(declare-fun lt!408608 () ListLongMap!10939)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4492 (ListLongMap!10939 (_ BitVec 64)) Bool)

(assert (=> b!905994 (= res!611464 (not (contains!4492 lt!408608 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29895)

(declare-fun zeroValue!1094 () V!29895)

(declare-fun getCurrentListMap!2696 (array!53415 array!53413 (_ BitVec 32) (_ BitVec 32) V!29895 V!29895 (_ BitVec 32) Int) ListLongMap!10939)

(assert (=> b!905994 (= lt!408608 (getCurrentListMap!2696 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!905995 () Bool)

(declare-fun res!611469 () Bool)

(declare-fun e!507696 () Bool)

(assert (=> b!905995 (=> (not res!611469) (not e!507696))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905995 (= res!611469 (inRange!0 i!717 mask!1756))))

(declare-fun b!905996 () Bool)

(declare-fun e!507698 () Bool)

(assert (=> b!905996 (= e!507698 (and e!507695 mapRes!29758))))

(declare-fun condMapEmpty!29758 () Bool)

(declare-fun mapDefault!29758 () ValueCell!8867)

(assert (=> b!905996 (= condMapEmpty!29758 (= (arr!25666 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8867)) mapDefault!29758)))))

(declare-fun b!905997 () Bool)

(declare-fun res!611466 () Bool)

(assert (=> b!905997 (=> (not res!611466) (not e!507696))))

(assert (=> b!905997 (= res!611466 (and (= (select (arr!25667 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!611460 () Bool)

(assert (=> start!77676 (=> (not res!611460) (not e!507697))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77676 (= res!611460 (validMask!0 mask!1756))))

(assert (=> start!77676 e!507697))

(declare-fun array_inv!20150 (array!53413) Bool)

(assert (=> start!77676 (and (array_inv!20150 _values!1152) e!507698)))

(assert (=> start!77676 tp!57100))

(assert (=> start!77676 true))

(assert (=> start!77676 tp_is_empty!18697))

(declare-fun array_inv!20151 (array!53415) Bool)

(assert (=> start!77676 (array_inv!20151 _keys!1386)))

(declare-fun b!905998 () Bool)

(assert (=> b!905998 (= e!507696 (not e!507694))))

(declare-fun res!611463 () Bool)

(assert (=> b!905998 (=> res!611463 e!507694)))

(assert (=> b!905998 (= res!611463 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26128 _keys!1386))))))

(declare-fun lt!408609 () V!29895)

(declare-fun get!13497 (ValueCell!8867 V!29895) V!29895)

(declare-fun dynLambda!1338 (Int (_ BitVec 64)) V!29895)

(assert (=> b!905998 (= lt!408609 (get!13497 (select (arr!25666 _values!1152) i!717) (dynLambda!1338 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905998 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30672 0))(
  ( (Unit!30673) )
))
(declare-fun lt!408606 () Unit!30672)

(declare-fun lemmaKeyInListMapIsInArray!214 (array!53415 array!53413 (_ BitVec 32) (_ BitVec 32) V!29895 V!29895 (_ BitVec 64) Int) Unit!30672)

(assert (=> b!905998 (= lt!408606 (lemmaKeyInListMapIsInArray!214 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905999 () Bool)

(declare-fun res!611468 () Bool)

(assert (=> b!905999 (=> res!611468 e!507700)))

(declare-fun apply!462 (ListLongMap!10939 (_ BitVec 64)) V!29895)

(assert (=> b!905999 (= res!611468 (not (= (apply!462 lt!408608 k0!1033) lt!408609)))))

(declare-fun mapNonEmpty!29758 () Bool)

(declare-fun tp!57099 () Bool)

(assert (=> mapNonEmpty!29758 (= mapRes!29758 (and tp!57099 e!507699))))

(declare-fun mapValue!29758 () ValueCell!8867)

(declare-fun mapRest!29758 () (Array (_ BitVec 32) ValueCell!8867))

(declare-fun mapKey!29758 () (_ BitVec 32))

(assert (=> mapNonEmpty!29758 (= (arr!25666 _values!1152) (store mapRest!29758 mapKey!29758 mapValue!29758))))

(declare-fun b!906000 () Bool)

(declare-fun res!611462 () Bool)

(assert (=> b!906000 (=> (not res!611462) (not e!507697))))

(declare-datatypes ((List!18044 0))(
  ( (Nil!18041) (Cons!18040 (h!19186 (_ BitVec 64)) (t!25486 List!18044)) )
))
(declare-fun arrayNoDuplicates!0 (array!53415 (_ BitVec 32) List!18044) Bool)

(assert (=> b!906000 (= res!611462 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18041))))

(declare-fun b!906001 () Bool)

(assert (=> b!906001 (= e!507697 e!507696)))

(declare-fun res!611461 () Bool)

(assert (=> b!906001 (=> (not res!611461) (not e!507696))))

(declare-fun lt!408610 () ListLongMap!10939)

(assert (=> b!906001 (= res!611461 (contains!4492 lt!408610 k0!1033))))

(assert (=> b!906001 (= lt!408610 (getCurrentListMap!2696 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!906002 () Bool)

(declare-fun res!611465 () Bool)

(assert (=> b!906002 (=> (not res!611465) (not e!507697))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53415 (_ BitVec 32)) Bool)

(assert (=> b!906002 (= res!611465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!906003 () Bool)

(assert (=> b!906003 (= e!507700 true)))

(assert (=> b!906003 (= (apply!462 lt!408610 k0!1033) lt!408609)))

(declare-fun lt!408607 () Unit!30672)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!23 (array!53415 array!53413 (_ BitVec 32) (_ BitVec 32) V!29895 V!29895 (_ BitVec 64) V!29895 (_ BitVec 32) Int) Unit!30672)

(assert (=> b!906003 (= lt!408607 (lemmaListMapApplyFromThenApplyFromZero!23 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408609 i!717 defaultEntry!1160))))

(assert (= (and start!77676 res!611460) b!905991))

(assert (= (and b!905991 res!611467) b!906002))

(assert (= (and b!906002 res!611465) b!906000))

(assert (= (and b!906000 res!611462) b!906001))

(assert (= (and b!906001 res!611461) b!905995))

(assert (= (and b!905995 res!611469) b!905997))

(assert (= (and b!905997 res!611466) b!905998))

(assert (= (and b!905998 (not res!611463)) b!905994))

(assert (= (and b!905994 (not res!611464)) b!905999))

(assert (= (and b!905999 (not res!611468)) b!906003))

(assert (= (and b!905996 condMapEmpty!29758) mapIsEmpty!29758))

(assert (= (and b!905996 (not condMapEmpty!29758)) mapNonEmpty!29758))

(get-info :version)

(assert (= (and mapNonEmpty!29758 ((_ is ValueCellFull!8867) mapValue!29758)) b!905992))

(assert (= (and b!905996 ((_ is ValueCellFull!8867) mapDefault!29758)) b!905993))

(assert (= start!77676 b!905996))

(declare-fun b_lambda!13135 () Bool)

(assert (=> (not b_lambda!13135) (not b!905998)))

(declare-fun t!25484 () Bool)

(declare-fun tb!5293 () Bool)

(assert (=> (and start!77676 (= defaultEntry!1160 defaultEntry!1160) t!25484) tb!5293))

(declare-fun result!10389 () Bool)

(assert (=> tb!5293 (= result!10389 tp_is_empty!18697)))

(assert (=> b!905998 t!25484))

(declare-fun b_and!26687 () Bool)

(assert (= b_and!26685 (and (=> t!25484 result!10389) b_and!26687)))

(declare-fun m!840857 () Bool)

(assert (=> b!905998 m!840857))

(declare-fun m!840859 () Bool)

(assert (=> b!905998 m!840859))

(declare-fun m!840861 () Bool)

(assert (=> b!905998 m!840861))

(declare-fun m!840863 () Bool)

(assert (=> b!905998 m!840863))

(assert (=> b!905998 m!840857))

(assert (=> b!905998 m!840861))

(declare-fun m!840865 () Bool)

(assert (=> b!905998 m!840865))

(declare-fun m!840867 () Bool)

(assert (=> b!905995 m!840867))

(declare-fun m!840869 () Bool)

(assert (=> b!905994 m!840869))

(declare-fun m!840871 () Bool)

(assert (=> b!905994 m!840871))

(declare-fun m!840873 () Bool)

(assert (=> start!77676 m!840873))

(declare-fun m!840875 () Bool)

(assert (=> start!77676 m!840875))

(declare-fun m!840877 () Bool)

(assert (=> start!77676 m!840877))

(declare-fun m!840879 () Bool)

(assert (=> b!906002 m!840879))

(declare-fun m!840881 () Bool)

(assert (=> b!905999 m!840881))

(declare-fun m!840883 () Bool)

(assert (=> b!906001 m!840883))

(declare-fun m!840885 () Bool)

(assert (=> b!906001 m!840885))

(declare-fun m!840887 () Bool)

(assert (=> b!906000 m!840887))

(declare-fun m!840889 () Bool)

(assert (=> b!905997 m!840889))

(declare-fun m!840891 () Bool)

(assert (=> mapNonEmpty!29758 m!840891))

(declare-fun m!840893 () Bool)

(assert (=> b!906003 m!840893))

(declare-fun m!840895 () Bool)

(assert (=> b!906003 m!840895))

(check-sat (not b!905994) (not mapNonEmpty!29758) (not b!905998) (not b!905999) b_and!26687 (not b_next!16279) (not b!905995) (not b!906001) (not start!77676) (not b!906003) (not b_lambda!13135) (not b!906002) tp_is_empty!18697 (not b!906000))
(check-sat b_and!26687 (not b_next!16279))
