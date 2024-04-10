; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19664 () Bool)

(assert start!19664)

(declare-fun b!192772 () Bool)

(declare-fun b_free!4697 () Bool)

(declare-fun b_next!4697 () Bool)

(assert (=> b!192772 (= b_free!4697 (not b_next!4697))))

(declare-fun tp!16948 () Bool)

(declare-fun b_and!11395 () Bool)

(assert (=> b!192772 (= tp!16948 b_and!11395)))

(declare-fun b!192763 () Bool)

(declare-fun res!91079 () Bool)

(declare-fun e!126839 () Bool)

(assert (=> b!192763 (=> (not res!91079) (not e!126839))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!192763 (= res!91079 (not (= key!828 (bvneg key!828))))))

(declare-fun b!192764 () Bool)

(declare-fun e!126845 () Bool)

(declare-datatypes ((V!5605 0))(
  ( (V!5606 (val!2279 Int)) )
))
(declare-datatypes ((ValueCell!1891 0))(
  ( (ValueCellFull!1891 (v!4229 V!5605)) (EmptyCell!1891) )
))
(declare-datatypes ((array!8181 0))(
  ( (array!8182 (arr!3853 (Array (_ BitVec 32) (_ BitVec 64))) (size!4177 (_ BitVec 32))) )
))
(declare-datatypes ((array!8183 0))(
  ( (array!8184 (arr!3854 (Array (_ BitVec 32) ValueCell!1891)) (size!4178 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2690 0))(
  ( (LongMapFixedSize!2691 (defaultEntry!3933 Int) (mask!9172 (_ BitVec 32)) (extraKeys!3670 (_ BitVec 32)) (zeroValue!3774 V!5605) (minValue!3774 V!5605) (_size!1394 (_ BitVec 32)) (_keys!5919 array!8181) (_values!3916 array!8183) (_vacant!1394 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2690)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8181 (_ BitVec 32)) Bool)

(assert (=> b!192764 (= e!126845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5919 thiss!1248) (mask!9172 thiss!1248)))))

(declare-fun res!91080 () Bool)

(assert (=> start!19664 (=> (not res!91080) (not e!126839))))

(declare-fun valid!1104 (LongMapFixedSize!2690) Bool)

(assert (=> start!19664 (= res!91080 (valid!1104 thiss!1248))))

(assert (=> start!19664 e!126839))

(declare-fun e!126837 () Bool)

(assert (=> start!19664 e!126837))

(assert (=> start!19664 true))

(declare-fun tp_is_empty!4469 () Bool)

(assert (=> start!19664 tp_is_empty!4469))

(declare-fun b!192765 () Bool)

(declare-datatypes ((Unit!5835 0))(
  ( (Unit!5836) )
))
(declare-fun e!126843 () Unit!5835)

(declare-fun Unit!5837 () Unit!5835)

(assert (=> b!192765 (= e!126843 Unit!5837)))

(declare-fun lt!95858 () Unit!5835)

(declare-fun lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!187 (array!8181 array!8183 (_ BitVec 32) (_ BitVec 32) V!5605 V!5605 (_ BitVec 64) Int) Unit!5835)

(assert (=> b!192765 (= lt!95858 (lemmaNotInListMapThenSeekEntryOrOpenFindsFreeOrNothing!187 (_keys!5919 thiss!1248) (_values!3916 thiss!1248) (mask!9172 thiss!1248) (extraKeys!3670 thiss!1248) (zeroValue!3774 thiss!1248) (minValue!3774 thiss!1248) key!828 (defaultEntry!3933 thiss!1248)))))

(assert (=> b!192765 false))

(declare-fun mapIsEmpty!7724 () Bool)

(declare-fun mapRes!7724 () Bool)

(assert (=> mapIsEmpty!7724 mapRes!7724))

(declare-fun b!192766 () Bool)

(declare-fun e!126841 () Bool)

(assert (=> b!192766 (= e!126841 tp_is_empty!4469)))

(declare-fun b!192767 () Bool)

(declare-fun lt!95856 () Unit!5835)

(assert (=> b!192767 (= e!126843 lt!95856)))

(declare-fun lemmaInListMapThenSeekEntryOrOpenFindsIt!178 (array!8181 array!8183 (_ BitVec 32) (_ BitVec 32) V!5605 V!5605 (_ BitVec 64) Int) Unit!5835)

(assert (=> b!192767 (= lt!95856 (lemmaInListMapThenSeekEntryOrOpenFindsIt!178 (_keys!5919 thiss!1248) (_values!3916 thiss!1248) (mask!9172 thiss!1248) (extraKeys!3670 thiss!1248) (zeroValue!3774 thiss!1248) (minValue!3774 thiss!1248) key!828 (defaultEntry!3933 thiss!1248)))))

(declare-fun res!91084 () Bool)

(declare-datatypes ((SeekEntryResult!684 0))(
  ( (MissingZero!684 (index!4906 (_ BitVec 32))) (Found!684 (index!4907 (_ BitVec 32))) (Intermediate!684 (undefined!1496 Bool) (index!4908 (_ BitVec 32)) (x!20608 (_ BitVec 32))) (Undefined!684) (MissingVacant!684 (index!4909 (_ BitVec 32))) )
))
(declare-fun lt!95857 () SeekEntryResult!684)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!192767 (= res!91084 (inRange!0 (index!4907 lt!95857) (mask!9172 thiss!1248)))))

