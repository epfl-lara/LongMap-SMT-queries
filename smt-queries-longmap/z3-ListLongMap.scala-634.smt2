; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16154 () Bool)

(assert start!16154)

(declare-fun b!160954 () Bool)

(declare-fun b_free!3615 () Bool)

(declare-fun b_next!3615 () Bool)

(assert (=> b!160954 (= b_free!3615 (not b_next!3615))))

(declare-fun tp!13415 () Bool)

(declare-fun b_and!10029 () Bool)

(assert (=> b!160954 (= tp!13415 b_and!10029)))

(declare-fun mapIsEmpty!5813 () Bool)

(declare-fun mapRes!5813 () Bool)

(assert (=> mapIsEmpty!5813 mapRes!5813))

(declare-fun b!160947 () Bool)

(declare-fun res!76294 () Bool)

(declare-fun e!105186 () Bool)

(assert (=> b!160947 (=> (not res!76294) (not e!105186))))

(declare-datatypes ((V!4203 0))(
  ( (V!4204 (val!1753 Int)) )
))
(declare-datatypes ((ValueCell!1365 0))(
  ( (ValueCellFull!1365 (v!3618 V!4203)) (EmptyCell!1365) )
))
(declare-datatypes ((array!5913 0))(
  ( (array!5914 (arr!2801 (Array (_ BitVec 32) (_ BitVec 64))) (size!3085 (_ BitVec 32))) )
))
(declare-datatypes ((array!5915 0))(
  ( (array!5916 (arr!2802 (Array (_ BitVec 32) ValueCell!1365)) (size!3086 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1638 0))(
  ( (LongMapFixedSize!1639 (defaultEntry!3261 Int) (mask!7841 (_ BitVec 32)) (extraKeys!3002 (_ BitVec 32)) (zeroValue!3104 V!4203) (minValue!3104 V!4203) (_size!868 (_ BitVec 32)) (_keys!5062 array!5913) (_values!3244 array!5915) (_vacant!868 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1638)

(assert (=> b!160947 (= res!76294 (and (= (size!3086 (_values!3244 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7841 thiss!1248))) (= (size!3085 (_keys!5062 thiss!1248)) (size!3086 (_values!3244 thiss!1248))) (bvsge (mask!7841 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3002 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3002 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160948 () Bool)

(declare-fun e!105182 () Bool)

(declare-fun tp_is_empty!3417 () Bool)

(assert (=> b!160948 (= e!105182 tp_is_empty!3417)))

(declare-fun b!160949 () Bool)

(declare-fun e!105183 () Bool)

(assert (=> b!160949 (= e!105183 tp_is_empty!3417)))

(declare-fun b!160950 () Bool)

(declare-fun res!76289 () Bool)

(assert (=> b!160950 (=> (not res!76289) (not e!105186))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!343 0))(
  ( (MissingZero!343 (index!3540 (_ BitVec 32))) (Found!343 (index!3541 (_ BitVec 32))) (Intermediate!343 (undefined!1155 Bool) (index!3542 (_ BitVec 32)) (x!17759 (_ BitVec 32))) (Undefined!343) (MissingVacant!343 (index!3543 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5913 (_ BitVec 32)) SeekEntryResult!343)

(assert (=> b!160950 (= res!76289 ((_ is Undefined!343) (seekEntryOrOpen!0 key!828 (_keys!5062 thiss!1248) (mask!7841 thiss!1248))))))

(declare-fun b!160951 () Bool)

(declare-fun e!105185 () Bool)

(assert (=> b!160951 (= e!105185 (and e!105183 mapRes!5813))))

(declare-fun condMapEmpty!5813 () Bool)

(declare-fun mapDefault!5813 () ValueCell!1365)

(assert (=> b!160951 (= condMapEmpty!5813 (= (arr!2802 (_values!3244 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1365)) mapDefault!5813)))))

(declare-fun mapNonEmpty!5813 () Bool)

(declare-fun tp!13414 () Bool)

(assert (=> mapNonEmpty!5813 (= mapRes!5813 (and tp!13414 e!105182))))

(declare-fun mapRest!5813 () (Array (_ BitVec 32) ValueCell!1365))

(declare-fun mapValue!5813 () ValueCell!1365)

(declare-fun mapKey!5813 () (_ BitVec 32))

(assert (=> mapNonEmpty!5813 (= (arr!2802 (_values!3244 thiss!1248)) (store mapRest!5813 mapKey!5813 mapValue!5813))))

(declare-fun res!76295 () Bool)

(assert (=> start!16154 (=> (not res!76295) (not e!105186))))

(declare-fun valid!755 (LongMapFixedSize!1638) Bool)

(assert (=> start!16154 (= res!76295 (valid!755 thiss!1248))))

(assert (=> start!16154 e!105186))

(declare-fun e!105184 () Bool)

(assert (=> start!16154 e!105184))

(assert (=> start!16154 true))

(declare-fun b!160952 () Bool)

(declare-fun res!76291 () Bool)

(assert (=> b!160952 (=> (not res!76291) (not e!105186))))

(assert (=> b!160952 (= res!76291 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160953 () Bool)

(declare-fun res!76292 () Bool)

(assert (=> b!160953 (=> (not res!76292) (not e!105186))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160953 (= res!76292 (validMask!0 (mask!7841 thiss!1248)))))

(declare-fun array_inv!1789 (array!5913) Bool)

(declare-fun array_inv!1790 (array!5915) Bool)

(assert (=> b!160954 (= e!105184 (and tp!13415 tp_is_empty!3417 (array_inv!1789 (_keys!5062 thiss!1248)) (array_inv!1790 (_values!3244 thiss!1248)) e!105185))))

(declare-fun b!160955 () Bool)

(assert (=> b!160955 (= e!105186 false)))

(declare-fun lt!82135 () Bool)

(declare-datatypes ((List!1964 0))(
  ( (Nil!1961) (Cons!1960 (h!2573 (_ BitVec 64)) (t!6766 List!1964)) )
))
(declare-fun arrayNoDuplicates!0 (array!5913 (_ BitVec 32) List!1964) Bool)

(assert (=> b!160955 (= lt!82135 (arrayNoDuplicates!0 (_keys!5062 thiss!1248) #b00000000000000000000000000000000 Nil!1961))))

(declare-fun b!160956 () Bool)

(declare-fun res!76290 () Bool)

(assert (=> b!160956 (=> (not res!76290) (not e!105186))))

(declare-datatypes ((tuple2!2944 0))(
  ( (tuple2!2945 (_1!1483 (_ BitVec 64)) (_2!1483 V!4203)) )
))
(declare-datatypes ((List!1965 0))(
  ( (Nil!1962) (Cons!1961 (h!2574 tuple2!2944) (t!6767 List!1965)) )
))
(declare-datatypes ((ListLongMap!1931 0))(
  ( (ListLongMap!1932 (toList!981 List!1965)) )
))
(declare-fun contains!1017 (ListLongMap!1931 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!645 (array!5913 array!5915 (_ BitVec 32) (_ BitVec 32) V!4203 V!4203 (_ BitVec 32) Int) ListLongMap!1931)

(assert (=> b!160956 (= res!76290 (not (contains!1017 (getCurrentListMap!645 (_keys!5062 thiss!1248) (_values!3244 thiss!1248) (mask!7841 thiss!1248) (extraKeys!3002 thiss!1248) (zeroValue!3104 thiss!1248) (minValue!3104 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3261 thiss!1248)) key!828)))))

(declare-fun b!160957 () Bool)

(declare-fun res!76293 () Bool)

(assert (=> b!160957 (=> (not res!76293) (not e!105186))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5913 (_ BitVec 32)) Bool)

(assert (=> b!160957 (= res!76293 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5062 thiss!1248) (mask!7841 thiss!1248)))))

(assert (= (and start!16154 res!76295) b!160952))

(assert (= (and b!160952 res!76291) b!160950))

(assert (= (and b!160950 res!76289) b!160956))

(assert (= (and b!160956 res!76290) b!160953))

(assert (= (and b!160953 res!76292) b!160947))

(assert (= (and b!160947 res!76294) b!160957))

(assert (= (and b!160957 res!76293) b!160955))

(assert (= (and b!160951 condMapEmpty!5813) mapIsEmpty!5813))

(assert (= (and b!160951 (not condMapEmpty!5813)) mapNonEmpty!5813))

(assert (= (and mapNonEmpty!5813 ((_ is ValueCellFull!1365) mapValue!5813)) b!160948))

(assert (= (and b!160951 ((_ is ValueCellFull!1365) mapDefault!5813)) b!160949))

(assert (= b!160954 b!160951))

(assert (= start!16154 b!160954))

(declare-fun m!192617 () Bool)

(assert (=> start!16154 m!192617))

(declare-fun m!192619 () Bool)

(assert (=> b!160955 m!192619))

(declare-fun m!192621 () Bool)

(assert (=> b!160957 m!192621))

(declare-fun m!192623 () Bool)

(assert (=> b!160953 m!192623))

(declare-fun m!192625 () Bool)

(assert (=> mapNonEmpty!5813 m!192625))

(declare-fun m!192627 () Bool)

(assert (=> b!160950 m!192627))

(declare-fun m!192629 () Bool)

(assert (=> b!160956 m!192629))

(assert (=> b!160956 m!192629))

(declare-fun m!192631 () Bool)

(assert (=> b!160956 m!192631))

(declare-fun m!192633 () Bool)

(assert (=> b!160954 m!192633))

(declare-fun m!192635 () Bool)

(assert (=> b!160954 m!192635))

(check-sat (not start!16154) (not mapNonEmpty!5813) (not b!160955) (not b!160957) b_and!10029 (not b!160954) (not b!160953) (not b_next!3615) (not b!160950) tp_is_empty!3417 (not b!160956))
(check-sat b_and!10029 (not b_next!3615))
