; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75780 () Bool)

(assert start!75780)

(declare-fun b!891347 () Bool)

(declare-fun b_free!15769 () Bool)

(declare-fun b_next!15769 () Bool)

(assert (=> b!891347 (= b_free!15769 (not b_next!15769))))

(declare-fun tp!55277 () Bool)

(declare-fun b_and!25983 () Bool)

(assert (=> b!891347 (= tp!55277 b_and!25983)))

(declare-fun b!891344 () Bool)

(declare-fun e!497392 () Bool)

(declare-fun e!497394 () Bool)

(assert (=> b!891344 (= e!497392 e!497394)))

(declare-fun res!603953 () Bool)

(assert (=> b!891344 (=> res!603953 e!497394)))

(declare-datatypes ((array!52157 0))(
  ( (array!52158 (arr!25085 (Array (_ BitVec 32) (_ BitVec 64))) (size!25531 (_ BitVec 32))) )
))
(declare-datatypes ((V!29095 0))(
  ( (V!29096 (val!9099 Int)) )
))
(declare-datatypes ((ValueCell!8567 0))(
  ( (ValueCellFull!8567 (v!11571 V!29095)) (EmptyCell!8567) )
))
(declare-datatypes ((array!52159 0))(
  ( (array!52160 (arr!25086 (Array (_ BitVec 32) ValueCell!8567)) (size!25532 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4150 0))(
  ( (LongMapFixedSize!4151 (defaultEntry!5272 Int) (mask!25762 (_ BitVec 32)) (extraKeys!4966 (_ BitVec 32)) (zeroValue!5070 V!29095) (minValue!5070 V!29095) (_size!2130 (_ BitVec 32)) (_keys!9950 array!52157) (_values!5257 array!52159) (_vacant!2130 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4150)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891344 (= res!603953 (not (validMask!0 (mask!25762 thiss!1181))))))

(declare-datatypes ((tuple2!11974 0))(
  ( (tuple2!11975 (_1!5998 (_ BitVec 64)) (_2!5998 V!29095)) )
))
(declare-datatypes ((List!17757 0))(
  ( (Nil!17754) (Cons!17753 (h!18884 tuple2!11974) (t!25047 List!17757)) )
))
(declare-datatypes ((ListLongMap!10661 0))(
  ( (ListLongMap!10662 (toList!5346 List!17757)) )
))
(declare-fun lt!402528 () ListLongMap!10661)

(declare-datatypes ((SeekEntryResult!8831 0))(
  ( (MissingZero!8831 (index!37695 (_ BitVec 32))) (Found!8831 (index!37696 (_ BitVec 32))) (Intermediate!8831 (undefined!9643 Bool) (index!37697 (_ BitVec 32)) (x!75762 (_ BitVec 32))) (Undefined!8831) (MissingVacant!8831 (index!37698 (_ BitVec 32))) )
))
(declare-fun lt!402530 () SeekEntryResult!8831)

(declare-fun contains!4316 (ListLongMap!10661 (_ BitVec 64)) Bool)

(assert (=> b!891344 (contains!4316 lt!402528 (select (arr!25085 (_keys!9950 thiss!1181)) (index!37696 lt!402530)))))

(declare-fun getCurrentListMap!2574 (array!52157 array!52159 (_ BitVec 32) (_ BitVec 32) V!29095 V!29095 (_ BitVec 32) Int) ListLongMap!10661)

(assert (=> b!891344 (= lt!402528 (getCurrentListMap!2574 (_keys!9950 thiss!1181) (_values!5257 thiss!1181) (mask!25762 thiss!1181) (extraKeys!4966 thiss!1181) (zeroValue!5070 thiss!1181) (minValue!5070 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5272 thiss!1181)))))

(declare-datatypes ((Unit!30296 0))(
  ( (Unit!30297) )
))
(declare-fun lt!402526 () Unit!30296)

(declare-fun lemmaValidKeyInArrayIsInListMap!210 (array!52157 array!52159 (_ BitVec 32) (_ BitVec 32) V!29095 V!29095 (_ BitVec 32) Int) Unit!30296)

(assert (=> b!891344 (= lt!402526 (lemmaValidKeyInArrayIsInListMap!210 (_keys!9950 thiss!1181) (_values!5257 thiss!1181) (mask!25762 thiss!1181) (extraKeys!4966 thiss!1181) (zeroValue!5070 thiss!1181) (minValue!5070 thiss!1181) (index!37696 lt!402530) (defaultEntry!5272 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52157 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891344 (arrayContainsKey!0 (_keys!9950 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402527 () Unit!30296)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52157 (_ BitVec 64) (_ BitVec 32)) Unit!30296)

(assert (=> b!891344 (= lt!402527 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9950 thiss!1181) key!785 (index!37696 lt!402530)))))

(declare-fun b!891345 () Bool)

(assert (=> b!891345 (= e!497394 true)))

(declare-fun lt!402525 () Bool)

(assert (=> b!891345 (= lt!402525 (contains!4316 lt!402528 key!785))))

(declare-fun res!603952 () Bool)

(declare-fun e!497399 () Bool)

(assert (=> start!75780 (=> (not res!603952) (not e!497399))))

(declare-fun valid!1615 (LongMapFixedSize!4150) Bool)

(assert (=> start!75780 (= res!603952 (valid!1615 thiss!1181))))

(assert (=> start!75780 e!497399))

(declare-fun e!497393 () Bool)

(assert (=> start!75780 e!497393))

(assert (=> start!75780 true))

(declare-fun b!891346 () Bool)

(declare-fun res!603954 () Bool)

(assert (=> b!891346 (=> res!603954 e!497394)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52157 (_ BitVec 32)) Bool)

(assert (=> b!891346 (= res!603954 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9950 thiss!1181) (mask!25762 thiss!1181))))))

(declare-fun tp_is_empty!18097 () Bool)

(declare-fun e!497391 () Bool)

(declare-fun array_inv!19766 (array!52157) Bool)

(declare-fun array_inv!19767 (array!52159) Bool)

(assert (=> b!891347 (= e!497393 (and tp!55277 tp_is_empty!18097 (array_inv!19766 (_keys!9950 thiss!1181)) (array_inv!19767 (_values!5257 thiss!1181)) e!497391))))

(declare-fun b!891348 () Bool)

(declare-fun res!603956 () Bool)

(assert (=> b!891348 (=> res!603956 e!497394)))

(declare-datatypes ((List!17758 0))(
  ( (Nil!17755) (Cons!17754 (h!18885 (_ BitVec 64)) (t!25048 List!17758)) )
))
(declare-fun arrayNoDuplicates!0 (array!52157 (_ BitVec 32) List!17758) Bool)

(assert (=> b!891348 (= res!603956 (not (arrayNoDuplicates!0 (_keys!9950 thiss!1181) #b00000000000000000000000000000000 Nil!17755)))))

(declare-fun b!891349 () Bool)

(declare-fun res!603955 () Bool)

(assert (=> b!891349 (=> res!603955 e!497394)))

(assert (=> b!891349 (= res!603955 (or (not (= (size!25532 (_values!5257 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25762 thiss!1181)))) (not (= (size!25531 (_keys!9950 thiss!1181)) (size!25532 (_values!5257 thiss!1181)))) (bvslt (mask!25762 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4966 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4966 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891350 () Bool)

(declare-fun res!603951 () Bool)

(assert (=> b!891350 (=> (not res!603951) (not e!497399))))

(assert (=> b!891350 (= res!603951 (not (= key!785 (bvneg key!785))))))

(declare-fun mapNonEmpty!28700 () Bool)

(declare-fun mapRes!28700 () Bool)

(declare-fun tp!55276 () Bool)

(declare-fun e!497398 () Bool)

(assert (=> mapNonEmpty!28700 (= mapRes!28700 (and tp!55276 e!497398))))

(declare-fun mapKey!28700 () (_ BitVec 32))

(declare-fun mapRest!28700 () (Array (_ BitVec 32) ValueCell!8567))

(declare-fun mapValue!28700 () ValueCell!8567)

(assert (=> mapNonEmpty!28700 (= (arr!25086 (_values!5257 thiss!1181)) (store mapRest!28700 mapKey!28700 mapValue!28700))))

(declare-fun b!891351 () Bool)

(assert (=> b!891351 (= e!497399 (not e!497392))))

(declare-fun res!603950 () Bool)

(assert (=> b!891351 (=> res!603950 e!497392)))

(get-info :version)

(assert (=> b!891351 (= res!603950 (not ((_ is Found!8831) lt!402530)))))

(declare-fun e!497397 () Bool)

(assert (=> b!891351 e!497397))

(declare-fun res!603957 () Bool)

(assert (=> b!891351 (=> res!603957 e!497397)))

(assert (=> b!891351 (= res!603957 (not ((_ is Found!8831) lt!402530)))))

(declare-fun lt!402529 () Unit!30296)

(declare-fun lemmaSeekEntryGivesInRangeIndex!37 (array!52157 array!52159 (_ BitVec 32) (_ BitVec 32) V!29095 V!29095 (_ BitVec 64)) Unit!30296)

(assert (=> b!891351 (= lt!402529 (lemmaSeekEntryGivesInRangeIndex!37 (_keys!9950 thiss!1181) (_values!5257 thiss!1181) (mask!25762 thiss!1181) (extraKeys!4966 thiss!1181) (zeroValue!5070 thiss!1181) (minValue!5070 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52157 (_ BitVec 32)) SeekEntryResult!8831)

(assert (=> b!891351 (= lt!402530 (seekEntry!0 key!785 (_keys!9950 thiss!1181) (mask!25762 thiss!1181)))))

(declare-fun b!891352 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891352 (= e!497397 (inRange!0 (index!37696 lt!402530) (mask!25762 thiss!1181)))))

(declare-fun b!891353 () Bool)

(assert (=> b!891353 (= e!497398 tp_is_empty!18097)))

(declare-fun mapIsEmpty!28700 () Bool)

(assert (=> mapIsEmpty!28700 mapRes!28700))

(declare-fun b!891354 () Bool)

(declare-fun e!497395 () Bool)

(assert (=> b!891354 (= e!497391 (and e!497395 mapRes!28700))))

(declare-fun condMapEmpty!28700 () Bool)

(declare-fun mapDefault!28700 () ValueCell!8567)

(assert (=> b!891354 (= condMapEmpty!28700 (= (arr!25086 (_values!5257 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8567)) mapDefault!28700)))))

(declare-fun b!891355 () Bool)

(assert (=> b!891355 (= e!497395 tp_is_empty!18097)))

(assert (= (and start!75780 res!603952) b!891350))

(assert (= (and b!891350 res!603951) b!891351))

(assert (= (and b!891351 (not res!603957)) b!891352))

(assert (= (and b!891351 (not res!603950)) b!891344))

(assert (= (and b!891344 (not res!603953)) b!891349))

(assert (= (and b!891349 (not res!603955)) b!891346))

(assert (= (and b!891346 (not res!603954)) b!891348))

(assert (= (and b!891348 (not res!603956)) b!891345))

(assert (= (and b!891354 condMapEmpty!28700) mapIsEmpty!28700))

(assert (= (and b!891354 (not condMapEmpty!28700)) mapNonEmpty!28700))

(assert (= (and mapNonEmpty!28700 ((_ is ValueCellFull!8567) mapValue!28700)) b!891353))

(assert (= (and b!891354 ((_ is ValueCellFull!8567) mapDefault!28700)) b!891355))

(assert (= b!891347 b!891354))

(assert (= start!75780 b!891347))

(declare-fun m!829129 () Bool)

(assert (=> mapNonEmpty!28700 m!829129))

(declare-fun m!829131 () Bool)

(assert (=> b!891352 m!829131))

(declare-fun m!829133 () Bool)

(assert (=> b!891348 m!829133))

(declare-fun m!829135 () Bool)

(assert (=> start!75780 m!829135))

(declare-fun m!829137 () Bool)

(assert (=> b!891351 m!829137))

(declare-fun m!829139 () Bool)

(assert (=> b!891351 m!829139))

(declare-fun m!829141 () Bool)

(assert (=> b!891346 m!829141))

(declare-fun m!829143 () Bool)

(assert (=> b!891345 m!829143))

(declare-fun m!829145 () Bool)

(assert (=> b!891347 m!829145))

(declare-fun m!829147 () Bool)

(assert (=> b!891347 m!829147))

(declare-fun m!829149 () Bool)

(assert (=> b!891344 m!829149))

(declare-fun m!829151 () Bool)

(assert (=> b!891344 m!829151))

(declare-fun m!829153 () Bool)

(assert (=> b!891344 m!829153))

(declare-fun m!829155 () Bool)

(assert (=> b!891344 m!829155))

(assert (=> b!891344 m!829153))

(declare-fun m!829157 () Bool)

(assert (=> b!891344 m!829157))

(declare-fun m!829159 () Bool)

(assert (=> b!891344 m!829159))

(declare-fun m!829161 () Bool)

(assert (=> b!891344 m!829161))

(check-sat (not b!891347) (not b!891351) (not b!891344) (not b!891346) (not start!75780) (not b!891345) (not b_next!15769) tp_is_empty!18097 (not b!891352) (not mapNonEmpty!28700) (not b!891348) b_and!25983)
(check-sat b_and!25983 (not b_next!15769))
