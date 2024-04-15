; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!75762 () Bool)

(assert start!75762)

(declare-fun b!891031 () Bool)

(declare-fun b_free!15751 () Bool)

(declare-fun b_next!15751 () Bool)

(assert (=> b!891031 (= b_free!15751 (not b_next!15751))))

(declare-fun tp!55223 () Bool)

(declare-fun b_and!25965 () Bool)

(assert (=> b!891031 (= tp!55223 b_and!25965)))

(declare-fun res!603739 () Bool)

(declare-fun e!497154 () Bool)

(assert (=> start!75762 (=> (not res!603739) (not e!497154))))

(declare-datatypes ((array!52121 0))(
  ( (array!52122 (arr!25067 (Array (_ BitVec 32) (_ BitVec 64))) (size!25513 (_ BitVec 32))) )
))
(declare-datatypes ((V!29071 0))(
  ( (V!29072 (val!9090 Int)) )
))
(declare-datatypes ((ValueCell!8558 0))(
  ( (ValueCellFull!8558 (v!11562 V!29071)) (EmptyCell!8558) )
))
(declare-datatypes ((array!52123 0))(
  ( (array!52124 (arr!25068 (Array (_ BitVec 32) ValueCell!8558)) (size!25514 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4132 0))(
  ( (LongMapFixedSize!4133 (defaultEntry!5263 Int) (mask!25747 (_ BitVec 32)) (extraKeys!4957 (_ BitVec 32)) (zeroValue!5061 V!29071) (minValue!5061 V!29071) (_size!2121 (_ BitVec 32)) (_keys!9941 array!52121) (_values!5248 array!52123) (_vacant!2121 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4132)

(declare-fun valid!1610 (LongMapFixedSize!4132) Bool)

(assert (=> start!75762 (= res!603739 (valid!1610 thiss!1181))))

(assert (=> start!75762 e!497154))

(declare-fun e!497150 () Bool)

(assert (=> start!75762 e!497150))

(assert (=> start!75762 true))

(declare-fun mapIsEmpty!28673 () Bool)

(declare-fun mapRes!28673 () Bool)

(assert (=> mapIsEmpty!28673 mapRes!28673))

(declare-fun b!891020 () Bool)

(declare-fun e!497153 () Bool)

(declare-fun tp_is_empty!18079 () Bool)

(assert (=> b!891020 (= e!497153 tp_is_empty!18079)))

(declare-fun b!891021 () Bool)

(declare-fun e!497149 () Bool)

(assert (=> b!891021 (= e!497149 tp_is_empty!18079)))

(declare-fun mapNonEmpty!28673 () Bool)

(declare-fun tp!55222 () Bool)

(assert (=> mapNonEmpty!28673 (= mapRes!28673 (and tp!55222 e!497153))))

(declare-fun mapKey!28673 () (_ BitVec 32))

(declare-fun mapRest!28673 () (Array (_ BitVec 32) ValueCell!8558))

(declare-fun mapValue!28673 () ValueCell!8558)

(assert (=> mapNonEmpty!28673 (= (arr!25068 (_values!5248 thiss!1181)) (store mapRest!28673 mapKey!28673 mapValue!28673))))

(declare-fun b!891022 () Bool)

(declare-fun res!603741 () Bool)

(declare-fun e!497148 () Bool)

(assert (=> b!891022 (=> res!603741 e!497148)))

(assert (=> b!891022 (= res!603741 (or (not (= (size!25514 (_values!5248 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25747 thiss!1181)))) (not (= (size!25513 (_keys!9941 thiss!1181)) (size!25514 (_values!5248 thiss!1181)))) (bvslt (mask!25747 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4957 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4957 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!891023 () Bool)

(declare-fun e!497152 () Bool)

(assert (=> b!891023 (= e!497152 (and e!497149 mapRes!28673))))

(declare-fun condMapEmpty!28673 () Bool)

(declare-fun mapDefault!28673 () ValueCell!8558)

(assert (=> b!891023 (= condMapEmpty!28673 (= (arr!25068 (_values!5248 thiss!1181)) ((as const (Array (_ BitVec 32) ValueCell!8558)) mapDefault!28673)))))

(declare-fun b!891024 () Bool)

(assert (=> b!891024 (= e!497148 true)))

(declare-fun lt!402364 () Bool)

(declare-datatypes ((tuple2!11964 0))(
  ( (tuple2!11965 (_1!5993 (_ BitVec 64)) (_2!5993 V!29071)) )
))
(declare-datatypes ((List!17746 0))(
  ( (Nil!17743) (Cons!17742 (h!18873 tuple2!11964) (t!25036 List!17746)) )
))
(declare-datatypes ((ListLongMap!10651 0))(
  ( (ListLongMap!10652 (toList!5341 List!17746)) )
))
(declare-fun lt!402363 () ListLongMap!10651)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4311 (ListLongMap!10651 (_ BitVec 64)) Bool)

(assert (=> b!891024 (= lt!402364 (contains!4311 lt!402363 key!785))))

(declare-fun b!891025 () Bool)

(declare-fun e!497156 () Bool)

(declare-datatypes ((SeekEntryResult!8823 0))(
  ( (MissingZero!8823 (index!37663 (_ BitVec 32))) (Found!8823 (index!37664 (_ BitVec 32))) (Intermediate!8823 (undefined!9635 Bool) (index!37665 (_ BitVec 32)) (x!75730 (_ BitVec 32))) (Undefined!8823) (MissingVacant!8823 (index!37666 (_ BitVec 32))) )
))
(declare-fun lt!402367 () SeekEntryResult!8823)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!891025 (= e!497156 (inRange!0 (index!37664 lt!402367) (mask!25747 thiss!1181)))))

(declare-fun b!891026 () Bool)

(declare-fun e!497151 () Bool)

(assert (=> b!891026 (= e!497151 e!497148)))

(declare-fun res!603734 () Bool)

(assert (=> b!891026 (=> res!603734 e!497148)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891026 (= res!603734 (not (validMask!0 (mask!25747 thiss!1181))))))

(assert (=> b!891026 (contains!4311 lt!402363 (select (arr!25067 (_keys!9941 thiss!1181)) (index!37664 lt!402367)))))

(declare-fun getCurrentListMap!2569 (array!52121 array!52123 (_ BitVec 32) (_ BitVec 32) V!29071 V!29071 (_ BitVec 32) Int) ListLongMap!10651)

(assert (=> b!891026 (= lt!402363 (getCurrentListMap!2569 (_keys!9941 thiss!1181) (_values!5248 thiss!1181) (mask!25747 thiss!1181) (extraKeys!4957 thiss!1181) (zeroValue!5061 thiss!1181) (minValue!5061 thiss!1181) #b00000000000000000000000000000000 (defaultEntry!5263 thiss!1181)))))

(declare-datatypes ((Unit!30282 0))(
  ( (Unit!30283) )
))
(declare-fun lt!402368 () Unit!30282)

(declare-fun lemmaValidKeyInArrayIsInListMap!205 (array!52121 array!52123 (_ BitVec 32) (_ BitVec 32) V!29071 V!29071 (_ BitVec 32) Int) Unit!30282)

(assert (=> b!891026 (= lt!402368 (lemmaValidKeyInArrayIsInListMap!205 (_keys!9941 thiss!1181) (_values!5248 thiss!1181) (mask!25747 thiss!1181) (extraKeys!4957 thiss!1181) (zeroValue!5061 thiss!1181) (minValue!5061 thiss!1181) (index!37664 lt!402367) (defaultEntry!5263 thiss!1181)))))

(declare-fun arrayContainsKey!0 (array!52121 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891026 (arrayContainsKey!0 (_keys!9941 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-fun lt!402366 () Unit!30282)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52121 (_ BitVec 64) (_ BitVec 32)) Unit!30282)

(assert (=> b!891026 (= lt!402366 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9941 thiss!1181) key!785 (index!37664 lt!402367)))))

(declare-fun b!891027 () Bool)

(declare-fun res!603736 () Bool)

(assert (=> b!891027 (=> (not res!603736) (not e!497154))))

(assert (=> b!891027 (= res!603736 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891028 () Bool)

(declare-fun res!603738 () Bool)

(assert (=> b!891028 (=> res!603738 e!497148)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52121 (_ BitVec 32)) Bool)

(assert (=> b!891028 (= res!603738 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9941 thiss!1181) (mask!25747 thiss!1181))))))

(declare-fun b!891029 () Bool)

(assert (=> b!891029 (= e!497154 (not e!497151))))

(declare-fun res!603737 () Bool)

(assert (=> b!891029 (=> res!603737 e!497151)))

(get-info :version)

(assert (=> b!891029 (= res!603737 (not ((_ is Found!8823) lt!402367)))))

(assert (=> b!891029 e!497156))

(declare-fun res!603735 () Bool)

(assert (=> b!891029 (=> res!603735 e!497156)))

(assert (=> b!891029 (= res!603735 (not ((_ is Found!8823) lt!402367)))))

(declare-fun lt!402365 () Unit!30282)

(declare-fun lemmaSeekEntryGivesInRangeIndex!30 (array!52121 array!52123 (_ BitVec 32) (_ BitVec 32) V!29071 V!29071 (_ BitVec 64)) Unit!30282)

(assert (=> b!891029 (= lt!402365 (lemmaSeekEntryGivesInRangeIndex!30 (_keys!9941 thiss!1181) (_values!5248 thiss!1181) (mask!25747 thiss!1181) (extraKeys!4957 thiss!1181) (zeroValue!5061 thiss!1181) (minValue!5061 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52121 (_ BitVec 32)) SeekEntryResult!8823)

(assert (=> b!891029 (= lt!402367 (seekEntry!0 key!785 (_keys!9941 thiss!1181) (mask!25747 thiss!1181)))))

(declare-fun b!891030 () Bool)

(declare-fun res!603740 () Bool)

(assert (=> b!891030 (=> res!603740 e!497148)))

(declare-datatypes ((List!17747 0))(
  ( (Nil!17744) (Cons!17743 (h!18874 (_ BitVec 64)) (t!25037 List!17747)) )
))
(declare-fun arrayNoDuplicates!0 (array!52121 (_ BitVec 32) List!17747) Bool)

(assert (=> b!891030 (= res!603740 (not (arrayNoDuplicates!0 (_keys!9941 thiss!1181) #b00000000000000000000000000000000 Nil!17744)))))

(declare-fun array_inv!19752 (array!52121) Bool)

(declare-fun array_inv!19753 (array!52123) Bool)

(assert (=> b!891031 (= e!497150 (and tp!55223 tp_is_empty!18079 (array_inv!19752 (_keys!9941 thiss!1181)) (array_inv!19753 (_values!5248 thiss!1181)) e!497152))))

(assert (= (and start!75762 res!603739) b!891027))

(assert (= (and b!891027 res!603736) b!891029))

(assert (= (and b!891029 (not res!603735)) b!891025))

(assert (= (and b!891029 (not res!603737)) b!891026))

(assert (= (and b!891026 (not res!603734)) b!891022))

(assert (= (and b!891022 (not res!603741)) b!891028))

(assert (= (and b!891028 (not res!603738)) b!891030))

(assert (= (and b!891030 (not res!603740)) b!891024))

(assert (= (and b!891023 condMapEmpty!28673) mapIsEmpty!28673))

(assert (= (and b!891023 (not condMapEmpty!28673)) mapNonEmpty!28673))

(assert (= (and mapNonEmpty!28673 ((_ is ValueCellFull!8558) mapValue!28673)) b!891020))

(assert (= (and b!891023 ((_ is ValueCellFull!8558) mapDefault!28673)) b!891021))

(assert (= b!891031 b!891023))

(assert (= start!75762 b!891031))

(declare-fun m!828823 () Bool)

(assert (=> b!891025 m!828823))

(declare-fun m!828825 () Bool)

(assert (=> b!891031 m!828825))

(declare-fun m!828827 () Bool)

(assert (=> b!891031 m!828827))

(declare-fun m!828829 () Bool)

(assert (=> b!891029 m!828829))

(declare-fun m!828831 () Bool)

(assert (=> b!891029 m!828831))

(declare-fun m!828833 () Bool)

(assert (=> b!891024 m!828833))

(declare-fun m!828835 () Bool)

(assert (=> b!891030 m!828835))

(declare-fun m!828837 () Bool)

(assert (=> mapNonEmpty!28673 m!828837))

(declare-fun m!828839 () Bool)

(assert (=> b!891028 m!828839))

(declare-fun m!828841 () Bool)

(assert (=> b!891026 m!828841))

(declare-fun m!828843 () Bool)

(assert (=> b!891026 m!828843))

(declare-fun m!828845 () Bool)

(assert (=> b!891026 m!828845))

(declare-fun m!828847 () Bool)

(assert (=> b!891026 m!828847))

(declare-fun m!828849 () Bool)

(assert (=> b!891026 m!828849))

(declare-fun m!828851 () Bool)

(assert (=> b!891026 m!828851))

(assert (=> b!891026 m!828845))

(declare-fun m!828853 () Bool)

(assert (=> b!891026 m!828853))

(declare-fun m!828855 () Bool)

(assert (=> start!75762 m!828855))

(check-sat (not b!891029) (not start!75762) b_and!25965 tp_is_empty!18079 (not b!891024) (not mapNonEmpty!28673) (not b!891025) (not b_next!15751) (not b!891028) (not b!891031) (not b!891026) (not b!891030))
(check-sat b_and!25965 (not b_next!15751))
