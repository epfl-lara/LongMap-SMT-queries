; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75564 () Bool)

(assert start!75564)

(declare-fun b!888695 () Bool)

(declare-fun b_free!15595 () Bool)

(declare-fun b_next!15595 () Bool)

(assert (=> b!888695 (= b_free!15595 (not b_next!15595))))

(declare-fun tp!54744 () Bool)

(declare-fun b_and!25809 () Bool)

(assert (=> b!888695 (= tp!54744 b_and!25809)))

(declare-fun b!888691 () Bool)

(declare-fun e!495263 () Bool)

(declare-fun tp_is_empty!17923 () Bool)

(assert (=> b!888691 (= e!495263 tp_is_empty!17923)))

(declare-fun mapNonEmpty!28428 () Bool)

(declare-fun mapRes!28428 () Bool)

(declare-fun tp!54743 () Bool)

(declare-fun e!495264 () Bool)

(assert (=> mapNonEmpty!28428 (= mapRes!28428 (and tp!54743 e!495264))))

(declare-datatypes ((V!28863 0))(
  ( (V!28864 (val!9012 Int)) )
))
(declare-datatypes ((ValueCell!8480 0))(
  ( (ValueCellFull!8480 (v!11484 V!28863)) (EmptyCell!8480) )
))
(declare-fun mapValue!28428 () ValueCell!8480)

(declare-fun mapKey!28428 () (_ BitVec 32))

