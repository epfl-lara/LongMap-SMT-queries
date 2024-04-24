; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89360 () Bool)

(assert start!89360)

(declare-fun b!1023115 () Bool)

(declare-fun b_free!20167 () Bool)

(declare-fun b_next!20167 () Bool)

(assert (=> b!1023115 (= b_free!20167 (not b_next!20167))))

(declare-fun tp!71535 () Bool)

(declare-fun b_and!32375 () Bool)

(assert (=> b!1023115 (= tp!71535 b_and!32375)))

(declare-fun b!1023108 () Bool)

(declare-fun e!576382 () Bool)

(declare-fun e!576380 () Bool)

(declare-fun mapRes!37248 () Bool)

(assert (=> b!1023108 (= e!576382 (and e!576380 mapRes!37248))))

(declare-fun condMapEmpty!37248 () Bool)

(declare-datatypes ((V!36723 0))(
  ( (V!36724 (val!11994 Int)) )
))
(declare-datatypes ((ValueCell!11240 0))(
  ( (ValueCellFull!11240 (v!14559 V!36723)) (EmptyCell!11240) )
))
(declare-datatypes ((array!63867 0))(
  ( (array!63868 (arr!30739 (Array (_ BitVec 32) (_ BitVec 64))) (size!31251 (_ BitVec 32))) )
))
(declare-datatypes ((array!63869 0))(
  ( (array!63870 (arr!30740 (Array (_ BitVec 32) ValueCell!11240)) (size!31252 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5074 0))(
  ( (LongMapFixedSize!5075 (defaultEntry!5889 Int) (mask!29528 (_ BitVec 32)) (extraKeys!5621 (_ BitVec 32)) (zeroValue!5725 V!36723) (minValue!5725 V!36723) (_size!2592 (_ BitVec 32)) (_keys!11072 array!63867) (_values!5912 array!63869) (_vacant!2592 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5074)

(declare-fun mapDefault!37248 () ValueCell!11240)

(assert (=> b!1023108 (= condMapEmpty!37248 (= (arr!30740 (_values!5912 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11240)) mapDefault!37248)))))

(declare-fun mapNonEmpty!37248 () Bool)

(declare-fun tp!71536 () Bool)

(declare-fun e!576383 () Bool)

(assert (=> mapNonEmpty!37248 (= mapRes!37248 (and tp!71536 e!576383))))

(declare-fun mapKey!37248 () (_ BitVec 32))

(declare-fun mapValue!37248 () ValueCell!11240)

(declare-fun mapRest!37248 () (Array (_ BitVec 32) ValueCell!11240))

(assert (=> mapNonEmpty!37248 (= (arr!30740 (_values!5912 thiss!1427)) (store mapRest!37248 mapKey!37248 mapValue!37248))))

(declare-fun b!1023109 () Bool)

(declare-fun tp_is_empty!23887 () Bool)

(assert (=> b!1023109 (= e!576380 tp_is_empty!23887)))

(declare-fun b!1023110 () Bool)

(declare-fun res!685091 () Bool)

(declare-fun e!576381 () Bool)

(assert (=> b!1023110 (=> (not res!685091) (not e!576381))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023110 (= res!685091 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1023111 () Bool)

(assert (=> b!1023111 (= e!576381 false)))

(declare-fun lt!450659 () Bool)

(declare-datatypes ((List!21653 0))(
  ( (Nil!21650) (Cons!21649 (h!22856 (_ BitVec 64)) (t!30659 List!21653)) )
))
(declare-fun arrayNoDuplicates!0 (array!63867 (_ BitVec 32) List!21653) Bool)

(assert (=> b!1023111 (= lt!450659 (arrayNoDuplicates!0 (_keys!11072 thiss!1427) #b00000000000000000000000000000000 Nil!21650))))

(declare-fun b!1023112 () Bool)

(declare-fun res!685087 () Bool)

(assert (=> b!1023112 (=> (not res!685087) (not e!576381))))

(assert (=> b!1023112 (= res!685087 (and (= (size!31252 (_values!5912 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29528 thiss!1427))) (= (size!31251 (_keys!11072 thiss!1427)) (size!31252 (_values!5912 thiss!1427))) (bvsge (mask!29528 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5621 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5621 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5621 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5621 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5621 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5621 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5621 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1023113 () Bool)

(declare-fun res!685088 () Bool)

(assert (=> b!1023113 (=> (not res!685088) (not e!576381))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63867 (_ BitVec 32)) Bool)

(assert (=> b!1023113 (= res!685088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11072 thiss!1427) (mask!29528 thiss!1427)))))

(declare-fun mapIsEmpty!37248 () Bool)

(assert (=> mapIsEmpty!37248 mapRes!37248))

(declare-fun b!1023114 () Bool)

(declare-fun res!685090 () Bool)

(assert (=> b!1023114 (=> (not res!685090) (not e!576381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023114 (= res!685090 (validMask!0 (mask!29528 thiss!1427)))))

(declare-fun res!685089 () Bool)

(assert (=> start!89360 (=> (not res!685089) (not e!576381))))

(declare-fun valid!1939 (LongMapFixedSize!5074) Bool)

(assert (=> start!89360 (= res!685089 (valid!1939 thiss!1427))))

(assert (=> start!89360 e!576381))

(declare-fun e!576379 () Bool)

(assert (=> start!89360 e!576379))

(assert (=> start!89360 true))

(declare-fun array_inv!23853 (array!63867) Bool)

(declare-fun array_inv!23854 (array!63869) Bool)

(assert (=> b!1023115 (= e!576379 (and tp!71535 tp_is_empty!23887 (array_inv!23853 (_keys!11072 thiss!1427)) (array_inv!23854 (_values!5912 thiss!1427)) e!576382))))

(declare-fun b!1023116 () Bool)

(assert (=> b!1023116 (= e!576383 tp_is_empty!23887)))

(assert (= (and start!89360 res!685089) b!1023110))

(assert (= (and b!1023110 res!685091) b!1023114))

(assert (= (and b!1023114 res!685090) b!1023112))

(assert (= (and b!1023112 res!685087) b!1023113))

(assert (= (and b!1023113 res!685088) b!1023111))

(assert (= (and b!1023108 condMapEmpty!37248) mapIsEmpty!37248))

(assert (= (and b!1023108 (not condMapEmpty!37248)) mapNonEmpty!37248))

(get-info :version)

(assert (= (and mapNonEmpty!37248 ((_ is ValueCellFull!11240) mapValue!37248)) b!1023116))

(assert (= (and b!1023108 ((_ is ValueCellFull!11240) mapDefault!37248)) b!1023109))

(assert (= b!1023115 b!1023108))

(assert (= start!89360 b!1023115))

(declare-fun m!942817 () Bool)

(assert (=> b!1023111 m!942817))

(declare-fun m!942819 () Bool)

(assert (=> start!89360 m!942819))

(declare-fun m!942821 () Bool)

(assert (=> b!1023114 m!942821))

(declare-fun m!942823 () Bool)

(assert (=> mapNonEmpty!37248 m!942823))

(declare-fun m!942825 () Bool)

(assert (=> b!1023113 m!942825))

(declare-fun m!942827 () Bool)

(assert (=> b!1023115 m!942827))

(declare-fun m!942829 () Bool)

(assert (=> b!1023115 m!942829))

(check-sat (not b!1023111) b_and!32375 tp_is_empty!23887 (not b_next!20167) (not start!89360) (not b!1023114) (not mapNonEmpty!37248) (not b!1023113) (not b!1023115))
(check-sat b_and!32375 (not b_next!20167))
