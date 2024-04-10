; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90472 () Bool)

(assert start!90472)

(declare-fun b!1035137 () Bool)

(declare-fun b_free!20827 () Bool)

(declare-fun b_next!20827 () Bool)

(assert (=> b!1035137 (= b_free!20827 (not b_next!20827))))

(declare-fun tp!73600 () Bool)

(declare-fun b_and!33327 () Bool)

(assert (=> b!1035137 (= tp!73600 b_and!33327)))

(declare-fun b!1035134 () Bool)

(declare-fun e!585252 () Bool)

(declare-fun tp_is_empty!24547 () Bool)

(assert (=> b!1035134 (= e!585252 tp_is_empty!24547)))

(declare-fun b!1035135 () Bool)

(declare-fun res!691216 () Bool)

(declare-fun e!585250 () Bool)

(assert (=> b!1035135 (=> (not res!691216) (not e!585250))))

(declare-datatypes ((V!37603 0))(
  ( (V!37604 (val!12324 Int)) )
))
(declare-datatypes ((ValueCell!11570 0))(
  ( (ValueCellFull!11570 (v!14904 V!37603)) (EmptyCell!11570) )
))
(declare-datatypes ((array!65184 0))(
  ( (array!65185 (arr!31381 (Array (_ BitVec 32) (_ BitVec 64))) (size!31907 (_ BitVec 32))) )
))
(declare-datatypes ((array!65186 0))(
  ( (array!65187 (arr!31382 (Array (_ BitVec 32) ValueCell!11570)) (size!31908 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5734 0))(
  ( (LongMapFixedSize!5735 (defaultEntry!6245 Int) (mask!30122 (_ BitVec 32)) (extraKeys!5975 (_ BitVec 32)) (zeroValue!6079 V!37603) (minValue!6081 V!37603) (_size!2922 (_ BitVec 32)) (_keys!11430 array!65184) (_values!6268 array!65186) (_vacant!2922 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5734)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035135 (= res!691216 (validMask!0 (mask!30122 thiss!1427)))))

(declare-fun b!1035136 () Bool)

(assert (=> b!1035136 (= e!585250 (and (= (size!31908 (_values!6268 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30122 thiss!1427))) (= (size!31907 (_keys!11430 thiss!1427)) (size!31908 (_values!6268 thiss!1427))) (bvsge (mask!30122 thiss!1427) #b00000000000000000000000000000000) (bvslt (extraKeys!5975 thiss!1427) #b00000000000000000000000000000000)))))

(declare-fun e!585253 () Bool)

(declare-fun e!585255 () Bool)

(declare-fun array_inv!24275 (array!65184) Bool)

(declare-fun array_inv!24276 (array!65186) Bool)

(assert (=> b!1035137 (= e!585253 (and tp!73600 tp_is_empty!24547 (array_inv!24275 (_keys!11430 thiss!1427)) (array_inv!24276 (_values!6268 thiss!1427)) e!585255))))

(declare-fun mapNonEmpty!38323 () Bool)

(declare-fun mapRes!38323 () Bool)

(declare-fun tp!73601 () Bool)

(assert (=> mapNonEmpty!38323 (= mapRes!38323 (and tp!73601 e!585252))))

(declare-fun mapValue!38323 () ValueCell!11570)

(declare-fun mapKey!38323 () (_ BitVec 32))

(declare-fun mapRest!38323 () (Array (_ BitVec 32) ValueCell!11570))

(assert (=> mapNonEmpty!38323 (= (arr!31382 (_values!6268 thiss!1427)) (store mapRest!38323 mapKey!38323 mapValue!38323))))

(declare-fun b!1035138 () Bool)

(declare-fun res!691215 () Bool)

(assert (=> b!1035138 (=> (not res!691215) (not e!585250))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035138 (= res!691215 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!38323 () Bool)

(assert (=> mapIsEmpty!38323 mapRes!38323))

(declare-fun b!1035140 () Bool)

(declare-fun e!585251 () Bool)

(assert (=> b!1035140 (= e!585251 tp_is_empty!24547)))

(declare-fun res!691217 () Bool)

(assert (=> start!90472 (=> (not res!691217) (not e!585250))))

(declare-fun valid!2166 (LongMapFixedSize!5734) Bool)

(assert (=> start!90472 (= res!691217 (valid!2166 thiss!1427))))

(assert (=> start!90472 e!585250))

(assert (=> start!90472 e!585253))

(assert (=> start!90472 true))

(declare-fun b!1035139 () Bool)

(assert (=> b!1035139 (= e!585255 (and e!585251 mapRes!38323))))

(declare-fun condMapEmpty!38323 () Bool)

(declare-fun mapDefault!38323 () ValueCell!11570)

