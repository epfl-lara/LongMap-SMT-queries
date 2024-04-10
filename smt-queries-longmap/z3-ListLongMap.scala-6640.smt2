; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!83814 () Bool)

(assert start!83814)

(declare-fun b_free!19623 () Bool)

(declare-fun b_next!19623 () Bool)

(assert (=> start!83814 (= b_free!19623 (not b_next!19623))))

(declare-fun tp!68310 () Bool)

(declare-fun b_and!31335 () Bool)

(assert (=> start!83814 (= tp!68310 b_and!31335)))

(declare-fun mapNonEmpty!35954 () Bool)

(declare-fun mapRes!35954 () Bool)

(declare-fun tp!68311 () Bool)

(declare-fun e!551857 () Bool)

(assert (=> mapNonEmpty!35954 (= mapRes!35954 (and tp!68311 e!551857))))

(declare-datatypes ((V!35139 0))(
  ( (V!35140 (val!11359 Int)) )
))
(declare-datatypes ((ValueCell!10827 0))(
  ( (ValueCellFull!10827 (v!13921 V!35139)) (EmptyCell!10827) )
))
(declare-datatypes ((array!61257 0))(
  ( (array!61258 (arr!29486 (Array (_ BitVec 32) ValueCell!10827)) (size!29965 (_ BitVec 32))) )
))
(declare-fun _values!1278 () array!61257)

(declare-fun mapRest!35954 () (Array (_ BitVec 32) ValueCell!10827))

(declare-fun mapValue!35954 () ValueCell!10827)

(declare-fun mapKey!35954 () (_ BitVec 32))

(assert (=> mapNonEmpty!35954 (= (arr!29486 _values!1278) (store mapRest!35954 mapKey!35954 mapValue!35954))))

(declare-fun b!978946 () Bool)

(declare-fun res!655133 () Bool)

(declare-fun e!551860 () Bool)

(assert (=> b!978946 (=> (not res!655133) (not e!551860))))

(declare-datatypes ((array!61259 0))(
  ( (array!61260 (arr!29487 (Array (_ BitVec 32) (_ BitVec 64))) (size!29966 (_ BitVec 32))) )
))
(declare-fun _keys!1544 () array!61259)

(declare-fun mask!1948 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!61259 (_ BitVec 32)) Bool)

(assert (=> b!978946 (= res!655133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1544 mask!1948))))

(declare-fun b!978947 () Bool)

(declare-fun e!551862 () Bool)

(assert (=> b!978947 (= e!551862 true)))

(declare-datatypes ((tuple2!14570 0))(
  ( (tuple2!14571 (_1!7296 (_ BitVec 64)) (_2!7296 V!35139)) )
))
(declare-fun lt!434031 () tuple2!14570)

(declare-datatypes ((List!20440 0))(
  ( (Nil!20437) (Cons!20436 (h!21598 tuple2!14570) (t!29019 List!20440)) )
))
(declare-datatypes ((ListLongMap!13267 0))(
  ( (ListLongMap!13268 (toList!6649 List!20440)) )
))
(declare-fun lt!434032 () ListLongMap!13267)

(declare-fun lt!434035 () ListLongMap!13267)

(declare-fun lt!434038 () tuple2!14570)

(declare-fun +!2954 (ListLongMap!13267 tuple2!14570) ListLongMap!13267)

(assert (=> b!978947 (= lt!434035 (+!2954 (+!2954 lt!434032 lt!434038) lt!434031))))

(declare-fun lt!434037 () V!35139)

(declare-datatypes ((Unit!32547 0))(
  ( (Unit!32548) )
))
(declare-fun lt!434036 () Unit!32547)

(declare-fun zeroValue!1220 () V!35139)

(declare-fun from!1932 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!582 (ListLongMap!13267 (_ BitVec 64) V!35139 (_ BitVec 64) V!35139) Unit!32547)

(assert (=> b!978947 (= lt!434036 (addCommutativeForDiffKeys!582 lt!434032 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220 (select (arr!29487 _keys!1544) from!1932) lt!434037))))

(declare-fun b!978948 () Bool)

(declare-fun res!655132 () Bool)

(assert (=> b!978948 (=> (not res!655132) (not e!551860))))

(declare-datatypes ((List!20441 0))(
  ( (Nil!20438) (Cons!20437 (h!21599 (_ BitVec 64)) (t!29020 List!20441)) )
))
(declare-fun arrayNoDuplicates!0 (array!61259 (_ BitVec 32) List!20441) Bool)

