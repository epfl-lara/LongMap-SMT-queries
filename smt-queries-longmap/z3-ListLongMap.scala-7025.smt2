; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89396 () Bool)

(assert start!89396)

(declare-fun b!1023600 () Bool)

(declare-fun b_free!20203 () Bool)

(declare-fun b_next!20203 () Bool)

(assert (=> b!1023600 (= b_free!20203 (not b_next!20203))))

(declare-fun tp!71644 () Bool)

(declare-fun b_and!32411 () Bool)

(assert (=> b!1023600 (= tp!71644 b_and!32411)))

(declare-fun b!1023594 () Bool)

(declare-fun res!685358 () Bool)

(declare-fun e!576708 () Bool)

(assert (=> b!1023594 (=> (not res!685358) (not e!576708))))

(declare-datatypes ((V!36771 0))(
  ( (V!36772 (val!12012 Int)) )
))
(declare-datatypes ((ValueCell!11258 0))(
  ( (ValueCellFull!11258 (v!14577 V!36771)) (EmptyCell!11258) )
))
(declare-datatypes ((array!63939 0))(
  ( (array!63940 (arr!30775 (Array (_ BitVec 32) (_ BitVec 64))) (size!31287 (_ BitVec 32))) )
))
(declare-datatypes ((array!63941 0))(
  ( (array!63942 (arr!30776 (Array (_ BitVec 32) ValueCell!11258)) (size!31288 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5110 0))(
  ( (LongMapFixedSize!5111 (defaultEntry!5907 Int) (mask!29558 (_ BitVec 32)) (extraKeys!5639 (_ BitVec 32)) (zeroValue!5743 V!36771) (minValue!5743 V!36771) (_size!2610 (_ BitVec 32)) (_keys!11090 array!63939) (_values!5930 array!63941) (_vacant!2610 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5110)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63939 (_ BitVec 32)) Bool)

(assert (=> b!1023594 (= res!685358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11090 thiss!1427) (mask!29558 thiss!1427)))))

(declare-fun b!1023595 () Bool)

(declare-fun res!685357 () Bool)

(assert (=> b!1023595 (=> (not res!685357) (not e!576708))))

(assert (=> b!1023595 (= res!685357 (and (= (size!31288 (_values!5930 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29558 thiss!1427))) (= (size!31287 (_keys!11090 thiss!1427)) (size!31288 (_values!5930 thiss!1427))) (bvsge (mask!29558 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5639 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5639 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5639 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1023596 () Bool)

(declare-fun res!685359 () Bool)

(assert (=> b!1023596 (=> (not res!685359) (not e!576708))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023596 (= res!685359 (validMask!0 (mask!29558 thiss!1427)))))

(declare-fun b!1023597 () Bool)

(declare-fun res!685361 () Bool)

(assert (=> b!1023597 (=> (not res!685361) (not e!576708))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023597 (= res!685361 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1023598 () Bool)

(declare-fun e!576706 () Bool)

(declare-fun tp_is_empty!23923 () Bool)

(assert (=> b!1023598 (= e!576706 tp_is_empty!23923)))

(declare-fun mapIsEmpty!37302 () Bool)

(declare-fun mapRes!37302 () Bool)

(assert (=> mapIsEmpty!37302 mapRes!37302))

(declare-fun b!1023599 () Bool)

(declare-fun e!576703 () Bool)

(assert (=> b!1023599 (= e!576703 (and e!576706 mapRes!37302))))

(declare-fun condMapEmpty!37302 () Bool)

(declare-fun mapDefault!37302 () ValueCell!11258)

(assert (=> b!1023599 (= condMapEmpty!37302 (= (arr!30776 (_values!5930 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11258)) mapDefault!37302)))))

(declare-fun mapNonEmpty!37302 () Bool)

(declare-fun tp!71643 () Bool)

(declare-fun e!576707 () Bool)

(assert (=> mapNonEmpty!37302 (= mapRes!37302 (and tp!71643 e!576707))))

(declare-fun mapRest!37302 () (Array (_ BitVec 32) ValueCell!11258))

(declare-fun mapKey!37302 () (_ BitVec 32))

(declare-fun mapValue!37302 () ValueCell!11258)

(assert (=> mapNonEmpty!37302 (= (arr!30776 (_values!5930 thiss!1427)) (store mapRest!37302 mapKey!37302 mapValue!37302))))

(declare-fun b!1023601 () Bool)

(assert (=> b!1023601 (= e!576707 tp_is_empty!23923)))

(declare-fun b!1023602 () Bool)

(assert (=> b!1023602 (= e!576708 false)))

(declare-fun lt!450713 () Bool)

(declare-datatypes ((List!21664 0))(
  ( (Nil!21661) (Cons!21660 (h!22867 (_ BitVec 64)) (t!30670 List!21664)) )
))
(declare-fun arrayNoDuplicates!0 (array!63939 (_ BitVec 32) List!21664) Bool)

(assert (=> b!1023602 (= lt!450713 (arrayNoDuplicates!0 (_keys!11090 thiss!1427) #b00000000000000000000000000000000 Nil!21661))))

(declare-fun res!685360 () Bool)

(assert (=> start!89396 (=> (not res!685360) (not e!576708))))

(declare-fun valid!1951 (LongMapFixedSize!5110) Bool)

(assert (=> start!89396 (= res!685360 (valid!1951 thiss!1427))))

(assert (=> start!89396 e!576708))

(declare-fun e!576704 () Bool)

(assert (=> start!89396 e!576704))

(assert (=> start!89396 true))

(declare-fun array_inv!23869 (array!63939) Bool)

(declare-fun array_inv!23870 (array!63941) Bool)

(assert (=> b!1023600 (= e!576704 (and tp!71644 tp_is_empty!23923 (array_inv!23869 (_keys!11090 thiss!1427)) (array_inv!23870 (_values!5930 thiss!1427)) e!576703))))

(assert (= (and start!89396 res!685360) b!1023597))

(assert (= (and b!1023597 res!685361) b!1023596))

(assert (= (and b!1023596 res!685359) b!1023595))

(assert (= (and b!1023595 res!685357) b!1023594))

(assert (= (and b!1023594 res!685358) b!1023602))

(assert (= (and b!1023599 condMapEmpty!37302) mapIsEmpty!37302))

(assert (= (and b!1023599 (not condMapEmpty!37302)) mapNonEmpty!37302))

(get-info :version)

(assert (= (and mapNonEmpty!37302 ((_ is ValueCellFull!11258) mapValue!37302)) b!1023601))

(assert (= (and b!1023599 ((_ is ValueCellFull!11258) mapDefault!37302)) b!1023598))

(assert (= b!1023600 b!1023599))

(assert (= start!89396 b!1023600))

(declare-fun m!943069 () Bool)

(assert (=> b!1023602 m!943069))

(declare-fun m!943071 () Bool)

(assert (=> b!1023600 m!943071))

(declare-fun m!943073 () Bool)

(assert (=> b!1023600 m!943073))

(declare-fun m!943075 () Bool)

(assert (=> mapNonEmpty!37302 m!943075))

(declare-fun m!943077 () Bool)

(assert (=> b!1023596 m!943077))

(declare-fun m!943079 () Bool)

(assert (=> start!89396 m!943079))

(declare-fun m!943081 () Bool)

(assert (=> b!1023594 m!943081))

(check-sat (not start!89396) (not b!1023600) (not b!1023596) (not b!1023594) (not mapNonEmpty!37302) (not b!1023602) b_and!32411 (not b_next!20203) tp_is_empty!23923)
(check-sat b_and!32411 (not b_next!20203))
