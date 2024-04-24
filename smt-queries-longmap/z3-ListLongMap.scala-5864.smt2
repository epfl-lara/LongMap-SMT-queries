; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75882 () Bool)

(assert start!75882)

(declare-fun b!891102 () Bool)

(declare-fun b_free!15685 () Bool)

(declare-fun b_next!15685 () Bool)

(assert (=> b!891102 (= b_free!15685 (not b_next!15685))))

(declare-fun tp!55025 () Bool)

(declare-fun b_and!25935 () Bool)

(assert (=> b!891102 (= tp!55025 b_and!25935)))

(declare-fun mapIsEmpty!28574 () Bool)

(declare-fun mapRes!28574 () Bool)

(assert (=> mapIsEmpty!28574 mapRes!28574))

(declare-fun b!891099 () Bool)

(declare-fun e!497007 () Bool)

(assert (=> b!891099 (= e!497007 (not true))))

(declare-fun e!497004 () Bool)

(assert (=> b!891099 e!497004))

(declare-fun res!603522 () Bool)

(assert (=> b!891099 (=> res!603522 e!497004)))

(declare-datatypes ((SeekEntryResult!8749 0))(
  ( (MissingZero!8749 (index!37367 (_ BitVec 32))) (Found!8749 (index!37368 (_ BitVec 32))) (Intermediate!8749 (undefined!9561 Bool) (index!37369 (_ BitVec 32)) (x!75587 (_ BitVec 32))) (Undefined!8749) (MissingVacant!8749 (index!37370 (_ BitVec 32))) )
))
(declare-fun lt!402575 () SeekEntryResult!8749)

(get-info :version)

(assert (=> b!891099 (= res!603522 (not ((_ is Found!8749) lt!402575)))))

(declare-datatypes ((Unit!30270 0))(
  ( (Unit!30271) )
))
(declare-fun lt!402574 () Unit!30270)

