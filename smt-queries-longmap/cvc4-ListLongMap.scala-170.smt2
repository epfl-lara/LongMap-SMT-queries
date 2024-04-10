; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3260 () Bool)

(assert start!3260)

(declare-fun b!19965 () Bool)

(declare-fun b_free!701 () Bool)

(declare-fun b_next!701 () Bool)

(assert (=> b!19965 (= b_free!701 (not b_next!701))))

(declare-fun tp!3325 () Bool)

(declare-fun b_and!1369 () Bool)

(assert (=> b!19965 (= tp!3325 b_and!1369)))

(declare-fun b!19959 () Bool)

(declare-fun e!12991 () Bool)

(declare-fun e!12996 () Bool)

(assert (=> b!19959 (= e!12991 e!12996)))

(declare-fun mapNonEmpty!913 () Bool)

(declare-fun mapRes!913 () Bool)

(declare-fun tp!3324 () Bool)

(declare-fun e!12998 () Bool)

(assert (=> mapNonEmpty!913 (= mapRes!913 (and tp!3324 e!12998))))

(declare-datatypes ((V!1111 0))(
  ( (V!1112 (val!509 Int)) )
))
(declare-datatypes ((ValueCell!283 0))(
  ( (ValueCellFull!283 (v!1535 V!1111)) (EmptyCell!283) )
))
(declare-fun mapRest!913 () (Array (_ BitVec 32) ValueCell!283))

(declare-fun mapKey!913 () (_ BitVec 32))

(declare-datatypes ((array!1151 0))(
  ( (array!1152 (arr!549 (Array (_ BitVec 32) ValueCell!283)) (size!642 (_ BitVec 32))) )
))
(declare-datatypes ((array!1153 0))(
  ( (array!1154 (arr!550 (Array (_ BitVec 32) (_ BitVec 64))) (size!643 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!152 0))(
  ( (LongMapFixedSize!153 (defaultEntry!1697 Int) (mask!4655 (_ BitVec 32)) (extraKeys!1605 (_ BitVec 32)) (zeroValue!1629 V!1111) (minValue!1629 V!1111) (_size!112 (_ BitVec 32)) (_keys!3123 array!1153) (_values!1691 array!1151) (_vacant!112 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!152 0))(
  ( (Cell!153 (v!1536 LongMapFixedSize!152)) )
))
(declare-datatypes ((LongMap!152 0))(
  ( (LongMap!153 (underlying!87 Cell!152)) )
))
(declare-fun thiss!938 () LongMap!152)

(declare-fun mapValue!913 () ValueCell!283)

(assert (=> mapNonEmpty!913 (= (arr!549 (_values!1691 (v!1536 (underlying!87 thiss!938)))) (store mapRest!913 mapKey!913 mapValue!913))))

(declare-fun b!19960 () Bool)

(declare-fun e!12994 () Bool)

(declare-fun lt!5688 () LongMapFixedSize!152)

(declare-fun valid!74 (LongMapFixedSize!152) Bool)

(assert (=> b!19960 (= e!12994 (not (valid!74 lt!5688)))))

(declare-fun mapIsEmpty!913 () Bool)

(assert (=> mapIsEmpty!913 mapRes!913))

(declare-fun b!19961 () Bool)

(declare-fun e!12993 () Bool)

(assert (=> b!19961 (= e!12993 e!12994)))

(declare-fun res!13351 () Bool)

(assert (=> b!19961 (=> (not res!13351) (not e!12994))))

(assert (=> b!19961 (= res!13351 (and (= (bvand (extraKeys!1605 (v!1536 (underlying!87 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand (extraKeys!1605 (v!1536 (underlying!87 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun getNewLongMapFixedSize!16 ((_ BitVec 32) Int) LongMapFixedSize!152)

(declare-fun computeNewMask!12 (LongMap!152 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19961 (= lt!5688 (getNewLongMapFixedSize!16 (computeNewMask!12 thiss!938 (mask!4655 (v!1536 (underlying!87 thiss!938))) (_vacant!112 (v!1536 (underlying!87 thiss!938))) (_size!112 (v!1536 (underlying!87 thiss!938)))) (defaultEntry!1697 (v!1536 (underlying!87 thiss!938)))))))

(declare-fun res!13350 () Bool)

(assert (=> start!3260 (=> (not res!13350) (not e!12993))))

(declare-fun valid!75 (LongMap!152) Bool)

(assert (=> start!3260 (= res!13350 (valid!75 thiss!938))))

(assert (=> start!3260 e!12993))

(declare-fun e!12995 () Bool)

(assert (=> start!3260 e!12995))

(declare-fun b!19962 () Bool)

(declare-fun tp_is_empty!965 () Bool)

(assert (=> b!19962 (= e!12998 tp_is_empty!965)))

(declare-fun b!19963 () Bool)

(assert (=> b!19963 (= e!12995 e!12991)))

(declare-fun b!19964 () Bool)

(declare-fun e!12990 () Bool)

(assert (=> b!19964 (= e!12990 tp_is_empty!965)))

(declare-fun e!12997 () Bool)

(declare-fun array_inv!373 (array!1153) Bool)

(declare-fun array_inv!374 (array!1151) Bool)

(assert (=> b!19965 (= e!12996 (and tp!3325 tp_is_empty!965 (array_inv!373 (_keys!3123 (v!1536 (underlying!87 thiss!938)))) (array_inv!374 (_values!1691 (v!1536 (underlying!87 thiss!938)))) e!12997))))

(declare-fun b!19966 () Bool)

(assert (=> b!19966 (= e!12997 (and e!12990 mapRes!913))))

(declare-fun condMapEmpty!913 () Bool)

(declare-fun mapDefault!913 () ValueCell!283)

