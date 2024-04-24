; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97936 () Bool)

(assert start!97936)

(declare-fun b!1118215 () Bool)

(declare-fun res!746310 () Bool)

(declare-fun e!637157 () Bool)

(assert (=> b!1118215 (=> (not res!746310) (not e!637157))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!72799 0))(
  ( (array!72800 (arr!35046 (Array (_ BitVec 32) (_ BitVec 64))) (size!35583 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72799)

(assert (=> b!1118215 (= res!746310 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35583 _keys!1208))))))

(declare-fun b!1118216 () Bool)

(declare-fun res!746305 () Bool)

(assert (=> b!1118216 (=> (not res!746305) (not e!637157))))

(declare-datatypes ((List!24399 0))(
  ( (Nil!24396) (Cons!24395 (h!25613 (_ BitVec 64)) (t!34872 List!24399)) )
))
(declare-fun arrayNoDuplicates!0 (array!72799 (_ BitVec 32) List!24399) Bool)

(assert (=> b!1118216 (= res!746305 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24396))))

(declare-fun res!746312 () Bool)

(assert (=> start!97936 (=> (not res!746312) (not e!637157))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97936 (= res!746312 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35583 _keys!1208))))))

(assert (=> start!97936 e!637157))

(declare-fun array_inv!27000 (array!72799) Bool)

(assert (=> start!97936 (array_inv!27000 _keys!1208)))

(assert (=> start!97936 true))

