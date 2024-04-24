; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!82636 () Bool)

(assert start!82636)

(declare-fun mapNonEmpty!34114 () Bool)

(declare-fun mapRes!34114 () Bool)

(declare-fun tp!65044 () Bool)

(declare-fun e!542532 () Bool)

(assert (=> mapNonEmpty!34114 (= mapRes!34114 (and tp!65044 e!542532))))

(declare-datatypes ((V!33537 0))(
  ( (V!33538 (val!10758 Int)) )
))
(declare-datatypes ((ValueCell!10226 0))(
  ( (ValueCellFull!10226 (v!13312 V!33537)) (EmptyCell!10226) )
))
(declare-fun mapValue!34114 () ValueCell!10226)

(declare-fun mapKey!34114 () (_ BitVec 32))

(declare-datatypes ((array!58954 0))(
  ( (array!58955 (arr!28342 (Array (_ BitVec 32) ValueCell!10226)) (size!28822 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!58954)

(declare-fun mapRest!34114 () (Array (_ BitVec 32) ValueCell!10226))

(assert (=> mapNonEmpty!34114 (= (arr!28342 _values!1400) (store mapRest!34114 mapKey!34114 mapValue!34114))))

(declare-fun b!962146 () Bool)

(declare-fun res!643707 () Bool)

(declare-fun e!542530 () Bool)

(assert (=> b!962146 (=> (not res!643707) (not e!542530))))

(declare-datatypes ((array!58956 0))(
  ( (array!58957 (arr!28343 (Array (_ BitVec 32) (_ BitVec 64))) (size!28823 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!58956)

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!58956 (_ BitVec 32)) Bool)

(assert (=> b!962146 (= res!643707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun res!643711 () Bool)

(assert (=> start!82636 (=> (not res!643711) (not e!542530))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82636 (= res!643711 (validMask!0 mask!2110))))

(assert (=> start!82636 e!542530))

(assert (=> start!82636 true))

(declare-fun e!542529 () Bool)

(declare-fun array_inv!22041 (array!58954) Bool)

(assert (=> start!82636 (and (array_inv!22041 _values!1400) e!542529)))

(declare-fun array_inv!22042 (array!58956) Bool)

(assert (=> start!82636 (array_inv!22042 _keys!1686)))

(declare-fun mapIsEmpty!34114 () Bool)

(assert (=> mapIsEmpty!34114 mapRes!34114))

(declare-fun b!962147 () Bool)

(declare-fun e!542527 () Bool)

(assert (=> b!962147 (= e!542529 (and e!542527 mapRes!34114))))

(declare-fun condMapEmpty!34114 () Bool)

(declare-fun mapDefault!34114 () ValueCell!10226)

(assert (=> b!962147 (= condMapEmpty!34114 (= (arr!28342 _values!1400) ((as const (Array (_ BitVec 32) ValueCell!10226)) mapDefault!34114)))))

(declare-fun b!962148 () Bool)

(declare-fun res!643709 () Bool)

(assert (=> b!962148 (=> (not res!643709) (not e!542530))))

(declare-datatypes ((List!19666 0))(
  ( (Nil!19663) (Cons!19662 (h!20830 (_ BitVec 64)) (t!28021 List!19666)) )
))
(declare-fun noDuplicate!1378 (List!19666) Bool)

(assert (=> b!962148 (= res!643709 (noDuplicate!1378 Nil!19663))))

(declare-fun b!962149 () Bool)

(declare-fun tp_is_empty!21415 () Bool)

(assert (=> b!962149 (= e!542532 tp_is_empty!21415)))

(declare-fun b!962150 () Bool)

(declare-fun res!643706 () Bool)

(assert (=> b!962150 (=> (not res!643706) (not e!542530))))

(assert (=> b!962150 (= res!643706 (and (bvsle #b00000000000000000000000000000000 (size!28823 _keys!1686)) (bvslt (size!28823 _keys!1686) #b01111111111111111111111111111111)))))

(declare-fun b!962151 () Bool)

(declare-fun e!542528 () Bool)

(assert (=> b!962151 (= e!542530 e!542528)))

(declare-fun res!643708 () Bool)

(assert (=> b!962151 (=> res!643708 e!542528)))

(declare-fun contains!5394 (List!19666 (_ BitVec 64)) Bool)

(assert (=> b!962151 (= res!643708 (contains!5394 Nil!19663 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!962152 () Bool)

(assert (=> b!962152 (= e!542528 (contains!5394 Nil!19663 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!962153 () Bool)

(assert (=> b!962153 (= e!542527 tp_is_empty!21415)))

(declare-fun b!962154 () Bool)

(declare-fun res!643710 () Bool)

(assert (=> b!962154 (=> (not res!643710) (not e!542530))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!962154 (= res!643710 (and (= (size!28822 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28823 _keys!1686) (size!28822 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(assert (= (and start!82636 res!643711) b!962154))

(assert (= (and b!962154 res!643710) b!962146))

(assert (= (and b!962146 res!643707) b!962150))

(assert (= (and b!962150 res!643706) b!962148))

(assert (= (and b!962148 res!643709) b!962151))

(assert (= (and b!962151 (not res!643708)) b!962152))

(assert (= (and b!962147 condMapEmpty!34114) mapIsEmpty!34114))

(assert (= (and b!962147 (not condMapEmpty!34114)) mapNonEmpty!34114))

(get-info :version)

(assert (= (and mapNonEmpty!34114 ((_ is ValueCellFull!10226) mapValue!34114)) b!962149))

(assert (= (and b!962147 ((_ is ValueCellFull!10226) mapDefault!34114)) b!962153))

(assert (= start!82636 b!962147))

(declare-fun m!892551 () Bool)

(assert (=> b!962148 m!892551))

(declare-fun m!892553 () Bool)

(assert (=> start!82636 m!892553))

(declare-fun m!892555 () Bool)

(assert (=> start!82636 m!892555))

(declare-fun m!892557 () Bool)

(assert (=> start!82636 m!892557))

(declare-fun m!892559 () Bool)

(assert (=> mapNonEmpty!34114 m!892559))

(declare-fun m!892561 () Bool)

(assert (=> b!962151 m!892561))

(declare-fun m!892563 () Bool)

(assert (=> b!962146 m!892563))

(declare-fun m!892565 () Bool)

(assert (=> b!962152 m!892565))

(check-sat (not b!962152) (not start!82636) (not b!962146) (not b!962148) (not mapNonEmpty!34114) tp_is_empty!21415 (not b!962151))
(check-sat)
(get-model)

(declare-fun b!962217 () Bool)

(declare-fun e!542576 () Bool)

(declare-fun e!542577 () Bool)

(assert (=> b!962217 (= e!542576 e!542577)))

(declare-fun lt!431093 () (_ BitVec 64))

(assert (=> b!962217 (= lt!431093 (select (arr!28343 _keys!1686) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!32172 0))(
  ( (Unit!32173) )
))
(declare-fun lt!431095 () Unit!32172)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!58956 (_ BitVec 64) (_ BitVec 32)) Unit!32172)

(assert (=> b!962217 (= lt!431095 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1686 lt!431093 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!58956 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!962217 (arrayContainsKey!0 _keys!1686 lt!431093 #b00000000000000000000000000000000)))

(declare-fun lt!431094 () Unit!32172)

(assert (=> b!962217 (= lt!431094 lt!431095)))

(declare-fun res!643753 () Bool)

(declare-datatypes ((SeekEntryResult!9151 0))(
  ( (MissingZero!9151 (index!38975 (_ BitVec 32))) (Found!9151 (index!38976 (_ BitVec 32))) (Intermediate!9151 (undefined!9963 Bool) (index!38977 (_ BitVec 32)) (x!82909 (_ BitVec 32))) (Undefined!9151) (MissingVacant!9151 (index!38978 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!58956 (_ BitVec 32)) SeekEntryResult!9151)

(assert (=> b!962217 (= res!643753 (= (seekEntryOrOpen!0 (select (arr!28343 _keys!1686) #b00000000000000000000000000000000) _keys!1686 mask!2110) (Found!9151 #b00000000000000000000000000000000)))))

(assert (=> b!962217 (=> (not res!643753) (not e!542577))))

(declare-fun bm!41771 () Bool)

(declare-fun call!41774 () Bool)

(assert (=> bm!41771 (= call!41774 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1686 mask!2110))))

(declare-fun d!116375 () Bool)

(declare-fun res!643752 () Bool)

(declare-fun e!542575 () Bool)

(assert (=> d!116375 (=> res!643752 e!542575)))

(assert (=> d!116375 (= res!643752 (bvsge #b00000000000000000000000000000000 (size!28823 _keys!1686)))))

(assert (=> d!116375 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110) e!542575)))

(declare-fun b!962218 () Bool)

(assert (=> b!962218 (= e!542576 call!41774)))

(declare-fun b!962219 () Bool)

(assert (=> b!962219 (= e!542575 e!542576)))

(declare-fun c!100199 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!962219 (= c!100199 (validKeyInArray!0 (select (arr!28343 _keys!1686) #b00000000000000000000000000000000)))))

(declare-fun b!962220 () Bool)

(assert (=> b!962220 (= e!542577 call!41774)))

(assert (= (and d!116375 (not res!643752)) b!962219))

(assert (= (and b!962219 c!100199) b!962217))

(assert (= (and b!962219 (not c!100199)) b!962218))

(assert (= (and b!962217 res!643753) b!962220))

(assert (= (or b!962220 b!962218) bm!41771))

(declare-fun m!892599 () Bool)

(assert (=> b!962217 m!892599))

(declare-fun m!892601 () Bool)

(assert (=> b!962217 m!892601))

(declare-fun m!892603 () Bool)

(assert (=> b!962217 m!892603))

(assert (=> b!962217 m!892599))

(declare-fun m!892605 () Bool)

(assert (=> b!962217 m!892605))

(declare-fun m!892607 () Bool)

(assert (=> bm!41771 m!892607))

(assert (=> b!962219 m!892599))

(assert (=> b!962219 m!892599))

(declare-fun m!892609 () Bool)

(assert (=> b!962219 m!892609))

(assert (=> b!962146 d!116375))

(declare-fun d!116377 () Bool)

(assert (=> d!116377 (= (validMask!0 mask!2110) (and (or (= mask!2110 #b00000000000000000000000000000111) (= mask!2110 #b00000000000000000000000000001111) (= mask!2110 #b00000000000000000000000000011111) (= mask!2110 #b00000000000000000000000000111111) (= mask!2110 #b00000000000000000000000001111111) (= mask!2110 #b00000000000000000000000011111111) (= mask!2110 #b00000000000000000000000111111111) (= mask!2110 #b00000000000000000000001111111111) (= mask!2110 #b00000000000000000000011111111111) (= mask!2110 #b00000000000000000000111111111111) (= mask!2110 #b00000000000000000001111111111111) (= mask!2110 #b00000000000000000011111111111111) (= mask!2110 #b00000000000000000111111111111111) (= mask!2110 #b00000000000000001111111111111111) (= mask!2110 #b00000000000000011111111111111111) (= mask!2110 #b00000000000000111111111111111111) (= mask!2110 #b00000000000001111111111111111111) (= mask!2110 #b00000000000011111111111111111111) (= mask!2110 #b00000000000111111111111111111111) (= mask!2110 #b00000000001111111111111111111111) (= mask!2110 #b00000000011111111111111111111111) (= mask!2110 #b00000000111111111111111111111111) (= mask!2110 #b00000001111111111111111111111111) (= mask!2110 #b00000011111111111111111111111111) (= mask!2110 #b00000111111111111111111111111111) (= mask!2110 #b00001111111111111111111111111111) (= mask!2110 #b00011111111111111111111111111111) (= mask!2110 #b00111111111111111111111111111111)) (bvsle mask!2110 #b00111111111111111111111111111111)))))

(assert (=> start!82636 d!116377))

(declare-fun d!116379 () Bool)

(assert (=> d!116379 (= (array_inv!22041 _values!1400) (bvsge (size!28822 _values!1400) #b00000000000000000000000000000000))))

(assert (=> start!82636 d!116379))

(declare-fun d!116381 () Bool)

(assert (=> d!116381 (= (array_inv!22042 _keys!1686) (bvsge (size!28823 _keys!1686) #b00000000000000000000000000000000))))

(assert (=> start!82636 d!116381))

(declare-fun d!116383 () Bool)

(declare-fun res!643758 () Bool)

(declare-fun e!542582 () Bool)

(assert (=> d!116383 (=> res!643758 e!542582)))

(assert (=> d!116383 (= res!643758 ((_ is Nil!19663) Nil!19663))))

(assert (=> d!116383 (= (noDuplicate!1378 Nil!19663) e!542582)))

(declare-fun b!962225 () Bool)

(declare-fun e!542583 () Bool)

(assert (=> b!962225 (= e!542582 e!542583)))

(declare-fun res!643759 () Bool)

(assert (=> b!962225 (=> (not res!643759) (not e!542583))))

(assert (=> b!962225 (= res!643759 (not (contains!5394 (t!28021 Nil!19663) (h!20830 Nil!19663))))))

(declare-fun b!962226 () Bool)

(assert (=> b!962226 (= e!542583 (noDuplicate!1378 (t!28021 Nil!19663)))))

(assert (= (and d!116383 (not res!643758)) b!962225))

(assert (= (and b!962225 res!643759) b!962226))

(declare-fun m!892611 () Bool)

(assert (=> b!962225 m!892611))

(declare-fun m!892613 () Bool)

(assert (=> b!962226 m!892613))

(assert (=> b!962148 d!116383))

(declare-fun d!116385 () Bool)

(declare-fun lt!431098 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!414 (List!19666) (InoxSet (_ BitVec 64)))

(assert (=> d!116385 (= lt!431098 (select (content!414 Nil!19663) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!542589 () Bool)

(assert (=> d!116385 (= lt!431098 e!542589)))

(declare-fun res!643765 () Bool)

(assert (=> d!116385 (=> (not res!643765) (not e!542589))))

(assert (=> d!116385 (= res!643765 ((_ is Cons!19662) Nil!19663))))

(assert (=> d!116385 (= (contains!5394 Nil!19663 #b0000000000000000000000000000000000000000000000000000000000000000) lt!431098)))

(declare-fun b!962231 () Bool)

(declare-fun e!542588 () Bool)

(assert (=> b!962231 (= e!542589 e!542588)))

(declare-fun res!643764 () Bool)

(assert (=> b!962231 (=> res!643764 e!542588)))

(assert (=> b!962231 (= res!643764 (= (h!20830 Nil!19663) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!962232 () Bool)

(assert (=> b!962232 (= e!542588 (contains!5394 (t!28021 Nil!19663) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116385 res!643765) b!962231))

(assert (= (and b!962231 (not res!643764)) b!962232))

(declare-fun m!892615 () Bool)

(assert (=> d!116385 m!892615))

(declare-fun m!892617 () Bool)

(assert (=> d!116385 m!892617))

(declare-fun m!892619 () Bool)

(assert (=> b!962232 m!892619))

(assert (=> b!962151 d!116385))

(declare-fun d!116387 () Bool)

(declare-fun lt!431099 () Bool)

(assert (=> d!116387 (= lt!431099 (select (content!414 Nil!19663) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!542591 () Bool)

(assert (=> d!116387 (= lt!431099 e!542591)))

(declare-fun res!643767 () Bool)

(assert (=> d!116387 (=> (not res!643767) (not e!542591))))

(assert (=> d!116387 (= res!643767 ((_ is Cons!19662) Nil!19663))))

(assert (=> d!116387 (= (contains!5394 Nil!19663 #b1000000000000000000000000000000000000000000000000000000000000000) lt!431099)))

(declare-fun b!962233 () Bool)

(declare-fun e!542590 () Bool)

(assert (=> b!962233 (= e!542591 e!542590)))

(declare-fun res!643766 () Bool)

(assert (=> b!962233 (=> res!643766 e!542590)))

(assert (=> b!962233 (= res!643766 (= (h!20830 Nil!19663) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!962234 () Bool)

(assert (=> b!962234 (= e!542590 (contains!5394 (t!28021 Nil!19663) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!116387 res!643767) b!962233))

(assert (= (and b!962233 (not res!643766)) b!962234))

(assert (=> d!116387 m!892615))

(declare-fun m!892621 () Bool)

(assert (=> d!116387 m!892621))

(declare-fun m!892623 () Bool)

(assert (=> b!962234 m!892623))

(assert (=> b!962152 d!116387))

(declare-fun mapNonEmpty!34123 () Bool)

(declare-fun mapRes!34123 () Bool)

(declare-fun tp!65053 () Bool)

(declare-fun e!542596 () Bool)

(assert (=> mapNonEmpty!34123 (= mapRes!34123 (and tp!65053 e!542596))))

(declare-fun mapValue!34123 () ValueCell!10226)

(declare-fun mapKey!34123 () (_ BitVec 32))

(declare-fun mapRest!34123 () (Array (_ BitVec 32) ValueCell!10226))

(assert (=> mapNonEmpty!34123 (= mapRest!34114 (store mapRest!34123 mapKey!34123 mapValue!34123))))

(declare-fun mapIsEmpty!34123 () Bool)

(assert (=> mapIsEmpty!34123 mapRes!34123))

(declare-fun b!962241 () Bool)

(assert (=> b!962241 (= e!542596 tp_is_empty!21415)))

(declare-fun condMapEmpty!34123 () Bool)

(declare-fun mapDefault!34123 () ValueCell!10226)

(assert (=> mapNonEmpty!34114 (= condMapEmpty!34123 (= mapRest!34114 ((as const (Array (_ BitVec 32) ValueCell!10226)) mapDefault!34123)))))

(declare-fun e!542597 () Bool)

(assert (=> mapNonEmpty!34114 (= tp!65044 (and e!542597 mapRes!34123))))

(declare-fun b!962242 () Bool)

(assert (=> b!962242 (= e!542597 tp_is_empty!21415)))

(assert (= (and mapNonEmpty!34114 condMapEmpty!34123) mapIsEmpty!34123))

(assert (= (and mapNonEmpty!34114 (not condMapEmpty!34123)) mapNonEmpty!34123))

(assert (= (and mapNonEmpty!34123 ((_ is ValueCellFull!10226) mapValue!34123)) b!962241))

(assert (= (and mapNonEmpty!34114 ((_ is ValueCellFull!10226) mapDefault!34123)) b!962242))

(declare-fun m!892625 () Bool)

(assert (=> mapNonEmpty!34123 m!892625))

(check-sat tp_is_empty!21415 (not b!962234) (not b!962219) (not b!962232) (not b!962217) (not b!962226) (not d!116387) (not bm!41771) (not b!962225) (not d!116385) (not mapNonEmpty!34123))
(check-sat)
