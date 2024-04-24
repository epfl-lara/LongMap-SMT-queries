; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72886 () Bool)

(assert start!72886)

(declare-fun mapIsEmpty!25253 () Bool)

(declare-fun mapRes!25253 () Bool)

(assert (=> mapIsEmpty!25253 mapRes!25253))

(declare-fun mapNonEmpty!25253 () Bool)

(declare-fun tp!48572 () Bool)

(declare-fun e!471587 () Bool)

(assert (=> mapNonEmpty!25253 (= mapRes!25253 (and tp!48572 e!471587))))

(declare-datatypes ((V!26073 0))(
  ( (V!26074 (val!7932 Int)) )
))
(declare-datatypes ((ValueCell!7445 0))(
  ( (ValueCellFull!7445 (v!10357 V!26073)) (EmptyCell!7445) )
))
(declare-fun mapValue!25253 () ValueCell!7445)

(declare-fun mapRest!25253 () (Array (_ BitVec 32) ValueCell!7445))

(declare-fun mapKey!25253 () (_ BitVec 32))

(declare-datatypes ((array!47815 0))(
  ( (array!47816 (arr!22934 (Array (_ BitVec 32) ValueCell!7445)) (size!23375 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47815)

(assert (=> mapNonEmpty!25253 (= (arr!22934 _values!688) (store mapRest!25253 mapKey!25253 mapValue!25253))))

(declare-fun res!573828 () Bool)

(declare-fun e!471585 () Bool)

(assert (=> start!72886 (=> (not res!573828) (not e!471585))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47817 0))(
  ( (array!47818 (arr!22935 (Array (_ BitVec 32) (_ BitVec 64))) (size!23376 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47817)

(assert (=> start!72886 (= res!573828 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23376 _keys!868))))))

(assert (=> start!72886 e!471585))

(assert (=> start!72886 true))

(declare-fun array_inv!18288 (array!47817) Bool)

(assert (=> start!72886 (array_inv!18288 _keys!868)))

(declare-fun e!471586 () Bool)

(declare-fun array_inv!18289 (array!47815) Bool)

(assert (=> start!72886 (and (array_inv!18289 _values!688) e!471586)))

(declare-fun b!844907 () Bool)

(declare-fun e!471588 () Bool)

(declare-fun tp_is_empty!15769 () Bool)

(assert (=> b!844907 (= e!471588 tp_is_empty!15769)))

(declare-fun b!844908 () Bool)

(assert (=> b!844908 (= e!471586 (and e!471588 mapRes!25253))))

(declare-fun condMapEmpty!25253 () Bool)

(declare-fun mapDefault!25253 () ValueCell!7445)

(assert (=> b!844908 (= condMapEmpty!25253 (= (arr!22934 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7445)) mapDefault!25253)))))

(declare-fun b!844909 () Bool)

(declare-fun res!573826 () Bool)

(assert (=> b!844909 (=> (not res!573826) (not e!471585))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844909 (= res!573826 (validMask!0 mask!1196))))

(declare-fun b!844910 () Bool)

(assert (=> b!844910 (= e!471585 false)))

(declare-fun lt!381581 () Bool)

(declare-datatypes ((List!16186 0))(
  ( (Nil!16183) (Cons!16182 (h!17319 (_ BitVec 64)) (t!22549 List!16186)) )
))
(declare-fun arrayNoDuplicates!0 (array!47817 (_ BitVec 32) List!16186) Bool)

(assert (=> b!844910 (= lt!381581 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16183))))

(declare-fun b!844911 () Bool)

(declare-fun res!573829 () Bool)

(assert (=> b!844911 (=> (not res!573829) (not e!471585))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844911 (= res!573829 (and (= (size!23375 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23376 _keys!868) (size!23375 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844912 () Bool)

(declare-fun res!573827 () Bool)

(assert (=> b!844912 (=> (not res!573827) (not e!471585))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47817 (_ BitVec 32)) Bool)

(assert (=> b!844912 (= res!573827 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!844913 () Bool)

(assert (=> b!844913 (= e!471587 tp_is_empty!15769)))

(assert (= (and start!72886 res!573828) b!844909))

(assert (= (and b!844909 res!573826) b!844911))

(assert (= (and b!844911 res!573829) b!844912))

(assert (= (and b!844912 res!573827) b!844910))

(assert (= (and b!844908 condMapEmpty!25253) mapIsEmpty!25253))

(assert (= (and b!844908 (not condMapEmpty!25253)) mapNonEmpty!25253))

(get-info :version)

(assert (= (and mapNonEmpty!25253 ((_ is ValueCellFull!7445) mapValue!25253)) b!844913))

(assert (= (and b!844908 ((_ is ValueCellFull!7445) mapDefault!25253)) b!844907))

(assert (= start!72886 b!844908))

(declare-fun m!787733 () Bool)

(assert (=> b!844909 m!787733))

(declare-fun m!787735 () Bool)

(assert (=> mapNonEmpty!25253 m!787735))

(declare-fun m!787737 () Bool)

(assert (=> b!844910 m!787737))

(declare-fun m!787739 () Bool)

(assert (=> start!72886 m!787739))

(declare-fun m!787741 () Bool)

(assert (=> start!72886 m!787741))

(declare-fun m!787743 () Bool)

(assert (=> b!844912 m!787743))

(check-sat (not mapNonEmpty!25253) (not b!844910) tp_is_empty!15769 (not b!844909) (not b!844912) (not start!72886))
(check-sat)
