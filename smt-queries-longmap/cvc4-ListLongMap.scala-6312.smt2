; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80914 () Bool)

(assert start!80914)

(declare-fun b!948066 () Bool)

(declare-fun b_free!18197 () Bool)

(declare-fun b_next!18197 () Bool)

(assert (=> b!948066 (= b_free!18197 (not b_next!18197))))

(declare-fun tp!63162 () Bool)

(declare-fun b_and!29623 () Bool)

(assert (=> b!948066 (= tp!63162 b_and!29623)))

(declare-fun mapNonEmpty!32944 () Bool)

(declare-fun mapRes!32944 () Bool)

(declare-fun tp!63161 () Bool)

(declare-fun e!533683 () Bool)

(assert (=> mapNonEmpty!32944 (= mapRes!32944 (and tp!63161 e!533683))))

(declare-datatypes ((V!32571 0))(
  ( (V!32572 (val!10403 Int)) )
))
(declare-datatypes ((ValueCell!9871 0))(
  ( (ValueCellFull!9871 (v!12939 V!32571)) (EmptyCell!9871) )
))
(declare-fun mapRest!32944 () (Array (_ BitVec 32) ValueCell!9871))

(declare-fun mapValue!32944 () ValueCell!9871)

(declare-fun mapKey!32944 () (_ BitVec 32))

(declare-datatypes ((array!57414 0))(
  ( (array!57415 (arr!27614 (Array (_ BitVec 32) ValueCell!9871)) (size!28087 (_ BitVec 32))) )
))
(declare-datatypes ((array!57416 0))(
  ( (array!57417 (arr!27615 (Array (_ BitVec 32) (_ BitVec 64))) (size!28088 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4892 0))(
  ( (LongMapFixedSize!4893 (defaultEntry!5746 Int) (mask!27498 (_ BitVec 32)) (extraKeys!5478 (_ BitVec 32)) (zeroValue!5582 V!32571) (minValue!5582 V!32571) (_size!2501 (_ BitVec 32)) (_keys!10661 array!57416) (_values!5769 array!57414) (_vacant!2501 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4892)

(assert (=> mapNonEmpty!32944 (= (arr!27614 (_values!5769 thiss!1141)) (store mapRest!32944 mapKey!32944 mapValue!32944))))

(declare-fun b!948064 () Bool)

(declare-fun res!636142 () Bool)

(declare-fun e!533681 () Bool)

(assert (=> b!948064 (=> (not res!636142) (not e!533681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!948064 (= res!636142 (validMask!0 (mask!27498 thiss!1141)))))

(declare-fun res!636146 () Bool)

(assert (=> start!80914 (=> (not res!636146) (not e!533681))))

(declare-fun valid!1862 (LongMapFixedSize!4892) Bool)

(assert (=> start!80914 (= res!636146 (valid!1862 thiss!1141))))

(assert (=> start!80914 e!533681))

(declare-fun e!533682 () Bool)

(assert (=> start!80914 e!533682))

(assert (=> start!80914 true))

(declare-fun b!948065 () Bool)

(declare-fun e!533684 () Bool)

(declare-fun tp_is_empty!20705 () Bool)

(assert (=> b!948065 (= e!533684 tp_is_empty!20705)))

(declare-fun e!533686 () Bool)

(declare-fun array_inv!21436 (array!57416) Bool)

(declare-fun array_inv!21437 (array!57414) Bool)

(assert (=> b!948066 (= e!533682 (and tp!63162 tp_is_empty!20705 (array_inv!21436 (_keys!10661 thiss!1141)) (array_inv!21437 (_values!5769 thiss!1141)) e!533686))))

(declare-fun b!948067 () Bool)

(declare-fun res!636143 () Bool)

(assert (=> b!948067 (=> (not res!636143) (not e!533681))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!948067 (= res!636143 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!948068 () Bool)

(assert (=> b!948068 (= e!533683 tp_is_empty!20705)))

(declare-fun b!948069 () Bool)

(assert (=> b!948069 (= e!533686 (and e!533684 mapRes!32944))))

(declare-fun condMapEmpty!32944 () Bool)

(declare-fun mapDefault!32944 () ValueCell!9871)

