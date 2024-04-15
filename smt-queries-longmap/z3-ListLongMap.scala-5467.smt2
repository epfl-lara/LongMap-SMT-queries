; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72568 () Bool)

(assert start!72568)

(declare-fun b!842379 () Bool)

(declare-fun e!469868 () Bool)

(declare-fun tp_is_empty!15637 () Bool)

(assert (=> b!842379 (= e!469868 tp_is_empty!15637)))

(declare-fun b!842380 () Bool)

(declare-fun res!572583 () Bool)

(declare-fun e!469867 () Bool)

(assert (=> b!842380 (=> (not res!572583) (not e!469867))))

(declare-datatypes ((array!47525 0))(
  ( (array!47526 (arr!22794 (Array (_ BitVec 32) (_ BitVec 64))) (size!23236 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47525)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47525 (_ BitVec 32)) Bool)

(assert (=> b!842380 (= res!572583 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842381 () Bool)

(declare-fun e!469865 () Bool)

(assert (=> b!842381 (= e!469865 tp_is_empty!15637)))

(declare-fun mapIsEmpty!25055 () Bool)

(declare-fun mapRes!25055 () Bool)

(assert (=> mapIsEmpty!25055 mapRes!25055))

(declare-fun b!842382 () Bool)

(declare-fun e!469869 () Bool)

(assert (=> b!842382 (= e!469869 (and e!469868 mapRes!25055))))

(declare-fun condMapEmpty!25055 () Bool)

(declare-datatypes ((V!25897 0))(
  ( (V!25898 (val!7866 Int)) )
))
(declare-datatypes ((ValueCell!7379 0))(
  ( (ValueCellFull!7379 (v!10285 V!25897)) (EmptyCell!7379) )
))
(declare-datatypes ((array!47527 0))(
  ( (array!47528 (arr!22795 (Array (_ BitVec 32) ValueCell!7379)) (size!23237 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47527)

(declare-fun mapDefault!25055 () ValueCell!7379)

(assert (=> b!842382 (= condMapEmpty!25055 (= (arr!22795 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7379)) mapDefault!25055)))))

(declare-fun res!572581 () Bool)

(assert (=> start!72568 (=> (not res!572581) (not e!469867))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72568 (= res!572581 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23236 _keys!868))))))

(assert (=> start!72568 e!469867))

(assert (=> start!72568 true))

(declare-fun array_inv!18206 (array!47525) Bool)

(assert (=> start!72568 (array_inv!18206 _keys!868)))

(declare-fun array_inv!18207 (array!47527) Bool)

(assert (=> start!72568 (and (array_inv!18207 _values!688) e!469869)))

(declare-fun b!842383 () Bool)

(assert (=> b!842383 (= e!469867 false)))

(declare-fun lt!380786 () Bool)

(declare-datatypes ((List!16228 0))(
  ( (Nil!16225) (Cons!16224 (h!17355 (_ BitVec 64)) (t!22590 List!16228)) )
))
(declare-fun arrayNoDuplicates!0 (array!47525 (_ BitVec 32) List!16228) Bool)

(assert (=> b!842383 (= lt!380786 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16225))))

(declare-fun mapNonEmpty!25055 () Bool)

(declare-fun tp!48374 () Bool)

(assert (=> mapNonEmpty!25055 (= mapRes!25055 (and tp!48374 e!469865))))

(declare-fun mapKey!25055 () (_ BitVec 32))

(declare-fun mapValue!25055 () ValueCell!7379)

(declare-fun mapRest!25055 () (Array (_ BitVec 32) ValueCell!7379))

(assert (=> mapNonEmpty!25055 (= (arr!22795 _values!688) (store mapRest!25055 mapKey!25055 mapValue!25055))))

(declare-fun b!842384 () Bool)

(declare-fun res!572582 () Bool)

(assert (=> b!842384 (=> (not res!572582) (not e!469867))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842384 (= res!572582 (validMask!0 mask!1196))))

(declare-fun b!842385 () Bool)

(declare-fun res!572580 () Bool)

(assert (=> b!842385 (=> (not res!572580) (not e!469867))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!842385 (= res!572580 (and (= (size!23237 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23236 _keys!868) (size!23237 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!72568 res!572581) b!842384))

(assert (= (and b!842384 res!572582) b!842385))

(assert (= (and b!842385 res!572580) b!842380))

(assert (= (and b!842380 res!572583) b!842383))

(assert (= (and b!842382 condMapEmpty!25055) mapIsEmpty!25055))

(assert (= (and b!842382 (not condMapEmpty!25055)) mapNonEmpty!25055))

(get-info :version)

(assert (= (and mapNonEmpty!25055 ((_ is ValueCellFull!7379) mapValue!25055)) b!842381))

(assert (= (and b!842382 ((_ is ValueCellFull!7379) mapDefault!25055)) b!842379))

(assert (= start!72568 b!842382))

(declare-fun m!784895 () Bool)

(assert (=> b!842384 m!784895))

(declare-fun m!784897 () Bool)

(assert (=> b!842380 m!784897))

(declare-fun m!784899 () Bool)

(assert (=> mapNonEmpty!25055 m!784899))

(declare-fun m!784901 () Bool)

(assert (=> start!72568 m!784901))

(declare-fun m!784903 () Bool)

(assert (=> start!72568 m!784903))

(declare-fun m!784905 () Bool)

(assert (=> b!842383 m!784905))

(check-sat (not b!842380) tp_is_empty!15637 (not mapNonEmpty!25055) (not start!72568) (not b!842383) (not b!842384))
(check-sat)
