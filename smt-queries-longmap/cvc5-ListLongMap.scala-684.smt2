; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16608 () Bool)

(assert start!16608)

(declare-fun b!165711 () Bool)

(declare-fun b_free!3913 () Bool)

(declare-fun b_next!3913 () Bool)

(assert (=> b!165711 (= b_free!3913 (not b_next!3913))))

(declare-fun tp!14339 () Bool)

(declare-fun b_and!10327 () Bool)

(assert (=> b!165711 (= tp!14339 b_and!10327)))

(declare-fun b!165701 () Bool)

(declare-fun res!78659 () Bool)

(declare-fun e!108692 () Bool)

(assert (=> b!165701 (=> (not res!78659) (not e!108692))))

(declare-datatypes ((V!4601 0))(
  ( (V!4602 (val!1902 Int)) )
))
(declare-datatypes ((ValueCell!1514 0))(
  ( (ValueCellFull!1514 (v!3767 V!4601)) (EmptyCell!1514) )
))
(declare-datatypes ((array!6527 0))(
  ( (array!6528 (arr!3099 (Array (_ BitVec 32) (_ BitVec 64))) (size!3387 (_ BitVec 32))) )
))
(declare-datatypes ((array!6529 0))(
  ( (array!6530 (arr!3100 (Array (_ BitVec 32) ValueCell!1514)) (size!3388 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1936 0))(
  ( (LongMapFixedSize!1937 (defaultEntry!3410 Int) (mask!8127 (_ BitVec 32)) (extraKeys!3151 (_ BitVec 32)) (zeroValue!3253 V!4601) (minValue!3253 V!4601) (_size!1017 (_ BitVec 32)) (_keys!5235 array!6527) (_values!3393 array!6529) (_vacant!1017 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1936)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6527 (_ BitVec 32)) Bool)

(assert (=> b!165701 (= res!78659 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5235 thiss!1248) (mask!8127 thiss!1248)))))

(declare-fun b!165702 () Bool)

(assert (=> b!165702 (= e!108692 false)))

(declare-fun lt!83119 () Bool)

(declare-datatypes ((List!2064 0))(
  ( (Nil!2061) (Cons!2060 (h!2677 (_ BitVec 64)) (t!6866 List!2064)) )
))
(declare-fun arrayNoDuplicates!0 (array!6527 (_ BitVec 32) List!2064) Bool)

(assert (=> b!165702 (= lt!83119 (arrayNoDuplicates!0 (_keys!5235 thiss!1248) #b00000000000000000000000000000000 Nil!2061))))

(declare-fun b!165703 () Bool)

(declare-fun res!78657 () Bool)

(assert (=> b!165703 (=> (not res!78657) (not e!108692))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165703 (= res!78657 (validMask!0 (mask!8127 thiss!1248)))))

(declare-fun b!165704 () Bool)

(declare-fun res!78662 () Bool)

(declare-fun e!108695 () Bool)

(assert (=> b!165704 (=> (not res!78662) (not e!108695))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165704 (= res!78662 (not (= key!828 (bvneg key!828))))))

(declare-fun mapIsEmpty!6291 () Bool)

(declare-fun mapRes!6291 () Bool)

(assert (=> mapIsEmpty!6291 mapRes!6291))

(declare-fun b!165705 () Bool)

(declare-fun e!108693 () Bool)

(declare-fun tp_is_empty!3715 () Bool)

(assert (=> b!165705 (= e!108693 tp_is_empty!3715)))

(declare-fun res!78660 () Bool)

(assert (=> start!16608 (=> (not res!78660) (not e!108695))))

(declare-fun valid!855 (LongMapFixedSize!1936) Bool)

(assert (=> start!16608 (= res!78660 (valid!855 thiss!1248))))

(assert (=> start!16608 e!108695))

(declare-fun e!108689 () Bool)

(assert (=> start!16608 e!108689))

(assert (=> start!16608 true))

(declare-fun b!165706 () Bool)

(declare-fun e!108690 () Bool)

(assert (=> b!165706 (= e!108690 tp_is_empty!3715)))

(declare-fun b!165707 () Bool)

(declare-fun res!78661 () Bool)

(assert (=> b!165707 (=> (not res!78661) (not e!108692))))

(declare-datatypes ((tuple2!3080 0))(
  ( (tuple2!3081 (_1!1551 (_ BitVec 64)) (_2!1551 V!4601)) )
))
(declare-datatypes ((List!2065 0))(
  ( (Nil!2062) (Cons!2061 (h!2678 tuple2!3080) (t!6867 List!2065)) )
))
(declare-datatypes ((ListLongMap!2035 0))(
  ( (ListLongMap!2036 (toList!1033 List!2065)) )
))
(declare-fun contains!1075 (ListLongMap!2035 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!691 (array!6527 array!6529 (_ BitVec 32) (_ BitVec 32) V!4601 V!4601 (_ BitVec 32) Int) ListLongMap!2035)

(assert (=> b!165707 (= res!78661 (not (contains!1075 (getCurrentListMap!691 (_keys!5235 thiss!1248) (_values!3393 thiss!1248) (mask!8127 thiss!1248) (extraKeys!3151 thiss!1248) (zeroValue!3253 thiss!1248) (minValue!3253 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3410 thiss!1248)) key!828)))))

(declare-fun b!165708 () Bool)

(declare-fun e!108694 () Bool)

(assert (=> b!165708 (= e!108694 (and e!108693 mapRes!6291))))

(declare-fun condMapEmpty!6291 () Bool)

(declare-fun mapDefault!6291 () ValueCell!1514)

