; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72754 () Bool)

(assert start!72754)

(declare-fun b!844332 () Bool)

(declare-fun res!573698 () Bool)

(declare-fun e!471260 () Bool)

(assert (=> b!844332 (=> (not res!573698) (not e!471260))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844332 (= res!573698 (validMask!0 mask!1196))))

(declare-fun b!844333 () Bool)

(declare-fun res!573697 () Bool)

(assert (=> b!844333 (=> (not res!573697) (not e!471260))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!47871 0))(
  ( (array!47872 (arr!22967 (Array (_ BitVec 32) (_ BitVec 64))) (size!23409 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47871)

(declare-datatypes ((V!26145 0))(
  ( (V!26146 (val!7959 Int)) )
))
(declare-datatypes ((ValueCell!7472 0))(
  ( (ValueCellFull!7472 (v!10378 V!26145)) (EmptyCell!7472) )
))
(declare-datatypes ((array!47873 0))(
  ( (array!47874 (arr!22968 (Array (_ BitVec 32) ValueCell!7472)) (size!23410 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47873)

(assert (=> b!844333 (= res!573697 (and (= (size!23410 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23409 _keys!868) (size!23410 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844334 () Bool)

(declare-fun e!471262 () Bool)

(declare-fun tp_is_empty!15823 () Bool)

(assert (=> b!844334 (= e!471262 tp_is_empty!15823)))

(declare-fun b!844336 () Bool)

(declare-fun e!471263 () Bool)

(assert (=> b!844336 (= e!471263 tp_is_empty!15823)))

(declare-fun mapNonEmpty!25334 () Bool)

(declare-fun mapRes!25334 () Bool)

(declare-fun tp!48653 () Bool)

(assert (=> mapNonEmpty!25334 (= mapRes!25334 (and tp!48653 e!471262))))

(declare-fun mapKey!25334 () (_ BitVec 32))

(declare-fun mapValue!25334 () ValueCell!7472)

(declare-fun mapRest!25334 () (Array (_ BitVec 32) ValueCell!7472))

(assert (=> mapNonEmpty!25334 (= (arr!22968 _values!688) (store mapRest!25334 mapKey!25334 mapValue!25334))))

(declare-fun b!844337 () Bool)

(declare-fun res!573699 () Bool)

(assert (=> b!844337 (=> (not res!573699) (not e!471260))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47871 (_ BitVec 32)) Bool)

(assert (=> b!844337 (= res!573699 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!25334 () Bool)

(assert (=> mapIsEmpty!25334 mapRes!25334))

(declare-fun b!844338 () Bool)

(assert (=> b!844338 (= e!471260 false)))

(declare-fun lt!381065 () Bool)

(declare-datatypes ((List!16291 0))(
  ( (Nil!16288) (Cons!16287 (h!17418 (_ BitVec 64)) (t!22653 List!16291)) )
))
(declare-fun arrayNoDuplicates!0 (array!47871 (_ BitVec 32) List!16291) Bool)

(assert (=> b!844338 (= lt!381065 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16288))))

(declare-fun b!844335 () Bool)

(declare-fun e!471261 () Bool)

(assert (=> b!844335 (= e!471261 (and e!471263 mapRes!25334))))

(declare-fun condMapEmpty!25334 () Bool)

(declare-fun mapDefault!25334 () ValueCell!7472)

(assert (=> b!844335 (= condMapEmpty!25334 (= (arr!22968 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7472)) mapDefault!25334)))))

(declare-fun res!573696 () Bool)

(assert (=> start!72754 (=> (not res!573696) (not e!471260))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72754 (= res!573696 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23409 _keys!868))))))

(assert (=> start!72754 e!471260))

(assert (=> start!72754 true))

(declare-fun array_inv!18330 (array!47871) Bool)

(assert (=> start!72754 (array_inv!18330 _keys!868)))

(declare-fun array_inv!18331 (array!47873) Bool)

(assert (=> start!72754 (and (array_inv!18331 _values!688) e!471261)))

(assert (= (and start!72754 res!573696) b!844332))

(assert (= (and b!844332 res!573698) b!844333))

(assert (= (and b!844333 res!573697) b!844337))

(assert (= (and b!844337 res!573699) b!844338))

(assert (= (and b!844335 condMapEmpty!25334) mapIsEmpty!25334))

(assert (= (and b!844335 (not condMapEmpty!25334)) mapNonEmpty!25334))

(get-info :version)

(assert (= (and mapNonEmpty!25334 ((_ is ValueCellFull!7472) mapValue!25334)) b!844334))

(assert (= (and b!844335 ((_ is ValueCellFull!7472) mapDefault!25334)) b!844336))

(assert (= start!72754 b!844335))

(declare-fun m!786011 () Bool)

(assert (=> mapNonEmpty!25334 m!786011))

(declare-fun m!786013 () Bool)

(assert (=> start!72754 m!786013))

(declare-fun m!786015 () Bool)

(assert (=> start!72754 m!786015))

(declare-fun m!786017 () Bool)

(assert (=> b!844337 m!786017))

(declare-fun m!786019 () Bool)

(assert (=> b!844332 m!786019))

(declare-fun m!786021 () Bool)

(assert (=> b!844338 m!786021))

(check-sat (not b!844338) (not mapNonEmpty!25334) (not start!72754) (not b!844337) tp_is_empty!15823 (not b!844332))
(check-sat)
