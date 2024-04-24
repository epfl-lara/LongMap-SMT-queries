; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78738 () Bool)

(assert start!78738)

(declare-fun b_free!16783 () Bool)

(declare-fun b_next!16783 () Bool)

(assert (=> start!78738 (= b_free!16783 (not b_next!16783))))

(declare-fun tp!58790 () Bool)

(declare-fun b_and!27415 () Bool)

(assert (=> start!78738 (= tp!58790 b_and!27415)))

(declare-fun mapIsEmpty!30693 () Bool)

(declare-fun mapRes!30693 () Bool)

(assert (=> mapIsEmpty!30693 mapRes!30693))

(declare-fun b!916792 () Bool)

(declare-fun res!617810 () Bool)

(declare-fun e!514678 () Bool)

(assert (=> b!916792 (=> (not res!617810) (not e!514678))))

(declare-datatypes ((array!54627 0))(
  ( (array!54628 (arr!26254 (Array (_ BitVec 32) (_ BitVec 64))) (size!26714 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54627)

(declare-datatypes ((List!18378 0))(
  ( (Nil!18375) (Cons!18374 (h!19526 (_ BitVec 64)) (t!25983 List!18378)) )
))
(declare-fun arrayNoDuplicates!0 (array!54627 (_ BitVec 32) List!18378) Bool)

(assert (=> b!916792 (= res!617810 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18375))))

(declare-fun b!916793 () Bool)

(declare-fun res!617814 () Bool)

(assert (=> b!916793 (=> (not res!617814) (not e!514678))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916793 (= res!617814 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26714 _keys!1487))))))

(declare-fun b!916794 () Bool)

(assert (=> b!916794 (= e!514678 false)))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun lt!412088 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!30687 0))(
  ( (V!30688 (val!9696 Int)) )
))
(declare-datatypes ((ValueCell!9164 0))(
  ( (ValueCellFull!9164 (v!12211 V!30687)) (EmptyCell!9164) )
))
(declare-datatypes ((array!54629 0))(
  ( (array!54630 (arr!26255 (Array (_ BitVec 32) ValueCell!9164)) (size!26715 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54629)

(declare-fun zeroValue!1173 () V!30687)

(declare-fun minValue!1173 () V!30687)

(declare-datatypes ((tuple2!12546 0))(
  ( (tuple2!12547 (_1!6284 (_ BitVec 64)) (_2!6284 V!30687)) )
))
(declare-datatypes ((List!18379 0))(
  ( (Nil!18376) (Cons!18375 (h!19527 tuple2!12546) (t!25984 List!18379)) )
))
(declare-datatypes ((ListLongMap!11245 0))(
  ( (ListLongMap!11246 (toList!5638 List!18379)) )
))
(declare-fun contains!4700 (ListLongMap!11245 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2897 (array!54627 array!54629 (_ BitVec 32) (_ BitVec 32) V!30687 V!30687 (_ BitVec 32) Int) ListLongMap!11245)

(assert (=> b!916794 (= lt!412088 (contains!4700 (getCurrentListMap!2897 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!916795 () Bool)

(declare-fun e!514674 () Bool)

(declare-fun tp_is_empty!19291 () Bool)

(assert (=> b!916795 (= e!514674 tp_is_empty!19291)))

(declare-fun b!916796 () Bool)

(declare-fun res!617813 () Bool)

(assert (=> b!916796 (=> (not res!617813) (not e!514678))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54627 (_ BitVec 32)) Bool)

(assert (=> b!916796 (= res!617813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!617812 () Bool)

(assert (=> start!78738 (=> (not res!617812) (not e!514678))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78738 (= res!617812 (validMask!0 mask!1881))))

(assert (=> start!78738 e!514678))

(assert (=> start!78738 true))

(declare-fun e!514676 () Bool)

(declare-fun array_inv!20586 (array!54629) Bool)

(assert (=> start!78738 (and (array_inv!20586 _values!1231) e!514676)))

(assert (=> start!78738 tp!58790))

(declare-fun array_inv!20587 (array!54627) Bool)

(assert (=> start!78738 (array_inv!20587 _keys!1487)))

(assert (=> start!78738 tp_is_empty!19291))

(declare-fun b!916797 () Bool)

(declare-fun e!514677 () Bool)

(assert (=> b!916797 (= e!514676 (and e!514677 mapRes!30693))))

(declare-fun condMapEmpty!30693 () Bool)

(declare-fun mapDefault!30693 () ValueCell!9164)

(assert (=> b!916797 (= condMapEmpty!30693 (= (arr!26255 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9164)) mapDefault!30693)))))

(declare-fun b!916798 () Bool)

(assert (=> b!916798 (= e!514677 tp_is_empty!19291)))

(declare-fun b!916799 () Bool)

(declare-fun res!617811 () Bool)

(assert (=> b!916799 (=> (not res!617811) (not e!514678))))

(assert (=> b!916799 (= res!617811 (and (= (size!26715 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26714 _keys!1487) (size!26715 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30693 () Bool)

(declare-fun tp!58791 () Bool)

(assert (=> mapNonEmpty!30693 (= mapRes!30693 (and tp!58791 e!514674))))

(declare-fun mapValue!30693 () ValueCell!9164)

(declare-fun mapKey!30693 () (_ BitVec 32))

(declare-fun mapRest!30693 () (Array (_ BitVec 32) ValueCell!9164))

(assert (=> mapNonEmpty!30693 (= (arr!26255 _values!1231) (store mapRest!30693 mapKey!30693 mapValue!30693))))

(assert (= (and start!78738 res!617812) b!916799))

(assert (= (and b!916799 res!617811) b!916796))

(assert (= (and b!916796 res!617813) b!916792))

(assert (= (and b!916792 res!617810) b!916793))

(assert (= (and b!916793 res!617814) b!916794))

(assert (= (and b!916797 condMapEmpty!30693) mapIsEmpty!30693))

(assert (= (and b!916797 (not condMapEmpty!30693)) mapNonEmpty!30693))

(get-info :version)

(assert (= (and mapNonEmpty!30693 ((_ is ValueCellFull!9164) mapValue!30693)) b!916795))

(assert (= (and b!916797 ((_ is ValueCellFull!9164) mapDefault!30693)) b!916798))

(assert (= start!78738 b!916797))

(declare-fun m!851401 () Bool)

(assert (=> b!916794 m!851401))

(assert (=> b!916794 m!851401))

(declare-fun m!851403 () Bool)

(assert (=> b!916794 m!851403))

(declare-fun m!851405 () Bool)

(assert (=> start!78738 m!851405))

(declare-fun m!851407 () Bool)

(assert (=> start!78738 m!851407))

(declare-fun m!851409 () Bool)

(assert (=> start!78738 m!851409))

(declare-fun m!851411 () Bool)

(assert (=> mapNonEmpty!30693 m!851411))

(declare-fun m!851413 () Bool)

(assert (=> b!916792 m!851413))

(declare-fun m!851415 () Bool)

(assert (=> b!916796 m!851415))

(check-sat tp_is_empty!19291 (not b!916796) (not b!916794) (not mapNonEmpty!30693) (not b_next!16783) (not start!78738) (not b!916792) b_and!27415)
(check-sat b_and!27415 (not b_next!16783))
