; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72742 () Bool)

(assert start!72742)

(declare-fun mapNonEmpty!25037 () Bool)

(declare-fun mapRes!25037 () Bool)

(declare-fun tp!48356 () Bool)

(declare-fun e!470505 () Bool)

(assert (=> mapNonEmpty!25037 (= mapRes!25037 (and tp!48356 e!470505))))

(declare-fun mapKey!25037 () (_ BitVec 32))

(declare-datatypes ((V!25881 0))(
  ( (V!25882 (val!7860 Int)) )
))
(declare-datatypes ((ValueCell!7373 0))(
  ( (ValueCellFull!7373 (v!10285 V!25881)) (EmptyCell!7373) )
))
(declare-fun mapValue!25037 () ValueCell!7373)

(declare-fun mapRest!25037 () (Array (_ BitVec 32) ValueCell!7373))

(declare-datatypes ((array!47543 0))(
  ( (array!47544 (arr!22798 (Array (_ BitVec 32) ValueCell!7373)) (size!23239 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47543)

(assert (=> mapNonEmpty!25037 (= (arr!22798 _values!688) (store mapRest!25037 mapKey!25037 mapValue!25037))))

(declare-fun b!843395 () Bool)

(declare-fun tp_is_empty!15625 () Bool)

(assert (=> b!843395 (= e!470505 tp_is_empty!15625)))

(declare-fun b!843396 () Bool)

(declare-fun res!572963 () Bool)

(declare-fun e!470507 () Bool)

(assert (=> b!843396 (=> (not res!572963) (not e!470507))))

(declare-datatypes ((array!47545 0))(
  ( (array!47546 (arr!22799 (Array (_ BitVec 32) (_ BitVec 64))) (size!23240 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47545)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47545 (_ BitVec 32)) Bool)

(assert (=> b!843396 (= res!572963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!843397 () Bool)

(assert (=> b!843397 (= e!470507 false)))

(declare-fun lt!381365 () Bool)

(declare-datatypes ((List!16137 0))(
  ( (Nil!16134) (Cons!16133 (h!17270 (_ BitVec 64)) (t!22500 List!16137)) )
))
(declare-fun arrayNoDuplicates!0 (array!47545 (_ BitVec 32) List!16137) Bool)

(assert (=> b!843397 (= lt!381365 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16134))))

(declare-fun mapIsEmpty!25037 () Bool)

(assert (=> mapIsEmpty!25037 mapRes!25037))

(declare-fun b!843399 () Bool)

(declare-fun e!470509 () Bool)

(declare-fun e!470506 () Bool)

(assert (=> b!843399 (= e!470509 (and e!470506 mapRes!25037))))

(declare-fun condMapEmpty!25037 () Bool)

(declare-fun mapDefault!25037 () ValueCell!7373)

(assert (=> b!843399 (= condMapEmpty!25037 (= (arr!22798 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7373)) mapDefault!25037)))))

(declare-fun b!843400 () Bool)

(assert (=> b!843400 (= e!470506 tp_is_empty!15625)))

(declare-fun b!843401 () Bool)

(declare-fun res!572964 () Bool)

(assert (=> b!843401 (=> (not res!572964) (not e!470507))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!843401 (= res!572964 (validMask!0 mask!1196))))

(declare-fun b!843398 () Bool)

(declare-fun res!572965 () Bool)

(assert (=> b!843398 (=> (not res!572965) (not e!470507))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!843398 (= res!572965 (and (= (size!23239 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23240 _keys!868) (size!23239 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!572962 () Bool)

(assert (=> start!72742 (=> (not res!572962) (not e!470507))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72742 (= res!572962 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23240 _keys!868))))))

(assert (=> start!72742 e!470507))

(assert (=> start!72742 true))

(declare-fun array_inv!18188 (array!47545) Bool)

(assert (=> start!72742 (array_inv!18188 _keys!868)))

(declare-fun array_inv!18189 (array!47543) Bool)

(assert (=> start!72742 (and (array_inv!18189 _values!688) e!470509)))

(assert (= (and start!72742 res!572962) b!843401))

(assert (= (and b!843401 res!572964) b!843398))

(assert (= (and b!843398 res!572965) b!843396))

(assert (= (and b!843396 res!572963) b!843397))

(assert (= (and b!843399 condMapEmpty!25037) mapIsEmpty!25037))

(assert (= (and b!843399 (not condMapEmpty!25037)) mapNonEmpty!25037))

(get-info :version)

(assert (= (and mapNonEmpty!25037 ((_ is ValueCellFull!7373) mapValue!25037)) b!843395))

(assert (= (and b!843399 ((_ is ValueCellFull!7373) mapDefault!25037)) b!843400))

(assert (= start!72742 b!843399))

(declare-fun m!786869 () Bool)

(assert (=> b!843401 m!786869))

(declare-fun m!786871 () Bool)

(assert (=> b!843397 m!786871))

(declare-fun m!786873 () Bool)

(assert (=> b!843396 m!786873))

(declare-fun m!786875 () Bool)

(assert (=> start!72742 m!786875))

(declare-fun m!786877 () Bool)

(assert (=> start!72742 m!786877))

(declare-fun m!786879 () Bool)

(assert (=> mapNonEmpty!25037 m!786879))

(check-sat (not mapNonEmpty!25037) (not b!843401) tp_is_empty!15625 (not start!72742) (not b!843397) (not b!843396))
(check-sat)
