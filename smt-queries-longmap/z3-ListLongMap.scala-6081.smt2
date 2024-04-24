; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78762 () Bool)

(assert start!78762)

(declare-fun b_free!16807 () Bool)

(declare-fun b_next!16807 () Bool)

(assert (=> start!78762 (= b_free!16807 (not b_next!16807))))

(declare-fun tp!58862 () Bool)

(declare-fun b_and!27439 () Bool)

(assert (=> start!78762 (= tp!58862 b_and!27439)))

(declare-fun mapIsEmpty!30729 () Bool)

(declare-fun mapRes!30729 () Bool)

(assert (=> mapIsEmpty!30729 mapRes!30729))

(declare-fun b!917080 () Bool)

(declare-fun e!514857 () Bool)

(declare-fun tp_is_empty!19315 () Bool)

(assert (=> b!917080 (= e!514857 tp_is_empty!19315)))

(declare-fun mapNonEmpty!30729 () Bool)

(declare-fun tp!58863 () Bool)

(declare-fun e!514855 () Bool)

(assert (=> mapNonEmpty!30729 (= mapRes!30729 (and tp!58863 e!514855))))

(declare-datatypes ((V!30719 0))(
  ( (V!30720 (val!9708 Int)) )
))
(declare-datatypes ((ValueCell!9176 0))(
  ( (ValueCellFull!9176 (v!12223 V!30719)) (EmptyCell!9176) )
))
(declare-fun mapValue!30729 () ValueCell!9176)

(declare-fun mapKey!30729 () (_ BitVec 32))

(declare-datatypes ((array!54669 0))(
  ( (array!54670 (arr!26275 (Array (_ BitVec 32) ValueCell!9176)) (size!26735 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54669)

(declare-fun mapRest!30729 () (Array (_ BitVec 32) ValueCell!9176))

(assert (=> mapNonEmpty!30729 (= (arr!26275 _values!1231) (store mapRest!30729 mapKey!30729 mapValue!30729))))

(declare-fun b!917081 () Bool)

(declare-fun res!617990 () Bool)

(declare-fun e!514854 () Bool)

(assert (=> b!917081 (=> (not res!617990) (not e!514854))))

(declare-datatypes ((array!54671 0))(
  ( (array!54672 (arr!26276 (Array (_ BitVec 32) (_ BitVec 64))) (size!26736 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54671)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54671 (_ BitVec 32)) Bool)

(assert (=> b!917081 (= res!617990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917082 () Bool)

(assert (=> b!917082 (= e!514854 false)))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun lt!412124 () Bool)

(declare-fun zeroValue!1173 () V!30719)

(declare-fun minValue!1173 () V!30719)

(declare-datatypes ((tuple2!12558 0))(
  ( (tuple2!12559 (_1!6290 (_ BitVec 64)) (_2!6290 V!30719)) )
))
(declare-datatypes ((List!18390 0))(
  ( (Nil!18387) (Cons!18386 (h!19538 tuple2!12558) (t!25995 List!18390)) )
))
(declare-datatypes ((ListLongMap!11257 0))(
  ( (ListLongMap!11258 (toList!5644 List!18390)) )
))
(declare-fun contains!4706 (ListLongMap!11257 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2903 (array!54671 array!54669 (_ BitVec 32) (_ BitVec 32) V!30719 V!30719 (_ BitVec 32) Int) ListLongMap!11257)

(assert (=> b!917082 (= lt!412124 (contains!4706 (getCurrentListMap!2903 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!917083 () Bool)

(declare-fun e!514858 () Bool)

(assert (=> b!917083 (= e!514858 (and e!514857 mapRes!30729))))

(declare-fun condMapEmpty!30729 () Bool)

(declare-fun mapDefault!30729 () ValueCell!9176)

(assert (=> b!917083 (= condMapEmpty!30729 (= (arr!26275 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9176)) mapDefault!30729)))))

(declare-fun res!617993 () Bool)

(assert (=> start!78762 (=> (not res!617993) (not e!514854))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78762 (= res!617993 (validMask!0 mask!1881))))

(assert (=> start!78762 e!514854))

(assert (=> start!78762 true))

(declare-fun array_inv!20602 (array!54669) Bool)

(assert (=> start!78762 (and (array_inv!20602 _values!1231) e!514858)))

(assert (=> start!78762 tp!58862))

(declare-fun array_inv!20603 (array!54671) Bool)

(assert (=> start!78762 (array_inv!20603 _keys!1487)))

(assert (=> start!78762 tp_is_empty!19315))

(declare-fun b!917084 () Bool)

(declare-fun res!617994 () Bool)

(assert (=> b!917084 (=> (not res!617994) (not e!514854))))

(assert (=> b!917084 (= res!617994 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26736 _keys!1487))))))

(declare-fun b!917085 () Bool)

(declare-fun res!617992 () Bool)

(assert (=> b!917085 (=> (not res!617992) (not e!514854))))

(declare-datatypes ((List!18391 0))(
  ( (Nil!18388) (Cons!18387 (h!19539 (_ BitVec 64)) (t!25996 List!18391)) )
))
(declare-fun arrayNoDuplicates!0 (array!54671 (_ BitVec 32) List!18391) Bool)

(assert (=> b!917085 (= res!617992 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18388))))

(declare-fun b!917086 () Bool)

(declare-fun res!617991 () Bool)

(assert (=> b!917086 (=> (not res!617991) (not e!514854))))

(assert (=> b!917086 (= res!617991 (and (= (size!26735 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26736 _keys!1487) (size!26735 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917087 () Bool)

(assert (=> b!917087 (= e!514855 tp_is_empty!19315)))

(assert (= (and start!78762 res!617993) b!917086))

(assert (= (and b!917086 res!617991) b!917081))

(assert (= (and b!917081 res!617990) b!917085))

(assert (= (and b!917085 res!617992) b!917084))

(assert (= (and b!917084 res!617994) b!917082))

(assert (= (and b!917083 condMapEmpty!30729) mapIsEmpty!30729))

(assert (= (and b!917083 (not condMapEmpty!30729)) mapNonEmpty!30729))

(get-info :version)

(assert (= (and mapNonEmpty!30729 ((_ is ValueCellFull!9176) mapValue!30729)) b!917087))

(assert (= (and b!917083 ((_ is ValueCellFull!9176) mapDefault!30729)) b!917080))

(assert (= start!78762 b!917083))

(declare-fun m!851593 () Bool)

(assert (=> start!78762 m!851593))

(declare-fun m!851595 () Bool)

(assert (=> start!78762 m!851595))

(declare-fun m!851597 () Bool)

(assert (=> start!78762 m!851597))

(declare-fun m!851599 () Bool)

(assert (=> b!917085 m!851599))

(declare-fun m!851601 () Bool)

(assert (=> mapNonEmpty!30729 m!851601))

(declare-fun m!851603 () Bool)

(assert (=> b!917081 m!851603))

(declare-fun m!851605 () Bool)

(assert (=> b!917082 m!851605))

(assert (=> b!917082 m!851605))

(declare-fun m!851607 () Bool)

(assert (=> b!917082 m!851607))

(check-sat b_and!27439 (not b_next!16807) tp_is_empty!19315 (not mapNonEmpty!30729) (not b!917085) (not start!78762) (not b!917081) (not b!917082))
(check-sat b_and!27439 (not b_next!16807))
