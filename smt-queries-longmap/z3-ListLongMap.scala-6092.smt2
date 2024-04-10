; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78662 () Bool)

(assert start!78662)

(declare-fun b_free!16875 () Bool)

(declare-fun b_next!16875 () Bool)

(assert (=> start!78662 (= b_free!16875 (not b_next!16875))))

(declare-fun tp!59065 () Bool)

(declare-fun b_and!27497 () Bool)

(assert (=> start!78662 (= tp!59065 b_and!27497)))

(declare-fun mapIsEmpty!30831 () Bool)

(declare-fun mapRes!30831 () Bool)

(assert (=> mapIsEmpty!30831 mapRes!30831))

(declare-fun b!917079 () Bool)

(declare-fun e!514861 () Bool)

(declare-fun tp_is_empty!19383 () Bool)

(assert (=> b!917079 (= e!514861 tp_is_empty!19383)))

(declare-fun b!917080 () Bool)

(declare-fun e!514864 () Bool)

(assert (=> b!917080 (= e!514864 (and e!514861 mapRes!30831))))

(declare-fun condMapEmpty!30831 () Bool)

(declare-datatypes ((V!30809 0))(
  ( (V!30810 (val!9742 Int)) )
))
(declare-datatypes ((ValueCell!9210 0))(
  ( (ValueCellFull!9210 (v!12260 V!30809)) (EmptyCell!9210) )
))
(declare-datatypes ((array!54752 0))(
  ( (array!54753 (arr!26321 (Array (_ BitVec 32) ValueCell!9210)) (size!26780 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54752)

(declare-fun mapDefault!30831 () ValueCell!9210)

(assert (=> b!917080 (= condMapEmpty!30831 (= (arr!26321 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9210)) mapDefault!30831)))))

(declare-fun b!917081 () Bool)

(declare-fun e!514859 () Bool)

(assert (=> b!917081 (= e!514859 tp_is_empty!19383)))

(declare-fun b!917082 () Bool)

(declare-fun e!514860 () Bool)

(assert (=> b!917082 (= e!514860 false)))

(declare-fun lt!411933 () V!30809)

(declare-datatypes ((tuple2!12646 0))(
  ( (tuple2!12647 (_1!6334 (_ BitVec 64)) (_2!6334 V!30809)) )
))
(declare-datatypes ((List!18457 0))(
  ( (Nil!18454) (Cons!18453 (h!19599 tuple2!12646) (t!26070 List!18457)) )
))
(declare-datatypes ((ListLongMap!11343 0))(
  ( (ListLongMap!11344 (toList!5687 List!18457)) )
))
(declare-fun lt!411934 () ListLongMap!11343)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!542 (ListLongMap!11343 (_ BitVec 64)) V!30809)

(assert (=> b!917082 (= lt!411933 (apply!542 lt!411934 k0!1099))))

(declare-fun b!917083 () Bool)

(declare-fun res!618246 () Bool)

(declare-fun e!514863 () Bool)

(assert (=> b!917083 (=> (not res!618246) (not e!514863))))

(declare-datatypes ((array!54754 0))(
  ( (array!54755 (arr!26322 (Array (_ BitVec 32) (_ BitVec 64))) (size!26781 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54754)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54754 (_ BitVec 32)) Bool)

(assert (=> b!917083 (= res!618246 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!618243 () Bool)

(assert (=> start!78662 (=> (not res!618243) (not e!514863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78662 (= res!618243 (validMask!0 mask!1881))))

(assert (=> start!78662 e!514863))

(assert (=> start!78662 true))

(declare-fun array_inv!20526 (array!54752) Bool)

(assert (=> start!78662 (and (array_inv!20526 _values!1231) e!514864)))

(assert (=> start!78662 tp!59065))

(declare-fun array_inv!20527 (array!54754) Bool)

(assert (=> start!78662 (array_inv!20527 _keys!1487)))

(assert (=> start!78662 tp_is_empty!19383))

(declare-fun b!917084 () Bool)

(declare-fun res!618242 () Bool)

(assert (=> b!917084 (=> (not res!618242) (not e!514863))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!917084 (= res!618242 (and (= (size!26780 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26781 _keys!1487) (size!26780 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917085 () Bool)

(declare-fun res!618245 () Bool)

(assert (=> b!917085 (=> (not res!618245) (not e!514863))))

(declare-datatypes ((List!18458 0))(
  ( (Nil!18455) (Cons!18454 (h!19600 (_ BitVec 64)) (t!26071 List!18458)) )
))
(declare-fun arrayNoDuplicates!0 (array!54754 (_ BitVec 32) List!18458) Bool)

(assert (=> b!917085 (= res!618245 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18455))))

(declare-fun mapNonEmpty!30831 () Bool)

(declare-fun tp!59066 () Bool)

(assert (=> mapNonEmpty!30831 (= mapRes!30831 (and tp!59066 e!514859))))

(declare-fun mapRest!30831 () (Array (_ BitVec 32) ValueCell!9210))

(declare-fun mapValue!30831 () ValueCell!9210)

(declare-fun mapKey!30831 () (_ BitVec 32))

(assert (=> mapNonEmpty!30831 (= (arr!26321 _values!1231) (store mapRest!30831 mapKey!30831 mapValue!30831))))

(declare-fun b!917086 () Bool)

(assert (=> b!917086 (= e!514863 e!514860)))

(declare-fun res!618244 () Bool)

(assert (=> b!917086 (=> (not res!618244) (not e!514860))))

(declare-fun contains!4739 (ListLongMap!11343 (_ BitVec 64)) Bool)

(assert (=> b!917086 (= res!618244 (contains!4739 lt!411934 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30809)

(declare-fun minValue!1173 () V!30809)

(declare-fun getCurrentListMap!2946 (array!54754 array!54752 (_ BitVec 32) (_ BitVec 32) V!30809 V!30809 (_ BitVec 32) Int) ListLongMap!11343)

(assert (=> b!917086 (= lt!411934 (getCurrentListMap!2946 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917087 () Bool)

(declare-fun res!618247 () Bool)

(assert (=> b!917087 (=> (not res!618247) (not e!514863))))

(assert (=> b!917087 (= res!618247 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26781 _keys!1487))))))

(assert (= (and start!78662 res!618243) b!917084))

(assert (= (and b!917084 res!618242) b!917083))

(assert (= (and b!917083 res!618246) b!917085))

(assert (= (and b!917085 res!618245) b!917087))

(assert (= (and b!917087 res!618247) b!917086))

(assert (= (and b!917086 res!618244) b!917082))

(assert (= (and b!917080 condMapEmpty!30831) mapIsEmpty!30831))

(assert (= (and b!917080 (not condMapEmpty!30831)) mapNonEmpty!30831))

(get-info :version)

(assert (= (and mapNonEmpty!30831 ((_ is ValueCellFull!9210) mapValue!30831)) b!917081))

(assert (= (and b!917080 ((_ is ValueCellFull!9210) mapDefault!30831)) b!917079))

(assert (= start!78662 b!917080))

(declare-fun m!850893 () Bool)

(assert (=> b!917085 m!850893))

(declare-fun m!850895 () Bool)

(assert (=> mapNonEmpty!30831 m!850895))

(declare-fun m!850897 () Bool)

(assert (=> b!917082 m!850897))

(declare-fun m!850899 () Bool)

(assert (=> b!917086 m!850899))

(declare-fun m!850901 () Bool)

(assert (=> b!917086 m!850901))

(declare-fun m!850903 () Bool)

(assert (=> b!917083 m!850903))

(declare-fun m!850905 () Bool)

(assert (=> start!78662 m!850905))

(declare-fun m!850907 () Bool)

(assert (=> start!78662 m!850907))

(declare-fun m!850909 () Bool)

(assert (=> start!78662 m!850909))

(check-sat (not b!917083) (not b_next!16875) b_and!27497 (not b!917082) tp_is_empty!19383 (not mapNonEmpty!30831) (not b!917086) (not b!917085) (not start!78662))
(check-sat b_and!27497 (not b_next!16875))
