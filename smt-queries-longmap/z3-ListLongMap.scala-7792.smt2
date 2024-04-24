; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97732 () Bool)

(assert start!97732)

(declare-fun b!1114237 () Bool)

(declare-fun e!635318 () Bool)

(declare-fun e!635319 () Bool)

(declare-fun mapRes!43408 () Bool)

(assert (=> b!1114237 (= e!635318 (and e!635319 mapRes!43408))))

(declare-fun condMapEmpty!43408 () Bool)

(declare-datatypes ((V!42097 0))(
  ( (V!42098 (val!13920 Int)) )
))
(declare-datatypes ((ValueCell!13154 0))(
  ( (ValueCellFull!13154 (v!16549 V!42097)) (EmptyCell!13154) )
))
(declare-datatypes ((array!72403 0))(
  ( (array!72404 (arr!34848 (Array (_ BitVec 32) ValueCell!13154)) (size!35385 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72403)

(declare-fun mapDefault!43408 () ValueCell!13154)

(assert (=> b!1114237 (= condMapEmpty!43408 (= (arr!34848 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13154)) mapDefault!43408)))))

(declare-fun b!1114238 () Bool)

(declare-fun e!635322 () Bool)

(assert (=> b!1114238 (= e!635322 (not true))))

(declare-datatypes ((array!72405 0))(
  ( (array!72406 (arr!34849 (Array (_ BitVec 32) (_ BitVec 64))) (size!35386 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72405)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!72405 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1114238 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!36501 0))(
  ( (Unit!36502) )
))
(declare-fun lt!497107 () Unit!36501)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72405 (_ BitVec 64) (_ BitVec 32)) Unit!36501)

(assert (=> b!1114238 (= lt!497107 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1114239 () Bool)

(declare-fun tp_is_empty!27727 () Bool)

(assert (=> b!1114239 (= e!635319 tp_is_empty!27727)))

(declare-fun mapNonEmpty!43408 () Bool)

(declare-fun tp!82652 () Bool)

(declare-fun e!635320 () Bool)

(assert (=> mapNonEmpty!43408 (= mapRes!43408 (and tp!82652 e!635320))))

(declare-fun mapValue!43408 () ValueCell!13154)

(declare-fun mapRest!43408 () (Array (_ BitVec 32) ValueCell!13154))

(declare-fun mapKey!43408 () (_ BitVec 32))

(assert (=> mapNonEmpty!43408 (= (arr!34848 _values!996) (store mapRest!43408 mapKey!43408 mapValue!43408))))

(declare-fun mapIsEmpty!43408 () Bool)

(assert (=> mapIsEmpty!43408 mapRes!43408))

(declare-fun res!743249 () Bool)

(declare-fun e!635321 () Bool)

(assert (=> start!97732 (=> (not res!743249) (not e!635321))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97732 (= res!743249 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35386 _keys!1208))))))

(assert (=> start!97732 e!635321))

(declare-fun array_inv!26850 (array!72405) Bool)

(assert (=> start!97732 (array_inv!26850 _keys!1208)))

(assert (=> start!97732 true))

(declare-fun array_inv!26851 (array!72403) Bool)

(assert (=> start!97732 (and (array_inv!26851 _values!996) e!635318)))

(declare-fun b!1114240 () Bool)

(declare-fun res!743250 () Bool)

(assert (=> b!1114240 (=> (not res!743250) (not e!635322))))

(declare-fun lt!497106 () array!72405)

(declare-datatypes ((List!24319 0))(
  ( (Nil!24316) (Cons!24315 (h!25533 (_ BitVec 64)) (t!34792 List!24319)) )
))
(declare-fun arrayNoDuplicates!0 (array!72405 (_ BitVec 32) List!24319) Bool)

