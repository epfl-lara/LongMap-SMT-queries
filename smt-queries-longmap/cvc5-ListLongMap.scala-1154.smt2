; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24272 () Bool)

(assert start!24272)

(declare-fun b!253935 () Bool)

(declare-fun b_free!6673 () Bool)

(declare-fun b_next!6673 () Bool)

(assert (=> b!253935 (= b_free!6673 (not b_next!6673))))

(declare-fun tp!23306 () Bool)

(declare-fun b_and!13715 () Bool)

(assert (=> b!253935 (= tp!23306 b_and!13715)))

(declare-fun b!253928 () Bool)

(declare-fun res!124306 () Bool)

(declare-fun e!164616 () Bool)

(assert (=> b!253928 (=> res!124306 e!164616)))

(declare-datatypes ((V!8361 0))(
  ( (V!8362 (val!3312 Int)) )
))
(declare-datatypes ((ValueCell!2924 0))(
  ( (ValueCellFull!2924 (v!5386 V!8361)) (EmptyCell!2924) )
))
(declare-datatypes ((array!12401 0))(
  ( (array!12402 (arr!5876 (Array (_ BitVec 32) ValueCell!2924)) (size!6223 (_ BitVec 32))) )
))
(declare-datatypes ((array!12403 0))(
  ( (array!12404 (arr!5877 (Array (_ BitVec 32) (_ BitVec 64))) (size!6224 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3748 0))(
  ( (LongMapFixedSize!3749 (defaultEntry!4687 Int) (mask!10929 (_ BitVec 32)) (extraKeys!4424 (_ BitVec 32)) (zeroValue!4528 V!8361) (minValue!4528 V!8361) (_size!1923 (_ BitVec 32)) (_keys!6841 array!12403) (_values!4670 array!12401) (_vacant!1923 (_ BitVec 32))) )
))
(declare-fun thiss!1504 () LongMapFixedSize!3748)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!12403 (_ BitVec 32)) Bool)

(assert (=> b!253928 (= res!124306 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!6841 thiss!1504) (mask!10929 thiss!1504))))))

(declare-fun index!297 () (_ BitVec 32))

(declare-fun b!253929 () Bool)

(declare-fun lt!127267 () Bool)

