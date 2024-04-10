; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80120 () Bool)

(assert start!80120)

(declare-fun b!941644 () Bool)

(declare-fun b_free!17917 () Bool)

(declare-fun b_next!17917 () Bool)

(assert (=> b!941644 (= b_free!17917 (not b_next!17917))))

(declare-fun tp!62236 () Bool)

(declare-fun b_and!29329 () Bool)

(assert (=> b!941644 (= tp!62236 b_and!29329)))

(declare-fun b!941643 () Bool)

(declare-fun e!529392 () Bool)

(declare-fun tp_is_empty!20425 () Bool)

(assert (=> b!941643 (= e!529392 tp_is_empty!20425)))

(declare-fun e!529396 () Bool)

(declare-fun e!529397 () Bool)

(declare-datatypes ((V!32199 0))(
  ( (V!32200 (val!10263 Int)) )
))
(declare-datatypes ((ValueCell!9731 0))(
  ( (ValueCellFull!9731 (v!12794 V!32199)) (EmptyCell!9731) )
))
(declare-datatypes ((array!56804 0))(
  ( (array!56805 (arr!27334 (Array (_ BitVec 32) ValueCell!9731)) (size!27797 (_ BitVec 32))) )
))
(declare-datatypes ((array!56806 0))(
  ( (array!56807 (arr!27335 (Array (_ BitVec 32) (_ BitVec 64))) (size!27798 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4612 0))(
  ( (LongMapFixedSize!4613 (defaultEntry!5597 Int) (mask!27174 (_ BitVec 32)) (extraKeys!5329 (_ BitVec 32)) (zeroValue!5433 V!32199) (minValue!5433 V!32199) (_size!2361 (_ BitVec 32)) (_keys!10456 array!56806) (_values!5620 array!56804) (_vacant!2361 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4612)

(declare-fun array_inv!21240 (array!56806) Bool)

(declare-fun array_inv!21241 (array!56804) Bool)

(assert (=> b!941644 (= e!529396 (and tp!62236 tp_is_empty!20425 (array_inv!21240 (_keys!10456 thiss!1141)) (array_inv!21241 (_values!5620 thiss!1141)) e!529397))))

(declare-fun b!941645 () Bool)

(declare-fun res!632955 () Bool)

(declare-fun e!529393 () Bool)

(assert (=> b!941645 (=> (not res!632955) (not e!529393))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!941645 (= res!632955 (validMask!0 (mask!27174 thiss!1141)))))

(declare-fun b!941646 () Bool)

(declare-fun e!529395 () Bool)

(assert (=> b!941646 (= e!529395 tp_is_empty!20425)))

(declare-fun res!632957 () Bool)

(assert (=> start!80120 (=> (not res!632957) (not e!529393))))

(declare-fun valid!1766 (LongMapFixedSize!4612) Bool)

(assert (=> start!80120 (= res!632957 (valid!1766 thiss!1141))))

(assert (=> start!80120 e!529393))

(assert (=> start!80120 e!529396))

(assert (=> start!80120 true))

(declare-fun b!941647 () Bool)

(declare-fun mapRes!32439 () Bool)

(assert (=> b!941647 (= e!529397 (and e!529395 mapRes!32439))))

(declare-fun condMapEmpty!32439 () Bool)

(declare-fun mapDefault!32439 () ValueCell!9731)

