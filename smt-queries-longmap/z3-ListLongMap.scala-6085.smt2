; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78786 () Bool)

(assert start!78786)

(declare-fun b_free!16831 () Bool)

(declare-fun b_next!16831 () Bool)

(assert (=> start!78786 (= b_free!16831 (not b_next!16831))))

(declare-fun tp!58935 () Bool)

(declare-fun b_and!27463 () Bool)

(assert (=> start!78786 (= tp!58935 b_and!27463)))

(declare-fun b!917388 () Bool)

(declare-fun res!618190 () Bool)

(declare-fun e!515050 () Bool)

(assert (=> b!917388 (=> (not res!618190) (not e!515050))))

(declare-datatypes ((array!54715 0))(
  ( (array!54716 (arr!26298 (Array (_ BitVec 32) (_ BitVec 64))) (size!26758 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54715)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54715 (_ BitVec 32)) Bool)

(assert (=> b!917388 (= res!618190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!30765 () Bool)

(declare-fun mapRes!30765 () Bool)

(assert (=> mapIsEmpty!30765 mapRes!30765))

(declare-fun b!917389 () Bool)

(declare-fun res!618191 () Bool)

(assert (=> b!917389 (=> (not res!618191) (not e!515050))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30751 0))(
  ( (V!30752 (val!9720 Int)) )
))
(declare-datatypes ((ValueCell!9188 0))(
  ( (ValueCellFull!9188 (v!12235 V!30751)) (EmptyCell!9188) )
))
(declare-datatypes ((array!54717 0))(
  ( (array!54718 (arr!26299 (Array (_ BitVec 32) ValueCell!9188)) (size!26759 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54717)

(assert (=> b!917389 (= res!618191 (and (= (size!26759 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26758 _keys!1487) (size!26759 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917390 () Bool)

(declare-fun res!618193 () Bool)

(assert (=> b!917390 (=> (not res!618193) (not e!515050))))

(declare-datatypes ((List!18407 0))(
  ( (Nil!18404) (Cons!18403 (h!19555 (_ BitVec 64)) (t!26012 List!18407)) )
))
(declare-fun arrayNoDuplicates!0 (array!54715 (_ BitVec 32) List!18407) Bool)

(assert (=> b!917390 (= res!618193 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18404))))

(declare-fun b!917391 () Bool)

(declare-fun e!515046 () Bool)

(assert (=> b!917391 (= e!515050 e!515046)))

(declare-fun res!618192 () Bool)

(assert (=> b!917391 (=> (not res!618192) (not e!515046))))

(declare-datatypes ((tuple2!12578 0))(
  ( (tuple2!12579 (_1!6300 (_ BitVec 64)) (_2!6300 V!30751)) )
))
(declare-datatypes ((List!18408 0))(
  ( (Nil!18405) (Cons!18404 (h!19556 tuple2!12578) (t!26013 List!18408)) )
))
(declare-datatypes ((ListLongMap!11277 0))(
  ( (ListLongMap!11278 (toList!5654 List!18408)) )
))
(declare-fun lt!412162 () ListLongMap!11277)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4716 (ListLongMap!11277 (_ BitVec 64)) Bool)

(assert (=> b!917391 (= res!618192 (contains!4716 lt!412162 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun zeroValue!1173 () V!30751)

(declare-fun minValue!1173 () V!30751)

(declare-fun defaultEntry!1235 () Int)

(declare-fun getCurrentListMap!2913 (array!54715 array!54717 (_ BitVec 32) (_ BitVec 32) V!30751 V!30751 (_ BitVec 32) Int) ListLongMap!11277)

(assert (=> b!917391 (= lt!412162 (getCurrentListMap!2913 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917392 () Bool)

(declare-fun e!515045 () Bool)

(declare-fun tp_is_empty!19339 () Bool)

(assert (=> b!917392 (= e!515045 tp_is_empty!19339)))

(declare-fun b!917393 () Bool)

(declare-fun e!515047 () Bool)

(declare-fun e!515048 () Bool)

(assert (=> b!917393 (= e!515047 (and e!515048 mapRes!30765))))

(declare-fun condMapEmpty!30765 () Bool)

(declare-fun mapDefault!30765 () ValueCell!9188)

(assert (=> b!917393 (= condMapEmpty!30765 (= (arr!26299 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9188)) mapDefault!30765)))))

(declare-fun b!917394 () Bool)

(assert (=> b!917394 (= e!515046 false)))

(declare-fun lt!412163 () V!30751)

(declare-fun apply!539 (ListLongMap!11277 (_ BitVec 64)) V!30751)

(assert (=> b!917394 (= lt!412163 (apply!539 lt!412162 k0!1099))))

(declare-fun b!917395 () Bool)

(assert (=> b!917395 (= e!515048 tp_is_empty!19339)))

(declare-fun b!917396 () Bool)

(declare-fun res!618194 () Bool)

(assert (=> b!917396 (=> (not res!618194) (not e!515050))))

(assert (=> b!917396 (= res!618194 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26758 _keys!1487))))))

(declare-fun res!618195 () Bool)

(assert (=> start!78786 (=> (not res!618195) (not e!515050))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78786 (= res!618195 (validMask!0 mask!1881))))

(assert (=> start!78786 e!515050))

(assert (=> start!78786 true))

(declare-fun array_inv!20616 (array!54717) Bool)

(assert (=> start!78786 (and (array_inv!20616 _values!1231) e!515047)))

(assert (=> start!78786 tp!58935))

(declare-fun array_inv!20617 (array!54715) Bool)

(assert (=> start!78786 (array_inv!20617 _keys!1487)))

(assert (=> start!78786 tp_is_empty!19339))

(declare-fun mapNonEmpty!30765 () Bool)

(declare-fun tp!58934 () Bool)

(assert (=> mapNonEmpty!30765 (= mapRes!30765 (and tp!58934 e!515045))))

(declare-fun mapValue!30765 () ValueCell!9188)

(declare-fun mapKey!30765 () (_ BitVec 32))

(declare-fun mapRest!30765 () (Array (_ BitVec 32) ValueCell!9188))

(assert (=> mapNonEmpty!30765 (= (arr!26299 _values!1231) (store mapRest!30765 mapKey!30765 mapValue!30765))))

(assert (= (and start!78786 res!618195) b!917389))

(assert (= (and b!917389 res!618191) b!917388))

(assert (= (and b!917388 res!618190) b!917390))

(assert (= (and b!917390 res!618193) b!917396))

(assert (= (and b!917396 res!618194) b!917391))

(assert (= (and b!917391 res!618192) b!917394))

(assert (= (and b!917393 condMapEmpty!30765) mapIsEmpty!30765))

(assert (= (and b!917393 (not condMapEmpty!30765)) mapNonEmpty!30765))

(get-info :version)

(assert (= (and mapNonEmpty!30765 ((_ is ValueCellFull!9188) mapValue!30765)) b!917392))

(assert (= (and b!917393 ((_ is ValueCellFull!9188) mapDefault!30765)) b!917395))

(assert (= start!78786 b!917393))

(declare-fun m!851791 () Bool)

(assert (=> b!917391 m!851791))

(declare-fun m!851793 () Bool)

(assert (=> b!917391 m!851793))

(declare-fun m!851795 () Bool)

(assert (=> b!917394 m!851795))

(declare-fun m!851797 () Bool)

(assert (=> b!917390 m!851797))

(declare-fun m!851799 () Bool)

(assert (=> start!78786 m!851799))

(declare-fun m!851801 () Bool)

(assert (=> start!78786 m!851801))

(declare-fun m!851803 () Bool)

(assert (=> start!78786 m!851803))

(declare-fun m!851805 () Bool)

(assert (=> mapNonEmpty!30765 m!851805))

(declare-fun m!851807 () Bool)

(assert (=> b!917388 m!851807))

(check-sat (not start!78786) (not b!917388) b_and!27463 tp_is_empty!19339 (not mapNonEmpty!30765) (not b!917391) (not b!917394) (not b_next!16831) (not b!917390))
(check-sat b_and!27463 (not b_next!16831))
