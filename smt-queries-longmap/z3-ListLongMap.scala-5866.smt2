; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75708 () Bool)

(assert start!75708)

(declare-fun b!890131 () Bool)

(declare-fun b_free!15697 () Bool)

(declare-fun b_next!15697 () Bool)

(assert (=> b!890131 (= b_free!15697 (not b_next!15697))))

(declare-fun tp!55060 () Bool)

(declare-fun b_and!25911 () Bool)

(assert (=> b!890131 (= tp!55060 b_and!25911)))

(declare-fun b!890127 () Bool)

(declare-fun e!496425 () Bool)

(declare-fun e!496427 () Bool)

(assert (=> b!890127 (= e!496425 e!496427)))

(declare-fun res!603169 () Bool)

(assert (=> b!890127 (=> res!603169 e!496427)))

(declare-datatypes ((array!52013 0))(
  ( (array!52014 (arr!25013 (Array (_ BitVec 32) (_ BitVec 64))) (size!25459 (_ BitVec 32))) )
))
(declare-datatypes ((V!28999 0))(
  ( (V!29000 (val!9063 Int)) )
))
(declare-datatypes ((ValueCell!8531 0))(
  ( (ValueCellFull!8531 (v!11535 V!28999)) (EmptyCell!8531) )
))
(declare-datatypes ((array!52015 0))(
  ( (array!52016 (arr!25014 (Array (_ BitVec 32) ValueCell!8531)) (size!25460 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4078 0))(
  ( (LongMapFixedSize!4079 (defaultEntry!5236 Int) (mask!25702 (_ BitVec 32)) (extraKeys!4930 (_ BitVec 32)) (zeroValue!5034 V!28999) (minValue!5034 V!28999) (_size!2094 (_ BitVec 32)) (_keys!9914 array!52013) (_values!5221 array!52015) (_vacant!2094 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4078)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890127 (= res!603169 (not (validMask!0 (mask!25702 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52013 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890127 (arrayContainsKey!0 (_keys!9914 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30242 0))(
  ( (Unit!30243) )
))
(declare-fun lt!402035 () Unit!30242)

(declare-datatypes ((SeekEntryResult!8799 0))(
  ( (MissingZero!8799 (index!37567 (_ BitVec 32))) (Found!8799 (index!37568 (_ BitVec 32))) (Intermediate!8799 (undefined!9611 Bool) (index!37569 (_ BitVec 32)) (x!75634 (_ BitVec 32))) (Undefined!8799) (MissingVacant!8799 (index!37570 (_ BitVec 32))) )
))
(declare-fun lt!402038 () SeekEntryResult!8799)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52013 (_ BitVec 64) (_ BitVec 32)) Unit!30242)

(assert (=> b!890127 (= lt!402035 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9914 thiss!1181) key!785 (index!37568 lt!402038)))))

(declare-fun b!890128 () Bool)

(declare-fun e!496426 () Bool)

(assert (=> b!890128 (= e!496426 (not e!496425))))

(declare-fun res!603167 () Bool)

(assert (=> b!890128 (=> res!603167 e!496425)))

(get-info :version)

(assert (=> b!890128 (= res!603167 (not ((_ is Found!8799) lt!402038)))))

(declare-fun e!496422 () Bool)

(assert (=> b!890128 e!496422))

(declare-fun res!603170 () Bool)

(assert (=> b!890128 (=> res!603170 e!496422)))

(assert (=> b!890128 (= res!603170 (not ((_ is Found!8799) lt!402038)))))

(declare-fun lt!402037 () Unit!30242)

(declare-fun lemmaSeekEntryGivesInRangeIndex!12 (array!52013 array!52015 (_ BitVec 32) (_ BitVec 32) V!28999 V!28999 (_ BitVec 64)) Unit!30242)

(assert (=> b!890128 (= lt!402037 (lemmaSeekEntryGivesInRangeIndex!12 (_keys!9914 thiss!1181) (_values!5221 thiss!1181) (mask!25702 thiss!1181) (extraKeys!4930 thiss!1181) (zeroValue!5034 thiss!1181) (minValue!5034 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52013 (_ BitVec 32)) SeekEntryResult!8799)

(assert (=> b!890128 (= lt!402038 (seekEntry!0 key!785 (_keys!9914 thiss!1181) (mask!25702 thiss!1181)))))

(declare-fun mapNonEmpty!28592 () Bool)

(declare-fun mapRes!28592 () Bool)

(declare-fun tp!55061 () Bool)

(declare-fun e!496420 () Bool)

(assert (=> mapNonEmpty!28592 (= mapRes!28592 (and tp!55061 e!496420))))

(declare-fun mapValue!28592 () ValueCell!8531)

(declare-fun mapKey!28592 () (_ BitVec 32))

(declare-fun mapRest!28592 () (Array (_ BitVec 32) ValueCell!8531))

(assert (=> mapNonEmpty!28592 (= (arr!25014 (_values!5221 thiss!1181)) (store mapRest!28592 mapKey!28592 mapValue!28592))))

(declare-fun b!890129 () Bool)

(declare-fun e!496423 () Bool)

(declare-fun tp_is_empty!18025 () Bool)

(assert (=> b!890129 (= e!496423 tp_is_empty!18025)))

(declare-fun b!890130 () Bool)

(assert (=> b!890130 (= e!496427 true)))

(declare-fun lt!402036 () Bool)

(declare-datatypes ((List!17728 0))(
  ( (Nil!17725) (Cons!17724 (h!18855 (_ BitVec 64)) (t!25018 List!17728)) )
))
(declare-fun arrayNoDuplicates!0 (array!52013 (_ BitVec 32) List!17728) Bool)

(assert (=> b!890130 (= lt!402036 (arrayNoDuplicates!0 (_keys!9914 thiss!1181) #b00000000000000000000000000000000 Nil!17725))))

(declare-fun e!496419 () Bool)

(declare-fun e!496424 () Bool)

(declare-fun array_inv!19714 (array!52013) Bool)

(declare-fun array_inv!19715 (array!52015) Bool)

(assert (=> b!890131 (= e!496419 (and tp!55060 tp_is_empty!18025 (array_inv!19714 (_keys!9914 thiss!1181)) (array_inv!19715 (_values!5221 thiss!1181)) e!496424))))

(declare-fun b!890132 () Bool)

(assert (=> b!890132 (= e!496420 tp_is_empty!18025)))

(declare-fun b!890133 () Bool)

(assert (=> b!890133 (= e!496424 (and e!496423 mapRes!28592))))

(declare-fun condMapEmpty!28592 () Bool)

(declare-fun mapDefault!28592 () ValueCell!8531)

(assert (=> b!890133 (= condMapEmpty!28592 (= (arr!25014 (_values!5221 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8531)) mapDefault!28592)))))

(declare-fun b!890134 () Bool)

(declare-fun res!603171 () Bool)

(assert (=> b!890134 (=> res!603171 e!496427)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52013 (_ BitVec 32)) Bool)

(assert (=> b!890134 (= res!603171 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9914 thiss!1181) (mask!25702 thiss!1181))))))

(declare-fun b!890135 () Bool)

(declare-fun res!603165 () Bool)

(assert (=> b!890135 (=> (not res!603165) (not e!496426))))

(assert (=> b!890135 (= res!603165 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890136 () Bool)

(declare-fun res!603166 () Bool)

(assert (=> b!890136 (=> res!603166 e!496427)))

(assert (=> b!890136 (= res!603166 (or (not (= (size!25460 (_values!5221 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25702 thiss!1181)))) (not (= (size!25459 (_keys!9914 thiss!1181)) (size!25460 (_values!5221 thiss!1181)))) (bvslt (mask!25702 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4930 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4930 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890137 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890137 (= e!496422 (inRange!0 (index!37568 lt!402038) (mask!25702 thiss!1181)))))

(declare-fun res!603168 () Bool)

(assert (=> start!75708 (=> (not res!603168) (not e!496426))))

(declare-fun valid!1593 (LongMapFixedSize!4078) Bool)

(assert (=> start!75708 (= res!603168 (valid!1593 thiss!1181))))

(assert (=> start!75708 e!496426))

(assert (=> start!75708 e!496419))

(assert (=> start!75708 true))

(declare-fun mapIsEmpty!28592 () Bool)

(assert (=> mapIsEmpty!28592 mapRes!28592))

(assert (= (and start!75708 res!603168) b!890135))

(assert (= (and b!890135 res!603165) b!890128))

(assert (= (and b!890128 (not res!603170)) b!890137))

(assert (= (and b!890128 (not res!603167)) b!890127))

(assert (= (and b!890127 (not res!603169)) b!890136))

(assert (= (and b!890136 (not res!603166)) b!890134))

(assert (= (and b!890134 (not res!603171)) b!890130))

(assert (= (and b!890133 condMapEmpty!28592) mapIsEmpty!28592))

(assert (= (and b!890133 (not condMapEmpty!28592)) mapNonEmpty!28592))

(assert (= (and mapNonEmpty!28592 ((_ is ValueCellFull!8531) mapValue!28592)) b!890132))

(assert (= (and b!890133 ((_ is ValueCellFull!8531) mapDefault!28592)) b!890129))

(assert (= b!890131 b!890133))

(assert (= start!75708 b!890131))

(declare-fun m!828175 () Bool)

(assert (=> start!75708 m!828175))

(declare-fun m!828177 () Bool)

(assert (=> b!890131 m!828177))

(declare-fun m!828179 () Bool)

(assert (=> b!890131 m!828179))

(declare-fun m!828181 () Bool)

(assert (=> b!890134 m!828181))

(declare-fun m!828183 () Bool)

(assert (=> mapNonEmpty!28592 m!828183))

(declare-fun m!828185 () Bool)

(assert (=> b!890128 m!828185))

(declare-fun m!828187 () Bool)

(assert (=> b!890128 m!828187))

(declare-fun m!828189 () Bool)

(assert (=> b!890130 m!828189))

(declare-fun m!828191 () Bool)

(assert (=> b!890137 m!828191))

(declare-fun m!828193 () Bool)

(assert (=> b!890127 m!828193))

(declare-fun m!828195 () Bool)

(assert (=> b!890127 m!828195))

(declare-fun m!828197 () Bool)

(assert (=> b!890127 m!828197))

(check-sat (not mapNonEmpty!28592) (not b!890130) (not b_next!15697) (not b!890131) (not start!75708) (not b!890134) (not b!890127) (not b!890137) (not b!890128) tp_is_empty!18025 b_and!25911)
(check-sat b_and!25911 (not b_next!15697))
