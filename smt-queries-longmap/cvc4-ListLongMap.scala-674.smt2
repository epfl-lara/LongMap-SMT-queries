; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16552 () Bool)

(assert start!16552)

(declare-fun b!164779 () Bool)

(declare-fun b_free!3857 () Bool)

(declare-fun b_next!3857 () Bool)

(assert (=> b!164779 (= b_free!3857 (not b_next!3857))))

(declare-fun tp!14171 () Bool)

(declare-fun b_and!10271 () Bool)

(assert (=> b!164779 (= tp!14171 b_and!10271)))

(declare-fun mapNonEmpty!6207 () Bool)

(declare-fun mapRes!6207 () Bool)

(declare-fun tp!14172 () Bool)

(declare-fun e!108101 () Bool)

(assert (=> mapNonEmpty!6207 (= mapRes!6207 (and tp!14172 e!108101))))

(declare-datatypes ((V!4525 0))(
  ( (V!4526 (val!1874 Int)) )
))
(declare-datatypes ((ValueCell!1486 0))(
  ( (ValueCellFull!1486 (v!3739 V!4525)) (EmptyCell!1486) )
))
(declare-fun mapRest!6207 () (Array (_ BitVec 32) ValueCell!1486))

(declare-datatypes ((array!6415 0))(
  ( (array!6416 (arr!3043 (Array (_ BitVec 32) (_ BitVec 64))) (size!3331 (_ BitVec 32))) )
))
(declare-datatypes ((array!6417 0))(
  ( (array!6418 (arr!3044 (Array (_ BitVec 32) ValueCell!1486)) (size!3332 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1880 0))(
  ( (LongMapFixedSize!1881 (defaultEntry!3382 Int) (mask!8079 (_ BitVec 32)) (extraKeys!3123 (_ BitVec 32)) (zeroValue!3225 V!4525) (minValue!3225 V!4525) (_size!989 (_ BitVec 32)) (_keys!5207 array!6415) (_values!3365 array!6417) (_vacant!989 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1880)

(declare-fun mapKey!6207 () (_ BitVec 32))

(declare-fun mapValue!6207 () ValueCell!1486)

(assert (=> mapNonEmpty!6207 (= (arr!3044 (_values!3365 thiss!1248)) (store mapRest!6207 mapKey!6207 mapValue!6207))))

(declare-fun b!164778 () Bool)

(declare-fun res!78071 () Bool)

(declare-fun e!108107 () Bool)

(assert (=> b!164778 (=> (not res!78071) (not e!108107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6415 (_ BitVec 32)) Bool)

(assert (=> b!164778 (= res!78071 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5207 thiss!1248) (mask!8079 thiss!1248)))))

(declare-fun e!108103 () Bool)

(declare-fun tp_is_empty!3659 () Bool)

(declare-fun e!108106 () Bool)

(declare-fun array_inv!1951 (array!6415) Bool)

(declare-fun array_inv!1952 (array!6417) Bool)

(assert (=> b!164779 (= e!108103 (and tp!14171 tp_is_empty!3659 (array_inv!1951 (_keys!5207 thiss!1248)) (array_inv!1952 (_values!3365 thiss!1248)) e!108106))))

(declare-fun b!164780 () Bool)

(assert (=> b!164780 (= e!108107 false)))

(declare-fun lt!82950 () Bool)

(declare-datatypes ((List!2022 0))(
  ( (Nil!2019) (Cons!2018 (h!2635 (_ BitVec 64)) (t!6824 List!2022)) )
))
(declare-fun arrayNoDuplicates!0 (array!6415 (_ BitVec 32) List!2022) Bool)

(assert (=> b!164780 (= lt!82950 (arrayNoDuplicates!0 (_keys!5207 thiss!1248) #b00000000000000000000000000000000 Nil!2019))))

(declare-fun b!164781 () Bool)

(declare-fun res!78072 () Bool)

(assert (=> b!164781 (=> (not res!78072) (not e!108107))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3040 0))(
  ( (tuple2!3041 (_1!1531 (_ BitVec 64)) (_2!1531 V!4525)) )
))
(declare-datatypes ((List!2023 0))(
  ( (Nil!2020) (Cons!2019 (h!2636 tuple2!3040) (t!6825 List!2023)) )
))
(declare-datatypes ((ListLongMap!1995 0))(
  ( (ListLongMap!1996 (toList!1013 List!2023)) )
))
(declare-fun contains!1055 (ListLongMap!1995 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!671 (array!6415 array!6417 (_ BitVec 32) (_ BitVec 32) V!4525 V!4525 (_ BitVec 32) Int) ListLongMap!1995)

(assert (=> b!164781 (= res!78072 (contains!1055 (getCurrentListMap!671 (_keys!5207 thiss!1248) (_values!3365 thiss!1248) (mask!8079 thiss!1248) (extraKeys!3123 thiss!1248) (zeroValue!3225 thiss!1248) (minValue!3225 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3382 thiss!1248)) key!828))))

(declare-fun b!164782 () Bool)

(declare-fun e!108105 () Bool)

(assert (=> b!164782 (= e!108105 e!108107)))

(declare-fun res!78075 () Bool)

(assert (=> b!164782 (=> (not res!78075) (not e!108107))))

(declare-datatypes ((SeekEntryResult!423 0))(
  ( (MissingZero!423 (index!3860 (_ BitVec 32))) (Found!423 (index!3861 (_ BitVec 32))) (Intermediate!423 (undefined!1235 Bool) (index!3862 (_ BitVec 32)) (x!18267 (_ BitVec 32))) (Undefined!423) (MissingVacant!423 (index!3863 (_ BitVec 32))) )
))
(declare-fun lt!82951 () SeekEntryResult!423)

(assert (=> b!164782 (= res!78075 (and (not (is-Undefined!423 lt!82951)) (not (is-MissingVacant!423 lt!82951)) (not (is-MissingZero!423 lt!82951)) (is-Found!423 lt!82951)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6415 (_ BitVec 32)) SeekEntryResult!423)

(assert (=> b!164782 (= lt!82951 (seekEntryOrOpen!0 key!828 (_keys!5207 thiss!1248) (mask!8079 thiss!1248)))))

(declare-fun b!164783 () Bool)

(assert (=> b!164783 (= e!108101 tp_is_empty!3659)))

(declare-fun b!164784 () Bool)

(declare-fun res!78073 () Bool)

(assert (=> b!164784 (=> (not res!78073) (not e!108107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164784 (= res!78073 (validMask!0 (mask!8079 thiss!1248)))))

(declare-fun b!164785 () Bool)

(declare-fun e!108104 () Bool)

(assert (=> b!164785 (= e!108106 (and e!108104 mapRes!6207))))

(declare-fun condMapEmpty!6207 () Bool)

(declare-fun mapDefault!6207 () ValueCell!1486)

