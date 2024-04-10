; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75822 () Bool)

(assert start!75822)

(declare-fun b!892021 () Bool)

(declare-fun b_free!15793 () Bool)

(declare-fun b_next!15793 () Bool)

(assert (=> b!892021 (= b_free!15793 (not b_next!15793))))

(declare-fun tp!55347 () Bool)

(declare-fun b_and!26033 () Bool)

(assert (=> b!892021 (= tp!55347 b_and!26033)))

(declare-fun b!892015 () Bool)

(declare-fun e!497869 () Bool)

(declare-fun tp_is_empty!18121 () Bool)

(assert (=> b!892015 (= e!497869 tp_is_empty!18121)))

(declare-fun b!892016 () Bool)

(declare-fun e!497865 () Bool)

(assert (=> b!892016 (= e!497865 true)))

(declare-fun lt!402977 () Bool)

(declare-datatypes ((V!29127 0))(
  ( (V!29128 (val!9111 Int)) )
))
(declare-datatypes ((tuple2!11978 0))(
  ( (tuple2!11979 (_1!6000 (_ BitVec 64)) (_2!6000 V!29127)) )
))
(declare-datatypes ((List!17768 0))(
  ( (Nil!17765) (Cons!17764 (h!18895 tuple2!11978) (t!25067 List!17768)) )
))
(declare-datatypes ((ListLongMap!10675 0))(
  ( (ListLongMap!10676 (toList!5353 List!17768)) )
))
(declare-fun lt!402982 () ListLongMap!10675)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4355 (ListLongMap!10675 (_ BitVec 64)) Bool)

(assert (=> b!892016 (= lt!402977 (contains!4355 lt!402982 key!785))))

(declare-fun b!892017 () Bool)

(declare-fun res!604355 () Bool)

(assert (=> b!892017 (=> res!604355 e!497865)))

