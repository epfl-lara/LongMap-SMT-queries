; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78576 () Bool)

(assert start!78576)

(declare-fun b_free!16807 () Bool)

(declare-fun b_next!16807 () Bool)

(assert (=> start!78576 (= b_free!16807 (not b_next!16807))))

(declare-fun tp!58863 () Bool)

(declare-fun b_and!27403 () Bool)

(assert (=> start!78576 (= tp!58863 b_and!27403)))

(declare-fun b!915938 () Bool)

(declare-fun e!514128 () Bool)

(declare-fun e!514126 () Bool)

(declare-fun mapRes!30729 () Bool)

(assert (=> b!915938 (= e!514128 (and e!514126 mapRes!30729))))

(declare-fun condMapEmpty!30729 () Bool)

(declare-datatypes ((V!30719 0))(
  ( (V!30720 (val!9708 Int)) )
))
(declare-datatypes ((ValueCell!9176 0))(
  ( (ValueCellFull!9176 (v!12225 V!30719)) (EmptyCell!9176) )
))
(declare-datatypes ((array!54607 0))(
  ( (array!54608 (arr!26249 (Array (_ BitVec 32) ValueCell!9176)) (size!26710 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54607)

(declare-fun mapDefault!30729 () ValueCell!9176)

(assert (=> b!915938 (= condMapEmpty!30729 (= (arr!26249 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9176)) mapDefault!30729)))))

(declare-fun b!915939 () Bool)

(declare-fun tp_is_empty!19315 () Bool)

(assert (=> b!915939 (= e!514126 tp_is_empty!19315)))

(declare-fun mapNonEmpty!30729 () Bool)

(declare-fun tp!58862 () Bool)

(declare-fun e!514127 () Bool)

(assert (=> mapNonEmpty!30729 (= mapRes!30729 (and tp!58862 e!514127))))

(declare-fun mapValue!30729 () ValueCell!9176)

(declare-fun mapKey!30729 () (_ BitVec 32))

(declare-fun mapRest!30729 () (Array (_ BitVec 32) ValueCell!9176))

(assert (=> mapNonEmpty!30729 (= (arr!26249 _values!1231) (store mapRest!30729 mapKey!30729 mapValue!30729))))

(declare-fun b!915940 () Bool)

(declare-fun res!617540 () Bool)

(declare-fun e!514124 () Bool)

(assert (=> b!915940 (=> (not res!617540) (not e!514124))))

(declare-datatypes ((array!54609 0))(
  ( (array!54610 (arr!26250 (Array (_ BitVec 32) (_ BitVec 64))) (size!26711 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54609)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54609 (_ BitVec 32)) Bool)

(assert (=> b!915940 (= res!617540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!915941 () Bool)

(assert (=> b!915941 (= e!514124 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun lt!411527 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30719)

(declare-fun minValue!1173 () V!30719)

(declare-datatypes ((tuple2!12642 0))(
  ( (tuple2!12643 (_1!6332 (_ BitVec 64)) (_2!6332 V!30719)) )
))
(declare-datatypes ((List!18440 0))(
  ( (Nil!18437) (Cons!18436 (h!19582 tuple2!12642) (t!26044 List!18440)) )
))
(declare-datatypes ((ListLongMap!11329 0))(
  ( (ListLongMap!11330 (toList!5680 List!18440)) )
))
(declare-fun contains!4690 (ListLongMap!11329 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2879 (array!54609 array!54607 (_ BitVec 32) (_ BitVec 32) V!30719 V!30719 (_ BitVec 32) Int) ListLongMap!11329)

(assert (=> b!915941 (= lt!411527 (contains!4690 (getCurrentListMap!2879 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun mapIsEmpty!30729 () Bool)

(assert (=> mapIsEmpty!30729 mapRes!30729))

(declare-fun b!915942 () Bool)

(declare-fun res!617538 () Bool)

(assert (=> b!915942 (=> (not res!617538) (not e!514124))))

(declare-datatypes ((List!18441 0))(
  ( (Nil!18438) (Cons!18437 (h!19583 (_ BitVec 64)) (t!26045 List!18441)) )
))
(declare-fun arrayNoDuplicates!0 (array!54609 (_ BitVec 32) List!18441) Bool)

(assert (=> b!915942 (= res!617538 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18438))))

(declare-fun res!617536 () Bool)

(assert (=> start!78576 (=> (not res!617536) (not e!514124))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78576 (= res!617536 (validMask!0 mask!1881))))

(assert (=> start!78576 e!514124))

(assert (=> start!78576 true))

(declare-fun array_inv!20562 (array!54607) Bool)

(assert (=> start!78576 (and (array_inv!20562 _values!1231) e!514128)))

(assert (=> start!78576 tp!58863))

(declare-fun array_inv!20563 (array!54609) Bool)

(assert (=> start!78576 (array_inv!20563 _keys!1487)))

(assert (=> start!78576 tp_is_empty!19315))

(declare-fun b!915943 () Bool)

(declare-fun res!617539 () Bool)

(assert (=> b!915943 (=> (not res!617539) (not e!514124))))

(assert (=> b!915943 (= res!617539 (and (= (size!26710 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26711 _keys!1487) (size!26710 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!915944 () Bool)

(assert (=> b!915944 (= e!514127 tp_is_empty!19315)))

(declare-fun b!915945 () Bool)

(declare-fun res!617537 () Bool)

(assert (=> b!915945 (=> (not res!617537) (not e!514124))))

(assert (=> b!915945 (= res!617537 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26711 _keys!1487))))))

(assert (= (and start!78576 res!617536) b!915943))

(assert (= (and b!915943 res!617539) b!915940))

(assert (= (and b!915940 res!617540) b!915942))

(assert (= (and b!915942 res!617538) b!915945))

(assert (= (and b!915945 res!617537) b!915941))

(assert (= (and b!915938 condMapEmpty!30729) mapIsEmpty!30729))

(assert (= (and b!915938 (not condMapEmpty!30729)) mapNonEmpty!30729))

(get-info :version)

(assert (= (and mapNonEmpty!30729 ((_ is ValueCellFull!9176) mapValue!30729)) b!915944))

(assert (= (and b!915938 ((_ is ValueCellFull!9176) mapDefault!30729)) b!915939))

(assert (= start!78576 b!915938))

(declare-fun m!849541 () Bool)

(assert (=> b!915941 m!849541))

(assert (=> b!915941 m!849541))

(declare-fun m!849543 () Bool)

(assert (=> b!915941 m!849543))

(declare-fun m!849545 () Bool)

(assert (=> mapNonEmpty!30729 m!849545))

(declare-fun m!849547 () Bool)

(assert (=> start!78576 m!849547))

(declare-fun m!849549 () Bool)

(assert (=> start!78576 m!849549))

(declare-fun m!849551 () Bool)

(assert (=> start!78576 m!849551))

(declare-fun m!849553 () Bool)

(assert (=> b!915940 m!849553))

(declare-fun m!849555 () Bool)

(assert (=> b!915942 m!849555))

(check-sat tp_is_empty!19315 b_and!27403 (not b_next!16807) (not b!915941) (not b!915942) (not start!78576) (not mapNonEmpty!30729) (not b!915940))
(check-sat b_and!27403 (not b_next!16807))
