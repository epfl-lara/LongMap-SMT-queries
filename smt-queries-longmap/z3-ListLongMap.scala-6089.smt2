; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78624 () Bool)

(assert start!78624)

(declare-fun b_free!16855 () Bool)

(declare-fun b_next!16855 () Bool)

(assert (=> start!78624 (= b_free!16855 (not b_next!16855))))

(declare-fun tp!59006 () Bool)

(declare-fun b_and!27451 () Bool)

(assert (=> start!78624 (= tp!59006 b_and!27451)))

(declare-fun b!916570 () Bool)

(declare-fun res!617952 () Bool)

(declare-fun e!514532 () Bool)

(assert (=> b!916570 (=> (not res!617952) (not e!514532))))

(declare-datatypes ((array!54703 0))(
  ( (array!54704 (arr!26297 (Array (_ BitVec 32) (_ BitVec 64))) (size!26758 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54703)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54703 (_ BitVec 32)) Bool)

(assert (=> b!916570 (= res!617952 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916571 () Bool)

(declare-fun res!617955 () Bool)

(assert (=> b!916571 (=> (not res!617955) (not e!514532))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30783 0))(
  ( (V!30784 (val!9732 Int)) )
))
(declare-datatypes ((ValueCell!9200 0))(
  ( (ValueCellFull!9200 (v!12249 V!30783)) (EmptyCell!9200) )
))
(declare-datatypes ((array!54705 0))(
  ( (array!54706 (arr!26298 (Array (_ BitVec 32) ValueCell!9200)) (size!26759 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54705)

(assert (=> b!916571 (= res!617955 (and (= (size!26759 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26758 _keys!1487) (size!26759 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30801 () Bool)

(declare-fun mapRes!30801 () Bool)

(assert (=> mapIsEmpty!30801 mapRes!30801))

(declare-fun b!916572 () Bool)

(declare-fun res!617953 () Bool)

(assert (=> b!916572 (=> (not res!617953) (not e!514532))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916572 (= res!617953 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26758 _keys!1487))))))

(declare-fun res!617956 () Bool)

(assert (=> start!78624 (=> (not res!617956) (not e!514532))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78624 (= res!617956 (validMask!0 mask!1881))))

(assert (=> start!78624 e!514532))

(assert (=> start!78624 true))

(declare-fun e!514534 () Bool)

(declare-fun array_inv!20592 (array!54705) Bool)

(assert (=> start!78624 (and (array_inv!20592 _values!1231) e!514534)))

(assert (=> start!78624 tp!59006))

(declare-fun array_inv!20593 (array!54703) Bool)

(assert (=> start!78624 (array_inv!20593 _keys!1487)))

(declare-fun tp_is_empty!19363 () Bool)

(assert (=> start!78624 tp_is_empty!19363))

(declare-fun mapNonEmpty!30801 () Bool)

(declare-fun tp!59007 () Bool)

(declare-fun e!514531 () Bool)

(assert (=> mapNonEmpty!30801 (= mapRes!30801 (and tp!59007 e!514531))))

(declare-fun mapValue!30801 () ValueCell!9200)

(declare-fun mapKey!30801 () (_ BitVec 32))

(declare-fun mapRest!30801 () (Array (_ BitVec 32) ValueCell!9200))

(assert (=> mapNonEmpty!30801 (= (arr!26298 _values!1231) (store mapRest!30801 mapKey!30801 mapValue!30801))))

(declare-fun b!916573 () Bool)

(declare-fun res!617954 () Bool)

(assert (=> b!916573 (=> (not res!617954) (not e!514532))))

(declare-datatypes ((List!18470 0))(
  ( (Nil!18467) (Cons!18466 (h!19612 (_ BitVec 64)) (t!26074 List!18470)) )
))
(declare-fun arrayNoDuplicates!0 (array!54703 (_ BitVec 32) List!18470) Bool)

(assert (=> b!916573 (= res!617954 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18467))))

(declare-fun b!916574 () Bool)

(declare-fun e!514533 () Bool)

(assert (=> b!916574 (= e!514532 e!514533)))

(declare-fun res!617957 () Bool)

(assert (=> b!916574 (=> (not res!617957) (not e!514533))))

(declare-datatypes ((tuple2!12678 0))(
  ( (tuple2!12679 (_1!6350 (_ BitVec 64)) (_2!6350 V!30783)) )
))
(declare-datatypes ((List!18471 0))(
  ( (Nil!18468) (Cons!18467 (h!19613 tuple2!12678) (t!26075 List!18471)) )
))
(declare-datatypes ((ListLongMap!11365 0))(
  ( (ListLongMap!11366 (toList!5698 List!18471)) )
))
(declare-fun lt!411638 () ListLongMap!11365)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4706 (ListLongMap!11365 (_ BitVec 64)) Bool)

(assert (=> b!916574 (= res!617957 (contains!4706 lt!411638 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30783)

(declare-fun minValue!1173 () V!30783)

(declare-fun getCurrentListMap!2895 (array!54703 array!54705 (_ BitVec 32) (_ BitVec 32) V!30783 V!30783 (_ BitVec 32) Int) ListLongMap!11365)

(assert (=> b!916574 (= lt!411638 (getCurrentListMap!2895 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916575 () Bool)

(declare-fun e!514536 () Bool)

(assert (=> b!916575 (= e!514534 (and e!514536 mapRes!30801))))

(declare-fun condMapEmpty!30801 () Bool)

(declare-fun mapDefault!30801 () ValueCell!9200)

(assert (=> b!916575 (= condMapEmpty!30801 (= (arr!26298 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9200)) mapDefault!30801)))))

(declare-fun b!916576 () Bool)

(assert (=> b!916576 (= e!514533 false)))

(declare-fun lt!411637 () V!30783)

(declare-fun apply!540 (ListLongMap!11365 (_ BitVec 64)) V!30783)

(assert (=> b!916576 (= lt!411637 (apply!540 lt!411638 k0!1099))))

(declare-fun b!916577 () Bool)

(assert (=> b!916577 (= e!514536 tp_is_empty!19363)))

(declare-fun b!916578 () Bool)

(assert (=> b!916578 (= e!514531 tp_is_empty!19363)))

(assert (= (and start!78624 res!617956) b!916571))

(assert (= (and b!916571 res!617955) b!916570))

(assert (= (and b!916570 res!617952) b!916573))

(assert (= (and b!916573 res!617954) b!916572))

(assert (= (and b!916572 res!617953) b!916574))

(assert (= (and b!916574 res!617957) b!916576))

(assert (= (and b!916575 condMapEmpty!30801) mapIsEmpty!30801))

(assert (= (and b!916575 (not condMapEmpty!30801)) mapNonEmpty!30801))

(get-info :version)

(assert (= (and mapNonEmpty!30801 ((_ is ValueCellFull!9200) mapValue!30801)) b!916578))

(assert (= (and b!916575 ((_ is ValueCellFull!9200) mapDefault!30801)) b!916577))

(assert (= start!78624 b!916575))

(declare-fun m!849955 () Bool)

(assert (=> start!78624 m!849955))

(declare-fun m!849957 () Bool)

(assert (=> start!78624 m!849957))

(declare-fun m!849959 () Bool)

(assert (=> start!78624 m!849959))

(declare-fun m!849961 () Bool)

(assert (=> b!916574 m!849961))

(declare-fun m!849963 () Bool)

(assert (=> b!916574 m!849963))

(declare-fun m!849965 () Bool)

(assert (=> b!916570 m!849965))

(declare-fun m!849967 () Bool)

(assert (=> b!916576 m!849967))

(declare-fun m!849969 () Bool)

(assert (=> mapNonEmpty!30801 m!849969))

(declare-fun m!849971 () Bool)

(assert (=> b!916573 m!849971))

(check-sat (not b!916570) (not b!916573) (not b!916576) (not start!78624) tp_is_empty!19363 (not b_next!16855) (not b!916574) b_and!27451 (not mapNonEmpty!30801))
(check-sat b_and!27451 (not b_next!16855))
