; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97552 () Bool)

(assert start!97552)

(declare-fun b_free!23287 () Bool)

(declare-fun b_next!23287 () Bool)

(assert (=> start!97552 (= b_free!23287 (not b_next!23287))))

(declare-fun tp!82159 () Bool)

(declare-fun b_and!37417 () Bool)

(assert (=> start!97552 (= tp!82159 b_and!37417)))

(declare-fun b!1109884 () Bool)

(declare-fun res!740327 () Bool)

(declare-fun e!633240 () Bool)

(assert (=> b!1109884 (=> (not res!740327) (not e!633240))))

(declare-datatypes ((array!72045 0))(
  ( (array!72046 (arr!34669 (Array (_ BitVec 32) (_ BitVec 64))) (size!35206 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72045)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72045 (_ BitVec 32)) Bool)

(assert (=> b!1109884 (= res!740327 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1109885 () Bool)

(declare-fun res!740322 () Bool)

(assert (=> b!1109885 (=> (not res!740322) (not e!633240))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1109885 (= res!740322 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35206 _keys!1208))))))

(declare-fun b!1109886 () Bool)

(declare-fun res!740326 () Bool)

(assert (=> b!1109886 (=> (not res!740326) (not e!633240))))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1109886 (= res!740326 (= (select (arr!34669 _keys!1208) i!673) k0!934))))

(declare-fun b!1109887 () Bool)

(declare-fun e!633242 () Bool)

(declare-fun tp_is_empty!27547 () Bool)

(assert (=> b!1109887 (= e!633242 tp_is_empty!27547)))

(declare-datatypes ((V!41857 0))(
  ( (V!41858 (val!13830 Int)) )
))
(declare-fun zeroValue!944 () V!41857)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17488 0))(
  ( (tuple2!17489 (_1!8755 (_ BitVec 64)) (_2!8755 V!41857)) )
))
(declare-datatypes ((List!24174 0))(
  ( (Nil!24171) (Cons!24170 (h!25388 tuple2!17488) (t!34499 List!24174)) )
))
(declare-datatypes ((ListLongMap!15465 0))(
  ( (ListLongMap!15466 (toList!7748 List!24174)) )
))
(declare-fun call!46624 () ListLongMap!15465)

