; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90260 () Bool)

(assert start!90260)

(declare-fun b!1033284 () Bool)

(declare-fun b_free!20779 () Bool)

(declare-fun b_next!20779 () Bool)

(assert (=> b!1033284 (= b_free!20779 (not b_next!20779))))

(declare-fun tp!73431 () Bool)

(declare-fun b_and!33247 () Bool)

(assert (=> b!1033284 (= tp!73431 b_and!33247)))

(declare-fun mapIsEmpty!38225 () Bool)

(declare-fun mapRes!38225 () Bool)

(assert (=> mapIsEmpty!38225 mapRes!38225))

(declare-fun b!1033281 () Bool)

(declare-fun e!584006 () Bool)

(declare-datatypes ((V!37539 0))(
  ( (V!37540 (val!12300 Int)) )
))
(declare-datatypes ((ValueCell!11546 0))(
  ( (ValueCellFull!11546 (v!14877 V!37539)) (EmptyCell!11546) )
))
(declare-datatypes ((array!65074 0))(
  ( (array!65075 (arr!31333 (Array (_ BitVec 32) (_ BitVec 64))) (size!31855 (_ BitVec 32))) )
))
(declare-datatypes ((array!65076 0))(
  ( (array!65077 (arr!31334 (Array (_ BitVec 32) ValueCell!11546)) (size!31856 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5686 0))(
  ( (LongMapFixedSize!5687 (defaultEntry!6217 Int) (mask!30064 (_ BitVec 32)) (extraKeys!5949 (_ BitVec 32)) (zeroValue!6053 V!37539) (minValue!6053 V!37539) (_size!2898 (_ BitVec 32)) (_keys!11395 array!65074) (_values!6240 array!65076) (_vacant!2898 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5686)

(assert (=> b!1033281 (= e!584006 (and (= (size!31856 (_values!6240 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30064 thiss!1427))) (= (size!31855 (_keys!11395 thiss!1427)) (size!31856 (_values!6240 thiss!1427))) (bvsge (mask!30064 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5949 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5949 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (not (= (bvand (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!1033282 () Bool)

(declare-fun res!690429 () Bool)

(assert (=> b!1033282 (=> (not res!690429) (not e!584006))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1033282 (= res!690429 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1033283 () Bool)

(declare-fun e!584008 () Bool)

(declare-fun tp_is_empty!24499 () Bool)

(assert (=> b!1033283 (= e!584008 tp_is_empty!24499)))

(declare-fun e!584010 () Bool)

(declare-fun e!584007 () Bool)

(declare-fun array_inv!24243 (array!65074) Bool)

(declare-fun array_inv!24244 (array!65076) Bool)

(assert (=> b!1033284 (= e!584007 (and tp!73431 tp_is_empty!24499 (array_inv!24243 (_keys!11395 thiss!1427)) (array_inv!24244 (_values!6240 thiss!1427)) e!584010))))

(declare-fun mapNonEmpty!38225 () Bool)

(declare-fun tp!73430 () Bool)

(assert (=> mapNonEmpty!38225 (= mapRes!38225 (and tp!73430 e!584008))))

(declare-fun mapKey!38225 () (_ BitVec 32))

(declare-fun mapRest!38225 () (Array (_ BitVec 32) ValueCell!11546))

(declare-fun mapValue!38225 () ValueCell!11546)

(assert (=> mapNonEmpty!38225 (= (arr!31334 (_values!6240 thiss!1427)) (store mapRest!38225 mapKey!38225 mapValue!38225))))

(declare-fun b!1033285 () Bool)

(declare-fun e!584009 () Bool)

(assert (=> b!1033285 (= e!584010 (and e!584009 mapRes!38225))))

(declare-fun condMapEmpty!38225 () Bool)

(declare-fun mapDefault!38225 () ValueCell!11546)