(assert (=> b!1114240 (= res!743250 (arrayNoDuplicates!0 lt!497106 #b00000000000000000000000000000000 Nil!24316))))

(declare-fun b!1114241 () Bool)

(declare-fun res!743251 () Bool)

(assert (=> b!1114241 (=> (not res!743251) (not e!635321))))

(assert (=> b!1114241 (= res!743251 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24316))))

(declare-fun b!1114242 () Bool)

(assert (=> b!1114242 (= e!635320 tp_is_empty!27727)))

(declare-fun b!1114243 () Bool)

(declare-fun res!743252 () Bool)

(assert (=> b!1114243 (=> (not res!743252) (not e!635321))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72405 (_ BitVec 32)) Bool)

(assert (=> b!1114243 (= res!743252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1114244 () Bool)

(declare-fun res!743253 () Bool)

(assert (=> b!1114244 (=> (not res!743253) (not e!635321))))

(assert (=> b!1114244 (= res!743253 (= (select (arr!34849 _keys!1208) i!673) k0!934))))

(declare-fun b!1114245 () Bool)

(assert (=> b!1114245 (= e!635321 e!635322)))

(declare-fun res!743247 () Bool)

(assert (=> b!1114245 (=> (not res!743247) (not e!635322))))

(assert (=> b!1114245 (= res!743247 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497106 mask!1564))))

(assert (=> b!1114245 (= lt!497106 (array!72406 (store (arr!34849 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35386 _keys!1208)))))

(declare-fun b!1114246 () Bool)

(declare-fun res!743246 () Bool)

(assert (=> b!1114246 (=> (not res!743246) (not e!635321))))

(assert (=> b!1114246 (= res!743246 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35386 _keys!1208))))))

(declare-fun b!1114247 () Bool)

(declare-fun res!743248 () Bool)

(assert (=> b!1114247 (=> (not res!743248) (not e!635321))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1114247 (= res!743248 (and (= (size!35385 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35386 _keys!1208) (size!35385 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1114248 () Bool)

(declare-fun res!743245 () Bool)

(assert (=> b!1114248 (=> (not res!743245) (not e!635321))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1114248 (= res!743245 (validKeyInArray!0 k0!934))))

(declare-fun b!1114249 () Bool)

(declare-fun res!743254 () Bool)

(assert (=> b!1114249 (=> (not res!743254) (not e!635321))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1114249 (= res!743254 (validMask!0 mask!1564))))

(assert (= (and start!97732 res!743249) b!1114249))

(assert (= (and b!1114249 res!743254) b!1114247))

(assert (= (and b!1114247 res!743248) b!1114243))

(assert (= (and b!1114243 res!743252) b!1114241))

(assert (= (and b!1114241 res!743251) b!1114246))

(assert (= (and b!1114246 res!743246) b!1114248))

(assert (= (and b!1114248 res!743245) b!1114244))

(assert (= (and b!1114244 res!743253) b!1114245))

(assert (= (and b!1114245 res!743247) b!1114240))

(assert (= (and b!1114240 res!743250) b!1114238))

(assert (= (and b!1114237 condMapEmpty!43408) mapIsEmpty!43408))

(assert (= (and b!1114237 (not condMapEmpty!43408)) mapNonEmpty!43408))

(get-info :version)

(assert (= (and mapNonEmpty!43408 ((_ is ValueCellFull!13154) mapValue!43408)) b!1114242))

(assert (= (and b!1114237 ((_ is ValueCellFull!13154) mapDefault!43408)) b!1114239))

(assert (= start!97732 b!1114237))

(declare-fun m!1031967 () Bool)

(assert (=> b!1114243 m!1031967))

(declare-fun m!1031969 () Bool)

(assert (=> b!1114240 m!1031969))

(declare-fun m!1031971 () Bool)

(assert (=> b!1114238 m!1031971))

(declare-fun m!1031973 () Bool)

(assert (=> b!1114238 m!1031973))

(declare-fun m!1031975 () Bool)

(assert (=> b!1114244 m!1031975))

(declare-fun m!1031977 () Bool)

(assert (=> b!1114241 m!1031977))

(declare-fun m!1031979 () Bool)

(assert (=> start!97732 m!1031979))

(declare-fun m!1031981 () Bool)

(assert (=> start!97732 m!1031981))

(declare-fun m!1031983 () Bool)

(assert (=> b!1114249 m!1031983))

(declare-fun m!1031985 () Bool)

(assert (=> b!1114248 m!1031985))

(declare-fun m!1031987 () Bool)

(assert (=> mapNonEmpty!43408 m!1031987))

(declare-fun m!1031989 () Bool)

(assert (=> b!1114245 m!1031989))

(declare-fun m!1031991 () Bool)

(assert (=> b!1114245 m!1031991))

(check-sat (not b!1114245) (not b!1114248) (not b!1114241) (not b!1114249) (not b!1114243) (not mapNonEmpty!43408) (not start!97732) (not b!1114240) (not b!1114238) tp_is_empty!27727)
(check-sat)
