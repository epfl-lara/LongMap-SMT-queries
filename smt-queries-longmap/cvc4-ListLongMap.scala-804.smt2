; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19322 () Bool)

(assert start!19322)

(declare-fun b!190124 () Bool)

(declare-fun b_free!4667 () Bool)

(declare-fun b_next!4667 () Bool)

(assert (=> b!190124 (= b_free!4667 (not b_next!4667))))

(declare-fun tp!16839 () Bool)

(declare-fun b_and!11313 () Bool)

(assert (=> b!190124 (= tp!16839 b_and!11313)))

(declare-fun b!190119 () Bool)

(declare-fun e!125146 () Bool)

(declare-fun tp_is_empty!4439 () Bool)

(assert (=> b!190119 (= e!125146 tp_is_empty!4439)))

(declare-fun b!190120 () Bool)

(declare-fun key!828 () (_ BitVec 64))

(declare-fun e!125143 () Bool)

(declare-datatypes ((V!5565 0))(
  ( (V!5566 (val!2264 Int)) )
))
(declare-datatypes ((ValueCell!1876 0))(
  ( (ValueCellFull!1876 (v!4191 V!5565)) (EmptyCell!1876) )
))
(declare-datatypes ((array!8111 0))(
  ( (array!8112 (arr!3823 (Array (_ BitVec 32) (_ BitVec 64))) (size!4143 (_ BitVec 32))) )
))
(declare-datatypes ((array!8113 0))(
  ( (array!8114 (arr!3824 (Array (_ BitVec 32) ValueCell!1876)) (size!4144 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2660 0))(
  ( (LongMapFixedSize!2661 (defaultEntry!3882 Int) (mask!9080 (_ BitVec 32)) (extraKeys!3619 (_ BitVec 32)) (zeroValue!3723 V!5565) (minValue!3723 V!5565) (_size!1379 (_ BitVec 32)) (_keys!5851 array!8111) (_values!3865 array!8113) (_vacant!1379 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2660)

(declare-datatypes ((SeekEntryResult!673 0))(
  ( (MissingZero!673 (index!4862 (_ BitVec 32))) (Found!673 (index!4863 (_ BitVec 32))) (Intermediate!673 (undefined!1485 Bool) (index!4864 (_ BitVec 32)) (x!20475 (_ BitVec 32))) (Undefined!673) (MissingVacant!673 (index!4865 (_ BitVec 32))) )
))
(declare-fun lt!94202 () SeekEntryResult!673)

(assert (=> b!190120 (= e!125143 (= (select (arr!3823 (_keys!5851 thiss!1248)) (index!4863 lt!94202)) key!828))))

(declare-fun b!190121 () Bool)

(declare-fun e!125139 () Bool)

(declare-fun e!125144 () Bool)

(assert (=> b!190121 (= e!125139 e!125144)))

(declare-fun res!89884 () Bool)

(assert (=> b!190121 (=> (not res!89884) (not e!125144))))

(assert (=> b!190121 (= res!89884 (and (not (is-Undefined!673 lt!94202)) (not (is-MissingVacant!673 lt!94202)) (not (is-MissingZero!673 lt!94202)) (is-Found!673 lt!94202)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8111 (_ BitVec 32)) SeekEntryResult!673)

(assert (=> b!190121 (= lt!94202 (seekEntryOrOpen!0 key!828 (_keys!5851 thiss!1248) (mask!9080 thiss!1248)))))

(declare-fun b!190122 () Bool)

(declare-fun e!125145 () Bool)

(assert (=> b!190122 (= e!125145 tp_is_empty!4439)))

(declare-fun mapNonEmpty!7660 () Bool)

(declare-fun mapRes!7660 () Bool)

(declare-fun tp!16840 () Bool)

(assert (=> mapNonEmpty!7660 (= mapRes!7660 (and tp!16840 e!125146))))

(declare-fun mapKey!7660 () (_ BitVec 32))

(declare-fun mapRest!7660 () (Array (_ BitVec 32) ValueCell!1876))

(declare-fun mapValue!7660 () ValueCell!1876)

(assert (=> mapNonEmpty!7660 (= (arr!3824 (_values!3865 thiss!1248)) (store mapRest!7660 mapKey!7660 mapValue!7660))))

(declare-fun e!125147 () Bool)

(declare-fun e!125140 () Bool)

(declare-fun array_inv!2479 (array!8111) Bool)

(declare-fun array_inv!2480 (array!8113) Bool)

(assert (=> b!190124 (= e!125147 (and tp!16839 tp_is_empty!4439 (array_inv!2479 (_keys!5851 thiss!1248)) (array_inv!2480 (_values!3865 thiss!1248)) e!125140))))

(declare-fun b!190125 () Bool)

(declare-fun e!125142 () Bool)

(assert (=> b!190125 (= e!125144 (not e!125142))))

(declare-fun res!89886 () Bool)

(assert (=> b!190125 (=> res!89886 e!125142)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!190125 (= res!89886 (not (validMask!0 (mask!9080 thiss!1248))))))

(declare-datatypes ((tuple2!3520 0))(
  ( (tuple2!3521 (_1!1771 (_ BitVec 64)) (_2!1771 V!5565)) )
))
(declare-datatypes ((List!2416 0))(
  ( (Nil!2413) (Cons!2412 (h!3049 tuple2!3520) (t!7324 List!2416)) )
))
(declare-datatypes ((ListLongMap!2437 0))(
  ( (ListLongMap!2438 (toList!1234 List!2416)) )
))
(declare-fun lt!94205 () ListLongMap!2437)

(declare-fun v!309 () V!5565)

(declare-fun +!302 (ListLongMap!2437 tuple2!3520) ListLongMap!2437)

(declare-fun getCurrentListMap!882 (array!8111 array!8113 (_ BitVec 32) (_ BitVec 32) V!5565 V!5565 (_ BitVec 32) Int) ListLongMap!2437)

(assert (=> b!190125 (= (+!302 lt!94205 (tuple2!3521 key!828 v!309)) (getCurrentListMap!882 (_keys!5851 thiss!1248) (array!8114 (store (arr!3824 (_values!3865 thiss!1248)) (index!4863 lt!94202) (ValueCellFull!1876 v!309)) (size!4144 (_values!3865 thiss!1248))) (mask!9080 thiss!1248) (extraKeys!3619 thiss!1248) (zeroValue!3723 thiss!1248) (minValue!3723 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3882 thiss!1248)))))

(declare-datatypes ((Unit!5746 0))(
  ( (Unit!5747) )
))
(declare-fun lt!94207 () Unit!5746)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!103 (array!8111 array!8113 (_ BitVec 32) (_ BitVec 32) V!5565 V!5565 (_ BitVec 32) (_ BitVec 64) V!5565 Int) Unit!5746)

(assert (=> b!190125 (= lt!94207 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!103 (_keys!5851 thiss!1248) (_values!3865 thiss!1248) (mask!9080 thiss!1248) (extraKeys!3619 thiss!1248) (zeroValue!3723 thiss!1248) (minValue!3723 thiss!1248) (index!4863 lt!94202) key!828 v!309 (defaultEntry!3882 thiss!1248)))))

(declare-fun lt!94203 () Unit!5746)

(declare-fun e!125141 () Unit!5746)

(assert (=> b!190125 (= lt!94203 e!125141)))

(declare-fun c!34157 () Bool)

(declare-fun contains!1343 (ListLongMap!2437 (_ BitVec 64)) Bool)

(assert (=> b!190125 (= c!34157 (contains!1343 lt!94205 key!828))))

(assert (=> b!190125 (= lt!94205 (getCurrentListMap!882 (_keys!5851 thiss!1248) (_values!3865 thiss!1248) (mask!9080 thiss!1248) (extraKeys!3619 thiss!1248) (zeroValue!3723 thiss!1248) (minValue!3723 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3882 thiss!1248)))))

(declare-fun mapIsEmpty!7660 () Bool)

(assert (=> mapIsEmpty!7660 mapRes!7660))

(declare-fun b!190126 () Bool)

(declare-fun Unit!5748 () Unit!5746)

(assert (=> b!190126 (= e!125141 Unit!5748)))

(declare-fun lt!94206 () Unit!5746)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!175 (array!8111 array!8113 (_ BitVec 32) (_ BitVec 32) V!5565 V!5565 (_ BitVec 64) Int) Unit!5746)

(assert (=> b!190126 (= lt!94206 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!175 (_keys!5851 thiss!1248) (_values!3865 thiss!1248) (mask!9080 thiss!1248) (extraKeys!3619 thiss!1248) (zeroValue!3723 thiss!1248) (minValue!3723 thiss!1248) key!828 (defaultEntry!3882 thiss!1248)))))

(assert (=> b!190126 false))

(declare-fun b!190127 () Bool)

(assert (=> b!190127 (= e!125142 (= (size!4144 (_values!3865 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9080 thiss!1248))))))

(declare-fun b!190128 () Bool)

(assert (=> b!190128 (= e!125140 (and e!125145 mapRes!7660))))

(declare-fun condMapEmpty!7660 () Bool)

(declare-fun mapDefault!7660 () ValueCell!1876)

