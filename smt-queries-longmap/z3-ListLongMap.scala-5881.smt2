; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75798 () Bool)

(assert start!75798)

(declare-fun b!891676 () Bool)

(declare-fun b_free!15787 () Bool)

(declare-fun b_next!15787 () Bool)

(assert (=> b!891676 (= b_free!15787 (not b_next!15787))))

(declare-fun tp!55330 () Bool)

(declare-fun b_and!26001 () Bool)

(assert (=> b!891676 (= tp!55330 b_and!26001)))

(declare-fun b!891669 () Bool)

(declare-fun e!497639 () Bool)

(declare-fun e!497638 () Bool)

(assert (=> b!891669 (= e!497639 e!497638)))

(declare-fun res!604168 () Bool)

(assert (=> b!891669 (=> res!604168 e!497638)))

(declare-datatypes ((array!52193 0))(
  ( (array!52194 (arr!25103 (Array (_ BitVec 32) (_ BitVec 64))) (size!25549 (_ BitVec 32))) )
))
(declare-datatypes ((V!29119 0))(
  ( (V!29120 (val!9108 Int)) )
))
(declare-datatypes ((ValueCell!8576 0))(
  ( (ValueCellFull!8576 (v!11580 V!29119)) (EmptyCell!8576) )
))
(declare-datatypes ((array!52195 0))(
  ( (array!52196 (arr!25104 (Array (_ BitVec 32) ValueCell!8576)) (size!25550 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4168 0))(
  ( (LongMapFixedSize!4169 (defaultEntry!5281 Int) (mask!25777 (_ BitVec 32)) (extraKeys!4975 (_ BitVec 32)) (zeroValue!5079 V!29119) (minValue!5079 V!29119) (_size!2139 (_ BitVec 32)) (_keys!9959 array!52193) (_values!5266 array!52195) (_vacant!2139 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4168)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891669 (= res!604168 (not (validMask!0 (mask!25777 thiss!1181))))))

(declare-datatypes ((tuple2!11986 0))(
  ( (tuple2!11987 (_1!6004 (_ BitVec 64)) (_2!6004 V!29119)) )
))
(declare-datatypes ((List!17767 0))(
  ( (Nil!17764) (Cons!17763 (h!18894 tuple2!11986) (t!25057 List!17767)) )
))
(declare-datatypes ((ListLongMap!10673 0))(
  ( (ListLongMap!10674 (toList!5352 List!17767)) )
))
(declare-fun lt!402692 () ListLongMap!10673)

(declare-datatypes ((SeekEntryResult!8839 0))(
  ( (MissingZero!8839 (index!37727 (_ BitVec 32))) (Found!8839 (index!37728 (_ BitVec 32))) (Intermediate!8839 (undefined!9651 Bool) (index!37729 (_ BitVec 32)) (x!75794 (_ BitVec 32))) (Undefined!8839) (MissingVacant!8839 (index!37730 (_ BitVec 32))) )
))
(declare-fun lt!402689 () SeekEntryResult!8839)

(declare-fun contains!4322 (ListLongMap!10673 (_ BitVec 64)) Bool)

(assert (=> b!891669 (contains!4322 lt!402692 (select (arr!25103 (_keys!9959 thiss!1181)) (index!37728 lt!402689)))))

(declare-fun getCurrentListMap!2580 (array!52193 array!52195 (_ BitVec 32) (_ BitVec 32) V!29119 V!29119 (_ BitVec 32) Int) ListLongMap!10673)

(assert (=> b!891669 (= lt!402692 (getCurrentListMap!2580 (_keys!9959 thiss!1181) (_values!5266 thiss!1181) (mask!25777 thiss!1181) (extraKeys!4975 thiss!1181) (zeroValue!5079 thiss!1181) (minValue!5079 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5281 thiss!1181)))))

(declare-datatypes ((Unit!30312 0))(
  ( (Unit!30313) )
))
(declare-fun lt!402688 () Unit!30312)

(declare-fun lemmaValidKeyInArrayIsInListMap!216 (array!52193 array!52195 (_ BitVec 32) (_ BitVec 32) V!29119 V!29119 (_ BitVec 32) Int) Unit!30312)

(assert (=> b!891669 (= lt!402688 (lemmaValidKeyInArrayIsInListMap!216 (_keys!9959 thiss!1181) (_values!5266 thiss!1181) (mask!25777 thiss!1181) (extraKeys!4975 thiss!1181) (zeroValue!5079 thiss!1181) (minValue!5079 thiss!1181) (index!37728 lt!402689) (defaultEntry!5281 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52193 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891669 (arrayContainsKey!0 (_keys!9959 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402690 () Unit!30312)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52193 (_ BitVec 64) (_ BitVec 32)) Unit!30312)

(assert (=> b!891669 (= lt!402690 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9959 thiss!1181) key!785 (index!37728 lt!402689)))))

(declare-fun b!891670 () Bool)

(declare-fun e!497641 () Bool)

(declare-fun tp_is_empty!18115 () Bool)

(assert (=> b!891670 (= e!497641 tp_is_empty!18115)))

(declare-fun b!891671 () Bool)

(declare-fun e!497635 () Bool)

(assert (=> b!891671 (= e!497635 tp_is_empty!18115)))

(declare-fun b!891672 () Bool)

(assert (=> b!891672 (= e!497638 true)))

(declare-fun lt!402687 () Bool)

(assert (=> b!891672 (= lt!402687 (contains!4322 lt!402692 key!785))))

(declare-fun mapIsEmpty!28727 () Bool)

(declare-fun mapRes!28727 () Bool)

(assert (=> mapIsEmpty!28727 mapRes!28727))

(declare-fun b!891673 () Bool)

(declare-fun res!604167 () Bool)

(assert (=> b!891673 (=> res!604167 e!497638)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52193 (_ BitVec 32)) Bool)

(assert (=> b!891673 (= res!604167 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9959 thiss!1181) (mask!25777 thiss!1181))))))

(declare-fun res!604171 () Bool)

(declare-fun e!497636 () Bool)

(assert (=> start!75798 (=> (not res!604171) (not e!497636))))

(declare-fun valid!1619 (LongMapFixedSize!4168) Bool)

(assert (=> start!75798 (= res!604171 (valid!1619 thiss!1181))))

(assert (=> start!75798 e!497636))

(declare-fun e!497640 () Bool)

(assert (=> start!75798 e!497640))

(assert (=> start!75798 true))

(declare-fun b!891668 () Bool)

(declare-fun e!497637 () Bool)

(assert (=> b!891668 (= e!497637 (and e!497635 mapRes!28727))))

(declare-fun condMapEmpty!28727 () Bool)

(declare-fun mapDefault!28727 () ValueCell!8576)

(assert (=> b!891668 (= condMapEmpty!28727 (= (arr!25104 (_values!5266 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8576)) mapDefault!28727)))))

(declare-fun b!891674 () Bool)

(declare-fun res!604166 () Bool)

(assert (=> b!891674 (=> res!604166 e!497638)))

(assert (=> b!891674 (= res!604166 (or (not (= (size!25550 (_values!5266 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25777 thiss!1181)))) (not (= (size!25549 (_keys!9959 thiss!1181)) (size!25550 (_values!5266 thiss!1181)))) (bvslt (mask!25777 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4975 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4975 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891675 () Bool)

(declare-fun res!604169 () Bool)

(assert (=> b!891675 (=> (not res!604169) (not e!497636))))

(assert (=> b!891675 (= res!604169 (not (= key!785 (bvneg key!785))))))

(declare-fun array_inv!19782 (array!52193) Bool)

(declare-fun array_inv!19783 (array!52195) Bool)

(assert (=> b!891676 (= e!497640 (and tp!55330 tp_is_empty!18115 (array_inv!19782 (_keys!9959 thiss!1181)) (array_inv!19783 (_values!5266 thiss!1181)) e!497637))))

(declare-fun mapNonEmpty!28727 () Bool)

(declare-fun tp!55331 () Bool)

(assert (=> mapNonEmpty!28727 (= mapRes!28727 (and tp!55331 e!497641))))

(declare-fun mapValue!28727 () ValueCell!8576)

(declare-fun mapKey!28727 () (_ BitVec 32))

(declare-fun mapRest!28727 () (Array (_ BitVec 32) ValueCell!8576))

(assert (=> mapNonEmpty!28727 (= (arr!25104 (_values!5266 thiss!1181)) (store mapRest!28727 mapKey!28727 mapValue!28727))))

(declare-fun b!891677 () Bool)

(declare-fun e!497634 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891677 (= e!497634 (inRange!0 (index!37728 lt!402689) (mask!25777 thiss!1181)))))

(declare-fun b!891678 () Bool)

(declare-fun res!604173 () Bool)

(assert (=> b!891678 (=> res!604173 e!497638)))

(declare-datatypes ((List!17768 0))(
  ( (Nil!17765) (Cons!17764 (h!18895 (_ BitVec 64)) (t!25058 List!17768)) )
))
(declare-fun arrayNoDuplicates!0 (array!52193 (_ BitVec 32) List!17768) Bool)

(assert (=> b!891678 (= res!604173 (not (arrayNoDuplicates!0 (_keys!9959 thiss!1181) #b00000000000000000000000000000000 Nil!17765)))))

(declare-fun b!891679 () Bool)

(assert (=> b!891679 (= e!497636 (not e!497639))))

(declare-fun res!604172 () Bool)

(assert (=> b!891679 (=> res!604172 e!497639)))

(get-info :version)

(assert (=> b!891679 (= res!604172 (not ((_ is Found!8839) lt!402689)))))

(assert (=> b!891679 e!497634))

(declare-fun res!604170 () Bool)

(assert (=> b!891679 (=> res!604170 e!497634)))

(assert (=> b!891679 (= res!604170 (not ((_ is Found!8839) lt!402689)))))

(declare-fun lt!402691 () Unit!30312)

(declare-fun lemmaSeekEntryGivesInRangeIndex!44 (array!52193 array!52195 (_ BitVec 32) (_ BitVec 32) V!29119 V!29119 (_ BitVec 64)) Unit!30312)

(assert (=> b!891679 (= lt!402691 (lemmaSeekEntryGivesInRangeIndex!44 (_keys!9959 thiss!1181) (_values!5266 thiss!1181) (mask!25777 thiss!1181) (extraKeys!4975 thiss!1181) (zeroValue!5079 thiss!1181) (minValue!5079 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52193 (_ BitVec 32)) SeekEntryResult!8839)

(assert (=> b!891679 (= lt!402689 (seekEntry!0 key!785 (_keys!9959 thiss!1181) (mask!25777 thiss!1181)))))

(assert (= (and start!75798 res!604171) b!891675))

(assert (= (and b!891675 res!604169) b!891679))

(assert (= (and b!891679 (not res!604170)) b!891677))

(assert (= (and b!891679 (not res!604172)) b!891669))

(assert (= (and b!891669 (not res!604168)) b!891674))

(assert (= (and b!891674 (not res!604166)) b!891673))

(assert (= (and b!891673 (not res!604167)) b!891678))

(assert (= (and b!891678 (not res!604173)) b!891672))

(assert (= (and b!891668 condMapEmpty!28727) mapIsEmpty!28727))

(assert (= (and b!891668 (not condMapEmpty!28727)) mapNonEmpty!28727))

(assert (= (and mapNonEmpty!28727 ((_ is ValueCellFull!8576) mapValue!28727)) b!891670))

(assert (= (and b!891668 ((_ is ValueCellFull!8576) mapDefault!28727)) b!891671))

(assert (= b!891676 b!891668))

(assert (= start!75798 b!891676))

(declare-fun m!829435 () Bool)

(assert (=> b!891669 m!829435))

(declare-fun m!829437 () Bool)

(assert (=> b!891669 m!829437))

(declare-fun m!829439 () Bool)

(assert (=> b!891669 m!829439))

(declare-fun m!829441 () Bool)

(assert (=> b!891669 m!829441))

(declare-fun m!829443 () Bool)

(assert (=> b!891669 m!829443))

(declare-fun m!829445 () Bool)

(assert (=> b!891669 m!829445))

(assert (=> b!891669 m!829443))

(declare-fun m!829447 () Bool)

(assert (=> b!891669 m!829447))

(declare-fun m!829449 () Bool)

(assert (=> b!891676 m!829449))

(declare-fun m!829451 () Bool)

(assert (=> b!891676 m!829451))

(declare-fun m!829453 () Bool)

(assert (=> b!891673 m!829453))

(declare-fun m!829455 () Bool)

(assert (=> b!891678 m!829455))

(declare-fun m!829457 () Bool)

(assert (=> mapNonEmpty!28727 m!829457))

(declare-fun m!829459 () Bool)

(assert (=> b!891679 m!829459))

(declare-fun m!829461 () Bool)

(assert (=> b!891679 m!829461))

(declare-fun m!829463 () Bool)

(assert (=> b!891672 m!829463))

(declare-fun m!829465 () Bool)

(assert (=> start!75798 m!829465))

(declare-fun m!829467 () Bool)

(assert (=> b!891677 m!829467))

(check-sat (not b!891678) (not b!891676) (not b!891669) (not start!75798) (not b!891677) (not b_next!15787) (not b!891672) tp_is_empty!18115 (not b!891673) (not mapNonEmpty!28727) b_and!26001 (not b!891679))
(check-sat b_and!26001 (not b_next!15787))