(assert (=> b!253929 (= e!164616 (or (and (not (= (select (arr!5877 (_keys!6841 thiss!1504)) index!297) #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!5877 (_keys!6841 thiss!1504)) index!297) #b0000000000000000000000000000000000000000000000000000000000000000))) (not lt!127267)))))

(declare-fun b!253930 () Bool)

(declare-fun e!164605 () Bool)

(declare-fun e!164612 () Bool)

(assert (=> b!253930 (= e!164605 e!164612)))

(declare-fun res!124304 () Bool)

(declare-fun call!23964 () Bool)

(assert (=> b!253930 (= res!124304 call!23964)))

(assert (=> b!253930 (=> (not res!124304) (not e!164612))))

(declare-fun b!253931 () Bool)

(declare-datatypes ((Unit!7855 0))(
  ( (Unit!7856) )
))
(declare-fun e!164615 () Unit!7855)

(declare-fun Unit!7857 () Unit!7855)

(assert (=> b!253931 (= e!164615 Unit!7857)))

(declare-fun lt!127265 () Unit!7855)

(declare-fun key!932 () (_ BitVec 64))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!411 (array!12403 array!12401 (_ BitVec 32) (_ BitVec 32) V!8361 V!8361 (_ BitVec 64) Int) Unit!7855)

(assert (=> b!253931 (= lt!127265 (lemmaInListMapThenSeekEntryOrOpenFindsIt!411 (_keys!6841 thiss!1504) (_values!4670 thiss!1504) (mask!10929 thiss!1504) (extraKeys!4424 thiss!1504) (zeroValue!4528 thiss!1504) (minValue!4528 thiss!1504) key!932 (defaultEntry!4687 thiss!1504)))))

(assert (=> b!253931 false))

(declare-fun mapNonEmpty!11118 () Bool)

(declare-fun mapRes!11118 () Bool)

(declare-fun tp!23307 () Bool)

(declare-fun e!164606 () Bool)

(assert (=> mapNonEmpty!11118 (= mapRes!11118 (and tp!23307 e!164606))))

(declare-fun mapKey!11118 () (_ BitVec 32))

(declare-fun mapRest!11118 () (Array (_ BitVec 32) ValueCell!2924))

(declare-fun mapValue!11118 () ValueCell!2924)

(assert (=> mapNonEmpty!11118 (= (arr!5876 (_values!4670 thiss!1504)) (store mapRest!11118 mapKey!11118 mapValue!11118))))

(declare-fun b!253932 () Bool)

(declare-fun e!164603 () Bool)

(declare-fun tp_is_empty!6535 () Bool)

(assert (=> b!253932 (= e!164603 tp_is_empty!6535)))

(declare-fun b!253933 () Bool)

(declare-fun c!42830 () Bool)

(declare-datatypes ((SeekEntryResult!1143 0))(
  ( (MissingZero!1143 (index!6742 (_ BitVec 32))) (Found!1143 (index!6743 (_ BitVec 32))) (Intermediate!1143 (undefined!1955 Bool) (index!6744 (_ BitVec 32)) (x!24843 (_ BitVec 32))) (Undefined!1143) (MissingVacant!1143 (index!6745 (_ BitVec 32))) )
))
(declare-fun lt!127261 () SeekEntryResult!1143)

(assert (=> b!253933 (= c!42830 (is-MissingVacant!1143 lt!127261))))

(declare-fun e!164607 () Bool)

(assert (=> b!253933 (= e!164607 e!164605)))

(declare-fun b!253934 () Bool)

(declare-fun call!23965 () Bool)

(assert (=> b!253934 (= e!164612 (not call!23965))))

(declare-fun e!164617 () Bool)

(declare-fun e!164614 () Bool)

(declare-fun array_inv!3885 (array!12403) Bool)

(declare-fun array_inv!3886 (array!12401) Bool)

(assert (=> b!253935 (= e!164617 (and tp!23306 tp_is_empty!6535 (array_inv!3885 (_keys!6841 thiss!1504)) (array_inv!3886 (_values!4670 thiss!1504)) e!164614))))

(declare-fun b!253936 () Bool)

(declare-fun e!164611 () Bool)

(declare-fun e!164613 () Bool)

(assert (=> b!253936 (= e!164611 e!164613)))

(declare-fun res!124308 () Bool)

(assert (=> b!253936 (=> (not res!124308) (not e!164613))))

(assert (=> b!253936 (= res!124308 (or (= lt!127261 (MissingZero!1143 index!297)) (= lt!127261 (MissingVacant!1143 index!297))))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!12403 (_ BitVec 32)) SeekEntryResult!1143)

(assert (=> b!253936 (= lt!127261 (seekEntryOrOpen!0 key!932 (_keys!6841 thiss!1504) (mask!10929 thiss!1504)))))

(declare-fun c!42828 () Bool)

(declare-fun bm!23961 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!23961 (= call!23964 (inRange!0 (ite c!42828 (index!6742 lt!127261) (index!6745 lt!127261)) (mask!10929 thiss!1504)))))

(declare-fun b!253938 () Bool)

(declare-fun res!124315 () Bool)

(assert (=> b!253938 (=> res!124315 e!164616)))

(declare-datatypes ((List!3756 0))(
  ( (Nil!3753) (Cons!3752 (h!4414 (_ BitVec 64)) (t!8803 List!3756)) )
))
(declare-fun arrayNoDuplicates!0 (array!12403 (_ BitVec 32) List!3756) Bool)

(assert (=> b!253938 (= res!124315 (not (arrayNoDuplicates!0 (_keys!6841 thiss!1504) #b00000000000000000000000000000000 Nil!3753)))))

(declare-fun b!253939 () Bool)

(declare-fun res!124313 () Bool)

(assert (=> b!253939 (=> res!124313 e!164616)))

(assert (=> b!253939 (= res!124313 (or (bvslt index!297 #b00000000000000000000000000000000) (bvsge index!297 (size!6224 (_keys!6841 thiss!1504)))))))

(declare-fun b!253940 () Bool)

(declare-fun res!124310 () Bool)

(assert (=> b!253940 (= res!124310 (= (select (arr!5877 (_keys!6841 thiss!1504)) (index!6745 lt!127261)) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!253940 (=> (not res!124310) (not e!164612))))

(declare-fun mapIsEmpty!11118 () Bool)

(assert (=> mapIsEmpty!11118 mapRes!11118))

(declare-fun b!253941 () Bool)

(declare-fun e!164610 () Unit!7855)

(declare-fun Unit!7858 () Unit!7855)

(assert (=> b!253941 (= e!164610 Unit!7858)))

(declare-fun lt!127259 () Unit!7855)

(declare-fun lemmaArrayContainsKeyThenInListMap!217 (array!12403 array!12401 (_ BitVec 32) (_ BitVec 32) V!8361 V!8361 (_ BitVec 64) (_ BitVec 32) Int) Unit!7855)

(assert (=> b!253941 (= lt!127259 (lemmaArrayContainsKeyThenInListMap!217 (_keys!6841 thiss!1504) (_values!4670 thiss!1504) (mask!10929 thiss!1504) (extraKeys!4424 thiss!1504) (zeroValue!4528 thiss!1504) (minValue!4528 thiss!1504) key!932 #b00000000000000000000000000000000 (defaultEntry!4687 thiss!1504)))))

(assert (=> b!253941 false))

(declare-fun b!253942 () Bool)

(assert (=> b!253942 (= e!164605 (is-Undefined!1143 lt!127261))))

(declare-fun b!253943 () Bool)

(declare-fun res!124316 () Bool)

(declare-fun e!164608 () Bool)

(assert (=> b!253943 (=> (not res!124316) (not e!164608))))

(assert (=> b!253943 (= res!124316 call!23964)))

(assert (=> b!253943 (= e!164607 e!164608)))

(declare-fun b!253944 () Bool)

(assert (=> b!253944 (= e!164614 (and e!164603 mapRes!11118))))

(declare-fun condMapEmpty!11118 () Bool)

(declare-fun mapDefault!11118 () ValueCell!2924)

