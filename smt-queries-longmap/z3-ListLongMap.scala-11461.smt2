; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133514 () Bool)

(assert start!133514)

(declare-fun b_free!31981 () Bool)

(declare-fun b_next!31981 () Bool)

(assert (=> start!133514 (= b_free!31981 (not b_next!31981))))

(declare-fun tp!113067 () Bool)

(declare-fun b_and!51455 () Bool)

(assert (=> start!133514 (= tp!113067 b_and!51455)))

(declare-fun mapIsEmpty!59346 () Bool)

(declare-fun mapRes!59346 () Bool)

(assert (=> mapIsEmpty!59346 mapRes!59346))

(declare-fun b!1561187 () Bool)

(declare-fun res!1067535 () Bool)

(declare-fun e!869986 () Bool)

(assert (=> b!1561187 (=> (not res!1067535) (not e!869986))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!103924 0))(
  ( (array!103925 (arr!50155 (Array (_ BitVec 32) (_ BitVec 64))) (size!50707 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103924)

(assert (=> b!1561187 (= res!1067535 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50707 _keys!637)) (bvslt from!782 (size!50707 _keys!637))))))

(declare-fun b!1561188 () Bool)

(declare-fun e!869985 () Bool)

(declare-fun tp_is_empty!38647 () Bool)

(assert (=> b!1561188 (= e!869985 tp_is_empty!38647)))

(declare-fun res!1067538 () Bool)

(assert (=> start!133514 (=> (not res!1067538) (not e!869986))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133514 (= res!1067538 (validMask!0 mask!947))))

(assert (=> start!133514 e!869986))

(assert (=> start!133514 tp!113067))

(assert (=> start!133514 tp_is_empty!38647))

(assert (=> start!133514 true))

(declare-fun array_inv!39169 (array!103924) Bool)

(assert (=> start!133514 (array_inv!39169 _keys!637)))