(declare-datatypes ((ValueCell!13064 0))(
  ( (ValueCellFull!13064 (v!16459 V!41857)) (EmptyCell!13064) )
))
(declare-datatypes ((array!72047 0))(
  ( (array!72048 (arr!34670 (Array (_ BitVec 32) ValueCell!13064)) (size!35207 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72047)

(declare-fun minValue!944 () V!41857)

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46621 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4283 (array!72045 array!72047 (_ BitVec 32) (_ BitVec 32) V!41857 V!41857 (_ BitVec 32) Int) ListLongMap!15465)

(assert (=> bm!46621 (= call!46624 (getCurrentListMapNoExtraKeys!4283 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1109888 () Bool)

(declare-fun e!633243 () Bool)

(declare-fun call!46625 () ListLongMap!15465)

(assert (=> b!1109888 (= e!633243 (= call!46625 call!46624))))

(declare-fun b!1109889 () Bool)

(declare-fun res!740328 () Bool)

(assert (=> b!1109889 (=> (not res!740328) (not e!633240))))

(declare-datatypes ((List!24175 0))(
  ( (Nil!24172) (Cons!24171 (h!25389 (_ BitVec 64)) (t!34500 List!24175)) )
))
(declare-fun arrayNoDuplicates!0 (array!72045 (_ BitVec 32) List!24175) Bool)

(assert (=> b!1109889 (= res!740328 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24172))))

(declare-fun b!1109890 () Bool)

(declare-fun e!633239 () Bool)

(declare-fun e!633241 () Bool)

(assert (=> b!1109890 (= e!633239 (not e!633241))))

(declare-fun res!740323 () Bool)

(assert (=> b!1109890 (=> res!740323 e!633241)))

(assert (=> b!1109890 (= res!740323 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35206 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1109890 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36361 0))(
  ( (Unit!36362) )
))
(declare-fun lt!496345 () Unit!36361)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72045 (_ BitVec 64) (_ BitVec 32)) Unit!36361)

(assert (=> b!1109890 (= lt!496345 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun res!740332 () Bool)

(assert (=> start!97552 (=> (not res!740332) (not e!633240))))

(assert (=> start!97552 (= res!740332 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35206 _keys!1208))))))

(assert (=> start!97552 e!633240))

(assert (=> start!97552 tp_is_empty!27547))

(declare-fun array_inv!26714 (array!72045) Bool)

(assert (=> start!97552 (array_inv!26714 _keys!1208)))

(assert (=> start!97552 true))

(assert (=> start!97552 tp!82159))

(declare-fun e!633245 () Bool)

(declare-fun array_inv!26715 (array!72047) Bool)

(assert (=> start!97552 (and (array_inv!26715 _values!996) e!633245)))

(declare-fun b!1109891 () Bool)

(assert (=> b!1109891 (= e!633240 e!633239)))

(declare-fun res!740331 () Bool)

(assert (=> b!1109891 (=> (not res!740331) (not e!633239))))

(declare-fun lt!496343 () array!72045)

(assert (=> b!1109891 (= res!740331 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!496343 mask!1564))))

(assert (=> b!1109891 (= lt!496343 (array!72046 (store (arr!34669 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35206 _keys!1208)))))

(declare-fun b!1109892 () Bool)

(assert (=> b!1109892 (= e!633241 true)))

(assert (=> b!1109892 e!633243))

(declare-fun c!109526 () Bool)

(assert (=> b!1109892 (= c!109526 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!496344 () Unit!36361)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!276 (array!72045 array!72047 (_ BitVec 32) (_ BitVec 32) V!41857 V!41857 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36361)

(assert (=> b!1109892 (= lt!496344 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!276 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43138 () Bool)

(declare-fun mapRes!43138 () Bool)

(assert (=> mapIsEmpty!43138 mapRes!43138))

(declare-fun b!1109893 () Bool)

(declare-fun res!740325 () Bool)

(assert (=> b!1109893 (=> (not res!740325) (not e!633240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1109893 (= res!740325 (validKeyInArray!0 k0!934))))

(declare-fun b!1109894 () Bool)

(declare-fun res!740329 () Bool)

(assert (=> b!1109894 (=> (not res!740329) (not e!633239))))

(assert (=> b!1109894 (= res!740329 (arrayNoDuplicates!0 lt!496343 #b00000000000000000000000000000000 Nil!24172))))

(declare-fun b!1109895 () Bool)

(declare-fun -!1005 (ListLongMap!15465 (_ BitVec 64)) ListLongMap!15465)

(assert (=> b!1109895 (= e!633243 (= call!46625 (-!1005 call!46624 k0!934)))))

(declare-fun b!1109896 () Bool)

(declare-fun e!633244 () Bool)

(assert (=> b!1109896 (= e!633245 (and e!633244 mapRes!43138))))

(declare-fun condMapEmpty!43138 () Bool)

(declare-fun mapDefault!43138 () ValueCell!13064)

(assert (=> b!1109896 (= condMapEmpty!43138 (= (arr!34670 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13064)) mapDefault!43138)))))

(declare-fun b!1109897 () Bool)

(declare-fun res!740330 () Bool)

(assert (=> b!1109897 (=> (not res!740330) (not e!633240))))

(assert (=> b!1109897 (= res!740330 (and (= (size!35207 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35206 _keys!1208) (size!35207 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun bm!46622 () Bool)

(declare-fun dynLambda!2397 (Int (_ BitVec 64)) V!41857)

(assert (=> bm!46622 (= call!46625 (getCurrentListMapNoExtraKeys!4283 lt!496343 (array!72048 (store (arr!34670 _values!996) i!673 (ValueCellFull!13064 (dynLambda!2397 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35207 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapNonEmpty!43138 () Bool)

(declare-fun tp!82160 () Bool)

(assert (=> mapNonEmpty!43138 (= mapRes!43138 (and tp!82160 e!633242))))

(declare-fun mapKey!43138 () (_ BitVec 32))

(declare-fun mapValue!43138 () ValueCell!13064)

(declare-fun mapRest!43138 () (Array (_ BitVec 32) ValueCell!13064))

(assert (=> mapNonEmpty!43138 (= (arr!34670 _values!996) (store mapRest!43138 mapKey!43138 mapValue!43138))))

(declare-fun b!1109898 () Bool)

(declare-fun res!740324 () Bool)

(assert (=> b!1109898 (=> (not res!740324) (not e!633240))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1109898 (= res!740324 (validMask!0 mask!1564))))

(declare-fun b!1109899 () Bool)

(assert (=> b!1109899 (= e!633244 tp_is_empty!27547)))

(assert (= (and start!97552 res!740332) b!1109898))

(assert (= (and b!1109898 res!740324) b!1109897))

(assert (= (and b!1109897 res!740330) b!1109884))

(assert (= (and b!1109884 res!740327) b!1109889))

(assert (= (and b!1109889 res!740328) b!1109885))

(assert (= (and b!1109885 res!740322) b!1109893))

(assert (= (and b!1109893 res!740325) b!1109886))

(assert (= (and b!1109886 res!740326) b!1109891))

(assert (= (and b!1109891 res!740331) b!1109894))

(assert (= (and b!1109894 res!740329) b!1109890))

(assert (= (and b!1109890 (not res!740323)) b!1109892))

(assert (= (and b!1109892 c!109526) b!1109895))

(assert (= (and b!1109892 (not c!109526)) b!1109888))

(assert (= (or b!1109895 b!1109888) bm!46622))

(assert (= (or b!1109895 b!1109888) bm!46621))

(assert (= (and b!1109896 condMapEmpty!43138) mapIsEmpty!43138))

(assert (= (and b!1109896 (not condMapEmpty!43138)) mapNonEmpty!43138))

(get-info :version)

(assert (= (and mapNonEmpty!43138 ((_ is ValueCellFull!13064) mapValue!43138)) b!1109887))

(assert (= (and b!1109896 ((_ is ValueCellFull!13064) mapDefault!43138)) b!1109899))

(assert (= start!97552 b!1109896))

(declare-fun b_lambda!18317 () Bool)

(assert (=> (not b_lambda!18317) (not bm!46622)))

(declare-fun t!34498 () Bool)

(declare-fun tb!8145 () Bool)

(assert (=> (and start!97552 (= defaultEntry!1004 defaultEntry!1004) t!34498) tb!8145))

(declare-fun result!16859 () Bool)

(assert (=> tb!8145 (= result!16859 tp_is_empty!27547)))

(assert (=> bm!46622 t!34498))

(declare-fun b_and!37419 () Bool)

(assert (= b_and!37417 (and (=> t!34498 result!16859) b_and!37419)))

(declare-fun m!1028727 () Bool)

(assert (=> b!1109884 m!1028727))

(declare-fun m!1028729 () Bool)

(assert (=> b!1109894 m!1028729))

(declare-fun m!1028731 () Bool)

(assert (=> b!1109891 m!1028731))

(declare-fun m!1028733 () Bool)

(assert (=> b!1109891 m!1028733))

(declare-fun m!1028735 () Bool)

(assert (=> start!97552 m!1028735))

(declare-fun m!1028737 () Bool)

(assert (=> start!97552 m!1028737))

(declare-fun m!1028739 () Bool)

(assert (=> b!1109895 m!1028739))

(declare-fun m!1028741 () Bool)

(assert (=> b!1109890 m!1028741))

(declare-fun m!1028743 () Bool)

(assert (=> b!1109890 m!1028743))

(declare-fun m!1028745 () Bool)

(assert (=> bm!46622 m!1028745))

(declare-fun m!1028747 () Bool)

(assert (=> bm!46622 m!1028747))

(declare-fun m!1028749 () Bool)

(assert (=> bm!46622 m!1028749))

(declare-fun m!1028751 () Bool)

(assert (=> b!1109889 m!1028751))

(declare-fun m!1028753 () Bool)

(assert (=> b!1109893 m!1028753))

(declare-fun m!1028755 () Bool)

(assert (=> b!1109886 m!1028755))

(declare-fun m!1028757 () Bool)

(assert (=> mapNonEmpty!43138 m!1028757))

(declare-fun m!1028759 () Bool)

(assert (=> bm!46621 m!1028759))

(declare-fun m!1028761 () Bool)

(assert (=> b!1109898 m!1028761))

(declare-fun m!1028763 () Bool)

(assert (=> b!1109892 m!1028763))

(check-sat (not bm!46621) (not b!1109893) (not bm!46622) (not b!1109891) (not b!1109898) b_and!37419 (not b_next!23287) (not b!1109884) (not mapNonEmpty!43138) tp_is_empty!27547 (not b!1109890) (not b!1109895) (not b!1109889) (not b!1109892) (not b_lambda!18317) (not start!97552) (not b!1109894))
(check-sat b_and!37419 (not b_next!23287))
