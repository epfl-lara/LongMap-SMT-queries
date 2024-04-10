; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73284 () Bool)

(assert start!73284)

(declare-fun b_free!14199 () Bool)

(declare-fun b_next!14199 () Bool)

(assert (=> start!73284 (= b_free!14199 (not b_next!14199))))

(declare-fun tp!50101 () Bool)

(declare-fun b_and!23555 () Bool)

(assert (=> start!73284 (= tp!50101 b_and!23555)))

(declare-fun b!854809 () Bool)

(declare-fun res!580500 () Bool)

(declare-fun e!476637 () Bool)

(assert (=> b!854809 (=> (not res!580500) (not e!476637))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!48866 0))(
  ( (array!48867 (arr!23464 (Array (_ BitVec 32) (_ BitVec 64))) (size!23904 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48866)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!854809 (= res!580500 (and (= (select (arr!23464 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854810 () Bool)

(declare-fun res!580502 () Bool)

(assert (=> b!854810 (=> (not res!580502) (not e!476637))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26827 0))(
  ( (V!26828 (val!8215 Int)) )
))
(declare-datatypes ((ValueCell!7728 0))(
  ( (ValueCellFull!7728 (v!10640 V!26827)) (EmptyCell!7728) )
))
(declare-datatypes ((array!48868 0))(
  ( (array!48869 (arr!23465 (Array (_ BitVec 32) ValueCell!7728)) (size!23905 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48868)

(assert (=> b!854810 (= res!580502 (and (= (size!23905 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23904 _keys!868) (size!23905 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!854811 () Bool)

(declare-fun res!580498 () Bool)

(assert (=> b!854811 (=> (not res!580498) (not e!476637))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854811 (= res!580498 (validKeyInArray!0 k0!854))))

(declare-fun res!580499 () Bool)

(assert (=> start!73284 (=> (not res!580499) (not e!476637))))

(assert (=> start!73284 (= res!580499 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23904 _keys!868))))))

(assert (=> start!73284 e!476637))

(declare-fun tp_is_empty!16335 () Bool)

(assert (=> start!73284 tp_is_empty!16335))

(assert (=> start!73284 true))

(assert (=> start!73284 tp!50101))

(declare-fun array_inv!18592 (array!48866) Bool)

(assert (=> start!73284 (array_inv!18592 _keys!868)))

(declare-fun e!476636 () Bool)

(declare-fun array_inv!18593 (array!48868) Bool)

(assert (=> start!73284 (and (array_inv!18593 _values!688) e!476636)))

(declare-fun b!854812 () Bool)

(declare-fun e!476635 () Bool)

(declare-fun mapRes!26102 () Bool)

(assert (=> b!854812 (= e!476636 (and e!476635 mapRes!26102))))

(declare-fun condMapEmpty!26102 () Bool)

(declare-fun mapDefault!26102 () ValueCell!7728)

(assert (=> b!854812 (= condMapEmpty!26102 (= (arr!23465 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7728)) mapDefault!26102)))))

(declare-fun b!854813 () Bool)

(assert (=> b!854813 (= e!476635 tp_is_empty!16335)))

(declare-fun b!854814 () Bool)

(declare-fun res!580504 () Bool)

(assert (=> b!854814 (=> (not res!580504) (not e!476637))))

(assert (=> b!854814 (= res!580504 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23904 _keys!868))))))

(declare-fun mapNonEmpty!26102 () Bool)

(declare-fun tp!50100 () Bool)

(declare-fun e!476634 () Bool)

(assert (=> mapNonEmpty!26102 (= mapRes!26102 (and tp!50100 e!476634))))

(declare-fun mapRest!26102 () (Array (_ BitVec 32) ValueCell!7728))

(declare-fun mapKey!26102 () (_ BitVec 32))

(declare-fun mapValue!26102 () ValueCell!7728)

(assert (=> mapNonEmpty!26102 (= (arr!23465 _values!688) (store mapRest!26102 mapKey!26102 mapValue!26102))))

(declare-fun b!854815 () Bool)

(assert (=> b!854815 (= e!476634 tp_is_empty!16335)))

(declare-fun b!854816 () Bool)

(declare-fun res!580503 () Bool)

(assert (=> b!854816 (=> (not res!580503) (not e!476637))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854816 (= res!580503 (validMask!0 mask!1196))))

(declare-fun b!854817 () Bool)

(declare-fun res!580505 () Bool)

(assert (=> b!854817 (=> (not res!580505) (not e!476637))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48866 (_ BitVec 32)) Bool)

(assert (=> b!854817 (= res!580505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854818 () Bool)

(declare-fun res!580501 () Bool)

(assert (=> b!854818 (=> (not res!580501) (not e!476637))))

(declare-datatypes ((List!16632 0))(
  ( (Nil!16629) (Cons!16628 (h!17759 (_ BitVec 64)) (t!23273 List!16632)) )
))
(declare-fun arrayNoDuplicates!0 (array!48866 (_ BitVec 32) List!16632) Bool)

(assert (=> b!854818 (= res!580501 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16629))))

(declare-fun b!854819 () Bool)

(assert (=> b!854819 (= e!476637 false)))

(declare-fun v!557 () V!26827)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!26827)

(declare-fun zeroValue!654 () V!26827)

(declare-datatypes ((tuple2!10818 0))(
  ( (tuple2!10819 (_1!5420 (_ BitVec 64)) (_2!5420 V!26827)) )
))
(declare-datatypes ((List!16633 0))(
  ( (Nil!16630) (Cons!16629 (h!17760 tuple2!10818) (t!23274 List!16633)) )
))
(declare-datatypes ((ListLongMap!9587 0))(
  ( (ListLongMap!9588 (toList!4809 List!16633)) )
))
(declare-fun lt!385584 () ListLongMap!9587)

(declare-fun getCurrentListMapNoExtraKeys!2790 (array!48866 array!48868 (_ BitVec 32) (_ BitVec 32) V!26827 V!26827 (_ BitVec 32) Int) ListLongMap!9587)

(assert (=> b!854819 (= lt!385584 (getCurrentListMapNoExtraKeys!2790 _keys!868 (array!48869 (store (arr!23465 _values!688) i!612 (ValueCellFull!7728 v!557)) (size!23905 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!385585 () ListLongMap!9587)

(assert (=> b!854819 (= lt!385585 (getCurrentListMapNoExtraKeys!2790 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapIsEmpty!26102 () Bool)

(assert (=> mapIsEmpty!26102 mapRes!26102))

(assert (= (and start!73284 res!580499) b!854816))

(assert (= (and b!854816 res!580503) b!854810))

(assert (= (and b!854810 res!580502) b!854817))

(assert (= (and b!854817 res!580505) b!854818))

(assert (= (and b!854818 res!580501) b!854814))

(assert (= (and b!854814 res!580504) b!854811))

(assert (= (and b!854811 res!580498) b!854809))

(assert (= (and b!854809 res!580500) b!854819))

(assert (= (and b!854812 condMapEmpty!26102) mapIsEmpty!26102))

(assert (= (and b!854812 (not condMapEmpty!26102)) mapNonEmpty!26102))

(get-info :version)

(assert (= (and mapNonEmpty!26102 ((_ is ValueCellFull!7728) mapValue!26102)) b!854815))

(assert (= (and b!854812 ((_ is ValueCellFull!7728) mapDefault!26102)) b!854813))

(assert (= start!73284 b!854812))

(declare-fun m!796221 () Bool)

(assert (=> b!854818 m!796221))

(declare-fun m!796223 () Bool)

(assert (=> b!854819 m!796223))

(declare-fun m!796225 () Bool)

(assert (=> b!854819 m!796225))

(declare-fun m!796227 () Bool)

(assert (=> b!854819 m!796227))

(declare-fun m!796229 () Bool)

(assert (=> mapNonEmpty!26102 m!796229))

(declare-fun m!796231 () Bool)

(assert (=> b!854817 m!796231))

(declare-fun m!796233 () Bool)

(assert (=> start!73284 m!796233))

(declare-fun m!796235 () Bool)

(assert (=> start!73284 m!796235))

(declare-fun m!796237 () Bool)

(assert (=> b!854811 m!796237))

(declare-fun m!796239 () Bool)

(assert (=> b!854816 m!796239))

(declare-fun m!796241 () Bool)

(assert (=> b!854809 m!796241))

(check-sat (not b!854811) (not b!854818) tp_is_empty!16335 (not mapNonEmpty!26102) b_and!23555 (not b!854817) (not start!73284) (not b!854819) (not b_next!14199) (not b!854816))
(check-sat b_and!23555 (not b_next!14199))
