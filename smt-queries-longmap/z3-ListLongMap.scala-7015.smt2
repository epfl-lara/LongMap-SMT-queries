; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89336 () Bool)

(assert start!89336)

(declare-fun b!1022788 () Bool)

(declare-fun b_free!20143 () Bool)

(declare-fun b_next!20143 () Bool)

(assert (=> b!1022788 (= b_free!20143 (not b_next!20143))))

(declare-fun tp!71464 () Bool)

(declare-fun b_and!32351 () Bool)

(assert (=> b!1022788 (= tp!71464 b_and!32351)))

(declare-fun res!684911 () Bool)

(declare-fun e!576164 () Bool)

(assert (=> start!89336 (=> (not res!684911) (not e!576164))))

(declare-datatypes ((V!36691 0))(
  ( (V!36692 (val!11982 Int)) )
))
(declare-datatypes ((ValueCell!11228 0))(
  ( (ValueCellFull!11228 (v!14547 V!36691)) (EmptyCell!11228) )
))
(declare-datatypes ((array!63819 0))(
  ( (array!63820 (arr!30715 (Array (_ BitVec 32) (_ BitVec 64))) (size!31227 (_ BitVec 32))) )
))
(declare-datatypes ((array!63821 0))(
  ( (array!63822 (arr!30716 (Array (_ BitVec 32) ValueCell!11228)) (size!31228 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5050 0))(
  ( (LongMapFixedSize!5051 (defaultEntry!5877 Int) (mask!29508 (_ BitVec 32)) (extraKeys!5609 (_ BitVec 32)) (zeroValue!5713 V!36691) (minValue!5713 V!36691) (_size!2580 (_ BitVec 32)) (_keys!11060 array!63819) (_values!5900 array!63821) (_vacant!2580 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5050)

(declare-fun valid!1930 (LongMapFixedSize!5050) Bool)

(assert (=> start!89336 (= res!684911 (valid!1930 thiss!1427))))

(assert (=> start!89336 e!576164))

(declare-fun e!576165 () Bool)

(assert (=> start!89336 e!576165))

(assert (=> start!89336 true))

(declare-fun b!1022784 () Bool)

(declare-fun e!576167 () Bool)

(declare-fun tp_is_empty!23863 () Bool)

(assert (=> b!1022784 (= e!576167 tp_is_empty!23863)))

(declare-fun b!1022785 () Bool)

(declare-fun res!684909 () Bool)

(assert (=> b!1022785 (=> (not res!684909) (not e!576164))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022785 (= res!684909 (validMask!0 (mask!29508 thiss!1427)))))

(declare-fun b!1022786 () Bool)

(declare-fun res!684907 () Bool)

(assert (=> b!1022786 (=> (not res!684907) (not e!576164))))

(assert (=> b!1022786 (= res!684907 (and (= (size!31228 (_values!5900 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29508 thiss!1427))) (= (size!31227 (_keys!11060 thiss!1427)) (size!31228 (_values!5900 thiss!1427))) (bvsge (mask!29508 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5609 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5609 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5609 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1022787 () Bool)

(declare-fun e!576166 () Bool)

(declare-fun mapRes!37212 () Bool)

(assert (=> b!1022787 (= e!576166 (and e!576167 mapRes!37212))))

(declare-fun condMapEmpty!37212 () Bool)

(declare-fun mapDefault!37212 () ValueCell!11228)

(assert (=> b!1022787 (= condMapEmpty!37212 (= (arr!30716 (_values!5900 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11228)) mapDefault!37212)))))

(declare-fun array_inv!23837 (array!63819) Bool)

(declare-fun array_inv!23838 (array!63821) Bool)

(assert (=> b!1022788 (= e!576165 (and tp!71464 tp_is_empty!23863 (array_inv!23837 (_keys!11060 thiss!1427)) (array_inv!23838 (_values!5900 thiss!1427)) e!576166))))

(declare-fun b!1022789 () Bool)

(declare-fun res!684908 () Bool)

(assert (=> b!1022789 (=> (not res!684908) (not e!576164))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022789 (= res!684908 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37212 () Bool)

(declare-fun tp!71463 () Bool)

(declare-fun e!576168 () Bool)

(assert (=> mapNonEmpty!37212 (= mapRes!37212 (and tp!71463 e!576168))))

(declare-fun mapKey!37212 () (_ BitVec 32))

(declare-fun mapValue!37212 () ValueCell!11228)

(declare-fun mapRest!37212 () (Array (_ BitVec 32) ValueCell!11228))

(assert (=> mapNonEmpty!37212 (= (arr!30716 (_values!5900 thiss!1427)) (store mapRest!37212 mapKey!37212 mapValue!37212))))

(declare-fun b!1022790 () Bool)

(assert (=> b!1022790 (= e!576168 tp_is_empty!23863)))

(declare-fun mapIsEmpty!37212 () Bool)

(assert (=> mapIsEmpty!37212 mapRes!37212))

(declare-fun b!1022791 () Bool)

(assert (=> b!1022791 (= e!576164 false)))

(declare-fun lt!450623 () Bool)

(declare-datatypes ((List!21643 0))(
  ( (Nil!21640) (Cons!21639 (h!22846 (_ BitVec 64)) (t!30649 List!21643)) )
))
(declare-fun arrayNoDuplicates!0 (array!63819 (_ BitVec 32) List!21643) Bool)

(assert (=> b!1022791 (= lt!450623 (arrayNoDuplicates!0 (_keys!11060 thiss!1427) #b00000000000000000000000000000000 Nil!21640))))

(declare-fun b!1022792 () Bool)

(declare-fun res!684910 () Bool)

(assert (=> b!1022792 (=> (not res!684910) (not e!576164))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63819 (_ BitVec 32)) Bool)

(assert (=> b!1022792 (= res!684910 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11060 thiss!1427) (mask!29508 thiss!1427)))))

(assert (= (and start!89336 res!684911) b!1022789))

(assert (= (and b!1022789 res!684908) b!1022785))

(assert (= (and b!1022785 res!684909) b!1022786))

(assert (= (and b!1022786 res!684907) b!1022792))

(assert (= (and b!1022792 res!684910) b!1022791))

(assert (= (and b!1022787 condMapEmpty!37212) mapIsEmpty!37212))

(assert (= (and b!1022787 (not condMapEmpty!37212)) mapNonEmpty!37212))

(get-info :version)

(assert (= (and mapNonEmpty!37212 ((_ is ValueCellFull!11228) mapValue!37212)) b!1022790))

(assert (= (and b!1022787 ((_ is ValueCellFull!11228) mapDefault!37212)) b!1022784))

(assert (= b!1022788 b!1022787))

(assert (= start!89336 b!1022788))

(declare-fun m!942649 () Bool)

(assert (=> b!1022788 m!942649))

(declare-fun m!942651 () Bool)

(assert (=> b!1022788 m!942651))

(declare-fun m!942653 () Bool)

(assert (=> start!89336 m!942653))

(declare-fun m!942655 () Bool)

(assert (=> mapNonEmpty!37212 m!942655))

(declare-fun m!942657 () Bool)

(assert (=> b!1022785 m!942657))

(declare-fun m!942659 () Bool)

(assert (=> b!1022792 m!942659))

(declare-fun m!942661 () Bool)

(assert (=> b!1022791 m!942661))

(check-sat (not mapNonEmpty!37212) tp_is_empty!23863 (not b!1022785) (not b_next!20143) (not start!89336) (not b!1022788) (not b!1022792) b_and!32351 (not b!1022791))
(check-sat b_and!32351 (not b_next!20143))
