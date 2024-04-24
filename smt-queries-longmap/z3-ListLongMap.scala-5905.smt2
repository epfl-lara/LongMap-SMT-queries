; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76540 () Bool)

(assert start!76540)

(declare-fun b!896883 () Bool)

(declare-fun b_free!15931 () Bool)

(declare-fun b_next!15931 () Bool)

(assert (=> b!896883 (= b_free!15931 (not b_next!15931))))

(declare-fun tp!55815 () Bool)

(declare-fun b_and!26233 () Bool)

(assert (=> b!896883 (= tp!55815 b_and!26233)))

(declare-fun res!606300 () Bool)

(declare-fun e!501287 () Bool)

(assert (=> start!76540 (=> (not res!606300) (not e!501287))))

(declare-datatypes ((array!52567 0))(
  ( (array!52568 (arr!25270 (Array (_ BitVec 32) (_ BitVec 64))) (size!25721 (_ BitVec 32))) )
))
(declare-datatypes ((V!29311 0))(
  ( (V!29312 (val!9180 Int)) )
))
(declare-datatypes ((ValueCell!8648 0))(
  ( (ValueCellFull!8648 (v!11667 V!29311)) (EmptyCell!8648) )
))
(declare-datatypes ((array!52569 0))(
  ( (array!52570 (arr!25271 (Array (_ BitVec 32) ValueCell!8648)) (size!25722 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4312 0))(
  ( (LongMapFixedSize!4313 (defaultEntry!5368 Int) (mask!26030 (_ BitVec 32)) (extraKeys!5065 (_ BitVec 32)) (zeroValue!5169 V!29311) (minValue!5169 V!29311) (_size!2211 (_ BitVec 32)) (_keys!10119 array!52567) (_values!5356 array!52569) (_vacant!2211 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4312)

(declare-fun valid!1676 (LongMapFixedSize!4312) Bool)

(assert (=> start!76540 (= res!606300 (valid!1676 thiss!1181))))

(assert (=> start!76540 e!501287))

(declare-fun e!501286 () Bool)

(assert (=> start!76540 e!501286))

(assert (=> start!76540 true))

(declare-fun e!501290 () Bool)

(declare-fun tp_is_empty!18259 () Bool)

(declare-fun array_inv!19884 (array!52567) Bool)

(declare-fun array_inv!19885 (array!52569) Bool)

(assert (=> b!896883 (= e!501286 (and tp!55815 tp_is_empty!18259 (array_inv!19884 (_keys!10119 thiss!1181)) (array_inv!19885 (_values!5356 thiss!1181)) e!501290))))

(declare-fun b!896884 () Bool)

(declare-fun e!501284 () Bool)

(declare-fun mapRes!28996 () Bool)

(assert (=> b!896884 (= e!501290 (and e!501284 mapRes!28996))))

(declare-fun condMapEmpty!28996 () Bool)

(declare-fun mapDefault!28996 () ValueCell!8648)

(assert (=> b!896884 (= condMapEmpty!28996 (= (arr!25271 (_values!5356 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8648)) mapDefault!28996)))))

(declare-fun b!896885 () Bool)

(declare-fun e!501289 () Bool)

(declare-datatypes ((SeekEntryResult!8842 0))(
  ( (MissingZero!8842 (index!37739 (_ BitVec 32))) (Found!8842 (index!37740 (_ BitVec 32))) (Intermediate!8842 (undefined!9654 Bool) (index!37741 (_ BitVec 32)) (x!76232 (_ BitVec 32))) (Undefined!8842) (MissingVacant!8842 (index!37742 (_ BitVec 32))) )
))
(declare-fun lt!405023 () SeekEntryResult!8842)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896885 (= e!501289 (inRange!0 (index!37740 lt!405023) (mask!26030 thiss!1181)))))

(declare-fun mapIsEmpty!28996 () Bool)

(assert (=> mapIsEmpty!28996 mapRes!28996))

(declare-fun b!896886 () Bool)

(get-info :version)

(assert (=> b!896886 (= e!501287 (not (or (not ((_ is Found!8842) lt!405023)) (bvslt (index!37740 lt!405023) #b00000000000000000000000000000000) (bvslt (index!37740 lt!405023) (size!25721 (_keys!10119 thiss!1181))))))))

(assert (=> b!896886 e!501289))

(declare-fun res!606301 () Bool)

(assert (=> b!896886 (=> res!606301 e!501289)))

(assert (=> b!896886 (= res!606301 (not ((_ is Found!8842) lt!405023)))))

(declare-datatypes ((Unit!30458 0))(
  ( (Unit!30459) )
))
(declare-fun lt!405022 () Unit!30458)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!70 (array!52567 array!52569 (_ BitVec 32) (_ BitVec 32) V!29311 V!29311 (_ BitVec 64)) Unit!30458)

(assert (=> b!896886 (= lt!405022 (lemmaSeekEntryGivesInRangeIndex!70 (_keys!10119 thiss!1181) (_values!5356 thiss!1181) (mask!26030 thiss!1181) (extraKeys!5065 thiss!1181) (zeroValue!5169 thiss!1181) (minValue!5169 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52567 (_ BitVec 32)) SeekEntryResult!8842)

(assert (=> b!896886 (= lt!405023 (seekEntry!0 key!785 (_keys!10119 thiss!1181) (mask!26030 thiss!1181)))))

(declare-fun b!896887 () Bool)

(declare-fun e!501285 () Bool)

(assert (=> b!896887 (= e!501285 tp_is_empty!18259)))

(declare-fun mapNonEmpty!28996 () Bool)

(declare-fun tp!55816 () Bool)

(assert (=> mapNonEmpty!28996 (= mapRes!28996 (and tp!55816 e!501285))))

(declare-fun mapKey!28996 () (_ BitVec 32))

(declare-fun mapValue!28996 () ValueCell!8648)

(declare-fun mapRest!28996 () (Array (_ BitVec 32) ValueCell!8648))

(assert (=> mapNonEmpty!28996 (= (arr!25271 (_values!5356 thiss!1181)) (store mapRest!28996 mapKey!28996 mapValue!28996))))

(declare-fun b!896888 () Bool)

(declare-fun res!606299 () Bool)

(assert (=> b!896888 (=> (not res!606299) (not e!501287))))

(assert (=> b!896888 (= res!606299 (not (= key!785 (bvneg key!785))))))

(declare-fun b!896889 () Bool)

(assert (=> b!896889 (= e!501284 tp_is_empty!18259)))

(assert (= (and start!76540 res!606300) b!896888))

(assert (= (and b!896888 res!606299) b!896886))

(assert (= (and b!896886 (not res!606301)) b!896885))

(assert (= (and b!896884 condMapEmpty!28996) mapIsEmpty!28996))

(assert (= (and b!896884 (not condMapEmpty!28996)) mapNonEmpty!28996))

(assert (= (and mapNonEmpty!28996 ((_ is ValueCellFull!8648) mapValue!28996)) b!896887))

(assert (= (and b!896884 ((_ is ValueCellFull!8648) mapDefault!28996)) b!896889))

(assert (= b!896883 b!896884))

(assert (= start!76540 b!896883))

(declare-fun m!834629 () Bool)

(assert (=> b!896886 m!834629))

(declare-fun m!834631 () Bool)

(assert (=> b!896886 m!834631))

(declare-fun m!834633 () Bool)

(assert (=> mapNonEmpty!28996 m!834633))

(declare-fun m!834635 () Bool)

(assert (=> b!896885 m!834635))

(declare-fun m!834637 () Bool)

(assert (=> start!76540 m!834637))

(declare-fun m!834639 () Bool)

(assert (=> b!896883 m!834639))

(declare-fun m!834641 () Bool)

(assert (=> b!896883 m!834641))

(check-sat (not b!896883) (not b!896885) b_and!26233 (not start!76540) (not b!896886) (not b_next!15931) tp_is_empty!18259 (not mapNonEmpty!28996))
(check-sat b_and!26233 (not b_next!15931))
(get-model)

(declare-fun d!111167 () Bool)

(declare-fun res!606326 () Bool)

(declare-fun e!501335 () Bool)

(assert (=> d!111167 (=> (not res!606326) (not e!501335))))

(declare-fun simpleValid!310 (LongMapFixedSize!4312) Bool)

(assert (=> d!111167 (= res!606326 (simpleValid!310 thiss!1181))))

(assert (=> d!111167 (= (valid!1676 thiss!1181) e!501335)))

(declare-fun b!896938 () Bool)

(declare-fun res!606327 () Bool)

(assert (=> b!896938 (=> (not res!606327) (not e!501335))))

(declare-fun arrayCountValidKeys!0 (array!52567 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!896938 (= res!606327 (= (arrayCountValidKeys!0 (_keys!10119 thiss!1181) #b00000000000000000000000000000000 (size!25721 (_keys!10119 thiss!1181))) (_size!2211 thiss!1181)))))

(declare-fun b!896939 () Bool)

(declare-fun res!606328 () Bool)

(assert (=> b!896939 (=> (not res!606328) (not e!501335))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52567 (_ BitVec 32)) Bool)

(assert (=> b!896939 (= res!606328 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10119 thiss!1181) (mask!26030 thiss!1181)))))

(declare-fun b!896940 () Bool)

(declare-datatypes ((List!17770 0))(
  ( (Nil!17767) (Cons!17766 (h!18909 (_ BitVec 64)) (t!25101 List!17770)) )
))
(declare-fun arrayNoDuplicates!0 (array!52567 (_ BitVec 32) List!17770) Bool)

(assert (=> b!896940 (= e!501335 (arrayNoDuplicates!0 (_keys!10119 thiss!1181) #b00000000000000000000000000000000 Nil!17767))))

(assert (= (and d!111167 res!606326) b!896938))

(assert (= (and b!896938 res!606327) b!896939))

(assert (= (and b!896939 res!606328) b!896940))

(declare-fun m!834671 () Bool)

(assert (=> d!111167 m!834671))

(declare-fun m!834673 () Bool)

(assert (=> b!896938 m!834673))

(declare-fun m!834675 () Bool)

(assert (=> b!896939 m!834675))

(declare-fun m!834677 () Bool)

(assert (=> b!896940 m!834677))

(assert (=> start!76540 d!111167))

(declare-fun d!111169 () Bool)

(declare-fun e!501338 () Bool)

(assert (=> d!111169 e!501338))

(declare-fun res!606331 () Bool)

(assert (=> d!111169 (=> res!606331 e!501338)))

(declare-fun lt!405041 () SeekEntryResult!8842)

(assert (=> d!111169 (= res!606331 (not ((_ is Found!8842) lt!405041)))))

(assert (=> d!111169 (= lt!405041 (seekEntry!0 key!785 (_keys!10119 thiss!1181) (mask!26030 thiss!1181)))))

(declare-fun lt!405040 () Unit!30458)

(declare-fun choose!1481 (array!52567 array!52569 (_ BitVec 32) (_ BitVec 32) V!29311 V!29311 (_ BitVec 64)) Unit!30458)

(assert (=> d!111169 (= lt!405040 (choose!1481 (_keys!10119 thiss!1181) (_values!5356 thiss!1181) (mask!26030 thiss!1181) (extraKeys!5065 thiss!1181) (zeroValue!5169 thiss!1181) (minValue!5169 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!111169 (validMask!0 (mask!26030 thiss!1181))))

(assert (=> d!111169 (= (lemmaSeekEntryGivesInRangeIndex!70 (_keys!10119 thiss!1181) (_values!5356 thiss!1181) (mask!26030 thiss!1181) (extraKeys!5065 thiss!1181) (zeroValue!5169 thiss!1181) (minValue!5169 thiss!1181) key!785) lt!405040)))

(declare-fun b!896943 () Bool)

(assert (=> b!896943 (= e!501338 (inRange!0 (index!37740 lt!405041) (mask!26030 thiss!1181)))))

(assert (= (and d!111169 (not res!606331)) b!896943))

(assert (=> d!111169 m!834631))

(declare-fun m!834679 () Bool)

(assert (=> d!111169 m!834679))

(declare-fun m!834681 () Bool)

(assert (=> d!111169 m!834681))

(declare-fun m!834683 () Bool)

(assert (=> b!896943 m!834683))

(assert (=> b!896886 d!111169))

(declare-fun b!896956 () Bool)

(declare-fun e!501347 () SeekEntryResult!8842)

(declare-fun lt!405052 () SeekEntryResult!8842)

(assert (=> b!896956 (= e!501347 (MissingZero!8842 (index!37741 lt!405052)))))

(declare-fun b!896957 () Bool)

(declare-fun e!501345 () SeekEntryResult!8842)

(assert (=> b!896957 (= e!501345 (Found!8842 (index!37741 lt!405052)))))

(declare-fun b!896958 () Bool)

(declare-fun e!501346 () SeekEntryResult!8842)

(assert (=> b!896958 (= e!501346 e!501345)))

(declare-fun lt!405053 () (_ BitVec 64))

(assert (=> b!896958 (= lt!405053 (select (arr!25270 (_keys!10119 thiss!1181)) (index!37741 lt!405052)))))

(declare-fun c!94915 () Bool)

(assert (=> b!896958 (= c!94915 (= lt!405053 key!785))))

(declare-fun b!896959 () Bool)

(assert (=> b!896959 (= e!501346 Undefined!8842)))

(declare-fun b!896961 () Bool)

(declare-fun c!94914 () Bool)

(assert (=> b!896961 (= c!94914 (= lt!405053 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!896961 (= e!501345 e!501347)))

(declare-fun b!896960 () Bool)

(declare-fun lt!405050 () SeekEntryResult!8842)

(assert (=> b!896960 (= e!501347 (ite ((_ is MissingVacant!8842) lt!405050) (MissingZero!8842 (index!37742 lt!405050)) lt!405050))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52567 (_ BitVec 32)) SeekEntryResult!8842)

(assert (=> b!896960 (= lt!405050 (seekKeyOrZeroReturnVacant!0 (x!76232 lt!405052) (index!37741 lt!405052) (index!37741 lt!405052) key!785 (_keys!10119 thiss!1181) (mask!26030 thiss!1181)))))

(declare-fun d!111171 () Bool)

(declare-fun lt!405051 () SeekEntryResult!8842)

(assert (=> d!111171 (and (or ((_ is MissingVacant!8842) lt!405051) (not ((_ is Found!8842) lt!405051)) (and (bvsge (index!37740 lt!405051) #b00000000000000000000000000000000) (bvslt (index!37740 lt!405051) (size!25721 (_keys!10119 thiss!1181))))) (not ((_ is MissingVacant!8842) lt!405051)) (or (not ((_ is Found!8842) lt!405051)) (= (select (arr!25270 (_keys!10119 thiss!1181)) (index!37740 lt!405051)) key!785)))))

(assert (=> d!111171 (= lt!405051 e!501346)))

(declare-fun c!94916 () Bool)

(assert (=> d!111171 (= c!94916 (and ((_ is Intermediate!8842) lt!405052) (undefined!9654 lt!405052)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52567 (_ BitVec 32)) SeekEntryResult!8842)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!111171 (= lt!405052 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!26030 thiss!1181)) key!785 (_keys!10119 thiss!1181) (mask!26030 thiss!1181)))))

(assert (=> d!111171 (validMask!0 (mask!26030 thiss!1181))))

(assert (=> d!111171 (= (seekEntry!0 key!785 (_keys!10119 thiss!1181) (mask!26030 thiss!1181)) lt!405051)))

(assert (= (and d!111171 c!94916) b!896959))

(assert (= (and d!111171 (not c!94916)) b!896958))

(assert (= (and b!896958 c!94915) b!896957))

(assert (= (and b!896958 (not c!94915)) b!896961))

(assert (= (and b!896961 c!94914) b!896956))

(assert (= (and b!896961 (not c!94914)) b!896960))

(declare-fun m!834685 () Bool)

(assert (=> b!896958 m!834685))

(declare-fun m!834687 () Bool)

(assert (=> b!896960 m!834687))

(declare-fun m!834689 () Bool)

(assert (=> d!111171 m!834689))

(declare-fun m!834691 () Bool)

(assert (=> d!111171 m!834691))

(assert (=> d!111171 m!834691))

(declare-fun m!834693 () Bool)

(assert (=> d!111171 m!834693))

(assert (=> d!111171 m!834681))

(assert (=> b!896886 d!111171))

(declare-fun d!111173 () Bool)

(assert (=> d!111173 (= (inRange!0 (index!37740 lt!405023) (mask!26030 thiss!1181)) (and (bvsge (index!37740 lt!405023) #b00000000000000000000000000000000) (bvslt (index!37740 lt!405023) (bvadd (mask!26030 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!896885 d!111173))

(declare-fun d!111175 () Bool)

(assert (=> d!111175 (= (array_inv!19884 (_keys!10119 thiss!1181)) (bvsge (size!25721 (_keys!10119 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896883 d!111175))

(declare-fun d!111177 () Bool)

(assert (=> d!111177 (= (array_inv!19885 (_values!5356 thiss!1181)) (bvsge (size!25722 (_values!5356 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!896883 d!111177))

(declare-fun mapNonEmpty!29005 () Bool)

(declare-fun mapRes!29005 () Bool)

(declare-fun tp!55831 () Bool)

(declare-fun e!501353 () Bool)

(assert (=> mapNonEmpty!29005 (= mapRes!29005 (and tp!55831 e!501353))))

(declare-fun mapRest!29005 () (Array (_ BitVec 32) ValueCell!8648))

(declare-fun mapValue!29005 () ValueCell!8648)

(declare-fun mapKey!29005 () (_ BitVec 32))

(assert (=> mapNonEmpty!29005 (= mapRest!28996 (store mapRest!29005 mapKey!29005 mapValue!29005))))

(declare-fun b!896968 () Bool)

(assert (=> b!896968 (= e!501353 tp_is_empty!18259)))

(declare-fun b!896969 () Bool)

(declare-fun e!501352 () Bool)

(assert (=> b!896969 (= e!501352 tp_is_empty!18259)))

(declare-fun condMapEmpty!29005 () Bool)

(declare-fun mapDefault!29005 () ValueCell!8648)

(assert (=> mapNonEmpty!28996 (= condMapEmpty!29005 (= mapRest!28996 ((as const (Array (_ BitVec 32) ValueCell!8648)) mapDefault!29005)))))

(assert (=> mapNonEmpty!28996 (= tp!55816 (and e!501352 mapRes!29005))))

(declare-fun mapIsEmpty!29005 () Bool)

(assert (=> mapIsEmpty!29005 mapRes!29005))

(assert (= (and mapNonEmpty!28996 condMapEmpty!29005) mapIsEmpty!29005))

(assert (= (and mapNonEmpty!28996 (not condMapEmpty!29005)) mapNonEmpty!29005))

(assert (= (and mapNonEmpty!29005 ((_ is ValueCellFull!8648) mapValue!29005)) b!896968))

(assert (= (and mapNonEmpty!28996 ((_ is ValueCellFull!8648) mapDefault!29005)) b!896969))

(declare-fun m!834695 () Bool)

(assert (=> mapNonEmpty!29005 m!834695))

(check-sat (not b!896939) b_and!26233 (not b!896940) (not b_next!15931) tp_is_empty!18259 (not d!111171) (not mapNonEmpty!29005) (not b!896938) (not b!896943) (not d!111169) (not d!111167) (not b!896960))
(check-sat b_and!26233 (not b_next!15931))
