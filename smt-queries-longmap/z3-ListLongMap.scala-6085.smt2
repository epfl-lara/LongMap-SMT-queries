; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78600 () Bool)

(assert start!78600)

(declare-fun b_free!16831 () Bool)

(declare-fun b_next!16831 () Bool)

(assert (=> start!78600 (= b_free!16831 (not b_next!16831))))

(declare-fun tp!58934 () Bool)

(declare-fun b_and!27427 () Bool)

(assert (=> start!78600 (= tp!58934 b_and!27427)))

(declare-fun b!916246 () Bool)

(declare-fun res!617740 () Bool)

(declare-fun e!514318 () Bool)

(assert (=> b!916246 (=> (not res!617740) (not e!514318))))

(declare-datatypes ((array!54655 0))(
  ( (array!54656 (arr!26273 (Array (_ BitVec 32) (_ BitVec 64))) (size!26734 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54655)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((V!30751 0))(
  ( (V!30752 (val!9720 Int)) )
))
(declare-datatypes ((ValueCell!9188 0))(
  ( (ValueCellFull!9188 (v!12237 V!30751)) (EmptyCell!9188) )
))
(declare-datatypes ((array!54657 0))(
  ( (array!54658 (arr!26274 (Array (_ BitVec 32) ValueCell!9188)) (size!26735 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54657)

(declare-fun mask!1881 () (_ BitVec 32))

(assert (=> b!916246 (= res!617740 (and (= (size!26735 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26734 _keys!1487) (size!26735 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916247 () Bool)

(declare-fun e!514315 () Bool)

(declare-fun tp_is_empty!19339 () Bool)

(assert (=> b!916247 (= e!514315 tp_is_empty!19339)))

(declare-fun b!916248 () Bool)

(declare-fun res!617738 () Bool)

(assert (=> b!916248 (=> (not res!617738) (not e!514318))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54655 (_ BitVec 32)) Bool)

(assert (=> b!916248 (= res!617738 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916249 () Bool)

(declare-fun e!514320 () Bool)

(declare-fun mapRes!30765 () Bool)

(assert (=> b!916249 (= e!514320 (and e!514315 mapRes!30765))))

(declare-fun condMapEmpty!30765 () Bool)

(declare-fun mapDefault!30765 () ValueCell!9188)

(assert (=> b!916249 (= condMapEmpty!30765 (= (arr!26274 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9188)) mapDefault!30765)))))

(declare-fun b!916250 () Bool)

(declare-fun e!514319 () Bool)

(assert (=> b!916250 (= e!514319 false)))

(declare-fun lt!411566 () V!30751)

(declare-datatypes ((tuple2!12656 0))(
  ( (tuple2!12657 (_1!6339 (_ BitVec 64)) (_2!6339 V!30751)) )
))
(declare-datatypes ((List!18452 0))(
  ( (Nil!18449) (Cons!18448 (h!19594 tuple2!12656) (t!26056 List!18452)) )
))
(declare-datatypes ((ListLongMap!11343 0))(
  ( (ListLongMap!11344 (toList!5687 List!18452)) )
))
(declare-fun lt!411565 () ListLongMap!11343)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!531 (ListLongMap!11343 (_ BitVec 64)) V!30751)

(assert (=> b!916250 (= lt!411566 (apply!531 lt!411565 k0!1099))))

(declare-fun b!916251 () Bool)

(declare-fun res!617736 () Bool)

(assert (=> b!916251 (=> (not res!617736) (not e!514318))))

(declare-datatypes ((List!18453 0))(
  ( (Nil!18450) (Cons!18449 (h!19595 (_ BitVec 64)) (t!26057 List!18453)) )
))
(declare-fun arrayNoDuplicates!0 (array!54655 (_ BitVec 32) List!18453) Bool)

(assert (=> b!916251 (= res!617736 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18450))))

(declare-fun b!916252 () Bool)

(assert (=> b!916252 (= e!514318 e!514319)))

(declare-fun res!617739 () Bool)

(assert (=> b!916252 (=> (not res!617739) (not e!514319))))

(declare-fun contains!4697 (ListLongMap!11343 (_ BitVec 64)) Bool)

(assert (=> b!916252 (= res!617739 (contains!4697 lt!411565 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30751)

(declare-fun minValue!1173 () V!30751)

(declare-fun getCurrentListMap!2886 (array!54655 array!54657 (_ BitVec 32) (_ BitVec 32) V!30751 V!30751 (_ BitVec 32) Int) ListLongMap!11343)

(assert (=> b!916252 (= lt!411565 (getCurrentListMap!2886 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!916253 () Bool)

(declare-fun res!617737 () Bool)

(assert (=> b!916253 (=> (not res!617737) (not e!514318))))

(assert (=> b!916253 (= res!617737 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26734 _keys!1487))))))

(declare-fun res!617741 () Bool)

(assert (=> start!78600 (=> (not res!617741) (not e!514318))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78600 (= res!617741 (validMask!0 mask!1881))))

(assert (=> start!78600 e!514318))

(assert (=> start!78600 true))

(declare-fun array_inv!20576 (array!54657) Bool)

(assert (=> start!78600 (and (array_inv!20576 _values!1231) e!514320)))

(assert (=> start!78600 tp!58934))

(declare-fun array_inv!20577 (array!54655) Bool)

(assert (=> start!78600 (array_inv!20577 _keys!1487)))

(assert (=> start!78600 tp_is_empty!19339))

(declare-fun mapIsEmpty!30765 () Bool)

(assert (=> mapIsEmpty!30765 mapRes!30765))

(declare-fun mapNonEmpty!30765 () Bool)

(declare-fun tp!58935 () Bool)

(declare-fun e!514317 () Bool)

(assert (=> mapNonEmpty!30765 (= mapRes!30765 (and tp!58935 e!514317))))

(declare-fun mapRest!30765 () (Array (_ BitVec 32) ValueCell!9188))

(declare-fun mapKey!30765 () (_ BitVec 32))

(declare-fun mapValue!30765 () ValueCell!9188)

(assert (=> mapNonEmpty!30765 (= (arr!26274 _values!1231) (store mapRest!30765 mapKey!30765 mapValue!30765))))

(declare-fun b!916254 () Bool)

(assert (=> b!916254 (= e!514317 tp_is_empty!19339)))

(assert (= (and start!78600 res!617741) b!916246))

(assert (= (and b!916246 res!617740) b!916248))

(assert (= (and b!916248 res!617738) b!916251))

(assert (= (and b!916251 res!617736) b!916253))

(assert (= (and b!916253 res!617737) b!916252))

(assert (= (and b!916252 res!617739) b!916250))

(assert (= (and b!916249 condMapEmpty!30765) mapIsEmpty!30765))

(assert (= (and b!916249 (not condMapEmpty!30765)) mapNonEmpty!30765))

(get-info :version)

(assert (= (and mapNonEmpty!30765 ((_ is ValueCellFull!9188) mapValue!30765)) b!916254))

(assert (= (and b!916249 ((_ is ValueCellFull!9188) mapDefault!30765)) b!916247))

(assert (= start!78600 b!916249))

(declare-fun m!849739 () Bool)

(assert (=> b!916251 m!849739))

(declare-fun m!849741 () Bool)

(assert (=> b!916248 m!849741))

(declare-fun m!849743 () Bool)

(assert (=> b!916250 m!849743))

(declare-fun m!849745 () Bool)

(assert (=> start!78600 m!849745))

(declare-fun m!849747 () Bool)

(assert (=> start!78600 m!849747))

(declare-fun m!849749 () Bool)

(assert (=> start!78600 m!849749))

(declare-fun m!849751 () Bool)

(assert (=> b!916252 m!849751))

(declare-fun m!849753 () Bool)

(assert (=> b!916252 m!849753))

(declare-fun m!849755 () Bool)

(assert (=> mapNonEmpty!30765 m!849755))

(check-sat (not b!916248) tp_is_empty!19339 (not mapNonEmpty!30765) (not b_next!16831) (not start!78600) b_and!27427 (not b!916251) (not b!916252) (not b!916250))
(check-sat b_and!27427 (not b_next!16831))
