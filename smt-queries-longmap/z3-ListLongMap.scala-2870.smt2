; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41304 () Bool)

(assert start!41304)

(declare-fun b!461976 () Bool)

(declare-fun res!276339 () Bool)

(declare-fun e!269494 () Bool)

(assert (=> b!461976 (=> (not res!276339) (not e!269494))))

(declare-datatypes ((array!28712 0))(
  ( (array!28713 (arr!13791 (Array (_ BitVec 32) (_ BitVec 64))) (size!14143 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28712)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28712 (_ BitVec 32)) Bool)

(assert (=> b!461976 (= res!276339 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun mapIsEmpty!20350 () Bool)

(declare-fun mapRes!20350 () Bool)

(assert (=> mapIsEmpty!20350 mapRes!20350))

(declare-fun mapNonEmpty!20350 () Bool)

(declare-fun tp!39169 () Bool)

(declare-fun e!269492 () Bool)

(assert (=> mapNonEmpty!20350 (= mapRes!20350 (and tp!39169 e!269492))))

(declare-datatypes ((V!17715 0))(
  ( (V!17716 (val!6273 Int)) )
))
(declare-datatypes ((ValueCell!5885 0))(
  ( (ValueCellFull!5885 (v!8560 V!17715)) (EmptyCell!5885) )
))
(declare-datatypes ((array!28714 0))(
  ( (array!28715 (arr!13792 (Array (_ BitVec 32) ValueCell!5885)) (size!14144 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28714)

(declare-fun mapRest!20350 () (Array (_ BitVec 32) ValueCell!5885))

(declare-fun mapValue!20350 () ValueCell!5885)

(declare-fun mapKey!20350 () (_ BitVec 32))

(assert (=> mapNonEmpty!20350 (= (arr!13792 _values!833) (store mapRest!20350 mapKey!20350 mapValue!20350))))

(declare-fun b!461977 () Bool)

(declare-fun e!269491 () Bool)

(declare-fun e!269493 () Bool)

(assert (=> b!461977 (= e!269491 (and e!269493 mapRes!20350))))

(declare-fun condMapEmpty!20350 () Bool)

(declare-fun mapDefault!20350 () ValueCell!5885)

(assert (=> b!461977 (= condMapEmpty!20350 (= (arr!13792 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5885)) mapDefault!20350)))))

(declare-fun b!461978 () Bool)

(declare-fun tp_is_empty!12457 () Bool)

(assert (=> b!461978 (= e!269492 tp_is_empty!12457)))

(declare-fun res!276338 () Bool)

(assert (=> start!41304 (=> (not res!276338) (not e!269494))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41304 (= res!276338 (validMask!0 mask!1365))))

(assert (=> start!41304 e!269494))

(assert (=> start!41304 true))

(declare-fun array_inv!10058 (array!28712) Bool)

(assert (=> start!41304 (array_inv!10058 _keys!1025)))

(declare-fun array_inv!10059 (array!28714) Bool)

(assert (=> start!41304 (and (array_inv!10059 _values!833) e!269491)))

(declare-fun b!461979 () Bool)

(assert (=> b!461979 (= e!269493 tp_is_empty!12457)))

(declare-fun b!461980 () Bool)

(declare-datatypes ((List!8256 0))(
  ( (Nil!8253) (Cons!8252 (h!9108 (_ BitVec 64)) (t!14192 List!8256)) )
))
(declare-fun noDuplicate!202 (List!8256) Bool)

(assert (=> b!461980 (= e!269494 (not (noDuplicate!202 Nil!8253)))))

(declare-fun b!461981 () Bool)

(declare-fun res!276341 () Bool)

(assert (=> b!461981 (=> (not res!276341) (not e!269494))))

(assert (=> b!461981 (= res!276341 (and (bvsle #b00000000000000000000000000000000 (size!14143 _keys!1025)) (bvslt (size!14143 _keys!1025) #b01111111111111111111111111111111)))))

(declare-fun b!461982 () Bool)

(declare-fun res!276340 () Bool)

(assert (=> b!461982 (=> (not res!276340) (not e!269494))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!461982 (= res!276340 (and (= (size!14144 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14143 _keys!1025) (size!14144 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (= (and start!41304 res!276338) b!461982))

(assert (= (and b!461982 res!276340) b!461976))

(assert (= (and b!461976 res!276339) b!461981))

(assert (= (and b!461981 res!276341) b!461980))

(assert (= (and b!461977 condMapEmpty!20350) mapIsEmpty!20350))

(assert (= (and b!461977 (not condMapEmpty!20350)) mapNonEmpty!20350))

(get-info :version)

(assert (= (and mapNonEmpty!20350 ((_ is ValueCellFull!5885) mapValue!20350)) b!461978))

(assert (= (and b!461977 ((_ is ValueCellFull!5885) mapDefault!20350)) b!461979))

(assert (= start!41304 b!461977))

(declare-fun m!445297 () Bool)

(assert (=> b!461976 m!445297))

(declare-fun m!445299 () Bool)

(assert (=> mapNonEmpty!20350 m!445299))

(declare-fun m!445301 () Bool)

(assert (=> start!41304 m!445301))

(declare-fun m!445303 () Bool)

(assert (=> start!41304 m!445303))

(declare-fun m!445305 () Bool)

(assert (=> start!41304 m!445305))

(declare-fun m!445307 () Bool)

(assert (=> b!461980 m!445307))

(check-sat (not mapNonEmpty!20350) tp_is_empty!12457 (not b!461976) (not b!461980) (not start!41304))
(check-sat)
(get-model)

(declare-fun d!74959 () Bool)

(assert (=> d!74959 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41304 d!74959))

(declare-fun d!74961 () Bool)

(assert (=> d!74961 (= (array_inv!10058 _keys!1025) (bvsge (size!14143 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41304 d!74961))

(declare-fun d!74963 () Bool)

(assert (=> d!74963 (= (array_inv!10059 _values!833) (bvsge (size!14144 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41304 d!74963))

(declare-fun d!74965 () Bool)

(declare-fun res!276371 () Bool)

(declare-fun e!269531 () Bool)

(assert (=> d!74965 (=> res!276371 e!269531)))

(assert (=> d!74965 (= res!276371 (bvsge #b00000000000000000000000000000000 (size!14143 _keys!1025)))))

(assert (=> d!74965 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!269531)))

(declare-fun bm!30183 () Bool)

(declare-fun call!30186 () Bool)

(assert (=> bm!30183 (= call!30186 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!462033 () Bool)

(declare-fun e!269533 () Bool)

(assert (=> b!462033 (= e!269533 call!30186)))

(declare-fun b!462034 () Bool)

(declare-fun e!269532 () Bool)

(assert (=> b!462034 (= e!269532 e!269533)))

(declare-fun lt!209172 () (_ BitVec 64))

(assert (=> b!462034 (= lt!209172 (select (arr!13791 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13438 0))(
  ( (Unit!13439) )
))
(declare-fun lt!209173 () Unit!13438)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28712 (_ BitVec 64) (_ BitVec 32)) Unit!13438)

(assert (=> b!462034 (= lt!209173 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209172 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28712 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!462034 (arrayContainsKey!0 _keys!1025 lt!209172 #b00000000000000000000000000000000)))

(declare-fun lt!209171 () Unit!13438)

(assert (=> b!462034 (= lt!209171 lt!209173)))

(declare-fun res!276370 () Bool)

(declare-datatypes ((SeekEntryResult!3489 0))(
  ( (MissingZero!3489 (index!16135 (_ BitVec 32))) (Found!3489 (index!16136 (_ BitVec 32))) (Intermediate!3489 (undefined!4301 Bool) (index!16137 (_ BitVec 32)) (x!43020 (_ BitVec 32))) (Undefined!3489) (MissingVacant!3489 (index!16138 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28712 (_ BitVec 32)) SeekEntryResult!3489)

(assert (=> b!462034 (= res!276370 (= (seekEntryOrOpen!0 (select (arr!13791 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3489 #b00000000000000000000000000000000)))))

(assert (=> b!462034 (=> (not res!276370) (not e!269533))))

(declare-fun b!462035 () Bool)

(assert (=> b!462035 (= e!269531 e!269532)))

(declare-fun c!56598 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!462035 (= c!56598 (validKeyInArray!0 (select (arr!13791 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!462036 () Bool)

(assert (=> b!462036 (= e!269532 call!30186)))

(assert (= (and d!74965 (not res!276371)) b!462035))

(assert (= (and b!462035 c!56598) b!462034))

(assert (= (and b!462035 (not c!56598)) b!462036))

(assert (= (and b!462034 res!276370) b!462033))

(assert (= (or b!462033 b!462036) bm!30183))

(declare-fun m!445333 () Bool)

(assert (=> bm!30183 m!445333))

(declare-fun m!445335 () Bool)

(assert (=> b!462034 m!445335))

(declare-fun m!445337 () Bool)

(assert (=> b!462034 m!445337))

(declare-fun m!445339 () Bool)

(assert (=> b!462034 m!445339))

(assert (=> b!462034 m!445335))

(declare-fun m!445341 () Bool)

(assert (=> b!462034 m!445341))

(assert (=> b!462035 m!445335))

(assert (=> b!462035 m!445335))

(declare-fun m!445343 () Bool)

(assert (=> b!462035 m!445343))

(assert (=> b!461976 d!74965))

(declare-fun d!74967 () Bool)

(declare-fun res!276376 () Bool)

(declare-fun e!269538 () Bool)

(assert (=> d!74967 (=> res!276376 e!269538)))

(assert (=> d!74967 (= res!276376 ((_ is Nil!8253) Nil!8253))))

(assert (=> d!74967 (= (noDuplicate!202 Nil!8253) e!269538)))

(declare-fun b!462041 () Bool)

(declare-fun e!269539 () Bool)

(assert (=> b!462041 (= e!269538 e!269539)))

(declare-fun res!276377 () Bool)

(assert (=> b!462041 (=> (not res!276377) (not e!269539))))

(declare-fun contains!2495 (List!8256 (_ BitVec 64)) Bool)

(assert (=> b!462041 (= res!276377 (not (contains!2495 (t!14192 Nil!8253) (h!9108 Nil!8253))))))

(declare-fun b!462042 () Bool)

(assert (=> b!462042 (= e!269539 (noDuplicate!202 (t!14192 Nil!8253)))))

(assert (= (and d!74967 (not res!276376)) b!462041))

(assert (= (and b!462041 res!276377) b!462042))

(declare-fun m!445345 () Bool)

(assert (=> b!462041 m!445345))

(declare-fun m!445347 () Bool)

(assert (=> b!462042 m!445347))

(assert (=> b!461980 d!74967))

(declare-fun b!462049 () Bool)

(declare-fun e!269545 () Bool)

(assert (=> b!462049 (= e!269545 tp_is_empty!12457)))

(declare-fun mapNonEmpty!20359 () Bool)

(declare-fun mapRes!20359 () Bool)

(declare-fun tp!39178 () Bool)

(assert (=> mapNonEmpty!20359 (= mapRes!20359 (and tp!39178 e!269545))))

(declare-fun mapValue!20359 () ValueCell!5885)

(declare-fun mapRest!20359 () (Array (_ BitVec 32) ValueCell!5885))

(declare-fun mapKey!20359 () (_ BitVec 32))

(assert (=> mapNonEmpty!20359 (= mapRest!20350 (store mapRest!20359 mapKey!20359 mapValue!20359))))

(declare-fun mapIsEmpty!20359 () Bool)

(assert (=> mapIsEmpty!20359 mapRes!20359))

(declare-fun condMapEmpty!20359 () Bool)

(declare-fun mapDefault!20359 () ValueCell!5885)

(assert (=> mapNonEmpty!20350 (= condMapEmpty!20359 (= mapRest!20350 ((as const (Array (_ BitVec 32) ValueCell!5885)) mapDefault!20359)))))

(declare-fun e!269544 () Bool)

(assert (=> mapNonEmpty!20350 (= tp!39169 (and e!269544 mapRes!20359))))

(declare-fun b!462050 () Bool)

(assert (=> b!462050 (= e!269544 tp_is_empty!12457)))

(assert (= (and mapNonEmpty!20350 condMapEmpty!20359) mapIsEmpty!20359))

(assert (= (and mapNonEmpty!20350 (not condMapEmpty!20359)) mapNonEmpty!20359))

(assert (= (and mapNonEmpty!20359 ((_ is ValueCellFull!5885) mapValue!20359)) b!462049))

(assert (= (and mapNonEmpty!20350 ((_ is ValueCellFull!5885) mapDefault!20359)) b!462050))

(declare-fun m!445349 () Bool)

(assert (=> mapNonEmpty!20359 m!445349))

(check-sat (not mapNonEmpty!20359) (not b!462034) (not b!462042) (not b!462041) (not b!462035) tp_is_empty!12457 (not bm!30183))
(check-sat)
