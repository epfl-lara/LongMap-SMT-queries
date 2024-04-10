; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16304 () Bool)

(assert start!16304)

(declare-fun b!162706 () Bool)

(declare-fun b_free!3765 () Bool)

(declare-fun b_next!3765 () Bool)

(assert (=> b!162706 (= b_free!3765 (not b_next!3765))))

(declare-fun tp!13864 () Bool)

(declare-fun b_and!10179 () Bool)

(assert (=> b!162706 (= tp!13864 b_and!10179)))

(declare-fun res!77053 () Bool)

(declare-fun e!106701 () Bool)

(assert (=> start!16304 (=> (not res!77053) (not e!106701))))

(declare-datatypes ((V!4403 0))(
  ( (V!4404 (val!1828 Int)) )
))
(declare-datatypes ((ValueCell!1440 0))(
  ( (ValueCellFull!1440 (v!3693 V!4403)) (EmptyCell!1440) )
))
(declare-datatypes ((array!6213 0))(
  ( (array!6214 (arr!2951 (Array (_ BitVec 32) (_ BitVec 64))) (size!3235 (_ BitVec 32))) )
))
(declare-datatypes ((array!6215 0))(
  ( (array!6216 (arr!2952 (Array (_ BitVec 32) ValueCell!1440)) (size!3236 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1788 0))(
  ( (LongMapFixedSize!1789 (defaultEntry!3336 Int) (mask!7966 (_ BitVec 32)) (extraKeys!3077 (_ BitVec 32)) (zeroValue!3179 V!4403) (minValue!3179 V!4403) (_size!943 (_ BitVec 32)) (_keys!5137 array!6213) (_values!3319 array!6215) (_vacant!943 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1788)

(declare-fun valid!805 (LongMapFixedSize!1788) Bool)

(assert (=> start!16304 (= res!77053 (valid!805 thiss!1248))))

(assert (=> start!16304 e!106701))

(declare-fun e!106700 () Bool)

(assert (=> start!16304 e!106700))

(assert (=> start!16304 true))

(declare-fun tp_is_empty!3567 () Bool)

(assert (=> start!16304 tp_is_empty!3567))

(declare-fun b!162700 () Bool)

(declare-fun res!77054 () Bool)

(assert (=> b!162700 (=> (not res!77054) (not e!106701))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!162700 (= res!77054 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6038 () Bool)

(declare-fun mapRes!6038 () Bool)

(assert (=> mapIsEmpty!6038 mapRes!6038))

(declare-fun b!162701 () Bool)

(declare-fun e!106703 () Bool)

(assert (=> b!162701 (= e!106703 false)))

(declare-datatypes ((SeekEntryResult!389 0))(
  ( (MissingZero!389 (index!3724 (_ BitVec 32))) (Found!389 (index!3725 (_ BitVec 32))) (Intermediate!389 (undefined!1201 Bool) (index!3726 (_ BitVec 32)) (x!18005 (_ BitVec 32))) (Undefined!389) (MissingVacant!389 (index!3727 (_ BitVec 32))) )
))
(declare-fun lt!82527 () SeekEntryResult!389)

(declare-fun v!309 () V!4403)

(declare-fun lt!82528 () Bool)

(declare-datatypes ((tuple2!3010 0))(
  ( (tuple2!3011 (_1!1516 Bool) (_2!1516 LongMapFixedSize!1788)) )
))
(declare-fun updateHelperNewKey!85 (LongMapFixedSize!1788 (_ BitVec 64) V!4403 (_ BitVec 32)) tuple2!3010)

(assert (=> b!162701 (= lt!82528 (valid!805 (_2!1516 (updateHelperNewKey!85 thiss!1248 key!828 v!309 (index!3724 lt!82527)))))))

(declare-fun b!162702 () Bool)

(declare-fun e!106698 () Bool)

(declare-fun e!106704 () Bool)

(assert (=> b!162702 (= e!106698 (and e!106704 mapRes!6038))))

(declare-fun condMapEmpty!6038 () Bool)

(declare-fun mapDefault!6038 () ValueCell!1440)

(assert (=> b!162702 (= condMapEmpty!6038 (= (arr!2952 (_values!3319 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1440)) mapDefault!6038)))))

(declare-fun b!162703 () Bool)

(assert (=> b!162703 (= e!106701 e!106703)))

(declare-fun res!77052 () Bool)

(assert (=> b!162703 (=> (not res!77052) (not e!106703))))

(get-info :version)

(assert (=> b!162703 (= res!77052 (and (not ((_ is Undefined!389) lt!82527)) (not ((_ is MissingVacant!389) lt!82527)) ((_ is MissingZero!389) lt!82527)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6213 (_ BitVec 32)) SeekEntryResult!389)

(assert (=> b!162703 (= lt!82527 (seekEntryOrOpen!0 key!828 (_keys!5137 thiss!1248) (mask!7966 thiss!1248)))))

(declare-fun mapNonEmpty!6038 () Bool)

(declare-fun tp!13865 () Bool)

(declare-fun e!106702 () Bool)

(assert (=> mapNonEmpty!6038 (= mapRes!6038 (and tp!13865 e!106702))))

(declare-fun mapValue!6038 () ValueCell!1440)

(declare-fun mapKey!6038 () (_ BitVec 32))

(declare-fun mapRest!6038 () (Array (_ BitVec 32) ValueCell!1440))

(assert (=> mapNonEmpty!6038 (= (arr!2952 (_values!3319 thiss!1248)) (store mapRest!6038 mapKey!6038 mapValue!6038))))

(declare-fun b!162704 () Bool)

(assert (=> b!162704 (= e!106702 tp_is_empty!3567)))

(declare-fun b!162705 () Bool)

(assert (=> b!162705 (= e!106704 tp_is_empty!3567)))

(declare-fun array_inv!1885 (array!6213) Bool)

(declare-fun array_inv!1886 (array!6215) Bool)

(assert (=> b!162706 (= e!106700 (and tp!13864 tp_is_empty!3567 (array_inv!1885 (_keys!5137 thiss!1248)) (array_inv!1886 (_values!3319 thiss!1248)) e!106698))))

(assert (= (and start!16304 res!77053) b!162700))

(assert (= (and b!162700 res!77054) b!162703))

(assert (= (and b!162703 res!77052) b!162701))

(assert (= (and b!162702 condMapEmpty!6038) mapIsEmpty!6038))

(assert (= (and b!162702 (not condMapEmpty!6038)) mapNonEmpty!6038))

(assert (= (and mapNonEmpty!6038 ((_ is ValueCellFull!1440) mapValue!6038)) b!162704))

(assert (= (and b!162702 ((_ is ValueCellFull!1440) mapDefault!6038)) b!162705))

(assert (= b!162706 b!162702))

(assert (= start!16304 b!162706))

(declare-fun m!193727 () Bool)

(assert (=> b!162703 m!193727))

(declare-fun m!193729 () Bool)

(assert (=> b!162706 m!193729))

(declare-fun m!193731 () Bool)

(assert (=> b!162706 m!193731))

(declare-fun m!193733 () Bool)

(assert (=> mapNonEmpty!6038 m!193733))

(declare-fun m!193735 () Bool)

(assert (=> start!16304 m!193735))

(declare-fun m!193737 () Bool)

(assert (=> b!162701 m!193737))

(declare-fun m!193739 () Bool)

(assert (=> b!162701 m!193739))

(check-sat (not b!162706) tp_is_empty!3567 b_and!10179 (not mapNonEmpty!6038) (not b_next!3765) (not b!162701) (not b!162703) (not start!16304))
(check-sat b_and!10179 (not b_next!3765))
