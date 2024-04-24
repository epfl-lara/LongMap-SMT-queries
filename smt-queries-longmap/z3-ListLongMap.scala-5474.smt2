; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72796 () Bool)

(assert start!72796)

(declare-fun b!843962 () Bool)

(declare-fun e!470911 () Bool)

(assert (=> b!843962 (= e!470911 false)))

(declare-fun lt!381446 () Bool)

(declare-datatypes ((array!47645 0))(
  ( (array!47646 (arr!22849 (Array (_ BitVec 32) (_ BitVec 64))) (size!23290 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47645)

(declare-datatypes ((List!16156 0))(
  ( (Nil!16153) (Cons!16152 (h!17289 (_ BitVec 64)) (t!22519 List!16156)) )
))
(declare-fun arrayNoDuplicates!0 (array!47645 (_ BitVec 32) List!16156) Bool)

(assert (=> b!843962 (= lt!381446 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16153))))

(declare-fun mapNonEmpty!25118 () Bool)

(declare-fun mapRes!25118 () Bool)

(declare-fun tp!48437 () Bool)

(declare-fun e!470913 () Bool)

(assert (=> mapNonEmpty!25118 (= mapRes!25118 (and tp!48437 e!470913))))

(declare-datatypes ((V!25953 0))(
  ( (V!25954 (val!7887 Int)) )
))
(declare-datatypes ((ValueCell!7400 0))(
  ( (ValueCellFull!7400 (v!10312 V!25953)) (EmptyCell!7400) )
))
(declare-fun mapRest!25118 () (Array (_ BitVec 32) ValueCell!7400))

(declare-datatypes ((array!47647 0))(
  ( (array!47648 (arr!22850 (Array (_ BitVec 32) ValueCell!7400)) (size!23291 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47647)

(declare-fun mapKey!25118 () (_ BitVec 32))

(declare-fun mapValue!25118 () ValueCell!7400)

(assert (=> mapNonEmpty!25118 (= (arr!22850 _values!688) (store mapRest!25118 mapKey!25118 mapValue!25118))))

(declare-fun mapIsEmpty!25118 () Bool)

(assert (=> mapIsEmpty!25118 mapRes!25118))

(declare-fun b!843963 () Bool)

(declare-fun tp_is_empty!15679 () Bool)

(assert (=> b!843963 (= e!470913 tp_is_empty!15679)))

(declare-fun b!843964 () Bool)

(declare-fun res!573289 () Bool)

(assert (=> b!843964 (=> (not res!573289) (not e!470911))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843964 (= res!573289 (validMask!0 mask!1196))))

(declare-fun b!843965 () Bool)

(declare-fun res!573286 () Bool)

(assert (=> b!843965 (=> (not res!573286) (not e!470911))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843965 (= res!573286 (and (= (size!23291 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23290 _keys!868) (size!23291 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!573288 () Bool)

(assert (=> start!72796 (=> (not res!573288) (not e!470911))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72796 (= res!573288 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23290 _keys!868))))))

(assert (=> start!72796 e!470911))

(assert (=> start!72796 true))

(declare-fun array_inv!18226 (array!47645) Bool)

(assert (=> start!72796 (array_inv!18226 _keys!868)))

(declare-fun e!470912 () Bool)

(declare-fun array_inv!18227 (array!47647) Bool)

(assert (=> start!72796 (and (array_inv!18227 _values!688) e!470912)))

(declare-fun b!843966 () Bool)

(declare-fun res!573287 () Bool)

(assert (=> b!843966 (=> (not res!573287) (not e!470911))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47645 (_ BitVec 32)) Bool)

(assert (=> b!843966 (= res!573287 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843967 () Bool)

(declare-fun e!470914 () Bool)

(assert (=> b!843967 (= e!470914 tp_is_empty!15679)))

(declare-fun b!843968 () Bool)

(assert (=> b!843968 (= e!470912 (and e!470914 mapRes!25118))))

(declare-fun condMapEmpty!25118 () Bool)

(declare-fun mapDefault!25118 () ValueCell!7400)

(assert (=> b!843968 (= condMapEmpty!25118 (= (arr!22850 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7400)) mapDefault!25118)))))

(assert (= (and start!72796 res!573288) b!843964))

(assert (= (and b!843964 res!573289) b!843965))

(assert (= (and b!843965 res!573286) b!843966))

(assert (= (and b!843966 res!573287) b!843962))

(assert (= (and b!843968 condMapEmpty!25118) mapIsEmpty!25118))

(assert (= (and b!843968 (not condMapEmpty!25118)) mapNonEmpty!25118))

(get-info :version)

(assert (= (and mapNonEmpty!25118 ((_ is ValueCellFull!7400) mapValue!25118)) b!843963))

(assert (= (and b!843968 ((_ is ValueCellFull!7400) mapDefault!25118)) b!843967))

(assert (= start!72796 b!843968))

(declare-fun m!787193 () Bool)

(assert (=> b!843964 m!787193))

(declare-fun m!787195 () Bool)

(assert (=> b!843966 m!787195))

(declare-fun m!787197 () Bool)

(assert (=> start!72796 m!787197))

(declare-fun m!787199 () Bool)

(assert (=> start!72796 m!787199))

(declare-fun m!787201 () Bool)

(assert (=> mapNonEmpty!25118 m!787201))

(declare-fun m!787203 () Bool)

(assert (=> b!843962 m!787203))

(check-sat (not b!843966) (not start!72796) tp_is_empty!15679 (not b!843964) (not mapNonEmpty!25118) (not b!843962))
(check-sat)
