; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72720 () Bool)

(assert start!72720)

(declare-fun b!844025 () Bool)

(declare-fun e!471021 () Bool)

(declare-fun tp_is_empty!15771 () Bool)

(assert (=> b!844025 (= e!471021 tp_is_empty!15771)))

(declare-fun b!844026 () Bool)

(declare-fun res!573494 () Bool)

(declare-fun e!471020 () Bool)

(assert (=> b!844026 (=> (not res!573494) (not e!471020))))

(declare-datatypes ((array!47784 0))(
  ( (array!47785 (arr!22923 (Array (_ BitVec 32) (_ BitVec 64))) (size!23363 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47784)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47784 (_ BitVec 32)) Bool)

(assert (=> b!844026 (= res!573494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!573495 () Bool)

(assert (=> start!72720 (=> (not res!573495) (not e!471020))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72720 (= res!573495 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23363 _keys!868))))))

(assert (=> start!72720 e!471020))

(assert (=> start!72720 true))

(declare-fun array_inv!18230 (array!47784) Bool)

(assert (=> start!72720 (array_inv!18230 _keys!868)))

(declare-datatypes ((V!26075 0))(
  ( (V!26076 (val!7933 Int)) )
))
(declare-datatypes ((ValueCell!7446 0))(
  ( (ValueCellFull!7446 (v!10358 V!26075)) (EmptyCell!7446) )
))
(declare-datatypes ((array!47786 0))(
  ( (array!47787 (arr!22924 (Array (_ BitVec 32) ValueCell!7446)) (size!23364 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47786)

(declare-fun e!471022 () Bool)

(declare-fun array_inv!18231 (array!47786) Bool)

(assert (=> start!72720 (and (array_inv!18231 _values!688) e!471022)))

(declare-fun b!844027 () Bool)

(declare-fun e!471018 () Bool)

(assert (=> b!844027 (= e!471018 tp_is_empty!15771)))

(declare-fun b!844028 () Bool)

(declare-fun res!573496 () Bool)

(assert (=> b!844028 (=> (not res!573496) (not e!471020))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!844028 (= res!573496 (and (= (size!23364 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23363 _keys!868) (size!23364 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!844029 () Bool)

(declare-fun res!573497 () Bool)

(assert (=> b!844029 (=> (not res!573497) (not e!471020))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!844029 (= res!573497 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25256 () Bool)

(declare-fun mapRes!25256 () Bool)

(assert (=> mapIsEmpty!25256 mapRes!25256))

(declare-fun b!844030 () Bool)

(assert (=> b!844030 (= e!471020 false)))

(declare-fun lt!381223 () Bool)

(declare-datatypes ((List!16258 0))(
  ( (Nil!16255) (Cons!16254 (h!17385 (_ BitVec 64)) (t!22629 List!16258)) )
))
(declare-fun arrayNoDuplicates!0 (array!47784 (_ BitVec 32) List!16258) Bool)

(assert (=> b!844030 (= lt!381223 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16255))))

(declare-fun b!844031 () Bool)

(assert (=> b!844031 (= e!471022 (and e!471018 mapRes!25256))))

(declare-fun condMapEmpty!25256 () Bool)

(declare-fun mapDefault!25256 () ValueCell!7446)

(assert (=> b!844031 (= condMapEmpty!25256 (= (arr!22924 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7446)) mapDefault!25256)))))

(declare-fun mapNonEmpty!25256 () Bool)

(declare-fun tp!48574 () Bool)

(assert (=> mapNonEmpty!25256 (= mapRes!25256 (and tp!48574 e!471021))))

(declare-fun mapValue!25256 () ValueCell!7446)

(declare-fun mapKey!25256 () (_ BitVec 32))

(declare-fun mapRest!25256 () (Array (_ BitVec 32) ValueCell!7446))

(assert (=> mapNonEmpty!25256 (= (arr!22924 _values!688) (store mapRest!25256 mapKey!25256 mapValue!25256))))

(assert (= (and start!72720 res!573495) b!844029))

(assert (= (and b!844029 res!573497) b!844028))

(assert (= (and b!844028 res!573496) b!844026))

(assert (= (and b!844026 res!573494) b!844030))

(assert (= (and b!844031 condMapEmpty!25256) mapIsEmpty!25256))

(assert (= (and b!844031 (not condMapEmpty!25256)) mapNonEmpty!25256))

(get-info :version)

(assert (= (and mapNonEmpty!25256 ((_ is ValueCellFull!7446) mapValue!25256)) b!844025))

(assert (= (and b!844031 ((_ is ValueCellFull!7446) mapDefault!25256)) b!844027))

(assert (= start!72720 b!844031))

(declare-fun m!786453 () Bool)

(assert (=> start!72720 m!786453))

(declare-fun m!786455 () Bool)

(assert (=> start!72720 m!786455))

(declare-fun m!786457 () Bool)

(assert (=> b!844026 m!786457))

(declare-fun m!786459 () Bool)

(assert (=> b!844029 m!786459))

(declare-fun m!786461 () Bool)

(assert (=> mapNonEmpty!25256 m!786461))

(declare-fun m!786463 () Bool)

(assert (=> b!844030 m!786463))

(check-sat (not b!844029) tp_is_empty!15771 (not start!72720) (not b!844026) (not b!844030) (not mapNonEmpty!25256))
(check-sat)
