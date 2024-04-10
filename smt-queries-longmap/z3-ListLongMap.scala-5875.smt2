; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75782 () Bool)

(assert start!75782)

(declare-fun b!891295 () Bool)

(declare-fun b_free!15753 () Bool)

(declare-fun b_next!15753 () Bool)

(assert (=> b!891295 (= b_free!15753 (not b_next!15753))))

(declare-fun tp!55228 () Bool)

(declare-fun b_and!25993 () Bool)

(assert (=> b!891295 (= tp!55228 b_and!25993)))

(declare-datatypes ((array!52142 0))(
  ( (array!52143 (arr!25077 (Array (_ BitVec 32) (_ BitVec 64))) (size!25521 (_ BitVec 32))) )
))
(declare-datatypes ((V!29073 0))(
  ( (V!29074 (val!9091 Int)) )
))
(declare-datatypes ((ValueCell!8559 0))(
  ( (ValueCellFull!8559 (v!11569 V!29073)) (EmptyCell!8559) )
))
(declare-datatypes ((array!52144 0))(
  ( (array!52145 (arr!25078 (Array (_ BitVec 32) ValueCell!8559)) (size!25522 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4134 0))(
  ( (LongMapFixedSize!4135 (defaultEntry!5264 Int) (mask!25755 (_ BitVec 32)) (extraKeys!4958 (_ BitVec 32)) (zeroValue!5062 V!29073) (minValue!5062 V!29073) (_size!2122 (_ BitVec 32)) (_keys!9947 array!52142) (_values!5249 array!52144) (_vacant!2122 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4134)

(declare-fun tp_is_empty!18081 () Bool)

(declare-fun e!497330 () Bool)

(declare-fun e!497324 () Bool)

(declare-fun array_inv!19706 (array!52142) Bool)

(declare-fun array_inv!19707 (array!52144) Bool)

(assert (=> b!891295 (= e!497324 (and tp!55228 tp_is_empty!18081 (array_inv!19706 (_keys!9947 thiss!1181)) (array_inv!19707 (_values!5249 thiss!1181)) e!497330))))

(declare-fun b!891296 () Bool)

(declare-fun e!497323 () Bool)

(assert (=> b!891296 (= e!497323 true)))

(declare-fun lt!402622 () Bool)

(declare-datatypes ((tuple2!11944 0))(
  ( (tuple2!11945 (_1!5983 (_ BitVec 64)) (_2!5983 V!29073)) )
))
(declare-datatypes ((List!17738 0))(
  ( (Nil!17735) (Cons!17734 (h!18865 tuple2!11944) (t!25037 List!17738)) )
))
(declare-datatypes ((ListLongMap!10641 0))(
  ( (ListLongMap!10642 (toList!5336 List!17738)) )
))
(declare-fun lt!402619 () ListLongMap!10641)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4338 (ListLongMap!10641 (_ BitVec 64)) Bool)

(assert (=> b!891296 (= lt!402622 (contains!4338 lt!402619 key!785))))

(declare-fun mapNonEmpty!28676 () Bool)

(declare-fun mapRes!28676 () Bool)

(declare-fun tp!55227 () Bool)

(declare-fun e!497326 () Bool)

(assert (=> mapNonEmpty!28676 (= mapRes!28676 (and tp!55227 e!497326))))

(declare-fun mapValue!28676 () ValueCell!8559)

(declare-fun mapKey!28676 () (_ BitVec 32))

(declare-fun mapRest!28676 () (Array (_ BitVec 32) ValueCell!8559))

(assert (=> mapNonEmpty!28676 (= (arr!25078 (_values!5249 thiss!1181)) (store mapRest!28676 mapKey!28676 mapValue!28676))))

(declare-fun b!891297 () Bool)

(declare-fun e!497328 () Bool)

(declare-fun e!497329 () Bool)

(assert (=> b!891297 (= e!497328 (not e!497329))))

(declare-fun res!603870 () Bool)

(assert (=> b!891297 (=> res!603870 e!497329)))

(declare-datatypes ((SeekEntryResult!8821 0))(
  ( (MissingZero!8821 (index!37655 (_ BitVec 32))) (Found!8821 (index!37656 (_ BitVec 32))) (Intermediate!8821 (undefined!9633 Bool) (index!37657 (_ BitVec 32)) (x!75733 (_ BitVec 32))) (Undefined!8821) (MissingVacant!8821 (index!37658 (_ BitVec 32))) )
))
(declare-fun lt!402621 () SeekEntryResult!8821)

(get-info :version)

(assert (=> b!891297 (= res!603870 (not ((_ is Found!8821) lt!402621)))))

(declare-fun e!497325 () Bool)

(assert (=> b!891297 e!497325))

(declare-fun res!603874 () Bool)

(assert (=> b!891297 (=> res!603874 e!497325)))

(assert (=> b!891297 (= res!603874 (not ((_ is Found!8821) lt!402621)))))

(declare-datatypes ((Unit!30338 0))(
  ( (Unit!30339) )
))
(declare-fun lt!402620 () Unit!30338)

(declare-fun lemmaSeekEntryGivesInRangeIndex!26 (array!52142 array!52144 (_ BitVec 32) (_ BitVec 32) V!29073 V!29073 (_ BitVec 64)) Unit!30338)

(assert (=> b!891297 (= lt!402620 (lemmaSeekEntryGivesInRangeIndex!26 (_keys!9947 thiss!1181) (_values!5249 thiss!1181) (mask!25755 thiss!1181) (extraKeys!4958 thiss!1181) (zeroValue!5062 thiss!1181) (minValue!5062 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52142 (_ BitVec 32)) SeekEntryResult!8821)

(assert (=> b!891297 (= lt!402621 (seekEntry!0 key!785 (_keys!9947 thiss!1181) (mask!25755 thiss!1181)))))

(declare-fun b!891298 () Bool)

(declare-fun res!603872 () Bool)

(assert (=> b!891298 (=> res!603872 e!497323)))

(declare-datatypes ((List!17739 0))(
  ( (Nil!17736) (Cons!17735 (h!18866 (_ BitVec 64)) (t!25038 List!17739)) )
))
(declare-fun arrayNoDuplicates!0 (array!52142 (_ BitVec 32) List!17739) Bool)

(assert (=> b!891298 (= res!603872 (not (arrayNoDuplicates!0 (_keys!9947 thiss!1181) #b00000000000000000000000000000000 Nil!17736)))))

(declare-fun b!891300 () Bool)

(declare-fun e!497331 () Bool)

(assert (=> b!891300 (= e!497330 (and e!497331 mapRes!28676))))

(declare-fun condMapEmpty!28676 () Bool)

(declare-fun mapDefault!28676 () ValueCell!8559)

(assert (=> b!891300 (= condMapEmpty!28676 (= (arr!25078 (_values!5249 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8559)) mapDefault!28676)))))

(declare-fun mapIsEmpty!28676 () Bool)

(assert (=> mapIsEmpty!28676 mapRes!28676))

(declare-fun b!891301 () Bool)

(declare-fun res!603873 () Bool)

(assert (=> b!891301 (=> res!603873 e!497323)))

(assert (=> b!891301 (= res!603873 (or (not (= (size!25522 (_values!5249 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25755 thiss!1181)))) (not (= (size!25521 (_keys!9947 thiss!1181)) (size!25522 (_values!5249 thiss!1181)))) (bvslt (mask!25755 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4958 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4958 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891302 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891302 (= e!497325 (inRange!0 (index!37656 lt!402621) (mask!25755 thiss!1181)))))

(declare-fun b!891303 () Bool)

(declare-fun res!603869 () Bool)

(assert (=> b!891303 (=> (not res!603869) (not e!497328))))

(assert (=> b!891303 (= res!603869 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891304 () Bool)

(assert (=> b!891304 (= e!497326 tp_is_empty!18081)))

(declare-fun b!891305 () Bool)

(declare-fun res!603875 () Bool)

(assert (=> b!891305 (=> res!603875 e!497323)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52142 (_ BitVec 32)) Bool)

(assert (=> b!891305 (= res!603875 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9947 thiss!1181) (mask!25755 thiss!1181))))))

(declare-fun b!891306 () Bool)

(assert (=> b!891306 (= e!497329 e!497323)))

(declare-fun res!603868 () Bool)

(assert (=> b!891306 (=> res!603868 e!497323)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891306 (= res!603868 (not (validMask!0 (mask!25755 thiss!1181))))))

(assert (=> b!891306 (contains!4338 lt!402619 (select (arr!25077 (_keys!9947 thiss!1181)) (index!37656 lt!402621)))))

(declare-fun getCurrentListMap!2619 (array!52142 array!52144 (_ BitVec 32) (_ BitVec 32) V!29073 V!29073 (_ BitVec 32) Int) ListLongMap!10641)

(assert (=> b!891306 (= lt!402619 (getCurrentListMap!2619 (_keys!9947 thiss!1181) (_values!5249 thiss!1181) (mask!25755 thiss!1181) (extraKeys!4958 thiss!1181) (zeroValue!5062 thiss!1181) (minValue!5062 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5264 thiss!1181)))))

(declare-fun lt!402618 () Unit!30338)

(declare-fun lemmaValidKeyInArrayIsInListMap!208 (array!52142 array!52144 (_ BitVec 32) (_ BitVec 32) V!29073 V!29073 (_ BitVec 32) Int) Unit!30338)

(assert (=> b!891306 (= lt!402618 (lemmaValidKeyInArrayIsInListMap!208 (_keys!9947 thiss!1181) (_values!5249 thiss!1181) (mask!25755 thiss!1181) (extraKeys!4958 thiss!1181) (zeroValue!5062 thiss!1181) (minValue!5062 thiss!1181) (index!37656 lt!402621) (defaultEntry!5264 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52142 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891306 (arrayContainsKey!0 (_keys!9947 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402617 () Unit!30338)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52142 (_ BitVec 64) (_ BitVec 32)) Unit!30338)

(assert (=> b!891306 (= lt!402617 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9947 thiss!1181) key!785 (index!37656 lt!402621)))))

(declare-fun res!603871 () Bool)

(assert (=> start!75782 (=> (not res!603871) (not e!497328))))

(declare-fun valid!1603 (LongMapFixedSize!4134) Bool)

(assert (=> start!75782 (= res!603871 (valid!1603 thiss!1181))))

(assert (=> start!75782 e!497328))

(assert (=> start!75782 e!497324))

(assert (=> start!75782 true))

(declare-fun b!891299 () Bool)

(assert (=> b!891299 (= e!497331 tp_is_empty!18081)))

(assert (= (and start!75782 res!603871) b!891303))

(assert (= (and b!891303 res!603869) b!891297))

(assert (= (and b!891297 (not res!603874)) b!891302))

(assert (= (and b!891297 (not res!603870)) b!891306))

(assert (= (and b!891306 (not res!603868)) b!891301))

(assert (= (and b!891301 (not res!603873)) b!891305))

(assert (= (and b!891305 (not res!603875)) b!891298))

(assert (= (and b!891298 (not res!603872)) b!891296))

(assert (= (and b!891300 condMapEmpty!28676) mapIsEmpty!28676))

(assert (= (and b!891300 (not condMapEmpty!28676)) mapNonEmpty!28676))

(assert (= (and mapNonEmpty!28676 ((_ is ValueCellFull!8559) mapValue!28676)) b!891304))

(assert (= (and b!891300 ((_ is ValueCellFull!8559) mapDefault!28676)) b!891299))

(assert (= b!891295 b!891300))

(assert (= start!75782 b!891295))

(declare-fun m!829615 () Bool)

(assert (=> b!891305 m!829615))

(declare-fun m!829617 () Bool)

(assert (=> start!75782 m!829617))

(declare-fun m!829619 () Bool)

(assert (=> b!891297 m!829619))

(declare-fun m!829621 () Bool)

(assert (=> b!891297 m!829621))

(declare-fun m!829623 () Bool)

(assert (=> mapNonEmpty!28676 m!829623))

(declare-fun m!829625 () Bool)

(assert (=> b!891306 m!829625))

(declare-fun m!829627 () Bool)

(assert (=> b!891306 m!829627))

(declare-fun m!829629 () Bool)

(assert (=> b!891306 m!829629))

(declare-fun m!829631 () Bool)

(assert (=> b!891306 m!829631))

(assert (=> b!891306 m!829625))

(declare-fun m!829633 () Bool)

(assert (=> b!891306 m!829633))

(declare-fun m!829635 () Bool)

(assert (=> b!891306 m!829635))

(declare-fun m!829637 () Bool)

(assert (=> b!891306 m!829637))

(declare-fun m!829639 () Bool)

(assert (=> b!891296 m!829639))

(declare-fun m!829641 () Bool)

(assert (=> b!891298 m!829641))

(declare-fun m!829643 () Bool)

(assert (=> b!891302 m!829643))

(declare-fun m!829645 () Bool)

(assert (=> b!891295 m!829645))

(declare-fun m!829647 () Bool)

(assert (=> b!891295 m!829647))

(check-sat (not b!891302) (not b_next!15753) (not b!891295) (not b!891296) (not start!75782) (not mapNonEmpty!28676) tp_is_empty!18081 (not b!891297) b_and!25993 (not b!891298) (not b!891306) (not b!891305))
(check-sat b_and!25993 (not b_next!15753))
