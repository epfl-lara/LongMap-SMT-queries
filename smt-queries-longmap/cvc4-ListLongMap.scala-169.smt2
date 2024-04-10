; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3240 () Bool)

(assert start!3240)

(declare-fun b!19727 () Bool)

(declare-fun b_free!695 () Bool)

(declare-fun b_next!695 () Bool)

(assert (=> b!19727 (= b_free!695 (not b_next!695))))

(declare-fun tp!3303 () Bool)

(declare-fun b_and!1359 () Bool)

(assert (=> b!19727 (= tp!3303 b_and!1359)))

(declare-fun e!12829 () Bool)

(declare-fun e!12831 () Bool)

(declare-datatypes ((V!1103 0))(
  ( (V!1104 (val!506 Int)) )
))
(declare-datatypes ((ValueCell!280 0))(
  ( (ValueCellFull!280 (v!1528 V!1103)) (EmptyCell!280) )
))
(declare-datatypes ((array!1137 0))(
  ( (array!1138 (arr!543 (Array (_ BitVec 32) ValueCell!280)) (size!636 (_ BitVec 32))) )
))
(declare-datatypes ((array!1139 0))(
  ( (array!1140 (arr!544 (Array (_ BitVec 32) (_ BitVec 64))) (size!637 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!146 0))(
  ( (LongMapFixedSize!147 (defaultEntry!1693 Int) (mask!4649 (_ BitVec 32)) (extraKeys!1602 (_ BitVec 32)) (zeroValue!1626 V!1103) (minValue!1626 V!1103) (_size!108 (_ BitVec 32)) (_keys!3120 array!1139) (_values!1688 array!1137) (_vacant!108 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!146 0))(
  ( (Cell!147 (v!1529 LongMapFixedSize!146)) )
))
(declare-datatypes ((LongMap!146 0))(
  ( (LongMap!147 (underlying!84 Cell!146)) )
))
(declare-fun thiss!938 () LongMap!146)

(declare-fun tp_is_empty!959 () Bool)

(declare-fun array_inv!369 (array!1139) Bool)

(declare-fun array_inv!370 (array!1137) Bool)

(assert (=> b!19727 (= e!12831 (and tp!3303 tp_is_empty!959 (array_inv!369 (_keys!3120 (v!1529 (underlying!84 thiss!938)))) (array_inv!370 (_values!1688 (v!1529 (underlying!84 thiss!938)))) e!12829))))

(declare-fun b!19728 () Bool)

(declare-fun e!12825 () Bool)

(declare-fun e!12827 () Bool)

(assert (=> b!19728 (= e!12825 e!12827)))

(declare-fun res!13273 () Bool)

(assert (=> b!19728 (=> (not res!13273) (not e!12827))))

(assert (=> b!19728 (= res!13273 (and (not (= (bvand (extraKeys!1602 (v!1529 (underlying!84 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand (extraKeys!1602 (v!1529 (underlying!84 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun lt!5523 () LongMapFixedSize!146)

(declare-fun getNewLongMapFixedSize!13 ((_ BitVec 32) Int) LongMapFixedSize!146)

(declare-fun computeNewMask!9 (LongMap!146 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19728 (= lt!5523 (getNewLongMapFixedSize!13 (computeNewMask!9 thiss!938 (mask!4649 (v!1529 (underlying!84 thiss!938))) (_vacant!108 (v!1529 (underlying!84 thiss!938))) (_size!108 (v!1529 (underlying!84 thiss!938)))) (defaultEntry!1693 (v!1529 (underlying!84 thiss!938)))))))

(declare-fun b!19729 () Bool)

(declare-fun e!12830 () Bool)

(assert (=> b!19729 (= e!12830 e!12831)))

(declare-fun b!19730 () Bool)

(declare-fun e!12826 () Bool)

(assert (=> b!19730 (= e!12826 tp_is_empty!959)))

(declare-fun res!13272 () Bool)

(assert (=> start!3240 (=> (not res!13272) (not e!12825))))

(declare-fun valid!71 (LongMap!146) Bool)

(assert (=> start!3240 (= res!13272 (valid!71 thiss!938))))

(assert (=> start!3240 e!12825))

(declare-fun e!12832 () Bool)

(assert (=> start!3240 e!12832))

(declare-fun b!19731 () Bool)

(assert (=> b!19731 (= e!12832 e!12830)))

(declare-fun mapIsEmpty!901 () Bool)

(declare-fun mapRes!901 () Bool)

(assert (=> mapIsEmpty!901 mapRes!901))

(declare-fun b!19732 () Bool)

(declare-fun e!12828 () Bool)

(assert (=> b!19732 (= e!12828 tp_is_empty!959)))

(declare-fun b!19733 () Bool)

(assert (=> b!19733 (= e!12829 (and e!12828 mapRes!901))))

(declare-fun condMapEmpty!901 () Bool)

(declare-fun mapDefault!901 () ValueCell!280)

