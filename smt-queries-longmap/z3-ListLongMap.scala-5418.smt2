; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72294 () Bool)

(assert start!72294)

(declare-fun b!837608 () Bool)

(declare-fun e!467499 () Bool)

(declare-fun tp_is_empty!15345 () Bool)

(assert (=> b!837608 (= e!467499 tp_is_empty!15345)))

(declare-fun b!837609 () Bool)

(declare-fun e!467501 () Bool)

(assert (=> b!837609 (= e!467501 false)))

(declare-fun lt!380584 () Bool)

(declare-datatypes ((array!46988 0))(
  ( (array!46989 (arr!22525 (Array (_ BitVec 32) (_ BitVec 64))) (size!22965 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46988)

(declare-datatypes ((List!16032 0))(
  ( (Nil!16029) (Cons!16028 (h!17159 (_ BitVec 64)) (t!22403 List!16032)) )
))
(declare-fun arrayNoDuplicates!0 (array!46988 (_ BitVec 32) List!16032) Bool)

(assert (=> b!837609 (= lt!380584 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16029))))

(declare-fun b!837610 () Bool)

(declare-fun res!569643 () Bool)

(assert (=> b!837610 (=> (not res!569643) (not e!467501))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46988 (_ BitVec 32)) Bool)

(assert (=> b!837610 (= res!569643 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!24617 () Bool)

(declare-fun mapRes!24617 () Bool)

(declare-fun tp!47611 () Bool)

(assert (=> mapNonEmpty!24617 (= mapRes!24617 (and tp!47611 e!467499))))

(declare-datatypes ((V!25507 0))(
  ( (V!25508 (val!7720 Int)) )
))
(declare-datatypes ((ValueCell!7233 0))(
  ( (ValueCellFull!7233 (v!10145 V!25507)) (EmptyCell!7233) )
))
(declare-fun mapValue!24617 () ValueCell!7233)

(declare-datatypes ((array!46990 0))(
  ( (array!46991 (arr!22526 (Array (_ BitVec 32) ValueCell!7233)) (size!22966 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46990)

(declare-fun mapKey!24617 () (_ BitVec 32))

(declare-fun mapRest!24617 () (Array (_ BitVec 32) ValueCell!7233))

(assert (=> mapNonEmpty!24617 (= (arr!22526 _values!688) (store mapRest!24617 mapKey!24617 mapValue!24617))))

(declare-fun mapIsEmpty!24617 () Bool)

(assert (=> mapIsEmpty!24617 mapRes!24617))

(declare-fun b!837612 () Bool)

(declare-fun res!569644 () Bool)

(assert (=> b!837612 (=> (not res!569644) (not e!467501))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!837612 (= res!569644 (and (= (size!22966 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22965 _keys!868) (size!22966 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837613 () Bool)

(declare-fun e!467500 () Bool)

(declare-fun e!467503 () Bool)

(assert (=> b!837613 (= e!467500 (and e!467503 mapRes!24617))))

(declare-fun condMapEmpty!24617 () Bool)

(declare-fun mapDefault!24617 () ValueCell!7233)

(assert (=> b!837613 (= condMapEmpty!24617 (= (arr!22526 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7233)) mapDefault!24617)))))

(declare-fun b!837614 () Bool)

(assert (=> b!837614 (= e!467503 tp_is_empty!15345)))

(declare-fun b!837611 () Bool)

(declare-fun res!569645 () Bool)

(assert (=> b!837611 (=> (not res!569645) (not e!467501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!837611 (= res!569645 (validMask!0 mask!1196))))

(declare-fun res!569642 () Bool)

(assert (=> start!72294 (=> (not res!569642) (not e!467501))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72294 (= res!569642 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22965 _keys!868))))))

(assert (=> start!72294 e!467501))

(assert (=> start!72294 true))

(declare-fun array_inv!17952 (array!46988) Bool)

(assert (=> start!72294 (array_inv!17952 _keys!868)))

(declare-fun array_inv!17953 (array!46990) Bool)

(assert (=> start!72294 (and (array_inv!17953 _values!688) e!467500)))

(assert (= (and start!72294 res!569642) b!837611))

(assert (= (and b!837611 res!569645) b!837612))

(assert (= (and b!837612 res!569644) b!837610))

(assert (= (and b!837610 res!569643) b!837609))

(assert (= (and b!837613 condMapEmpty!24617) mapIsEmpty!24617))

(assert (= (and b!837613 (not condMapEmpty!24617)) mapNonEmpty!24617))

(get-info :version)

(assert (= (and mapNonEmpty!24617 ((_ is ValueCellFull!7233) mapValue!24617)) b!837608))

(assert (= (and b!837613 ((_ is ValueCellFull!7233) mapDefault!24617)) b!837614))

(assert (= start!72294 b!837613))

(declare-fun m!782385 () Bool)

(assert (=> b!837610 m!782385))

(declare-fun m!782387 () Bool)

(assert (=> mapNonEmpty!24617 m!782387))

(declare-fun m!782389 () Bool)

(assert (=> b!837609 m!782389))

(declare-fun m!782391 () Bool)

(assert (=> start!72294 m!782391))

(declare-fun m!782393 () Bool)

(assert (=> start!72294 m!782393))

(declare-fun m!782395 () Bool)

(assert (=> b!837611 m!782395))

(check-sat (not b!837611) (not mapNonEmpty!24617) (not b!837610) tp_is_empty!15345 (not b!837609) (not start!72294))
(check-sat)
