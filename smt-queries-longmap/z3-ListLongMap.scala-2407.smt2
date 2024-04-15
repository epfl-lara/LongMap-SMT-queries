; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38068 () Bool)

(assert start!38068)

(declare-fun b_free!9007 () Bool)

(declare-fun b_next!9007 () Bool)

(assert (=> start!38068 (= b_free!9007 (not b_next!9007))))

(declare-fun tp!31797 () Bool)

(declare-fun b_and!16319 () Bool)

(assert (=> start!38068 (= tp!31797 b_and!16319)))

(declare-fun b!391980 () Bool)

(declare-fun res!224492 () Bool)

(declare-fun e!237367 () Bool)

(assert (=> b!391980 (=> (not res!224492) (not e!237367))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!14011 0))(
  ( (V!14012 (val!4884 Int)) )
))
(declare-datatypes ((ValueCell!4496 0))(
  ( (ValueCellFull!4496 (v!7107 V!14011)) (EmptyCell!4496) )
))
(declare-datatypes ((array!23247 0))(
  ( (array!23248 (arr!11084 (Array (_ BitVec 32) ValueCell!4496)) (size!11437 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23247)

(declare-datatypes ((array!23249 0))(
  ( (array!23250 (arr!11085 (Array (_ BitVec 32) (_ BitVec 64))) (size!11438 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23249)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!391980 (= res!224492 (and (= (size!11437 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11438 _keys!658) (size!11437 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391981 () Bool)

(declare-fun res!224494 () Bool)

(assert (=> b!391981 (=> (not res!224494) (not e!237367))))

(declare-datatypes ((List!6399 0))(
  ( (Nil!6396) (Cons!6395 (h!7251 (_ BitVec 64)) (t!11556 List!6399)) )
))
(declare-fun arrayNoDuplicates!0 (array!23249 (_ BitVec 32) List!6399) Bool)

(assert (=> b!391981 (= res!224494 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6396))))

(declare-datatypes ((tuple2!6556 0))(
  ( (tuple2!6557 (_1!3289 (_ BitVec 64)) (_2!3289 V!14011)) )
))
(declare-datatypes ((List!6400 0))(
  ( (Nil!6397) (Cons!6396 (h!7252 tuple2!6556) (t!11557 List!6400)) )
))
(declare-datatypes ((ListLongMap!5459 0))(
  ( (ListLongMap!5460 (toList!2745 List!6400)) )
))
(declare-fun lt!185085 () ListLongMap!5459)

(declare-fun lt!185078 () tuple2!6556)

(declare-fun lt!185080 () ListLongMap!5459)

(declare-fun b!391982 () Bool)

(declare-fun e!237365 () Bool)

(declare-fun +!1065 (ListLongMap!5459 tuple2!6556) ListLongMap!5459)

(assert (=> b!391982 (= e!237365 (= lt!185080 (+!1065 lt!185085 lt!185078)))))

(declare-fun e!237360 () Bool)

(assert (=> b!391982 e!237360))

(declare-fun res!224496 () Bool)

(assert (=> b!391982 (=> (not res!224496) (not e!237360))))

(declare-fun lt!185081 () ListLongMap!5459)

(declare-fun lt!185084 () ListLongMap!5459)

(assert (=> b!391982 (= res!224496 (= lt!185081 (+!1065 lt!185084 lt!185078)))))

(declare-fun minValue!472 () V!14011)

(assert (=> b!391982 (= lt!185078 (tuple2!6557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun lt!185082 () ListLongMap!5459)

(declare-fun b!391983 () Bool)

(assert (=> b!391983 (= e!237360 (= lt!185081 (+!1065 lt!185082 lt!185078)))))

(declare-fun b!391984 () Bool)

(declare-fun e!237362 () Bool)

(assert (=> b!391984 (= e!237362 (not e!237365))))

(declare-fun res!224499 () Bool)

(assert (=> b!391984 (=> res!224499 e!237365)))

(assert (=> b!391984 (= res!224499 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14011)

(declare-fun getCurrentListMap!2066 (array!23249 array!23247 (_ BitVec 32) (_ BitVec 32) V!14011 V!14011 (_ BitVec 32) Int) ListLongMap!5459)

(assert (=> b!391984 (= lt!185080 (getCurrentListMap!2066 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185079 () array!23249)

(declare-fun lt!185077 () array!23247)

(assert (=> b!391984 (= lt!185081 (getCurrentListMap!2066 lt!185079 lt!185077 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391984 (and (= lt!185084 lt!185082) (= lt!185082 lt!185084))))

(declare-fun v!373 () V!14011)

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!391984 (= lt!185082 (+!1065 lt!185085 (tuple2!6557 k0!778 v!373)))))

(declare-datatypes ((Unit!11980 0))(
  ( (Unit!11981) )
))
(declare-fun lt!185083 () Unit!11980)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!267 (array!23249 array!23247 (_ BitVec 32) (_ BitVec 32) V!14011 V!14011 (_ BitVec 32) (_ BitVec 64) V!14011 (_ BitVec 32) Int) Unit!11980)

(assert (=> b!391984 (= lt!185083 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!267 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!976 (array!23249 array!23247 (_ BitVec 32) (_ BitVec 32) V!14011 V!14011 (_ BitVec 32) Int) ListLongMap!5459)

(assert (=> b!391984 (= lt!185084 (getCurrentListMapNoExtraKeys!976 lt!185079 lt!185077 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!391984 (= lt!185077 (array!23248 (store (arr!11084 _values!506) i!548 (ValueCellFull!4496 v!373)) (size!11437 _values!506)))))

(assert (=> b!391984 (= lt!185085 (getCurrentListMapNoExtraKeys!976 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391985 () Bool)

(declare-fun res!224491 () Bool)

(assert (=> b!391985 (=> (not res!224491) (not e!237367))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23249 (_ BitVec 32)) Bool)

(assert (=> b!391985 (= res!224491 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391979 () Bool)

(declare-fun res!224502 () Bool)

(assert (=> b!391979 (=> (not res!224502) (not e!237362))))

(assert (=> b!391979 (= res!224502 (arrayNoDuplicates!0 lt!185079 #b00000000000000000000000000000000 Nil!6396))))

(declare-fun res!224498 () Bool)

(assert (=> start!38068 (=> (not res!224498) (not e!237367))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38068 (= res!224498 (validMask!0 mask!970))))

(assert (=> start!38068 e!237367))

(declare-fun e!237366 () Bool)

(declare-fun array_inv!8142 (array!23247) Bool)

(assert (=> start!38068 (and (array_inv!8142 _values!506) e!237366)))

(assert (=> start!38068 tp!31797))

(assert (=> start!38068 true))

(declare-fun tp_is_empty!9679 () Bool)

(assert (=> start!38068 tp_is_empty!9679))

(declare-fun array_inv!8143 (array!23249) Bool)

(assert (=> start!38068 (array_inv!8143 _keys!658)))

(declare-fun b!391986 () Bool)

(declare-fun res!224500 () Bool)

(assert (=> b!391986 (=> (not res!224500) (not e!237367))))

(assert (=> b!391986 (= res!224500 (or (= (select (arr!11085 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11085 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391987 () Bool)

(declare-fun e!237364 () Bool)

(declare-fun mapRes!16107 () Bool)

(assert (=> b!391987 (= e!237366 (and e!237364 mapRes!16107))))

(declare-fun condMapEmpty!16107 () Bool)

(declare-fun mapDefault!16107 () ValueCell!4496)

(assert (=> b!391987 (= condMapEmpty!16107 (= (arr!11084 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4496)) mapDefault!16107)))))

(declare-fun b!391988 () Bool)

(declare-fun e!237363 () Bool)

(assert (=> b!391988 (= e!237363 tp_is_empty!9679)))

(declare-fun mapNonEmpty!16107 () Bool)

(declare-fun tp!31796 () Bool)

(assert (=> mapNonEmpty!16107 (= mapRes!16107 (and tp!31796 e!237363))))

(declare-fun mapValue!16107 () ValueCell!4496)

(declare-fun mapRest!16107 () (Array (_ BitVec 32) ValueCell!4496))

(declare-fun mapKey!16107 () (_ BitVec 32))

(assert (=> mapNonEmpty!16107 (= (arr!11084 _values!506) (store mapRest!16107 mapKey!16107 mapValue!16107))))

(declare-fun b!391989 () Bool)

(assert (=> b!391989 (= e!237367 e!237362)))

(declare-fun res!224495 () Bool)

(assert (=> b!391989 (=> (not res!224495) (not e!237362))))

(assert (=> b!391989 (= res!224495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185079 mask!970))))

(assert (=> b!391989 (= lt!185079 (array!23250 (store (arr!11085 _keys!658) i!548 k0!778) (size!11438 _keys!658)))))

(declare-fun b!391990 () Bool)

(declare-fun res!224497 () Bool)

(assert (=> b!391990 (=> (not res!224497) (not e!237367))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!391990 (= res!224497 (validKeyInArray!0 k0!778))))

(declare-fun b!391991 () Bool)

(declare-fun res!224501 () Bool)

(assert (=> b!391991 (=> (not res!224501) (not e!237367))))

(assert (=> b!391991 (= res!224501 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11438 _keys!658))))))

(declare-fun b!391992 () Bool)

(assert (=> b!391992 (= e!237364 tp_is_empty!9679)))

(declare-fun b!391993 () Bool)

(declare-fun res!224493 () Bool)

(assert (=> b!391993 (=> (not res!224493) (not e!237367))))

(declare-fun arrayContainsKey!0 (array!23249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391993 (= res!224493 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16107 () Bool)

(assert (=> mapIsEmpty!16107 mapRes!16107))

(assert (= (and start!38068 res!224498) b!391980))

(assert (= (and b!391980 res!224492) b!391985))

(assert (= (and b!391985 res!224491) b!391981))

(assert (= (and b!391981 res!224494) b!391991))

(assert (= (and b!391991 res!224501) b!391990))

(assert (= (and b!391990 res!224497) b!391986))

(assert (= (and b!391986 res!224500) b!391993))

(assert (= (and b!391993 res!224493) b!391989))

(assert (= (and b!391989 res!224495) b!391979))

(assert (= (and b!391979 res!224502) b!391984))

(assert (= (and b!391984 (not res!224499)) b!391982))

(assert (= (and b!391982 res!224496) b!391983))

(assert (= (and b!391987 condMapEmpty!16107) mapIsEmpty!16107))

(assert (= (and b!391987 (not condMapEmpty!16107)) mapNonEmpty!16107))

(get-info :version)

(assert (= (and mapNonEmpty!16107 ((_ is ValueCellFull!4496) mapValue!16107)) b!391988))

(assert (= (and b!391987 ((_ is ValueCellFull!4496) mapDefault!16107)) b!391992))

(assert (= start!38068 b!391987))

(declare-fun m!387923 () Bool)

(assert (=> b!391993 m!387923))

(declare-fun m!387925 () Bool)

(assert (=> b!391985 m!387925))

(declare-fun m!387927 () Bool)

(assert (=> mapNonEmpty!16107 m!387927))

(declare-fun m!387929 () Bool)

(assert (=> b!391979 m!387929))

(declare-fun m!387931 () Bool)

(assert (=> b!391981 m!387931))

(declare-fun m!387933 () Bool)

(assert (=> b!391989 m!387933))

(declare-fun m!387935 () Bool)

(assert (=> b!391989 m!387935))

(declare-fun m!387937 () Bool)

(assert (=> b!391984 m!387937))

(declare-fun m!387939 () Bool)

(assert (=> b!391984 m!387939))

(declare-fun m!387941 () Bool)

(assert (=> b!391984 m!387941))

(declare-fun m!387943 () Bool)

(assert (=> b!391984 m!387943))

(declare-fun m!387945 () Bool)

(assert (=> b!391984 m!387945))

(declare-fun m!387947 () Bool)

(assert (=> b!391984 m!387947))

(declare-fun m!387949 () Bool)

(assert (=> b!391984 m!387949))

(declare-fun m!387951 () Bool)

(assert (=> b!391986 m!387951))

(declare-fun m!387953 () Bool)

(assert (=> b!391990 m!387953))

(declare-fun m!387955 () Bool)

(assert (=> b!391983 m!387955))

(declare-fun m!387957 () Bool)

(assert (=> start!38068 m!387957))

(declare-fun m!387959 () Bool)

(assert (=> start!38068 m!387959))

(declare-fun m!387961 () Bool)

(assert (=> start!38068 m!387961))

(declare-fun m!387963 () Bool)

(assert (=> b!391982 m!387963))

(declare-fun m!387965 () Bool)

(assert (=> b!391982 m!387965))

(check-sat (not b!391984) (not b!391983) (not b_next!9007) (not b!391979) (not b!391981) (not b!391990) (not b!391985) (not mapNonEmpty!16107) (not start!38068) (not b!391982) (not b!391993) b_and!16319 tp_is_empty!9679 (not b!391989))
(check-sat b_and!16319 (not b_next!9007))
(get-model)

(declare-fun d!72923 () Bool)

(declare-fun e!237418 () Bool)

(assert (=> d!72923 e!237418))

(declare-fun res!224579 () Bool)

(assert (=> d!72923 (=> (not res!224579) (not e!237418))))

(declare-fun lt!185149 () ListLongMap!5459)

(declare-fun contains!2454 (ListLongMap!5459 (_ BitVec 64)) Bool)

(assert (=> d!72923 (= res!224579 (contains!2454 lt!185149 (_1!3289 lt!185078)))))

(declare-fun lt!185148 () List!6400)

(assert (=> d!72923 (= lt!185149 (ListLongMap!5460 lt!185148))))

(declare-fun lt!185151 () Unit!11980)

(declare-fun lt!185150 () Unit!11980)

(assert (=> d!72923 (= lt!185151 lt!185150)))

(declare-datatypes ((Option!367 0))(
  ( (Some!366 (v!7113 V!14011)) (None!365) )
))
(declare-fun getValueByKey!361 (List!6400 (_ BitVec 64)) Option!367)

(assert (=> d!72923 (= (getValueByKey!361 lt!185148 (_1!3289 lt!185078)) (Some!366 (_2!3289 lt!185078)))))

(declare-fun lemmaContainsTupThenGetReturnValue!186 (List!6400 (_ BitVec 64) V!14011) Unit!11980)

(assert (=> d!72923 (= lt!185150 (lemmaContainsTupThenGetReturnValue!186 lt!185148 (_1!3289 lt!185078) (_2!3289 lt!185078)))))

(declare-fun insertStrictlySorted!189 (List!6400 (_ BitVec 64) V!14011) List!6400)

(assert (=> d!72923 (= lt!185148 (insertStrictlySorted!189 (toList!2745 lt!185085) (_1!3289 lt!185078) (_2!3289 lt!185078)))))

(assert (=> d!72923 (= (+!1065 lt!185085 lt!185078) lt!185149)))

(declare-fun b!392088 () Bool)

(declare-fun res!224580 () Bool)

(assert (=> b!392088 (=> (not res!224580) (not e!237418))))

(assert (=> b!392088 (= res!224580 (= (getValueByKey!361 (toList!2745 lt!185149) (_1!3289 lt!185078)) (Some!366 (_2!3289 lt!185078))))))

(declare-fun b!392089 () Bool)

(declare-fun contains!2455 (List!6400 tuple2!6556) Bool)

(assert (=> b!392089 (= e!237418 (contains!2455 (toList!2745 lt!185149) lt!185078))))

(assert (= (and d!72923 res!224579) b!392088))

(assert (= (and b!392088 res!224580) b!392089))

(declare-fun m!388055 () Bool)

(assert (=> d!72923 m!388055))

(declare-fun m!388057 () Bool)

(assert (=> d!72923 m!388057))

(declare-fun m!388059 () Bool)

(assert (=> d!72923 m!388059))

(declare-fun m!388061 () Bool)

(assert (=> d!72923 m!388061))

(declare-fun m!388063 () Bool)

(assert (=> b!392088 m!388063))

(declare-fun m!388065 () Bool)

(assert (=> b!392089 m!388065))

(assert (=> b!391982 d!72923))

(declare-fun d!72925 () Bool)

(declare-fun e!237419 () Bool)

(assert (=> d!72925 e!237419))

(declare-fun res!224581 () Bool)

(assert (=> d!72925 (=> (not res!224581) (not e!237419))))

(declare-fun lt!185153 () ListLongMap!5459)

(assert (=> d!72925 (= res!224581 (contains!2454 lt!185153 (_1!3289 lt!185078)))))

(declare-fun lt!185152 () List!6400)

(assert (=> d!72925 (= lt!185153 (ListLongMap!5460 lt!185152))))

(declare-fun lt!185155 () Unit!11980)

(declare-fun lt!185154 () Unit!11980)

(assert (=> d!72925 (= lt!185155 lt!185154)))

(assert (=> d!72925 (= (getValueByKey!361 lt!185152 (_1!3289 lt!185078)) (Some!366 (_2!3289 lt!185078)))))

(assert (=> d!72925 (= lt!185154 (lemmaContainsTupThenGetReturnValue!186 lt!185152 (_1!3289 lt!185078) (_2!3289 lt!185078)))))

(assert (=> d!72925 (= lt!185152 (insertStrictlySorted!189 (toList!2745 lt!185084) (_1!3289 lt!185078) (_2!3289 lt!185078)))))

(assert (=> d!72925 (= (+!1065 lt!185084 lt!185078) lt!185153)))

(declare-fun b!392090 () Bool)

(declare-fun res!224582 () Bool)

(assert (=> b!392090 (=> (not res!224582) (not e!237419))))

(assert (=> b!392090 (= res!224582 (= (getValueByKey!361 (toList!2745 lt!185153) (_1!3289 lt!185078)) (Some!366 (_2!3289 lt!185078))))))

(declare-fun b!392091 () Bool)

(assert (=> b!392091 (= e!237419 (contains!2455 (toList!2745 lt!185153) lt!185078))))

(assert (= (and d!72925 res!224581) b!392090))

(assert (= (and b!392090 res!224582) b!392091))

(declare-fun m!388067 () Bool)

(assert (=> d!72925 m!388067))

(declare-fun m!388069 () Bool)

(assert (=> d!72925 m!388069))

(declare-fun m!388071 () Bool)

(assert (=> d!72925 m!388071))

(declare-fun m!388073 () Bool)

(assert (=> d!72925 m!388073))

(declare-fun m!388075 () Bool)

(assert (=> b!392090 m!388075))

(declare-fun m!388077 () Bool)

(assert (=> b!392091 m!388077))

(assert (=> b!391982 d!72925))

(declare-fun d!72927 () Bool)

(declare-fun res!224587 () Bool)

(declare-fun e!237424 () Bool)

(assert (=> d!72927 (=> res!224587 e!237424)))

(assert (=> d!72927 (= res!224587 (= (select (arr!11085 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72927 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!237424)))

(declare-fun b!392096 () Bool)

(declare-fun e!237425 () Bool)

(assert (=> b!392096 (= e!237424 e!237425)))

(declare-fun res!224588 () Bool)

(assert (=> b!392096 (=> (not res!224588) (not e!237425))))

(assert (=> b!392096 (= res!224588 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11438 _keys!658)))))

(declare-fun b!392097 () Bool)

(assert (=> b!392097 (= e!237425 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72927 (not res!224587)) b!392096))

(assert (= (and b!392096 res!224588) b!392097))

(declare-fun m!388079 () Bool)

(assert (=> d!72927 m!388079))

(declare-fun m!388081 () Bool)

(assert (=> b!392097 m!388081))

(assert (=> b!391993 d!72927))

(declare-fun d!72929 () Bool)

(declare-fun e!237426 () Bool)

(assert (=> d!72929 e!237426))

(declare-fun res!224589 () Bool)

(assert (=> d!72929 (=> (not res!224589) (not e!237426))))

(declare-fun lt!185157 () ListLongMap!5459)

(assert (=> d!72929 (= res!224589 (contains!2454 lt!185157 (_1!3289 lt!185078)))))

(declare-fun lt!185156 () List!6400)

(assert (=> d!72929 (= lt!185157 (ListLongMap!5460 lt!185156))))

(declare-fun lt!185159 () Unit!11980)

(declare-fun lt!185158 () Unit!11980)

(assert (=> d!72929 (= lt!185159 lt!185158)))

(assert (=> d!72929 (= (getValueByKey!361 lt!185156 (_1!3289 lt!185078)) (Some!366 (_2!3289 lt!185078)))))

(assert (=> d!72929 (= lt!185158 (lemmaContainsTupThenGetReturnValue!186 lt!185156 (_1!3289 lt!185078) (_2!3289 lt!185078)))))

(assert (=> d!72929 (= lt!185156 (insertStrictlySorted!189 (toList!2745 lt!185082) (_1!3289 lt!185078) (_2!3289 lt!185078)))))

(assert (=> d!72929 (= (+!1065 lt!185082 lt!185078) lt!185157)))

(declare-fun b!392098 () Bool)

(declare-fun res!224590 () Bool)

(assert (=> b!392098 (=> (not res!224590) (not e!237426))))

(assert (=> b!392098 (= res!224590 (= (getValueByKey!361 (toList!2745 lt!185157) (_1!3289 lt!185078)) (Some!366 (_2!3289 lt!185078))))))

(declare-fun b!392099 () Bool)

(assert (=> b!392099 (= e!237426 (contains!2455 (toList!2745 lt!185157) lt!185078))))

(assert (= (and d!72929 res!224589) b!392098))

(assert (= (and b!392098 res!224590) b!392099))

(declare-fun m!388083 () Bool)

(assert (=> d!72929 m!388083))

(declare-fun m!388085 () Bool)

(assert (=> d!72929 m!388085))

(declare-fun m!388087 () Bool)

(assert (=> d!72929 m!388087))

(declare-fun m!388089 () Bool)

(assert (=> d!72929 m!388089))

(declare-fun m!388091 () Bool)

(assert (=> b!392098 m!388091))

(declare-fun m!388093 () Bool)

(assert (=> b!392099 m!388093))

(assert (=> b!391983 d!72929))

(declare-fun b!392108 () Bool)

(declare-fun e!237434 () Bool)

(declare-fun e!237433 () Bool)

(assert (=> b!392108 (= e!237434 e!237433)))

(declare-fun c!54264 () Bool)

(assert (=> b!392108 (= c!54264 (validKeyInArray!0 (select (arr!11085 lt!185079) #b00000000000000000000000000000000)))))

(declare-fun d!72931 () Bool)

(declare-fun res!224595 () Bool)

(assert (=> d!72931 (=> res!224595 e!237434)))

(assert (=> d!72931 (= res!224595 (bvsge #b00000000000000000000000000000000 (size!11438 lt!185079)))))

(assert (=> d!72931 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185079 mask!970) e!237434)))

(declare-fun b!392109 () Bool)

(declare-fun call!27654 () Bool)

(assert (=> b!392109 (= e!237433 call!27654)))

(declare-fun b!392110 () Bool)

(declare-fun e!237435 () Bool)

(assert (=> b!392110 (= e!237433 e!237435)))

(declare-fun lt!185167 () (_ BitVec 64))

(assert (=> b!392110 (= lt!185167 (select (arr!11085 lt!185079) #b00000000000000000000000000000000))))

(declare-fun lt!185168 () Unit!11980)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23249 (_ BitVec 64) (_ BitVec 32)) Unit!11980)

(assert (=> b!392110 (= lt!185168 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!185079 lt!185167 #b00000000000000000000000000000000))))

(assert (=> b!392110 (arrayContainsKey!0 lt!185079 lt!185167 #b00000000000000000000000000000000)))

(declare-fun lt!185166 () Unit!11980)

(assert (=> b!392110 (= lt!185166 lt!185168)))

(declare-fun res!224596 () Bool)

(declare-datatypes ((SeekEntryResult!3511 0))(
  ( (MissingZero!3511 (index!16223 (_ BitVec 32))) (Found!3511 (index!16224 (_ BitVec 32))) (Intermediate!3511 (undefined!4323 Bool) (index!16225 (_ BitVec 32)) (x!38403 (_ BitVec 32))) (Undefined!3511) (MissingVacant!3511 (index!16226 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23249 (_ BitVec 32)) SeekEntryResult!3511)

(assert (=> b!392110 (= res!224596 (= (seekEntryOrOpen!0 (select (arr!11085 lt!185079) #b00000000000000000000000000000000) lt!185079 mask!970) (Found!3511 #b00000000000000000000000000000000)))))

(assert (=> b!392110 (=> (not res!224596) (not e!237435))))

(declare-fun bm!27651 () Bool)

(assert (=> bm!27651 (= call!27654 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!185079 mask!970))))

(declare-fun b!392111 () Bool)

(assert (=> b!392111 (= e!237435 call!27654)))

(assert (= (and d!72931 (not res!224595)) b!392108))

(assert (= (and b!392108 c!54264) b!392110))

(assert (= (and b!392108 (not c!54264)) b!392109))

(assert (= (and b!392110 res!224596) b!392111))

(assert (= (or b!392111 b!392109) bm!27651))

(declare-fun m!388095 () Bool)

(assert (=> b!392108 m!388095))

(assert (=> b!392108 m!388095))

(declare-fun m!388097 () Bool)

(assert (=> b!392108 m!388097))

(assert (=> b!392110 m!388095))

(declare-fun m!388099 () Bool)

(assert (=> b!392110 m!388099))

(declare-fun m!388101 () Bool)

(assert (=> b!392110 m!388101))

(assert (=> b!392110 m!388095))

(declare-fun m!388103 () Bool)

(assert (=> b!392110 m!388103))

(declare-fun m!388105 () Bool)

(assert (=> bm!27651 m!388105))

(assert (=> b!391989 d!72931))

(declare-fun b!392112 () Bool)

(declare-fun e!237437 () Bool)

(declare-fun e!237436 () Bool)

(assert (=> b!392112 (= e!237437 e!237436)))

(declare-fun c!54265 () Bool)

(assert (=> b!392112 (= c!54265 (validKeyInArray!0 (select (arr!11085 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun d!72933 () Bool)

(declare-fun res!224597 () Bool)

(assert (=> d!72933 (=> res!224597 e!237437)))

(assert (=> d!72933 (= res!224597 (bvsge #b00000000000000000000000000000000 (size!11438 _keys!658)))))

(assert (=> d!72933 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!237437)))

(declare-fun b!392113 () Bool)

(declare-fun call!27655 () Bool)

(assert (=> b!392113 (= e!237436 call!27655)))

(declare-fun b!392114 () Bool)

(declare-fun e!237438 () Bool)

(assert (=> b!392114 (= e!237436 e!237438)))

(declare-fun lt!185170 () (_ BitVec 64))

(assert (=> b!392114 (= lt!185170 (select (arr!11085 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185171 () Unit!11980)

(assert (=> b!392114 (= lt!185171 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!185170 #b00000000000000000000000000000000))))

(assert (=> b!392114 (arrayContainsKey!0 _keys!658 lt!185170 #b00000000000000000000000000000000)))

(declare-fun lt!185169 () Unit!11980)

(assert (=> b!392114 (= lt!185169 lt!185171)))

(declare-fun res!224598 () Bool)

(assert (=> b!392114 (= res!224598 (= (seekEntryOrOpen!0 (select (arr!11085 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3511 #b00000000000000000000000000000000)))))

(assert (=> b!392114 (=> (not res!224598) (not e!237438))))

(declare-fun bm!27652 () Bool)

(assert (=> bm!27652 (= call!27655 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!392115 () Bool)

(assert (=> b!392115 (= e!237438 call!27655)))

(assert (= (and d!72933 (not res!224597)) b!392112))

(assert (= (and b!392112 c!54265) b!392114))

(assert (= (and b!392112 (not c!54265)) b!392113))

(assert (= (and b!392114 res!224598) b!392115))

(assert (= (or b!392115 b!392113) bm!27652))

(assert (=> b!392112 m!388079))

(assert (=> b!392112 m!388079))

(declare-fun m!388107 () Bool)

(assert (=> b!392112 m!388107))

(assert (=> b!392114 m!388079))

(declare-fun m!388109 () Bool)

(assert (=> b!392114 m!388109))

(declare-fun m!388111 () Bool)

(assert (=> b!392114 m!388111))

(assert (=> b!392114 m!388079))

(declare-fun m!388113 () Bool)

(assert (=> b!392114 m!388113))

(declare-fun m!388115 () Bool)

(assert (=> bm!27652 m!388115))

(assert (=> b!391985 d!72933))

(declare-fun e!237455 () Bool)

(declare-fun lt!185191 () ListLongMap!5459)

(declare-fun b!392140 () Bool)

(assert (=> b!392140 (= e!237455 (= lt!185191 (getCurrentListMapNoExtraKeys!976 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!392141 () Bool)

(declare-fun e!237459 () Bool)

(assert (=> b!392141 (= e!237459 e!237455)))

(declare-fun c!54277 () Bool)

(assert (=> b!392141 (= c!54277 (bvslt #b00000000000000000000000000000000 (size!11438 _keys!658)))))

(declare-fun b!392142 () Bool)

(assert (=> b!392142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11438 _keys!658)))))

(assert (=> b!392142 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11437 _values!506)))))

(declare-fun e!237453 () Bool)

(declare-fun apply!305 (ListLongMap!5459 (_ BitVec 64)) V!14011)

(declare-fun get!5599 (ValueCell!4496 V!14011) V!14011)

(declare-fun dynLambda!639 (Int (_ BitVec 64)) V!14011)

(assert (=> b!392142 (= e!237453 (= (apply!305 lt!185191 (select (arr!11085 _keys!658) #b00000000000000000000000000000000)) (get!5599 (select (arr!11084 _values!506) #b00000000000000000000000000000000) (dynLambda!639 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!392143 () Bool)

(declare-fun e!237454 () Bool)

(assert (=> b!392143 (= e!237454 e!237459)))

(declare-fun c!54275 () Bool)

(declare-fun e!237457 () Bool)

(assert (=> b!392143 (= c!54275 e!237457)))

(declare-fun res!224609 () Bool)

(assert (=> b!392143 (=> (not res!224609) (not e!237457))))

(assert (=> b!392143 (= res!224609 (bvslt #b00000000000000000000000000000000 (size!11438 _keys!658)))))

(declare-fun b!392144 () Bool)

(assert (=> b!392144 (= e!237459 e!237453)))

(assert (=> b!392144 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11438 _keys!658)))))

(declare-fun res!224610 () Bool)

(assert (=> b!392144 (= res!224610 (contains!2454 lt!185191 (select (arr!11085 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392144 (=> (not res!224610) (not e!237453))))

(declare-fun b!392145 () Bool)

(declare-fun e!237456 () ListLongMap!5459)

(declare-fun e!237458 () ListLongMap!5459)

(assert (=> b!392145 (= e!237456 e!237458)))

(declare-fun c!54276 () Bool)

(assert (=> b!392145 (= c!54276 (validKeyInArray!0 (select (arr!11085 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392146 () Bool)

(declare-fun lt!185192 () Unit!11980)

(declare-fun lt!185190 () Unit!11980)

(assert (=> b!392146 (= lt!185192 lt!185190)))

(declare-fun lt!185186 () V!14011)

(declare-fun lt!185187 () (_ BitVec 64))

(declare-fun lt!185188 () (_ BitVec 64))

(declare-fun lt!185189 () ListLongMap!5459)

(assert (=> b!392146 (not (contains!2454 (+!1065 lt!185189 (tuple2!6557 lt!185188 lt!185186)) lt!185187))))

(declare-fun addStillNotContains!139 (ListLongMap!5459 (_ BitVec 64) V!14011 (_ BitVec 64)) Unit!11980)

(assert (=> b!392146 (= lt!185190 (addStillNotContains!139 lt!185189 lt!185188 lt!185186 lt!185187))))

(assert (=> b!392146 (= lt!185187 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!392146 (= lt!185186 (get!5599 (select (arr!11084 _values!506) #b00000000000000000000000000000000) (dynLambda!639 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392146 (= lt!185188 (select (arr!11085 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27658 () ListLongMap!5459)

(assert (=> b!392146 (= lt!185189 call!27658)))

(assert (=> b!392146 (= e!237458 (+!1065 call!27658 (tuple2!6557 (select (arr!11085 _keys!658) #b00000000000000000000000000000000) (get!5599 (select (arr!11084 _values!506) #b00000000000000000000000000000000) (dynLambda!639 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392147 () Bool)

(declare-fun res!224608 () Bool)

(assert (=> b!392147 (=> (not res!224608) (not e!237454))))

(assert (=> b!392147 (= res!224608 (not (contains!2454 lt!185191 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!27655 () Bool)

(assert (=> bm!27655 (= call!27658 (getCurrentListMapNoExtraKeys!976 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!392148 () Bool)

(declare-fun isEmpty!555 (ListLongMap!5459) Bool)

(assert (=> b!392148 (= e!237455 (isEmpty!555 lt!185191))))

(declare-fun b!392149 () Bool)

(assert (=> b!392149 (= e!237457 (validKeyInArray!0 (select (arr!11085 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392149 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!392150 () Bool)

(assert (=> b!392150 (= e!237456 (ListLongMap!5460 Nil!6397))))

(declare-fun b!392151 () Bool)

(assert (=> b!392151 (= e!237458 call!27658)))

(declare-fun d!72935 () Bool)

(assert (=> d!72935 e!237454))

(declare-fun res!224607 () Bool)

(assert (=> d!72935 (=> (not res!224607) (not e!237454))))

(assert (=> d!72935 (= res!224607 (not (contains!2454 lt!185191 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72935 (= lt!185191 e!237456)))

(declare-fun c!54274 () Bool)

(assert (=> d!72935 (= c!54274 (bvsge #b00000000000000000000000000000000 (size!11438 _keys!658)))))

(assert (=> d!72935 (validMask!0 mask!970)))

(assert (=> d!72935 (= (getCurrentListMapNoExtraKeys!976 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185191)))

(assert (= (and d!72935 c!54274) b!392150))

(assert (= (and d!72935 (not c!54274)) b!392145))

(assert (= (and b!392145 c!54276) b!392146))

(assert (= (and b!392145 (not c!54276)) b!392151))

(assert (= (or b!392146 b!392151) bm!27655))

(assert (= (and d!72935 res!224607) b!392147))

(assert (= (and b!392147 res!224608) b!392143))

(assert (= (and b!392143 res!224609) b!392149))

(assert (= (and b!392143 c!54275) b!392144))

(assert (= (and b!392143 (not c!54275)) b!392141))

(assert (= (and b!392144 res!224610) b!392142))

(assert (= (and b!392141 c!54277) b!392140))

(assert (= (and b!392141 (not c!54277)) b!392148))

(declare-fun b_lambda!8701 () Bool)

(assert (=> (not b_lambda!8701) (not b!392142)))

(declare-fun t!11563 () Bool)

(declare-fun tb!3117 () Bool)

(assert (=> (and start!38068 (= defaultEntry!514 defaultEntry!514) t!11563) tb!3117))

(declare-fun result!5747 () Bool)

(assert (=> tb!3117 (= result!5747 tp_is_empty!9679)))

(assert (=> b!392142 t!11563))

(declare-fun b_and!16325 () Bool)

(assert (= b_and!16319 (and (=> t!11563 result!5747) b_and!16325)))

(declare-fun b_lambda!8703 () Bool)

(assert (=> (not b_lambda!8703) (not b!392146)))

(assert (=> b!392146 t!11563))

(declare-fun b_and!16327 () Bool)

(assert (= b_and!16325 (and (=> t!11563 result!5747) b_and!16327)))

(assert (=> b!392145 m!388079))

(assert (=> b!392145 m!388079))

(assert (=> b!392145 m!388107))

(declare-fun m!388117 () Bool)

(assert (=> b!392147 m!388117))

(assert (=> b!392144 m!388079))

(assert (=> b!392144 m!388079))

(declare-fun m!388119 () Bool)

(assert (=> b!392144 m!388119))

(declare-fun m!388121 () Bool)

(assert (=> b!392146 m!388121))

(declare-fun m!388123 () Bool)

(assert (=> b!392146 m!388123))

(declare-fun m!388125 () Bool)

(assert (=> b!392146 m!388125))

(assert (=> b!392146 m!388079))

(assert (=> b!392146 m!388121))

(assert (=> b!392146 m!388125))

(declare-fun m!388127 () Bool)

(assert (=> b!392146 m!388127))

(declare-fun m!388129 () Bool)

(assert (=> b!392146 m!388129))

(declare-fun m!388131 () Bool)

(assert (=> b!392146 m!388131))

(assert (=> b!392146 m!388127))

(declare-fun m!388133 () Bool)

(assert (=> b!392146 m!388133))

(assert (=> b!392149 m!388079))

(assert (=> b!392149 m!388079))

(assert (=> b!392149 m!388107))

(declare-fun m!388135 () Bool)

(assert (=> b!392140 m!388135))

(assert (=> bm!27655 m!388135))

(assert (=> b!392142 m!388125))

(assert (=> b!392142 m!388079))

(declare-fun m!388137 () Bool)

(assert (=> b!392142 m!388137))

(assert (=> b!392142 m!388079))

(assert (=> b!392142 m!388125))

(assert (=> b!392142 m!388127))

(assert (=> b!392142 m!388129))

(assert (=> b!392142 m!388127))

(declare-fun m!388139 () Bool)

(assert (=> d!72935 m!388139))

(assert (=> d!72935 m!387957))

(declare-fun m!388141 () Bool)

(assert (=> b!392148 m!388141))

(assert (=> b!391984 d!72935))

(declare-fun d!72937 () Bool)

(declare-fun e!237460 () Bool)

(assert (=> d!72937 e!237460))

(declare-fun res!224611 () Bool)

(assert (=> d!72937 (=> (not res!224611) (not e!237460))))

(declare-fun lt!185194 () ListLongMap!5459)

(assert (=> d!72937 (= res!224611 (contains!2454 lt!185194 (_1!3289 (tuple2!6557 k0!778 v!373))))))

(declare-fun lt!185193 () List!6400)

(assert (=> d!72937 (= lt!185194 (ListLongMap!5460 lt!185193))))

(declare-fun lt!185196 () Unit!11980)

(declare-fun lt!185195 () Unit!11980)

(assert (=> d!72937 (= lt!185196 lt!185195)))

(assert (=> d!72937 (= (getValueByKey!361 lt!185193 (_1!3289 (tuple2!6557 k0!778 v!373))) (Some!366 (_2!3289 (tuple2!6557 k0!778 v!373))))))

(assert (=> d!72937 (= lt!185195 (lemmaContainsTupThenGetReturnValue!186 lt!185193 (_1!3289 (tuple2!6557 k0!778 v!373)) (_2!3289 (tuple2!6557 k0!778 v!373))))))

(assert (=> d!72937 (= lt!185193 (insertStrictlySorted!189 (toList!2745 lt!185085) (_1!3289 (tuple2!6557 k0!778 v!373)) (_2!3289 (tuple2!6557 k0!778 v!373))))))

(assert (=> d!72937 (= (+!1065 lt!185085 (tuple2!6557 k0!778 v!373)) lt!185194)))

(declare-fun b!392154 () Bool)

(declare-fun res!224612 () Bool)

(assert (=> b!392154 (=> (not res!224612) (not e!237460))))

(assert (=> b!392154 (= res!224612 (= (getValueByKey!361 (toList!2745 lt!185194) (_1!3289 (tuple2!6557 k0!778 v!373))) (Some!366 (_2!3289 (tuple2!6557 k0!778 v!373)))))))

(declare-fun b!392155 () Bool)

(assert (=> b!392155 (= e!237460 (contains!2455 (toList!2745 lt!185194) (tuple2!6557 k0!778 v!373)))))

(assert (= (and d!72937 res!224611) b!392154))

(assert (= (and b!392154 res!224612) b!392155))

(declare-fun m!388143 () Bool)

(assert (=> d!72937 m!388143))

(declare-fun m!388145 () Bool)

(assert (=> d!72937 m!388145))

(declare-fun m!388147 () Bool)

(assert (=> d!72937 m!388147))

(declare-fun m!388149 () Bool)

(assert (=> d!72937 m!388149))

(declare-fun m!388151 () Bool)

(assert (=> b!392154 m!388151))

(declare-fun m!388153 () Bool)

(assert (=> b!392155 m!388153))

(assert (=> b!391984 d!72937))

(declare-fun bm!27670 () Bool)

(declare-fun call!27679 () ListLongMap!5459)

(declare-fun call!27677 () ListLongMap!5459)

(assert (=> bm!27670 (= call!27679 call!27677)))

(declare-fun b!392198 () Bool)

(declare-fun res!224637 () Bool)

(declare-fun e!237490 () Bool)

(assert (=> b!392198 (=> (not res!224637) (not e!237490))))

(declare-fun e!237494 () Bool)

(assert (=> b!392198 (= res!224637 e!237494)))

(declare-fun c!54292 () Bool)

(assert (=> b!392198 (= c!54292 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!72939 () Bool)

(assert (=> d!72939 e!237490))

(declare-fun res!224632 () Bool)

(assert (=> d!72939 (=> (not res!224632) (not e!237490))))

(assert (=> d!72939 (= res!224632 (or (bvsge #b00000000000000000000000000000000 (size!11438 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11438 _keys!658)))))))

(declare-fun lt!185262 () ListLongMap!5459)

(declare-fun lt!185242 () ListLongMap!5459)

(assert (=> d!72939 (= lt!185262 lt!185242)))

(declare-fun lt!185260 () Unit!11980)

(declare-fun e!237488 () Unit!11980)

(assert (=> d!72939 (= lt!185260 e!237488)))

(declare-fun c!54294 () Bool)

(declare-fun e!237491 () Bool)

(assert (=> d!72939 (= c!54294 e!237491)))

(declare-fun res!224633 () Bool)

(assert (=> d!72939 (=> (not res!224633) (not e!237491))))

(assert (=> d!72939 (= res!224633 (bvslt #b00000000000000000000000000000000 (size!11438 _keys!658)))))

(declare-fun e!237489 () ListLongMap!5459)

(assert (=> d!72939 (= lt!185242 e!237489)))

(declare-fun c!54293 () Bool)

(assert (=> d!72939 (= c!54293 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72939 (validMask!0 mask!970)))

(assert (=> d!72939 (= (getCurrentListMap!2066 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185262)))

(declare-fun b!392199 () Bool)

(declare-fun e!237492 () ListLongMap!5459)

(declare-fun call!27675 () ListLongMap!5459)

(assert (=> b!392199 (= e!237492 call!27675)))

(declare-fun b!392200 () Bool)

(declare-fun lt!185243 () Unit!11980)

(assert (=> b!392200 (= e!237488 lt!185243)))

(declare-fun lt!185247 () ListLongMap!5459)

(assert (=> b!392200 (= lt!185247 (getCurrentListMapNoExtraKeys!976 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185254 () (_ BitVec 64))

(assert (=> b!392200 (= lt!185254 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185249 () (_ BitVec 64))

(assert (=> b!392200 (= lt!185249 (select (arr!11085 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185261 () Unit!11980)

(declare-fun addStillContains!281 (ListLongMap!5459 (_ BitVec 64) V!14011 (_ BitVec 64)) Unit!11980)

(assert (=> b!392200 (= lt!185261 (addStillContains!281 lt!185247 lt!185254 zeroValue!472 lt!185249))))

(assert (=> b!392200 (contains!2454 (+!1065 lt!185247 (tuple2!6557 lt!185254 zeroValue!472)) lt!185249)))

(declare-fun lt!185246 () Unit!11980)

(assert (=> b!392200 (= lt!185246 lt!185261)))

(declare-fun lt!185257 () ListLongMap!5459)

(assert (=> b!392200 (= lt!185257 (getCurrentListMapNoExtraKeys!976 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185259 () (_ BitVec 64))

(assert (=> b!392200 (= lt!185259 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185256 () (_ BitVec 64))

(assert (=> b!392200 (= lt!185256 (select (arr!11085 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185253 () Unit!11980)

(declare-fun addApplyDifferent!281 (ListLongMap!5459 (_ BitVec 64) V!14011 (_ BitVec 64)) Unit!11980)

(assert (=> b!392200 (= lt!185253 (addApplyDifferent!281 lt!185257 lt!185259 minValue!472 lt!185256))))

(assert (=> b!392200 (= (apply!305 (+!1065 lt!185257 (tuple2!6557 lt!185259 minValue!472)) lt!185256) (apply!305 lt!185257 lt!185256))))

(declare-fun lt!185244 () Unit!11980)

(assert (=> b!392200 (= lt!185244 lt!185253)))

(declare-fun lt!185250 () ListLongMap!5459)

(assert (=> b!392200 (= lt!185250 (getCurrentListMapNoExtraKeys!976 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185258 () (_ BitVec 64))

(assert (=> b!392200 (= lt!185258 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185252 () (_ BitVec 64))

(assert (=> b!392200 (= lt!185252 (select (arr!11085 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!185251 () Unit!11980)

(assert (=> b!392200 (= lt!185251 (addApplyDifferent!281 lt!185250 lt!185258 zeroValue!472 lt!185252))))

(assert (=> b!392200 (= (apply!305 (+!1065 lt!185250 (tuple2!6557 lt!185258 zeroValue!472)) lt!185252) (apply!305 lt!185250 lt!185252))))

(declare-fun lt!185255 () Unit!11980)

(assert (=> b!392200 (= lt!185255 lt!185251)))

(declare-fun lt!185241 () ListLongMap!5459)

(assert (=> b!392200 (= lt!185241 (getCurrentListMapNoExtraKeys!976 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185248 () (_ BitVec 64))

(assert (=> b!392200 (= lt!185248 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185245 () (_ BitVec 64))

(assert (=> b!392200 (= lt!185245 (select (arr!11085 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!392200 (= lt!185243 (addApplyDifferent!281 lt!185241 lt!185248 minValue!472 lt!185245))))

(assert (=> b!392200 (= (apply!305 (+!1065 lt!185241 (tuple2!6557 lt!185248 minValue!472)) lt!185245) (apply!305 lt!185241 lt!185245))))

(declare-fun b!392201 () Bool)

(declare-fun call!27678 () Bool)

(assert (=> b!392201 (= e!237494 (not call!27678))))

(declare-fun b!392202 () Bool)

(assert (=> b!392202 (= e!237491 (validKeyInArray!0 (select (arr!11085 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27671 () Bool)

(assert (=> bm!27671 (= call!27675 call!27679)))

(declare-fun b!392203 () Bool)

(declare-fun Unit!11982 () Unit!11980)

(assert (=> b!392203 (= e!237488 Unit!11982)))

(declare-fun bm!27672 () Bool)

(assert (=> bm!27672 (= call!27678 (contains!2454 lt!185262 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun call!27676 () ListLongMap!5459)

(declare-fun c!54295 () Bool)

(declare-fun bm!27673 () Bool)

(assert (=> bm!27673 (= call!27676 (+!1065 (ite c!54293 call!27677 (ite c!54295 call!27679 call!27675)) (ite (or c!54293 c!54295) (tuple2!6557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!392204 () Bool)

(declare-fun e!237493 () Bool)

(declare-fun e!237497 () Bool)

(assert (=> b!392204 (= e!237493 e!237497)))

(declare-fun res!224634 () Bool)

(declare-fun call!27673 () Bool)

(assert (=> b!392204 (= res!224634 call!27673)))

(assert (=> b!392204 (=> (not res!224634) (not e!237497))))

(declare-fun b!392205 () Bool)

(declare-fun e!237499 () Bool)

(declare-fun e!237487 () Bool)

(assert (=> b!392205 (= e!237499 e!237487)))

(declare-fun res!224639 () Bool)

(assert (=> b!392205 (=> (not res!224639) (not e!237487))))

(assert (=> b!392205 (= res!224639 (contains!2454 lt!185262 (select (arr!11085 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!392205 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11438 _keys!658)))))

(declare-fun b!392206 () Bool)

(declare-fun e!237496 () Bool)

(assert (=> b!392206 (= e!237494 e!237496)))

(declare-fun res!224631 () Bool)

(assert (=> b!392206 (= res!224631 call!27678)))

(assert (=> b!392206 (=> (not res!224631) (not e!237496))))

(declare-fun b!392207 () Bool)

(assert (=> b!392207 (= e!237490 e!237493)))

(declare-fun c!54291 () Bool)

(assert (=> b!392207 (= c!54291 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392208 () Bool)

(declare-fun e!237495 () ListLongMap!5459)

(declare-fun call!27674 () ListLongMap!5459)

(assert (=> b!392208 (= e!237495 call!27674)))

(declare-fun b!392209 () Bool)

(declare-fun e!237498 () Bool)

(assert (=> b!392209 (= e!237498 (validKeyInArray!0 (select (arr!11085 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27674 () Bool)

(assert (=> bm!27674 (= call!27677 (getCurrentListMapNoExtraKeys!976 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392210 () Bool)

(assert (=> b!392210 (= e!237492 call!27674)))

(declare-fun b!392211 () Bool)

(assert (=> b!392211 (= e!237496 (= (apply!305 lt!185262 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27675 () Bool)

(assert (=> bm!27675 (= call!27674 call!27676)))

(declare-fun b!392212 () Bool)

(assert (=> b!392212 (= e!237489 e!237495)))

(assert (=> b!392212 (= c!54295 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392213 () Bool)

(assert (=> b!392213 (= e!237487 (= (apply!305 lt!185262 (select (arr!11085 _keys!658) #b00000000000000000000000000000000)) (get!5599 (select (arr!11084 _values!506) #b00000000000000000000000000000000) (dynLambda!639 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392213 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11437 _values!506)))))

(assert (=> b!392213 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11438 _keys!658)))))

(declare-fun b!392214 () Bool)

(declare-fun res!224638 () Bool)

(assert (=> b!392214 (=> (not res!224638) (not e!237490))))

(assert (=> b!392214 (= res!224638 e!237499)))

(declare-fun res!224635 () Bool)

(assert (=> b!392214 (=> res!224635 e!237499)))

(assert (=> b!392214 (= res!224635 (not e!237498))))

(declare-fun res!224636 () Bool)

(assert (=> b!392214 (=> (not res!224636) (not e!237498))))

(assert (=> b!392214 (= res!224636 (bvslt #b00000000000000000000000000000000 (size!11438 _keys!658)))))

(declare-fun b!392215 () Bool)

(declare-fun c!54290 () Bool)

(assert (=> b!392215 (= c!54290 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!392215 (= e!237495 e!237492)))

(declare-fun b!392216 () Bool)

(assert (=> b!392216 (= e!237497 (= (apply!305 lt!185262 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!392217 () Bool)

(assert (=> b!392217 (= e!237489 (+!1065 call!27676 (tuple2!6557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!392218 () Bool)

(assert (=> b!392218 (= e!237493 (not call!27673))))

(declare-fun bm!27676 () Bool)

(assert (=> bm!27676 (= call!27673 (contains!2454 lt!185262 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72939 c!54293) b!392217))

(assert (= (and d!72939 (not c!54293)) b!392212))

(assert (= (and b!392212 c!54295) b!392208))

(assert (= (and b!392212 (not c!54295)) b!392215))

(assert (= (and b!392215 c!54290) b!392210))

(assert (= (and b!392215 (not c!54290)) b!392199))

(assert (= (or b!392210 b!392199) bm!27671))

(assert (= (or b!392208 bm!27671) bm!27670))

(assert (= (or b!392208 b!392210) bm!27675))

(assert (= (or b!392217 bm!27670) bm!27674))

(assert (= (or b!392217 bm!27675) bm!27673))

(assert (= (and d!72939 res!224633) b!392202))

(assert (= (and d!72939 c!54294) b!392200))

(assert (= (and d!72939 (not c!54294)) b!392203))

(assert (= (and d!72939 res!224632) b!392214))

(assert (= (and b!392214 res!224636) b!392209))

(assert (= (and b!392214 (not res!224635)) b!392205))

(assert (= (and b!392205 res!224639) b!392213))

(assert (= (and b!392214 res!224638) b!392198))

(assert (= (and b!392198 c!54292) b!392206))

(assert (= (and b!392198 (not c!54292)) b!392201))

(assert (= (and b!392206 res!224631) b!392211))

(assert (= (or b!392206 b!392201) bm!27672))

(assert (= (and b!392198 res!224637) b!392207))

(assert (= (and b!392207 c!54291) b!392204))

(assert (= (and b!392207 (not c!54291)) b!392218))

(assert (= (and b!392204 res!224634) b!392216))

(assert (= (or b!392204 b!392218) bm!27676))

(declare-fun b_lambda!8705 () Bool)

(assert (=> (not b_lambda!8705) (not b!392213)))

(assert (=> b!392213 t!11563))

(declare-fun b_and!16329 () Bool)

(assert (= b_and!16327 (and (=> t!11563 result!5747) b_and!16329)))

(declare-fun m!388155 () Bool)

(assert (=> bm!27672 m!388155))

(assert (=> b!392205 m!388079))

(assert (=> b!392205 m!388079))

(declare-fun m!388157 () Bool)

(assert (=> b!392205 m!388157))

(declare-fun m!388159 () Bool)

(assert (=> bm!27676 m!388159))

(assert (=> b!392213 m!388125))

(assert (=> b!392213 m!388125))

(assert (=> b!392213 m!388127))

(assert (=> b!392213 m!388129))

(assert (=> b!392213 m!388079))

(declare-fun m!388161 () Bool)

(assert (=> b!392213 m!388161))

(assert (=> b!392213 m!388079))

(assert (=> b!392213 m!388127))

(assert (=> b!392202 m!388079))

(assert (=> b!392202 m!388079))

(assert (=> b!392202 m!388107))

(declare-fun m!388163 () Bool)

(assert (=> b!392217 m!388163))

(declare-fun m!388165 () Bool)

(assert (=> b!392211 m!388165))

(declare-fun m!388167 () Bool)

(assert (=> bm!27673 m!388167))

(assert (=> b!392209 m!388079))

(assert (=> b!392209 m!388079))

(assert (=> b!392209 m!388107))

(assert (=> d!72939 m!387957))

(declare-fun m!388169 () Bool)

(assert (=> b!392200 m!388169))

(declare-fun m!388171 () Bool)

(assert (=> b!392200 m!388171))

(declare-fun m!388173 () Bool)

(assert (=> b!392200 m!388173))

(declare-fun m!388175 () Bool)

(assert (=> b!392200 m!388175))

(declare-fun m!388177 () Bool)

(assert (=> b!392200 m!388177))

(declare-fun m!388179 () Bool)

(assert (=> b!392200 m!388179))

(assert (=> b!392200 m!388177))

(declare-fun m!388181 () Bool)

(assert (=> b!392200 m!388181))

(declare-fun m!388183 () Bool)

(assert (=> b!392200 m!388183))

(declare-fun m!388185 () Bool)

(assert (=> b!392200 m!388185))

(declare-fun m!388187 () Bool)

(assert (=> b!392200 m!388187))

(declare-fun m!388189 () Bool)

(assert (=> b!392200 m!388189))

(assert (=> b!392200 m!388189))

(declare-fun m!388191 () Bool)

(assert (=> b!392200 m!388191))

(assert (=> b!392200 m!388079))

(assert (=> b!392200 m!387937))

(assert (=> b!392200 m!388185))

(declare-fun m!388193 () Bool)

(assert (=> b!392200 m!388193))

(declare-fun m!388195 () Bool)

(assert (=> b!392200 m!388195))

(assert (=> b!392200 m!388183))

(declare-fun m!388197 () Bool)

(assert (=> b!392200 m!388197))

(assert (=> bm!27674 m!387937))

(declare-fun m!388199 () Bool)

(assert (=> b!392216 m!388199))

(assert (=> b!391984 d!72939))

(declare-fun lt!185268 () ListLongMap!5459)

(declare-fun b!392219 () Bool)

(declare-fun e!237502 () Bool)

(assert (=> b!392219 (= e!237502 (= lt!185268 (getCurrentListMapNoExtraKeys!976 lt!185079 lt!185077 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!392220 () Bool)

(declare-fun e!237506 () Bool)

(assert (=> b!392220 (= e!237506 e!237502)))

(declare-fun c!54299 () Bool)

(assert (=> b!392220 (= c!54299 (bvslt #b00000000000000000000000000000000 (size!11438 lt!185079)))))

(declare-fun b!392221 () Bool)

(assert (=> b!392221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11438 lt!185079)))))

(assert (=> b!392221 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11437 lt!185077)))))

(declare-fun e!237500 () Bool)

(assert (=> b!392221 (= e!237500 (= (apply!305 lt!185268 (select (arr!11085 lt!185079) #b00000000000000000000000000000000)) (get!5599 (select (arr!11084 lt!185077) #b00000000000000000000000000000000) (dynLambda!639 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!392222 () Bool)

(declare-fun e!237501 () Bool)

(assert (=> b!392222 (= e!237501 e!237506)))

(declare-fun c!54297 () Bool)

(declare-fun e!237504 () Bool)

(assert (=> b!392222 (= c!54297 e!237504)))

(declare-fun res!224642 () Bool)

(assert (=> b!392222 (=> (not res!224642) (not e!237504))))

(assert (=> b!392222 (= res!224642 (bvslt #b00000000000000000000000000000000 (size!11438 lt!185079)))))

(declare-fun b!392223 () Bool)

(assert (=> b!392223 (= e!237506 e!237500)))

(assert (=> b!392223 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11438 lt!185079)))))

(declare-fun res!224643 () Bool)

(assert (=> b!392223 (= res!224643 (contains!2454 lt!185268 (select (arr!11085 lt!185079) #b00000000000000000000000000000000)))))

(assert (=> b!392223 (=> (not res!224643) (not e!237500))))

(declare-fun b!392224 () Bool)

(declare-fun e!237503 () ListLongMap!5459)

(declare-fun e!237505 () ListLongMap!5459)

(assert (=> b!392224 (= e!237503 e!237505)))

(declare-fun c!54298 () Bool)

(assert (=> b!392224 (= c!54298 (validKeyInArray!0 (select (arr!11085 lt!185079) #b00000000000000000000000000000000)))))

(declare-fun b!392225 () Bool)

(declare-fun lt!185269 () Unit!11980)

(declare-fun lt!185267 () Unit!11980)

(assert (=> b!392225 (= lt!185269 lt!185267)))

(declare-fun lt!185266 () ListLongMap!5459)

(declare-fun lt!185264 () (_ BitVec 64))

(declare-fun lt!185265 () (_ BitVec 64))

(declare-fun lt!185263 () V!14011)

(assert (=> b!392225 (not (contains!2454 (+!1065 lt!185266 (tuple2!6557 lt!185265 lt!185263)) lt!185264))))

(assert (=> b!392225 (= lt!185267 (addStillNotContains!139 lt!185266 lt!185265 lt!185263 lt!185264))))

(assert (=> b!392225 (= lt!185264 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!392225 (= lt!185263 (get!5599 (select (arr!11084 lt!185077) #b00000000000000000000000000000000) (dynLambda!639 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!392225 (= lt!185265 (select (arr!11085 lt!185079) #b00000000000000000000000000000000))))

(declare-fun call!27680 () ListLongMap!5459)

(assert (=> b!392225 (= lt!185266 call!27680)))

(assert (=> b!392225 (= e!237505 (+!1065 call!27680 (tuple2!6557 (select (arr!11085 lt!185079) #b00000000000000000000000000000000) (get!5599 (select (arr!11084 lt!185077) #b00000000000000000000000000000000) (dynLambda!639 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!392226 () Bool)

(declare-fun res!224641 () Bool)

(assert (=> b!392226 (=> (not res!224641) (not e!237501))))

(assert (=> b!392226 (= res!224641 (not (contains!2454 lt!185268 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!27677 () Bool)

(assert (=> bm!27677 (= call!27680 (getCurrentListMapNoExtraKeys!976 lt!185079 lt!185077 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!392227 () Bool)

(assert (=> b!392227 (= e!237502 (isEmpty!555 lt!185268))))

(declare-fun b!392228 () Bool)

(assert (=> b!392228 (= e!237504 (validKeyInArray!0 (select (arr!11085 lt!185079) #b00000000000000000000000000000000)))))

(assert (=> b!392228 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!392229 () Bool)

(assert (=> b!392229 (= e!237503 (ListLongMap!5460 Nil!6397))))

(declare-fun b!392230 () Bool)

(assert (=> b!392230 (= e!237505 call!27680)))

(declare-fun d!72941 () Bool)

(assert (=> d!72941 e!237501))

(declare-fun res!224640 () Bool)

(assert (=> d!72941 (=> (not res!224640) (not e!237501))))

(assert (=> d!72941 (= res!224640 (not (contains!2454 lt!185268 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72941 (= lt!185268 e!237503)))

(declare-fun c!54296 () Bool)

(assert (=> d!72941 (= c!54296 (bvsge #b00000000000000000000000000000000 (size!11438 lt!185079)))))

(assert (=> d!72941 (validMask!0 mask!970)))

(assert (=> d!72941 (= (getCurrentListMapNoExtraKeys!976 lt!185079 lt!185077 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185268)))

(assert (= (and d!72941 c!54296) b!392229))

(assert (= (and d!72941 (not c!54296)) b!392224))

(assert (= (and b!392224 c!54298) b!392225))

(assert (= (and b!392224 (not c!54298)) b!392230))

(assert (= (or b!392225 b!392230) bm!27677))

(assert (= (and d!72941 res!224640) b!392226))

(assert (= (and b!392226 res!224641) b!392222))

(assert (= (and b!392222 res!224642) b!392228))

(assert (= (and b!392222 c!54297) b!392223))

(assert (= (and b!392222 (not c!54297)) b!392220))

(assert (= (and b!392223 res!224643) b!392221))

(assert (= (and b!392220 c!54299) b!392219))

(assert (= (and b!392220 (not c!54299)) b!392227))

(declare-fun b_lambda!8707 () Bool)

(assert (=> (not b_lambda!8707) (not b!392221)))

(assert (=> b!392221 t!11563))

(declare-fun b_and!16331 () Bool)

(assert (= b_and!16329 (and (=> t!11563 result!5747) b_and!16331)))

(declare-fun b_lambda!8709 () Bool)

(assert (=> (not b_lambda!8709) (not b!392225)))

(assert (=> b!392225 t!11563))

(declare-fun b_and!16333 () Bool)

(assert (= b_and!16331 (and (=> t!11563 result!5747) b_and!16333)))

(assert (=> b!392224 m!388095))

(assert (=> b!392224 m!388095))

(assert (=> b!392224 m!388097))

(declare-fun m!388201 () Bool)

(assert (=> b!392226 m!388201))

(assert (=> b!392223 m!388095))

(assert (=> b!392223 m!388095))

(declare-fun m!388203 () Bool)

(assert (=> b!392223 m!388203))

(declare-fun m!388205 () Bool)

(assert (=> b!392225 m!388205))

(declare-fun m!388207 () Bool)

(assert (=> b!392225 m!388207))

(declare-fun m!388209 () Bool)

(assert (=> b!392225 m!388209))

(assert (=> b!392225 m!388095))

(assert (=> b!392225 m!388205))

(assert (=> b!392225 m!388209))

(assert (=> b!392225 m!388127))

(declare-fun m!388211 () Bool)

(assert (=> b!392225 m!388211))

(declare-fun m!388213 () Bool)

(assert (=> b!392225 m!388213))

(assert (=> b!392225 m!388127))

(declare-fun m!388215 () Bool)

(assert (=> b!392225 m!388215))

(assert (=> b!392228 m!388095))

(assert (=> b!392228 m!388095))

(assert (=> b!392228 m!388097))

(declare-fun m!388217 () Bool)

(assert (=> b!392219 m!388217))

(assert (=> bm!27677 m!388217))

(assert (=> b!392221 m!388209))

(assert (=> b!392221 m!388095))

(declare-fun m!388219 () Bool)

(assert (=> b!392221 m!388219))

(assert (=> b!392221 m!388095))

(assert (=> b!392221 m!388209))

(assert (=> b!392221 m!388127))

(assert (=> b!392221 m!388211))

(assert (=> b!392221 m!388127))

(declare-fun m!388221 () Bool)

(assert (=> d!72941 m!388221))

(assert (=> d!72941 m!387957))

(declare-fun m!388223 () Bool)

(assert (=> b!392227 m!388223))

(assert (=> b!391984 d!72941))

(declare-fun b!392237 () Bool)

(declare-fun e!237511 () Bool)

(declare-fun call!27686 () ListLongMap!5459)

(declare-fun call!27685 () ListLongMap!5459)

(assert (=> b!392237 (= e!237511 (= call!27686 call!27685))))

(declare-fun b!392238 () Bool)

(declare-fun e!237512 () Bool)

(assert (=> b!392238 (= e!237512 e!237511)))

(declare-fun c!54302 () Bool)

(assert (=> b!392238 (= c!54302 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun b!392239 () Bool)

(assert (=> b!392239 (= e!237511 (= call!27686 (+!1065 call!27685 (tuple2!6557 k0!778 v!373))))))

(declare-fun d!72943 () Bool)

(assert (=> d!72943 e!237512))

(declare-fun res!224646 () Bool)

(assert (=> d!72943 (=> (not res!224646) (not e!237512))))

(assert (=> d!72943 (= res!224646 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11438 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11437 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11438 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11437 _values!506))))))))

(declare-fun lt!185272 () Unit!11980)

(declare-fun choose!1327 (array!23249 array!23247 (_ BitVec 32) (_ BitVec 32) V!14011 V!14011 (_ BitVec 32) (_ BitVec 64) V!14011 (_ BitVec 32) Int) Unit!11980)

(assert (=> d!72943 (= lt!185272 (choose!1327 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72943 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11438 _keys!658)))))

(assert (=> d!72943 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!267 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!185272)))

(declare-fun bm!27682 () Bool)

(assert (=> bm!27682 (= call!27686 (getCurrentListMapNoExtraKeys!976 (array!23250 (store (arr!11085 _keys!658) i!548 k0!778) (size!11438 _keys!658)) (array!23248 (store (arr!11084 _values!506) i!548 (ValueCellFull!4496 v!373)) (size!11437 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27683 () Bool)

(assert (=> bm!27683 (= call!27685 (getCurrentListMapNoExtraKeys!976 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!72943 res!224646) b!392238))

(assert (= (and b!392238 c!54302) b!392239))

(assert (= (and b!392238 (not c!54302)) b!392237))

(assert (= (or b!392239 b!392237) bm!27683))

(assert (= (or b!392239 b!392237) bm!27682))

(declare-fun m!388225 () Bool)

(assert (=> b!392239 m!388225))

(declare-fun m!388227 () Bool)

(assert (=> d!72943 m!388227))

(assert (=> bm!27682 m!387935))

(assert (=> bm!27682 m!387945))

(declare-fun m!388229 () Bool)

(assert (=> bm!27682 m!388229))

(assert (=> bm!27683 m!387937))

(assert (=> b!391984 d!72943))

(declare-fun bm!27684 () Bool)

(declare-fun call!27693 () ListLongMap!5459)

(declare-fun call!27691 () ListLongMap!5459)

(assert (=> bm!27684 (= call!27693 call!27691)))

(declare-fun b!392240 () Bool)

(declare-fun res!224653 () Bool)

(declare-fun e!237516 () Bool)

(assert (=> b!392240 (=> (not res!224653) (not e!237516))))

(declare-fun e!237520 () Bool)

(assert (=> b!392240 (= res!224653 e!237520)))

(declare-fun c!54305 () Bool)

(assert (=> b!392240 (= c!54305 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun d!72945 () Bool)

(assert (=> d!72945 e!237516))

(declare-fun res!224648 () Bool)

(assert (=> d!72945 (=> (not res!224648) (not e!237516))))

(assert (=> d!72945 (= res!224648 (or (bvsge #b00000000000000000000000000000000 (size!11438 lt!185079)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11438 lt!185079)))))))

(declare-fun lt!185294 () ListLongMap!5459)

(declare-fun lt!185274 () ListLongMap!5459)

(assert (=> d!72945 (= lt!185294 lt!185274)))

(declare-fun lt!185292 () Unit!11980)

(declare-fun e!237514 () Unit!11980)

(assert (=> d!72945 (= lt!185292 e!237514)))

(declare-fun c!54307 () Bool)

(declare-fun e!237517 () Bool)

(assert (=> d!72945 (= c!54307 e!237517)))

(declare-fun res!224649 () Bool)

(assert (=> d!72945 (=> (not res!224649) (not e!237517))))

(assert (=> d!72945 (= res!224649 (bvslt #b00000000000000000000000000000000 (size!11438 lt!185079)))))

(declare-fun e!237515 () ListLongMap!5459)

(assert (=> d!72945 (= lt!185274 e!237515)))

(declare-fun c!54306 () Bool)

(assert (=> d!72945 (= c!54306 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72945 (validMask!0 mask!970)))

(assert (=> d!72945 (= (getCurrentListMap!2066 lt!185079 lt!185077 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!185294)))

(declare-fun b!392241 () Bool)

(declare-fun e!237518 () ListLongMap!5459)

(declare-fun call!27689 () ListLongMap!5459)

(assert (=> b!392241 (= e!237518 call!27689)))

(declare-fun b!392242 () Bool)

(declare-fun lt!185275 () Unit!11980)

(assert (=> b!392242 (= e!237514 lt!185275)))

(declare-fun lt!185279 () ListLongMap!5459)

(assert (=> b!392242 (= lt!185279 (getCurrentListMapNoExtraKeys!976 lt!185079 lt!185077 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185286 () (_ BitVec 64))

(assert (=> b!392242 (= lt!185286 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185281 () (_ BitVec 64))

(assert (=> b!392242 (= lt!185281 (select (arr!11085 lt!185079) #b00000000000000000000000000000000))))

(declare-fun lt!185293 () Unit!11980)

(assert (=> b!392242 (= lt!185293 (addStillContains!281 lt!185279 lt!185286 zeroValue!472 lt!185281))))

(assert (=> b!392242 (contains!2454 (+!1065 lt!185279 (tuple2!6557 lt!185286 zeroValue!472)) lt!185281)))

(declare-fun lt!185278 () Unit!11980)

(assert (=> b!392242 (= lt!185278 lt!185293)))

(declare-fun lt!185289 () ListLongMap!5459)

(assert (=> b!392242 (= lt!185289 (getCurrentListMapNoExtraKeys!976 lt!185079 lt!185077 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185291 () (_ BitVec 64))

(assert (=> b!392242 (= lt!185291 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185288 () (_ BitVec 64))

(assert (=> b!392242 (= lt!185288 (select (arr!11085 lt!185079) #b00000000000000000000000000000000))))

(declare-fun lt!185285 () Unit!11980)

(assert (=> b!392242 (= lt!185285 (addApplyDifferent!281 lt!185289 lt!185291 minValue!472 lt!185288))))

(assert (=> b!392242 (= (apply!305 (+!1065 lt!185289 (tuple2!6557 lt!185291 minValue!472)) lt!185288) (apply!305 lt!185289 lt!185288))))

(declare-fun lt!185276 () Unit!11980)

(assert (=> b!392242 (= lt!185276 lt!185285)))

(declare-fun lt!185282 () ListLongMap!5459)

(assert (=> b!392242 (= lt!185282 (getCurrentListMapNoExtraKeys!976 lt!185079 lt!185077 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185290 () (_ BitVec 64))

(assert (=> b!392242 (= lt!185290 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185284 () (_ BitVec 64))

(assert (=> b!392242 (= lt!185284 (select (arr!11085 lt!185079) #b00000000000000000000000000000000))))

(declare-fun lt!185283 () Unit!11980)

(assert (=> b!392242 (= lt!185283 (addApplyDifferent!281 lt!185282 lt!185290 zeroValue!472 lt!185284))))

(assert (=> b!392242 (= (apply!305 (+!1065 lt!185282 (tuple2!6557 lt!185290 zeroValue!472)) lt!185284) (apply!305 lt!185282 lt!185284))))

(declare-fun lt!185287 () Unit!11980)

(assert (=> b!392242 (= lt!185287 lt!185283)))

(declare-fun lt!185273 () ListLongMap!5459)

(assert (=> b!392242 (= lt!185273 (getCurrentListMapNoExtraKeys!976 lt!185079 lt!185077 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185280 () (_ BitVec 64))

(assert (=> b!392242 (= lt!185280 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185277 () (_ BitVec 64))

(assert (=> b!392242 (= lt!185277 (select (arr!11085 lt!185079) #b00000000000000000000000000000000))))

(assert (=> b!392242 (= lt!185275 (addApplyDifferent!281 lt!185273 lt!185280 minValue!472 lt!185277))))

(assert (=> b!392242 (= (apply!305 (+!1065 lt!185273 (tuple2!6557 lt!185280 minValue!472)) lt!185277) (apply!305 lt!185273 lt!185277))))

(declare-fun b!392243 () Bool)

(declare-fun call!27692 () Bool)

(assert (=> b!392243 (= e!237520 (not call!27692))))

(declare-fun b!392244 () Bool)

(assert (=> b!392244 (= e!237517 (validKeyInArray!0 (select (arr!11085 lt!185079) #b00000000000000000000000000000000)))))

(declare-fun bm!27685 () Bool)

(assert (=> bm!27685 (= call!27689 call!27693)))

(declare-fun b!392245 () Bool)

(declare-fun Unit!11983 () Unit!11980)

(assert (=> b!392245 (= e!237514 Unit!11983)))

(declare-fun bm!27686 () Bool)

(assert (=> bm!27686 (= call!27692 (contains!2454 lt!185294 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27687 () Bool)

(declare-fun c!54308 () Bool)

(declare-fun call!27690 () ListLongMap!5459)

(assert (=> bm!27687 (= call!27690 (+!1065 (ite c!54306 call!27691 (ite c!54308 call!27693 call!27689)) (ite (or c!54306 c!54308) (tuple2!6557 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!392246 () Bool)

(declare-fun e!237519 () Bool)

(declare-fun e!237523 () Bool)

(assert (=> b!392246 (= e!237519 e!237523)))

(declare-fun res!224650 () Bool)

(declare-fun call!27687 () Bool)

(assert (=> b!392246 (= res!224650 call!27687)))

(assert (=> b!392246 (=> (not res!224650) (not e!237523))))

(declare-fun b!392247 () Bool)

(declare-fun e!237525 () Bool)

(declare-fun e!237513 () Bool)

(assert (=> b!392247 (= e!237525 e!237513)))

(declare-fun res!224655 () Bool)

(assert (=> b!392247 (=> (not res!224655) (not e!237513))))

(assert (=> b!392247 (= res!224655 (contains!2454 lt!185294 (select (arr!11085 lt!185079) #b00000000000000000000000000000000)))))

(assert (=> b!392247 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11438 lt!185079)))))

(declare-fun b!392248 () Bool)

(declare-fun e!237522 () Bool)

(assert (=> b!392248 (= e!237520 e!237522)))

(declare-fun res!224647 () Bool)

(assert (=> b!392248 (= res!224647 call!27692)))

(assert (=> b!392248 (=> (not res!224647) (not e!237522))))

(declare-fun b!392249 () Bool)

(assert (=> b!392249 (= e!237516 e!237519)))

(declare-fun c!54304 () Bool)

(assert (=> b!392249 (= c!54304 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392250 () Bool)

(declare-fun e!237521 () ListLongMap!5459)

(declare-fun call!27688 () ListLongMap!5459)

(assert (=> b!392250 (= e!237521 call!27688)))

(declare-fun b!392251 () Bool)

(declare-fun e!237524 () Bool)

(assert (=> b!392251 (= e!237524 (validKeyInArray!0 (select (arr!11085 lt!185079) #b00000000000000000000000000000000)))))

(declare-fun bm!27688 () Bool)

(assert (=> bm!27688 (= call!27691 (getCurrentListMapNoExtraKeys!976 lt!185079 lt!185077 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392252 () Bool)

(assert (=> b!392252 (= e!237518 call!27688)))

(declare-fun b!392253 () Bool)

(assert (=> b!392253 (= e!237522 (= (apply!305 lt!185294 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27689 () Bool)

(assert (=> bm!27689 (= call!27688 call!27690)))

(declare-fun b!392254 () Bool)

(assert (=> b!392254 (= e!237515 e!237521)))

(assert (=> b!392254 (= c!54308 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!392255 () Bool)

(assert (=> b!392255 (= e!237513 (= (apply!305 lt!185294 (select (arr!11085 lt!185079) #b00000000000000000000000000000000)) (get!5599 (select (arr!11084 lt!185077) #b00000000000000000000000000000000) (dynLambda!639 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!392255 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11437 lt!185077)))))

(assert (=> b!392255 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11438 lt!185079)))))

(declare-fun b!392256 () Bool)

(declare-fun res!224654 () Bool)

(assert (=> b!392256 (=> (not res!224654) (not e!237516))))

(assert (=> b!392256 (= res!224654 e!237525)))

(declare-fun res!224651 () Bool)

(assert (=> b!392256 (=> res!224651 e!237525)))

(assert (=> b!392256 (= res!224651 (not e!237524))))

(declare-fun res!224652 () Bool)

(assert (=> b!392256 (=> (not res!224652) (not e!237524))))

(assert (=> b!392256 (= res!224652 (bvslt #b00000000000000000000000000000000 (size!11438 lt!185079)))))

(declare-fun b!392257 () Bool)

(declare-fun c!54303 () Bool)

(assert (=> b!392257 (= c!54303 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!392257 (= e!237521 e!237518)))

(declare-fun b!392258 () Bool)

(assert (=> b!392258 (= e!237523 (= (apply!305 lt!185294 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun b!392259 () Bool)

(assert (=> b!392259 (= e!237515 (+!1065 call!27690 (tuple2!6557 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!392260 () Bool)

(assert (=> b!392260 (= e!237519 (not call!27687))))

(declare-fun bm!27690 () Bool)

(assert (=> bm!27690 (= call!27687 (contains!2454 lt!185294 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!72945 c!54306) b!392259))

(assert (= (and d!72945 (not c!54306)) b!392254))

(assert (= (and b!392254 c!54308) b!392250))

(assert (= (and b!392254 (not c!54308)) b!392257))

(assert (= (and b!392257 c!54303) b!392252))

(assert (= (and b!392257 (not c!54303)) b!392241))

(assert (= (or b!392252 b!392241) bm!27685))

(assert (= (or b!392250 bm!27685) bm!27684))

(assert (= (or b!392250 b!392252) bm!27689))

(assert (= (or b!392259 bm!27684) bm!27688))

(assert (= (or b!392259 bm!27689) bm!27687))

(assert (= (and d!72945 res!224649) b!392244))

(assert (= (and d!72945 c!54307) b!392242))

(assert (= (and d!72945 (not c!54307)) b!392245))

(assert (= (and d!72945 res!224648) b!392256))

(assert (= (and b!392256 res!224652) b!392251))

(assert (= (and b!392256 (not res!224651)) b!392247))

(assert (= (and b!392247 res!224655) b!392255))

(assert (= (and b!392256 res!224654) b!392240))

(assert (= (and b!392240 c!54305) b!392248))

(assert (= (and b!392240 (not c!54305)) b!392243))

(assert (= (and b!392248 res!224647) b!392253))

(assert (= (or b!392248 b!392243) bm!27686))

(assert (= (and b!392240 res!224653) b!392249))

(assert (= (and b!392249 c!54304) b!392246))

(assert (= (and b!392249 (not c!54304)) b!392260))

(assert (= (and b!392246 res!224650) b!392258))

(assert (= (or b!392246 b!392260) bm!27690))

(declare-fun b_lambda!8711 () Bool)

(assert (=> (not b_lambda!8711) (not b!392255)))

(assert (=> b!392255 t!11563))

(declare-fun b_and!16335 () Bool)

(assert (= b_and!16333 (and (=> t!11563 result!5747) b_and!16335)))

(declare-fun m!388231 () Bool)

(assert (=> bm!27686 m!388231))

(assert (=> b!392247 m!388095))

(assert (=> b!392247 m!388095))

(declare-fun m!388233 () Bool)

(assert (=> b!392247 m!388233))

(declare-fun m!388235 () Bool)

(assert (=> bm!27690 m!388235))

(assert (=> b!392255 m!388209))

(assert (=> b!392255 m!388209))

(assert (=> b!392255 m!388127))

(assert (=> b!392255 m!388211))

(assert (=> b!392255 m!388095))

(declare-fun m!388237 () Bool)

(assert (=> b!392255 m!388237))

(assert (=> b!392255 m!388095))

(assert (=> b!392255 m!388127))

(assert (=> b!392244 m!388095))

(assert (=> b!392244 m!388095))

(assert (=> b!392244 m!388097))

(declare-fun m!388239 () Bool)

(assert (=> b!392259 m!388239))

(declare-fun m!388241 () Bool)

(assert (=> b!392253 m!388241))

(declare-fun m!388243 () Bool)

(assert (=> bm!27687 m!388243))

(assert (=> b!392251 m!388095))

(assert (=> b!392251 m!388095))

(assert (=> b!392251 m!388097))

(assert (=> d!72945 m!387957))

(declare-fun m!388245 () Bool)

(assert (=> b!392242 m!388245))

(declare-fun m!388247 () Bool)

(assert (=> b!392242 m!388247))

(declare-fun m!388249 () Bool)

(assert (=> b!392242 m!388249))

(declare-fun m!388251 () Bool)

(assert (=> b!392242 m!388251))

(declare-fun m!388253 () Bool)

(assert (=> b!392242 m!388253))

(declare-fun m!388255 () Bool)

(assert (=> b!392242 m!388255))

(assert (=> b!392242 m!388253))

(declare-fun m!388257 () Bool)

(assert (=> b!392242 m!388257))

(declare-fun m!388259 () Bool)

(assert (=> b!392242 m!388259))

(declare-fun m!388261 () Bool)

(assert (=> b!392242 m!388261))

(declare-fun m!388263 () Bool)

(assert (=> b!392242 m!388263))

(declare-fun m!388265 () Bool)

(assert (=> b!392242 m!388265))

(assert (=> b!392242 m!388265))

(declare-fun m!388267 () Bool)

(assert (=> b!392242 m!388267))

(assert (=> b!392242 m!388095))

(assert (=> b!392242 m!387949))

(assert (=> b!392242 m!388261))

(declare-fun m!388269 () Bool)

(assert (=> b!392242 m!388269))

(declare-fun m!388271 () Bool)

(assert (=> b!392242 m!388271))

(assert (=> b!392242 m!388259))

(declare-fun m!388273 () Bool)

(assert (=> b!392242 m!388273))

(assert (=> bm!27688 m!387949))

(declare-fun m!388275 () Bool)

(assert (=> b!392258 m!388275))

(assert (=> b!391984 d!72945))

(declare-fun bm!27693 () Bool)

(declare-fun call!27696 () Bool)

(declare-fun c!54311 () Bool)

(assert (=> bm!27693 (= call!27696 (arrayNoDuplicates!0 lt!185079 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54311 (Cons!6395 (select (arr!11085 lt!185079) #b00000000000000000000000000000000) Nil!6396) Nil!6396)))))

(declare-fun b!392271 () Bool)

(declare-fun e!237534 () Bool)

(assert (=> b!392271 (= e!237534 call!27696)))

(declare-fun d!72947 () Bool)

(declare-fun res!224663 () Bool)

(declare-fun e!237536 () Bool)

(assert (=> d!72947 (=> res!224663 e!237536)))

(assert (=> d!72947 (= res!224663 (bvsge #b00000000000000000000000000000000 (size!11438 lt!185079)))))

(assert (=> d!72947 (= (arrayNoDuplicates!0 lt!185079 #b00000000000000000000000000000000 Nil!6396) e!237536)))

(declare-fun b!392272 () Bool)

(declare-fun e!237537 () Bool)

(assert (=> b!392272 (= e!237537 e!237534)))

(assert (=> b!392272 (= c!54311 (validKeyInArray!0 (select (arr!11085 lt!185079) #b00000000000000000000000000000000)))))

(declare-fun b!392273 () Bool)

(assert (=> b!392273 (= e!237536 e!237537)))

(declare-fun res!224662 () Bool)

(assert (=> b!392273 (=> (not res!224662) (not e!237537))))

(declare-fun e!237535 () Bool)

(assert (=> b!392273 (= res!224662 (not e!237535))))

(declare-fun res!224664 () Bool)

(assert (=> b!392273 (=> (not res!224664) (not e!237535))))

(assert (=> b!392273 (= res!224664 (validKeyInArray!0 (select (arr!11085 lt!185079) #b00000000000000000000000000000000)))))

(declare-fun b!392274 () Bool)

(assert (=> b!392274 (= e!237534 call!27696)))

(declare-fun b!392275 () Bool)

(declare-fun contains!2456 (List!6399 (_ BitVec 64)) Bool)

(assert (=> b!392275 (= e!237535 (contains!2456 Nil!6396 (select (arr!11085 lt!185079) #b00000000000000000000000000000000)))))

(assert (= (and d!72947 (not res!224663)) b!392273))

(assert (= (and b!392273 res!224664) b!392275))

(assert (= (and b!392273 res!224662) b!392272))

(assert (= (and b!392272 c!54311) b!392274))

(assert (= (and b!392272 (not c!54311)) b!392271))

(assert (= (or b!392274 b!392271) bm!27693))

(assert (=> bm!27693 m!388095))

(declare-fun m!388277 () Bool)

(assert (=> bm!27693 m!388277))

(assert (=> b!392272 m!388095))

(assert (=> b!392272 m!388095))

(assert (=> b!392272 m!388097))

(assert (=> b!392273 m!388095))

(assert (=> b!392273 m!388095))

(assert (=> b!392273 m!388097))

(assert (=> b!392275 m!388095))

(assert (=> b!392275 m!388095))

(declare-fun m!388279 () Bool)

(assert (=> b!392275 m!388279))

(assert (=> b!391979 d!72947))

(declare-fun bm!27694 () Bool)

(declare-fun call!27697 () Bool)

(declare-fun c!54312 () Bool)

(assert (=> bm!27694 (= call!27697 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54312 (Cons!6395 (select (arr!11085 _keys!658) #b00000000000000000000000000000000) Nil!6396) Nil!6396)))))

(declare-fun b!392276 () Bool)

(declare-fun e!237538 () Bool)

(assert (=> b!392276 (= e!237538 call!27697)))

(declare-fun d!72949 () Bool)

(declare-fun res!224666 () Bool)

(declare-fun e!237540 () Bool)

(assert (=> d!72949 (=> res!224666 e!237540)))

(assert (=> d!72949 (= res!224666 (bvsge #b00000000000000000000000000000000 (size!11438 _keys!658)))))

(assert (=> d!72949 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6396) e!237540)))

(declare-fun b!392277 () Bool)

(declare-fun e!237541 () Bool)

(assert (=> b!392277 (= e!237541 e!237538)))

(assert (=> b!392277 (= c!54312 (validKeyInArray!0 (select (arr!11085 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392278 () Bool)

(assert (=> b!392278 (= e!237540 e!237541)))

(declare-fun res!224665 () Bool)

(assert (=> b!392278 (=> (not res!224665) (not e!237541))))

(declare-fun e!237539 () Bool)

(assert (=> b!392278 (= res!224665 (not e!237539))))

(declare-fun res!224667 () Bool)

(assert (=> b!392278 (=> (not res!224667) (not e!237539))))

(assert (=> b!392278 (= res!224667 (validKeyInArray!0 (select (arr!11085 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!392279 () Bool)

(assert (=> b!392279 (= e!237538 call!27697)))

(declare-fun b!392280 () Bool)

(assert (=> b!392280 (= e!237539 (contains!2456 Nil!6396 (select (arr!11085 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72949 (not res!224666)) b!392278))

(assert (= (and b!392278 res!224667) b!392280))

(assert (= (and b!392278 res!224665) b!392277))

(assert (= (and b!392277 c!54312) b!392279))

(assert (= (and b!392277 (not c!54312)) b!392276))

(assert (= (or b!392279 b!392276) bm!27694))

(assert (=> bm!27694 m!388079))

(declare-fun m!388281 () Bool)

(assert (=> bm!27694 m!388281))

(assert (=> b!392277 m!388079))

(assert (=> b!392277 m!388079))

(assert (=> b!392277 m!388107))

(assert (=> b!392278 m!388079))

(assert (=> b!392278 m!388079))

(assert (=> b!392278 m!388107))

(assert (=> b!392280 m!388079))

(assert (=> b!392280 m!388079))

(declare-fun m!388283 () Bool)

(assert (=> b!392280 m!388283))

(assert (=> b!391981 d!72949))

(declare-fun d!72951 () Bool)

(assert (=> d!72951 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391990 d!72951))

(declare-fun d!72953 () Bool)

(assert (=> d!72953 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!38068 d!72953))

(declare-fun d!72955 () Bool)

(assert (=> d!72955 (= (array_inv!8142 _values!506) (bvsge (size!11437 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!38068 d!72955))

(declare-fun d!72957 () Bool)

(assert (=> d!72957 (= (array_inv!8143 _keys!658) (bvsge (size!11438 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!38068 d!72957))

(declare-fun condMapEmpty!16116 () Bool)

(declare-fun mapDefault!16116 () ValueCell!4496)

(assert (=> mapNonEmpty!16107 (= condMapEmpty!16116 (= mapRest!16107 ((as const (Array (_ BitVec 32) ValueCell!4496)) mapDefault!16116)))))

(declare-fun e!237546 () Bool)

(declare-fun mapRes!16116 () Bool)

(assert (=> mapNonEmpty!16107 (= tp!31796 (and e!237546 mapRes!16116))))

(declare-fun mapNonEmpty!16116 () Bool)

(declare-fun tp!31812 () Bool)

(declare-fun e!237547 () Bool)

(assert (=> mapNonEmpty!16116 (= mapRes!16116 (and tp!31812 e!237547))))

(declare-fun mapKey!16116 () (_ BitVec 32))

(declare-fun mapRest!16116 () (Array (_ BitVec 32) ValueCell!4496))

(declare-fun mapValue!16116 () ValueCell!4496)

(assert (=> mapNonEmpty!16116 (= mapRest!16107 (store mapRest!16116 mapKey!16116 mapValue!16116))))

(declare-fun b!392288 () Bool)

(assert (=> b!392288 (= e!237546 tp_is_empty!9679)))

(declare-fun mapIsEmpty!16116 () Bool)

(assert (=> mapIsEmpty!16116 mapRes!16116))

(declare-fun b!392287 () Bool)

(assert (=> b!392287 (= e!237547 tp_is_empty!9679)))

(assert (= (and mapNonEmpty!16107 condMapEmpty!16116) mapIsEmpty!16116))

(assert (= (and mapNonEmpty!16107 (not condMapEmpty!16116)) mapNonEmpty!16116))

(assert (= (and mapNonEmpty!16116 ((_ is ValueCellFull!4496) mapValue!16116)) b!392287))

(assert (= (and mapNonEmpty!16107 ((_ is ValueCellFull!4496) mapDefault!16116)) b!392288))

(declare-fun m!388285 () Bool)

(assert (=> mapNonEmpty!16116 m!388285))

(declare-fun b_lambda!8713 () Bool)

(assert (= b_lambda!8711 (or (and start!38068 b_free!9007) b_lambda!8713)))

(declare-fun b_lambda!8715 () Bool)

(assert (= b_lambda!8701 (or (and start!38068 b_free!9007) b_lambda!8715)))

(declare-fun b_lambda!8717 () Bool)

(assert (= b_lambda!8709 (or (and start!38068 b_free!9007) b_lambda!8717)))

(declare-fun b_lambda!8719 () Bool)

(assert (= b_lambda!8707 (or (and start!38068 b_free!9007) b_lambda!8719)))

(declare-fun b_lambda!8721 () Bool)

(assert (= b_lambda!8703 (or (and start!38068 b_free!9007) b_lambda!8721)))

(declare-fun b_lambda!8723 () Bool)

(assert (= b_lambda!8705 (or (and start!38068 b_free!9007) b_lambda!8723)))

(check-sat (not b_next!9007) (not b!392280) (not b!392258) (not b!392217) (not b!392253) (not b!392272) (not b!392219) (not b!392145) (not b!392278) (not b!392227) (not b!392140) (not b!392226) (not b!392275) (not b!392091) (not d!72935) (not b!392099) (not bm!27690) (not b!392213) (not d!72941) (not b!392147) (not b!392088) (not bm!27655) (not d!72923) (not b!392211) (not b!392200) (not b!392244) (not b!392209) (not b!392242) (not bm!27674) (not b_lambda!8723) (not b!392142) (not b!392221) (not d!72943) (not b!392114) (not b_lambda!8719) (not b!392239) (not bm!27652) (not b!392205) (not d!72925) (not b!392148) (not b_lambda!8713) (not b!392259) (not b!392110) (not b!392277) (not b!392112) (not bm!27651) (not bm!27676) (not d!72929) (not b!392155) (not bm!27688) (not b!392247) tp_is_empty!9679 (not bm!27686) (not b!392251) (not b_lambda!8717) (not bm!27693) (not b!392097) (not bm!27682) (not b!392149) (not b!392225) (not b!392224) (not bm!27694) (not b!392144) (not b!392098) (not b_lambda!8721) (not d!72939) (not b!392216) (not bm!27683) b_and!16335 (not d!72937) (not b!392108) (not bm!27687) (not b_lambda!8715) (not b!392255) (not mapNonEmpty!16116) (not b!392202) (not b!392089) (not bm!27672) (not bm!27677) (not d!72945) (not b!392273) (not b!392228) (not bm!27673) (not b!392223) (not b!392154) (not b!392146) (not b!392090))
(check-sat b_and!16335 (not b_next!9007))
