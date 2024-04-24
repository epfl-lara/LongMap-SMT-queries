; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16630 () Bool)

(assert start!16630)

(declare-fun b!166050 () Bool)

(declare-fun b_free!3931 () Bool)

(declare-fun b_next!3931 () Bool)

(assert (=> b!166050 (= b_free!3931 (not b_next!3931))))

(declare-fun tp!14394 () Bool)

(declare-fun b_and!10359 () Bool)

(assert (=> b!166050 (= tp!14394 b_and!10359)))

(declare-fun b!166045 () Bool)

(declare-fun res!78869 () Bool)

(declare-fun e!108903 () Bool)

(assert (=> b!166045 (=> (not res!78869) (not e!108903))))

(declare-datatypes ((V!4625 0))(
  ( (V!4626 (val!1911 Int)) )
))
(declare-datatypes ((ValueCell!1523 0))(
  ( (ValueCellFull!1523 (v!3777 V!4625)) (EmptyCell!1523) )
))
(declare-datatypes ((array!6549 0))(
  ( (array!6550 (arr!3110 (Array (_ BitVec 32) (_ BitVec 64))) (size!3398 (_ BitVec 32))) )
))
(declare-datatypes ((array!6551 0))(
  ( (array!6552 (arr!3111 (Array (_ BitVec 32) ValueCell!1523)) (size!3399 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1954 0))(
  ( (LongMapFixedSize!1955 (defaultEntry!3419 Int) (mask!8142 (_ BitVec 32)) (extraKeys!3160 (_ BitVec 32)) (zeroValue!3262 V!4625) (minValue!3262 V!4625) (_size!1026 (_ BitVec 32)) (_keys!5244 array!6549) (_values!3402 array!6551) (_vacant!1026 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1954)

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3042 0))(
  ( (tuple2!3043 (_1!1532 (_ BitVec 64)) (_2!1532 V!4625)) )
))
(declare-datatypes ((List!2061 0))(
  ( (Nil!2058) (Cons!2057 (h!2674 tuple2!3042) (t!6855 List!2061)) )
))
(declare-datatypes ((ListLongMap!2003 0))(
  ( (ListLongMap!2004 (toList!1017 List!2061)) )
))
(declare-fun contains!1069 (ListLongMap!2003 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!679 (array!6549 array!6551 (_ BitVec 32) (_ BitVec 32) V!4625 V!4625 (_ BitVec 32) Int) ListLongMap!2003)

(assert (=> b!166045 (= res!78869 (not (contains!1069 (getCurrentListMap!679 (_keys!5244 thiss!1248) (_values!3402 thiss!1248) (mask!8142 thiss!1248) (extraKeys!3160 thiss!1248) (zeroValue!3262 thiss!1248) (minValue!3262 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3419 thiss!1248)) key!828)))))

(declare-fun b!166046 () Bool)

(declare-fun e!108902 () Bool)

(declare-fun tp_is_empty!3733 () Bool)

(assert (=> b!166046 (= e!108902 tp_is_empty!3733)))

(declare-fun b!166047 () Bool)

(assert (=> b!166047 (= e!108903 false)))

(declare-fun lt!83231 () Bool)

(declare-datatypes ((List!2062 0))(
  ( (Nil!2059) (Cons!2058 (h!2675 (_ BitVec 64)) (t!6856 List!2062)) )
))
(declare-fun arrayNoDuplicates!0 (array!6549 (_ BitVec 32) List!2062) Bool)

(assert (=> b!166047 (= lt!83231 (arrayNoDuplicates!0 (_keys!5244 thiss!1248) #b00000000000000000000000000000000 Nil!2059))))

(declare-fun b!166048 () Bool)

(declare-fun e!108907 () Bool)

(assert (=> b!166048 (= e!108907 tp_is_empty!3733)))

(declare-fun b!166049 () Bool)

(declare-fun res!78867 () Bool)

(assert (=> b!166049 (=> (not res!78867) (not e!108903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166049 (= res!78867 (validMask!0 (mask!8142 thiss!1248)))))

(declare-fun e!108908 () Bool)

(declare-fun e!108906 () Bool)

(declare-fun array_inv!1993 (array!6549) Bool)

(declare-fun array_inv!1994 (array!6551) Bool)

(assert (=> b!166050 (= e!108906 (and tp!14394 tp_is_empty!3733 (array_inv!1993 (_keys!5244 thiss!1248)) (array_inv!1994 (_values!3402 thiss!1248)) e!108908))))

(declare-fun mapIsEmpty!6318 () Bool)

(declare-fun mapRes!6318 () Bool)

(assert (=> mapIsEmpty!6318 mapRes!6318))

(declare-fun res!78872 () Bool)

(declare-fun e!108905 () Bool)

(assert (=> start!16630 (=> (not res!78872) (not e!108905))))

(declare-fun valid!873 (LongMapFixedSize!1954) Bool)

(assert (=> start!16630 (= res!78872 (valid!873 thiss!1248))))

(assert (=> start!16630 e!108905))

(assert (=> start!16630 e!108906))

(assert (=> start!16630 true))

(declare-fun b!166051 () Bool)

(declare-fun res!78868 () Bool)

(assert (=> b!166051 (=> (not res!78868) (not e!108903))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6549 (_ BitVec 32)) Bool)

(assert (=> b!166051 (= res!78868 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5244 thiss!1248) (mask!8142 thiss!1248)))))

(declare-fun mapNonEmpty!6318 () Bool)

(declare-fun tp!14393 () Bool)

(assert (=> mapNonEmpty!6318 (= mapRes!6318 (and tp!14393 e!108907))))

(declare-fun mapKey!6318 () (_ BitVec 32))

(declare-fun mapValue!6318 () ValueCell!1523)

(declare-fun mapRest!6318 () (Array (_ BitVec 32) ValueCell!1523))

(assert (=> mapNonEmpty!6318 (= (arr!3111 (_values!3402 thiss!1248)) (store mapRest!6318 mapKey!6318 mapValue!6318))))

(declare-fun b!166052 () Bool)

(declare-fun res!78871 () Bool)

(assert (=> b!166052 (=> (not res!78871) (not e!108903))))

(assert (=> b!166052 (= res!78871 (and (= (size!3399 (_values!3402 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8142 thiss!1248))) (= (size!3398 (_keys!5244 thiss!1248)) (size!3399 (_values!3402 thiss!1248))) (bvsge (mask!8142 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3160 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3160 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!166053 () Bool)

(assert (=> b!166053 (= e!108908 (and e!108902 mapRes!6318))))

(declare-fun condMapEmpty!6318 () Bool)

(declare-fun mapDefault!6318 () ValueCell!1523)

(assert (=> b!166053 (= condMapEmpty!6318 (= (arr!3111 (_values!3402 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1523)) mapDefault!6318)))))

(declare-fun b!166054 () Bool)

(assert (=> b!166054 (= e!108905 e!108903)))

(declare-fun res!78870 () Bool)

(assert (=> b!166054 (=> (not res!78870) (not e!108903))))

(declare-datatypes ((SeekEntryResult!442 0))(
  ( (MissingZero!442 (index!3936 (_ BitVec 32))) (Found!442 (index!3937 (_ BitVec 32))) (Intermediate!442 (undefined!1254 Bool) (index!3938 (_ BitVec 32)) (x!18390 (_ BitVec 32))) (Undefined!442) (MissingVacant!442 (index!3939 (_ BitVec 32))) )
))
(declare-fun lt!83232 () SeekEntryResult!442)

(get-info :version)

(assert (=> b!166054 (= res!78870 (and (not ((_ is Undefined!442) lt!83232)) (not ((_ is MissingVacant!442) lt!83232)) (not ((_ is MissingZero!442) lt!83232)) ((_ is Found!442) lt!83232)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6549 (_ BitVec 32)) SeekEntryResult!442)

(assert (=> b!166054 (= lt!83232 (seekEntryOrOpen!0 key!828 (_keys!5244 thiss!1248) (mask!8142 thiss!1248)))))

(declare-fun b!166055 () Bool)

(declare-fun res!78873 () Bool)

(assert (=> b!166055 (=> (not res!78873) (not e!108905))))

(assert (=> b!166055 (= res!78873 (not (= key!828 (bvneg key!828))))))

(assert (= (and start!16630 res!78872) b!166055))

(assert (= (and b!166055 res!78873) b!166054))

(assert (= (and b!166054 res!78870) b!166045))

(assert (= (and b!166045 res!78869) b!166049))

(assert (= (and b!166049 res!78867) b!166052))

(assert (= (and b!166052 res!78871) b!166051))

(assert (= (and b!166051 res!78868) b!166047))

(assert (= (and b!166053 condMapEmpty!6318) mapIsEmpty!6318))

(assert (= (and b!166053 (not condMapEmpty!6318)) mapNonEmpty!6318))

(assert (= (and mapNonEmpty!6318 ((_ is ValueCellFull!1523) mapValue!6318)) b!166048))

(assert (= (and b!166053 ((_ is ValueCellFull!1523) mapDefault!6318)) b!166046))

(assert (= b!166050 b!166053))

(assert (= start!16630 b!166050))

(declare-fun m!195773 () Bool)

(assert (=> b!166049 m!195773))

(declare-fun m!195775 () Bool)

(assert (=> b!166047 m!195775))

(declare-fun m!195777 () Bool)

(assert (=> mapNonEmpty!6318 m!195777))

(declare-fun m!195779 () Bool)

(assert (=> b!166050 m!195779))

(declare-fun m!195781 () Bool)

(assert (=> b!166050 m!195781))

(declare-fun m!195783 () Bool)

(assert (=> start!16630 m!195783))

(declare-fun m!195785 () Bool)

(assert (=> b!166045 m!195785))

(assert (=> b!166045 m!195785))

(declare-fun m!195787 () Bool)

(assert (=> b!166045 m!195787))

(declare-fun m!195789 () Bool)

(assert (=> b!166054 m!195789))

(declare-fun m!195791 () Bool)

(assert (=> b!166051 m!195791))

(check-sat (not b!166051) (not b!166045) b_and!10359 (not start!16630) (not mapNonEmpty!6318) (not b_next!3931) (not b!166049) tp_is_empty!3733 (not b!166047) (not b!166054) (not b!166050))
(check-sat b_and!10359 (not b_next!3931))
