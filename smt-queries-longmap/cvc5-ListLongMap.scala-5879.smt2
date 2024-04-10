; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75804 () Bool)

(assert start!75804)

(declare-fun b!891692 () Bool)

(declare-fun b_free!15775 () Bool)

(declare-fun b_next!15775 () Bool)

(assert (=> b!891692 (= b_free!15775 (not b_next!15775))))

(declare-fun tp!55293 () Bool)

(declare-fun b_and!26015 () Bool)

(assert (=> b!891692 (= tp!55293 b_and!26015)))

(declare-fun b!891691 () Bool)

(declare-fun e!497623 () Bool)

(declare-datatypes ((SeekEntryResult!8830 0))(
  ( (MissingZero!8830 (index!37691 (_ BitVec 32))) (Found!8830 (index!37692 (_ BitVec 32))) (Intermediate!8830 (undefined!9642 Bool) (index!37693 (_ BitVec 32)) (x!75774 (_ BitVec 32))) (Undefined!8830) (MissingVacant!8830 (index!37694 (_ BitVec 32))) )
))
(declare-fun lt!402820 () SeekEntryResult!8830)

(declare-datatypes ((array!52186 0))(
  ( (array!52187 (arr!25099 (Array (_ BitVec 32) (_ BitVec 64))) (size!25543 (_ BitVec 32))) )
))
(declare-datatypes ((V!29103 0))(
  ( (V!29104 (val!9102 Int)) )
))
(declare-datatypes ((ValueCell!8570 0))(
  ( (ValueCellFull!8570 (v!11580 V!29103)) (EmptyCell!8570) )
))
(declare-datatypes ((array!52188 0))(
  ( (array!52189 (arr!25100 (Array (_ BitVec 32) ValueCell!8570)) (size!25544 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4156 0))(
  ( (LongMapFixedSize!4157 (defaultEntry!5275 Int) (mask!25774 (_ BitVec 32)) (extraKeys!4969 (_ BitVec 32)) (zeroValue!5073 V!29103) (minValue!5073 V!29103) (_size!2133 (_ BitVec 32)) (_keys!9958 array!52186) (_values!5260 array!52188) (_vacant!2133 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4156)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891691 (= e!497623 (inRange!0 (index!37692 lt!402820) (mask!25774 thiss!1181)))))

(declare-fun e!497626 () Bool)

(declare-fun e!497620 () Bool)

(declare-fun tp_is_empty!18103 () Bool)

(declare-fun array_inv!19718 (array!52186) Bool)

(declare-fun array_inv!19719 (array!52188) Bool)

(assert (=> b!891692 (= e!497626 (and tp!55293 tp_is_empty!18103 (array_inv!19718 (_keys!9958 thiss!1181)) (array_inv!19719 (_values!5260 thiss!1181)) e!497620))))

(declare-fun b!891693 () Bool)

(declare-fun e!497622 () Bool)

(declare-fun e!497627 () Bool)

(assert (=> b!891693 (= e!497622 e!497627)))

(declare-fun res!604138 () Bool)

(assert (=> b!891693 (=> res!604138 e!497627)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891693 (= res!604138 (not (validMask!0 (mask!25774 thiss!1181))))))

(declare-datatypes ((tuple2!11962 0))(
  ( (tuple2!11963 (_1!5992 (_ BitVec 64)) (_2!5992 V!29103)) )
))
(declare-datatypes ((List!17754 0))(
  ( (Nil!17751) (Cons!17750 (h!18881 tuple2!11962) (t!25053 List!17754)) )
))
(declare-datatypes ((ListLongMap!10659 0))(
  ( (ListLongMap!10660 (toList!5345 List!17754)) )
))
(declare-fun lt!402818 () ListLongMap!10659)

(declare-fun contains!4347 (ListLongMap!10659 (_ BitVec 64)) Bool)

(assert (=> b!891693 (contains!4347 lt!402818 (select (arr!25099 (_keys!9958 thiss!1181)) (index!37692 lt!402820)))))

(declare-fun getCurrentListMap!2628 (array!52186 array!52188 (_ BitVec 32) (_ BitVec 32) V!29103 V!29103 (_ BitVec 32) Int) ListLongMap!10659)

(assert (=> b!891693 (= lt!402818 (getCurrentListMap!2628 (_keys!9958 thiss!1181) (_values!5260 thiss!1181) (mask!25774 thiss!1181) (extraKeys!4969 thiss!1181) (zeroValue!5073 thiss!1181) (minValue!5073 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5275 thiss!1181)))))

(declare-datatypes ((Unit!30356 0))(
  ( (Unit!30357) )
))
(declare-fun lt!402817 () Unit!30356)

(declare-fun lemmaValidKeyInArrayIsInListMap!217 (array!52186 array!52188 (_ BitVec 32) (_ BitVec 32) V!29103 V!29103 (_ BitVec 32) Int) Unit!30356)

(assert (=> b!891693 (= lt!402817 (lemmaValidKeyInArrayIsInListMap!217 (_keys!9958 thiss!1181) (_values!5260 thiss!1181) (mask!25774 thiss!1181) (extraKeys!4969 thiss!1181) (zeroValue!5073 thiss!1181) (minValue!5073 thiss!1181) (index!37692 lt!402820) (defaultEntry!5275 thiss!1181)))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52186 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891693 (arrayContainsKey!0 (_keys!9958 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402816 () Unit!30356)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52186 (_ BitVec 64) (_ BitVec 32)) Unit!30356)

(assert (=> b!891693 (= lt!402816 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9958 thiss!1181) key!785 (index!37692 lt!402820)))))

(declare-fun b!891694 () Bool)

(declare-fun res!604134 () Bool)

(assert (=> b!891694 (=> res!604134 e!497627)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52186 (_ BitVec 32)) Bool)

(assert (=> b!891694 (= res!604134 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9958 thiss!1181) (mask!25774 thiss!1181))))))

