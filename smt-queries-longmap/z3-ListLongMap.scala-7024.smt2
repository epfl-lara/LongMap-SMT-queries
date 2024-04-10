; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89158 () Bool)

(assert start!89158)

(declare-fun b!1022233 () Bool)

(declare-fun b_free!20199 () Bool)

(declare-fun b_next!20199 () Bool)

(assert (=> b!1022233 (= b_free!20199 (not b_next!20199))))

(declare-fun tp!71632 () Bool)

(declare-fun b_and!32397 () Bool)

(assert (=> b!1022233 (= tp!71632 b_and!32397)))

(declare-fun b!1022225 () Bool)

(declare-fun res!684821 () Bool)

(declare-fun e!575827 () Bool)

(assert (=> b!1022225 (=> (not res!684821) (not e!575827))))

(declare-datatypes ((V!36765 0))(
  ( (V!36766 (val!12010 Int)) )
))
(declare-datatypes ((ValueCell!11256 0))(
  ( (ValueCellFull!11256 (v!14579 V!36765)) (EmptyCell!11256) )
))
(declare-datatypes ((array!63882 0))(
  ( (array!63883 (arr!30753 (Array (_ BitVec 32) (_ BitVec 64))) (size!31264 (_ BitVec 32))) )
))
(declare-datatypes ((array!63884 0))(
  ( (array!63885 (arr!30754 (Array (_ BitVec 32) ValueCell!11256)) (size!31265 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5106 0))(
  ( (LongMapFixedSize!5107 (defaultEntry!5905 Int) (mask!29494 (_ BitVec 32)) (extraKeys!5637 (_ BitVec 32)) (zeroValue!5741 V!36765) (minValue!5741 V!36765) (_size!2608 (_ BitVec 32)) (_keys!11050 array!63882) (_values!5928 array!63884) (_vacant!2608 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5106)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022225 (= res!684821 (validMask!0 (mask!29494 thiss!1427)))))

(declare-fun b!1022226 () Bool)

(declare-fun e!575828 () Bool)

(declare-fun tp_is_empty!23919 () Bool)

(assert (=> b!1022226 (= e!575828 tp_is_empty!23919)))

(declare-fun b!1022227 () Bool)

(declare-fun e!575824 () Bool)

(assert (=> b!1022227 (= e!575824 tp_is_empty!23919)))

(declare-fun b!1022228 () Bool)

(declare-fun res!684817 () Bool)

(assert (=> b!1022228 (=> (not res!684817) (not e!575827))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022228 (= res!684817 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022229 () Bool)

(declare-fun e!575829 () Bool)

(declare-fun mapRes!37296 () Bool)

(assert (=> b!1022229 (= e!575829 (and e!575824 mapRes!37296))))

(declare-fun condMapEmpty!37296 () Bool)

(declare-fun mapDefault!37296 () ValueCell!11256)

(assert (=> b!1022229 (= condMapEmpty!37296 (= (arr!30754 (_values!5928 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11256)) mapDefault!37296)))))

(declare-fun res!684820 () Bool)

(assert (=> start!89158 (=> (not res!684820) (not e!575827))))

(declare-fun valid!1944 (LongMapFixedSize!5106) Bool)

(assert (=> start!89158 (= res!684820 (valid!1944 thiss!1427))))

(assert (=> start!89158 e!575827))

(declare-fun e!575825 () Bool)

(assert (=> start!89158 e!575825))

(assert (=> start!89158 true))

(declare-fun b!1022230 () Bool)

(declare-fun res!684819 () Bool)

(assert (=> b!1022230 (=> (not res!684819) (not e!575827))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63882 (_ BitVec 32)) Bool)

(assert (=> b!1022230 (= res!684819 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11050 thiss!1427) (mask!29494 thiss!1427)))))

(declare-fun b!1022231 () Bool)

(assert (=> b!1022231 (= e!575827 false)))

(declare-fun lt!450192 () Bool)

(declare-datatypes ((List!21676 0))(
  ( (Nil!21673) (Cons!21672 (h!22870 (_ BitVec 64)) (t!30690 List!21676)) )
))
(declare-fun arrayNoDuplicates!0 (array!63882 (_ BitVec 32) List!21676) Bool)

(assert (=> b!1022231 (= lt!450192 (arrayNoDuplicates!0 (_keys!11050 thiss!1427) #b00000000000000000000000000000000 Nil!21673))))

(declare-fun mapIsEmpty!37296 () Bool)

(assert (=> mapIsEmpty!37296 mapRes!37296))

(declare-fun b!1022232 () Bool)

(declare-fun res!684818 () Bool)

(assert (=> b!1022232 (=> (not res!684818) (not e!575827))))

(assert (=> b!1022232 (= res!684818 (and (= (size!31265 (_values!5928 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29494 thiss!1427))) (= (size!31264 (_keys!11050 thiss!1427)) (size!31265 (_values!5928 thiss!1427))) (bvsge (mask!29494 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5637 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5637 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5637 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5637 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5637 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5637 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5637 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun array_inv!23843 (array!63882) Bool)

(declare-fun array_inv!23844 (array!63884) Bool)

(assert (=> b!1022233 (= e!575825 (and tp!71632 tp_is_empty!23919 (array_inv!23843 (_keys!11050 thiss!1427)) (array_inv!23844 (_values!5928 thiss!1427)) e!575829))))

(declare-fun mapNonEmpty!37296 () Bool)

(declare-fun tp!71631 () Bool)

(assert (=> mapNonEmpty!37296 (= mapRes!37296 (and tp!71631 e!575828))))

(declare-fun mapKey!37296 () (_ BitVec 32))

(declare-fun mapRest!37296 () (Array (_ BitVec 32) ValueCell!11256))

(declare-fun mapValue!37296 () ValueCell!11256)

(assert (=> mapNonEmpty!37296 (= (arr!30754 (_values!5928 thiss!1427)) (store mapRest!37296 mapKey!37296 mapValue!37296))))

(assert (= (and start!89158 res!684820) b!1022228))

(assert (= (and b!1022228 res!684817) b!1022225))

(assert (= (and b!1022225 res!684821) b!1022232))

(assert (= (and b!1022232 res!684818) b!1022230))

(assert (= (and b!1022230 res!684819) b!1022231))

(assert (= (and b!1022229 condMapEmpty!37296) mapIsEmpty!37296))

(assert (= (and b!1022229 (not condMapEmpty!37296)) mapNonEmpty!37296))

(get-info :version)

(assert (= (and mapNonEmpty!37296 ((_ is ValueCellFull!11256) mapValue!37296)) b!1022226))

(assert (= (and b!1022229 ((_ is ValueCellFull!11256) mapDefault!37296)) b!1022227))

(assert (= b!1022233 b!1022229))

(assert (= start!89158 b!1022233))

(declare-fun m!941377 () Bool)

(assert (=> start!89158 m!941377))

(declare-fun m!941379 () Bool)

(assert (=> b!1022225 m!941379))

(declare-fun m!941381 () Bool)

(assert (=> b!1022231 m!941381))

(declare-fun m!941383 () Bool)

(assert (=> b!1022230 m!941383))

(declare-fun m!941385 () Bool)

(assert (=> b!1022233 m!941385))

(declare-fun m!941387 () Bool)

(assert (=> b!1022233 m!941387))

(declare-fun m!941389 () Bool)

(assert (=> mapNonEmpty!37296 m!941389))

(check-sat (not mapNonEmpty!37296) (not start!89158) (not b!1022233) (not b!1022231) b_and!32397 (not b!1022230) (not b!1022225) (not b_next!20199) tp_is_empty!23919)
(check-sat b_and!32397 (not b_next!20199))
