; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78744 () Bool)

(assert start!78744)

(declare-fun b_free!16789 () Bool)

(declare-fun b_next!16789 () Bool)

(assert (=> start!78744 (= b_free!16789 (not b_next!16789))))

(declare-fun tp!58809 () Bool)

(declare-fun b_and!27421 () Bool)

(assert (=> start!78744 (= tp!58809 b_and!27421)))

(declare-fun b!916864 () Bool)

(declare-fun res!617858 () Bool)

(declare-fun e!514721 () Bool)

(assert (=> b!916864 (=> (not res!617858) (not e!514721))))

(declare-datatypes ((array!54637 0))(
  ( (array!54638 (arr!26259 (Array (_ BitVec 32) (_ BitVec 64))) (size!26719 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54637)

(declare-datatypes ((List!18380 0))(
  ( (Nil!18377) (Cons!18376 (h!19528 (_ BitVec 64)) (t!25985 List!18380)) )
))
(declare-fun arrayNoDuplicates!0 (array!54637 (_ BitVec 32) List!18380) Bool)

(assert (=> b!916864 (= res!617858 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18377))))

(declare-fun b!916865 () Bool)

(declare-fun res!617857 () Bool)

(assert (=> b!916865 (=> (not res!617857) (not e!514721))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916865 (= res!617857 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26719 _keys!1487))))))

(declare-fun res!617856 () Bool)

(assert (=> start!78744 (=> (not res!617856) (not e!514721))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78744 (= res!617856 (validMask!0 mask!1881))))

(assert (=> start!78744 e!514721))

(assert (=> start!78744 true))

(declare-datatypes ((V!30695 0))(
  ( (V!30696 (val!9699 Int)) )
))
(declare-datatypes ((ValueCell!9167 0))(
  ( (ValueCellFull!9167 (v!12214 V!30695)) (EmptyCell!9167) )
))
(declare-datatypes ((array!54639 0))(
  ( (array!54640 (arr!26260 (Array (_ BitVec 32) ValueCell!9167)) (size!26720 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54639)

(declare-fun e!514719 () Bool)

(declare-fun array_inv!20590 (array!54639) Bool)

(assert (=> start!78744 (and (array_inv!20590 _values!1231) e!514719)))

(assert (=> start!78744 tp!58809))

(declare-fun array_inv!20591 (array!54637) Bool)

(assert (=> start!78744 (array_inv!20591 _keys!1487)))

(declare-fun tp_is_empty!19297 () Bool)

(assert (=> start!78744 tp_is_empty!19297))

(declare-fun b!916866 () Bool)

(declare-fun e!514723 () Bool)

(declare-fun mapRes!30702 () Bool)

(assert (=> b!916866 (= e!514719 (and e!514723 mapRes!30702))))

(declare-fun condMapEmpty!30702 () Bool)

(declare-fun mapDefault!30702 () ValueCell!9167)

(assert (=> b!916866 (= condMapEmpty!30702 (= (arr!26260 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9167)) mapDefault!30702)))))

(declare-fun b!916867 () Bool)

(declare-fun res!617859 () Bool)

(assert (=> b!916867 (=> (not res!617859) (not e!514721))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54637 (_ BitVec 32)) Bool)

(assert (=> b!916867 (= res!617859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916868 () Bool)

(declare-fun res!617855 () Bool)

(assert (=> b!916868 (=> (not res!617855) (not e!514721))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916868 (= res!617855 (and (= (size!26720 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26719 _keys!1487) (size!26720 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!30702 () Bool)

(assert (=> mapIsEmpty!30702 mapRes!30702))

(declare-fun mapNonEmpty!30702 () Bool)

(declare-fun tp!58808 () Bool)

(declare-fun e!514722 () Bool)

(assert (=> mapNonEmpty!30702 (= mapRes!30702 (and tp!58808 e!514722))))

(declare-fun mapKey!30702 () (_ BitVec 32))

(declare-fun mapValue!30702 () ValueCell!9167)

(declare-fun mapRest!30702 () (Array (_ BitVec 32) ValueCell!9167))

(assert (=> mapNonEmpty!30702 (= (arr!26260 _values!1231) (store mapRest!30702 mapKey!30702 mapValue!30702))))

(declare-fun b!916869 () Bool)

(assert (=> b!916869 (= e!514721 false)))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!412097 () Bool)

(declare-fun zeroValue!1173 () V!30695)

(declare-fun minValue!1173 () V!30695)

(declare-datatypes ((tuple2!12548 0))(
  ( (tuple2!12549 (_1!6285 (_ BitVec 64)) (_2!6285 V!30695)) )
))
(declare-datatypes ((List!18381 0))(
  ( (Nil!18378) (Cons!18377 (h!19529 tuple2!12548) (t!25986 List!18381)) )
))
(declare-datatypes ((ListLongMap!11247 0))(
  ( (ListLongMap!11248 (toList!5639 List!18381)) )
))
(declare-fun contains!4701 (ListLongMap!11247 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2898 (array!54637 array!54639 (_ BitVec 32) (_ BitVec 32) V!30695 V!30695 (_ BitVec 32) Int) ListLongMap!11247)

(assert (=> b!916869 (= lt!412097 (contains!4701 (getCurrentListMap!2898 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!916870 () Bool)

(assert (=> b!916870 (= e!514723 tp_is_empty!19297)))

(declare-fun b!916871 () Bool)

(assert (=> b!916871 (= e!514722 tp_is_empty!19297)))

(assert (= (and start!78744 res!617856) b!916868))

(assert (= (and b!916868 res!617855) b!916867))

(assert (= (and b!916867 res!617859) b!916864))

(assert (= (and b!916864 res!617858) b!916865))

(assert (= (and b!916865 res!617857) b!916869))

(assert (= (and b!916866 condMapEmpty!30702) mapIsEmpty!30702))

(assert (= (and b!916866 (not condMapEmpty!30702)) mapNonEmpty!30702))

(get-info :version)

(assert (= (and mapNonEmpty!30702 ((_ is ValueCellFull!9167) mapValue!30702)) b!916871))

(assert (= (and b!916866 ((_ is ValueCellFull!9167) mapDefault!30702)) b!916870))

(assert (= start!78744 b!916866))

(declare-fun m!851449 () Bool)

(assert (=> b!916867 m!851449))

(declare-fun m!851451 () Bool)

(assert (=> b!916869 m!851451))

(assert (=> b!916869 m!851451))

(declare-fun m!851453 () Bool)

(assert (=> b!916869 m!851453))

(declare-fun m!851455 () Bool)

(assert (=> start!78744 m!851455))

(declare-fun m!851457 () Bool)

(assert (=> start!78744 m!851457))

(declare-fun m!851459 () Bool)

(assert (=> start!78744 m!851459))

(declare-fun m!851461 () Bool)

(assert (=> b!916864 m!851461))

(declare-fun m!851463 () Bool)

(assert (=> mapNonEmpty!30702 m!851463))

(check-sat (not start!78744) (not b_next!16789) (not b!916867) (not b!916864) (not mapNonEmpty!30702) tp_is_empty!19297 (not b!916869) b_and!27421)
(check-sat b_and!27421 (not b_next!16789))
