; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90494 () Bool)

(assert start!90494)

(declare-fun b!1034599 () Bool)

(declare-fun b_free!20779 () Bool)

(declare-fun b_next!20779 () Bool)

(assert (=> b!1034599 (= b_free!20779 (not b_next!20779))))

(declare-fun tp!73431 () Bool)

(declare-fun b_and!33257 () Bool)

(assert (=> b!1034599 (= tp!73431 b_and!33257)))

(declare-fun b!1034596 () Bool)

(declare-fun e!584849 () Bool)

(declare-fun e!584851 () Bool)

(declare-fun mapRes!38225 () Bool)

(assert (=> b!1034596 (= e!584849 (and e!584851 mapRes!38225))))

(declare-fun condMapEmpty!38225 () Bool)

(declare-datatypes ((V!37539 0))(
  ( (V!37540 (val!12300 Int)) )
))
(declare-datatypes ((ValueCell!11546 0))(
  ( (ValueCellFull!11546 (v!14873 V!37539)) (EmptyCell!11546) )
))
(declare-datatypes ((array!65123 0))(
  ( (array!65124 (arr!31351 (Array (_ BitVec 32) (_ BitVec 64))) (size!31874 (_ BitVec 32))) )
))
(declare-datatypes ((array!65125 0))(
  ( (array!65126 (arr!31352 (Array (_ BitVec 32) ValueCell!11546)) (size!31875 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5686 0))(
  ( (LongMapFixedSize!5687 (defaultEntry!6217 Int) (mask!30124 (_ BitVec 32)) (extraKeys!5949 (_ BitVec 32)) (zeroValue!6053 V!37539) (minValue!6053 V!37539) (_size!2898 (_ BitVec 32)) (_keys!11433 array!65123) (_values!6240 array!65125) (_vacant!2898 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5686)

(declare-fun mapDefault!38225 () ValueCell!11546)

(assert (=> b!1034596 (= condMapEmpty!38225 (= (arr!31352 (_values!6240 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11546)) mapDefault!38225)))))

(declare-fun b!1034597 () Bool)

(declare-fun res!690939 () Bool)

(declare-fun e!584850 () Bool)

(assert (=> b!1034597 (=> (not res!690939) (not e!584850))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1034597 (= res!690939 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1034598 () Bool)

(assert (=> b!1034598 (= e!584850 (and (= (size!31875 (_values!6240 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30124 thiss!1427))) (= (size!31874 (_keys!11433 thiss!1427)) (size!31875 (_values!6240 thiss!1427))) (bvsge (mask!30124 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5949 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5949 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (not (= (bvand (bvand (extraKeys!5949 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun tp_is_empty!24499 () Bool)

(declare-fun e!584853 () Bool)

(declare-fun array_inv!24267 (array!65123) Bool)

(declare-fun array_inv!24268 (array!65125) Bool)

(assert (=> b!1034599 (= e!584853 (and tp!73431 tp_is_empty!24499 (array_inv!24267 (_keys!11433 thiss!1427)) (array_inv!24268 (_values!6240 thiss!1427)) e!584849))))

(declare-fun b!1034600 () Bool)

(declare-fun res!690940 () Bool)

(assert (=> b!1034600 (=> (not res!690940) (not e!584850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1034600 (= res!690940 (validMask!0 (mask!30124 thiss!1427)))))

(declare-fun mapNonEmpty!38225 () Bool)

(declare-fun tp!73430 () Bool)

(declare-fun e!584854 () Bool)

(assert (=> mapNonEmpty!38225 (= mapRes!38225 (and tp!73430 e!584854))))

(declare-fun mapRest!38225 () (Array (_ BitVec 32) ValueCell!11546))

(declare-fun mapValue!38225 () ValueCell!11546)

(declare-fun mapKey!38225 () (_ BitVec 32))

(assert (=> mapNonEmpty!38225 (= (arr!31352 (_values!6240 thiss!1427)) (store mapRest!38225 mapKey!38225 mapValue!38225))))

(declare-fun b!1034601 () Bool)

(assert (=> b!1034601 (= e!584854 tp_is_empty!24499)))

(declare-fun mapIsEmpty!38225 () Bool)

(assert (=> mapIsEmpty!38225 mapRes!38225))

(declare-fun res!690941 () Bool)

(assert (=> start!90494 (=> (not res!690941) (not e!584850))))

(declare-fun valid!2155 (LongMapFixedSize!5686) Bool)

(assert (=> start!90494 (= res!690941 (valid!2155 thiss!1427))))

(assert (=> start!90494 e!584850))

(assert (=> start!90494 e!584853))

(assert (=> start!90494 true))

(declare-fun b!1034602 () Bool)

(assert (=> b!1034602 (= e!584851 tp_is_empty!24499)))

(assert (= (and start!90494 res!690941) b!1034597))

(assert (= (and b!1034597 res!690939) b!1034600))

(assert (= (and b!1034600 res!690940) b!1034598))

(assert (= (and b!1034596 condMapEmpty!38225) mapIsEmpty!38225))

(assert (= (and b!1034596 (not condMapEmpty!38225)) mapNonEmpty!38225))

(get-info :version)

(assert (= (and mapNonEmpty!38225 ((_ is ValueCellFull!11546) mapValue!38225)) b!1034601))

(assert (= (and b!1034596 ((_ is ValueCellFull!11546) mapDefault!38225)) b!1034602))

(assert (= b!1034599 b!1034596))

(assert (= start!90494 b!1034599))

(declare-fun m!954781 () Bool)

(assert (=> b!1034599 m!954781))

(declare-fun m!954783 () Bool)

(assert (=> b!1034599 m!954783))

(declare-fun m!954785 () Bool)

(assert (=> b!1034600 m!954785))

(declare-fun m!954787 () Bool)

(assert (=> mapNonEmpty!38225 m!954787))

(declare-fun m!954789 () Bool)

(assert (=> start!90494 m!954789))

(check-sat (not b_next!20779) (not mapNonEmpty!38225) tp_is_empty!24499 (not b!1034599) b_and!33257 (not b!1034600) (not start!90494))
(check-sat b_and!33257 (not b_next!20779))
