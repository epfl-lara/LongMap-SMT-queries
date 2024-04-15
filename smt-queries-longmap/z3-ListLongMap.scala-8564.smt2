; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104566 () Bool)

(assert start!104566)

(declare-fun b!1247093 () Bool)

(declare-fun res!832176 () Bool)

(declare-fun e!707422 () Bool)

(assert (=> b!1247093 (=> (not res!832176) (not e!707422))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(declare-datatypes ((array!80257 0))(
  ( (array!80258 (arr!38700 (Array (_ BitVec 32) (_ BitVec 64))) (size!39238 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80257)

(declare-datatypes ((V!47127 0))(
  ( (V!47128 (val!15723 Int)) )
))
(declare-datatypes ((ValueCell!14897 0))(
  ( (ValueCellFull!14897 (v!18417 V!47127)) (EmptyCell!14897) )
))
(declare-datatypes ((array!80259 0))(
  ( (array!80260 (arr!38701 (Array (_ BitVec 32) ValueCell!14897)) (size!39239 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80259)

(assert (=> b!1247093 (= res!832176 (and (= (size!39239 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39238 _keys!1118) (size!39239 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1247094 () Bool)

(declare-fun e!707420 () Bool)

(declare-fun tp_is_empty!31321 () Bool)

(assert (=> b!1247094 (= e!707420 tp_is_empty!31321)))

(declare-fun b!1247095 () Bool)

(declare-fun e!707421 () Bool)

(declare-fun mapRes!48730 () Bool)

(assert (=> b!1247095 (= e!707421 (and e!707420 mapRes!48730))))

(declare-fun condMapEmpty!48730 () Bool)

(declare-fun mapDefault!48730 () ValueCell!14897)

(assert (=> b!1247095 (= condMapEmpty!48730 (= (arr!38701 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14897)) mapDefault!48730)))))

(declare-fun res!832179 () Bool)

(assert (=> start!104566 (=> (not res!832179) (not e!707422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104566 (= res!832179 (validMask!0 mask!1466))))

(assert (=> start!104566 e!707422))

(assert (=> start!104566 true))

(declare-fun array_inv!29675 (array!80257) Bool)

(assert (=> start!104566 (array_inv!29675 _keys!1118)))

(declare-fun array_inv!29676 (array!80259) Bool)

(assert (=> start!104566 (and (array_inv!29676 _values!914) e!707421)))

(declare-fun b!1247096 () Bool)

(declare-fun e!707423 () Bool)

(assert (=> b!1247096 (= e!707423 tp_is_empty!31321)))

(declare-fun b!1247097 () Bool)

(declare-fun res!832177 () Bool)

(assert (=> b!1247097 (=> (not res!832177) (not e!707422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80257 (_ BitVec 32)) Bool)

(assert (=> b!1247097 (= res!832177 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1247098 () Bool)

(declare-fun res!832178 () Bool)

(assert (=> b!1247098 (=> (not res!832178) (not e!707422))))

(assert (=> b!1247098 (= res!832178 (and (bvsle #b00000000000000000000000000000000 (size!39238 _keys!1118)) (bvslt (size!39238 _keys!1118) #b01111111111111111111111111111111)))))

(declare-fun mapNonEmpty!48730 () Bool)

(declare-fun tp!92831 () Bool)

(assert (=> mapNonEmpty!48730 (= mapRes!48730 (and tp!92831 e!707423))))

(declare-fun mapRest!48730 () (Array (_ BitVec 32) ValueCell!14897))

(declare-fun mapKey!48730 () (_ BitVec 32))

(declare-fun mapValue!48730 () ValueCell!14897)

(assert (=> mapNonEmpty!48730 (= (arr!38701 _values!914) (store mapRest!48730 mapKey!48730 mapValue!48730))))

(declare-fun mapIsEmpty!48730 () Bool)

(assert (=> mapIsEmpty!48730 mapRes!48730))

(declare-fun b!1247099 () Bool)

(declare-datatypes ((List!27582 0))(
  ( (Nil!27579) (Cons!27578 (h!28787 (_ BitVec 64)) (t!41042 List!27582)) )
))
(declare-fun noDuplicate!2056 (List!27582) Bool)

(assert (=> b!1247099 (= e!707422 (not (noDuplicate!2056 Nil!27579)))))

(assert (= (and start!104566 res!832179) b!1247093))

(assert (= (and b!1247093 res!832176) b!1247097))

(assert (= (and b!1247097 res!832177) b!1247098))

(assert (= (and b!1247098 res!832178) b!1247099))

(assert (= (and b!1247095 condMapEmpty!48730) mapIsEmpty!48730))

(assert (= (and b!1247095 (not condMapEmpty!48730)) mapNonEmpty!48730))

(get-info :version)

(assert (= (and mapNonEmpty!48730 ((_ is ValueCellFull!14897) mapValue!48730)) b!1247096))

(assert (= (and b!1247095 ((_ is ValueCellFull!14897) mapDefault!48730)) b!1247094))

(assert (= start!104566 b!1247095))

(declare-fun m!1148257 () Bool)

(assert (=> start!104566 m!1148257))

(declare-fun m!1148259 () Bool)

(assert (=> start!104566 m!1148259))

(declare-fun m!1148261 () Bool)

(assert (=> start!104566 m!1148261))

(declare-fun m!1148263 () Bool)

(assert (=> b!1247097 m!1148263))

(declare-fun m!1148265 () Bool)

(assert (=> mapNonEmpty!48730 m!1148265))

(declare-fun m!1148267 () Bool)

(assert (=> b!1247099 m!1148267))

(check-sat (not b!1247099) (not start!104566) tp_is_empty!31321 (not b!1247097) (not mapNonEmpty!48730))
(check-sat)
(get-model)

(declare-fun b!1247150 () Bool)

(declare-fun e!707460 () Bool)

(declare-fun call!61541 () Bool)

(assert (=> b!1247150 (= e!707460 call!61541)))

(declare-fun bm!61538 () Bool)

(assert (=> bm!61538 (= call!61541 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun d!137609 () Bool)

(declare-fun res!832209 () Bool)

(declare-fun e!707461 () Bool)

(assert (=> d!137609 (=> res!832209 e!707461)))

(assert (=> d!137609 (= res!832209 (bvsge #b00000000000000000000000000000000 (size!39238 _keys!1118)))))

(assert (=> d!137609 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!707461)))

(declare-fun b!1247151 () Bool)

(declare-fun e!707462 () Bool)

(assert (=> b!1247151 (= e!707460 e!707462)))

(declare-fun lt!563056 () (_ BitVec 64))

(assert (=> b!1247151 (= lt!563056 (select (arr!38700 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41314 0))(
  ( (Unit!41315) )
))
(declare-fun lt!563055 () Unit!41314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80257 (_ BitVec 64) (_ BitVec 32)) Unit!41314)

(assert (=> b!1247151 (= lt!563055 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563056 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80257 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1247151 (arrayContainsKey!0 _keys!1118 lt!563056 #b00000000000000000000000000000000)))

(declare-fun lt!563054 () Unit!41314)

(assert (=> b!1247151 (= lt!563054 lt!563055)))

(declare-fun res!832208 () Bool)

(declare-datatypes ((SeekEntryResult!9953 0))(
  ( (MissingZero!9953 (index!42183 (_ BitVec 32))) (Found!9953 (index!42184 (_ BitVec 32))) (Intermediate!9953 (undefined!10765 Bool) (index!42185 (_ BitVec 32)) (x!109591 (_ BitVec 32))) (Undefined!9953) (MissingVacant!9953 (index!42186 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80257 (_ BitVec 32)) SeekEntryResult!9953)

(assert (=> b!1247151 (= res!832208 (= (seekEntryOrOpen!0 (select (arr!38700 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9953 #b00000000000000000000000000000000)))))

(assert (=> b!1247151 (=> (not res!832208) (not e!707462))))

(declare-fun b!1247152 () Bool)

(assert (=> b!1247152 (= e!707461 e!707460)))

(declare-fun c!122079 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1247152 (= c!122079 (validKeyInArray!0 (select (arr!38700 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1247153 () Bool)

(assert (=> b!1247153 (= e!707462 call!61541)))

(assert (= (and d!137609 (not res!832209)) b!1247152))

(assert (= (and b!1247152 c!122079) b!1247151))

(assert (= (and b!1247152 (not c!122079)) b!1247150))

(assert (= (and b!1247151 res!832208) b!1247153))

(assert (= (or b!1247153 b!1247150) bm!61538))

(declare-fun m!1148293 () Bool)

(assert (=> bm!61538 m!1148293))

(declare-fun m!1148295 () Bool)

(assert (=> b!1247151 m!1148295))

(declare-fun m!1148297 () Bool)

(assert (=> b!1247151 m!1148297))

(declare-fun m!1148299 () Bool)

(assert (=> b!1247151 m!1148299))

(assert (=> b!1247151 m!1148295))

(declare-fun m!1148301 () Bool)

(assert (=> b!1247151 m!1148301))

(assert (=> b!1247152 m!1148295))

(assert (=> b!1247152 m!1148295))

(declare-fun m!1148303 () Bool)

(assert (=> b!1247152 m!1148303))

(assert (=> b!1247097 d!137609))

(declare-fun d!137611 () Bool)

(declare-fun res!832214 () Bool)

(declare-fun e!707467 () Bool)

(assert (=> d!137611 (=> res!832214 e!707467)))

(assert (=> d!137611 (= res!832214 ((_ is Nil!27579) Nil!27579))))

(assert (=> d!137611 (= (noDuplicate!2056 Nil!27579) e!707467)))

(declare-fun b!1247158 () Bool)

(declare-fun e!707468 () Bool)

(assert (=> b!1247158 (= e!707467 e!707468)))

(declare-fun res!832215 () Bool)

(assert (=> b!1247158 (=> (not res!832215) (not e!707468))))

(declare-fun contains!7437 (List!27582 (_ BitVec 64)) Bool)

(assert (=> b!1247158 (= res!832215 (not (contains!7437 (t!41042 Nil!27579) (h!28787 Nil!27579))))))

(declare-fun b!1247159 () Bool)

(assert (=> b!1247159 (= e!707468 (noDuplicate!2056 (t!41042 Nil!27579)))))

(assert (= (and d!137611 (not res!832214)) b!1247158))

(assert (= (and b!1247158 res!832215) b!1247159))

(declare-fun m!1148305 () Bool)

(assert (=> b!1247158 m!1148305))

(declare-fun m!1148307 () Bool)

(assert (=> b!1247159 m!1148307))

(assert (=> b!1247099 d!137611))

(declare-fun d!137613 () Bool)

(assert (=> d!137613 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104566 d!137613))

(declare-fun d!137615 () Bool)

(assert (=> d!137615 (= (array_inv!29675 _keys!1118) (bvsge (size!39238 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104566 d!137615))

(declare-fun d!137617 () Bool)

(assert (=> d!137617 (= (array_inv!29676 _values!914) (bvsge (size!39239 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104566 d!137617))

(declare-fun mapIsEmpty!48739 () Bool)

(declare-fun mapRes!48739 () Bool)

(assert (=> mapIsEmpty!48739 mapRes!48739))

(declare-fun mapNonEmpty!48739 () Bool)

(declare-fun tp!92840 () Bool)

(declare-fun e!707473 () Bool)

(assert (=> mapNonEmpty!48739 (= mapRes!48739 (and tp!92840 e!707473))))

(declare-fun mapValue!48739 () ValueCell!14897)

(declare-fun mapRest!48739 () (Array (_ BitVec 32) ValueCell!14897))

(declare-fun mapKey!48739 () (_ BitVec 32))

(assert (=> mapNonEmpty!48739 (= mapRest!48730 (store mapRest!48739 mapKey!48739 mapValue!48739))))

(declare-fun condMapEmpty!48739 () Bool)

(declare-fun mapDefault!48739 () ValueCell!14897)

(assert (=> mapNonEmpty!48730 (= condMapEmpty!48739 (= mapRest!48730 ((as const (Array (_ BitVec 32) ValueCell!14897)) mapDefault!48739)))))

(declare-fun e!707474 () Bool)

(assert (=> mapNonEmpty!48730 (= tp!92831 (and e!707474 mapRes!48739))))

(declare-fun b!1247167 () Bool)

(assert (=> b!1247167 (= e!707474 tp_is_empty!31321)))

(declare-fun b!1247166 () Bool)

(assert (=> b!1247166 (= e!707473 tp_is_empty!31321)))

(assert (= (and mapNonEmpty!48730 condMapEmpty!48739) mapIsEmpty!48739))

(assert (= (and mapNonEmpty!48730 (not condMapEmpty!48739)) mapNonEmpty!48739))

(assert (= (and mapNonEmpty!48739 ((_ is ValueCellFull!14897) mapValue!48739)) b!1247166))

(assert (= (and mapNonEmpty!48730 ((_ is ValueCellFull!14897) mapDefault!48739)) b!1247167))

(declare-fun m!1148309 () Bool)

(assert (=> mapNonEmpty!48739 m!1148309))

(check-sat (not mapNonEmpty!48739) (not b!1247158) (not b!1247152) (not b!1247151) (not b!1247159) (not bm!61538) tp_is_empty!31321)
(check-sat)
