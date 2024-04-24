; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75918 () Bool)

(assert start!75918)

(declare-fun b!891666 () Bool)

(declare-fun b_free!15721 () Bool)

(declare-fun b_next!15721 () Bool)

(assert (=> b!891666 (= b_free!15721 (not b_next!15721))))

(declare-fun tp!55132 () Bool)

(declare-fun b_and!25971 () Bool)

(assert (=> b!891666 (= tp!55132 b_and!25971)))

(declare-fun b!891665 () Bool)

(declare-fun res!603872 () Bool)

(declare-fun e!497480 () Bool)

(assert (=> b!891665 (=> (not res!603872) (not e!497480))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!891665 (= res!603872 (not (= key!785 (bvneg key!785))))))

(declare-fun e!497479 () Bool)

(declare-fun e!497476 () Bool)

(declare-datatypes ((array!52117 0))(
  ( (array!52118 (arr!25060 (Array (_ BitVec 32) (_ BitVec 64))) (size!25505 (_ BitVec 32))) )
))
(declare-datatypes ((V!29031 0))(
  ( (V!29032 (val!9075 Int)) )
))
(declare-datatypes ((ValueCell!8543 0))(
  ( (ValueCellFull!8543 (v!11550 V!29031)) (EmptyCell!8543) )
))
(declare-datatypes ((array!52119 0))(
  ( (array!52120 (arr!25061 (Array (_ BitVec 32) ValueCell!8543)) (size!25506 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4102 0))(
  ( (LongMapFixedSize!4103 (defaultEntry!5248 Int) (mask!25772 (_ BitVec 32)) (extraKeys!4942 (_ BitVec 32)) (zeroValue!5046 V!29031) (minValue!5046 V!29031) (_size!2106 (_ BitVec 32)) (_keys!9959 array!52117) (_values!5233 array!52119) (_vacant!2106 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4102)

(declare-fun tp_is_empty!18049 () Bool)

(declare-fun array_inv!19746 (array!52117) Bool)

(declare-fun array_inv!19747 (array!52119) Bool)

(assert (=> b!891666 (= e!497476 (and tp!55132 tp_is_empty!18049 (array_inv!19746 (_keys!9959 thiss!1181)) (array_inv!19747 (_values!5233 thiss!1181)) e!497479))))

(declare-fun b!891667 () Bool)

(declare-fun e!497481 () Bool)

(assert (=> b!891667 (= e!497480 (not e!497481))))

(declare-fun res!603875 () Bool)

(assert (=> b!891667 (=> res!603875 e!497481)))

(declare-datatypes ((SeekEntryResult!8764 0))(
  ( (MissingZero!8764 (index!37427 (_ BitVec 32))) (Found!8764 (index!37428 (_ BitVec 32))) (Intermediate!8764 (undefined!9576 Bool) (index!37429 (_ BitVec 32)) (x!75650 (_ BitVec 32))) (Undefined!8764) (MissingVacant!8764 (index!37430 (_ BitVec 32))) )
))
(declare-fun lt!402779 () SeekEntryResult!8764)

(get-info :version)

(assert (=> b!891667 (= res!603875 (not ((_ is Found!8764) lt!402779)))))

(declare-fun e!497477 () Bool)

(assert (=> b!891667 e!497477))

(declare-fun res!603874 () Bool)

(assert (=> b!891667 (=> res!603874 e!497477)))

(assert (=> b!891667 (= res!603874 (not ((_ is Found!8764) lt!402779)))))

(declare-datatypes ((Unit!30300 0))(
  ( (Unit!30301) )
))
(declare-fun lt!402776 () Unit!30300)

(declare-fun lemmaSeekEntryGivesInRangeIndex!21 (array!52117 array!52119 (_ BitVec 32) (_ BitVec 32) V!29031 V!29031 (_ BitVec 64)) Unit!30300)

(assert (=> b!891667 (= lt!402776 (lemmaSeekEntryGivesInRangeIndex!21 (_keys!9959 thiss!1181) (_values!5233 thiss!1181) (mask!25772 thiss!1181) (extraKeys!4942 thiss!1181) (zeroValue!5046 thiss!1181) (minValue!5046 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52117 (_ BitVec 32)) SeekEntryResult!8764)

(assert (=> b!891667 (= lt!402779 (seekEntry!0 key!785 (_keys!9959 thiss!1181) (mask!25772 thiss!1181)))))

(declare-fun res!603876 () Bool)

(assert (=> start!75918 (=> (not res!603876) (not e!497480))))

(declare-fun valid!1603 (LongMapFixedSize!4102) Bool)

(assert (=> start!75918 (= res!603876 (valid!1603 thiss!1181))))

(assert (=> start!75918 e!497480))

(assert (=> start!75918 e!497476))

(assert (=> start!75918 true))

(declare-fun b!891668 () Bool)

(declare-fun e!497475 () Bool)

(assert (=> b!891668 (= e!497481 e!497475)))

(declare-fun res!603871 () Bool)

(assert (=> b!891668 (=> res!603871 e!497475)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891668 (= res!603871 (not (validMask!0 (mask!25772 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52117 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891668 (arrayContainsKey!0 (_keys!9959 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402777 () Unit!30300)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52117 (_ BitVec 64) (_ BitVec 32)) Unit!30300)

(assert (=> b!891668 (= lt!402777 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9959 thiss!1181) key!785 (index!37428 lt!402779)))))

(declare-fun mapIsEmpty!28628 () Bool)

(declare-fun mapRes!28628 () Bool)

(assert (=> mapIsEmpty!28628 mapRes!28628))

(declare-fun b!891669 () Bool)

(declare-fun e!497474 () Bool)

(assert (=> b!891669 (= e!497474 tp_is_empty!18049)))

(declare-fun b!891670 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891670 (= e!497477 (inRange!0 (index!37428 lt!402779) (mask!25772 thiss!1181)))))

(declare-fun b!891671 () Bool)

(declare-fun res!603873 () Bool)

(assert (=> b!891671 (=> res!603873 e!497475)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52117 (_ BitVec 32)) Bool)

(assert (=> b!891671 (= res!603873 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9959 thiss!1181) (mask!25772 thiss!1181))))))

(declare-fun b!891672 () Bool)

(assert (=> b!891672 (= e!497479 (and e!497474 mapRes!28628))))

(declare-fun condMapEmpty!28628 () Bool)

(declare-fun mapDefault!28628 () ValueCell!8543)

(assert (=> b!891672 (= condMapEmpty!28628 (= (arr!25061 (_values!5233 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8543)) mapDefault!28628)))))

(declare-fun b!891673 () Bool)

(declare-fun res!603877 () Bool)

(assert (=> b!891673 (=> res!603877 e!497475)))

(assert (=> b!891673 (= res!603877 (or (not (= (size!25506 (_values!5233 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25772 thiss!1181)))) (not (= (size!25505 (_keys!9959 thiss!1181)) (size!25506 (_values!5233 thiss!1181)))) (bvslt (mask!25772 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4942 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4942 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891674 () Bool)

(declare-fun e!497473 () Bool)

(assert (=> b!891674 (= e!497473 tp_is_empty!18049)))

(declare-fun b!891675 () Bool)

(assert (=> b!891675 (= e!497475 true)))

(declare-fun lt!402778 () Bool)

(declare-datatypes ((List!17681 0))(
  ( (Nil!17678) (Cons!17677 (h!18814 (_ BitVec 64)) (t!24972 List!17681)) )
))
(declare-fun arrayNoDuplicates!0 (array!52117 (_ BitVec 32) List!17681) Bool)

(assert (=> b!891675 (= lt!402778 (arrayNoDuplicates!0 (_keys!9959 thiss!1181) #b00000000000000000000000000000000 Nil!17678))))

(declare-fun mapNonEmpty!28628 () Bool)

(declare-fun tp!55133 () Bool)

(assert (=> mapNonEmpty!28628 (= mapRes!28628 (and tp!55133 e!497473))))

(declare-fun mapKey!28628 () (_ BitVec 32))

(declare-fun mapValue!28628 () ValueCell!8543)

(declare-fun mapRest!28628 () (Array (_ BitVec 32) ValueCell!8543))

(assert (=> mapNonEmpty!28628 (= (arr!25061 (_values!5233 thiss!1181)) (store mapRest!28628 mapKey!28628 mapValue!28628))))

(assert (= (and start!75918 res!603876) b!891665))

(assert (= (and b!891665 res!603872) b!891667))

(assert (= (and b!891667 (not res!603874)) b!891670))

(assert (= (and b!891667 (not res!603875)) b!891668))

(assert (= (and b!891668 (not res!603871)) b!891673))

(assert (= (and b!891673 (not res!603877)) b!891671))

(assert (= (and b!891671 (not res!603873)) b!891675))

(assert (= (and b!891672 condMapEmpty!28628) mapIsEmpty!28628))

(assert (= (and b!891672 (not condMapEmpty!28628)) mapNonEmpty!28628))

(assert (= (and mapNonEmpty!28628 ((_ is ValueCellFull!8543) mapValue!28628)) b!891674))

(assert (= (and b!891672 ((_ is ValueCellFull!8543) mapDefault!28628)) b!891669))

(assert (= b!891666 b!891672))

(assert (= start!75918 b!891666))

(declare-fun m!830515 () Bool)

(assert (=> b!891667 m!830515))

(declare-fun m!830517 () Bool)

(assert (=> b!891667 m!830517))

(declare-fun m!830519 () Bool)

(assert (=> b!891668 m!830519))

(declare-fun m!830521 () Bool)

(assert (=> b!891668 m!830521))

(declare-fun m!830523 () Bool)

(assert (=> b!891668 m!830523))

(declare-fun m!830525 () Bool)

(assert (=> mapNonEmpty!28628 m!830525))

(declare-fun m!830527 () Bool)

(assert (=> b!891666 m!830527))

(declare-fun m!830529 () Bool)

(assert (=> b!891666 m!830529))

(declare-fun m!830531 () Bool)

(assert (=> start!75918 m!830531))

(declare-fun m!830533 () Bool)

(assert (=> b!891670 m!830533))

(declare-fun m!830535 () Bool)

(assert (=> b!891675 m!830535))

(declare-fun m!830537 () Bool)

(assert (=> b!891671 m!830537))

(check-sat (not mapNonEmpty!28628) (not b!891671) (not start!75918) (not b!891675) (not b!891670) b_and!25971 tp_is_empty!18049 (not b_next!15721) (not b!891666) (not b!891668) (not b!891667))
(check-sat b_and!25971 (not b_next!15721))
