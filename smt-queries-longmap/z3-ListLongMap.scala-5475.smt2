; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72636 () Bool)

(assert start!72636)

(declare-fun b!843143 () Bool)

(declare-fun res!572992 () Bool)

(declare-fun e!470390 () Bool)

(assert (=> b!843143 (=> (not res!572992) (not e!470390))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843143 (= res!572992 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!25130 () Bool)

(declare-fun mapRes!25130 () Bool)

(declare-fun tp!48448 () Bool)

(declare-fun e!470389 () Bool)

(assert (=> mapNonEmpty!25130 (= mapRes!25130 (and tp!48448 e!470389))))

(declare-datatypes ((V!25963 0))(
  ( (V!25964 (val!7891 Int)) )
))
(declare-datatypes ((ValueCell!7404 0))(
  ( (ValueCellFull!7404 (v!10316 V!25963)) (EmptyCell!7404) )
))
(declare-fun mapRest!25130 () (Array (_ BitVec 32) ValueCell!7404))

(declare-fun mapValue!25130 () ValueCell!7404)

(declare-fun mapKey!25130 () (_ BitVec 32))

(declare-datatypes ((array!47634 0))(
  ( (array!47635 (arr!22848 (Array (_ BitVec 32) ValueCell!7404)) (size!23288 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47634)

(assert (=> mapNonEmpty!25130 (= (arr!22848 _values!688) (store mapRest!25130 mapKey!25130 mapValue!25130))))

(declare-fun b!843144 () Bool)

(declare-fun e!470391 () Bool)

(declare-fun tp_is_empty!15687 () Bool)

(assert (=> b!843144 (= e!470391 tp_is_empty!15687)))

(declare-fun mapIsEmpty!25130 () Bool)

(assert (=> mapIsEmpty!25130 mapRes!25130))

(declare-fun b!843145 () Bool)

(declare-fun res!572993 () Bool)

(assert (=> b!843145 (=> (not res!572993) (not e!470390))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!47636 0))(
  ( (array!47637 (arr!22849 (Array (_ BitVec 32) (_ BitVec 64))) (size!23289 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47636)

(assert (=> b!843145 (= res!572993 (and (= (size!23288 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23289 _keys!868) (size!23288 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!843146 () Bool)

(assert (=> b!843146 (= e!470389 tp_is_empty!15687)))

(declare-fun b!843147 () Bool)

(declare-fun res!572991 () Bool)

(assert (=> b!843147 (=> (not res!572991) (not e!470390))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47636 (_ BitVec 32)) Bool)

(assert (=> b!843147 (= res!572991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843148 () Bool)

(assert (=> b!843148 (= e!470390 false)))

(declare-fun lt!381097 () Bool)

(declare-datatypes ((List!16231 0))(
  ( (Nil!16228) (Cons!16227 (h!17358 (_ BitVec 64)) (t!22602 List!16231)) )
))
(declare-fun arrayNoDuplicates!0 (array!47636 (_ BitVec 32) List!16231) Bool)

(assert (=> b!843148 (= lt!381097 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16228))))

(declare-fun res!572990 () Bool)

(assert (=> start!72636 (=> (not res!572990) (not e!470390))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72636 (= res!572990 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23289 _keys!868))))))

(assert (=> start!72636 e!470390))

(assert (=> start!72636 true))

(declare-fun array_inv!18174 (array!47636) Bool)

(assert (=> start!72636 (array_inv!18174 _keys!868)))

(declare-fun e!470388 () Bool)

(declare-fun array_inv!18175 (array!47634) Bool)

(assert (=> start!72636 (and (array_inv!18175 _values!688) e!470388)))

(declare-fun b!843149 () Bool)

(assert (=> b!843149 (= e!470388 (and e!470391 mapRes!25130))))

(declare-fun condMapEmpty!25130 () Bool)

(declare-fun mapDefault!25130 () ValueCell!7404)

(assert (=> b!843149 (= condMapEmpty!25130 (= (arr!22848 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7404)) mapDefault!25130)))))

(assert (= (and start!72636 res!572990) b!843143))

(assert (= (and b!843143 res!572992) b!843145))

(assert (= (and b!843145 res!572993) b!843147))

(assert (= (and b!843147 res!572991) b!843148))

(assert (= (and b!843149 condMapEmpty!25130) mapIsEmpty!25130))

(assert (= (and b!843149 (not condMapEmpty!25130)) mapNonEmpty!25130))

(get-info :version)

(assert (= (and mapNonEmpty!25130 ((_ is ValueCellFull!7404) mapValue!25130)) b!843146))

(assert (= (and b!843149 ((_ is ValueCellFull!7404) mapDefault!25130)) b!843144))

(assert (= start!72636 b!843149))

(declare-fun m!785949 () Bool)

(assert (=> mapNonEmpty!25130 m!785949))

(declare-fun m!785951 () Bool)

(assert (=> b!843143 m!785951))

(declare-fun m!785953 () Bool)

(assert (=> start!72636 m!785953))

(declare-fun m!785955 () Bool)

(assert (=> start!72636 m!785955))

(declare-fun m!785957 () Bool)

(assert (=> b!843147 m!785957))

(declare-fun m!785959 () Bool)

(assert (=> b!843148 m!785959))

(check-sat (not b!843147) (not b!843148) (not b!843143) (not start!72636) (not mapNonEmpty!25130) tp_is_empty!15687)
(check-sat)
