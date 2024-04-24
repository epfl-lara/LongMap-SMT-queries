; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!84160 () Bool)

(assert start!84160)

(declare-fun b_free!19747 () Bool)

(declare-fun b_next!19747 () Bool)

(assert (=> start!84160 (= b_free!19747 (not b_next!19747))))

(declare-fun tp!68764 () Bool)

(declare-fun b_and!31587 () Bool)

(assert (=> start!84160 (= tp!68764 b_and!31587)))

(declare-fun b!982517 () Bool)

(declare-fun e!553956 () Bool)

(declare-fun e!553955 () Bool)

(assert (=> b!982517 (= e!553956 e!553955)))

(declare-fun res!657224 () Bool)

(assert (=> b!982517 (=> (not res!657224) (not e!553955))))

(declare-datatypes ((array!61622 0))(
  ( (array!61623 (arr!29664 (Array (_ BitVec 32) (_ BitVec 64))) (size!30144 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61622)

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!982517 (= res!657224 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29664 _keys!1544) from!1932))))))

(declare-datatypes ((V!35377 0))(
  ( (V!35378 (val!11448 Int)) )
))
(declare-datatypes ((ValueCell!10916 0))(
  ( (ValueCellFull!10916 (v!14007 V!35377)) (EmptyCell!10916) )
))
(declare-datatypes ((array!61624 0))(
  ( (array!61625 (arr!29665 (Array (_ BitVec 32) ValueCell!10916)) (size!30145 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61624)

(declare-fun defaultEntry!1281 () Int)

(declare-fun lt!436142 () V!35377)

(declare-fun get!15401 (ValueCell!10916 V!35377) V!35377)

(declare-fun dynLambda!1804 (Int (_ BitVec 64)) V!35377)

(assert (=> b!982517 (= lt!436142 (get!15401 (select (arr!29665 _values!1278) from!1932) (dynLambda!1804 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-datatypes ((tuple2!14668 0))(
  ( (tuple2!14669 (_1!7345 (_ BitVec 64)) (_2!7345 V!35377)) )
))
(declare-datatypes ((List!20546 0))(
  ( (Nil!20543) (Cons!20542 (h!21710 tuple2!14668) (t!29235 List!20546)) )
))
(declare-datatypes ((ListLongMap!13367 0))(
  ( (ListLongMap!13368 (toList!6699 List!20546)) )
))
(declare-fun lt!436145 () ListLongMap!13367)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun minValue!1220 () V!35377)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35377)

(declare-fun getCurrentListMapNoExtraKeys!3445 (array!61622 array!61624 (_ BitVec 32) (_ BitVec 32) V!35377 V!35377 (_ BitVec 32) Int) ListLongMap!13367)

(assert (=> b!982517 (= lt!436145 (getCurrentListMapNoExtraKeys!3445 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun mapNonEmpty!36221 () Bool)

(declare-fun mapRes!36221 () Bool)

(declare-fun tp!68765 () Bool)

(declare-fun e!553953 () Bool)

(assert (=> mapNonEmpty!36221 (= mapRes!36221 (and tp!68765 e!553953))))

(declare-fun mapRest!36221 () (Array (_ BitVec 32) ValueCell!10916))

(declare-fun mapValue!36221 () ValueCell!10916)

(declare-fun mapKey!36221 () (_ BitVec 32))

(assert (=> mapNonEmpty!36221 (= (arr!29665 _values!1278) (store mapRest!36221 mapKey!36221 mapValue!36221))))

(declare-fun b!982518 () Bool)

(declare-fun res!657222 () Bool)

(assert (=> b!982518 (=> (not res!657222) (not e!553956))))

(assert (=> b!982518 (= res!657222 (and (= (size!30145 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30144 _keys!1544) (size!30145 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!982519 () Bool)

(declare-fun res!657221 () Bool)

(assert (=> b!982519 (=> (not res!657221) (not e!553956))))

(assert (=> b!982519 (= res!657221 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30144 _keys!1544))))))

(declare-fun b!982520 () Bool)

(declare-fun e!553952 () Bool)

(declare-fun tp_is_empty!22795 () Bool)

(assert (=> b!982520 (= e!553952 tp_is_empty!22795)))

(declare-fun b!982521 () Bool)

(assert (=> b!982521 (= e!553955 (not true))))

(declare-fun lt!436146 () tuple2!14668)

(declare-fun lt!436144 () tuple2!14668)

(declare-fun +!3010 (ListLongMap!13367 tuple2!14668) ListLongMap!13367)

(assert (=> b!982521 (= (+!3010 (+!3010 lt!436145 lt!436146) lt!436144) (+!3010 (+!3010 lt!436145 lt!436144) lt!436146))))

(assert (=> b!982521 (= lt!436144 (tuple2!14669 (select (arr!29664 _keys!1544) from!1932) lt!436142))))

(assert (=> b!982521 (= lt!436146 (tuple2!14669 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32600 0))(
  ( (Unit!32601) )
))
(declare-fun lt!436143 () Unit!32600)

(declare-fun addCommutativeForDiffKeys!617 (ListLongMap!13367 (_ BitVec 64) V!35377 (_ BitVec 64) V!35377) Unit!32600)

(assert (=> b!982521 (= lt!436143 (addCommutativeForDiffKeys!617 lt!436145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29664 _keys!1544) from!1932) lt!436142))))

(declare-fun res!657220 () Bool)

(assert (=> start!84160 (=> (not res!657220) (not e!553956))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!84160 (= res!657220 (validMask!0 mask!1948))))

(assert (=> start!84160 e!553956))

(assert (=> start!84160 true))

(assert (=> start!84160 tp_is_empty!22795))

(declare-fun e!553951 () Bool)

(declare-fun array_inv!22955 (array!61624) Bool)

(assert (=> start!84160 (and (array_inv!22955 _values!1278) e!553951)))

(assert (=> start!84160 tp!68764))

(declare-fun array_inv!22956 (array!61622) Bool)

(assert (=> start!84160 (array_inv!22956 _keys!1544)))

(declare-fun b!982522 () Bool)

(declare-fun res!657223 () Bool)

(assert (=> b!982522 (=> (not res!657223) (not e!553956))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!982522 (= res!657223 (validKeyInArray!0 (select (arr!29664 _keys!1544) from!1932)))))

(declare-fun mapIsEmpty!36221 () Bool)

(assert (=> mapIsEmpty!36221 mapRes!36221))

(declare-fun b!982523 () Bool)

(assert (=> b!982523 (= e!553951 (and e!553952 mapRes!36221))))

(declare-fun condMapEmpty!36221 () Bool)

(declare-fun mapDefault!36221 () ValueCell!10916)

(assert (=> b!982523 (= condMapEmpty!36221 (= (arr!29665 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10916)) mapDefault!36221)))))

(declare-fun b!982524 () Bool)

(declare-fun res!657219 () Bool)

(assert (=> b!982524 (=> (not res!657219) (not e!553956))))

(declare-datatypes ((List!20547 0))(
  ( (Nil!20544) (Cons!20543 (h!21711 (_ BitVec 64)) (t!29236 List!20547)) )
))
(declare-fun arrayNoDuplicates!0 (array!61622 (_ BitVec 32) List!20547) Bool)

(assert (=> b!982524 (= res!657219 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20544))))

(declare-fun b!982525 () Bool)

(declare-fun res!657226 () Bool)

(assert (=> b!982525 (=> (not res!657226) (not e!553956))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61622 (_ BitVec 32)) Bool)

(assert (=> b!982525 (= res!657226 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!982526 () Bool)

(assert (=> b!982526 (= e!553953 tp_is_empty!22795)))

(declare-fun b!982527 () Bool)

(declare-fun res!657225 () Bool)

(assert (=> b!982527 (=> (not res!657225) (not e!553956))))

(assert (=> b!982527 (= res!657225 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!84160 res!657220) b!982518))

(assert (= (and b!982518 res!657222) b!982525))

(assert (= (and b!982525 res!657226) b!982524))

(assert (= (and b!982524 res!657219) b!982519))

(assert (= (and b!982519 res!657221) b!982522))

(assert (= (and b!982522 res!657223) b!982527))

(assert (= (and b!982527 res!657225) b!982517))

(assert (= (and b!982517 res!657224) b!982521))

(assert (= (and b!982523 condMapEmpty!36221) mapIsEmpty!36221))

(assert (= (and b!982523 (not condMapEmpty!36221)) mapNonEmpty!36221))

(get-info :version)

(assert (= (and mapNonEmpty!36221 ((_ is ValueCellFull!10916) mapValue!36221)) b!982526))

(assert (= (and b!982523 ((_ is ValueCellFull!10916) mapDefault!36221)) b!982520))

(assert (= start!84160 b!982523))

(declare-fun b_lambda!14799 () Bool)

(assert (=> (not b_lambda!14799) (not b!982517)))

(declare-fun t!29234 () Bool)

(declare-fun tb!6539 () Bool)

(assert (=> (and start!84160 (= defaultEntry!1281 defaultEntry!1281) t!29234) tb!6539))

(declare-fun result!13075 () Bool)

(assert (=> tb!6539 (= result!13075 tp_is_empty!22795)))

(assert (=> b!982517 t!29234))

(declare-fun b_and!31589 () Bool)

(assert (= b_and!31587 (and (=> t!29234 result!13075) b_and!31589)))

(declare-fun m!910271 () Bool)

(assert (=> b!982525 m!910271))

(declare-fun m!910273 () Bool)

(assert (=> b!982517 m!910273))

(declare-fun m!910275 () Bool)

(assert (=> b!982517 m!910275))

(declare-fun m!910277 () Bool)

(assert (=> b!982517 m!910277))

(declare-fun m!910279 () Bool)

(assert (=> b!982517 m!910279))

(assert (=> b!982517 m!910275))

(assert (=> b!982517 m!910279))

(declare-fun m!910281 () Bool)

(assert (=> b!982517 m!910281))

(assert (=> b!982522 m!910273))

(assert (=> b!982522 m!910273))

(declare-fun m!910283 () Bool)

(assert (=> b!982522 m!910283))

(declare-fun m!910285 () Bool)

(assert (=> mapNonEmpty!36221 m!910285))

(declare-fun m!910287 () Bool)

(assert (=> start!84160 m!910287))

(declare-fun m!910289 () Bool)

(assert (=> start!84160 m!910289))

(declare-fun m!910291 () Bool)

(assert (=> start!84160 m!910291))

(declare-fun m!910293 () Bool)

(assert (=> b!982524 m!910293))

(assert (=> b!982521 m!910273))

(declare-fun m!910295 () Bool)

(assert (=> b!982521 m!910295))

(assert (=> b!982521 m!910273))

(declare-fun m!910297 () Bool)

(assert (=> b!982521 m!910297))

(declare-fun m!910299 () Bool)

(assert (=> b!982521 m!910299))

(assert (=> b!982521 m!910295))

(declare-fun m!910301 () Bool)

(assert (=> b!982521 m!910301))

(assert (=> b!982521 m!910299))

(declare-fun m!910303 () Bool)

(assert (=> b!982521 m!910303))

(check-sat (not b!982522) (not mapNonEmpty!36221) (not b_lambda!14799) b_and!31589 (not start!84160) (not b!982525) tp_is_empty!22795 (not b_next!19747) (not b!982517) (not b!982521) (not b!982524))
(check-sat b_and!31589 (not b_next!19747))
