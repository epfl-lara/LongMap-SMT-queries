; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89236 () Bool)

(assert start!89236)

(declare-fun b!1023196 () Bool)

(declare-fun b_free!20277 () Bool)

(declare-fun b_next!20277 () Bool)

(assert (=> b!1023196 (= b_free!20277 (not b_next!20277))))

(declare-fun tp!71866 () Bool)

(declare-fun b_and!32499 () Bool)

(assert (=> b!1023196 (= tp!71866 b_and!32499)))

(declare-fun b!1023194 () Bool)

(declare-fun e!576531 () Bool)

(declare-fun tp_is_empty!23997 () Bool)

(assert (=> b!1023194 (= e!576531 tp_is_empty!23997)))

(declare-fun b!1023195 () Bool)

(declare-fun e!576527 () Bool)

(declare-fun e!576530 () Bool)

(declare-fun mapRes!37413 () Bool)

(assert (=> b!1023195 (= e!576527 (and e!576530 mapRes!37413))))

(declare-fun condMapEmpty!37413 () Bool)

(declare-datatypes ((V!36869 0))(
  ( (V!36870 (val!12049 Int)) )
))
(declare-datatypes ((ValueCell!11295 0))(
  ( (ValueCellFull!11295 (v!14618 V!36869)) (EmptyCell!11295) )
))
(declare-datatypes ((array!64038 0))(
  ( (array!64039 (arr!30831 (Array (_ BitVec 32) (_ BitVec 64))) (size!31342 (_ BitVec 32))) )
))
(declare-datatypes ((array!64040 0))(
  ( (array!64041 (arr!30832 (Array (_ BitVec 32) ValueCell!11295)) (size!31343 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5184 0))(
  ( (LongMapFixedSize!5185 (defaultEntry!5944 Int) (mask!29559 (_ BitVec 32)) (extraKeys!5676 (_ BitVec 32)) (zeroValue!5780 V!36869) (minValue!5780 V!36869) (_size!2647 (_ BitVec 32)) (_keys!11089 array!64038) (_values!5967 array!64040) (_vacant!2647 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5184)

(declare-fun mapDefault!37413 () ValueCell!11295)

(assert (=> b!1023195 (= condMapEmpty!37413 (= (arr!30832 (_values!5967 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11295)) mapDefault!37413)))))

(declare-fun mapIsEmpty!37413 () Bool)

(assert (=> mapIsEmpty!37413 mapRes!37413))

(declare-fun e!576528 () Bool)

(declare-fun array_inv!23889 (array!64038) Bool)

(declare-fun array_inv!23890 (array!64040) Bool)

(assert (=> b!1023196 (= e!576528 (and tp!71866 tp_is_empty!23997 (array_inv!23889 (_keys!11089 thiss!1427)) (array_inv!23890 (_values!5967 thiss!1427)) e!576527))))

(declare-fun b!1023197 () Bool)

(declare-fun res!685298 () Bool)

(declare-fun e!576526 () Bool)

(assert (=> b!1023197 (=> (not res!685298) (not e!576526))))

(assert (=> b!1023197 (= res!685298 (and (= (size!31343 (_values!5967 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29559 thiss!1427))) (= (size!31342 (_keys!11089 thiss!1427)) (size!31343 (_values!5967 thiss!1427))) (bvsge (mask!29559 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5676 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5676 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5676 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5676 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000011) (= (bvand (extraKeys!5676 thiss!1427) #b00000000000000000000000000000001) (bvand (bvand (extraKeys!5676 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000001)) (= (bvand (bvand (extraKeys!5676 thiss!1427) #b00000000000000000000000000000001) #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!37413 () Bool)

(declare-fun tp!71865 () Bool)

(assert (=> mapNonEmpty!37413 (= mapRes!37413 (and tp!71865 e!576531))))

(declare-fun mapKey!37413 () (_ BitVec 32))

(declare-fun mapRest!37413 () (Array (_ BitVec 32) ValueCell!11295))

(declare-fun mapValue!37413 () ValueCell!11295)

(assert (=> mapNonEmpty!37413 (= (arr!30832 (_values!5967 thiss!1427)) (store mapRest!37413 mapKey!37413 mapValue!37413))))

(declare-fun b!1023198 () Bool)

(declare-fun res!685294 () Bool)

(assert (=> b!1023198 (=> (not res!685294) (not e!576526))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023198 (= res!685294 (validMask!0 (mask!29559 thiss!1427)))))

(declare-fun res!685297 () Bool)

(assert (=> start!89236 (=> (not res!685297) (not e!576526))))

(declare-fun valid!1975 (LongMapFixedSize!5184) Bool)

(assert (=> start!89236 (= res!685297 (valid!1975 thiss!1427))))

(assert (=> start!89236 e!576526))

(assert (=> start!89236 e!576528))

(assert (=> start!89236 true))

(declare-fun b!1023199 () Bool)

(declare-fun res!685295 () Bool)

(assert (=> b!1023199 (=> (not res!685295) (not e!576526))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64038 (_ BitVec 32)) Bool)

(assert (=> b!1023199 (= res!685295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11089 thiss!1427) (mask!29559 thiss!1427)))))

(declare-fun b!1023200 () Bool)

(assert (=> b!1023200 (= e!576526 false)))

(declare-fun lt!450381 () Bool)

(declare-datatypes ((List!21706 0))(
  ( (Nil!21703) (Cons!21702 (h!22900 (_ BitVec 64)) (t!30744 List!21706)) )
))
(declare-fun arrayNoDuplicates!0 (array!64038 (_ BitVec 32) List!21706) Bool)

(assert (=> b!1023200 (= lt!450381 (arrayNoDuplicates!0 (_keys!11089 thiss!1427) #b00000000000000000000000000000000 Nil!21703))))

(declare-fun b!1023201 () Bool)

(assert (=> b!1023201 (= e!576530 tp_is_empty!23997)))

(declare-fun b!1023202 () Bool)

(declare-fun res!685296 () Bool)

(assert (=> b!1023202 (=> (not res!685296) (not e!576526))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023202 (= res!685296 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!89236 res!685297) b!1023202))

(assert (= (and b!1023202 res!685296) b!1023198))

(assert (= (and b!1023198 res!685294) b!1023197))

(assert (= (and b!1023197 res!685298) b!1023199))

(assert (= (and b!1023199 res!685295) b!1023200))

(assert (= (and b!1023195 condMapEmpty!37413) mapIsEmpty!37413))

(assert (= (and b!1023195 (not condMapEmpty!37413)) mapNonEmpty!37413))

(get-info :version)

(assert (= (and mapNonEmpty!37413 ((_ is ValueCellFull!11295) mapValue!37413)) b!1023194))

(assert (= (and b!1023195 ((_ is ValueCellFull!11295) mapDefault!37413)) b!1023201))

(assert (= b!1023196 b!1023195))

(assert (= start!89236 b!1023196))

(declare-fun m!941995 () Bool)

(assert (=> b!1023198 m!941995))

(declare-fun m!941997 () Bool)

(assert (=> b!1023199 m!941997))

(declare-fun m!941999 () Bool)

(assert (=> start!89236 m!941999))

(declare-fun m!942001 () Bool)

(assert (=> b!1023196 m!942001))

(declare-fun m!942003 () Bool)

(assert (=> b!1023196 m!942003))

(declare-fun m!942005 () Bool)

(assert (=> mapNonEmpty!37413 m!942005))

(declare-fun m!942007 () Bool)

(assert (=> b!1023200 m!942007))

(check-sat (not b_next!20277) (not mapNonEmpty!37413) (not b!1023198) tp_is_empty!23997 (not start!89236) b_and!32499 (not b!1023196) (not b!1023200) (not b!1023199))
(check-sat b_and!32499 (not b_next!20277))
