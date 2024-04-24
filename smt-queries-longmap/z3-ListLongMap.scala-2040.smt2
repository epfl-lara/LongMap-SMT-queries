; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!35394 () Bool)

(assert start!35394)

(declare-fun b!354405 () Bool)

(declare-fun e!217221 () Bool)

(declare-fun tp_is_empty!7861 () Bool)

(assert (=> b!354405 (= e!217221 tp_is_empty!7861)))

(declare-fun mapIsEmpty!13299 () Bool)

(declare-fun mapRes!13299 () Bool)

(assert (=> mapIsEmpty!13299 mapRes!13299))

(declare-fun b!354406 () Bool)

(declare-fun e!217220 () Bool)

(assert (=> b!354406 (= e!217220 false)))

(declare-fun lt!165725 () Bool)

(declare-datatypes ((array!19296 0))(
  ( (array!19297 (arr!9141 (Array (_ BitVec 32) (_ BitVec 64))) (size!9493 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19296)

(declare-datatypes ((List!5205 0))(
  ( (Nil!5202) (Cons!5201 (h!6057 (_ BitVec 64)) (t!10347 List!5205)) )
))
(declare-fun arrayNoDuplicates!0 (array!19296 (_ BitVec 32) List!5205) Bool)

(assert (=> b!354406 (= lt!165725 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5202))))

(declare-fun b!354407 () Bool)

(declare-fun e!217218 () Bool)

(declare-fun e!217222 () Bool)

(assert (=> b!354407 (= e!217218 (and e!217222 mapRes!13299))))

(declare-fun condMapEmpty!13299 () Bool)

(declare-datatypes ((V!11459 0))(
  ( (V!11460 (val!3975 Int)) )
))
(declare-datatypes ((ValueCell!3587 0))(
  ( (ValueCellFull!3587 (v!6170 V!11459)) (EmptyCell!3587) )
))
(declare-datatypes ((array!19298 0))(
  ( (array!19299 (arr!9142 (Array (_ BitVec 32) ValueCell!3587)) (size!9494 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19298)

(declare-fun mapDefault!13299 () ValueCell!3587)

(assert (=> b!354407 (= condMapEmpty!13299 (= (arr!9142 _values!1208) ((as const (Array (_ BitVec 32) ValueCell!3587)) mapDefault!13299)))))

(declare-fun res!196484 () Bool)

(assert (=> start!35394 (=> (not res!196484) (not e!217220))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35394 (= res!196484 (validMask!0 mask!1842))))

(assert (=> start!35394 e!217220))

(assert (=> start!35394 true))

(declare-fun array_inv!6754 (array!19298) Bool)

(assert (=> start!35394 (and (array_inv!6754 _values!1208) e!217218)))

(declare-fun array_inv!6755 (array!19296) Bool)

(assert (=> start!35394 (array_inv!6755 _keys!1456)))

(declare-fun b!354408 () Bool)

(declare-fun res!196485 () Bool)

(assert (=> b!354408 (=> (not res!196485) (not e!217220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19296 (_ BitVec 32)) Bool)

(assert (=> b!354408 (= res!196485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!354409 () Bool)

(assert (=> b!354409 (= e!217222 tp_is_empty!7861)))

(declare-fun mapNonEmpty!13299 () Bool)

(declare-fun tp!27195 () Bool)

(assert (=> mapNonEmpty!13299 (= mapRes!13299 (and tp!27195 e!217221))))

(declare-fun mapKey!13299 () (_ BitVec 32))

(declare-fun mapValue!13299 () ValueCell!3587)

(declare-fun mapRest!13299 () (Array (_ BitVec 32) ValueCell!3587))

(assert (=> mapNonEmpty!13299 (= (arr!9142 _values!1208) (store mapRest!13299 mapKey!13299 mapValue!13299))))

(declare-fun b!354410 () Bool)

(declare-fun res!196486 () Bool)

(assert (=> b!354410 (=> (not res!196486) (not e!217220))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(assert (=> b!354410 (= res!196486 (and (= (size!9494 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9493 _keys!1456) (size!9494 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(assert (= (and start!35394 res!196484) b!354410))

(assert (= (and b!354410 res!196486) b!354408))

(assert (= (and b!354408 res!196485) b!354406))

(assert (= (and b!354407 condMapEmpty!13299) mapIsEmpty!13299))

(assert (= (and b!354407 (not condMapEmpty!13299)) mapNonEmpty!13299))

(get-info :version)

(assert (= (and mapNonEmpty!13299 ((_ is ValueCellFull!3587) mapValue!13299)) b!354405))

(assert (= (and b!354407 ((_ is ValueCellFull!3587) mapDefault!13299)) b!354409))

(assert (= start!35394 b!354407))

(declare-fun m!353691 () Bool)

(assert (=> b!354406 m!353691))

(declare-fun m!353693 () Bool)

(assert (=> start!35394 m!353693))

(declare-fun m!353695 () Bool)

(assert (=> start!35394 m!353695))

(declare-fun m!353697 () Bool)

(assert (=> start!35394 m!353697))

(declare-fun m!353699 () Bool)

(assert (=> b!354408 m!353699))

(declare-fun m!353701 () Bool)

(assert (=> mapNonEmpty!13299 m!353701))

(check-sat (not start!35394) (not b!354406) (not b!354408) tp_is_empty!7861 (not mapNonEmpty!13299))
(check-sat)
