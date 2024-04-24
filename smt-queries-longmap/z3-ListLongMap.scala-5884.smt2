; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!76002 () Bool)

(assert start!76002)

(declare-fun b!893140 () Bool)

(declare-fun b_free!15805 () Bool)

(declare-fun b_next!15805 () Bool)

(assert (=> b!893140 (= b_free!15805 (not b_next!15805))))

(declare-fun tp!55385 () Bool)

(declare-fun b_and!26055 () Bool)

(assert (=> b!893140 (= tp!55385 b_and!26055)))

(declare-fun b!893134 () Bool)

(declare-fun e!498615 () Bool)

(declare-fun e!498608 () Bool)

(assert (=> b!893134 (= e!498615 e!498608)))

(declare-fun res!604840 () Bool)

(assert (=> b!893134 (=> res!604840 e!498608)))

(declare-datatypes ((array!52285 0))(
  ( (array!52286 (arr!25144 (Array (_ BitVec 32) (_ BitVec 64))) (size!25589 (_ BitVec 32))) )
))
(declare-datatypes ((V!29143 0))(
  ( (V!29144 (val!9117 Int)) )
))
(declare-datatypes ((ValueCell!8585 0))(
  ( (ValueCellFull!8585 (v!11592 V!29143)) (EmptyCell!8585) )
))
(declare-datatypes ((array!52287 0))(
  ( (array!52288 (arr!25145 (Array (_ BitVec 32) ValueCell!8585)) (size!25590 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4186 0))(
  ( (LongMapFixedSize!4187 (defaultEntry!5290 Int) (mask!25842 (_ BitVec 32)) (extraKeys!4984 (_ BitVec 32)) (zeroValue!5088 V!29143) (minValue!5088 V!29143) (_size!2148 (_ BitVec 32)) (_keys!10001 array!52285) (_values!5275 array!52287) (_vacant!2148 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4186)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!893134 (= res!604840 (not (validMask!0 (mask!25842 thiss!1181))))))

(declare-datatypes ((tuple2!11906 0))(
  ( (tuple2!11907 (_1!5964 (_ BitVec 64)) (_2!5964 V!29143)) )
))
(declare-datatypes ((List!17730 0))(
  ( (Nil!17727) (Cons!17726 (h!18863 tuple2!11906) (t!25021 List!17730)) )
))
(declare-datatypes ((ListLongMap!10605 0))(
  ( (ListLongMap!10606 (toList!5318 List!17730)) )
))
(declare-fun lt!403447 () ListLongMap!10605)

(declare-datatypes ((SeekEntryResult!8800 0))(
  ( (MissingZero!8800 (index!37571 (_ BitVec 32))) (Found!8800 (index!37572 (_ BitVec 32))) (Intermediate!8800 (undefined!9612 Bool) (index!37573 (_ BitVec 32)) (x!75798 (_ BitVec 32))) (Undefined!8800) (MissingVacant!8800 (index!37574 (_ BitVec 32))) )
))
(declare-fun lt!403451 () SeekEntryResult!8800)

(declare-fun contains!4331 (ListLongMap!10605 (_ BitVec 64)) Bool)

(assert (=> b!893134 (contains!4331 lt!403447 (select (arr!25144 (_keys!10001 thiss!1181)) (index!37572 lt!403451)))))

(declare-fun getCurrentListMap!2595 (array!52285 array!52287 (_ BitVec 32) (_ BitVec 32) V!29143 V!29143 (_ BitVec 32) Int) ListLongMap!10605)

(assert (=> b!893134 (= lt!403447 (getCurrentListMap!2595 (_keys!10001 thiss!1181) (_values!5275 thiss!1181) (mask!25842 thiss!1181) (extraKeys!4984 thiss!1181) (zeroValue!5088 thiss!1181) (minValue!5088 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5290 thiss!1181)))))

(declare-datatypes ((Unit!30368 0))(
  ( (Unit!30369) )
))
(declare-fun lt!403446 () Unit!30368)

(declare-fun lemmaValidKeyInArrayIsInListMap!225 (array!52285 array!52287 (_ BitVec 32) (_ BitVec 32) V!29143 V!29143 (_ BitVec 32) Int) Unit!30368)

(assert (=> b!893134 (= lt!403446 (lemmaValidKeyInArrayIsInListMap!225 (_keys!10001 thiss!1181) (_values!5275 thiss!1181) (mask!25842 thiss!1181) (extraKeys!4984 thiss!1181) (zeroValue!5088 thiss!1181) (minValue!5088 thiss!1181) (index!37572 lt!403451) (defaultEntry!5290 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52285 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!893134 (arrayContainsKey!0 (_keys!10001 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!403449 () Unit!30368)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52285 (_ BitVec 64) (_ BitVec 32)) Unit!30368)

(assert (=> b!893134 (= lt!403449 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10001 thiss!1181) key!785 (index!37572 lt!403451)))))

(declare-fun b!893135 () Bool)

(assert (=> b!893135 (= e!498608 true)))

(declare-fun lt!403450 () Bool)

(assert (=> b!893135 (= lt!403450 (contains!4331 lt!403447 key!785))))

(declare-fun b!893136 () Bool)

(declare-fun res!604842 () Bool)

(assert (=> b!893136 (=> res!604842 e!498608)))

(declare-datatypes ((List!17731 0))(
  ( (Nil!17728) (Cons!17727 (h!18864 (_ BitVec 64)) (t!25022 List!17731)) )
))
(declare-fun arrayNoDuplicates!0 (array!52285 (_ BitVec 32) List!17731) Bool)

(assert (=> b!893136 (= res!604842 (not (arrayNoDuplicates!0 (_keys!10001 thiss!1181) #b00000000000000000000000000000000 Nil!17728)))))

(declare-fun b!893137 () Bool)

(declare-fun e!498610 () Bool)

(assert (=> b!893137 (= e!498610 (not e!498615))))

(declare-fun res!604836 () Bool)

(assert (=> b!893137 (=> res!604836 e!498615)))

(get-info :version)

(assert (=> b!893137 (= res!604836 (not ((_ is Found!8800) lt!403451)))))

(declare-fun e!498614 () Bool)

(assert (=> b!893137 e!498614))

(declare-fun res!604839 () Bool)

(assert (=> b!893137 (=> res!604839 e!498614)))

(assert (=> b!893137 (= res!604839 (not ((_ is Found!8800) lt!403451)))))

(declare-fun lt!403448 () Unit!30368)

(declare-fun lemmaSeekEntryGivesInRangeIndex!50 (array!52285 array!52287 (_ BitVec 32) (_ BitVec 32) V!29143 V!29143 (_ BitVec 64)) Unit!30368)

(assert (=> b!893137 (= lt!403448 (lemmaSeekEntryGivesInRangeIndex!50 (_keys!10001 thiss!1181) (_values!5275 thiss!1181) (mask!25842 thiss!1181) (extraKeys!4984 thiss!1181) (zeroValue!5088 thiss!1181) (minValue!5088 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52285 (_ BitVec 32)) SeekEntryResult!8800)

(assert (=> b!893137 (= lt!403451 (seekEntry!0 key!785 (_keys!10001 thiss!1181) (mask!25842 thiss!1181)))))

(declare-fun b!893139 () Bool)

(declare-fun e!498612 () Bool)

(declare-fun tp_is_empty!18133 () Bool)

(assert (=> b!893139 (= e!498612 tp_is_empty!18133)))

(declare-fun e!498609 () Bool)

(declare-fun e!498611 () Bool)

(declare-fun array_inv!19800 (array!52285) Bool)

(declare-fun array_inv!19801 (array!52287) Bool)

(assert (=> b!893140 (= e!498611 (and tp!55385 tp_is_empty!18133 (array_inv!19800 (_keys!10001 thiss!1181)) (array_inv!19801 (_values!5275 thiss!1181)) e!498609))))

(declare-fun b!893141 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!893141 (= e!498614 (inRange!0 (index!37572 lt!403451) (mask!25842 thiss!1181)))))

(declare-fun b!893142 () Bool)

(declare-fun res!604837 () Bool)

(assert (=> b!893142 (=> (not res!604837) (not e!498610))))

(assert (=> b!893142 (= res!604837 (not (= key!785 (bvneg key!785))))))

(declare-fun b!893143 () Bool)

(declare-fun e!498613 () Bool)

(declare-fun mapRes!28754 () Bool)

(assert (=> b!893143 (= e!498609 (and e!498613 mapRes!28754))))

(declare-fun condMapEmpty!28754 () Bool)

(declare-fun mapDefault!28754 () ValueCell!8585)

(assert (=> b!893143 (= condMapEmpty!28754 (= (arr!25145 (_values!5275 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8585)) mapDefault!28754)))))

(declare-fun mapIsEmpty!28754 () Bool)

(assert (=> mapIsEmpty!28754 mapRes!28754))

(declare-fun b!893144 () Bool)

(assert (=> b!893144 (= e!498613 tp_is_empty!18133)))

(declare-fun b!893138 () Bool)

(declare-fun res!604838 () Bool)

(assert (=> b!893138 (=> res!604838 e!498608)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52285 (_ BitVec 32)) Bool)

(assert (=> b!893138 (= res!604838 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10001 thiss!1181) (mask!25842 thiss!1181))))))

(declare-fun res!604843 () Bool)

(assert (=> start!76002 (=> (not res!604843) (not e!498610))))

(declare-fun valid!1631 (LongMapFixedSize!4186) Bool)

(assert (=> start!76002 (= res!604843 (valid!1631 thiss!1181))))

(assert (=> start!76002 e!498610))

(assert (=> start!76002 e!498611))

(assert (=> start!76002 true))

(declare-fun b!893145 () Bool)

(declare-fun res!604841 () Bool)

(assert (=> b!893145 (=> res!604841 e!498608)))

(assert (=> b!893145 (= res!604841 (or (not (= (size!25590 (_values!5275 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25842 thiss!1181)))) (not (= (size!25589 (_keys!10001 thiss!1181)) (size!25590 (_values!5275 thiss!1181)))) (bvslt (mask!25842 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4984 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4984 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28754 () Bool)

(declare-fun tp!55384 () Bool)

(assert (=> mapNonEmpty!28754 (= mapRes!28754 (and tp!55384 e!498612))))

(declare-fun mapValue!28754 () ValueCell!8585)

(declare-fun mapRest!28754 () (Array (_ BitVec 32) ValueCell!8585))

(declare-fun mapKey!28754 () (_ BitVec 32))

(assert (=> mapNonEmpty!28754 (= (arr!25145 (_values!5275 thiss!1181)) (store mapRest!28754 mapKey!28754 mapValue!28754))))

(assert (= (and start!76002 res!604843) b!893142))

(assert (= (and b!893142 res!604837) b!893137))

(assert (= (and b!893137 (not res!604839)) b!893141))

(assert (= (and b!893137 (not res!604836)) b!893134))

(assert (= (and b!893134 (not res!604840)) b!893145))

(assert (= (and b!893145 (not res!604841)) b!893138))

(assert (= (and b!893138 (not res!604838)) b!893136))

(assert (= (and b!893136 (not res!604842)) b!893135))

(assert (= (and b!893143 condMapEmpty!28754) mapIsEmpty!28754))

(assert (= (and b!893143 (not condMapEmpty!28754)) mapNonEmpty!28754))

(assert (= (and mapNonEmpty!28754 ((_ is ValueCellFull!8585) mapValue!28754)) b!893139))

(assert (= (and b!893143 ((_ is ValueCellFull!8585) mapDefault!28754)) b!893144))

(assert (= b!893140 b!893143))

(assert (= start!76002 b!893140))

(declare-fun m!831793 () Bool)

(assert (=> start!76002 m!831793))

(declare-fun m!831795 () Bool)

(assert (=> b!893135 m!831795))

(declare-fun m!831797 () Bool)

(assert (=> b!893141 m!831797))

(declare-fun m!831799 () Bool)

(assert (=> b!893140 m!831799))

(declare-fun m!831801 () Bool)

(assert (=> b!893140 m!831801))

(declare-fun m!831803 () Bool)

(assert (=> b!893137 m!831803))

(declare-fun m!831805 () Bool)

(assert (=> b!893137 m!831805))

(declare-fun m!831807 () Bool)

(assert (=> mapNonEmpty!28754 m!831807))

(declare-fun m!831809 () Bool)

(assert (=> b!893134 m!831809))

(declare-fun m!831811 () Bool)

(assert (=> b!893134 m!831811))

(declare-fun m!831813 () Bool)

(assert (=> b!893134 m!831813))

(declare-fun m!831815 () Bool)

(assert (=> b!893134 m!831815))

(declare-fun m!831817 () Bool)

(assert (=> b!893134 m!831817))

(declare-fun m!831819 () Bool)

(assert (=> b!893134 m!831819))

(assert (=> b!893134 m!831809))

(declare-fun m!831821 () Bool)

(assert (=> b!893134 m!831821))

(declare-fun m!831823 () Bool)

(assert (=> b!893138 m!831823))

(declare-fun m!831825 () Bool)

(assert (=> b!893136 m!831825))

(check-sat (not b!893135) (not b!893137) (not b!893136) (not start!76002) tp_is_empty!18133 (not b!893140) b_and!26055 (not b!893134) (not mapNonEmpty!28754) (not b_next!15805) (not b!893141) (not b!893138))
(check-sat b_and!26055 (not b_next!15805))
