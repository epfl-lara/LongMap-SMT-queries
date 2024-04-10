; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80376 () Bool)

(assert start!80376)

(declare-fun b!943973 () Bool)

(declare-fun b_free!18019 () Bool)

(declare-fun b_next!18019 () Bool)

(assert (=> b!943973 (= b_free!18019 (not b_next!18019))))

(declare-fun tp!62566 () Bool)

(declare-fun b_and!29437 () Bool)

(assert (=> b!943973 (= tp!62566 b_and!29437)))

(declare-fun b!943965 () Bool)

(declare-fun res!634162 () Bool)

(declare-fun e!530780 () Bool)

(assert (=> b!943965 (=> (not res!634162) (not e!530780))))

(declare-datatypes ((V!32335 0))(
  ( (V!32336 (val!10314 Int)) )
))
(declare-datatypes ((ValueCell!9782 0))(
  ( (ValueCellFull!9782 (v!12846 V!32335)) (EmptyCell!9782) )
))
(declare-datatypes ((array!57022 0))(
  ( (array!57023 (arr!27436 (Array (_ BitVec 32) ValueCell!9782)) (size!27902 (_ BitVec 32))) )
))
(declare-datatypes ((array!57024 0))(
  ( (array!57025 (arr!27437 (Array (_ BitVec 32) (_ BitVec 64))) (size!27903 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4714 0))(
  ( (LongMapFixedSize!4715 (defaultEntry!5652 Int) (mask!27292 (_ BitVec 32)) (extraKeys!5384 (_ BitVec 32)) (zeroValue!5488 V!32335) (minValue!5488 V!32335) (_size!2412 (_ BitVec 32)) (_keys!10530 array!57024) (_values!5675 array!57022) (_vacant!2412 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4714)

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((tuple2!13454 0))(
  ( (tuple2!13455 (_1!6738 (_ BitVec 64)) (_2!6738 V!32335)) )
))
(declare-datatypes ((List!19261 0))(
  ( (Nil!19258) (Cons!19257 (h!20408 tuple2!13454) (t!27578 List!19261)) )
))
(declare-datatypes ((ListLongMap!12151 0))(
  ( (ListLongMap!12152 (toList!6091 List!19261)) )
))
(declare-fun contains!5163 (ListLongMap!12151 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3325 (array!57024 array!57022 (_ BitVec 32) (_ BitVec 32) V!32335 V!32335 (_ BitVec 32) Int) ListLongMap!12151)

(assert (=> b!943965 (= res!634162 (contains!5163 (getCurrentListMap!3325 (_keys!10530 thiss!1141) (_values!5675 thiss!1141) (mask!27292 thiss!1141) (extraKeys!5384 thiss!1141) (zeroValue!5488 thiss!1141) (minValue!5488 thiss!1141) #b00000000000000000000000000000000 (defaultEntry!5652 thiss!1141)) key!756))))

(declare-fun b!943966 () Bool)

(declare-fun e!530777 () Bool)

(declare-fun e!530776 () Bool)

(declare-fun mapRes!32616 () Bool)

(assert (=> b!943966 (= e!530777 (and e!530776 mapRes!32616))))

(declare-fun condMapEmpty!32616 () Bool)

(declare-fun mapDefault!32616 () ValueCell!9782)

