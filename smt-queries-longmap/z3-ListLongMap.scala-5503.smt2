; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72804 () Bool)

(assert start!72804)

(declare-fun b!844907 () Bool)

(declare-fun e!471650 () Bool)

(declare-fun tp_is_empty!15855 () Bool)

(assert (=> b!844907 (= e!471650 tp_is_empty!15855)))

(declare-fun b!844908 () Bool)

(declare-fun res!574001 () Bool)

(declare-fun e!471652 () Bool)

(assert (=> b!844908 (=> (not res!574001) (not e!471652))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47936 0))(
  ( (array!47937 (arr!22999 (Array (_ BitVec 32) (_ BitVec 64))) (size!23439 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47936)

(declare-datatypes ((V!26187 0))(
  ( (V!26188 (val!7975 Int)) )
))
(declare-datatypes ((ValueCell!7488 0))(
  ( (ValueCellFull!7488 (v!10400 V!26187)) (EmptyCell!7488) )
))
(declare-datatypes ((array!47938 0))(
  ( (array!47939 (arr!23000 (Array (_ BitVec 32) ValueCell!7488)) (size!23440 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47938)

(assert (=> b!844908 (= res!574001 (and (= (size!23440 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23439 _keys!868) (size!23440 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844909 () Bool)

(declare-fun e!471649 () Bool)

(declare-fun e!471648 () Bool)

(declare-fun mapRes!25382 () Bool)

(assert (=> b!844909 (= e!471649 (and e!471648 mapRes!25382))))

(declare-fun condMapEmpty!25382 () Bool)

(declare-fun mapDefault!25382 () ValueCell!7488)

(assert (=> b!844909 (= condMapEmpty!25382 (= (arr!23000 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7488)) mapDefault!25382)))))

(declare-fun res!573998 () Bool)

(assert (=> start!72804 (=> (not res!573998) (not e!471652))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72804 (= res!573998 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23439 _keys!868))))))

(assert (=> start!72804 e!471652))

(assert (=> start!72804 true))

(declare-fun array_inv!18284 (array!47936) Bool)

(assert (=> start!72804 (array_inv!18284 _keys!868)))

(declare-fun array_inv!18285 (array!47938) Bool)

(assert (=> start!72804 (and (array_inv!18285 _values!688) e!471649)))

(declare-fun b!844910 () Bool)

(assert (=> b!844910 (= e!471652 false)))

(declare-fun lt!381349 () Bool)

(declare-datatypes ((List!16288 0))(
  ( (Nil!16285) (Cons!16284 (h!17415 (_ BitVec 64)) (t!22659 List!16288)) )
))
(declare-fun arrayNoDuplicates!0 (array!47936 (_ BitVec 32) List!16288) Bool)

(assert (=> b!844910 (= lt!381349 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16285))))

(declare-fun b!844911 () Bool)

(assert (=> b!844911 (= e!471648 tp_is_empty!15855)))

(declare-fun mapIsEmpty!25382 () Bool)

(assert (=> mapIsEmpty!25382 mapRes!25382))

(declare-fun b!844912 () Bool)

(declare-fun res!573999 () Bool)

(assert (=> b!844912 (=> (not res!573999) (not e!471652))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47936 (_ BitVec 32)) Bool)

(assert (=> b!844912 (= res!573999 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapNonEmpty!25382 () Bool)

(declare-fun tp!48700 () Bool)

(assert (=> mapNonEmpty!25382 (= mapRes!25382 (and tp!48700 e!471650))))

(declare-fun mapKey!25382 () (_ BitVec 32))

(declare-fun mapValue!25382 () ValueCell!7488)

(declare-fun mapRest!25382 () (Array (_ BitVec 32) ValueCell!7488))

(assert (=> mapNonEmpty!25382 (= (arr!23000 _values!688) (store mapRest!25382 mapKey!25382 mapValue!25382))))

(declare-fun b!844913 () Bool)

(declare-fun res!574000 () Bool)

(assert (=> b!844913 (=> (not res!574000) (not e!471652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844913 (= res!574000 (validMask!0 mask!1196))))

(assert (= (and start!72804 res!573998) b!844913))

(assert (= (and b!844913 res!574000) b!844908))

(assert (= (and b!844908 res!574001) b!844912))

(assert (= (and b!844912 res!573999) b!844910))

(assert (= (and b!844909 condMapEmpty!25382) mapIsEmpty!25382))

(assert (= (and b!844909 (not condMapEmpty!25382)) mapNonEmpty!25382))

(get-info :version)

(assert (= (and mapNonEmpty!25382 ((_ is ValueCellFull!7488) mapValue!25382)) b!844907))

(assert (= (and b!844909 ((_ is ValueCellFull!7488) mapDefault!25382)) b!844911))

(assert (= start!72804 b!844909))

(declare-fun m!786957 () Bool)

(assert (=> mapNonEmpty!25382 m!786957))

(declare-fun m!786959 () Bool)

(assert (=> b!844912 m!786959))

(declare-fun m!786961 () Bool)

(assert (=> b!844910 m!786961))

(declare-fun m!786963 () Bool)

(assert (=> b!844913 m!786963))

(declare-fun m!786965 () Bool)

(assert (=> start!72804 m!786965))

(declare-fun m!786967 () Bool)

(assert (=> start!72804 m!786967))

(check-sat (not mapNonEmpty!25382) (not b!844910) (not start!72804) (not b!844913) (not b!844912) tp_is_empty!15855)
(check-sat)
