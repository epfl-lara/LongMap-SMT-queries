; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16150 () Bool)

(assert start!16150)

(declare-fun b!160669 () Bool)

(declare-fun b_free!3607 () Bool)

(declare-fun b_next!3607 () Bool)

(assert (=> b!160669 (= b_free!3607 (not b_next!3607))))

(declare-fun tp!13391 () Bool)

(declare-fun b_and!9995 () Bool)

(assert (=> b!160669 (= tp!13391 b_and!9995)))

(declare-fun mapNonEmpty!5801 () Bool)

(declare-fun mapRes!5801 () Bool)

(declare-fun tp!13390 () Bool)

(declare-fun e!105011 () Bool)

(assert (=> mapNonEmpty!5801 (= mapRes!5801 (and tp!13390 e!105011))))

(declare-datatypes ((V!4193 0))(
  ( (V!4194 (val!1749 Int)) )
))
(declare-datatypes ((ValueCell!1361 0))(
  ( (ValueCellFull!1361 (v!3608 V!4193)) (EmptyCell!1361) )
))
(declare-fun mapRest!5801 () (Array (_ BitVec 32) ValueCell!1361))

(declare-fun mapKey!5801 () (_ BitVec 32))

(declare-datatypes ((array!5877 0))(
  ( (array!5878 (arr!2782 (Array (_ BitVec 32) (_ BitVec 64))) (size!3067 (_ BitVec 32))) )
))
(declare-datatypes ((array!5879 0))(
  ( (array!5880 (arr!2783 (Array (_ BitVec 32) ValueCell!1361)) (size!3068 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1630 0))(
  ( (LongMapFixedSize!1631 (defaultEntry!3257 Int) (mask!7834 (_ BitVec 32)) (extraKeys!2998 (_ BitVec 32)) (zeroValue!3100 V!4193) (minValue!3100 V!4193) (_size!864 (_ BitVec 32)) (_keys!5057 array!5877) (_values!3240 array!5879) (_vacant!864 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1630)

(declare-fun mapValue!5801 () ValueCell!1361)

(assert (=> mapNonEmpty!5801 (= (arr!2783 (_values!3240 thiss!1248)) (store mapRest!5801 mapKey!5801 mapValue!5801))))

(declare-fun b!160668 () Bool)

(declare-fun res!76116 () Bool)

(declare-fun e!105012 () Bool)

(assert (=> b!160668 (=> (not res!76116) (not e!105012))))

(declare-fun key!828 () (_ BitVec 64))

(get-info :version)

(declare-datatypes ((SeekEntryResult!347 0))(
  ( (MissingZero!347 (index!3556 (_ BitVec 32))) (Found!347 (index!3557 (_ BitVec 32))) (Intermediate!347 (undefined!1159 Bool) (index!3558 (_ BitVec 32)) (x!17754 (_ BitVec 32))) (Undefined!347) (MissingVacant!347 (index!3559 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!5877 (_ BitVec 32)) SeekEntryResult!347)

(assert (=> b!160668 (= res!76116 ((_ is Undefined!347) (seekEntryOrOpen!0 key!828 (_keys!5057 thiss!1248) (mask!7834 thiss!1248))))))

(declare-fun e!105010 () Bool)

(declare-fun tp_is_empty!3409 () Bool)

(declare-fun e!105013 () Bool)

(declare-fun array_inv!1789 (array!5877) Bool)

(declare-fun array_inv!1790 (array!5879) Bool)

(assert (=> b!160669 (= e!105013 (and tp!13391 tp_is_empty!3409 (array_inv!1789 (_keys!5057 thiss!1248)) (array_inv!1790 (_values!3240 thiss!1248)) e!105010))))

(declare-fun b!160671 () Bool)

(declare-fun res!76110 () Bool)

(assert (=> b!160671 (=> (not res!76110) (not e!105012))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!160671 (= res!76110 (validMask!0 (mask!7834 thiss!1248)))))

(declare-fun b!160672 () Bool)

(assert (=> b!160672 (= e!105012 false)))

(declare-fun lt!81942 () Bool)

(declare-datatypes ((List!1958 0))(
  ( (Nil!1955) (Cons!1954 (h!2567 (_ BitVec 64)) (t!6751 List!1958)) )
))
(declare-fun arrayNoDuplicates!0 (array!5877 (_ BitVec 32) List!1958) Bool)

(assert (=> b!160672 (= lt!81942 (arrayNoDuplicates!0 (_keys!5057 thiss!1248) #b00000000000000000000000000000000 Nil!1955))))

(declare-fun b!160673 () Bool)

(declare-fun e!105008 () Bool)

(assert (=> b!160673 (= e!105010 (and e!105008 mapRes!5801))))

(declare-fun condMapEmpty!5801 () Bool)

(declare-fun mapDefault!5801 () ValueCell!1361)

(assert (=> b!160673 (= condMapEmpty!5801 (= (arr!2783 (_values!3240 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1361)) mapDefault!5801)))))

(declare-fun res!76113 () Bool)

(assert (=> start!16150 (=> (not res!76113) (not e!105012))))

(declare-fun valid!753 (LongMapFixedSize!1630) Bool)

(assert (=> start!16150 (= res!76113 (valid!753 thiss!1248))))

(assert (=> start!16150 e!105012))

(assert (=> start!16150 e!105013))

(assert (=> start!16150 true))

(declare-fun b!160670 () Bool)

(declare-fun res!76114 () Bool)

(assert (=> b!160670 (=> (not res!76114) (not e!105012))))

(assert (=> b!160670 (= res!76114 (and (= (size!3068 (_values!3240 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!7834 thiss!1248))) (= (size!3067 (_keys!5057 thiss!1248)) (size!3068 (_values!3240 thiss!1248))) (bvsge (mask!7834 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!2998 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!2998 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!160674 () Bool)

(declare-fun res!76115 () Bool)

(assert (=> b!160674 (=> (not res!76115) (not e!105012))))

(assert (=> b!160674 (= res!76115 (not (= key!828 (bvneg key!828))))))

(declare-fun b!160675 () Bool)

(assert (=> b!160675 (= e!105008 tp_is_empty!3409)))

(declare-fun b!160676 () Bool)

(declare-fun res!76112 () Bool)

(assert (=> b!160676 (=> (not res!76112) (not e!105012))))

(declare-datatypes ((tuple2!2908 0))(
  ( (tuple2!2909 (_1!1465 (_ BitVec 64)) (_2!1465 V!4193)) )
))
(declare-datatypes ((List!1959 0))(
  ( (Nil!1956) (Cons!1955 (h!2568 tuple2!2908) (t!6752 List!1959)) )
))
(declare-datatypes ((ListLongMap!1895 0))(
  ( (ListLongMap!1896 (toList!963 List!1959)) )
))
(declare-fun contains!1002 (ListLongMap!1895 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!613 (array!5877 array!5879 (_ BitVec 32) (_ BitVec 32) V!4193 V!4193 (_ BitVec 32) Int) ListLongMap!1895)

(assert (=> b!160676 (= res!76112 (not (contains!1002 (getCurrentListMap!613 (_keys!5057 thiss!1248) (_values!3240 thiss!1248) (mask!7834 thiss!1248) (extraKeys!2998 thiss!1248) (zeroValue!3100 thiss!1248) (minValue!3100 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3257 thiss!1248)) key!828)))))

(declare-fun b!160677 () Bool)

(assert (=> b!160677 (= e!105011 tp_is_empty!3409)))

(declare-fun mapIsEmpty!5801 () Bool)

(assert (=> mapIsEmpty!5801 mapRes!5801))

(declare-fun b!160678 () Bool)

(declare-fun res!76111 () Bool)

(assert (=> b!160678 (=> (not res!76111) (not e!105012))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!5877 (_ BitVec 32)) Bool)

(assert (=> b!160678 (= res!76111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5057 thiss!1248) (mask!7834 thiss!1248)))))

(assert (= (and start!16150 res!76113) b!160674))

(assert (= (and b!160674 res!76115) b!160668))

(assert (= (and b!160668 res!76116) b!160676))

(assert (= (and b!160676 res!76112) b!160671))

(assert (= (and b!160671 res!76110) b!160670))

(assert (= (and b!160670 res!76114) b!160678))

(assert (= (and b!160678 res!76111) b!160672))

(assert (= (and b!160673 condMapEmpty!5801) mapIsEmpty!5801))

(assert (= (and b!160673 (not condMapEmpty!5801)) mapNonEmpty!5801))

(assert (= (and mapNonEmpty!5801 ((_ is ValueCellFull!1361) mapValue!5801)) b!160677))

(assert (= (and b!160673 ((_ is ValueCellFull!1361) mapDefault!5801)) b!160675))

(assert (= b!160669 b!160673))

(assert (= start!16150 b!160669))

(declare-fun m!191917 () Bool)

(assert (=> b!160678 m!191917))

(declare-fun m!191919 () Bool)

(assert (=> b!160669 m!191919))

(declare-fun m!191921 () Bool)

(assert (=> b!160669 m!191921))

(declare-fun m!191923 () Bool)

(assert (=> b!160676 m!191923))

(assert (=> b!160676 m!191923))

(declare-fun m!191925 () Bool)

(assert (=> b!160676 m!191925))

(declare-fun m!191927 () Bool)

(assert (=> b!160668 m!191927))

(declare-fun m!191929 () Bool)

(assert (=> b!160672 m!191929))

(declare-fun m!191931 () Bool)

(assert (=> mapNonEmpty!5801 m!191931))

(declare-fun m!191933 () Bool)

(assert (=> b!160671 m!191933))

(declare-fun m!191935 () Bool)

(assert (=> start!16150 m!191935))

(check-sat (not b!160669) (not b!160676) (not start!16150) (not b!160671) tp_is_empty!3409 (not mapNonEmpty!5801) (not b!160668) (not b!160678) b_and!9995 (not b!160672) (not b_next!3607))
(check-sat b_and!9995 (not b_next!3607))
