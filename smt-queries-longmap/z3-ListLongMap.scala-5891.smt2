; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75894 () Bool)

(assert start!75894)

(declare-fun b!892938 () Bool)

(declare-fun b_free!15847 () Bool)

(declare-fun b_next!15847 () Bool)

(assert (=> b!892938 (= b_free!15847 (not b_next!15847))))

(declare-fun tp!55513 () Bool)

(declare-fun b_and!26083 () Bool)

(assert (=> b!892938 (= tp!55513 b_and!26083)))

(declare-fun mapIsEmpty!28820 () Bool)

(declare-fun mapRes!28820 () Bool)

(assert (=> mapIsEmpty!28820 mapRes!28820))

(declare-fun b!892930 () Bool)

(declare-fun e!498622 () Bool)

(declare-datatypes ((SeekEntryResult!8867 0))(
  ( (MissingZero!8867 (index!37839 (_ BitVec 32))) (Found!8867 (index!37840 (_ BitVec 32))) (Intermediate!8867 (undefined!9679 Bool) (index!37841 (_ BitVec 32)) (x!75930 (_ BitVec 32))) (Undefined!8867) (MissingVacant!8867 (index!37842 (_ BitVec 32))) )
))
(declare-fun lt!403315 () SeekEntryResult!8867)

