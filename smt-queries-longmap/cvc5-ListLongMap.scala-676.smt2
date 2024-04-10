; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16560 () Bool)

(assert start!16560)

(declare-fun b!164912 () Bool)

(declare-fun b_free!3865 () Bool)

(declare-fun b_next!3865 () Bool)

(assert (=> b!164912 (= b_free!3865 (not b_next!3865))))

(declare-fun tp!14196 () Bool)

(declare-fun b_and!10279 () Bool)

(assert (=> b!164912 (= tp!14196 b_and!10279)))

(declare-fun res!78153 () Bool)

(declare-fun e!108188 () Bool)

(assert (=> start!16560 (=> (not res!78153) (not e!108188))))

(declare-datatypes ((V!4537 0))(
  ( (V!4538 (val!1878 Int)) )
))
(declare-datatypes ((ValueCell!1490 0))(
  ( (ValueCellFull!1490 (v!3743 V!4537)) (EmptyCell!1490) )
))
(declare-datatypes ((array!6431 0))(
  ( (array!6432 (arr!3051 (Array (_ BitVec 32) (_ BitVec 64))) (size!3339 (_ BitVec 32))) )
))
(declare-datatypes ((array!6433 0))(
  ( (array!6434 (arr!3052 (Array (_ BitVec 32) ValueCell!1490)) (size!3340 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1888 0))(
  ( (LongMapFixedSize!1889 (defaultEntry!3386 Int) (mask!8087 (_ BitVec 32)) (extraKeys!3127 (_ BitVec 32)) (zeroValue!3229 V!4537) (minValue!3229 V!4537) (_size!993 (_ BitVec 32)) (_keys!5211 array!6431) (_values!3369 array!6433) (_vacant!993 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1888)

(declare-fun valid!838 (LongMapFixedSize!1888) Bool)

(assert (=> start!16560 (= res!78153 (valid!838 thiss!1248))))

(assert (=> start!16560 e!108188))

(declare-fun e!108190 () Bool)

(assert (=> start!16560 e!108190))

(assert (=> start!16560 true))

(declare-fun b!164909 () Bool)

(declare-fun e!108191 () Bool)

(declare-fun tp_is_empty!3667 () Bool)

(assert (=> b!164909 (= e!108191 tp_is_empty!3667)))

(declare-fun b!164910 () Bool)

(declare-fun res!78155 () Bool)

(declare-fun e!108189 () Bool)

(assert (=> b!164910 (=> (not res!78155) (not e!108189))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164910 (= res!78155 (validMask!0 (mask!8087 thiss!1248)))))

(declare-fun b!164911 () Bool)

(assert (=> b!164911 (= e!108189 false)))

(declare-fun lt!82975 () Bool)

(declare-datatypes ((List!2028 0))(
  ( (Nil!2025) (Cons!2024 (h!2641 (_ BitVec 64)) (t!6830 List!2028)) )
))
(declare-fun arrayNoDuplicates!0 (array!6431 (_ BitVec 32) List!2028) Bool)

(assert (=> b!164911 (= lt!82975 (arrayNoDuplicates!0 (_keys!5211 thiss!1248) #b00000000000000000000000000000000 Nil!2025))))

(declare-fun mapNonEmpty!6219 () Bool)

(declare-fun mapRes!6219 () Bool)

(declare-fun tp!14195 () Bool)

(declare-fun e!108187 () Bool)

(assert (=> mapNonEmpty!6219 (= mapRes!6219 (and tp!14195 e!108187))))

(declare-fun mapRest!6219 () (Array (_ BitVec 32) ValueCell!1490))

(declare-fun mapValue!6219 () ValueCell!1490)

(declare-fun mapKey!6219 () (_ BitVec 32))

(assert (=> mapNonEmpty!6219 (= (arr!3052 (_values!3369 thiss!1248)) (store mapRest!6219 mapKey!6219 mapValue!6219))))

(declare-fun mapIsEmpty!6219 () Bool)

(assert (=> mapIsEmpty!6219 mapRes!6219))

(declare-fun e!108186 () Bool)

(declare-fun array_inv!1957 (array!6431) Bool)

(declare-fun array_inv!1958 (array!6433) Bool)

(assert (=> b!164912 (= e!108190 (and tp!14196 tp_is_empty!3667 (array_inv!1957 (_keys!5211 thiss!1248)) (array_inv!1958 (_values!3369 thiss!1248)) e!108186))))

(declare-fun b!164913 () Bool)

(declare-fun res!78157 () Bool)

(assert (=> b!164913 (=> (not res!78157) (not e!108189))))

(assert (=> b!164913 (= res!78157 (and (= (size!3340 (_values!3369 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8087 thiss!1248))) (= (size!3339 (_keys!5211 thiss!1248)) (size!3340 (_values!3369 thiss!1248))) (bvsge (mask!8087 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3127 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3127 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164914 () Bool)

(declare-fun res!78156 () Bool)

(assert (=> b!164914 (=> (not res!78156) (not e!108189))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((tuple2!3046 0))(
  ( (tuple2!3047 (_1!1534 (_ BitVec 64)) (_2!1534 V!4537)) )
))
(declare-datatypes ((List!2029 0))(
  ( (Nil!2026) (Cons!2025 (h!2642 tuple2!3046) (t!6831 List!2029)) )
))
(declare-datatypes ((ListLongMap!2001 0))(
  ( (ListLongMap!2002 (toList!1016 List!2029)) )
))
(declare-fun contains!1058 (ListLongMap!2001 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!674 (array!6431 array!6433 (_ BitVec 32) (_ BitVec 32) V!4537 V!4537 (_ BitVec 32) Int) ListLongMap!2001)

(assert (=> b!164914 (= res!78156 (contains!1058 (getCurrentListMap!674 (_keys!5211 thiss!1248) (_values!3369 thiss!1248) (mask!8087 thiss!1248) (extraKeys!3127 thiss!1248) (zeroValue!3229 thiss!1248) (minValue!3229 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3386 thiss!1248)) key!828))))

(declare-fun b!164915 () Bool)

(assert (=> b!164915 (= e!108186 (and e!108191 mapRes!6219))))

(declare-fun condMapEmpty!6219 () Bool)

(declare-fun mapDefault!6219 () ValueCell!1490)

