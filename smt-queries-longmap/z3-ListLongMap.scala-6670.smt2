; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83994 () Bool)

(assert start!83994)

(declare-fun b_free!19749 () Bool)

(declare-fun b_next!19749 () Bool)

(assert (=> start!83994 (= b_free!19749 (not b_next!19749))))

(declare-fun tp!68769 () Bool)

(declare-fun b_and!31581 () Bool)

(assert (=> start!83994 (= tp!68769 b_and!31581)))

(declare-fun b!981649 () Bool)

(declare-fun e!553392 () Bool)

(declare-fun tp_is_empty!22797 () Bool)

(assert (=> b!981649 (= e!553392 tp_is_empty!22797)))

(declare-fun b!981650 () Bool)

(declare-fun res!656903 () Bool)

(declare-fun e!553388 () Bool)

(assert (=> b!981650 (=> (not res!656903) (not e!553388))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!981650 (= res!656903 (and (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!981651 () Bool)

(declare-fun res!656904 () Bool)

(assert (=> b!981651 (=> (not res!656904) (not e!553388))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-datatypes ((V!35379 0))(
  ( (V!35380 (val!11449 Int)) )
))
(declare-datatypes ((ValueCell!10917 0))(
  ( (ValueCellFull!10917 (v!14011 V!35379)) (EmptyCell!10917) )
))
(declare-datatypes ((array!61589 0))(
  ( (array!61590 (arr!29652 (Array (_ BitVec 32) ValueCell!10917)) (size!30131 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61589)

(declare-datatypes ((array!61591 0))(
  ( (array!61592 (arr!29653 (Array (_ BitVec 32) (_ BitVec 64))) (size!30132 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61591)

(assert (=> b!981651 (= res!656904 (and (= (size!30131 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!30132 _keys!1544) (size!30131 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!981652 () Bool)

(declare-fun e!553391 () Bool)

(declare-fun e!553387 () Bool)

(declare-fun mapRes!36224 () Bool)

(assert (=> b!981652 (= e!553391 (and e!553387 mapRes!36224))))

(declare-fun condMapEmpty!36224 () Bool)

(declare-fun mapDefault!36224 () ValueCell!10917)

(assert (=> b!981652 (= condMapEmpty!36224 (= (arr!29652 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10917)) mapDefault!36224)))))

(declare-fun b!981653 () Bool)

(declare-fun res!656906 () Bool)

(assert (=> b!981653 (=> (not res!656906) (not e!553388))))

(declare-datatypes ((List!20538 0))(
  ( (Nil!20535) (Cons!20534 (h!21696 (_ BitVec 64)) (t!29237 List!20538)) )
))
(declare-fun arrayNoDuplicates!0 (array!61591 (_ BitVec 32) List!20538) Bool)

(assert (=> b!981653 (= res!656906 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20535))))

(declare-fun b!981654 () Bool)

(declare-fun res!656901 () Bool)

(assert (=> b!981654 (=> (not res!656901) (not e!553388))))

(declare-fun from!1932 () (_ BitVec 32))

(assert (=> b!981654 (= res!656901 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!30132 _keys!1544))))))

(declare-fun res!656899 () Bool)

(assert (=> start!83994 (=> (not res!656899) (not e!553388))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83994 (= res!656899 (validMask!0 mask!1948))))

(assert (=> start!83994 e!553388))

(assert (=> start!83994 true))

(assert (=> start!83994 tp_is_empty!22797))

(declare-fun array_inv!22927 (array!61589) Bool)

(assert (=> start!83994 (and (array_inv!22927 _values!1278) e!553391)))

(assert (=> start!83994 tp!68769))

(declare-fun array_inv!22928 (array!61591) Bool)

(assert (=> start!83994 (array_inv!22928 _keys!1544)))

(declare-fun mapNonEmpty!36224 () Bool)

(declare-fun tp!68770 () Bool)

(assert (=> mapNonEmpty!36224 (= mapRes!36224 (and tp!68770 e!553392))))

(declare-fun mapValue!36224 () ValueCell!10917)

(declare-fun mapKey!36224 () (_ BitVec 32))

(declare-fun mapRest!36224 () (Array (_ BitVec 32) ValueCell!10917))

(assert (=> mapNonEmpty!36224 (= (arr!29652 _values!1278) (store mapRest!36224 mapKey!36224 mapValue!36224))))

(declare-fun b!981655 () Bool)

(assert (=> b!981655 (= e!553387 tp_is_empty!22797)))

(declare-fun b!981656 () Bool)

(declare-fun res!656902 () Bool)

(assert (=> b!981656 (=> (not res!656902) (not e!553388))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!981656 (= res!656902 (validKeyInArray!0 (select (arr!29653 _keys!1544) from!1932)))))

(declare-fun b!981657 () Bool)

(declare-fun e!553389 () Bool)

(assert (=> b!981657 (= e!553388 e!553389)))

(declare-fun res!656905 () Bool)

(assert (=> b!981657 (=> (not res!656905) (not e!553389))))

(assert (=> b!981657 (= res!656905 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29653 _keys!1544) from!1932))))))

(declare-fun lt!435796 () V!35379)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15368 (ValueCell!10917 V!35379) V!35379)

(declare-fun dynLambda!1775 (Int (_ BitVec 64)) V!35379)

(assert (=> b!981657 (= lt!435796 (get!15368 (select (arr!29652 _values!1278) from!1932) (dynLambda!1775 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1220 () V!35379)

(declare-datatypes ((tuple2!14654 0))(
  ( (tuple2!14655 (_1!7338 (_ BitVec 64)) (_2!7338 V!35379)) )
))
(declare-datatypes ((List!20539 0))(
  ( (Nil!20536) (Cons!20535 (h!21697 tuple2!14654) (t!29238 List!20539)) )
))
(declare-datatypes ((ListLongMap!13351 0))(
  ( (ListLongMap!13352 (toList!6691 List!20539)) )
))
(declare-fun lt!435797 () ListLongMap!13351)

(declare-fun zeroValue!1220 () V!35379)

(declare-fun getCurrentListMapNoExtraKeys!3392 (array!61591 array!61589 (_ BitVec 32) (_ BitVec 32) V!35379 V!35379 (_ BitVec 32) Int) ListLongMap!13351)

(assert (=> b!981657 (= lt!435797 (getCurrentListMapNoExtraKeys!3392 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!981658 () Bool)

(declare-fun res!656900 () Bool)

(assert (=> b!981658 (=> (not res!656900) (not e!553388))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61591 (_ BitVec 32)) Bool)

(assert (=> b!981658 (= res!656900 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun mapIsEmpty!36224 () Bool)

(assert (=> mapIsEmpty!36224 mapRes!36224))

(declare-fun b!981659 () Bool)

(assert (=> b!981659 (= e!553389 (not true))))

(declare-fun lt!435800 () tuple2!14654)

(declare-fun lt!435798 () tuple2!14654)

(declare-fun +!2992 (ListLongMap!13351 tuple2!14654) ListLongMap!13351)

(assert (=> b!981659 (= (+!2992 (+!2992 lt!435797 lt!435800) lt!435798) (+!2992 (+!2992 lt!435797 lt!435798) lt!435800))))

(assert (=> b!981659 (= lt!435798 (tuple2!14655 (select (arr!29653 _keys!1544) from!1932) lt!435796))))

(assert (=> b!981659 (= lt!435800 (tuple2!14655 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-datatypes ((Unit!32623 0))(
  ( (Unit!32624) )
))
(declare-fun lt!435799 () Unit!32623)

(declare-fun addCommutativeForDiffKeys!620 (ListLongMap!13351 (_ BitVec 64) V!35379 (_ BitVec 64) V!35379) Unit!32623)

(assert (=> b!981659 (= lt!435799 (addCommutativeForDiffKeys!620 lt!435797 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29653 _keys!1544) from!1932) lt!435796))))

(assert (= (and start!83994 res!656899) b!981651))

(assert (= (and b!981651 res!656904) b!981658))

(assert (= (and b!981658 res!656900) b!981653))

(assert (= (and b!981653 res!656906) b!981654))

(assert (= (and b!981654 res!656901) b!981656))

(assert (= (and b!981656 res!656902) b!981650))

(assert (= (and b!981650 res!656903) b!981657))

(assert (= (and b!981657 res!656905) b!981659))

(assert (= (and b!981652 condMapEmpty!36224) mapIsEmpty!36224))

(assert (= (and b!981652 (not condMapEmpty!36224)) mapNonEmpty!36224))

(get-info :version)

(assert (= (and mapNonEmpty!36224 ((_ is ValueCellFull!10917) mapValue!36224)) b!981649))

(assert (= (and b!981652 ((_ is ValueCellFull!10917) mapDefault!36224)) b!981655))

(assert (= start!83994 b!981652))

(declare-fun b_lambda!14787 () Bool)

(assert (=> (not b_lambda!14787) (not b!981657)))

(declare-fun t!29236 () Bool)

(declare-fun tb!6549 () Bool)

(assert (=> (and start!83994 (= defaultEntry!1281 defaultEntry!1281) t!29236) tb!6549))

(declare-fun result!13087 () Bool)

(assert (=> tb!6549 (= result!13087 tp_is_empty!22797)))

(assert (=> b!981657 t!29236))

(declare-fun b_and!31583 () Bool)

(assert (= b_and!31581 (and (=> t!29236 result!13087) b_and!31583)))

(declare-fun m!909011 () Bool)

(assert (=> b!981653 m!909011))

(declare-fun m!909013 () Bool)

(assert (=> b!981656 m!909013))

(assert (=> b!981656 m!909013))

(declare-fun m!909015 () Bool)

(assert (=> b!981656 m!909015))

(assert (=> b!981657 m!909013))

(declare-fun m!909017 () Bool)

(assert (=> b!981657 m!909017))

(declare-fun m!909019 () Bool)

(assert (=> b!981657 m!909019))

(declare-fun m!909021 () Bool)

(assert (=> b!981657 m!909021))

(assert (=> b!981657 m!909017))

(assert (=> b!981657 m!909021))

(declare-fun m!909023 () Bool)

(assert (=> b!981657 m!909023))

(declare-fun m!909025 () Bool)

(assert (=> b!981658 m!909025))

(declare-fun m!909027 () Bool)

(assert (=> b!981659 m!909027))

(assert (=> b!981659 m!909013))

(assert (=> b!981659 m!909013))

(declare-fun m!909029 () Bool)

(assert (=> b!981659 m!909029))

(declare-fun m!909031 () Bool)

(assert (=> b!981659 m!909031))

(assert (=> b!981659 m!909031))

(declare-fun m!909033 () Bool)

(assert (=> b!981659 m!909033))

(assert (=> b!981659 m!909027))

(declare-fun m!909035 () Bool)

(assert (=> b!981659 m!909035))

(declare-fun m!909037 () Bool)

(assert (=> start!83994 m!909037))

(declare-fun m!909039 () Bool)

(assert (=> start!83994 m!909039))

(declare-fun m!909041 () Bool)

(assert (=> start!83994 m!909041))

(declare-fun m!909043 () Bool)

(assert (=> mapNonEmpty!36224 m!909043))

(check-sat b_and!31583 (not start!83994) (not b!981656) (not mapNonEmpty!36224) (not b!981653) (not b_next!19749) (not b!981658) (not b!981659) tp_is_empty!22797 (not b!981657) (not b_lambda!14787))
(check-sat b_and!31583 (not b_next!19749))
