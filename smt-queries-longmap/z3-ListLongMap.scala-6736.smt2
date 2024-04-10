; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84406 () Bool)

(assert start!84406)

(declare-fun b_free!19977 () Bool)

(declare-fun b_next!19977 () Bool)

(assert (=> start!84406 (= b_free!19977 (not b_next!19977))))

(declare-fun tp!69709 () Bool)

(declare-fun b_and!32017 () Bool)

(assert (=> start!84406 (= tp!69709 b_and!32017)))

(declare-fun res!660468 () Bool)

(declare-fun e!556711 () Bool)

(assert (=> start!84406 (=> (not res!660468) (not e!556711))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84406 (= res!660468 (validMask!0 mask!1948))))

(assert (=> start!84406 e!556711))

(assert (=> start!84406 true))

(declare-fun tp_is_empty!23193 () Bool)

(assert (=> start!84406 tp_is_empty!23193))

(declare-datatypes ((V!35907 0))(
  ( (V!35908 (val!11647 Int)) )
))
(declare-datatypes ((ValueCell!11115 0))(
  ( (ValueCellFull!11115 (v!14210 V!35907)) (EmptyCell!11115) )
))
(declare-datatypes ((array!62343 0))(
  ( (array!62344 (arr!30028 (Array (_ BitVec 32) ValueCell!11115)) (size!30507 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!62343)

(declare-fun e!556709 () Bool)

(declare-fun array_inv!23201 (array!62343) Bool)

(assert (=> start!84406 (and (array_inv!23201 _values!1278) e!556709)))

(assert (=> start!84406 tp!69709))

(declare-datatypes ((array!62345 0))(
  ( (array!62346 (arr!30029 (Array (_ BitVec 32) (_ BitVec 64))) (size!30508 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!62345)

(declare-fun array_inv!23202 (array!62345) Bool)

(assert (=> start!84406 (array_inv!23202 _keys!1544)))

(declare-fun mapNonEmpty!36821 () Bool)

(declare-fun mapRes!36821 () Bool)

(declare-fun tp!69708 () Bool)

(declare-fun e!556710 () Bool)

(assert (=> mapNonEmpty!36821 (= mapRes!36821 (and tp!69708 e!556710))))

(declare-fun mapValue!36821 () ValueCell!11115)

(declare-fun mapKey!36821 () (_ BitVec 32))

(declare-fun mapRest!36821 () (Array (_ BitVec 32) ValueCell!11115))

(assert (=> mapNonEmpty!36821 (= (arr!30028 _values!1278) (store mapRest!36821 mapKey!36821 mapValue!36821))))

(declare-fun b!987246 () Bool)

(declare-fun res!660469 () Bool)

(assert (=> b!987246 (=> (not res!660469) (not e!556711))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!987246 (= res!660469 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30508 _keys!1544))))))

(declare-fun b!987247 () Bool)

(declare-fun res!660470 () Bool)

(assert (=> b!987247 (=> (not res!660470) (not e!556711))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!987247 (= res!660470 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!987248 () Bool)

(declare-fun e!556712 () Bool)

(assert (=> b!987248 (= e!556709 (and e!556712 mapRes!36821))))

(declare-fun condMapEmpty!36821 () Bool)

(declare-fun mapDefault!36821 () ValueCell!11115)

(assert (=> b!987248 (= condMapEmpty!36821 (= (arr!30028 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!11115)) mapDefault!36821)))))

(declare-fun b!987249 () Bool)

(assert (=> b!987249 (= e!556711 (not true))))

(declare-datatypes ((tuple2!14832 0))(
  ( (tuple2!14833 (_1!7427 (_ BitVec 64)) (_2!7427 V!35907)) )
))
(declare-datatypes ((List!20763 0))(
  ( (Nil!20760) (Cons!20759 (h!21921 tuple2!14832) (t!29668 List!20763)) )
))
(declare-datatypes ((ListLongMap!13529 0))(
  ( (ListLongMap!13530 (toList!6780 List!20763)) )
))
(declare-fun lt!437650 () ListLongMap!13529)

(declare-fun lt!437649 () tuple2!14832)

(declare-fun lt!437648 () tuple2!14832)

(declare-fun +!3065 (ListLongMap!13529 tuple2!14832) ListLongMap!13529)

(assert (=> b!987249 (= (+!3065 (+!3065 lt!437650 lt!437649) lt!437648) (+!3065 (+!3065 lt!437650 lt!437648) lt!437649))))

(declare-fun lt!437647 () V!35907)

(assert (=> b!987249 (= lt!437648 (tuple2!14833 (select (arr!30029 _keys!1544) from!1932) lt!437647))))

(declare-fun minValue!1220 () V!35907)

(assert (=> b!987249 (= lt!437649 (tuple2!14833 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32763 0))(
  ( (Unit!32764) )
))
(declare-fun lt!437651 () Unit!32763)

(declare-fun addCommutativeForDiffKeys!689 (ListLongMap!13529 (_ BitVec 64) V!35907 (_ BitVec 64) V!35907) Unit!32763)

(assert (=> b!987249 (= lt!437651 (addCommutativeForDiffKeys!689 lt!437650 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!30029 _keys!1544) from!1932) lt!437647))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15573 (ValueCell!11115 V!35907) V!35907)

(declare-fun dynLambda!1848 (Int (_ BitVec 64)) V!35907)

(assert (=> b!987249 (= lt!437647 (get!15573 (select (arr!30028 _values!1278) from!1932) (dynLambda!1848 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35907)

(declare-fun getCurrentListMapNoExtraKeys!3471 (array!62345 array!62343 (_ BitVec 32) (_ BitVec 32) V!35907 V!35907 (_ BitVec 32) Int) ListLongMap!13529)

(assert (=> b!987249 (= lt!437650 (+!3065 (getCurrentListMapNoExtraKeys!3471 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14833 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun mapIsEmpty!36821 () Bool)

(assert (=> mapIsEmpty!36821 mapRes!36821))

(declare-fun b!987250 () Bool)

(declare-fun res!660467 () Bool)

(assert (=> b!987250 (=> (not res!660467) (not e!556711))))

(assert (=> b!987250 (= res!660467 (and (= (size!30507 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30508 _keys!1544) (size!30507 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!987251 () Bool)

(declare-fun res!660465 () Bool)

(assert (=> b!987251 (=> (not res!660465) (not e!556711))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!62345 (_ BitVec 32)) Bool)

(assert (=> b!987251 (= res!660465 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!987252 () Bool)

(assert (=> b!987252 (= e!556712 tp_is_empty!23193)))

(declare-fun b!987253 () Bool)

(declare-fun res!660464 () Bool)

(assert (=> b!987253 (=> (not res!660464) (not e!556711))))

(declare-datatypes ((List!20764 0))(
  ( (Nil!20761) (Cons!20760 (h!21922 (_ BitVec 64)) (t!29669 List!20764)) )
))
(declare-fun arrayNoDuplicates!0 (array!62345 (_ BitVec 32) List!20764) Bool)

(assert (=> b!987253 (= res!660464 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20761))))

(declare-fun b!987254 () Bool)

(declare-fun res!660466 () Bool)

(assert (=> b!987254 (=> (not res!660466) (not e!556711))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!987254 (= res!660466 (validKeyInArray!0 (select (arr!30029 _keys!1544) from!1932)))))

(declare-fun b!987255 () Bool)

(assert (=> b!987255 (= e!556710 tp_is_empty!23193)))

(assert (= (and start!84406 res!660468) b!987250))

(assert (= (and b!987250 res!660467) b!987251))

(assert (= (and b!987251 res!660465) b!987253))

(assert (= (and b!987253 res!660464) b!987246))

(assert (= (and b!987246 res!660469) b!987254))

(assert (= (and b!987254 res!660466) b!987247))

(assert (= (and b!987247 res!660470) b!987249))

(assert (= (and b!987248 condMapEmpty!36821) mapIsEmpty!36821))

(assert (= (and b!987248 (not condMapEmpty!36821)) mapNonEmpty!36821))

(get-info :version)

(assert (= (and mapNonEmpty!36821 ((_ is ValueCellFull!11115) mapValue!36821)) b!987255))

(assert (= (and b!987248 ((_ is ValueCellFull!11115) mapDefault!36821)) b!987252))

(assert (= start!84406 b!987248))

(declare-fun b_lambda!14999 () Bool)

(assert (=> (not b_lambda!14999) (not b!987249)))

(declare-fun t!29667 () Bool)

(declare-fun tb!6755 () Bool)

(assert (=> (and start!84406 (= defaultEntry!1281 defaultEntry!1281) t!29667) tb!6755))

(declare-fun result!13501 () Bool)

(assert (=> tb!6755 (= result!13501 tp_is_empty!23193)))

(assert (=> b!987249 t!29667))

(declare-fun b_and!32019 () Bool)

(assert (= b_and!32017 (and (=> t!29667 result!13501) b_and!32019)))

(declare-fun m!913819 () Bool)

(assert (=> mapNonEmpty!36821 m!913819))

(declare-fun m!913821 () Bool)

(assert (=> b!987251 m!913821))

(declare-fun m!913823 () Bool)

(assert (=> start!84406 m!913823))

(declare-fun m!913825 () Bool)

(assert (=> start!84406 m!913825))

(declare-fun m!913827 () Bool)

(assert (=> start!84406 m!913827))

(declare-fun m!913829 () Bool)

(assert (=> b!987254 m!913829))

(assert (=> b!987254 m!913829))

(declare-fun m!913831 () Bool)

(assert (=> b!987254 m!913831))

(assert (=> b!987249 m!913829))

(declare-fun m!913833 () Bool)

(assert (=> b!987249 m!913833))

(declare-fun m!913835 () Bool)

(assert (=> b!987249 m!913835))

(declare-fun m!913837 () Bool)

(assert (=> b!987249 m!913837))

(declare-fun m!913839 () Bool)

(assert (=> b!987249 m!913839))

(assert (=> b!987249 m!913835))

(assert (=> b!987249 m!913829))

(declare-fun m!913841 () Bool)

(assert (=> b!987249 m!913841))

(declare-fun m!913843 () Bool)

(assert (=> b!987249 m!913843))

(declare-fun m!913845 () Bool)

(assert (=> b!987249 m!913845))

(assert (=> b!987249 m!913833))

(assert (=> b!987249 m!913845))

(declare-fun m!913847 () Bool)

(assert (=> b!987249 m!913847))

(assert (=> b!987249 m!913839))

(declare-fun m!913849 () Bool)

(assert (=> b!987249 m!913849))

(assert (=> b!987249 m!913843))

(declare-fun m!913851 () Bool)

(assert (=> b!987249 m!913851))

(declare-fun m!913853 () Bool)

(assert (=> b!987253 m!913853))

(check-sat (not mapNonEmpty!36821) (not b!987253) b_and!32019 tp_is_empty!23193 (not b!987249) (not b_next!19977) (not b!987251) (not b!987254) (not start!84406) (not b_lambda!14999))
(check-sat b_and!32019 (not b_next!19977))