(declare-datatypes ((array!52045 0))(
  ( (array!52046 (arr!25024 (Array (_ BitVec 32) (_ BitVec 64))) (size!25469 (_ BitVec 32))) )
))
(declare-datatypes ((V!28983 0))(
  ( (V!28984 (val!9057 Int)) )
))
(declare-datatypes ((ValueCell!8525 0))(
  ( (ValueCellFull!8525 (v!11532 V!28983)) (EmptyCell!8525) )
))
(declare-datatypes ((array!52047 0))(
  ( (array!52048 (arr!25025 (Array (_ BitVec 32) ValueCell!8525)) (size!25470 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4066 0))(
  ( (LongMapFixedSize!4067 (defaultEntry!5230 Int) (mask!25742 (_ BitVec 32)) (extraKeys!4924 (_ BitVec 32)) (zeroValue!5028 V!28983) (minValue!5028 V!28983) (_size!2088 (_ BitVec 32)) (_keys!9941 array!52045) (_values!5215 array!52047) (_vacant!2088 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4066)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun lemmaSeekEntryGivesInRangeIndex!7 (array!52045 array!52047 (_ BitVec 32) (_ BitVec 32) V!28983 V!28983 (_ BitVec 64)) Unit!30270)

(assert (=> b!891099 (= lt!402574 (lemmaSeekEntryGivesInRangeIndex!7 (_keys!9941 thiss!1181) (_values!5215 thiss!1181) (mask!25742 thiss!1181) (extraKeys!4924 thiss!1181) (zeroValue!5028 thiss!1181) (minValue!5028 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52045 (_ BitVec 32)) SeekEntryResult!8749)

(assert (=> b!891099 (= lt!402575 (seekEntry!0 key!785 (_keys!9941 thiss!1181) (mask!25742 thiss!1181)))))

(declare-fun res!603521 () Bool)

(assert (=> start!75882 (=> (not res!603521) (not e!497007))))

(declare-fun valid!1590 (LongMapFixedSize!4066) Bool)

(assert (=> start!75882 (= res!603521 (valid!1590 thiss!1181))))

(assert (=> start!75882 e!497007))

(declare-fun e!497005 () Bool)

(assert (=> start!75882 e!497005))

(assert (=> start!75882 true))

(declare-fun b!891100 () Bool)

(declare-fun res!603523 () Bool)

(assert (=> b!891100 (=> (not res!603523) (not e!497007))))

(assert (=> b!891100 (= res!603523 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891101 () Bool)

(declare-fun e!497002 () Bool)

(declare-fun e!497001 () Bool)

(assert (=> b!891101 (= e!497002 (and e!497001 mapRes!28574))))

(declare-fun condMapEmpty!28574 () Bool)

(declare-fun mapDefault!28574 () ValueCell!8525)

(assert (=> b!891101 (= condMapEmpty!28574 (= (arr!25025 (_values!5215 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8525)) mapDefault!28574)))))

(declare-fun tp_is_empty!18013 () Bool)

(declare-fun array_inv!19720 (array!52045) Bool)

(declare-fun array_inv!19721 (array!52047) Bool)

(assert (=> b!891102 (= e!497005 (and tp!55025 tp_is_empty!18013 (array_inv!19720 (_keys!9941 thiss!1181)) (array_inv!19721 (_values!5215 thiss!1181)) e!497002))))

(declare-fun mapNonEmpty!28574 () Bool)

(declare-fun tp!55024 () Bool)

(declare-fun e!497006 () Bool)

(assert (=> mapNonEmpty!28574 (= mapRes!28574 (and tp!55024 e!497006))))

(declare-fun mapRest!28574 () (Array (_ BitVec 32) ValueCell!8525))

(declare-fun mapKey!28574 () (_ BitVec 32))

(declare-fun mapValue!28574 () ValueCell!8525)

(assert (=> mapNonEmpty!28574 (= (arr!25025 (_values!5215 thiss!1181)) (store mapRest!28574 mapKey!28574 mapValue!28574))))

(declare-fun b!891103 () Bool)

(assert (=> b!891103 (= e!497006 tp_is_empty!18013)))

(declare-fun b!891104 () Bool)

(assert (=> b!891104 (= e!497001 tp_is_empty!18013)))

(declare-fun b!891105 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891105 (= e!497004 (inRange!0 (index!37368 lt!402575) (mask!25742 thiss!1181)))))

(assert (= (and start!75882 res!603521) b!891100))

(assert (= (and b!891100 res!603523) b!891099))

(assert (= (and b!891099 (not res!603522)) b!891105))

(assert (= (and b!891101 condMapEmpty!28574) mapIsEmpty!28574))

(assert (= (and b!891101 (not condMapEmpty!28574)) mapNonEmpty!28574))

(assert (= (and mapNonEmpty!28574 ((_ is ValueCellFull!8525) mapValue!28574)) b!891103))

(assert (= (and b!891101 ((_ is ValueCellFull!8525) mapDefault!28574)) b!891104))

(assert (= b!891102 b!891101))

(assert (= start!75882 b!891102))

(declare-fun m!830113 () Bool)

(assert (=> b!891102 m!830113))

(declare-fun m!830115 () Bool)

(assert (=> b!891102 m!830115))

(declare-fun m!830117 () Bool)

(assert (=> mapNonEmpty!28574 m!830117))

(declare-fun m!830119 () Bool)

(assert (=> start!75882 m!830119))

(declare-fun m!830121 () Bool)

(assert (=> b!891099 m!830121))

(declare-fun m!830123 () Bool)

(assert (=> b!891099 m!830123))

(declare-fun m!830125 () Bool)

(assert (=> b!891105 m!830125))

(check-sat (not mapNonEmpty!28574) tp_is_empty!18013 (not b_next!15685) (not b!891102) (not start!75882) b_and!25935 (not b!891099) (not b!891105))
(check-sat b_and!25935 (not b_next!15685))