(declare-fun b!891695 () Bool)

(declare-fun e!497624 () Bool)

(assert (=> b!891695 (= e!497624 tp_is_empty!18103)))

(declare-fun b!891696 () Bool)

(declare-fun res!604132 () Bool)

(assert (=> b!891696 (=> res!604132 e!497627)))

(declare-datatypes ((List!17755 0))(
  ( (Nil!17752) (Cons!17751 (h!18882 (_ BitVec 64)) (t!25054 List!17755)) )
))
(declare-fun arrayNoDuplicates!0 (array!52186 (_ BitVec 32) List!17755) Bool)

(assert (=> b!891696 (= res!604132 (not (arrayNoDuplicates!0 (_keys!9958 thiss!1181) #b00000000000000000000000000000000 Nil!17752)))))

(declare-fun b!891697 () Bool)

(declare-fun e!497621 () Bool)

(assert (=> b!891697 (= e!497621 (not e!497622))))

(declare-fun res!604139 () Bool)

(assert (=> b!891697 (=> res!604139 e!497622)))

(assert (=> b!891697 (= res!604139 (not (is-Found!8830 lt!402820)))))

(assert (=> b!891697 e!497623))

(declare-fun res!604136 () Bool)

(assert (=> b!891697 (=> res!604136 e!497623)))

(assert (=> b!891697 (= res!604136 (not (is-Found!8830 lt!402820)))))

(declare-fun lt!402819 () Unit!30356)

(declare-fun lemmaSeekEntryGivesInRangeIndex!32 (array!52186 array!52188 (_ BitVec 32) (_ BitVec 32) V!29103 V!29103 (_ BitVec 64)) Unit!30356)

(assert (=> b!891697 (= lt!402819 (lemmaSeekEntryGivesInRangeIndex!32 (_keys!9958 thiss!1181) (_values!5260 thiss!1181) (mask!25774 thiss!1181) (extraKeys!4969 thiss!1181) (zeroValue!5073 thiss!1181) (minValue!5073 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52186 (_ BitVec 32)) SeekEntryResult!8830)

(assert (=> b!891697 (= lt!402820 (seekEntry!0 key!785 (_keys!9958 thiss!1181) (mask!25774 thiss!1181)))))

(declare-fun res!604137 () Bool)

(assert (=> start!75804 (=> (not res!604137) (not e!497621))))

(declare-fun valid!1609 (LongMapFixedSize!4156) Bool)

(assert (=> start!75804 (= res!604137 (valid!1609 thiss!1181))))

(assert (=> start!75804 e!497621))

(assert (=> start!75804 e!497626))

(assert (=> start!75804 true))

(declare-fun b!891698 () Bool)

(declare-fun res!604133 () Bool)

(assert (=> b!891698 (=> res!604133 e!497627)))

(assert (=> b!891698 (= res!604133 (or (not (= (size!25544 (_values!5260 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25774 thiss!1181)))) (not (= (size!25543 (_keys!9958 thiss!1181)) (size!25544 (_values!5260 thiss!1181)))) (bvslt (mask!25774 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4969 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4969 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!28709 () Bool)

(declare-fun mapRes!28709 () Bool)

(declare-fun tp!55294 () Bool)

(assert (=> mapNonEmpty!28709 (= mapRes!28709 (and tp!55294 e!497624))))

(declare-fun mapRest!28709 () (Array (_ BitVec 32) ValueCell!8570))

(declare-fun mapValue!28709 () ValueCell!8570)

(declare-fun mapKey!28709 () (_ BitVec 32))

(assert (=> mapNonEmpty!28709 (= (arr!25100 (_values!5260 thiss!1181)) (store mapRest!28709 mapKey!28709 mapValue!28709))))

(declare-fun b!891699 () Bool)

(declare-fun e!497625 () Bool)

(assert (=> b!891699 (= e!497620 (and e!497625 mapRes!28709))))

(declare-fun condMapEmpty!28709 () Bool)

(declare-fun mapDefault!28709 () ValueCell!8570)

