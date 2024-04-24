; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36046 () Bool)

(assert start!36046)

(declare-fun mapIsEmpty!14163 () Bool)

(declare-fun mapRes!14163 () Bool)

(assert (=> mapIsEmpty!14163 mapRes!14163))

(declare-fun b!361989 () Bool)

(declare-fun res!201414 () Bool)

(declare-fun e!221718 () Bool)

(assert (=> b!361989 (=> (not res!201414) (not e!221718))))

(declare-fun from!1924 () (_ BitVec 32))

(declare-datatypes ((array!20378 0))(
  ( (array!20379 (arr!9673 (Array (_ BitVec 32) (_ BitVec 64))) (size!10025 (_ BitVec 32))) )
))
(declare-fun _keys!1541 () array!20378)

(assert (=> b!361989 (= res!201414 (and (bvsge from!1924 #b00000000000000000000000000000000) (bvslt from!1924 (size!10025 _keys!1541))))))

(declare-fun b!361990 () Bool)

(declare-fun res!201415 () Bool)

(assert (=> b!361990 (=> (not res!201415) (not e!221718))))

(declare-fun k0!1134 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!20378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!361990 (= res!201415 (arrayContainsKey!0 _keys!1541 k0!1134 from!1924))))

(declare-fun b!361991 () Bool)

(declare-fun res!201418 () Bool)

(assert (=> b!361991 (=> (not res!201418) (not e!221718))))

(declare-fun extraKeys!1198 () (_ BitVec 32))

(declare-fun mask!1943 () (_ BitVec 32))

(declare-datatypes ((V!12203 0))(
  ( (V!12204 (val!4254 Int)) )
))
(declare-datatypes ((ValueCell!3866 0))(
  ( (ValueCellFull!3866 (v!6450 V!12203)) (EmptyCell!3866) )
))
(declare-datatypes ((array!20380 0))(
  ( (array!20381 (arr!9674 (Array (_ BitVec 32) ValueCell!3866)) (size!10026 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20380)

(assert (=> b!361991 (= res!201418 (and (= (size!10026 _values!1277) (bvadd #b00000000000000000000000000000001 mask!1943)) (= (size!10025 _keys!1541) (size!10026 _values!1277)) (bvsge mask!1943 #b00000000000000000000000000000000) (bvsge extraKeys!1198 #b00000000000000000000000000000000) (bvsle extraKeys!1198 #b00000000000000000000000000000011)))))

(declare-fun b!361992 () Bool)

(declare-fun e!221720 () Bool)

(declare-fun e!221717 () Bool)

(assert (=> b!361992 (= e!221720 (and e!221717 mapRes!14163))))

(declare-fun condMapEmpty!14163 () Bool)

(declare-fun mapDefault!14163 () ValueCell!3866)

(assert (=> b!361992 (= condMapEmpty!14163 (= (arr!9674 _values!1277) ((as const (Array (_ BitVec 32) ValueCell!3866)) mapDefault!14163)))))

(declare-fun b!361993 () Bool)

(declare-fun res!201419 () Bool)

(assert (=> b!361993 (=> (not res!201419) (not e!221718))))

(assert (=> b!361993 (= res!201419 (not (= (select (arr!9673 _keys!1541) from!1924) k0!1134)))))

(declare-fun b!361994 () Bool)

(declare-fun res!201417 () Bool)

(assert (=> b!361994 (=> (not res!201417) (not e!221718))))

(declare-datatypes ((List!5433 0))(
  ( (Nil!5430) (Cons!5429 (h!6285 (_ BitVec 64)) (t!10575 List!5433)) )
))
(declare-fun arrayNoDuplicates!0 (array!20378 (_ BitVec 32) List!5433) Bool)

(assert (=> b!361994 (= res!201417 (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5430))))

(declare-fun res!201413 () Bool)

(assert (=> start!36046 (=> (not res!201413) (not e!221718))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36046 (= res!201413 (validMask!0 mask!1943))))

(assert (=> start!36046 e!221718))

(assert (=> start!36046 true))

(declare-fun array_inv!7146 (array!20378) Bool)

(assert (=> start!36046 (array_inv!7146 _keys!1541)))

(declare-fun array_inv!7147 (array!20380) Bool)

(assert (=> start!36046 (and (array_inv!7147 _values!1277) e!221720)))

(declare-fun b!361995 () Bool)

(declare-fun res!201416 () Bool)

(assert (=> b!361995 (=> (not res!201416) (not e!221718))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!20378 (_ BitVec 32)) Bool)

(assert (=> b!361995 (= res!201416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943))))

(declare-fun b!361996 () Bool)

(declare-fun e!221716 () Bool)

(declare-fun tp_is_empty!8419 () Bool)

(assert (=> b!361996 (= e!221716 tp_is_empty!8419)))

(declare-fun mapNonEmpty!14163 () Bool)

(declare-fun tp!28239 () Bool)

(assert (=> mapNonEmpty!14163 (= mapRes!14163 (and tp!28239 e!221716))))

(declare-fun mapValue!14163 () ValueCell!3866)

(declare-fun mapRest!14163 () (Array (_ BitVec 32) ValueCell!3866))

(declare-fun mapKey!14163 () (_ BitVec 32))

(assert (=> mapNonEmpty!14163 (= (arr!9674 _values!1277) (store mapRest!14163 mapKey!14163 mapValue!14163))))

(declare-fun b!361997 () Bool)

(assert (=> b!361997 (= e!221717 tp_is_empty!8419)))

(declare-fun b!361998 () Bool)

(assert (=> b!361998 (= e!221718 (not (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd #b00000000000000000000000000000001 from!1924))))))

(assert (= (and start!36046 res!201413) b!361991))

(assert (= (and b!361991 res!201418) b!361995))

(assert (= (and b!361995 res!201416) b!361994))

(assert (= (and b!361994 res!201417) b!361989))

(assert (= (and b!361989 res!201414) b!361990))

(assert (= (and b!361990 res!201415) b!361993))

(assert (= (and b!361993 res!201419) b!361998))

(assert (= (and b!361992 condMapEmpty!14163) mapIsEmpty!14163))

(assert (= (and b!361992 (not condMapEmpty!14163)) mapNonEmpty!14163))

(get-info :version)

(assert (= (and mapNonEmpty!14163 ((_ is ValueCellFull!3866) mapValue!14163)) b!361996))

(assert (= (and b!361992 ((_ is ValueCellFull!3866) mapDefault!14163)) b!361997))

(assert (= start!36046 b!361992))

(declare-fun m!358843 () Bool)

(assert (=> b!361993 m!358843))

(declare-fun m!358845 () Bool)

(assert (=> b!361995 m!358845))

(declare-fun m!358847 () Bool)

(assert (=> mapNonEmpty!14163 m!358847))

(declare-fun m!358849 () Bool)

(assert (=> b!361990 m!358849))

(declare-fun m!358851 () Bool)

(assert (=> b!361994 m!358851))

(declare-fun m!358853 () Bool)

(assert (=> b!361998 m!358853))

(declare-fun m!358855 () Bool)

(assert (=> start!36046 m!358855))

(declare-fun m!358857 () Bool)

(assert (=> start!36046 m!358857))

(declare-fun m!358859 () Bool)

(assert (=> start!36046 m!358859))

(check-sat (not b!361994) (not start!36046) (not b!361990) tp_is_empty!8419 (not b!361998) (not b!361995) (not mapNonEmpty!14163))
(check-sat)
(get-model)

(declare-fun b!362067 () Bool)

(declare-fun e!221758 () Bool)

(declare-fun call!27185 () Bool)

(assert (=> b!362067 (= e!221758 call!27185)))

(declare-fun b!362068 () Bool)

(declare-fun e!221757 () Bool)

(assert (=> b!362068 (= e!221757 e!221758)))

(declare-fun c!53723 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!362068 (= c!53723 (validKeyInArray!0 (select (arr!9673 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun bm!27182 () Bool)

(assert (=> bm!27182 (= call!27185 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1541 mask!1943))))

(declare-fun b!362069 () Bool)

(declare-fun e!221759 () Bool)

(assert (=> b!362069 (= e!221758 e!221759)))

(declare-fun lt!166637 () (_ BitVec 64))

(assert (=> b!362069 (= lt!166637 (select (arr!9673 _keys!1541) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!11111 0))(
  ( (Unit!11112) )
))
(declare-fun lt!166638 () Unit!11111)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!20378 (_ BitVec 64) (_ BitVec 32)) Unit!11111)

(assert (=> b!362069 (= lt!166638 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1541 lt!166637 #b00000000000000000000000000000000))))

(assert (=> b!362069 (arrayContainsKey!0 _keys!1541 lt!166637 #b00000000000000000000000000000000)))

(declare-fun lt!166636 () Unit!11111)

(assert (=> b!362069 (= lt!166636 lt!166638)))

(declare-fun res!201467 () Bool)

(declare-datatypes ((SeekEntryResult!3448 0))(
  ( (MissingZero!3448 (index!15971 (_ BitVec 32))) (Found!3448 (index!15972 (_ BitVec 32))) (Intermediate!3448 (undefined!4260 Bool) (index!15973 (_ BitVec 32)) (x!36033 (_ BitVec 32))) (Undefined!3448) (MissingVacant!3448 (index!15974 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!20378 (_ BitVec 32)) SeekEntryResult!3448)

(assert (=> b!362069 (= res!201467 (= (seekEntryOrOpen!0 (select (arr!9673 _keys!1541) #b00000000000000000000000000000000) _keys!1541 mask!1943) (Found!3448 #b00000000000000000000000000000000)))))

(assert (=> b!362069 (=> (not res!201467) (not e!221759))))

(declare-fun d!72013 () Bool)

(declare-fun res!201466 () Bool)

(assert (=> d!72013 (=> res!201466 e!221757)))

(assert (=> d!72013 (= res!201466 (bvsge #b00000000000000000000000000000000 (size!10025 _keys!1541)))))

(assert (=> d!72013 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1541 mask!1943) e!221757)))

(declare-fun b!362070 () Bool)

(assert (=> b!362070 (= e!221759 call!27185)))

(assert (= (and d!72013 (not res!201466)) b!362068))

(assert (= (and b!362068 c!53723) b!362069))

(assert (= (and b!362068 (not c!53723)) b!362067))

(assert (= (and b!362069 res!201467) b!362070))

(assert (= (or b!362070 b!362067) bm!27182))

(declare-fun m!358897 () Bool)

(assert (=> b!362068 m!358897))

(assert (=> b!362068 m!358897))

(declare-fun m!358899 () Bool)

(assert (=> b!362068 m!358899))

(declare-fun m!358901 () Bool)

(assert (=> bm!27182 m!358901))

(assert (=> b!362069 m!358897))

(declare-fun m!358903 () Bool)

(assert (=> b!362069 m!358903))

(declare-fun m!358905 () Bool)

(assert (=> b!362069 m!358905))

(assert (=> b!362069 m!358897))

(declare-fun m!358907 () Bool)

(assert (=> b!362069 m!358907))

(assert (=> b!361995 d!72013))

(declare-fun d!72015 () Bool)

(declare-fun res!201472 () Bool)

(declare-fun e!221764 () Bool)

(assert (=> d!72015 (=> res!201472 e!221764)))

(assert (=> d!72015 (= res!201472 (= (select (arr!9673 _keys!1541) from!1924) k0!1134))))

(assert (=> d!72015 (= (arrayContainsKey!0 _keys!1541 k0!1134 from!1924) e!221764)))

(declare-fun b!362075 () Bool)

(declare-fun e!221765 () Bool)

(assert (=> b!362075 (= e!221764 e!221765)))

(declare-fun res!201473 () Bool)

(assert (=> b!362075 (=> (not res!201473) (not e!221765))))

(assert (=> b!362075 (= res!201473 (bvslt (bvadd from!1924 #b00000000000000000000000000000001) (size!10025 _keys!1541)))))

(declare-fun b!362076 () Bool)

(assert (=> b!362076 (= e!221765 (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd from!1924 #b00000000000000000000000000000001)))))

(assert (= (and d!72015 (not res!201472)) b!362075))

(assert (= (and b!362075 res!201473) b!362076))

(assert (=> d!72015 m!358843))

(declare-fun m!358909 () Bool)

(assert (=> b!362076 m!358909))

(assert (=> b!361990 d!72015))

(declare-fun d!72017 () Bool)

(assert (=> d!72017 (= (validMask!0 mask!1943) (and (or (= mask!1943 #b00000000000000000000000000000111) (= mask!1943 #b00000000000000000000000000001111) (= mask!1943 #b00000000000000000000000000011111) (= mask!1943 #b00000000000000000000000000111111) (= mask!1943 #b00000000000000000000000001111111) (= mask!1943 #b00000000000000000000000011111111) (= mask!1943 #b00000000000000000000000111111111) (= mask!1943 #b00000000000000000000001111111111) (= mask!1943 #b00000000000000000000011111111111) (= mask!1943 #b00000000000000000000111111111111) (= mask!1943 #b00000000000000000001111111111111) (= mask!1943 #b00000000000000000011111111111111) (= mask!1943 #b00000000000000000111111111111111) (= mask!1943 #b00000000000000001111111111111111) (= mask!1943 #b00000000000000011111111111111111) (= mask!1943 #b00000000000000111111111111111111) (= mask!1943 #b00000000000001111111111111111111) (= mask!1943 #b00000000000011111111111111111111) (= mask!1943 #b00000000000111111111111111111111) (= mask!1943 #b00000000001111111111111111111111) (= mask!1943 #b00000000011111111111111111111111) (= mask!1943 #b00000000111111111111111111111111) (= mask!1943 #b00000001111111111111111111111111) (= mask!1943 #b00000011111111111111111111111111) (= mask!1943 #b00000111111111111111111111111111) (= mask!1943 #b00001111111111111111111111111111) (= mask!1943 #b00011111111111111111111111111111) (= mask!1943 #b00111111111111111111111111111111)) (bvsle mask!1943 #b00111111111111111111111111111111)))))

(assert (=> start!36046 d!72017))

(declare-fun d!72019 () Bool)

(assert (=> d!72019 (= (array_inv!7146 _keys!1541) (bvsge (size!10025 _keys!1541) #b00000000000000000000000000000000))))

(assert (=> start!36046 d!72019))

(declare-fun d!72021 () Bool)

(assert (=> d!72021 (= (array_inv!7147 _values!1277) (bvsge (size!10026 _values!1277) #b00000000000000000000000000000000))))

(assert (=> start!36046 d!72021))

(declare-fun d!72023 () Bool)

(declare-fun res!201474 () Bool)

(declare-fun e!221766 () Bool)

(assert (=> d!72023 (=> res!201474 e!221766)))

(assert (=> d!72023 (= res!201474 (= (select (arr!9673 _keys!1541) (bvadd #b00000000000000000000000000000001 from!1924)) k0!1134))))

(assert (=> d!72023 (= (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd #b00000000000000000000000000000001 from!1924)) e!221766)))

(declare-fun b!362077 () Bool)

(declare-fun e!221767 () Bool)

(assert (=> b!362077 (= e!221766 e!221767)))

(declare-fun res!201475 () Bool)

(assert (=> b!362077 (=> (not res!201475) (not e!221767))))

(assert (=> b!362077 (= res!201475 (bvslt (bvadd #b00000000000000000000000000000001 from!1924 #b00000000000000000000000000000001) (size!10025 _keys!1541)))))

(declare-fun b!362078 () Bool)

(assert (=> b!362078 (= e!221767 (arrayContainsKey!0 _keys!1541 k0!1134 (bvadd #b00000000000000000000000000000001 from!1924 #b00000000000000000000000000000001)))))

(assert (= (and d!72023 (not res!201474)) b!362077))

(assert (= (and b!362077 res!201475) b!362078))

(declare-fun m!358911 () Bool)

(assert (=> d!72023 m!358911))

(declare-fun m!358913 () Bool)

(assert (=> b!362078 m!358913))

(assert (=> b!361998 d!72023))

(declare-fun b!362089 () Bool)

(declare-fun e!221777 () Bool)

(declare-fun e!221778 () Bool)

(assert (=> b!362089 (= e!221777 e!221778)))

(declare-fun c!53726 () Bool)

(assert (=> b!362089 (= c!53726 (validKeyInArray!0 (select (arr!9673 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!362090 () Bool)

(declare-fun call!27188 () Bool)

(assert (=> b!362090 (= e!221778 call!27188)))

(declare-fun b!362091 () Bool)

(declare-fun e!221776 () Bool)

(declare-fun contains!2411 (List!5433 (_ BitVec 64)) Bool)

(assert (=> b!362091 (= e!221776 (contains!2411 Nil!5430 (select (arr!9673 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun b!362092 () Bool)

(declare-fun e!221779 () Bool)

(assert (=> b!362092 (= e!221779 e!221777)))

(declare-fun res!201483 () Bool)

(assert (=> b!362092 (=> (not res!201483) (not e!221777))))

(assert (=> b!362092 (= res!201483 (not e!221776))))

(declare-fun res!201484 () Bool)

(assert (=> b!362092 (=> (not res!201484) (not e!221776))))

(assert (=> b!362092 (= res!201484 (validKeyInArray!0 (select (arr!9673 _keys!1541) #b00000000000000000000000000000000)))))

(declare-fun bm!27185 () Bool)

(assert (=> bm!27185 (= call!27188 (arrayNoDuplicates!0 _keys!1541 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!53726 (Cons!5429 (select (arr!9673 _keys!1541) #b00000000000000000000000000000000) Nil!5430) Nil!5430)))))

(declare-fun d!72025 () Bool)

(declare-fun res!201482 () Bool)

(assert (=> d!72025 (=> res!201482 e!221779)))

(assert (=> d!72025 (= res!201482 (bvsge #b00000000000000000000000000000000 (size!10025 _keys!1541)))))

(assert (=> d!72025 (= (arrayNoDuplicates!0 _keys!1541 #b00000000000000000000000000000000 Nil!5430) e!221779)))

(declare-fun b!362093 () Bool)

(assert (=> b!362093 (= e!221778 call!27188)))

(assert (= (and d!72025 (not res!201482)) b!362092))

(assert (= (and b!362092 res!201484) b!362091))

(assert (= (and b!362092 res!201483) b!362089))

(assert (= (and b!362089 c!53726) b!362090))

(assert (= (and b!362089 (not c!53726)) b!362093))

(assert (= (or b!362090 b!362093) bm!27185))

(assert (=> b!362089 m!358897))

(assert (=> b!362089 m!358897))

(assert (=> b!362089 m!358899))

(assert (=> b!362091 m!358897))

(assert (=> b!362091 m!358897))

(declare-fun m!358915 () Bool)

(assert (=> b!362091 m!358915))

(assert (=> b!362092 m!358897))

(assert (=> b!362092 m!358897))

(assert (=> b!362092 m!358899))

(assert (=> bm!27185 m!358897))

(declare-fun m!358917 () Bool)

(assert (=> bm!27185 m!358917))

(assert (=> b!361994 d!72025))

(declare-fun b!362101 () Bool)

(declare-fun e!221784 () Bool)

(assert (=> b!362101 (= e!221784 tp_is_empty!8419)))

(declare-fun mapIsEmpty!14172 () Bool)

(declare-fun mapRes!14172 () Bool)

(assert (=> mapIsEmpty!14172 mapRes!14172))

(declare-fun mapNonEmpty!14172 () Bool)

(declare-fun tp!28248 () Bool)

(declare-fun e!221785 () Bool)

(assert (=> mapNonEmpty!14172 (= mapRes!14172 (and tp!28248 e!221785))))

(declare-fun mapKey!14172 () (_ BitVec 32))

(declare-fun mapRest!14172 () (Array (_ BitVec 32) ValueCell!3866))

(declare-fun mapValue!14172 () ValueCell!3866)

(assert (=> mapNonEmpty!14172 (= mapRest!14163 (store mapRest!14172 mapKey!14172 mapValue!14172))))

(declare-fun b!362100 () Bool)

(assert (=> b!362100 (= e!221785 tp_is_empty!8419)))

(declare-fun condMapEmpty!14172 () Bool)

(declare-fun mapDefault!14172 () ValueCell!3866)

(assert (=> mapNonEmpty!14163 (= condMapEmpty!14172 (= mapRest!14163 ((as const (Array (_ BitVec 32) ValueCell!3866)) mapDefault!14172)))))

(assert (=> mapNonEmpty!14163 (= tp!28239 (and e!221784 mapRes!14172))))

(assert (= (and mapNonEmpty!14163 condMapEmpty!14172) mapIsEmpty!14172))

(assert (= (and mapNonEmpty!14163 (not condMapEmpty!14172)) mapNonEmpty!14172))

(assert (= (and mapNonEmpty!14172 ((_ is ValueCellFull!3866) mapValue!14172)) b!362100))

(assert (= (and mapNonEmpty!14163 ((_ is ValueCellFull!3866) mapDefault!14172)) b!362101))

(declare-fun m!358919 () Bool)

(assert (=> mapNonEmpty!14172 m!358919))

(check-sat (not b!362068) (not bm!27182) (not mapNonEmpty!14172) (not bm!27185) tp_is_empty!8419 (not b!362076) (not b!362091) (not b!362078) (not b!362069) (not b!362089) (not b!362092))
(check-sat)
