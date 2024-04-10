; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72660 () Bool)

(assert start!72660)

(declare-fun res!573137 () Bool)

(declare-fun e!470571 () Bool)

(assert (=> start!72660 (=> (not res!573137) (not e!470571))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!47674 0))(
  ( (array!47675 (arr!22868 (Array (_ BitVec 32) (_ BitVec 64))) (size!23308 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47674)

(assert (=> start!72660 (= res!573137 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23308 _keys!868))))))

(assert (=> start!72660 e!470571))

(assert (=> start!72660 true))

(declare-fun array_inv!18186 (array!47674) Bool)

(assert (=> start!72660 (array_inv!18186 _keys!868)))

(declare-datatypes ((V!25995 0))(
  ( (V!25996 (val!7903 Int)) )
))
(declare-datatypes ((ValueCell!7416 0))(
  ( (ValueCellFull!7416 (v!10328 V!25995)) (EmptyCell!7416) )
))
(declare-datatypes ((array!47676 0))(
  ( (array!47677 (arr!22869 (Array (_ BitVec 32) ValueCell!7416)) (size!23309 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47676)

(declare-fun e!470570 () Bool)

(declare-fun array_inv!18187 (array!47676) Bool)

(assert (=> start!72660 (and (array_inv!18187 _values!688) e!470570)))

(declare-fun b!843395 () Bool)

(assert (=> b!843395 (= e!470571 false)))

(declare-fun lt!381133 () Bool)

(declare-datatypes ((List!16236 0))(
  ( (Nil!16233) (Cons!16232 (h!17363 (_ BitVec 64)) (t!22607 List!16236)) )
))
(declare-fun arrayNoDuplicates!0 (array!47674 (_ BitVec 32) List!16236) Bool)

(assert (=> b!843395 (= lt!381133 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16233))))

(declare-fun b!843396 () Bool)

(declare-fun res!573135 () Bool)

(assert (=> b!843396 (=> (not res!573135) (not e!470571))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47674 (_ BitVec 32)) Bool)

(assert (=> b!843396 (= res!573135 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843397 () Bool)

(declare-fun e!470572 () Bool)

(declare-fun mapRes!25166 () Bool)

(assert (=> b!843397 (= e!470570 (and e!470572 mapRes!25166))))

(declare-fun condMapEmpty!25166 () Bool)

(declare-fun mapDefault!25166 () ValueCell!7416)

(assert (=> b!843397 (= condMapEmpty!25166 (= (arr!22869 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7416)) mapDefault!25166)))))

(declare-fun b!843398 () Bool)

(declare-fun e!470569 () Bool)

(declare-fun tp_is_empty!15711 () Bool)

(assert (=> b!843398 (= e!470569 tp_is_empty!15711)))

(declare-fun mapNonEmpty!25166 () Bool)

(declare-fun tp!48484 () Bool)

(assert (=> mapNonEmpty!25166 (= mapRes!25166 (and tp!48484 e!470569))))

(declare-fun mapValue!25166 () ValueCell!7416)

(declare-fun mapKey!25166 () (_ BitVec 32))

(declare-fun mapRest!25166 () (Array (_ BitVec 32) ValueCell!7416))

(assert (=> mapNonEmpty!25166 (= (arr!22869 _values!688) (store mapRest!25166 mapKey!25166 mapValue!25166))))

(declare-fun b!843399 () Bool)

(declare-fun res!573134 () Bool)

(assert (=> b!843399 (=> (not res!573134) (not e!470571))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843399 (= res!573134 (and (= (size!23309 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23308 _keys!868) (size!23309 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!25166 () Bool)

(assert (=> mapIsEmpty!25166 mapRes!25166))

(declare-fun b!843400 () Bool)

(assert (=> b!843400 (= e!470572 tp_is_empty!15711)))

(declare-fun b!843401 () Bool)

(declare-fun res!573136 () Bool)

(assert (=> b!843401 (=> (not res!573136) (not e!470571))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843401 (= res!573136 (validMask!0 mask!1196))))

(assert (= (and start!72660 res!573137) b!843401))

(assert (= (and b!843401 res!573136) b!843399))

(assert (= (and b!843399 res!573134) b!843396))

(assert (= (and b!843396 res!573135) b!843395))

(assert (= (and b!843397 condMapEmpty!25166) mapIsEmpty!25166))

(assert (= (and b!843397 (not condMapEmpty!25166)) mapNonEmpty!25166))

(get-info :version)

(assert (= (and mapNonEmpty!25166 ((_ is ValueCellFull!7416) mapValue!25166)) b!843398))

(assert (= (and b!843397 ((_ is ValueCellFull!7416) mapDefault!25166)) b!843400))

(assert (= start!72660 b!843397))

(declare-fun m!786093 () Bool)

(assert (=> b!843396 m!786093))

(declare-fun m!786095 () Bool)

(assert (=> b!843395 m!786095))

(declare-fun m!786097 () Bool)

(assert (=> b!843401 m!786097))

(declare-fun m!786099 () Bool)

(assert (=> mapNonEmpty!25166 m!786099))

(declare-fun m!786101 () Bool)

(assert (=> start!72660 m!786101))

(declare-fun m!786103 () Bool)

(assert (=> start!72660 m!786103))

(check-sat (not start!72660) (not b!843395) (not b!843396) tp_is_empty!15711 (not mapNonEmpty!25166) (not b!843401))
(check-sat)
