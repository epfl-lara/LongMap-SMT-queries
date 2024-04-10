; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107982 () Bool)

(assert start!107982)

(declare-fun mapNonEmpty!51425 () Bool)

(declare-fun mapRes!51425 () Bool)

(declare-fun tp!98183 () Bool)

(declare-fun e!728224 () Bool)

(assert (=> mapNonEmpty!51425 (= mapRes!51425 (and tp!98183 e!728224))))

(declare-datatypes ((V!49459 0))(
  ( (V!49460 (val!16708 Int)) )
))
(declare-datatypes ((ValueCell!15735 0))(
  ( (ValueCellFull!15735 (v!19304 V!49459)) (EmptyCell!15735) )
))
(declare-fun mapValue!51425 () ValueCell!15735)

(declare-fun mapKey!51425 () (_ BitVec 32))

(declare-fun mapRest!51425 () (Array (_ BitVec 32) ValueCell!15735))

(declare-datatypes ((array!83640 0))(
  ( (array!83641 (arr!40333 (Array (_ BitVec 32) ValueCell!15735)) (size!40883 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83640)

(assert (=> mapNonEmpty!51425 (= (arr!40333 _values!1187) (store mapRest!51425 mapKey!51425 mapValue!51425))))

(declare-fun b!1275594 () Bool)

(declare-fun e!728226 () Bool)

(declare-fun e!728222 () Bool)

(assert (=> b!1275594 (= e!728226 (and e!728222 mapRes!51425))))

(declare-fun condMapEmpty!51425 () Bool)

(declare-fun mapDefault!51425 () ValueCell!15735)

(assert (=> b!1275594 (= condMapEmpty!51425 (= (arr!40333 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15735)) mapDefault!51425)))))

(declare-fun res!847833 () Bool)

(declare-fun e!728223 () Bool)

(assert (=> start!107982 (=> (not res!847833) (not e!728223))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107982 (= res!847833 (validMask!0 mask!1805))))

(assert (=> start!107982 e!728223))

(assert (=> start!107982 true))

(declare-fun array_inv!30659 (array!83640) Bool)

(assert (=> start!107982 (and (array_inv!30659 _values!1187) e!728226)))

(declare-datatypes ((array!83642 0))(
  ( (array!83643 (arr!40334 (Array (_ BitVec 32) (_ BitVec 64))) (size!40884 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83642)

(declare-fun array_inv!30660 (array!83642) Bool)

(assert (=> start!107982 (array_inv!30660 _keys!1427)))

(declare-fun b!1275595 () Bool)

(declare-fun e!728225 () Bool)

(assert (=> b!1275595 (= e!728223 e!728225)))

(declare-fun res!847835 () Bool)

(assert (=> b!1275595 (=> res!847835 e!728225)))

(declare-datatypes ((List!28620 0))(
  ( (Nil!28617) (Cons!28616 (h!29825 (_ BitVec 64)) (t!42156 List!28620)) )
))
(declare-fun contains!7683 (List!28620 (_ BitVec 64)) Bool)

(assert (=> b!1275595 (= res!847835 (contains!7683 Nil!28617 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1275596 () Bool)

(declare-fun res!847837 () Bool)

(assert (=> b!1275596 (=> (not res!847837) (not e!728223))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83642 (_ BitVec 32)) Bool)

(assert (=> b!1275596 (= res!847837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1275597 () Bool)

(declare-fun tp_is_empty!33267 () Bool)

(assert (=> b!1275597 (= e!728222 tp_is_empty!33267)))

(declare-fun b!1275598 () Bool)

(assert (=> b!1275598 (= e!728224 tp_is_empty!33267)))

(declare-fun mapIsEmpty!51425 () Bool)

(assert (=> mapIsEmpty!51425 mapRes!51425))

(declare-fun b!1275599 () Bool)

(declare-fun res!847832 () Bool)

(assert (=> b!1275599 (=> (not res!847832) (not e!728223))))

(assert (=> b!1275599 (= res!847832 (and (bvsle #b00000000000000000000000000000000 (size!40884 _keys!1427)) (bvslt (size!40884 _keys!1427) #b01111111111111111111111111111111)))))

(declare-fun b!1275600 () Bool)

(assert (=> b!1275600 (= e!728225 (contains!7683 Nil!28617 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1275601 () Bool)

(declare-fun res!847836 () Bool)

(assert (=> b!1275601 (=> (not res!847836) (not e!728223))))

(declare-fun noDuplicate!2051 (List!28620) Bool)

(assert (=> b!1275601 (= res!847836 (noDuplicate!2051 Nil!28617))))

(declare-fun b!1275602 () Bool)

(declare-fun res!847834 () Bool)

(assert (=> b!1275602 (=> (not res!847834) (not e!728223))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(assert (=> b!1275602 (= res!847834 (and (= (size!40883 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40884 _keys!1427) (size!40883 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(assert (= (and start!107982 res!847833) b!1275602))

(assert (= (and b!1275602 res!847834) b!1275596))

(assert (= (and b!1275596 res!847837) b!1275599))

(assert (= (and b!1275599 res!847832) b!1275601))

(assert (= (and b!1275601 res!847836) b!1275595))

(assert (= (and b!1275595 (not res!847835)) b!1275600))

(assert (= (and b!1275594 condMapEmpty!51425) mapIsEmpty!51425))

(assert (= (and b!1275594 (not condMapEmpty!51425)) mapNonEmpty!51425))

(get-info :version)

(assert (= (and mapNonEmpty!51425 ((_ is ValueCellFull!15735) mapValue!51425)) b!1275598))

(assert (= (and b!1275594 ((_ is ValueCellFull!15735) mapDefault!51425)) b!1275597))

(assert (= start!107982 b!1275594))

(declare-fun m!1171775 () Bool)

(assert (=> b!1275596 m!1171775))

(declare-fun m!1171777 () Bool)

(assert (=> b!1275601 m!1171777))

(declare-fun m!1171779 () Bool)

(assert (=> start!107982 m!1171779))

(declare-fun m!1171781 () Bool)

(assert (=> start!107982 m!1171781))

(declare-fun m!1171783 () Bool)

(assert (=> start!107982 m!1171783))

(declare-fun m!1171785 () Bool)

(assert (=> b!1275595 m!1171785))

(declare-fun m!1171787 () Bool)

(assert (=> mapNonEmpty!51425 m!1171787))

(declare-fun m!1171789 () Bool)

(assert (=> b!1275600 m!1171789))

(check-sat (not b!1275596) (not b!1275601) tp_is_empty!33267 (not b!1275600) (not mapNonEmpty!51425) (not b!1275595) (not start!107982))
(check-sat)
(get-model)

(declare-fun d!140379 () Bool)

(declare-fun res!847860 () Bool)

(declare-fun e!728250 () Bool)

(assert (=> d!140379 (=> res!847860 e!728250)))

(assert (=> d!140379 (= res!847860 ((_ is Nil!28617) Nil!28617))))

(assert (=> d!140379 (= (noDuplicate!2051 Nil!28617) e!728250)))

(declare-fun b!1275634 () Bool)

(declare-fun e!728251 () Bool)

(assert (=> b!1275634 (= e!728250 e!728251)))

(declare-fun res!847861 () Bool)

(assert (=> b!1275634 (=> (not res!847861) (not e!728251))))

(assert (=> b!1275634 (= res!847861 (not (contains!7683 (t!42156 Nil!28617) (h!29825 Nil!28617))))))

(declare-fun b!1275635 () Bool)

(assert (=> b!1275635 (= e!728251 (noDuplicate!2051 (t!42156 Nil!28617)))))

(assert (= (and d!140379 (not res!847860)) b!1275634))

(assert (= (and b!1275634 res!847861) b!1275635))

(declare-fun m!1171807 () Bool)

(assert (=> b!1275634 m!1171807))

(declare-fun m!1171809 () Bool)

(assert (=> b!1275635 m!1171809))

(assert (=> b!1275601 d!140379))

(declare-fun d!140381 () Bool)

(assert (=> d!140381 (= (validMask!0 mask!1805) (and (or (= mask!1805 #b00000000000000000000000000000111) (= mask!1805 #b00000000000000000000000000001111) (= mask!1805 #b00000000000000000000000000011111) (= mask!1805 #b00000000000000000000000000111111) (= mask!1805 #b00000000000000000000000001111111) (= mask!1805 #b00000000000000000000000011111111) (= mask!1805 #b00000000000000000000000111111111) (= mask!1805 #b00000000000000000000001111111111) (= mask!1805 #b00000000000000000000011111111111) (= mask!1805 #b00000000000000000000111111111111) (= mask!1805 #b00000000000000000001111111111111) (= mask!1805 #b00000000000000000011111111111111) (= mask!1805 #b00000000000000000111111111111111) (= mask!1805 #b00000000000000001111111111111111) (= mask!1805 #b00000000000000011111111111111111) (= mask!1805 #b00000000000000111111111111111111) (= mask!1805 #b00000000000001111111111111111111) (= mask!1805 #b00000000000011111111111111111111) (= mask!1805 #b00000000000111111111111111111111) (= mask!1805 #b00000000001111111111111111111111) (= mask!1805 #b00000000011111111111111111111111) (= mask!1805 #b00000000111111111111111111111111) (= mask!1805 #b00000001111111111111111111111111) (= mask!1805 #b00000011111111111111111111111111) (= mask!1805 #b00000111111111111111111111111111) (= mask!1805 #b00001111111111111111111111111111) (= mask!1805 #b00011111111111111111111111111111) (= mask!1805 #b00111111111111111111111111111111)) (bvsle mask!1805 #b00111111111111111111111111111111)))))

(assert (=> start!107982 d!140381))

(declare-fun d!140383 () Bool)

(assert (=> d!140383 (= (array_inv!30659 _values!1187) (bvsge (size!40883 _values!1187) #b00000000000000000000000000000000))))

(assert (=> start!107982 d!140383))

(declare-fun d!140385 () Bool)

(assert (=> d!140385 (= (array_inv!30660 _keys!1427) (bvsge (size!40884 _keys!1427) #b00000000000000000000000000000000))))

(assert (=> start!107982 d!140385))

(declare-fun b!1275644 () Bool)

(declare-fun e!728259 () Bool)

(declare-fun call!62644 () Bool)

(assert (=> b!1275644 (= e!728259 call!62644)))

(declare-fun b!1275645 () Bool)

(declare-fun e!728260 () Bool)

(assert (=> b!1275645 (= e!728260 e!728259)))

(declare-fun lt!575365 () (_ BitVec 64))

(assert (=> b!1275645 (= lt!575365 (select (arr!40334 _keys!1427) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!42357 0))(
  ( (Unit!42358) )
))
(declare-fun lt!575367 () Unit!42357)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!83642 (_ BitVec 64) (_ BitVec 32)) Unit!42357)

(assert (=> b!1275645 (= lt!575367 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1427 lt!575365 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!83642 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1275645 (arrayContainsKey!0 _keys!1427 lt!575365 #b00000000000000000000000000000000)))

(declare-fun lt!575366 () Unit!42357)

(assert (=> b!1275645 (= lt!575366 lt!575367)))

(declare-fun res!847866 () Bool)

(declare-datatypes ((SeekEntryResult!10004 0))(
  ( (MissingZero!10004 (index!42387 (_ BitVec 32))) (Found!10004 (index!42388 (_ BitVec 32))) (Intermediate!10004 (undefined!10816 Bool) (index!42389 (_ BitVec 32)) (x!112979 (_ BitVec 32))) (Undefined!10004) (MissingVacant!10004 (index!42390 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!83642 (_ BitVec 32)) SeekEntryResult!10004)

(assert (=> b!1275645 (= res!847866 (= (seekEntryOrOpen!0 (select (arr!40334 _keys!1427) #b00000000000000000000000000000000) _keys!1427 mask!1805) (Found!10004 #b00000000000000000000000000000000)))))

(assert (=> b!1275645 (=> (not res!847866) (not e!728259))))

(declare-fun bm!62641 () Bool)

(assert (=> bm!62641 (= call!62644 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1427 mask!1805))))

(declare-fun b!1275646 () Bool)

(assert (=> b!1275646 (= e!728260 call!62644)))

(declare-fun b!1275647 () Bool)

(declare-fun e!728258 () Bool)

(assert (=> b!1275647 (= e!728258 e!728260)))

(declare-fun c!123927 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1275647 (= c!123927 (validKeyInArray!0 (select (arr!40334 _keys!1427) #b00000000000000000000000000000000)))))

(declare-fun d!140387 () Bool)

(declare-fun res!847867 () Bool)

(assert (=> d!140387 (=> res!847867 e!728258)))

(assert (=> d!140387 (= res!847867 (bvsge #b00000000000000000000000000000000 (size!40884 _keys!1427)))))

(assert (=> d!140387 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805) e!728258)))

(assert (= (and d!140387 (not res!847867)) b!1275647))

(assert (= (and b!1275647 c!123927) b!1275645))

(assert (= (and b!1275647 (not c!123927)) b!1275646))

(assert (= (and b!1275645 res!847866) b!1275644))

(assert (= (or b!1275644 b!1275646) bm!62641))

(declare-fun m!1171811 () Bool)

(assert (=> b!1275645 m!1171811))

(declare-fun m!1171813 () Bool)

(assert (=> b!1275645 m!1171813))

(declare-fun m!1171815 () Bool)

(assert (=> b!1275645 m!1171815))

(assert (=> b!1275645 m!1171811))

(declare-fun m!1171817 () Bool)

(assert (=> b!1275645 m!1171817))

(declare-fun m!1171819 () Bool)

(assert (=> bm!62641 m!1171819))

(assert (=> b!1275647 m!1171811))

(assert (=> b!1275647 m!1171811))

(declare-fun m!1171821 () Bool)

(assert (=> b!1275647 m!1171821))

(assert (=> b!1275596 d!140387))

(declare-fun d!140389 () Bool)

(declare-fun lt!575370 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!641 (List!28620) (InoxSet (_ BitVec 64)))

(assert (=> d!140389 (= lt!575370 (select (content!641 Nil!28617) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!728265 () Bool)

(assert (=> d!140389 (= lt!575370 e!728265)))

(declare-fun res!847872 () Bool)

(assert (=> d!140389 (=> (not res!847872) (not e!728265))))

(assert (=> d!140389 (= res!847872 ((_ is Cons!28616) Nil!28617))))

(assert (=> d!140389 (= (contains!7683 Nil!28617 #b1000000000000000000000000000000000000000000000000000000000000000) lt!575370)))

(declare-fun b!1275652 () Bool)

(declare-fun e!728266 () Bool)

(assert (=> b!1275652 (= e!728265 e!728266)))

(declare-fun res!847873 () Bool)

(assert (=> b!1275652 (=> res!847873 e!728266)))

(assert (=> b!1275652 (= res!847873 (= (h!29825 Nil!28617) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1275653 () Bool)

(assert (=> b!1275653 (= e!728266 (contains!7683 (t!42156 Nil!28617) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140389 res!847872) b!1275652))

(assert (= (and b!1275652 (not res!847873)) b!1275653))

(declare-fun m!1171823 () Bool)

(assert (=> d!140389 m!1171823))

(declare-fun m!1171825 () Bool)

(assert (=> d!140389 m!1171825))

(declare-fun m!1171827 () Bool)

(assert (=> b!1275653 m!1171827))

(assert (=> b!1275600 d!140389))

(declare-fun d!140391 () Bool)

(declare-fun lt!575371 () Bool)

(assert (=> d!140391 (= lt!575371 (select (content!641 Nil!28617) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!728267 () Bool)

(assert (=> d!140391 (= lt!575371 e!728267)))

(declare-fun res!847874 () Bool)

(assert (=> d!140391 (=> (not res!847874) (not e!728267))))

(assert (=> d!140391 (= res!847874 ((_ is Cons!28616) Nil!28617))))

(assert (=> d!140391 (= (contains!7683 Nil!28617 #b0000000000000000000000000000000000000000000000000000000000000000) lt!575371)))

(declare-fun b!1275654 () Bool)

(declare-fun e!728268 () Bool)

(assert (=> b!1275654 (= e!728267 e!728268)))

(declare-fun res!847875 () Bool)

(assert (=> b!1275654 (=> res!847875 e!728268)))

(assert (=> b!1275654 (= res!847875 (= (h!29825 Nil!28617) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1275655 () Bool)

(assert (=> b!1275655 (= e!728268 (contains!7683 (t!42156 Nil!28617) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!140391 res!847874) b!1275654))

(assert (= (and b!1275654 (not res!847875)) b!1275655))

(assert (=> d!140391 m!1171823))

(declare-fun m!1171829 () Bool)

(assert (=> d!140391 m!1171829))

(declare-fun m!1171831 () Bool)

(assert (=> b!1275655 m!1171831))

(assert (=> b!1275595 d!140391))

(declare-fun condMapEmpty!51431 () Bool)

(declare-fun mapDefault!51431 () ValueCell!15735)

(assert (=> mapNonEmpty!51425 (= condMapEmpty!51431 (= mapRest!51425 ((as const (Array (_ BitVec 32) ValueCell!15735)) mapDefault!51431)))))

(declare-fun e!728273 () Bool)

(declare-fun mapRes!51431 () Bool)

(assert (=> mapNonEmpty!51425 (= tp!98183 (and e!728273 mapRes!51431))))

(declare-fun b!1275663 () Bool)

(assert (=> b!1275663 (= e!728273 tp_is_empty!33267)))

(declare-fun mapNonEmpty!51431 () Bool)

(declare-fun tp!98189 () Bool)

(declare-fun e!728274 () Bool)

(assert (=> mapNonEmpty!51431 (= mapRes!51431 (and tp!98189 e!728274))))

(declare-fun mapKey!51431 () (_ BitVec 32))

(declare-fun mapRest!51431 () (Array (_ BitVec 32) ValueCell!15735))

(declare-fun mapValue!51431 () ValueCell!15735)

(assert (=> mapNonEmpty!51431 (= mapRest!51425 (store mapRest!51431 mapKey!51431 mapValue!51431))))

(declare-fun mapIsEmpty!51431 () Bool)

(assert (=> mapIsEmpty!51431 mapRes!51431))

(declare-fun b!1275662 () Bool)

(assert (=> b!1275662 (= e!728274 tp_is_empty!33267)))

(assert (= (and mapNonEmpty!51425 condMapEmpty!51431) mapIsEmpty!51431))

(assert (= (and mapNonEmpty!51425 (not condMapEmpty!51431)) mapNonEmpty!51431))

(assert (= (and mapNonEmpty!51431 ((_ is ValueCellFull!15735) mapValue!51431)) b!1275662))

(assert (= (and mapNonEmpty!51425 ((_ is ValueCellFull!15735) mapDefault!51431)) b!1275663))

(declare-fun m!1171833 () Bool)

(assert (=> mapNonEmpty!51431 m!1171833))

(check-sat (not b!1275655) tp_is_empty!33267 (not b!1275645) (not bm!62641) (not mapNonEmpty!51431) (not d!140391) (not d!140389) (not b!1275653) (not b!1275634) (not b!1275647) (not b!1275635))
(check-sat)
