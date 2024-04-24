; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76356 () Bool)

(assert start!76356)

(declare-fun b!895687 () Bool)

(declare-fun b_free!15883 () Bool)

(declare-fun b_next!15883 () Bool)

(assert (=> b!895687 (= b_free!15883 (not b_next!15883))))

(declare-fun tp!55645 () Bool)

(declare-fun b_and!26185 () Bool)

(assert (=> b!895687 (= tp!55645 b_and!26185)))

(declare-fun b!895682 () Bool)

(declare-fun e!500414 () Bool)

(declare-datatypes ((array!52455 0))(
  ( (array!52456 (arr!25222 (Array (_ BitVec 32) (_ BitVec 64))) (size!25670 (_ BitVec 32))) )
))
(declare-datatypes ((V!29247 0))(
  ( (V!29248 (val!9156 Int)) )
))
(declare-datatypes ((ValueCell!8624 0))(
  ( (ValueCellFull!8624 (v!11643 V!29247)) (EmptyCell!8624) )
))
(declare-datatypes ((array!52457 0))(
  ( (array!52458 (arr!25223 (Array (_ BitVec 32) ValueCell!8624)) (size!25671 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4264 0))(
  ( (LongMapFixedSize!4265 (defaultEntry!5344 Int) (mask!25958 (_ BitVec 32)) (extraKeys!5040 (_ BitVec 32)) (zeroValue!5144 V!29247) (minValue!5144 V!29247) (_size!2187 (_ BitVec 32)) (_keys!10074 array!52455) (_values!5331 array!52457) (_vacant!2187 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4264)

(assert (=> b!895682 (= e!500414 (and (= (size!25671 (_values!5331 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25958 thiss!1181))) (not (= (size!25670 (_keys!10074 thiss!1181)) (size!25671 (_values!5331 thiss!1181))))))))

(declare-fun b!895683 () Bool)

(declare-fun e!500420 () Bool)

(declare-fun tp_is_empty!18211 () Bool)

(assert (=> b!895683 (= e!500420 tp_is_empty!18211)))

(declare-fun b!895684 () Bool)

(declare-fun e!500417 () Bool)

(assert (=> b!895684 (= e!500417 tp_is_empty!18211)))

(declare-fun b!895685 () Bool)

(declare-fun e!500416 () Bool)

(assert (=> b!895685 (= e!500416 e!500414)))

(declare-fun res!605808 () Bool)

(assert (=> b!895685 (=> (not res!605808) (not e!500414))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!895685 (= res!605808 (validMask!0 (mask!25958 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8825 0))(
  ( (MissingZero!8825 (index!37671 (_ BitVec 32))) (Found!8825 (index!37672 (_ BitVec 32))) (Intermediate!8825 (undefined!9637 Bool) (index!37673 (_ BitVec 32)) (x!76060 (_ BitVec 32))) (Undefined!8825) (MissingVacant!8825 (index!37674 (_ BitVec 32))) )
))
(declare-fun lt!404720 () SeekEntryResult!8825)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52455 (_ BitVec 32)) SeekEntryResult!8825)

(assert (=> b!895685 (= lt!404720 (seekEntry!0 key!785 (_keys!10074 thiss!1181) (mask!25958 thiss!1181)))))

(declare-fun b!895686 () Bool)

(declare-fun res!605809 () Bool)

(assert (=> b!895686 (=> (not res!605809) (not e!500416))))

(assert (=> b!895686 (= res!605809 (not (= key!785 (bvneg key!785))))))

(declare-fun mapIsEmpty!28897 () Bool)

(declare-fun mapRes!28897 () Bool)

(assert (=> mapIsEmpty!28897 mapRes!28897))

(declare-fun e!500415 () Bool)

(declare-fun e!500419 () Bool)

(declare-fun array_inv!19850 (array!52455) Bool)

(declare-fun array_inv!19851 (array!52457) Bool)

(assert (=> b!895687 (= e!500415 (and tp!55645 tp_is_empty!18211 (array_inv!19850 (_keys!10074 thiss!1181)) (array_inv!19851 (_values!5331 thiss!1181)) e!500419))))

(declare-fun mapNonEmpty!28897 () Bool)

(declare-fun tp!55644 () Bool)

(assert (=> mapNonEmpty!28897 (= mapRes!28897 (and tp!55644 e!500417))))

(declare-fun mapRest!28897 () (Array (_ BitVec 32) ValueCell!8624))

(declare-fun mapValue!28897 () ValueCell!8624)

(declare-fun mapKey!28897 () (_ BitVec 32))

(assert (=> mapNonEmpty!28897 (= (arr!25223 (_values!5331 thiss!1181)) (store mapRest!28897 mapKey!28897 mapValue!28897))))

(declare-fun res!605807 () Bool)

(assert (=> start!76356 (=> (not res!605807) (not e!500416))))

(declare-fun valid!1659 (LongMapFixedSize!4264) Bool)

(assert (=> start!76356 (= res!605807 (valid!1659 thiss!1181))))

(assert (=> start!76356 e!500416))

(assert (=> start!76356 e!500415))

(assert (=> start!76356 true))

(declare-fun b!895688 () Bool)

(assert (=> b!895688 (= e!500419 (and e!500420 mapRes!28897))))

(declare-fun condMapEmpty!28897 () Bool)

(declare-fun mapDefault!28897 () ValueCell!8624)

(assert (=> b!895688 (= condMapEmpty!28897 (= (arr!25223 (_values!5331 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8624)) mapDefault!28897)))))

(assert (= (and start!76356 res!605807) b!895686))

(assert (= (and b!895686 res!605809) b!895685))

(assert (= (and b!895685 res!605808) b!895682))

(assert (= (and b!895688 condMapEmpty!28897) mapIsEmpty!28897))

(assert (= (and b!895688 (not condMapEmpty!28897)) mapNonEmpty!28897))

(get-info :version)

(assert (= (and mapNonEmpty!28897 ((_ is ValueCellFull!8624) mapValue!28897)) b!895684))

(assert (= (and b!895688 ((_ is ValueCellFull!8624) mapDefault!28897)) b!895683))

(assert (= b!895687 b!895688))

(assert (= start!76356 b!895687))

(declare-fun m!833985 () Bool)

(assert (=> b!895685 m!833985))

(declare-fun m!833987 () Bool)

(assert (=> b!895685 m!833987))

(declare-fun m!833989 () Bool)

(assert (=> b!895687 m!833989))

(declare-fun m!833991 () Bool)

(assert (=> b!895687 m!833991))

(declare-fun m!833993 () Bool)

(assert (=> mapNonEmpty!28897 m!833993))

(declare-fun m!833995 () Bool)

(assert (=> start!76356 m!833995))

(check-sat (not b!895687) (not mapNonEmpty!28897) b_and!26185 tp_is_empty!18211 (not b!895685) (not start!76356) (not b_next!15883))
(check-sat b_and!26185 (not b_next!15883))
(get-model)

(declare-fun d!111015 () Bool)

(assert (=> d!111015 (= (validMask!0 (mask!25958 thiss!1181)) (and (or (= (mask!25958 thiss!1181) #b00000000000000000000000000000111) (= (mask!25958 thiss!1181) #b00000000000000000000000000001111) (= (mask!25958 thiss!1181) #b00000000000000000000000000011111) (= (mask!25958 thiss!1181) #b00000000000000000000000000111111) (= (mask!25958 thiss!1181) #b00000000000000000000000001111111) (= (mask!25958 thiss!1181) #b00000000000000000000000011111111) (= (mask!25958 thiss!1181) #b00000000000000000000000111111111) (= (mask!25958 thiss!1181) #b00000000000000000000001111111111) (= (mask!25958 thiss!1181) #b00000000000000000000011111111111) (= (mask!25958 thiss!1181) #b00000000000000000000111111111111) (= (mask!25958 thiss!1181) #b00000000000000000001111111111111) (= (mask!25958 thiss!1181) #b00000000000000000011111111111111) (= (mask!25958 thiss!1181) #b00000000000000000111111111111111) (= (mask!25958 thiss!1181) #b00000000000000001111111111111111) (= (mask!25958 thiss!1181) #b00000000000000011111111111111111) (= (mask!25958 thiss!1181) #b00000000000000111111111111111111) (= (mask!25958 thiss!1181) #b00000000000001111111111111111111) (= (mask!25958 thiss!1181) #b00000000000011111111111111111111) (= (mask!25958 thiss!1181) #b00000000000111111111111111111111) (= (mask!25958 thiss!1181) #b00000000001111111111111111111111) (= (mask!25958 thiss!1181) #b00000000011111111111111111111111) (= (mask!25958 thiss!1181) #b00000000111111111111111111111111) (= (mask!25958 thiss!1181) #b00000001111111111111111111111111) (= (mask!25958 thiss!1181) #b00000011111111111111111111111111) (= (mask!25958 thiss!1181) #b00000111111111111111111111111111) (= (mask!25958 thiss!1181) #b00001111111111111111111111111111) (= (mask!25958 thiss!1181) #b00011111111111111111111111111111) (= (mask!25958 thiss!1181) #b00111111111111111111111111111111)) (bvsle (mask!25958 thiss!1181) #b00111111111111111111111111111111)))))

(assert (=> b!895685 d!111015))

(declare-fun b!895743 () Bool)

(declare-fun e!500471 () SeekEntryResult!8825)

(declare-fun lt!404738 () SeekEntryResult!8825)

(assert (=> b!895743 (= e!500471 (ite ((_ is MissingVacant!8825) lt!404738) (MissingZero!8825 (index!37674 lt!404738)) lt!404738))))

(declare-fun lt!404737 () SeekEntryResult!8825)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52455 (_ BitVec 32)) SeekEntryResult!8825)

(assert (=> b!895743 (= lt!404738 (seekKeyOrZeroReturnVacant!0 (x!76060 lt!404737) (index!37673 lt!404737) (index!37673 lt!404737) key!785 (_keys!10074 thiss!1181) (mask!25958 thiss!1181)))))

(declare-fun b!895744 () Bool)

(declare-fun e!500470 () SeekEntryResult!8825)

(assert (=> b!895744 (= e!500470 (Found!8825 (index!37673 lt!404737)))))

(declare-fun b!895745 () Bool)

(declare-fun c!94738 () Bool)

(declare-fun lt!404736 () (_ BitVec 64))

(assert (=> b!895745 (= c!94738 (= lt!404736 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895745 (= e!500470 e!500471)))

(declare-fun b!895746 () Bool)

(assert (=> b!895746 (= e!500471 (MissingZero!8825 (index!37673 lt!404737)))))

(declare-fun d!111017 () Bool)

(declare-fun lt!404735 () SeekEntryResult!8825)

(assert (=> d!111017 (and (or ((_ is MissingVacant!8825) lt!404735) (not ((_ is Found!8825) lt!404735)) (and (bvsge (index!37672 lt!404735) #b00000000000000000000000000000000) (bvslt (index!37672 lt!404735) (size!25670 (_keys!10074 thiss!1181))))) (not ((_ is MissingVacant!8825) lt!404735)) (or (not ((_ is Found!8825) lt!404735)) (= (select (arr!25222 (_keys!10074 thiss!1181)) (index!37672 lt!404735)) key!785)))))

(declare-fun e!500469 () SeekEntryResult!8825)

(assert (=> d!111017 (= lt!404735 e!500469)))

(declare-fun c!94739 () Bool)

(assert (=> d!111017 (= c!94739 (and ((_ is Intermediate!8825) lt!404737) (undefined!9637 lt!404737)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52455 (_ BitVec 32)) SeekEntryResult!8825)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111017 (= lt!404737 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25958 thiss!1181)) key!785 (_keys!10074 thiss!1181) (mask!25958 thiss!1181)))))

(assert (=> d!111017 (validMask!0 (mask!25958 thiss!1181))))

(assert (=> d!111017 (= (seekEntry!0 key!785 (_keys!10074 thiss!1181) (mask!25958 thiss!1181)) lt!404735)))

(declare-fun b!895747 () Bool)

(assert (=> b!895747 (= e!500469 Undefined!8825)))

(declare-fun b!895748 () Bool)

(assert (=> b!895748 (= e!500469 e!500470)))

(assert (=> b!895748 (= lt!404736 (select (arr!25222 (_keys!10074 thiss!1181)) (index!37673 lt!404737)))))

(declare-fun c!94737 () Bool)

(assert (=> b!895748 (= c!94737 (= lt!404736 key!785))))

(assert (= (and d!111017 c!94739) b!895747))

(assert (= (and d!111017 (not c!94739)) b!895748))

(assert (= (and b!895748 c!94737) b!895744))

(assert (= (and b!895748 (not c!94737)) b!895745))

(assert (= (and b!895745 c!94738) b!895746))

(assert (= (and b!895745 (not c!94738)) b!895743))

(declare-fun m!834021 () Bool)

(assert (=> b!895743 m!834021))

(declare-fun m!834023 () Bool)

(assert (=> d!111017 m!834023))

(declare-fun m!834025 () Bool)

(assert (=> d!111017 m!834025))

(assert (=> d!111017 m!834025))

(declare-fun m!834027 () Bool)

(assert (=> d!111017 m!834027))

(assert (=> d!111017 m!833985))

(declare-fun m!834029 () Bool)

(assert (=> b!895748 m!834029))

(assert (=> b!895685 d!111017))

(declare-fun d!111019 () Bool)

(declare-fun res!605834 () Bool)

(declare-fun e!500474 () Bool)

(assert (=> d!111019 (=> (not res!605834) (not e!500474))))

(declare-fun simpleValid!302 (LongMapFixedSize!4264) Bool)

(assert (=> d!111019 (= res!605834 (simpleValid!302 thiss!1181))))

(assert (=> d!111019 (= (valid!1659 thiss!1181) e!500474)))

(declare-fun b!895755 () Bool)

(declare-fun res!605835 () Bool)

(assert (=> b!895755 (=> (not res!605835) (not e!500474))))

(declare-fun arrayCountValidKeys!0 (array!52455 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895755 (= res!605835 (= (arrayCountValidKeys!0 (_keys!10074 thiss!1181) #b00000000000000000000000000000000 (size!25670 (_keys!10074 thiss!1181))) (_size!2187 thiss!1181)))))

(declare-fun b!895756 () Bool)

(declare-fun res!605836 () Bool)

(assert (=> b!895756 (=> (not res!605836) (not e!500474))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52455 (_ BitVec 32)) Bool)

(assert (=> b!895756 (= res!605836 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10074 thiss!1181) (mask!25958 thiss!1181)))))

(declare-fun b!895757 () Bool)

(declare-datatypes ((List!17761 0))(
  ( (Nil!17758) (Cons!17757 (h!18897 (_ BitVec 64)) (t!25092 List!17761)) )
))
(declare-fun arrayNoDuplicates!0 (array!52455 (_ BitVec 32) List!17761) Bool)

(assert (=> b!895757 (= e!500474 (arrayNoDuplicates!0 (_keys!10074 thiss!1181) #b00000000000000000000000000000000 Nil!17758))))

(assert (= (and d!111019 res!605834) b!895755))

(assert (= (and b!895755 res!605835) b!895756))

(assert (= (and b!895756 res!605836) b!895757))

(declare-fun m!834031 () Bool)

(assert (=> d!111019 m!834031))

(declare-fun m!834033 () Bool)

(assert (=> b!895755 m!834033))

(declare-fun m!834035 () Bool)

(assert (=> b!895756 m!834035))

(declare-fun m!834037 () Bool)

(assert (=> b!895757 m!834037))

(assert (=> start!76356 d!111019))

(declare-fun d!111021 () Bool)

(assert (=> d!111021 (= (array_inv!19850 (_keys!10074 thiss!1181)) (bvsge (size!25670 (_keys!10074 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895687 d!111021))

(declare-fun d!111023 () Bool)

(assert (=> d!111023 (= (array_inv!19851 (_values!5331 thiss!1181)) (bvsge (size!25671 (_values!5331 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!895687 d!111023))

(declare-fun b!895765 () Bool)

(declare-fun e!500479 () Bool)

(assert (=> b!895765 (= e!500479 tp_is_empty!18211)))

(declare-fun b!895764 () Bool)

(declare-fun e!500480 () Bool)

(assert (=> b!895764 (= e!500480 tp_is_empty!18211)))

(declare-fun condMapEmpty!28906 () Bool)

(declare-fun mapDefault!28906 () ValueCell!8624)

(assert (=> mapNonEmpty!28897 (= condMapEmpty!28906 (= mapRest!28897 ((as const (Array (_ BitVec 32) ValueCell!8624)) mapDefault!28906)))))

(declare-fun mapRes!28906 () Bool)

(assert (=> mapNonEmpty!28897 (= tp!55644 (and e!500479 mapRes!28906))))

(declare-fun mapNonEmpty!28906 () Bool)

(declare-fun tp!55660 () Bool)

(assert (=> mapNonEmpty!28906 (= mapRes!28906 (and tp!55660 e!500480))))

(declare-fun mapValue!28906 () ValueCell!8624)

(declare-fun mapKey!28906 () (_ BitVec 32))

(declare-fun mapRest!28906 () (Array (_ BitVec 32) ValueCell!8624))

(assert (=> mapNonEmpty!28906 (= mapRest!28897 (store mapRest!28906 mapKey!28906 mapValue!28906))))

(declare-fun mapIsEmpty!28906 () Bool)

(assert (=> mapIsEmpty!28906 mapRes!28906))

(assert (= (and mapNonEmpty!28897 condMapEmpty!28906) mapIsEmpty!28906))

(assert (= (and mapNonEmpty!28897 (not condMapEmpty!28906)) mapNonEmpty!28906))

(assert (= (and mapNonEmpty!28906 ((_ is ValueCellFull!8624) mapValue!28906)) b!895764))

(assert (= (and mapNonEmpty!28897 ((_ is ValueCellFull!8624) mapDefault!28906)) b!895765))

(declare-fun m!834039 () Bool)

(assert (=> mapNonEmpty!28906 m!834039))

(check-sat (not d!111019) (not d!111017) (not b!895743) b_and!26185 (not b!895755) (not b!895756) (not b!895757) (not b_next!15883) tp_is_empty!18211 (not mapNonEmpty!28906))
(check-sat b_and!26185 (not b_next!15883))
(get-model)

(declare-fun e!500489 () SeekEntryResult!8825)

(declare-fun b!895778 () Bool)

(declare-fun nextIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!895778 (= e!500489 (seekKeyOrZeroReturnVacant!0 (bvadd (x!76060 lt!404737) #b00000000000000000000000000000001) (nextIndex!0 (index!37673 lt!404737) (bvadd (x!76060 lt!404737) #b00000000000000000000000000000001) (mask!25958 thiss!1181)) (index!37673 lt!404737) key!785 (_keys!10074 thiss!1181) (mask!25958 thiss!1181)))))

(declare-fun b!895779 () Bool)

(assert (=> b!895779 (= e!500489 (MissingVacant!8825 (index!37673 lt!404737)))))

(declare-fun b!895780 () Bool)

(declare-fun e!500487 () SeekEntryResult!8825)

(assert (=> b!895780 (= e!500487 (Found!8825 (index!37673 lt!404737)))))

(declare-fun b!895781 () Bool)

(declare-fun c!94748 () Bool)

(declare-fun lt!404743 () (_ BitVec 64))

(assert (=> b!895781 (= c!94748 (= lt!404743 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!895781 (= e!500487 e!500489)))

(declare-fun lt!404744 () SeekEntryResult!8825)

(declare-fun d!111025 () Bool)

(assert (=> d!111025 (and (or ((_ is Undefined!8825) lt!404744) (not ((_ is Found!8825) lt!404744)) (and (bvsge (index!37672 lt!404744) #b00000000000000000000000000000000) (bvslt (index!37672 lt!404744) (size!25670 (_keys!10074 thiss!1181))))) (or ((_ is Undefined!8825) lt!404744) ((_ is Found!8825) lt!404744) (not ((_ is MissingVacant!8825) lt!404744)) (not (= (index!37674 lt!404744) (index!37673 lt!404737))) (and (bvsge (index!37674 lt!404744) #b00000000000000000000000000000000) (bvslt (index!37674 lt!404744) (size!25670 (_keys!10074 thiss!1181))))) (or ((_ is Undefined!8825) lt!404744) (ite ((_ is Found!8825) lt!404744) (= (select (arr!25222 (_keys!10074 thiss!1181)) (index!37672 lt!404744)) key!785) (and ((_ is MissingVacant!8825) lt!404744) (= (index!37674 lt!404744) (index!37673 lt!404737)) (= (select (arr!25222 (_keys!10074 thiss!1181)) (index!37674 lt!404744)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun e!500488 () SeekEntryResult!8825)

(assert (=> d!111025 (= lt!404744 e!500488)))

(declare-fun c!94747 () Bool)

(assert (=> d!111025 (= c!94747 (bvsge (x!76060 lt!404737) #b01111111111111111111111111111110))))

(assert (=> d!111025 (= lt!404743 (select (arr!25222 (_keys!10074 thiss!1181)) (index!37673 lt!404737)))))

(assert (=> d!111025 (validMask!0 (mask!25958 thiss!1181))))

(assert (=> d!111025 (= (seekKeyOrZeroReturnVacant!0 (x!76060 lt!404737) (index!37673 lt!404737) (index!37673 lt!404737) key!785 (_keys!10074 thiss!1181) (mask!25958 thiss!1181)) lt!404744)))

(declare-fun b!895782 () Bool)

(assert (=> b!895782 (= e!500488 Undefined!8825)))

(declare-fun b!895783 () Bool)

(assert (=> b!895783 (= e!500488 e!500487)))

(declare-fun c!94746 () Bool)

(assert (=> b!895783 (= c!94746 (= lt!404743 key!785))))

(assert (= (and d!111025 c!94747) b!895782))

(assert (= (and d!111025 (not c!94747)) b!895783))

(assert (= (and b!895783 c!94746) b!895780))

(assert (= (and b!895783 (not c!94746)) b!895781))

(assert (= (and b!895781 c!94748) b!895779))

(assert (= (and b!895781 (not c!94748)) b!895778))

(declare-fun m!834041 () Bool)

(assert (=> b!895778 m!834041))

(assert (=> b!895778 m!834041))

(declare-fun m!834043 () Bool)

(assert (=> b!895778 m!834043))

(declare-fun m!834045 () Bool)

(assert (=> d!111025 m!834045))

(declare-fun m!834047 () Bool)

(assert (=> d!111025 m!834047))

(assert (=> d!111025 m!834029))

(assert (=> d!111025 m!833985))

(assert (=> b!895743 d!111025))

(declare-fun b!895794 () Bool)

(declare-fun e!500499 () Bool)

(declare-fun call!39775 () Bool)

(assert (=> b!895794 (= e!500499 call!39775)))

(declare-fun b!895795 () Bool)

(declare-fun e!500500 () Bool)

(assert (=> b!895795 (= e!500500 e!500499)))

(declare-fun c!94751 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!895795 (= c!94751 (validKeyInArray!0 (select (arr!25222 (_keys!10074 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895796 () Bool)

(declare-fun e!500498 () Bool)

(declare-fun contains!4366 (List!17761 (_ BitVec 64)) Bool)

(assert (=> b!895796 (= e!500498 (contains!4366 Nil!17758 (select (arr!25222 (_keys!10074 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895797 () Bool)

(declare-fun e!500501 () Bool)

(assert (=> b!895797 (= e!500501 e!500500)))

(declare-fun res!605844 () Bool)

(assert (=> b!895797 (=> (not res!605844) (not e!500500))))

(assert (=> b!895797 (= res!605844 (not e!500498))))

(declare-fun res!605843 () Bool)

(assert (=> b!895797 (=> (not res!605843) (not e!500498))))

(assert (=> b!895797 (= res!605843 (validKeyInArray!0 (select (arr!25222 (_keys!10074 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun bm!39772 () Bool)

(assert (=> bm!39772 (= call!39775 (arrayNoDuplicates!0 (_keys!10074 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!94751 (Cons!17757 (select (arr!25222 (_keys!10074 thiss!1181)) #b00000000000000000000000000000000) Nil!17758) Nil!17758)))))

(declare-fun d!111027 () Bool)

(declare-fun res!605845 () Bool)

(assert (=> d!111027 (=> res!605845 e!500501)))

(assert (=> d!111027 (= res!605845 (bvsge #b00000000000000000000000000000000 (size!25670 (_keys!10074 thiss!1181))))))

(assert (=> d!111027 (= (arrayNoDuplicates!0 (_keys!10074 thiss!1181) #b00000000000000000000000000000000 Nil!17758) e!500501)))

(declare-fun b!895798 () Bool)

(assert (=> b!895798 (= e!500499 call!39775)))

(assert (= (and d!111027 (not res!605845)) b!895797))

(assert (= (and b!895797 res!605843) b!895796))

(assert (= (and b!895797 res!605844) b!895795))

(assert (= (and b!895795 c!94751) b!895798))

(assert (= (and b!895795 (not c!94751)) b!895794))

(assert (= (or b!895798 b!895794) bm!39772))

(declare-fun m!834049 () Bool)

(assert (=> b!895795 m!834049))

(assert (=> b!895795 m!834049))

(declare-fun m!834051 () Bool)

(assert (=> b!895795 m!834051))

(assert (=> b!895796 m!834049))

(assert (=> b!895796 m!834049))

(declare-fun m!834053 () Bool)

(assert (=> b!895796 m!834053))

(assert (=> b!895797 m!834049))

(assert (=> b!895797 m!834049))

(assert (=> b!895797 m!834051))

(assert (=> bm!39772 m!834049))

(declare-fun m!834055 () Bool)

(assert (=> bm!39772 m!834055))

(assert (=> b!895757 d!111027))

(declare-fun b!895817 () Bool)

(declare-fun lt!404749 () SeekEntryResult!8825)

(assert (=> b!895817 (and (bvsge (index!37673 lt!404749) #b00000000000000000000000000000000) (bvslt (index!37673 lt!404749) (size!25670 (_keys!10074 thiss!1181))))))

(declare-fun res!605853 () Bool)

(assert (=> b!895817 (= res!605853 (= (select (arr!25222 (_keys!10074 thiss!1181)) (index!37673 lt!404749)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!500512 () Bool)

(assert (=> b!895817 (=> res!605853 e!500512)))

(declare-fun b!895818 () Bool)

(declare-fun e!500515 () SeekEntryResult!8825)

(declare-fun e!500514 () SeekEntryResult!8825)

(assert (=> b!895818 (= e!500515 e!500514)))

(declare-fun c!94758 () Bool)

(declare-fun lt!404750 () (_ BitVec 64))

(assert (=> b!895818 (= c!94758 (or (= lt!404750 key!785) (= (bvadd lt!404750 lt!404750) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!895819 () Bool)

(assert (=> b!895819 (= e!500514 (Intermediate!8825 false (toIndex!0 key!785 (mask!25958 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!895820 () Bool)

(declare-fun e!500516 () Bool)

(declare-fun e!500513 () Bool)

(assert (=> b!895820 (= e!500516 e!500513)))

(declare-fun res!605852 () Bool)

(assert (=> b!895820 (= res!605852 (and ((_ is Intermediate!8825) lt!404749) (not (undefined!9637 lt!404749)) (bvslt (x!76060 lt!404749) #b01111111111111111111111111111110) (bvsge (x!76060 lt!404749) #b00000000000000000000000000000000) (bvsge (x!76060 lt!404749) #b00000000000000000000000000000000)))))

(assert (=> b!895820 (=> (not res!605852) (not e!500513))))

(declare-fun b!895821 () Bool)

(assert (=> b!895821 (= e!500516 (bvsge (x!76060 lt!404749) #b01111111111111111111111111111110))))

(declare-fun d!111029 () Bool)

(assert (=> d!111029 e!500516))

(declare-fun c!94760 () Bool)

(assert (=> d!111029 (= c!94760 (and ((_ is Intermediate!8825) lt!404749) (undefined!9637 lt!404749)))))

(assert (=> d!111029 (= lt!404749 e!500515)))

(declare-fun c!94759 () Bool)

(assert (=> d!111029 (= c!94759 (bvsge #b00000000000000000000000000000000 #b01111111111111111111111111111110))))

(assert (=> d!111029 (= lt!404750 (select (arr!25222 (_keys!10074 thiss!1181)) (toIndex!0 key!785 (mask!25958 thiss!1181))))))

(assert (=> d!111029 (validMask!0 (mask!25958 thiss!1181))))

(assert (=> d!111029 (= (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25958 thiss!1181)) key!785 (_keys!10074 thiss!1181) (mask!25958 thiss!1181)) lt!404749)))

(declare-fun b!895822 () Bool)

(assert (=> b!895822 (and (bvsge (index!37673 lt!404749) #b00000000000000000000000000000000) (bvslt (index!37673 lt!404749) (size!25670 (_keys!10074 thiss!1181))))))

(declare-fun res!605854 () Bool)

(assert (=> b!895822 (= res!605854 (= (select (arr!25222 (_keys!10074 thiss!1181)) (index!37673 lt!404749)) key!785))))

(assert (=> b!895822 (=> res!605854 e!500512)))

(assert (=> b!895822 (= e!500513 e!500512)))

(declare-fun b!895823 () Bool)

(assert (=> b!895823 (and (bvsge (index!37673 lt!404749) #b00000000000000000000000000000000) (bvslt (index!37673 lt!404749) (size!25670 (_keys!10074 thiss!1181))))))

(assert (=> b!895823 (= e!500512 (= (select (arr!25222 (_keys!10074 thiss!1181)) (index!37673 lt!404749)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!895824 () Bool)

(assert (=> b!895824 (= e!500515 (Intermediate!8825 true (toIndex!0 key!785 (mask!25958 thiss!1181)) #b00000000000000000000000000000000))))

(declare-fun b!895825 () Bool)

(assert (=> b!895825 (= e!500514 (seekKeyOrZeroOrLongMinValue!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (nextIndex!0 (toIndex!0 key!785 (mask!25958 thiss!1181)) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (mask!25958 thiss!1181)) key!785 (_keys!10074 thiss!1181) (mask!25958 thiss!1181)))))

(assert (= (and d!111029 c!94759) b!895824))

(assert (= (and d!111029 (not c!94759)) b!895818))

(assert (= (and b!895818 c!94758) b!895819))

(assert (= (and b!895818 (not c!94758)) b!895825))

(assert (= (and d!111029 c!94760) b!895821))

(assert (= (and d!111029 (not c!94760)) b!895820))

(assert (= (and b!895820 res!605852) b!895822))

(assert (= (and b!895822 (not res!605854)) b!895817))

(assert (= (and b!895817 (not res!605853)) b!895823))

(declare-fun m!834057 () Bool)

(assert (=> b!895822 m!834057))

(assert (=> b!895823 m!834057))

(assert (=> b!895825 m!834025))

(declare-fun m!834059 () Bool)

(assert (=> b!895825 m!834059))

(assert (=> b!895825 m!834059))

(declare-fun m!834061 () Bool)

(assert (=> b!895825 m!834061))

(assert (=> b!895817 m!834057))

(assert (=> d!111029 m!834025))

(declare-fun m!834063 () Bool)

(assert (=> d!111029 m!834063))

(assert (=> d!111029 m!833985))

(assert (=> d!111017 d!111029))

(declare-fun d!111031 () Bool)

(declare-fun lt!404756 () (_ BitVec 32))

(declare-fun lt!404755 () (_ BitVec 32))

(assert (=> d!111031 (= lt!404756 (bvmul (bvxor lt!404755 (bvlshr lt!404755 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))))

(assert (=> d!111031 (= lt!404755 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))))

(assert (=> d!111031 (and (bvsge (mask!25958 thiss!1181) #b00000000000000000000000000000000) (let ((res!605855 (let ((h!18898 ((_ extract 31 0) (bvand (bvxor key!785 (bvlshr key!785 #b0000000000000000000000000000000000000000000000000000000000100000)) #b0000000000000000000000000000000011111111111111111111111111111111)))) (let ((x!76078 (bvmul (bvxor h!18898 (bvlshr h!18898 #b00000000000000000000000000010000)) #b10000101111010111100101001101011))) (bvand (bvxor x!76078 (bvlshr x!76078 #b00000000000000000000000000001101)) (mask!25958 thiss!1181)))))) (and (bvslt res!605855 (bvadd (mask!25958 thiss!1181) #b00000000000000000000000000000001)) (bvsge res!605855 #b00000000000000000000000000000000))))))

(assert (=> d!111031 (= (toIndex!0 key!785 (mask!25958 thiss!1181)) (bvand (bvxor lt!404756 (bvlshr lt!404756 #b00000000000000000000000000001101)) (mask!25958 thiss!1181)))))

(assert (=> d!111017 d!111031))

(assert (=> d!111017 d!111015))

(declare-fun b!895834 () Bool)

(declare-fun e!500525 () Bool)

(declare-fun call!39778 () Bool)

(assert (=> b!895834 (= e!500525 call!39778)))

(declare-fun b!895835 () Bool)

(declare-fun e!500524 () Bool)

(assert (=> b!895835 (= e!500524 call!39778)))

(declare-fun bm!39775 () Bool)

(assert (=> bm!39775 (= call!39778 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (_keys!10074 thiss!1181) (mask!25958 thiss!1181)))))

(declare-fun d!111033 () Bool)

(declare-fun res!605860 () Bool)

(declare-fun e!500523 () Bool)

(assert (=> d!111033 (=> res!605860 e!500523)))

(assert (=> d!111033 (= res!605860 (bvsge #b00000000000000000000000000000000 (size!25670 (_keys!10074 thiss!1181))))))

(assert (=> d!111033 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10074 thiss!1181) (mask!25958 thiss!1181)) e!500523)))

(declare-fun b!895836 () Bool)

(assert (=> b!895836 (= e!500523 e!500525)))

(declare-fun c!94763 () Bool)

(assert (=> b!895836 (= c!94763 (validKeyInArray!0 (select (arr!25222 (_keys!10074 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895837 () Bool)

(assert (=> b!895837 (= e!500525 e!500524)))

(declare-fun lt!404763 () (_ BitVec 64))

(assert (=> b!895837 (= lt!404763 (select (arr!25222 (_keys!10074 thiss!1181)) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!30442 0))(
  ( (Unit!30443) )
))
(declare-fun lt!404765 () Unit!30442)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52455 (_ BitVec 64) (_ BitVec 32)) Unit!30442)

(assert (=> b!895837 (= lt!404765 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10074 thiss!1181) lt!404763 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!52455 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!895837 (arrayContainsKey!0 (_keys!10074 thiss!1181) lt!404763 #b00000000000000000000000000000000)))

(declare-fun lt!404764 () Unit!30442)

(assert (=> b!895837 (= lt!404764 lt!404765)))

(declare-fun res!605861 () Bool)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!52455 (_ BitVec 32)) SeekEntryResult!8825)

(assert (=> b!895837 (= res!605861 (= (seekEntryOrOpen!0 (select (arr!25222 (_keys!10074 thiss!1181)) #b00000000000000000000000000000000) (_keys!10074 thiss!1181) (mask!25958 thiss!1181)) (Found!8825 #b00000000000000000000000000000000)))))

(assert (=> b!895837 (=> (not res!605861) (not e!500524))))

(assert (= (and d!111033 (not res!605860)) b!895836))

(assert (= (and b!895836 c!94763) b!895837))

(assert (= (and b!895836 (not c!94763)) b!895834))

(assert (= (and b!895837 res!605861) b!895835))

(assert (= (or b!895835 b!895834) bm!39775))

(declare-fun m!834065 () Bool)

(assert (=> bm!39775 m!834065))

(assert (=> b!895836 m!834049))

(assert (=> b!895836 m!834049))

(assert (=> b!895836 m!834051))

(assert (=> b!895837 m!834049))

(declare-fun m!834067 () Bool)

(assert (=> b!895837 m!834067))

(declare-fun m!834069 () Bool)

(assert (=> b!895837 m!834069))

(assert (=> b!895837 m!834049))

(declare-fun m!834071 () Bool)

(assert (=> b!895837 m!834071))

(assert (=> b!895756 d!111033))

(declare-fun b!895846 () Bool)

(declare-fun res!605873 () Bool)

(declare-fun e!500528 () Bool)

(assert (=> b!895846 (=> (not res!605873) (not e!500528))))

(assert (=> b!895846 (= res!605873 (and (= (size!25671 (_values!5331 thiss!1181)) (bvadd (mask!25958 thiss!1181) #b00000000000000000000000000000001)) (= (size!25670 (_keys!10074 thiss!1181)) (size!25671 (_values!5331 thiss!1181))) (bvsge (_size!2187 thiss!1181) #b00000000000000000000000000000000) (bvsle (_size!2187 thiss!1181) (bvadd (mask!25958 thiss!1181) #b00000000000000000000000000000001))))))

(declare-fun d!111035 () Bool)

(declare-fun res!605871 () Bool)

(assert (=> d!111035 (=> (not res!605871) (not e!500528))))

(assert (=> d!111035 (= res!605871 (validMask!0 (mask!25958 thiss!1181)))))

(assert (=> d!111035 (= (simpleValid!302 thiss!1181) e!500528)))

(declare-fun b!895848 () Bool)

(declare-fun res!605872 () Bool)

(assert (=> b!895848 (=> (not res!605872) (not e!500528))))

(declare-fun size!25676 (LongMapFixedSize!4264) (_ BitVec 32))

(assert (=> b!895848 (= res!605872 (= (size!25676 thiss!1181) (bvadd (_size!2187 thiss!1181) (bvsdiv (bvadd (extraKeys!5040 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000010))))))

(declare-fun b!895847 () Bool)

(declare-fun res!605870 () Bool)

(assert (=> b!895847 (=> (not res!605870) (not e!500528))))

(assert (=> b!895847 (= res!605870 (bvsge (size!25676 thiss!1181) (_size!2187 thiss!1181)))))

(declare-fun b!895849 () Bool)

(assert (=> b!895849 (= e!500528 (and (bvsge (extraKeys!5040 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5040 thiss!1181) #b00000000000000000000000000000011) (bvsge (_vacant!2187 thiss!1181) #b00000000000000000000000000000000)))))

(assert (= (and d!111035 res!605871) b!895846))

(assert (= (and b!895846 res!605873) b!895847))

(assert (= (and b!895847 res!605870) b!895848))

(assert (= (and b!895848 res!605872) b!895849))

(assert (=> d!111035 m!833985))

(declare-fun m!834073 () Bool)

(assert (=> b!895848 m!834073))

(assert (=> b!895847 m!834073))

(assert (=> d!111019 d!111035))

(declare-fun bm!39778 () Bool)

(declare-fun call!39781 () (_ BitVec 32))

(assert (=> bm!39778 (= call!39781 (arrayCountValidKeys!0 (_keys!10074 thiss!1181) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!25670 (_keys!10074 thiss!1181))))))

(declare-fun b!895859 () Bool)

(declare-fun e!500534 () (_ BitVec 32))

(declare-fun e!500533 () (_ BitVec 32))

(assert (=> b!895859 (= e!500534 e!500533)))

(declare-fun c!94769 () Bool)

(assert (=> b!895859 (= c!94769 (validKeyInArray!0 (select (arr!25222 (_keys!10074 thiss!1181)) #b00000000000000000000000000000000)))))

(declare-fun b!895860 () Bool)

(assert (=> b!895860 (= e!500533 (bvadd #b00000000000000000000000000000001 call!39781))))

(declare-fun b!895861 () Bool)

(assert (=> b!895861 (= e!500533 call!39781)))

(declare-fun b!895858 () Bool)

(assert (=> b!895858 (= e!500534 #b00000000000000000000000000000000)))

(declare-fun d!111037 () Bool)

(declare-fun lt!404768 () (_ BitVec 32))

(assert (=> d!111037 (and (bvsge lt!404768 #b00000000000000000000000000000000) (bvsle lt!404768 (bvsub (size!25670 (_keys!10074 thiss!1181)) #b00000000000000000000000000000000)))))

(assert (=> d!111037 (= lt!404768 e!500534)))

(declare-fun c!94768 () Bool)

(assert (=> d!111037 (= c!94768 (bvsge #b00000000000000000000000000000000 (size!25670 (_keys!10074 thiss!1181))))))

(assert (=> d!111037 (and (bvsle #b00000000000000000000000000000000 (size!25670 (_keys!10074 thiss!1181))) (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle (size!25670 (_keys!10074 thiss!1181)) (size!25670 (_keys!10074 thiss!1181))))))

(assert (=> d!111037 (= (arrayCountValidKeys!0 (_keys!10074 thiss!1181) #b00000000000000000000000000000000 (size!25670 (_keys!10074 thiss!1181))) lt!404768)))

(assert (= (and d!111037 c!94768) b!895858))

(assert (= (and d!111037 (not c!94768)) b!895859))

(assert (= (and b!895859 c!94769) b!895860))

(assert (= (and b!895859 (not c!94769)) b!895861))

(assert (= (or b!895860 b!895861) bm!39778))

(declare-fun m!834075 () Bool)

(assert (=> bm!39778 m!834075))

(assert (=> b!895859 m!834049))

(assert (=> b!895859 m!834049))

(assert (=> b!895859 m!834051))

(assert (=> b!895755 d!111037))

(declare-fun b!895863 () Bool)

(declare-fun e!500535 () Bool)

(assert (=> b!895863 (= e!500535 tp_is_empty!18211)))

(declare-fun b!895862 () Bool)

(declare-fun e!500536 () Bool)

(assert (=> b!895862 (= e!500536 tp_is_empty!18211)))

(declare-fun condMapEmpty!28907 () Bool)

(declare-fun mapDefault!28907 () ValueCell!8624)

(assert (=> mapNonEmpty!28906 (= condMapEmpty!28907 (= mapRest!28906 ((as const (Array (_ BitVec 32) ValueCell!8624)) mapDefault!28907)))))

(declare-fun mapRes!28907 () Bool)

(assert (=> mapNonEmpty!28906 (= tp!55660 (and e!500535 mapRes!28907))))

(declare-fun mapNonEmpty!28907 () Bool)

(declare-fun tp!55661 () Bool)

(assert (=> mapNonEmpty!28907 (= mapRes!28907 (and tp!55661 e!500536))))

(declare-fun mapValue!28907 () ValueCell!8624)

(declare-fun mapKey!28907 () (_ BitVec 32))

(declare-fun mapRest!28907 () (Array (_ BitVec 32) ValueCell!8624))

(assert (=> mapNonEmpty!28907 (= mapRest!28906 (store mapRest!28907 mapKey!28907 mapValue!28907))))

(declare-fun mapIsEmpty!28907 () Bool)

(assert (=> mapIsEmpty!28907 mapRes!28907))

(assert (= (and mapNonEmpty!28906 condMapEmpty!28907) mapIsEmpty!28907))

(assert (= (and mapNonEmpty!28906 (not condMapEmpty!28907)) mapNonEmpty!28907))

(assert (= (and mapNonEmpty!28907 ((_ is ValueCellFull!8624) mapValue!28907)) b!895862))

(assert (= (and mapNonEmpty!28906 ((_ is ValueCellFull!8624) mapDefault!28907)) b!895863))

(declare-fun m!834077 () Bool)

(assert (=> mapNonEmpty!28907 m!834077))

(check-sat (not b!895847) (not b!895825) (not b!895778) (not bm!39775) (not bm!39778) (not b_next!15883) (not b!895797) (not b!895795) (not b!895848) (not b!895859) (not bm!39772) b_and!26185 (not mapNonEmpty!28907) (not d!111035) (not d!111025) (not b!895796) tp_is_empty!18211 (not b!895837) (not d!111029) (not b!895836))
(check-sat b_and!26185 (not b_next!15883))
