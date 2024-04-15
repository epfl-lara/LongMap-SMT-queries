; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21848 () Bool)

(assert start!21848)

(declare-fun b!219925 () Bool)

(declare-fun b_free!5911 () Bool)

(declare-fun b_next!5911 () Bool)

(assert (=> b!219925 (= b_free!5911 (not b_next!5911))))

(declare-fun tp!20874 () Bool)

(declare-fun b_and!12783 () Bool)

(assert (=> b!219925 (= tp!20874 b_and!12783)))

(declare-fun b!219913 () Bool)

(declare-fun res!107798 () Bool)

(declare-fun e!143009 () Bool)

(assert (=> b!219913 (=> (not res!107798) (not e!143009))))

(declare-datatypes ((V!7345 0))(
  ( (V!7346 (val!2931 Int)) )
))
(declare-datatypes ((ValueCell!2543 0))(
  ( (ValueCellFull!2543 (v!4945 V!7345)) (EmptyCell!2543) )
))
(declare-datatypes ((array!10781 0))(
  ( (array!10782 (arr!5109 (Array (_ BitVec 32) ValueCell!2543)) (size!5443 (_ BitVec 32))) )
))
(declare-datatypes ((array!10783 0))(
  ( (array!10784 (arr!5110 (Array (_ BitVec 32) (_ BitVec 64))) (size!5444 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2986 0))(
  ( (LongMapFixedSize!2987 (defaultEntry!4152 Int) (mask!9949 (_ BitVec 32)) (extraKeys!3889 (_ BitVec 32)) (zeroValue!3993 V!7345) (minValue!3993 V!7345) (_size!1542 (_ BitVec 32)) (_keys!6205 array!10783) (_values!4135 array!10781) (_vacant!1542 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2986)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!219913 (= res!107798 (validMask!0 (mask!9949 thiss!1504)))))

(declare-fun b!219914 () Bool)

(declare-fun e!143010 () Bool)

(assert (=> b!219914 (= e!143010 e!143009)))

(declare-fun res!107797 () Bool)

(assert (=> b!219914 (=> (not res!107797) (not e!143009))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!219914 (= res!107797 (inRange!0 index!297 (mask!9949 thiss!1504)))))

(declare-datatypes ((Unit!6514 0))(
  ( (Unit!6515) )
))
(declare-fun lt!111916 () Unit!6514)

(declare-fun e!143007 () Unit!6514)

(assert (=> b!219914 (= lt!111916 e!143007)))

(declare-fun c!36605 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4310 0))(
  ( (tuple2!4311 (_1!2166 (_ BitVec 64)) (_2!2166 V!7345)) )
))
(declare-datatypes ((List!3233 0))(
  ( (Nil!3230) (Cons!3229 (h!3877 tuple2!4310) (t!8183 List!3233)) )
))
(declare-datatypes ((ListLongMap!3213 0))(
  ( (ListLongMap!3214 (toList!1622 List!3233)) )
))
(declare-fun contains!1465 (ListLongMap!3213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1131 (array!10783 array!10781 (_ BitVec 32) (_ BitVec 32) V!7345 V!7345 (_ BitVec 32) Int) ListLongMap!3213)

(assert (=> b!219914 (= c!36605 (contains!1465 (getCurrentListMap!1131 (_keys!6205 thiss!1504) (_values!4135 thiss!1504) (mask!9949 thiss!1504) (extraKeys!3889 thiss!1504) (zeroValue!3993 thiss!1504) (minValue!3993 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4152 thiss!1504)) key!932))))

(declare-fun res!107790 () Bool)

(declare-fun e!143013 () Bool)

(assert (=> start!21848 (=> (not res!107790) (not e!143013))))

(declare-fun valid!1220 (LongMapFixedSize!2986) Bool)

(assert (=> start!21848 (= res!107790 (valid!1220 thiss!1504))))

(assert (=> start!21848 e!143013))

(declare-fun e!143004 () Bool)

(assert (=> start!21848 e!143004))

(assert (=> start!21848 true))

(declare-fun b!219915 () Bool)

(declare-fun res!107792 () Bool)

(declare-fun e!143002 () Bool)

(assert (=> b!219915 (=> (not res!107792) (not e!143002))))

(declare-datatypes ((SeekEntryResult!801 0))(
  ( (MissingZero!801 (index!5374 (_ BitVec 32))) (Found!801 (index!5375 (_ BitVec 32))) (Intermediate!801 (undefined!1613 Bool) (index!5376 (_ BitVec 32)) (x!22932 (_ BitVec 32))) (Undefined!801) (MissingVacant!801 (index!5377 (_ BitVec 32))) )
))
(declare-fun lt!111915 () SeekEntryResult!801)

(assert (=> b!219915 (= res!107792 (= (select (arr!5110 (_keys!6205 thiss!1504)) (index!5374 lt!111915)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!219916 () Bool)

(declare-fun e!143005 () Bool)

(get-info :version)

(assert (=> b!219916 (= e!143005 ((_ is Undefined!801) lt!111915))))

(declare-fun b!219917 () Bool)

(declare-fun e!143006 () Bool)

(declare-fun tp_is_empty!5773 () Bool)

(assert (=> b!219917 (= e!143006 tp_is_empty!5773)))

(declare-fun b!219918 () Bool)

(declare-fun e!143011 () Bool)

(assert (=> b!219918 (= e!143011 tp_is_empty!5773)))

(declare-fun bm!20540 () Bool)

(declare-fun call!20543 () Bool)

(declare-fun arrayContainsKey!0 (array!10783 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!20540 (= call!20543 (arrayContainsKey!0 (_keys!6205 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219919 () Bool)

(declare-fun res!107796 () Bool)

(assert (=> b!219919 (=> (not res!107796) (not e!143009))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10783 (_ BitVec 32)) Bool)

(assert (=> b!219919 (= res!107796 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6205 thiss!1504) (mask!9949 thiss!1504)))))

(declare-fun b!219920 () Bool)

(assert (=> b!219920 (= e!143002 (not call!20543))))

(declare-fun mapIsEmpty!9829 () Bool)

(declare-fun mapRes!9829 () Bool)

(assert (=> mapIsEmpty!9829 mapRes!9829))

(declare-fun mapNonEmpty!9829 () Bool)

(declare-fun tp!20875 () Bool)

(assert (=> mapNonEmpty!9829 (= mapRes!9829 (and tp!20875 e!143006))))

(declare-fun mapValue!9829 () ValueCell!2543)

(declare-fun mapRest!9829 () (Array (_ BitVec 32) ValueCell!2543))

(declare-fun mapKey!9829 () (_ BitVec 32))

(assert (=> mapNonEmpty!9829 (= (arr!5109 (_values!4135 thiss!1504)) (store mapRest!9829 mapKey!9829 mapValue!9829))))

(declare-fun b!219921 () Bool)

(declare-fun Unit!6516 () Unit!6514)

(assert (=> b!219921 (= e!143007 Unit!6516)))

(declare-fun lt!111913 () Unit!6514)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!196 (array!10783 array!10781 (_ BitVec 32) (_ BitVec 32) V!7345 V!7345 (_ BitVec 64) Int) Unit!6514)

(assert (=> b!219921 (= lt!111913 (lemmaInListMapThenSeekEntryOrOpenFindsIt!196 (_keys!6205 thiss!1504) (_values!4135 thiss!1504) (mask!9949 thiss!1504) (extraKeys!3889 thiss!1504) (zeroValue!3993 thiss!1504) (minValue!3993 thiss!1504) key!932 (defaultEntry!4152 thiss!1504)))))

(assert (=> b!219921 false))

(declare-fun b!219922 () Bool)

(declare-fun e!143008 () Bool)

(assert (=> b!219922 (= e!143008 (not call!20543))))

(declare-fun b!219923 () Bool)

(declare-fun res!107787 () Bool)

(assert (=> b!219923 (=> (not res!107787) (not e!143002))))

(declare-fun call!20544 () Bool)

(assert (=> b!219923 (= res!107787 call!20544)))

(declare-fun e!143001 () Bool)

(assert (=> b!219923 (= e!143001 e!143002)))

(declare-fun b!219924 () Bool)

(declare-fun e!143012 () Bool)

(assert (=> b!219924 (= e!143012 (and e!143011 mapRes!9829))))

(declare-fun condMapEmpty!9829 () Bool)

(declare-fun mapDefault!9829 () ValueCell!2543)

(assert (=> b!219924 (= condMapEmpty!9829 (= (arr!5109 (_values!4135 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2543)) mapDefault!9829)))))

(declare-fun bm!20541 () Bool)

(declare-fun c!36607 () Bool)

(assert (=> bm!20541 (= call!20544 (inRange!0 (ite c!36607 (index!5374 lt!111915) (index!5377 lt!111915)) (mask!9949 thiss!1504)))))

(declare-fun array_inv!3365 (array!10783) Bool)

(declare-fun array_inv!3366 (array!10781) Bool)

(assert (=> b!219925 (= e!143004 (and tp!20874 tp_is_empty!5773 (array_inv!3365 (_keys!6205 thiss!1504)) (array_inv!3366 (_values!4135 thiss!1504)) e!143012))))

(declare-fun b!219926 () Bool)

(declare-fun c!36606 () Bool)

(assert (=> b!219926 (= c!36606 ((_ is MissingVacant!801) lt!111915))))

(assert (=> b!219926 (= e!143001 e!143005)))

(declare-fun b!219927 () Bool)

(declare-fun res!107794 () Bool)

(assert (=> b!219927 (= res!107794 (= (select (arr!5110 (_keys!6205 thiss!1504)) (index!5377 lt!111915)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219927 (=> (not res!107794) (not e!143008))))

(declare-fun b!219928 () Bool)

(declare-fun res!107788 () Bool)

(assert (=> b!219928 (=> (not res!107788) (not e!143009))))

(assert (=> b!219928 (= res!107788 (and (= (size!5443 (_values!4135 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9949 thiss!1504))) (= (size!5444 (_keys!6205 thiss!1504)) (size!5443 (_values!4135 thiss!1504))) (bvsge (mask!9949 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3889 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3889 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!219929 () Bool)

(declare-fun lt!111912 () Unit!6514)

(assert (=> b!219929 (= e!143007 lt!111912)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!196 (array!10783 array!10781 (_ BitVec 32) (_ BitVec 32) V!7345 V!7345 (_ BitVec 64) Int) Unit!6514)

(assert (=> b!219929 (= lt!111912 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!196 (_keys!6205 thiss!1504) (_values!4135 thiss!1504) (mask!9949 thiss!1504) (extraKeys!3889 thiss!1504) (zeroValue!3993 thiss!1504) (minValue!3993 thiss!1504) key!932 (defaultEntry!4152 thiss!1504)))))

(assert (=> b!219929 (= c!36607 ((_ is MissingZero!801) lt!111915))))

(assert (=> b!219929 e!143001))

(declare-fun b!219930 () Bool)

(assert (=> b!219930 (= e!143005 e!143008)))

(declare-fun res!107795 () Bool)

(assert (=> b!219930 (= res!107795 call!20544)))

(assert (=> b!219930 (=> (not res!107795) (not e!143008))))

(declare-fun b!219931 () Bool)

(declare-fun res!107793 () Bool)

(assert (=> b!219931 (=> (not res!107793) (not e!143013))))

(assert (=> b!219931 (= res!107793 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!219932 () Bool)

(assert (=> b!219932 (= e!143009 false)))

(declare-fun lt!111914 () Bool)

(declare-datatypes ((List!3234 0))(
  ( (Nil!3231) (Cons!3230 (h!3878 (_ BitVec 64)) (t!8184 List!3234)) )
))
(declare-fun arrayNoDuplicates!0 (array!10783 (_ BitVec 32) List!3234) Bool)

(assert (=> b!219932 (= lt!111914 (arrayNoDuplicates!0 (_keys!6205 thiss!1504) #b00000000000000000000000000000000 Nil!3231))))

(declare-fun b!219933 () Bool)

(declare-fun res!107789 () Bool)

(assert (=> b!219933 (=> (not res!107789) (not e!143009))))

(assert (=> b!219933 (= res!107789 (arrayContainsKey!0 (_keys!6205 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219934 () Bool)

(assert (=> b!219934 (= e!143013 e!143010)))

(declare-fun res!107791 () Bool)

(assert (=> b!219934 (=> (not res!107791) (not e!143010))))

(assert (=> b!219934 (= res!107791 (or (= lt!111915 (MissingZero!801 index!297)) (= lt!111915 (MissingVacant!801 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10783 (_ BitVec 32)) SeekEntryResult!801)

(assert (=> b!219934 (= lt!111915 (seekEntryOrOpen!0 key!932 (_keys!6205 thiss!1504) (mask!9949 thiss!1504)))))

(assert (= (and start!21848 res!107790) b!219931))

(assert (= (and b!219931 res!107793) b!219934))

(assert (= (and b!219934 res!107791) b!219914))

(assert (= (and b!219914 c!36605) b!219921))

(assert (= (and b!219914 (not c!36605)) b!219929))

(assert (= (and b!219929 c!36607) b!219923))

(assert (= (and b!219929 (not c!36607)) b!219926))

(assert (= (and b!219923 res!107787) b!219915))

(assert (= (and b!219915 res!107792) b!219920))

(assert (= (and b!219926 c!36606) b!219930))

(assert (= (and b!219926 (not c!36606)) b!219916))

(assert (= (and b!219930 res!107795) b!219927))

(assert (= (and b!219927 res!107794) b!219922))

(assert (= (or b!219923 b!219930) bm!20541))

(assert (= (or b!219920 b!219922) bm!20540))

(assert (= (and b!219914 res!107797) b!219933))

(assert (= (and b!219933 res!107789) b!219913))

(assert (= (and b!219913 res!107798) b!219928))

(assert (= (and b!219928 res!107788) b!219919))

(assert (= (and b!219919 res!107796) b!219932))

(assert (= (and b!219924 condMapEmpty!9829) mapIsEmpty!9829))

(assert (= (and b!219924 (not condMapEmpty!9829)) mapNonEmpty!9829))

(assert (= (and mapNonEmpty!9829 ((_ is ValueCellFull!2543) mapValue!9829)) b!219917))

(assert (= (and b!219924 ((_ is ValueCellFull!2543) mapDefault!9829)) b!219918))

(assert (= b!219925 b!219924))

(assert (= start!21848 b!219925))

(declare-fun m!244753 () Bool)

(assert (=> bm!20540 m!244753))

(declare-fun m!244755 () Bool)

(assert (=> b!219915 m!244755))

(declare-fun m!244757 () Bool)

(assert (=> bm!20541 m!244757))

(declare-fun m!244759 () Bool)

(assert (=> b!219921 m!244759))

(declare-fun m!244761 () Bool)

(assert (=> b!219934 m!244761))

(declare-fun m!244763 () Bool)

(assert (=> b!219932 m!244763))

(declare-fun m!244765 () Bool)

(assert (=> b!219925 m!244765))

(declare-fun m!244767 () Bool)

(assert (=> b!219925 m!244767))

(declare-fun m!244769 () Bool)

(assert (=> mapNonEmpty!9829 m!244769))

(assert (=> b!219933 m!244753))

(declare-fun m!244771 () Bool)

(assert (=> b!219929 m!244771))

(declare-fun m!244773 () Bool)

(assert (=> b!219927 m!244773))

(declare-fun m!244775 () Bool)

(assert (=> b!219914 m!244775))

(declare-fun m!244777 () Bool)

(assert (=> b!219914 m!244777))

(assert (=> b!219914 m!244777))

(declare-fun m!244779 () Bool)

(assert (=> b!219914 m!244779))

(declare-fun m!244781 () Bool)

(assert (=> start!21848 m!244781))

(declare-fun m!244783 () Bool)

(assert (=> b!219919 m!244783))

(declare-fun m!244785 () Bool)

(assert (=> b!219913 m!244785))

(check-sat (not bm!20541) (not b!219929) (not bm!20540) (not b!219921) (not b!219919) (not b!219914) (not b!219913) tp_is_empty!5773 (not b!219925) (not b!219933) (not mapNonEmpty!9829) (not start!21848) b_and!12783 (not b!219934) (not b_next!5911) (not b!219932))
(check-sat b_and!12783 (not b_next!5911))
