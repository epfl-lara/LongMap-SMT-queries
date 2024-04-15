; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72292 () Bool)

(assert start!72292)

(declare-fun b!837537 () Bool)

(declare-fun e!467472 () Bool)

(assert (=> b!837537 (= e!467472 false)))

(declare-fun lt!380372 () Bool)

(declare-datatypes ((array!46989 0))(
  ( (array!46990 (arr!22526 (Array (_ BitVec 32) (_ BitVec 64))) (size!22968 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46989)

(declare-datatypes ((List!16035 0))(
  ( (Nil!16032) (Cons!16031 (h!17162 (_ BitVec 64)) (t!22397 List!16035)) )
))
(declare-fun arrayNoDuplicates!0 (array!46989 (_ BitVec 32) List!16035) Bool)

(assert (=> b!837537 (= lt!380372 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16032))))

(declare-fun b!837538 () Bool)

(declare-fun e!467475 () Bool)

(declare-fun tp_is_empty!15361 () Bool)

(assert (=> b!837538 (= e!467475 tp_is_empty!15361)))

(declare-fun mapNonEmpty!24641 () Bool)

(declare-fun mapRes!24641 () Bool)

(declare-fun tp!47636 () Bool)

(declare-fun e!467473 () Bool)

(assert (=> mapNonEmpty!24641 (= mapRes!24641 (and tp!47636 e!467473))))

(declare-datatypes ((V!25529 0))(
  ( (V!25530 (val!7728 Int)) )
))
(declare-datatypes ((ValueCell!7241 0))(
  ( (ValueCellFull!7241 (v!10147 V!25529)) (EmptyCell!7241) )
))
(declare-fun mapRest!24641 () (Array (_ BitVec 32) ValueCell!7241))

(declare-fun mapKey!24641 () (_ BitVec 32))

(declare-fun mapValue!24641 () ValueCell!7241)

(declare-datatypes ((array!46991 0))(
  ( (array!46992 (arr!22527 (Array (_ BitVec 32) ValueCell!7241)) (size!22969 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46991)

(assert (=> mapNonEmpty!24641 (= (arr!22527 _values!688) (store mapRest!24641 mapKey!24641 mapValue!24641))))

(declare-fun mapIsEmpty!24641 () Bool)

(assert (=> mapIsEmpty!24641 mapRes!24641))

(declare-fun b!837539 () Bool)

(declare-fun res!569628 () Bool)

(assert (=> b!837539 (=> (not res!569628) (not e!467472))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!837539 (= res!569628 (and (= (size!22969 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22968 _keys!868) (size!22969 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!569630 () Bool)

(assert (=> start!72292 (=> (not res!569630) (not e!467472))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72292 (= res!569630 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22968 _keys!868))))))

(assert (=> start!72292 e!467472))

(assert (=> start!72292 true))

(declare-fun array_inv!18020 (array!46989) Bool)

(assert (=> start!72292 (array_inv!18020 _keys!868)))

(declare-fun e!467471 () Bool)

(declare-fun array_inv!18021 (array!46991) Bool)

(assert (=> start!72292 (and (array_inv!18021 _values!688) e!467471)))

(declare-fun b!837540 () Bool)

(assert (=> b!837540 (= e!467471 (and e!467475 mapRes!24641))))

(declare-fun condMapEmpty!24641 () Bool)

(declare-fun mapDefault!24641 () ValueCell!7241)

(assert (=> b!837540 (= condMapEmpty!24641 (= (arr!22527 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7241)) mapDefault!24641)))))

(declare-fun b!837541 () Bool)

(declare-fun res!569631 () Bool)

(assert (=> b!837541 (=> (not res!569631) (not e!467472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837541 (= res!569631 (validMask!0 mask!1196))))

(declare-fun b!837542 () Bool)

(assert (=> b!837542 (= e!467473 tp_is_empty!15361)))

(declare-fun b!837543 () Bool)

(declare-fun res!569629 () Bool)

(assert (=> b!837543 (=> (not res!569629) (not e!467472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46989 (_ BitVec 32)) Bool)

(assert (=> b!837543 (= res!569629 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!72292 res!569630) b!837541))

(assert (= (and b!837541 res!569631) b!837539))

(assert (= (and b!837539 res!569628) b!837543))

(assert (= (and b!837543 res!569629) b!837537))

(assert (= (and b!837540 condMapEmpty!24641) mapIsEmpty!24641))

(assert (= (and b!837540 (not condMapEmpty!24641)) mapNonEmpty!24641))

(get-info :version)

(assert (= (and mapNonEmpty!24641 ((_ is ValueCellFull!7241) mapValue!24641)) b!837542))

(assert (= (and b!837540 ((_ is ValueCellFull!7241) mapDefault!24641)) b!837538))

(assert (= start!72292 b!837540))

(declare-fun m!781727 () Bool)

(assert (=> start!72292 m!781727))

(declare-fun m!781729 () Bool)

(assert (=> start!72292 m!781729))

(declare-fun m!781731 () Bool)

(assert (=> b!837537 m!781731))

(declare-fun m!781733 () Bool)

(assert (=> mapNonEmpty!24641 m!781733))

(declare-fun m!781735 () Bool)

(assert (=> b!837541 m!781735))

(declare-fun m!781737 () Bool)

(assert (=> b!837543 m!781737))

(check-sat (not b!837537) (not mapNonEmpty!24641) tp_is_empty!15361 (not b!837543) (not start!72292) (not b!837541))
(check-sat)
