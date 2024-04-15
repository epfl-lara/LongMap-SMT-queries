; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77628 () Bool)

(assert start!77628)

(declare-fun b_free!16231 () Bool)

(declare-fun b_next!16231 () Bool)

(assert (=> start!77628 (= b_free!16231 (not b_next!16231))))

(declare-fun tp!56955 () Bool)

(declare-fun b_and!26589 () Bool)

(assert (=> start!77628 (= tp!56955 b_and!26589)))

(declare-fun b!905007 () Bool)

(declare-fun e!507124 () Bool)

(declare-fun e!507125 () Bool)

(declare-fun mapRes!29686 () Bool)

(assert (=> b!905007 (= e!507124 (and e!507125 mapRes!29686))))

(declare-fun condMapEmpty!29686 () Bool)

(declare-datatypes ((V!29831 0))(
  ( (V!29832 (val!9375 Int)) )
))
(declare-datatypes ((ValueCell!8843 0))(
  ( (ValueCellFull!8843 (v!11879 V!29831)) (EmptyCell!8843) )
))
(declare-datatypes ((array!53319 0))(
  ( (array!53320 (arr!25619 (Array (_ BitVec 32) ValueCell!8843)) (size!26080 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53319)

(declare-fun mapDefault!29686 () ValueCell!8843)

(assert (=> b!905007 (= condMapEmpty!29686 (= (arr!25619 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8843)) mapDefault!29686)))))

(declare-fun b!905008 () Bool)

(declare-fun res!610746 () Bool)

(declare-fun e!507118 () Bool)

(assert (=> b!905008 (=> (not res!610746) (not e!507118))))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-datatypes ((array!53321 0))(
  ( (array!53322 (arr!25620 (Array (_ BitVec 32) (_ BitVec 64))) (size!26081 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53321)

(assert (=> b!905008 (= res!610746 (and (= (size!26080 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!26081 _keys!1386) (size!26080 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun b!905010 () Bool)

(declare-fun e!507122 () Bool)

(declare-fun e!507123 () Bool)

(assert (=> b!905010 (= e!507122 e!507123)))

(declare-fun res!610745 () Bool)

(assert (=> b!905010 (=> res!610745 e!507123)))

(declare-datatypes ((tuple2!12210 0))(
  ( (tuple2!12211 (_1!6116 (_ BitVec 64)) (_2!6116 V!29831)) )
))
(declare-datatypes ((List!18008 0))(
  ( (Nil!18005) (Cons!18004 (h!19150 tuple2!12210) (t!25402 List!18008)) )
))
(declare-datatypes ((ListLongMap!10897 0))(
  ( (ListLongMap!10898 (toList!5464 List!18008)) )
))
(declare-fun lt!408250 () ListLongMap!10897)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun contains!4474 (ListLongMap!10897 (_ BitVec 64)) Bool)

(assert (=> b!905010 (= res!610745 (not (contains!4474 lt!408250 k0!1033)))))

(declare-fun defaultEntry!1160 () Int)

(declare-fun i!717 () (_ BitVec 32))

(declare-fun zeroValue!1094 () V!29831)

(declare-fun minValue!1094 () V!29831)

(declare-fun getCurrentListMap!2678 (array!53321 array!53319 (_ BitVec 32) (_ BitVec 32) V!29831 V!29831 (_ BitVec 32) Int) ListLongMap!10897)

(assert (=> b!905010 (= lt!408250 (getCurrentListMap!2678 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun mapNonEmpty!29686 () Bool)

(declare-fun tp!56956 () Bool)

(declare-fun e!507119 () Bool)

(assert (=> mapNonEmpty!29686 (= mapRes!29686 (and tp!56956 e!507119))))

(declare-fun mapKey!29686 () (_ BitVec 32))

(declare-fun mapValue!29686 () ValueCell!8843)

(declare-fun mapRest!29686 () (Array (_ BitVec 32) ValueCell!8843))

(assert (=> mapNonEmpty!29686 (= (arr!25619 _values!1152) (store mapRest!29686 mapKey!29686 mapValue!29686))))

(declare-fun b!905011 () Bool)

(declare-fun e!507121 () Bool)

(assert (=> b!905011 (= e!507121 (not e!507122))))

(declare-fun res!610748 () Bool)

(assert (=> b!905011 (=> res!610748 e!507122)))

(assert (=> b!905011 (= res!610748 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26081 _keys!1386))))))

(declare-fun lt!408246 () V!29831)

(declare-fun get!13465 (ValueCell!8843 V!29831) V!29831)

(declare-fun dynLambda!1322 (Int (_ BitVec 64)) V!29831)

(assert (=> b!905011 (= lt!408246 (get!13465 (select (arr!25619 _values!1152) i!717) (dynLambda!1322 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53321 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!905011 (arrayContainsKey!0 _keys!1386 k0!1033 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30636 0))(
  ( (Unit!30637) )
))
(declare-fun lt!408247 () Unit!30636)

(declare-fun lemmaKeyInListMapIsInArray!198 (array!53321 array!53319 (_ BitVec 32) (_ BitVec 32) V!29831 V!29831 (_ BitVec 64) Int) Unit!30636)

(assert (=> b!905011 (= lt!408247 (lemmaKeyInListMapIsInArray!198 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 defaultEntry!1160))))

(declare-fun b!905012 () Bool)

(assert (=> b!905012 (= e!507123 true)))

(declare-fun lt!408249 () ListLongMap!10897)

(declare-fun apply!444 (ListLongMap!10897 (_ BitVec 64)) V!29831)

(assert (=> b!905012 (= (apply!444 lt!408249 k0!1033) lt!408246)))

(declare-fun lt!408248 () Unit!30636)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!8 (array!53321 array!53319 (_ BitVec 32) (_ BitVec 32) V!29831 V!29831 (_ BitVec 64) V!29831 (_ BitVec 32) Int) Unit!30636)

(assert (=> b!905012 (= lt!408248 (lemmaListMapApplyFromThenApplyFromZero!8 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k0!1033 lt!408246 i!717 defaultEntry!1160))))

(declare-fun b!905013 () Bool)

(declare-fun tp_is_empty!18649 () Bool)

(assert (=> b!905013 (= e!507125 tp_is_empty!18649)))

(declare-fun mapIsEmpty!29686 () Bool)

(assert (=> mapIsEmpty!29686 mapRes!29686))

(declare-fun b!905014 () Bool)

(declare-fun res!610740 () Bool)

(assert (=> b!905014 (=> res!610740 e!507123)))

(assert (=> b!905014 (= res!610740 (not (= (apply!444 lt!408250 k0!1033) lt!408246)))))

(declare-fun b!905015 () Bool)

(declare-fun res!610744 () Bool)

(assert (=> b!905015 (=> (not res!610744) (not e!507118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53321 (_ BitVec 32)) Bool)

(assert (=> b!905015 (= res!610744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!905016 () Bool)

(assert (=> b!905016 (= e!507119 tp_is_empty!18649)))

(declare-fun b!905017 () Bool)

(declare-fun res!610749 () Bool)

(assert (=> b!905017 (=> (not res!610749) (not e!507121))))

(assert (=> b!905017 (= res!610749 (and (= (select (arr!25620 _keys!1386) i!717) k0!1033) (not (= k0!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!610747 () Bool)

(assert (=> start!77628 (=> (not res!610747) (not e!507118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77628 (= res!610747 (validMask!0 mask!1756))))

(assert (=> start!77628 e!507118))

(declare-fun array_inv!20122 (array!53319) Bool)

(assert (=> start!77628 (and (array_inv!20122 _values!1152) e!507124)))

(assert (=> start!77628 tp!56955))

(assert (=> start!77628 true))

(assert (=> start!77628 tp_is_empty!18649))

(declare-fun array_inv!20123 (array!53321) Bool)

(assert (=> start!77628 (array_inv!20123 _keys!1386)))

(declare-fun b!905009 () Bool)

(declare-fun res!610741 () Bool)

(assert (=> b!905009 (=> (not res!610741) (not e!507121))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!905009 (= res!610741 (inRange!0 i!717 mask!1756))))

(declare-fun b!905018 () Bool)

(assert (=> b!905018 (= e!507118 e!507121)))

(declare-fun res!610742 () Bool)

(assert (=> b!905018 (=> (not res!610742) (not e!507121))))

(assert (=> b!905018 (= res!610742 (contains!4474 lt!408249 k0!1033))))

(assert (=> b!905018 (= lt!408249 (getCurrentListMap!2678 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160))))

(declare-fun b!905019 () Bool)

(declare-fun res!610743 () Bool)

(assert (=> b!905019 (=> (not res!610743) (not e!507118))))

(declare-datatypes ((List!18009 0))(
  ( (Nil!18006) (Cons!18005 (h!19151 (_ BitVec 64)) (t!25403 List!18009)) )
))
(declare-fun arrayNoDuplicates!0 (array!53321 (_ BitVec 32) List!18009) Bool)

(assert (=> b!905019 (= res!610743 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!18006))))

(assert (= (and start!77628 res!610747) b!905008))

(assert (= (and b!905008 res!610746) b!905015))

(assert (= (and b!905015 res!610744) b!905019))

(assert (= (and b!905019 res!610743) b!905018))

(assert (= (and b!905018 res!610742) b!905009))

(assert (= (and b!905009 res!610741) b!905017))

(assert (= (and b!905017 res!610749) b!905011))

(assert (= (and b!905011 (not res!610748)) b!905010))

(assert (= (and b!905010 (not res!610745)) b!905014))

(assert (= (and b!905014 (not res!610740)) b!905012))

(assert (= (and b!905007 condMapEmpty!29686) mapIsEmpty!29686))

(assert (= (and b!905007 (not condMapEmpty!29686)) mapNonEmpty!29686))

(get-info :version)

(assert (= (and mapNonEmpty!29686 ((_ is ValueCellFull!8843) mapValue!29686)) b!905016))

(assert (= (and b!905007 ((_ is ValueCellFull!8843) mapDefault!29686)) b!905013))

(assert (= start!77628 b!905007))

(declare-fun b_lambda!13087 () Bool)

(assert (=> (not b_lambda!13087) (not b!905011)))

(declare-fun t!25401 () Bool)

(declare-fun tb!5245 () Bool)

(assert (=> (and start!77628 (= defaultEntry!1160 defaultEntry!1160) t!25401) tb!5245))

(declare-fun result!10293 () Bool)

(assert (=> tb!5245 (= result!10293 tp_is_empty!18649)))

(assert (=> b!905011 t!25401))

(declare-fun b_and!26591 () Bool)

(assert (= b_and!26589 (and (=> t!25401 result!10293) b_and!26591)))

(declare-fun m!839897 () Bool)

(assert (=> b!905014 m!839897))

(declare-fun m!839899 () Bool)

(assert (=> start!77628 m!839899))

(declare-fun m!839901 () Bool)

(assert (=> start!77628 m!839901))

(declare-fun m!839903 () Bool)

(assert (=> start!77628 m!839903))

(declare-fun m!839905 () Bool)

(assert (=> b!905018 m!839905))

(declare-fun m!839907 () Bool)

(assert (=> b!905018 m!839907))

(declare-fun m!839909 () Bool)

(assert (=> b!905009 m!839909))

(declare-fun m!839911 () Bool)

(assert (=> mapNonEmpty!29686 m!839911))

(declare-fun m!839913 () Bool)

(assert (=> b!905012 m!839913))

(declare-fun m!839915 () Bool)

(assert (=> b!905012 m!839915))

(declare-fun m!839917 () Bool)

(assert (=> b!905010 m!839917))

(declare-fun m!839919 () Bool)

(assert (=> b!905010 m!839919))

(declare-fun m!839921 () Bool)

(assert (=> b!905019 m!839921))

(declare-fun m!839923 () Bool)

(assert (=> b!905011 m!839923))

(declare-fun m!839925 () Bool)

(assert (=> b!905011 m!839925))

(declare-fun m!839927 () Bool)

(assert (=> b!905011 m!839927))

(declare-fun m!839929 () Bool)

(assert (=> b!905011 m!839929))

(assert (=> b!905011 m!839923))

(assert (=> b!905011 m!839927))

(declare-fun m!839931 () Bool)

(assert (=> b!905011 m!839931))

(declare-fun m!839933 () Bool)

(assert (=> b!905017 m!839933))

(declare-fun m!839935 () Bool)

(assert (=> b!905015 m!839935))

(check-sat (not mapNonEmpty!29686) (not b!905010) (not b_lambda!13087) (not b!905014) tp_is_empty!18649 (not start!77628) (not b!905019) b_and!26591 (not b!905009) (not b!905015) (not b!905012) (not b!905011) (not b_next!16231) (not b!905018))
(check-sat b_and!26591 (not b_next!16231))
