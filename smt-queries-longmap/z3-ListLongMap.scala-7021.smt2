; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89140 () Bool)

(assert start!89140)

(declare-fun b!1021989 () Bool)

(declare-fun b_free!20181 () Bool)

(declare-fun b_next!20181 () Bool)

(assert (=> b!1021989 (= b_free!20181 (not b_next!20181))))

(declare-fun tp!71577 () Bool)

(declare-fun b_and!32379 () Bool)

(assert (=> b!1021989 (= tp!71577 b_and!32379)))

(declare-fun b!1021982 () Bool)

(declare-fun e!575665 () Bool)

(declare-fun tp_is_empty!23901 () Bool)

(assert (=> b!1021982 (= e!575665 tp_is_empty!23901)))

(declare-fun b!1021983 () Bool)

(declare-fun e!575667 () Bool)

(assert (=> b!1021983 (= e!575667 tp_is_empty!23901)))

(declare-fun b!1021984 () Bool)

(declare-fun res!684683 () Bool)

(declare-fun e!575664 () Bool)

(assert (=> b!1021984 (=> (not res!684683) (not e!575664))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021984 (= res!684683 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!37269 () Bool)

(declare-fun mapRes!37269 () Bool)

(assert (=> mapIsEmpty!37269 mapRes!37269))

(declare-fun b!1021985 () Bool)

(assert (=> b!1021985 (= e!575664 false)))

(declare-fun lt!450165 () Bool)

(declare-datatypes ((V!36741 0))(
  ( (V!36742 (val!12001 Int)) )
))
(declare-datatypes ((ValueCell!11247 0))(
  ( (ValueCellFull!11247 (v!14570 V!36741)) (EmptyCell!11247) )
))
(declare-datatypes ((array!63846 0))(
  ( (array!63847 (arr!30735 (Array (_ BitVec 32) (_ BitVec 64))) (size!31246 (_ BitVec 32))) )
))
(declare-datatypes ((array!63848 0))(
  ( (array!63849 (arr!30736 (Array (_ BitVec 32) ValueCell!11247)) (size!31247 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5088 0))(
  ( (LongMapFixedSize!5089 (defaultEntry!5896 Int) (mask!29479 (_ BitVec 32)) (extraKeys!5628 (_ BitVec 32)) (zeroValue!5732 V!36741) (minValue!5732 V!36741) (_size!2599 (_ BitVec 32)) (_keys!11041 array!63846) (_values!5919 array!63848) (_vacant!2599 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5088)

(declare-datatypes ((List!21669 0))(
  ( (Nil!21666) (Cons!21665 (h!22863 (_ BitVec 64)) (t!30683 List!21669)) )
))
(declare-fun arrayNoDuplicates!0 (array!63846 (_ BitVec 32) List!21669) Bool)

(assert (=> b!1021985 (= lt!450165 (arrayNoDuplicates!0 (_keys!11041 thiss!1427) #b00000000000000000000000000000000 Nil!21666))))

(declare-fun res!684684 () Bool)

(assert (=> start!89140 (=> (not res!684684) (not e!575664))))

(declare-fun valid!1940 (LongMapFixedSize!5088) Bool)

(assert (=> start!89140 (= res!684684 (valid!1940 thiss!1427))))

(assert (=> start!89140 e!575664))

(declare-fun e!575663 () Bool)

(assert (=> start!89140 e!575663))

(assert (=> start!89140 true))

(declare-fun b!1021986 () Bool)

(declare-fun res!684685 () Bool)

(assert (=> b!1021986 (=> (not res!684685) (not e!575664))))

(assert (=> b!1021986 (= res!684685 (and (= (size!31247 (_values!5919 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29479 thiss!1427))) (= (size!31246 (_keys!11041 thiss!1427)) (size!31247 (_values!5919 thiss!1427))) (bvsge (mask!29479 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5628 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5628 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5628 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5628 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5628 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5628 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5628 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1021987 () Bool)

(declare-fun e!575662 () Bool)

(assert (=> b!1021987 (= e!575662 (and e!575665 mapRes!37269))))

(declare-fun condMapEmpty!37269 () Bool)

(declare-fun mapDefault!37269 () ValueCell!11247)

(assert (=> b!1021987 (= condMapEmpty!37269 (= (arr!30736 (_values!5919 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11247)) mapDefault!37269)))))

(declare-fun b!1021988 () Bool)

(declare-fun res!684686 () Bool)

(assert (=> b!1021988 (=> (not res!684686) (not e!575664))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021988 (= res!684686 (validMask!0 (mask!29479 thiss!1427)))))

(declare-fun array_inv!23829 (array!63846) Bool)

(declare-fun array_inv!23830 (array!63848) Bool)

(assert (=> b!1021989 (= e!575663 (and tp!71577 tp_is_empty!23901 (array_inv!23829 (_keys!11041 thiss!1427)) (array_inv!23830 (_values!5919 thiss!1427)) e!575662))))

(declare-fun b!1021990 () Bool)

(declare-fun res!684682 () Bool)

(assert (=> b!1021990 (=> (not res!684682) (not e!575664))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63846 (_ BitVec 32)) Bool)

(assert (=> b!1021990 (= res!684682 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11041 thiss!1427) (mask!29479 thiss!1427)))))

(declare-fun mapNonEmpty!37269 () Bool)

(declare-fun tp!71578 () Bool)

(assert (=> mapNonEmpty!37269 (= mapRes!37269 (and tp!71578 e!575667))))

(declare-fun mapValue!37269 () ValueCell!11247)

(declare-fun mapRest!37269 () (Array (_ BitVec 32) ValueCell!11247))

(declare-fun mapKey!37269 () (_ BitVec 32))

(assert (=> mapNonEmpty!37269 (= (arr!30736 (_values!5919 thiss!1427)) (store mapRest!37269 mapKey!37269 mapValue!37269))))

(assert (= (and start!89140 res!684684) b!1021984))

(assert (= (and b!1021984 res!684683) b!1021988))

(assert (= (and b!1021988 res!684686) b!1021986))

(assert (= (and b!1021986 res!684685) b!1021990))

(assert (= (and b!1021990 res!684682) b!1021985))

(assert (= (and b!1021987 condMapEmpty!37269) mapIsEmpty!37269))

(assert (= (and b!1021987 (not condMapEmpty!37269)) mapNonEmpty!37269))

(get-info :version)

(assert (= (and mapNonEmpty!37269 ((_ is ValueCellFull!11247) mapValue!37269)) b!1021983))

(assert (= (and b!1021987 ((_ is ValueCellFull!11247) mapDefault!37269)) b!1021982))

(assert (= b!1021989 b!1021987))

(assert (= start!89140 b!1021989))

(declare-fun m!941251 () Bool)

(assert (=> b!1021990 m!941251))

(declare-fun m!941253 () Bool)

(assert (=> mapNonEmpty!37269 m!941253))

(declare-fun m!941255 () Bool)

(assert (=> b!1021988 m!941255))

(declare-fun m!941257 () Bool)

(assert (=> start!89140 m!941257))

(declare-fun m!941259 () Bool)

(assert (=> b!1021985 m!941259))

(declare-fun m!941261 () Bool)

(assert (=> b!1021989 m!941261))

(declare-fun m!941263 () Bool)

(assert (=> b!1021989 m!941263))

(check-sat tp_is_empty!23901 b_and!32379 (not b!1021988) (not mapNonEmpty!37269) (not start!89140) (not b!1021985) (not b!1021990) (not b!1021989) (not b_next!20181))
(check-sat b_and!32379 (not b_next!20181))
