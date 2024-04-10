; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24278 () Bool)

(assert start!24278)

(declare-fun b!254165 () Bool)

(declare-fun b_free!6679 () Bool)

(declare-fun b_next!6679 () Bool)

(assert (=> b!254165 (= b_free!6679 (not b_next!6679))))

(declare-fun tp!23324 () Bool)

(declare-fun b_and!13721 () Bool)

(assert (=> b!254165 (= tp!23324 b_and!13721)))

(declare-fun b!254156 () Bool)

(declare-fun e!164749 () Bool)

(assert (=> b!254156 (= e!164749 true)))

(declare-fun lt!127357 () Bool)

(declare-datatypes ((V!8369 0))(
  ( (V!8370 (val!3315 Int)) )
))
(declare-datatypes ((ValueCell!2927 0))(
  ( (ValueCellFull!2927 (v!5389 V!8369)) (EmptyCell!2927) )
))
(declare-datatypes ((array!12413 0))(
  ( (array!12414 (arr!5882 (Array (_ BitVec 32) ValueCell!2927)) (size!6229 (_ BitVec 32))) )
))
(declare-datatypes ((array!12415 0))(
  ( (array!12416 (arr!5883 (Array (_ BitVec 32) (_ BitVec 64))) (size!6230 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3754 0))(
  ( (LongMapFixedSize!3755 (defaultEntry!4690 Int) (mask!10934 (_ BitVec 32)) (extraKeys!4427 (_ BitVec 32)) (zeroValue!4531 V!8369) (minValue!4531 V!8369) (_size!1926 (_ BitVec 32)) (_keys!6844 array!12415) (_values!4673 array!12413) (_vacant!1926 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3754)

(declare-datatypes ((List!3761 0))(
  ( (Nil!3758) (Cons!3757 (h!4419 (_ BitVec 64)) (t!8808 List!3761)) )
))
(declare-fun arrayNoDuplicates!0 (array!12415 (_ BitVec 32) List!3761) Bool)

(assert (=> b!254156 (= lt!127357 (arrayNoDuplicates!0 (_keys!6844 thiss!1504) #b00000000000000000000000000000000 Nil!3758))))

(declare-fun b!254157 () Bool)

(declare-datatypes ((Unit!7869 0))(
  ( (Unit!7870) )
))
(declare-fun e!164743 () Unit!7869)

(declare-fun Unit!7871 () Unit!7869)

(assert (=> b!254157 (= e!164743 Unit!7871)))

(declare-fun lt!127364 () Unit!7869)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!414 (array!12415 array!12413 (_ BitVec 32) (_ BitVec 32) V!8369 V!8369 (_ BitVec 64) Int) Unit!7869)

(assert (=> b!254157 (= lt!127364 (lemmaInListMapThenSeekEntryOrOpenFindsIt!414 (_keys!6844 thiss!1504) (_values!4673 thiss!1504) (mask!10934 thiss!1504) (extraKeys!4427 thiss!1504) (zeroValue!4531 thiss!1504) (minValue!4531 thiss!1504) key!932 (defaultEntry!4690 thiss!1504)))))

(assert (=> b!254157 false))

(declare-fun b!254158 () Bool)

(declare-fun res!124430 () Bool)

(declare-datatypes ((SeekEntryResult!1146 0))(
  ( (MissingZero!1146 (index!6754 (_ BitVec 32))) (Found!1146 (index!6755 (_ BitVec 32))) (Intermediate!1146 (undefined!1958 Bool) (index!6756 (_ BitVec 32)) (x!24854 (_ BitVec 32))) (Undefined!1146) (MissingVacant!1146 (index!6757 (_ BitVec 32))) )
))
(declare-fun lt!127358 () SeekEntryResult!1146)

(assert (=> b!254158 (= res!124430 (= (select (arr!5883 (_keys!6844 thiss!1504)) (index!6757 lt!127358)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!164747 () Bool)

(assert (=> b!254158 (=> (not res!124430) (not e!164747))))

(declare-fun b!254159 () Bool)

(declare-fun e!164738 () Bool)

(declare-fun e!164748 () Bool)

(assert (=> b!254159 (= e!164738 e!164748)))

(declare-fun res!124426 () Bool)

(assert (=> b!254159 (=> (not res!124426) (not e!164748))))

(declare-fun index!297 () (_ BitVec 32))

(assert (=> b!254159 (= res!124426 (or (= lt!127358 (MissingZero!1146 index!297)) (= lt!127358 (MissingVacant!1146 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12415 (_ BitVec 32)) SeekEntryResult!1146)

(assert (=> b!254159 (= lt!127358 (seekEntryOrOpen!0 key!932 (_keys!6844 thiss!1504) (mask!10934 thiss!1504)))))

(declare-fun b!254160 () Bool)

(declare-fun e!164750 () Bool)

(declare-fun tp_is_empty!6541 () Bool)

(assert (=> b!254160 (= e!164750 tp_is_empty!6541)))

(declare-fun b!254161 () Bool)

(declare-fun e!164746 () Bool)

(assert (=> b!254161 (= e!164748 e!164746)))

(declare-fun res!124425 () Bool)

(assert (=> b!254161 (=> (not res!124425) (not e!164746))))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!254161 (= res!124425 (inRange!0 index!297 (mask!10934 thiss!1504)))))

(declare-fun lt!127365 () Unit!7869)

(assert (=> b!254161 (= lt!127365 e!164743)))

(declare-fun c!42863 () Bool)

(declare-datatypes ((tuple2!4880 0))(
  ( (tuple2!4881 (_1!2451 (_ BitVec 64)) (_2!2451 V!8369)) )
))
(declare-datatypes ((List!3762 0))(
  ( (Nil!3759) (Cons!3758 (h!4420 tuple2!4880) (t!8809 List!3762)) )
))
(declare-datatypes ((ListLongMap!3793 0))(
  ( (ListLongMap!3794 (toList!1912 List!3762)) )
))
(declare-fun contains!1842 (ListLongMap!3793 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1440 (array!12415 array!12413 (_ BitVec 32) (_ BitVec 32) V!8369 V!8369 (_ BitVec 32) Int) ListLongMap!3793)

(assert (=> b!254161 (= c!42863 (contains!1842 (getCurrentListMap!1440 (_keys!6844 thiss!1504) (_values!4673 thiss!1504) (mask!10934 thiss!1504) (extraKeys!4427 thiss!1504) (zeroValue!4531 thiss!1504) (minValue!4531 thiss!1504) #b00000000000000000000000000000000 (defaultEntry!4690 thiss!1504)) key!932))))

(declare-fun b!254162 () Bool)

(declare-fun e!164740 () Unit!7869)

(declare-fun Unit!7872 () Unit!7869)

(assert (=> b!254162 (= e!164740 Unit!7872)))

(declare-fun lt!127367 () Unit!7869)

(declare-fun lemmaArrayContainsKeyThenInListMap!220 (array!12415 array!12413 (_ BitVec 32) (_ BitVec 32) V!8369 V!8369 (_ BitVec 64) (_ BitVec 32) Int) Unit!7869)

(assert (=> b!254162 (= lt!127367 (lemmaArrayContainsKeyThenInListMap!220 (_keys!6844 thiss!1504) (_values!4673 thiss!1504) (mask!10934 thiss!1504) (extraKeys!4427 thiss!1504) (zeroValue!4531 thiss!1504) (minValue!4531 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4690 thiss!1504)))))

(assert (=> b!254162 false))

(declare-fun b!254163 () Bool)

(declare-fun res!124434 () Bool)

(declare-fun e!164741 () Bool)

(assert (=> b!254163 (=> (not res!124434) (not e!164741))))

(assert (=> b!254163 (= res!124434 (= (select (arr!5883 (_keys!6844 thiss!1504)) (index!6754 lt!127358)) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!254164 () Bool)

(declare-fun e!164751 () Bool)

(assert (=> b!254164 (= e!164751 (is-Undefined!1146 lt!127358))))

(declare-fun e!164744 () Bool)

(declare-fun e!164742 () Bool)

(declare-fun array_inv!3889 (array!12415) Bool)

(declare-fun array_inv!3890 (array!12413) Bool)

(assert (=> b!254165 (= e!164742 (and tp!23324 tp_is_empty!6541 (array_inv!3889 (_keys!6844 thiss!1504)) (array_inv!3890 (_values!4673 thiss!1504)) e!164744))))

(declare-fun bm!23979 () Bool)

(declare-fun c!42865 () Bool)

(declare-fun call!23983 () Bool)

(assert (=> bm!23979 (= call!23983 (inRange!0 (ite c!42865 (index!6754 lt!127358) (index!6757 lt!127358)) (mask!10934 thiss!1504)))))

(declare-fun b!254166 () Bool)

(declare-fun e!164745 () Bool)

(assert (=> b!254166 (= e!164745 tp_is_empty!6541)))

(declare-fun res!124427 () Bool)

(assert (=> start!24278 (=> (not res!124427) (not e!164738))))

(declare-fun valid!1468 (LongMapFixedSize!3754) Bool)

(assert (=> start!24278 (= res!124427 (valid!1468 thiss!1504))))

(assert (=> start!24278 e!164738))

(assert (=> start!24278 e!164742))

(assert (=> start!24278 true))

(declare-fun b!254167 () Bool)

(assert (=> b!254167 (= e!164751 e!164747)))

(declare-fun res!124431 () Bool)

(assert (=> b!254167 (= res!124431 call!23983)))

(assert (=> b!254167 (=> (not res!124431) (not e!164747))))

(declare-fun b!254168 () Bool)

(declare-fun res!124429 () Bool)

(assert (=> b!254168 (=> (not res!124429) (not e!164741))))

(assert (=> b!254168 (= res!124429 call!23983)))

(declare-fun e!164739 () Bool)

(assert (=> b!254168 (= e!164739 e!164741)))

(declare-fun b!254169 () Bool)

(declare-fun mapRes!11127 () Bool)

(assert (=> b!254169 (= e!164744 (and e!164750 mapRes!11127))))

(declare-fun condMapEmpty!11127 () Bool)

(declare-fun mapDefault!11127 () ValueCell!2927)

