; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83920 () Bool)

(assert start!83920)

(declare-fun b_free!19561 () Bool)

(declare-fun b_next!19561 () Bool)

(assert (=> start!83920 (= b_free!19561 (not b_next!19561))))

(declare-fun tp!68126 () Bool)

(declare-fun b_and!31221 () Bool)

(assert (=> start!83920 (= tp!68126 b_and!31221)))

(declare-fun b!978852 () Bool)

(declare-fun res!654820 () Bool)

(declare-fun e!551972 () Bool)

(assert (=> b!978852 (=> (not res!654820) (not e!551972))))

(declare-datatypes ((array!61164 0))(
  ( (array!61165 (arr!29435 (Array (_ BitVec 32) (_ BitVec 64))) (size!29915 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61164)

(declare-datatypes ((List!20389 0))(
  ( (Nil!20386) (Cons!20385 (h!21553 (_ BitVec 64)) (t!28898 List!20389)) )
))
(declare-fun arrayNoDuplicates!0 (array!61164 (_ BitVec 32) List!20389) Bool)

(assert (=> b!978852 (= res!654820 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20386))))

(declare-fun b!978853 () Bool)

(declare-fun res!654816 () Bool)

(assert (=> b!978853 (=> (not res!654816) (not e!551972))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978853 (= res!654816 (validKeyInArray!0 (select (arr!29435 _keys!1544) from!1932)))))

(declare-fun b!978854 () Bool)

(declare-fun res!654818 () Bool)

(assert (=> b!978854 (=> (not res!654818) (not e!551972))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61164 (_ BitVec 32)) Bool)

(assert (=> b!978854 (= res!654818 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978855 () Bool)

(declare-fun e!551970 () Bool)

(declare-fun tp_is_empty!22555 () Bool)

(assert (=> b!978855 (= e!551970 tp_is_empty!22555)))

(declare-fun b!978856 () Bool)

(declare-fun res!654815 () Bool)

(assert (=> b!978856 (=> (not res!654815) (not e!551972))))

(declare-datatypes ((V!35057 0))(
  ( (V!35058 (val!11328 Int)) )
))
(declare-datatypes ((ValueCell!10796 0))(
  ( (ValueCellFull!10796 (v!13887 V!35057)) (EmptyCell!10796) )
))
(declare-datatypes ((array!61166 0))(
  ( (array!61167 (arr!29436 (Array (_ BitVec 32) ValueCell!10796)) (size!29916 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61166)

(declare-fun extraKeys!1199 () (_ BitVec 32))

(assert (=> b!978856 (= res!654815 (and (= (size!29916 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29915 _keys!1544) (size!29916 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun res!654817 () Bool)

(assert (=> start!83920 (=> (not res!654817) (not e!551972))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83920 (= res!654817 (validMask!0 mask!1948))))

(assert (=> start!83920 e!551972))

(assert (=> start!83920 true))

(assert (=> start!83920 tp_is_empty!22555))

(declare-fun e!551973 () Bool)

(declare-fun array_inv!22803 (array!61166) Bool)

(assert (=> start!83920 (and (array_inv!22803 _values!1278) e!551973)))

(assert (=> start!83920 tp!68126))

(declare-fun array_inv!22804 (array!61164) Bool)

(assert (=> start!83920 (array_inv!22804 _keys!1544)))

(declare-fun b!978857 () Bool)

(assert (=> b!978857 (= e!551972 (not true))))

(declare-datatypes ((tuple2!14526 0))(
  ( (tuple2!14527 (_1!7274 (_ BitVec 64)) (_2!7274 V!35057)) )
))
(declare-datatypes ((List!20390 0))(
  ( (Nil!20387) (Cons!20386 (h!21554 tuple2!14526) (t!28899 List!20390)) )
))
(declare-datatypes ((ListLongMap!13225 0))(
  ( (ListLongMap!13226 (toList!6628 List!20390)) )
))
(declare-fun lt!433901 () ListLongMap!13225)

(declare-fun lt!433903 () tuple2!14526)

(declare-fun lt!433905 () tuple2!14526)

(declare-fun +!2943 (ListLongMap!13225 tuple2!14526) ListLongMap!13225)

(assert (=> b!978857 (= (+!2943 (+!2943 lt!433901 lt!433903) lt!433905) (+!2943 (+!2943 lt!433901 lt!433905) lt!433903))))

(declare-fun lt!433904 () V!35057)

(assert (=> b!978857 (= lt!433905 (tuple2!14527 (select (arr!29435 _keys!1544) from!1932) lt!433904))))

(declare-fun minValue!1220 () V!35057)

(assert (=> b!978857 (= lt!433903 (tuple2!14527 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32466 0))(
  ( (Unit!32467) )
))
(declare-fun lt!433902 () Unit!32466)

(declare-fun addCommutativeForDiffKeys!550 (ListLongMap!13225 (_ BitVec 64) V!35057 (_ BitVec 64) V!35057) Unit!32466)

(assert (=> b!978857 (= lt!433902 (addCommutativeForDiffKeys!550 lt!433901 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29435 _keys!1544) from!1932) lt!433904))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15255 (ValueCell!10796 V!35057) V!35057)

(declare-fun dynLambda!1738 (Int (_ BitVec 64)) V!35057)

(assert (=> b!978857 (= lt!433904 (get!15255 (select (arr!29436 _values!1278) from!1932) (dynLambda!1738 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1220 () V!35057)

(declare-fun getCurrentListMapNoExtraKeys!3376 (array!61164 array!61166 (_ BitVec 32) (_ BitVec 32) V!35057 V!35057 (_ BitVec 32) Int) ListLongMap!13225)

(assert (=> b!978857 (= lt!433901 (+!2943 (getCurrentListMapNoExtraKeys!3376 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14527 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!978858 () Bool)

(declare-fun e!551969 () Bool)

(declare-fun mapRes!35861 () Bool)

(assert (=> b!978858 (= e!551973 (and e!551969 mapRes!35861))))

(declare-fun condMapEmpty!35861 () Bool)

(declare-fun mapDefault!35861 () ValueCell!10796)

(assert (=> b!978858 (= condMapEmpty!35861 (= (arr!29436 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10796)) mapDefault!35861)))))

(declare-fun mapNonEmpty!35861 () Bool)

(declare-fun tp!68125 () Bool)

(assert (=> mapNonEmpty!35861 (= mapRes!35861 (and tp!68125 e!551970))))

(declare-fun mapRest!35861 () (Array (_ BitVec 32) ValueCell!10796))

(declare-fun mapValue!35861 () ValueCell!10796)

(declare-fun mapKey!35861 () (_ BitVec 32))

(assert (=> mapNonEmpty!35861 (= (arr!29436 _values!1278) (store mapRest!35861 mapKey!35861 mapValue!35861))))

(declare-fun mapIsEmpty!35861 () Bool)

(assert (=> mapIsEmpty!35861 mapRes!35861))

(declare-fun b!978859 () Bool)

(declare-fun res!654814 () Bool)

(assert (=> b!978859 (=> (not res!654814) (not e!551972))))

(assert (=> b!978859 (= res!654814 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29915 _keys!1544))))))

(declare-fun b!978860 () Bool)

(assert (=> b!978860 (= e!551969 tp_is_empty!22555)))

(declare-fun b!978861 () Bool)

(declare-fun res!654819 () Bool)

(assert (=> b!978861 (=> (not res!654819) (not e!551972))))

(assert (=> b!978861 (= res!654819 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!83920 res!654817) b!978856))

(assert (= (and b!978856 res!654815) b!978854))

(assert (= (and b!978854 res!654818) b!978852))

(assert (= (and b!978852 res!654820) b!978859))

(assert (= (and b!978859 res!654814) b!978853))

(assert (= (and b!978853 res!654816) b!978861))

(assert (= (and b!978861 res!654819) b!978857))

(assert (= (and b!978858 condMapEmpty!35861) mapIsEmpty!35861))

(assert (= (and b!978858 (not condMapEmpty!35861)) mapNonEmpty!35861))

(get-info :version)

(assert (= (and mapNonEmpty!35861 ((_ is ValueCellFull!10796) mapValue!35861)) b!978855))

(assert (= (and b!978858 ((_ is ValueCellFull!10796) mapDefault!35861)) b!978860))

(assert (= start!83920 b!978858))

(declare-fun b_lambda!14619 () Bool)

(assert (=> (not b_lambda!14619) (not b!978857)))

(declare-fun t!28897 () Bool)

(declare-fun tb!6359 () Bool)

(assert (=> (and start!83920 (= defaultEntry!1281 defaultEntry!1281) t!28897) tb!6359))

(declare-fun result!12715 () Bool)

(assert (=> tb!6359 (= result!12715 tp_is_empty!22555)))

(assert (=> b!978857 t!28897))

(declare-fun b_and!31223 () Bool)

(assert (= b_and!31221 (and (=> t!28897 result!12715) b_and!31223)))

(declare-fun m!906329 () Bool)

(assert (=> b!978854 m!906329))

(declare-fun m!906331 () Bool)

(assert (=> b!978852 m!906331))

(declare-fun m!906333 () Bool)

(assert (=> start!83920 m!906333))

(declare-fun m!906335 () Bool)

(assert (=> start!83920 m!906335))

(declare-fun m!906337 () Bool)

(assert (=> start!83920 m!906337))

(declare-fun m!906339 () Bool)

(assert (=> mapNonEmpty!35861 m!906339))

(declare-fun m!906341 () Bool)

(assert (=> b!978857 m!906341))

(declare-fun m!906343 () Bool)

(assert (=> b!978857 m!906343))

(declare-fun m!906345 () Bool)

(assert (=> b!978857 m!906345))

(assert (=> b!978857 m!906341))

(declare-fun m!906347 () Bool)

(assert (=> b!978857 m!906347))

(assert (=> b!978857 m!906343))

(declare-fun m!906349 () Bool)

(assert (=> b!978857 m!906349))

(declare-fun m!906351 () Bool)

(assert (=> b!978857 m!906351))

(declare-fun m!906353 () Bool)

(assert (=> b!978857 m!906353))

(declare-fun m!906355 () Bool)

(assert (=> b!978857 m!906355))

(assert (=> b!978857 m!906355))

(declare-fun m!906357 () Bool)

(assert (=> b!978857 m!906357))

(declare-fun m!906359 () Bool)

(assert (=> b!978857 m!906359))

(assert (=> b!978857 m!906345))

(assert (=> b!978857 m!906359))

(declare-fun m!906361 () Bool)

(assert (=> b!978857 m!906361))

(assert (=> b!978857 m!906351))

(assert (=> b!978853 m!906343))

(assert (=> b!978853 m!906343))

(declare-fun m!906363 () Bool)

(assert (=> b!978853 m!906363))

(check-sat (not b!978853) (not start!83920) (not b!978854) (not b_lambda!14619) (not b_next!19561) (not b!978857) (not mapNonEmpty!35861) tp_is_empty!22555 (not b!978852) b_and!31223)
(check-sat b_and!31223 (not b_next!19561))
