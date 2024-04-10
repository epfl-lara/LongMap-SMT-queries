; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76160 () Bool)

(assert start!76160)

(declare-fun b!894604 () Bool)

(declare-fun b_free!15879 () Bool)

(declare-fun b_next!15879 () Bool)

(assert (=> b!894604 (= b_free!15879 (not b_next!15879))))

(declare-fun tp!55628 () Bool)

(declare-fun b_and!26171 () Bool)

(assert (=> b!894604 (= tp!55628 b_and!26171)))

(declare-datatypes ((array!52406 0))(
  ( (array!52407 (arr!25203 (Array (_ BitVec 32) (_ BitVec 64))) (size!25649 (_ BitVec 32))) )
))
(declare-datatypes ((V!29241 0))(
  ( (V!29242 (val!9154 Int)) )
))
(declare-datatypes ((ValueCell!8622 0))(
  ( (ValueCellFull!8622 (v!11644 V!29241)) (EmptyCell!8622) )
))
(declare-datatypes ((array!52408 0))(
  ( (array!52409 (arr!25204 (Array (_ BitVec 32) ValueCell!8622)) (size!25650 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4260 0))(
  ( (LongMapFixedSize!4261 (defaultEntry!5342 Int) (mask!25905 (_ BitVec 32)) (extraKeys!5038 (_ BitVec 32)) (zeroValue!5142 V!29241) (minValue!5142 V!29241) (_size!2185 (_ BitVec 32)) (_keys!10040 array!52406) (_values!5329 array!52408) (_vacant!2185 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4260)

(declare-fun e!499721 () Bool)

(declare-fun e!499716 () Bool)

(declare-fun tp_is_empty!18207 () Bool)

(declare-fun array_inv!19788 (array!52406) Bool)

(declare-fun array_inv!19789 (array!52408) Bool)

(assert (=> b!894604 (= e!499716 (and tp!55628 tp_is_empty!18207 (array_inv!19788 (_keys!10040 thiss!1181)) (array_inv!19789 (_values!5329 thiss!1181)) e!499721))))

(declare-fun b!894605 () Bool)

(declare-fun e!499717 () Bool)

(assert (=> b!894605 (= e!499717 (not (= (size!25650 (_values!5329 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25905 thiss!1181)))))))

(declare-fun b!894606 () Bool)

(declare-fun e!499722 () Bool)

(assert (=> b!894606 (= e!499722 tp_is_empty!18207)))

(declare-fun b!894607 () Bool)

(declare-fun res!605399 () Bool)

(declare-fun e!499719 () Bool)

(assert (=> b!894607 (=> (not res!605399) (not e!499719))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!894607 (= res!605399 (not (= key!785 (bvneg key!785))))))

(declare-fun res!605401 () Bool)

(assert (=> start!76160 (=> (not res!605401) (not e!499719))))

(declare-fun valid!1644 (LongMapFixedSize!4260) Bool)

(assert (=> start!76160 (= res!605401 (valid!1644 thiss!1181))))

(assert (=> start!76160 e!499719))

(assert (=> start!76160 e!499716))

(assert (=> start!76160 true))

(declare-fun mapNonEmpty!28887 () Bool)

(declare-fun mapRes!28887 () Bool)

(declare-fun tp!55627 () Bool)

(assert (=> mapNonEmpty!28887 (= mapRes!28887 (and tp!55627 e!499722))))

(declare-fun mapKey!28887 () (_ BitVec 32))

(declare-fun mapValue!28887 () ValueCell!8622)

(declare-fun mapRest!28887 () (Array (_ BitVec 32) ValueCell!8622))

(assert (=> mapNonEmpty!28887 (= (arr!25204 (_values!5329 thiss!1181)) (store mapRest!28887 mapKey!28887 mapValue!28887))))

(declare-fun mapIsEmpty!28887 () Bool)

(assert (=> mapIsEmpty!28887 mapRes!28887))

(declare-fun b!894608 () Bool)

(declare-fun e!499718 () Bool)

(assert (=> b!894608 (= e!499718 tp_is_empty!18207)))

(declare-fun b!894609 () Bool)

(assert (=> b!894609 (= e!499719 e!499717)))

(declare-fun res!605400 () Bool)

(assert (=> b!894609 (=> (not res!605400) (not e!499717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!894609 (= res!605400 (validMask!0 (mask!25905 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8869 0))(
  ( (MissingZero!8869 (index!37847 (_ BitVec 32))) (Found!8869 (index!37848 (_ BitVec 32))) (Intermediate!8869 (undefined!9681 Bool) (index!37849 (_ BitVec 32)) (x!76065 (_ BitVec 32))) (Undefined!8869) (MissingVacant!8869 (index!37850 (_ BitVec 32))) )
))
(declare-fun lt!404311 () SeekEntryResult!8869)

(declare-fun seekEntry!0 ((_ BitVec 64) array!52406 (_ BitVec 32)) SeekEntryResult!8869)

(assert (=> b!894609 (= lt!404311 (seekEntry!0 key!785 (_keys!10040 thiss!1181) (mask!25905 thiss!1181)))))

(declare-fun b!894610 () Bool)

(assert (=> b!894610 (= e!499721 (and e!499718 mapRes!28887))))

(declare-fun condMapEmpty!28887 () Bool)

(declare-fun mapDefault!28887 () ValueCell!8622)

(assert (=> b!894610 (= condMapEmpty!28887 (= (arr!25204 (_values!5329 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8622)) mapDefault!28887)))))

(assert (= (and start!76160 res!605401) b!894607))

(assert (= (and b!894607 res!605399) b!894609))

(assert (= (and b!894609 res!605400) b!894605))

(assert (= (and b!894610 condMapEmpty!28887) mapIsEmpty!28887))

(assert (= (and b!894610 (not condMapEmpty!28887)) mapNonEmpty!28887))

(get-info :version)

(assert (= (and mapNonEmpty!28887 ((_ is ValueCellFull!8622) mapValue!28887)) b!894606))

(assert (= (and b!894610 ((_ is ValueCellFull!8622) mapDefault!28887)) b!894608))

(assert (= b!894604 b!894610))

(assert (= start!76160 b!894604))

(declare-fun m!832609 () Bool)

(assert (=> b!894604 m!832609))

(declare-fun m!832611 () Bool)

(assert (=> b!894604 m!832611))

(declare-fun m!832613 () Bool)

(assert (=> start!76160 m!832613))

(declare-fun m!832615 () Bool)

(assert (=> mapNonEmpty!28887 m!832615))

(declare-fun m!832617 () Bool)

(assert (=> b!894609 m!832617))

(declare-fun m!832619 () Bool)

(assert (=> b!894609 m!832619))

(check-sat (not b!894609) (not mapNonEmpty!28887) (not b!894604) (not start!76160) b_and!26171 tp_is_empty!18207 (not b_next!15879))
(check-sat b_and!26171 (not b_next!15879))
(get-model)

(declare-fun d!110667 () Bool)

(assert (=> d!110667 (= (array_inv!19788 (_keys!10040 thiss!1181)) (bvsge (size!25649 (_keys!10040 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894604 d!110667))

(declare-fun d!110669 () Bool)

(assert (=> d!110669 (= (array_inv!19789 (_values!5329 thiss!1181)) (bvsge (size!25650 (_values!5329 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!894604 d!110669))

(declare-fun d!110671 () Bool)

(declare-fun res!605417 () Bool)

(declare-fun e!499746 () Bool)

(assert (=> d!110671 (=> (not res!605417) (not e!499746))))

(declare-fun simpleValid!301 (LongMapFixedSize!4260) Bool)

(assert (=> d!110671 (= res!605417 (simpleValid!301 thiss!1181))))

(assert (=> d!110671 (= (valid!1644 thiss!1181) e!499746)))

(declare-fun b!894638 () Bool)

(declare-fun res!605418 () Bool)

(assert (=> b!894638 (=> (not res!605418) (not e!499746))))

(declare-fun arrayCountValidKeys!0 (array!52406 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894638 (= res!605418 (= (arrayCountValidKeys!0 (_keys!10040 thiss!1181) #b00000000000000000000000000000000 (size!25649 (_keys!10040 thiss!1181))) (_size!2185 thiss!1181)))))

(declare-fun b!894639 () Bool)

(declare-fun res!605419 () Bool)

(assert (=> b!894639 (=> (not res!605419) (not e!499746))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52406 (_ BitVec 32)) Bool)

(assert (=> b!894639 (= res!605419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10040 thiss!1181) (mask!25905 thiss!1181)))))

(declare-fun b!894640 () Bool)

(declare-datatypes ((List!17808 0))(
  ( (Nil!17805) (Cons!17804 (h!18937 (_ BitVec 64)) (t!25147 List!17808)) )
))
(declare-fun arrayNoDuplicates!0 (array!52406 (_ BitVec 32) List!17808) Bool)

(assert (=> b!894640 (= e!499746 (arrayNoDuplicates!0 (_keys!10040 thiss!1181) #b00000000000000000000000000000000 Nil!17805))))

(assert (= (and d!110671 res!605417) b!894638))

(assert (= (and b!894638 res!605418) b!894639))

(assert (= (and b!894639 res!605419) b!894640))

(declare-fun m!832633 () Bool)

(assert (=> d!110671 m!832633))

(declare-fun m!832635 () Bool)

(assert (=> b!894638 m!832635))

(declare-fun m!832637 () Bool)

(assert (=> b!894639 m!832637))

(declare-fun m!832639 () Bool)

(assert (=> b!894640 m!832639))

(assert (=> start!76160 d!110671))

(declare-fun d!110673 () Bool)

(assert (=> d!110673 (= (validMask!0 (mask!25905 thiss!1181)) (and (or (= (mask!25905 thiss!1181) #b00000000000000000000000000000111) (= (mask!25905 thiss!1181) #b00000000000000000000000000001111) (= (mask!25905 thiss!1181) #b00000000000000000000000000011111) (= (mask!25905 thiss!1181) #b00000000000000000000000000111111) (= (mask!25905 thiss!1181) #b00000000000000000000000001111111) (= (mask!25905 thiss!1181) #b00000000000000000000000011111111) (= (mask!25905 thiss!1181) #b00000000000000000000000111111111) (= (mask!25905 thiss!1181) #b00000000000000000000001111111111) (= (mask!25905 thiss!1181) #b00000000000000000000011111111111) (= (mask!25905 thiss!1181) #b00000000000000000000111111111111) (= (mask!25905 thiss!1181) #b00000000000000000001111111111111) (= (mask!25905 thiss!1181) #b00000000000000000011111111111111) (= (mask!25905 thiss!1181) #b00000000000000000111111111111111) (= (mask!25905 thiss!1181) #b00000000000000001111111111111111) (= (mask!25905 thiss!1181) #b00000000000000011111111111111111) (= (mask!25905 thiss!1181) #b00000000000000111111111111111111) (= (mask!25905 thiss!1181) #b00000000000001111111111111111111) (= (mask!25905 thiss!1181) #b00000000000011111111111111111111) (= (mask!25905 thiss!1181) #b00000000000111111111111111111111) (= (mask!25905 thiss!1181) #b00000000001111111111111111111111) (= (mask!25905 thiss!1181) #b00000000011111111111111111111111) (= (mask!25905 thiss!1181) #b00000000111111111111111111111111) (= (mask!25905 thiss!1181) #b00000001111111111111111111111111) (= (mask!25905 thiss!1181) #b00000011111111111111111111111111) (= (mask!25905 thiss!1181) #b00000111111111111111111111111111) (= (mask!25905 thiss!1181) #b00001111111111111111111111111111) (= (mask!25905 thiss!1181) #b00011111111111111111111111111111) (= (mask!25905 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25905 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!894609 d!110673))

(declare-fun b!894654 () Bool)

(declare-fun e!499753 () SeekEntryResult!8869)

(declare-fun lt!404325 () SeekEntryResult!8869)

(assert (=> b!894654 (= e!499753 (Found!8869 (index!37849 lt!404325)))))

(declare-fun b!894655 () Bool)

(declare-fun e!499754 () SeekEntryResult!8869)

(assert (=> b!894655 (= e!499754 e!499753)))

(declare-fun lt!404323 () (_ BitVec 64))

(assert (=> b!894655 (= lt!404323 (select (arr!25203 (_keys!10040 thiss!1181)) (index!37849 lt!404325)))))

(declare-fun c!94418 () Bool)

(assert (=> b!894655 (= c!94418 (= lt!404323 key!785))))

(declare-fun b!894656 () Bool)

(declare-fun c!94417 () Bool)

(assert (=> b!894656 (= c!94417 (= lt!404323 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!499755 () SeekEntryResult!8869)

(assert (=> b!894656 (= e!499753 e!499755)))

(declare-fun b!894657 () Bool)

(declare-fun lt!404326 () SeekEntryResult!8869)

(assert (=> b!894657 (= e!499755 (ite ((_ is MissingVacant!8869) lt!404326) (MissingZero!8869 (index!37850 lt!404326)) lt!404326))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52406 (_ BitVec 32)) SeekEntryResult!8869)

(assert (=> b!894657 (= lt!404326 (seekKeyOrZeroReturnVacant!0 (x!76065 lt!404325) (index!37849 lt!404325) (index!37849 lt!404325) key!785 (_keys!10040 thiss!1181) (mask!25905 thiss!1181)))))

(declare-fun b!894658 () Bool)

(assert (=> b!894658 (= e!499755 (MissingZero!8869 (index!37849 lt!404325)))))

(declare-fun d!110675 () Bool)

(declare-fun lt!404324 () SeekEntryResult!8869)

(assert (=> d!110675 (and (or ((_ is MissingVacant!8869) lt!404324) (not ((_ is Found!8869) lt!404324)) (and (bvsge (index!37848 lt!404324) #b00000000000000000000000000000000) (bvslt (index!37848 lt!404324) (size!25649 (_keys!10040 thiss!1181))))) (not ((_ is MissingVacant!8869) lt!404324)) (or (not ((_ is Found!8869) lt!404324)) (= (select (arr!25203 (_keys!10040 thiss!1181)) (index!37848 lt!404324)) key!785)))))

(assert (=> d!110675 (= lt!404324 e!499754)))

(declare-fun c!94416 () Bool)

(assert (=> d!110675 (= c!94416 (and ((_ is Intermediate!8869) lt!404325) (undefined!9681 lt!404325)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52406 (_ BitVec 32)) SeekEntryResult!8869)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110675 (= lt!404325 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25905 thiss!1181)) key!785 (_keys!10040 thiss!1181) (mask!25905 thiss!1181)))))

(assert (=> d!110675 (validMask!0 (mask!25905 thiss!1181))))

(assert (=> d!110675 (= (seekEntry!0 key!785 (_keys!10040 thiss!1181) (mask!25905 thiss!1181)) lt!404324)))

(declare-fun b!894653 () Bool)

(assert (=> b!894653 (= e!499754 Undefined!8869)))

(assert (= (and d!110675 c!94416) b!894653))

(assert (= (and d!110675 (not c!94416)) b!894655))

(assert (= (and b!894655 c!94418) b!894654))

(assert (= (and b!894655 (not c!94418)) b!894656))

(assert (= (and b!894656 c!94417) b!894658))

(assert (= (and b!894656 (not c!94417)) b!894657))

(declare-fun m!832641 () Bool)

(assert (=> b!894655 m!832641))

(declare-fun m!832643 () Bool)

(assert (=> b!894657 m!832643))

(declare-fun m!832645 () Bool)

(assert (=> d!110675 m!832645))

(declare-fun m!832647 () Bool)

(assert (=> d!110675 m!832647))

(assert (=> d!110675 m!832647))

(declare-fun m!832649 () Bool)

(assert (=> d!110675 m!832649))

(assert (=> d!110675 m!832617))

(assert (=> b!894609 d!110675))

(declare-fun b!894666 () Bool)

(declare-fun e!499760 () Bool)

(assert (=> b!894666 (= e!499760 tp_is_empty!18207)))

(declare-fun mapIsEmpty!28893 () Bool)

(declare-fun mapRes!28893 () Bool)

(assert (=> mapIsEmpty!28893 mapRes!28893))

(declare-fun b!894665 () Bool)

(declare-fun e!499761 () Bool)

(assert (=> b!894665 (= e!499761 tp_is_empty!18207)))

(declare-fun mapNonEmpty!28893 () Bool)

(declare-fun tp!55637 () Bool)

(assert (=> mapNonEmpty!28893 (= mapRes!28893 (and tp!55637 e!499761))))

(declare-fun mapKey!28893 () (_ BitVec 32))

(declare-fun mapValue!28893 () ValueCell!8622)

(declare-fun mapRest!28893 () (Array (_ BitVec 32) ValueCell!8622))

(assert (=> mapNonEmpty!28893 (= mapRest!28887 (store mapRest!28893 mapKey!28893 mapValue!28893))))

(declare-fun condMapEmpty!28893 () Bool)

(declare-fun mapDefault!28893 () ValueCell!8622)

(assert (=> mapNonEmpty!28887 (= condMapEmpty!28893 (= mapRest!28887 ((as const (Array (_ BitVec 32) ValueCell!8622)) mapDefault!28893)))))

(assert (=> mapNonEmpty!28887 (= tp!55627 (and e!499760 mapRes!28893))))

(assert (= (and mapNonEmpty!28887 condMapEmpty!28893) mapIsEmpty!28893))

(assert (= (and mapNonEmpty!28887 (not condMapEmpty!28893)) mapNonEmpty!28893))

(assert (= (and mapNonEmpty!28893 ((_ is ValueCellFull!8622) mapValue!28893)) b!894665))

(assert (= (and mapNonEmpty!28887 ((_ is ValueCellFull!8622) mapDefault!28893)) b!894666))

(declare-fun m!832651 () Bool)

(assert (=> mapNonEmpty!28893 m!832651))

(check-sat (not b!894638) (not b!894657) (not b!894639) (not d!110675) b_and!26171 tp_is_empty!18207 (not mapNonEmpty!28893) (not b_next!15879) (not d!110671) (not b!894640))
(check-sat b_and!26171 (not b_next!15879))
(get-model)

(declare-fun b!894676 () Bool)

(declare-fun res!605430 () Bool)

(declare-fun e!499764 () Bool)

(assert (=> b!894676 (=> (not res!605430) (not e!499764))))

(declare-fun size!25653 (LongMapFixedSize!4260) (_ BitVec 32))

(assert (=> b!894676 (= res!605430 (bvsge (size!25653 thiss!1181) (_size!2185 thiss!1181)))))

(declare-fun b!894678 () Bool)

(assert (=> b!894678 (= e!499764 (and (bvsge (extraKeys!5038 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5038 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2185 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun d!110677 () Bool)

(declare-fun res!605429 () Bool)

(assert (=> d!110677 (=> (not res!605429) (not e!499764))))

(assert (=> d!110677 (= res!605429 (validMask!0 (mask!25905 thiss!1181)))))

(assert (=> d!110677 (= (simpleValid!301 thiss!1181) e!499764)))

(declare-fun b!894675 () Bool)

(declare-fun res!605428 () Bool)

(assert (=> b!894675 (=> (not res!605428) (not e!499764))))

(assert (=> b!894675 (= res!605428 (and (= (size!25650 (_values!5329 thiss!1181)) (bvadd (mask!25905 thiss!1181) #b00000000000000000000000000000001)) (= (size!25649 (_keys!10040 thiss!1181)) (size!25650 (_values!5329 thiss!1181))) (bvsge (_size!2185 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2185 thiss!1181) (bvadd (mask!25905 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun b!894677 () Bool)

(declare-fun res!605431 () Bool)

(assert (=> b!894677 (=> (not res!605431) (not e!499764))))

(assert (=> b!894677 (= res!605431 (= (size!25653 thiss!1181) (bvadd (_size!2185 thiss!1181) (bvsdiv (bvadd (extraKeys!5038 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(assert (= (and d!110677 res!605429) b!894675))

(assert (= (and b!894675 res!605428) b!894676))

(assert (= (and b!894676 res!605430) b!894677))

(assert (= (and b!894677 res!605431) b!894678))

(declare-fun m!832653 () Bool)

(assert (=> b!894676 m!832653))

(assert (=> d!110677 m!832617))

(assert (=> b!894677 m!832653))

(assert (=> d!110671 d!110677))

(declare-fun b!894687 () Bool)

(declare-fun e!499769 () (_ BitVec 32))

(assert (=> b!894687 (= e!499769 #b00000000000000000000000000000000)))

(declare-fun b!894688 () Bool)

(declare-fun e!499770 () (_ BitVec 32))

(declare-fun call!39721 () (_ BitVec 32))

(assert (=> b!894688 (= e!499770 (bvadd #b00000000000000000000000000000001 call!39721))))

(declare-fun b!894689 () Bool)

(assert (=> b!894689 (= e!499770 call!39721)))

(declare-fun bm!39718 () Bool)

(assert (=> bm!39718 (= call!39721 (arrayCountValidKeys!0 (_keys!10040 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25649 (_keys!10040 thiss!1181))))))

(declare-fun d!110679 () Bool)

(declare-fun lt!404329 () (_ BitVec 32))

(assert (=> d!110679 (and (bvsge lt!404329 #b00000000000000000000000000000000) (bvsle lt!404329 (bvsub (size!25649 (_keys!10040 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!110679 (= lt!404329 e!499769)))

(declare-fun c!94423 () Bool)

(assert (=> d!110679 (= c!94423 (bvsge #b00000000000000000000000000000000 (size!25649 (_keys!10040 thiss!1181))))))

(assert (=> d!110679 (and (bvsle #b00000000000000000000000000000000 (size!25649 (_keys!10040 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25649 (_keys!10040 thiss!1181)) (size!25649 (_keys!10040 thiss!1181))))))

(assert (=> d!110679 (= (arrayCountValidKeys!0 (_keys!10040 thiss!1181) #b00000000000000000000000000000000 (size!25649 (_keys!10040 thiss!1181))) lt!404329)))

(declare-fun b!894690 () Bool)

(assert (=> b!894690 (= e!499769 e!499770)))

(declare-fun c!94424 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!894690 (= c!94424 (validKeyInArray!0 (select (arr!25203 (_keys!10040 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!110679 c!94423) b!894687))

(assert (= (and d!110679 (not c!94423)) b!894690))

(assert (= (and b!894690 c!94424) b!894688))

(assert (= (and b!894690 (not c!94424)) b!894689))

(assert (= (or b!894688 b!894689) bm!39718))

(declare-fun m!832655 () Bool)

(assert (=> bm!39718 m!832655))

(declare-fun m!832657 () Bool)

(assert (=> b!894690 m!832657))

(assert (=> b!894690 m!832657))

(declare-fun m!832659 () Bool)

(assert (=> b!894690 m!832659))

(assert (=> b!894638 d!110679))

(declare-fun lt!404334 () SeekEntryResult!8869)

(declare-fun d!110681 () Bool)

(assert (=> d!110681 (and (or ((_ is Undefined!8869) lt!404334) (not ((_ is Found!8869) lt!404334)) (and (bvsge (index!37848 lt!404334) #b00000000000000000000000000000000) (bvslt (index!37848 lt!404334) (size!25649 (_keys!10040 thiss!1181))))) (or ((_ is Undefined!8869) lt!404334) ((_ is Found!8869) lt!404334) (not ((_ is MissingVacant!8869) lt!404334)) (not (= (index!37850 lt!404334) (index!37849 lt!404325))) (and (bvsge (index!37850 lt!404334) #b00000000000000000000000000000000) (bvslt (index!37850 lt!404334) (size!25649 (_keys!10040 thiss!1181))))) (or ((_ is Undefined!8869) lt!404334) (ite ((_ is Found!8869) lt!404334) (= (select (arr!25203 (_keys!10040 thiss!1181)) (index!37848 lt!404334)) key!785) (and ((_ is MissingVacant!8869) lt!404334) (= (index!37850 lt!404334) (index!37849 lt!404325)) (= (select (arr!25203 (_keys!10040 thiss!1181)) (index!37850 lt!404334)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!499777 () SeekEntryResult!8869)

(assert (=> d!110681 (= lt!404334 e!499777)))

(declare-fun c!94432 () Bool)

(assert (=> d!110681 (= c!94432 (bvsge (x!76065 lt!404325) #b01111111111111111111111111111110))))

(declare-fun lt!404335 () (_ BitVec 64))

(assert (=> d!110681 (= lt!404335 (select (arr!25203 (_keys!10040 thiss!1181)) (index!37849 lt!404325)))))

(assert (=> d!110681 (validMask!0 (mask!25905 thiss!1181))))

(assert (=> d!110681 (= (seekKeyOrZeroReturnVacant!0 (x!76065 lt!404325) (index!37849 lt!404325) (index!37849 lt!404325) key!785 (_keys!10040 thiss!1181) (mask!25905 thiss!1181)) lt!404334)))

(declare-fun e!499779 () SeekEntryResult!8869)

(declare-fun b!894703 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!894703 (= e!499779 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76065 lt!404325) #b00000000000000000000000000000001) (nextIndex!0 (index!37849 lt!404325) (x!76065 lt!404325) (mask!25905 thiss!1181)) (index!37849 lt!404325) key!785 (_keys!10040 thiss!1181) (mask!25905 thiss!1181)))))

(declare-fun b!894704 () Bool)

(assert (=> b!894704 (= e!499777 Undefined!8869)))

(declare-fun b!894705 () Bool)

(declare-fun e!499778 () SeekEntryResult!8869)

(assert (=> b!894705 (= e!499777 e!499778)))

(declare-fun c!94433 () Bool)

(assert (=> b!894705 (= c!94433 (= lt!404335 key!785))))

(declare-fun b!894706 () Bool)

(assert (=> b!894706 (= e!499778 (Found!8869 (index!37849 lt!404325)))))

(declare-fun b!894707 () Bool)

(declare-fun c!94431 () Bool)

(assert (=> b!894707 (= c!94431 (= lt!404335 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894707 (= e!499778 e!499779)))

(declare-fun b!894708 () Bool)

(assert (=> b!894708 (= e!499779 (MissingVacant!8869 (index!37849 lt!404325)))))

(assert (= (and d!110681 c!94432) b!894704))

(assert (= (and d!110681 (not c!94432)) b!894705))

(assert (= (and b!894705 c!94433) b!894706))

(assert (= (and b!894705 (not c!94433)) b!894707))

(assert (= (and b!894707 c!94431) b!894708))

(assert (= (and b!894707 (not c!94431)) b!894703))

(declare-fun m!832661 () Bool)

(assert (=> d!110681 m!832661))

(declare-fun m!832663 () Bool)

(assert (=> d!110681 m!832663))

(assert (=> d!110681 m!832641))

(assert (=> d!110681 m!832617))

(declare-fun m!832665 () Bool)

(assert (=> b!894703 m!832665))

(assert (=> b!894703 m!832665))

(declare-fun m!832667 () Bool)

(assert (=> b!894703 m!832667))

(assert (=> b!894657 d!110681))

(declare-fun b!894717 () Bool)

(declare-fun e!499788 () Bool)

(declare-fun call!39724 () Bool)

(assert (=> b!894717 (= e!499788 call!39724)))

(declare-fun b!894718 () Bool)

(declare-fun e!499786 () Bool)

(assert (=> b!894718 (= e!499786 call!39724)))

(declare-fun bm!39721 () Bool)

(assert (=> bm!39721 (= call!39724 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10040 thiss!1181) (mask!25905 thiss!1181)))))

(declare-fun d!110683 () Bool)

(declare-fun res!605437 () Bool)

(declare-fun e!499787 () Bool)

(assert (=> d!110683 (=> res!605437 e!499787)))

(assert (=> d!110683 (= res!605437 (bvsge #b00000000000000000000000000000000 (size!25649 (_keys!10040 thiss!1181))))))

(assert (=> d!110683 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10040 thiss!1181) (mask!25905 thiss!1181)) e!499787)))

(declare-fun b!894719 () Bool)

(assert (=> b!894719 (= e!499787 e!499786)))

(declare-fun c!94436 () Bool)

(assert (=> b!894719 (= c!94436 (validKeyInArray!0 (select (arr!25203 (_keys!10040 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894720 () Bool)

(assert (=> b!894720 (= e!499786 e!499788)))

(declare-fun lt!404342 () (_ BitVec 64))

(assert (=> b!894720 (= lt!404342 (select (arr!25203 (_keys!10040 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30454 0))(
  ( (Unit!30455) )
))
(declare-fun lt!404344 () Unit!30454)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52406 (_ BitVec 64) (_ BitVec 32)) Unit!30454)

(assert (=> b!894720 (= lt!404344 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10040 thiss!1181) lt!404342 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52406 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!894720 (arrayContainsKey!0 (_keys!10040 thiss!1181) lt!404342 #b00000000000000000000000000000000)))

(declare-fun lt!404343 () Unit!30454)

(assert (=> b!894720 (= lt!404343 lt!404344)))

(declare-fun res!605436 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52406 (_ BitVec 32)) SeekEntryResult!8869)

(assert (=> b!894720 (= res!605436 (= (seekEntryOrOpen!0 (select (arr!25203 (_keys!10040 thiss!1181)) #b00000000000000000000000000000000) (_keys!10040 thiss!1181) (mask!25905 thiss!1181)) (Found!8869 #b00000000000000000000000000000000)))))

(assert (=> b!894720 (=> (not res!605436) (not e!499788))))

(assert (= (and d!110683 (not res!605437)) b!894719))

(assert (= (and b!894719 c!94436) b!894720))

(assert (= (and b!894719 (not c!94436)) b!894718))

(assert (= (and b!894720 res!605436) b!894717))

(assert (= (or b!894717 b!894718) bm!39721))

(declare-fun m!832669 () Bool)

(assert (=> bm!39721 m!832669))

(assert (=> b!894719 m!832657))

(assert (=> b!894719 m!832657))

(assert (=> b!894719 m!832659))

(assert (=> b!894720 m!832657))

(declare-fun m!832671 () Bool)

(assert (=> b!894720 m!832671))

(declare-fun m!832673 () Bool)

(assert (=> b!894720 m!832673))

(assert (=> b!894720 m!832657))

(declare-fun m!832675 () Bool)

(assert (=> b!894720 m!832675))

(assert (=> b!894639 d!110683))

(declare-fun b!894739 () Bool)

(declare-fun e!499799 () SeekEntryResult!8869)

(assert (=> b!894739 (= e!499799 (Intermediate!8869 true (toIndex!0 key!785 (mask!25905 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!894740 () Bool)

(declare-fun e!499803 () SeekEntryResult!8869)

(assert (=> b!894740 (= e!499799 e!499803)))

(declare-fun c!94444 () Bool)

(declare-fun lt!404350 () (_ BitVec 64))

(assert (=> b!894740 (= c!94444 (or (= lt!404350 key!785) (= (bvadd lt!404350 lt!404350) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!894741 () Bool)

(declare-fun lt!404349 () SeekEntryResult!8869)

(assert (=> b!894741 (and (bvsge (index!37849 lt!404349) #b00000000000000000000000000000000) (bvslt (index!37849 lt!404349) (size!25649 (_keys!10040 thiss!1181))))))

(declare-fun res!605445 () Bool)

(assert (=> b!894741 (= res!605445 (= (select (arr!25203 (_keys!10040 thiss!1181)) (index!37849 lt!404349)) key!785))))

(declare-fun e!499801 () Bool)

(assert (=> b!894741 (=> res!605445 e!499801)))

(declare-fun e!499802 () Bool)

(assert (=> b!894741 (= e!499802 e!499801)))

(declare-fun b!894742 () Bool)

(declare-fun e!499800 () Bool)

(assert (=> b!894742 (= e!499800 e!499802)))

(declare-fun res!605446 () Bool)

(assert (=> b!894742 (= res!605446 (and ((_ is Intermediate!8869) lt!404349) (not (undefined!9681 lt!404349)) (bvslt (x!76065 lt!404349) #b01111111111111111111111111111110) (bvsge (x!76065 lt!404349) #b00000000000000000000000000000000) (bvsge (x!76065 lt!404349) #b00000000000000000000000000000000)))))

(assert (=> b!894742 (=> (not res!605446) (not e!499802))))

(declare-fun b!894743 () Bool)

(assert (=> b!894743 (= e!499803 (Intermediate!8869 false (toIndex!0 key!785 (mask!25905 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun d!110685 () Bool)

(assert (=> d!110685 e!499800))

(declare-fun c!94445 () Bool)

(assert (=> d!110685 (= c!94445 (and ((_ is Intermediate!8869) lt!404349) (undefined!9681 lt!404349)))))

(assert (=> d!110685 (= lt!404349 e!499799)))

(declare-fun c!94443 () Bool)

(assert (=> d!110685 (= c!94443 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!110685 (= lt!404350 (select (arr!25203 (_keys!10040 thiss!1181)) (toIndex!0 key!785 (mask!25905 thiss!1181))))))

(assert (=> d!110685 (validMask!0 (mask!25905 thiss!1181))))

(assert (=> d!110685 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25905 thiss!1181)) key!785 (_keys!10040 thiss!1181) (mask!25905 thiss!1181)) lt!404349)))

(declare-fun b!894744 () Bool)

(assert (=> b!894744 (= e!499800 (bvsge (x!76065 lt!404349) #b01111111111111111111111111111110))))

(declare-fun b!894745 () Bool)

(assert (=> b!894745 (= e!499803 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25905 thiss!1181)) #b00000000000000000000000000000000 (mask!25905 thiss!1181)) key!785 (_keys!10040 thiss!1181) (mask!25905 thiss!1181)))))

(declare-fun b!894746 () Bool)

(assert (=> b!894746 (and (bvsge (index!37849 lt!404349) #b00000000000000000000000000000000) (bvslt (index!37849 lt!404349) (size!25649 (_keys!10040 thiss!1181))))))

(assert (=> b!894746 (= e!499801 (= (select (arr!25203 (_keys!10040 thiss!1181)) (index!37849 lt!404349)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!894747 () Bool)

(assert (=> b!894747 (and (bvsge (index!37849 lt!404349) #b00000000000000000000000000000000) (bvslt (index!37849 lt!404349) (size!25649 (_keys!10040 thiss!1181))))))

(declare-fun res!605444 () Bool)

(assert (=> b!894747 (= res!605444 (= (select (arr!25203 (_keys!10040 thiss!1181)) (index!37849 lt!404349)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!894747 (=> res!605444 e!499801)))

(assert (= (and d!110685 c!94443) b!894739))

(assert (= (and d!110685 (not c!94443)) b!894740))

(assert (= (and b!894740 c!94444) b!894743))

(assert (= (and b!894740 (not c!94444)) b!894745))

(assert (= (and d!110685 c!94445) b!894744))

(assert (= (and d!110685 (not c!94445)) b!894742))

(assert (= (and b!894742 res!605446) b!894741))

(assert (= (and b!894741 (not res!605445)) b!894747))

(assert (= (and b!894747 (not res!605444)) b!894746))

(declare-fun m!832677 () Bool)

(assert (=> b!894747 m!832677))

(assert (=> d!110685 m!832647))

(declare-fun m!832679 () Bool)

(assert (=> d!110685 m!832679))

(assert (=> d!110685 m!832617))

(assert (=> b!894746 m!832677))

(assert (=> b!894745 m!832647))

(declare-fun m!832681 () Bool)

(assert (=> b!894745 m!832681))

(assert (=> b!894745 m!832681))

(declare-fun m!832683 () Bool)

(assert (=> b!894745 m!832683))

(assert (=> b!894741 m!832677))

(assert (=> d!110675 d!110685))

(declare-fun d!110687 () Bool)

(declare-fun lt!404356 () (_ BitVec 32))

(declare-fun lt!404355 () (_ BitVec 32))

(assert (=> d!110687 (= lt!404356 (bvmul (bvxor lt!404355 (bvlshr lt!404355 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!110687 (= lt!404355 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!110687 (and (bvsge (mask!25905 thiss!1181) #b00000000000000000000000000000000) (let ((res!605447 (let ((h!18938 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76082 (bvmul (bvxor h!18938 (bvlshr h!18938 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76082 (bvlshr x!76082 #b00000000000000000000000000001101)) (mask!25905 thiss!1181)))))) (and (bvslt res!605447 (bvadd (mask!25905 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605447 #b00000000000000000000000000000000))))))

(assert (=> d!110687 (= (toIndex!0 key!785 (mask!25905 thiss!1181)) (bvand (bvxor lt!404356 (bvlshr lt!404356 #b00000000000000000000000000001101)) (mask!25905 thiss!1181)))))

(assert (=> d!110675 d!110687))

(assert (=> d!110675 d!110673))

(declare-fun b!894759 () Bool)

(declare-fun e!499814 () Bool)

(declare-fun contains!4394 (List!17808 (_ BitVec 64)) Bool)

(assert (=> b!894759 (= e!499814 (contains!4394 Nil!17805 (select (arr!25203 (_keys!10040 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894760 () Bool)

(declare-fun e!499815 () Bool)

(declare-fun call!39727 () Bool)

(assert (=> b!894760 (= e!499815 call!39727)))

(declare-fun b!894761 () Bool)

(declare-fun e!499812 () Bool)

(assert (=> b!894761 (= e!499812 e!499815)))

(declare-fun c!94448 () Bool)

(assert (=> b!894761 (= c!94448 (validKeyInArray!0 (select (arr!25203 (_keys!10040 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39724 () Bool)

(assert (=> bm!39724 (= call!39727 (arrayNoDuplicates!0 (_keys!10040 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94448 (Cons!17804 (select (arr!25203 (_keys!10040 thiss!1181)) #b00000000000000000000000000000000) Nil!17805) Nil!17805)))))

(declare-fun b!894762 () Bool)

(declare-fun e!499813 () Bool)

(assert (=> b!894762 (= e!499813 e!499812)))

(declare-fun res!605455 () Bool)

(assert (=> b!894762 (=> (not res!605455) (not e!499812))))

(assert (=> b!894762 (= res!605455 (not e!499814))))

(declare-fun res!605456 () Bool)

(assert (=> b!894762 (=> (not res!605456) (not e!499814))))

(assert (=> b!894762 (= res!605456 (validKeyInArray!0 (select (arr!25203 (_keys!10040 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!894758 () Bool)

(assert (=> b!894758 (= e!499815 call!39727)))

(declare-fun d!110689 () Bool)

(declare-fun res!605454 () Bool)

(assert (=> d!110689 (=> res!605454 e!499813)))

(assert (=> d!110689 (= res!605454 (bvsge #b00000000000000000000000000000000 (size!25649 (_keys!10040 thiss!1181))))))

(assert (=> d!110689 (= (arrayNoDuplicates!0 (_keys!10040 thiss!1181) #b00000000000000000000000000000000 Nil!17805) e!499813)))

(assert (= (and d!110689 (not res!605454)) b!894762))

(assert (= (and b!894762 res!605456) b!894759))

(assert (= (and b!894762 res!605455) b!894761))

(assert (= (and b!894761 c!94448) b!894760))

(assert (= (and b!894761 (not c!94448)) b!894758))

(assert (= (or b!894760 b!894758) bm!39724))

(assert (=> b!894759 m!832657))

(assert (=> b!894759 m!832657))

(declare-fun m!832685 () Bool)

(assert (=> b!894759 m!832685))

(assert (=> b!894761 m!832657))

(assert (=> b!894761 m!832657))

(assert (=> b!894761 m!832659))

(assert (=> bm!39724 m!832657))

(declare-fun m!832687 () Bool)

(assert (=> bm!39724 m!832687))

(assert (=> b!894762 m!832657))

(assert (=> b!894762 m!832657))

(assert (=> b!894762 m!832659))

(assert (=> b!894640 d!110689))

(declare-fun b!894764 () Bool)

(declare-fun e!499816 () Bool)

(assert (=> b!894764 (= e!499816 tp_is_empty!18207)))

(declare-fun mapIsEmpty!28894 () Bool)

(declare-fun mapRes!28894 () Bool)

(assert (=> mapIsEmpty!28894 mapRes!28894))

(declare-fun b!894763 () Bool)

(declare-fun e!499817 () Bool)

(assert (=> b!894763 (= e!499817 tp_is_empty!18207)))

(declare-fun mapNonEmpty!28894 () Bool)

(declare-fun tp!55638 () Bool)

(assert (=> mapNonEmpty!28894 (= mapRes!28894 (and tp!55638 e!499817))))

(declare-fun mapRest!28894 () (Array (_ BitVec 32) ValueCell!8622))

(declare-fun mapKey!28894 () (_ BitVec 32))

(declare-fun mapValue!28894 () ValueCell!8622)

(assert (=> mapNonEmpty!28894 (= mapRest!28893 (store mapRest!28894 mapKey!28894 mapValue!28894))))

(declare-fun condMapEmpty!28894 () Bool)

(declare-fun mapDefault!28894 () ValueCell!8622)

(assert (=> mapNonEmpty!28893 (= condMapEmpty!28894 (= mapRest!28893 ((as const (Array (_ BitVec 32) ValueCell!8622)) mapDefault!28894)))))

(assert (=> mapNonEmpty!28893 (= tp!55637 (and e!499816 mapRes!28894))))

(assert (= (and mapNonEmpty!28893 condMapEmpty!28894) mapIsEmpty!28894))

(assert (= (and mapNonEmpty!28893 (not condMapEmpty!28894)) mapNonEmpty!28894))

(assert (= (and mapNonEmpty!28894 ((_ is ValueCellFull!8622) mapValue!28894)) b!894763))

(assert (= (and mapNonEmpty!28893 ((_ is ValueCellFull!8622) mapDefault!28894)) b!894764))

(declare-fun m!832689 () Bool)

(assert (=> mapNonEmpty!28894 m!832689))

(check-sat (not b!894676) (not bm!39724) (not b!894690) (not d!110681) (not b!894762) (not bm!39721) (not b!894759) (not d!110685) (not b!894677) (not b!894719) (not b!894720) (not bm!39718) (not b_next!15879) (not d!110677) (not b!894745) b_and!26171 (not mapNonEmpty!28894) tp_is_empty!18207 (not b!894703) (not b!894761))
(check-sat b_and!26171 (not b_next!15879))
