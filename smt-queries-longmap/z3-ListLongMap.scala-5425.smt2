; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72336 () Bool)

(assert start!72336)

(declare-fun b!838049 () Bool)

(declare-fun res!569897 () Bool)

(declare-fun e!467815 () Bool)

(assert (=> b!838049 (=> (not res!569897) (not e!467815))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838049 (= res!569897 (validMask!0 mask!1196))))

(declare-fun b!838050 () Bool)

(declare-fun res!569895 () Bool)

(assert (=> b!838050 (=> (not res!569895) (not e!467815))))

(declare-datatypes ((array!47066 0))(
  ( (array!47067 (arr!22564 (Array (_ BitVec 32) (_ BitVec 64))) (size!23004 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47066)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47066 (_ BitVec 32)) Bool)

(assert (=> b!838050 (= res!569895 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838051 () Bool)

(assert (=> b!838051 (= e!467815 false)))

(declare-fun lt!380647 () Bool)

(declare-datatypes ((List!16046 0))(
  ( (Nil!16043) (Cons!16042 (h!17173 (_ BitVec 64)) (t!22417 List!16046)) )
))
(declare-fun arrayNoDuplicates!0 (array!47066 (_ BitVec 32) List!16046) Bool)

(assert (=> b!838051 (= lt!380647 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16043))))

(declare-fun b!838053 () Bool)

(declare-fun res!569896 () Bool)

(assert (=> b!838053 (=> (not res!569896) (not e!467815))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!25563 0))(
  ( (V!25564 (val!7741 Int)) )
))
(declare-datatypes ((ValueCell!7254 0))(
  ( (ValueCellFull!7254 (v!10166 V!25563)) (EmptyCell!7254) )
))
(declare-datatypes ((array!47068 0))(
  ( (array!47069 (arr!22565 (Array (_ BitVec 32) ValueCell!7254)) (size!23005 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47068)

(assert (=> b!838053 (= res!569896 (and (= (size!23005 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23004 _keys!868) (size!23005 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!838054 () Bool)

(declare-fun e!467816 () Bool)

(declare-fun tp_is_empty!15387 () Bool)

(assert (=> b!838054 (= e!467816 tp_is_empty!15387)))

(declare-fun b!838055 () Bool)

(declare-fun e!467817 () Bool)

(assert (=> b!838055 (= e!467817 tp_is_empty!15387)))

(declare-fun res!569894 () Bool)

(assert (=> start!72336 (=> (not res!569894) (not e!467815))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72336 (= res!569894 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23004 _keys!868))))))

(assert (=> start!72336 e!467815))

(assert (=> start!72336 true))

(declare-fun array_inv!17980 (array!47066) Bool)

(assert (=> start!72336 (array_inv!17980 _keys!868)))

(declare-fun e!467818 () Bool)

(declare-fun array_inv!17981 (array!47068) Bool)

(assert (=> start!72336 (and (array_inv!17981 _values!688) e!467818)))

(declare-fun b!838052 () Bool)

(declare-fun mapRes!24680 () Bool)

(assert (=> b!838052 (= e!467818 (and e!467816 mapRes!24680))))

(declare-fun condMapEmpty!24680 () Bool)

(declare-fun mapDefault!24680 () ValueCell!7254)

(assert (=> b!838052 (= condMapEmpty!24680 (= (arr!22565 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7254)) mapDefault!24680)))))

(declare-fun mapIsEmpty!24680 () Bool)

(assert (=> mapIsEmpty!24680 mapRes!24680))

(declare-fun mapNonEmpty!24680 () Bool)

(declare-fun tp!47674 () Bool)

(assert (=> mapNonEmpty!24680 (= mapRes!24680 (and tp!47674 e!467817))))

(declare-fun mapValue!24680 () ValueCell!7254)

(declare-fun mapKey!24680 () (_ BitVec 32))

(declare-fun mapRest!24680 () (Array (_ BitVec 32) ValueCell!7254))

(assert (=> mapNonEmpty!24680 (= (arr!22565 _values!688) (store mapRest!24680 mapKey!24680 mapValue!24680))))

(assert (= (and start!72336 res!569894) b!838049))

(assert (= (and b!838049 res!569897) b!838053))

(assert (= (and b!838053 res!569896) b!838050))

(assert (= (and b!838050 res!569895) b!838051))

(assert (= (and b!838052 condMapEmpty!24680) mapIsEmpty!24680))

(assert (= (and b!838052 (not condMapEmpty!24680)) mapNonEmpty!24680))

(get-info :version)

(assert (= (and mapNonEmpty!24680 ((_ is ValueCellFull!7254) mapValue!24680)) b!838055))

(assert (= (and b!838052 ((_ is ValueCellFull!7254) mapDefault!24680)) b!838054))

(assert (= start!72336 b!838052))

(declare-fun m!782637 () Bool)

(assert (=> start!72336 m!782637))

(declare-fun m!782639 () Bool)

(assert (=> start!72336 m!782639))

(declare-fun m!782641 () Bool)

(assert (=> b!838049 m!782641))

(declare-fun m!782643 () Bool)

(assert (=> b!838050 m!782643))

(declare-fun m!782645 () Bool)

(assert (=> b!838051 m!782645))

(declare-fun m!782647 () Bool)

(assert (=> mapNonEmpty!24680 m!782647))

(check-sat (not mapNonEmpty!24680) (not b!838049) (not b!838050) (not b!838051) tp_is_empty!15387 (not start!72336))
(check-sat)
