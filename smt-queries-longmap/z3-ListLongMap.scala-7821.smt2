; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97664 () Bool)

(assert start!97664)

(declare-fun mapNonEmpty!43669 () Bool)

(declare-fun mapRes!43669 () Bool)

(declare-fun tp!82913 () Bool)

(declare-fun e!635947 () Bool)

(assert (=> mapNonEmpty!43669 (= mapRes!43669 (and tp!82913 e!635947))))

(declare-datatypes ((V!42329 0))(
  ( (V!42330 (val!14007 Int)) )
))
(declare-datatypes ((ValueCell!13241 0))(
  ( (ValueCellFull!13241 (v!16639 V!42329)) (EmptyCell!13241) )
))
(declare-fun mapValue!43669 () ValueCell!13241)

(declare-fun mapKey!43669 () (_ BitVec 32))

(declare-datatypes ((array!72600 0))(
  ( (array!72601 (arr!34953 (Array (_ BitVec 32) ValueCell!13241)) (size!35491 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72600)

(declare-fun mapRest!43669 () (Array (_ BitVec 32) ValueCell!13241))

(assert (=> mapNonEmpty!43669 (= (arr!34953 _values!996) (store mapRest!43669 mapKey!43669 mapValue!43669))))

(declare-fun mapIsEmpty!43669 () Bool)

(assert (=> mapIsEmpty!43669 mapRes!43669))

(declare-fun b!1116174 () Bool)

(declare-fun res!745266 () Bool)

(declare-fun e!635951 () Bool)

(assert (=> b!1116174 (=> (not res!745266) (not e!635951))))

(declare-datatypes ((array!72602 0))(
  ( (array!72603 (arr!34954 (Array (_ BitVec 32) (_ BitVec 64))) (size!35492 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72602)

(declare-datatypes ((List!24399 0))(
  ( (Nil!24396) (Cons!24395 (h!25604 (_ BitVec 64)) (t!34871 List!24399)) )
))
(declare-fun arrayNoDuplicates!0 (array!72602 (_ BitVec 32) List!24399) Bool)

(assert (=> b!1116174 (= res!745266 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24396))))

(declare-fun b!1116175 () Bool)

(declare-fun e!635948 () Bool)

(declare-fun tp_is_empty!27901 () Bool)

(assert (=> b!1116175 (= e!635948 tp_is_empty!27901)))

(declare-fun b!1116176 () Bool)

(declare-fun e!635950 () Bool)

(assert (=> b!1116176 (= e!635950 (not true))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72602 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116176 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36457 0))(
  ( (Unit!36458) )
))
(declare-fun lt!496913 () Unit!36457)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72602 (_ BitVec 64) (_ BitVec 32)) Unit!36457)

(assert (=> b!1116176 (= lt!496913 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116177 () Bool)

(declare-fun res!745272 () Bool)

(assert (=> b!1116177 (=> (not res!745272) (not e!635950))))

(declare-fun lt!496914 () array!72602)

(assert (=> b!1116177 (= res!745272 (arrayNoDuplicates!0 lt!496914 #b00000000000000000000000000000000 Nil!24396))))

(declare-fun b!1116178 () Bool)

(assert (=> b!1116178 (= e!635951 e!635950)))

(declare-fun res!745268 () Bool)

(assert (=> b!1116178 (=> (not res!745268) (not e!635950))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72602 (_ BitVec 32)) Bool)

(assert (=> b!1116178 (= res!745268 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496914 mask!1564))))

(assert (=> b!1116178 (= lt!496914 (array!72603 (store (arr!34954 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35492 _keys!1208)))))

(declare-fun b!1116179 () Bool)

(declare-fun res!745271 () Bool)

(assert (=> b!1116179 (=> (not res!745271) (not e!635951))))

(assert (=> b!1116179 (= res!745271 (= (select (arr!34954 _keys!1208) i!673) k0!934))))

(declare-fun b!1116180 () Bool)

(declare-fun res!745269 () Bool)

(assert (=> b!1116180 (=> (not res!745269) (not e!635951))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116180 (= res!745269 (validKeyInArray!0 k0!934))))

(declare-fun b!1116181 () Bool)

(assert (=> b!1116181 (= e!635947 tp_is_empty!27901)))

(declare-fun b!1116182 () Bool)

(declare-fun res!745264 () Bool)

(assert (=> b!1116182 (=> (not res!745264) (not e!635951))))

(assert (=> b!1116182 (= res!745264 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun res!745267 () Bool)

(assert (=> start!97664 (=> (not res!745267) (not e!635951))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97664 (= res!745267 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35492 _keys!1208))))))

(assert (=> start!97664 e!635951))

(declare-fun array_inv!26934 (array!72602) Bool)

(assert (=> start!97664 (array_inv!26934 _keys!1208)))

(assert (=> start!97664 true))

(declare-fun e!635949 () Bool)

(declare-fun array_inv!26935 (array!72600) Bool)

(assert (=> start!97664 (and (array_inv!26935 _values!996) e!635949)))

(declare-fun b!1116183 () Bool)

(declare-fun res!745270 () Bool)

(assert (=> b!1116183 (=> (not res!745270) (not e!635951))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116183 (= res!745270 (and (= (size!35491 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35492 _keys!1208) (size!35491 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116184 () Bool)

(assert (=> b!1116184 (= e!635949 (and e!635948 mapRes!43669))))

(declare-fun condMapEmpty!43669 () Bool)

(declare-fun mapDefault!43669 () ValueCell!13241)

(assert (=> b!1116184 (= condMapEmpty!43669 (= (arr!34953 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13241)) mapDefault!43669)))))

(declare-fun b!1116185 () Bool)

(declare-fun res!745265 () Bool)

(assert (=> b!1116185 (=> (not res!745265) (not e!635951))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116185 (= res!745265 (validMask!0 mask!1564))))

(declare-fun b!1116186 () Bool)

(declare-fun res!745273 () Bool)

(assert (=> b!1116186 (=> (not res!745273) (not e!635951))))

(assert (=> b!1116186 (= res!745273 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35492 _keys!1208))))))

(assert (= (and start!97664 res!745267) b!1116185))

(assert (= (and b!1116185 res!745265) b!1116183))

(assert (= (and b!1116183 res!745270) b!1116182))

(assert (= (and b!1116182 res!745264) b!1116174))

(assert (= (and b!1116174 res!745266) b!1116186))

(assert (= (and b!1116186 res!745273) b!1116180))

(assert (= (and b!1116180 res!745269) b!1116179))

(assert (= (and b!1116179 res!745271) b!1116178))

(assert (= (and b!1116178 res!745268) b!1116177))

(assert (= (and b!1116177 res!745272) b!1116176))

(assert (= (and b!1116184 condMapEmpty!43669) mapIsEmpty!43669))

(assert (= (and b!1116184 (not condMapEmpty!43669)) mapNonEmpty!43669))

(get-info :version)

(assert (= (and mapNonEmpty!43669 ((_ is ValueCellFull!13241) mapValue!43669)) b!1116181))

(assert (= (and b!1116184 ((_ is ValueCellFull!13241) mapDefault!43669)) b!1116175))

(assert (= start!97664 b!1116184))

(declare-fun m!1031931 () Bool)

(assert (=> mapNonEmpty!43669 m!1031931))

(declare-fun m!1031933 () Bool)

(assert (=> b!1116180 m!1031933))

(declare-fun m!1031935 () Bool)

(assert (=> b!1116182 m!1031935))

(declare-fun m!1031937 () Bool)

(assert (=> b!1116177 m!1031937))

(declare-fun m!1031939 () Bool)

(assert (=> start!97664 m!1031939))

(declare-fun m!1031941 () Bool)

(assert (=> start!97664 m!1031941))

(declare-fun m!1031943 () Bool)

(assert (=> b!1116178 m!1031943))

(declare-fun m!1031945 () Bool)

(assert (=> b!1116178 m!1031945))

(declare-fun m!1031947 () Bool)

(assert (=> b!1116176 m!1031947))

(declare-fun m!1031949 () Bool)

(assert (=> b!1116176 m!1031949))

(declare-fun m!1031951 () Bool)

(assert (=> b!1116179 m!1031951))

(declare-fun m!1031953 () Bool)

(assert (=> b!1116185 m!1031953))

(declare-fun m!1031955 () Bool)

(assert (=> b!1116174 m!1031955))

(check-sat (not b!1116180) (not start!97664) (not b!1116182) (not b!1116178) (not mapNonEmpty!43669) tp_is_empty!27901 (not b!1116177) (not b!1116176) (not b!1116174) (not b!1116185))
(check-sat)
