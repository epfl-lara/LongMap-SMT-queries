; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81968 () Bool)

(assert start!81968)

(declare-fun b!954891 () Bool)

(declare-fun e!538036 () Bool)

(declare-datatypes ((List!19365 0))(
  ( (Nil!19362) (Cons!19361 (h!20529 (_ BitVec 64)) (t!27718 List!19365)) )
))
(declare-fun contains!5261 (List!19365 (_ BitVec 64)) Bool)

(assert (=> b!954891 (= e!538036 (contains!5261 Nil!19362 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!33235 () Bool)

(declare-fun mapRes!33235 () Bool)

(declare-fun tp!63625 () Bool)

(declare-fun e!538035 () Bool)

(assert (=> mapNonEmpty!33235 (= mapRes!33235 (and tp!63625 e!538035))))

(declare-fun mapKey!33235 () (_ BitVec 32))

(declare-datatypes ((V!32785 0))(
  ( (V!32786 (val!10476 Int)) )
))
(declare-datatypes ((ValueCell!9944 0))(
  ( (ValueCellFull!9944 (v!13027 V!32785)) (EmptyCell!9944) )
))
(declare-fun mapRest!33235 () (Array (_ BitVec 32) ValueCell!9944))

(declare-datatypes ((array!57860 0))(
  ( (array!57861 (arr!27806 (Array (_ BitVec 32) ValueCell!9944)) (size!28286 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57860)

(declare-fun mapValue!33235 () ValueCell!9944)

(assert (=> mapNonEmpty!33235 (= (arr!27806 _values!1197) (store mapRest!33235 mapKey!33235 mapValue!33235))))

(declare-fun b!954892 () Bool)

(declare-fun res!639186 () Bool)

(declare-fun e!538037 () Bool)

(assert (=> b!954892 (=> (not res!639186) (not e!538037))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!57862 0))(
  ( (array!57863 (arr!27807 (Array (_ BitVec 32) (_ BitVec 64))) (size!28287 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57862)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!954892 (= res!639186 (and (= (size!28286 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28287 _keys!1441) (size!28286 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!954893 () Bool)

(declare-fun e!538039 () Bool)

(declare-fun tp_is_empty!20851 () Bool)

(assert (=> b!954893 (= e!538039 tp_is_empty!20851)))

(declare-fun b!954894 () Bool)

(declare-fun res!639184 () Bool)

(assert (=> b!954894 (=> (not res!639184) (not e!538037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57862 (_ BitVec 32)) Bool)

(assert (=> b!954894 (= res!639184 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun res!639185 () Bool)

(assert (=> start!81968 (=> (not res!639185) (not e!538037))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81968 (= res!639185 (validMask!0 mask!1823))))

(assert (=> start!81968 e!538037))

(assert (=> start!81968 true))

(declare-fun e!538038 () Bool)

(declare-fun array_inv!21659 (array!57860) Bool)

(assert (=> start!81968 (and (array_inv!21659 _values!1197) e!538038)))

(declare-fun array_inv!21660 (array!57862) Bool)

(assert (=> start!81968 (array_inv!21660 _keys!1441)))

(declare-fun b!954895 () Bool)

(assert (=> b!954895 (= e!538038 (and e!538039 mapRes!33235))))

(declare-fun condMapEmpty!33235 () Bool)

(declare-fun mapDefault!33235 () ValueCell!9944)

(assert (=> b!954895 (= condMapEmpty!33235 (= (arr!27806 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9944)) mapDefault!33235)))))

(declare-fun b!954896 () Bool)

(declare-fun res!639181 () Bool)

(assert (=> b!954896 (=> (not res!639181) (not e!538037))))

(declare-fun noDuplicate!1370 (List!19365) Bool)

(assert (=> b!954896 (= res!639181 (noDuplicate!1370 Nil!19362))))

(declare-fun b!954897 () Bool)

(assert (=> b!954897 (= e!538035 tp_is_empty!20851)))

(declare-fun b!954898 () Bool)

(assert (=> b!954898 (= e!538037 e!538036)))

(declare-fun res!639183 () Bool)

(assert (=> b!954898 (=> res!639183 e!538036)))

(assert (=> b!954898 (= res!639183 (contains!5261 Nil!19362 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!954899 () Bool)

(declare-fun res!639182 () Bool)

(assert (=> b!954899 (=> (not res!639182) (not e!538037))))

(assert (=> b!954899 (= res!639182 (and (bvsle #b00000000000000000000000000000000 (size!28287 _keys!1441)) (bvslt (size!28287 _keys!1441) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!33235 () Bool)

(assert (=> mapIsEmpty!33235 mapRes!33235))

(assert (= (and start!81968 res!639185) b!954892))

(assert (= (and b!954892 res!639186) b!954894))

(assert (= (and b!954894 res!639184) b!954899))

(assert (= (and b!954899 res!639182) b!954896))

(assert (= (and b!954896 res!639181) b!954898))

(assert (= (and b!954898 (not res!639183)) b!954891))

(assert (= (and b!954895 condMapEmpty!33235) mapIsEmpty!33235))

(assert (= (and b!954895 (not condMapEmpty!33235)) mapNonEmpty!33235))

(get-info :version)

(assert (= (and mapNonEmpty!33235 ((_ is ValueCellFull!9944) mapValue!33235)) b!954897))

(assert (= (and b!954895 ((_ is ValueCellFull!9944) mapDefault!33235)) b!954893))

(assert (= start!81968 b!954895))

(declare-fun m!887141 () Bool)

(assert (=> b!954896 m!887141))

(declare-fun m!887143 () Bool)

(assert (=> start!81968 m!887143))

(declare-fun m!887145 () Bool)

(assert (=> start!81968 m!887145))

(declare-fun m!887147 () Bool)

(assert (=> start!81968 m!887147))

(declare-fun m!887149 () Bool)

(assert (=> b!954894 m!887149))

(declare-fun m!887151 () Bool)

(assert (=> mapNonEmpty!33235 m!887151))

(declare-fun m!887153 () Bool)

(assert (=> b!954891 m!887153))

(declare-fun m!887155 () Bool)

(assert (=> b!954898 m!887155))

(check-sat (not b!954898) tp_is_empty!20851 (not start!81968) (not mapNonEmpty!33235) (not b!954894) (not b!954891) (not b!954896))
(check-sat)
(get-model)

(declare-fun d!116079 () Bool)

(assert (=> d!116079 (= (validMask!0 mask!1823) (and (or (= mask!1823 #b00000000000000000000000000000111) (= mask!1823 #b00000000000000000000000000001111) (= mask!1823 #b00000000000000000000000000011111) (= mask!1823 #b00000000000000000000000000111111) (= mask!1823 #b00000000000000000000000001111111) (= mask!1823 #b00000000000000000000000011111111) (= mask!1823 #b00000000000000000000000111111111) (= mask!1823 #b00000000000000000000001111111111) (= mask!1823 #b00000000000000000000011111111111) (= mask!1823 #b00000000000000000000111111111111) (= mask!1823 #b00000000000000000001111111111111) (= mask!1823 #b00000000000000000011111111111111) (= mask!1823 #b00000000000000000111111111111111) (= mask!1823 #b00000000000000001111111111111111) (= mask!1823 #b00000000000000011111111111111111) (= mask!1823 #b00000000000000111111111111111111) (= mask!1823 #b00000000000001111111111111111111) (= mask!1823 #b00000000000011111111111111111111) (= mask!1823 #b00000000000111111111111111111111) (= mask!1823 #b00000000001111111111111111111111) (= mask!1823 #b00000000011111111111111111111111) (= mask!1823 #b00000000111111111111111111111111) (= mask!1823 #b00000001111111111111111111111111) (= mask!1823 #b00000011111111111111111111111111) (= mask!1823 #b00000111111111111111111111111111) (= mask!1823 #b00001111111111111111111111111111) (= mask!1823 #b00011111111111111111111111111111) (= mask!1823 #b00111111111111111111111111111111)) (bvsle mask!1823 #b00111111111111111111111111111111)))))

(assert (=> start!81968 d!116079))

(declare-fun d!116081 () Bool)

(assert (=> d!116081 (= (array_inv!21659 _values!1197) (bvsge (size!28286 _values!1197) #b00000000000000000000000000000000))))

(assert (=> start!81968 d!116081))

(declare-fun d!116083 () Bool)

(assert (=> d!116083 (= (array_inv!21660 _keys!1441) (bvsge (size!28287 _keys!1441) #b00000000000000000000000000000000))))

(assert (=> start!81968 d!116083))

(declare-fun bm!41720 () Bool)

(declare-fun call!41723 () Bool)

(assert (=> bm!41720 (= call!41723 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1441 mask!1823))))

(declare-fun d!116085 () Bool)

(declare-fun res!639228 () Bool)

(declare-fun e!538085 () Bool)

(assert (=> d!116085 (=> res!639228 e!538085)))

(assert (=> d!116085 (= res!639228 (bvsge #b00000000000000000000000000000000 (size!28287 _keys!1441)))))

(assert (=> d!116085 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823) e!538085)))

(declare-fun b!954962 () Bool)

(declare-fun e!538084 () Bool)

(assert (=> b!954962 (= e!538084 call!41723)))

(declare-fun b!954963 () Bool)

(declare-fun e!538083 () Bool)

(assert (=> b!954963 (= e!538083 e!538084)))

(declare-fun lt!430217 () (_ BitVec 64))

(assert (=> b!954963 (= lt!430217 (select (arr!27807 _keys!1441) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32070 0))(
  ( (Unit!32071) )
))
(declare-fun lt!430215 () Unit!32070)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!57862 (_ BitVec 64) (_ BitVec 32)) Unit!32070)

(assert (=> b!954963 (= lt!430215 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1441 lt!430217 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!57862 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!954963 (arrayContainsKey!0 _keys!1441 lt!430217 #b00000000000000000000000000000000)))

(declare-fun lt!430216 () Unit!32070)

(assert (=> b!954963 (= lt!430216 lt!430215)))

(declare-fun res!639227 () Bool)

(declare-datatypes ((SeekEntryResult!9142 0))(
  ( (MissingZero!9142 (index!38939 (_ BitVec 32))) (Found!9142 (index!38940 (_ BitVec 32))) (Intermediate!9142 (undefined!9954 Bool) (index!38941 (_ BitVec 32)) (x!82118 (_ BitVec 32))) (Undefined!9142) (MissingVacant!9142 (index!38942 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!57862 (_ BitVec 32)) SeekEntryResult!9142)

(assert (=> b!954963 (= res!639227 (= (seekEntryOrOpen!0 (select (arr!27807 _keys!1441) #b00000000000000000000000000000000) _keys!1441 mask!1823) (Found!9142 #b00000000000000000000000000000000)))))

(assert (=> b!954963 (=> (not res!639227) (not e!538084))))

(declare-fun b!954964 () Bool)

(assert (=> b!954964 (= e!538083 call!41723)))

(declare-fun b!954965 () Bool)

(assert (=> b!954965 (= e!538085 e!538083)))

(declare-fun c!100148 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954965 (= c!100148 (validKeyInArray!0 (select (arr!27807 _keys!1441) #b00000000000000000000000000000000)))))

(assert (= (and d!116085 (not res!639228)) b!954965))

(assert (= (and b!954965 c!100148) b!954963))

(assert (= (and b!954965 (not c!100148)) b!954964))

(assert (= (and b!954963 res!639227) b!954962))

(assert (= (or b!954962 b!954964) bm!41720))

(declare-fun m!887189 () Bool)

(assert (=> bm!41720 m!887189))

(declare-fun m!887191 () Bool)

(assert (=> b!954963 m!887191))

(declare-fun m!887193 () Bool)

(assert (=> b!954963 m!887193))

(declare-fun m!887195 () Bool)

(assert (=> b!954963 m!887195))

(assert (=> b!954963 m!887191))

(declare-fun m!887197 () Bool)

(assert (=> b!954963 m!887197))

(assert (=> b!954965 m!887191))

(assert (=> b!954965 m!887191))

(declare-fun m!887199 () Bool)

(assert (=> b!954965 m!887199))

(assert (=> b!954894 d!116085))

(declare-fun d!116087 () Bool)

(declare-fun lt!430220 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!412 (List!19365) (InoxSet (_ BitVec 64)))

(assert (=> d!116087 (= lt!430220 (select (content!412 Nil!19362) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!538090 () Bool)

(assert (=> d!116087 (= lt!430220 e!538090)))

(declare-fun res!639234 () Bool)

(assert (=> d!116087 (=> (not res!639234) (not e!538090))))

(assert (=> d!116087 (= res!639234 ((_ is Cons!19361) Nil!19362))))

(assert (=> d!116087 (= (contains!5261 Nil!19362 #b1000000000000000000000000000000000000000000000000000000000000000) lt!430220)))

(declare-fun b!954970 () Bool)

(declare-fun e!538091 () Bool)

(assert (=> b!954970 (= e!538090 e!538091)))

(declare-fun res!639233 () Bool)

(assert (=> b!954970 (=> res!639233 e!538091)))

(assert (=> b!954970 (= res!639233 (= (h!20529 Nil!19362) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!954971 () Bool)

(assert (=> b!954971 (= e!538091 (contains!5261 (t!27718 Nil!19362) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116087 res!639234) b!954970))

(assert (= (and b!954970 (not res!639233)) b!954971))

(declare-fun m!887201 () Bool)

(assert (=> d!116087 m!887201))

(declare-fun m!887203 () Bool)

(assert (=> d!116087 m!887203))

(declare-fun m!887205 () Bool)

(assert (=> b!954971 m!887205))

(assert (=> b!954891 d!116087))

(declare-fun d!116089 () Bool)

(declare-fun res!639239 () Bool)

(declare-fun e!538096 () Bool)

(assert (=> d!116089 (=> res!639239 e!538096)))

(assert (=> d!116089 (= res!639239 ((_ is Nil!19362) Nil!19362))))

(assert (=> d!116089 (= (noDuplicate!1370 Nil!19362) e!538096)))

(declare-fun b!954976 () Bool)

(declare-fun e!538097 () Bool)

(assert (=> b!954976 (= e!538096 e!538097)))

(declare-fun res!639240 () Bool)

(assert (=> b!954976 (=> (not res!639240) (not e!538097))))

(assert (=> b!954976 (= res!639240 (not (contains!5261 (t!27718 Nil!19362) (h!20529 Nil!19362))))))

(declare-fun b!954977 () Bool)

(assert (=> b!954977 (= e!538097 (noDuplicate!1370 (t!27718 Nil!19362)))))

(assert (= (and d!116089 (not res!639239)) b!954976))

(assert (= (and b!954976 res!639240) b!954977))

(declare-fun m!887207 () Bool)

(assert (=> b!954976 m!887207))

(declare-fun m!887209 () Bool)

(assert (=> b!954977 m!887209))

(assert (=> b!954896 d!116089))

(declare-fun d!116091 () Bool)

(declare-fun lt!430221 () Bool)

(assert (=> d!116091 (= lt!430221 (select (content!412 Nil!19362) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!538098 () Bool)

(assert (=> d!116091 (= lt!430221 e!538098)))

(declare-fun res!639242 () Bool)

(assert (=> d!116091 (=> (not res!639242) (not e!538098))))

(assert (=> d!116091 (= res!639242 ((_ is Cons!19361) Nil!19362))))

(assert (=> d!116091 (= (contains!5261 Nil!19362 #b0000000000000000000000000000000000000000000000000000000000000000) lt!430221)))

(declare-fun b!954978 () Bool)

(declare-fun e!538099 () Bool)

(assert (=> b!954978 (= e!538098 e!538099)))

(declare-fun res!639241 () Bool)

(assert (=> b!954978 (=> res!639241 e!538099)))

(assert (=> b!954978 (= res!639241 (= (h!20529 Nil!19362) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!954979 () Bool)

(assert (=> b!954979 (= e!538099 (contains!5261 (t!27718 Nil!19362) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116091 res!639242) b!954978))

(assert (= (and b!954978 (not res!639241)) b!954979))

(assert (=> d!116091 m!887201))

(declare-fun m!887211 () Bool)

(assert (=> d!116091 m!887211))

(declare-fun m!887213 () Bool)

(assert (=> b!954979 m!887213))

(assert (=> b!954898 d!116091))

(declare-fun condMapEmpty!33244 () Bool)

(declare-fun mapDefault!33244 () ValueCell!9944)

(assert (=> mapNonEmpty!33235 (= condMapEmpty!33244 (= mapRest!33235 ((as const (Array (_ BitVec 32) ValueCell!9944)) mapDefault!33244)))))

(declare-fun e!538105 () Bool)

(declare-fun mapRes!33244 () Bool)

(assert (=> mapNonEmpty!33235 (= tp!63625 (and e!538105 mapRes!33244))))

(declare-fun b!954986 () Bool)

(declare-fun e!538104 () Bool)

(assert (=> b!954986 (= e!538104 tp_is_empty!20851)))

(declare-fun b!954987 () Bool)

(assert (=> b!954987 (= e!538105 tp_is_empty!20851)))

(declare-fun mapNonEmpty!33244 () Bool)

(declare-fun tp!63634 () Bool)

(assert (=> mapNonEmpty!33244 (= mapRes!33244 (and tp!63634 e!538104))))

(declare-fun mapRest!33244 () (Array (_ BitVec 32) ValueCell!9944))

(declare-fun mapValue!33244 () ValueCell!9944)

(declare-fun mapKey!33244 () (_ BitVec 32))

(assert (=> mapNonEmpty!33244 (= mapRest!33235 (store mapRest!33244 mapKey!33244 mapValue!33244))))

(declare-fun mapIsEmpty!33244 () Bool)

(assert (=> mapIsEmpty!33244 mapRes!33244))

(assert (= (and mapNonEmpty!33235 condMapEmpty!33244) mapIsEmpty!33244))

(assert (= (and mapNonEmpty!33235 (not condMapEmpty!33244)) mapNonEmpty!33244))

(assert (= (and mapNonEmpty!33244 ((_ is ValueCellFull!9944) mapValue!33244)) b!954986))

(assert (= (and mapNonEmpty!33235 ((_ is ValueCellFull!9944) mapDefault!33244)) b!954987))

(declare-fun m!887215 () Bool)

(assert (=> mapNonEmpty!33244 m!887215))

(check-sat (not bm!41720) (not d!116091) (not b!954979) (not b!954971) (not b!954963) (not mapNonEmpty!33244) (not b!954965) (not d!116087) (not b!954977) tp_is_empty!20851 (not b!954976))
(check-sat)
