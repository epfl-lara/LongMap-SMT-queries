; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16824 () Bool)

(assert start!16824)

(declare-fun b!169645 () Bool)

(declare-fun b_free!4159 () Bool)

(declare-fun b_next!4159 () Bool)

(assert (=> b!169645 (= b_free!4159 (not b_next!4159))))

(declare-fun tp!15078 () Bool)

(declare-fun b_and!10573 () Bool)

(assert (=> b!169645 (= tp!15078 b_and!10573)))

(declare-fun res!80654 () Bool)

(declare-fun e!111873 () Bool)

(assert (=> start!16824 (=> (not res!80654) (not e!111873))))

(declare-datatypes ((V!4889 0))(
  ( (V!4890 (val!2010 Int)) )
))
(declare-datatypes ((ValueCell!1622 0))(
  ( (ValueCellFull!1622 (v!3875 V!4889)) (EmptyCell!1622) )
))
(declare-datatypes ((array!6959 0))(
  ( (array!6960 (arr!3315 (Array (_ BitVec 32) (_ BitVec 64))) (size!3603 (_ BitVec 32))) )
))
(declare-datatypes ((array!6961 0))(
  ( (array!6962 (arr!3316 (Array (_ BitVec 32) ValueCell!1622)) (size!3604 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2152 0))(
  ( (LongMapFixedSize!2153 (defaultEntry!3518 Int) (mask!8307 (_ BitVec 32)) (extraKeys!3259 (_ BitVec 32)) (zeroValue!3361 V!4889) (minValue!3361 V!4889) (_size!1125 (_ BitVec 32)) (_keys!5343 array!6959) (_values!3501 array!6961) (_vacant!1125 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2152)

(declare-fun valid!926 (LongMapFixedSize!2152) Bool)

(assert (=> start!16824 (= res!80654 (valid!926 thiss!1248))))

(assert (=> start!16824 e!111873))

(declare-fun e!111878 () Bool)

(assert (=> start!16824 e!111878))

(assert (=> start!16824 true))

(declare-fun b!169642 () Bool)

(declare-fun e!111877 () Bool)

(declare-fun tp_is_empty!3931 () Bool)

(assert (=> b!169642 (= e!111877 tp_is_empty!3931)))

(declare-fun b!169643 () Bool)

(declare-fun res!80655 () Bool)

(assert (=> b!169643 (=> (not res!80655) (not e!111873))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!169643 (= res!80655 (and (= key!828 (bvneg key!828)) (= key!828 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!169644 () Bool)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!169644 (= e!111873 (not (validMask!0 (mask!8307 thiss!1248))))))

(declare-fun e!111874 () Bool)

(declare-fun array_inv!2127 (array!6959) Bool)

(declare-fun array_inv!2128 (array!6961) Bool)

(assert (=> b!169645 (= e!111878 (and tp!15078 tp_is_empty!3931 (array_inv!2127 (_keys!5343 thiss!1248)) (array_inv!2128 (_values!3501 thiss!1248)) e!111874))))

(declare-fun b!169646 () Bool)

(declare-fun e!111876 () Bool)

(declare-fun mapRes!6660 () Bool)

(assert (=> b!169646 (= e!111874 (and e!111876 mapRes!6660))))

(declare-fun condMapEmpty!6660 () Bool)

(declare-fun mapDefault!6660 () ValueCell!1622)

