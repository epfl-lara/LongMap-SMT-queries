; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43240 () Bool)

(assert start!43240)

(declare-fun b_free!12121 () Bool)

(declare-fun b_next!12121 () Bool)

(assert (=> start!43240 (= b_free!12121 (not b_next!12121))))

(declare-fun tp!42633 () Bool)

(declare-fun b_and!20847 () Bool)

(assert (=> start!43240 (= tp!42633 b_and!20847)))

(declare-fun b!478966 () Bool)

(declare-fun e!281749 () Bool)

(declare-fun tp_is_empty!13633 () Bool)

(assert (=> b!478966 (= e!281749 tp_is_empty!13633)))

(declare-fun mapIsEmpty!22147 () Bool)

(declare-fun mapRes!22147 () Bool)

(assert (=> mapIsEmpty!22147 mapRes!22147))

(declare-fun b!478967 () Bool)

(declare-fun e!281750 () Bool)

(assert (=> b!478967 (= e!281750 (and e!281749 mapRes!22147))))

(declare-fun condMapEmpty!22147 () Bool)

(declare-datatypes ((V!19249 0))(
  ( (V!19250 (val!6864 Int)) )
))
(declare-datatypes ((ValueCell!6455 0))(
  ( (ValueCellFull!6455 (v!9147 V!19249)) (EmptyCell!6455) )
))
(declare-datatypes ((array!30933 0))(
  ( (array!30934 (arr!14873 (Array (_ BitVec 32) ValueCell!6455)) (size!15232 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30933)

(declare-fun mapDefault!22147 () ValueCell!6455)

(assert (=> b!478967 (= condMapEmpty!22147 (= (arr!14873 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6455)) mapDefault!22147)))))

(declare-fun b!478968 () Bool)

(declare-fun res!285746 () Bool)

(declare-fun e!281751 () Bool)

(assert (=> b!478968 (=> (not res!285746) (not e!281751))))

(declare-datatypes ((array!30935 0))(
  ( (array!30936 (arr!14874 (Array (_ BitVec 32) (_ BitVec 64))) (size!15233 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30935)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30935 (_ BitVec 32)) Bool)

(assert (=> b!478968 (= res!285746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478969 () Bool)

(declare-fun res!285747 () Bool)

(assert (=> b!478969 (=> (not res!285747) (not e!281751))))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!478969 (= res!285747 (and (= (size!15232 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15233 _keys!1874) (size!15232 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!478970 () Bool)

(assert (=> b!478970 (= e!281751 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!217600 () Bool)

(declare-fun minValue!1458 () V!19249)

(declare-fun zeroValue!1458 () V!19249)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9070 0))(
  ( (tuple2!9071 (_1!4546 (_ BitVec 64)) (_2!4546 V!19249)) )
))
(declare-datatypes ((List!9130 0))(
  ( (Nil!9127) (Cons!9126 (h!9982 tuple2!9070) (t!15327 List!9130)) )
))
(declare-datatypes ((ListLongMap!7973 0))(
  ( (ListLongMap!7974 (toList!4002 List!9130)) )
))
(declare-fun contains!2577 (ListLongMap!7973 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2255 (array!30935 array!30933 (_ BitVec 32) (_ BitVec 32) V!19249 V!19249 (_ BitVec 32) Int) ListLongMap!7973)

(assert (=> b!478970 (= lt!217600 (contains!2577 (getCurrentListMap!2255 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun res!285745 () Bool)

(assert (=> start!43240 (=> (not res!285745) (not e!281751))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43240 (= res!285745 (validMask!0 mask!2352))))

(assert (=> start!43240 e!281751))

(assert (=> start!43240 true))

(assert (=> start!43240 tp_is_empty!13633))

(declare-fun array_inv!10822 (array!30933) Bool)

(assert (=> start!43240 (and (array_inv!10822 _values!1516) e!281750)))

(assert (=> start!43240 tp!42633))

(declare-fun array_inv!10823 (array!30935) Bool)

(assert (=> start!43240 (array_inv!10823 _keys!1874)))

(declare-fun b!478971 () Bool)

(declare-fun e!281747 () Bool)

(assert (=> b!478971 (= e!281747 tp_is_empty!13633)))

(declare-fun b!478972 () Bool)

(declare-fun res!285744 () Bool)

(assert (=> b!478972 (=> (not res!285744) (not e!281751))))

(declare-datatypes ((List!9131 0))(
  ( (Nil!9128) (Cons!9127 (h!9983 (_ BitVec 64)) (t!15328 List!9131)) )
))
(declare-fun arrayNoDuplicates!0 (array!30935 (_ BitVec 32) List!9131) Bool)

(assert (=> b!478972 (= res!285744 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9128))))

(declare-fun mapNonEmpty!22147 () Bool)

(declare-fun tp!42634 () Bool)

(assert (=> mapNonEmpty!22147 (= mapRes!22147 (and tp!42634 e!281747))))

(declare-fun mapKey!22147 () (_ BitVec 32))

(declare-fun mapRest!22147 () (Array (_ BitVec 32) ValueCell!6455))

(declare-fun mapValue!22147 () ValueCell!6455)

(assert (=> mapNonEmpty!22147 (= (arr!14873 _values!1516) (store mapRest!22147 mapKey!22147 mapValue!22147))))

(assert (= (and start!43240 res!285745) b!478969))

(assert (= (and b!478969 res!285747) b!478968))

(assert (= (and b!478968 res!285746) b!478972))

(assert (= (and b!478972 res!285744) b!478970))

(assert (= (and b!478967 condMapEmpty!22147) mapIsEmpty!22147))

(assert (= (and b!478967 (not condMapEmpty!22147)) mapNonEmpty!22147))

(get-info :version)

(assert (= (and mapNonEmpty!22147 ((_ is ValueCellFull!6455) mapValue!22147)) b!478971))

(assert (= (and b!478967 ((_ is ValueCellFull!6455) mapDefault!22147)) b!478966))

(assert (= start!43240 b!478967))

(declare-fun m!460497 () Bool)

(assert (=> b!478970 m!460497))

(assert (=> b!478970 m!460497))

(declare-fun m!460499 () Bool)

(assert (=> b!478970 m!460499))

(declare-fun m!460501 () Bool)

(assert (=> mapNonEmpty!22147 m!460501))

(declare-fun m!460503 () Bool)

(assert (=> b!478972 m!460503))

(declare-fun m!460505 () Bool)

(assert (=> start!43240 m!460505))

(declare-fun m!460507 () Bool)

(assert (=> start!43240 m!460507))

(declare-fun m!460509 () Bool)

(assert (=> start!43240 m!460509))

(declare-fun m!460511 () Bool)

(assert (=> b!478968 m!460511))

(check-sat (not b!478968) (not start!43240) (not b!478972) tp_is_empty!13633 (not b!478970) b_and!20847 (not mapNonEmpty!22147) (not b_next!12121))
(check-sat b_and!20847 (not b_next!12121))
