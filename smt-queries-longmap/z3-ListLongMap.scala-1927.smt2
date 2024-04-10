; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!34210 () Bool)

(assert start!34210)

(declare-fun b_free!7233 () Bool)

(declare-fun b_next!7233 () Bool)

(assert (=> start!34210 (= b_free!7233 (not b_next!7233))))

(declare-fun tp!25233 () Bool)

(declare-fun b_and!14433 () Bool)

(assert (=> start!34210 (= tp!25233 b_and!14433)))

(declare-fun b!341188 () Bool)

(declare-fun e!209260 () Bool)

(declare-fun e!209259 () Bool)

(assert (=> b!341188 (= e!209260 e!209259)))

(declare-fun res!188570 () Bool)

(assert (=> b!341188 (=> (not res!188570) (not e!209259))))

(declare-datatypes ((SeekEntryResult!3285 0))(
  ( (MissingZero!3285 (index!15319 (_ BitVec 32))) (Found!3285 (index!15320 (_ BitVec 32))) (Intermediate!3285 (undefined!4097 Bool) (index!15321 (_ BitVec 32)) (x!33983 (_ BitVec 32))) (Undefined!3285) (MissingVacant!3285 (index!15322 (_ BitVec 32))) )
))
(declare-fun lt!161725 () SeekEntryResult!3285)

(get-info :version)