(declare-fun e!126846 () Bool)

(assert (=> b!192767 (=> (not res!91084) (not e!126846))))

(assert (=> b!192767 e!126846))

(declare-fun b!192768 () Bool)

(declare-fun res!91082 () Bool)

(assert (=> b!192768 (=> res!91082 e!126845)))

(assert (=> b!192768 (= res!91082 (or (not (= (size!4178 (_values!3916 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!9172 thiss!1248)))) (not (= (size!4177 (_keys!5919 thiss!1248)) (size!4178 (_values!3916 thiss!1248)))) (bvslt (mask!9172 thiss!1248) #b00000000000000000000000000000000) (bvslt (extraKeys!3670 thiss!1248) #b00000000000000000000000000000000) (bvsgt (extraKeys!3670 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!192769 () Bool)

(declare-fun e!126844 () Bool)

(assert (=> b!192769 (= e!126844 tp_is_empty!4469)))

(declare-fun b!192770 () Bool)

(assert (=> b!192770 (= e!126846 (= (select (arr!3853 (_keys!5919 thiss!1248)) (index!4907 lt!95857)) key!828))))

(declare-fun b!192771 () Bool)

(declare-fun e!126842 () Bool)

(assert (=> b!192771 (= e!126839 e!126842)))

(declare-fun res!91081 () Bool)

(assert (=> b!192771 (=> (not res!91081) (not e!126842))))

(assert (=> b!192771 (= res!91081 (and (not (is-Undefined!684 lt!95857)) (not (is-MissingVacant!684 lt!95857)) (not (is-MissingZero!684 lt!95857)) (is-Found!684 lt!95857)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!8181 (_ BitVec 32)) SeekEntryResult!684)

(assert (=> b!192771 (= lt!95857 (seekEntryOrOpen!0 key!828 (_keys!5919 thiss!1248) (mask!9172 thiss!1248)))))

(declare-fun e!126838 () Bool)

(declare-fun array_inv!2499 (array!8181) Bool)

(declare-fun array_inv!2500 (array!8183) Bool)

(assert (=> b!192772 (= e!126837 (and tp!16948 tp_is_empty!4469 (array_inv!2499 (_keys!5919 thiss!1248)) (array_inv!2500 (_values!3916 thiss!1248)) e!126838))))

(declare-fun b!192773 () Bool)

(assert (=> b!192773 (= e!126842 (not e!126845))))

(declare-fun res!91083 () Bool)

(assert (=> b!192773 (=> res!91083 e!126845)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!192773 (= res!91083 (not (validMask!0 (mask!9172 thiss!1248))))))

(declare-fun v!309 () V!5605)

(declare-datatypes ((tuple2!3540 0))(
  ( (tuple2!3541 (_1!1781 (_ BitVec 64)) (_2!1781 V!5605)) )
))
(declare-datatypes ((List!2431 0))(
  ( (Nil!2428) (Cons!2427 (h!3068 tuple2!3540) (t!7349 List!2431)) )
))
(declare-datatypes ((ListLongMap!2457 0))(
  ( (ListLongMap!2458 (toList!1244 List!2431)) )
))
(declare-fun lt!95861 () ListLongMap!2457)

(declare-fun +!312 (ListLongMap!2457 tuple2!3540) ListLongMap!2457)

(declare-fun getCurrentListMap!892 (array!8181 array!8183 (_ BitVec 32) (_ BitVec 32) V!5605 V!5605 (_ BitVec 32) Int) ListLongMap!2457)

(assert (=> b!192773 (= (+!312 lt!95861 (tuple2!3541 key!828 v!309)) (getCurrentListMap!892 (_keys!5919 thiss!1248) (array!8184 (store (arr!3854 (_values!3916 thiss!1248)) (index!4907 lt!95857) (ValueCellFull!1891 v!309)) (size!4178 (_values!3916 thiss!1248))) (mask!9172 thiss!1248) (extraKeys!3670 thiss!1248) (zeroValue!3774 thiss!1248) (minValue!3774 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3933 thiss!1248)))))

(declare-fun lt!95860 () Unit!5835)

(declare-fun lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!113 (array!8181 array!8183 (_ BitVec 32) (_ BitVec 32) V!5605 V!5605 (_ BitVec 32) (_ BitVec 64) V!5605 Int) Unit!5835)

(assert (=> b!192773 (= lt!95860 (lemmaChangeValueExistingKeyToArrayThenAddPairToListMap!113 (_keys!5919 thiss!1248) (_values!3916 thiss!1248) (mask!9172 thiss!1248) (extraKeys!3670 thiss!1248) (zeroValue!3774 thiss!1248) (minValue!3774 thiss!1248) (index!4907 lt!95857) key!828 v!309 (defaultEntry!3933 thiss!1248)))))

(declare-fun lt!95859 () Unit!5835)

(assert (=> b!192773 (= lt!95859 e!126843)))

(declare-fun c!34760 () Bool)

(declare-fun contains!1362 (ListLongMap!2457 (_ BitVec 64)) Bool)

(assert (=> b!192773 (= c!34760 (contains!1362 lt!95861 key!828))))

(assert (=> b!192773 (= lt!95861 (getCurrentListMap!892 (_keys!5919 thiss!1248) (_values!3916 thiss!1248) (mask!9172 thiss!1248) (extraKeys!3670 thiss!1248) (zeroValue!3774 thiss!1248) (minValue!3774 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3933 thiss!1248)))))

(declare-fun mapNonEmpty!7724 () Bool)

(declare-fun tp!16949 () Bool)

(assert (=> mapNonEmpty!7724 (= mapRes!7724 (and tp!16949 e!126844))))

(declare-fun mapValue!7724 () ValueCell!1891)

(declare-fun mapKey!7724 () (_ BitVec 32))

(declare-fun mapRest!7724 () (Array (_ BitVec 32) ValueCell!1891))

(assert (=> mapNonEmpty!7724 (= (arr!3854 (_values!3916 thiss!1248)) (store mapRest!7724 mapKey!7724 mapValue!7724))))

(declare-fun b!192774 () Bool)

(assert (=> b!192774 (= e!126838 (and e!126841 mapRes!7724))))

(declare-fun condMapEmpty!7724 () Bool)

(declare-fun mapDefault!7724 () ValueCell!1891)

