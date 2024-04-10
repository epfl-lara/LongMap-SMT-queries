; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!90556 () Bool)

(assert start!90556)

(declare-fun b!1035763 () Bool)

(declare-fun b_free!20869 () Bool)

(declare-fun b_next!20869 () Bool)

(assert (=> b!1035763 (= b_free!20869 (not b_next!20869))))

(declare-fun tp!73737 () Bool)

(declare-fun b_and!33369 () Bool)

(assert (=> b!1035763 (= tp!73737 b_and!33369)))

(declare-fun mapIsEmpty!38397 () Bool)

(declare-fun mapRes!38397 () Bool)

(assert (=> mapIsEmpty!38397 mapRes!38397))

(declare-fun b!1035757 () Bool)

(declare-fun res!691508 () Bool)

(declare-fun e!585731 () Bool)

(assert (=> b!1035757 (=> (not res!691508) (not e!585731))))

(declare-datatypes ((V!37659 0))(
  ( (V!37660 (val!12345 Int)) )
))
(declare-datatypes ((ValueCell!11591 0))(
  ( (ValueCellFull!11591 (v!14925 V!37659)) (EmptyCell!11591) )
))
(declare-datatypes ((array!65274 0))(
  ( (array!65275 (arr!31423 (Array (_ BitVec 32) (_ BitVec 64))) (size!31951 (_ BitVec 32))) )
))
(declare-datatypes ((array!65276 0))(
  ( (array!65277 (arr!31424 (Array (_ BitVec 32) ValueCell!11591)) (size!31952 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5776 0))(
  ( (LongMapFixedSize!5777 (defaultEntry!6266 Int) (mask!30163 (_ BitVec 32)) (extraKeys!5996 (_ BitVec 32)) (zeroValue!6100 V!37659) (minValue!6102 V!37659) (_size!2943 (_ BitVec 32)) (_keys!11454 array!65274) (_values!6289 array!65276) (_vacant!2943 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5776)

(assert (=> b!1035757 (= res!691508 (and (= (size!31952 (_values!6289 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30163 thiss!1427))) (= (size!31951 (_keys!11454 thiss!1427)) (size!31952 (_values!6289 thiss!1427))) (bvsge (mask!30163 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5996 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5996 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5996 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1035758 () Bool)

(declare-fun res!691506 () Bool)

(assert (=> b!1035758 (=> (not res!691506) (not e!585731))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1035758 (= res!691506 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1035759 () Bool)

(declare-fun res!691505 () Bool)

(assert (=> b!1035759 (=> (not res!691505) (not e!585731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!65274 (_ BitVec 32)) Bool)

(assert (=> b!1035759 (= res!691505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11454 thiss!1427) (mask!30163 thiss!1427)))))

(declare-fun b!1035760 () Bool)

(declare-fun e!585730 () Bool)

(declare-fun tp_is_empty!24589 () Bool)

(assert (=> b!1035760 (= e!585730 tp_is_empty!24589)))

(declare-fun b!1035761 () Bool)

(declare-datatypes ((List!21915 0))(
  ( (Nil!21912) (Cons!21911 (h!23113 (_ BitVec 64)) (t!31118 List!21915)) )
))
(declare-fun arrayNoDuplicates!0 (array!65274 (_ BitVec 32) List!21915) Bool)

(assert (=> b!1035761 (= e!585731 (not (arrayNoDuplicates!0 (_keys!11454 thiss!1427) #b00000000000000000000000000000000 Nil!21912)))))

(declare-fun e!585733 () Bool)

(declare-fun e!585729 () Bool)

(declare-fun array_inv!24311 (array!65274) Bool)

(declare-fun array_inv!24312 (array!65276) Bool)

(assert (=> b!1035763 (= e!585729 (and tp!73737 tp_is_empty!24589 (array_inv!24311 (_keys!11454 thiss!1427)) (array_inv!24312 (_values!6289 thiss!1427)) e!585733))))

(declare-fun b!1035764 () Bool)

(declare-fun e!585728 () Bool)

(assert (=> b!1035764 (= e!585728 tp_is_empty!24589)))

(declare-fun b!1035765 () Bool)

(declare-fun res!691504 () Bool)

(assert (=> b!1035765 (=> (not res!691504) (not e!585731))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1035765 (= res!691504 (validMask!0 (mask!30163 thiss!1427)))))

(declare-fun mapNonEmpty!38397 () Bool)

(declare-fun tp!73738 () Bool)

(assert (=> mapNonEmpty!38397 (= mapRes!38397 (and tp!73738 e!585728))))

(declare-fun mapRest!38397 () (Array (_ BitVec 32) ValueCell!11591))

(declare-fun mapKey!38397 () (_ BitVec 32))

(declare-fun mapValue!38397 () ValueCell!11591)

(assert (=> mapNonEmpty!38397 (= (arr!31424 (_values!6289 thiss!1427)) (store mapRest!38397 mapKey!38397 mapValue!38397))))

(declare-fun res!691507 () Bool)

(assert (=> start!90556 (=> (not res!691507) (not e!585731))))

(declare-fun valid!2179 (LongMapFixedSize!5776) Bool)

(assert (=> start!90556 (= res!691507 (valid!2179 thiss!1427))))

(assert (=> start!90556 e!585731))

(assert (=> start!90556 e!585729))

(assert (=> start!90556 true))

(declare-fun b!1035762 () Bool)

(assert (=> b!1035762 (= e!585733 (and e!585730 mapRes!38397))))

(declare-fun condMapEmpty!38397 () Bool)

(declare-fun mapDefault!38397 () ValueCell!11591)

