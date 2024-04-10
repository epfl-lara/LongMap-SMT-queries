; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21834 () Bool)

(assert start!21834)

(declare-fun b!219740 () Bool)

(declare-fun b_free!5901 () Bool)

(declare-fun b_next!5901 () Bool)

(assert (=> b!219740 (= b_free!5901 (not b_next!5901))))

(declare-fun tp!20844 () Bool)

(declare-fun b_and!12799 () Bool)

(assert (=> b!219740 (= tp!20844 b_and!12799)))

(declare-fun b!219730 () Bool)

(declare-fun e!142915 () Bool)

(declare-fun tp_is_empty!5763 () Bool)

(assert (=> b!219730 (= e!142915 tp_is_empty!5763)))

(declare-fun b!219731 () Bool)

(declare-fun c!36586 () Bool)

(declare-datatypes ((SeekEntryResult!801 0))(
  ( (MissingZero!801 (index!5374 (_ BitVec 32))) (Found!801 (index!5375 (_ BitVec 32))) (Intermediate!801 (undefined!1613 Bool) (index!5376 (_ BitVec 32)) (x!22917 (_ BitVec 32))) (Undefined!801) (MissingVacant!801 (index!5377 (_ BitVec 32))) )
))
(declare-fun lt!112021 () SeekEntryResult!801)

(get-info :version)

(assert (=> b!219731 (= c!36586 ((_ is MissingVacant!801) lt!112021))))

(declare-fun e!142912 () Bool)

(declare-fun e!142908 () Bool)

(assert (=> b!219731 (= e!142912 e!142908)))

(declare-fun b!219732 () Bool)

(declare-fun e!142911 () Bool)

(declare-fun call!20538 () Bool)

(assert (=> b!219732 (= e!142911 (not call!20538))))

(declare-fun mapNonEmpty!9814 () Bool)

(declare-fun mapRes!9814 () Bool)

(declare-fun tp!20845 () Bool)

(assert (=> mapNonEmpty!9814 (= mapRes!9814 (and tp!20845 e!142915))))

(declare-datatypes ((V!7331 0))(
  ( (V!7332 (val!2926 Int)) )
))
(declare-datatypes ((ValueCell!2538 0))(
  ( (ValueCellFull!2538 (v!4946 V!7331)) (EmptyCell!2538) )
))
(declare-fun mapValue!9814 () ValueCell!2538)

(declare-fun mapKey!9814 () (_ BitVec 32))

