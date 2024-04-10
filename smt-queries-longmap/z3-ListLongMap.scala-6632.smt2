; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83766 () Bool)

(assert start!83766)

(declare-fun b_free!19575 () Bool)

(declare-fun b_next!19575 () Bool)

(assert (=> start!83766 (= b_free!19575 (not b_next!19575))))

(declare-fun tp!68167 () Bool)

(declare-fun b_and!31239 () Bool)

(assert (=> start!83766 (= tp!68167 b_and!31239)))

(declare-fun b!978173 () Bool)

(declare-fun res!654623 () Bool)

(declare-fun e!551495 () Bool)

(assert (=> b!978173 (=> (not res!654623) (not e!551495))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61165 0))(
  ( (array!61166 (arr!29440 (Array (_ BitVec 32) (_ BitVec 64))) (size!29919 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61165)

(declare-datatypes ((V!35075 0))(
  ( (V!35076 (val!11335 Int)) )
))
(declare-datatypes ((ValueCell!10803 0))(
  ( (ValueCellFull!10803 (v!13897 V!35075)) (EmptyCell!10803) )
))
(declare-datatypes ((array!61167 0))(
  ( (array!61168 (arr!29441 (Array (_ BitVec 32) ValueCell!10803)) (size!29920 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61167)

(assert (=> b!978173 (= res!654623 (and (= (size!29920 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29919 _keys!1544) (size!29920 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978174 () Bool)

(declare-fun res!654622 () Bool)

(assert (=> b!978174 (=> (not res!654622) (not e!551495))))

(declare-datatypes ((List!20402 0))(
  ( (Nil!20399) (Cons!20398 (h!21560 (_ BitVec 64)) (t!28933 List!20402)) )
))
(declare-fun arrayNoDuplicates!0 (array!61165 (_ BitVec 32) List!20402) Bool)

(assert (=> b!978174 (= res!654622 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20399))))

(declare-fun b!978175 () Bool)

(declare-fun e!551494 () Bool)

(declare-fun tp_is_empty!22569 () Bool)

(assert (=> b!978175 (= e!551494 tp_is_empty!22569)))

(declare-fun mapNonEmpty!35882 () Bool)

(declare-fun mapRes!35882 () Bool)

(declare-fun tp!68166 () Bool)

(declare-fun e!551492 () Bool)

(assert (=> mapNonEmpty!35882 (= mapRes!35882 (and tp!68166 e!551492))))

(declare-fun mapRest!35882 () (Array (_ BitVec 32) ValueCell!10803))

(declare-fun mapKey!35882 () (_ BitVec 32))

(declare-fun mapValue!35882 () ValueCell!10803)

(assert (=> mapNonEmpty!35882 (= (arr!29441 _values!1278) (store mapRest!35882 mapKey!35882 mapValue!35882))))

(declare-fun b!978176 () Bool)

(declare-fun e!551493 () Bool)

(assert (=> b!978176 (= e!551493 (and e!551494 mapRes!35882))))

(declare-fun condMapEmpty!35882 () Bool)

(declare-fun mapDefault!35882 () ValueCell!10803)

(assert (=> b!978176 (= condMapEmpty!35882 (= (arr!29441 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10803)) mapDefault!35882)))))

(declare-fun res!654617 () Bool)

(assert (=> start!83766 (=> (not res!654617) (not e!551495))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83766 (= res!654617 (validMask!0 mask!1948))))

(assert (=> start!83766 e!551495))

(assert (=> start!83766 true))

(assert (=> start!83766 tp_is_empty!22569))

(declare-fun array_inv!22757 (array!61167) Bool)

(assert (=> start!83766 (and (array_inv!22757 _values!1278) e!551493)))

(assert (=> start!83766 tp!68167))

(declare-fun array_inv!22758 (array!61165) Bool)

(assert (=> start!83766 (array_inv!22758 _keys!1544)))

(declare-fun b!978177 () Bool)

(declare-fun res!654621 () Bool)

(assert (=> b!978177 (=> (not res!654621) (not e!551495))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61165 (_ BitVec 32)) Bool)

(assert (=> b!978177 (= res!654621 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978178 () Bool)

(assert (=> b!978178 (= e!551492 tp_is_empty!22569)))

(declare-fun b!978179 () Bool)

(declare-fun res!654619 () Bool)

(assert (=> b!978179 (=> (not res!654619) (not e!551495))))

(assert (=> b!978179 (= res!654619 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!35882 () Bool)

(assert (=> mapIsEmpty!35882 mapRes!35882))

(declare-fun b!978180 () Bool)

(assert (=> b!978180 (= e!551495 (not true))))

(declare-datatypes ((tuple2!14530 0))(
  ( (tuple2!14531 (_1!7276 (_ BitVec 64)) (_2!7276 V!35075)) )
))
(declare-datatypes ((List!20403 0))(
  ( (Nil!20400) (Cons!20399 (h!21561 tuple2!14530) (t!28934 List!20403)) )
))
(declare-datatypes ((ListLongMap!13227 0))(
  ( (ListLongMap!13228 (toList!6629 List!20403)) )
))
(declare-fun lt!433645 () ListLongMap!13227)

(declare-fun lt!433647 () tuple2!14530)

(declare-fun lt!433649 () tuple2!14530)

(declare-fun +!2934 (ListLongMap!13227 tuple2!14530) ListLongMap!13227)

(assert (=> b!978180 (= (+!2934 (+!2934 lt!433645 lt!433647) lt!433649) (+!2934 (+!2934 lt!433645 lt!433649) lt!433647))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!433646 () V!35075)

(assert (=> b!978180 (= lt!433649 (tuple2!14531 (select (arr!29440 _keys!1544) from!1932) lt!433646))))

(declare-fun minValue!1220 () V!35075)

(assert (=> b!978180 (= lt!433647 (tuple2!14531 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32507 0))(
  ( (Unit!32508) )
))
(declare-fun lt!433648 () Unit!32507)

(declare-fun addCommutativeForDiffKeys!562 (ListLongMap!13227 (_ BitVec 64) V!35075 (_ BitVec 64) V!35075) Unit!32507)

(assert (=> b!978180 (= lt!433648 (addCommutativeForDiffKeys!562 lt!433645 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29440 _keys!1544) from!1932) lt!433646))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15239 (ValueCell!10803 V!35075) V!35075)

(declare-fun dynLambda!1722 (Int (_ BitVec 64)) V!35075)

(assert (=> b!978180 (= lt!433646 (get!15239 (select (arr!29441 _values!1278) from!1932) (dynLambda!1722 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35075)

(declare-fun getCurrentListMapNoExtraKeys!3336 (array!61165 array!61167 (_ BitVec 32) (_ BitVec 32) V!35075 V!35075 (_ BitVec 32) Int) ListLongMap!13227)

(assert (=> b!978180 (= lt!433645 (+!2934 (getCurrentListMapNoExtraKeys!3336 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978181 () Bool)

(declare-fun res!654620 () Bool)

(assert (=> b!978181 (=> (not res!654620) (not e!551495))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978181 (= res!654620 (validKeyInArray!0 (select (arr!29440 _keys!1544) from!1932)))))

(declare-fun b!978182 () Bool)

(declare-fun res!654618 () Bool)

(assert (=> b!978182 (=> (not res!654618) (not e!551495))))

(assert (=> b!978182 (= res!654618 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29919 _keys!1544))))))

(assert (= (and start!83766 res!654617) b!978173))

(assert (= (and b!978173 res!654623) b!978177))

(assert (= (and b!978177 res!654621) b!978174))

(assert (= (and b!978174 res!654622) b!978182))

(assert (= (and b!978182 res!654618) b!978181))

(assert (= (and b!978181 res!654620) b!978179))

(assert (= (and b!978179 res!654619) b!978180))

(assert (= (and b!978176 condMapEmpty!35882) mapIsEmpty!35882))

(assert (= (and b!978176 (not condMapEmpty!35882)) mapNonEmpty!35882))

(get-info :version)

(assert (= (and mapNonEmpty!35882 ((_ is ValueCellFull!10803) mapValue!35882)) b!978178))

(assert (= (and b!978176 ((_ is ValueCellFull!10803) mapDefault!35882)) b!978175))

(assert (= start!83766 b!978176))

(declare-fun b_lambda!14619 () Bool)

(assert (=> (not b_lambda!14619) (not b!978180)))

(declare-fun t!28932 () Bool)

(declare-fun tb!6381 () Bool)

(assert (=> (and start!83766 (= defaultEntry!1281 defaultEntry!1281) t!28932) tb!6381))

(declare-fun result!12751 () Bool)

(assert (=> tb!6381 (= result!12751 tp_is_empty!22569)))

(assert (=> b!978180 t!28932))

(declare-fun b_and!31241 () Bool)

(assert (= b_and!31239 (and (=> t!28932 result!12751) b_and!31241)))

(declare-fun m!905287 () Bool)

(assert (=> b!978177 m!905287))

(declare-fun m!905289 () Bool)

(assert (=> b!978181 m!905289))

(assert (=> b!978181 m!905289))

(declare-fun m!905291 () Bool)

(assert (=> b!978181 m!905291))

(declare-fun m!905293 () Bool)

(assert (=> mapNonEmpty!35882 m!905293))

(declare-fun m!905295 () Bool)

(assert (=> start!83766 m!905295))

(declare-fun m!905297 () Bool)

(assert (=> start!83766 m!905297))

(declare-fun m!905299 () Bool)

(assert (=> start!83766 m!905299))

(assert (=> b!978180 m!905289))

(declare-fun m!905301 () Bool)

(assert (=> b!978180 m!905301))

(declare-fun m!905303 () Bool)

(assert (=> b!978180 m!905303))

(declare-fun m!905305 () Bool)

(assert (=> b!978180 m!905305))

(declare-fun m!905307 () Bool)

(assert (=> b!978180 m!905307))

(declare-fun m!905309 () Bool)

(assert (=> b!978180 m!905309))

(declare-fun m!905311 () Bool)

(assert (=> b!978180 m!905311))

(assert (=> b!978180 m!905289))

(declare-fun m!905313 () Bool)

(assert (=> b!978180 m!905313))

(assert (=> b!978180 m!905311))

(declare-fun m!905315 () Bool)

(assert (=> b!978180 m!905315))

(assert (=> b!978180 m!905307))

(assert (=> b!978180 m!905303))

(declare-fun m!905317 () Bool)

(assert (=> b!978180 m!905317))

(assert (=> b!978180 m!905301))

(assert (=> b!978180 m!905317))

(declare-fun m!905319 () Bool)

(assert (=> b!978180 m!905319))

(declare-fun m!905321 () Bool)

(assert (=> b!978174 m!905321))

(check-sat b_and!31241 (not b!978180) (not mapNonEmpty!35882) (not b!978181) (not b_lambda!14619) (not start!83766) tp_is_empty!22569 (not b!978177) (not b_next!19575) (not b!978174))
(check-sat b_and!31241 (not b_next!19575))