(declare-datatypes ((array!52222 0))(
  ( (array!52223 (arr!25117 (Array (_ BitVec 32) (_ BitVec 64))) (size!25561 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!8579 0))(
  ( (ValueCellFull!8579 (v!11589 V!29127)) (EmptyCell!8579) )
))
(declare-datatypes ((array!52224 0))(
  ( (array!52225 (arr!25118 (Array (_ BitVec 32) ValueCell!8579)) (size!25562 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4174 0))(
  ( (LongMapFixedSize!4175 (defaultEntry!5284 Int) (mask!25789 (_ BitVec 32)) (extraKeys!4978 (_ BitVec 32)) (zeroValue!5082 V!29127) (minValue!5082 V!29127) (_size!2142 (_ BitVec 32)) (_keys!9967 array!52222) (_values!5269 array!52224) (_vacant!2142 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4174)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52222 (_ BitVec 32)) Bool)

(assert (=> b!892017 (= res!604355 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9967 thiss!1181) (mask!25789 thiss!1181))))))

(declare-fun res!604349 () Bool)

(declare-fun e!497864 () Bool)

(assert (=> start!75822 (=> (not res!604349) (not e!497864))))

(declare-fun valid!1616 (LongMapFixedSize!4174) Bool)

(assert (=> start!75822 (= res!604349 (valid!1616 thiss!1181))))

(assert (=> start!75822 e!497864))

(declare-fun e!497863 () Bool)

(assert (=> start!75822 e!497863))

(assert (=> start!75822 true))

(declare-fun b!892018 () Bool)

(declare-fun e!497866 () Bool)

(assert (=> b!892018 (= e!497864 (not e!497866))))

(declare-fun res!604348 () Bool)

(assert (=> b!892018 (=> res!604348 e!497866)))

(declare-datatypes ((SeekEntryResult!8838 0))(
  ( (MissingZero!8838 (index!37723 (_ BitVec 32))) (Found!8838 (index!37724 (_ BitVec 32))) (Intermediate!8838 (undefined!9650 Bool) (index!37725 (_ BitVec 32)) (x!75806 (_ BitVec 32))) (Undefined!8838) (MissingVacant!8838 (index!37726 (_ BitVec 32))) )
))
(declare-fun lt!402979 () SeekEntryResult!8838)

(assert (=> b!892018 (= res!604348 (not (is-Found!8838 lt!402979)))))

(declare-fun e!497871 () Bool)

(assert (=> b!892018 e!497871))

(declare-fun res!604352 () Bool)

(assert (=> b!892018 (=> res!604352 e!497871)))

(assert (=> b!892018 (= res!604352 (not (is-Found!8838 lt!402979)))))

(declare-datatypes ((Unit!30372 0))(
  ( (Unit!30373) )
))
(declare-fun lt!402981 () Unit!30372)

(declare-fun lemmaSeekEntryGivesInRangeIndex!39 (array!52222 array!52224 (_ BitVec 32) (_ BitVec 32) V!29127 V!29127 (_ BitVec 64)) Unit!30372)

(assert (=> b!892018 (= lt!402981 (lemmaSeekEntryGivesInRangeIndex!39 (_keys!9967 thiss!1181) (_values!5269 thiss!1181) (mask!25789 thiss!1181) (extraKeys!4978 thiss!1181) (zeroValue!5082 thiss!1181) (minValue!5082 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52222 (_ BitVec 32)) SeekEntryResult!8838)

(assert (=> b!892018 (= lt!402979 (seekEntry!0 key!785 (_keys!9967 thiss!1181) (mask!25789 thiss!1181)))))

(declare-fun mapNonEmpty!28736 () Bool)

(declare-fun mapRes!28736 () Bool)

(declare-fun tp!55348 () Bool)

(assert (=> mapNonEmpty!28736 (= mapRes!28736 (and tp!55348 e!497869))))

(declare-fun mapValue!28736 () ValueCell!8579)

(declare-fun mapKey!28736 () (_ BitVec 32))

(declare-fun mapRest!28736 () (Array (_ BitVec 32) ValueCell!8579))

(assert (=> mapNonEmpty!28736 (= (arr!25118 (_values!5269 thiss!1181)) (store mapRest!28736 mapKey!28736 mapValue!28736))))

(declare-fun b!892019 () Bool)

(declare-fun res!604354 () Bool)

(assert (=> b!892019 (=> (not res!604354) (not e!497864))))

(assert (=> b!892019 (= res!604354 (not (= key!785 (bvneg key!785))))))

(declare-fun b!892020 () Bool)

(declare-fun res!604351 () Bool)

(assert (=> b!892020 (=> res!604351 e!497865)))

(declare-datatypes ((List!17769 0))(
  ( (Nil!17766) (Cons!17765 (h!18896 (_ BitVec 64)) (t!25068 List!17769)) )
))
(declare-fun arrayNoDuplicates!0 (array!52222 (_ BitVec 32) List!17769) Bool)

(assert (=> b!892020 (= res!604351 (not (arrayNoDuplicates!0 (_keys!9967 thiss!1181) #b00000000000000000000000000000000 Nil!17766)))))

(declare-fun e!497870 () Bool)

(declare-fun array_inv!19732 (array!52222) Bool)

(declare-fun array_inv!19733 (array!52224) Bool)

(assert (=> b!892021 (= e!497863 (and tp!55347 tp_is_empty!18121 (array_inv!19732 (_keys!9967 thiss!1181)) (array_inv!19733 (_values!5269 thiss!1181)) e!497870))))

(declare-fun b!892022 () Bool)

(declare-fun e!497867 () Bool)

(assert (=> b!892022 (= e!497867 tp_is_empty!18121)))

(declare-fun b!892023 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!892023 (= e!497871 (inRange!0 (index!37724 lt!402979) (mask!25789 thiss!1181)))))

(declare-fun b!892024 () Bool)

(assert (=> b!892024 (= e!497866 e!497865)))

(declare-fun res!604350 () Bool)

(assert (=> b!892024 (=> res!604350 e!497865)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!892024 (= res!604350 (not (validMask!0 (mask!25789 thiss!1181))))))

(assert (=> b!892024 (contains!4355 lt!402982 (select (arr!25117 (_keys!9967 thiss!1181)) (index!37724 lt!402979)))))

(declare-fun getCurrentListMap!2635 (array!52222 array!52224 (_ BitVec 32) (_ BitVec 32) V!29127 V!29127 (_ BitVec 32) Int) ListLongMap!10675)

(assert (=> b!892024 (= lt!402982 (getCurrentListMap!2635 (_keys!9967 thiss!1181) (_values!5269 thiss!1181) (mask!25789 thiss!1181) (extraKeys!4978 thiss!1181) (zeroValue!5082 thiss!1181) (minValue!5082 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5284 thiss!1181)))))

(declare-fun lt!402978 () Unit!30372)

(declare-fun lemmaValidKeyInArrayIsInListMap!224 (array!52222 array!52224 (_ BitVec 32) (_ BitVec 32) V!29127 V!29127 (_ BitVec 32) Int) Unit!30372)

(assert (=> b!892024 (= lt!402978 (lemmaValidKeyInArrayIsInListMap!224 (_keys!9967 thiss!1181) (_values!5269 thiss!1181) (mask!25789 thiss!1181) (extraKeys!4978 thiss!1181) (zeroValue!5082 thiss!1181) (minValue!5082 thiss!1181) (index!37724 lt!402979) (defaultEntry!5284 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52222 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!892024 (arrayContainsKey!0 (_keys!9967 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402980 () Unit!30372)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52222 (_ BitVec 64) (_ BitVec 32)) Unit!30372)

(assert (=> b!892024 (= lt!402980 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9967 thiss!1181) key!785 (index!37724 lt!402979)))))

(declare-fun mapIsEmpty!28736 () Bool)

(assert (=> mapIsEmpty!28736 mapRes!28736))

(declare-fun b!892025 () Bool)

(declare-fun res!604353 () Bool)

(assert (=> b!892025 (=> res!604353 e!497865)))

(assert (=> b!892025 (= res!604353 (or (not (= (size!25562 (_values!5269 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25789 thiss!1181)))) (not (= (size!25561 (_keys!9967 thiss!1181)) (size!25562 (_values!5269 thiss!1181)))) (bvslt (mask!25789 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4978 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4978 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!892026 () Bool)

(assert (=> b!892026 (= e!497870 (and e!497867 mapRes!28736))))

(declare-fun condMapEmpty!28736 () Bool)

(declare-fun mapDefault!28736 () ValueCell!8579)

