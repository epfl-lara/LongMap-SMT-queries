; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19196 () Bool)

(assert start!19196)

(declare-fun b!188891 () Bool)

(declare-fun b_free!4637 () Bool)

(declare-fun b_next!4637 () Bool)

(assert (=> b!188891 (= b_free!4637 (not b_next!4637))))

(declare-fun tp!16738 () Bool)

(declare-fun b_and!11271 () Bool)

(assert (=> b!188891 (= tp!16738 b_and!11271)))

(declare-fun b!188888 () Bool)

(declare-fun res!89302 () Bool)

(declare-fun e!124320 () Bool)

(assert (=> b!188888 (=> (not res!89302) (not e!124320))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!188888 (= res!89302 (not (= key!828 (bvneg key!828))))))

(declare-fun b!188889 () Bool)

(declare-fun res!89301 () Bool)

(declare-fun e!124315 () Bool)

(assert (=> b!188889 (=> (not res!89301) (not e!124315))))

(declare-datatypes ((V!5525 0))(
  ( (V!5526 (val!2249 Int)) )
))
(declare-datatypes ((ValueCell!1861 0))(
  ( (ValueCellFull!1861 (v!4168 V!5525)) (EmptyCell!1861) )
))
(declare-datatypes ((array!8043 0))(
  ( (array!8044 (arr!3793 (Array (_ BitVec 32) (_ BitVec 64))) (size!4113 (_ BitVec 32))) )
))
(declare-datatypes ((array!8045 0))(
  ( (array!8046 (arr!3794 (Array (_ BitVec 32) ValueCell!1861)) (size!4114 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2630 0))(
  ( (LongMapFixedSize!2631 (defaultEntry!3853 Int) (mask!9028 (_ BitVec 32)) (extraKeys!3590 (_ BitVec 32)) (zeroValue!3694 V!5525) (minValue!3694 V!5525) (_size!1364 (_ BitVec 32)) (_keys!5816 array!8043) (_values!3836 array!8045) (_vacant!1364 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2630)

(declare-datatypes ((List!2399 0))(
  ( (Nil!2396) (Cons!2395 (h!3032 (_ BitVec 64)) (t!7299 List!2399)) )
))
(declare-fun arrayNoDuplicates!0 (array!8043 (_ BitVec 32) List!2399) Bool)

(assert (=> b!188889 (= res!89301 (arrayNoDuplicates!0 (_keys!5816 thiss!1248) #b00000000000000000000000000000000 Nil!2396))))

(declare-fun mapNonEmpty!7603 () Bool)

(declare-fun mapRes!7603 () Bool)

(declare-fun tp!16737 () Bool)

(declare-fun e!124319 () Bool)

(assert (=> mapNonEmpty!7603 (= mapRes!7603 (and tp!16737 e!124319))))

(declare-fun mapKey!7603 () (_ BitVec 32))

(declare-fun mapValue!7603 () ValueCell!1861)

(declare-fun mapRest!7603 () (Array (_ BitVec 32) ValueCell!1861))

(assert (=> mapNonEmpty!7603 (= (arr!3794 (_values!3836 thiss!1248)) (store mapRest!7603 mapKey!7603 mapValue!7603))))

(declare-fun b!188890 () Bool)

(declare-fun e!124316 () Bool)

(declare-fun tp_is_empty!4409 () Bool)

(assert (=> b!188890 (= e!124316 tp_is_empty!4409)))

(declare-fun e!124317 () Bool)

(declare-fun e!124314 () Bool)

(declare-fun array_inv!2457 (array!8043) Bool)

(declare-fun array_inv!2458 (array!8045) Bool)

(assert (=> b!188891 (= e!124317 (and tp!16738 tp_is_empty!4409 (array_inv!2457 (_keys!5816 thiss!1248)) (array_inv!2458 (_values!3836 thiss!1248)) e!124314))))

(declare-fun b!188892 () Bool)

(declare-fun e!124321 () Bool)

(assert (=> b!188892 (= e!124321 e!124315)))

(declare-fun res!89298 () Bool)

(assert (=> b!188892 (=> (not res!89298) (not e!124315))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!188892 (= res!89298 (validMask!0 (mask!9028 thiss!1248)))))

(declare-datatypes ((Unit!5697 0))(
  ( (Unit!5698) )
))
(declare-fun lt!93482 () Unit!5697)

(declare-fun e!124318 () Unit!5697)

(assert (=> b!188892 (= lt!93482 e!124318)))

(declare-fun c!33944 () Bool)

(declare-datatypes ((tuple2!3500 0))(
  ( (tuple2!3501 (_1!1761 (_ BitVec 64)) (_2!1761 V!5525)) )
))
(declare-datatypes ((List!2400 0))(
  ( (Nil!2397) (Cons!2396 (h!3033 tuple2!3500) (t!7300 List!2400)) )
))
(declare-datatypes ((ListLongMap!2417 0))(
  ( (ListLongMap!2418 (toList!1224 List!2400)) )
))
(declare-fun contains!1329 (ListLongMap!2417 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!872 (array!8043 array!8045 (_ BitVec 32) (_ BitVec 32) V!5525 V!5525 (_ BitVec 32) Int) ListLongMap!2417)

(assert (=> b!188892 (= c!33944 (contains!1329 (getCurrentListMap!872 (_keys!5816 thiss!1248) (_values!3836 thiss!1248) (mask!9028 thiss!1248) (extraKeys!3590 thiss!1248) (zeroValue!3694 thiss!1248) (minValue!3694 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3853 thiss!1248)) key!828))))

(declare-fun e!124322 () Bool)

(declare-fun b!188893 () Bool)

(declare-datatypes ((SeekEntryResult!658 0))(
  ( (MissingZero!658 (index!4802 (_ BitVec 32))) (Found!658 (index!4803 (_ BitVec 32))) (Intermediate!658 (undefined!1470 Bool) (index!4804 (_ BitVec 32)) (x!20380 (_ BitVec 32))) (Undefined!658) (MissingVacant!658 (index!4805 (_ BitVec 32))) )
))
(declare-fun lt!93484 () SeekEntryResult!658)

(assert (=> b!188893 (= e!124322 (= (select (arr!3793 (_keys!5816 thiss!1248)) (index!4803 lt!93484)) key!828))))

(declare-fun b!188894 () Bool)

(declare-fun res!89303 () Bool)

(assert (=> b!188894 (=> (not res!89303) (not e!124315))))

(assert (=> b!188894 (= res!89303 (and (= (size!4114 (_values!3836 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9028 thiss!1248))) (= (size!4113 (_keys!5816 thiss!1248)) (size!4114 (_values!3836 thiss!1248))) (bvsge (mask!9028 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3590 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3590 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!188895 () Bool)

(assert (=> b!188895 (= e!124314 (and e!124316 mapRes!7603))))

(declare-fun condMapEmpty!7603 () Bool)

(declare-fun mapDefault!7603 () ValueCell!1861)

