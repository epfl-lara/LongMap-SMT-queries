; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78720 () Bool)

(assert start!78720)

(declare-fun b_free!16765 () Bool)

(declare-fun b_next!16765 () Bool)

(assert (=> start!78720 (= b_free!16765 (not b_next!16765))))

(declare-fun tp!58737 () Bool)

(declare-fun b_and!27397 () Bool)

(assert (=> start!78720 (= tp!58737 b_and!27397)))

(declare-fun b!916576 () Bool)

(declare-fun res!617677 () Bool)

(declare-fun e!514539 () Bool)

(assert (=> b!916576 (=> (not res!617677) (not e!514539))))

(declare-datatypes ((array!54591 0))(
  ( (array!54592 (arr!26236 (Array (_ BitVec 32) (_ BitVec 64))) (size!26696 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54591)

(declare-datatypes ((List!18365 0))(
  ( (Nil!18362) (Cons!18361 (h!19513 (_ BitVec 64)) (t!25970 List!18365)) )
))
(declare-fun arrayNoDuplicates!0 (array!54591 (_ BitVec 32) List!18365) Bool)

(assert (=> b!916576 (= res!617677 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18362))))

(declare-fun b!916577 () Bool)

(declare-fun res!617675 () Bool)

(assert (=> b!916577 (=> (not res!617675) (not e!514539))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54591 (_ BitVec 32)) Bool)

(assert (=> b!916577 (= res!617675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!916578 () Bool)

(declare-fun e!514542 () Bool)

(declare-fun tp_is_empty!19273 () Bool)

(assert (=> b!916578 (= e!514542 tp_is_empty!19273)))

(declare-fun b!916579 () Bool)

(declare-fun res!617679 () Bool)

(assert (=> b!916579 (=> (not res!617679) (not e!514539))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!916579 (= res!617679 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26696 _keys!1487))))))

(declare-fun res!617676 () Bool)

(assert (=> start!78720 (=> (not res!617676) (not e!514539))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78720 (= res!617676 (validMask!0 mask!1881))))

(assert (=> start!78720 e!514539))

(assert (=> start!78720 true))

(declare-datatypes ((V!30663 0))(
  ( (V!30664 (val!9687 Int)) )
))
(declare-datatypes ((ValueCell!9155 0))(
  ( (ValueCellFull!9155 (v!12202 V!30663)) (EmptyCell!9155) )
))
(declare-datatypes ((array!54593 0))(
  ( (array!54594 (arr!26237 (Array (_ BitVec 32) ValueCell!9155)) (size!26697 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54593)

(declare-fun e!514541 () Bool)

(declare-fun array_inv!20574 (array!54593) Bool)

(assert (=> start!78720 (and (array_inv!20574 _values!1231) e!514541)))

(assert (=> start!78720 tp!58737))

(declare-fun array_inv!20575 (array!54591) Bool)

(assert (=> start!78720 (array_inv!20575 _keys!1487)))

(assert (=> start!78720 tp_is_empty!19273))

(declare-fun b!916580 () Bool)

(declare-fun e!514543 () Bool)

(declare-fun mapRes!30666 () Bool)

(assert (=> b!916580 (= e!514541 (and e!514543 mapRes!30666))))

(declare-fun condMapEmpty!30666 () Bool)

(declare-fun mapDefault!30666 () ValueCell!9155)

(assert (=> b!916580 (= condMapEmpty!30666 (= (arr!26237 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9155)) mapDefault!30666)))))

(declare-fun mapNonEmpty!30666 () Bool)

(declare-fun tp!58736 () Bool)

(assert (=> mapNonEmpty!30666 (= mapRes!30666 (and tp!58736 e!514542))))

(declare-fun mapValue!30666 () ValueCell!9155)

(declare-fun mapRest!30666 () (Array (_ BitVec 32) ValueCell!9155))

(declare-fun mapKey!30666 () (_ BitVec 32))

(assert (=> mapNonEmpty!30666 (= (arr!26237 _values!1231) (store mapRest!30666 mapKey!30666 mapValue!30666))))

(declare-fun mapIsEmpty!30666 () Bool)

(assert (=> mapIsEmpty!30666 mapRes!30666))

(declare-fun b!916581 () Bool)

(assert (=> b!916581 (= e!514543 tp_is_empty!19273)))

(declare-fun b!916582 () Bool)

(declare-fun res!617678 () Bool)

(assert (=> b!916582 (=> (not res!617678) (not e!514539))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!916582 (= res!617678 (and (= (size!26697 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26696 _keys!1487) (size!26697 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!916583 () Bool)

(assert (=> b!916583 (= e!514539 false)))

(declare-fun lt!412061 () Bool)

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!30663)

(declare-fun minValue!1173 () V!30663)

(declare-datatypes ((tuple2!12532 0))(
  ( (tuple2!12533 (_1!6277 (_ BitVec 64)) (_2!6277 V!30663)) )
))
(declare-datatypes ((List!18366 0))(
  ( (Nil!18363) (Cons!18362 (h!19514 tuple2!12532) (t!25971 List!18366)) )
))
(declare-datatypes ((ListLongMap!11231 0))(
  ( (ListLongMap!11232 (toList!5631 List!18366)) )
))
(declare-fun contains!4693 (ListLongMap!11231 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2890 (array!54591 array!54593 (_ BitVec 32) (_ BitVec 32) V!30663 V!30663 (_ BitVec 32) Int) ListLongMap!11231)

(assert (=> b!916583 (= lt!412061 (contains!4693 (getCurrentListMap!2890 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235) k0!1099))))

(assert (= (and start!78720 res!617676) b!916582))

(assert (= (and b!916582 res!617678) b!916577))

(assert (= (and b!916577 res!617675) b!916576))

(assert (= (and b!916576 res!617677) b!916579))

(assert (= (and b!916579 res!617679) b!916583))

(assert (= (and b!916580 condMapEmpty!30666) mapIsEmpty!30666))

(assert (= (and b!916580 (not condMapEmpty!30666)) mapNonEmpty!30666))

(get-info :version)

(assert (= (and mapNonEmpty!30666 ((_ is ValueCellFull!9155) mapValue!30666)) b!916578))

(assert (= (and b!916580 ((_ is ValueCellFull!9155) mapDefault!30666)) b!916581))

(assert (= start!78720 b!916580))

(declare-fun m!851257 () Bool)

(assert (=> b!916583 m!851257))

(assert (=> b!916583 m!851257))

(declare-fun m!851259 () Bool)

(assert (=> b!916583 m!851259))

(declare-fun m!851261 () Bool)

(assert (=> b!916576 m!851261))

(declare-fun m!851263 () Bool)

(assert (=> start!78720 m!851263))

(declare-fun m!851265 () Bool)

(assert (=> start!78720 m!851265))

(declare-fun m!851267 () Bool)

(assert (=> start!78720 m!851267))

(declare-fun m!851269 () Bool)

(assert (=> b!916577 m!851269))

(declare-fun m!851271 () Bool)

(assert (=> mapNonEmpty!30666 m!851271))

(check-sat (not b!916583) (not b!916576) (not mapNonEmpty!30666) (not start!78720) tp_is_empty!19273 b_and!27397 (not b_next!16765) (not b!916577))
(check-sat b_and!27397 (not b_next!16765))
