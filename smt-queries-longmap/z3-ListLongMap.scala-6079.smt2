; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78564 () Bool)

(assert start!78564)

(declare-fun b_free!16795 () Bool)

(declare-fun b_next!16795 () Bool)

(assert (=> start!78564 (= b_free!16795 (not b_next!16795))))

(declare-fun tp!58826 () Bool)

(declare-fun b_and!27391 () Bool)

(assert (=> start!78564 (= tp!58826 b_and!27391)))

(declare-fun b!915794 () Bool)

(declare-fun e!514038 () Bool)

(declare-fun e!514037 () Bool)

(declare-fun mapRes!30711 () Bool)

(assert (=> b!915794 (= e!514038 (and e!514037 mapRes!30711))))

(declare-fun condMapEmpty!30711 () Bool)

(declare-datatypes ((V!30703 0))(
  ( (V!30704 (val!9702 Int)) )
))
(declare-datatypes ((ValueCell!9170 0))(
  ( (ValueCellFull!9170 (v!12219 V!30703)) (EmptyCell!9170) )
))
(declare-datatypes ((array!54585 0))(
  ( (array!54586 (arr!26238 (Array (_ BitVec 32) ValueCell!9170)) (size!26699 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54585)

(declare-fun mapDefault!30711 () ValueCell!9170)

(assert (=> b!915794 (= condMapEmpty!30711 (= (arr!26238 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9170)) mapDefault!30711)))))

(declare-fun b!915795 () Bool)

(declare-fun e!514034 () Bool)

(assert (=> b!915795 (= e!514034 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((array!54587 0))(
  ( (array!54588 (arr!26239 (Array (_ BitVec 32) (_ BitVec 64))) (size!26700 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54587)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30703)

(declare-fun minValue!1173 () V!30703)

(declare-fun lt!411509 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((tuple2!12636 0))(
  ( (tuple2!12637 (_1!6329 (_ BitVec 64)) (_2!6329 V!30703)) )
))
(declare-datatypes ((List!18434 0))(
  ( (Nil!18431) (Cons!18430 (h!19576 tuple2!12636) (t!26038 List!18434)) )
))
(declare-datatypes ((ListLongMap!11323 0))(
  ( (ListLongMap!11324 (toList!5677 List!18434)) )
))
(declare-fun contains!4687 (ListLongMap!11323 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2876 (array!54587 array!54585 (_ BitVec 32) (_ BitVec 32) V!30703 V!30703 (_ BitVec 32) Int) ListLongMap!11323)

(assert (=> b!915795 (= lt!411509 (contains!4687 (getCurrentListMap!2876 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!915796 () Bool)

(declare-fun e!514035 () Bool)

(declare-fun tp_is_empty!19303 () Bool)

(assert (=> b!915796 (= e!514035 tp_is_empty!19303)))

(declare-fun b!915797 () Bool)

(assert (=> b!915797 (= e!514037 tp_is_empty!19303)))

(declare-fun res!617447 () Bool)

(assert (=> start!78564 (=> (not res!617447) (not e!514034))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78564 (= res!617447 (validMask!0 mask!1881))))

(assert (=> start!78564 e!514034))

(assert (=> start!78564 true))

(declare-fun array_inv!20554 (array!54585) Bool)

(assert (=> start!78564 (and (array_inv!20554 _values!1231) e!514038)))

(assert (=> start!78564 tp!58826))

(declare-fun array_inv!20555 (array!54587) Bool)

(assert (=> start!78564 (array_inv!20555 _keys!1487)))

(assert (=> start!78564 tp_is_empty!19303))

(declare-fun b!915798 () Bool)

(declare-fun res!617449 () Bool)

(assert (=> b!915798 (=> (not res!617449) (not e!514034))))

(declare-datatypes ((List!18435 0))(
  ( (Nil!18432) (Cons!18431 (h!19577 (_ BitVec 64)) (t!26039 List!18435)) )
))
(declare-fun arrayNoDuplicates!0 (array!54587 (_ BitVec 32) List!18435) Bool)

(assert (=> b!915798 (= res!617449 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18432))))

(declare-fun mapIsEmpty!30711 () Bool)

(assert (=> mapIsEmpty!30711 mapRes!30711))

(declare-fun mapNonEmpty!30711 () Bool)

(declare-fun tp!58827 () Bool)

(assert (=> mapNonEmpty!30711 (= mapRes!30711 (and tp!58827 e!514035))))

(declare-fun mapRest!30711 () (Array (_ BitVec 32) ValueCell!9170))

(declare-fun mapValue!30711 () ValueCell!9170)

(declare-fun mapKey!30711 () (_ BitVec 32))

(assert (=> mapNonEmpty!30711 (= (arr!26238 _values!1231) (store mapRest!30711 mapKey!30711 mapValue!30711))))

(declare-fun b!915799 () Bool)

(declare-fun res!617448 () Bool)

(assert (=> b!915799 (=> (not res!617448) (not e!514034))))

(assert (=> b!915799 (= res!617448 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26700 _keys!1487))))))

(declare-fun b!915800 () Bool)

(declare-fun res!617450 () Bool)

(assert (=> b!915800 (=> (not res!617450) (not e!514034))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54587 (_ BitVec 32)) Bool)

(assert (=> b!915800 (= res!617450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915801 () Bool)

(declare-fun res!617446 () Bool)

(assert (=> b!915801 (=> (not res!617446) (not e!514034))))

(assert (=> b!915801 (= res!617446 (and (= (size!26699 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26700 _keys!1487) (size!26699 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78564 res!617447) b!915801))

(assert (= (and b!915801 res!617446) b!915800))

(assert (= (and b!915800 res!617450) b!915798))

(assert (= (and b!915798 res!617449) b!915799))

(assert (= (and b!915799 res!617448) b!915795))

(assert (= (and b!915794 condMapEmpty!30711) mapIsEmpty!30711))

(assert (= (and b!915794 (not condMapEmpty!30711)) mapNonEmpty!30711))

(get-info :version)

(assert (= (and mapNonEmpty!30711 ((_ is ValueCellFull!9170) mapValue!30711)) b!915796))

(assert (= (and b!915794 ((_ is ValueCellFull!9170) mapDefault!30711)) b!915797))

(assert (= start!78564 b!915794))

(declare-fun m!849445 () Bool)

(assert (=> mapNonEmpty!30711 m!849445))

(declare-fun m!849447 () Bool)

(assert (=> start!78564 m!849447))

(declare-fun m!849449 () Bool)

(assert (=> start!78564 m!849449))

(declare-fun m!849451 () Bool)

(assert (=> start!78564 m!849451))

(declare-fun m!849453 () Bool)

(assert (=> b!915800 m!849453))

(declare-fun m!849455 () Bool)

(assert (=> b!915795 m!849455))

(assert (=> b!915795 m!849455))

(declare-fun m!849457 () Bool)

(assert (=> b!915795 m!849457))

(declare-fun m!849459 () Bool)

(assert (=> b!915798 m!849459))

(check-sat (not b!915795) (not start!78564) (not b!915798) b_and!27391 (not mapNonEmpty!30711) tp_is_empty!19303 (not b_next!16795) (not b!915800))
(check-sat b_and!27391 (not b_next!16795))
