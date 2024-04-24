; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72448 () Bool)

(assert start!72448)

(declare-fun mapIsEmpty!24596 () Bool)

(declare-fun mapRes!24596 () Bool)

(assert (=> mapIsEmpty!24596 mapRes!24596))

(declare-fun b!838364 () Bool)

(declare-fun res!569902 () Bool)

(declare-fun e!467976 () Bool)

(assert (=> b!838364 (=> (not res!569902) (not e!467976))))

(declare-datatypes ((array!46961 0))(
  ( (array!46962 (arr!22507 (Array (_ BitVec 32) (_ BitVec 64))) (size!22948 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!46961)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46961 (_ BitVec 32)) Bool)

(assert (=> b!838364 (= res!569902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!838365 () Bool)

(declare-fun res!569903 () Bool)

(assert (=> b!838365 (=> (not res!569903) (not e!467976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!838365 (= res!569903 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24596 () Bool)

(declare-fun tp!47591 () Bool)

(declare-fun e!467979 () Bool)

(assert (=> mapNonEmpty!24596 (= mapRes!24596 (and tp!47591 e!467979))))

(declare-datatypes ((V!25489 0))(
  ( (V!25490 (val!7713 Int)) )
))
(declare-datatypes ((ValueCell!7226 0))(
  ( (ValueCellFull!7226 (v!10138 V!25489)) (EmptyCell!7226) )
))
(declare-fun mapValue!24596 () ValueCell!7226)

(declare-fun mapKey!24596 () (_ BitVec 32))

(declare-datatypes ((array!46963 0))(
  ( (array!46964 (arr!22508 (Array (_ BitVec 32) ValueCell!7226)) (size!22949 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46963)

(declare-fun mapRest!24596 () (Array (_ BitVec 32) ValueCell!7226))

(assert (=> mapNonEmpty!24596 (= (arr!22508 _values!688) (store mapRest!24596 mapKey!24596 mapValue!24596))))

(declare-fun b!838366 () Bool)

(declare-fun tp_is_empty!15331 () Bool)

(assert (=> b!838366 (= e!467979 tp_is_empty!15331)))

(declare-fun b!838368 () Bool)

(declare-fun e!467980 () Bool)

(declare-fun e!467978 () Bool)

(assert (=> b!838368 (= e!467980 (and e!467978 mapRes!24596))))

(declare-fun condMapEmpty!24596 () Bool)

(declare-fun mapDefault!24596 () ValueCell!7226)

(assert (=> b!838368 (= condMapEmpty!24596 (= (arr!22508 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7226)) mapDefault!24596)))))

(declare-fun b!838369 () Bool)

(assert (=> b!838369 (= e!467978 tp_is_empty!15331)))

(declare-fun b!838370 () Bool)

(assert (=> b!838370 (= e!467976 false)))

(declare-fun lt!380924 () Bool)

(declare-datatypes ((List!15931 0))(
  ( (Nil!15928) (Cons!15927 (h!17064 (_ BitVec 64)) (t!22294 List!15931)) )
))
(declare-fun arrayNoDuplicates!0 (array!46961 (_ BitVec 32) List!15931) Bool)

(assert (=> b!838370 (= lt!380924 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!15928))))

(declare-fun res!569905 () Bool)

(assert (=> start!72448 (=> (not res!569905) (not e!467976))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72448 (= res!569905 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!22948 _keys!868))))))

(assert (=> start!72448 e!467976))

(assert (=> start!72448 true))

(declare-fun array_inv!17982 (array!46961) Bool)

(assert (=> start!72448 (array_inv!17982 _keys!868)))

(declare-fun array_inv!17983 (array!46963) Bool)

(assert (=> start!72448 (and (array_inv!17983 _values!688) e!467980)))

(declare-fun b!838367 () Bool)

(declare-fun res!569904 () Bool)

(assert (=> b!838367 (=> (not res!569904) (not e!467976))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!838367 (= res!569904 (and (= (size!22949 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22948 _keys!868) (size!22949 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72448 res!569905) b!838365))

(assert (= (and b!838365 res!569903) b!838367))

(assert (= (and b!838367 res!569904) b!838364))

(assert (= (and b!838364 res!569902) b!838370))

(assert (= (and b!838368 condMapEmpty!24596) mapIsEmpty!24596))

(assert (= (and b!838368 (not condMapEmpty!24596)) mapNonEmpty!24596))

(get-info :version)

(assert (= (and mapNonEmpty!24596 ((_ is ValueCellFull!7226) mapValue!24596)) b!838366))

(assert (= (and b!838368 ((_ is ValueCellFull!7226) mapDefault!24596)) b!838369))

(assert (= start!72448 b!838368))

(declare-fun m!783593 () Bool)

(assert (=> b!838365 m!783593))

(declare-fun m!783595 () Bool)

(assert (=> start!72448 m!783595))

(declare-fun m!783597 () Bool)

(assert (=> start!72448 m!783597))

(declare-fun m!783599 () Bool)

(assert (=> b!838364 m!783599))

(declare-fun m!783601 () Bool)

(assert (=> b!838370 m!783601))

(declare-fun m!783603 () Bool)

(assert (=> mapNonEmpty!24596 m!783603))

(check-sat (not b!838364) (not b!838370) (not b!838365) (not start!72448) tp_is_empty!15331 (not mapNonEmpty!24596))
(check-sat)
