; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75728 () Bool)

(assert start!75728)

(declare-fun b!890402 () Bool)

(declare-fun b_free!15699 () Bool)

(declare-fun b_next!15699 () Bool)

(assert (=> b!890402 (= b_free!15699 (not b_next!15699))))

(declare-fun tp!55065 () Bool)

(declare-fun b_and!25939 () Bool)

(assert (=> b!890402 (= tp!55065 b_and!25939)))

(declare-fun mapIsEmpty!28595 () Bool)

(declare-fun mapRes!28595 () Bool)

(assert (=> mapIsEmpty!28595 mapRes!28595))

(declare-fun b!890399 () Bool)

(declare-fun res!603298 () Bool)

(declare-fun e!496599 () Bool)

(assert (=> b!890399 (=> (not res!603298) (not e!496599))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890399 (= res!603298 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890400 () Bool)

(declare-fun e!496596 () Bool)

(declare-fun e!496600 () Bool)

(assert (=> b!890400 (= e!496596 (and e!496600 mapRes!28595))))

(declare-fun condMapEmpty!28595 () Bool)

(declare-datatypes ((array!52034 0))(
  ( (array!52035 (arr!25023 (Array (_ BitVec 32) (_ BitVec 64))) (size!25467 (_ BitVec 32))) )
))
(declare-datatypes ((V!29001 0))(
  ( (V!29002 (val!9064 Int)) )
))
(declare-datatypes ((ValueCell!8532 0))(
  ( (ValueCellFull!8532 (v!11542 V!29001)) (EmptyCell!8532) )
))
(declare-datatypes ((array!52036 0))(
  ( (array!52037 (arr!25024 (Array (_ BitVec 32) ValueCell!8532)) (size!25468 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4080 0))(
  ( (LongMapFixedSize!4081 (defaultEntry!5237 Int) (mask!25710 (_ BitVec 32)) (extraKeys!4931 (_ BitVec 32)) (zeroValue!5035 V!29001) (minValue!5035 V!29001) (_size!2095 (_ BitVec 32)) (_keys!9920 array!52034) (_values!5222 array!52036) (_vacant!2095 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4080)

(declare-fun mapDefault!28595 () ValueCell!8532)

(assert (=> b!890400 (= condMapEmpty!28595 (= (arr!25024 (_values!5222 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8532)) mapDefault!28595)))))

(declare-fun b!890401 () Bool)

(declare-fun e!496597 () Bool)

(assert (=> b!890401 (= e!496599 (not e!496597))))

(declare-fun res!603300 () Bool)

(assert (=> b!890401 (=> res!603300 e!496597)))

(declare-datatypes ((SeekEntryResult!8799 0))(
  ( (MissingZero!8799 (index!37567 (_ BitVec 32))) (Found!8799 (index!37568 (_ BitVec 32))) (Intermediate!8799 (undefined!9611 Bool) (index!37569 (_ BitVec 32)) (x!75639 (_ BitVec 32))) (Undefined!8799) (MissingVacant!8799 (index!37570 (_ BitVec 32))) )
))
(declare-fun lt!402285 () SeekEntryResult!8799)

(get-info :version)

(assert (=> b!890401 (= res!603300 (not ((_ is Found!8799) lt!402285)))))

(declare-fun e!496602 () Bool)

(assert (=> b!890401 e!496602))

(declare-fun res!603296 () Bool)

(assert (=> b!890401 (=> res!603296 e!496602)))

(assert (=> b!890401 (= res!603296 (not ((_ is Found!8799) lt!402285)))))

(declare-datatypes ((Unit!30298 0))(
  ( (Unit!30299) )
))
(declare-fun lt!402284 () Unit!30298)

(declare-fun lemmaSeekEntryGivesInRangeIndex!10 (array!52034 array!52036 (_ BitVec 32) (_ BitVec 32) V!29001 V!29001 (_ BitVec 64)) Unit!30298)

(assert (=> b!890401 (= lt!402284 (lemmaSeekEntryGivesInRangeIndex!10 (_keys!9920 thiss!1181) (_values!5222 thiss!1181) (mask!25710 thiss!1181) (extraKeys!4931 thiss!1181) (zeroValue!5035 thiss!1181) (minValue!5035 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52034 (_ BitVec 32)) SeekEntryResult!8799)

(assert (=> b!890401 (= lt!402285 (seekEntry!0 key!785 (_keys!9920 thiss!1181) (mask!25710 thiss!1181)))))

(declare-fun e!496595 () Bool)

(declare-fun tp_is_empty!18027 () Bool)

(declare-fun array_inv!19672 (array!52034) Bool)

(declare-fun array_inv!19673 (array!52036) Bool)

(assert (=> b!890402 (= e!496595 (and tp!55065 tp_is_empty!18027 (array_inv!19672 (_keys!9920 thiss!1181)) (array_inv!19673 (_values!5222 thiss!1181)) e!496596))))

(declare-fun b!890403 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890403 (= e!496602 (inRange!0 (index!37568 lt!402285) (mask!25710 thiss!1181)))))

(declare-fun b!890404 () Bool)

(declare-fun e!496601 () Bool)

(assert (=> b!890404 (= e!496601 tp_is_empty!18027)))

(declare-fun res!603302 () Bool)

(assert (=> start!75728 (=> (not res!603302) (not e!496599))))

(declare-fun valid!1583 (LongMapFixedSize!4080) Bool)

(assert (=> start!75728 (= res!603302 (valid!1583 thiss!1181))))

(assert (=> start!75728 e!496599))

(assert (=> start!75728 e!496595))

(assert (=> start!75728 true))

(declare-fun b!890405 () Bool)

(declare-fun e!496598 () Bool)

(assert (=> b!890405 (= e!496598 true)))

(declare-fun lt!402283 () Bool)

(declare-datatypes ((List!17718 0))(
  ( (Nil!17715) (Cons!17714 (h!18845 (_ BitVec 64)) (t!25017 List!17718)) )
))
(declare-fun arrayNoDuplicates!0 (array!52034 (_ BitVec 32) List!17718) Bool)

(assert (=> b!890405 (= lt!402283 (arrayNoDuplicates!0 (_keys!9920 thiss!1181) #b00000000000000000000000000000000 Nil!17715))))

(declare-fun b!890406 () Bool)

(assert (=> b!890406 (= e!496600 tp_is_empty!18027)))

(declare-fun b!890407 () Bool)

(declare-fun res!603299 () Bool)

(assert (=> b!890407 (=> res!603299 e!496598)))

(assert (=> b!890407 (= res!603299 (or (not (= (size!25468 (_values!5222 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25710 thiss!1181)))) (not (= (size!25467 (_keys!9920 thiss!1181)) (size!25468 (_values!5222 thiss!1181)))) (bvslt (mask!25710 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4931 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4931 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890408 () Bool)

(declare-fun res!603301 () Bool)

(assert (=> b!890408 (=> res!603301 e!496598)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52034 (_ BitVec 32)) Bool)

(assert (=> b!890408 (= res!603301 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9920 thiss!1181) (mask!25710 thiss!1181))))))

(declare-fun b!890409 () Bool)

(assert (=> b!890409 (= e!496597 e!496598)))

(declare-fun res!603297 () Bool)

(assert (=> b!890409 (=> res!603297 e!496598)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890409 (= res!603297 (not (validMask!0 (mask!25710 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52034 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890409 (arrayContainsKey!0 (_keys!9920 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402286 () Unit!30298)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52034 (_ BitVec 64) (_ BitVec 32)) Unit!30298)

(assert (=> b!890409 (= lt!402286 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9920 thiss!1181) key!785 (index!37568 lt!402285)))))

(declare-fun mapNonEmpty!28595 () Bool)

(declare-fun tp!55066 () Bool)

(assert (=> mapNonEmpty!28595 (= mapRes!28595 (and tp!55066 e!496601))))

(declare-fun mapKey!28595 () (_ BitVec 32))

(declare-fun mapRest!28595 () (Array (_ BitVec 32) ValueCell!8532))

(declare-fun mapValue!28595 () ValueCell!8532)

(assert (=> mapNonEmpty!28595 (= (arr!25024 (_values!5222 thiss!1181)) (store mapRest!28595 mapKey!28595 mapValue!28595))))

(assert (= (and start!75728 res!603302) b!890399))

(assert (= (and b!890399 res!603298) b!890401))

(assert (= (and b!890401 (not res!603296)) b!890403))

(assert (= (and b!890401 (not res!603300)) b!890409))

(assert (= (and b!890409 (not res!603297)) b!890407))

(assert (= (and b!890407 (not res!603299)) b!890408))

(assert (= (and b!890408 (not res!603301)) b!890405))

(assert (= (and b!890400 condMapEmpty!28595) mapIsEmpty!28595))

(assert (= (and b!890400 (not condMapEmpty!28595)) mapNonEmpty!28595))

(assert (= (and mapNonEmpty!28595 ((_ is ValueCellFull!8532) mapValue!28595)) b!890404))

(assert (= (and b!890400 ((_ is ValueCellFull!8532) mapDefault!28595)) b!890406))

(assert (= b!890402 b!890400))

(assert (= start!75728 b!890402))

(declare-fun m!828957 () Bool)

(assert (=> mapNonEmpty!28595 m!828957))

(declare-fun m!828959 () Bool)

(assert (=> start!75728 m!828959))

(declare-fun m!828961 () Bool)

(assert (=> b!890408 m!828961))

(declare-fun m!828963 () Bool)

(assert (=> b!890401 m!828963))

(declare-fun m!828965 () Bool)

(assert (=> b!890401 m!828965))

(declare-fun m!828967 () Bool)

(assert (=> b!890405 m!828967))

(declare-fun m!828969 () Bool)

(assert (=> b!890403 m!828969))

(declare-fun m!828971 () Bool)

(assert (=> b!890409 m!828971))

(declare-fun m!828973 () Bool)

(assert (=> b!890409 m!828973))

(declare-fun m!828975 () Bool)

(assert (=> b!890409 m!828975))

(declare-fun m!828977 () Bool)

(assert (=> b!890402 m!828977))

(declare-fun m!828979 () Bool)

(assert (=> b!890402 m!828979))

(check-sat (not start!75728) (not b_next!15699) (not b!890403) (not b!890408) b_and!25939 tp_is_empty!18027 (not b!890405) (not b!890409) (not b!890401) (not b!890402) (not mapNonEmpty!28595))
(check-sat b_and!25939 (not b_next!15699))
