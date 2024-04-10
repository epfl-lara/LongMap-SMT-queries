; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89108 () Bool)

(assert start!89108)

(declare-fun b!1021558 () Bool)

(declare-fun b_free!20149 () Bool)

(declare-fun b_next!20149 () Bool)

(assert (=> b!1021558 (= b_free!20149 (not b_next!20149))))

(declare-fun tp!71481 () Bool)

(declare-fun b_and!32347 () Bool)

(assert (=> b!1021558 (= tp!71481 b_and!32347)))

(declare-fun mapNonEmpty!37221 () Bool)

(declare-fun mapRes!37221 () Bool)

(declare-fun tp!71482 () Bool)

(declare-fun e!575377 () Bool)

(assert (=> mapNonEmpty!37221 (= mapRes!37221 (and tp!71482 e!575377))))

(declare-datatypes ((V!36699 0))(
  ( (V!36700 (val!11985 Int)) )
))
(declare-datatypes ((ValueCell!11231 0))(
  ( (ValueCellFull!11231 (v!14554 V!36699)) (EmptyCell!11231) )
))
(declare-fun mapValue!37221 () ValueCell!11231)

(declare-fun mapKey!37221 () (_ BitVec 32))

(declare-fun mapRest!37221 () (Array (_ BitVec 32) ValueCell!11231))

(declare-datatypes ((array!63782 0))(
  ( (array!63783 (arr!30703 (Array (_ BitVec 32) (_ BitVec 64))) (size!31214 (_ BitVec 32))) )
))
(declare-datatypes ((array!63784 0))(
  ( (array!63785 (arr!30704 (Array (_ BitVec 32) ValueCell!11231)) (size!31215 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5056 0))(
  ( (LongMapFixedSize!5057 (defaultEntry!5880 Int) (mask!29453 (_ BitVec 32)) (extraKeys!5612 (_ BitVec 32)) (zeroValue!5716 V!36699) (minValue!5716 V!36699) (_size!2583 (_ BitVec 32)) (_keys!11025 array!63782) (_values!5903 array!63784) (_vacant!2583 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5056)

(assert (=> mapNonEmpty!37221 (= (arr!30704 (_values!5903 thiss!1427)) (store mapRest!37221 mapKey!37221 mapValue!37221))))

(declare-fun b!1021550 () Bool)

(declare-fun e!575379 () Bool)

(assert (=> b!1021550 (= e!575379 false)))

(declare-fun lt!450117 () Bool)

(declare-datatypes ((List!21657 0))(
  ( (Nil!21654) (Cons!21653 (h!22851 (_ BitVec 64)) (t!30671 List!21657)) )
))
(declare-fun arrayNoDuplicates!0 (array!63782 (_ BitVec 32) List!21657) Bool)

(assert (=> b!1021550 (= lt!450117 (arrayNoDuplicates!0 (_keys!11025 thiss!1427) #b00000000000000000000000000000000 Nil!21654))))

(declare-fun b!1021551 () Bool)

(declare-fun res!684445 () Bool)

(assert (=> b!1021551 (=> (not res!684445) (not e!575379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63782 (_ BitVec 32)) Bool)

(assert (=> b!1021551 (= res!684445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11025 thiss!1427) (mask!29453 thiss!1427)))))

(declare-fun b!1021552 () Bool)

(declare-fun e!575375 () Bool)

(declare-fun tp_is_empty!23869 () Bool)

(assert (=> b!1021552 (= e!575375 tp_is_empty!23869)))

(declare-fun b!1021553 () Bool)

(declare-fun res!684443 () Bool)

(assert (=> b!1021553 (=> (not res!684443) (not e!575379))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021553 (= res!684443 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!37221 () Bool)

(assert (=> mapIsEmpty!37221 mapRes!37221))

(declare-fun res!684444 () Bool)

(assert (=> start!89108 (=> (not res!684444) (not e!575379))))

(declare-fun valid!1928 (LongMapFixedSize!5056) Bool)

(assert (=> start!89108 (= res!684444 (valid!1928 thiss!1427))))

(assert (=> start!89108 e!575379))

(declare-fun e!575374 () Bool)

(assert (=> start!89108 e!575374))

(assert (=> start!89108 true))

(declare-fun b!1021554 () Bool)

(declare-fun e!575378 () Bool)

(assert (=> b!1021554 (= e!575378 (and e!575375 mapRes!37221))))

(declare-fun condMapEmpty!37221 () Bool)

(declare-fun mapDefault!37221 () ValueCell!11231)

