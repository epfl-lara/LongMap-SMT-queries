; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!23296 () Bool)

(assert start!23296)

(declare-fun b!244987 () Bool)

(declare-fun b_free!6549 () Bool)

(declare-fun b_next!6549 () Bool)

(assert (=> b!244987 (= b_free!6549 (not b_next!6549))))

(declare-fun tp!22875 () Bool)

(declare-fun b_and!13535 () Bool)

(assert (=> b!244987 (= tp!22875 b_and!13535)))

(declare-fun mapNonEmpty!10873 () Bool)

(declare-fun mapRes!10873 () Bool)

(declare-fun tp!22876 () Bool)

(declare-fun e!158940 () Bool)

(assert (=> mapNonEmpty!10873 (= mapRes!10873 (and tp!22876 e!158940))))

(declare-datatypes ((V!8195 0))(
  ( (V!8196 (val!3250 Int)) )
))
(declare-datatypes ((ValueCell!2862 0))(
  ( (ValueCellFull!2862 (v!5301 V!8195)) (EmptyCell!2862) )
))
(declare-fun mapRest!10873 () (Array (_ BitVec 32) ValueCell!2862))

(declare-fun mapKey!10873 () (_ BitVec 32))

(declare-datatypes ((array!12117 0))(
  ( (array!12118 (arr!5752 (Array (_ BitVec 32) ValueCell!2862)) (size!6094 (_ BitVec 32))) )
))
(declare-datatypes ((array!12119 0))(
  ( (array!12120 (arr!5753 (Array (_ BitVec 32) (_ BitVec 64))) (size!6095 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3624 0))(
  ( (LongMapFixedSize!3625 (defaultEntry!4533 Int) (mask!10638 (_ BitVec 32)) (extraKeys!4270 (_ BitVec 32)) (zeroValue!4374 V!8195) (minValue!4374 V!8195) (_size!1861 (_ BitVec 32)) (_keys!6646 array!12119) (_values!4516 array!12117) (_vacant!1861 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3624)

(declare-fun mapValue!10873 () ValueCell!2862)

(assert (=> mapNonEmpty!10873 (= (arr!5752 (_values!4516 thiss!1504)) (store mapRest!10873 mapKey!10873 mapValue!10873))))

(declare-fun b!244984 () Bool)

(declare-fun e!158952 () Bool)

(declare-fun call!22850 () Bool)

(assert (=> b!244984 (= e!158952 (not call!22850))))

(declare-fun c!40885 () Bool)

(declare-datatypes ((SeekEntryResult!1085 0))(
  ( (MissingZero!1085 (index!6510 (_ BitVec 32))) (Found!1085 (index!6511 (_ BitVec 32))) (Intermediate!1085 (undefined!1897 Bool) (index!6512 (_ BitVec 32)) (x!24397 (_ BitVec 32))) (Undefined!1085) (MissingVacant!1085 (index!6513 (_ BitVec 32))) )
))
(declare-fun lt!122690 () SeekEntryResult!1085)

(declare-fun bm!22847 () Bool)

(declare-fun call!22851 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!22847 (= call!22851 (inRange!0 (ite c!40885 (index!6510 lt!122690) (index!6513 lt!122690)) (mask!10638 thiss!1504)))))

(declare-fun b!244985 () Bool)

(declare-fun res!120186 () Bool)

(declare-fun e!158942 () Bool)

(assert (=> b!244985 (=> (not res!120186) (not e!158942))))

(assert (=> b!244985 (= res!120186 (= (select (arr!5753 (_keys!6646 thiss!1504)) (index!6510 lt!122690)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244986 () Bool)

(declare-fun e!158948 () Bool)

(declare-fun tp_is_empty!6411 () Bool)

(assert (=> b!244986 (= e!158948 tp_is_empty!6411)))

(declare-fun e!158946 () Bool)

(declare-fun e!158953 () Bool)

(declare-fun array_inv!3801 (array!12119) Bool)

(declare-fun array_inv!3802 (array!12117) Bool)

(assert (=> b!244987 (= e!158946 (and tp!22875 tp_is_empty!6411 (array_inv!3801 (_keys!6646 thiss!1504)) (array_inv!3802 (_values!4516 thiss!1504)) e!158953))))

(declare-fun b!244988 () Bool)

(declare-fun res!120187 () Bool)

(assert (=> b!244988 (= res!120187 (= (select (arr!5753 (_keys!6646 thiss!1504)) (index!6513 lt!122690)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!244988 (=> (not res!120187) (not e!158952))))

(declare-fun b!244989 () Bool)

(assert (=> b!244989 (= e!158942 (not call!22850))))

(declare-fun b!244990 () Bool)

(declare-datatypes ((Unit!7564 0))(
  ( (Unit!7565) )
))
(declare-fun e!158943 () Unit!7564)

(declare-fun Unit!7566 () Unit!7564)

(assert (=> b!244990 (= e!158943 Unit!7566)))

(declare-fun lt!122688 () Unit!7564)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!369 (array!12119 array!12117 (_ BitVec 32) (_ BitVec 32) V!8195 V!8195 (_ BitVec 64) Int) Unit!7564)

(assert (=> b!244990 (= lt!122688 (lemmaInListMapThenSeekEntryOrOpenFindsIt!369 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) key!932 (defaultEntry!4533 thiss!1504)))))

(assert (=> b!244990 false))

(declare-fun b!244991 () Bool)

(declare-fun res!120194 () Bool)

(declare-fun e!158939 () Bool)

(assert (=> b!244991 (=> (not res!120194) (not e!158939))))

(assert (=> b!244991 (= res!120194 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!244992 () Bool)

(declare-fun c!40884 () Bool)

(get-info :version)

(assert (=> b!244992 (= c!40884 ((_ is MissingVacant!1085) lt!122690))))

(declare-fun e!158949 () Bool)

(declare-fun e!158950 () Bool)

(assert (=> b!244992 (= e!158949 e!158950)))

(declare-fun b!244993 () Bool)

(declare-fun e!158941 () Bool)

(declare-fun e!158945 () Bool)

(assert (=> b!244993 (= e!158941 (not e!158945))))

(declare-fun res!120191 () Bool)

(assert (=> b!244993 (=> (not res!120191) (not e!158945))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!244993 (= res!120191 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6095 (_keys!6646 thiss!1504)))))))

(declare-datatypes ((List!3664 0))(
  ( (Nil!3661) (Cons!3660 (h!4317 (_ BitVec 64)) (t!8675 List!3664)) )
))
(declare-fun arrayNoDuplicates!0 (array!12119 (_ BitVec 32) List!3664) Bool)

(assert (=> b!244993 (arrayNoDuplicates!0 (array!12120 (store (arr!5753 (_keys!6646 thiss!1504)) index!297 key!932) (size!6095 (_keys!6646 thiss!1504))) #b00000000000000000000000000000000 Nil!3661)))

(declare-fun lt!122685 () Unit!7564)

(declare-fun lemmaPutNewValidKeyPreservesNoDuplicate!0 (array!12119 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3664) Unit!7564)

(assert (=> b!244993 (= lt!122685 (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6646 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3661))))

(declare-fun lt!122687 () Unit!7564)

(declare-fun e!158947 () Unit!7564)

(assert (=> b!244993 (= lt!122687 e!158947)))

(declare-fun c!40887 () Bool)

(declare-fun arrayContainsKey!0 (array!12119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!244993 (= c!40887 (arrayContainsKey!0 (_keys!6646 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244994 () Bool)

(assert (=> b!244994 (= e!158950 e!158952)))

(declare-fun res!120190 () Bool)

(assert (=> b!244994 (= res!120190 call!22851)))

(assert (=> b!244994 (=> (not res!120190) (not e!158952))))

(declare-fun b!244995 () Bool)

(declare-fun res!120195 () Bool)

(assert (=> b!244995 (=> (not res!120195) (not e!158942))))

(assert (=> b!244995 (= res!120195 call!22851)))

(assert (=> b!244995 (= e!158949 e!158942)))

(declare-fun b!244996 () Bool)

(declare-fun e!158944 () Bool)

(assert (=> b!244996 (= e!158939 e!158944)))

(declare-fun res!120193 () Bool)

(assert (=> b!244996 (=> (not res!120193) (not e!158944))))

(assert (=> b!244996 (= res!120193 (or (= lt!122690 (MissingZero!1085 index!297)) (= lt!122690 (MissingVacant!1085 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12119 (_ BitVec 32)) SeekEntryResult!1085)

(assert (=> b!244996 (= lt!122690 (seekEntryOrOpen!0 key!932 (_keys!6646 thiss!1504) (mask!10638 thiss!1504)))))

(declare-fun b!244997 () Bool)

(assert (=> b!244997 (= e!158950 ((_ is Undefined!1085) lt!122690))))

(declare-fun b!244998 () Bool)

(assert (=> b!244998 (= e!158953 (and e!158948 mapRes!10873))))

(declare-fun condMapEmpty!10873 () Bool)

(declare-fun mapDefault!10873 () ValueCell!2862)

(assert (=> b!244998 (= condMapEmpty!10873 (= (arr!5752 (_values!4516 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2862)) mapDefault!10873)))))

(declare-fun b!244999 () Bool)

(declare-fun res!120189 () Bool)

(assert (=> b!244999 (=> (not res!120189) (not e!158945))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244999 (= res!120189 (validKeyInArray!0 key!932))))

(declare-fun b!245000 () Bool)

(assert (=> b!245000 (= e!158945 (bvslt (size!6095 (_keys!6646 thiss!1504)) #b01111111111111111111111111111111))))

(declare-fun b!245001 () Bool)

(declare-fun Unit!7567 () Unit!7564)

(assert (=> b!245001 (= e!158947 Unit!7567)))

(declare-fun b!245002 () Bool)

(assert (=> b!245002 (= e!158944 e!158941)))

(declare-fun res!120188 () Bool)

(assert (=> b!245002 (=> (not res!120188) (not e!158941))))

(assert (=> b!245002 (= res!120188 (inRange!0 index!297 (mask!10638 thiss!1504)))))

(declare-fun lt!122686 () Unit!7564)

(assert (=> b!245002 (= lt!122686 e!158943)))

(declare-fun c!40886 () Bool)

(declare-datatypes ((tuple2!4782 0))(
  ( (tuple2!4783 (_1!2402 (_ BitVec 64)) (_2!2402 V!8195)) )
))
(declare-datatypes ((List!3665 0))(
  ( (Nil!3662) (Cons!3661 (h!4318 tuple2!4782) (t!8676 List!3665)) )
))
(declare-datatypes ((ListLongMap!3695 0))(
  ( (ListLongMap!3696 (toList!1863 List!3665)) )
))
(declare-fun contains!1770 (ListLongMap!3695 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1391 (array!12119 array!12117 (_ BitVec 32) (_ BitVec 32) V!8195 V!8195 (_ BitVec 32) Int) ListLongMap!3695)

(assert (=> b!245002 (= c!40886 (contains!1770 (getCurrentListMap!1391 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504)) key!932))))

(declare-fun b!245003 () Bool)

(declare-fun Unit!7568 () Unit!7564)

(assert (=> b!245003 (= e!158947 Unit!7568)))

(declare-fun lt!122689 () Unit!7564)

(declare-fun lemmaArrayContainsKeyThenInListMap!173 (array!12119 array!12117 (_ BitVec 32) (_ BitVec 32) V!8195 V!8195 (_ BitVec 64) (_ BitVec 32) Int) Unit!7564)

(assert (=> b!245003 (= lt!122689 (lemmaArrayContainsKeyThenInListMap!173 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504)))))

(assert (=> b!245003 false))

(declare-fun b!245004 () Bool)

(declare-fun lt!122684 () Unit!7564)

(assert (=> b!245004 (= e!158943 lt!122684)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!375 (array!12119 array!12117 (_ BitVec 32) (_ BitVec 32) V!8195 V!8195 (_ BitVec 64) Int) Unit!7564)

(assert (=> b!245004 (= lt!122684 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!375 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) key!932 (defaultEntry!4533 thiss!1504)))))

(assert (=> b!245004 (= c!40885 ((_ is MissingZero!1085) lt!122690))))

(assert (=> b!245004 e!158949))

(declare-fun mapIsEmpty!10873 () Bool)

(assert (=> mapIsEmpty!10873 mapRes!10873))

(declare-fun b!245005 () Bool)

(declare-fun res!120192 () Bool)

(assert (=> b!245005 (=> (not res!120192) (not e!158945))))

(assert (=> b!245005 (= res!120192 (not (validKeyInArray!0 (select (arr!5753 (_keys!6646 thiss!1504)) index!297))))))

(declare-fun b!245006 () Bool)

(assert (=> b!245006 (= e!158940 tp_is_empty!6411)))

(declare-fun res!120185 () Bool)

(assert (=> start!23296 (=> (not res!120185) (not e!158939))))

(declare-fun valid!1419 (LongMapFixedSize!3624) Bool)

(assert (=> start!23296 (= res!120185 (valid!1419 thiss!1504))))

(assert (=> start!23296 e!158939))

(assert (=> start!23296 e!158946))

(assert (=> start!23296 true))

(declare-fun bm!22848 () Bool)

(assert (=> bm!22848 (= call!22850 (arrayContainsKey!0 (_keys!6646 thiss!1504) key!932 #b00000000000000000000000000000000))))

(assert (= (and start!23296 res!120185) b!244991))

(assert (= (and b!244991 res!120194) b!244996))

(assert (= (and b!244996 res!120193) b!245002))

(assert (= (and b!245002 c!40886) b!244990))

(assert (= (and b!245002 (not c!40886)) b!245004))

(assert (= (and b!245004 c!40885) b!244995))

(assert (= (and b!245004 (not c!40885)) b!244992))

(assert (= (and b!244995 res!120195) b!244985))

(assert (= (and b!244985 res!120186) b!244989))

(assert (= (and b!244992 c!40884) b!244994))

(assert (= (and b!244992 (not c!40884)) b!244997))

(assert (= (and b!244994 res!120190) b!244988))

(assert (= (and b!244988 res!120187) b!244984))

(assert (= (or b!244995 b!244994) bm!22847))

(assert (= (or b!244989 b!244984) bm!22848))

(assert (= (and b!245002 res!120188) b!244993))

(assert (= (and b!244993 c!40887) b!245003))

(assert (= (and b!244993 (not c!40887)) b!245001))

(assert (= (and b!244993 res!120191) b!245005))

(assert (= (and b!245005 res!120192) b!244999))

(assert (= (and b!244999 res!120189) b!245000))

(assert (= (and b!244998 condMapEmpty!10873) mapIsEmpty!10873))

(assert (= (and b!244998 (not condMapEmpty!10873)) mapNonEmpty!10873))

(assert (= (and mapNonEmpty!10873 ((_ is ValueCellFull!2862) mapValue!10873)) b!245006))

(assert (= (and b!244998 ((_ is ValueCellFull!2862) mapDefault!10873)) b!244986))

(assert (= b!244987 b!244998))

(assert (= start!23296 b!244987))

(declare-fun m!262705 () Bool)

(assert (=> b!244985 m!262705))

(declare-fun m!262707 () Bool)

(assert (=> b!244990 m!262707))

(declare-fun m!262709 () Bool)

(assert (=> b!245004 m!262709))

(declare-fun m!262711 () Bool)

(assert (=> b!244988 m!262711))

(declare-fun m!262713 () Bool)

(assert (=> b!245003 m!262713))

(declare-fun m!262715 () Bool)

(assert (=> b!244999 m!262715))

(declare-fun m!262717 () Bool)

(assert (=> b!244987 m!262717))

(declare-fun m!262719 () Bool)

(assert (=> b!244987 m!262719))

(declare-fun m!262721 () Bool)

(assert (=> mapNonEmpty!10873 m!262721))

(declare-fun m!262723 () Bool)

(assert (=> b!244993 m!262723))

(declare-fun m!262725 () Bool)

(assert (=> b!244993 m!262725))

(declare-fun m!262727 () Bool)

(assert (=> b!244993 m!262727))

(declare-fun m!262729 () Bool)

(assert (=> b!244993 m!262729))

(declare-fun m!262731 () Bool)

(assert (=> start!23296 m!262731))

(declare-fun m!262733 () Bool)

(assert (=> b!244996 m!262733))

(declare-fun m!262735 () Bool)

(assert (=> bm!22847 m!262735))

(declare-fun m!262737 () Bool)

(assert (=> b!245002 m!262737))

(declare-fun m!262739 () Bool)

(assert (=> b!245002 m!262739))

(assert (=> b!245002 m!262739))

(declare-fun m!262741 () Bool)

(assert (=> b!245002 m!262741))

(declare-fun m!262743 () Bool)

(assert (=> b!245005 m!262743))

(assert (=> b!245005 m!262743))

(declare-fun m!262745 () Bool)

(assert (=> b!245005 m!262745))

(assert (=> bm!22848 m!262729))

(check-sat (not b!244987) (not bm!22848) (not bm!22847) tp_is_empty!6411 (not b_next!6549) (not b!244990) (not b!244996) (not b!245005) (not b!245003) (not start!23296) b_and!13535 (not b!244993) (not b!245004) (not mapNonEmpty!10873) (not b!244999) (not b!245002))
(check-sat b_and!13535 (not b_next!6549))
(get-model)

(declare-fun d!60147 () Bool)

(assert (=> d!60147 (= (inRange!0 (ite c!40885 (index!6510 lt!122690) (index!6513 lt!122690)) (mask!10638 thiss!1504)) (and (bvsge (ite c!40885 (index!6510 lt!122690) (index!6513 lt!122690)) #b00000000000000000000000000000000) (bvslt (ite c!40885 (index!6510 lt!122690) (index!6513 lt!122690)) (bvadd (mask!10638 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> bm!22847 d!60147))

(declare-fun b!245086 () Bool)

(declare-fun e!159007 () Bool)

(declare-fun call!22860 () Bool)

(assert (=> b!245086 (= e!159007 call!22860)))

(declare-fun d!60149 () Bool)

(declare-fun res!120237 () Bool)

(declare-fun e!159008 () Bool)

(assert (=> d!60149 (=> res!120237 e!159008)))

(assert (=> d!60149 (= res!120237 (bvsge #b00000000000000000000000000000000 (size!6095 (array!12120 (store (arr!5753 (_keys!6646 thiss!1504)) index!297 key!932) (size!6095 (_keys!6646 thiss!1504))))))))

(assert (=> d!60149 (= (arrayNoDuplicates!0 (array!12120 (store (arr!5753 (_keys!6646 thiss!1504)) index!297 key!932) (size!6095 (_keys!6646 thiss!1504))) #b00000000000000000000000000000000 Nil!3661) e!159008)))

(declare-fun bm!22857 () Bool)

(declare-fun c!40902 () Bool)

(assert (=> bm!22857 (= call!22860 (arrayNoDuplicates!0 (array!12120 (store (arr!5753 (_keys!6646 thiss!1504)) index!297 key!932) (size!6095 (_keys!6646 thiss!1504))) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!40902 (Cons!3660 (select (arr!5753 (array!12120 (store (arr!5753 (_keys!6646 thiss!1504)) index!297 key!932) (size!6095 (_keys!6646 thiss!1504)))) #b00000000000000000000000000000000) Nil!3661) Nil!3661)))))

(declare-fun b!245087 () Bool)

(declare-fun e!159010 () Bool)

(assert (=> b!245087 (= e!159010 e!159007)))

(assert (=> b!245087 (= c!40902 (validKeyInArray!0 (select (arr!5753 (array!12120 (store (arr!5753 (_keys!6646 thiss!1504)) index!297 key!932) (size!6095 (_keys!6646 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!245088 () Bool)

(assert (=> b!245088 (= e!159008 e!159010)))

(declare-fun res!120235 () Bool)

(assert (=> b!245088 (=> (not res!120235) (not e!159010))))

(declare-fun e!159009 () Bool)

(assert (=> b!245088 (= res!120235 (not e!159009))))

(declare-fun res!120236 () Bool)

(assert (=> b!245088 (=> (not res!120236) (not e!159009))))

(assert (=> b!245088 (= res!120236 (validKeyInArray!0 (select (arr!5753 (array!12120 (store (arr!5753 (_keys!6646 thiss!1504)) index!297 key!932) (size!6095 (_keys!6646 thiss!1504)))) #b00000000000000000000000000000000)))))

(declare-fun b!245089 () Bool)

(assert (=> b!245089 (= e!159007 call!22860)))

(declare-fun b!245090 () Bool)

(declare-fun contains!1771 (List!3664 (_ BitVec 64)) Bool)

(assert (=> b!245090 (= e!159009 (contains!1771 Nil!3661 (select (arr!5753 (array!12120 (store (arr!5753 (_keys!6646 thiss!1504)) index!297 key!932) (size!6095 (_keys!6646 thiss!1504)))) #b00000000000000000000000000000000)))))

(assert (= (and d!60149 (not res!120237)) b!245088))

(assert (= (and b!245088 res!120236) b!245090))

(assert (= (and b!245088 res!120235) b!245087))

(assert (= (and b!245087 c!40902) b!245086))

(assert (= (and b!245087 (not c!40902)) b!245089))

(assert (= (or b!245086 b!245089) bm!22857))

(declare-fun m!262789 () Bool)

(assert (=> bm!22857 m!262789))

(declare-fun m!262791 () Bool)

(assert (=> bm!22857 m!262791))

(assert (=> b!245087 m!262789))

(assert (=> b!245087 m!262789))

(declare-fun m!262793 () Bool)

(assert (=> b!245087 m!262793))

(assert (=> b!245088 m!262789))

(assert (=> b!245088 m!262789))

(assert (=> b!245088 m!262793))

(assert (=> b!245090 m!262789))

(assert (=> b!245090 m!262789))

(declare-fun m!262795 () Bool)

(assert (=> b!245090 m!262795))

(assert (=> b!244993 d!60149))

(declare-fun d!60151 () Bool)

(declare-fun e!159013 () Bool)

(assert (=> d!60151 e!159013))

(declare-fun res!120240 () Bool)

(assert (=> d!60151 (=> (not res!120240) (not e!159013))))

(assert (=> d!60151 (= res!120240 (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (size!6095 (_keys!6646 thiss!1504)))))))

(declare-fun lt!122714 () Unit!7564)

(declare-fun choose!41 (array!12119 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32) List!3664) Unit!7564)

(assert (=> d!60151 (= lt!122714 (choose!41 (_keys!6646 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3661))))

(assert (=> d!60151 (bvslt (size!6095 (_keys!6646 thiss!1504)) #b01111111111111111111111111111111)))

(assert (=> d!60151 (= (lemmaPutNewValidKeyPreservesNoDuplicate!0 (_keys!6646 thiss!1504) key!932 index!297 #b00000000000000000000000000000000 Nil!3661) lt!122714)))

(declare-fun b!245093 () Bool)

(assert (=> b!245093 (= e!159013 (arrayNoDuplicates!0 (array!12120 (store (arr!5753 (_keys!6646 thiss!1504)) index!297 key!932) (size!6095 (_keys!6646 thiss!1504))) #b00000000000000000000000000000000 Nil!3661))))

(assert (= (and d!60151 res!120240) b!245093))

(declare-fun m!262797 () Bool)

(assert (=> d!60151 m!262797))

(assert (=> b!245093 m!262723))

(assert (=> b!245093 m!262725))

(assert (=> b!244993 d!60151))

(declare-fun d!60153 () Bool)

(declare-fun res!120245 () Bool)

(declare-fun e!159018 () Bool)

(assert (=> d!60153 (=> res!120245 e!159018)))

(assert (=> d!60153 (= res!120245 (= (select (arr!5753 (_keys!6646 thiss!1504)) #b00000000000000000000000000000000) key!932))))

(assert (=> d!60153 (= (arrayContainsKey!0 (_keys!6646 thiss!1504) key!932 #b00000000000000000000000000000000) e!159018)))

(declare-fun b!245098 () Bool)

(declare-fun e!159019 () Bool)

(assert (=> b!245098 (= e!159018 e!159019)))

(declare-fun res!120246 () Bool)

(assert (=> b!245098 (=> (not res!120246) (not e!159019))))

(assert (=> b!245098 (= res!120246 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!6095 (_keys!6646 thiss!1504))))))

(declare-fun b!245099 () Bool)

(assert (=> b!245099 (= e!159019 (arrayContainsKey!0 (_keys!6646 thiss!1504) key!932 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!60153 (not res!120245)) b!245098))

(assert (= (and b!245098 res!120246) b!245099))

(declare-fun m!262799 () Bool)

(assert (=> d!60153 m!262799))

(declare-fun m!262801 () Bool)

(assert (=> b!245099 m!262801))

(assert (=> b!244993 d!60153))

(declare-fun b!245116 () Bool)

(declare-fun e!159030 () Bool)

(declare-fun call!22865 () Bool)

(assert (=> b!245116 (= e!159030 (not call!22865))))

(declare-fun b!245117 () Bool)

(declare-fun e!159031 () Bool)

(declare-fun e!159029 () Bool)

(assert (=> b!245117 (= e!159031 e!159029)))

(declare-fun c!40907 () Bool)

(declare-fun lt!122720 () SeekEntryResult!1085)

(assert (=> b!245117 (= c!40907 ((_ is MissingVacant!1085) lt!122720))))

(declare-fun b!245118 () Bool)

(assert (=> b!245118 (= e!159029 ((_ is Undefined!1085) lt!122720))))

(declare-fun d!60155 () Bool)

(assert (=> d!60155 e!159031))

(declare-fun c!40908 () Bool)

(assert (=> d!60155 (= c!40908 ((_ is MissingZero!1085) lt!122720))))

(assert (=> d!60155 (= lt!122720 (seekEntryOrOpen!0 key!932 (_keys!6646 thiss!1504) (mask!10638 thiss!1504)))))

(declare-fun lt!122719 () Unit!7564)

(declare-fun choose!1143 (array!12119 array!12117 (_ BitVec 32) (_ BitVec 32) V!8195 V!8195 (_ BitVec 64) Int) Unit!7564)

(assert (=> d!60155 (= lt!122719 (choose!1143 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) key!932 (defaultEntry!4533 thiss!1504)))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> d!60155 (validMask!0 (mask!10638 thiss!1504))))

(assert (=> d!60155 (= (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!375 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) key!932 (defaultEntry!4533 thiss!1504)) lt!122719)))

(declare-fun call!22866 () Bool)

(declare-fun bm!22862 () Bool)

(assert (=> bm!22862 (= call!22866 (inRange!0 (ite c!40908 (index!6510 lt!122720) (index!6513 lt!122720)) (mask!10638 thiss!1504)))))

(declare-fun b!245119 () Bool)

(declare-fun e!159028 () Bool)

(assert (=> b!245119 (= e!159031 e!159028)))

(declare-fun res!120256 () Bool)

(assert (=> b!245119 (= res!120256 call!22866)))

(assert (=> b!245119 (=> (not res!120256) (not e!159028))))

(declare-fun b!245120 () Bool)

(declare-fun res!120258 () Bool)

(assert (=> b!245120 (=> (not res!120258) (not e!159030))))

(assert (=> b!245120 (= res!120258 (= (select (arr!5753 (_keys!6646 thiss!1504)) (index!6513 lt!122720)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245120 (and (bvsge (index!6513 lt!122720) #b00000000000000000000000000000000) (bvslt (index!6513 lt!122720) (size!6095 (_keys!6646 thiss!1504))))))

(declare-fun b!245121 () Bool)

(assert (=> b!245121 (and (bvsge (index!6510 lt!122720) #b00000000000000000000000000000000) (bvslt (index!6510 lt!122720) (size!6095 (_keys!6646 thiss!1504))))))

(declare-fun res!120257 () Bool)

(assert (=> b!245121 (= res!120257 (= (select (arr!5753 (_keys!6646 thiss!1504)) (index!6510 lt!122720)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!245121 (=> (not res!120257) (not e!159028))))

(declare-fun bm!22863 () Bool)

(assert (=> bm!22863 (= call!22865 (arrayContainsKey!0 (_keys!6646 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!245122 () Bool)

(assert (=> b!245122 (= e!159028 (not call!22865))))

(declare-fun b!245123 () Bool)

(declare-fun res!120255 () Bool)

(assert (=> b!245123 (=> (not res!120255) (not e!159030))))

(assert (=> b!245123 (= res!120255 call!22866)))

(assert (=> b!245123 (= e!159029 e!159030)))

(assert (= (and d!60155 c!40908) b!245119))

(assert (= (and d!60155 (not c!40908)) b!245117))

(assert (= (and b!245119 res!120256) b!245121))

(assert (= (and b!245121 res!120257) b!245122))

(assert (= (and b!245117 c!40907) b!245123))

(assert (= (and b!245117 (not c!40907)) b!245118))

(assert (= (and b!245123 res!120255) b!245120))

(assert (= (and b!245120 res!120258) b!245116))

(assert (= (or b!245119 b!245123) bm!22862))

(assert (= (or b!245122 b!245116) bm!22863))

(declare-fun m!262803 () Bool)

(assert (=> bm!22862 m!262803))

(assert (=> bm!22863 m!262729))

(declare-fun m!262805 () Bool)

(assert (=> b!245120 m!262805))

(assert (=> d!60155 m!262733))

(declare-fun m!262807 () Bool)

(assert (=> d!60155 m!262807))

(declare-fun m!262809 () Bool)

(assert (=> d!60155 m!262809))

(declare-fun m!262811 () Bool)

(assert (=> b!245121 m!262811))

(assert (=> b!245004 d!60155))

(declare-fun d!60157 () Bool)

(assert (=> d!60157 (= (validKeyInArray!0 (select (arr!5753 (_keys!6646 thiss!1504)) index!297)) (and (not (= (select (arr!5753 (_keys!6646 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5753 (_keys!6646 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245005 d!60157))

(declare-fun d!60159 () Bool)

(declare-fun res!120265 () Bool)

(declare-fun e!159034 () Bool)

(assert (=> d!60159 (=> (not res!120265) (not e!159034))))

(declare-fun simpleValid!252 (LongMapFixedSize!3624) Bool)

(assert (=> d!60159 (= res!120265 (simpleValid!252 thiss!1504))))

(assert (=> d!60159 (= (valid!1419 thiss!1504) e!159034)))

(declare-fun b!245130 () Bool)

(declare-fun res!120266 () Bool)

(assert (=> b!245130 (=> (not res!120266) (not e!159034))))

(declare-fun arrayCountValidKeys!0 (array!12119 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!245130 (= res!120266 (= (arrayCountValidKeys!0 (_keys!6646 thiss!1504) #b00000000000000000000000000000000 (size!6095 (_keys!6646 thiss!1504))) (_size!1861 thiss!1504)))))

(declare-fun b!245131 () Bool)

(declare-fun res!120267 () Bool)

(assert (=> b!245131 (=> (not res!120267) (not e!159034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12119 (_ BitVec 32)) Bool)

(assert (=> b!245131 (= res!120267 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6646 thiss!1504) (mask!10638 thiss!1504)))))

(declare-fun b!245132 () Bool)

(assert (=> b!245132 (= e!159034 (arrayNoDuplicates!0 (_keys!6646 thiss!1504) #b00000000000000000000000000000000 Nil!3661))))

(assert (= (and d!60159 res!120265) b!245130))

(assert (= (and b!245130 res!120266) b!245131))

(assert (= (and b!245131 res!120267) b!245132))

(declare-fun m!262813 () Bool)

(assert (=> d!60159 m!262813))

(declare-fun m!262815 () Bool)

(assert (=> b!245130 m!262815))

(declare-fun m!262817 () Bool)

(assert (=> b!245131 m!262817))

(declare-fun m!262819 () Bool)

(assert (=> b!245132 m!262819))

(assert (=> start!23296 d!60159))

(declare-fun d!60161 () Bool)

(assert (=> d!60161 (= (array_inv!3801 (_keys!6646 thiss!1504)) (bvsge (size!6095 (_keys!6646 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244987 d!60161))

(declare-fun d!60163 () Bool)

(assert (=> d!60163 (= (array_inv!3802 (_values!4516 thiss!1504)) (bvsge (size!6094 (_values!4516 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!244987 d!60163))

(declare-fun d!60165 () Bool)

(declare-fun lt!122728 () SeekEntryResult!1085)

(assert (=> d!60165 (and (or ((_ is Undefined!1085) lt!122728) (not ((_ is Found!1085) lt!122728)) (and (bvsge (index!6511 lt!122728) #b00000000000000000000000000000000) (bvslt (index!6511 lt!122728) (size!6095 (_keys!6646 thiss!1504))))) (or ((_ is Undefined!1085) lt!122728) ((_ is Found!1085) lt!122728) (not ((_ is MissingZero!1085) lt!122728)) (and (bvsge (index!6510 lt!122728) #b00000000000000000000000000000000) (bvslt (index!6510 lt!122728) (size!6095 (_keys!6646 thiss!1504))))) (or ((_ is Undefined!1085) lt!122728) ((_ is Found!1085) lt!122728) ((_ is MissingZero!1085) lt!122728) (not ((_ is MissingVacant!1085) lt!122728)) (and (bvsge (index!6513 lt!122728) #b00000000000000000000000000000000) (bvslt (index!6513 lt!122728) (size!6095 (_keys!6646 thiss!1504))))) (or ((_ is Undefined!1085) lt!122728) (ite ((_ is Found!1085) lt!122728) (= (select (arr!5753 (_keys!6646 thiss!1504)) (index!6511 lt!122728)) key!932) (ite ((_ is MissingZero!1085) lt!122728) (= (select (arr!5753 (_keys!6646 thiss!1504)) (index!6510 lt!122728)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!1085) lt!122728) (= (select (arr!5753 (_keys!6646 thiss!1504)) (index!6513 lt!122728)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!159042 () SeekEntryResult!1085)

(assert (=> d!60165 (= lt!122728 e!159042)))

(declare-fun c!40916 () Bool)

(declare-fun lt!122729 () SeekEntryResult!1085)

(assert (=> d!60165 (= c!40916 (and ((_ is Intermediate!1085) lt!122729) (undefined!1897 lt!122729)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12119 (_ BitVec 32)) SeekEntryResult!1085)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!60165 (= lt!122729 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 key!932 (mask!10638 thiss!1504)) key!932 (_keys!6646 thiss!1504) (mask!10638 thiss!1504)))))

(assert (=> d!60165 (validMask!0 (mask!10638 thiss!1504))))

(assert (=> d!60165 (= (seekEntryOrOpen!0 key!932 (_keys!6646 thiss!1504) (mask!10638 thiss!1504)) lt!122728)))

(declare-fun b!245145 () Bool)

(declare-fun c!40915 () Bool)

(declare-fun lt!122727 () (_ BitVec 64))

(assert (=> b!245145 (= c!40915 (= lt!122727 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!159043 () SeekEntryResult!1085)

(declare-fun e!159041 () SeekEntryResult!1085)

(assert (=> b!245145 (= e!159043 e!159041)))

(declare-fun b!245146 () Bool)

(assert (=> b!245146 (= e!159042 Undefined!1085)))

(declare-fun b!245147 () Bool)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!12119 (_ BitVec 32)) SeekEntryResult!1085)

(assert (=> b!245147 (= e!159041 (seekKeyOrZeroReturnVacant!0 (x!24397 lt!122729) (index!6512 lt!122729) (index!6512 lt!122729) key!932 (_keys!6646 thiss!1504) (mask!10638 thiss!1504)))))

(declare-fun b!245148 () Bool)

(assert (=> b!245148 (= e!159043 (Found!1085 (index!6512 lt!122729)))))

(declare-fun b!245149 () Bool)

(assert (=> b!245149 (= e!159042 e!159043)))

(assert (=> b!245149 (= lt!122727 (select (arr!5753 (_keys!6646 thiss!1504)) (index!6512 lt!122729)))))

(declare-fun c!40917 () Bool)

(assert (=> b!245149 (= c!40917 (= lt!122727 key!932))))

(declare-fun b!245150 () Bool)

(assert (=> b!245150 (= e!159041 (MissingZero!1085 (index!6512 lt!122729)))))

(assert (= (and d!60165 c!40916) b!245146))

(assert (= (and d!60165 (not c!40916)) b!245149))

(assert (= (and b!245149 c!40917) b!245148))

(assert (= (and b!245149 (not c!40917)) b!245145))

(assert (= (and b!245145 c!40915) b!245150))

(assert (= (and b!245145 (not c!40915)) b!245147))

(declare-fun m!262821 () Bool)

(assert (=> d!60165 m!262821))

(declare-fun m!262823 () Bool)

(assert (=> d!60165 m!262823))

(declare-fun m!262825 () Bool)

(assert (=> d!60165 m!262825))

(assert (=> d!60165 m!262809))

(declare-fun m!262827 () Bool)

(assert (=> d!60165 m!262827))

(assert (=> d!60165 m!262825))

(declare-fun m!262829 () Bool)

(assert (=> d!60165 m!262829))

(declare-fun m!262831 () Bool)

(assert (=> b!245147 m!262831))

(declare-fun m!262833 () Bool)

(assert (=> b!245149 m!262833))

(assert (=> b!244996 d!60165))

(declare-fun d!60167 () Bool)

(assert (=> d!60167 (= (validKeyInArray!0 key!932) (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!244999 d!60167))

(assert (=> bm!22848 d!60153))

(declare-fun d!60169 () Bool)

(declare-fun e!159046 () Bool)

(assert (=> d!60169 e!159046))

(declare-fun res!120273 () Bool)

(assert (=> d!60169 (=> (not res!120273) (not e!159046))))

(declare-fun lt!122735 () SeekEntryResult!1085)

(assert (=> d!60169 (= res!120273 ((_ is Found!1085) lt!122735))))

(assert (=> d!60169 (= lt!122735 (seekEntryOrOpen!0 key!932 (_keys!6646 thiss!1504) (mask!10638 thiss!1504)))))

(declare-fun lt!122734 () Unit!7564)

(declare-fun choose!1144 (array!12119 array!12117 (_ BitVec 32) (_ BitVec 32) V!8195 V!8195 (_ BitVec 64) Int) Unit!7564)

(assert (=> d!60169 (= lt!122734 (choose!1144 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) key!932 (defaultEntry!4533 thiss!1504)))))

(assert (=> d!60169 (validMask!0 (mask!10638 thiss!1504))))

(assert (=> d!60169 (= (lemmaInListMapThenSeekEntryOrOpenFindsIt!369 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) key!932 (defaultEntry!4533 thiss!1504)) lt!122734)))

(declare-fun b!245155 () Bool)

(declare-fun res!120272 () Bool)

(assert (=> b!245155 (=> (not res!120272) (not e!159046))))

(assert (=> b!245155 (= res!120272 (inRange!0 (index!6511 lt!122735) (mask!10638 thiss!1504)))))

(declare-fun b!245156 () Bool)

(assert (=> b!245156 (= e!159046 (= (select (arr!5753 (_keys!6646 thiss!1504)) (index!6511 lt!122735)) key!932))))

(assert (=> b!245156 (and (bvsge (index!6511 lt!122735) #b00000000000000000000000000000000) (bvslt (index!6511 lt!122735) (size!6095 (_keys!6646 thiss!1504))))))

(assert (= (and d!60169 res!120273) b!245155))

(assert (= (and b!245155 res!120272) b!245156))

(assert (=> d!60169 m!262733))

(declare-fun m!262835 () Bool)

(assert (=> d!60169 m!262835))

(assert (=> d!60169 m!262809))

(declare-fun m!262837 () Bool)

(assert (=> b!245155 m!262837))

(declare-fun m!262839 () Bool)

(assert (=> b!245156 m!262839))

(assert (=> b!244990 d!60169))

(declare-fun d!60171 () Bool)

(assert (=> d!60171 (= (inRange!0 index!297 (mask!10638 thiss!1504)) (and (bvsge index!297 #b00000000000000000000000000000000) (bvslt index!297 (bvadd (mask!10638 thiss!1504) #b00000000000000000000000000000001))))))

(assert (=> b!245002 d!60171))

(declare-fun d!60173 () Bool)

(declare-fun e!159052 () Bool)

(assert (=> d!60173 e!159052))

(declare-fun res!120276 () Bool)

(assert (=> d!60173 (=> res!120276 e!159052)))

(declare-fun lt!122745 () Bool)

(assert (=> d!60173 (= res!120276 (not lt!122745))))

(declare-fun lt!122747 () Bool)

(assert (=> d!60173 (= lt!122745 lt!122747)))

(declare-fun lt!122746 () Unit!7564)

(declare-fun e!159051 () Unit!7564)

(assert (=> d!60173 (= lt!122746 e!159051)))

(declare-fun c!40920 () Bool)

(assert (=> d!60173 (= c!40920 lt!122747)))

(declare-fun containsKey!279 (List!3665 (_ BitVec 64)) Bool)

(assert (=> d!60173 (= lt!122747 (containsKey!279 (toList!1863 (getCurrentListMap!1391 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504))) key!932))))

(assert (=> d!60173 (= (contains!1770 (getCurrentListMap!1391 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504)) key!932) lt!122745)))

(declare-fun b!245163 () Bool)

(declare-fun lt!122744 () Unit!7564)

(assert (=> b!245163 (= e!159051 lt!122744)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!227 (List!3665 (_ BitVec 64)) Unit!7564)

(assert (=> b!245163 (= lt!122744 (lemmaContainsKeyImpliesGetValueByKeyDefined!227 (toList!1863 (getCurrentListMap!1391 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504))) key!932))))

(declare-datatypes ((Option!293 0))(
  ( (Some!292 (v!5303 V!8195)) (None!291) )
))
(declare-fun isDefined!228 (Option!293) Bool)

(declare-fun getValueByKey!287 (List!3665 (_ BitVec 64)) Option!293)

(assert (=> b!245163 (isDefined!228 (getValueByKey!287 (toList!1863 (getCurrentListMap!1391 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504))) key!932))))

(declare-fun b!245164 () Bool)

(declare-fun Unit!7569 () Unit!7564)

(assert (=> b!245164 (= e!159051 Unit!7569)))

(declare-fun b!245165 () Bool)

(assert (=> b!245165 (= e!159052 (isDefined!228 (getValueByKey!287 (toList!1863 (getCurrentListMap!1391 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504))) key!932)))))

(assert (= (and d!60173 c!40920) b!245163))

(assert (= (and d!60173 (not c!40920)) b!245164))

(assert (= (and d!60173 (not res!120276)) b!245165))

(declare-fun m!262841 () Bool)

(assert (=> d!60173 m!262841))

(declare-fun m!262843 () Bool)

(assert (=> b!245163 m!262843))

(declare-fun m!262845 () Bool)

(assert (=> b!245163 m!262845))

(assert (=> b!245163 m!262845))

(declare-fun m!262847 () Bool)

(assert (=> b!245163 m!262847))

(assert (=> b!245165 m!262845))

(assert (=> b!245165 m!262845))

(assert (=> b!245165 m!262847))

(assert (=> b!245002 d!60173))

(declare-fun b!245208 () Bool)

(declare-fun e!159082 () Bool)

(declare-fun lt!122808 () ListLongMap!3695)

(declare-fun apply!229 (ListLongMap!3695 (_ BitVec 64)) V!8195)

(declare-fun get!2951 (ValueCell!2862 V!8195) V!8195)

(declare-fun dynLambda!572 (Int (_ BitVec 64)) V!8195)

(assert (=> b!245208 (= e!159082 (= (apply!229 lt!122808 (select (arr!5753 (_keys!6646 thiss!1504)) #b00000000000000000000000000000000)) (get!2951 (select (arr!5752 (_values!4516 thiss!1504)) #b00000000000000000000000000000000) (dynLambda!572 (defaultEntry!4533 thiss!1504) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!245208 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6094 (_values!4516 thiss!1504))))))

(assert (=> b!245208 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6095 (_keys!6646 thiss!1504))))))

(declare-fun b!245209 () Bool)

(declare-fun e!159084 () Bool)

(declare-fun e!159079 () Bool)

(assert (=> b!245209 (= e!159084 e!159079)))

(declare-fun res!120297 () Bool)

(declare-fun call!22883 () Bool)

(assert (=> b!245209 (= res!120297 call!22883)))

(assert (=> b!245209 (=> (not res!120297) (not e!159079))))

(declare-fun b!245210 () Bool)

(declare-fun res!120301 () Bool)

(declare-fun e!159086 () Bool)

(assert (=> b!245210 (=> (not res!120301) (not e!159086))))

(assert (=> b!245210 (= res!120301 e!159084)))

(declare-fun c!40937 () Bool)

(assert (=> b!245210 (= c!40937 (not (= (bvand (extraKeys!4270 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun bm!22878 () Bool)

(declare-fun call!22886 () ListLongMap!3695)

(declare-fun call!22884 () ListLongMap!3695)

(assert (=> bm!22878 (= call!22886 call!22884)))

(declare-fun b!245211 () Bool)

(declare-fun e!159087 () ListLongMap!3695)

(declare-fun e!159089 () ListLongMap!3695)

(assert (=> b!245211 (= e!159087 e!159089)))

(declare-fun c!40933 () Bool)

(assert (=> b!245211 (= c!40933 (and (not (= (bvand (extraKeys!4270 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4270 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!245212 () Bool)

(assert (=> b!245212 (= e!159079 (= (apply!229 lt!122808 #b0000000000000000000000000000000000000000000000000000000000000000) (zeroValue!4374 thiss!1504)))))

(declare-fun b!245213 () Bool)

(declare-fun e!159088 () Bool)

(declare-fun e!159081 () Bool)

(assert (=> b!245213 (= e!159088 e!159081)))

(declare-fun res!120303 () Bool)

(declare-fun call!22882 () Bool)

(assert (=> b!245213 (= res!120303 call!22882)))

(assert (=> b!245213 (=> (not res!120303) (not e!159081))))

(declare-fun bm!22879 () Bool)

(declare-fun call!22887 () ListLongMap!3695)

(declare-fun call!22885 () ListLongMap!3695)

(assert (=> bm!22879 (= call!22887 call!22885)))

(declare-fun bm!22880 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!551 (array!12119 array!12117 (_ BitVec 32) (_ BitVec 32) V!8195 V!8195 (_ BitVec 32) Int) ListLongMap!3695)

(assert (=> bm!22880 (= call!22885 (getCurrentListMapNoExtraKeys!551 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504)))))

(declare-fun bm!22881 () Bool)

(assert (=> bm!22881 (= call!22883 (contains!1770 lt!122808 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245214 () Bool)

(declare-fun res!120295 () Bool)

(assert (=> b!245214 (=> (not res!120295) (not e!159086))))

(declare-fun e!159080 () Bool)

(assert (=> b!245214 (= res!120295 e!159080)))

(declare-fun res!120299 () Bool)

(assert (=> b!245214 (=> res!120299 e!159080)))

(declare-fun e!159090 () Bool)

(assert (=> b!245214 (= res!120299 (not e!159090))))

(declare-fun res!120296 () Bool)

(assert (=> b!245214 (=> (not res!120296) (not e!159090))))

(assert (=> b!245214 (= res!120296 (bvslt #b00000000000000000000000000000000 (size!6095 (_keys!6646 thiss!1504))))))

(declare-fun b!245215 () Bool)

(declare-fun +!656 (ListLongMap!3695 tuple2!4782) ListLongMap!3695)

(assert (=> b!245215 (= e!159087 (+!656 call!22884 (tuple2!4783 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4374 thiss!1504))))))

(declare-fun b!245216 () Bool)

(declare-fun e!159091 () ListLongMap!3695)

(declare-fun call!22881 () ListLongMap!3695)

(assert (=> b!245216 (= e!159091 call!22881)))

(declare-fun bm!22882 () Bool)

(assert (=> bm!22882 (= call!22881 call!22887)))

(declare-fun b!245217 () Bool)

(declare-fun e!159085 () Bool)

(assert (=> b!245217 (= e!159085 (validKeyInArray!0 (select (arr!5753 (_keys!6646 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245218 () Bool)

(assert (=> b!245218 (= e!159081 (= (apply!229 lt!122808 #b1000000000000000000000000000000000000000000000000000000000000000) (minValue!4374 thiss!1504)))))

(declare-fun b!245219 () Bool)

(declare-fun e!159083 () Unit!7564)

(declare-fun Unit!7570 () Unit!7564)

(assert (=> b!245219 (= e!159083 Unit!7570)))

(declare-fun d!60175 () Bool)

(assert (=> d!60175 e!159086))

(declare-fun res!120300 () Bool)

(assert (=> d!60175 (=> (not res!120300) (not e!159086))))

(assert (=> d!60175 (= res!120300 (or (bvsge #b00000000000000000000000000000000 (size!6095 (_keys!6646 thiss!1504))) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6095 (_keys!6646 thiss!1504))))))))

(declare-fun lt!122800 () ListLongMap!3695)

(assert (=> d!60175 (= lt!122808 lt!122800)))

(declare-fun lt!122810 () Unit!7564)

(assert (=> d!60175 (= lt!122810 e!159083)))

(declare-fun c!40934 () Bool)

(assert (=> d!60175 (= c!40934 e!159085)))

(declare-fun res!120298 () Bool)

(assert (=> d!60175 (=> (not res!120298) (not e!159085))))

(assert (=> d!60175 (= res!120298 (bvslt #b00000000000000000000000000000000 (size!6095 (_keys!6646 thiss!1504))))))

(assert (=> d!60175 (= lt!122800 e!159087)))

(declare-fun c!40936 () Bool)

(assert (=> d!60175 (= c!40936 (and (not (= (bvand (extraKeys!4270 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!4270 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!60175 (validMask!0 (mask!10638 thiss!1504))))

(assert (=> d!60175 (= (getCurrentListMap!1391 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504)) lt!122808)))

(declare-fun bm!22883 () Bool)

(assert (=> bm!22883 (= call!22884 (+!656 (ite c!40936 call!22885 (ite c!40933 call!22887 call!22881)) (ite (or c!40936 c!40933) (tuple2!4783 #b0000000000000000000000000000000000000000000000000000000000000000 (zeroValue!4374 thiss!1504)) (tuple2!4783 #b1000000000000000000000000000000000000000000000000000000000000000 (minValue!4374 thiss!1504)))))))

(declare-fun bm!22884 () Bool)

(assert (=> bm!22884 (= call!22882 (contains!1770 lt!122808 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!245220 () Bool)

(declare-fun c!40935 () Bool)

(assert (=> b!245220 (= c!40935 (and (not (= (bvand (extraKeys!4270 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand (extraKeys!4270 thiss!1504) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!245220 (= e!159089 e!159091)))

(declare-fun b!245221 () Bool)

(assert (=> b!245221 (= e!159090 (validKeyInArray!0 (select (arr!5753 (_keys!6646 thiss!1504)) #b00000000000000000000000000000000)))))

(declare-fun b!245222 () Bool)

(assert (=> b!245222 (= e!159088 (not call!22882))))

(declare-fun b!245223 () Bool)

(assert (=> b!245223 (= e!159086 e!159088)))

(declare-fun c!40938 () Bool)

(assert (=> b!245223 (= c!40938 (not (= (bvand (extraKeys!4270 thiss!1504) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!245224 () Bool)

(assert (=> b!245224 (= e!159080 e!159082)))

(declare-fun res!120302 () Bool)

(assert (=> b!245224 (=> (not res!120302) (not e!159082))))

(assert (=> b!245224 (= res!120302 (contains!1770 lt!122808 (select (arr!5753 (_keys!6646 thiss!1504)) #b00000000000000000000000000000000)))))

(assert (=> b!245224 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!6095 (_keys!6646 thiss!1504))))))

(declare-fun b!245225 () Bool)

(assert (=> b!245225 (= e!159089 call!22886)))

(declare-fun b!245226 () Bool)

(assert (=> b!245226 (= e!159091 call!22886)))

(declare-fun b!245227 () Bool)

(assert (=> b!245227 (= e!159084 (not call!22883))))

(declare-fun b!245228 () Bool)

(declare-fun lt!122801 () Unit!7564)

(assert (=> b!245228 (= e!159083 lt!122801)))

(declare-fun lt!122802 () ListLongMap!3695)

(assert (=> b!245228 (= lt!122802 (getCurrentListMapNoExtraKeys!551 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504)))))

(declare-fun lt!122813 () (_ BitVec 64))

(assert (=> b!245228 (= lt!122813 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122793 () (_ BitVec 64))

(assert (=> b!245228 (= lt!122793 (select (arr!5753 (_keys!6646 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122806 () Unit!7564)

(declare-fun addStillContains!205 (ListLongMap!3695 (_ BitVec 64) V!8195 (_ BitVec 64)) Unit!7564)

(assert (=> b!245228 (= lt!122806 (addStillContains!205 lt!122802 lt!122813 (zeroValue!4374 thiss!1504) lt!122793))))

(assert (=> b!245228 (contains!1770 (+!656 lt!122802 (tuple2!4783 lt!122813 (zeroValue!4374 thiss!1504))) lt!122793)))

(declare-fun lt!122796 () Unit!7564)

(assert (=> b!245228 (= lt!122796 lt!122806)))

(declare-fun lt!122792 () ListLongMap!3695)

(assert (=> b!245228 (= lt!122792 (getCurrentListMapNoExtraKeys!551 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504)))))

(declare-fun lt!122794 () (_ BitVec 64))

(assert (=> b!245228 (= lt!122794 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122799 () (_ BitVec 64))

(assert (=> b!245228 (= lt!122799 (select (arr!5753 (_keys!6646 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122807 () Unit!7564)

(declare-fun addApplyDifferent!205 (ListLongMap!3695 (_ BitVec 64) V!8195 (_ BitVec 64)) Unit!7564)

(assert (=> b!245228 (= lt!122807 (addApplyDifferent!205 lt!122792 lt!122794 (minValue!4374 thiss!1504) lt!122799))))

(assert (=> b!245228 (= (apply!229 (+!656 lt!122792 (tuple2!4783 lt!122794 (minValue!4374 thiss!1504))) lt!122799) (apply!229 lt!122792 lt!122799))))

(declare-fun lt!122804 () Unit!7564)

(assert (=> b!245228 (= lt!122804 lt!122807)))

(declare-fun lt!122798 () ListLongMap!3695)

(assert (=> b!245228 (= lt!122798 (getCurrentListMapNoExtraKeys!551 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504)))))

(declare-fun lt!122811 () (_ BitVec 64))

(assert (=> b!245228 (= lt!122811 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122809 () (_ BitVec 64))

(assert (=> b!245228 (= lt!122809 (select (arr!5753 (_keys!6646 thiss!1504)) #b00000000000000000000000000000000))))

(declare-fun lt!122803 () Unit!7564)

(assert (=> b!245228 (= lt!122803 (addApplyDifferent!205 lt!122798 lt!122811 (zeroValue!4374 thiss!1504) lt!122809))))

(assert (=> b!245228 (= (apply!229 (+!656 lt!122798 (tuple2!4783 lt!122811 (zeroValue!4374 thiss!1504))) lt!122809) (apply!229 lt!122798 lt!122809))))

(declare-fun lt!122805 () Unit!7564)

(assert (=> b!245228 (= lt!122805 lt!122803)))

(declare-fun lt!122812 () ListLongMap!3695)

(assert (=> b!245228 (= lt!122812 (getCurrentListMapNoExtraKeys!551 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504)))))

(declare-fun lt!122797 () (_ BitVec 64))

(assert (=> b!245228 (= lt!122797 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!122795 () (_ BitVec 64))

(assert (=> b!245228 (= lt!122795 (select (arr!5753 (_keys!6646 thiss!1504)) #b00000000000000000000000000000000))))

(assert (=> b!245228 (= lt!122801 (addApplyDifferent!205 lt!122812 lt!122797 (minValue!4374 thiss!1504) lt!122795))))

(assert (=> b!245228 (= (apply!229 (+!656 lt!122812 (tuple2!4783 lt!122797 (minValue!4374 thiss!1504))) lt!122795) (apply!229 lt!122812 lt!122795))))

(assert (= (and d!60175 c!40936) b!245215))

(assert (= (and d!60175 (not c!40936)) b!245211))

(assert (= (and b!245211 c!40933) b!245225))

(assert (= (and b!245211 (not c!40933)) b!245220))

(assert (= (and b!245220 c!40935) b!245226))

(assert (= (and b!245220 (not c!40935)) b!245216))

(assert (= (or b!245226 b!245216) bm!22882))

(assert (= (or b!245225 bm!22882) bm!22879))

(assert (= (or b!245225 b!245226) bm!22878))

(assert (= (or b!245215 bm!22879) bm!22880))

(assert (= (or b!245215 bm!22878) bm!22883))

(assert (= (and d!60175 res!120298) b!245217))

(assert (= (and d!60175 c!40934) b!245228))

(assert (= (and d!60175 (not c!40934)) b!245219))

(assert (= (and d!60175 res!120300) b!245214))

(assert (= (and b!245214 res!120296) b!245221))

(assert (= (and b!245214 (not res!120299)) b!245224))

(assert (= (and b!245224 res!120302) b!245208))

(assert (= (and b!245214 res!120295) b!245210))

(assert (= (and b!245210 c!40937) b!245209))

(assert (= (and b!245210 (not c!40937)) b!245227))

(assert (= (and b!245209 res!120297) b!245212))

(assert (= (or b!245209 b!245227) bm!22881))

(assert (= (and b!245210 res!120301) b!245223))

(assert (= (and b!245223 c!40938) b!245213))

(assert (= (and b!245223 (not c!40938)) b!245222))

(assert (= (and b!245213 res!120303) b!245218))

(assert (= (or b!245213 b!245222) bm!22884))

(declare-fun b_lambda!8019 () Bool)

(assert (=> (not b_lambda!8019) (not b!245208)))

(declare-fun t!8678 () Bool)

(declare-fun tb!2971 () Bool)

(assert (=> (and b!244987 (= (defaultEntry!4533 thiss!1504) (defaultEntry!4533 thiss!1504)) t!8678) tb!2971))

(declare-fun result!5235 () Bool)

(assert (=> tb!2971 (= result!5235 tp_is_empty!6411)))

(assert (=> b!245208 t!8678))

(declare-fun b_and!13539 () Bool)

(assert (= b_and!13535 (and (=> t!8678 result!5235) b_and!13539)))

(assert (=> b!245221 m!262799))

(assert (=> b!245221 m!262799))

(declare-fun m!262849 () Bool)

(assert (=> b!245221 m!262849))

(declare-fun m!262851 () Bool)

(assert (=> b!245218 m!262851))

(declare-fun m!262853 () Bool)

(assert (=> bm!22883 m!262853))

(declare-fun m!262855 () Bool)

(assert (=> b!245208 m!262855))

(declare-fun m!262857 () Bool)

(assert (=> b!245208 m!262857))

(declare-fun m!262859 () Bool)

(assert (=> b!245208 m!262859))

(assert (=> b!245208 m!262857))

(assert (=> b!245208 m!262799))

(assert (=> b!245208 m!262799))

(declare-fun m!262861 () Bool)

(assert (=> b!245208 m!262861))

(assert (=> b!245208 m!262855))

(assert (=> b!245217 m!262799))

(assert (=> b!245217 m!262799))

(assert (=> b!245217 m!262849))

(declare-fun m!262863 () Bool)

(assert (=> bm!22881 m!262863))

(declare-fun m!262865 () Bool)

(assert (=> bm!22880 m!262865))

(declare-fun m!262867 () Bool)

(assert (=> b!245215 m!262867))

(assert (=> b!245224 m!262799))

(assert (=> b!245224 m!262799))

(declare-fun m!262869 () Bool)

(assert (=> b!245224 m!262869))

(assert (=> d!60175 m!262809))

(declare-fun m!262871 () Bool)

(assert (=> bm!22884 m!262871))

(declare-fun m!262873 () Bool)

(assert (=> b!245228 m!262873))

(declare-fun m!262875 () Bool)

(assert (=> b!245228 m!262875))

(assert (=> b!245228 m!262799))

(declare-fun m!262877 () Bool)

(assert (=> b!245228 m!262877))

(declare-fun m!262879 () Bool)

(assert (=> b!245228 m!262879))

(assert (=> b!245228 m!262873))

(declare-fun m!262881 () Bool)

(assert (=> b!245228 m!262881))

(declare-fun m!262883 () Bool)

(assert (=> b!245228 m!262883))

(declare-fun m!262885 () Bool)

(assert (=> b!245228 m!262885))

(declare-fun m!262887 () Bool)

(assert (=> b!245228 m!262887))

(declare-fun m!262889 () Bool)

(assert (=> b!245228 m!262889))

(declare-fun m!262891 () Bool)

(assert (=> b!245228 m!262891))

(assert (=> b!245228 m!262865))

(assert (=> b!245228 m!262879))

(declare-fun m!262893 () Bool)

(assert (=> b!245228 m!262893))

(assert (=> b!245228 m!262885))

(assert (=> b!245228 m!262881))

(declare-fun m!262895 () Bool)

(assert (=> b!245228 m!262895))

(declare-fun m!262897 () Bool)

(assert (=> b!245228 m!262897))

(declare-fun m!262899 () Bool)

(assert (=> b!245228 m!262899))

(declare-fun m!262901 () Bool)

(assert (=> b!245228 m!262901))

(declare-fun m!262903 () Bool)

(assert (=> b!245212 m!262903))

(assert (=> b!245002 d!60175))

(declare-fun d!60177 () Bool)

(assert (=> d!60177 (contains!1770 (getCurrentListMap!1391 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504)) key!932)))

(declare-fun lt!122816 () Unit!7564)

(declare-fun choose!1145 (array!12119 array!12117 (_ BitVec 32) (_ BitVec 32) V!8195 V!8195 (_ BitVec 64) (_ BitVec 32) Int) Unit!7564)

(assert (=> d!60177 (= lt!122816 (choose!1145 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504)))))

(assert (=> d!60177 (validMask!0 (mask!10638 thiss!1504))))

(assert (=> d!60177 (= (lemmaArrayContainsKeyThenInListMap!173 (_keys!6646 thiss!1504) (_values!4516 thiss!1504) (mask!10638 thiss!1504) (extraKeys!4270 thiss!1504) (zeroValue!4374 thiss!1504) (minValue!4374 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4533 thiss!1504)) lt!122816)))

(declare-fun bs!8887 () Bool)

(assert (= bs!8887 d!60177))

(assert (=> bs!8887 m!262739))

(assert (=> bs!8887 m!262739))

(assert (=> bs!8887 m!262741))

(declare-fun m!262905 () Bool)

(assert (=> bs!8887 m!262905))

(assert (=> bs!8887 m!262809))

(assert (=> b!245003 d!60177))

(declare-fun mapNonEmpty!10879 () Bool)

(declare-fun mapRes!10879 () Bool)

(declare-fun tp!22885 () Bool)

(declare-fun e!159096 () Bool)

(assert (=> mapNonEmpty!10879 (= mapRes!10879 (and tp!22885 e!159096))))

(declare-fun mapKey!10879 () (_ BitVec 32))

(declare-fun mapRest!10879 () (Array (_ BitVec 32) ValueCell!2862))

(declare-fun mapValue!10879 () ValueCell!2862)

(assert (=> mapNonEmpty!10879 (= mapRest!10873 (store mapRest!10879 mapKey!10879 mapValue!10879))))

(declare-fun condMapEmpty!10879 () Bool)

(declare-fun mapDefault!10879 () ValueCell!2862)

(assert (=> mapNonEmpty!10873 (= condMapEmpty!10879 (= mapRest!10873 ((as const (Array (_ BitVec 32) ValueCell!2862)) mapDefault!10879)))))

(declare-fun e!159097 () Bool)

(assert (=> mapNonEmpty!10873 (= tp!22876 (and e!159097 mapRes!10879))))

(declare-fun b!245237 () Bool)

(assert (=> b!245237 (= e!159096 tp_is_empty!6411)))

(declare-fun b!245238 () Bool)

(assert (=> b!245238 (= e!159097 tp_is_empty!6411)))

(declare-fun mapIsEmpty!10879 () Bool)

(assert (=> mapIsEmpty!10879 mapRes!10879))

(assert (= (and mapNonEmpty!10873 condMapEmpty!10879) mapIsEmpty!10879))

(assert (= (and mapNonEmpty!10873 (not condMapEmpty!10879)) mapNonEmpty!10879))

(assert (= (and mapNonEmpty!10879 ((_ is ValueCellFull!2862) mapValue!10879)) b!245237))

(assert (= (and mapNonEmpty!10873 ((_ is ValueCellFull!2862) mapDefault!10879)) b!245238))

(declare-fun m!262907 () Bool)

(assert (=> mapNonEmpty!10879 m!262907))

(declare-fun b_lambda!8021 () Bool)

(assert (= b_lambda!8019 (or (and b!244987 b_free!6549) b_lambda!8021)))

(check-sat (not d!60159) (not b!245087) (not bm!22857) (not d!60177) (not d!60151) (not bm!22881) (not b!245163) (not b!245147) (not d!60169) (not b!245090) (not b!245218) (not b!245130) (not mapNonEmpty!10879) (not b!245165) (not bm!22884) (not b!245093) (not bm!22883) tp_is_empty!6411 (not b!245228) (not bm!22862) (not b!245224) (not d!60165) (not b!245099) (not b!245208) (not b_next!6549) (not b!245131) (not d!60173) (not b!245212) b_and!13539 (not d!60155) (not b!245088) (not b!245155) (not b!245221) (not b!245217) (not d!60175) (not b!245215) (not b_lambda!8021) (not b!245132) (not bm!22880) (not bm!22863))
(check-sat b_and!13539 (not b_next!6549))
