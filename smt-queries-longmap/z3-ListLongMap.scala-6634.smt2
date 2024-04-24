; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83944 () Bool)

(assert start!83944)

(declare-fun b_free!19585 () Bool)

(declare-fun b_next!19585 () Bool)

(assert (=> start!83944 (= b_free!19585 (not b_next!19585))))

(declare-fun tp!68198 () Bool)

(declare-fun b_and!31269 () Bool)

(assert (=> start!83944 (= tp!68198 b_and!31269)))

(declare-fun b!979236 () Bool)

(declare-fun res!655070 () Bool)

(declare-fun e!552153 () Bool)

(assert (=> b!979236 (=> (not res!655070) (not e!552153))))

(declare-fun from!1932 () (_ BitVec 32))

(declare-datatypes ((array!61208 0))(
  ( (array!61209 (arr!29457 (Array (_ BitVec 32) (_ BitVec 64))) (size!29937 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61208)

(assert (=> b!979236 (= res!655070 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29937 _keys!1544))))))

(declare-fun b!979237 () Bool)

(assert (=> b!979237 (= e!552153 (not true))))

(declare-datatypes ((V!35089 0))(
  ( (V!35090 (val!11340 Int)) )
))
(declare-datatypes ((tuple2!14542 0))(
  ( (tuple2!14543 (_1!7282 (_ BitVec 64)) (_2!7282 V!35089)) )
))
(declare-datatypes ((List!20406 0))(
  ( (Nil!20403) (Cons!20402 (h!21570 tuple2!14542) (t!28939 List!20406)) )
))
(declare-datatypes ((ListLongMap!13241 0))(
  ( (ListLongMap!13242 (toList!6636 List!20406)) )
))
(declare-fun lt!434084 () ListLongMap!13241)

(declare-fun lt!434085 () tuple2!14542)

(declare-fun lt!434081 () tuple2!14542)

(declare-fun +!2951 (ListLongMap!13241 tuple2!14542) ListLongMap!13241)

(assert (=> b!979237 (= (+!2951 (+!2951 lt!434084 lt!434085) lt!434081) (+!2951 (+!2951 lt!434084 lt!434081) lt!434085))))

(declare-fun lt!434083 () V!35089)

(assert (=> b!979237 (= lt!434081 (tuple2!14543 (select (arr!29457 _keys!1544) from!1932) lt!434083))))

(declare-fun minValue!1220 () V!35089)

(assert (=> b!979237 (= lt!434085 (tuple2!14543 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-datatypes ((Unit!32482 0))(
  ( (Unit!32483) )
))
(declare-fun lt!434082 () Unit!32482)

(declare-fun addCommutativeForDiffKeys!558 (ListLongMap!13241 (_ BitVec 64) V!35089 (_ BitVec 64) V!35089) Unit!32482)

(assert (=> b!979237 (= lt!434082 (addCommutativeForDiffKeys!558 lt!434084 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29457 _keys!1544) from!1932) lt!434083))))

(declare-datatypes ((ValueCell!10808 0))(
  ( (ValueCellFull!10808 (v!13899 V!35089)) (EmptyCell!10808) )
))
(declare-datatypes ((array!61210 0))(
  ( (array!61211 (arr!29458 (Array (_ BitVec 32) ValueCell!10808)) (size!29938 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61210)

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15271 (ValueCell!10808 V!35089) V!35089)

(declare-fun dynLambda!1746 (Int (_ BitVec 64)) V!35089)

(assert (=> b!979237 (= lt!434083 (get!15271 (select (arr!29458 _values!1278) from!1932) (dynLambda!1746 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun zeroValue!1220 () V!35089)

(declare-fun getCurrentListMapNoExtraKeys!3384 (array!61208 array!61210 (_ BitVec 32) (_ BitVec 32) V!35089 V!35089 (_ BitVec 32) Int) ListLongMap!13241)

(assert (=> b!979237 (= lt!434084 (+!2951 (getCurrentListMapNoExtraKeys!3384 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281) (tuple2!14543 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220)))))

(declare-fun b!979238 () Bool)

(declare-fun res!655067 () Bool)

(assert (=> b!979238 (=> (not res!655067) (not e!552153))))

(declare-datatypes ((List!20407 0))(
  ( (Nil!20404) (Cons!20403 (h!21571 (_ BitVec 64)) (t!28940 List!20407)) )
))
(declare-fun arrayNoDuplicates!0 (array!61208 (_ BitVec 32) List!20407) Bool)

(assert (=> b!979238 (= res!655067 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20404))))

(declare-fun b!979239 () Bool)

(declare-fun e!552149 () Bool)

(declare-fun tp_is_empty!22579 () Bool)

(assert (=> b!979239 (= e!552149 tp_is_empty!22579)))

(declare-fun b!979240 () Bool)

(declare-fun res!655068 () Bool)

(assert (=> b!979240 (=> (not res!655068) (not e!552153))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61208 (_ BitVec 32)) Bool)

(assert (=> b!979240 (= res!655068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!979241 () Bool)

(declare-fun e!552150 () Bool)

(declare-fun mapRes!35897 () Bool)

(assert (=> b!979241 (= e!552150 (and e!552149 mapRes!35897))))

(declare-fun condMapEmpty!35897 () Bool)

(declare-fun mapDefault!35897 () ValueCell!10808)

(assert (=> b!979241 (= condMapEmpty!35897 (= (arr!29458 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10808)) mapDefault!35897)))))

(declare-fun mapNonEmpty!35897 () Bool)

(declare-fun tp!68197 () Bool)

(declare-fun e!552151 () Bool)

(assert (=> mapNonEmpty!35897 (= mapRes!35897 (and tp!68197 e!552151))))

(declare-fun mapRest!35897 () (Array (_ BitVec 32) ValueCell!10808))

(declare-fun mapValue!35897 () ValueCell!10808)

(declare-fun mapKey!35897 () (_ BitVec 32))

(assert (=> mapNonEmpty!35897 (= (arr!29458 _values!1278) (store mapRest!35897 mapKey!35897 mapValue!35897))))

(declare-fun res!655069 () Bool)

(assert (=> start!83944 (=> (not res!655069) (not e!552153))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83944 (= res!655069 (validMask!0 mask!1948))))

(assert (=> start!83944 e!552153))

(assert (=> start!83944 true))

(assert (=> start!83944 tp_is_empty!22579))

(declare-fun array_inv!22815 (array!61210) Bool)

(assert (=> start!83944 (and (array_inv!22815 _values!1278) e!552150)))

(assert (=> start!83944 tp!68198))

(declare-fun array_inv!22816 (array!61208) Bool)

(assert (=> start!83944 (array_inv!22816 _keys!1544)))

(declare-fun b!979242 () Bool)

(declare-fun res!655072 () Bool)

(assert (=> b!979242 (=> (not res!655072) (not e!552153))))

(assert (=> b!979242 (= res!655072 (and (= (size!29938 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29937 _keys!1544) (size!29938 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!979243 () Bool)

(assert (=> b!979243 (= e!552151 tp_is_empty!22579)))

(declare-fun b!979244 () Bool)

(declare-fun res!655066 () Bool)

(assert (=> b!979244 (=> (not res!655066) (not e!552153))))

(assert (=> b!979244 (= res!655066 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!35897 () Bool)

(assert (=> mapIsEmpty!35897 mapRes!35897))

(declare-fun b!979245 () Bool)

(declare-fun res!655071 () Bool)

(assert (=> b!979245 (=> (not res!655071) (not e!552153))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!979245 (= res!655071 (validKeyInArray!0 (select (arr!29457 _keys!1544) from!1932)))))

(assert (= (and start!83944 res!655069) b!979242))

(assert (= (and b!979242 res!655072) b!979240))

(assert (= (and b!979240 res!655068) b!979238))

(assert (= (and b!979238 res!655067) b!979236))

(assert (= (and b!979236 res!655070) b!979245))

(assert (= (and b!979245 res!655071) b!979244))

(assert (= (and b!979244 res!655066) b!979237))

(assert (= (and b!979241 condMapEmpty!35897) mapIsEmpty!35897))

(assert (= (and b!979241 (not condMapEmpty!35897)) mapNonEmpty!35897))

(get-info :version)

(assert (= (and mapNonEmpty!35897 ((_ is ValueCellFull!10808) mapValue!35897)) b!979243))

(assert (= (and b!979241 ((_ is ValueCellFull!10808) mapDefault!35897)) b!979239))

(assert (= start!83944 b!979241))

(declare-fun b_lambda!14643 () Bool)

(assert (=> (not b_lambda!14643) (not b!979237)))

(declare-fun t!28938 () Bool)

(declare-fun tb!6383 () Bool)

(assert (=> (and start!83944 (= defaultEntry!1281 defaultEntry!1281) t!28938) tb!6383))

(declare-fun result!12763 () Bool)

(assert (=> tb!6383 (= result!12763 tp_is_empty!22579)))

(assert (=> b!979237 t!28938))

(declare-fun b_and!31271 () Bool)

(assert (= b_and!31269 (and (=> t!28938 result!12763) b_and!31271)))

(declare-fun m!906761 () Bool)

(assert (=> b!979238 m!906761))

(declare-fun m!906763 () Bool)

(assert (=> start!83944 m!906763))

(declare-fun m!906765 () Bool)

(assert (=> start!83944 m!906765))

(declare-fun m!906767 () Bool)

(assert (=> start!83944 m!906767))

(declare-fun m!906769 () Bool)

(assert (=> b!979240 m!906769))

(declare-fun m!906771 () Bool)

(assert (=> mapNonEmpty!35897 m!906771))

(declare-fun m!906773 () Bool)

(assert (=> b!979245 m!906773))

(assert (=> b!979245 m!906773))

(declare-fun m!906775 () Bool)

(assert (=> b!979245 m!906775))

(declare-fun m!906777 () Bool)

(assert (=> b!979237 m!906777))

(declare-fun m!906779 () Bool)

(assert (=> b!979237 m!906779))

(assert (=> b!979237 m!906773))

(declare-fun m!906781 () Bool)

(assert (=> b!979237 m!906781))

(assert (=> b!979237 m!906773))

(declare-fun m!906783 () Bool)

(assert (=> b!979237 m!906783))

(declare-fun m!906785 () Bool)

(assert (=> b!979237 m!906785))

(assert (=> b!979237 m!906785))

(declare-fun m!906787 () Bool)

(assert (=> b!979237 m!906787))

(declare-fun m!906789 () Bool)

(assert (=> b!979237 m!906789))

(assert (=> b!979237 m!906789))

(declare-fun m!906791 () Bool)

(assert (=> b!979237 m!906791))

(assert (=> b!979237 m!906777))

(declare-fun m!906793 () Bool)

(assert (=> b!979237 m!906793))

(assert (=> b!979237 m!906781))

(assert (=> b!979237 m!906793))

(declare-fun m!906795 () Bool)

(assert (=> b!979237 m!906795))

(check-sat (not b_next!19585) (not b_lambda!14643) b_and!31271 (not start!83944) (not mapNonEmpty!35897) tp_is_empty!22579 (not b!979237) (not b!979240) (not b!979238) (not b!979245))
(check-sat b_and!31271 (not b_next!19585))
