; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20012 () Bool)

(assert start!20012)

(declare-fun b!196061 () Bool)

(declare-fun e!129070 () Bool)

(declare-fun tp_is_empty!4539 () Bool)

(assert (=> b!196061 (= e!129070 tp_is_empty!4539)))

(declare-fun mapNonEmpty!7874 () Bool)

(declare-fun mapRes!7874 () Bool)

(declare-fun tp!17162 () Bool)

(assert (=> mapNonEmpty!7874 (= mapRes!7874 (and tp!17162 e!129070))))

(declare-fun mapKey!7874 () (_ BitVec 32))

(declare-datatypes ((V!5699 0))(
  ( (V!5700 (val!2314 Int)) )
))
(declare-datatypes ((ValueCell!1926 0))(
  ( (ValueCellFull!1926 (v!4283 V!5699)) (EmptyCell!1926) )
))
(declare-datatypes ((array!8339 0))(
  ( (array!8340 (arr!3921 (Array (_ BitVec 32) ValueCell!1926)) (size!4246 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8339)

(declare-fun mapValue!7874 () ValueCell!1926)

(declare-fun mapRest!7874 () (Array (_ BitVec 32) ValueCell!1926))

(assert (=> mapNonEmpty!7874 (= (arr!3921 _values!649) (store mapRest!7874 mapKey!7874 mapValue!7874))))

(declare-fun mapIsEmpty!7874 () Bool)

(assert (=> mapIsEmpty!7874 mapRes!7874))

(declare-fun b!196062 () Bool)

(declare-fun e!129067 () Bool)

(assert (=> b!196062 (= e!129067 tp_is_empty!4539)))

(declare-fun b!196063 () Bool)

(declare-fun e!129071 () Bool)

(assert (=> b!196063 (= e!129071 (and e!129067 mapRes!7874))))

(declare-fun condMapEmpty!7874 () Bool)

(declare-fun mapDefault!7874 () ValueCell!1926)

(assert (=> b!196063 (= condMapEmpty!7874 (= (arr!3921 _values!649) ((as const (Array (_ BitVec 32) ValueCell!1926)) mapDefault!7874)))))

(declare-fun b!196064 () Bool)

(declare-fun res!92519 () Bool)

(declare-fun e!129072 () Bool)

(assert (=> b!196064 (=> (not res!92519) (not e!129072))))

(declare-datatypes ((array!8341 0))(
  ( (array!8342 (arr!3922 (Array (_ BitVec 32) (_ BitVec 64))) (size!4247 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8341)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!196064 (= res!92519 (and (= (size!4246 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4247 _keys!825) (size!4246 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!92520 () Bool)

(assert (=> start!20012 (=> (not res!92520) (not e!129072))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20012 (= res!92520 (validMask!0 mask!1149))))

(assert (=> start!20012 e!129072))

(assert (=> start!20012 true))

(declare-fun array_inv!2547 (array!8339) Bool)

(assert (=> start!20012 (and (array_inv!2547 _values!649) e!129071)))

(declare-fun array_inv!2548 (array!8341) Bool)

(assert (=> start!20012 (array_inv!2548 _keys!825)))

(declare-fun b!196065 () Bool)

(declare-fun e!129069 () Bool)

(assert (=> b!196065 (= e!129072 e!129069)))

(declare-fun res!92517 () Bool)

(assert (=> b!196065 (=> res!92517 e!129069)))

(declare-datatypes ((List!2459 0))(
  ( (Nil!2456) (Cons!2455 (h!3097 (_ BitVec 64)) (t!7390 List!2459)) )
))
(declare-fun contains!1387 (List!2459 (_ BitVec 64)) Bool)

(assert (=> b!196065 (= res!92517 (contains!1387 Nil!2456 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!196066 () Bool)

(declare-fun res!92521 () Bool)

(assert (=> b!196066 (=> (not res!92521) (not e!129072))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8341 (_ BitVec 32)) Bool)

(assert (=> b!196066 (= res!92521 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!196067 () Bool)

(declare-fun res!92518 () Bool)

(assert (=> b!196067 (=> (not res!92518) (not e!129072))))

(declare-fun noDuplicate!61 (List!2459) Bool)

(assert (=> b!196067 (= res!92518 (noDuplicate!61 Nil!2456))))

(declare-fun b!196068 () Bool)

(assert (=> b!196068 (= e!129069 (contains!1387 Nil!2456 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!196069 () Bool)

(declare-fun res!92522 () Bool)

(assert (=> b!196069 (=> (not res!92522) (not e!129072))))

(assert (=> b!196069 (= res!92522 (and (bvsle #b00000000000000000000000000000000 (size!4247 _keys!825)) (bvslt (size!4247 _keys!825) #b01111111111111111111111111111111)))))

(assert (= (and start!20012 res!92520) b!196064))

(assert (= (and b!196064 res!92519) b!196066))

(assert (= (and b!196066 res!92521) b!196069))

(assert (= (and b!196069 res!92522) b!196067))

(assert (= (and b!196067 res!92518) b!196065))

(assert (= (and b!196065 (not res!92517)) b!196068))

(assert (= (and b!196063 condMapEmpty!7874) mapIsEmpty!7874))

(assert (= (and b!196063 (not condMapEmpty!7874)) mapNonEmpty!7874))

(get-info :version)

(assert (= (and mapNonEmpty!7874 ((_ is ValueCellFull!1926) mapValue!7874)) b!196061))

(assert (= (and b!196063 ((_ is ValueCellFull!1926) mapDefault!7874)) b!196062))

(assert (= start!20012 b!196063))

(declare-fun m!223459 () Bool)

(assert (=> start!20012 m!223459))

(declare-fun m!223461 () Bool)

(assert (=> start!20012 m!223461))

(declare-fun m!223463 () Bool)

(assert (=> start!20012 m!223463))

(declare-fun m!223465 () Bool)

(assert (=> b!196067 m!223465))

(declare-fun m!223467 () Bool)

(assert (=> mapNonEmpty!7874 m!223467))

(declare-fun m!223469 () Bool)

(assert (=> b!196068 m!223469))

(declare-fun m!223471 () Bool)

(assert (=> b!196065 m!223471))

(declare-fun m!223473 () Bool)

(assert (=> b!196066 m!223473))

(check-sat (not mapNonEmpty!7874) (not start!20012) (not b!196068) (not b!196066) (not b!196065) (not b!196067) tp_is_empty!4539)
(check-sat)
(get-model)

(declare-fun d!57565 () Bool)

(declare-fun lt!97556 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!157 (List!2459) (InoxSet (_ BitVec 64)))

(assert (=> d!57565 (= lt!97556 (select (content!157 Nil!2456) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!129096 () Bool)

(assert (=> d!57565 (= lt!97556 e!129096)))

(declare-fun res!92546 () Bool)

(assert (=> d!57565 (=> (not res!92546) (not e!129096))))

(assert (=> d!57565 (= res!92546 ((_ is Cons!2455) Nil!2456))))

(assert (=> d!57565 (= (contains!1387 Nil!2456 #b0000000000000000000000000000000000000000000000000000000000000000) lt!97556)))

(declare-fun b!196101 () Bool)

(declare-fun e!129095 () Bool)

(assert (=> b!196101 (= e!129096 e!129095)))

(declare-fun res!92545 () Bool)

(assert (=> b!196101 (=> res!92545 e!129095)))

(assert (=> b!196101 (= res!92545 (= (h!3097 Nil!2456) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!196102 () Bool)

(assert (=> b!196102 (= e!129095 (contains!1387 (t!7390 Nil!2456) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57565 res!92546) b!196101))

(assert (= (and b!196101 (not res!92545)) b!196102))

(declare-fun m!223491 () Bool)

(assert (=> d!57565 m!223491))

(declare-fun m!223493 () Bool)

(assert (=> d!57565 m!223493))

(declare-fun m!223495 () Bool)

(assert (=> b!196102 m!223495))

(assert (=> b!196065 d!57565))

(declare-fun d!57567 () Bool)

(declare-fun lt!97557 () Bool)

(assert (=> d!57567 (= lt!97557 (select (content!157 Nil!2456) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!129098 () Bool)

(assert (=> d!57567 (= lt!97557 e!129098)))

(declare-fun res!92548 () Bool)

(assert (=> d!57567 (=> (not res!92548) (not e!129098))))

(assert (=> d!57567 (= res!92548 ((_ is Cons!2455) Nil!2456))))

(assert (=> d!57567 (= (contains!1387 Nil!2456 #b1000000000000000000000000000000000000000000000000000000000000000) lt!97557)))

(declare-fun b!196103 () Bool)

(declare-fun e!129097 () Bool)

(assert (=> b!196103 (= e!129098 e!129097)))

(declare-fun res!92547 () Bool)

(assert (=> b!196103 (=> res!92547 e!129097)))

(assert (=> b!196103 (= res!92547 (= (h!3097 Nil!2456) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!196104 () Bool)

(assert (=> b!196104 (= e!129097 (contains!1387 (t!7390 Nil!2456) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!57567 res!92548) b!196103))

(assert (= (and b!196103 (not res!92547)) b!196104))

(assert (=> d!57567 m!223491))

(declare-fun m!223497 () Bool)

(assert (=> d!57567 m!223497))

(declare-fun m!223499 () Bool)

(assert (=> b!196104 m!223499))

(assert (=> b!196068 d!57567))

(declare-fun d!57569 () Bool)

(assert (=> d!57569 (= (validMask!0 mask!1149) (and (or (= mask!1149 #b00000000000000000000000000000111) (= mask!1149 #b00000000000000000000000000001111) (= mask!1149 #b00000000000000000000000000011111) (= mask!1149 #b00000000000000000000000000111111) (= mask!1149 #b00000000000000000000000001111111) (= mask!1149 #b00000000000000000000000011111111) (= mask!1149 #b00000000000000000000000111111111) (= mask!1149 #b00000000000000000000001111111111) (= mask!1149 #b00000000000000000000011111111111) (= mask!1149 #b00000000000000000000111111111111) (= mask!1149 #b00000000000000000001111111111111) (= mask!1149 #b00000000000000000011111111111111) (= mask!1149 #b00000000000000000111111111111111) (= mask!1149 #b00000000000000001111111111111111) (= mask!1149 #b00000000000000011111111111111111) (= mask!1149 #b00000000000000111111111111111111) (= mask!1149 #b00000000000001111111111111111111) (= mask!1149 #b00000000000011111111111111111111) (= mask!1149 #b00000000000111111111111111111111) (= mask!1149 #b00000000001111111111111111111111) (= mask!1149 #b00000000011111111111111111111111) (= mask!1149 #b00000000111111111111111111111111) (= mask!1149 #b00000001111111111111111111111111) (= mask!1149 #b00000011111111111111111111111111) (= mask!1149 #b00000111111111111111111111111111) (= mask!1149 #b00001111111111111111111111111111) (= mask!1149 #b00011111111111111111111111111111) (= mask!1149 #b00111111111111111111111111111111)) (bvsle mask!1149 #b00111111111111111111111111111111)))))

(assert (=> start!20012 d!57569))

(declare-fun d!57571 () Bool)

(assert (=> d!57571 (= (array_inv!2547 _values!649) (bvsge (size!4246 _values!649) #b00000000000000000000000000000000))))

(assert (=> start!20012 d!57571))

(declare-fun d!57573 () Bool)

(assert (=> d!57573 (= (array_inv!2548 _keys!825) (bvsge (size!4247 _keys!825) #b00000000000000000000000000000000))))

(assert (=> start!20012 d!57573))

(declare-fun d!57575 () Bool)

(declare-fun res!92553 () Bool)

(declare-fun e!129103 () Bool)

(assert (=> d!57575 (=> res!92553 e!129103)))

(assert (=> d!57575 (= res!92553 ((_ is Nil!2456) Nil!2456))))

(assert (=> d!57575 (= (noDuplicate!61 Nil!2456) e!129103)))

(declare-fun b!196109 () Bool)

(declare-fun e!129104 () Bool)

(assert (=> b!196109 (= e!129103 e!129104)))

(declare-fun res!92554 () Bool)

(assert (=> b!196109 (=> (not res!92554) (not e!129104))))

(assert (=> b!196109 (= res!92554 (not (contains!1387 (t!7390 Nil!2456) (h!3097 Nil!2456))))))

(declare-fun b!196110 () Bool)

(assert (=> b!196110 (= e!129104 (noDuplicate!61 (t!7390 Nil!2456)))))

(assert (= (and d!57575 (not res!92553)) b!196109))

(assert (= (and b!196109 res!92554) b!196110))

(declare-fun m!223501 () Bool)

(assert (=> b!196109 m!223501))

(declare-fun m!223503 () Bool)

(assert (=> b!196110 m!223503))

(assert (=> b!196067 d!57575))

(declare-fun b!196119 () Bool)

(declare-fun e!129113 () Bool)

(declare-fun call!19776 () Bool)

(assert (=> b!196119 (= e!129113 call!19776)))

(declare-fun d!57577 () Bool)

(declare-fun res!92559 () Bool)

(declare-fun e!129111 () Bool)

(assert (=> d!57577 (=> res!92559 e!129111)))

(assert (=> d!57577 (= res!92559 (bvsge #b00000000000000000000000000000000 (size!4247 _keys!825)))))

(assert (=> d!57577 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149) e!129111)))

(declare-fun b!196120 () Bool)

(declare-fun e!129112 () Bool)

(assert (=> b!196120 (= e!129111 e!129112)))

(declare-fun c!35435 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!196120 (= c!35435 (validKeyInArray!0 (select (arr!3922 _keys!825) #b00000000000000000000000000000000)))))

(declare-fun bm!19773 () Bool)

(assert (=> bm!19773 (= call!19776 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!825 mask!1149))))

(declare-fun b!196121 () Bool)

(assert (=> b!196121 (= e!129112 e!129113)))

(declare-fun lt!97566 () (_ BitVec 64))

(assert (=> b!196121 (= lt!97566 (select (arr!3922 _keys!825) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!5948 0))(
  ( (Unit!5949) )
))
(declare-fun lt!97565 () Unit!5948)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!8341 (_ BitVec 64) (_ BitVec 32)) Unit!5948)

(assert (=> b!196121 (= lt!97565 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!825 lt!97566 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!8341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!196121 (arrayContainsKey!0 _keys!825 lt!97566 #b00000000000000000000000000000000)))

(declare-fun lt!97564 () Unit!5948)

(assert (=> b!196121 (= lt!97564 lt!97565)))

(declare-fun res!92560 () Bool)

(declare-datatypes ((SeekEntryResult!703 0))(
  ( (MissingZero!703 (index!4982 (_ BitVec 32))) (Found!703 (index!4983 (_ BitVec 32))) (Intermediate!703 (undefined!1515 Bool) (index!4984 (_ BitVec 32)) (x!20834 (_ BitVec 32))) (Undefined!703) (MissingVacant!703 (index!4985 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8341 (_ BitVec 32)) SeekEntryResult!703)

(assert (=> b!196121 (= res!92560 (= (seekEntryOrOpen!0 (select (arr!3922 _keys!825) #b00000000000000000000000000000000) _keys!825 mask!1149) (Found!703 #b00000000000000000000000000000000)))))

(assert (=> b!196121 (=> (not res!92560) (not e!129113))))

(declare-fun b!196122 () Bool)

(assert (=> b!196122 (= e!129112 call!19776)))

(assert (= (and d!57577 (not res!92559)) b!196120))

(assert (= (and b!196120 c!35435) b!196121))

(assert (= (and b!196120 (not c!35435)) b!196122))

(assert (= (and b!196121 res!92560) b!196119))

(assert (= (or b!196119 b!196122) bm!19773))

(declare-fun m!223505 () Bool)

(assert (=> b!196120 m!223505))

(assert (=> b!196120 m!223505))

(declare-fun m!223507 () Bool)

(assert (=> b!196120 m!223507))

(declare-fun m!223509 () Bool)

(assert (=> bm!19773 m!223509))

(assert (=> b!196121 m!223505))

(declare-fun m!223511 () Bool)

(assert (=> b!196121 m!223511))

(declare-fun m!223513 () Bool)

(assert (=> b!196121 m!223513))

(assert (=> b!196121 m!223505))

(declare-fun m!223515 () Bool)

(assert (=> b!196121 m!223515))

(assert (=> b!196066 d!57577))

(declare-fun b!196129 () Bool)

(declare-fun e!129119 () Bool)

(assert (=> b!196129 (= e!129119 tp_is_empty!4539)))

(declare-fun condMapEmpty!7880 () Bool)

(declare-fun mapDefault!7880 () ValueCell!1926)

(assert (=> mapNonEmpty!7874 (= condMapEmpty!7880 (= mapRest!7874 ((as const (Array (_ BitVec 32) ValueCell!1926)) mapDefault!7880)))))

(declare-fun e!129118 () Bool)

(declare-fun mapRes!7880 () Bool)

(assert (=> mapNonEmpty!7874 (= tp!17162 (and e!129118 mapRes!7880))))

(declare-fun b!196130 () Bool)

(assert (=> b!196130 (= e!129118 tp_is_empty!4539)))

(declare-fun mapNonEmpty!7880 () Bool)

(declare-fun tp!17168 () Bool)

(assert (=> mapNonEmpty!7880 (= mapRes!7880 (and tp!17168 e!129119))))

(declare-fun mapKey!7880 () (_ BitVec 32))

(declare-fun mapRest!7880 () (Array (_ BitVec 32) ValueCell!1926))

(declare-fun mapValue!7880 () ValueCell!1926)

(assert (=> mapNonEmpty!7880 (= mapRest!7874 (store mapRest!7880 mapKey!7880 mapValue!7880))))

(declare-fun mapIsEmpty!7880 () Bool)

(assert (=> mapIsEmpty!7880 mapRes!7880))

(assert (= (and mapNonEmpty!7874 condMapEmpty!7880) mapIsEmpty!7880))

(assert (= (and mapNonEmpty!7874 (not condMapEmpty!7880)) mapNonEmpty!7880))

(assert (= (and mapNonEmpty!7880 ((_ is ValueCellFull!1926) mapValue!7880)) b!196129))

(assert (= (and mapNonEmpty!7874 ((_ is ValueCellFull!1926) mapDefault!7880)) b!196130))

(declare-fun m!223517 () Bool)

(assert (=> mapNonEmpty!7880 m!223517))

(check-sat (not b!196102) (not b!196120) (not b!196104) (not mapNonEmpty!7880) (not b!196109) (not b!196110) (not d!57565) tp_is_empty!4539 (not b!196121) (not bm!19773) (not d!57567))
(check-sat)
