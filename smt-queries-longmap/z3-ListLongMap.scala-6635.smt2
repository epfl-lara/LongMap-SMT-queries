; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83764 () Bool)

(assert start!83764)

(declare-fun b_free!19591 () Bool)

(declare-fun b_next!19591 () Bool)

(assert (=> start!83764 (= b_free!19591 (not b_next!19591))))

(declare-fun tp!68216 () Bool)

(declare-fun b_and!31245 () Bool)

(assert (=> start!83764 (= tp!68216 b_and!31245)))

(declare-fun b!978190 () Bool)

(declare-fun res!654681 () Bool)

(declare-fun e!551467 () Bool)

(assert (=> b!978190 (=> (not res!654681) (not e!551467))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-datatypes ((array!61120 0))(
  ( (array!61121 (arr!29418 (Array (_ BitVec 32) (_ BitVec 64))) (size!29899 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61120)

(declare-datatypes ((V!35097 0))(
  ( (V!35098 (val!11343 Int)) )
))
(declare-datatypes ((ValueCell!10811 0))(
  ( (ValueCellFull!10811 (v!13904 V!35097)) (EmptyCell!10811) )
))
(declare-datatypes ((array!61122 0))(
  ( (array!61123 (arr!29419 (Array (_ BitVec 32) ValueCell!10811)) (size!29900 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61122)

(assert (=> b!978190 (= res!654681 (and (= (size!29900 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29899 _keys!1544) (size!29900 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978191 () Bool)

(declare-fun res!654680 () Bool)

(assert (=> b!978191 (=> (not res!654680) (not e!551467))))

(declare-datatypes ((List!20431 0))(
  ( (Nil!20428) (Cons!20427 (h!21589 (_ BitVec 64)) (t!28969 List!20431)) )
))
(declare-fun arrayNoDuplicates!0 (array!61120 (_ BitVec 32) List!20431) Bool)

(assert (=> b!978191 (= res!654680 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20428))))

(declare-fun b!978192 () Bool)

(declare-fun e!551466 () Bool)

(declare-fun tp_is_empty!22585 () Bool)

(assert (=> b!978192 (= e!551466 tp_is_empty!22585)))

(declare-fun mapNonEmpty!35906 () Bool)

(declare-fun mapRes!35906 () Bool)

(declare-fun tp!68215 () Bool)

(declare-fun e!551464 () Bool)

(assert (=> mapNonEmpty!35906 (= mapRes!35906 (and tp!68215 e!551464))))

(declare-fun mapRest!35906 () (Array (_ BitVec 32) ValueCell!10811))

(declare-fun mapKey!35906 () (_ BitVec 32))

(declare-fun mapValue!35906 () ValueCell!10811)

(assert (=> mapNonEmpty!35906 (= (arr!29419 _values!1278) (store mapRest!35906 mapKey!35906 mapValue!35906))))

(declare-fun b!978193 () Bool)

(declare-fun e!551465 () Bool)

(assert (=> b!978193 (= e!551465 (and e!551466 mapRes!35906))))

(declare-fun condMapEmpty!35906 () Bool)

(declare-fun mapDefault!35906 () ValueCell!10811)

(assert (=> b!978193 (= condMapEmpty!35906 (= (arr!29419 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10811)) mapDefault!35906)))))

(declare-fun res!654675 () Bool)

(assert (=> start!83764 (=> (not res!654675) (not e!551467))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83764 (= res!654675 (validMask!0 mask!1948))))

(assert (=> start!83764 e!551467))

(assert (=> start!83764 true))

(assert (=> start!83764 tp_is_empty!22585))

(declare-fun array_inv!22783 (array!61122) Bool)

(assert (=> start!83764 (and (array_inv!22783 _values!1278) e!551465)))

(assert (=> start!83764 tp!68216))

(declare-fun array_inv!22784 (array!61120) Bool)

(assert (=> start!83764 (array_inv!22784 _keys!1544)))

(declare-fun b!978194 () Bool)

(declare-fun res!654679 () Bool)

(assert (=> b!978194 (=> (not res!654679) (not e!551467))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61120 (_ BitVec 32)) Bool)

(assert (=> b!978194 (= res!654679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978195 () Bool)

(assert (=> b!978195 (= e!551464 tp_is_empty!22585)))

(declare-fun b!978196 () Bool)

(declare-fun res!654677 () Bool)

(assert (=> b!978196 (=> (not res!654677) (not e!551467))))

(assert (=> b!978196 (= res!654677 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!35906 () Bool)

(assert (=> mapIsEmpty!35906 mapRes!35906))

(declare-fun b!978197 () Bool)

(assert (=> b!978197 (= e!551467 (not true))))

(declare-datatypes ((tuple2!14604 0))(
  ( (tuple2!14605 (_1!7313 (_ BitVec 64)) (_2!7313 V!35097)) )
))
(declare-datatypes ((List!20432 0))(
  ( (Nil!20429) (Cons!20428 (h!21590 tuple2!14604) (t!28970 List!20432)) )
))
(declare-datatypes ((ListLongMap!13291 0))(
  ( (ListLongMap!13292 (toList!6661 List!20432)) )
))
(declare-fun lt!433529 () ListLongMap!13291)

(declare-fun lt!433531 () tuple2!14604)

(declare-fun lt!433533 () tuple2!14604)

(declare-fun +!2961 (ListLongMap!13291 tuple2!14604) ListLongMap!13291)

(assert (=> b!978197 (= (+!2961 (+!2961 lt!433529 lt!433531) lt!433533) (+!2961 (+!2961 lt!433529 lt!433533) lt!433531))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun lt!433530 () V!35097)

(assert (=> b!978197 (= lt!433533 (tuple2!14605 (select (arr!29418 _keys!1544) from!1932) lt!433530))))

(declare-fun minValue!1220 () V!35097)

(assert (=> b!978197 (= lt!433531 (tuple2!14605 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32388 0))(
  ( (Unit!32389) )
))
(declare-fun lt!433532 () Unit!32388)

(declare-fun addCommutativeForDiffKeys!565 (ListLongMap!13291 (_ BitVec 64) V!35097 (_ BitVec 64) V!35097) Unit!32388)

(assert (=> b!978197 (= lt!433532 (addCommutativeForDiffKeys!565 lt!433529 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29418 _keys!1544) from!1932) lt!433530))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15242 (ValueCell!10811 V!35097) V!35097)

(declare-fun dynLambda!1714 (Int (_ BitVec 64)) V!35097)

(assert (=> b!978197 (= lt!433530 (get!15242 (select (arr!29419 _values!1278) from!1932) (dynLambda!1714 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35097)

(declare-fun getCurrentListMapNoExtraKeys!3381 (array!61120 array!61122 (_ BitVec 32) (_ BitVec 32) V!35097 V!35097 (_ BitVec 32) Int) ListLongMap!13291)

(assert (=> b!978197 (= lt!433529 (+!2961 (getCurrentListMapNoExtraKeys!3381 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14605 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978198 () Bool)

(declare-fun res!654678 () Bool)

(assert (=> b!978198 (=> (not res!654678) (not e!551467))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978198 (= res!654678 (validKeyInArray!0 (select (arr!29418 _keys!1544) from!1932)))))

(declare-fun b!978199 () Bool)

(declare-fun res!654676 () Bool)

(assert (=> b!978199 (=> (not res!654676) (not e!551467))))

(assert (=> b!978199 (= res!654676 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29899 _keys!1544))))))

(assert (= (and start!83764 res!654675) b!978190))

(assert (= (and b!978190 res!654681) b!978194))

(assert (= (and b!978194 res!654679) b!978191))

(assert (= (and b!978191 res!654680) b!978199))

(assert (= (and b!978199 res!654676) b!978198))

(assert (= (and b!978198 res!654678) b!978196))

(assert (= (and b!978196 res!654677) b!978197))

(assert (= (and b!978193 condMapEmpty!35906) mapIsEmpty!35906))

(assert (= (and b!978193 (not condMapEmpty!35906)) mapNonEmpty!35906))

(get-info :version)

(assert (= (and mapNonEmpty!35906 ((_ is ValueCellFull!10811) mapValue!35906)) b!978195))

(assert (= (and b!978193 ((_ is ValueCellFull!10811) mapDefault!35906)) b!978192))

(assert (= start!83764 b!978193))

(declare-fun b_lambda!14617 () Bool)

(assert (=> (not b_lambda!14617) (not b!978197)))

(declare-fun t!28968 () Bool)

(declare-fun tb!6389 () Bool)

(assert (=> (and start!83764 (= defaultEntry!1281 defaultEntry!1281) t!28968) tb!6389))

(declare-fun result!12775 () Bool)

(assert (=> tb!6389 (= result!12775 tp_is_empty!22585)))

(assert (=> b!978197 t!28968))

(declare-fun b_and!31247 () Bool)

(assert (= b_and!31245 (and (=> t!28968 result!12775) b_and!31247)))

(declare-fun m!904817 () Bool)

(assert (=> b!978194 m!904817))

(declare-fun m!904819 () Bool)

(assert (=> b!978198 m!904819))

(assert (=> b!978198 m!904819))

(declare-fun m!904821 () Bool)

(assert (=> b!978198 m!904821))

(declare-fun m!904823 () Bool)

(assert (=> mapNonEmpty!35906 m!904823))

(declare-fun m!904825 () Bool)

(assert (=> start!83764 m!904825))

(declare-fun m!904827 () Bool)

(assert (=> start!83764 m!904827))

(declare-fun m!904829 () Bool)

(assert (=> start!83764 m!904829))

(assert (=> b!978197 m!904819))

(declare-fun m!904831 () Bool)

(assert (=> b!978197 m!904831))

(declare-fun m!904833 () Bool)

(assert (=> b!978197 m!904833))

(declare-fun m!904835 () Bool)

(assert (=> b!978197 m!904835))

(declare-fun m!904837 () Bool)

(assert (=> b!978197 m!904837))

(declare-fun m!904839 () Bool)

(assert (=> b!978197 m!904839))

(declare-fun m!904841 () Bool)

(assert (=> b!978197 m!904841))

(assert (=> b!978197 m!904819))

(declare-fun m!904843 () Bool)

(assert (=> b!978197 m!904843))

(assert (=> b!978197 m!904841))

(declare-fun m!904845 () Bool)

(assert (=> b!978197 m!904845))

(assert (=> b!978197 m!904837))

(assert (=> b!978197 m!904833))

(declare-fun m!904847 () Bool)

(assert (=> b!978197 m!904847))

(assert (=> b!978197 m!904831))

(assert (=> b!978197 m!904847))

(declare-fun m!904849 () Bool)

(assert (=> b!978197 m!904849))

(declare-fun m!904851 () Bool)

(assert (=> b!978191 m!904851))

(check-sat b_and!31247 (not b!978197) (not mapNonEmpty!35906) (not b!978198) (not b_lambda!14617) (not start!83764) tp_is_empty!22585 (not b!978194) (not b_next!19591) (not b!978191))
(check-sat b_and!31247 (not b_next!19591))
