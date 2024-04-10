; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89532 () Bool)

(assert start!89532)

(declare-fun b!1026911 () Bool)

(declare-fun b_free!20531 () Bool)

(declare-fun b_next!20531 () Bool)

(assert (=> b!1026911 (= b_free!20531 (not b_next!20531))))

(declare-fun tp!72639 () Bool)

(declare-fun b_and!32777 () Bool)

(assert (=> b!1026911 (= tp!72639 b_and!32777)))

(declare-fun e!579424 () Bool)

(declare-fun tp_is_empty!24251 () Bool)

(declare-datatypes ((V!37207 0))(
  ( (V!37208 (val!12176 Int)) )
))
(declare-datatypes ((ValueCell!11422 0))(
  ( (ValueCellFull!11422 (v!14745 V!37207)) (EmptyCell!11422) )
))
(declare-datatypes ((array!64552 0))(
  ( (array!64553 (arr!31085 (Array (_ BitVec 32) (_ BitVec 64))) (size!31598 (_ BitVec 32))) )
))
(declare-datatypes ((array!64554 0))(
  ( (array!64555 (arr!31086 (Array (_ BitVec 32) ValueCell!11422)) (size!31599 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5438 0))(
  ( (LongMapFixedSize!5439 (defaultEntry!6071 Int) (mask!29775 (_ BitVec 32)) (extraKeys!5803 (_ BitVec 32)) (zeroValue!5907 V!37207) (minValue!5907 V!37207) (_size!2774 (_ BitVec 32)) (_keys!11218 array!64552) (_values!6094 array!64554) (_vacant!2774 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5438)

(declare-fun e!579423 () Bool)

(declare-fun array_inv!24071 (array!64552) Bool)

(declare-fun array_inv!24072 (array!64554) Bool)

(assert (=> b!1026911 (= e!579424 (and tp!72639 tp_is_empty!24251 (array_inv!24071 (_keys!11218 thiss!1427)) (array_inv!24072 (_values!6094 thiss!1427)) e!579423))))

(declare-fun b!1026912 () Bool)

(declare-fun res!687388 () Bool)

(declare-fun e!579425 () Bool)

(assert (=> b!1026912 (=> res!687388 e!579425)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64552 (_ BitVec 32)) Bool)

(assert (=> b!1026912 (= res!687388 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11218 thiss!1427) (mask!29775 thiss!1427))))))

(declare-fun b!1026913 () Bool)

(declare-fun res!687392 () Bool)

(declare-fun e!579430 () Bool)

(assert (=> b!1026913 (=> (not res!687392) (not e!579430))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1026913 (= res!687392 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1026914 () Bool)

(declare-fun e!579429 () Bool)

(assert (=> b!1026914 (= e!579429 tp_is_empty!24251)))

(declare-fun b!1026915 () Bool)

(declare-fun e!579428 () Bool)

(assert (=> b!1026915 (= e!579428 tp_is_empty!24251)))

(declare-fun b!1026916 () Bool)

(declare-fun mapRes!37805 () Bool)

(assert (=> b!1026916 (= e!579423 (and e!579428 mapRes!37805))))

(declare-fun condMapEmpty!37805 () Bool)

(declare-fun mapDefault!37805 () ValueCell!11422)

