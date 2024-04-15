; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89202 () Bool)

(assert start!89202)

(declare-fun b!1022616 () Bool)

(declare-fun b_free!20245 () Bool)

(declare-fun b_next!20245 () Bool)

(assert (=> b!1022616 (= b_free!20245 (not b_next!20245))))

(declare-fun tp!71770 () Bool)

(declare-fun b_and!32441 () Bool)

(assert (=> b!1022616 (= tp!71770 b_and!32441)))

(declare-fun mapNonEmpty!37365 () Bool)

(declare-fun mapRes!37365 () Bool)

(declare-fun tp!71769 () Bool)

(declare-fun e!576148 () Bool)

(assert (=> mapNonEmpty!37365 (= mapRes!37365 (and tp!71769 e!576148))))

(declare-datatypes ((V!36827 0))(
  ( (V!36828 (val!12033 Int)) )
))
(declare-datatypes ((ValueCell!11279 0))(
  ( (ValueCellFull!11279 (v!14601 V!36827)) (EmptyCell!11279) )
))
(declare-fun mapValue!37365 () ValueCell!11279)

(declare-fun mapKey!37365 () (_ BitVec 32))

(declare-fun mapRest!37365 () (Array (_ BitVec 32) ValueCell!11279))

(declare-datatypes ((array!63913 0))(
  ( (array!63914 (arr!30768 (Array (_ BitVec 32) (_ BitVec 64))) (size!31281 (_ BitVec 32))) )
))
(declare-datatypes ((array!63915 0))(
  ( (array!63916 (arr!30769 (Array (_ BitVec 32) ValueCell!11279)) (size!31282 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5152 0))(
  ( (LongMapFixedSize!5153 (defaultEntry!5928 Int) (mask!29528 (_ BitVec 32)) (extraKeys!5660 (_ BitVec 32)) (zeroValue!5764 V!36827) (minValue!5764 V!36827) (_size!2631 (_ BitVec 32)) (_keys!11069 array!63913) (_values!5951 array!63915) (_vacant!2631 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5152)

(assert (=> mapNonEmpty!37365 (= (arr!30769 (_values!5951 thiss!1427)) (store mapRest!37365 mapKey!37365 mapValue!37365))))

(declare-fun b!1022611 () Bool)

(declare-fun res!684988 () Bool)

(declare-fun e!576152 () Bool)

(assert (=> b!1022611 (=> (not res!684988) (not e!576152))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022611 (= res!684988 (validMask!0 (mask!29528 thiss!1427)))))

(declare-fun b!1022612 () Bool)

(assert (=> b!1022612 (= e!576152 false)))

(declare-fun lt!450133 () Bool)

(declare-datatypes ((List!21725 0))(
  ( (Nil!21722) (Cons!21721 (h!22919 (_ BitVec 64)) (t!30754 List!21725)) )
))
(declare-fun arrayNoDuplicates!0 (array!63913 (_ BitVec 32) List!21725) Bool)

(assert (=> b!1022612 (= lt!450133 (arrayNoDuplicates!0 (_keys!11069 thiss!1427) #b00000000000000000000000000000000 Nil!21722))))

(declare-fun b!1022613 () Bool)

(declare-fun res!684990 () Bool)

(assert (=> b!1022613 (=> (not res!684990) (not e!576152))))

(assert (=> b!1022613 (= res!684990 (and (= (size!31282 (_values!5951 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29528 thiss!1427))) (= (size!31281 (_keys!11069 thiss!1427)) (size!31282 (_values!5951 thiss!1427))) (bvsge (mask!29528 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5660 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5660 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5660 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5660 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5660 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5660 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5660 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1022614 () Bool)

(declare-fun res!684987 () Bool)

(assert (=> b!1022614 (=> (not res!684987) (not e!576152))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63913 (_ BitVec 32)) Bool)

(assert (=> b!1022614 (= res!684987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11069 thiss!1427) (mask!29528 thiss!1427)))))

(declare-fun b!1022615 () Bool)

(declare-fun tp_is_empty!23965 () Bool)

(assert (=> b!1022615 (= e!576148 tp_is_empty!23965)))

(declare-fun e!576149 () Bool)

(declare-fun e!576151 () Bool)

(declare-fun array_inv!23865 (array!63913) Bool)

(declare-fun array_inv!23866 (array!63915) Bool)

(assert (=> b!1022616 (= e!576149 (and tp!71770 tp_is_empty!23965 (array_inv!23865 (_keys!11069 thiss!1427)) (array_inv!23866 (_values!5951 thiss!1427)) e!576151))))

(declare-fun b!1022617 () Bool)

(declare-fun e!576150 () Bool)

(assert (=> b!1022617 (= e!576150 tp_is_empty!23965)))

(declare-fun b!1022618 () Bool)

(declare-fun res!684989 () Bool)

(assert (=> b!1022618 (=> (not res!684989) (not e!576152))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022618 (= res!684989 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1022619 () Bool)

(assert (=> b!1022619 (= e!576151 (and e!576150 mapRes!37365))))

(declare-fun condMapEmpty!37365 () Bool)

(declare-fun mapDefault!37365 () ValueCell!11279)

(assert (=> b!1022619 (= condMapEmpty!37365 (= (arr!30769 (_values!5951 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11279)) mapDefault!37365)))))

(declare-fun mapIsEmpty!37365 () Bool)

(assert (=> mapIsEmpty!37365 mapRes!37365))

(declare-fun res!684991 () Bool)

(assert (=> start!89202 (=> (not res!684991) (not e!576152))))

(declare-fun valid!1963 (LongMapFixedSize!5152) Bool)

(assert (=> start!89202 (= res!684991 (valid!1963 thiss!1427))))

(assert (=> start!89202 e!576152))

(assert (=> start!89202 e!576149))

(assert (=> start!89202 true))

(assert (= (and start!89202 res!684991) b!1022618))

(assert (= (and b!1022618 res!684989) b!1022611))

(assert (= (and b!1022611 res!684988) b!1022613))

(assert (= (and b!1022613 res!684990) b!1022614))

(assert (= (and b!1022614 res!684987) b!1022612))

(assert (= (and b!1022619 condMapEmpty!37365) mapIsEmpty!37365))

(assert (= (and b!1022619 (not condMapEmpty!37365)) mapNonEmpty!37365))

(get-info :version)

(assert (= (and mapNonEmpty!37365 ((_ is ValueCellFull!11279) mapValue!37365)) b!1022615))

(assert (= (and b!1022619 ((_ is ValueCellFull!11279) mapDefault!37365)) b!1022617))

(assert (= b!1022616 b!1022619))

(assert (= start!89202 b!1022616))

(declare-fun m!941151 () Bool)

(assert (=> b!1022616 m!941151))

(declare-fun m!941153 () Bool)

(assert (=> b!1022616 m!941153))

(declare-fun m!941155 () Bool)

(assert (=> b!1022612 m!941155))

(declare-fun m!941157 () Bool)

(assert (=> b!1022614 m!941157))

(declare-fun m!941159 () Bool)

(assert (=> start!89202 m!941159))

(declare-fun m!941161 () Bool)

(assert (=> mapNonEmpty!37365 m!941161))

(declare-fun m!941163 () Bool)

(assert (=> b!1022611 m!941163))

(check-sat (not start!89202) (not b!1022616) (not mapNonEmpty!37365) tp_is_empty!23965 (not b!1022614) b_and!32441 (not b_next!20245) (not b!1022612) (not b!1022611))
(check-sat b_and!32441 (not b_next!20245))
