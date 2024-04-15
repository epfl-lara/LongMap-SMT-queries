; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89336 () Bool)

(assert start!89336)

(declare-fun b!1023997 () Bool)

(declare-fun b_free!20347 () Bool)

(declare-fun b_next!20347 () Bool)

(assert (=> b!1023997 (= b_free!20347 (not b_next!20347))))

(declare-fun tp!72083 () Bool)

(declare-fun b_and!32567 () Bool)

(assert (=> b!1023997 (= tp!72083 b_and!32567)))

(declare-fun e!577152 () Bool)

(declare-datatypes ((V!36963 0))(
  ( (V!36964 (val!12084 Int)) )
))
(declare-datatypes ((ValueCell!11330 0))(
  ( (ValueCellFull!11330 (v!14652 V!36963)) (EmptyCell!11330) )
))
(declare-datatypes ((array!64121 0))(
  ( (array!64122 (arr!30870 (Array (_ BitVec 32) (_ BitVec 64))) (size!31385 (_ BitVec 32))) )
))
(declare-datatypes ((array!64123 0))(
  ( (array!64124 (arr!30871 (Array (_ BitVec 32) ValueCell!11330)) (size!31386 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5254 0))(
  ( (LongMapFixedSize!5255 (defaultEntry!5979 Int) (mask!29617 (_ BitVec 32)) (extraKeys!5711 (_ BitVec 32)) (zeroValue!5815 V!36963) (minValue!5815 V!36963) (_size!2682 (_ BitVec 32)) (_keys!11122 array!64121) (_values!6002 array!64123) (_vacant!2682 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5254)

(declare-fun e!577150 () Bool)

(declare-fun tp_is_empty!24067 () Bool)

(declare-fun array_inv!23931 (array!64121) Bool)

(declare-fun array_inv!23932 (array!64123) Bool)

(assert (=> b!1023997 (= e!577152 (and tp!72083 tp_is_empty!24067 (array_inv!23931 (_keys!11122 thiss!1427)) (array_inv!23932 (_values!6002 thiss!1427)) e!577150))))

(declare-fun mapIsEmpty!37526 () Bool)

(declare-fun mapRes!37526 () Bool)

(assert (=> mapIsEmpty!37526 mapRes!37526))

(declare-fun mapNonEmpty!37526 () Bool)

(declare-fun tp!72084 () Bool)

(declare-fun e!577151 () Bool)

(assert (=> mapNonEmpty!37526 (= mapRes!37526 (and tp!72084 e!577151))))

(declare-fun mapValue!37526 () ValueCell!11330)

(declare-fun mapRest!37526 () (Array (_ BitVec 32) ValueCell!11330))

(declare-fun mapKey!37526 () (_ BitVec 32))

(assert (=> mapNonEmpty!37526 (= (arr!30871 (_values!6002 thiss!1427)) (store mapRest!37526 mapKey!37526 mapValue!37526))))

(declare-fun b!1023998 () Bool)

(declare-fun res!685670 () Bool)

(declare-fun e!577148 () Bool)

(assert (=> b!1023998 (=> (not res!685670) (not e!577148))))

(assert (=> b!1023998 (= res!685670 (= (size!31385 (_keys!11122 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29617 thiss!1427))))))

(declare-fun b!1023999 () Bool)

(assert (=> b!1023999 (= e!577151 tp_is_empty!24067)))

(declare-fun res!685669 () Bool)

(assert (=> start!89336 (=> (not res!685669) (not e!577148))))

(declare-fun valid!1995 (LongMapFixedSize!5254) Bool)

(assert (=> start!89336 (= res!685669 (valid!1995 thiss!1427))))

(assert (=> start!89336 e!577148))

(assert (=> start!89336 e!577152))

(assert (=> start!89336 true))

(declare-fun b!1024000 () Bool)

(declare-fun res!685671 () Bool)

(assert (=> b!1024000 (=> (not res!685671) (not e!577148))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1024000 (= res!685671 (validMask!0 (mask!29617 thiss!1427)))))

(declare-fun b!1024001 () Bool)

(declare-fun res!685672 () Bool)

(assert (=> b!1024001 (=> (not res!685672) (not e!577148))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1024001 (= res!685672 (not (= key!909 (bvneg key!909))))))

(declare-fun b!1024002 () Bool)

(declare-fun e!577149 () Bool)

(assert (=> b!1024002 (= e!577149 tp_is_empty!24067)))

(declare-fun b!1024003 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1024003 (= e!577148 (not (validKeyInArray!0 key!909)))))

(declare-fun b!1024004 () Bool)

(assert (=> b!1024004 (= e!577150 (and e!577149 mapRes!37526))))

(declare-fun condMapEmpty!37526 () Bool)

(declare-fun mapDefault!37526 () ValueCell!11330)

(assert (=> b!1024004 (= condMapEmpty!37526 (= (arr!30871 (_values!6002 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11330)) mapDefault!37526)))))

(assert (= (and start!89336 res!685669) b!1024001))

(assert (= (and b!1024001 res!685672) b!1024000))

(assert (= (and b!1024000 res!685671) b!1023998))

(assert (= (and b!1023998 res!685670) b!1024003))

(assert (= (and b!1024004 condMapEmpty!37526) mapIsEmpty!37526))

(assert (= (and b!1024004 (not condMapEmpty!37526)) mapNonEmpty!37526))

(get-info :version)

(assert (= (and mapNonEmpty!37526 ((_ is ValueCellFull!11330) mapValue!37526)) b!1023999))

(assert (= (and b!1024004 ((_ is ValueCellFull!11330) mapDefault!37526)) b!1024002))

(assert (= b!1023997 b!1024004))

(assert (= start!89336 b!1023997))

(declare-fun m!941977 () Bool)

(assert (=> b!1023997 m!941977))

(declare-fun m!941979 () Bool)

(assert (=> b!1023997 m!941979))

(declare-fun m!941981 () Bool)

(assert (=> b!1024003 m!941981))

(declare-fun m!941983 () Bool)

(assert (=> start!89336 m!941983))

(declare-fun m!941985 () Bool)

(assert (=> mapNonEmpty!37526 m!941985))

(declare-fun m!941987 () Bool)

(assert (=> b!1024000 m!941987))

(check-sat (not start!89336) (not b_next!20347) (not mapNonEmpty!37526) (not b!1024000) (not b!1023997) b_and!32567 tp_is_empty!24067 (not b!1024003))
(check-sat b_and!32567 (not b_next!20347))
(get-model)

(declare-fun d!122473 () Bool)

(assert (=> d!122473 (= (validKeyInArray!0 key!909) (and (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!909 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!1024003 d!122473))

(declare-fun d!122475 () Bool)

(declare-fun res!685703 () Bool)

(declare-fun e!577191 () Bool)

(assert (=> d!122475 (=> (not res!685703) (not e!577191))))

(declare-fun simpleValid!389 (LongMapFixedSize!5254) Bool)

(assert (=> d!122475 (= res!685703 (simpleValid!389 thiss!1427))))

(assert (=> d!122475 (= (valid!1995 thiss!1427) e!577191)))

(declare-fun b!1024059 () Bool)

(declare-fun res!685704 () Bool)

(assert (=> b!1024059 (=> (not res!685704) (not e!577191))))

(declare-fun arrayCountValidKeys!0 (array!64121 (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!1024059 (= res!685704 (= (arrayCountValidKeys!0 (_keys!11122 thiss!1427) #b00000000000000000000000000000000 (size!31385 (_keys!11122 thiss!1427))) (_size!2682 thiss!1427)))))

(declare-fun b!1024060 () Bool)

(declare-fun res!685705 () Bool)

(assert (=> b!1024060 (=> (not res!685705) (not e!577191))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64121 (_ BitVec 32)) Bool)

(assert (=> b!1024060 (= res!685705 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11122 thiss!1427) (mask!29617 thiss!1427)))))

(declare-fun b!1024061 () Bool)

(declare-datatypes ((List!21756 0))(
  ( (Nil!21753) (Cons!21752 (h!22950 (_ BitVec 64)) (t!30809 List!21756)) )
))
(declare-fun arrayNoDuplicates!0 (array!64121 (_ BitVec 32) List!21756) Bool)

(assert (=> b!1024061 (= e!577191 (arrayNoDuplicates!0 (_keys!11122 thiss!1427) #b00000000000000000000000000000000 Nil!21753))))

(assert (= (and d!122475 res!685703) b!1024059))

(assert (= (and b!1024059 res!685704) b!1024060))

(assert (= (and b!1024060 res!685705) b!1024061))

(declare-fun m!942013 () Bool)

(assert (=> d!122475 m!942013))

(declare-fun m!942015 () Bool)

(assert (=> b!1024059 m!942015))

(declare-fun m!942017 () Bool)

(assert (=> b!1024060 m!942017))

(declare-fun m!942019 () Bool)

(assert (=> b!1024061 m!942019))

(assert (=> start!89336 d!122475))

(declare-fun d!122477 () Bool)

(assert (=> d!122477 (= (array_inv!23931 (_keys!11122 thiss!1427)) (bvsge (size!31385 (_keys!11122 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1023997 d!122477))

(declare-fun d!122479 () Bool)

(assert (=> d!122479 (= (array_inv!23932 (_values!6002 thiss!1427)) (bvsge (size!31386 (_values!6002 thiss!1427)) #b00000000000000000000000000000000))))

(assert (=> b!1023997 d!122479))

(declare-fun d!122481 () Bool)

(assert (=> d!122481 (= (validMask!0 (mask!29617 thiss!1427)) (and (or (= (mask!29617 thiss!1427) #b00000000000000000000000000000111) (= (mask!29617 thiss!1427) #b00000000000000000000000000001111) (= (mask!29617 thiss!1427) #b00000000000000000000000000011111) (= (mask!29617 thiss!1427) #b00000000000000000000000000111111) (= (mask!29617 thiss!1427) #b00000000000000000000000001111111) (= (mask!29617 thiss!1427) #b00000000000000000000000011111111) (= (mask!29617 thiss!1427) #b00000000000000000000000111111111) (= (mask!29617 thiss!1427) #b00000000000000000000001111111111) (= (mask!29617 thiss!1427) #b00000000000000000000011111111111) (= (mask!29617 thiss!1427) #b00000000000000000000111111111111) (= (mask!29617 thiss!1427) #b00000000000000000001111111111111) (= (mask!29617 thiss!1427) #b00000000000000000011111111111111) (= (mask!29617 thiss!1427) #b00000000000000000111111111111111) (= (mask!29617 thiss!1427) #b00000000000000001111111111111111) (= (mask!29617 thiss!1427) #b00000000000000011111111111111111) (= (mask!29617 thiss!1427) #b00000000000000111111111111111111) (= (mask!29617 thiss!1427) #b00000000000001111111111111111111) (= (mask!29617 thiss!1427) #b00000000000011111111111111111111) (= (mask!29617 thiss!1427) #b00000000000111111111111111111111) (= (mask!29617 thiss!1427) #b00000000001111111111111111111111) (= (mask!29617 thiss!1427) #b00000000011111111111111111111111) (= (mask!29617 thiss!1427) #b00000000111111111111111111111111) (= (mask!29617 thiss!1427) #b00000001111111111111111111111111) (= (mask!29617 thiss!1427) #b00000011111111111111111111111111) (= (mask!29617 thiss!1427) #b00000111111111111111111111111111) (= (mask!29617 thiss!1427) #b00001111111111111111111111111111) (= (mask!29617 thiss!1427) #b00011111111111111111111111111111) (= (mask!29617 thiss!1427) #b00111111111111111111111111111111)) (bvsle (mask!29617 thiss!1427) #b00111111111111111111111111111111)))))

(assert (=> b!1024000 d!122481))

(declare-fun condMapEmpty!37535 () Bool)

(declare-fun mapDefault!37535 () ValueCell!11330)

(assert (=> mapNonEmpty!37526 (= condMapEmpty!37535 (= mapRest!37526 ((as const (Array (_ BitVec 32) ValueCell!11330)) mapDefault!37535)))))

(declare-fun e!577196 () Bool)

(declare-fun mapRes!37535 () Bool)

(assert (=> mapNonEmpty!37526 (= tp!72084 (and e!577196 mapRes!37535))))

(declare-fun mapIsEmpty!37535 () Bool)

(assert (=> mapIsEmpty!37535 mapRes!37535))

(declare-fun b!1024068 () Bool)

(declare-fun e!577197 () Bool)

(assert (=> b!1024068 (= e!577197 tp_is_empty!24067)))

(declare-fun b!1024069 () Bool)

(assert (=> b!1024069 (= e!577196 tp_is_empty!24067)))

(declare-fun mapNonEmpty!37535 () Bool)

(declare-fun tp!72099 () Bool)

(assert (=> mapNonEmpty!37535 (= mapRes!37535 (and tp!72099 e!577197))))

(declare-fun mapRest!37535 () (Array (_ BitVec 32) ValueCell!11330))

(declare-fun mapValue!37535 () ValueCell!11330)

(declare-fun mapKey!37535 () (_ BitVec 32))

(assert (=> mapNonEmpty!37535 (= mapRest!37526 (store mapRest!37535 mapKey!37535 mapValue!37535))))

(assert (= (and mapNonEmpty!37526 condMapEmpty!37535) mapIsEmpty!37535))

(assert (= (and mapNonEmpty!37526 (not condMapEmpty!37535)) mapNonEmpty!37535))

(assert (= (and mapNonEmpty!37535 ((_ is ValueCellFull!11330) mapValue!37535)) b!1024068))

(assert (= (and mapNonEmpty!37526 ((_ is ValueCellFull!11330) mapDefault!37535)) b!1024069))

(declare-fun m!942021 () Bool)

(assert (=> mapNonEmpty!37535 m!942021))

(check-sat (not b!1024059) (not b_next!20347) (not b!1024060) (not d!122475) b_and!32567 (not mapNonEmpty!37535) (not b!1024061) tp_is_empty!24067)
(check-sat b_and!32567 (not b_next!20347))