(assert (=> b!978948 (= res!655132 (arrayNoDuplicates!0 _keys!1544 #b00000000000000000000000000000000 Nil!20438))))

(declare-fun res!655129 () Bool)

(assert (=> start!83814 (=> (not res!655129) (not e!551860))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83814 (= res!655129 (validMask!0 mask!1948))))

(assert (=> start!83814 e!551860))

(assert (=> start!83814 true))

(declare-fun tp_is_empty!22617 () Bool)

(assert (=> start!83814 tp_is_empty!22617))

(declare-fun e!551861 () Bool)

(declare-fun array_inv!22797 (array!61257) Bool)

(assert (=> start!83814 (and (array_inv!22797 _values!1278) e!551861)))

(assert (=> start!83814 tp!68310))

(declare-fun array_inv!22798 (array!61259) Bool)

(assert (=> start!83814 (array_inv!22798 _keys!1544)))

(declare-fun mapIsEmpty!35954 () Bool)

(assert (=> mapIsEmpty!35954 mapRes!35954))

(declare-fun b!978949 () Bool)

(declare-fun e!551858 () Bool)

(assert (=> b!978949 (= e!551858 tp_is_empty!22617)))

(declare-fun b!978950 () Bool)

(declare-fun res!655127 () Bool)

(assert (=> b!978950 (=> (not res!655127) (not e!551860))))

(assert (=> b!978950 (= res!655127 (and (bvsge from!1932 #b00000000000000000000000000000000) (bvslt from!1932 (size!29966 _keys!1544))))))

(declare-fun b!978951 () Bool)

(assert (=> b!978951 (= e!551860 (not e!551862))))

(declare-fun res!655131 () Bool)

(assert (=> b!978951 (=> res!655131 e!551862)))

(assert (=> b!978951 (= res!655131 (= #b0000000000000000000000000000000000000000000000000000000000000000 (select (arr!29487 _keys!1544) from!1932)))))

(declare-fun lt!434034 () ListLongMap!13267)

(declare-fun lt!434030 () tuple2!14570)

(assert (=> b!978951 (= (+!2954 lt!434034 lt!434038) (+!2954 lt!434035 lt!434030))))

(declare-fun lt!434033 () ListLongMap!13267)

(assert (=> b!978951 (= lt!434035 (+!2954 lt!434033 lt!434038))))

(assert (=> b!978951 (= lt!434038 (tuple2!14571 (select (arr!29487 _keys!1544) from!1932) lt!434037))))

(assert (=> b!978951 (= lt!434034 (+!2954 lt!434033 lt!434030))))

(declare-fun minValue!1220 () V!35139)

(assert (=> b!978951 (= lt!434030 (tuple2!14571 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220))))

(declare-fun lt!434039 () Unit!32547)

(assert (=> b!978951 (= lt!434039 (addCommutativeForDiffKeys!582 lt!434033 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1220 (select (arr!29487 _keys!1544) from!1932) lt!434037))))

(declare-fun defaultEntry!1281 () Int)

(declare-fun get!15275 (ValueCell!10827 V!35139) V!35139)

(declare-fun dynLambda!1742 (Int (_ BitVec 64)) V!35139)

(assert (=> b!978951 (= lt!434037 (get!15275 (select (arr!29486 _values!1278) from!1932) (dynLambda!1742 defaultEntry!1281 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!978951 (= lt!434033 (+!2954 lt!434032 lt!434031))))

(assert (=> b!978951 (= lt!434031 (tuple2!14571 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1220))))

(declare-fun extraKeys!1199 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3356 (array!61259 array!61257 (_ BitVec 32) (_ BitVec 32) V!35139 V!35139 (_ BitVec 32) Int) ListLongMap!13267)

(assert (=> b!978951 (= lt!434032 (getCurrentListMapNoExtraKeys!3356 _keys!1544 _values!1278 mask!1948 extraKeys!1199 zeroValue!1220 minValue!1220 (bvadd #b00000000000000000000000000000001 from!1932) defaultEntry!1281))))

(declare-fun b!978952 () Bool)

(declare-fun res!655128 () Bool)

(assert (=> b!978952 (=> (not res!655128) (not e!551860))))

(assert (=> b!978952 (= res!655128 (and (not (= (bvand extraKeys!1199 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1199 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!978953 () Bool)

(assert (=> b!978953 (= e!551861 (and e!551858 mapRes!35954))))

(declare-fun condMapEmpty!35954 () Bool)

(declare-fun mapDefault!35954 () ValueCell!10827)

(assert (=> b!978953 (= condMapEmpty!35954 (= (arr!29486 _values!1278) ((as const (Array (_ BitVec 32) ValueCell!10827)) mapDefault!35954)))))

(declare-fun b!978954 () Bool)

(declare-fun res!655126 () Bool)

(assert (=> b!978954 (=> (not res!655126) (not e!551860))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!978954 (= res!655126 (validKeyInArray!0 (select (arr!29487 _keys!1544) from!1932)))))

(declare-fun b!978955 () Bool)

(declare-fun res!655130 () Bool)

(assert (=> b!978955 (=> (not res!655130) (not e!551860))))

(assert (=> b!978955 (= res!655130 (and (= (size!29965 _values!1278) (bvadd #b00000000000000000000000000000001 mask!1948)) (= (size!29966 _keys!1544) (size!29965 _values!1278)) (bvsge mask!1948 #b00000000000000000000000000000000) (bvsge extraKeys!1199 #b00000000000000000000000000000000) (bvsle extraKeys!1199 #b00000000000000000000000000000011)))))

(declare-fun b!978956 () Bool)

(assert (=> b!978956 (= e!551857 tp_is_empty!22617)))

(assert (= (and start!83814 res!655129) b!978955))

(assert (= (and b!978955 res!655130) b!978946))

(assert (= (and b!978946 res!655133) b!978948))

(assert (= (and b!978948 res!655132) b!978950))

(assert (= (and b!978950 res!655127) b!978954))

(assert (= (and b!978954 res!655126) b!978952))

(assert (= (and b!978952 res!655128) b!978951))

(assert (= (and b!978951 (not res!655131)) b!978947))

(assert (= (and b!978953 condMapEmpty!35954) mapIsEmpty!35954))

(assert (= (and b!978953 (not condMapEmpty!35954)) mapNonEmpty!35954))

(get-info :version)

(assert (= (and mapNonEmpty!35954 ((_ is ValueCellFull!10827) mapValue!35954)) b!978956))

(assert (= (and b!978953 ((_ is ValueCellFull!10827) mapDefault!35954)) b!978949))

(assert (= start!83814 b!978953))

(declare-fun b_lambda!14667 () Bool)

(assert (=> (not b_lambda!14667) (not b!978951)))

(declare-fun t!29018 () Bool)

(declare-fun tb!6429 () Bool)

(assert (=> (and start!83814 (= defaultEntry!1281 defaultEntry!1281) t!29018) tb!6429))

(declare-fun result!12847 () Bool)

(assert (=> tb!6429 (= result!12847 tp_is_empty!22617)))

(assert (=> b!978951 t!29018))

(declare-fun b_and!31337 () Bool)

(assert (= b_and!31335 (and (=> t!29018 result!12847) b_and!31337)))

(declare-fun m!906157 () Bool)

(assert (=> mapNonEmpty!35954 m!906157))

(declare-fun m!906159 () Bool)

(assert (=> b!978947 m!906159))

(assert (=> b!978947 m!906159))

(declare-fun m!906161 () Bool)

(assert (=> b!978947 m!906161))

(declare-fun m!906163 () Bool)

(assert (=> b!978947 m!906163))

(assert (=> b!978947 m!906163))

(declare-fun m!906165 () Bool)

(assert (=> b!978947 m!906165))

(declare-fun m!906167 () Bool)

(assert (=> b!978951 m!906167))

(declare-fun m!906169 () Bool)

(assert (=> b!978951 m!906169))

(declare-fun m!906171 () Bool)

(assert (=> b!978951 m!906171))

(assert (=> b!978951 m!906163))

(declare-fun m!906173 () Bool)

(assert (=> b!978951 m!906173))

(declare-fun m!906175 () Bool)

(assert (=> b!978951 m!906175))

(declare-fun m!906177 () Bool)

(assert (=> b!978951 m!906177))

(assert (=> b!978951 m!906163))

(declare-fun m!906179 () Bool)

(assert (=> b!978951 m!906179))

(declare-fun m!906181 () Bool)

(assert (=> b!978951 m!906181))

(declare-fun m!906183 () Bool)

(assert (=> b!978951 m!906183))

(assert (=> b!978951 m!906169))

(assert (=> b!978951 m!906181))

(declare-fun m!906185 () Bool)

(assert (=> b!978951 m!906185))

(declare-fun m!906187 () Bool)

(assert (=> start!83814 m!906187))

(declare-fun m!906189 () Bool)

(assert (=> start!83814 m!906189))

(declare-fun m!906191 () Bool)

(assert (=> start!83814 m!906191))

(assert (=> b!978954 m!906163))

(assert (=> b!978954 m!906163))

(declare-fun m!906193 () Bool)

(assert (=> b!978954 m!906193))

(declare-fun m!906195 () Bool)

(assert (=> b!978946 m!906195))

(declare-fun m!906197 () Bool)

(assert (=> b!978948 m!906197))

(check-sat (not b!978947) (not b!978948) (not start!83814) (not b_next!19623) tp_is_empty!22617 (not b!978954) (not b!978951) (not b!978946) (not mapNonEmpty!35954) b_and!31337 (not b_lambda!14667))
(check-sat b_and!31337 (not b_next!19623))