(declare-datatypes ((array!51803 0))(
  ( (array!51804 (arr!24911 (Array (_ BitVec 32) (_ BitVec 64))) (size!25355 (_ BitVec 32))) )
))
(declare-datatypes ((array!51805 0))(
  ( (array!51806 (arr!24912 (Array (_ BitVec 32) ValueCell!8480)) (size!25356 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3976 0))(
  ( (LongMapFixedSize!3977 (defaultEntry!5185 Int) (mask!25612 (_ BitVec 32)) (extraKeys!4879 (_ BitVec 32)) (zeroValue!4983 V!28863) (minValue!4983 V!28863) (_size!2043 (_ BitVec 32)) (_keys!9861 array!51803) (_values!5170 array!51805) (_vacant!2043 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!3976)

(declare-fun mapRest!28428 () (Array (_ BitVec 32) ValueCell!8480))

(assert (=> mapNonEmpty!28428 (= (arr!24912 (_values!5170 thiss!1181)) (store mapRest!28428 mapKey!28428 mapValue!28428))))

(declare-fun res!602417 () Bool)

(declare-fun e!495260 () Bool)

(assert (=> start!75564 (=> (not res!602417) (not e!495260))))

(declare-fun valid!1557 (LongMapFixedSize!3976) Bool)

(assert (=> start!75564 (= res!602417 (valid!1557 thiss!1181))))

(assert (=> start!75564 e!495260))

(declare-fun e!495262 () Bool)

(assert (=> start!75564 e!495262))

(assert (=> start!75564 true))

(declare-fun b!888692 () Bool)

(declare-fun e!495265 () Bool)

(assert (=> b!888692 (= e!495265 (and e!495263 mapRes!28428))))

(declare-fun condMapEmpty!28428 () Bool)

(declare-fun mapDefault!28428 () ValueCell!8480)

(assert (=> b!888692 (= condMapEmpty!28428 (= (arr!24912 (_values!5170 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8480)) mapDefault!28428)))))

(declare-fun b!888693 () Bool)

(declare-fun res!602418 () Bool)

(assert (=> b!888693 (=> (not res!602418) (not e!495260))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!888693 (= res!602418 (not (= key!785 (bvneg key!785))))))

(declare-fun b!888694 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!888694 (= e!495260 (not (validMask!0 (mask!25612 thiss!1181))))))

(declare-fun array_inv!19646 (array!51803) Bool)

(declare-fun array_inv!19647 (array!51805) Bool)

(assert (=> b!888695 (= e!495262 (and tp!54744 tp_is_empty!17923 (array_inv!19646 (_keys!9861 thiss!1181)) (array_inv!19647 (_values!5170 thiss!1181)) e!495265))))

(declare-fun b!888696 () Bool)

(assert (=> b!888696 (= e!495264 tp_is_empty!17923)))

(declare-fun mapIsEmpty!28428 () Bool)

(assert (=> mapIsEmpty!28428 mapRes!28428))

(assert (= (and start!75564 res!602417) b!888693))

(assert (= (and b!888693 res!602418) b!888694))

(assert (= (and b!888692 condMapEmpty!28428) mapIsEmpty!28428))

(assert (= (and b!888692 (not condMapEmpty!28428)) mapNonEmpty!28428))

(get-info :version)

(assert (= (and mapNonEmpty!28428 ((_ is ValueCellFull!8480) mapValue!28428)) b!888696))

(assert (= (and b!888692 ((_ is ValueCellFull!8480) mapDefault!28428)) b!888691))

(assert (= b!888695 b!888692))

(assert (= start!75564 b!888695))

(declare-fun m!827333 () Bool)

(assert (=> mapNonEmpty!28428 m!827333))

(declare-fun m!827335 () Bool)

(assert (=> start!75564 m!827335))

(declare-fun m!827337 () Bool)

(assert (=> b!888694 m!827337))

(declare-fun m!827339 () Bool)

(assert (=> b!888695 m!827339))

(declare-fun m!827341 () Bool)

(assert (=> b!888695 m!827341))

(check-sat (not b!888695) (not b_next!15595) (not start!75564) tp_is_empty!17923 (not b!888694) b_and!25809 (not mapNonEmpty!28428))
(check-sat b_and!25809 (not b_next!15595))
(get-model)

(declare-fun d!109921 () Bool)

(assert (=> d!109921 (= (validMask!0 (mask!25612 thiss!1181)) (and (or (= (mask!25612 thiss!1181) #b00000000000000000000000000000111) (= (mask!25612 thiss!1181) #b00000000000000000000000000001111) (= (mask!25612 thiss!1181) #b00000000000000000000000000011111) (= (mask!25612 thiss!1181) #b00000000000000000000000000111111) (= (mask!25612 thiss!1181) #b00000000000000000000000001111111) (= (mask!25612 thiss!1181) #b00000000000000000000000011111111) (= (mask!25612 thiss!1181) #b00000000000000000000000111111111) (= (mask!25612 thiss!1181) #b00000000000000000000001111111111) (= (mask!25612 thiss!1181) #b00000000000000000000011111111111) (= (mask!25612 thiss!1181) #b00000000000000000000111111111111) (= (mask!25612 thiss!1181) #b00000000000000000001111111111111) (= (mask!25612 thiss!1181) #b00000000000000000011111111111111) (= (mask!25612 thiss!1181) #b00000000000000000111111111111111) (= (mask!25612 thiss!1181) #b00000000000000001111111111111111) (= (mask!25612 thiss!1181) #b00000000000000011111111111111111) (= (mask!25612 thiss!1181) #b00000000000000111111111111111111) (= (mask!25612 thiss!1181) #b00000000000001111111111111111111) (= (mask!25612 thiss!1181) #b00000000000011111111111111111111) (= (mask!25612 thiss!1181) #b00000000000111111111111111111111) (= (mask!25612 thiss!1181) #b00000000001111111111111111111111) (= (mask!25612 thiss!1181) #b00000000011111111111111111111111) (= (mask!25612 thiss!1181) #b00000000111111111111111111111111) (= (mask!25612 thiss!1181) #b00000001111111111111111111111111) (= (mask!25612 thiss!1181) #b00000011111111111111111111111111) (= (mask!25612 thiss!1181) #b00000111111111111111111111111111) (= (mask!25612 thiss!1181) #b00001111111111111111111111111111) (= (mask!25612 thiss!1181) #b00011111111111111111111111111111) (= (mask!25612 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25612 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!888694 d!109921))

(declare-fun d!109923 () Bool)

(assert (=> d!109923 (= (array_inv!19646 (_keys!9861 thiss!1181)) (bvsge (size!25355 (_keys!9861 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888695 d!109923))

(declare-fun d!109925 () Bool)

(assert (=> d!109925 (= (array_inv!19647 (_values!5170 thiss!1181)) (bvsge (size!25356 (_values!5170 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!888695 d!109925))

(declare-fun d!109927 () Bool)

(declare-fun res!602437 () Bool)

(declare-fun e!495304 () Bool)

(assert (=> d!109927 (=> (not res!602437) (not e!495304))))

(declare-fun simpleValid!292 (LongMapFixedSize!3976) Bool)

(assert (=> d!109927 (= res!602437 (simpleValid!292 thiss!1181))))

(assert (=> d!109927 (= (valid!1557 thiss!1181) e!495304)))

(declare-fun b!888739 () Bool)

(declare-fun res!602438 () Bool)

(assert (=> b!888739 (=> (not res!602438) (not e!495304))))

(declare-fun arrayCountValidKeys!0 (array!51803 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!888739 (= res!602438 (= (arrayCountValidKeys!0 (_keys!9861 thiss!1181) #b00000000000000000000000000000000 (size!25355 (_keys!9861 thiss!1181))) (_size!2043 thiss!1181)))))

(declare-fun b!888740 () Bool)

(declare-fun res!602439 () Bool)

(assert (=> b!888740 (=> (not res!602439) (not e!495304))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51803 (_ BitVec 32)) Bool)

(assert (=> b!888740 (= res!602439 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9861 thiss!1181) (mask!25612 thiss!1181)))))

(declare-fun b!888741 () Bool)

(declare-datatypes ((List!17705 0))(
  ( (Nil!17702) (Cons!17701 (h!18832 (_ BitVec 64)) (t!24995 List!17705)) )
))
(declare-fun arrayNoDuplicates!0 (array!51803 (_ BitVec 32) List!17705) Bool)

(assert (=> b!888741 (= e!495304 (arrayNoDuplicates!0 (_keys!9861 thiss!1181) #b00000000000000000000000000000000 Nil!17702))))

(assert (= (and d!109927 res!602437) b!888739))

(assert (= (and b!888739 res!602438) b!888740))

(assert (= (and b!888740 res!602439) b!888741))

(declare-fun m!827363 () Bool)

(assert (=> d!109927 m!827363))

(declare-fun m!827365 () Bool)

(assert (=> b!888739 m!827365))

(declare-fun m!827367 () Bool)

(assert (=> b!888740 m!827367))

(declare-fun m!827369 () Bool)

(assert (=> b!888741 m!827369))

(assert (=> start!75564 d!109927))

(declare-fun mapIsEmpty!28437 () Bool)

(declare-fun mapRes!28437 () Bool)

(assert (=> mapIsEmpty!28437 mapRes!28437))

(declare-fun b!888749 () Bool)

(declare-fun e!495309 () Bool)

(assert (=> b!888749 (= e!495309 tp_is_empty!17923)))

(declare-fun condMapEmpty!28437 () Bool)

(declare-fun mapDefault!28437 () ValueCell!8480)

(assert (=> mapNonEmpty!28428 (= condMapEmpty!28437 (= mapRest!28428 ((as const (Array (_ BitVec 32) ValueCell!8480)) mapDefault!28437)))))

(assert (=> mapNonEmpty!28428 (= tp!54743 (and e!495309 mapRes!28437))))

(declare-fun mapNonEmpty!28437 () Bool)

(declare-fun tp!54759 () Bool)

(declare-fun e!495310 () Bool)

(assert (=> mapNonEmpty!28437 (= mapRes!28437 (and tp!54759 e!495310))))

(declare-fun mapRest!28437 () (Array (_ BitVec 32) ValueCell!8480))

(declare-fun mapKey!28437 () (_ BitVec 32))

(declare-fun mapValue!28437 () ValueCell!8480)

(assert (=> mapNonEmpty!28437 (= mapRest!28428 (store mapRest!28437 mapKey!28437 mapValue!28437))))

(declare-fun b!888748 () Bool)

(assert (=> b!888748 (= e!495310 tp_is_empty!17923)))

(assert (= (and mapNonEmpty!28428 condMapEmpty!28437) mapIsEmpty!28437))

(assert (= (and mapNonEmpty!28428 (not condMapEmpty!28437)) mapNonEmpty!28437))

(assert (= (and mapNonEmpty!28437 ((_ is ValueCellFull!8480) mapValue!28437)) b!888748))

(assert (= (and mapNonEmpty!28428 ((_ is ValueCellFull!8480) mapDefault!28437)) b!888749))

(declare-fun m!827371 () Bool)

(assert (=> mapNonEmpty!28437 m!827371))

(check-sat (not mapNonEmpty!28437) (not b!888740) (not b!888739) (not b_next!15595) b_and!25809 (not b!888741) (not d!109927) tp_is_empty!17923)
(check-sat b_and!25809 (not b_next!15595))
(get-model)

(declare-fun d!109929 () Bool)

(declare-fun res!602448 () Bool)

(declare-fun e!495313 () Bool)

(assert (=> d!109929 (=> (not res!602448) (not e!495313))))

(assert (=> d!109929 (= res!602448 (validMask!0 (mask!25612 thiss!1181)))))

(assert (=> d!109929 (= (simpleValid!292 thiss!1181) e!495313)))

(declare-fun b!888760 () Bool)

(declare-fun res!602450 () Bool)

(assert (=> b!888760 (=> (not res!602450) (not e!495313))))

(declare-fun size!25361 (LongMapFixedSize!3976) (_ BitVec 32))

(assert (=> b!888760 (= res!602450 (= (size!25361 thiss!1181) (bvadd (_size!2043 thiss!1181) (bvsdiv (bvadd (extraKeys!4879 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!888761 () Bool)

(assert (=> b!888761 (= e!495313 (and (bvsge (extraKeys!4879 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4879 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2043 thiss!1181) #b00000000000000000000000000000000)))))

(declare-fun b!888759 () Bool)

(declare-fun res!602449 () Bool)

(assert (=> b!888759 (=> (not res!602449) (not e!495313))))

(assert (=> b!888759 (= res!602449 (bvsge (size!25361 thiss!1181) (_size!2043 thiss!1181)))))

(declare-fun b!888758 () Bool)

(declare-fun res!602451 () Bool)

(assert (=> b!888758 (=> (not res!602451) (not e!495313))))

(assert (=> b!888758 (= res!602451 (and (= (size!25356 (_values!5170 thiss!1181)) (bvadd (mask!25612 thiss!1181) #b00000000000000000000000000000001)) (= (size!25355 (_keys!9861 thiss!1181)) (size!25356 (_values!5170 thiss!1181))) (bvsge (_size!2043 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2043 thiss!1181) (bvadd (mask!25612 thiss!1181) #b00000000000000000000000000000001))))))

(assert (= (and d!109929 res!602448) b!888758))

(assert (= (and b!888758 res!602451) b!888759))

(assert (= (and b!888759 res!602449) b!888760))

(assert (= (and b!888760 res!602450) b!888761))

(assert (=> d!109929 m!827337))

(declare-fun m!827373 () Bool)

(assert (=> b!888760 m!827373))

(assert (=> b!888759 m!827373))

(assert (=> d!109927 d!109929))

(declare-fun d!109931 () Bool)

(declare-fun lt!401735 () (_ BitVec 32))

(assert (=> d!109931 (and (bvsge lt!401735 #b00000000000000000000000000000000) (bvsle lt!401735 (bvsub (size!25355 (_keys!9861 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun e!495318 () (_ BitVec 32))

(assert (=> d!109931 (= lt!401735 e!495318)))

(declare-fun c!93861 () Bool)

(assert (=> d!109931 (= c!93861 (bvsge #b00000000000000000000000000000000 (size!25355 (_keys!9861 thiss!1181))))))

(assert (=> d!109931 (and (bvsle #b00000000000000000000000000000000 (size!25355 (_keys!9861 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25355 (_keys!9861 thiss!1181)) (size!25355 (_keys!9861 thiss!1181))))))

(assert (=> d!109931 (= (arrayCountValidKeys!0 (_keys!9861 thiss!1181) #b00000000000000000000000000000000 (size!25355 (_keys!9861 thiss!1181))) lt!401735)))

(declare-fun b!888770 () Bool)

(declare-fun e!495319 () (_ BitVec 32))

(assert (=> b!888770 (= e!495318 e!495319)))

(declare-fun c!93862 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!888770 (= c!93862 (validKeyInArray!0 (select (arr!24911 (_keys!9861 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888771 () Bool)

(declare-fun call!39469 () (_ BitVec 32))

(assert (=> b!888771 (= e!495319 call!39469)))

(declare-fun b!888772 () Bool)

(assert (=> b!888772 (= e!495319 (bvadd #b00000000000000000000000000000001 call!39469))))

(declare-fun bm!39466 () Bool)

(assert (=> bm!39466 (= call!39469 (arrayCountValidKeys!0 (_keys!9861 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25355 (_keys!9861 thiss!1181))))))

(declare-fun b!888773 () Bool)

(assert (=> b!888773 (= e!495318 #b00000000000000000000000000000000)))

(assert (= (and d!109931 c!93861) b!888773))

(assert (= (and d!109931 (not c!93861)) b!888770))

(assert (= (and b!888770 c!93862) b!888772))

(assert (= (and b!888770 (not c!93862)) b!888771))

(assert (= (or b!888772 b!888771) bm!39466))

(declare-fun m!827375 () Bool)

(assert (=> b!888770 m!827375))

(assert (=> b!888770 m!827375))

(declare-fun m!827377 () Bool)

(assert (=> b!888770 m!827377))

(declare-fun m!827379 () Bool)

(assert (=> bm!39466 m!827379))

(assert (=> b!888739 d!109931))

(declare-fun b!888782 () Bool)

(declare-fun e!495326 () Bool)

(declare-fun e!495328 () Bool)

(assert (=> b!888782 (= e!495326 e!495328)))

(declare-fun c!93865 () Bool)

(assert (=> b!888782 (= c!93865 (validKeyInArray!0 (select (arr!24911 (_keys!9861 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888783 () Bool)

(declare-fun e!495327 () Bool)

(assert (=> b!888783 (= e!495328 e!495327)))

(declare-fun lt!401742 () (_ BitVec 64))

(assert (=> b!888783 (= lt!401742 (select (arr!24911 (_keys!9861 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30220 0))(
  ( (Unit!30221) )
))
(declare-fun lt!401744 () Unit!30220)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!51803 (_ BitVec 64) (_ BitVec 32)) Unit!30220)

(assert (=> b!888783 (= lt!401744 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9861 thiss!1181) lt!401742 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!51803 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!888783 (arrayContainsKey!0 (_keys!9861 thiss!1181) lt!401742 #b00000000000000000000000000000000)))

(declare-fun lt!401743 () Unit!30220)

(assert (=> b!888783 (= lt!401743 lt!401744)))

(declare-fun res!602456 () Bool)

(declare-datatypes ((SeekEntryResult!8765 0))(
  ( (MissingZero!8765 (index!37431 (_ BitVec 32))) (Found!8765 (index!37432 (_ BitVec 32))) (Intermediate!8765 (undefined!9577 Bool) (index!37433 (_ BitVec 32)) (x!75442 (_ BitVec 32))) (Undefined!8765) (MissingVacant!8765 (index!37434 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!51803 (_ BitVec 32)) SeekEntryResult!8765)

(assert (=> b!888783 (= res!602456 (= (seekEntryOrOpen!0 (select (arr!24911 (_keys!9861 thiss!1181)) #b00000000000000000000000000000000) (_keys!9861 thiss!1181) (mask!25612 thiss!1181)) (Found!8765 #b00000000000000000000000000000000)))))

(assert (=> b!888783 (=> (not res!602456) (not e!495327))))

(declare-fun b!888784 () Bool)

(declare-fun call!39472 () Bool)

(assert (=> b!888784 (= e!495328 call!39472)))

(declare-fun b!888785 () Bool)

(assert (=> b!888785 (= e!495327 call!39472)))

(declare-fun bm!39469 () Bool)

(assert (=> bm!39469 (= call!39472 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!9861 thiss!1181) (mask!25612 thiss!1181)))))

(declare-fun d!109933 () Bool)

(declare-fun res!602457 () Bool)

(assert (=> d!109933 (=> res!602457 e!495326)))

(assert (=> d!109933 (= res!602457 (bvsge #b00000000000000000000000000000000 (size!25355 (_keys!9861 thiss!1181))))))

(assert (=> d!109933 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9861 thiss!1181) (mask!25612 thiss!1181)) e!495326)))

(assert (= (and d!109933 (not res!602457)) b!888782))

(assert (= (and b!888782 c!93865) b!888783))

(assert (= (and b!888782 (not c!93865)) b!888784))

(assert (= (and b!888783 res!602456) b!888785))

(assert (= (or b!888785 b!888784) bm!39469))

(assert (=> b!888782 m!827375))

(assert (=> b!888782 m!827375))

(assert (=> b!888782 m!827377))

(assert (=> b!888783 m!827375))

(declare-fun m!827381 () Bool)

(assert (=> b!888783 m!827381))

(declare-fun m!827383 () Bool)

(assert (=> b!888783 m!827383))

(assert (=> b!888783 m!827375))

(declare-fun m!827385 () Bool)

(assert (=> b!888783 m!827385))

(declare-fun m!827387 () Bool)

(assert (=> bm!39469 m!827387))

(assert (=> b!888740 d!109933))

(declare-fun bm!39472 () Bool)

(declare-fun call!39475 () Bool)

(declare-fun c!93868 () Bool)

(assert (=> bm!39472 (= call!39475 (arrayNoDuplicates!0 (_keys!9861 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!93868 (Cons!17701 (select (arr!24911 (_keys!9861 thiss!1181)) #b00000000000000000000000000000000) Nil!17702) Nil!17702)))))

(declare-fun b!888796 () Bool)

(declare-fun e!495337 () Bool)

(assert (=> b!888796 (= e!495337 call!39475)))

(declare-fun b!888797 () Bool)

(assert (=> b!888797 (= e!495337 call!39475)))

(declare-fun b!888798 () Bool)

(declare-fun e!495339 () Bool)

(declare-fun contains!4309 (List!17705 (_ BitVec 64)) Bool)

(assert (=> b!888798 (= e!495339 (contains!4309 Nil!17702 (select (arr!24911 (_keys!9861 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun d!109935 () Bool)

(declare-fun res!602465 () Bool)

(declare-fun e!495338 () Bool)

(assert (=> d!109935 (=> res!602465 e!495338)))

(assert (=> d!109935 (= res!602465 (bvsge #b00000000000000000000000000000000 (size!25355 (_keys!9861 thiss!1181))))))

(assert (=> d!109935 (= (arrayNoDuplicates!0 (_keys!9861 thiss!1181) #b00000000000000000000000000000000 Nil!17702) e!495338)))

(declare-fun b!888799 () Bool)

(declare-fun e!495340 () Bool)

(assert (=> b!888799 (= e!495338 e!495340)))

(declare-fun res!602464 () Bool)

(assert (=> b!888799 (=> (not res!602464) (not e!495340))))

(assert (=> b!888799 (= res!602464 (not e!495339))))

(declare-fun res!602466 () Bool)

(assert (=> b!888799 (=> (not res!602466) (not e!495339))))

(assert (=> b!888799 (= res!602466 (validKeyInArray!0 (select (arr!24911 (_keys!9861 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!888800 () Bool)

(assert (=> b!888800 (= e!495340 e!495337)))

(assert (=> b!888800 (= c!93868 (validKeyInArray!0 (select (arr!24911 (_keys!9861 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (= (and d!109935 (not res!602465)) b!888799))

(assert (= (and b!888799 res!602466) b!888798))

(assert (= (and b!888799 res!602464) b!888800))

(assert (= (and b!888800 c!93868) b!888797))

(assert (= (and b!888800 (not c!93868)) b!888796))

(assert (= (or b!888797 b!888796) bm!39472))

(assert (=> bm!39472 m!827375))

(declare-fun m!827389 () Bool)

(assert (=> bm!39472 m!827389))

(assert (=> b!888798 m!827375))

(assert (=> b!888798 m!827375))

(declare-fun m!827391 () Bool)

(assert (=> b!888798 m!827391))

(assert (=> b!888799 m!827375))

(assert (=> b!888799 m!827375))

(assert (=> b!888799 m!827377))

(assert (=> b!888800 m!827375))

(assert (=> b!888800 m!827375))

(assert (=> b!888800 m!827377))

(assert (=> b!888741 d!109935))

(declare-fun mapIsEmpty!28438 () Bool)

(declare-fun mapRes!28438 () Bool)

(assert (=> mapIsEmpty!28438 mapRes!28438))

(declare-fun b!888802 () Bool)

(declare-fun e!495341 () Bool)

(assert (=> b!888802 (= e!495341 tp_is_empty!17923)))

(declare-fun condMapEmpty!28438 () Bool)

(declare-fun mapDefault!28438 () ValueCell!8480)

(assert (=> mapNonEmpty!28437 (= condMapEmpty!28438 (= mapRest!28437 ((as const (Array (_ BitVec 32) ValueCell!8480)) mapDefault!28438)))))

(assert (=> mapNonEmpty!28437 (= tp!54759 (and e!495341 mapRes!28438))))

(declare-fun mapNonEmpty!28438 () Bool)

(declare-fun tp!54760 () Bool)

(declare-fun e!495342 () Bool)

(assert (=> mapNonEmpty!28438 (= mapRes!28438 (and tp!54760 e!495342))))

(declare-fun mapKey!28438 () (_ BitVec 32))

(declare-fun mapRest!28438 () (Array (_ BitVec 32) ValueCell!8480))

(declare-fun mapValue!28438 () ValueCell!8480)

(assert (=> mapNonEmpty!28438 (= mapRest!28437 (store mapRest!28438 mapKey!28438 mapValue!28438))))

(declare-fun b!888801 () Bool)

(assert (=> b!888801 (= e!495342 tp_is_empty!17923)))

(assert (= (and mapNonEmpty!28437 condMapEmpty!28438) mapIsEmpty!28438))

(assert (= (and mapNonEmpty!28437 (not condMapEmpty!28438)) mapNonEmpty!28438))

(assert (= (and mapNonEmpty!28438 ((_ is ValueCellFull!8480) mapValue!28438)) b!888801))

(assert (= (and mapNonEmpty!28437 ((_ is ValueCellFull!8480) mapDefault!28438)) b!888802))

(declare-fun m!827393 () Bool)

(assert (=> mapNonEmpty!28438 m!827393))

(check-sat (not b!888800) (not bm!39472) (not bm!39469) (not b!888759) (not b!888760) (not b!888782) (not mapNonEmpty!28438) tp_is_empty!17923 (not b!888799) (not b!888770) (not bm!39466) (not b_next!15595) (not d!109929) (not b!888783) (not b!888798) b_and!25809)
(check-sat b_and!25809 (not b_next!15595))
