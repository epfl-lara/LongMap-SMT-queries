; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90418 () Bool)

(assert start!90418)

(declare-fun b!1034832 () Bool)

(declare-fun b_free!20813 () Bool)

(declare-fun b_next!20813 () Bool)

(assert (=> b!1034832 (= b_free!20813 (not b_next!20813))))

(declare-fun tp!73548 () Bool)

(declare-fun b_and!33313 () Bool)

(assert (=> b!1034832 (= tp!73548 b_and!33313)))

(declare-fun b!1034831 () Bool)

(declare-fun e!585037 () Bool)

(declare-fun tp_is_empty!24533 () Bool)

(assert (=> b!1034831 (= e!585037 tp_is_empty!24533)))

(declare-fun mapNonEmpty!38291 () Bool)

(declare-fun mapRes!38291 () Bool)

(declare-fun tp!73547 () Bool)

(assert (=> mapNonEmpty!38291 (= mapRes!38291 (and tp!73547 e!585037))))

(declare-datatypes ((V!37583 0))(
  ( (V!37584 (val!12317 Int)) )
))
(declare-datatypes ((ValueCell!11563 0))(
  ( (ValueCellFull!11563 (v!14897 V!37583)) (EmptyCell!11563) )
))
(declare-fun mapRest!38291 () (Array (_ BitVec 32) ValueCell!11563))

(declare-fun mapKey!38291 () (_ BitVec 32))

(declare-datatypes ((array!65150 0))(
  ( (array!65151 (arr!31367 (Array (_ BitVec 32) (_ BitVec 64))) (size!31891 (_ BitVec 32))) )
))
(declare-datatypes ((array!65152 0))(
  ( (array!65153 (arr!31368 (Array (_ BitVec 32) ValueCell!11563)) (size!31892 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5720 0))(
  ( (LongMapFixedSize!5721 (defaultEntry!6238 Int) (mask!30104 (_ BitVec 32)) (extraKeys!5968 (_ BitVec 32)) (zeroValue!6072 V!37583) (minValue!6074 V!37583) (_size!2915 (_ BitVec 32)) (_keys!11421 array!65150) (_values!6261 array!65152) (_vacant!2915 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5720)

(declare-fun mapValue!38291 () ValueCell!11563)

(assert (=> mapNonEmpty!38291 (= (arr!31368 (_values!6261 thiss!1427)) (store mapRest!38291 mapKey!38291 mapValue!38291))))

(declare-fun e!585033 () Bool)

(declare-fun e!585036 () Bool)

(declare-fun array_inv!24263 (array!65150) Bool)

(declare-fun array_inv!24264 (array!65152) Bool)

(assert (=> b!1034832 (= e!585036 (and tp!73548 tp_is_empty!24533 (array_inv!24263 (_keys!11421 thiss!1427)) (array_inv!24264 (_values!6261 thiss!1427)) e!585033))))

(declare-fun b!1034833 () Bool)

(declare-fun e!585035 () Bool)

(assert (=> b!1034833 (= e!585035 tp_is_empty!24533)))

(declare-fun b!1034834 () Bool)

(declare-fun e!585034 () Bool)

(assert (=> b!1034834 (= e!585034 (not (= (size!31892 (_values!6261 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30104 thiss!1427)))))))

(declare-fun b!1034835 () Bool)

(declare-fun res!691071 () Bool)

(assert (=> b!1034835 (=> (not res!691071) (not e!585034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034835 (= res!691071 (validMask!0 (mask!30104 thiss!1427)))))

(declare-fun b!1034836 () Bool)

(assert (=> b!1034836 (= e!585033 (and e!585035 mapRes!38291))))

(declare-fun condMapEmpty!38291 () Bool)

(declare-fun mapDefault!38291 () ValueCell!11563)

