; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75722 () Bool)

(assert start!75722)

(declare-fun b!890307 () Bool)

(declare-fun b_free!15693 () Bool)

(declare-fun b_next!15693 () Bool)

(assert (=> b!890307 (= b_free!15693 (not b_next!15693))))

(declare-fun tp!55047 () Bool)

(declare-fun b_and!25933 () Bool)

(assert (=> b!890307 (= tp!55047 b_and!25933)))

(declare-fun b!890300 () Bool)

(declare-fun e!496515 () Bool)

(declare-datatypes ((SeekEntryResult!8796 0))(
  ( (MissingZero!8796 (index!37555 (_ BitVec 32))) (Found!8796 (index!37556 (_ BitVec 32))) (Intermediate!8796 (undefined!9608 Bool) (index!37557 (_ BitVec 32)) (x!75628 (_ BitVec 32))) (Undefined!8796) (MissingVacant!8796 (index!37558 (_ BitVec 32))) )
))
(declare-fun lt!402250 () SeekEntryResult!8796)

(declare-datatypes ((array!52022 0))(
  ( (array!52023 (arr!25017 (Array (_ BitVec 32) (_ BitVec 64))) (size!25461 (_ BitVec 32))) )
))
(declare-datatypes ((V!28993 0))(
  ( (V!28994 (val!9061 Int)) )
))
(declare-datatypes ((ValueCell!8529 0))(
  ( (ValueCellFull!8529 (v!11539 V!28993)) (EmptyCell!8529) )
))
(declare-datatypes ((array!52024 0))(
  ( (array!52025 (arr!25018 (Array (_ BitVec 32) ValueCell!8529)) (size!25462 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4074 0))(
  ( (LongMapFixedSize!4075 (defaultEntry!5234 Int) (mask!25705 (_ BitVec 32)) (extraKeys!4928 (_ BitVec 32)) (zeroValue!5032 V!28993) (minValue!5032 V!28993) (_size!2092 (_ BitVec 32)) (_keys!9917 array!52022) (_values!5219 array!52024) (_vacant!2092 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4074)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890300 (= e!496515 (inRange!0 (index!37556 lt!402250) (mask!25705 thiss!1181)))))

(declare-fun mapNonEmpty!28586 () Bool)

(declare-fun mapRes!28586 () Bool)

(declare-fun tp!55048 () Bool)

(declare-fun e!496516 () Bool)

(assert (=> mapNonEmpty!28586 (= mapRes!28586 (and tp!55048 e!496516))))

(declare-fun mapRest!28586 () (Array (_ BitVec 32) ValueCell!8529))

(declare-fun mapKey!28586 () (_ BitVec 32))

(declare-fun mapValue!28586 () ValueCell!8529)

(assert (=> mapNonEmpty!28586 (= (arr!25018 (_values!5219 thiss!1181)) (store mapRest!28586 mapKey!28586 mapValue!28586))))

(declare-fun b!890301 () Bool)

(declare-fun res!603238 () Bool)

(declare-fun e!496519 () Bool)

(assert (=> b!890301 (=> res!603238 e!496519)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52022 (_ BitVec 32)) Bool)

(assert (=> b!890301 (= res!603238 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9917 thiss!1181) (mask!25705 thiss!1181))))))

(declare-fun b!890302 () Bool)

(declare-fun res!603236 () Bool)

(declare-fun e!496518 () Bool)

(assert (=> b!890302 (=> (not res!603236) (not e!496518))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890302 (= res!603236 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890303 () Bool)

(declare-fun e!496514 () Bool)

(assert (=> b!890303 (= e!496518 (not e!496514))))

(declare-fun res!603233 () Bool)

(assert (=> b!890303 (=> res!603233 e!496514)))

(get-info :version)

(assert (=> b!890303 (= res!603233 (not ((_ is Found!8796) lt!402250)))))

(assert (=> b!890303 e!496515))

(declare-fun res!603235 () Bool)

(assert (=> b!890303 (=> res!603235 e!496515)))

(assert (=> b!890303 (= res!603235 (not ((_ is Found!8796) lt!402250)))))

(declare-datatypes ((Unit!30294 0))(
  ( (Unit!30295) )
))
(declare-fun lt!402249 () Unit!30294)

(declare-fun lemmaSeekEntryGivesInRangeIndex!9 (array!52022 array!52024 (_ BitVec 32) (_ BitVec 32) V!28993 V!28993 (_ BitVec 64)) Unit!30294)

(assert (=> b!890303 (= lt!402249 (lemmaSeekEntryGivesInRangeIndex!9 (_keys!9917 thiss!1181) (_values!5219 thiss!1181) (mask!25705 thiss!1181) (extraKeys!4928 thiss!1181) (zeroValue!5032 thiss!1181) (minValue!5032 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52022 (_ BitVec 32)) SeekEntryResult!8796)

(assert (=> b!890303 (= lt!402250 (seekEntry!0 key!785 (_keys!9917 thiss!1181) (mask!25705 thiss!1181)))))

(declare-fun b!890304 () Bool)

(assert (=> b!890304 (= e!496519 true)))

(declare-fun lt!402247 () Bool)

(declare-datatypes ((List!17716 0))(
  ( (Nil!17713) (Cons!17712 (h!18843 (_ BitVec 64)) (t!25015 List!17716)) )
))
(declare-fun arrayNoDuplicates!0 (array!52022 (_ BitVec 32) List!17716) Bool)

(assert (=> b!890304 (= lt!402247 (arrayNoDuplicates!0 (_keys!9917 thiss!1181) #b00000000000000000000000000000000 Nil!17713))))

(declare-fun b!890305 () Bool)

(declare-fun e!496521 () Bool)

(declare-fun tp_is_empty!18021 () Bool)

(assert (=> b!890305 (= e!496521 tp_is_empty!18021)))

(declare-fun b!890306 () Bool)

(declare-fun e!496517 () Bool)

(assert (=> b!890306 (= e!496517 (and e!496521 mapRes!28586))))

(declare-fun condMapEmpty!28586 () Bool)

(declare-fun mapDefault!28586 () ValueCell!8529)

(assert (=> b!890306 (= condMapEmpty!28586 (= (arr!25018 (_values!5219 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8529)) mapDefault!28586)))))

(declare-fun e!496513 () Bool)

(declare-fun array_inv!19668 (array!52022) Bool)

(declare-fun array_inv!19669 (array!52024) Bool)

(assert (=> b!890307 (= e!496513 (and tp!55047 tp_is_empty!18021 (array_inv!19668 (_keys!9917 thiss!1181)) (array_inv!19669 (_values!5219 thiss!1181)) e!496517))))

(declare-fun b!890308 () Bool)

(assert (=> b!890308 (= e!496514 e!496519)))

(declare-fun res!603239 () Bool)

(assert (=> b!890308 (=> res!603239 e!496519)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890308 (= res!603239 (not (validMask!0 (mask!25705 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52022 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890308 (arrayContainsKey!0 (_keys!9917 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402248 () Unit!30294)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52022 (_ BitVec 64) (_ BitVec 32)) Unit!30294)

(assert (=> b!890308 (= lt!402248 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9917 thiss!1181) key!785 (index!37556 lt!402250)))))

(declare-fun b!890309 () Bool)

(assert (=> b!890309 (= e!496516 tp_is_empty!18021)))

(declare-fun b!890310 () Bool)

(declare-fun res!603237 () Bool)

(assert (=> b!890310 (=> res!603237 e!496519)))

(assert (=> b!890310 (= res!603237 (or (not (= (size!25462 (_values!5219 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25705 thiss!1181)))) (not (= (size!25461 (_keys!9917 thiss!1181)) (size!25462 (_values!5219 thiss!1181)))) (bvslt (mask!25705 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4928 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4928 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28586 () Bool)

(assert (=> mapIsEmpty!28586 mapRes!28586))

(declare-fun res!603234 () Bool)

(assert (=> start!75722 (=> (not res!603234) (not e!496518))))

(declare-fun valid!1581 (LongMapFixedSize!4074) Bool)

(assert (=> start!75722 (= res!603234 (valid!1581 thiss!1181))))

(assert (=> start!75722 e!496518))

(assert (=> start!75722 e!496513))

(assert (=> start!75722 true))

(assert (= (and start!75722 res!603234) b!890302))

(assert (= (and b!890302 res!603236) b!890303))

(assert (= (and b!890303 (not res!603235)) b!890300))

(assert (= (and b!890303 (not res!603233)) b!890308))

(assert (= (and b!890308 (not res!603239)) b!890310))

(assert (= (and b!890310 (not res!603237)) b!890301))

(assert (= (and b!890301 (not res!603238)) b!890304))

(assert (= (and b!890306 condMapEmpty!28586) mapIsEmpty!28586))

(assert (= (and b!890306 (not condMapEmpty!28586)) mapNonEmpty!28586))

(assert (= (and mapNonEmpty!28586 ((_ is ValueCellFull!8529) mapValue!28586)) b!890309))

(assert (= (and b!890306 ((_ is ValueCellFull!8529) mapDefault!28586)) b!890305))

(assert (= b!890307 b!890306))

(assert (= start!75722 b!890307))

(declare-fun m!828885 () Bool)

(assert (=> mapNonEmpty!28586 m!828885))

(declare-fun m!828887 () Bool)

(assert (=> start!75722 m!828887))

(declare-fun m!828889 () Bool)

(assert (=> b!890301 m!828889))

(declare-fun m!828891 () Bool)

(assert (=> b!890304 m!828891))

(declare-fun m!828893 () Bool)

(assert (=> b!890308 m!828893))

(declare-fun m!828895 () Bool)

(assert (=> b!890308 m!828895))

(declare-fun m!828897 () Bool)

(assert (=> b!890308 m!828897))

(declare-fun m!828899 () Bool)

(assert (=> b!890300 m!828899))

(declare-fun m!828901 () Bool)

(assert (=> b!890303 m!828901))

(declare-fun m!828903 () Bool)

(assert (=> b!890303 m!828903))

(declare-fun m!828905 () Bool)

(assert (=> b!890307 m!828905))

(declare-fun m!828907 () Bool)

(assert (=> b!890307 m!828907))

(check-sat (not b!890303) (not b!890300) b_and!25933 (not b!890304) (not b!890301) (not start!75722) (not mapNonEmpty!28586) (not b!890307) (not b!890308) tp_is_empty!18021 (not b_next!15693))
(check-sat b_and!25933 (not b_next!15693))
