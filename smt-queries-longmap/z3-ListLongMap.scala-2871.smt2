; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41320 () Bool)

(assert start!41320)

(declare-fun mapNonEmpty!20362 () Bool)

(declare-fun mapRes!20362 () Bool)

(declare-fun tp!39181 () Bool)

(declare-fun e!269562 () Bool)

(assert (=> mapNonEmpty!20362 (= mapRes!20362 (and tp!39181 e!269562))))

(declare-datatypes ((V!17723 0))(
  ( (V!17724 (val!6276 Int)) )
))
(declare-datatypes ((ValueCell!5888 0))(
  ( (ValueCellFull!5888 (v!8563 V!17723)) (EmptyCell!5888) )
))
(declare-fun mapRest!20362 () (Array (_ BitVec 32) ValueCell!5888))

(declare-fun mapKey!20362 () (_ BitVec 32))

(declare-datatypes ((array!28726 0))(
  ( (array!28727 (arr!13797 (Array (_ BitVec 32) ValueCell!5888)) (size!14149 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28726)

(declare-fun mapValue!20362 () ValueCell!5888)

(assert (=> mapNonEmpty!20362 (= (arr!13797 _values!833) (store mapRest!20362 mapKey!20362 mapValue!20362))))

(declare-fun b!462069 () Bool)

(declare-fun res!276395 () Bool)

(declare-fun e!269559 () Bool)

(assert (=> b!462069 (=> (not res!276395) (not e!269559))))

(declare-datatypes ((array!28728 0))(
  ( (array!28729 (arr!13798 (Array (_ BitVec 32) (_ BitVec 64))) (size!14150 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28728)

(assert (=> b!462069 (= res!276395 (and (bvsle #b00000000000000000000000000000000 (size!14150 _keys!1025)) (bvslt (size!14150 _keys!1025) #b01111111111111111111111111111111)))))

(declare-fun mapIsEmpty!20362 () Bool)

(assert (=> mapIsEmpty!20362 mapRes!20362))

(declare-fun res!276394 () Bool)

(assert (=> start!41320 (=> (not res!276394) (not e!269559))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41320 (= res!276394 (validMask!0 mask!1365))))

(assert (=> start!41320 e!269559))

(assert (=> start!41320 true))

(declare-fun array_inv!10062 (array!28728) Bool)

(assert (=> start!41320 (array_inv!10062 _keys!1025)))

(declare-fun e!269561 () Bool)

(declare-fun array_inv!10063 (array!28726) Bool)

(assert (=> start!41320 (and (array_inv!10063 _values!833) e!269561)))

(declare-fun b!462070 () Bool)

(declare-fun e!269563 () Bool)

(declare-fun tp_is_empty!12463 () Bool)

(assert (=> b!462070 (= e!269563 tp_is_empty!12463)))

(declare-fun b!462071 () Bool)

(assert (=> b!462071 (= e!269562 tp_is_empty!12463)))

(declare-fun b!462072 () Bool)

(declare-fun res!276391 () Bool)

(assert (=> b!462072 (=> (not res!276391) (not e!269559))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!462072 (= res!276391 (and (= (size!14149 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14150 _keys!1025) (size!14149 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!462073 () Bool)

(declare-fun res!276393 () Bool)

(assert (=> b!462073 (=> (not res!276393) (not e!269559))))

(declare-datatypes ((List!8259 0))(
  ( (Nil!8256) (Cons!8255 (h!9111 (_ BitVec 64)) (t!14195 List!8259)) )
))
(declare-fun noDuplicate!205 (List!8259) Bool)

(assert (=> b!462073 (= res!276393 (noDuplicate!205 Nil!8256))))

(declare-fun b!462074 () Bool)

(assert (=> b!462074 (= e!269561 (and e!269563 mapRes!20362))))

(declare-fun condMapEmpty!20362 () Bool)

(declare-fun mapDefault!20362 () ValueCell!5888)

(assert (=> b!462074 (= condMapEmpty!20362 (= (arr!13797 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5888)) mapDefault!20362)))))

(declare-fun b!462075 () Bool)

(declare-fun e!269558 () Bool)

(declare-fun contains!2496 (List!8259 (_ BitVec 64)) Bool)

(assert (=> b!462075 (= e!269558 (contains!2496 Nil!8256 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!462076 () Bool)

(assert (=> b!462076 (= e!269559 e!269558)))

(declare-fun res!276390 () Bool)

(assert (=> b!462076 (=> res!276390 e!269558)))

(assert (=> b!462076 (= res!276390 (contains!2496 Nil!8256 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!462077 () Bool)

(declare-fun res!276392 () Bool)

(assert (=> b!462077 (=> (not res!276392) (not e!269559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28728 (_ BitVec 32)) Bool)

(assert (=> b!462077 (= res!276392 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(assert (= (and start!41320 res!276394) b!462072))

(assert (= (and b!462072 res!276391) b!462077))

(assert (= (and b!462077 res!276392) b!462069))

(assert (= (and b!462069 res!276395) b!462073))

(assert (= (and b!462073 res!276393) b!462076))

(assert (= (and b!462076 (not res!276390)) b!462075))

(assert (= (and b!462074 condMapEmpty!20362) mapIsEmpty!20362))

(assert (= (and b!462074 (not condMapEmpty!20362)) mapNonEmpty!20362))

(get-info :version)

(assert (= (and mapNonEmpty!20362 ((_ is ValueCellFull!5888) mapValue!20362)) b!462071))

(assert (= (and b!462074 ((_ is ValueCellFull!5888) mapDefault!20362)) b!462070))

(assert (= start!41320 b!462074))

(declare-fun m!445351 () Bool)

(assert (=> b!462076 m!445351))

(declare-fun m!445353 () Bool)

(assert (=> mapNonEmpty!20362 m!445353))

(declare-fun m!445355 () Bool)

(assert (=> b!462073 m!445355))

(declare-fun m!445357 () Bool)

(assert (=> b!462077 m!445357))

(declare-fun m!445359 () Bool)

(assert (=> b!462075 m!445359))

(declare-fun m!445361 () Bool)

(assert (=> start!41320 m!445361))

(declare-fun m!445363 () Bool)

(assert (=> start!41320 m!445363))

(declare-fun m!445365 () Bool)

(assert (=> start!41320 m!445365))

(check-sat (not start!41320) (not b!462075) tp_is_empty!12463 (not b!462073) (not b!462076) (not b!462077) (not mapNonEmpty!20362))
(check-sat)
(get-model)

(declare-fun d!74971 () Bool)

(declare-fun lt!209176 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!207 (List!8259) (InoxSet (_ BitVec 64)))

(assert (=> d!74971 (= lt!209176 (select (content!207 Nil!8256) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!269605 () Bool)

(assert (=> d!74971 (= lt!209176 e!269605)))

(declare-fun res!276437 () Bool)

(assert (=> d!74971 (=> (not res!276437) (not e!269605))))

(assert (=> d!74971 (= res!276437 ((_ is Cons!8255) Nil!8256))))

(assert (=> d!74971 (= (contains!2496 Nil!8256 #b0000000000000000000000000000000000000000000000000000000000000000) lt!209176)))

(declare-fun b!462136 () Bool)

(declare-fun e!269604 () Bool)

(assert (=> b!462136 (= e!269605 e!269604)))

(declare-fun res!276436 () Bool)

(assert (=> b!462136 (=> res!276436 e!269604)))

(assert (=> b!462136 (= res!276436 (= (h!9111 Nil!8256) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!462137 () Bool)

(assert (=> b!462137 (= e!269604 (contains!2496 (t!14195 Nil!8256) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!74971 res!276437) b!462136))

(assert (= (and b!462136 (not res!276436)) b!462137))

(declare-fun m!445399 () Bool)

(assert (=> d!74971 m!445399))

(declare-fun m!445401 () Bool)

(assert (=> d!74971 m!445401))

(declare-fun m!445403 () Bool)

(assert (=> b!462137 m!445403))

(assert (=> b!462076 d!74971))

(declare-fun b!462146 () Bool)

(declare-fun e!269614 () Bool)

(declare-fun e!269613 () Bool)

(assert (=> b!462146 (= e!269614 e!269613)))

(declare-fun c!56601 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!462146 (= c!56601 (validKeyInArray!0 (select (arr!13798 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!462147 () Bool)

(declare-fun e!269612 () Bool)

(assert (=> b!462147 (= e!269613 e!269612)))

(declare-fun lt!209185 () (_ BitVec 64))

(assert (=> b!462147 (= lt!209185 (select (arr!13798 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13440 0))(
  ( (Unit!13441) )
))
(declare-fun lt!209184 () Unit!13440)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28728 (_ BitVec 64) (_ BitVec 32)) Unit!13440)

(assert (=> b!462147 (= lt!209184 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209185 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28728 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!462147 (arrayContainsKey!0 _keys!1025 lt!209185 #b00000000000000000000000000000000)))

(declare-fun lt!209183 () Unit!13440)

(assert (=> b!462147 (= lt!209183 lt!209184)))

(declare-fun res!276442 () Bool)

(declare-datatypes ((SeekEntryResult!3490 0))(
  ( (MissingZero!3490 (index!16139 (_ BitVec 32))) (Found!3490 (index!16140 (_ BitVec 32))) (Intermediate!3490 (undefined!4302 Bool) (index!16141 (_ BitVec 32)) (x!43031 (_ BitVec 32))) (Undefined!3490) (MissingVacant!3490 (index!16142 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28728 (_ BitVec 32)) SeekEntryResult!3490)

(assert (=> b!462147 (= res!276442 (= (seekEntryOrOpen!0 (select (arr!13798 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3490 #b00000000000000000000000000000000)))))

(assert (=> b!462147 (=> (not res!276442) (not e!269612))))

(declare-fun d!74973 () Bool)

(declare-fun res!276443 () Bool)

(assert (=> d!74973 (=> res!276443 e!269614)))

(assert (=> d!74973 (= res!276443 (bvsge #b00000000000000000000000000000000 (size!14150 _keys!1025)))))

(assert (=> d!74973 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!269614)))

(declare-fun bm!30186 () Bool)

(declare-fun call!30189 () Bool)

(assert (=> bm!30186 (= call!30189 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!462148 () Bool)

(assert (=> b!462148 (= e!269612 call!30189)))

(declare-fun b!462149 () Bool)

(assert (=> b!462149 (= e!269613 call!30189)))

(assert (= (and d!74973 (not res!276443)) b!462146))

(assert (= (and b!462146 c!56601) b!462147))

(assert (= (and b!462146 (not c!56601)) b!462149))

(assert (= (and b!462147 res!276442) b!462148))

(assert (= (or b!462148 b!462149) bm!30186))

(declare-fun m!445405 () Bool)

(assert (=> b!462146 m!445405))

(assert (=> b!462146 m!445405))

(declare-fun m!445407 () Bool)

(assert (=> b!462146 m!445407))

(assert (=> b!462147 m!445405))

(declare-fun m!445409 () Bool)

(assert (=> b!462147 m!445409))

(declare-fun m!445411 () Bool)

(assert (=> b!462147 m!445411))

(assert (=> b!462147 m!445405))

(declare-fun m!445413 () Bool)

(assert (=> b!462147 m!445413))

(declare-fun m!445415 () Bool)

(assert (=> bm!30186 m!445415))

(assert (=> b!462077 d!74973))

(declare-fun d!74975 () Bool)

(declare-fun res!276448 () Bool)

(declare-fun e!269619 () Bool)

(assert (=> d!74975 (=> res!276448 e!269619)))

(assert (=> d!74975 (= res!276448 ((_ is Nil!8256) Nil!8256))))

(assert (=> d!74975 (= (noDuplicate!205 Nil!8256) e!269619)))

(declare-fun b!462154 () Bool)

(declare-fun e!269620 () Bool)

(assert (=> b!462154 (= e!269619 e!269620)))

(declare-fun res!276449 () Bool)

(assert (=> b!462154 (=> (not res!276449) (not e!269620))))

(assert (=> b!462154 (= res!276449 (not (contains!2496 (t!14195 Nil!8256) (h!9111 Nil!8256))))))

(declare-fun b!462155 () Bool)

(assert (=> b!462155 (= e!269620 (noDuplicate!205 (t!14195 Nil!8256)))))

(assert (= (and d!74975 (not res!276448)) b!462154))

(assert (= (and b!462154 res!276449) b!462155))

(declare-fun m!445417 () Bool)

(assert (=> b!462154 m!445417))

(declare-fun m!445419 () Bool)

(assert (=> b!462155 m!445419))

(assert (=> b!462073 d!74975))

(declare-fun d!74977 () Bool)

(declare-fun lt!209186 () Bool)

(assert (=> d!74977 (= lt!209186 (select (content!207 Nil!8256) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!269622 () Bool)

(assert (=> d!74977 (= lt!209186 e!269622)))

(declare-fun res!276451 () Bool)

(assert (=> d!74977 (=> (not res!276451) (not e!269622))))

(assert (=> d!74977 (= res!276451 ((_ is Cons!8255) Nil!8256))))

(assert (=> d!74977 (= (contains!2496 Nil!8256 #b1000000000000000000000000000000000000000000000000000000000000000) lt!209186)))

(declare-fun b!462156 () Bool)

(declare-fun e!269621 () Bool)

(assert (=> b!462156 (= e!269622 e!269621)))

(declare-fun res!276450 () Bool)

(assert (=> b!462156 (=> res!276450 e!269621)))

(assert (=> b!462156 (= res!276450 (= (h!9111 Nil!8256) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!462157 () Bool)

(assert (=> b!462157 (= e!269621 (contains!2496 (t!14195 Nil!8256) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!74977 res!276451) b!462156))

(assert (= (and b!462156 (not res!276450)) b!462157))

(assert (=> d!74977 m!445399))

(declare-fun m!445421 () Bool)

(assert (=> d!74977 m!445421))

(declare-fun m!445423 () Bool)

(assert (=> b!462157 m!445423))

(assert (=> b!462075 d!74977))

(declare-fun d!74979 () Bool)

(assert (=> d!74979 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41320 d!74979))

(declare-fun d!74981 () Bool)

(assert (=> d!74981 (= (array_inv!10062 _keys!1025) (bvsge (size!14150 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41320 d!74981))

(declare-fun d!74983 () Bool)

(assert (=> d!74983 (= (array_inv!10063 _values!833) (bvsge (size!14149 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41320 d!74983))

(declare-fun b!462164 () Bool)

(declare-fun e!269628 () Bool)

(assert (=> b!462164 (= e!269628 tp_is_empty!12463)))

(declare-fun b!462165 () Bool)

(declare-fun e!269627 () Bool)

(assert (=> b!462165 (= e!269627 tp_is_empty!12463)))

(declare-fun mapIsEmpty!20371 () Bool)

(declare-fun mapRes!20371 () Bool)

(assert (=> mapIsEmpty!20371 mapRes!20371))

(declare-fun mapNonEmpty!20371 () Bool)

(declare-fun tp!39190 () Bool)

(assert (=> mapNonEmpty!20371 (= mapRes!20371 (and tp!39190 e!269628))))

(declare-fun mapRest!20371 () (Array (_ BitVec 32) ValueCell!5888))

(declare-fun mapKey!20371 () (_ BitVec 32))

(declare-fun mapValue!20371 () ValueCell!5888)

(assert (=> mapNonEmpty!20371 (= mapRest!20362 (store mapRest!20371 mapKey!20371 mapValue!20371))))

(declare-fun condMapEmpty!20371 () Bool)

(declare-fun mapDefault!20371 () ValueCell!5888)

(assert (=> mapNonEmpty!20362 (= condMapEmpty!20371 (= mapRest!20362 ((as const (Array (_ BitVec 32) ValueCell!5888)) mapDefault!20371)))))

(assert (=> mapNonEmpty!20362 (= tp!39181 (and e!269627 mapRes!20371))))

(assert (= (and mapNonEmpty!20362 condMapEmpty!20371) mapIsEmpty!20371))

(assert (= (and mapNonEmpty!20362 (not condMapEmpty!20371)) mapNonEmpty!20371))

(assert (= (and mapNonEmpty!20371 ((_ is ValueCellFull!5888) mapValue!20371)) b!462164))

(assert (= (and mapNonEmpty!20362 ((_ is ValueCellFull!5888) mapDefault!20371)) b!462165))

(declare-fun m!445425 () Bool)

(assert (=> mapNonEmpty!20371 m!445425))

(check-sat (not b!462157) (not bm!30186) (not b!462147) (not d!74977) tp_is_empty!12463 (not d!74971) (not b!462137) (not mapNonEmpty!20371) (not b!462146) (not b!462155) (not b!462154))
(check-sat)
