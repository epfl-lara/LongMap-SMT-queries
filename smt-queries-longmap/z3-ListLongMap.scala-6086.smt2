; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78626 () Bool)

(assert start!78626)

(declare-fun b_free!16839 () Bool)

(declare-fun b_next!16839 () Bool)

(assert (=> start!78626 (= b_free!16839 (not b_next!16839))))

(declare-fun tp!58958 () Bool)

(declare-fun b_and!27461 () Bool)

(assert (=> start!78626 (= tp!58958 b_and!27461)))

(declare-fun mapIsEmpty!30777 () Bool)

(declare-fun mapRes!30777 () Bool)

(assert (=> mapIsEmpty!30777 mapRes!30777))

(declare-fun b!916594 () Bool)

(declare-fun res!617921 () Bool)

(declare-fun e!514535 () Bool)

(assert (=> b!916594 (=> (not res!617921) (not e!514535))))

(declare-datatypes ((array!54680 0))(
  ( (array!54681 (arr!26285 (Array (_ BitVec 32) (_ BitVec 64))) (size!26744 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54680)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54680 (_ BitVec 32)) Bool)

(assert (=> b!916594 (= res!617921 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916595 () Bool)

(declare-fun e!514539 () Bool)

(declare-fun tp_is_empty!19347 () Bool)

(assert (=> b!916595 (= e!514539 tp_is_empty!19347)))

(declare-fun b!916596 () Bool)

(declare-fun e!514540 () Bool)

(assert (=> b!916596 (= e!514535 e!514540)))

(declare-fun res!617922 () Bool)

(assert (=> b!916596 (=> (not res!617922) (not e!514540))))

(declare-datatypes ((V!30761 0))(
  ( (V!30762 (val!9724 Int)) )
))
(declare-datatypes ((tuple2!12618 0))(
  ( (tuple2!12619 (_1!6320 (_ BitVec 64)) (_2!6320 V!30761)) )
))
(declare-datatypes ((List!18428 0))(
  ( (Nil!18425) (Cons!18424 (h!19570 tuple2!12618) (t!26041 List!18428)) )
))
(declare-datatypes ((ListLongMap!11315 0))(
  ( (ListLongMap!11316 (toList!5673 List!18428)) )
))
(declare-fun lt!411826 () ListLongMap!11315)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4726 (ListLongMap!11315 (_ BitVec 64)) Bool)

(assert (=> b!916596 (= res!617922 (contains!4726 lt!411826 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9192 0))(
  ( (ValueCellFull!9192 (v!12242 V!30761)) (EmptyCell!9192) )
))
(declare-datatypes ((array!54682 0))(
  ( (array!54683 (arr!26286 (Array (_ BitVec 32) ValueCell!9192)) (size!26745 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54682)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30761)

(declare-fun minValue!1173 () V!30761)

(declare-fun getCurrentListMap!2933 (array!54680 array!54682 (_ BitVec 32) (_ BitVec 32) V!30761 V!30761 (_ BitVec 32) Int) ListLongMap!11315)

(assert (=> b!916596 (= lt!411826 (getCurrentListMap!2933 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun mapNonEmpty!30777 () Bool)

(declare-fun tp!58957 () Bool)

(declare-fun e!514536 () Bool)

(assert (=> mapNonEmpty!30777 (= mapRes!30777 (and tp!58957 e!514536))))

(declare-fun mapRest!30777 () (Array (_ BitVec 32) ValueCell!9192))

(declare-fun mapKey!30777 () (_ BitVec 32))

(declare-fun mapValue!30777 () ValueCell!9192)

(assert (=> mapNonEmpty!30777 (= (arr!26286 _values!1231) (store mapRest!30777 mapKey!30777 mapValue!30777))))

(declare-fun b!916597 () Bool)

(declare-fun res!617923 () Bool)

(assert (=> b!916597 (=> (not res!617923) (not e!514535))))

(assert (=> b!916597 (= res!617923 (and (= (size!26745 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26744 _keys!1487) (size!26745 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916598 () Bool)

(declare-fun res!617920 () Bool)

(assert (=> b!916598 (=> (not res!617920) (not e!514535))))

(assert (=> b!916598 (= res!617920 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26744 _keys!1487))))))

(declare-fun b!916599 () Bool)

(assert (=> b!916599 (= e!514536 tp_is_empty!19347)))

(declare-fun b!916600 () Bool)

(assert (=> b!916600 (= e!514540 false)))

(declare-fun lt!411825 () V!30761)

(declare-fun apply!532 (ListLongMap!11315 (_ BitVec 64)) V!30761)

(assert (=> b!916600 (= lt!411825 (apply!532 lt!411826 k0!1099))))

(declare-fun b!916601 () Bool)

(declare-fun e!514537 () Bool)

(assert (=> b!916601 (= e!514537 (and e!514539 mapRes!30777))))

(declare-fun condMapEmpty!30777 () Bool)

(declare-fun mapDefault!30777 () ValueCell!9192)

(assert (=> b!916601 (= condMapEmpty!30777 (= (arr!26286 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9192)) mapDefault!30777)))))

(declare-fun b!916593 () Bool)

(declare-fun res!617918 () Bool)

(assert (=> b!916593 (=> (not res!617918) (not e!514535))))

(declare-datatypes ((List!18429 0))(
  ( (Nil!18426) (Cons!18425 (h!19571 (_ BitVec 64)) (t!26042 List!18429)) )
))
(declare-fun arrayNoDuplicates!0 (array!54680 (_ BitVec 32) List!18429) Bool)

(assert (=> b!916593 (= res!617918 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18426))))

(declare-fun res!617919 () Bool)

(assert (=> start!78626 (=> (not res!617919) (not e!514535))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78626 (= res!617919 (validMask!0 mask!1881))))

(assert (=> start!78626 e!514535))

(assert (=> start!78626 true))

(declare-fun array_inv!20502 (array!54682) Bool)

(assert (=> start!78626 (and (array_inv!20502 _values!1231) e!514537)))

(assert (=> start!78626 tp!58958))

(declare-fun array_inv!20503 (array!54680) Bool)

(assert (=> start!78626 (array_inv!20503 _keys!1487)))

(assert (=> start!78626 tp_is_empty!19347))

(assert (= (and start!78626 res!617919) b!916597))

(assert (= (and b!916597 res!617923) b!916594))

(assert (= (and b!916594 res!617921) b!916593))

(assert (= (and b!916593 res!617918) b!916598))

(assert (= (and b!916598 res!617920) b!916596))

(assert (= (and b!916596 res!617922) b!916600))

(assert (= (and b!916601 condMapEmpty!30777) mapIsEmpty!30777))

(assert (= (and b!916601 (not condMapEmpty!30777)) mapNonEmpty!30777))

(get-info :version)

(assert (= (and mapNonEmpty!30777 ((_ is ValueCellFull!9192) mapValue!30777)) b!916599))

(assert (= (and b!916601 ((_ is ValueCellFull!9192) mapDefault!30777)) b!916595))

(assert (= start!78626 b!916601))

(declare-fun m!850569 () Bool)

(assert (=> mapNonEmpty!30777 m!850569))

(declare-fun m!850571 () Bool)

(assert (=> b!916593 m!850571))

(declare-fun m!850573 () Bool)

(assert (=> b!916596 m!850573))

(declare-fun m!850575 () Bool)

(assert (=> b!916596 m!850575))

(declare-fun m!850577 () Bool)

(assert (=> start!78626 m!850577))

(declare-fun m!850579 () Bool)

(assert (=> start!78626 m!850579))

(declare-fun m!850581 () Bool)

(assert (=> start!78626 m!850581))

(declare-fun m!850583 () Bool)

(assert (=> b!916594 m!850583))

(declare-fun m!850585 () Bool)

(assert (=> b!916600 m!850585))

(check-sat (not start!78626) (not b!916594) (not b!916600) b_and!27461 (not b_next!16839) (not mapNonEmpty!30777) tp_is_empty!19347 (not b!916593) (not b!916596))
(check-sat b_and!27461 (not b_next!16839))
