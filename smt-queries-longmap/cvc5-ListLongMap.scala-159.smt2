; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3024 () Bool)

(assert start!3024)

(declare-fun b!17906 () Bool)

(declare-fun b_free!631 () Bool)

(declare-fun b_next!631 () Bool)

(assert (=> b!17906 (= b_free!631 (not b_next!631))))

(declare-fun tp!3083 () Bool)

(declare-fun b_and!1279 () Bool)

(assert (=> b!17906 (= tp!3083 b_and!1279)))

(declare-fun res!12687 () Bool)

(declare-fun e!11378 () Bool)

(assert (=> start!3024 (=> (not res!12687) (not e!11378))))

(declare-datatypes ((V!1019 0))(
  ( (V!1020 (val!474 Int)) )
))
(declare-datatypes ((ValueCell!248 0))(
  ( (ValueCellFull!248 (v!1452 V!1019)) (EmptyCell!248) )
))
(declare-datatypes ((array!995 0))(
  ( (array!996 (arr!479 (Array (_ BitVec 32) ValueCell!248)) (size!569 (_ BitVec 32))) )
))
(declare-datatypes ((array!997 0))(
  ( (array!998 (arr!480 (Array (_ BitVec 32) (_ BitVec 64))) (size!570 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!82 0))(
  ( (LongMapFixedSize!83 (defaultEntry!1652 Int) (mask!4579 (_ BitVec 32)) (extraKeys!1565 (_ BitVec 32)) (zeroValue!1588 V!1019) (minValue!1588 V!1019) (_size!73 (_ BitVec 32)) (_keys!3077 array!997) (_values!1649 array!995) (_vacant!73 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!82 0))(
  ( (Cell!83 (v!1453 LongMapFixedSize!82)) )
))
(declare-datatypes ((LongMap!82 0))(
  ( (LongMap!83 (underlying!52 Cell!82)) )
))
(declare-fun thiss!848 () LongMap!82)

(declare-fun valid!40 (LongMap!82) Bool)

(assert (=> start!3024 (= res!12687 (valid!40 thiss!848))))

(assert (=> start!3024 e!11378))

(declare-fun e!11383 () Bool)

(assert (=> start!3024 e!11383))

(declare-fun mapNonEmpty!777 () Bool)

(declare-fun mapRes!777 () Bool)

(declare-fun tp!3084 () Bool)

(declare-fun e!11379 () Bool)

(assert (=> mapNonEmpty!777 (= mapRes!777 (and tp!3084 e!11379))))

(declare-fun mapKey!777 () (_ BitVec 32))

(declare-fun mapValue!777 () ValueCell!248)

(declare-fun mapRest!777 () (Array (_ BitVec 32) ValueCell!248))

(assert (=> mapNonEmpty!777 (= (arr!479 (_values!1649 (v!1453 (underlying!52 thiss!848)))) (store mapRest!777 mapKey!777 mapValue!777))))

(declare-fun b!17898 () Bool)

(declare-fun e!11382 () Bool)

(assert (=> b!17898 (= e!11383 e!11382)))

(declare-fun b!17899 () Bool)

(declare-fun e!11386 () Bool)

(declare-fun tp_is_empty!895 () Bool)

(assert (=> b!17899 (= e!11386 tp_is_empty!895)))

(declare-fun b!17900 () Bool)

(assert (=> b!17900 (= e!11379 tp_is_empty!895)))

(declare-fun b!17901 () Bool)

(declare-datatypes ((tuple2!772 0))(
  ( (tuple2!773 (_1!387 Bool) (_2!387 LongMap!82)) )
))
(declare-fun e!11384 () tuple2!772)

(assert (=> b!17901 (= e!11384 (tuple2!773 true thiss!848))))

(declare-fun b!17902 () Bool)

(declare-fun e!11381 () Bool)

(assert (=> b!17902 (= e!11378 e!11381)))

(declare-fun res!12688 () Bool)

(assert (=> b!17902 (=> (not res!12688) (not e!11381))))

(declare-fun lt!4635 () tuple2!772)

(assert (=> b!17902 (= res!12688 (not (_1!387 lt!4635)))))

(assert (=> b!17902 (= lt!4635 e!11384)))

(declare-fun c!1795 () Bool)

(declare-fun imbalanced!22 (LongMap!82) Bool)

(assert (=> b!17902 (= c!1795 (imbalanced!22 thiss!848))))

(declare-fun b!17903 () Bool)

(declare-fun repack!16 (LongMap!82) tuple2!772)

(assert (=> b!17903 (= e!11384 (repack!16 thiss!848))))

(declare-fun b!17904 () Bool)

(assert (=> b!17904 (= e!11381 false)))

(declare-fun lt!4636 () Bool)

(assert (=> b!17904 (= lt!4636 (valid!40 (_2!387 lt!4635)))))

(declare-fun b!17905 () Bool)

(declare-fun e!11380 () Bool)

(assert (=> b!17905 (= e!11380 (and e!11386 mapRes!777))))

(declare-fun condMapEmpty!777 () Bool)

(declare-fun mapDefault!777 () ValueCell!248)

