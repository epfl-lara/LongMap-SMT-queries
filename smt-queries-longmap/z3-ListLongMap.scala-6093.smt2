; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78668 () Bool)

(assert start!78668)

(declare-fun b_free!16881 () Bool)

(declare-fun b_next!16881 () Bool)

(assert (=> start!78668 (= b_free!16881 (not b_next!16881))))

(declare-fun tp!59083 () Bool)

(declare-fun b_and!27503 () Bool)

(assert (=> start!78668 (= tp!59083 b_and!27503)))

(declare-fun res!618298 () Bool)

(declare-fun e!514914 () Bool)

(assert (=> start!78668 (=> (not res!618298) (not e!514914))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78668 (= res!618298 (validMask!0 mask!1881))))

(assert (=> start!78668 e!514914))

(assert (=> start!78668 true))

(declare-datatypes ((V!30817 0))(
  ( (V!30818 (val!9745 Int)) )
))
(declare-datatypes ((ValueCell!9213 0))(
  ( (ValueCellFull!9213 (v!12263 V!30817)) (EmptyCell!9213) )
))
(declare-datatypes ((array!54764 0))(
  ( (array!54765 (arr!26327 (Array (_ BitVec 32) ValueCell!9213)) (size!26786 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54764)

(declare-fun e!514916 () Bool)

(declare-fun array_inv!20532 (array!54764) Bool)

(assert (=> start!78668 (and (array_inv!20532 _values!1231) e!514916)))

(assert (=> start!78668 tp!59083))

(declare-datatypes ((array!54766 0))(
  ( (array!54767 (arr!26328 (Array (_ BitVec 32) (_ BitVec 64))) (size!26787 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54766)

(declare-fun array_inv!20533 (array!54766) Bool)

(assert (=> start!78668 (array_inv!20533 _keys!1487)))

(declare-fun tp_is_empty!19389 () Bool)

(assert (=> start!78668 tp_is_empty!19389))

(declare-fun b!917160 () Bool)

(declare-fun res!618300 () Bool)

(assert (=> b!917160 (=> (not res!618300) (not e!514914))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!917160 (= res!618300 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26787 _keys!1487))))))

(declare-fun mapIsEmpty!30840 () Bool)

(declare-fun mapRes!30840 () Bool)

(assert (=> mapIsEmpty!30840 mapRes!30840))

(declare-fun b!917161 () Bool)

(declare-fun e!514913 () Bool)

(assert (=> b!917161 (= e!514914 e!514913)))

(declare-fun res!618296 () Bool)

(assert (=> b!917161 (=> (not res!618296) (not e!514913))))

(declare-datatypes ((tuple2!12652 0))(
  ( (tuple2!12653 (_1!6337 (_ BitVec 64)) (_2!6337 V!30817)) )
))
(declare-datatypes ((List!18463 0))(
  ( (Nil!18460) (Cons!18459 (h!19605 tuple2!12652) (t!26076 List!18463)) )
))
(declare-datatypes ((ListLongMap!11349 0))(
  ( (ListLongMap!11350 (toList!5690 List!18463)) )
))
(declare-fun lt!411952 () ListLongMap!11349)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4742 (ListLongMap!11349 (_ BitVec 64)) Bool)

(assert (=> b!917161 (= res!618296 (contains!4742 lt!411952 k0!1099))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30817)

(declare-fun minValue!1173 () V!30817)

(declare-fun getCurrentListMap!2949 (array!54766 array!54764 (_ BitVec 32) (_ BitVec 32) V!30817 V!30817 (_ BitVec 32) Int) ListLongMap!11349)

(assert (=> b!917161 (= lt!411952 (getCurrentListMap!2949 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!30840 () Bool)

(declare-fun tp!59084 () Bool)

(declare-fun e!514917 () Bool)

(assert (=> mapNonEmpty!30840 (= mapRes!30840 (and tp!59084 e!514917))))

(declare-fun mapRest!30840 () (Array (_ BitVec 32) ValueCell!9213))

(declare-fun mapValue!30840 () ValueCell!9213)

(declare-fun mapKey!30840 () (_ BitVec 32))

(assert (=> mapNonEmpty!30840 (= (arr!26327 _values!1231) (store mapRest!30840 mapKey!30840 mapValue!30840))))

(declare-fun b!917162 () Bool)

(assert (=> b!917162 (= e!514913 false)))

(declare-fun lt!411951 () V!30817)

(declare-fun apply!545 (ListLongMap!11349 (_ BitVec 64)) V!30817)

(assert (=> b!917162 (= lt!411951 (apply!545 lt!411952 k0!1099))))

(declare-fun b!917163 () Bool)

(declare-fun e!514915 () Bool)

(assert (=> b!917163 (= e!514915 tp_is_empty!19389)))

(declare-fun b!917164 () Bool)

(declare-fun res!618301 () Bool)

(assert (=> b!917164 (=> (not res!618301) (not e!514914))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54766 (_ BitVec 32)) Bool)

(assert (=> b!917164 (= res!618301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917165 () Bool)

(declare-fun res!618299 () Bool)

(assert (=> b!917165 (=> (not res!618299) (not e!514914))))

(declare-datatypes ((List!18464 0))(
  ( (Nil!18461) (Cons!18460 (h!19606 (_ BitVec 64)) (t!26077 List!18464)) )
))
(declare-fun arrayNoDuplicates!0 (array!54766 (_ BitVec 32) List!18464) Bool)

(assert (=> b!917165 (= res!618299 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18461))))

(declare-fun b!917166 () Bool)

(assert (=> b!917166 (= e!514917 tp_is_empty!19389)))

(declare-fun b!917167 () Bool)

(assert (=> b!917167 (= e!514916 (and e!514915 mapRes!30840))))

(declare-fun condMapEmpty!30840 () Bool)

(declare-fun mapDefault!30840 () ValueCell!9213)

(assert (=> b!917167 (= condMapEmpty!30840 (= (arr!26327 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9213)) mapDefault!30840)))))

(declare-fun b!917168 () Bool)

(declare-fun res!618297 () Bool)

(assert (=> b!917168 (=> (not res!618297) (not e!514914))))

(assert (=> b!917168 (= res!618297 (and (= (size!26786 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26787 _keys!1487) (size!26786 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(assert (= (and start!78668 res!618298) b!917168))

(assert (= (and b!917168 res!618297) b!917164))

(assert (= (and b!917164 res!618301) b!917165))

(assert (= (and b!917165 res!618299) b!917160))

(assert (= (and b!917160 res!618300) b!917161))

(assert (= (and b!917161 res!618296) b!917162))

(assert (= (and b!917167 condMapEmpty!30840) mapIsEmpty!30840))

(assert (= (and b!917167 (not condMapEmpty!30840)) mapNonEmpty!30840))

(get-info :version)

(assert (= (and mapNonEmpty!30840 ((_ is ValueCellFull!9213) mapValue!30840)) b!917166))

(assert (= (and b!917167 ((_ is ValueCellFull!9213) mapDefault!30840)) b!917163))

(assert (= start!78668 b!917167))

(declare-fun m!850947 () Bool)

(assert (=> b!917165 m!850947))

(declare-fun m!850949 () Bool)

(assert (=> start!78668 m!850949))

(declare-fun m!850951 () Bool)

(assert (=> start!78668 m!850951))

(declare-fun m!850953 () Bool)

(assert (=> start!78668 m!850953))

(declare-fun m!850955 () Bool)

(assert (=> b!917164 m!850955))

(declare-fun m!850957 () Bool)

(assert (=> b!917162 m!850957))

(declare-fun m!850959 () Bool)

(assert (=> mapNonEmpty!30840 m!850959))

(declare-fun m!850961 () Bool)

(assert (=> b!917161 m!850961))

(declare-fun m!850963 () Bool)

(assert (=> b!917161 m!850963))

(check-sat (not mapNonEmpty!30840) (not b!917161) (not b!917165) (not b!917164) (not b!917162) tp_is_empty!19389 b_and!27503 (not start!78668) (not b_next!16881))
(check-sat b_and!27503 (not b_next!16881))
