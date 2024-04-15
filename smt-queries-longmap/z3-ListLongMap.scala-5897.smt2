; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76170 () Bool)

(assert start!76170)

(declare-fun b!894543 () Bool)

(declare-fun b_free!15883 () Bool)

(declare-fun b_next!15883 () Bool)

(assert (=> b!894543 (= b_free!15883 (not b_next!15883))))

(declare-fun tp!55645 () Bool)

(declare-fun b_and!26149 () Bool)

(assert (=> b!894543 (= tp!55645 b_and!26149)))

(declare-fun res!605353 () Bool)

(declare-fun e!499686 () Bool)

(assert (=> start!76170 (=> (not res!605353) (not e!499686))))

(declare-datatypes ((array!52399 0))(
  ( (array!52400 (arr!25199 (Array (_ BitVec 32) (_ BitVec 64))) (size!25648 (_ BitVec 32))) )
))
(declare-datatypes ((V!29247 0))(
  ( (V!29248 (val!9156 Int)) )
))
(declare-datatypes ((ValueCell!8624 0))(
  ( (ValueCellFull!8624 (v!11643 V!29247)) (EmptyCell!8624) )
))
(declare-datatypes ((array!52401 0))(
  ( (array!52402 (arr!25200 (Array (_ BitVec 32) ValueCell!8624)) (size!25649 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4264 0))(
  ( (LongMapFixedSize!4265 (defaultEntry!5344 Int) (mask!25908 (_ BitVec 32)) (extraKeys!5040 (_ BitVec 32)) (zeroValue!5144 V!29247) (minValue!5144 V!29247) (_size!2187 (_ BitVec 32)) (_keys!10041 array!52399) (_values!5331 array!52401) (_vacant!2187 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4264)

(declare-fun valid!1657 (LongMapFixedSize!4264) Bool)

(assert (=> start!76170 (= res!605353 (valid!1657 thiss!1181))))

(assert (=> start!76170 e!499686))

(declare-fun e!499685 () Bool)

(assert (=> start!76170 e!499685))

(assert (=> start!76170 true))

(declare-fun mapIsEmpty!28897 () Bool)

(declare-fun mapRes!28897 () Bool)

(assert (=> mapIsEmpty!28897 mapRes!28897))

(declare-fun b!894540 () Bool)

(declare-fun e!499690 () Bool)

(assert (=> b!894540 (= e!499686 e!499690)))

(declare-fun res!605355 () Bool)

(assert (=> b!894540 (=> (not res!605355) (not e!499690))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!894540 (= res!605355 (validMask!0 (mask!25908 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8877 0))(
  ( (MissingZero!8877 (index!37879 (_ BitVec 32))) (Found!8877 (index!37880 (_ BitVec 32))) (Intermediate!8877 (undefined!9689 Bool) (index!37881 (_ BitVec 32)) (x!76093 (_ BitVec 32))) (Undefined!8877) (MissingVacant!8877 (index!37882 (_ BitVec 32))) )
))
(declare-fun lt!404123 () SeekEntryResult!8877)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52399 (_ BitVec 32)) SeekEntryResult!8877)

(assert (=> b!894540 (= lt!404123 (seekEntry!0 key!785 (_keys!10041 thiss!1181) (mask!25908 thiss!1181)))))

(declare-fun b!894541 () Bool)

(declare-fun e!499689 () Bool)

(declare-fun tp_is_empty!18211 () Bool)

(assert (=> b!894541 (= e!499689 tp_is_empty!18211)))

(declare-fun b!894542 () Bool)

(declare-fun e!499684 () Bool)

(assert (=> b!894542 (= e!499684 (and e!499689 mapRes!28897))))

(declare-fun condMapEmpty!28897 () Bool)

(declare-fun mapDefault!28897 () ValueCell!8624)

(assert (=> b!894542 (= condMapEmpty!28897 (= (arr!25200 (_values!5331 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8624)) mapDefault!28897)))))

(declare-fun array_inv!19842 (array!52399) Bool)

(declare-fun array_inv!19843 (array!52401) Bool)

(assert (=> b!894543 (= e!499685 (and tp!55645 tp_is_empty!18211 (array_inv!19842 (_keys!10041 thiss!1181)) (array_inv!19843 (_values!5331 thiss!1181)) e!499684))))

(declare-fun mapNonEmpty!28897 () Bool)

(declare-fun tp!55644 () Bool)

(declare-fun e!499688 () Bool)

(assert (=> mapNonEmpty!28897 (= mapRes!28897 (and tp!55644 e!499688))))

(declare-fun mapRest!28897 () (Array (_ BitVec 32) ValueCell!8624))

(declare-fun mapValue!28897 () ValueCell!8624)

(declare-fun mapKey!28897 () (_ BitVec 32))

(assert (=> mapNonEmpty!28897 (= (arr!25200 (_values!5331 thiss!1181)) (store mapRest!28897 mapKey!28897 mapValue!28897))))

(declare-fun b!894544 () Bool)

(declare-fun res!605354 () Bool)

(assert (=> b!894544 (=> (not res!605354) (not e!499686))))

(assert (=> b!894544 (= res!605354 (not (= key!785 (bvneg key!785))))))

(declare-fun b!894545 () Bool)

(assert (=> b!894545 (= e!499688 tp_is_empty!18211)))

(declare-fun b!894546 () Bool)

(assert (=> b!894546 (= e!499690 (and (= (size!25649 (_values!5331 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25908 thiss!1181))) (not (= (size!25648 (_keys!10041 thiss!1181)) (size!25649 (_values!5331 thiss!1181))))))))

(assert (= (and start!76170 res!605353) b!894544))

(assert (= (and b!894544 res!605354) b!894540))

(assert (= (and b!894540 res!605355) b!894546))

(assert (= (and b!894542 condMapEmpty!28897) mapIsEmpty!28897))

(assert (= (and b!894542 (not condMapEmpty!28897)) mapNonEmpty!28897))

(get-info :version)

(assert (= (and mapNonEmpty!28897 ((_ is ValueCellFull!8624) mapValue!28897)) b!894545))

(assert (= (and b!894542 ((_ is ValueCellFull!8624) mapDefault!28897)) b!894541))

(assert (= b!894543 b!894542))

(assert (= start!76170 b!894543))

(declare-fun m!831933 () Bool)

(assert (=> start!76170 m!831933))

(declare-fun m!831935 () Bool)

(assert (=> b!894540 m!831935))

(declare-fun m!831937 () Bool)

(assert (=> b!894540 m!831937))

(declare-fun m!831939 () Bool)

(assert (=> b!894543 m!831939))

(declare-fun m!831941 () Bool)

(assert (=> b!894543 m!831941))

(declare-fun m!831943 () Bool)

(assert (=> mapNonEmpty!28897 m!831943))

(check-sat b_and!26149 (not b_next!15883) (not b!894540) (not b!894543) tp_is_empty!18211 (not start!76170) (not mapNonEmpty!28897))
(check-sat b_and!26149 (not b_next!15883))
(get-model)

(declare-fun d!110495 () Bool)

(assert (=> d!110495 (= (array_inv!19842 (_keys!10041 thiss!1181)) (bvsge (size!25648 (_keys!10041 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894543 d!110495))

(declare-fun d!110497 () Bool)

(assert (=> d!110497 (= (array_inv!19843 (_values!5331 thiss!1181)) (bvsge (size!25649 (_values!5331 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894543 d!110497))

(declare-fun d!110499 () Bool)

(assert (=> d!110499 (= (validMask!0 (mask!25908 thiss!1181)) (and (or (= (mask!25908 thiss!1181) #b00000000000000000000000000000111) (= (mask!25908 thiss!1181) #b00000000000000000000000000001111) (= (mask!25908 thiss!1181) #b00000000000000000000000000011111) (= (mask!25908 thiss!1181) #b00000000000000000000000000111111) (= (mask!25908 thiss!1181) #b00000000000000000000000001111111) (= (mask!25908 thiss!1181) #b00000000000000000000000011111111) (= (mask!25908 thiss!1181) #b00000000000000000000000111111111) (= (mask!25908 thiss!1181) #b00000000000000000000001111111111) (= (mask!25908 thiss!1181) #b00000000000000000000011111111111) (= (mask!25908 thiss!1181) #b00000000000000000000111111111111) (= (mask!25908 thiss!1181) #b00000000000000000001111111111111) (= (mask!25908 thiss!1181) #b00000000000000000011111111111111) (= (mask!25908 thiss!1181) #b00000000000000000111111111111111) (= (mask!25908 thiss!1181) #b00000000000000001111111111111111) (= (mask!25908 thiss!1181) #b00000000000000011111111111111111) (= (mask!25908 thiss!1181) #b00000000000000111111111111111111) (= (mask!25908 thiss!1181) #b00000000000001111111111111111111) (= (mask!25908 thiss!1181) #b00000000000011111111111111111111) (= (mask!25908 thiss!1181) #b00000000000111111111111111111111) (= (mask!25908 thiss!1181) #b00000000001111111111111111111111) (= (mask!25908 thiss!1181) #b00000000011111111111111111111111) (= (mask!25908 thiss!1181) #b00000000111111111111111111111111) (= (mask!25908 thiss!1181) #b00000001111111111111111111111111) (= (mask!25908 thiss!1181) #b00000011111111111111111111111111) (= (mask!25908 thiss!1181) #b00000111111111111111111111111111) (= (mask!25908 thiss!1181) #b00001111111111111111111111111111) (= (mask!25908 thiss!1181) #b00011111111111111111111111111111) (= (mask!25908 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25908 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!894540 d!110499))

(declare-fun b!894601 () Bool)

(declare-fun e!499741 () SeekEntryResult!8877)

(assert (=> b!894601 (= e!499741 Undefined!8877)))

(declare-fun b!894602 () Bool)

(declare-fun e!499739 () SeekEntryResult!8877)

(assert (=> b!894602 (= e!499741 e!499739)))

(declare-fun lt!404141 () (_ BitVec 64))

(declare-fun lt!404139 () SeekEntryResult!8877)

(assert (=> b!894602 (= lt!404141 (select (arr!25199 (_keys!10041 thiss!1181)) (index!37881 lt!404139)))))

(declare-fun c!94390 () Bool)

(assert (=> b!894602 (= c!94390 (= lt!404141 key!785))))

(declare-fun b!894603 () Bool)

(declare-fun e!499740 () SeekEntryResult!8877)

(declare-fun lt!404140 () SeekEntryResult!8877)

(assert (=> b!894603 (= e!499740 (ite ((_ is MissingVacant!8877) lt!404140) (MissingZero!8877 (index!37882 lt!404140)) lt!404140))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52399 (_ BitVec 32)) SeekEntryResult!8877)

(assert (=> b!894603 (= lt!404140 (seekKeyOrZeroReturnVacant!0 (x!76093 lt!404139) (index!37881 lt!404139) (index!37881 lt!404139) key!785 (_keys!10041 thiss!1181) (mask!25908 thiss!1181)))))

(declare-fun b!894605 () Bool)

(assert (=> b!894605 (= e!499740 (MissingZero!8877 (index!37881 lt!404139)))))

(declare-fun b!894606 () Bool)

(assert (=> b!894606 (= e!499739 (Found!8877 (index!37881 lt!404139)))))

(declare-fun d!110501 () Bool)

(declare-fun lt!404138 () SeekEntryResult!8877)

(assert (=> d!110501 (and (or ((_ is MissingVacant!8877) lt!404138) (not ((_ is Found!8877) lt!404138)) (and (bvsge (index!37880 lt!404138) #b00000000000000000000000000000000) (bvslt (index!37880 lt!404138) (size!25648 (_keys!10041 thiss!1181))))) (not ((_ is MissingVacant!8877) lt!404138)) (or (not ((_ is Found!8877) lt!404138)) (= (select (arr!25199 (_keys!10041 thiss!1181)) (index!37880 lt!404138)) key!785)))))

(assert (=> d!110501 (= lt!404138 e!499741)))

(declare-fun c!94392 () Bool)

(assert (=> d!110501 (= c!94392 (and ((_ is Intermediate!8877) lt!404139) (undefined!9689 lt!404139)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52399 (_ BitVec 32)) SeekEntryResult!8877)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110501 (= lt!404139 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25908 thiss!1181)) key!785 (_keys!10041 thiss!1181) (mask!25908 thiss!1181)))))

(assert (=> d!110501 (validMask!0 (mask!25908 thiss!1181))))

(assert (=> d!110501 (= (seekEntry!0 key!785 (_keys!10041 thiss!1181) (mask!25908 thiss!1181)) lt!404138)))

(declare-fun b!894604 () Bool)

(declare-fun c!94391 () Bool)

(assert (=> b!894604 (= c!94391 (= lt!404141 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894604 (= e!499739 e!499740)))

(assert (= (and d!110501 c!94392) b!894601))

(assert (= (and d!110501 (not c!94392)) b!894602))

(assert (= (and b!894602 c!94390) b!894606))

(assert (= (and b!894602 (not c!94390)) b!894604))

(assert (= (and b!894604 c!94391) b!894605))

(assert (= (and b!894604 (not c!94391)) b!894603))

(declare-fun m!831969 () Bool)

(assert (=> b!894602 m!831969))

(declare-fun m!831971 () Bool)

(assert (=> b!894603 m!831971))

(declare-fun m!831973 () Bool)

(assert (=> d!110501 m!831973))

(declare-fun m!831975 () Bool)

(assert (=> d!110501 m!831975))

(assert (=> d!110501 m!831975))

(declare-fun m!831977 () Bool)

(assert (=> d!110501 m!831977))

(assert (=> d!110501 m!831935))

(assert (=> b!894540 d!110501))

(declare-fun d!110503 () Bool)

(declare-fun res!605380 () Bool)

(declare-fun e!499744 () Bool)

(assert (=> d!110503 (=> (not res!605380) (not e!499744))))

(declare-fun simpleValid!302 (LongMapFixedSize!4264) Bool)

(assert (=> d!110503 (= res!605380 (simpleValid!302 thiss!1181))))

(assert (=> d!110503 (= (valid!1657 thiss!1181) e!499744)))

(declare-fun b!894613 () Bool)

(declare-fun res!605381 () Bool)

(assert (=> b!894613 (=> (not res!605381) (not e!499744))))

(declare-fun arrayCountValidKeys!0 (array!52399 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894613 (= res!605381 (= (arrayCountValidKeys!0 (_keys!10041 thiss!1181) #b00000000000000000000000000000000 (size!25648 (_keys!10041 thiss!1181))) (_size!2187 thiss!1181)))))

(declare-fun b!894614 () Bool)

(declare-fun res!605382 () Bool)

(assert (=> b!894614 (=> (not res!605382) (not e!499744))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52399 (_ BitVec 32)) Bool)

(assert (=> b!894614 (= res!605382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10041 thiss!1181) (mask!25908 thiss!1181)))))

(declare-fun b!894615 () Bool)

(declare-datatypes ((List!17817 0))(
  ( (Nil!17814) (Cons!17813 (h!18947 (_ BitVec 64)) (t!25147 List!17817)) )
))
(declare-fun arrayNoDuplicates!0 (array!52399 (_ BitVec 32) List!17817) Bool)

(assert (=> b!894615 (= e!499744 (arrayNoDuplicates!0 (_keys!10041 thiss!1181) #b00000000000000000000000000000000 Nil!17814))))

(assert (= (and d!110503 res!605380) b!894613))

(assert (= (and b!894613 res!605381) b!894614))

(assert (= (and b!894614 res!605382) b!894615))

(declare-fun m!831979 () Bool)

(assert (=> d!110503 m!831979))

(declare-fun m!831981 () Bool)

(assert (=> b!894613 m!831981))

(declare-fun m!831983 () Bool)

(assert (=> b!894614 m!831983))

(declare-fun m!831985 () Bool)

(assert (=> b!894615 m!831985))

(assert (=> start!76170 d!110503))

(declare-fun mapNonEmpty!28906 () Bool)

(declare-fun mapRes!28906 () Bool)

(declare-fun tp!55660 () Bool)

(declare-fun e!499750 () Bool)

(assert (=> mapNonEmpty!28906 (= mapRes!28906 (and tp!55660 e!499750))))

(declare-fun mapRest!28906 () (Array (_ BitVec 32) ValueCell!8624))

(declare-fun mapKey!28906 () (_ BitVec 32))

(declare-fun mapValue!28906 () ValueCell!8624)

(assert (=> mapNonEmpty!28906 (= mapRest!28897 (store mapRest!28906 mapKey!28906 mapValue!28906))))

(declare-fun mapIsEmpty!28906 () Bool)

(assert (=> mapIsEmpty!28906 mapRes!28906))

(declare-fun condMapEmpty!28906 () Bool)

(declare-fun mapDefault!28906 () ValueCell!8624)

(assert (=> mapNonEmpty!28897 (= condMapEmpty!28906 (= mapRest!28897 ((as const (Array (_ BitVec 32) ValueCell!8624)) mapDefault!28906)))))

(declare-fun e!499749 () Bool)

(assert (=> mapNonEmpty!28897 (= tp!55644 (and e!499749 mapRes!28906))))

(declare-fun b!894622 () Bool)

(assert (=> b!894622 (= e!499750 tp_is_empty!18211)))

(declare-fun b!894623 () Bool)

(assert (=> b!894623 (= e!499749 tp_is_empty!18211)))

(assert (= (and mapNonEmpty!28897 condMapEmpty!28906) mapIsEmpty!28906))

(assert (= (and mapNonEmpty!28897 (not condMapEmpty!28906)) mapNonEmpty!28906))

(assert (= (and mapNonEmpty!28906 ((_ is ValueCellFull!8624) mapValue!28906)) b!894622))

(assert (= (and mapNonEmpty!28897 ((_ is ValueCellFull!8624) mapDefault!28906)) b!894623))

(declare-fun m!831987 () Bool)

(assert (=> mapNonEmpty!28906 m!831987))

(check-sat (not b!894613) (not b_next!15883) (not b!894614) tp_is_empty!18211 (not d!110501) (not d!110503) (not b!894615) b_and!26149 (not b!894603) (not mapNonEmpty!28906))
(check-sat b_and!26149 (not b_next!15883))
(get-model)

(declare-fun bm!39701 () Bool)

(declare-fun call!39704 () Bool)

(declare-fun c!94395 () Bool)

(assert (=> bm!39701 (= call!39704 (arrayNoDuplicates!0 (_keys!10041 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94395 (Cons!17813 (select (arr!25199 (_keys!10041 thiss!1181)) #b00000000000000000000000000000000) Nil!17814) Nil!17814)))))

(declare-fun b!894634 () Bool)

(declare-fun e!499762 () Bool)

(assert (=> b!894634 (= e!499762 call!39704)))

(declare-fun d!110505 () Bool)

(declare-fun res!605390 () Bool)

(declare-fun e!499759 () Bool)

(assert (=> d!110505 (=> res!605390 e!499759)))

(assert (=> d!110505 (= res!605390 (bvsge #b00000000000000000000000000000000 (size!25648 (_keys!10041 thiss!1181))))))

(assert (=> d!110505 (= (arrayNoDuplicates!0 (_keys!10041 thiss!1181) #b00000000000000000000000000000000 Nil!17814) e!499759)))

(declare-fun b!894635 () Bool)

(declare-fun e!499760 () Bool)

(declare-fun contains!4365 (List!17817 (_ BitVec 64)) Bool)

(assert (=> b!894635 (= e!499760 (contains!4365 Nil!17814 (select (arr!25199 (_keys!10041 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894636 () Bool)

(declare-fun e!499761 () Bool)

(assert (=> b!894636 (= e!499761 e!499762)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!894636 (= c!94395 (validKeyInArray!0 (select (arr!25199 (_keys!10041 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894637 () Bool)

(assert (=> b!894637 (= e!499762 call!39704)))

(declare-fun b!894638 () Bool)

(assert (=> b!894638 (= e!499759 e!499761)))

(declare-fun res!605391 () Bool)

(assert (=> b!894638 (=> (not res!605391) (not e!499761))))

(assert (=> b!894638 (= res!605391 (not e!499760))))

(declare-fun res!605389 () Bool)

(assert (=> b!894638 (=> (not res!605389) (not e!499760))))

(assert (=> b!894638 (= res!605389 (validKeyInArray!0 (select (arr!25199 (_keys!10041 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110505 (not res!605390)) b!894638))

(assert (= (and b!894638 res!605389) b!894635))

(assert (= (and b!894638 res!605391) b!894636))

(assert (= (and b!894636 c!94395) b!894637))

(assert (= (and b!894636 (not c!94395)) b!894634))

(assert (= (or b!894637 b!894634) bm!39701))

(declare-fun m!831989 () Bool)

(assert (=> bm!39701 m!831989))

(declare-fun m!831991 () Bool)

(assert (=> bm!39701 m!831991))

(assert (=> b!894635 m!831989))

(assert (=> b!894635 m!831989))

(declare-fun m!831993 () Bool)

(assert (=> b!894635 m!831993))

(assert (=> b!894636 m!831989))

(assert (=> b!894636 m!831989))

(declare-fun m!831995 () Bool)

(assert (=> b!894636 m!831995))

(assert (=> b!894638 m!831989))

(assert (=> b!894638 m!831989))

(assert (=> b!894638 m!831995))

(assert (=> b!894615 d!110505))

(declare-fun b!894657 () Bool)

(declare-fun e!499773 () SeekEntryResult!8877)

(declare-fun e!499775 () SeekEntryResult!8877)

(assert (=> b!894657 (= e!499773 e!499775)))

(declare-fun c!94403 () Bool)

(declare-fun lt!404146 () (_ BitVec 64))

(assert (=> b!894657 (= c!94403 (or (= lt!404146 key!785) (= (bvadd lt!404146 lt!404146) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!110507 () Bool)

(declare-fun e!499774 () Bool)

(assert (=> d!110507 e!499774))

(declare-fun c!94404 () Bool)

(declare-fun lt!404147 () SeekEntryResult!8877)

(assert (=> d!110507 (= c!94404 (and ((_ is Intermediate!8877) lt!404147) (undefined!9689 lt!404147)))))

(assert (=> d!110507 (= lt!404147 e!499773)))

(declare-fun c!94402 () Bool)

(assert (=> d!110507 (= c!94402 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110507 (= lt!404146 (select (arr!25199 (_keys!10041 thiss!1181)) (toIndex!0 key!785 (mask!25908 thiss!1181))))))

(assert (=> d!110507 (validMask!0 (mask!25908 thiss!1181))))

(assert (=> d!110507 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25908 thiss!1181)) key!785 (_keys!10041 thiss!1181) (mask!25908 thiss!1181)) lt!404147)))

(declare-fun b!894658 () Bool)

(assert (=> b!894658 (= e!499774 (bvsge (x!76093 lt!404147) #b01111111111111111111111111111110))))

(declare-fun b!894659 () Bool)

(assert (=> b!894659 (and (bvsge (index!37881 lt!404147) #b00000000000000000000000000000000) (bvslt (index!37881 lt!404147) (size!25648 (_keys!10041 thiss!1181))))))

(declare-fun e!499777 () Bool)

(assert (=> b!894659 (= e!499777 (= (select (arr!25199 (_keys!10041 thiss!1181)) (index!37881 lt!404147)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894660 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894660 (= e!499775 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25908 thiss!1181)) #b00000000000000000000000000000000 (mask!25908 thiss!1181)) key!785 (_keys!10041 thiss!1181) (mask!25908 thiss!1181)))))

(declare-fun b!894661 () Bool)

(assert (=> b!894661 (and (bvsge (index!37881 lt!404147) #b00000000000000000000000000000000) (bvslt (index!37881 lt!404147) (size!25648 (_keys!10041 thiss!1181))))))

(declare-fun res!605400 () Bool)

(assert (=> b!894661 (= res!605400 (= (select (arr!25199 (_keys!10041 thiss!1181)) (index!37881 lt!404147)) key!785))))

(assert (=> b!894661 (=> res!605400 e!499777)))

(declare-fun e!499776 () Bool)

(assert (=> b!894661 (= e!499776 e!499777)))

(declare-fun b!894662 () Bool)

(assert (=> b!894662 (= e!499773 (Intermediate!8877 true (toIndex!0 key!785 (mask!25908 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!894663 () Bool)

(assert (=> b!894663 (and (bvsge (index!37881 lt!404147) #b00000000000000000000000000000000) (bvslt (index!37881 lt!404147) (size!25648 (_keys!10041 thiss!1181))))))

(declare-fun res!605398 () Bool)

(assert (=> b!894663 (= res!605398 (= (select (arr!25199 (_keys!10041 thiss!1181)) (index!37881 lt!404147)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894663 (=> res!605398 e!499777)))

(declare-fun b!894664 () Bool)

(assert (=> b!894664 (= e!499775 (Intermediate!8877 false (toIndex!0 key!785 (mask!25908 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!894665 () Bool)

(assert (=> b!894665 (= e!499774 e!499776)))

(declare-fun res!605399 () Bool)

(assert (=> b!894665 (= res!605399 (and ((_ is Intermediate!8877) lt!404147) (not (undefined!9689 lt!404147)) (bvslt (x!76093 lt!404147) #b01111111111111111111111111111110) (bvsge (x!76093 lt!404147) #b00000000000000000000000000000000) (bvsge (x!76093 lt!404147) #b00000000000000000000000000000000)))))

(assert (=> b!894665 (=> (not res!605399) (not e!499776))))

(assert (= (and d!110507 c!94402) b!894662))

(assert (= (and d!110507 (not c!94402)) b!894657))

(assert (= (and b!894657 c!94403) b!894664))

(assert (= (and b!894657 (not c!94403)) b!894660))

(assert (= (and d!110507 c!94404) b!894658))

(assert (= (and d!110507 (not c!94404)) b!894665))

(assert (= (and b!894665 res!605399) b!894661))

(assert (= (and b!894661 (not res!605400)) b!894663))

(assert (= (and b!894663 (not res!605398)) b!894659))

(assert (=> b!894660 m!831975))

(declare-fun m!831997 () Bool)

(assert (=> b!894660 m!831997))

(assert (=> b!894660 m!831997))

(declare-fun m!831999 () Bool)

(assert (=> b!894660 m!831999))

(declare-fun m!832001 () Bool)

(assert (=> b!894661 m!832001))

(assert (=> b!894659 m!832001))

(assert (=> d!110507 m!831975))

(declare-fun m!832003 () Bool)

(assert (=> d!110507 m!832003))

(assert (=> d!110507 m!831935))

(assert (=> b!894663 m!832001))

(assert (=> d!110501 d!110507))

(declare-fun d!110509 () Bool)

(declare-fun lt!404153 () (_ BitVec 32))

(declare-fun lt!404152 () (_ BitVec 32))

(assert (=> d!110509 (= lt!404153 (bvmul (bvxor lt!404152 (bvlshr lt!404152 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110509 (= lt!404152 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110509 (and (bvsge (mask!25908 thiss!1181) #b00000000000000000000000000000000) (let ((res!605401 (let ((h!18948 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76109 (bvmul (bvxor h!18948 (bvlshr h!18948 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76109 (bvlshr x!76109 #b00000000000000000000000000001101)) (mask!25908 thiss!1181)))))) (and (bvslt res!605401 (bvadd (mask!25908 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605401 #b00000000000000000000000000000000))))))

(assert (=> d!110509 (= (toIndex!0 key!785 (mask!25908 thiss!1181)) (bvand (bvxor lt!404153 (bvlshr lt!404153 #b00000000000000000000000000001101)) (mask!25908 thiss!1181)))))

(assert (=> d!110501 d!110509))

(assert (=> d!110501 d!110499))

(declare-fun b!894677 () Bool)

(declare-fun e!499780 () Bool)

(assert (=> b!894677 (= e!499780 (and (bvsge (extraKeys!5040 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5040 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2187 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!894674 () Bool)

(declare-fun res!605410 () Bool)

(assert (=> b!894674 (=> (not res!605410) (not e!499780))))

(assert (=> b!894674 (= res!605410 (and (= (size!25649 (_values!5331 thiss!1181)) (bvadd (mask!25908 thiss!1181) #b00000000000000000000000000000001)) (= (size!25648 (_keys!10041 thiss!1181)) (size!25649 (_values!5331 thiss!1181))) (bvsge (_size!2187 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2187 thiss!1181) (bvadd (mask!25908 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!894675 () Bool)

(declare-fun res!605413 () Bool)

(assert (=> b!894675 (=> (not res!605413) (not e!499780))))

(declare-fun size!25654 (LongMapFixedSize!4264) (_ BitVec 32))

(assert (=> b!894675 (= res!605413 (bvsge (size!25654 thiss!1181) (_size!2187 thiss!1181)))))

(declare-fun b!894676 () Bool)

(declare-fun res!605412 () Bool)

(assert (=> b!894676 (=> (not res!605412) (not e!499780))))

(assert (=> b!894676 (= res!605412 (= (size!25654 thiss!1181) (bvadd (_size!2187 thiss!1181) (bvsdiv (bvadd (extraKeys!5040 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun d!110511 () Bool)

(declare-fun res!605411 () Bool)

(assert (=> d!110511 (=> (not res!605411) (not e!499780))))

(assert (=> d!110511 (= res!605411 (validMask!0 (mask!25908 thiss!1181)))))

(assert (=> d!110511 (= (simpleValid!302 thiss!1181) e!499780)))

(assert (= (and d!110511 res!605411) b!894674))

(assert (= (and b!894674 res!605410) b!894675))

(assert (= (and b!894675 res!605413) b!894676))

(assert (= (and b!894676 res!605412) b!894677))

(declare-fun m!832005 () Bool)

(assert (=> b!894675 m!832005))

(assert (=> b!894676 m!832005))

(assert (=> d!110511 m!831935))

(assert (=> d!110503 d!110511))

(declare-fun b!894690 () Bool)

(declare-fun e!499789 () SeekEntryResult!8877)

(assert (=> b!894690 (= e!499789 (MissingVacant!8877 (index!37881 lt!404139)))))

(declare-fun lt!404159 () SeekEntryResult!8877)

(declare-fun d!110513 () Bool)

(assert (=> d!110513 (and (or ((_ is Undefined!8877) lt!404159) (not ((_ is Found!8877) lt!404159)) (and (bvsge (index!37880 lt!404159) #b00000000000000000000000000000000) (bvslt (index!37880 lt!404159) (size!25648 (_keys!10041 thiss!1181))))) (or ((_ is Undefined!8877) lt!404159) ((_ is Found!8877) lt!404159) (not ((_ is MissingVacant!8877) lt!404159)) (not (= (index!37882 lt!404159) (index!37881 lt!404139))) (and (bvsge (index!37882 lt!404159) #b00000000000000000000000000000000) (bvslt (index!37882 lt!404159) (size!25648 (_keys!10041 thiss!1181))))) (or ((_ is Undefined!8877) lt!404159) (ite ((_ is Found!8877) lt!404159) (= (select (arr!25199 (_keys!10041 thiss!1181)) (index!37880 lt!404159)) key!785) (and ((_ is MissingVacant!8877) lt!404159) (= (index!37882 lt!404159) (index!37881 lt!404139)) (= (select (arr!25199 (_keys!10041 thiss!1181)) (index!37882 lt!404159)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!499787 () SeekEntryResult!8877)

(assert (=> d!110513 (= lt!404159 e!499787)))

(declare-fun c!94411 () Bool)

(assert (=> d!110513 (= c!94411 (bvsge (x!76093 lt!404139) #b01111111111111111111111111111110))))

(declare-fun lt!404158 () (_ BitVec 64))

(assert (=> d!110513 (= lt!404158 (select (arr!25199 (_keys!10041 thiss!1181)) (index!37881 lt!404139)))))

(assert (=> d!110513 (validMask!0 (mask!25908 thiss!1181))))

(assert (=> d!110513 (= (seekKeyOrZeroReturnVacant!0 (x!76093 lt!404139) (index!37881 lt!404139) (index!37881 lt!404139) key!785 (_keys!10041 thiss!1181) (mask!25908 thiss!1181)) lt!404159)))

(declare-fun b!894691 () Bool)

(assert (=> b!894691 (= e!499787 Undefined!8877)))

(declare-fun b!894692 () Bool)

(declare-fun c!94412 () Bool)

(assert (=> b!894692 (= c!94412 (= lt!404158 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499788 () SeekEntryResult!8877)

(assert (=> b!894692 (= e!499788 e!499789)))

(declare-fun b!894693 () Bool)

(assert (=> b!894693 (= e!499787 e!499788)))

(declare-fun c!94413 () Bool)

(assert (=> b!894693 (= c!94413 (= lt!404158 key!785))))

(declare-fun b!894694 () Bool)

(assert (=> b!894694 (= e!499789 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76093 lt!404139) #b00000000000000000000000000000001) (nextIndex!0 (index!37881 lt!404139) (x!76093 lt!404139) (mask!25908 thiss!1181)) (index!37881 lt!404139) key!785 (_keys!10041 thiss!1181) (mask!25908 thiss!1181)))))

(declare-fun b!894695 () Bool)

(assert (=> b!894695 (= e!499788 (Found!8877 (index!37881 lt!404139)))))

(assert (= (and d!110513 c!94411) b!894691))

(assert (= (and d!110513 (not c!94411)) b!894693))

(assert (= (and b!894693 c!94413) b!894695))

(assert (= (and b!894693 (not c!94413)) b!894692))

(assert (= (and b!894692 c!94412) b!894690))

(assert (= (and b!894692 (not c!94412)) b!894694))

(declare-fun m!832007 () Bool)

(assert (=> d!110513 m!832007))

(declare-fun m!832009 () Bool)

(assert (=> d!110513 m!832009))

(assert (=> d!110513 m!831969))

(assert (=> d!110513 m!831935))

(declare-fun m!832011 () Bool)

(assert (=> b!894694 m!832011))

(assert (=> b!894694 m!832011))

(declare-fun m!832013 () Bool)

(assert (=> b!894694 m!832013))

(assert (=> b!894603 d!110513))

(declare-fun bm!39704 () Bool)

(declare-fun call!39707 () (_ BitVec 32))

(assert (=> bm!39704 (= call!39707 (arrayCountValidKeys!0 (_keys!10041 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25648 (_keys!10041 thiss!1181))))))

(declare-fun d!110515 () Bool)

(declare-fun lt!404162 () (_ BitVec 32))

(assert (=> d!110515 (and (bvsge lt!404162 #b00000000000000000000000000000000) (bvsle lt!404162 (bvsub (size!25648 (_keys!10041 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!499795 () (_ BitVec 32))

(assert (=> d!110515 (= lt!404162 e!499795)))

(declare-fun c!94418 () Bool)

(assert (=> d!110515 (= c!94418 (bvsge #b00000000000000000000000000000000 (size!25648 (_keys!10041 thiss!1181))))))

(assert (=> d!110515 (and (bvsle #b00000000000000000000000000000000 (size!25648 (_keys!10041 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25648 (_keys!10041 thiss!1181)) (size!25648 (_keys!10041 thiss!1181))))))

(assert (=> d!110515 (= (arrayCountValidKeys!0 (_keys!10041 thiss!1181) #b00000000000000000000000000000000 (size!25648 (_keys!10041 thiss!1181))) lt!404162)))

(declare-fun b!894704 () Bool)

(declare-fun e!499794 () (_ BitVec 32))

(assert (=> b!894704 (= e!499794 call!39707)))

(declare-fun b!894705 () Bool)

(assert (=> b!894705 (= e!499794 (bvadd #b00000000000000000000000000000001 call!39707))))

(declare-fun b!894706 () Bool)

(assert (=> b!894706 (= e!499795 e!499794)))

(declare-fun c!94419 () Bool)

(assert (=> b!894706 (= c!94419 (validKeyInArray!0 (select (arr!25199 (_keys!10041 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894707 () Bool)

(assert (=> b!894707 (= e!499795 #b00000000000000000000000000000000)))

(assert (= (and d!110515 c!94418) b!894707))

(assert (= (and d!110515 (not c!94418)) b!894706))

(assert (= (and b!894706 c!94419) b!894705))

(assert (= (and b!894706 (not c!94419)) b!894704))

(assert (= (or b!894705 b!894704) bm!39704))

(declare-fun m!832015 () Bool)

(assert (=> bm!39704 m!832015))

(assert (=> b!894706 m!831989))

(assert (=> b!894706 m!831989))

(assert (=> b!894706 m!831995))

(assert (=> b!894613 d!110515))

(declare-fun b!894716 () Bool)

(declare-fun e!499804 () Bool)

(declare-fun call!39710 () Bool)

(assert (=> b!894716 (= e!499804 call!39710)))

(declare-fun b!894718 () Bool)

(declare-fun e!499802 () Bool)

(assert (=> b!894718 (= e!499804 e!499802)))

(declare-fun lt!404171 () (_ BitVec 64))

(assert (=> b!894718 (= lt!404171 (select (arr!25199 (_keys!10041 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30400 0))(
  ( (Unit!30401) )
))
(declare-fun lt!404170 () Unit!30400)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52399 (_ BitVec 64) (_ BitVec 32)) Unit!30400)

(assert (=> b!894718 (= lt!404170 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10041 thiss!1181) lt!404171 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52399 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!894718 (arrayContainsKey!0 (_keys!10041 thiss!1181) lt!404171 #b00000000000000000000000000000000)))

(declare-fun lt!404169 () Unit!30400)

(assert (=> b!894718 (= lt!404169 lt!404170)))

(declare-fun res!605419 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52399 (_ BitVec 32)) SeekEntryResult!8877)

(assert (=> b!894718 (= res!605419 (= (seekEntryOrOpen!0 (select (arr!25199 (_keys!10041 thiss!1181)) #b00000000000000000000000000000000) (_keys!10041 thiss!1181) (mask!25908 thiss!1181)) (Found!8877 #b00000000000000000000000000000000)))))

(assert (=> b!894718 (=> (not res!605419) (not e!499802))))

(declare-fun b!894719 () Bool)

(declare-fun e!499803 () Bool)

(assert (=> b!894719 (= e!499803 e!499804)))

(declare-fun c!94422 () Bool)

(assert (=> b!894719 (= c!94422 (validKeyInArray!0 (select (arr!25199 (_keys!10041 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39707 () Bool)

(assert (=> bm!39707 (= call!39710 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10041 thiss!1181) (mask!25908 thiss!1181)))))

(declare-fun d!110517 () Bool)

(declare-fun res!605418 () Bool)

(assert (=> d!110517 (=> res!605418 e!499803)))

(assert (=> d!110517 (= res!605418 (bvsge #b00000000000000000000000000000000 (size!25648 (_keys!10041 thiss!1181))))))

(assert (=> d!110517 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10041 thiss!1181) (mask!25908 thiss!1181)) e!499803)))

(declare-fun b!894717 () Bool)

(assert (=> b!894717 (= e!499802 call!39710)))

(assert (= (and d!110517 (not res!605418)) b!894719))

(assert (= (and b!894719 c!94422) b!894718))

(assert (= (and b!894719 (not c!94422)) b!894716))

(assert (= (and b!894718 res!605419) b!894717))

(assert (= (or b!894717 b!894716) bm!39707))

(assert (=> b!894718 m!831989))

(declare-fun m!832017 () Bool)

(assert (=> b!894718 m!832017))

(declare-fun m!832019 () Bool)

(assert (=> b!894718 m!832019))

(assert (=> b!894718 m!831989))

(declare-fun m!832021 () Bool)

(assert (=> b!894718 m!832021))

(assert (=> b!894719 m!831989))

(assert (=> b!894719 m!831989))

(assert (=> b!894719 m!831995))

(declare-fun m!832023 () Bool)

(assert (=> bm!39707 m!832023))

(assert (=> b!894614 d!110517))

(declare-fun mapNonEmpty!28907 () Bool)

(declare-fun mapRes!28907 () Bool)

(declare-fun tp!55661 () Bool)

(declare-fun e!499806 () Bool)

(assert (=> mapNonEmpty!28907 (= mapRes!28907 (and tp!55661 e!499806))))

(declare-fun mapRest!28907 () (Array (_ BitVec 32) ValueCell!8624))

(declare-fun mapKey!28907 () (_ BitVec 32))

(declare-fun mapValue!28907 () ValueCell!8624)

(assert (=> mapNonEmpty!28907 (= mapRest!28906 (store mapRest!28907 mapKey!28907 mapValue!28907))))

(declare-fun mapIsEmpty!28907 () Bool)

(assert (=> mapIsEmpty!28907 mapRes!28907))

(declare-fun condMapEmpty!28907 () Bool)

(declare-fun mapDefault!28907 () ValueCell!8624)

(assert (=> mapNonEmpty!28906 (= condMapEmpty!28907 (= mapRest!28906 ((as const (Array (_ BitVec 32) ValueCell!8624)) mapDefault!28907)))))

(declare-fun e!499805 () Bool)

(assert (=> mapNonEmpty!28906 (= tp!55660 (and e!499805 mapRes!28907))))

(declare-fun b!894720 () Bool)

(assert (=> b!894720 (= e!499806 tp_is_empty!18211)))

(declare-fun b!894721 () Bool)

(assert (=> b!894721 (= e!499805 tp_is_empty!18211)))

(assert (= (and mapNonEmpty!28906 condMapEmpty!28907) mapIsEmpty!28907))

(assert (= (and mapNonEmpty!28906 (not condMapEmpty!28907)) mapNonEmpty!28907))

(assert (= (and mapNonEmpty!28907 ((_ is ValueCellFull!8624) mapValue!28907)) b!894720))

(assert (= (and mapNonEmpty!28906 ((_ is ValueCellFull!8624) mapDefault!28907)) b!894721))

(declare-fun m!832025 () Bool)

(assert (=> mapNonEmpty!28907 m!832025))

(check-sat (not b!894676) (not b_next!15883) (not bm!39701) (not bm!39707) (not b!894675) (not b!894718) (not b!894638) (not d!110507) (not d!110511) (not b!894706) (not d!110513) (not b!894660) (not b!894636) (not b!894694) (not b!894635) (not bm!39704) b_and!26149 (not b!894719) (not mapNonEmpty!28907) tp_is_empty!18211)
(check-sat b_and!26149 (not b_next!15883))
