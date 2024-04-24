; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!90750 () Bool)

(assert start!90750)

(declare-fun b!1036721 () Bool)

(declare-fun b_free!20839 () Bool)

(declare-fun b_next!20839 () Bool)

(assert (=> b!1036721 (= b_free!20839 (not b_next!20839))))

(declare-fun tp!73645 () Bool)

(declare-fun b_and!33349 () Bool)

(assert (=> b!1036721 (= tp!73645 b_and!33349)))

(declare-fun b!1036715 () Bool)

(declare-fun e!586287 () Bool)

(declare-fun tp_is_empty!24559 () Bool)

(assert (=> b!1036715 (= e!586287 tp_is_empty!24559)))

(declare-fun b!1036716 () Bool)

(declare-fun e!586288 () Bool)

(declare-datatypes ((V!37619 0))(
  ( (V!37620 (val!12330 Int)) )
))
(declare-datatypes ((ValueCell!11576 0))(
  ( (ValueCellFull!11576 (v!14906 V!37619)) (EmptyCell!11576) )
))
(declare-datatypes ((array!65261 0))(
  ( (array!65262 (arr!31411 (Array (_ BitVec 32) (_ BitVec 64))) (size!31940 (_ BitVec 32))) )
))
(declare-datatypes ((array!65263 0))(
  ( (array!65264 (arr!31412 (Array (_ BitVec 32) ValueCell!11576)) (size!31941 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5746 0))(
  ( (LongMapFixedSize!5747 (defaultEntry!6251 Int) (mask!30196 (_ BitVec 32)) (extraKeys!5981 (_ BitVec 32)) (zeroValue!6085 V!37619) (minValue!6087 V!37619) (_size!2928 (_ BitVec 32)) (_keys!11476 array!65261) (_values!6274 array!65263) (_vacant!2928 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5746)

(assert (=> b!1036716 (= e!586288 (and (= (size!31941 (_values!6274 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!30196 thiss!1427))) (= (size!31940 (_keys!11476 thiss!1427)) (size!31941 (_values!6274 thiss!1427))) (bvsge (mask!30196 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5981 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5981 thiss!1427) #b00000000000000000000000000000011) (bvslt (bvand (extraKeys!5981 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1036717 () Bool)

(declare-fun res!691851 () Bool)

(assert (=> b!1036717 (=> (not res!691851) (not e!586288))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1036717 (= res!691851 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1036718 () Bool)

(declare-fun e!586284 () Bool)

(assert (=> b!1036718 (= e!586284 tp_is_empty!24559)))

(declare-fun b!1036719 () Bool)

(declare-fun res!691852 () Bool)

(assert (=> b!1036719 (=> (not res!691852) (not e!586288))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1036719 (= res!691852 (validMask!0 (mask!30196 thiss!1427)))))

(declare-fun b!1036720 () Bool)

(declare-fun e!586285 () Bool)

(declare-fun mapRes!38349 () Bool)

(assert (=> b!1036720 (= e!586285 (and e!586287 mapRes!38349))))

(declare-fun condMapEmpty!38349 () Bool)

(declare-fun mapDefault!38349 () ValueCell!11576)

(assert (=> b!1036720 (= condMapEmpty!38349 (= (arr!31412 (_values!6274 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11576)) mapDefault!38349)))))

(declare-fun mapIsEmpty!38349 () Bool)

(assert (=> mapIsEmpty!38349 mapRes!38349))

(declare-fun res!691853 () Bool)

(assert (=> start!90750 (=> (not res!691853) (not e!586288))))

(declare-fun valid!2176 (LongMapFixedSize!5746) Bool)

(assert (=> start!90750 (= res!691853 (valid!2176 thiss!1427))))

(assert (=> start!90750 e!586288))

(declare-fun e!586286 () Bool)

(assert (=> start!90750 e!586286))

(assert (=> start!90750 true))

(declare-fun mapNonEmpty!38349 () Bool)

(declare-fun tp!73644 () Bool)

(assert (=> mapNonEmpty!38349 (= mapRes!38349 (and tp!73644 e!586284))))

(declare-fun mapValue!38349 () ValueCell!11576)

(declare-fun mapKey!38349 () (_ BitVec 32))

(declare-fun mapRest!38349 () (Array (_ BitVec 32) ValueCell!11576))

(assert (=> mapNonEmpty!38349 (= (arr!31412 (_values!6274 thiss!1427)) (store mapRest!38349 mapKey!38349 mapValue!38349))))

(declare-fun array_inv!24309 (array!65261) Bool)

(declare-fun array_inv!24310 (array!65263) Bool)

(assert (=> b!1036721 (= e!586286 (and tp!73645 tp_is_empty!24559 (array_inv!24309 (_keys!11476 thiss!1427)) (array_inv!24310 (_values!6274 thiss!1427)) e!586285))))

(assert (= (and start!90750 res!691853) b!1036717))

(assert (= (and b!1036717 res!691851) b!1036719))

(assert (= (and b!1036719 res!691852) b!1036716))

(assert (= (and b!1036720 condMapEmpty!38349) mapIsEmpty!38349))

(assert (= (and b!1036720 (not condMapEmpty!38349)) mapNonEmpty!38349))

(get-info :version)

(assert (= (and mapNonEmpty!38349 ((_ is ValueCellFull!11576) mapValue!38349)) b!1036718))

(assert (= (and b!1036720 ((_ is ValueCellFull!11576) mapDefault!38349)) b!1036715))

(assert (= b!1036721 b!1036720))

(assert (= start!90750 b!1036721))

(declare-fun m!957027 () Bool)

(assert (=> b!1036719 m!957027))

(declare-fun m!957029 () Bool)

(assert (=> start!90750 m!957029))

(declare-fun m!957031 () Bool)

(assert (=> mapNonEmpty!38349 m!957031))

(declare-fun m!957033 () Bool)

(assert (=> b!1036721 m!957033))

(declare-fun m!957035 () Bool)

(assert (=> b!1036721 m!957035))

(check-sat (not b!1036721) (not mapNonEmpty!38349) tp_is_empty!24559 (not b_next!20839) b_and!33349 (not b!1036719) (not start!90750))
(check-sat b_and!33349 (not b_next!20839))
