; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38260 () Bool)

(assert start!38260)

(declare-fun b!394577 () Bool)

(declare-fun e!238876 () Bool)

(declare-datatypes ((List!6455 0))(
  ( (Nil!6452) (Cons!6451 (h!7307 (_ BitVec 64)) (t!11620 List!6455)) )
))
(declare-fun noDuplicate!194 (List!6455) Bool)

(assert (=> b!394577 (= e!238876 (not (noDuplicate!194 Nil!6452)))))

(declare-fun b!394578 () Bool)

(declare-fun e!238873 () Bool)

(declare-fun e!238875 () Bool)

(declare-fun mapRes!16266 () Bool)

(assert (=> b!394578 (= e!238873 (and e!238875 mapRes!16266))))

(declare-fun condMapEmpty!16266 () Bool)

(declare-datatypes ((V!14139 0))(
  ( (V!14140 (val!4932 Int)) )
))
(declare-datatypes ((ValueCell!4544 0))(
  ( (ValueCellFull!4544 (v!7171 V!14139)) (EmptyCell!4544) )
))
(declare-datatypes ((array!23445 0))(
  ( (array!23446 (arr!11178 (Array (_ BitVec 32) ValueCell!4544)) (size!11531 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23445)

(declare-fun mapDefault!16266 () ValueCell!4544)

(assert (=> b!394578 (= condMapEmpty!16266 (= (arr!11178 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4544)) mapDefault!16266)))))

(declare-fun b!394579 () Bool)

(declare-fun res!226198 () Bool)

(assert (=> b!394579 (=> (not res!226198) (not e!238876))))

(declare-datatypes ((array!23447 0))(
  ( (array!23448 (arr!11179 (Array (_ BitVec 32) (_ BitVec 64))) (size!11532 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23447)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23447 (_ BitVec 32)) Bool)

(assert (=> b!394579 (= res!226198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!394581 () Bool)

(declare-fun tp_is_empty!9775 () Bool)

(assert (=> b!394581 (= e!238875 tp_is_empty!9775)))

(declare-fun mapIsEmpty!16266 () Bool)

(assert (=> mapIsEmpty!16266 mapRes!16266))

(declare-fun b!394582 () Bool)

(declare-fun res!226195 () Bool)

(assert (=> b!394582 (=> (not res!226195) (not e!238876))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!394582 (= res!226195 (and (= (size!11531 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11532 _keys!709) (size!11531 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!394583 () Bool)

(declare-fun res!226196 () Bool)

(assert (=> b!394583 (=> (not res!226196) (not e!238876))))

(assert (=> b!394583 (= res!226196 (and (bvsle #b00000000000000000000000000000000 (size!11532 _keys!709)) (bvslt (size!11532 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun res!226199 () Bool)

(assert (=> start!38260 (=> (not res!226199) (not e!238876))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38260 (= res!226199 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11532 _keys!709))))))

(assert (=> start!38260 e!238876))

(assert (=> start!38260 true))

(declare-fun array_inv!8204 (array!23445) Bool)

(assert (=> start!38260 (and (array_inv!8204 _values!549) e!238873)))

(declare-fun array_inv!8205 (array!23447) Bool)

(assert (=> start!38260 (array_inv!8205 _keys!709)))

(declare-fun b!394580 () Bool)

(declare-fun e!238877 () Bool)

(assert (=> b!394580 (= e!238877 tp_is_empty!9775)))

(declare-fun mapNonEmpty!16266 () Bool)

(declare-fun tp!32061 () Bool)

(assert (=> mapNonEmpty!16266 (= mapRes!16266 (and tp!32061 e!238877))))

(declare-fun mapValue!16266 () ValueCell!4544)

(declare-fun mapKey!16266 () (_ BitVec 32))

(declare-fun mapRest!16266 () (Array (_ BitVec 32) ValueCell!4544))

(assert (=> mapNonEmpty!16266 (= (arr!11178 _values!549) (store mapRest!16266 mapKey!16266 mapValue!16266))))

(declare-fun b!394584 () Bool)

(declare-fun res!226197 () Bool)

(assert (=> b!394584 (=> (not res!226197) (not e!238876))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!394584 (= res!226197 (validMask!0 mask!1025))))

(assert (= (and start!38260 res!226199) b!394584))

(assert (= (and b!394584 res!226197) b!394582))

(assert (= (and b!394582 res!226195) b!394579))

(assert (= (and b!394579 res!226198) b!394583))

(assert (= (and b!394583 res!226196) b!394577))

(assert (= (and b!394578 condMapEmpty!16266) mapIsEmpty!16266))

(assert (= (and b!394578 (not condMapEmpty!16266)) mapNonEmpty!16266))

(get-info :version)

(assert (= (and mapNonEmpty!16266 ((_ is ValueCellFull!4544) mapValue!16266)) b!394580))

(assert (= (and b!394578 ((_ is ValueCellFull!4544) mapDefault!16266)) b!394581))

(assert (= start!38260 b!394578))

(declare-fun m!390437 () Bool)

(assert (=> start!38260 m!390437))

(declare-fun m!390439 () Bool)

(assert (=> start!38260 m!390439))

(declare-fun m!390441 () Bool)

(assert (=> b!394579 m!390441))

(declare-fun m!390443 () Bool)

(assert (=> b!394584 m!390443))

(declare-fun m!390445 () Bool)

(assert (=> mapNonEmpty!16266 m!390445))

(declare-fun m!390447 () Bool)

(assert (=> b!394577 m!390447))

(check-sat (not b!394577) (not start!38260) (not mapNonEmpty!16266) tp_is_empty!9775 (not b!394579) (not b!394584))
(check-sat)
(get-model)

(declare-fun d!73097 () Bool)

(declare-fun res!226234 () Bool)

(declare-fun e!238912 () Bool)

(assert (=> d!73097 (=> res!226234 e!238912)))

(assert (=> d!73097 (= res!226234 ((_ is Nil!6452) Nil!6452))))

(assert (=> d!73097 (= (noDuplicate!194 Nil!6452) e!238912)))

(declare-fun b!394637 () Bool)

(declare-fun e!238913 () Bool)

(assert (=> b!394637 (= e!238912 e!238913)))

(declare-fun res!226235 () Bool)

(assert (=> b!394637 (=> (not res!226235) (not e!238913))))

(declare-fun contains!2466 (List!6455 (_ BitVec 64)) Bool)

(assert (=> b!394637 (= res!226235 (not (contains!2466 (t!11620 Nil!6452) (h!7307 Nil!6452))))))

(declare-fun b!394638 () Bool)

(assert (=> b!394638 (= e!238913 (noDuplicate!194 (t!11620 Nil!6452)))))

(assert (= (and d!73097 (not res!226234)) b!394637))

(assert (= (and b!394637 res!226235) b!394638))

(declare-fun m!390473 () Bool)

(assert (=> b!394637 m!390473))

(declare-fun m!390475 () Bool)

(assert (=> b!394638 m!390475))

(assert (=> b!394577 d!73097))

(declare-fun d!73099 () Bool)

(assert (=> d!73099 (= (array_inv!8204 _values!549) (bvsge (size!11531 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!38260 d!73099))

(declare-fun d!73101 () Bool)

(assert (=> d!73101 (= (array_inv!8205 _keys!709) (bvsge (size!11532 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!38260 d!73101))

(declare-fun b!394647 () Bool)

(declare-fun e!238920 () Bool)

(declare-fun e!238921 () Bool)

(assert (=> b!394647 (= e!238920 e!238921)))

(declare-fun lt!186808 () (_ BitVec 64))

(assert (=> b!394647 (= lt!186808 (select (arr!11179 _keys!709) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!12036 0))(
  ( (Unit!12037) )
))
(declare-fun lt!186810 () Unit!12036)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23447 (_ BitVec 64) (_ BitVec 32)) Unit!12036)

(assert (=> b!394647 (= lt!186810 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!186808 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!23447 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394647 (arrayContainsKey!0 _keys!709 lt!186808 #b00000000000000000000000000000000)))

(declare-fun lt!186809 () Unit!12036)

(assert (=> b!394647 (= lt!186809 lt!186810)))

(declare-fun res!226241 () Bool)

(declare-datatypes ((SeekEntryResult!3516 0))(
  ( (MissingZero!3516 (index!16243 (_ BitVec 32))) (Found!3516 (index!16244 (_ BitVec 32))) (Intermediate!3516 (undefined!4328 Bool) (index!16245 (_ BitVec 32)) (x!38573 (_ BitVec 32))) (Undefined!3516) (MissingVacant!3516 (index!16246 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23447 (_ BitVec 32)) SeekEntryResult!3516)

(assert (=> b!394647 (= res!226241 (= (seekEntryOrOpen!0 (select (arr!11179 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3516 #b00000000000000000000000000000000)))))

(assert (=> b!394647 (=> (not res!226241) (not e!238921))))

(declare-fun bm!27838 () Bool)

(declare-fun call!27841 () Bool)

(assert (=> bm!27838 (= call!27841 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!394648 () Bool)

(assert (=> b!394648 (= e!238921 call!27841)))

(declare-fun b!394649 () Bool)

(declare-fun e!238922 () Bool)

(assert (=> b!394649 (= e!238922 e!238920)))

(declare-fun c!54471 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394649 (= c!54471 (validKeyInArray!0 (select (arr!11179 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!73103 () Bool)

(declare-fun res!226240 () Bool)

(assert (=> d!73103 (=> res!226240 e!238922)))

(assert (=> d!73103 (= res!226240 (bvsge #b00000000000000000000000000000000 (size!11532 _keys!709)))))

(assert (=> d!73103 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!238922)))

(declare-fun b!394650 () Bool)

(assert (=> b!394650 (= e!238920 call!27841)))

(assert (= (and d!73103 (not res!226240)) b!394649))

(assert (= (and b!394649 c!54471) b!394647))

(assert (= (and b!394649 (not c!54471)) b!394650))

(assert (= (and b!394647 res!226241) b!394648))

(assert (= (or b!394648 b!394650) bm!27838))

(declare-fun m!390477 () Bool)

(assert (=> b!394647 m!390477))

(declare-fun m!390479 () Bool)

(assert (=> b!394647 m!390479))

(declare-fun m!390481 () Bool)

(assert (=> b!394647 m!390481))

(assert (=> b!394647 m!390477))

(declare-fun m!390483 () Bool)

(assert (=> b!394647 m!390483))

(declare-fun m!390485 () Bool)

(assert (=> bm!27838 m!390485))

(assert (=> b!394649 m!390477))

(assert (=> b!394649 m!390477))

(declare-fun m!390487 () Bool)

(assert (=> b!394649 m!390487))

(assert (=> b!394579 d!73103))

(declare-fun d!73105 () Bool)

(assert (=> d!73105 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!394584 d!73105))

(declare-fun mapIsEmpty!16275 () Bool)

(declare-fun mapRes!16275 () Bool)

(assert (=> mapIsEmpty!16275 mapRes!16275))

(declare-fun b!394658 () Bool)

(declare-fun e!238927 () Bool)

(assert (=> b!394658 (= e!238927 tp_is_empty!9775)))

(declare-fun condMapEmpty!16275 () Bool)

(declare-fun mapDefault!16275 () ValueCell!4544)

(assert (=> mapNonEmpty!16266 (= condMapEmpty!16275 (= mapRest!16266 ((as const (Array (_ BitVec 32) ValueCell!4544)) mapDefault!16275)))))

(assert (=> mapNonEmpty!16266 (= tp!32061 (and e!238927 mapRes!16275))))

(declare-fun b!394657 () Bool)

(declare-fun e!238928 () Bool)

(assert (=> b!394657 (= e!238928 tp_is_empty!9775)))

(declare-fun mapNonEmpty!16275 () Bool)

(declare-fun tp!32070 () Bool)

(assert (=> mapNonEmpty!16275 (= mapRes!16275 (and tp!32070 e!238928))))

(declare-fun mapValue!16275 () ValueCell!4544)

(declare-fun mapKey!16275 () (_ BitVec 32))

(declare-fun mapRest!16275 () (Array (_ BitVec 32) ValueCell!4544))

(assert (=> mapNonEmpty!16275 (= mapRest!16266 (store mapRest!16275 mapKey!16275 mapValue!16275))))

(assert (= (and mapNonEmpty!16266 condMapEmpty!16275) mapIsEmpty!16275))

(assert (= (and mapNonEmpty!16266 (not condMapEmpty!16275)) mapNonEmpty!16275))

(assert (= (and mapNonEmpty!16275 ((_ is ValueCellFull!4544) mapValue!16275)) b!394657))

(assert (= (and mapNonEmpty!16266 ((_ is ValueCellFull!4544) mapDefault!16275)) b!394658))

(declare-fun m!390489 () Bool)

(assert (=> mapNonEmpty!16275 m!390489))

(check-sat tp_is_empty!9775 (not b!394638) (not b!394649) (not b!394637) (not bm!27838) (not b!394647) (not mapNonEmpty!16275))
(check-sat)
