; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72736 () Bool)

(assert start!72736)

(declare-fun b!844143 () Bool)

(declare-fun res!573589 () Bool)

(declare-fun e!471129 () Bool)

(assert (=> b!844143 (=> (not res!573589) (not e!471129))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47839 0))(
  ( (array!47840 (arr!22951 (Array (_ BitVec 32) (_ BitVec 64))) (size!23393 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47839)

(declare-datatypes ((V!26121 0))(
  ( (V!26122 (val!7950 Int)) )
))
(declare-datatypes ((ValueCell!7463 0))(
  ( (ValueCellFull!7463 (v!10369 V!26121)) (EmptyCell!7463) )
))
(declare-datatypes ((array!47841 0))(
  ( (array!47842 (arr!22952 (Array (_ BitVec 32) ValueCell!7463)) (size!23394 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47841)

(assert (=> b!844143 (= res!573589 (and (= (size!23394 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23393 _keys!868) (size!23394 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844144 () Bool)

(assert (=> b!844144 (= e!471129 false)))

(declare-fun lt!381038 () Bool)

(declare-datatypes ((List!16286 0))(
  ( (Nil!16283) (Cons!16282 (h!17413 (_ BitVec 64)) (t!22648 List!16286)) )
))
(declare-fun arrayNoDuplicates!0 (array!47839 (_ BitVec 32) List!16286) Bool)

(assert (=> b!844144 (= lt!381038 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16283))))

(declare-fun b!844145 () Bool)

(declare-fun res!573590 () Bool)

(assert (=> b!844145 (=> (not res!573590) (not e!471129))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47839 (_ BitVec 32)) Bool)

(assert (=> b!844145 (= res!573590 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573591 () Bool)

(assert (=> start!72736 (=> (not res!573591) (not e!471129))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72736 (= res!573591 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23393 _keys!868))))))

(assert (=> start!72736 e!471129))

(assert (=> start!72736 true))

(declare-fun array_inv!18322 (array!47839) Bool)

(assert (=> start!72736 (array_inv!18322 _keys!868)))

(declare-fun e!471128 () Bool)

(declare-fun array_inv!18323 (array!47841) Bool)

(assert (=> start!72736 (and (array_inv!18323 _values!688) e!471128)))

(declare-fun b!844146 () Bool)

(declare-fun res!573588 () Bool)

(assert (=> b!844146 (=> (not res!573588) (not e!471129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844146 (= res!573588 (validMask!0 mask!1196))))

(declare-fun b!844147 () Bool)

(declare-fun e!471125 () Bool)

(declare-fun tp_is_empty!15805 () Bool)

(assert (=> b!844147 (= e!471125 tp_is_empty!15805)))

(declare-fun mapNonEmpty!25307 () Bool)

(declare-fun mapRes!25307 () Bool)

(declare-fun tp!48626 () Bool)

(assert (=> mapNonEmpty!25307 (= mapRes!25307 (and tp!48626 e!471125))))

(declare-fun mapValue!25307 () ValueCell!7463)

(declare-fun mapKey!25307 () (_ BitVec 32))

(declare-fun mapRest!25307 () (Array (_ BitVec 32) ValueCell!7463))

(assert (=> mapNonEmpty!25307 (= (arr!22952 _values!688) (store mapRest!25307 mapKey!25307 mapValue!25307))))

(declare-fun b!844148 () Bool)

(declare-fun e!471127 () Bool)

(assert (=> b!844148 (= e!471128 (and e!471127 mapRes!25307))))

(declare-fun condMapEmpty!25307 () Bool)

(declare-fun mapDefault!25307 () ValueCell!7463)

(assert (=> b!844148 (= condMapEmpty!25307 (= (arr!22952 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7463)) mapDefault!25307)))))

(declare-fun mapIsEmpty!25307 () Bool)

(assert (=> mapIsEmpty!25307 mapRes!25307))

(declare-fun b!844149 () Bool)

(assert (=> b!844149 (= e!471127 tp_is_empty!15805)))

(assert (= (and start!72736 res!573591) b!844146))

(assert (= (and b!844146 res!573588) b!844143))

(assert (= (and b!844143 res!573589) b!844145))

(assert (= (and b!844145 res!573590) b!844144))

(assert (= (and b!844148 condMapEmpty!25307) mapIsEmpty!25307))

(assert (= (and b!844148 (not condMapEmpty!25307)) mapNonEmpty!25307))

(get-info :version)

(assert (= (and mapNonEmpty!25307 ((_ is ValueCellFull!7463) mapValue!25307)) b!844147))

(assert (= (and b!844148 ((_ is ValueCellFull!7463) mapDefault!25307)) b!844149))

(assert (= start!72736 b!844148))

(declare-fun m!785903 () Bool)

(assert (=> b!844146 m!785903))

(declare-fun m!785905 () Bool)

(assert (=> start!72736 m!785905))

(declare-fun m!785907 () Bool)

(assert (=> start!72736 m!785907))

(declare-fun m!785909 () Bool)

(assert (=> b!844144 m!785909))

(declare-fun m!785911 () Bool)

(assert (=> mapNonEmpty!25307 m!785911))

(declare-fun m!785913 () Bool)

(assert (=> b!844145 m!785913))

(check-sat (not b!844145) tp_is_empty!15805 (not b!844144) (not start!72736) (not mapNonEmpty!25307) (not b!844146))
(check-sat)
