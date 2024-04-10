; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75906 () Bool)

(assert start!75906)

(declare-fun b!893098 () Bool)

(declare-fun b_free!15841 () Bool)

(declare-fun b_next!15841 () Bool)

(assert (=> b!893098 (= b_free!15841 (not b_next!15841))))

(declare-fun tp!55495 () Bool)

(declare-fun b_and!26103 () Bool)

(assert (=> b!893098 (= tp!55495 b_and!26103)))

(declare-fun b!893095 () Bool)

(declare-fun e!498697 () Bool)

(declare-fun e!498699 () Bool)

(assert (=> b!893095 (= e!498697 (not e!498699))))

(declare-fun res!604888 () Bool)

(assert (=> b!893095 (=> res!604888 e!498699)))

(declare-datatypes ((SeekEntryResult!8858 0))(
  ( (MissingZero!8858 (index!37803 (_ BitVec 32))) (Found!8858 (index!37804 (_ BitVec 32))) (Intermediate!8858 (undefined!9670 Bool) (index!37805 (_ BitVec 32)) (x!75918 (_ BitVec 32))) (Undefined!8858) (MissingVacant!8858 (index!37806 (_ BitVec 32))) )
))
(declare-fun lt!403526 () SeekEntryResult!8858)

(assert (=> b!893095 (= res!604888 (is-Found!8858 lt!403526))))

(declare-fun e!498696 () Bool)

(assert (=> b!893095 e!498696))

(declare-fun res!604886 () Bool)

(assert (=> b!893095 (=> res!604886 e!498696)))

(assert (=> b!893095 (= res!604886 (not (is-Found!8858 lt!403526)))))

(declare-datatypes ((Unit!30414 0))(
  ( (Unit!30415) )
))
(declare-fun lt!403527 () Unit!30414)

(declare-datatypes ((array!52320 0))(
  ( (array!52321 (arr!25165 (Array (_ BitVec 32) (_ BitVec 64))) (size!25609 (_ BitVec 32))) )
))
(declare-datatypes ((V!29191 0))(
  ( (V!29192 (val!9135 Int)) )
))
(declare-datatypes ((ValueCell!8603 0))(
  ( (ValueCellFull!8603 (v!11614 V!29191)) (EmptyCell!8603) )
))
(declare-datatypes ((array!52322 0))(
  ( (array!52323 (arr!25166 (Array (_ BitVec 32) ValueCell!8603)) (size!25610 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4222 0))(
  ( (LongMapFixedSize!4223 (defaultEntry!5311 Int) (mask!25835 (_ BitVec 32)) (extraKeys!5006 (_ BitVec 32)) (zeroValue!5110 V!29191) (minValue!5110 V!29191) (_size!2166 (_ BitVec 32)) (_keys!9996 array!52320) (_values!5297 array!52322) (_vacant!2166 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4222)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!57 (array!52320 array!52322 (_ BitVec 32) (_ BitVec 32) V!29191 V!29191 (_ BitVec 64)) Unit!30414)

(assert (=> b!893095 (= lt!403527 (lemmaSeekEntryGivesInRangeIndex!57 (_keys!9996 thiss!1181) (_values!5297 thiss!1181) (mask!25835 thiss!1181) (extraKeys!5006 thiss!1181) (zeroValue!5110 thiss!1181) (minValue!5110 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52320 (_ BitVec 32)) SeekEntryResult!8858)

(assert (=> b!893095 (= lt!403526 (seekEntry!0 key!785 (_keys!9996 thiss!1181) (mask!25835 thiss!1181)))))

(declare-fun b!893096 () Bool)

(declare-fun res!604887 () Bool)

(assert (=> b!893096 (=> (not res!604887) (not e!498697))))

(assert (=> b!893096 (= res!604887 (not (= key!785 (bvneg key!785))))))

(declare-fun b!893097 () Bool)

(assert (=> b!893097 (= e!498699 true)))

(declare-fun lt!403528 () Bool)

(declare-fun contains!4375 (LongMapFixedSize!4222 (_ BitVec 64)) Bool)

(assert (=> b!893097 (= lt!403528 (contains!4375 thiss!1181 key!785))))

(declare-fun tp_is_empty!18169 () Bool)

(declare-fun e!498701 () Bool)

(declare-fun e!498702 () Bool)

(declare-fun array_inv!19764 (array!52320) Bool)

(declare-fun array_inv!19765 (array!52322) Bool)

(assert (=> b!893098 (= e!498701 (and tp!55495 tp_is_empty!18169 (array_inv!19764 (_keys!9996 thiss!1181)) (array_inv!19765 (_values!5297 thiss!1181)) e!498702))))

(declare-fun res!604889 () Bool)

(assert (=> start!75906 (=> (not res!604889) (not e!498697))))

(declare-fun valid!1632 (LongMapFixedSize!4222) Bool)

(assert (=> start!75906 (= res!604889 (valid!1632 thiss!1181))))

(assert (=> start!75906 e!498697))

(assert (=> start!75906 e!498701))

(assert (=> start!75906 true))

(declare-fun b!893099 () Bool)

(declare-fun e!498700 () Bool)

(assert (=> b!893099 (= e!498700 tp_is_empty!18169)))

(declare-fun b!893100 () Bool)

(declare-fun e!498698 () Bool)

(assert (=> b!893100 (= e!498698 tp_is_empty!18169)))

(declare-fun mapNonEmpty!28811 () Bool)

(declare-fun mapRes!28811 () Bool)

(declare-fun tp!55494 () Bool)

(assert (=> mapNonEmpty!28811 (= mapRes!28811 (and tp!55494 e!498700))))

(declare-fun mapKey!28811 () (_ BitVec 32))

(declare-fun mapValue!28811 () ValueCell!8603)

(declare-fun mapRest!28811 () (Array (_ BitVec 32) ValueCell!8603))

(assert (=> mapNonEmpty!28811 (= (arr!25166 (_values!5297 thiss!1181)) (store mapRest!28811 mapKey!28811 mapValue!28811))))

(declare-fun mapIsEmpty!28811 () Bool)

(assert (=> mapIsEmpty!28811 mapRes!28811))

(declare-fun b!893101 () Bool)

(assert (=> b!893101 (= e!498702 (and e!498698 mapRes!28811))))

(declare-fun condMapEmpty!28811 () Bool)

(declare-fun mapDefault!28811 () ValueCell!8603)

