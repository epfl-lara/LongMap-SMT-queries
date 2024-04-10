; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75750 () Bool)

(assert start!75750)

(declare-fun b!890771 () Bool)

(declare-fun b_free!15721 () Bool)

(declare-fun b_next!15721 () Bool)

(assert (=> b!890771 (= b_free!15721 (not b_next!15721))))

(declare-fun tp!55131 () Bool)

(declare-fun b_and!25961 () Bool)

(assert (=> b!890771 (= tp!55131 b_and!25961)))

(declare-fun b!890762 () Bool)

(declare-fun res!603533 () Bool)

(declare-fun e!496896 () Bool)

(assert (=> b!890762 (=> (not res!603533) (not e!496896))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890762 (= res!603533 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890763 () Bool)

(declare-fun e!496899 () Bool)

(assert (=> b!890763 (= e!496899 true)))

(declare-fun lt!402417 () Bool)

(declare-datatypes ((array!52078 0))(
  ( (array!52079 (arr!25045 (Array (_ BitVec 32) (_ BitVec 64))) (size!25489 (_ BitVec 32))) )
))
(declare-datatypes ((V!29031 0))(
  ( (V!29032 (val!9075 Int)) )
))
(declare-datatypes ((ValueCell!8543 0))(
  ( (ValueCellFull!8543 (v!11553 V!29031)) (EmptyCell!8543) )
))
(declare-datatypes ((array!52080 0))(
  ( (array!52081 (arr!25046 (Array (_ BitVec 32) ValueCell!8543)) (size!25490 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4102 0))(
  ( (LongMapFixedSize!4103 (defaultEntry!5248 Int) (mask!25729 (_ BitVec 32)) (extraKeys!4942 (_ BitVec 32)) (zeroValue!5046 V!29031) (minValue!5046 V!29031) (_size!2106 (_ BitVec 32)) (_keys!9931 array!52078) (_values!5233 array!52080) (_vacant!2106 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4102)

(declare-datatypes ((List!17726 0))(
  ( (Nil!17723) (Cons!17722 (h!18853 (_ BitVec 64)) (t!25025 List!17726)) )
))
(declare-fun arrayNoDuplicates!0 (array!52078 (_ BitVec 32) List!17726) Bool)

(assert (=> b!890763 (= lt!402417 (arrayNoDuplicates!0 (_keys!9931 thiss!1181) #b00000000000000000000000000000000 Nil!17723))))

(declare-fun b!890764 () Bool)

(declare-fun e!496897 () Bool)

(declare-datatypes ((SeekEntryResult!8808 0))(
  ( (MissingZero!8808 (index!37603 (_ BitVec 32))) (Found!8808 (index!37604 (_ BitVec 32))) (Intermediate!8808 (undefined!9620 Bool) (index!37605 (_ BitVec 32)) (x!75680 (_ BitVec 32))) (Undefined!8808) (MissingVacant!8808 (index!37606 (_ BitVec 32))) )
))
(declare-fun lt!402415 () SeekEntryResult!8808)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890764 (= e!496897 (inRange!0 (index!37604 lt!402415) (mask!25729 thiss!1181)))))

(declare-fun res!603527 () Bool)

(assert (=> start!75750 (=> (not res!603527) (not e!496896))))

(declare-fun valid!1592 (LongMapFixedSize!4102) Bool)

(assert (=> start!75750 (= res!603527 (valid!1592 thiss!1181))))

(assert (=> start!75750 e!496896))

(declare-fun e!496895 () Bool)

(assert (=> start!75750 e!496895))

(assert (=> start!75750 true))

(declare-fun b!890765 () Bool)

(declare-fun e!496891 () Bool)

(assert (=> b!890765 (= e!496896 (not e!496891))))

(declare-fun res!603531 () Bool)

(assert (=> b!890765 (=> res!603531 e!496891)))

(assert (=> b!890765 (= res!603531 (not (is-Found!8808 lt!402415)))))

(assert (=> b!890765 e!496897))

(declare-fun res!603532 () Bool)

(assert (=> b!890765 (=> res!603532 e!496897)))

(assert (=> b!890765 (= res!603532 (not (is-Found!8808 lt!402415)))))

(declare-datatypes ((Unit!30314 0))(
  ( (Unit!30315) )
))
(declare-fun lt!402418 () Unit!30314)

(declare-fun lemmaSeekEntryGivesInRangeIndex!17 (array!52078 array!52080 (_ BitVec 32) (_ BitVec 32) V!29031 V!29031 (_ BitVec 64)) Unit!30314)

(assert (=> b!890765 (= lt!402418 (lemmaSeekEntryGivesInRangeIndex!17 (_keys!9931 thiss!1181) (_values!5233 thiss!1181) (mask!25729 thiss!1181) (extraKeys!4942 thiss!1181) (zeroValue!5046 thiss!1181) (minValue!5046 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52078 (_ BitVec 32)) SeekEntryResult!8808)

(assert (=> b!890765 (= lt!402415 (seekEntry!0 key!785 (_keys!9931 thiss!1181) (mask!25729 thiss!1181)))))

(declare-fun b!890766 () Bool)

(assert (=> b!890766 (= e!496891 e!496899)))

(declare-fun res!603529 () Bool)

(assert (=> b!890766 (=> res!603529 e!496899)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890766 (= res!603529 (not (validMask!0 (mask!25729 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52078 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890766 (arrayContainsKey!0 (_keys!9931 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402416 () Unit!30314)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52078 (_ BitVec 64) (_ BitVec 32)) Unit!30314)

(assert (=> b!890766 (= lt!402416 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9931 thiss!1181) key!785 (index!37604 lt!402415)))))

(declare-fun mapIsEmpty!28628 () Bool)

(declare-fun mapRes!28628 () Bool)

(assert (=> mapIsEmpty!28628 mapRes!28628))

(declare-fun mapNonEmpty!28628 () Bool)

(declare-fun tp!55132 () Bool)

(declare-fun e!496894 () Bool)

(assert (=> mapNonEmpty!28628 (= mapRes!28628 (and tp!55132 e!496894))))

(declare-fun mapKey!28628 () (_ BitVec 32))

(declare-fun mapValue!28628 () ValueCell!8543)

(declare-fun mapRest!28628 () (Array (_ BitVec 32) ValueCell!8543))

(assert (=> mapNonEmpty!28628 (= (arr!25046 (_values!5233 thiss!1181)) (store mapRest!28628 mapKey!28628 mapValue!28628))))

(declare-fun b!890767 () Bool)

(declare-fun res!603530 () Bool)

(assert (=> b!890767 (=> res!603530 e!496899)))

(assert (=> b!890767 (= res!603530 (or (not (= (size!25490 (_values!5233 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25729 thiss!1181)))) (not (= (size!25489 (_keys!9931 thiss!1181)) (size!25490 (_values!5233 thiss!1181)))) (bvslt (mask!25729 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4942 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4942 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890768 () Bool)

(declare-fun tp_is_empty!18049 () Bool)

(assert (=> b!890768 (= e!496894 tp_is_empty!18049)))

(declare-fun b!890769 () Bool)

(declare-fun e!496898 () Bool)

(assert (=> b!890769 (= e!496898 tp_is_empty!18049)))

(declare-fun b!890770 () Bool)

(declare-fun res!603528 () Bool)

(assert (=> b!890770 (=> res!603528 e!496899)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52078 (_ BitVec 32)) Bool)

(assert (=> b!890770 (= res!603528 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9931 thiss!1181) (mask!25729 thiss!1181))))))

(declare-fun e!496893 () Bool)

(declare-fun array_inv!19686 (array!52078) Bool)

(declare-fun array_inv!19687 (array!52080) Bool)

(assert (=> b!890771 (= e!496895 (and tp!55131 tp_is_empty!18049 (array_inv!19686 (_keys!9931 thiss!1181)) (array_inv!19687 (_values!5233 thiss!1181)) e!496893))))

(declare-fun b!890772 () Bool)

(assert (=> b!890772 (= e!496893 (and e!496898 mapRes!28628))))

(declare-fun condMapEmpty!28628 () Bool)

(declare-fun mapDefault!28628 () ValueCell!8543)