(declare-datatypes ((V!59737 0))(
  ( (V!59738 (val!19407 Int)) )
))
(declare-datatypes ((ValueCell!18293 0))(
  ( (ValueCellFull!18293 (v!22155 V!59737)) (EmptyCell!18293) )
))
(declare-datatypes ((array!103926 0))(
  ( (array!103927 (arr!50156 (Array (_ BitVec 32) ValueCell!18293)) (size!50708 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103926)

(declare-fun e!869983 () Bool)

(declare-fun array_inv!39170 (array!103926) Bool)

(assert (=> start!133514 (and (array_inv!39170 _values!487) e!869983)))

(declare-fun b!1561189 () Bool)

(assert (=> b!1561189 (= e!869986 (not true))))

(declare-fun lt!670946 () V!59737)

(declare-datatypes ((tuple2!25134 0))(
  ( (tuple2!25135 (_1!12578 (_ BitVec 64)) (_2!12578 V!59737)) )
))
(declare-datatypes ((List!36473 0))(
  ( (Nil!36470) (Cons!36469 (h!37916 tuple2!25134) (t!51236 List!36473)) )
))
(declare-datatypes ((ListLongMap!22569 0))(
  ( (ListLongMap!22570 (toList!11300 List!36473)) )
))
(declare-fun lt!670944 () ListLongMap!22569)

(declare-fun contains!10210 (ListLongMap!22569 (_ BitVec 64)) Bool)

(declare-fun +!5065 (ListLongMap!22569 tuple2!25134) ListLongMap!22569)

(assert (=> b!1561189 (not (contains!10210 (+!5065 lt!670944 (tuple2!25135 (select (arr!50155 _keys!637) from!782) lt!670946)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((Unit!51738 0))(
  ( (Unit!51739) )
))
(declare-fun lt!670945 () Unit!51738)

(declare-fun addStillNotContains!512 (ListLongMap!22569 (_ BitVec 64) V!59737 (_ BitVec 64)) Unit!51738)

(assert (=> b!1561189 (= lt!670945 (addStillNotContains!512 lt!670944 (select (arr!50155 _keys!637) from!782) lt!670946 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun defaultEntry!495 () Int)

(declare-fun get!26204 (ValueCell!18293 V!59737) V!59737)

(declare-fun dynLambda!3841 (Int (_ BitVec 64)) V!59737)

(assert (=> b!1561189 (= lt!670946 (get!26204 (select (arr!50156 _values!487) from!782) (dynLambda!3841 defaultEntry!495 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!453 () V!59737)

(declare-fun minValue!453 () V!59737)

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6674 (array!103924 array!103926 (_ BitVec 32) (_ BitVec 32) V!59737 V!59737 (_ BitVec 32) Int) ListLongMap!22569)

(assert (=> b!1561189 (= lt!670944 (getCurrentListMapNoExtraKeys!6674 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1561190 () Bool)

(declare-fun res!1067537 () Bool)

(assert (=> b!1561190 (=> (not res!1067537) (not e!869986))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1561190 (= res!1067537 (validKeyInArray!0 (select (arr!50155 _keys!637) from!782)))))

(declare-fun b!1561191 () Bool)

(declare-fun res!1067534 () Bool)

(assert (=> b!1561191 (=> (not res!1067534) (not e!869986))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103924 (_ BitVec 32)) Bool)

(assert (=> b!1561191 (= res!1067534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1561192 () Bool)

(declare-fun e!869982 () Bool)

(assert (=> b!1561192 (= e!869983 (and e!869982 mapRes!59346))))

(declare-fun condMapEmpty!59346 () Bool)

(declare-fun mapDefault!59346 () ValueCell!18293)

(assert (=> b!1561192 (= condMapEmpty!59346 (= (arr!50156 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18293)) mapDefault!59346)))))

(declare-fun b!1561193 () Bool)

(declare-fun res!1067533 () Bool)

(assert (=> b!1561193 (=> (not res!1067533) (not e!869986))))

(assert (=> b!1561193 (= res!1067533 (and (= (size!50708 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50707 _keys!637) (size!50708 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59346 () Bool)

(declare-fun tp!113068 () Bool)

(assert (=> mapNonEmpty!59346 (= mapRes!59346 (and tp!113068 e!869985))))

(declare-fun mapKey!59346 () (_ BitVec 32))

(declare-fun mapRest!59346 () (Array (_ BitVec 32) ValueCell!18293))

(declare-fun mapValue!59346 () ValueCell!18293)

(assert (=> mapNonEmpty!59346 (= (arr!50156 _values!487) (store mapRest!59346 mapKey!59346 mapValue!59346))))

(declare-fun b!1561194 () Bool)

(assert (=> b!1561194 (= e!869982 tp_is_empty!38647)))

(declare-fun b!1561195 () Bool)

(declare-fun res!1067536 () Bool)

(assert (=> b!1561195 (=> (not res!1067536) (not e!869986))))

(declare-datatypes ((List!36474 0))(
  ( (Nil!36471) (Cons!36470 (h!37917 (_ BitVec 64)) (t!51237 List!36474)) )
))
(declare-fun arrayNoDuplicates!0 (array!103924 (_ BitVec 32) List!36474) Bool)

(assert (=> b!1561195 (= res!1067536 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36471))))

(assert (= (and start!133514 res!1067538) b!1561193))

(assert (= (and b!1561193 res!1067533) b!1561191))

(assert (= (and b!1561191 res!1067534) b!1561195))

(assert (= (and b!1561195 res!1067536) b!1561187))

(assert (= (and b!1561187 res!1067535) b!1561190))

(assert (= (and b!1561190 res!1067537) b!1561189))

(assert (= (and b!1561192 condMapEmpty!59346) mapIsEmpty!59346))

(assert (= (and b!1561192 (not condMapEmpty!59346)) mapNonEmpty!59346))

(get-info :version)

(assert (= (and mapNonEmpty!59346 ((_ is ValueCellFull!18293) mapValue!59346)) b!1561188))

(assert (= (and b!1561192 ((_ is ValueCellFull!18293) mapDefault!59346)) b!1561194))

(assert (= start!133514 b!1561192))

(declare-fun b_lambda!24845 () Bool)

(assert (=> (not b_lambda!24845) (not b!1561189)))

(declare-fun t!51235 () Bool)

(declare-fun tb!12517 () Bool)

(assert (=> (and start!133514 (= defaultEntry!495 defaultEntry!495) t!51235) tb!12517))

(declare-fun result!26323 () Bool)

(assert (=> tb!12517 (= result!26323 tp_is_empty!38647)))

(assert (=> b!1561189 t!51235))

(declare-fun b_and!51457 () Bool)

(assert (= b_and!51455 (and (=> t!51235 result!26323) b_and!51457)))

(declare-fun m!1436289 () Bool)

(assert (=> mapNonEmpty!59346 m!1436289))

(declare-fun m!1436291 () Bool)

(assert (=> b!1561195 m!1436291))

(declare-fun m!1436293 () Bool)

(assert (=> b!1561190 m!1436293))

(assert (=> b!1561190 m!1436293))

(declare-fun m!1436295 () Bool)

(assert (=> b!1561190 m!1436295))

(declare-fun m!1436297 () Bool)

(assert (=> start!133514 m!1436297))

(declare-fun m!1436299 () Bool)

(assert (=> start!133514 m!1436299))

(declare-fun m!1436301 () Bool)

(assert (=> start!133514 m!1436301))

(declare-fun m!1436303 () Bool)

(assert (=> b!1561191 m!1436303))

(declare-fun m!1436305 () Bool)

(assert (=> b!1561189 m!1436305))

(declare-fun m!1436307 () Bool)

(assert (=> b!1561189 m!1436307))

(declare-fun m!1436309 () Bool)

(assert (=> b!1561189 m!1436309))

(declare-fun m!1436311 () Bool)

(assert (=> b!1561189 m!1436311))

(declare-fun m!1436313 () Bool)

(assert (=> b!1561189 m!1436313))

(assert (=> b!1561189 m!1436293))

(declare-fun m!1436315 () Bool)

(assert (=> b!1561189 m!1436315))

(assert (=> b!1561189 m!1436305))

(assert (=> b!1561189 m!1436293))

(assert (=> b!1561189 m!1436311))

(assert (=> b!1561189 m!1436307))

(declare-fun m!1436317 () Bool)

(assert (=> b!1561189 m!1436317))

(check-sat b_and!51457 (not b!1561189) tp_is_empty!38647 (not b!1561190) (not b!1561191) (not b!1561195) (not b_lambda!24845) (not mapNonEmpty!59346) (not b_next!31981) (not start!133514))
(check-sat b_and!51457 (not b_next!31981))
