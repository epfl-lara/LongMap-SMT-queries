; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78768 () Bool)

(assert start!78768)

(declare-fun b_free!16813 () Bool)

(declare-fun b_next!16813 () Bool)

(assert (=> start!78768 (= b_free!16813 (not b_next!16813))))

(declare-fun tp!58881 () Bool)

(declare-fun b_and!27445 () Bool)

(assert (=> start!78768 (= tp!58881 b_and!27445)))

(declare-fun b!917154 () Bool)

(declare-fun res!618041 () Bool)

(declare-fun e!514901 () Bool)

(assert (=> b!917154 (=> (not res!618041) (not e!514901))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!54681 0))(
  ( (array!54682 (arr!26281 (Array (_ BitVec 32) (_ BitVec 64))) (size!26741 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54681)

(assert (=> b!917154 (= res!618041 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26741 _keys!1487))))))

(declare-fun b!917155 () Bool)

(declare-fun e!514902 () Bool)

(declare-fun tp_is_empty!19321 () Bool)

(assert (=> b!917155 (= e!514902 tp_is_empty!19321)))

(declare-fun b!917156 () Bool)

(assert (=> b!917156 (= e!514901 (bvsgt from!1844 (size!26741 _keys!1487)))))

(declare-fun res!618038 () Bool)

(assert (=> start!78768 (=> (not res!618038) (not e!514901))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78768 (= res!618038 (validMask!0 mask!1881))))

(assert (=> start!78768 e!514901))

(assert (=> start!78768 true))

(declare-datatypes ((V!30727 0))(
  ( (V!30728 (val!9711 Int)) )
))
(declare-datatypes ((ValueCell!9179 0))(
  ( (ValueCellFull!9179 (v!12226 V!30727)) (EmptyCell!9179) )
))
(declare-datatypes ((array!54683 0))(
  ( (array!54684 (arr!26282 (Array (_ BitVec 32) ValueCell!9179)) (size!26742 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54683)

(declare-fun e!514903 () Bool)

(declare-fun array_inv!20604 (array!54683) Bool)

(assert (=> start!78768 (and (array_inv!20604 _values!1231) e!514903)))

(assert (=> start!78768 tp!58881))

(declare-fun array_inv!20605 (array!54681) Bool)

(assert (=> start!78768 (array_inv!20605 _keys!1487)))

(assert (=> start!78768 tp_is_empty!19321))

(declare-fun mapIsEmpty!30738 () Bool)

(declare-fun mapRes!30738 () Bool)

(assert (=> mapIsEmpty!30738 mapRes!30738))

(declare-fun b!917157 () Bool)

(declare-fun res!618042 () Bool)

(assert (=> b!917157 (=> (not res!618042) (not e!514901))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54681 (_ BitVec 32)) Bool)

(assert (=> b!917157 (= res!618042 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917158 () Bool)

(declare-fun res!618040 () Bool)

(assert (=> b!917158 (=> (not res!618040) (not e!514901))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30727)

(declare-fun minValue!1173 () V!30727)

(declare-datatypes ((tuple2!12562 0))(
  ( (tuple2!12563 (_1!6292 (_ BitVec 64)) (_2!6292 V!30727)) )
))
(declare-datatypes ((List!18394 0))(
  ( (Nil!18391) (Cons!18390 (h!19542 tuple2!12562) (t!25999 List!18394)) )
))
(declare-datatypes ((ListLongMap!11261 0))(
  ( (ListLongMap!11262 (toList!5646 List!18394)) )
))
(declare-fun contains!4708 (ListLongMap!11261 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2905 (array!54681 array!54683 (_ BitVec 32) (_ BitVec 32) V!30727 V!30727 (_ BitVec 32) Int) ListLongMap!11261)

(assert (=> b!917158 (= res!618040 (contains!4708 (getCurrentListMap!2905 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(declare-fun b!917159 () Bool)

(assert (=> b!917159 (= e!514903 (and e!514902 mapRes!30738))))

(declare-fun condMapEmpty!30738 () Bool)

(declare-fun mapDefault!30738 () ValueCell!9179)

(assert (=> b!917159 (= condMapEmpty!30738 (= (arr!26282 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9179)) mapDefault!30738)))))

(declare-fun b!917160 () Bool)

(declare-fun res!618037 () Bool)

(assert (=> b!917160 (=> (not res!618037) (not e!514901))))

(assert (=> b!917160 (= res!618037 (and (= (size!26742 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26741 _keys!1487) (size!26742 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!30738 () Bool)

(declare-fun tp!58880 () Bool)

(declare-fun e!514900 () Bool)

(assert (=> mapNonEmpty!30738 (= mapRes!30738 (and tp!58880 e!514900))))

(declare-fun mapRest!30738 () (Array (_ BitVec 32) ValueCell!9179))

(declare-fun mapValue!30738 () ValueCell!9179)

(declare-fun mapKey!30738 () (_ BitVec 32))

(assert (=> mapNonEmpty!30738 (= (arr!26282 _values!1231) (store mapRest!30738 mapKey!30738 mapValue!30738))))

(declare-fun b!917161 () Bool)

(assert (=> b!917161 (= e!514900 tp_is_empty!19321)))

(declare-fun b!917162 () Bool)

(declare-fun res!618039 () Bool)

(assert (=> b!917162 (=> (not res!618039) (not e!514901))))

(declare-datatypes ((List!18395 0))(
  ( (Nil!18392) (Cons!18391 (h!19543 (_ BitVec 64)) (t!26000 List!18395)) )
))
(declare-fun arrayNoDuplicates!0 (array!54681 (_ BitVec 32) List!18395) Bool)

(assert (=> b!917162 (= res!618039 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18392))))

(assert (= (and start!78768 res!618038) b!917160))

(assert (= (and b!917160 res!618037) b!917157))

(assert (= (and b!917157 res!618042) b!917162))

(assert (= (and b!917162 res!618039) b!917154))

(assert (= (and b!917154 res!618041) b!917158))

(assert (= (and b!917158 res!618040) b!917156))

(assert (= (and b!917159 condMapEmpty!30738) mapIsEmpty!30738))

(assert (= (and b!917159 (not condMapEmpty!30738)) mapNonEmpty!30738))

(get-info :version)

(assert (= (and mapNonEmpty!30738 ((_ is ValueCellFull!9179) mapValue!30738)) b!917161))

(assert (= (and b!917159 ((_ is ValueCellFull!9179) mapDefault!30738)) b!917155))

(assert (= start!78768 b!917159))

(declare-fun m!851641 () Bool)

(assert (=> start!78768 m!851641))

(declare-fun m!851643 () Bool)

(assert (=> start!78768 m!851643))

(declare-fun m!851645 () Bool)

(assert (=> start!78768 m!851645))

(declare-fun m!851647 () Bool)

(assert (=> b!917158 m!851647))

(assert (=> b!917158 m!851647))

(declare-fun m!851649 () Bool)

(assert (=> b!917158 m!851649))

(declare-fun m!851651 () Bool)

(assert (=> b!917157 m!851651))

(declare-fun m!851653 () Bool)

(assert (=> mapNonEmpty!30738 m!851653))

(declare-fun m!851655 () Bool)

(assert (=> b!917162 m!851655))

(check-sat b_and!27445 (not mapNonEmpty!30738) (not b!917162) (not b_next!16813) (not start!78768) tp_is_empty!19321 (not b!917157) (not b!917158))
(check-sat b_and!27445 (not b_next!16813))
