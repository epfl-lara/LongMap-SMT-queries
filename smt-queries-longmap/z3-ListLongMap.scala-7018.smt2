; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!89354 () Bool)

(assert start!89354)

(declare-fun b!1023034 () Bool)

(declare-fun b_free!20161 () Bool)

(declare-fun b_next!20161 () Bool)

(assert (=> b!1023034 (= b_free!20161 (not b_next!20161))))

(declare-fun tp!71518 () Bool)

(declare-fun b_and!32369 () Bool)

(assert (=> b!1023034 (= tp!71518 b_and!32369)))

(declare-fun b!1023027 () Bool)

(declare-fun res!685043 () Bool)

(declare-fun e!576327 () Bool)

(assert (=> b!1023027 (=> (not res!685043) (not e!576327))))

(declare-datatypes ((V!36715 0))(
  ( (V!36716 (val!11991 Int)) )
))
(declare-datatypes ((ValueCell!11237 0))(
  ( (ValueCellFull!11237 (v!14556 V!36715)) (EmptyCell!11237) )
))
(declare-datatypes ((array!63855 0))(
  ( (array!63856 (arr!30733 (Array (_ BitVec 32) (_ BitVec 64))) (size!31245 (_ BitVec 32))) )
))
(declare-datatypes ((array!63857 0))(
  ( (array!63858 (arr!30734 (Array (_ BitVec 32) ValueCell!11237)) (size!31246 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5068 0))(
  ( (LongMapFixedSize!5069 (defaultEntry!5886 Int) (mask!29523 (_ BitVec 32)) (extraKeys!5618 (_ BitVec 32)) (zeroValue!5722 V!36715) (minValue!5722 V!36715) (_size!2589 (_ BitVec 32)) (_keys!11069 array!63855) (_values!5909 array!63857) (_vacant!2589 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5068)

(assert (=> b!1023027 (= res!685043 (and (= (size!31246 (_values!5909 thiss!1427)) (bvadd #b00000000000000000000000000000001 (mask!29523 thiss!1427))) (= (size!31245 (_keys!11069 thiss!1427)) (size!31246 (_values!5909 thiss!1427))) (bvsge (mask!29523 thiss!1427) #b00000000000000000000000000000000) (bvsge (extraKeys!5618 thiss!1427) #b00000000000000000000000000000000) (bvsle (extraKeys!5618 thiss!1427) #b00000000000000000000000000000011) (bvsge (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000011) (= (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) (bvand (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000010)) (= (bvand (bvand (extraKeys!5618 thiss!1427) #b00000000000000000000000000000010) #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun res!685042 () Bool)

(assert (=> start!89354 (=> (not res!685042) (not e!576327))))

(declare-fun valid!1937 (LongMapFixedSize!5068) Bool)

(assert (=> start!89354 (= res!685042 (valid!1937 thiss!1427))))

(assert (=> start!89354 e!576327))

(declare-fun e!576326 () Bool)

(assert (=> start!89354 e!576326))

(assert (=> start!89354 true))

(declare-fun b!1023028 () Bool)

(declare-fun e!576330 () Bool)

(declare-fun tp_is_empty!23881 () Bool)

(assert (=> b!1023028 (= e!576330 tp_is_empty!23881)))

(declare-fun b!1023029 () Bool)

(declare-fun e!576325 () Bool)

(assert (=> b!1023029 (= e!576325 tp_is_empty!23881)))

(declare-fun b!1023030 () Bool)

(declare-fun res!685045 () Bool)

(assert (=> b!1023030 (=> (not res!685045) (not e!576327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!63855 (_ BitVec 32)) Bool)

(assert (=> b!1023030 (= res!685045 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11069 thiss!1427) (mask!29523 thiss!1427)))))

(declare-fun b!1023031 () Bool)

(declare-fun res!685046 () Bool)

(assert (=> b!1023031 (=> (not res!685046) (not e!576327))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1023031 (= res!685046 (validMask!0 (mask!29523 thiss!1427)))))

(declare-fun b!1023032 () Bool)

(declare-fun res!685044 () Bool)

(assert (=> b!1023032 (=> (not res!685044) (not e!576327))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023032 (= res!685044 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1023033 () Bool)

(declare-fun e!576328 () Bool)

(declare-fun mapRes!37239 () Bool)

(assert (=> b!1023033 (= e!576328 (and e!576330 mapRes!37239))))

(declare-fun condMapEmpty!37239 () Bool)

(declare-fun mapDefault!37239 () ValueCell!11237)

(assert (=> b!1023033 (= condMapEmpty!37239 (= (arr!30734 (_values!5909 thiss!1427)) ((as const (Array (_ BitVec 32) ValueCell!11237)) mapDefault!37239)))))

(declare-fun array_inv!23849 (array!63855) Bool)

(declare-fun array_inv!23850 (array!63857) Bool)

(assert (=> b!1023034 (= e!576326 (and tp!71518 tp_is_empty!23881 (array_inv!23849 (_keys!11069 thiss!1427)) (array_inv!23850 (_values!5909 thiss!1427)) e!576328))))

(declare-fun mapNonEmpty!37239 () Bool)

(declare-fun tp!71517 () Bool)

(assert (=> mapNonEmpty!37239 (= mapRes!37239 (and tp!71517 e!576325))))

(declare-fun mapKey!37239 () (_ BitVec 32))

(declare-fun mapRest!37239 () (Array (_ BitVec 32) ValueCell!11237))

(declare-fun mapValue!37239 () ValueCell!11237)

(assert (=> mapNonEmpty!37239 (= (arr!30734 (_values!5909 thiss!1427)) (store mapRest!37239 mapKey!37239 mapValue!37239))))

(declare-fun mapIsEmpty!37239 () Bool)

(assert (=> mapIsEmpty!37239 mapRes!37239))

(declare-fun b!1023035 () Bool)

(assert (=> b!1023035 (= e!576327 false)))

(declare-fun lt!450650 () Bool)

(declare-datatypes ((List!21650 0))(
  ( (Nil!21647) (Cons!21646 (h!22853 (_ BitVec 64)) (t!30656 List!21650)) )
))
(declare-fun arrayNoDuplicates!0 (array!63855 (_ BitVec 32) List!21650) Bool)

(assert (=> b!1023035 (= lt!450650 (arrayNoDuplicates!0 (_keys!11069 thiss!1427) #b00000000000000000000000000000000 Nil!21647))))

(assert (= (and start!89354 res!685042) b!1023032))

(assert (= (and b!1023032 res!685044) b!1023031))

(assert (= (and b!1023031 res!685046) b!1023027))

(assert (= (and b!1023027 res!685043) b!1023030))

(assert (= (and b!1023030 res!685045) b!1023035))

(assert (= (and b!1023033 condMapEmpty!37239) mapIsEmpty!37239))

(assert (= (and b!1023033 (not condMapEmpty!37239)) mapNonEmpty!37239))

(get-info :version)

(assert (= (and mapNonEmpty!37239 ((_ is ValueCellFull!11237) mapValue!37239)) b!1023029))

(assert (= (and b!1023033 ((_ is ValueCellFull!11237) mapDefault!37239)) b!1023028))

(assert (= b!1023034 b!1023033))

(assert (= start!89354 b!1023034))

(declare-fun m!942775 () Bool)

(assert (=> b!1023035 m!942775))

(declare-fun m!942777 () Bool)

(assert (=> b!1023030 m!942777))

(declare-fun m!942779 () Bool)

(assert (=> start!89354 m!942779))

(declare-fun m!942781 () Bool)

(assert (=> mapNonEmpty!37239 m!942781))

(declare-fun m!942783 () Bool)

(assert (=> b!1023031 m!942783))

(declare-fun m!942785 () Bool)

(assert (=> b!1023034 m!942785))

(declare-fun m!942787 () Bool)

(assert (=> b!1023034 m!942787))

(check-sat (not b_next!20161) (not b!1023031) (not b!1023030) (not b!1023034) (not start!89354) tp_is_empty!23881 b_and!32369 (not b!1023035) (not mapNonEmpty!37239))
(check-sat b_and!32369 (not b_next!20161))