(declare-datatypes ((array!10769 0))(
  ( (array!10770 (arr!5104 (Array (_ BitVec 32) ValueCell!2538)) (size!5437 (_ BitVec 32))) )
))
(declare-datatypes ((array!10771 0))(
  ( (array!10772 (arr!5105 (Array (_ BitVec 32) (_ BitVec 64))) (size!5438 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2976 0))(
  ( (LongMapFixedSize!2977 (defaultEntry!4147 Int) (mask!9941 (_ BitVec 32)) (extraKeys!3884 (_ BitVec 32)) (zeroValue!3988 V!7331) (minValue!3988 V!7331) (_size!1537 (_ BitVec 32)) (_keys!6201 array!10771) (_values!4130 array!10769) (_vacant!1537 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!2976)

(declare-fun mapRest!9814 () (Array (_ BitVec 32) ValueCell!2538))

(assert (=> mapNonEmpty!9814 (= (arr!5104 (_values!4130 thiss!1504)) (store mapRest!9814 mapKey!9814 mapValue!9814))))

(declare-fun b!219733 () Bool)

(declare-fun e!142909 () Bool)

(declare-fun e!142918 () Bool)

(assert (=> b!219733 (= e!142909 e!142918)))

(declare-fun res!107707 () Bool)

(assert (=> b!219733 (=> (not res!107707) (not e!142918))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!219733 (= res!107707 (inRange!0 index!297 (mask!9941 thiss!1504)))))

(declare-datatypes ((Unit!6552 0))(
  ( (Unit!6553) )
))
(declare-fun lt!112018 () Unit!6552)

(declare-fun e!142919 () Unit!6552)

(assert (=> b!219733 (= lt!112018 e!142919)))

(declare-fun c!36588 () Bool)

(declare-fun key!932 () (_ BitVec 64))

(declare-datatypes ((tuple2!4344 0))(
  ( (tuple2!4345 (_1!2183 (_ BitVec 64)) (_2!2183 V!7331)) )
))
(declare-datatypes ((List!3246 0))(
  ( (Nil!3243) (Cons!3242 (h!3890 tuple2!4344) (t!8205 List!3246)) )
))
(declare-datatypes ((ListLongMap!3257 0))(
  ( (ListLongMap!3258 (toList!1644 List!3246)) )
))
(declare-fun contains!1487 (ListLongMap!3257 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1172 (array!10771 array!10769 (_ BitVec 32) (_ BitVec 32) V!7331 V!7331 (_ BitVec 32) Int) ListLongMap!3257)

(assert (=> b!219733 (= c!36588 (contains!1487 (getCurrentListMap!1172 (_keys!6201 thiss!1504) (_values!4130 thiss!1504) (mask!9941 thiss!1504) (extraKeys!3884 thiss!1504) (zeroValue!3988 thiss!1504) (minValue!3988 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4147 thiss!1504)) key!932))))

(declare-fun b!219734 () Bool)

(declare-fun res!107713 () Bool)

(assert (=> b!219734 (=> (not res!107713) (not e!142918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!10771 (_ BitVec 32)) Bool)

(assert (=> b!219734 (= res!107713 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6201 thiss!1504) (mask!9941 thiss!1504)))))

(declare-fun b!219735 () Bool)

(declare-fun e!142913 () Bool)

(assert (=> b!219735 (= e!142913 (not call!20538))))

(declare-fun b!219736 () Bool)

(declare-fun res!107706 () Bool)

(assert (=> b!219736 (=> (not res!107706) (not e!142913))))

(assert (=> b!219736 (= res!107706 (= (select (arr!5105 (_keys!6201 thiss!1504)) (index!5374 lt!112021)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun res!107709 () Bool)

(declare-fun e!142910 () Bool)

(assert (=> start!21834 (=> (not res!107709) (not e!142910))))

(declare-fun valid!1204 (LongMapFixedSize!2976) Bool)

(assert (=> start!21834 (= res!107709 (valid!1204 thiss!1504))))

(assert (=> start!21834 e!142910))

(declare-fun e!142916 () Bool)

(assert (=> start!21834 e!142916))

(assert (=> start!21834 true))

(declare-fun b!219737 () Bool)

(declare-fun res!107712 () Bool)

(assert (=> b!219737 (=> (not res!107712) (not e!142918))))

(declare-fun arrayContainsKey!0 (array!10771 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!219737 (= res!107712 (arrayContainsKey!0 (_keys!6201 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!219738 () Bool)

(declare-fun lt!112019 () Unit!6552)

(assert (=> b!219738 (= e!142919 lt!112019)))

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!209 (array!10771 array!10769 (_ BitVec 32) (_ BitVec 32) V!7331 V!7331 (_ BitVec 64) Int) Unit!6552)

(assert (=> b!219738 (= lt!112019 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!209 (_keys!6201 thiss!1504) (_values!4130 thiss!1504) (mask!9941 thiss!1504) (extraKeys!3884 thiss!1504) (zeroValue!3988 thiss!1504) (minValue!3988 thiss!1504) key!932 (defaultEntry!4147 thiss!1504)))))

(declare-fun c!36587 () Bool)

(assert (=> b!219738 (= c!36587 ((_ is MissingZero!801) lt!112021))))

(assert (=> b!219738 e!142912))

(declare-fun b!219739 () Bool)

(declare-fun Unit!6554 () Unit!6552)

(assert (=> b!219739 (= e!142919 Unit!6554)))

(declare-fun lt!112020 () Unit!6552)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!197 (array!10771 array!10769 (_ BitVec 32) (_ BitVec 32) V!7331 V!7331 (_ BitVec 64) Int) Unit!6552)

(assert (=> b!219739 (= lt!112020 (lemmaInListMapThenSeekEntryOrOpenFindsIt!197 (_keys!6201 thiss!1504) (_values!4130 thiss!1504) (mask!9941 thiss!1504) (extraKeys!3884 thiss!1504) (zeroValue!3988 thiss!1504) (minValue!3988 thiss!1504) key!932 (defaultEntry!4147 thiss!1504)))))

(assert (=> b!219739 false))

(declare-fun e!142917 () Bool)

(declare-fun array_inv!3379 (array!10771) Bool)

(declare-fun array_inv!3380 (array!10769) Bool)

(assert (=> b!219740 (= e!142916 (and tp!20844 tp_is_empty!5763 (array_inv!3379 (_keys!6201 thiss!1504)) (array_inv!3380 (_values!4130 thiss!1504)) e!142917))))

(declare-fun b!219741 () Bool)

(declare-fun e!142914 () Bool)

(assert (=> b!219741 (= e!142914 tp_is_empty!5763)))

(declare-fun b!219742 () Bool)

(declare-fun res!107704 () Bool)

(assert (=> b!219742 (=> (not res!107704) (not e!142910))))

(assert (=> b!219742 (= res!107704 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun bm!20534 () Bool)

(assert (=> bm!20534 (= call!20538 (arrayContainsKey!0 (_keys!6201 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun call!20537 () Bool)

(declare-fun bm!20535 () Bool)

(assert (=> bm!20535 (= call!20537 (inRange!0 (ite c!36587 (index!5374 lt!112021) (index!5377 lt!112021)) (mask!9941 thiss!1504)))))

(declare-fun b!219743 () Bool)

(assert (=> b!219743 (= e!142908 ((_ is Undefined!801) lt!112021))))

(declare-fun b!219744 () Bool)

(assert (=> b!219744 (= e!142910 e!142909)))

(declare-fun res!107705 () Bool)

(assert (=> b!219744 (=> (not res!107705) (not e!142909))))

(assert (=> b!219744 (= res!107705 (or (= lt!112021 (MissingZero!801 index!297)) (= lt!112021 (MissingVacant!801 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!10771 (_ BitVec 32)) SeekEntryResult!801)

(assert (=> b!219744 (= lt!112021 (seekEntryOrOpen!0 key!932 (_keys!6201 thiss!1504) (mask!9941 thiss!1504)))))

(declare-fun b!219745 () Bool)

(assert (=> b!219745 (= e!142917 (and e!142914 mapRes!9814))))

(declare-fun condMapEmpty!9814 () Bool)

(declare-fun mapDefault!9814 () ValueCell!2538)

(assert (=> b!219745 (= condMapEmpty!9814 (= (arr!5104 (_values!4130 thiss!1504)) ((as const (Array (_ BitVec 32) ValueCell!2538)) mapDefault!9814)))))

(declare-fun b!219746 () Bool)

(assert (=> b!219746 (= e!142908 e!142911)))

(declare-fun res!107710 () Bool)

(assert (=> b!219746 (= res!107710 call!20537)))

(assert (=> b!219746 (=> (not res!107710) (not e!142911))))

(declare-fun b!219747 () Bool)

(declare-fun res!107708 () Bool)

(assert (=> b!219747 (= res!107708 (= (select (arr!5105 (_keys!6201 thiss!1504)) (index!5377 lt!112021)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!219747 (=> (not res!107708) (not e!142911))))

(declare-fun b!219748 () Bool)

(declare-fun res!107703 () Bool)

(assert (=> b!219748 (=> (not res!107703) (not e!142918))))

(assert (=> b!219748 (= res!107703 (and (= (size!5437 (_values!4130 thiss!1504)) (bvadd #b00000000000000000000000000000001 (mask!9941 thiss!1504))) (= (size!5438 (_keys!6201 thiss!1504)) (size!5437 (_values!4130 thiss!1504))) (bvsge (mask!9941 thiss!1504) #b00000000000000000000000000000000) (bvsge (extraKeys!3884 thiss!1504) #b00000000000000000000000000000000) (bvsle (extraKeys!3884 thiss!1504) #b00000000000000000000000000000011)))))

(declare-fun b!219749 () Bool)

(declare-fun res!107702 () Bool)

(assert (=> b!219749 (=> (not res!107702) (not e!142913))))

(assert (=> b!219749 (= res!107702 call!20537)))

(assert (=> b!219749 (= e!142912 e!142913)))

(declare-fun b!219750 () Bool)

(assert (=> b!219750 (= e!142918 false)))

(declare-fun lt!112022 () Bool)

(declare-datatypes ((List!3247 0))(
  ( (Nil!3244) (Cons!3243 (h!3891 (_ BitVec 64)) (t!8206 List!3247)) )
))
(declare-fun arrayNoDuplicates!0 (array!10771 (_ BitVec 32) List!3247) Bool)

(assert (=> b!219750 (= lt!112022 (arrayNoDuplicates!0 (_keys!6201 thiss!1504) #b00000000000000000000000000000000 Nil!3244))))

(declare-fun mapIsEmpty!9814 () Bool)

(assert (=> mapIsEmpty!9814 mapRes!9814))

(declare-fun b!219751 () Bool)

(declare-fun res!107711 () Bool)

(assert (=> b!219751 (=> (not res!107711) (not e!142918))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!219751 (= res!107711 (validMask!0 (mask!9941 thiss!1504)))))

(assert (= (and start!21834 res!107709) b!219742))

(assert (= (and b!219742 res!107704) b!219744))

(assert (= (and b!219744 res!107705) b!219733))

(assert (= (and b!219733 c!36588) b!219739))

(assert (= (and b!219733 (not c!36588)) b!219738))

(assert (= (and b!219738 c!36587) b!219749))

(assert (= (and b!219738 (not c!36587)) b!219731))

(assert (= (and b!219749 res!107702) b!219736))

(assert (= (and b!219736 res!107706) b!219735))

(assert (= (and b!219731 c!36586) b!219746))

(assert (= (and b!219731 (not c!36586)) b!219743))

(assert (= (and b!219746 res!107710) b!219747))

(assert (= (and b!219747 res!107708) b!219732))

(assert (= (or b!219749 b!219746) bm!20535))

(assert (= (or b!219735 b!219732) bm!20534))

(assert (= (and b!219733 res!107707) b!219737))

(assert (= (and b!219737 res!107712) b!219751))

(assert (= (and b!219751 res!107711) b!219748))

(assert (= (and b!219748 res!107703) b!219734))

(assert (= (and b!219734 res!107713) b!219750))

(assert (= (and b!219745 condMapEmpty!9814) mapIsEmpty!9814))

(assert (= (and b!219745 (not condMapEmpty!9814)) mapNonEmpty!9814))

(assert (= (and mapNonEmpty!9814 ((_ is ValueCellFull!2538) mapValue!9814)) b!219730))

(assert (= (and b!219745 ((_ is ValueCellFull!2538) mapDefault!9814)) b!219741))

(assert (= b!219740 b!219745))

(assert (= start!21834 b!219740))

(declare-fun m!245199 () Bool)

(assert (=> b!219738 m!245199))

(declare-fun m!245201 () Bool)

(assert (=> b!219737 m!245201))

(declare-fun m!245203 () Bool)

(assert (=> start!21834 m!245203))

(declare-fun m!245205 () Bool)

(assert (=> b!219733 m!245205))

(declare-fun m!245207 () Bool)

(assert (=> b!219733 m!245207))

(assert (=> b!219733 m!245207))

(declare-fun m!245209 () Bool)

(assert (=> b!219733 m!245209))

(assert (=> bm!20534 m!245201))

(declare-fun m!245211 () Bool)

(assert (=> b!219736 m!245211))

(declare-fun m!245213 () Bool)

(assert (=> b!219744 m!245213))

(declare-fun m!245215 () Bool)

(assert (=> b!219750 m!245215))

(declare-fun m!245217 () Bool)

(assert (=> bm!20535 m!245217))

(declare-fun m!245219 () Bool)

(assert (=> b!219734 m!245219))

(declare-fun m!245221 () Bool)

(assert (=> b!219751 m!245221))

(declare-fun m!245223 () Bool)

(assert (=> b!219747 m!245223))

(declare-fun m!245225 () Bool)

(assert (=> mapNonEmpty!9814 m!245225))

(declare-fun m!245227 () Bool)

(assert (=> b!219740 m!245227))

(declare-fun m!245229 () Bool)

(assert (=> b!219740 m!245229))

(declare-fun m!245231 () Bool)

(assert (=> b!219739 m!245231))

(check-sat (not b!219739) (not b!219734) b_and!12799 tp_is_empty!5763 (not b!219744) (not b_next!5901) (not bm!20535) (not start!21834) (not b!219751) (not bm!20534) (not mapNonEmpty!9814) (not b!219750) (not b!219733) (not b!219740) (not b!219737) (not b!219738))
(check-sat b_and!12799 (not b_next!5901))
