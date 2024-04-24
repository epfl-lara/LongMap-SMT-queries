; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41276 () Bool)

(assert start!41276)

(declare-fun b!461826 () Bool)

(declare-fun e!269371 () Bool)

(declare-datatypes ((array!28684 0))(
  ( (array!28685 (arr!13779 (Array (_ BitVec 32) (_ BitVec 64))) (size!14131 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!28684)

(assert (=> b!461826 (= e!269371 (bvsgt #b00000000000000000000000000000000 (size!14131 _keys!1025)))))

(declare-fun mapNonEmpty!20326 () Bool)

(declare-fun mapRes!20326 () Bool)

(declare-fun tp!39145 () Bool)

(declare-fun e!269372 () Bool)

(assert (=> mapNonEmpty!20326 (= mapRes!20326 (and tp!39145 e!269372))))

(declare-datatypes ((V!17699 0))(
  ( (V!17700 (val!6267 Int)) )
))
(declare-datatypes ((ValueCell!5879 0))(
  ( (ValueCellFull!5879 (v!8554 V!17699)) (EmptyCell!5879) )
))
(declare-fun mapRest!20326 () (Array (_ BitVec 32) ValueCell!5879))

(declare-datatypes ((array!28686 0))(
  ( (array!28687 (arr!13780 (Array (_ BitVec 32) ValueCell!5879)) (size!14132 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!28686)

(declare-fun mapValue!20326 () ValueCell!5879)

(declare-fun mapKey!20326 () (_ BitVec 32))

(assert (=> mapNonEmpty!20326 (= (arr!13780 _values!833) (store mapRest!20326 mapKey!20326 mapValue!20326))))

(declare-fun b!461827 () Bool)

(declare-fun res!276272 () Bool)

(assert (=> b!461827 (=> (not res!276272) (not e!269371))))

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28684 (_ BitVec 32)) Bool)

(assert (=> b!461827 (= res!276272 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun res!276271 () Bool)

(assert (=> start!41276 (=> (not res!276271) (not e!269371))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!41276 (= res!276271 (validMask!0 mask!1365))))

(assert (=> start!41276 e!269371))

(assert (=> start!41276 true))

(declare-fun array_inv!10046 (array!28684) Bool)

(assert (=> start!41276 (array_inv!10046 _keys!1025)))

(declare-fun e!269373 () Bool)

(declare-fun array_inv!10047 (array!28686) Bool)

(assert (=> start!41276 (and (array_inv!10047 _values!833) e!269373)))

(declare-fun b!461828 () Bool)

(declare-fun e!269370 () Bool)

(declare-fun tp_is_empty!12445 () Bool)

(assert (=> b!461828 (= e!269370 tp_is_empty!12445)))

(declare-fun b!461829 () Bool)

(assert (=> b!461829 (= e!269372 tp_is_empty!12445)))

(declare-fun b!461830 () Bool)

(declare-fun res!276270 () Bool)

(assert (=> b!461830 (=> (not res!276270) (not e!269371))))

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(assert (=> b!461830 (= res!276270 (and (= (size!14132 _values!833) (bvadd #b00000000000000000000000000000001 mask!1365)) (= (size!14131 _keys!1025) (size!14132 _values!833)) (bvsge mask!1365 #b00000000000000000000000000000000) (bvsge extraKeysBefore!66 #b00000000000000000000000000000000) (bvsle extraKeysBefore!66 #b00000000000000000000000000000011) (bvsge extraKeysAfter!58 #b00000000000000000000000000000000) (bvsle extraKeysAfter!58 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!66 #b00000000000000000000000000000001) (bvand extraKeysAfter!58 #b00000000000000000000000000000001)) (not (= (bvand extraKeysAfter!58 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!20326 () Bool)

(assert (=> mapIsEmpty!20326 mapRes!20326))

(declare-fun b!461831 () Bool)

(assert (=> b!461831 (= e!269373 (and e!269370 mapRes!20326))))

(declare-fun condMapEmpty!20326 () Bool)

(declare-fun mapDefault!20326 () ValueCell!5879)

(assert (=> b!461831 (= condMapEmpty!20326 (= (arr!13780 _values!833) ((as const (Array (_ BitVec 32) ValueCell!5879)) mapDefault!20326)))))

(assert (= (and start!41276 res!276271) b!461830))

(assert (= (and b!461830 res!276270) b!461827))

(assert (= (and b!461827 res!276272) b!461826))

(assert (= (and b!461831 condMapEmpty!20326) mapIsEmpty!20326))

(assert (= (and b!461831 (not condMapEmpty!20326)) mapNonEmpty!20326))

(get-info :version)

(assert (= (and mapNonEmpty!20326 ((_ is ValueCellFull!5879) mapValue!20326)) b!461829))

(assert (= (and b!461831 ((_ is ValueCellFull!5879) mapDefault!20326)) b!461828))

(assert (= start!41276 b!461831))

(declare-fun m!445209 () Bool)

(assert (=> mapNonEmpty!20326 m!445209))

(declare-fun m!445211 () Bool)

(assert (=> b!461827 m!445211))

(declare-fun m!445213 () Bool)

(assert (=> start!41276 m!445213))

(declare-fun m!445215 () Bool)

(assert (=> start!41276 m!445215))

(declare-fun m!445217 () Bool)

(assert (=> start!41276 m!445217))

(check-sat (not start!41276) (not b!461827) (not mapNonEmpty!20326) tp_is_empty!12445)
(check-sat)
(get-model)

(declare-fun d!74939 () Bool)

(assert (=> d!74939 (= (validMask!0 mask!1365) (and (or (= mask!1365 #b00000000000000000000000000000111) (= mask!1365 #b00000000000000000000000000001111) (= mask!1365 #b00000000000000000000000000011111) (= mask!1365 #b00000000000000000000000000111111) (= mask!1365 #b00000000000000000000000001111111) (= mask!1365 #b00000000000000000000000011111111) (= mask!1365 #b00000000000000000000000111111111) (= mask!1365 #b00000000000000000000001111111111) (= mask!1365 #b00000000000000000000011111111111) (= mask!1365 #b00000000000000000000111111111111) (= mask!1365 #b00000000000000000001111111111111) (= mask!1365 #b00000000000000000011111111111111) (= mask!1365 #b00000000000000000111111111111111) (= mask!1365 #b00000000000000001111111111111111) (= mask!1365 #b00000000000000011111111111111111) (= mask!1365 #b00000000000000111111111111111111) (= mask!1365 #b00000000000001111111111111111111) (= mask!1365 #b00000000000011111111111111111111) (= mask!1365 #b00000000000111111111111111111111) (= mask!1365 #b00000000001111111111111111111111) (= mask!1365 #b00000000011111111111111111111111) (= mask!1365 #b00000000111111111111111111111111) (= mask!1365 #b00000001111111111111111111111111) (= mask!1365 #b00000011111111111111111111111111) (= mask!1365 #b00000111111111111111111111111111) (= mask!1365 #b00001111111111111111111111111111) (= mask!1365 #b00011111111111111111111111111111) (= mask!1365 #b00111111111111111111111111111111)) (bvsle mask!1365 #b00111111111111111111111111111111)))))

(assert (=> start!41276 d!74939))

(declare-fun d!74941 () Bool)

(assert (=> d!74941 (= (array_inv!10046 _keys!1025) (bvsge (size!14131 _keys!1025) #b00000000000000000000000000000000))))

(assert (=> start!41276 d!74941))

(declare-fun d!74943 () Bool)

(assert (=> d!74943 (= (array_inv!10047 _values!833) (bvsge (size!14132 _values!833) #b00000000000000000000000000000000))))

(assert (=> start!41276 d!74943))

(declare-fun bm!30177 () Bool)

(declare-fun call!30180 () Bool)

(assert (=> bm!30177 (= call!30180 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1025 mask!1365))))

(declare-fun b!461876 () Bool)

(declare-fun e!269413 () Bool)

(assert (=> b!461876 (= e!269413 call!30180)))

(declare-fun b!461877 () Bool)

(declare-fun e!269412 () Bool)

(assert (=> b!461877 (= e!269412 call!30180)))

(declare-fun d!74945 () Bool)

(declare-fun res!276295 () Bool)

(declare-fun e!269411 () Bool)

(assert (=> d!74945 (=> res!276295 e!269411)))

(assert (=> d!74945 (= res!276295 (bvsge #b00000000000000000000000000000000 (size!14131 _keys!1025)))))

(assert (=> d!74945 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365) e!269411)))

(declare-fun b!461878 () Bool)

(assert (=> b!461878 (= e!269411 e!269413)))

(declare-fun c!56592 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461878 (= c!56592 (validKeyInArray!0 (select (arr!13779 _keys!1025) #b00000000000000000000000000000000)))))

(declare-fun b!461879 () Bool)

(assert (=> b!461879 (= e!269413 e!269412)))

(declare-fun lt!209155 () (_ BitVec 64))

(assert (=> b!461879 (= lt!209155 (select (arr!13779 _keys!1025) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!13434 0))(
  ( (Unit!13435) )
))
(declare-fun lt!209154 () Unit!13434)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28684 (_ BitVec 64) (_ BitVec 32)) Unit!13434)

(assert (=> b!461879 (= lt!209154 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1025 lt!209155 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!28684 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461879 (arrayContainsKey!0 _keys!1025 lt!209155 #b00000000000000000000000000000000)))

(declare-fun lt!209153 () Unit!13434)

(assert (=> b!461879 (= lt!209153 lt!209154)))

(declare-fun res!276296 () Bool)

(declare-datatypes ((SeekEntryResult!3487 0))(
  ( (MissingZero!3487 (index!16127 (_ BitVec 32))) (Found!3487 (index!16128 (_ BitVec 32))) (Intermediate!3487 (undefined!4299 Bool) (index!16129 (_ BitVec 32)) (x!42998 (_ BitVec 32))) (Undefined!3487) (MissingVacant!3487 (index!16130 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28684 (_ BitVec 32)) SeekEntryResult!3487)

(assert (=> b!461879 (= res!276296 (= (seekEntryOrOpen!0 (select (arr!13779 _keys!1025) #b00000000000000000000000000000000) _keys!1025 mask!1365) (Found!3487 #b00000000000000000000000000000000)))))

(assert (=> b!461879 (=> (not res!276296) (not e!269412))))

(assert (= (and d!74945 (not res!276295)) b!461878))

(assert (= (and b!461878 c!56592) b!461879))

(assert (= (and b!461878 (not c!56592)) b!461876))

(assert (= (and b!461879 res!276296) b!461877))

(assert (= (or b!461877 b!461876) bm!30177))

(declare-fun m!445239 () Bool)

(assert (=> bm!30177 m!445239))

(declare-fun m!445241 () Bool)

(assert (=> b!461878 m!445241))

(assert (=> b!461878 m!445241))

(declare-fun m!445243 () Bool)

(assert (=> b!461878 m!445243))

(assert (=> b!461879 m!445241))

(declare-fun m!445245 () Bool)

(assert (=> b!461879 m!445245))

(declare-fun m!445247 () Bool)

(assert (=> b!461879 m!445247))

(assert (=> b!461879 m!445241))

(declare-fun m!445249 () Bool)

(assert (=> b!461879 m!445249))

(assert (=> b!461827 d!74945))

(declare-fun condMapEmpty!20335 () Bool)

(declare-fun mapDefault!20335 () ValueCell!5879)

(assert (=> mapNonEmpty!20326 (= condMapEmpty!20335 (= mapRest!20326 ((as const (Array (_ BitVec 32) ValueCell!5879)) mapDefault!20335)))))

(declare-fun e!269419 () Bool)

(declare-fun mapRes!20335 () Bool)

(assert (=> mapNonEmpty!20326 (= tp!39145 (and e!269419 mapRes!20335))))

(declare-fun b!461886 () Bool)

(declare-fun e!269418 () Bool)

(assert (=> b!461886 (= e!269418 tp_is_empty!12445)))

(declare-fun mapIsEmpty!20335 () Bool)

(assert (=> mapIsEmpty!20335 mapRes!20335))

(declare-fun mapNonEmpty!20335 () Bool)

(declare-fun tp!39154 () Bool)

(assert (=> mapNonEmpty!20335 (= mapRes!20335 (and tp!39154 e!269418))))

(declare-fun mapRest!20335 () (Array (_ BitVec 32) ValueCell!5879))

(declare-fun mapKey!20335 () (_ BitVec 32))

(declare-fun mapValue!20335 () ValueCell!5879)

(assert (=> mapNonEmpty!20335 (= mapRest!20326 (store mapRest!20335 mapKey!20335 mapValue!20335))))

(declare-fun b!461887 () Bool)

(assert (=> b!461887 (= e!269419 tp_is_empty!12445)))

(assert (= (and mapNonEmpty!20326 condMapEmpty!20335) mapIsEmpty!20335))

(assert (= (and mapNonEmpty!20326 (not condMapEmpty!20335)) mapNonEmpty!20335))

(assert (= (and mapNonEmpty!20335 ((_ is ValueCellFull!5879) mapValue!20335)) b!461886))

(assert (= (and mapNonEmpty!20326 ((_ is ValueCellFull!5879) mapDefault!20335)) b!461887))

(declare-fun m!445251 () Bool)

(assert (=> mapNonEmpty!20335 m!445251))

(check-sat (not bm!30177) (not mapNonEmpty!20335) tp_is_empty!12445 (not b!461878) (not b!461879))
(check-sat)
