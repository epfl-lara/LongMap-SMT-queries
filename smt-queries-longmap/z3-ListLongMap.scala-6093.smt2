; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78648 () Bool)

(assert start!78648)

(declare-fun b_free!16879 () Bool)

(declare-fun b_next!16879 () Bool)

(assert (=> start!78648 (= b_free!16879 (not b_next!16879))))

(declare-fun tp!59078 () Bool)

(declare-fun b_and!27475 () Bool)

(assert (=> start!78648 (= tp!59078 b_and!27475)))

(declare-fun b!916894 () Bool)

(declare-fun e!514752 () Bool)

(declare-fun tp_is_empty!19387 () Bool)

(assert (=> b!916894 (= e!514752 tp_is_empty!19387)))

(declare-fun b!916895 () Bool)

(declare-fun res!618169 () Bool)

(declare-fun e!514747 () Bool)

(assert (=> b!916895 (=> (not res!618169) (not e!514747))))

(declare-datatypes ((array!54749 0))(
  ( (array!54750 (arr!26320 (Array (_ BitVec 32) (_ BitVec 64))) (size!26781 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54749)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54749 (_ BitVec 32)) Bool)

(assert (=> b!916895 (= res!618169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30837 () Bool)

(declare-fun mapRes!30837 () Bool)

(assert (=> mapIsEmpty!30837 mapRes!30837))

(declare-fun b!916896 () Bool)

(declare-fun e!514748 () Bool)

(assert (=> b!916896 (= e!514748 false)))

(declare-datatypes ((V!30815 0))(
  ( (V!30816 (val!9744 Int)) )
))
(declare-fun lt!411710 () V!30815)

(declare-datatypes ((tuple2!12698 0))(
  ( (tuple2!12699 (_1!6360 (_ BitVec 64)) (_2!6360 V!30815)) )
))
(declare-datatypes ((List!18488 0))(
  ( (Nil!18485) (Cons!18484 (h!19630 tuple2!12698) (t!26092 List!18488)) )
))
(declare-datatypes ((ListLongMap!11385 0))(
  ( (ListLongMap!11386 (toList!5708 List!18488)) )
))
(declare-fun lt!411709 () ListLongMap!11385)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!549 (ListLongMap!11385 (_ BitVec 64)) V!30815)

(assert (=> b!916896 (= lt!411710 (apply!549 lt!411709 k0!1099))))

(declare-fun b!916897 () Bool)

(assert (=> b!916897 (= e!514747 e!514748)))

(declare-fun res!618173 () Bool)

(assert (=> b!916897 (=> (not res!618173) (not e!514748))))

(declare-fun contains!4713 (ListLongMap!11385 (_ BitVec 64)) Bool)

(assert (=> b!916897 (= res!618173 (contains!4713 lt!411709 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9212 0))(
  ( (ValueCellFull!9212 (v!12261 V!30815)) (EmptyCell!9212) )
))
(declare-datatypes ((array!54751 0))(
  ( (array!54752 (arr!26321 (Array (_ BitVec 32) ValueCell!9212)) (size!26782 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54751)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30815)

(declare-fun minValue!1173 () V!30815)

(declare-fun getCurrentListMap!2902 (array!54749 array!54751 (_ BitVec 32) (_ BitVec 32) V!30815 V!30815 (_ BitVec 32) Int) ListLongMap!11385)

(assert (=> b!916897 (= lt!411709 (getCurrentListMap!2902 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!618170 () Bool)

(assert (=> start!78648 (=> (not res!618170) (not e!514747))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78648 (= res!618170 (validMask!0 mask!1881))))

(assert (=> start!78648 e!514747))

(assert (=> start!78648 true))

(declare-fun e!514751 () Bool)

(declare-fun array_inv!20606 (array!54751) Bool)

(assert (=> start!78648 (and (array_inv!20606 _values!1231) e!514751)))

(assert (=> start!78648 tp!59078))

(declare-fun array_inv!20607 (array!54749) Bool)

(assert (=> start!78648 (array_inv!20607 _keys!1487)))

(assert (=> start!78648 tp_is_empty!19387))

(declare-fun b!916898 () Bool)

(declare-fun res!618168 () Bool)

(assert (=> b!916898 (=> (not res!618168) (not e!514747))))

(assert (=> b!916898 (= res!618168 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26781 _keys!1487))))))

(declare-fun mapNonEmpty!30837 () Bool)

(declare-fun tp!59079 () Bool)

(assert (=> mapNonEmpty!30837 (= mapRes!30837 (and tp!59079 e!514752))))

(declare-fun mapValue!30837 () ValueCell!9212)

(declare-fun mapRest!30837 () (Array (_ BitVec 32) ValueCell!9212))

(declare-fun mapKey!30837 () (_ BitVec 32))

(assert (=> mapNonEmpty!30837 (= (arr!26321 _values!1231) (store mapRest!30837 mapKey!30837 mapValue!30837))))

(declare-fun b!916899 () Bool)

(declare-fun e!514750 () Bool)

(assert (=> b!916899 (= e!514751 (and e!514750 mapRes!30837))))

(declare-fun condMapEmpty!30837 () Bool)

(declare-fun mapDefault!30837 () ValueCell!9212)

(assert (=> b!916899 (= condMapEmpty!30837 (= (arr!26321 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9212)) mapDefault!30837)))))

(declare-fun b!916900 () Bool)

(declare-fun res!618171 () Bool)

(assert (=> b!916900 (=> (not res!618171) (not e!514747))))

(declare-datatypes ((List!18489 0))(
  ( (Nil!18486) (Cons!18485 (h!19631 (_ BitVec 64)) (t!26093 List!18489)) )
))
(declare-fun arrayNoDuplicates!0 (array!54749 (_ BitVec 32) List!18489) Bool)

(assert (=> b!916900 (= res!618171 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18486))))

(declare-fun b!916901 () Bool)

(declare-fun res!618172 () Bool)

(assert (=> b!916901 (=> (not res!618172) (not e!514747))))

(assert (=> b!916901 (= res!618172 (and (= (size!26782 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26781 _keys!1487) (size!26782 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916902 () Bool)

(assert (=> b!916902 (= e!514750 tp_is_empty!19387)))

(assert (= (and start!78648 res!618170) b!916901))

(assert (= (and b!916901 res!618172) b!916895))

(assert (= (and b!916895 res!618169) b!916900))

(assert (= (and b!916900 res!618171) b!916898))

(assert (= (and b!916898 res!618168) b!916897))

(assert (= (and b!916897 res!618173) b!916896))

(assert (= (and b!916899 condMapEmpty!30837) mapIsEmpty!30837))

(assert (= (and b!916899 (not condMapEmpty!30837)) mapNonEmpty!30837))

(get-info :version)

(assert (= (and mapNonEmpty!30837 ((_ is ValueCellFull!9212) mapValue!30837)) b!916894))

(assert (= (and b!916899 ((_ is ValueCellFull!9212) mapDefault!30837)) b!916902))

(assert (= start!78648 b!916899))

(declare-fun m!850171 () Bool)

(assert (=> b!916896 m!850171))

(declare-fun m!850173 () Bool)

(assert (=> mapNonEmpty!30837 m!850173))

(declare-fun m!850175 () Bool)

(assert (=> b!916900 m!850175))

(declare-fun m!850177 () Bool)

(assert (=> b!916895 m!850177))

(declare-fun m!850179 () Bool)

(assert (=> b!916897 m!850179))

(declare-fun m!850181 () Bool)

(assert (=> b!916897 m!850181))

(declare-fun m!850183 () Bool)

(assert (=> start!78648 m!850183))

(declare-fun m!850185 () Bool)

(assert (=> start!78648 m!850185))

(declare-fun m!850187 () Bool)

(assert (=> start!78648 m!850187))

(check-sat (not b!916897) (not start!78648) tp_is_empty!19387 (not b!916900) (not b!916896) (not b!916895) b_and!27475 (not b_next!16879) (not mapNonEmpty!30837))
(check-sat b_and!27475 (not b_next!16879))
