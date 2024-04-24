; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72904 () Bool)

(assert start!72904)

(declare-fun b!845097 () Bool)

(declare-fun e!471724 () Bool)

(declare-fun e!471723 () Bool)

(declare-fun mapRes!25280 () Bool)

(assert (=> b!845097 (= e!471724 (and e!471723 mapRes!25280))))

(declare-fun condMapEmpty!25280 () Bool)

(declare-datatypes ((V!26097 0))(
  ( (V!26098 (val!7941 Int)) )
))
(declare-datatypes ((ValueCell!7454 0))(
  ( (ValueCellFull!7454 (v!10366 V!26097)) (EmptyCell!7454) )
))
(declare-datatypes ((array!47849 0))(
  ( (array!47850 (arr!22951 (Array (_ BitVec 32) ValueCell!7454)) (size!23392 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47849)

(declare-fun mapDefault!25280 () ValueCell!7454)

(assert (=> b!845097 (= condMapEmpty!25280 (= (arr!22951 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7454)) mapDefault!25280)))))

(declare-fun b!845098 () Bool)

(declare-fun res!573935 () Bool)

(declare-fun e!471720 () Bool)

(assert (=> b!845098 (=> (not res!573935) (not e!471720))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47851 0))(
  ( (array!47852 (arr!22952 (Array (_ BitVec 32) (_ BitVec 64))) (size!23393 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47851)

(assert (=> b!845098 (= res!573935 (and (= (size!23392 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23393 _keys!868) (size!23392 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25280 () Bool)

(assert (=> mapIsEmpty!25280 mapRes!25280))

(declare-fun mapNonEmpty!25280 () Bool)

(declare-fun tp!48599 () Bool)

(declare-fun e!471721 () Bool)

(assert (=> mapNonEmpty!25280 (= mapRes!25280 (and tp!48599 e!471721))))

(declare-fun mapRest!25280 () (Array (_ BitVec 32) ValueCell!7454))

(declare-fun mapKey!25280 () (_ BitVec 32))

(declare-fun mapValue!25280 () ValueCell!7454)

(assert (=> mapNonEmpty!25280 (= (arr!22951 _values!688) (store mapRest!25280 mapKey!25280 mapValue!25280))))

(declare-fun b!845099 () Bool)

(declare-fun tp_is_empty!15787 () Bool)

(assert (=> b!845099 (= e!471723 tp_is_empty!15787)))

(declare-fun b!845100 () Bool)

(declare-fun res!573936 () Bool)

(assert (=> b!845100 (=> (not res!573936) (not e!471720))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!845100 (= res!573936 (validMask!0 mask!1196))))

(declare-fun b!845101 () Bool)

(assert (=> b!845101 (= e!471721 tp_is_empty!15787)))

(declare-fun b!845102 () Bool)

(declare-fun res!573934 () Bool)

(assert (=> b!845102 (=> (not res!573934) (not e!471720))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47851 (_ BitVec 32)) Bool)

(assert (=> b!845102 (= res!573934 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573937 () Bool)

(assert (=> start!72904 (=> (not res!573937) (not e!471720))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72904 (= res!573937 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23393 _keys!868))))))

(assert (=> start!72904 e!471720))

(assert (=> start!72904 true))

(declare-fun array_inv!18300 (array!47851) Bool)

(assert (=> start!72904 (array_inv!18300 _keys!868)))

(declare-fun array_inv!18301 (array!47849) Bool)

(assert (=> start!72904 (and (array_inv!18301 _values!688) e!471724)))

(declare-fun b!845096 () Bool)

(assert (=> b!845096 (= e!471720 false)))

(declare-fun lt!381608 () Bool)

(declare-datatypes ((List!16192 0))(
  ( (Nil!16189) (Cons!16188 (h!17325 (_ BitVec 64)) (t!22555 List!16192)) )
))
(declare-fun arrayNoDuplicates!0 (array!47851 (_ BitVec 32) List!16192) Bool)

(assert (=> b!845096 (= lt!381608 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16189))))

(assert (= (and start!72904 res!573937) b!845100))

(assert (= (and b!845100 res!573936) b!845098))

(assert (= (and b!845098 res!573935) b!845102))

(assert (= (and b!845102 res!573934) b!845096))

(assert (= (and b!845097 condMapEmpty!25280) mapIsEmpty!25280))

(assert (= (and b!845097 (not condMapEmpty!25280)) mapNonEmpty!25280))

(get-info :version)

(assert (= (and mapNonEmpty!25280 ((_ is ValueCellFull!7454) mapValue!25280)) b!845101))

(assert (= (and b!845097 ((_ is ValueCellFull!7454) mapDefault!25280)) b!845099))

(assert (= start!72904 b!845097))

(declare-fun m!787841 () Bool)

(assert (=> b!845100 m!787841))

(declare-fun m!787843 () Bool)

(assert (=> start!72904 m!787843))

(declare-fun m!787845 () Bool)

(assert (=> start!72904 m!787845))

(declare-fun m!787847 () Bool)

(assert (=> b!845102 m!787847))

(declare-fun m!787849 () Bool)

(assert (=> b!845096 m!787849))

(declare-fun m!787851 () Bool)

(assert (=> mapNonEmpty!25280 m!787851))

(check-sat (not b!845102) tp_is_empty!15787 (not mapNonEmpty!25280) (not b!845100) (not start!72904) (not b!845096))
(check-sat)
