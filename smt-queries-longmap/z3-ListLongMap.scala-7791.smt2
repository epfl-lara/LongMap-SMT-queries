; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97726 () Bool)

(assert start!97726)

(declare-fun b!1114120 () Bool)

(declare-fun e!635266 () Bool)

(assert (=> b!1114120 (= e!635266 (not true))))

(declare-datatypes ((array!72391 0))(
  ( (array!72392 (arr!34842 (Array (_ BitVec 32) (_ BitVec 64))) (size!35379 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72391)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72391 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114120 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36497 0))(
  ( (Unit!36498) )
))
(declare-fun lt!497089 () Unit!36497)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72391 (_ BitVec 64) (_ BitVec 32)) Unit!36497)

(assert (=> b!1114120 (= lt!497089 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114121 () Bool)

(declare-fun res!743161 () Bool)

(assert (=> b!1114121 (=> (not res!743161) (not e!635266))))

(declare-fun lt!497088 () array!72391)

(declare-datatypes ((List!24317 0))(
  ( (Nil!24314) (Cons!24313 (h!25531 (_ BitVec 64)) (t!34790 List!24317)) )
))
(declare-fun arrayNoDuplicates!0 (array!72391 (_ BitVec 32) List!24317) Bool)

(assert (=> b!1114121 (= res!743161 (arrayNoDuplicates!0 lt!497088 #b00000000000000000000000000000000 Nil!24314))))

(declare-fun mapNonEmpty!43399 () Bool)

(declare-fun mapRes!43399 () Bool)

(declare-fun tp!82643 () Bool)

(declare-fun e!635264 () Bool)

(assert (=> mapNonEmpty!43399 (= mapRes!43399 (and tp!82643 e!635264))))

(declare-fun mapKey!43399 () (_ BitVec 32))

(declare-datatypes ((V!42089 0))(
  ( (V!42090 (val!13917 Int)) )
))
(declare-datatypes ((ValueCell!13151 0))(
  ( (ValueCellFull!13151 (v!16546 V!42089)) (EmptyCell!13151) )
))
(declare-fun mapValue!43399 () ValueCell!13151)

(declare-fun mapRest!43399 () (Array (_ BitVec 32) ValueCell!13151))

(declare-datatypes ((array!72393 0))(
  ( (array!72394 (arr!34843 (Array (_ BitVec 32) ValueCell!13151)) (size!35380 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72393)

(assert (=> mapNonEmpty!43399 (= (arr!34843 _values!996) (store mapRest!43399 mapKey!43399 mapValue!43399))))

(declare-fun b!1114122 () Bool)

(declare-fun res!743162 () Bool)

(declare-fun e!635268 () Bool)

(assert (=> b!1114122 (=> (not res!743162) (not e!635268))))

(assert (=> b!1114122 (= res!743162 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35379 _keys!1208))))))

(declare-fun b!1114123 () Bool)

(declare-fun res!743155 () Bool)

(assert (=> b!1114123 (=> (not res!743155) (not e!635268))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114123 (= res!743155 (validMask!0 mask!1564))))

(declare-fun res!743156 () Bool)

(assert (=> start!97726 (=> (not res!743156) (not e!635268))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97726 (= res!743156 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35379 _keys!1208))))))

(assert (=> start!97726 e!635268))

(declare-fun array_inv!26844 (array!72391) Bool)

(assert (=> start!97726 (array_inv!26844 _keys!1208)))

(assert (=> start!97726 true))

(declare-fun e!635267 () Bool)

(declare-fun array_inv!26845 (array!72393) Bool)

(assert (=> start!97726 (and (array_inv!26845 _values!996) e!635267)))

(declare-fun b!1114124 () Bool)

(declare-fun res!743163 () Bool)

(assert (=> b!1114124 (=> (not res!743163) (not e!635268))))

(assert (=> b!1114124 (= res!743163 (= (select (arr!34842 _keys!1208) i!673) k0!934))))

(declare-fun b!1114125 () Bool)

(declare-fun tp_is_empty!27721 () Bool)

(assert (=> b!1114125 (= e!635264 tp_is_empty!27721)))

(declare-fun b!1114126 () Bool)

(declare-fun res!743158 () Bool)

(assert (=> b!1114126 (=> (not res!743158) (not e!635268))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114126 (= res!743158 (and (= (size!35380 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35379 _keys!1208) (size!35380 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114127 () Bool)

(declare-fun res!743164 () Bool)

(assert (=> b!1114127 (=> (not res!743164) (not e!635268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114127 (= res!743164 (validKeyInArray!0 k0!934))))

(declare-fun b!1114128 () Bool)

(declare-fun res!743157 () Bool)

(assert (=> b!1114128 (=> (not res!743157) (not e!635268))))

(assert (=> b!1114128 (= res!743157 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24314))))

(declare-fun mapIsEmpty!43399 () Bool)

(assert (=> mapIsEmpty!43399 mapRes!43399))

(declare-fun b!1114129 () Bool)

(assert (=> b!1114129 (= e!635268 e!635266)))

(declare-fun res!743160 () Bool)

(assert (=> b!1114129 (=> (not res!743160) (not e!635266))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72391 (_ BitVec 32)) Bool)

(assert (=> b!1114129 (= res!743160 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497088 mask!1564))))

(assert (=> b!1114129 (= lt!497088 (array!72392 (store (arr!34842 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35379 _keys!1208)))))

(declare-fun b!1114130 () Bool)

(declare-fun e!635263 () Bool)

(assert (=> b!1114130 (= e!635263 tp_is_empty!27721)))

(declare-fun b!1114131 () Bool)

(declare-fun res!743159 () Bool)

(assert (=> b!1114131 (=> (not res!743159) (not e!635268))))

(assert (=> b!1114131 (= res!743159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114132 () Bool)

(assert (=> b!1114132 (= e!635267 (and e!635263 mapRes!43399))))

(declare-fun condMapEmpty!43399 () Bool)

(declare-fun mapDefault!43399 () ValueCell!13151)

(assert (=> b!1114132 (= condMapEmpty!43399 (= (arr!34843 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13151)) mapDefault!43399)))))

(assert (= (and start!97726 res!743156) b!1114123))

(assert (= (and b!1114123 res!743155) b!1114126))

(assert (= (and b!1114126 res!743158) b!1114131))

(assert (= (and b!1114131 res!743159) b!1114128))

(assert (= (and b!1114128 res!743157) b!1114122))

(assert (= (and b!1114122 res!743162) b!1114127))

(assert (= (and b!1114127 res!743164) b!1114124))

(assert (= (and b!1114124 res!743163) b!1114129))

(assert (= (and b!1114129 res!743160) b!1114121))

(assert (= (and b!1114121 res!743161) b!1114120))

(assert (= (and b!1114132 condMapEmpty!43399) mapIsEmpty!43399))

(assert (= (and b!1114132 (not condMapEmpty!43399)) mapNonEmpty!43399))

(get-info :version)

(assert (= (and mapNonEmpty!43399 ((_ is ValueCellFull!13151) mapValue!43399)) b!1114125))

(assert (= (and b!1114132 ((_ is ValueCellFull!13151) mapDefault!43399)) b!1114130))

(assert (= start!97726 b!1114132))

(declare-fun m!1031889 () Bool)

(assert (=> start!97726 m!1031889))

(declare-fun m!1031891 () Bool)

(assert (=> start!97726 m!1031891))

(declare-fun m!1031893 () Bool)

(assert (=> b!1114131 m!1031893))

(declare-fun m!1031895 () Bool)

(assert (=> mapNonEmpty!43399 m!1031895))

(declare-fun m!1031897 () Bool)

(assert (=> b!1114120 m!1031897))

(declare-fun m!1031899 () Bool)

(assert (=> b!1114120 m!1031899))

(declare-fun m!1031901 () Bool)

(assert (=> b!1114129 m!1031901))

(declare-fun m!1031903 () Bool)

(assert (=> b!1114129 m!1031903))

(declare-fun m!1031905 () Bool)

(assert (=> b!1114128 m!1031905))

(declare-fun m!1031907 () Bool)

(assert (=> b!1114124 m!1031907))

(declare-fun m!1031909 () Bool)

(assert (=> b!1114123 m!1031909))

(declare-fun m!1031911 () Bool)

(assert (=> b!1114121 m!1031911))

(declare-fun m!1031913 () Bool)

(assert (=> b!1114127 m!1031913))

(check-sat (not b!1114131) (not b!1114123) (not b!1114121) (not b!1114128) (not mapNonEmpty!43399) (not b!1114127) (not start!97726) tp_is_empty!27721 (not b!1114129) (not b!1114120))
(check-sat)
