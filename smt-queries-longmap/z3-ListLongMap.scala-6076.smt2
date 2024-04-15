; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78546 () Bool)

(assert start!78546)

(declare-fun b_free!16777 () Bool)

(declare-fun b_next!16777 () Bool)

(assert (=> start!78546 (= b_free!16777 (not b_next!16777))))

(declare-fun tp!58772 () Bool)

(declare-fun b_and!27373 () Bool)

(assert (=> start!78546 (= tp!58772 b_and!27373)))

(declare-fun b!915578 () Bool)

(declare-fun res!617311 () Bool)

(declare-fun e!513903 () Bool)

(assert (=> b!915578 (=> (not res!617311) (not e!513903))))

(declare-datatypes ((array!54551 0))(
  ( (array!54552 (arr!26221 (Array (_ BitVec 32) (_ BitVec 64))) (size!26682 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54551)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54551 (_ BitVec 32)) Bool)

(assert (=> b!915578 (= res!617311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!617315 () Bool)

(assert (=> start!78546 (=> (not res!617315) (not e!513903))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78546 (= res!617315 (validMask!0 mask!1881))))

(assert (=> start!78546 e!513903))

(assert (=> start!78546 true))

(declare-datatypes ((V!30679 0))(
  ( (V!30680 (val!9693 Int)) )
))
(declare-datatypes ((ValueCell!9161 0))(
  ( (ValueCellFull!9161 (v!12210 V!30679)) (EmptyCell!9161) )
))
(declare-datatypes ((array!54553 0))(
  ( (array!54554 (arr!26222 (Array (_ BitVec 32) ValueCell!9161)) (size!26683 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54553)

(declare-fun e!513901 () Bool)

(declare-fun array_inv!20544 (array!54553) Bool)

(assert (=> start!78546 (and (array_inv!20544 _values!1231) e!513901)))

(assert (=> start!78546 tp!58772))

(declare-fun array_inv!20545 (array!54551) Bool)

(assert (=> start!78546 (array_inv!20545 _keys!1487)))

(declare-fun tp_is_empty!19285 () Bool)

(assert (=> start!78546 tp_is_empty!19285))

(declare-fun b!915579 () Bool)

(declare-fun e!513900 () Bool)

(assert (=> b!915579 (= e!513900 tp_is_empty!19285)))

(declare-fun mapNonEmpty!30684 () Bool)

(declare-fun mapRes!30684 () Bool)

(declare-fun tp!58773 () Bool)

(assert (=> mapNonEmpty!30684 (= mapRes!30684 (and tp!58773 e!513900))))

(declare-fun mapKey!30684 () (_ BitVec 32))

(declare-fun mapRest!30684 () (Array (_ BitVec 32) ValueCell!9161))

(declare-fun mapValue!30684 () ValueCell!9161)

(assert (=> mapNonEmpty!30684 (= (arr!26222 _values!1231) (store mapRest!30684 mapKey!30684 mapValue!30684))))

(declare-fun b!915580 () Bool)

(declare-fun res!617312 () Bool)

(assert (=> b!915580 (=> (not res!617312) (not e!513903))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!915580 (= res!617312 (and (= (size!26683 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26682 _keys!1487) (size!26683 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915581 () Bool)

(assert (=> b!915581 (= e!513903 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!411482 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30679)

(declare-fun minValue!1173 () V!30679)

(declare-datatypes ((tuple2!12622 0))(
  ( (tuple2!12623 (_1!6322 (_ BitVec 64)) (_2!6322 V!30679)) )
))
(declare-datatypes ((List!18421 0))(
  ( (Nil!18418) (Cons!18417 (h!19563 tuple2!12622) (t!26025 List!18421)) )
))
(declare-datatypes ((ListLongMap!11309 0))(
  ( (ListLongMap!11310 (toList!5670 List!18421)) )
))
(declare-fun contains!4680 (ListLongMap!11309 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2869 (array!54551 array!54553 (_ BitVec 32) (_ BitVec 32) V!30679 V!30679 (_ BitVec 32) Int) ListLongMap!11309)

(assert (=> b!915581 (= lt!411482 (contains!4680 (getCurrentListMap!2869 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun mapIsEmpty!30684 () Bool)

(assert (=> mapIsEmpty!30684 mapRes!30684))

(declare-fun b!915582 () Bool)

(declare-fun e!513899 () Bool)

(assert (=> b!915582 (= e!513899 tp_is_empty!19285)))

(declare-fun b!915583 () Bool)

(declare-fun res!617314 () Bool)

(assert (=> b!915583 (=> (not res!617314) (not e!513903))))

(declare-datatypes ((List!18422 0))(
  ( (Nil!18419) (Cons!18418 (h!19564 (_ BitVec 64)) (t!26026 List!18422)) )
))
(declare-fun arrayNoDuplicates!0 (array!54551 (_ BitVec 32) List!18422) Bool)

(assert (=> b!915583 (= res!617314 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18419))))

(declare-fun b!915584 () Bool)

(declare-fun res!617313 () Bool)

(assert (=> b!915584 (=> (not res!617313) (not e!513903))))

(assert (=> b!915584 (= res!617313 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26682 _keys!1487))))))

(declare-fun b!915585 () Bool)

(assert (=> b!915585 (= e!513901 (and e!513899 mapRes!30684))))

(declare-fun condMapEmpty!30684 () Bool)

(declare-fun mapDefault!30684 () ValueCell!9161)

(assert (=> b!915585 (= condMapEmpty!30684 (= (arr!26222 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9161)) mapDefault!30684)))))

(assert (= (and start!78546 res!617315) b!915580))

(assert (= (and b!915580 res!617312) b!915578))

(assert (= (and b!915578 res!617311) b!915583))

(assert (= (and b!915583 res!617314) b!915584))

(assert (= (and b!915584 res!617313) b!915581))

(assert (= (and b!915585 condMapEmpty!30684) mapIsEmpty!30684))

(assert (= (and b!915585 (not condMapEmpty!30684)) mapNonEmpty!30684))

(get-info :version)

(assert (= (and mapNonEmpty!30684 ((_ is ValueCellFull!9161) mapValue!30684)) b!915579))

(assert (= (and b!915585 ((_ is ValueCellFull!9161) mapDefault!30684)) b!915582))

(assert (= start!78546 b!915585))

(declare-fun m!849301 () Bool)

(assert (=> b!915581 m!849301))

(assert (=> b!915581 m!849301))

(declare-fun m!849303 () Bool)

(assert (=> b!915581 m!849303))

(declare-fun m!849305 () Bool)

(assert (=> start!78546 m!849305))

(declare-fun m!849307 () Bool)

(assert (=> start!78546 m!849307))

(declare-fun m!849309 () Bool)

(assert (=> start!78546 m!849309))

(declare-fun m!849311 () Bool)

(assert (=> mapNonEmpty!30684 m!849311))

(declare-fun m!849313 () Bool)

(assert (=> b!915583 m!849313))

(declare-fun m!849315 () Bool)

(assert (=> b!915578 m!849315))

(check-sat (not b!915581) (not mapNonEmpty!30684) (not start!78546) (not b!915578) b_and!27373 (not b_next!16777) (not b!915583) tp_is_empty!19285)
(check-sat b_and!27373 (not b_next!16777))