(declare-datatypes ((array!52315 0))(
  ( (array!52316 (arr!25163 (Array (_ BitVec 32) (_ BitVec 64))) (size!25609 (_ BitVec 32))) )
))
(declare-datatypes ((V!29199 0))(
  ( (V!29200 (val!9138 Int)) )
))
(declare-datatypes ((ValueCell!8606 0))(
  ( (ValueCellFull!8606 (v!11613 V!29199)) (EmptyCell!8606) )
))
(declare-datatypes ((array!52317 0))(
  ( (array!52318 (arr!25164 (Array (_ BitVec 32) ValueCell!8606)) (size!25610 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4228 0))(
  ( (LongMapFixedSize!4229 (defaultEntry!5314 Int) (mask!25833 (_ BitVec 32)) (extraKeys!5009 (_ BitVec 32)) (zeroValue!5113 V!29199) (minValue!5113 V!29199) (_size!2169 (_ BitVec 32)) (_keys!9994 array!52315) (_values!5300 array!52317) (_vacant!2169 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4228)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892930 (= e!498622 (inRange!0 (index!37840 lt!403315) (mask!25833 thiss!1181)))))

(declare-fun b!892931 () Bool)

(declare-fun e!498621 () Bool)

(declare-fun tp_is_empty!18175 () Bool)

(assert (=> b!892931 (= e!498621 tp_is_empty!18175)))

(declare-fun b!892932 () Bool)

(declare-fun res!604814 () Bool)

(declare-fun e!498619 () Bool)

(assert (=> b!892932 (=> res!604814 e!498619)))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4349 (LongMapFixedSize!4228 (_ BitVec 64)) Bool)

(assert (=> b!892932 (= res!604814 (not (contains!4349 thiss!1181 key!785)))))

(declare-fun b!892933 () Bool)

(declare-datatypes ((Option!452 0))(
  ( (Some!451 (v!11614 V!29199)) (None!450) )
))
(declare-fun isDefined!327 (Option!452) Bool)

(declare-datatypes ((tuple2!12028 0))(
  ( (tuple2!12029 (_1!6025 (_ BitVec 64)) (_2!6025 V!29199)) )
))
(declare-datatypes ((List!17801 0))(
  ( (Nil!17798) (Cons!17797 (h!18928 tuple2!12028) (t!25109 List!17801)) )
))
(declare-fun getValueByKey!446 (List!17801 (_ BitVec 64)) Option!452)

(declare-datatypes ((ListLongMap!10715 0))(
  ( (ListLongMap!10716 (toList!5373 List!17801)) )
))
(declare-fun map!12194 (LongMapFixedSize!4228) ListLongMap!10715)

(assert (=> b!892933 (= e!498619 (isDefined!327 (getValueByKey!446 (toList!5373 (map!12194 thiss!1181)) key!785)))))

(declare-fun res!604818 () Bool)

(declare-fun e!498623 () Bool)

(assert (=> start!75894 (=> (not res!604818) (not e!498623))))

(declare-fun valid!1640 (LongMapFixedSize!4228) Bool)

(assert (=> start!75894 (= res!604818 (valid!1640 thiss!1181))))

(assert (=> start!75894 e!498623))

(declare-fun e!498625 () Bool)

(assert (=> start!75894 e!498625))

(assert (=> start!75894 true))

(declare-fun mapNonEmpty!28820 () Bool)

(declare-fun tp!55514 () Bool)

(declare-fun e!498626 () Bool)

(assert (=> mapNonEmpty!28820 (= mapRes!28820 (and tp!55514 e!498626))))

(declare-fun mapKey!28820 () (_ BitVec 32))

(declare-fun mapValue!28820 () ValueCell!8606)

(declare-fun mapRest!28820 () (Array (_ BitVec 32) ValueCell!8606))

(assert (=> mapNonEmpty!28820 (= (arr!25164 (_values!5300 thiss!1181)) (store mapRest!28820 mapKey!28820 mapValue!28820))))

(declare-fun b!892934 () Bool)

(declare-fun res!604817 () Bool)

(assert (=> b!892934 (=> (not res!604817) (not e!498623))))

(assert (=> b!892934 (= res!604817 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892935 () Bool)

(assert (=> b!892935 (= e!498623 (not e!498619))))

(declare-fun res!604815 () Bool)

(assert (=> b!892935 (=> res!604815 e!498619)))

(get-info :version)

(assert (=> b!892935 (= res!604815 ((_ is Found!8867) lt!403315))))

(assert (=> b!892935 e!498622))

(declare-fun res!604816 () Bool)

(assert (=> b!892935 (=> res!604816 e!498622)))

(assert (=> b!892935 (= res!604816 (not ((_ is Found!8867) lt!403315)))))

(declare-datatypes ((Unit!30364 0))(
  ( (Unit!30365) )
))
(declare-fun lt!403316 () Unit!30364)

(declare-fun lemmaSeekEntryGivesInRangeIndex!63 (array!52315 array!52317 (_ BitVec 32) (_ BitVec 32) V!29199 V!29199 (_ BitVec 64)) Unit!30364)

(assert (=> b!892935 (= lt!403316 (lemmaSeekEntryGivesInRangeIndex!63 (_keys!9994 thiss!1181) (_values!5300 thiss!1181) (mask!25833 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52315 (_ BitVec 32)) SeekEntryResult!8867)

(assert (=> b!892935 (= lt!403315 (seekEntry!0 key!785 (_keys!9994 thiss!1181) (mask!25833 thiss!1181)))))

(declare-fun b!892936 () Bool)

(declare-fun e!498624 () Bool)

(assert (=> b!892936 (= e!498624 (and e!498621 mapRes!28820))))

(declare-fun condMapEmpty!28820 () Bool)

(declare-fun mapDefault!28820 () ValueCell!8606)

(assert (=> b!892936 (= condMapEmpty!28820 (= (arr!25164 (_values!5300 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8606)) mapDefault!28820)))))

(declare-fun b!892937 () Bool)

(assert (=> b!892937 (= e!498626 tp_is_empty!18175)))

(declare-fun array_inv!19818 (array!52315) Bool)

(declare-fun array_inv!19819 (array!52317) Bool)

(assert (=> b!892938 (= e!498625 (and tp!55513 tp_is_empty!18175 (array_inv!19818 (_keys!9994 thiss!1181)) (array_inv!19819 (_values!5300 thiss!1181)) e!498624))))

(assert (= (and start!75894 res!604818) b!892934))

(assert (= (and b!892934 res!604817) b!892935))

(assert (= (and b!892935 (not res!604816)) b!892930))

(assert (= (and b!892935 (not res!604815)) b!892932))

(assert (= (and b!892932 (not res!604814)) b!892933))

(assert (= (and b!892936 condMapEmpty!28820) mapIsEmpty!28820))

(assert (= (and b!892936 (not condMapEmpty!28820)) mapNonEmpty!28820))

(assert (= (and mapNonEmpty!28820 ((_ is ValueCellFull!8606) mapValue!28820)) b!892937))

(assert (= (and b!892936 ((_ is ValueCellFull!8606) mapDefault!28820)) b!892931))

(assert (= b!892938 b!892936))

(assert (= start!75894 b!892938))

(declare-fun m!830523 () Bool)

(assert (=> b!892938 m!830523))

(declare-fun m!830525 () Bool)

(assert (=> b!892938 m!830525))

(declare-fun m!830527 () Bool)

(assert (=> b!892930 m!830527))

(declare-fun m!830529 () Bool)

(assert (=> b!892935 m!830529))

(declare-fun m!830531 () Bool)

(assert (=> b!892935 m!830531))

(declare-fun m!830533 () Bool)

(assert (=> b!892933 m!830533))

(declare-fun m!830535 () Bool)

(assert (=> b!892933 m!830535))

(assert (=> b!892933 m!830535))

(declare-fun m!830537 () Bool)

(assert (=> b!892933 m!830537))

(declare-fun m!830539 () Bool)

(assert (=> start!75894 m!830539))

(declare-fun m!830541 () Bool)

(assert (=> mapNonEmpty!28820 m!830541))

(declare-fun m!830543 () Bool)

(assert (=> b!892932 m!830543))

(check-sat (not b_next!15847) b_and!26083 (not b!892938) (not b!892935) (not b!892932) (not b!892933) (not start!75894) tp_is_empty!18175 (not mapNonEmpty!28820) (not b!892930))
(check-sat b_and!26083 (not b_next!15847))
(get-model)

(declare-fun d!110083 () Bool)

(declare-fun e!498677 () Bool)

(assert (=> d!110083 e!498677))

(declare-fun res!604851 () Bool)

(assert (=> d!110083 (=> res!604851 e!498677)))

(declare-fun lt!403334 () SeekEntryResult!8867)

(assert (=> d!110083 (= res!604851 (not ((_ is Found!8867) lt!403334)))))

(assert (=> d!110083 (= lt!403334 (seekEntry!0 key!785 (_keys!9994 thiss!1181) (mask!25833 thiss!1181)))))

(declare-fun lt!403333 () Unit!30364)

(declare-fun choose!1472 (array!52315 array!52317 (_ BitVec 32) (_ BitVec 32) V!29199 V!29199 (_ BitVec 64)) Unit!30364)

(assert (=> d!110083 (= lt!403333 (choose!1472 (_keys!9994 thiss!1181) (_values!5300 thiss!1181) (mask!25833 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) key!785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!110083 (validMask!0 (mask!25833 thiss!1181))))

(assert (=> d!110083 (= (lemmaSeekEntryGivesInRangeIndex!63 (_keys!9994 thiss!1181) (_values!5300 thiss!1181) (mask!25833 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) key!785) lt!403333)))

(declare-fun b!892995 () Bool)

(assert (=> b!892995 (= e!498677 (inRange!0 (index!37840 lt!403334) (mask!25833 thiss!1181)))))

(assert (= (and d!110083 (not res!604851)) b!892995))

(assert (=> d!110083 m!830531))

(declare-fun m!830589 () Bool)

(assert (=> d!110083 m!830589))

(declare-fun m!830591 () Bool)

(assert (=> d!110083 m!830591))

(declare-fun m!830593 () Bool)

(assert (=> b!892995 m!830593))

(assert (=> b!892935 d!110083))

(declare-fun d!110085 () Bool)

(declare-fun lt!403344 () SeekEntryResult!8867)

(assert (=> d!110085 (and (or ((_ is MissingVacant!8867) lt!403344) (not ((_ is Found!8867) lt!403344)) (and (bvsge (index!37840 lt!403344) #b00000000000000000000000000000000) (bvslt (index!37840 lt!403344) (size!25609 (_keys!9994 thiss!1181))))) (not ((_ is MissingVacant!8867) lt!403344)) (or (not ((_ is Found!8867) lt!403344)) (= (select (arr!25163 (_keys!9994 thiss!1181)) (index!37840 lt!403344)) key!785)))))

(declare-fun e!498684 () SeekEntryResult!8867)

(assert (=> d!110085 (= lt!403344 e!498684)))

(declare-fun c!94001 () Bool)

(declare-fun lt!403346 () SeekEntryResult!8867)

(assert (=> d!110085 (= c!94001 (and ((_ is Intermediate!8867) lt!403346) (undefined!9679 lt!403346)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52315 (_ BitVec 32)) SeekEntryResult!8867)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!110085 (= lt!403346 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!785 (mask!25833 thiss!1181)) key!785 (_keys!9994 thiss!1181) (mask!25833 thiss!1181)))))

(assert (=> d!110085 (validMask!0 (mask!25833 thiss!1181))))

(assert (=> d!110085 (= (seekEntry!0 key!785 (_keys!9994 thiss!1181) (mask!25833 thiss!1181)) lt!403344)))

(declare-fun b!893008 () Bool)

(declare-fun c!94003 () Bool)

(declare-fun lt!403345 () (_ BitVec 64))

(assert (=> b!893008 (= c!94003 (= lt!403345 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!498686 () SeekEntryResult!8867)

(declare-fun e!498685 () SeekEntryResult!8867)

(assert (=> b!893008 (= e!498686 e!498685)))

(declare-fun b!893009 () Bool)

(assert (=> b!893009 (= e!498684 Undefined!8867)))

(declare-fun b!893010 () Bool)

(assert (=> b!893010 (= e!498685 (MissingZero!8867 (index!37841 lt!403346)))))

(declare-fun b!893011 () Bool)

(declare-fun lt!403343 () SeekEntryResult!8867)

(assert (=> b!893011 (= e!498685 (ite ((_ is MissingVacant!8867) lt!403343) (MissingZero!8867 (index!37842 lt!403343)) lt!403343))))

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!52315 (_ BitVec 32)) SeekEntryResult!8867)

(assert (=> b!893011 (= lt!403343 (seekKeyOrZeroReturnVacant!0 (x!75930 lt!403346) (index!37841 lt!403346) (index!37841 lt!403346) key!785 (_keys!9994 thiss!1181) (mask!25833 thiss!1181)))))

(declare-fun b!893012 () Bool)

(assert (=> b!893012 (= e!498684 e!498686)))

(assert (=> b!893012 (= lt!403345 (select (arr!25163 (_keys!9994 thiss!1181)) (index!37841 lt!403346)))))

(declare-fun c!94002 () Bool)

(assert (=> b!893012 (= c!94002 (= lt!403345 key!785))))

(declare-fun b!893013 () Bool)

(assert (=> b!893013 (= e!498686 (Found!8867 (index!37841 lt!403346)))))

(assert (= (and d!110085 c!94001) b!893009))

(assert (= (and d!110085 (not c!94001)) b!893012))

(assert (= (and b!893012 c!94002) b!893013))

(assert (= (and b!893012 (not c!94002)) b!893008))

(assert (= (and b!893008 c!94003) b!893010))

(assert (= (and b!893008 (not c!94003)) b!893011))

(declare-fun m!830595 () Bool)

(assert (=> d!110085 m!830595))

(declare-fun m!830597 () Bool)

(assert (=> d!110085 m!830597))

(assert (=> d!110085 m!830597))

(declare-fun m!830599 () Bool)

(assert (=> d!110085 m!830599))

(assert (=> d!110085 m!830591))

(declare-fun m!830601 () Bool)

(assert (=> b!893011 m!830601))

(declare-fun m!830603 () Bool)

(assert (=> b!893012 m!830603))

(assert (=> b!892935 d!110085))

(declare-fun d!110087 () Bool)

(assert (=> d!110087 (= (inRange!0 (index!37840 lt!403315) (mask!25833 thiss!1181)) (and (bvsge (index!37840 lt!403315) #b00000000000000000000000000000000) (bvslt (index!37840 lt!403315) (bvadd (mask!25833 thiss!1181) #b00000000000000000000000000000001))))))

(assert (=> b!892930 d!110087))

(declare-fun b!893034 () Bool)

(declare-fun e!498700 () Bool)

(assert (=> b!893034 (= e!498700 (not (= (bvand (extraKeys!5009 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!893035 () Bool)

(declare-fun c!94016 () Bool)

(declare-fun lt!403387 () SeekEntryResult!8867)

(assert (=> b!893035 (= c!94016 ((_ is Found!8867) lt!403387))))

(assert (=> b!893035 (= lt!403387 (seekEntry!0 key!785 (_keys!9994 thiss!1181) (mask!25833 thiss!1181)))))

(declare-fun e!498701 () Bool)

(declare-fun e!498699 () Bool)

(assert (=> b!893035 (= e!498701 e!498699)))

(declare-fun b!893036 () Bool)

(assert (=> b!893036 (= e!498699 true)))

(declare-fun lt!403381 () Unit!30364)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52315 (_ BitVec 64) (_ BitVec 32)) Unit!30364)

(assert (=> b!893036 (= lt!403381 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9994 thiss!1181) key!785 (index!37840 lt!403387)))))

(declare-fun call!39588 () Bool)

(assert (=> b!893036 call!39588))

(declare-fun lt!403390 () Unit!30364)

(assert (=> b!893036 (= lt!403390 lt!403381)))

(declare-fun lt!403377 () Unit!30364)

(declare-fun lemmaValidKeyInArrayIsInListMap!234 (array!52315 array!52317 (_ BitVec 32) (_ BitVec 32) V!29199 V!29199 (_ BitVec 32) Int) Unit!30364)

(assert (=> b!893036 (= lt!403377 (lemmaValidKeyInArrayIsInListMap!234 (_keys!9994 thiss!1181) (_values!5300 thiss!1181) (mask!25833 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) (index!37840 lt!403387) (defaultEntry!5314 thiss!1181)))))

(declare-fun call!39587 () Bool)

(assert (=> b!893036 call!39587))

(declare-fun lt!403384 () Unit!30364)

(assert (=> b!893036 (= lt!403384 lt!403377)))

(declare-fun b!893037 () Bool)

(assert (=> b!893037 false))

(declare-fun lt!403380 () Unit!30364)

(declare-fun lt!403389 () Unit!30364)

(assert (=> b!893037 (= lt!403380 lt!403389)))

(declare-fun lt!403388 () SeekEntryResult!8867)

(declare-fun lt!403386 () (_ BitVec 32))

(assert (=> b!893037 (and ((_ is Found!8867) lt!403388) (= (index!37840 lt!403388) lt!403386))))

(assert (=> b!893037 (= lt!403388 (seekEntry!0 key!785 (_keys!9994 thiss!1181) (mask!25833 thiss!1181)))))

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!52315 (_ BitVec 32)) Unit!30364)

(assert (=> b!893037 (= lt!403389 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 key!785 lt!403386 (_keys!9994 thiss!1181) (mask!25833 thiss!1181)))))

(declare-fun lt!403383 () Unit!30364)

(declare-fun lt!403391 () Unit!30364)

(assert (=> b!893037 (= lt!403383 lt!403391)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52315 (_ BitVec 32)) Bool)

(assert (=> b!893037 (arrayForallSeekEntryOrOpenFound!0 lt!403386 (_keys!9994 thiss!1181) (mask!25833 thiss!1181))))

(declare-fun lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (array!52315 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!30364)

(assert (=> b!893037 (= lt!403391 (lemmaArrayForallSeekEntryOrOpenFoundFromSmallerThenFromBigger!0 (_keys!9994 thiss!1181) (mask!25833 thiss!1181) #b00000000000000000000000000000000 lt!403386))))

(declare-fun arrayScanForKey!0 (array!52315 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893037 (= lt!403386 (arrayScanForKey!0 (_keys!9994 thiss!1181) key!785 #b00000000000000000000000000000000))))

(declare-fun lt!403378 () Unit!30364)

(declare-fun lt!403385 () Unit!30364)

(assert (=> b!893037 (= lt!403378 lt!403385)))

(declare-fun e!498698 () Bool)

(assert (=> b!893037 e!498698))

(declare-fun c!94017 () Bool)

(assert (=> b!893037 (= c!94017 (and (not (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lemmaKeyInListMapIsInArray!168 (array!52315 array!52317 (_ BitVec 32) (_ BitVec 32) V!29199 V!29199 (_ BitVec 64) Int) Unit!30364)

(assert (=> b!893037 (= lt!403385 (lemmaKeyInListMapIsInArray!168 (_keys!9994 thiss!1181) (_values!5300 thiss!1181) (mask!25833 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) key!785 (defaultEntry!5314 thiss!1181)))))

(declare-fun e!498697 () Unit!30364)

(declare-fun Unit!30368 () Unit!30364)

(assert (=> b!893037 (= e!498697 Unit!30368)))

(declare-fun b!893038 () Bool)

(declare-fun Unit!30369 () Unit!30364)

(assert (=> b!893038 (= e!498697 Unit!30369)))

(declare-fun b!893039 () Bool)

(assert (=> b!893039 (= e!498700 e!498701)))

(declare-fun c!94018 () Bool)

(assert (=> b!893039 (= c!94018 (= key!785 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!893040 () Bool)

(assert (=> b!893040 (= e!498701 (not (= (bvand (extraKeys!5009 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!110089 () Bool)

(declare-fun lt!403382 () Bool)

(declare-fun contains!4351 (ListLongMap!10715 (_ BitVec 64)) Bool)

(assert (=> d!110089 (= lt!403382 (contains!4351 (map!12194 thiss!1181) key!785))))

(assert (=> d!110089 (= lt!403382 e!498700)))

(declare-fun c!94015 () Bool)

(assert (=> d!110089 (= c!94015 (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!110089 (valid!1640 thiss!1181)))

(assert (=> d!110089 (= (contains!4349 thiss!1181 key!785) lt!403382)))

(declare-fun b!893041 () Bool)

(assert (=> b!893041 (= e!498698 call!39588)))

(declare-fun b!893042 () Bool)

(assert (=> b!893042 (= e!498699 false)))

(declare-fun c!94014 () Bool)

(assert (=> b!893042 (= c!94014 call!39587)))

(declare-fun lt!403379 () Unit!30364)

(assert (=> b!893042 (= lt!403379 e!498697)))

(declare-fun b!893043 () Bool)

(assert (=> b!893043 (= e!498698 (ite (= key!785 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand (extraKeys!5009 thiss!1181) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!5009 thiss!1181) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun bm!39584 () Bool)

(declare-fun call!39589 () ListLongMap!10715)

(declare-fun getCurrentListMap!2598 (array!52315 array!52317 (_ BitVec 32) (_ BitVec 32) V!29199 V!29199 (_ BitVec 32) Int) ListLongMap!10715)

(assert (=> bm!39584 (= call!39589 (getCurrentListMap!2598 (_keys!9994 thiss!1181) (_values!5300 thiss!1181) (mask!25833 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5314 thiss!1181)))))

(declare-fun bm!39585 () Bool)

(assert (=> bm!39585 (= call!39587 (contains!4351 call!39589 (ite c!94016 (select (arr!25163 (_keys!9994 thiss!1181)) (index!37840 lt!403387)) key!785)))))

(declare-fun bm!39586 () Bool)

(declare-fun arrayContainsKey!0 (array!52315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!39586 (= call!39588 (arrayContainsKey!0 (_keys!9994 thiss!1181) key!785 #b00000000000000000000000000000000))))

(assert (= (and d!110089 c!94015) b!893034))

(assert (= (and d!110089 (not c!94015)) b!893039))

(assert (= (and b!893039 c!94018) b!893040))

(assert (= (and b!893039 (not c!94018)) b!893035))

(assert (= (and b!893035 c!94016) b!893036))

(assert (= (and b!893035 (not c!94016)) b!893042))

(assert (= (and b!893042 c!94014) b!893037))

(assert (= (and b!893042 (not c!94014)) b!893038))

(assert (= (and b!893037 c!94017) b!893041))

(assert (= (and b!893037 (not c!94017)) b!893043))

(assert (= (or b!893036 b!893041) bm!39586))

(assert (= (or b!893036 b!893042) bm!39584))

(assert (= (or b!893036 b!893042) bm!39585))

(declare-fun m!830605 () Bool)

(assert (=> bm!39586 m!830605))

(assert (=> b!893035 m!830531))

(declare-fun m!830607 () Bool)

(assert (=> b!893037 m!830607))

(declare-fun m!830609 () Bool)

(assert (=> b!893037 m!830609))

(assert (=> b!893037 m!830531))

(declare-fun m!830611 () Bool)

(assert (=> b!893037 m!830611))

(declare-fun m!830613 () Bool)

(assert (=> b!893037 m!830613))

(declare-fun m!830615 () Bool)

(assert (=> b!893037 m!830615))

(declare-fun m!830617 () Bool)

(assert (=> bm!39585 m!830617))

(declare-fun m!830619 () Bool)

(assert (=> bm!39585 m!830619))

(declare-fun m!830621 () Bool)

(assert (=> bm!39584 m!830621))

(assert (=> d!110089 m!830533))

(assert (=> d!110089 m!830533))

(declare-fun m!830623 () Bool)

(assert (=> d!110089 m!830623))

(assert (=> d!110089 m!830539))

(declare-fun m!830625 () Bool)

(assert (=> b!893036 m!830625))

(declare-fun m!830627 () Bool)

(assert (=> b!893036 m!830627))

(assert (=> b!892932 d!110089))

(declare-fun d!110091 () Bool)

(declare-fun res!604858 () Bool)

(declare-fun e!498704 () Bool)

(assert (=> d!110091 (=> (not res!604858) (not e!498704))))

(declare-fun simpleValid!296 (LongMapFixedSize!4228) Bool)

(assert (=> d!110091 (= res!604858 (simpleValid!296 thiss!1181))))

(assert (=> d!110091 (= (valid!1640 thiss!1181) e!498704)))

(declare-fun b!893050 () Bool)

(declare-fun res!604859 () Bool)

(assert (=> b!893050 (=> (not res!604859) (not e!498704))))

(declare-fun arrayCountValidKeys!0 (array!52315 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!893050 (= res!604859 (= (arrayCountValidKeys!0 (_keys!9994 thiss!1181) #b00000000000000000000000000000000 (size!25609 (_keys!9994 thiss!1181))) (_size!2169 thiss!1181)))))

(declare-fun b!893051 () Bool)

(declare-fun res!604860 () Bool)

(assert (=> b!893051 (=> (not res!604860) (not e!498704))))

(assert (=> b!893051 (= res!604860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9994 thiss!1181) (mask!25833 thiss!1181)))))

(declare-fun b!893052 () Bool)

(declare-datatypes ((List!17804 0))(
  ( (Nil!17801) (Cons!17800 (h!18931 (_ BitVec 64)) (t!25112 List!17804)) )
))
(declare-fun arrayNoDuplicates!0 (array!52315 (_ BitVec 32) List!17804) Bool)

(assert (=> b!893052 (= e!498704 (arrayNoDuplicates!0 (_keys!9994 thiss!1181) #b00000000000000000000000000000000 Nil!17801))))

(assert (= (and d!110091 res!604858) b!893050))

(assert (= (and b!893050 res!604859) b!893051))

(assert (= (and b!893051 res!604860) b!893052))

(declare-fun m!830629 () Bool)

(assert (=> d!110091 m!830629))

(declare-fun m!830631 () Bool)

(assert (=> b!893050 m!830631))

(declare-fun m!830633 () Bool)

(assert (=> b!893051 m!830633))

(declare-fun m!830635 () Bool)

(assert (=> b!893052 m!830635))

(assert (=> start!75894 d!110091))

(declare-fun d!110093 () Bool)

(declare-fun isEmpty!684 (Option!452) Bool)

(assert (=> d!110093 (= (isDefined!327 (getValueByKey!446 (toList!5373 (map!12194 thiss!1181)) key!785)) (not (isEmpty!684 (getValueByKey!446 (toList!5373 (map!12194 thiss!1181)) key!785))))))

(declare-fun bs!25035 () Bool)

(assert (= bs!25035 d!110093))

(assert (=> bs!25035 m!830535))

(declare-fun m!830637 () Bool)

(assert (=> bs!25035 m!830637))

(assert (=> b!892933 d!110093))

(declare-fun d!110095 () Bool)

(declare-fun c!94023 () Bool)

(assert (=> d!110095 (= c!94023 (and ((_ is Cons!17797) (toList!5373 (map!12194 thiss!1181))) (= (_1!6025 (h!18928 (toList!5373 (map!12194 thiss!1181)))) key!785)))))

(declare-fun e!498709 () Option!452)

(assert (=> d!110095 (= (getValueByKey!446 (toList!5373 (map!12194 thiss!1181)) key!785) e!498709)))

(declare-fun b!893064 () Bool)

(declare-fun e!498710 () Option!452)

(assert (=> b!893064 (= e!498710 None!450)))

(declare-fun b!893061 () Bool)

(assert (=> b!893061 (= e!498709 (Some!451 (_2!6025 (h!18928 (toList!5373 (map!12194 thiss!1181))))))))

(declare-fun b!893062 () Bool)

(assert (=> b!893062 (= e!498709 e!498710)))

(declare-fun c!94024 () Bool)

(assert (=> b!893062 (= c!94024 (and ((_ is Cons!17797) (toList!5373 (map!12194 thiss!1181))) (not (= (_1!6025 (h!18928 (toList!5373 (map!12194 thiss!1181)))) key!785))))))

(declare-fun b!893063 () Bool)

(assert (=> b!893063 (= e!498710 (getValueByKey!446 (t!25109 (toList!5373 (map!12194 thiss!1181))) key!785))))

(assert (= (and d!110095 c!94023) b!893061))

(assert (= (and d!110095 (not c!94023)) b!893062))

(assert (= (and b!893062 c!94024) b!893063))

(assert (= (and b!893062 (not c!94024)) b!893064))

(declare-fun m!830639 () Bool)

(assert (=> b!893063 m!830639))

(assert (=> b!892933 d!110095))

(declare-fun d!110097 () Bool)

(assert (=> d!110097 (= (map!12194 thiss!1181) (getCurrentListMap!2598 (_keys!9994 thiss!1181) (_values!5300 thiss!1181) (mask!25833 thiss!1181) (extraKeys!5009 thiss!1181) (zeroValue!5113 thiss!1181) (minValue!5113 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5314 thiss!1181)))))

(declare-fun bs!25036 () Bool)

(assert (= bs!25036 d!110097))

(assert (=> bs!25036 m!830621))

(assert (=> b!892933 d!110097))

(declare-fun d!110099 () Bool)

(assert (=> d!110099 (= (array_inv!19818 (_keys!9994 thiss!1181)) (bvsge (size!25609 (_keys!9994 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!892938 d!110099))

(declare-fun d!110101 () Bool)

(assert (=> d!110101 (= (array_inv!19819 (_values!5300 thiss!1181)) (bvsge (size!25610 (_values!5300 thiss!1181)) #b00000000000000000000000000000000))))

(assert (=> b!892938 d!110101))

(declare-fun b!893072 () Bool)

(declare-fun e!498715 () Bool)

(assert (=> b!893072 (= e!498715 tp_is_empty!18175)))

(declare-fun condMapEmpty!28829 () Bool)

(declare-fun mapDefault!28829 () ValueCell!8606)

(assert (=> mapNonEmpty!28820 (= condMapEmpty!28829 (= mapRest!28820 ((as const (Array (_ BitVec 32) ValueCell!8606)) mapDefault!28829)))))

(declare-fun mapRes!28829 () Bool)

(assert (=> mapNonEmpty!28820 (= tp!55514 (and e!498715 mapRes!28829))))

(declare-fun mapIsEmpty!28829 () Bool)

(assert (=> mapIsEmpty!28829 mapRes!28829))

(declare-fun mapNonEmpty!28829 () Bool)

(declare-fun tp!55529 () Bool)

(declare-fun e!498716 () Bool)

(assert (=> mapNonEmpty!28829 (= mapRes!28829 (and tp!55529 e!498716))))

(declare-fun mapRest!28829 () (Array (_ BitVec 32) ValueCell!8606))

(declare-fun mapValue!28829 () ValueCell!8606)

(declare-fun mapKey!28829 () (_ BitVec 32))

(assert (=> mapNonEmpty!28829 (= mapRest!28820 (store mapRest!28829 mapKey!28829 mapValue!28829))))

(declare-fun b!893071 () Bool)

(assert (=> b!893071 (= e!498716 tp_is_empty!18175)))

(assert (= (and mapNonEmpty!28820 condMapEmpty!28829) mapIsEmpty!28829))

(assert (= (and mapNonEmpty!28820 (not condMapEmpty!28829)) mapNonEmpty!28829))

(assert (= (and mapNonEmpty!28829 ((_ is ValueCellFull!8606) mapValue!28829)) b!893071))

(assert (= (and mapNonEmpty!28820 ((_ is ValueCellFull!8606) mapDefault!28829)) b!893072))

(declare-fun m!830641 () Bool)

(assert (=> mapNonEmpty!28829 m!830641))

(check-sat (not b_next!15847) (not d!110091) (not d!110093) (not bm!39586) (not bm!39584) (not mapNonEmpty!28829) (not b!893063) (not b!893036) tp_is_empty!18175 (not bm!39585) b_and!26083 (not d!110085) (not b!893035) (not b!893050) (not b!893037) (not d!110089) (not b!892995) (not b!893011) (not d!110097) (not b!893052) (not d!110083) (not b!893051))
(check-sat b_and!26083 (not b_next!15847))
