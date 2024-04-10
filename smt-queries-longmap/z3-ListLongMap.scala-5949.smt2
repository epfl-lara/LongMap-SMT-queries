; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!77522 () Bool)

(assert start!77522)

(declare-fun b_free!16107 () Bool)

(declare-fun b_next!16107 () Bool)

(assert (=> start!77522 (= b_free!16107 (not b_next!16107))))

(declare-fun tp!56583 () Bool)

(declare-fun b_and!26473 () Bool)

(assert (=> start!77522 (= tp!56583 b_and!26473)))

(declare-fun b!903257 () Bool)

(declare-fun e!506054 () Bool)

(assert (=> b!903257 (= e!506054 false)))

(declare-datatypes ((V!29665 0))(
  ( (V!29666 (val!9313 Int)) )
))
(declare-datatypes ((ValueCell!8781 0))(
  ( (ValueCellFull!8781 (v!11818 V!29665)) (EmptyCell!8781) )
))
(declare-datatypes ((array!53108 0))(
  ( (array!53109 (arr!25513 (Array (_ BitVec 32) ValueCell!8781)) (size!25972 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53108)

(declare-fun defaultEntry!1160 () Int)

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun lt!407982 () Bool)

(declare-fun zeroValue!1094 () V!29665)

(declare-datatypes ((array!53110 0))(
  ( (array!53111 (arr!25514 (Array (_ BitVec 32) (_ BitVec 64))) (size!25973 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53110)

(declare-fun k0!1033 () (_ BitVec 64))

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29665)

(declare-datatypes ((tuple2!12094 0))(
  ( (tuple2!12095 (_1!6058 (_ BitVec 64)) (_2!6058 V!29665)) )
))
(declare-datatypes ((List!17914 0))(
  ( (Nil!17911) (Cons!17910 (h!19056 tuple2!12094) (t!25297 List!17914)) )
))
(declare-datatypes ((ListLongMap!10791 0))(
  ( (ListLongMap!10792 (toList!5411 List!17914)) )
))
(declare-fun contains!4459 (ListLongMap!10791 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2680 (array!53110 array!53108 (_ BitVec 32) (_ BitVec 32) V!29665 V!29665 (_ BitVec 32) Int) ListLongMap!10791)

(assert (=> b!903257 (= lt!407982 (contains!4459 (getCurrentListMap!2680 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 #b00000000000000000000000000000000 defaultEntry!1160) k0!1033))))

(declare-fun b!903258 () Bool)

(declare-fun e!506055 () Bool)

(declare-fun e!506053 () Bool)

(declare-fun mapRes!29500 () Bool)

(assert (=> b!903258 (= e!506055 (and e!506053 mapRes!29500))))

(declare-fun condMapEmpty!29500 () Bool)

(declare-fun mapDefault!29500 () ValueCell!8781)

(assert (=> b!903258 (= condMapEmpty!29500 (= (arr!25513 _values!1152) ((as const (Array (_ BitVec 32) ValueCell!8781)) mapDefault!29500)))))

(declare-fun b!903259 () Bool)

(declare-fun tp_is_empty!18525 () Bool)

(assert (=> b!903259 (= e!506053 tp_is_empty!18525)))

(declare-fun b!903260 () Bool)

(declare-fun res!609440 () Bool)

(assert (=> b!903260 (=> (not res!609440) (not e!506054))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53110 (_ BitVec 32)) Bool)

(assert (=> b!903260 (= res!609440 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun b!903261 () Bool)

(declare-fun res!609439 () Bool)

(assert (=> b!903261 (=> (not res!609439) (not e!506054))))

(declare-datatypes ((List!17915 0))(
  ( (Nil!17912) (Cons!17911 (h!19057 (_ BitVec 64)) (t!25298 List!17915)) )
))
(declare-fun arrayNoDuplicates!0 (array!53110 (_ BitVec 32) List!17915) Bool)

(assert (=> b!903261 (= res!609439 (arrayNoDuplicates!0 _keys!1386 #b00000000000000000000000000000000 Nil!17912))))

(declare-fun mapNonEmpty!29500 () Bool)

(declare-fun tp!56582 () Bool)

(declare-fun e!506051 () Bool)

(assert (=> mapNonEmpty!29500 (= mapRes!29500 (and tp!56582 e!506051))))

(declare-fun mapValue!29500 () ValueCell!8781)

(declare-fun mapRest!29500 () (Array (_ BitVec 32) ValueCell!8781))

(declare-fun mapKey!29500 () (_ BitVec 32))

(assert (=> mapNonEmpty!29500 (= (arr!25513 _values!1152) (store mapRest!29500 mapKey!29500 mapValue!29500))))

(declare-fun mapIsEmpty!29500 () Bool)

(assert (=> mapIsEmpty!29500 mapRes!29500))

(declare-fun b!903262 () Bool)

(assert (=> b!903262 (= e!506051 tp_is_empty!18525)))

(declare-fun b!903263 () Bool)

(declare-fun res!609438 () Bool)

(assert (=> b!903263 (=> (not res!609438) (not e!506054))))

(assert (=> b!903263 (= res!609438 (and (= (size!25972 _values!1152) (bvadd #b00000000000000000000000000000001 mask!1756)) (= (size!25973 _keys!1386) (size!25972 _values!1152)) (bvsge mask!1756 #b00000000000000000000000000000000) (bvsge extraKeys!1073 #b00000000000000000000000000000000) (bvsle extraKeys!1073 #b00000000000000000000000000000011)))))

(declare-fun res!609437 () Bool)

(assert (=> start!77522 (=> (not res!609437) (not e!506054))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77522 (= res!609437 (validMask!0 mask!1756))))

(assert (=> start!77522 e!506054))

(declare-fun array_inv!19998 (array!53108) Bool)

(assert (=> start!77522 (and (array_inv!19998 _values!1152) e!506055)))

(assert (=> start!77522 tp!56583))

(assert (=> start!77522 true))

(assert (=> start!77522 tp_is_empty!18525))

(declare-fun array_inv!19999 (array!53110) Bool)

(assert (=> start!77522 (array_inv!19999 _keys!1386)))

(assert (= (and start!77522 res!609437) b!903263))

(assert (= (and b!903263 res!609438) b!903260))

(assert (= (and b!903260 res!609440) b!903261))

(assert (= (and b!903261 res!609439) b!903257))

(assert (= (and b!903258 condMapEmpty!29500) mapIsEmpty!29500))

(assert (= (and b!903258 (not condMapEmpty!29500)) mapNonEmpty!29500))

(get-info :version)

(assert (= (and mapNonEmpty!29500 ((_ is ValueCellFull!8781) mapValue!29500)) b!903262))

(assert (= (and b!903258 ((_ is ValueCellFull!8781) mapDefault!29500)) b!903259))

(assert (= start!77522 b!903258))

(declare-fun m!838985 () Bool)

(assert (=> b!903260 m!838985))

(declare-fun m!838987 () Bool)

(assert (=> b!903261 m!838987))

(declare-fun m!838989 () Bool)

(assert (=> mapNonEmpty!29500 m!838989))

(declare-fun m!838991 () Bool)

(assert (=> start!77522 m!838991))

(declare-fun m!838993 () Bool)

(assert (=> start!77522 m!838993))

(declare-fun m!838995 () Bool)

(assert (=> start!77522 m!838995))

(declare-fun m!838997 () Bool)

(assert (=> b!903257 m!838997))

(assert (=> b!903257 m!838997))

(declare-fun m!838999 () Bool)

(assert (=> b!903257 m!838999))

(check-sat b_and!26473 (not b!903261) (not b_next!16107) (not start!77522) (not mapNonEmpty!29500) (not b!903260) tp_is_empty!18525 (not b!903257))
(check-sat b_and!26473 (not b_next!16107))
