; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90540 () Bool)

(assert start!90540)

(declare-fun b!1035654 () Bool)

(declare-fun b_free!20863 () Bool)

(declare-fun b_next!20863 () Bool)

(assert (=> b!1035654 (= b_free!20863 (not b_next!20863))))

(declare-fun tp!73716 () Bool)

(declare-fun b_and!33363 () Bool)

(assert (=> b!1035654 (= tp!73716 b_and!33363)))

(declare-fun e!585660 () Bool)

(declare-fun e!585661 () Bool)

(declare-datatypes ((V!37651 0))(
  ( (V!37652 (val!12342 Int)) )
))
(declare-datatypes ((ValueCell!11588 0))(
  ( (ValueCellFull!11588 (v!14922 V!37651)) (EmptyCell!11588) )
))
(declare-datatypes ((array!65260 0))(
  ( (array!65261 (arr!31417 (Array (_ BitVec 32) (_ BitVec 64))) (size!31945 (_ BitVec 32))) )
))
(declare-datatypes ((array!65262 0))(
  ( (array!65263 (arr!31418 (Array (_ BitVec 32) ValueCell!11588)) (size!31946 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5770 0))(
  ( (LongMapFixedSize!5771 (defaultEntry!6263 Int) (mask!30156 (_ BitVec 32)) (extraKeys!5993 (_ BitVec 32)) (zeroValue!6097 V!37651) (minValue!6099 V!37651) (_size!2940 (_ BitVec 32)) (_keys!11450 array!65260) (_values!6286 array!65262) (_vacant!2940 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5770)

(declare-fun tp_is_empty!24583 () Bool)

(declare-fun array_inv!24305 (array!65260) Bool)

(declare-fun array_inv!24306 (array!65262) Bool)

(assert (=> b!1035654 (= e!585660 (and tp!73716 tp_is_empty!24583 (array_inv!24305 (_keys!11450 thiss!1427)) (array_inv!24306 (_values!6286 thiss!1427)) e!585661))))

(declare-fun mapNonEmpty!38385 () Bool)

(declare-fun mapRes!38385 () Bool)

(declare-fun tp!73717 () Bool)

(declare-fun e!585659 () Bool)

(assert (=> mapNonEmpty!38385 (= mapRes!38385 (and tp!73717 e!585659))))

(declare-fun mapKey!38385 () (_ BitVec 32))

(declare-fun mapRest!38385 () (Array (_ BitVec 32) ValueCell!11588))

(declare-fun mapValue!38385 () ValueCell!11588)

(assert (=> mapNonEmpty!38385 (= (arr!31418 (_values!6286 thiss!1427)) (store mapRest!38385 mapKey!38385 mapValue!38385))))

(declare-fun b!1035655 () Bool)

(declare-fun res!691453 () Bool)

(declare-fun e!585658 () Bool)

(assert (=> b!1035655 (=> (not res!691453) (not e!585658))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035655 (= res!691453 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035656 () Bool)

(declare-fun res!691454 () Bool)

(assert (=> b!1035656 (=> (not res!691454) (not e!585658))))

(assert (=> b!1035656 (= res!691454 (and (= (size!31946 (_values!6286 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30156 thiss!1427))) (= (size!31945 (_keys!11450 thiss!1427)) (size!31946 (_values!6286 thiss!1427))) (bvsge (mask!30156 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5993 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5993 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5993 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1035658 () Bool)

(declare-fun res!691451 () Bool)

(assert (=> b!1035658 (=> (not res!691451) (not e!585658))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035658 (= res!691451 (validMask!0 (mask!30156 thiss!1427)))))

(declare-fun mapIsEmpty!38385 () Bool)

(assert (=> mapIsEmpty!38385 mapRes!38385))

(declare-fun b!1035659 () Bool)

(declare-fun e!585657 () Bool)

(assert (=> b!1035659 (= e!585661 (and e!585657 mapRes!38385))))

(declare-fun condMapEmpty!38385 () Bool)

(declare-fun mapDefault!38385 () ValueCell!11588)