(assert (=> b!341188 (= res!188570 (and (not ((_ is Found!3285) lt!161725)) (not ((_ is MissingZero!3285) lt!161725)) ((_ is MissingVacant!3285) lt!161725)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k0!1348 () (_ BitVec 64))

(declare-datatypes ((array!17965 0))(
  ( (array!17966 (arr!8503 (Array (_ BitVec 32) (_ BitVec 64))) (size!8855 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17965)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17965 (_ BitVec 32)) SeekEntryResult!3285)

(assert (=> b!341188 (= lt!161725 (seekEntryOrOpen!0 k0!1348 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!12204 () Bool)

(declare-fun mapRes!12204 () Bool)

(assert (=> mapIsEmpty!12204 mapRes!12204))

(declare-fun b!341189 () Bool)

(assert (=> b!341189 (= e!209259 false)))

(declare-fun lt!161724 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17965 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!341189 (= lt!161724 (arrayScanForKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341190 () Bool)

(declare-fun res!188572 () Bool)

(assert (=> b!341190 (=> (not res!188572) (not e!209260))))

(declare-datatypes ((V!10557 0))(
  ( (V!10558 (val!3637 Int)) )
))
(declare-fun zeroValue!1467 () V!10557)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3249 0))(
  ( (ValueCellFull!3249 (v!5809 V!10557)) (EmptyCell!3249) )
))
(declare-datatypes ((array!17967 0))(
  ( (array!17968 (arr!8504 (Array (_ BitVec 32) ValueCell!3249)) (size!8856 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17967)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10557)

(declare-datatypes ((tuple2!5274 0))(
  ( (tuple2!5275 (_1!2648 (_ BitVec 64)) (_2!2648 V!10557)) )
))
(declare-datatypes ((List!4892 0))(
  ( (Nil!4889) (Cons!4888 (h!5744 tuple2!5274) (t!10000 List!4892)) )
))
(declare-datatypes ((ListLongMap!4187 0))(
  ( (ListLongMap!4188 (toList!2109 List!4892)) )
))
(declare-fun contains!2163 (ListLongMap!4187 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1630 (array!17965 array!17967 (_ BitVec 32) (_ BitVec 32) V!10557 V!10557 (_ BitVec 32) Int) ListLongMap!4187)

(assert (=> b!341190 (= res!188572 (not (contains!2163 (getCurrentListMap!1630 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k0!1348)))))

(declare-fun mapNonEmpty!12204 () Bool)

(declare-fun tp!25232 () Bool)

(declare-fun e!209257 () Bool)

(assert (=> mapNonEmpty!12204 (= mapRes!12204 (and tp!25232 e!209257))))

(declare-fun mapValue!12204 () ValueCell!3249)

(declare-fun mapRest!12204 () (Array (_ BitVec 32) ValueCell!3249))

(declare-fun mapKey!12204 () (_ BitVec 32))

(assert (=> mapNonEmpty!12204 (= (arr!8504 _values!1525) (store mapRest!12204 mapKey!12204 mapValue!12204))))

(declare-fun b!341191 () Bool)

(declare-fun res!188576 () Bool)

(assert (=> b!341191 (=> (not res!188576) (not e!209259))))

(declare-fun arrayContainsKey!0 (array!17965 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!341191 (= res!188576 (arrayContainsKey!0 _keys!1895 k0!1348 #b00000000000000000000000000000000))))

(declare-fun b!341193 () Bool)

(declare-fun tp_is_empty!7185 () Bool)

(assert (=> b!341193 (= e!209257 tp_is_empty!7185)))

(declare-fun b!341194 () Bool)

(declare-fun res!188575 () Bool)

(assert (=> b!341194 (=> (not res!188575) (not e!209260))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!341194 (= res!188575 (validKeyInArray!0 k0!1348))))

(declare-fun b!341195 () Bool)

(declare-fun res!188569 () Bool)

(assert (=> b!341195 (=> (not res!188569) (not e!209260))))

(assert (=> b!341195 (= res!188569 (and (= (size!8856 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8855 _keys!1895) (size!8856 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!341196 () Bool)

(declare-fun res!188573 () Bool)

(assert (=> b!341196 (=> (not res!188573) (not e!209260))))

(declare-datatypes ((List!4893 0))(
  ( (Nil!4890) (Cons!4889 (h!5745 (_ BitVec 64)) (t!10001 List!4893)) )
))
(declare-fun arrayNoDuplicates!0 (array!17965 (_ BitVec 32) List!4893) Bool)

(assert (=> b!341196 (= res!188573 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4890))))

(declare-fun b!341197 () Bool)

(declare-fun e!209261 () Bool)

(declare-fun e!209258 () Bool)

(assert (=> b!341197 (= e!209261 (and e!209258 mapRes!12204))))

(declare-fun condMapEmpty!12204 () Bool)

(declare-fun mapDefault!12204 () ValueCell!3249)

(assert (=> b!341197 (= condMapEmpty!12204 (= (arr!8504 _values!1525) ((as const (Array (_ BitVec 32) ValueCell!3249)) mapDefault!12204)))))

(declare-fun b!341198 () Bool)

(assert (=> b!341198 (= e!209258 tp_is_empty!7185)))

(declare-fun b!341192 () Bool)

(declare-fun res!188574 () Bool)

(assert (=> b!341192 (=> (not res!188574) (not e!209260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17965 (_ BitVec 32)) Bool)

(assert (=> b!341192 (= res!188574 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun res!188571 () Bool)

(assert (=> start!34210 (=> (not res!188571) (not e!209260))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34210 (= res!188571 (validMask!0 mask!2385))))

(assert (=> start!34210 e!209260))

(assert (=> start!34210 true))

(assert (=> start!34210 tp_is_empty!7185))

(assert (=> start!34210 tp!25233))

(declare-fun array_inv!6300 (array!17967) Bool)

(assert (=> start!34210 (and (array_inv!6300 _values!1525) e!209261)))

(declare-fun array_inv!6301 (array!17965) Bool)

(assert (=> start!34210 (array_inv!6301 _keys!1895)))

(assert (= (and start!34210 res!188571) b!341195))

(assert (= (and b!341195 res!188569) b!341192))

(assert (= (and b!341192 res!188574) b!341196))

(assert (= (and b!341196 res!188573) b!341194))

(assert (= (and b!341194 res!188575) b!341190))

(assert (= (and b!341190 res!188572) b!341188))

(assert (= (and b!341188 res!188570) b!341191))

(assert (= (and b!341191 res!188576) b!341189))

(assert (= (and b!341197 condMapEmpty!12204) mapIsEmpty!12204))

(assert (= (and b!341197 (not condMapEmpty!12204)) mapNonEmpty!12204))

(assert (= (and mapNonEmpty!12204 ((_ is ValueCellFull!3249) mapValue!12204)) b!341193))

(assert (= (and b!341197 ((_ is ValueCellFull!3249) mapDefault!12204)) b!341198))

(assert (= start!34210 b!341197))

(declare-fun m!343687 () Bool)

(assert (=> start!34210 m!343687))

(declare-fun m!343689 () Bool)

(assert (=> start!34210 m!343689))

(declare-fun m!343691 () Bool)

(assert (=> start!34210 m!343691))

(declare-fun m!343693 () Bool)

(assert (=> b!341191 m!343693))

(declare-fun m!343695 () Bool)

(assert (=> b!341190 m!343695))

(assert (=> b!341190 m!343695))

(declare-fun m!343697 () Bool)

(assert (=> b!341190 m!343697))

(declare-fun m!343699 () Bool)

(assert (=> mapNonEmpty!12204 m!343699))

(declare-fun m!343701 () Bool)

(assert (=> b!341189 m!343701))

(declare-fun m!343703 () Bool)

(assert (=> b!341188 m!343703))

(declare-fun m!343705 () Bool)

(assert (=> b!341194 m!343705))

(declare-fun m!343707 () Bool)

(assert (=> b!341196 m!343707))

(declare-fun m!343709 () Bool)

(assert (=> b!341192 m!343709))

(check-sat (not b!341190) tp_is_empty!7185 (not b_next!7233) (not b!341192) (not b!341196) b_and!14433 (not b!341194) (not start!34210) (not b!341191) (not mapNonEmpty!12204) (not b!341189) (not b!341188))
(check-sat b_and!14433 (not b_next!7233))
