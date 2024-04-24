; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43170 () Bool)

(assert start!43170)

(declare-fun b!478581 () Bool)

(declare-fun e!281405 () Bool)

(declare-fun e!281408 () Bool)

(declare-fun mapRes!22054 () Bool)

(assert (=> b!478581 (= e!281405 (and e!281408 mapRes!22054))))

(declare-fun condMapEmpty!22054 () Bool)

(declare-datatypes ((V!19169 0))(
  ( (V!19170 (val!6834 Int)) )
))
(declare-datatypes ((ValueCell!6425 0))(
  ( (ValueCellFull!6425 (v!9124 V!19169)) (EmptyCell!6425) )
))
(declare-datatypes ((array!30812 0))(
  ( (array!30813 (arr!14813 (Array (_ BitVec 32) ValueCell!6425)) (size!15171 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30812)

(declare-fun mapDefault!22054 () ValueCell!6425)

(assert (=> b!478581 (= condMapEmpty!22054 (= (arr!14813 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6425)) mapDefault!22054)))))

(declare-fun mapNonEmpty!22054 () Bool)

(declare-fun tp!42529 () Bool)

(declare-fun e!281409 () Bool)

(assert (=> mapNonEmpty!22054 (= mapRes!22054 (and tp!42529 e!281409))))

(declare-fun mapRest!22054 () (Array (_ BitVec 32) ValueCell!6425))

(declare-fun mapKey!22054 () (_ BitVec 32))

(declare-fun mapValue!22054 () ValueCell!6425)

(assert (=> mapNonEmpty!22054 (= (arr!14813 _values!1516) (store mapRest!22054 mapKey!22054 mapValue!22054))))

(declare-fun mapIsEmpty!22054 () Bool)

(assert (=> mapIsEmpty!22054 mapRes!22054))

(declare-fun b!478582 () Bool)

(declare-fun tp_is_empty!13573 () Bool)

(assert (=> b!478582 (= e!281408 tp_is_empty!13573)))

(declare-fun res!285562 () Bool)

(declare-fun e!281407 () Bool)

(assert (=> start!43170 (=> (not res!285562) (not e!281407))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43170 (= res!285562 (validMask!0 mask!2352))))

(assert (=> start!43170 e!281407))

(assert (=> start!43170 true))

(declare-fun array_inv!10764 (array!30812) Bool)

(assert (=> start!43170 (and (array_inv!10764 _values!1516) e!281405)))

(declare-datatypes ((array!30814 0))(
  ( (array!30815 (arr!14814 (Array (_ BitVec 32) (_ BitVec 64))) (size!15172 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30814)

(declare-fun array_inv!10765 (array!30814) Bool)

(assert (=> start!43170 (array_inv!10765 _keys!1874)))

(declare-fun b!478583 () Bool)

(declare-fun res!285563 () Bool)

(assert (=> b!478583 (=> (not res!285563) (not e!281407))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478583 (= res!285563 (and (= (size!15171 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15172 _keys!1874) (size!15171 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478584 () Bool)

(assert (=> b!478584 (= e!281407 false)))

(declare-fun lt!217756 () Bool)

(declare-datatypes ((List!8972 0))(
  ( (Nil!8969) (Cons!8968 (h!9824 (_ BitVec 64)) (t!15170 List!8972)) )
))
(declare-fun arrayNoDuplicates!0 (array!30814 (_ BitVec 32) List!8972) Bool)

(assert (=> b!478584 (= lt!217756 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!8969))))

(declare-fun b!478585 () Bool)

(assert (=> b!478585 (= e!281409 tp_is_empty!13573)))

(declare-fun b!478586 () Bool)

(declare-fun res!285561 () Bool)

(assert (=> b!478586 (=> (not res!285561) (not e!281407))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30814 (_ BitVec 32)) Bool)

(assert (=> b!478586 (= res!285561 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(assert (= (and start!43170 res!285562) b!478583))

(assert (= (and b!478583 res!285563) b!478586))

(assert (= (and b!478586 res!285561) b!478584))

(assert (= (and b!478581 condMapEmpty!22054) mapIsEmpty!22054))

(assert (= (and b!478581 (not condMapEmpty!22054)) mapNonEmpty!22054))

(get-info :version)

(assert (= (and mapNonEmpty!22054 ((_ is ValueCellFull!6425) mapValue!22054)) b!478585))

(assert (= (and b!478581 ((_ is ValueCellFull!6425) mapDefault!22054)) b!478582))

(assert (= start!43170 b!478581))

(declare-fun m!461023 () Bool)

(assert (=> mapNonEmpty!22054 m!461023))

(declare-fun m!461025 () Bool)

(assert (=> start!43170 m!461025))

(declare-fun m!461027 () Bool)

(assert (=> start!43170 m!461027))

(declare-fun m!461029 () Bool)

(assert (=> start!43170 m!461029))

(declare-fun m!461031 () Bool)

(assert (=> b!478584 m!461031))

(declare-fun m!461033 () Bool)

(assert (=> b!478586 m!461033))

(check-sat (not b!478584) (not mapNonEmpty!22054) tp_is_empty!13573 (not start!43170) (not b!478586))
(check-sat)
