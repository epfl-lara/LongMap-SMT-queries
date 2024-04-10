; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3274 () Bool)

(assert start!3274)

(declare-fun b!20029 () Bool)

(declare-fun b_free!703 () Bool)

(declare-fun b_next!703 () Bool)

(assert (=> b!20029 (= b_free!703 (not b_next!703))))

(declare-fun tp!3334 () Bool)

(declare-fun b_and!1375 () Bool)

(assert (=> b!20029 (= tp!3334 b_and!1375)))

(declare-fun e!13047 () Bool)

(declare-fun e!13049 () Bool)

(declare-fun tp_is_empty!967 () Bool)

(declare-datatypes ((V!1115 0))(
  ( (V!1116 (val!510 Int)) )
))
(declare-datatypes ((ValueCell!284 0))(
  ( (ValueCellFull!284 (v!1537 V!1115)) (EmptyCell!284) )
))
(declare-datatypes ((array!1157 0))(
  ( (array!1158 (arr!551 (Array (_ BitVec 32) ValueCell!284)) (size!644 (_ BitVec 32))) )
))
(declare-datatypes ((array!1159 0))(
  ( (array!1160 (arr!552 (Array (_ BitVec 32) (_ BitVec 64))) (size!645 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!154 0))(
  ( (LongMapFixedSize!155 (defaultEntry!1699 Int) (mask!4659 (_ BitVec 32)) (extraKeys!1606 (_ BitVec 32)) (zeroValue!1630 V!1115) (minValue!1630 V!1115) (_size!114 (_ BitVec 32)) (_keys!3124 array!1159) (_values!1692 array!1157) (_vacant!114 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!154 0))(
  ( (Cell!155 (v!1538 LongMapFixedSize!154)) )
))
(declare-datatypes ((LongMap!154 0))(
  ( (LongMap!155 (underlying!88 Cell!154)) )
))
(declare-fun thiss!938 () LongMap!154)

(declare-fun array_inv!375 (array!1159) Bool)

(declare-fun array_inv!376 (array!1157) Bool)

(assert (=> b!20029 (= e!13047 (and tp!3334 tp_is_empty!967 (array_inv!375 (_keys!3124 (v!1538 (underlying!88 thiss!938)))) (array_inv!376 (_values!1692 (v!1538 (underlying!88 thiss!938)))) e!13049))))

(declare-fun b!20030 () Bool)

(declare-fun e!13041 () Bool)

(assert (=> b!20030 (= e!13041 e!13047)))

(declare-fun mapIsEmpty!919 () Bool)

(declare-fun mapRes!919 () Bool)

(assert (=> mapIsEmpty!919 mapRes!919))

(declare-fun mapNonEmpty!919 () Bool)

(declare-fun tp!3333 () Bool)

(declare-fun e!13042 () Bool)

(assert (=> mapNonEmpty!919 (= mapRes!919 (and tp!3333 e!13042))))

(declare-fun mapKey!919 () (_ BitVec 32))

(declare-fun mapRest!919 () (Array (_ BitVec 32) ValueCell!284))

(declare-fun mapValue!919 () ValueCell!284)

(assert (=> mapNonEmpty!919 (= (arr!551 (_values!1692 (v!1538 (underlying!88 thiss!938)))) (store mapRest!919 mapKey!919 mapValue!919))))

(declare-fun b!20031 () Bool)

(declare-fun e!13043 () Bool)

(declare-fun lt!5766 () LongMapFixedSize!154)

(declare-fun valid!76 (LongMapFixedSize!154) Bool)

(assert (=> b!20031 (= e!13043 (not (valid!76 lt!5766)))))

(declare-fun b!20032 () Bool)

(declare-fun e!13045 () Bool)

(assert (=> b!20032 (= e!13045 tp_is_empty!967)))

(declare-fun b!20034 () Bool)

(declare-fun e!13048 () Bool)

(assert (=> b!20034 (= e!13048 e!13041)))

(declare-fun b!20035 () Bool)

(assert (=> b!20035 (= e!13042 tp_is_empty!967)))

(declare-fun b!20036 () Bool)

(declare-fun e!13046 () Bool)

(assert (=> b!20036 (= e!13046 e!13043)))

(declare-fun res!13374 () Bool)

(assert (=> b!20036 (=> (not res!13374) (not e!13043))))

(assert (=> b!20036 (= res!13374 (and (= (bvand (extraKeys!1606 (v!1538 (underlying!88 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (bvand (extraKeys!1606 (v!1538 (underlying!88 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun getNewLongMapFixedSize!17 ((_ BitVec 32) Int) LongMapFixedSize!154)

(declare-fun computeNewMask!13 (LongMap!154 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!20036 (= lt!5766 (getNewLongMapFixedSize!17 (computeNewMask!13 thiss!938 (mask!4659 (v!1538 (underlying!88 thiss!938))) (_vacant!114 (v!1538 (underlying!88 thiss!938))) (_size!114 (v!1538 (underlying!88 thiss!938)))) (defaultEntry!1699 (v!1538 (underlying!88 thiss!938)))))))

(declare-fun b!20033 () Bool)

(assert (=> b!20033 (= e!13049 (and e!13045 mapRes!919))))

(declare-fun condMapEmpty!919 () Bool)

(declare-fun mapDefault!919 () ValueCell!284)

