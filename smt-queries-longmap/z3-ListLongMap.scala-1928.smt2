; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34200 () Bool)

(assert start!34200)

(declare-fun b_free!7237 () Bool)

(declare-fun b_next!7237 () Bool)

(assert (=> start!34200 (= b_free!7237 (not b_next!7237))))

(declare-fun tp!25245 () Bool)

(declare-fun b_and!14451 () Bool)

(assert (=> start!34200 (= tp!25245 b_and!14451)))

(declare-fun mapIsEmpty!12210 () Bool)

(declare-fun mapRes!12210 () Bool)

(assert (=> mapIsEmpty!12210 mapRes!12210))

(declare-fun b!341201 () Bool)

(declare-fun e!209264 () Bool)

(assert (=> b!341201 (= e!209264 false)))

(declare-fun lt!161754 () (_ BitVec 32))

(declare-datatypes ((array!17964 0))(
  ( (array!17965 (arr!8502 (Array (_ BitVec 32) (_ BitVec 64))) (size!8854 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17964)

(declare-fun k0!1348 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!17964 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341201 (= lt!161754 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341202 () Bool)

(declare-fun e!209262 () Bool)

(assert (=> b!341202 (= e!209262 e!209264)))

(declare-fun res!188621 () Bool)

(assert (=> b!341202 (=> (not res!188621) (not e!209264))))

(declare-datatypes ((SeekEntryResult!3238 0))(
  ( (MissingZero!3238 (index!15131 (_ BitVec 32))) (Found!3238 (index!15132 (_ BitVec 32))) (Intermediate!3238 (undefined!4050 Bool) (index!15133 (_ BitVec 32)) (x!33941 (_ BitVec 32))) (Undefined!3238) (MissingVacant!3238 (index!15134 (_ BitVec 32))) )
))
(declare-fun lt!161755 () SeekEntryResult!3238)

(get-info :version)

(assert (=> b!341202 (= res!188621 (and (not ((_ is Found!3238) lt!161755)) (not ((_ is MissingZero!3238) lt!161755)) ((_ is MissingVacant!3238) lt!161755)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17964 (_ BitVec 32)) SeekEntryResult!3238)

(assert (=> b!341202 (= lt!161755 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun res!188616 () Bool)

(assert (=> start!34200 (=> (not res!188616) (not e!209262))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34200 (= res!188616 (validMask!0 mask!2385))))

(assert (=> start!34200 e!209262))

(assert (=> start!34200 true))

(declare-fun tp_is_empty!7189 () Bool)

(assert (=> start!34200 tp_is_empty!7189))

(assert (=> start!34200 tp!25245))

(declare-datatypes ((V!10563 0))(
  ( (V!10564 (val!3639 Int)) )
))
(declare-datatypes ((ValueCell!3251 0))(
  ( (ValueCellFull!3251 (v!5812 V!10563)) (EmptyCell!3251) )
))
(declare-datatypes ((array!17966 0))(
  ( (array!17967 (arr!8503 (Array (_ BitVec 32) ValueCell!3251)) (size!8855 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17966)

(declare-fun e!209260 () Bool)

(declare-fun array_inv!6294 (array!17966) Bool)

(assert (=> start!34200 (and (array_inv!6294 _values!1525) e!209260)))

(declare-fun array_inv!6295 (array!17964) Bool)

(assert (=> start!34200 (array_inv!6295 _keys!1895)))

(declare-fun b!341203 () Bool)

(declare-fun res!188619 () Bool)

(assert (=> b!341203 (=> (not res!188619) (not e!209262))))

(declare-fun extraKeys!1446 () (_ BitVec 32))

(assert (=> b!341203 (= res!188619 (and (= (size!8855 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8854 _keys!1895) (size!8855 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341204 () Bool)

(declare-fun e!209263 () Bool)

(assert (=> b!341204 (= e!209263 tp_is_empty!7189)))

(declare-fun mapNonEmpty!12210 () Bool)

(declare-fun tp!25244 () Bool)

(assert (=> mapNonEmpty!12210 (= mapRes!12210 (and tp!25244 e!209263))))

(declare-fun mapRest!12210 () (Array (_ BitVec 32) ValueCell!3251))

(declare-fun mapValue!12210 () ValueCell!3251)

(declare-fun mapKey!12210 () (_ BitVec 32))

(assert (=> mapNonEmpty!12210 (= (arr!8503 _values!1525) (store mapRest!12210 mapKey!12210 mapValue!12210))))

(declare-fun b!341205 () Bool)

(declare-fun res!188617 () Bool)

(assert (=> b!341205 (=> (not res!188617) (not e!209262))))

(declare-datatypes ((List!4792 0))(
  ( (Nil!4789) (Cons!4788 (h!5644 (_ BitVec 64)) (t!9892 List!4792)) )
))
(declare-fun arrayNoDuplicates!0 (array!17964 (_ BitVec 32) List!4792) Bool)

(assert (=> b!341205 (= res!188617 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4789))))

(declare-fun b!341206 () Bool)

(declare-fun res!188614 () Bool)

(assert (=> b!341206 (=> (not res!188614) (not e!209262))))

(declare-fun zeroValue!1467 () V!10563)

(declare-fun defaultEntry!1528 () Int)

(declare-fun minValue!1467 () V!10563)

(declare-datatypes ((tuple2!5188 0))(
  ( (tuple2!5189 (_1!2605 (_ BitVec 64)) (_2!2605 V!10563)) )
))
(declare-datatypes ((List!4793 0))(
  ( (Nil!4790) (Cons!4789 (h!5645 tuple2!5188) (t!9893 List!4793)) )
))
(declare-datatypes ((ListLongMap!4103 0))(
  ( (ListLongMap!4104 (toList!2067 List!4793)) )
))
(declare-fun contains!2140 (ListLongMap!4103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1596 (array!17964 array!17966 (_ BitVec 32) (_ BitVec 32) V!10563 V!10563 (_ BitVec 32) Int) ListLongMap!4103)

(assert (=> b!341206 (= res!188614 (not (contains!2140 (getCurrentListMap!1596 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun b!341207 () Bool)

(declare-fun res!188615 () Bool)

(assert (=> b!341207 (=> (not res!188615) (not e!209264))))

(declare-fun arrayContainsKey!0 (array!17964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341207 (= res!188615 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341208 () Bool)

(declare-fun res!188620 () Bool)

(assert (=> b!341208 (=> (not res!188620) (not e!209262))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17964 (_ BitVec 32)) Bool)

(assert (=> b!341208 (= res!188620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!341209 () Bool)

(declare-fun e!209259 () Bool)

(assert (=> b!341209 (= e!209259 tp_is_empty!7189)))

(declare-fun b!341210 () Bool)

(assert (=> b!341210 (= e!209260 (and e!209259 mapRes!12210))))

(declare-fun condMapEmpty!12210 () Bool)

(declare-fun mapDefault!12210 () ValueCell!3251)

(assert (=> b!341210 (= condMapEmpty!12210 (= (arr!8503 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3251)) mapDefault!12210)))))

(declare-fun b!341211 () Bool)

(declare-fun res!188618 () Bool)

(assert (=> b!341211 (=> (not res!188618) (not e!209262))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341211 (= res!188618 (validKeyInArray!0 k0!1348))))

(assert (= (and start!34200 res!188616) b!341203))

(assert (= (and b!341203 res!188619) b!341208))

(assert (= (and b!341208 res!188620) b!341205))

(assert (= (and b!341205 res!188617) b!341211))

(assert (= (and b!341211 res!188618) b!341206))

(assert (= (and b!341206 res!188614) b!341202))

(assert (= (and b!341202 res!188621) b!341207))

(assert (= (and b!341207 res!188615) b!341201))

(assert (= (and b!341210 condMapEmpty!12210) mapIsEmpty!12210))

(assert (= (and b!341210 (not condMapEmpty!12210)) mapNonEmpty!12210))

(assert (= (and mapNonEmpty!12210 ((_ is ValueCellFull!3251) mapValue!12210)) b!341204))

(assert (= (and b!341210 ((_ is ValueCellFull!3251) mapDefault!12210)) b!341209))

(assert (= start!34200 b!341210))

(declare-fun m!343959 () Bool)

(assert (=> b!341205 m!343959))

(declare-fun m!343961 () Bool)

(assert (=> b!341211 m!343961))

(declare-fun m!343963 () Bool)

(assert (=> b!341208 m!343963))

(declare-fun m!343965 () Bool)

(assert (=> b!341201 m!343965))

(declare-fun m!343967 () Bool)

(assert (=> b!341202 m!343967))

(declare-fun m!343969 () Bool)

(assert (=> start!34200 m!343969))

(declare-fun m!343971 () Bool)

(assert (=> start!34200 m!343971))

(declare-fun m!343973 () Bool)

(assert (=> start!34200 m!343973))

(declare-fun m!343975 () Bool)

(assert (=> b!341207 m!343975))

(declare-fun m!343977 () Bool)

(assert (=> mapNonEmpty!12210 m!343977))

(declare-fun m!343979 () Bool)

(assert (=> b!341206 m!343979))

(assert (=> b!341206 m!343979))

(declare-fun m!343981 () Bool)

(assert (=> b!341206 m!343981))

(check-sat (not b!341208) tp_is_empty!7189 (not mapNonEmpty!12210) (not b!341202) (not b!341205) (not b!341211) (not b!341201) (not b_next!7237) b_and!14451 (not start!34200) (not b!341207) (not b!341206))
(check-sat b_and!14451 (not b_next!7237))
