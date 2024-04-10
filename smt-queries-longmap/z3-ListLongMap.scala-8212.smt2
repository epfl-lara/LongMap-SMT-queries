; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100140 () Bool)

(assert start!100140)

(declare-fun b!1194275 () Bool)

(declare-fun res!794600 () Bool)

(declare-fun e!678723 () Bool)

(assert (=> b!1194275 (=> (not res!794600) (not e!678723))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1194275 (= res!794600 (validKeyInArray!0 k0!934))))

(declare-fun b!1194276 () Bool)

(declare-fun res!794608 () Bool)

(assert (=> b!1194276 (=> (not res!794608) (not e!678723))))

(declare-datatypes ((array!77277 0))(
  ( (array!77278 (arr!37288 (Array (_ BitVec 32) (_ BitVec 64))) (size!37824 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77277)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1194276 (= res!794608 (= (select (arr!37288 _keys!1208) i!673) k0!934))))

(declare-fun b!1194277 () Bool)

(declare-fun res!794604 () Bool)

(assert (=> b!1194277 (=> (not res!794604) (not e!678723))))

(declare-datatypes ((List!26258 0))(
  ( (Nil!26255) (Cons!26254 (h!27463 (_ BitVec 64)) (t!38929 List!26258)) )
))
(declare-fun arrayNoDuplicates!0 (array!77277 (_ BitVec 32) List!26258) Bool)

(assert (=> b!1194277 (= res!794604 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26255))))

(declare-fun b!1194278 () Bool)

(declare-fun e!678725 () Bool)

(declare-fun tp_is_empty!30249 () Bool)

(assert (=> b!1194278 (= e!678725 tp_is_empty!30249)))

(declare-fun b!1194279 () Bool)

(declare-fun res!794603 () Bool)

(assert (=> b!1194279 (=> (not res!794603) (not e!678723))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1194279 (= res!794603 (validMask!0 mask!1564))))

(declare-fun b!1194280 () Bool)

(declare-fun res!794605 () Bool)

(assert (=> b!1194280 (=> (not res!794605) (not e!678723))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!45459 0))(
  ( (V!45460 (val!15181 Int)) )
))
(declare-datatypes ((ValueCell!14415 0))(
  ( (ValueCellFull!14415 (v!17819 V!45459)) (EmptyCell!14415) )
))
(declare-datatypes ((array!77279 0))(
  ( (array!77280 (arr!37289 (Array (_ BitVec 32) ValueCell!14415)) (size!37825 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77279)

(assert (=> b!1194280 (= res!794605 (and (= (size!37825 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37824 _keys!1208) (size!37825 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1194281 () Bool)

(declare-fun res!794602 () Bool)

(assert (=> b!1194281 (=> (not res!794602) (not e!678723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77277 (_ BitVec 32)) Bool)

(assert (=> b!1194281 (= res!794602 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!47201 () Bool)

(declare-fun mapRes!47201 () Bool)

(declare-fun tp!89811 () Bool)

(assert (=> mapNonEmpty!47201 (= mapRes!47201 (and tp!89811 e!678725))))

(declare-fun mapRest!47201 () (Array (_ BitVec 32) ValueCell!14415))

(declare-fun mapKey!47201 () (_ BitVec 32))

(declare-fun mapValue!47201 () ValueCell!14415)

(assert (=> mapNonEmpty!47201 (= (arr!37289 _values!996) (store mapRest!47201 mapKey!47201 mapValue!47201))))

(declare-fun b!1194282 () Bool)

(declare-fun e!678722 () Bool)

(assert (=> b!1194282 (= e!678722 tp_is_empty!30249)))

(declare-fun b!1194274 () Bool)

(declare-fun e!678724 () Bool)

(assert (=> b!1194274 (= e!678723 e!678724)))

(declare-fun res!794601 () Bool)

(assert (=> b!1194274 (=> (not res!794601) (not e!678724))))

(declare-fun lt!542751 () array!77277)

(assert (=> b!1194274 (= res!794601 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!542751 mask!1564))))

(assert (=> b!1194274 (= lt!542751 (array!77278 (store (arr!37288 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37824 _keys!1208)))))

(declare-fun res!794606 () Bool)

(assert (=> start!100140 (=> (not res!794606) (not e!678723))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100140 (= res!794606 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37824 _keys!1208))))))

(assert (=> start!100140 e!678723))

(declare-fun array_inv!28426 (array!77277) Bool)

(assert (=> start!100140 (array_inv!28426 _keys!1208)))

(assert (=> start!100140 true))

(declare-fun e!678726 () Bool)

(declare-fun array_inv!28427 (array!77279) Bool)

(assert (=> start!100140 (and (array_inv!28427 _values!996) e!678726)))

(declare-fun b!1194283 () Bool)

(assert (=> b!1194283 (= e!678726 (and e!678722 mapRes!47201))))

(declare-fun condMapEmpty!47201 () Bool)

(declare-fun mapDefault!47201 () ValueCell!14415)

(assert (=> b!1194283 (= condMapEmpty!47201 (= (arr!37289 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14415)) mapDefault!47201)))))

(declare-fun mapIsEmpty!47201 () Bool)

(assert (=> mapIsEmpty!47201 mapRes!47201))

(declare-fun b!1194284 () Bool)

(declare-fun res!794607 () Bool)

(assert (=> b!1194284 (=> (not res!794607) (not e!678723))))

(assert (=> b!1194284 (= res!794607 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37824 _keys!1208))))))

(declare-fun b!1194285 () Bool)

(assert (=> b!1194285 (= e!678724 false)))

(declare-fun lt!542750 () Bool)

(assert (=> b!1194285 (= lt!542750 (arrayNoDuplicates!0 lt!542751 #b00000000000000000000000000000000 Nil!26255))))

(assert (= (and start!100140 res!794606) b!1194279))

(assert (= (and b!1194279 res!794603) b!1194280))

(assert (= (and b!1194280 res!794605) b!1194281))

(assert (= (and b!1194281 res!794602) b!1194277))

(assert (= (and b!1194277 res!794604) b!1194284))

(assert (= (and b!1194284 res!794607) b!1194275))

(assert (= (and b!1194275 res!794600) b!1194276))

(assert (= (and b!1194276 res!794608) b!1194274))

(assert (= (and b!1194274 res!794601) b!1194285))

(assert (= (and b!1194283 condMapEmpty!47201) mapIsEmpty!47201))

(assert (= (and b!1194283 (not condMapEmpty!47201)) mapNonEmpty!47201))

(get-info :version)

(assert (= (and mapNonEmpty!47201 ((_ is ValueCellFull!14415) mapValue!47201)) b!1194278))

(assert (= (and b!1194283 ((_ is ValueCellFull!14415) mapDefault!47201)) b!1194282))

(assert (= start!100140 b!1194283))

(declare-fun m!1102249 () Bool)

(assert (=> b!1194281 m!1102249))

(declare-fun m!1102251 () Bool)

(assert (=> mapNonEmpty!47201 m!1102251))

(declare-fun m!1102253 () Bool)

(assert (=> b!1194279 m!1102253))

(declare-fun m!1102255 () Bool)

(assert (=> b!1194274 m!1102255))

(declare-fun m!1102257 () Bool)

(assert (=> b!1194274 m!1102257))

(declare-fun m!1102259 () Bool)

(assert (=> b!1194276 m!1102259))

(declare-fun m!1102261 () Bool)

(assert (=> b!1194275 m!1102261))

(declare-fun m!1102263 () Bool)

(assert (=> b!1194277 m!1102263))

(declare-fun m!1102265 () Bool)

(assert (=> b!1194285 m!1102265))

(declare-fun m!1102267 () Bool)

(assert (=> start!100140 m!1102267))

(declare-fun m!1102269 () Bool)

(assert (=> start!100140 m!1102269))

(check-sat (not b!1194281) tp_is_empty!30249 (not b!1194285) (not b!1194279) (not b!1194274) (not mapNonEmpty!47201) (not b!1194275) (not start!100140) (not b!1194277))
(check-sat)
