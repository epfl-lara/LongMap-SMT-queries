; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78644 () Bool)

(assert start!78644)

(declare-fun b_free!16857 () Bool)

(declare-fun b_next!16857 () Bool)

(assert (=> start!78644 (= b_free!16857 (not b_next!16857))))

(declare-fun tp!59012 () Bool)

(declare-fun b_and!27479 () Bool)

(assert (=> start!78644 (= tp!59012 b_and!27479)))

(declare-fun b!916836 () Bool)

(declare-fun res!618085 () Bool)

(declare-fun e!514702 () Bool)

(assert (=> b!916836 (=> (not res!618085) (not e!514702))))

(declare-datatypes ((array!54716 0))(
  ( (array!54717 (arr!26303 (Array (_ BitVec 32) (_ BitVec 64))) (size!26762 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54716)

(declare-datatypes ((List!18441 0))(
  ( (Nil!18438) (Cons!18437 (h!19583 (_ BitVec 64)) (t!26054 List!18441)) )
))
(declare-fun arrayNoDuplicates!0 (array!54716 (_ BitVec 32) List!18441) Bool)

(assert (=> b!916836 (= res!618085 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18438))))

(declare-fun b!916838 () Bool)

(declare-fun e!514698 () Bool)

(assert (=> b!916838 (= e!514702 e!514698)))

(declare-fun res!618080 () Bool)

(assert (=> b!916838 (=> (not res!618080) (not e!514698))))

(declare-datatypes ((V!30785 0))(
  ( (V!30786 (val!9733 Int)) )
))
(declare-datatypes ((tuple2!12630 0))(
  ( (tuple2!12631 (_1!6326 (_ BitVec 64)) (_2!6326 V!30785)) )
))
(declare-datatypes ((List!18442 0))(
  ( (Nil!18439) (Cons!18438 (h!19584 tuple2!12630) (t!26055 List!18442)) )
))
(declare-datatypes ((ListLongMap!11327 0))(
  ( (ListLongMap!11328 (toList!5679 List!18442)) )
))
(declare-fun lt!411880 () ListLongMap!11327)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4732 (ListLongMap!11327 (_ BitVec 64)) Bool)

(assert (=> b!916838 (= res!618080 (contains!4732 lt!411880 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9201 0))(
  ( (ValueCellFull!9201 (v!12251 V!30785)) (EmptyCell!9201) )
))
(declare-datatypes ((array!54718 0))(
  ( (array!54719 (arr!26304 (Array (_ BitVec 32) ValueCell!9201)) (size!26763 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54718)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30785)

(declare-fun minValue!1173 () V!30785)

(declare-fun getCurrentListMap!2939 (array!54716 array!54718 (_ BitVec 32) (_ BitVec 32) V!30785 V!30785 (_ BitVec 32) Int) ListLongMap!11327)

(assert (=> b!916838 (= lt!411880 (getCurrentListMap!2939 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916839 () Bool)

(declare-fun e!514700 () Bool)

(declare-fun tp_is_empty!19365 () Bool)

(assert (=> b!916839 (= e!514700 tp_is_empty!19365)))

(declare-fun b!916840 () Bool)

(declare-fun e!514701 () Bool)

(assert (=> b!916840 (= e!514701 tp_is_empty!19365)))

(declare-fun mapIsEmpty!30804 () Bool)

(declare-fun mapRes!30804 () Bool)

(assert (=> mapIsEmpty!30804 mapRes!30804))

(declare-fun b!916841 () Bool)

(declare-fun e!514699 () Bool)

(assert (=> b!916841 (= e!514699 (and e!514701 mapRes!30804))))

(declare-fun condMapEmpty!30804 () Bool)

(declare-fun mapDefault!30804 () ValueCell!9201)

(assert (=> b!916841 (= condMapEmpty!30804 (= (arr!26304 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9201)) mapDefault!30804)))))

(declare-fun b!916842 () Bool)

(assert (=> b!916842 (= e!514698 false)))

(declare-fun lt!411879 () V!30785)

(declare-fun apply!535 (ListLongMap!11327 (_ BitVec 64)) V!30785)

(assert (=> b!916842 (= lt!411879 (apply!535 lt!411880 k0!1099))))

(declare-fun b!916843 () Bool)

(declare-fun res!618084 () Bool)

(assert (=> b!916843 (=> (not res!618084) (not e!514702))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54716 (_ BitVec 32)) Bool)

(assert (=> b!916843 (= res!618084 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916837 () Bool)

(declare-fun res!618083 () Bool)

(assert (=> b!916837 (=> (not res!618083) (not e!514702))))

(assert (=> b!916837 (= res!618083 (and (= (size!26763 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26762 _keys!1487) (size!26763 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun res!618082 () Bool)

(assert (=> start!78644 (=> (not res!618082) (not e!514702))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78644 (= res!618082 (validMask!0 mask!1881))))

(assert (=> start!78644 e!514702))

(assert (=> start!78644 true))

(declare-fun array_inv!20512 (array!54718) Bool)

(assert (=> start!78644 (and (array_inv!20512 _values!1231) e!514699)))

(assert (=> start!78644 tp!59012))

(declare-fun array_inv!20513 (array!54716) Bool)

(assert (=> start!78644 (array_inv!20513 _keys!1487)))

(assert (=> start!78644 tp_is_empty!19365))

(declare-fun b!916844 () Bool)

(declare-fun res!618081 () Bool)

(assert (=> b!916844 (=> (not res!618081) (not e!514702))))

(assert (=> b!916844 (= res!618081 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26762 _keys!1487))))))

(declare-fun mapNonEmpty!30804 () Bool)

(declare-fun tp!59011 () Bool)

(assert (=> mapNonEmpty!30804 (= mapRes!30804 (and tp!59011 e!514700))))

(declare-fun mapRest!30804 () (Array (_ BitVec 32) ValueCell!9201))

(declare-fun mapKey!30804 () (_ BitVec 32))

(declare-fun mapValue!30804 () ValueCell!9201)

(assert (=> mapNonEmpty!30804 (= (arr!26304 _values!1231) (store mapRest!30804 mapKey!30804 mapValue!30804))))

(assert (= (and start!78644 res!618082) b!916837))

(assert (= (and b!916837 res!618083) b!916843))

(assert (= (and b!916843 res!618084) b!916836))

(assert (= (and b!916836 res!618085) b!916844))

(assert (= (and b!916844 res!618081) b!916838))

(assert (= (and b!916838 res!618080) b!916842))

(assert (= (and b!916841 condMapEmpty!30804) mapIsEmpty!30804))

(assert (= (and b!916841 (not condMapEmpty!30804)) mapNonEmpty!30804))

(get-info :version)

(assert (= (and mapNonEmpty!30804 ((_ is ValueCellFull!9201) mapValue!30804)) b!916839))

(assert (= (and b!916841 ((_ is ValueCellFull!9201) mapDefault!30804)) b!916840))

(assert (= start!78644 b!916841))

(declare-fun m!850731 () Bool)

(assert (=> b!916843 m!850731))

(declare-fun m!850733 () Bool)

(assert (=> b!916838 m!850733))

(declare-fun m!850735 () Bool)

(assert (=> b!916838 m!850735))

(declare-fun m!850737 () Bool)

(assert (=> b!916836 m!850737))

(declare-fun m!850739 () Bool)

(assert (=> mapNonEmpty!30804 m!850739))

(declare-fun m!850741 () Bool)

(assert (=> start!78644 m!850741))

(declare-fun m!850743 () Bool)

(assert (=> start!78644 m!850743))

(declare-fun m!850745 () Bool)

(assert (=> start!78644 m!850745))

(declare-fun m!850747 () Bool)

(assert (=> b!916842 m!850747))

(check-sat (not b!916843) (not start!78644) b_and!27479 (not b!916836) (not b!916838) (not mapNonEmpty!30804) (not b_next!16857) tp_is_empty!19365 (not b!916842))
(check-sat b_and!27479 (not b_next!16857))
