; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!104876 () Bool)

(assert start!104876)

(declare-fun b!1249116 () Bool)

(declare-fun e!708823 () Bool)

(declare-fun tp_is_empty!31381 () Bool)

(assert (=> b!1249116 (= e!708823 tp_is_empty!31381)))

(declare-fun mapIsEmpty!48826 () Bool)

(declare-fun mapRes!48826 () Bool)

(assert (=> mapIsEmpty!48826 mapRes!48826))

(declare-fun res!833075 () Bool)

(declare-fun e!708820 () Bool)

(assert (=> start!104876 (=> (not res!833075) (not e!708820))))

(declare-fun mask!1466 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!104876 (= res!833075 (validMask!0 mask!1466))))

(assert (=> start!104876 e!708820))

(assert (=> start!104876 true))

(declare-datatypes ((array!80485 0))(
  ( (array!80486 (arr!38807 (Array (_ BitVec 32) (_ BitVec 64))) (size!39344 (_ BitVec 32))) )
))
(declare-fun _keys!1118 () array!80485)

(declare-fun array_inv!29723 (array!80485) Bool)

(assert (=> start!104876 (array_inv!29723 _keys!1118)))

(declare-datatypes ((V!47207 0))(
  ( (V!47208 (val!15753 Int)) )
))
(declare-datatypes ((ValueCell!14927 0))(
  ( (ValueCellFull!14927 (v!18445 V!47207)) (EmptyCell!14927) )
))
(declare-datatypes ((array!80487 0))(
  ( (array!80488 (arr!38808 (Array (_ BitVec 32) ValueCell!14927)) (size!39345 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80487)

(declare-fun e!708824 () Bool)

(declare-fun array_inv!29724 (array!80487) Bool)

(assert (=> start!104876 (and (array_inv!29724 _values!914) e!708824)))

(declare-fun b!1249117 () Bool)

(assert (=> b!1249117 (= e!708820 (bvsgt #b00000000000000000000000000000000 (size!39344 _keys!1118)))))

(declare-fun b!1249118 () Bool)

(declare-fun res!833074 () Bool)

(assert (=> b!1249118 (=> (not res!833074) (not e!708820))))

(declare-datatypes ((List!27564 0))(
  ( (Nil!27561) (Cons!27560 (h!28778 (_ BitVec 64)) (t!41025 List!27564)) )
))
(declare-fun arrayNoDuplicates!0 (array!80485 (_ BitVec 32) List!27564) Bool)

(assert (=> b!1249118 (= res!833074 (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27561))))

(declare-fun b!1249119 () Bool)

(declare-fun res!833077 () Bool)

(assert (=> b!1249119 (=> (not res!833077) (not e!708820))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!80485 (_ BitVec 32)) Bool)

(assert (=> b!1249119 (= res!833077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466))))

(declare-fun b!1249120 () Bool)

(declare-fun res!833076 () Bool)

(assert (=> b!1249120 (=> (not res!833076) (not e!708820))))

(declare-fun extraKeysBefore!71 () (_ BitVec 32))

(declare-fun extraKeysAfter!63 () (_ BitVec 32))

(assert (=> b!1249120 (= res!833076 (and (= (size!39345 _values!914) (bvadd #b00000000000000000000000000000001 mask!1466)) (= (size!39344 _keys!1118) (size!39345 _values!914)) (bvsge mask!1466 #b00000000000000000000000000000000) (bvsge extraKeysBefore!71 #b00000000000000000000000000000000) (bvsle extraKeysBefore!71 #b00000000000000000000000000000011) (bvsge extraKeysAfter!63 #b00000000000000000000000000000000) (bvsle extraKeysAfter!63 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!71 #b00000000000000000000000000000001) (bvand extraKeysAfter!63 #b00000000000000000000000000000001)) (= (bvand extraKeysAfter!63 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1249121 () Bool)

(declare-fun e!708822 () Bool)

(assert (=> b!1249121 (= e!708822 tp_is_empty!31381)))

(declare-fun b!1249122 () Bool)

(assert (=> b!1249122 (= e!708824 (and e!708822 mapRes!48826))))

(declare-fun condMapEmpty!48826 () Bool)

(declare-fun mapDefault!48826 () ValueCell!14927)

(assert (=> b!1249122 (= condMapEmpty!48826 (= (arr!38808 _values!914) ((as const (Array (_ BitVec 32) ValueCell!14927)) mapDefault!48826)))))

(declare-fun mapNonEmpty!48826 () Bool)

(declare-fun tp!92927 () Bool)

(assert (=> mapNonEmpty!48826 (= mapRes!48826 (and tp!92927 e!708823))))

(declare-fun mapKey!48826 () (_ BitVec 32))

(declare-fun mapValue!48826 () ValueCell!14927)

(declare-fun mapRest!48826 () (Array (_ BitVec 32) ValueCell!14927))

(assert (=> mapNonEmpty!48826 (= (arr!38808 _values!914) (store mapRest!48826 mapKey!48826 mapValue!48826))))

(assert (= (and start!104876 res!833075) b!1249120))

(assert (= (and b!1249120 res!833076) b!1249119))

(assert (= (and b!1249119 res!833077) b!1249118))

(assert (= (and b!1249118 res!833074) b!1249117))

(assert (= (and b!1249122 condMapEmpty!48826) mapIsEmpty!48826))

(assert (= (and b!1249122 (not condMapEmpty!48826)) mapNonEmpty!48826))

(get-info :version)

(assert (= (and mapNonEmpty!48826 ((_ is ValueCellFull!14927) mapValue!48826)) b!1249116))

(assert (= (and b!1249122 ((_ is ValueCellFull!14927) mapDefault!48826)) b!1249121))

(assert (= start!104876 b!1249122))

(declare-fun m!1150807 () Bool)

(assert (=> start!104876 m!1150807))

(declare-fun m!1150809 () Bool)

(assert (=> start!104876 m!1150809))

(declare-fun m!1150811 () Bool)

(assert (=> start!104876 m!1150811))

(declare-fun m!1150813 () Bool)

(assert (=> b!1249118 m!1150813))

(declare-fun m!1150815 () Bool)

(assert (=> b!1249119 m!1150815))

(declare-fun m!1150817 () Bool)

(assert (=> mapNonEmpty!48826 m!1150817))

(check-sat (not b!1249119) tp_is_empty!31381 (not b!1249118) (not mapNonEmpty!48826) (not start!104876))
(check-sat)
(get-model)

(declare-fun b!1249175 () Bool)

(declare-fun e!708865 () Bool)

(declare-fun e!708866 () Bool)

(assert (=> b!1249175 (= e!708865 e!708866)))

(declare-fun c!122503 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1249175 (= c!122503 (validKeyInArray!0 (select (arr!38807 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun d!138233 () Bool)

(declare-fun res!833110 () Bool)

(declare-fun e!708863 () Bool)

(assert (=> d!138233 (=> res!833110 e!708863)))

(assert (=> d!138233 (= res!833110 (bvsge #b00000000000000000000000000000000 (size!39344 _keys!1118)))))

(assert (=> d!138233 (= (arrayNoDuplicates!0 _keys!1118 #b00000000000000000000000000000000 Nil!27561) e!708863)))

(declare-fun b!1249176 () Bool)

(declare-fun call!61631 () Bool)

(assert (=> b!1249176 (= e!708866 call!61631)))

(declare-fun b!1249177 () Bool)

(assert (=> b!1249177 (= e!708866 call!61631)))

(declare-fun b!1249178 () Bool)

(declare-fun e!708864 () Bool)

(declare-fun contains!7500 (List!27564 (_ BitVec 64)) Bool)

(assert (=> b!1249178 (= e!708864 (contains!7500 Nil!27561 (select (arr!38807 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun b!1249179 () Bool)

(assert (=> b!1249179 (= e!708863 e!708865)))

(declare-fun res!833109 () Bool)

(assert (=> b!1249179 (=> (not res!833109) (not e!708865))))

(assert (=> b!1249179 (= res!833109 (not e!708864))))

(declare-fun res!833108 () Bool)

(assert (=> b!1249179 (=> (not res!833108) (not e!708864))))

(assert (=> b!1249179 (= res!833108 (validKeyInArray!0 (select (arr!38807 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61628 () Bool)

(assert (=> bm!61628 (= call!61631 (arrayNoDuplicates!0 _keys!1118 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!122503 (Cons!27560 (select (arr!38807 _keys!1118) #b00000000000000000000000000000000) Nil!27561) Nil!27561)))))

(assert (= (and d!138233 (not res!833110)) b!1249179))

(assert (= (and b!1249179 res!833108) b!1249178))

(assert (= (and b!1249179 res!833109) b!1249175))

(assert (= (and b!1249175 c!122503) b!1249177))

(assert (= (and b!1249175 (not c!122503)) b!1249176))

(assert (= (or b!1249177 b!1249176) bm!61628))

(declare-fun m!1150843 () Bool)

(assert (=> b!1249175 m!1150843))

(assert (=> b!1249175 m!1150843))

(declare-fun m!1150845 () Bool)

(assert (=> b!1249175 m!1150845))

(assert (=> b!1249178 m!1150843))

(assert (=> b!1249178 m!1150843))

(declare-fun m!1150847 () Bool)

(assert (=> b!1249178 m!1150847))

(assert (=> b!1249179 m!1150843))

(assert (=> b!1249179 m!1150843))

(assert (=> b!1249179 m!1150845))

(assert (=> bm!61628 m!1150843))

(declare-fun m!1150849 () Bool)

(assert (=> bm!61628 m!1150849))

(assert (=> b!1249118 d!138233))

(declare-fun b!1249188 () Bool)

(declare-fun e!708875 () Bool)

(declare-fun e!708873 () Bool)

(assert (=> b!1249188 (= e!708875 e!708873)))

(declare-fun lt!563813 () (_ BitVec 64))

(assert (=> b!1249188 (= lt!563813 (select (arr!38807 _keys!1118) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!41446 0))(
  ( (Unit!41447) )
))
(declare-fun lt!563812 () Unit!41446)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!80485 (_ BitVec 64) (_ BitVec 32)) Unit!41446)

(assert (=> b!1249188 (= lt!563812 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1118 lt!563813 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!80485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1249188 (arrayContainsKey!0 _keys!1118 lt!563813 #b00000000000000000000000000000000)))

(declare-fun lt!563811 () Unit!41446)

(assert (=> b!1249188 (= lt!563811 lt!563812)))

(declare-fun res!833116 () Bool)

(declare-datatypes ((SeekEntryResult!9912 0))(
  ( (MissingZero!9912 (index!42019 (_ BitVec 32))) (Found!9912 (index!42020 (_ BitVec 32))) (Intermediate!9912 (undefined!10724 Bool) (index!42021 (_ BitVec 32)) (x!109659 (_ BitVec 32))) (Undefined!9912) (MissingVacant!9912 (index!42022 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!80485 (_ BitVec 32)) SeekEntryResult!9912)

(assert (=> b!1249188 (= res!833116 (= (seekEntryOrOpen!0 (select (arr!38807 _keys!1118) #b00000000000000000000000000000000) _keys!1118 mask!1466) (Found!9912 #b00000000000000000000000000000000)))))

(assert (=> b!1249188 (=> (not res!833116) (not e!708873))))

(declare-fun b!1249189 () Bool)

(declare-fun e!708874 () Bool)

(assert (=> b!1249189 (= e!708874 e!708875)))

(declare-fun c!122506 () Bool)

(assert (=> b!1249189 (= c!122506 (validKeyInArray!0 (select (arr!38807 _keys!1118) #b00000000000000000000000000000000)))))

(declare-fun bm!61631 () Bool)

(declare-fun call!61634 () Bool)

(assert (=> bm!61631 (= call!61634 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1118 mask!1466))))

(declare-fun b!1249191 () Bool)

(assert (=> b!1249191 (= e!708875 call!61634)))

(declare-fun b!1249190 () Bool)

(assert (=> b!1249190 (= e!708873 call!61634)))

(declare-fun d!138235 () Bool)

(declare-fun res!833115 () Bool)

(assert (=> d!138235 (=> res!833115 e!708874)))

(assert (=> d!138235 (= res!833115 (bvsge #b00000000000000000000000000000000 (size!39344 _keys!1118)))))

(assert (=> d!138235 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1118 mask!1466) e!708874)))

(assert (= (and d!138235 (not res!833115)) b!1249189))

(assert (= (and b!1249189 c!122506) b!1249188))

(assert (= (and b!1249189 (not c!122506)) b!1249191))

(assert (= (and b!1249188 res!833116) b!1249190))

(assert (= (or b!1249190 b!1249191) bm!61631))

(assert (=> b!1249188 m!1150843))

(declare-fun m!1150851 () Bool)

(assert (=> b!1249188 m!1150851))

(declare-fun m!1150853 () Bool)

(assert (=> b!1249188 m!1150853))

(assert (=> b!1249188 m!1150843))

(declare-fun m!1150855 () Bool)

(assert (=> b!1249188 m!1150855))

(assert (=> b!1249189 m!1150843))

(assert (=> b!1249189 m!1150843))

(assert (=> b!1249189 m!1150845))

(declare-fun m!1150857 () Bool)

(assert (=> bm!61631 m!1150857))

(assert (=> b!1249119 d!138235))

(declare-fun d!138237 () Bool)

(assert (=> d!138237 (= (validMask!0 mask!1466) (and (or (= mask!1466 #b00000000000000000000000000000111) (= mask!1466 #b00000000000000000000000000001111) (= mask!1466 #b00000000000000000000000000011111) (= mask!1466 #b00000000000000000000000000111111) (= mask!1466 #b00000000000000000000000001111111) (= mask!1466 #b00000000000000000000000011111111) (= mask!1466 #b00000000000000000000000111111111) (= mask!1466 #b00000000000000000000001111111111) (= mask!1466 #b00000000000000000000011111111111) (= mask!1466 #b00000000000000000000111111111111) (= mask!1466 #b00000000000000000001111111111111) (= mask!1466 #b00000000000000000011111111111111) (= mask!1466 #b00000000000000000111111111111111) (= mask!1466 #b00000000000000001111111111111111) (= mask!1466 #b00000000000000011111111111111111) (= mask!1466 #b00000000000000111111111111111111) (= mask!1466 #b00000000000001111111111111111111) (= mask!1466 #b00000000000011111111111111111111) (= mask!1466 #b00000000000111111111111111111111) (= mask!1466 #b00000000001111111111111111111111) (= mask!1466 #b00000000011111111111111111111111) (= mask!1466 #b00000000111111111111111111111111) (= mask!1466 #b00000001111111111111111111111111) (= mask!1466 #b00000011111111111111111111111111) (= mask!1466 #b00000111111111111111111111111111) (= mask!1466 #b00001111111111111111111111111111) (= mask!1466 #b00011111111111111111111111111111) (= mask!1466 #b00111111111111111111111111111111)) (bvsle mask!1466 #b00111111111111111111111111111111)))))

(assert (=> start!104876 d!138237))

(declare-fun d!138239 () Bool)

(assert (=> d!138239 (= (array_inv!29723 _keys!1118) (bvsge (size!39344 _keys!1118) #b00000000000000000000000000000000))))

(assert (=> start!104876 d!138239))

(declare-fun d!138241 () Bool)

(assert (=> d!138241 (= (array_inv!29724 _values!914) (bvsge (size!39345 _values!914) #b00000000000000000000000000000000))))

(assert (=> start!104876 d!138241))

(declare-fun condMapEmpty!48835 () Bool)

(declare-fun mapDefault!48835 () ValueCell!14927)

(assert (=> mapNonEmpty!48826 (= condMapEmpty!48835 (= mapRest!48826 ((as const (Array (_ BitVec 32) ValueCell!14927)) mapDefault!48835)))))

(declare-fun e!708881 () Bool)

(declare-fun mapRes!48835 () Bool)

(assert (=> mapNonEmpty!48826 (= tp!92927 (and e!708881 mapRes!48835))))

(declare-fun mapNonEmpty!48835 () Bool)

(declare-fun tp!92936 () Bool)

(declare-fun e!708880 () Bool)

(assert (=> mapNonEmpty!48835 (= mapRes!48835 (and tp!92936 e!708880))))

(declare-fun mapKey!48835 () (_ BitVec 32))

(declare-fun mapRest!48835 () (Array (_ BitVec 32) ValueCell!14927))

(declare-fun mapValue!48835 () ValueCell!14927)

(assert (=> mapNonEmpty!48835 (= mapRest!48826 (store mapRest!48835 mapKey!48835 mapValue!48835))))

(declare-fun mapIsEmpty!48835 () Bool)

(assert (=> mapIsEmpty!48835 mapRes!48835))

(declare-fun b!1249198 () Bool)

(assert (=> b!1249198 (= e!708880 tp_is_empty!31381)))

(declare-fun b!1249199 () Bool)

(assert (=> b!1249199 (= e!708881 tp_is_empty!31381)))

(assert (= (and mapNonEmpty!48826 condMapEmpty!48835) mapIsEmpty!48835))

(assert (= (and mapNonEmpty!48826 (not condMapEmpty!48835)) mapNonEmpty!48835))

(assert (= (and mapNonEmpty!48835 ((_ is ValueCellFull!14927) mapValue!48835)) b!1249198))

(assert (= (and mapNonEmpty!48826 ((_ is ValueCellFull!14927) mapDefault!48835)) b!1249199))

(declare-fun m!1150859 () Bool)

(assert (=> mapNonEmpty!48835 m!1150859))

(check-sat (not b!1249178) tp_is_empty!31381 (not bm!61628) (not b!1249175) (not bm!61631) (not b!1249189) (not mapNonEmpty!48835) (not b!1249179) (not b!1249188))
(check-sat)
