; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23288 () Bool)

(assert start!23288)

(declare-fun b!244666 () Bool)

(declare-fun b_free!6541 () Bool)

(declare-fun b_next!6541 () Bool)

(assert (=> b!244666 (= b_free!6541 (not b_next!6541))))

(declare-fun tp!22852 () Bool)

(declare-fun b_and!13527 () Bool)

(assert (=> b!244666 (= tp!22852 b_and!13527)))

(declare-fun bm!22823 () Bool)

(declare-fun call!22826 () Bool)

(declare-datatypes ((V!8185 0))(
  ( (V!8186 (val!3246 Int)) )
))
(declare-datatypes ((ValueCell!2858 0))(
  ( (ValueCellFull!2858 (v!5297 V!8185)) (EmptyCell!2858) )
))
(declare-datatypes ((array!12101 0))(
  ( (array!12102 (arr!5744 (Array (_ BitVec 32) ValueCell!2858)) (size!6086 (_ BitVec 32))) )
))
(declare-datatypes ((array!12103 0))(
  ( (array!12104 (arr!5745 (Array (_ BitVec 32) (_ BitVec 64))) (size!6087 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3616 0))(
  ( (LongMapFixedSize!3617 (defaultEntry!4529 Int) (mask!10632 (_ BitVec 32)) (extraKeys!4266 (_ BitVec 32)) (zeroValue!4370 V!8185) (minValue!4370 V!8185) (_size!1857 (_ BitVec 32)) (_keys!6642 array!12103) (_values!4512 array!12101) (_vacant!1857 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3616)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!12103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> bm!22823 (= call!22826 (arrayContainsKey!0 (_keys!6642 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun res!120009 () Bool)

(declare-fun e!158743 () Bool)

(assert (=> start!23288 (=> (not res!120009) (not e!158743))))

(declare-fun valid!1417 (LongMapFixedSize!3616) Bool)

(assert (=> start!23288 (= res!120009 (valid!1417 thiss!1504))))

(assert (=> start!23288 e!158743))

(declare-fun e!158745 () Bool)

(assert (=> start!23288 e!158745))

(assert (=> start!23288 true))

(declare-fun b!244652 () Bool)

(declare-fun res!120008 () Bool)

(declare-fun e!158741 () Bool)

(assert (=> b!244652 (=> (not res!120008) (not e!158741))))

(declare-datatypes ((List!3660 0))(
  ( (Nil!3657) (Cons!3656 (h!4313 (_ BitVec 64)) (t!8671 List!3660)) )
))
(declare-fun noDuplicate!102 (List!3660) Bool)

(assert (=> b!244652 (= res!120008 (noDuplicate!102 Nil!3657))))

(declare-fun b!244653 () Bool)

(declare-fun res!120012 () Bool)

(declare-fun e!158739 () Bool)

(assert (=> b!244653 (=> (not res!120012) (not e!158739))))

(declare-datatypes ((SeekEntryResult!1081 0))(
  ( (MissingZero!1081 (index!6494 (_ BitVec 32))) (Found!1081 (index!6495 (_ BitVec 32))) (Intermediate!1081 (undefined!1893 Bool) (index!6496 (_ BitVec 32)) (x!24385 (_ BitVec 32))) (Undefined!1081) (MissingVacant!1081 (index!6497 (_ BitVec 32))) )
))
(declare-fun lt!122603 () SeekEntryResult!1081)

(assert (=> b!244653 (= res!120012 (= (select (arr!5745 (_keys!6642 thiss!1504)) (index!6494 lt!122603)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!244654 () Bool)

(declare-fun e!158750 () Bool)

(declare-fun contains!1766 (List!3660 (_ BitVec 64)) Bool)

(assert (=> b!244654 (= e!158750 (not (contains!1766 Nil!3657 key!932)))))

(declare-fun b!244655 () Bool)

(declare-fun e!158742 () Bool)

(assert (=> b!244655 (= e!158742 (contains!1766 Nil!3657 key!932))))

(declare-fun b!244656 () Bool)

(declare-fun e!158746 () Bool)

(declare-fun e!158747 () Bool)

(assert (=> b!244656 (= e!158746 e!158747)))

(declare-fun res!119998 () Bool)

(assert (=> b!244656 (=> (not res!119998) (not e!158747))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!244656 (= res!119998 (inRange!0 index!297 (mask!10632 thiss!1504)))))

(declare-datatypes ((Unit!7551 0))(
  ( (Unit!7552) )
))
(declare-fun lt!122601 () Unit!7551)

(declare-fun e!158749 () Unit!7551)

(assert (=> b!244656 (= lt!122601 e!158749)))

(declare-fun c!40837 () Bool)

(declare-datatypes ((tuple2!4778 0))(
  ( (tuple2!4779 (_1!2400 (_ BitVec 64)) (_2!2400 V!8185)) )
))
(declare-datatypes ((List!3661 0))(
  ( (Nil!3658) (Cons!3657 (h!4314 tuple2!4778) (t!8672 List!3661)) )
))
(declare-datatypes ((ListLongMap!3691 0))(
  ( (ListLongMap!3692 (toList!1861 List!3661)) )
))
(declare-fun contains!1767 (ListLongMap!3691 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1389 (array!12103 array!12101 (_ BitVec 32) (_ BitVec 32) V!8185 V!8185 (_ BitVec 32) Int) ListLongMap!3691)

(assert (=> b!244656 (= c!40837 (contains!1767 (getCurrentListMap!1389 (_keys!6642 thiss!1504) (_values!4512 thiss!1504) (mask!10632 thiss!1504) (extraKeys!4266 thiss!1504) (zeroValue!4370 thiss!1504) (minValue!4370 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4529 thiss!1504)) key!932))))

(declare-fun b!244657 () Bool)

(declare-fun e!158752 () Unit!7551)

(declare-fun Unit!7553 () Unit!7551)

(assert (=> b!244657 (= e!158752 Unit!7553)))

(declare-fun b!244658 () Bool)

(declare-fun res!120007 () Bool)

(assert (=> b!244658 (=> (not res!120007) (not e!158741))))

(declare-fun arrayNoDuplicates!0 (array!12103 (_ BitVec 32) List!3660) Bool)

(assert (=> b!244658 (= res!120007 (arrayNoDuplicates!0 (_keys!6642 thiss!1504) #b00000000000000000000000000000000 Nil!3657))))

(declare-fun b!244659 () Bool)

(declare-fun lt!122602 () Bool)

(assert (=> b!244659 (= e!158741 lt!122602)))

(declare-fun b!244660 () Bool)

(declare-fun e!158740 () Bool)

(declare-fun tp_is_empty!6403 () Bool)

(assert (=> b!244660 (= e!158740 tp_is_empty!6403)))

(declare-fun mapNonEmpty!10861 () Bool)

(declare-fun mapRes!10861 () Bool)

(declare-fun tp!22851 () Bool)

(declare-fun e!158748 () Bool)

(assert (=> mapNonEmpty!10861 (= mapRes!10861 (and tp!22851 e!158748))))

(declare-fun mapRest!10861 () (Array (_ BitVec 32) ValueCell!2858))

(declare-fun mapValue!10861 () ValueCell!2858)

(declare-fun mapKey!10861 () (_ BitVec 32))

(assert (=> mapNonEmpty!10861 (= (arr!5744 (_values!4512 thiss!1504)) (store mapRest!10861 mapKey!10861 mapValue!10861))))

(declare-fun b!244661 () Bool)

(assert (=> b!244661 (= e!158747 e!158741)))

(declare-fun res!120015 () Bool)

(assert (=> b!244661 (=> (not res!120015) (not e!158741))))

(assert (=> b!244661 (= res!120015 (and (bvslt (size!6087 (_keys!6642 thiss!1504)) #b01111111111111111111111111111111) (bvslt #b00000000000000000000000000000000 (size!6087 (_keys!6642 thiss!1504)))))))

(declare-fun lt!122605 () Unit!7551)

(assert (=> b!244661 (= lt!122605 e!158752)))

(declare-fun c!40838 () Bool)

(assert (=> b!244661 (= c!40838 lt!122602)))

(assert (=> b!244661 (= lt!122602 (arrayContainsKey!0 (_keys!6642 thiss!1504) key!932 #b00000000000000000000000000000000))))

(declare-fun b!244662 () Bool)

(declare-fun res!120005 () Bool)

(assert (=> b!244662 (=> (not res!120005) (not e!158741))))

(assert (=> b!244662 (= res!120005 (not (contains!1766 Nil!3657 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244663 () Bool)

(declare-fun res!120001 () Bool)

(assert (=> b!244663 (=> (not res!120001) (not e!158741))))

(assert (=> b!244663 (= res!120001 (not (contains!1766 Nil!3657 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!244664 () Bool)

(declare-fun res!120002 () Bool)

(assert (=> b!244664 (=> (not res!120002) (not e!158743))))

(assert (=> b!244664 (= res!120002 (and (not (= key!932 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!932 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!244665 () Bool)

(assert (=> b!244665 (= e!158748 tp_is_empty!6403)))

(declare-fun c!40836 () Bool)

(declare-fun call!22827 () Bool)

(declare-fun bm!22824 () Bool)

(assert (=> bm!22824 (= call!22827 (inRange!0 (ite c!40836 (index!6494 lt!122603) (index!6497 lt!122603)) (mask!10632 thiss!1504)))))

(declare-fun e!158755 () Bool)

(declare-fun array_inv!3797 (array!12103) Bool)

(declare-fun array_inv!3798 (array!12101) Bool)

(assert (=> b!244666 (= e!158745 (and tp!22852 tp_is_empty!6403 (array_inv!3797 (_keys!6642 thiss!1504)) (array_inv!3798 (_values!4512 thiss!1504)) e!158755))))

(declare-fun b!244667 () Bool)

(declare-fun res!119999 () Bool)

(assert (=> b!244667 (=> (not res!119999) (not e!158739))))

(assert (=> b!244667 (= res!119999 call!22827)))

(declare-fun e!158751 () Bool)

(assert (=> b!244667 (= e!158751 e!158739)))

(declare-fun b!244668 () Bool)

(declare-fun res!120010 () Bool)

(assert (=> b!244668 (=> (not res!120010) (not e!158741))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!244668 (= res!120010 (validKeyInArray!0 key!932))))

(declare-fun b!244669 () Bool)

(declare-fun e!158754 () Bool)

(assert (=> b!244669 (= e!158754 (is-Undefined!1081 lt!122603))))

(declare-fun b!244670 () Bool)

(assert (=> b!244670 (= e!158739 (not call!22826))))

(declare-fun b!244671 () Bool)

(declare-fun e!158753 () Bool)

(assert (=> b!244671 (= e!158753 (not call!22826))))

(declare-fun b!244672 () Bool)

(declare-fun Unit!7554 () Unit!7551)

(assert (=> b!244672 (= e!158749 Unit!7554)))

(declare-fun lt!122604 () Unit!7551)

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!367 (array!12103 array!12101 (_ BitVec 32) (_ BitVec 32) V!8185 V!8185 (_ BitVec 64) Int) Unit!7551)

(assert (=> b!244672 (= lt!122604 (lemmaInListMapThenSeekEntryOrOpenFindsIt!367 (_keys!6642 thiss!1504) (_values!4512 thiss!1504) (mask!10632 thiss!1504) (extraKeys!4266 thiss!1504) (zeroValue!4370 thiss!1504) (minValue!4370 thiss!1504) key!932 (defaultEntry!4529 thiss!1504)))))

(assert (=> b!244672 false))

(declare-fun b!244673 () Bool)

(declare-fun c!40839 () Bool)

(assert (=> b!244673 (= c!40839 (is-MissingVacant!1081 lt!122603))))

(assert (=> b!244673 (= e!158751 e!158754)))

(declare-fun b!244674 () Bool)

(declare-fun Unit!7555 () Unit!7551)

(assert (=> b!244674 (= e!158752 Unit!7555)))

(declare-fun lt!122600 () Unit!7551)

(declare-fun lemmaArrayContainsKeyThenInListMap!171 (array!12103 array!12101 (_ BitVec 32) (_ BitVec 32) V!8185 V!8185 (_ BitVec 64) (_ BitVec 32) Int) Unit!7551)

(assert (=> b!244674 (= lt!122600 (lemmaArrayContainsKeyThenInListMap!171 (_keys!6642 thiss!1504) (_values!4512 thiss!1504) (mask!10632 thiss!1504) (extraKeys!4266 thiss!1504) (zeroValue!4370 thiss!1504) (minValue!4370 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4529 thiss!1504)))))

(assert (=> b!244674 false))

(declare-fun b!244675 () Bool)

(assert (=> b!244675 (= e!158754 e!158753)))

(declare-fun res!119997 () Bool)

(assert (=> b!244675 (= res!119997 call!22827)))

(assert (=> b!244675 (=> (not res!119997) (not e!158753))))

(declare-fun b!244676 () Bool)

(assert (=> b!244676 (= e!158755 (and e!158740 mapRes!10861))))

(declare-fun condMapEmpty!10861 () Bool)

(declare-fun mapDefault!10861 () ValueCell!2858)