(declare-datatypes ((V!42369 0))(
  ( (V!42370 (val!14022 Int)) )
))
(declare-datatypes ((ValueCell!13256 0))(
  ( (ValueCellFull!13256 (v!16651 V!42369)) (EmptyCell!13256) )
))
(declare-datatypes ((array!72801 0))(
  ( (array!72802 (arr!35047 (Array (_ BitVec 32) ValueCell!13256)) (size!35584 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72801)

(declare-fun e!637158 () Bool)

(declare-fun array_inv!27001 (array!72801) Bool)

(assert (=> start!97936 (and (array_inv!27001 _values!996) e!637158)))

(declare-fun b!1118217 () Bool)

(declare-fun res!746306 () Bool)

(assert (=> b!1118217 (=> (not res!746306) (not e!637157))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1118217 (= res!746306 (= (select (arr!35046 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!43714 () Bool)

(declare-fun mapRes!43714 () Bool)

(assert (=> mapIsEmpty!43714 mapRes!43714))

(declare-fun b!1118218 () Bool)

(declare-fun res!746308 () Bool)

(declare-fun e!637153 () Bool)

(assert (=> b!1118218 (=> (not res!746308) (not e!637153))))

(declare-fun lt!497718 () array!72799)

(assert (=> b!1118218 (= res!746308 (arrayNoDuplicates!0 lt!497718 #b00000000000000000000000000000000 Nil!24396))))

(declare-fun b!1118219 () Bool)

(declare-fun res!746311 () Bool)

(assert (=> b!1118219 (=> (not res!746311) (not e!637157))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1118219 (= res!746311 (and (= (size!35584 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35583 _keys!1208) (size!35584 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1118220 () Bool)

(declare-fun res!746313 () Bool)

(assert (=> b!1118220 (=> (not res!746313) (not e!637157))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1118220 (= res!746313 (validKeyInArray!0 k0!934))))

(declare-fun b!1118221 () Bool)

(declare-fun res!746307 () Bool)

(assert (=> b!1118221 (=> (not res!746307) (not e!637157))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72799 (_ BitVec 32)) Bool)

(assert (=> b!1118221 (= res!746307 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1118222 () Bool)

(assert (=> b!1118222 (= e!637157 e!637153)))

(declare-fun res!746314 () Bool)

(assert (=> b!1118222 (=> (not res!746314) (not e!637153))))

(assert (=> b!1118222 (= res!746314 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497718 mask!1564))))

(assert (=> b!1118222 (= lt!497718 (array!72800 (store (arr!35046 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35583 _keys!1208)))))

(declare-fun b!1118223 () Bool)

(assert (=> b!1118223 (= e!637153 (not true))))

(declare-fun arrayContainsKey!0 (array!72799 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1118223 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36629 0))(
  ( (Unit!36630) )
))
(declare-fun lt!497719 () Unit!36629)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72799 (_ BitVec 64) (_ BitVec 32)) Unit!36629)

(assert (=> b!1118223 (= lt!497719 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1118224 () Bool)

(declare-fun e!637154 () Bool)

(assert (=> b!1118224 (= e!637158 (and e!637154 mapRes!43714))))

(declare-fun condMapEmpty!43714 () Bool)

(declare-fun mapDefault!43714 () ValueCell!13256)

(assert (=> b!1118224 (= condMapEmpty!43714 (= (arr!35047 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13256)) mapDefault!43714)))))

(declare-fun b!1118225 () Bool)

(declare-fun res!746309 () Bool)

(assert (=> b!1118225 (=> (not res!746309) (not e!637157))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1118225 (= res!746309 (validMask!0 mask!1564))))

(declare-fun b!1118226 () Bool)

(declare-fun e!637156 () Bool)

(declare-fun tp_is_empty!27931 () Bool)

(assert (=> b!1118226 (= e!637156 tp_is_empty!27931)))

(declare-fun b!1118227 () Bool)

(assert (=> b!1118227 (= e!637154 tp_is_empty!27931)))

(declare-fun mapNonEmpty!43714 () Bool)

(declare-fun tp!82958 () Bool)

(assert (=> mapNonEmpty!43714 (= mapRes!43714 (and tp!82958 e!637156))))

(declare-fun mapValue!43714 () ValueCell!13256)

(declare-fun mapRest!43714 () (Array (_ BitVec 32) ValueCell!13256))

(declare-fun mapKey!43714 () (_ BitVec 32))

(assert (=> mapNonEmpty!43714 (= (arr!35047 _values!996) (store mapRest!43714 mapKey!43714 mapValue!43714))))

(assert (= (and start!97936 res!746312) b!1118225))

(assert (= (and b!1118225 res!746309) b!1118219))

(assert (= (and b!1118219 res!746311) b!1118221))

(assert (= (and b!1118221 res!746307) b!1118216))

(assert (= (and b!1118216 res!746305) b!1118215))

(assert (= (and b!1118215 res!746310) b!1118220))

(assert (= (and b!1118220 res!746313) b!1118217))

(assert (= (and b!1118217 res!746306) b!1118222))

(assert (= (and b!1118222 res!746314) b!1118218))

(assert (= (and b!1118218 res!746308) b!1118223))

(assert (= (and b!1118224 condMapEmpty!43714) mapIsEmpty!43714))

(assert (= (and b!1118224 (not condMapEmpty!43714)) mapNonEmpty!43714))

(get-info :version)

(assert (= (and mapNonEmpty!43714 ((_ is ValueCellFull!13256) mapValue!43714)) b!1118226))

(assert (= (and b!1118224 ((_ is ValueCellFull!13256) mapDefault!43714)) b!1118227))

(assert (= start!97936 b!1118224))

(declare-fun m!1034619 () Bool)

(assert (=> b!1118218 m!1034619))

(declare-fun m!1034621 () Bool)

(assert (=> mapNonEmpty!43714 m!1034621))

(declare-fun m!1034623 () Bool)

(assert (=> b!1118216 m!1034623))

(declare-fun m!1034625 () Bool)

(assert (=> b!1118221 m!1034625))

(declare-fun m!1034627 () Bool)

(assert (=> b!1118222 m!1034627))

(declare-fun m!1034629 () Bool)

(assert (=> b!1118222 m!1034629))

(declare-fun m!1034631 () Bool)

(assert (=> start!97936 m!1034631))

(declare-fun m!1034633 () Bool)

(assert (=> start!97936 m!1034633))

(declare-fun m!1034635 () Bool)

(assert (=> b!1118225 m!1034635))

(declare-fun m!1034637 () Bool)

(assert (=> b!1118220 m!1034637))

(declare-fun m!1034639 () Bool)

(assert (=> b!1118223 m!1034639))

(declare-fun m!1034641 () Bool)

(assert (=> b!1118223 m!1034641))

(declare-fun m!1034643 () Bool)

(assert (=> b!1118217 m!1034643))

(check-sat (not mapNonEmpty!43714) (not b!1118216) (not b!1118218) (not b!1118221) (not start!97936) (not b!1118220) (not b!1118223) (not b!1118225) tp_is_empty!27931 (not b!1118222))
(check-sat)
