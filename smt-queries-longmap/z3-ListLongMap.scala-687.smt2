; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!16628 () Bool)

(assert start!16628)

(declare-fun b!166032 () Bool)

(declare-fun b_free!3933 () Bool)

(declare-fun b_next!3933 () Bool)

(assert (=> b!166032 (= b_free!3933 (not b_next!3933))))

(declare-fun tp!14400 () Bool)

(declare-fun b_and!10347 () Bool)

(assert (=> b!166032 (= tp!14400 b_and!10347)))

(declare-fun b!166031 () Bool)

(declare-fun e!108900 () Bool)

(declare-fun tp_is_empty!3735 () Bool)

(assert (=> b!166031 (= e!108900 tp_is_empty!3735)))

(declare-fun e!108905 () Bool)

(declare-fun e!108903 () Bool)

(declare-datatypes ((V!4627 0))(
  ( (V!4628 (val!1912 Int)) )
))
(declare-datatypes ((ValueCell!1524 0))(
  ( (ValueCellFull!1524 (v!3777 V!4627)) (EmptyCell!1524) )
))
(declare-datatypes ((array!6567 0))(
  ( (array!6568 (arr!3119 (Array (_ BitVec 32) (_ BitVec 64))) (size!3407 (_ BitVec 32))) )
))
(declare-datatypes ((array!6569 0))(
  ( (array!6570 (arr!3120 (Array (_ BitVec 32) ValueCell!1524)) (size!3408 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1956 0))(
  ( (LongMapFixedSize!1957 (defaultEntry!3420 Int) (mask!8143 (_ BitVec 32)) (extraKeys!3161 (_ BitVec 32)) (zeroValue!3263 V!4627) (minValue!3263 V!4627) (_size!1027 (_ BitVec 32)) (_keys!5245 array!6567) (_values!3403 array!6569) (_vacant!1027 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1956)

(declare-fun array_inv!2001 (array!6567) Bool)

(declare-fun array_inv!2002 (array!6569) Bool)

(assert (=> b!166032 (= e!108903 (and tp!14400 tp_is_empty!3735 (array_inv!2001 (_keys!5245 thiss!1248)) (array_inv!2002 (_values!3403 thiss!1248)) e!108905))))

(declare-fun b!166033 () Bool)

(declare-fun e!108899 () Bool)

(declare-fun e!108904 () Bool)

(assert (=> b!166033 (= e!108899 e!108904)))

(declare-fun res!78873 () Bool)

(assert (=> b!166033 (=> (not res!78873) (not e!108904))))

(declare-datatypes ((SeekEntryResult!447 0))(
  ( (MissingZero!447 (index!3956 (_ BitVec 32))) (Found!447 (index!3957 (_ BitVec 32))) (Intermediate!447 (undefined!1259 Bool) (index!3958 (_ BitVec 32)) (x!18395 (_ BitVec 32))) (Undefined!447) (MissingVacant!447 (index!3959 (_ BitVec 32))) )
))
(declare-fun lt!83179 () SeekEntryResult!447)

(get-info :version)

(assert (=> b!166033 (= res!78873 (and (not ((_ is Undefined!447) lt!83179)) (not ((_ is MissingVacant!447) lt!83179)) (not ((_ is MissingZero!447) lt!83179)) ((_ is Found!447) lt!83179)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6567 (_ BitVec 32)) SeekEntryResult!447)

(assert (=> b!166033 (= lt!83179 (seekEntryOrOpen!0 key!828 (_keys!5245 thiss!1248) (mask!8143 thiss!1248)))))

(declare-fun b!166034 () Bool)

(declare-fun res!78869 () Bool)

(assert (=> b!166034 (=> (not res!78869) (not e!108899))))

(assert (=> b!166034 (= res!78869 (not (= key!828 (bvneg key!828))))))

(declare-fun b!166035 () Bool)

(assert (=> b!166035 (= e!108904 false)))

(declare-fun lt!83178 () Bool)

(declare-datatypes ((List!2076 0))(
  ( (Nil!2073) (Cons!2072 (h!2689 (_ BitVec 64)) (t!6878 List!2076)) )
))
(declare-fun arrayNoDuplicates!0 (array!6567 (_ BitVec 32) List!2076) Bool)

(assert (=> b!166035 (= lt!83178 (arrayNoDuplicates!0 (_keys!5245 thiss!1248) #b00000000000000000000000000000000 Nil!2073))))

(declare-fun b!166036 () Bool)

(declare-fun res!78872 () Bool)

(assert (=> b!166036 (=> (not res!78872) (not e!108904))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!166036 (= res!78872 (validMask!0 (mask!8143 thiss!1248)))))

(declare-fun b!166037 () Bool)

(declare-fun mapRes!6321 () Bool)

(assert (=> b!166037 (= e!108905 (and e!108900 mapRes!6321))))

(declare-fun condMapEmpty!6321 () Bool)

(declare-fun mapDefault!6321 () ValueCell!1524)

(assert (=> b!166037 (= condMapEmpty!6321 (= (arr!3120 (_values!3403 thiss!1248)) ((as const (Array (_ BitVec 32) ValueCell!1524)) mapDefault!6321)))))

(declare-fun b!166038 () Bool)

(declare-fun res!78867 () Bool)

(assert (=> b!166038 (=> (not res!78867) (not e!108904))))

(assert (=> b!166038 (= res!78867 (and (= (size!3408 (_values!3403 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8143 thiss!1248))) (= (size!3407 (_keys!5245 thiss!1248)) (size!3408 (_values!3403 thiss!1248))) (bvsge (mask!8143 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3161 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3161 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!6321 () Bool)

(declare-fun tp!14399 () Bool)

(declare-fun e!108902 () Bool)

(assert (=> mapNonEmpty!6321 (= mapRes!6321 (and tp!14399 e!108902))))

(declare-fun mapValue!6321 () ValueCell!1524)

(declare-fun mapKey!6321 () (_ BitVec 32))

(declare-fun mapRest!6321 () (Array (_ BitVec 32) ValueCell!1524))

(assert (=> mapNonEmpty!6321 (= (arr!3120 (_values!3403 thiss!1248)) (store mapRest!6321 mapKey!6321 mapValue!6321))))

(declare-fun res!78868 () Bool)

(assert (=> start!16628 (=> (not res!78868) (not e!108899))))

(declare-fun valid!862 (LongMapFixedSize!1956) Bool)

(assert (=> start!16628 (= res!78868 (valid!862 thiss!1248))))

(assert (=> start!16628 e!108899))

(assert (=> start!16628 e!108903))

(assert (=> start!16628 true))

(declare-fun mapIsEmpty!6321 () Bool)

(assert (=> mapIsEmpty!6321 mapRes!6321))

(declare-fun b!166039 () Bool)

(assert (=> b!166039 (= e!108902 tp_is_empty!3735)))

(declare-fun b!166040 () Bool)

(declare-fun res!78870 () Bool)

(assert (=> b!166040 (=> (not res!78870) (not e!108904))))

(declare-datatypes ((tuple2!3092 0))(
  ( (tuple2!3093 (_1!1557 (_ BitVec 64)) (_2!1557 V!4627)) )
))
(declare-datatypes ((List!2077 0))(
  ( (Nil!2074) (Cons!2073 (h!2690 tuple2!3092) (t!6879 List!2077)) )
))
(declare-datatypes ((ListLongMap!2047 0))(
  ( (ListLongMap!2048 (toList!1039 List!2077)) )
))
(declare-fun contains!1081 (ListLongMap!2047 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!697 (array!6567 array!6569 (_ BitVec 32) (_ BitVec 32) V!4627 V!4627 (_ BitVec 32) Int) ListLongMap!2047)

(assert (=> b!166040 (= res!78870 (not (contains!1081 (getCurrentListMap!697 (_keys!5245 thiss!1248) (_values!3403 thiss!1248) (mask!8143 thiss!1248) (extraKeys!3161 thiss!1248) (zeroValue!3263 thiss!1248) (minValue!3263 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3420 thiss!1248)) key!828)))))

(declare-fun b!166041 () Bool)

(declare-fun res!78871 () Bool)

(assert (=> b!166041 (=> (not res!78871) (not e!108904))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6567 (_ BitVec 32)) Bool)

(assert (=> b!166041 (= res!78871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5245 thiss!1248) (mask!8143 thiss!1248)))))

(assert (= (and start!16628 res!78868) b!166034))

(assert (= (and b!166034 res!78869) b!166033))

(assert (= (and b!166033 res!78873) b!166040))

(assert (= (and b!166040 res!78870) b!166036))

(assert (= (and b!166036 res!78872) b!166038))

(assert (= (and b!166038 res!78867) b!166041))

(assert (= (and b!166041 res!78871) b!166035))

(assert (= (and b!166037 condMapEmpty!6321) mapIsEmpty!6321))

(assert (= (and b!166037 (not condMapEmpty!6321)) mapNonEmpty!6321))

(assert (= (and mapNonEmpty!6321 ((_ is ValueCellFull!1524) mapValue!6321)) b!166039))

(assert (= (and b!166037 ((_ is ValueCellFull!1524) mapDefault!6321)) b!166031))

(assert (= b!166032 b!166037))

(assert (= start!16628 b!166032))

(declare-fun m!195611 () Bool)

(assert (=> b!166035 m!195611))

(declare-fun m!195613 () Bool)

(assert (=> b!166032 m!195613))

(declare-fun m!195615 () Bool)

(assert (=> b!166032 m!195615))

(declare-fun m!195617 () Bool)

(assert (=> mapNonEmpty!6321 m!195617))

(declare-fun m!195619 () Bool)

(assert (=> b!166033 m!195619))

(declare-fun m!195621 () Bool)

(assert (=> b!166036 m!195621))

(declare-fun m!195623 () Bool)

(assert (=> b!166041 m!195623))

(declare-fun m!195625 () Bool)

(assert (=> b!166040 m!195625))

(assert (=> b!166040 m!195625))

(declare-fun m!195627 () Bool)

(assert (=> b!166040 m!195627))

(declare-fun m!195629 () Bool)

(assert (=> start!16628 m!195629))

(check-sat (not b!166040) (not b!166041) (not b!166036) (not b_next!3933) (not b!166035) (not b!166033) (not start!16628) tp_is_empty!3735 (not b!166032) b_and!10347 (not mapNonEmpty!6321))
(check-sat b_and!10347 (not b_next!3933))
