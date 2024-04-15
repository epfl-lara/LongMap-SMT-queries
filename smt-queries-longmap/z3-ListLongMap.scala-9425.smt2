; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112158 () Bool)

(assert start!112158)

(declare-fun b_free!30553 () Bool)

(declare-fun b_next!30553 () Bool)

(assert (=> start!112158 (= b_free!30553 (not b_next!30553))))

(declare-fun tp!107297 () Bool)

(declare-fun b_and!49185 () Bool)

(assert (=> start!112158 (= tp!107297 b_and!49185)))

(declare-fun mapIsEmpty!56368 () Bool)

(declare-fun mapRes!56368 () Bool)

(assert (=> mapIsEmpty!56368 mapRes!56368))

(declare-fun mapNonEmpty!56368 () Bool)

(declare-fun tp!107296 () Bool)

(declare-fun e!757318 () Bool)

(assert (=> mapNonEmpty!56368 (= mapRes!56368 (and tp!107296 e!757318))))

(declare-datatypes ((V!53721 0))(
  ( (V!53722 (val!18306 Int)) )
))
(declare-datatypes ((ValueCell!17333 0))(
  ( (ValueCellFull!17333 (v!20942 V!53721)) (EmptyCell!17333) )
))
(declare-datatypes ((array!89755 0))(
  ( (array!89756 (arr!43344 (Array (_ BitVec 32) ValueCell!17333)) (size!43896 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89755)

(declare-fun mapRest!56368 () (Array (_ BitVec 32) ValueCell!17333))

(declare-fun mapValue!56368 () ValueCell!17333)

(declare-fun mapKey!56368 () (_ BitVec 32))

(assert (=> mapNonEmpty!56368 (= (arr!43344 _values!1320) (store mapRest!56368 mapKey!56368 mapValue!56368))))

(declare-fun b!1328258 () Bool)

(declare-fun e!757314 () Bool)

(assert (=> b!1328258 (= e!757314 false)))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-datatypes ((array!89757 0))(
  ( (array!89758 (arr!43345 (Array (_ BitVec 32) (_ BitVec 64))) (size!43897 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89757)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun minValue!1262 () V!53721)

(declare-fun zeroValue!1262 () V!53721)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!590641 () Bool)

(declare-fun defaultEntry!1323 () Int)

(declare-datatypes ((tuple2!23620 0))(
  ( (tuple2!23621 (_1!11821 (_ BitVec 64)) (_2!11821 V!53721)) )
))
(declare-datatypes ((List!30769 0))(
  ( (Nil!30766) (Cons!30765 (h!31974 tuple2!23620) (t!44767 List!30769)) )
))
(declare-datatypes ((ListLongMap!21277 0))(
  ( (ListLongMap!21278 (toList!10654 List!30769)) )
))
(declare-fun contains!8746 (ListLongMap!21277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5526 (array!89757 array!89755 (_ BitVec 32) (_ BitVec 32) V!53721 V!53721 (_ BitVec 32) Int) ListLongMap!21277)

(assert (=> b!1328258 (= lt!590641 (contains!8746 (getCurrentListMap!5526 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1328259 () Bool)

(declare-fun tp_is_empty!36463 () Bool)

(assert (=> b!1328259 (= e!757318 tp_is_empty!36463)))

(declare-fun b!1328260 () Bool)

(declare-fun e!757317 () Bool)

(declare-fun e!757315 () Bool)

(assert (=> b!1328260 (= e!757317 (and e!757315 mapRes!56368))))

(declare-fun condMapEmpty!56368 () Bool)

(declare-fun mapDefault!56368 () ValueCell!17333)

(assert (=> b!1328260 (= condMapEmpty!56368 (= (arr!43344 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17333)) mapDefault!56368)))))

(declare-fun b!1328261 () Bool)

(declare-fun res!881313 () Bool)

(assert (=> b!1328261 (=> (not res!881313) (not e!757314))))

(assert (=> b!1328261 (= res!881313 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!43897 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!881311 () Bool)

(assert (=> start!112158 (=> (not res!881311) (not e!757314))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112158 (= res!881311 (validMask!0 mask!1998))))

(assert (=> start!112158 e!757314))

(declare-fun array_inv!32879 (array!89755) Bool)

(assert (=> start!112158 (and (array_inv!32879 _values!1320) e!757317)))

(assert (=> start!112158 true))

(declare-fun array_inv!32880 (array!89757) Bool)

(assert (=> start!112158 (array_inv!32880 _keys!1590)))

(assert (=> start!112158 tp!107297))

(assert (=> start!112158 tp_is_empty!36463))

(declare-fun b!1328262 () Bool)

(declare-fun res!881312 () Bool)

(assert (=> b!1328262 (=> (not res!881312) (not e!757314))))

(declare-datatypes ((List!30770 0))(
  ( (Nil!30767) (Cons!30766 (h!31975 (_ BitVec 64)) (t!44768 List!30770)) )
))
(declare-fun arrayNoDuplicates!0 (array!89757 (_ BitVec 32) List!30770) Bool)

(assert (=> b!1328262 (= res!881312 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30767))))

(declare-fun b!1328263 () Bool)

(declare-fun res!881314 () Bool)

(assert (=> b!1328263 (=> (not res!881314) (not e!757314))))

(assert (=> b!1328263 (= res!881314 (and (= (size!43896 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43897 _keys!1590) (size!43896 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1328264 () Bool)

(assert (=> b!1328264 (= e!757315 tp_is_empty!36463)))

(declare-fun b!1328265 () Bool)

(declare-fun res!881310 () Bool)

(assert (=> b!1328265 (=> (not res!881310) (not e!757314))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89757 (_ BitVec 32)) Bool)

(assert (=> b!1328265 (= res!881310 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(assert (= (and start!112158 res!881311) b!1328263))

(assert (= (and b!1328263 res!881314) b!1328265))

(assert (= (and b!1328265 res!881310) b!1328262))

(assert (= (and b!1328262 res!881312) b!1328261))

(assert (= (and b!1328261 res!881313) b!1328258))

(assert (= (and b!1328260 condMapEmpty!56368) mapIsEmpty!56368))

(assert (= (and b!1328260 (not condMapEmpty!56368)) mapNonEmpty!56368))

(get-info :version)

(assert (= (and mapNonEmpty!56368 ((_ is ValueCellFull!17333) mapValue!56368)) b!1328259))

(assert (= (and b!1328260 ((_ is ValueCellFull!17333) mapDefault!56368)) b!1328264))

(assert (= start!112158 b!1328260))

(declare-fun m!1216821 () Bool)

(assert (=> mapNonEmpty!56368 m!1216821))

(declare-fun m!1216823 () Bool)

(assert (=> b!1328262 m!1216823))

(declare-fun m!1216825 () Bool)

(assert (=> b!1328258 m!1216825))

(assert (=> b!1328258 m!1216825))

(declare-fun m!1216827 () Bool)

(assert (=> b!1328258 m!1216827))

(declare-fun m!1216829 () Bool)

(assert (=> start!112158 m!1216829))

(declare-fun m!1216831 () Bool)

(assert (=> start!112158 m!1216831))

(declare-fun m!1216833 () Bool)

(assert (=> start!112158 m!1216833))

(declare-fun m!1216835 () Bool)

(assert (=> b!1328265 m!1216835))

(check-sat (not b!1328262) (not b!1328258) tp_is_empty!36463 (not start!112158) (not b!1328265) (not b_next!30553) b_and!49185 (not mapNonEmpty!56368))
(check-sat b_and!49185 (not b_next!30553))
