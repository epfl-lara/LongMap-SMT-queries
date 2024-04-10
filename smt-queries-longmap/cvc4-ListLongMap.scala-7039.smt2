; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89250 () Bool)

(assert start!89250)

(declare-fun b!1023388 () Bool)

(declare-fun b_free!20291 () Bool)

(declare-fun b_next!20291 () Bool)

(assert (=> b!1023388 (= b_free!20291 (not b_next!20291))))

(declare-fun tp!71907 () Bool)

(declare-fun b_and!32513 () Bool)

(assert (=> b!1023388 (= tp!71907 b_and!32513)))

(declare-fun mapNonEmpty!37434 () Bool)

(declare-fun mapRes!37434 () Bool)

(declare-fun tp!71908 () Bool)

(declare-fun e!576653 () Bool)

(assert (=> mapNonEmpty!37434 (= mapRes!37434 (and tp!71908 e!576653))))

(declare-fun mapKey!37434 () (_ BitVec 32))

(declare-datatypes ((V!36887 0))(
  ( (V!36888 (val!12056 Int)) )
))
(declare-datatypes ((ValueCell!11302 0))(
  ( (ValueCellFull!11302 (v!14625 V!36887)) (EmptyCell!11302) )
))
(declare-fun mapValue!37434 () ValueCell!11302)

(declare-fun mapRest!37434 () (Array (_ BitVec 32) ValueCell!11302))

(declare-datatypes ((array!64066 0))(
  ( (array!64067 (arr!30845 (Array (_ BitVec 32) (_ BitVec 64))) (size!31356 (_ BitVec 32))) )
))
(declare-datatypes ((array!64068 0))(
  ( (array!64069 (arr!30846 (Array (_ BitVec 32) ValueCell!11302)) (size!31357 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5198 0))(
  ( (LongMapFixedSize!5199 (defaultEntry!5951 Int) (mask!29570 (_ BitVec 32)) (extraKeys!5683 (_ BitVec 32)) (zeroValue!5787 V!36887) (minValue!5787 V!36887) (_size!2654 (_ BitVec 32)) (_keys!11096 array!64066) (_values!5974 array!64068) (_vacant!2654 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5198)

(assert (=> mapNonEmpty!37434 (= (arr!30846 (_values!5974 thiss!1427)) (store mapRest!37434 mapKey!37434 mapValue!37434))))

(declare-fun res!685402 () Bool)

(declare-fun e!576655 () Bool)

(assert (=> start!89250 (=> (not res!685402) (not e!576655))))

(declare-fun valid!1980 (LongMapFixedSize!5198) Bool)

(assert (=> start!89250 (= res!685402 (valid!1980 thiss!1427))))

(assert (=> start!89250 e!576655))

(declare-fun e!576656 () Bool)

(assert (=> start!89250 e!576656))

(assert (=> start!89250 true))

(declare-fun b!1023383 () Bool)

(declare-fun res!685401 () Bool)

(assert (=> b!1023383 (=> (not res!685401) (not e!576655))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023383 (= res!685401 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023384 () Bool)

(declare-fun e!576657 () Bool)

(declare-fun e!576654 () Bool)

(assert (=> b!1023384 (= e!576657 (and e!576654 mapRes!37434))))

(declare-fun condMapEmpty!37434 () Bool)

(declare-fun mapDefault!37434 () ValueCell!11302)

