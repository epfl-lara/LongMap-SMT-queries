; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75300 () Bool)

(assert start!75300)

(declare-fun b!887079 () Bool)

(declare-fun b_free!15499 () Bool)

(declare-fun b_next!15499 () Bool)

(assert (=> b!887079 (= b_free!15499 (not b_next!15499))))

(declare-fun tp!54430 () Bool)

(declare-fun b_and!25705 () Bool)

(assert (=> b!887079 (= tp!54430 b_and!25705)))

(declare-fun b!887073 () Bool)

(declare-fun e!493891 () Bool)

(assert (=> b!887073 (= e!493891 false)))

(declare-datatypes ((V!28735 0))(
  ( (V!28736 (val!8964 Int)) )
))
(declare-fun lt!401185 () V!28735)

(declare-datatypes ((ValueCell!8432 0))(
  ( (ValueCellFull!8432 (v!11408 V!28735)) (EmptyCell!8432) )
))
(declare-datatypes ((array!51614 0))(
  ( (array!51615 (arr!24823 (Array (_ BitVec 32) ValueCell!8432)) (size!25263 (_ BitVec 32))) )
))
(declare-datatypes ((array!51616 0))(
  ( (array!51617 (arr!24824 (Array (_ BitVec 32) (_ BitVec 64))) (size!25264 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!3880 0))(
  ( (LongMapFixedSize!3881 (defaultEntry!5128 Int) (mask!25519 (_ BitVec 32)) (extraKeys!4821 (_ BitVec 32)) (zeroValue!4925 V!28735) (minValue!4925 V!28735) (_size!1995 (_ BitVec 32)) (_keys!9803 array!51616) (_values!5112 array!51614) (_vacant!1995 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1040 0))(
  ( (Cell!1041 (v!11409 LongMapFixedSize!3880)) )
))
(declare-datatypes ((LongMap!1040 0))(
  ( (LongMap!1041 (underlying!531 Cell!1040)) )
))
(declare-fun thiss!833 () LongMap!1040)

(declare-fun key!673 () (_ BitVec 64))

(declare-fun apply!387 (LongMapFixedSize!3880 (_ BitVec 64)) V!28735)

(assert (=> b!887073 (= lt!401185 (apply!387 (v!11409 (underlying!531 thiss!833)) key!673))))

(declare-fun mapIsEmpty!28260 () Bool)

(declare-fun mapRes!28260 () Bool)

(assert (=> mapIsEmpty!28260 mapRes!28260))

(declare-fun res!602056 () Bool)

(assert (=> start!75300 (=> (not res!602056) (not e!493891))))

(declare-fun valid!1512 (LongMap!1040) Bool)

(assert (=> start!75300 (= res!602056 (valid!1512 thiss!833))))

(assert (=> start!75300 e!493891))

(declare-fun e!493895 () Bool)

(assert (=> start!75300 e!493895))

(assert (=> start!75300 true))

(declare-fun mapNonEmpty!28260 () Bool)

(declare-fun tp!54431 () Bool)

(declare-fun e!493893 () Bool)

(assert (=> mapNonEmpty!28260 (= mapRes!28260 (and tp!54431 e!493893))))

(declare-fun mapValue!28260 () ValueCell!8432)

(declare-fun mapRest!28260 () (Array (_ BitVec 32) ValueCell!8432))

(declare-fun mapKey!28260 () (_ BitVec 32))

(assert (=> mapNonEmpty!28260 (= (arr!24823 (_values!5112 (v!11409 (underlying!531 thiss!833)))) (store mapRest!28260 mapKey!28260 mapValue!28260))))

(declare-fun b!887074 () Bool)

(declare-fun e!493892 () Bool)

(declare-fun tp_is_empty!17827 () Bool)

(assert (=> b!887074 (= e!493892 tp_is_empty!17827)))

(declare-fun b!887075 () Bool)

(declare-fun e!493889 () Bool)

(assert (=> b!887075 (= e!493895 e!493889)))

(declare-fun b!887076 () Bool)

(declare-fun e!493896 () Bool)

(assert (=> b!887076 (= e!493896 (and e!493892 mapRes!28260))))

(declare-fun condMapEmpty!28260 () Bool)

(declare-fun mapDefault!28260 () ValueCell!8432)

