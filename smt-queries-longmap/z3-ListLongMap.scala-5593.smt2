; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73510 () Bool)

(assert start!73510)

(declare-fun b_free!14257 () Bool)

(declare-fun b_next!14257 () Bool)

(assert (=> start!73510 (= b_free!14257 (not b_next!14257))))

(declare-fun tp!50276 () Bool)

(declare-fun b_and!23623 () Bool)

(assert (=> start!73510 (= tp!50276 b_and!23623)))

(declare-fun b!856669 () Bool)

(declare-fun e!477651 () Bool)

(assert (=> b!856669 (= e!477651 false)))

(declare-datatypes ((V!26905 0))(
  ( (V!26906 (val!8244 Int)) )
))
(declare-fun v!557 () V!26905)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10786 0))(
  ( (tuple2!10787 (_1!5404 (_ BitVec 64)) (_2!5404 V!26905)) )
))
(declare-datatypes ((List!16632 0))(
  ( (Nil!16629) (Cons!16628 (h!17765 tuple2!10786) (t!23265 List!16632)) )
))
(declare-datatypes ((ListLongMap!9557 0))(
  ( (ListLongMap!9558 (toList!4794 List!16632)) )
))
(declare-fun lt!386120 () ListLongMap!9557)

(declare-datatypes ((array!49027 0))(
  ( (array!49028 (arr!23540 (Array (_ BitVec 32) (_ BitVec 64))) (size!23981 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49027)

(declare-datatypes ((ValueCell!7757 0))(
  ( (ValueCellFull!7757 (v!10669 V!26905)) (EmptyCell!7757) )
))
(declare-datatypes ((array!49029 0))(
  ( (array!49030 (arr!23541 (Array (_ BitVec 32) ValueCell!7757)) (size!23982 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49029)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26905)

(declare-fun zeroValue!654 () V!26905)

(declare-fun getCurrentListMapNoExtraKeys!2850 (array!49027 array!49029 (_ BitVec 32) (_ BitVec 32) V!26905 V!26905 (_ BitVec 32) Int) ListLongMap!9557)

(assert (=> b!856669 (= lt!386120 (getCurrentListMapNoExtraKeys!2850 _keys!868 (array!49030 (store (arr!23541 _values!688) i!612 (ValueCellFull!7757 v!557)) (size!23982 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!386119 () ListLongMap!9557)

(assert (=> b!856669 (= lt!386119 (getCurrentListMapNoExtraKeys!2850 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!856670 () Bool)

(declare-fun res!581542 () Bool)

(assert (=> b!856670 (=> (not res!581542) (not e!477651))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!856670 (= res!581542 (validMask!0 mask!1196))))

(declare-fun b!856671 () Bool)

(declare-fun res!581540 () Bool)

(assert (=> b!856671 (=> (not res!581540) (not e!477651))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49027 (_ BitVec 32)) Bool)

(assert (=> b!856671 (= res!581540 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!856672 () Bool)

(declare-fun e!477654 () Bool)

(declare-fun tp_is_empty!16393 () Bool)

(assert (=> b!856672 (= e!477654 tp_is_empty!16393)))

(declare-fun b!856673 () Bool)

(declare-fun e!477653 () Bool)

(assert (=> b!856673 (= e!477653 tp_is_empty!16393)))

(declare-fun mapIsEmpty!26189 () Bool)

(declare-fun mapRes!26189 () Bool)

(assert (=> mapIsEmpty!26189 mapRes!26189))

(declare-fun b!856674 () Bool)

(declare-fun res!581539 () Bool)

(assert (=> b!856674 (=> (not res!581539) (not e!477651))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!856674 (= res!581539 (and (= (select (arr!23540 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!856675 () Bool)

(declare-fun res!581538 () Bool)

(assert (=> b!856675 (=> (not res!581538) (not e!477651))))

(declare-datatypes ((List!16633 0))(
  ( (Nil!16630) (Cons!16629 (h!17766 (_ BitVec 64)) (t!23266 List!16633)) )
))
(declare-fun arrayNoDuplicates!0 (array!49027 (_ BitVec 32) List!16633) Bool)

(assert (=> b!856675 (= res!581538 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16630))))

(declare-fun mapNonEmpty!26189 () Bool)

(declare-fun tp!50275 () Bool)

(assert (=> mapNonEmpty!26189 (= mapRes!26189 (and tp!50275 e!477653))))

(declare-fun mapKey!26189 () (_ BitVec 32))

(declare-fun mapValue!26189 () ValueCell!7757)

(declare-fun mapRest!26189 () (Array (_ BitVec 32) ValueCell!7757))

(assert (=> mapNonEmpty!26189 (= (arr!23541 _values!688) (store mapRest!26189 mapKey!26189 mapValue!26189))))

(declare-fun res!581545 () Bool)

(assert (=> start!73510 (=> (not res!581545) (not e!477651))))

(assert (=> start!73510 (= res!581545 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23981 _keys!868))))))

(assert (=> start!73510 e!477651))

(assert (=> start!73510 tp_is_empty!16393))

(assert (=> start!73510 true))

(assert (=> start!73510 tp!50276))

(declare-fun array_inv!18700 (array!49027) Bool)

(assert (=> start!73510 (array_inv!18700 _keys!868)))

(declare-fun e!477652 () Bool)

(declare-fun array_inv!18701 (array!49029) Bool)

(assert (=> start!73510 (and (array_inv!18701 _values!688) e!477652)))

(declare-fun b!856676 () Bool)

(assert (=> b!856676 (= e!477652 (and e!477654 mapRes!26189))))

(declare-fun condMapEmpty!26189 () Bool)

(declare-fun mapDefault!26189 () ValueCell!7757)

(assert (=> b!856676 (= condMapEmpty!26189 (= (arr!23541 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7757)) mapDefault!26189)))))

(declare-fun b!856677 () Bool)

(declare-fun res!581541 () Bool)

(assert (=> b!856677 (=> (not res!581541) (not e!477651))))

(assert (=> b!856677 (= res!581541 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23981 _keys!868))))))

(declare-fun b!856678 () Bool)

(declare-fun res!581544 () Bool)

(assert (=> b!856678 (=> (not res!581544) (not e!477651))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!856678 (= res!581544 (validKeyInArray!0 k0!854))))

(declare-fun b!856679 () Bool)

(declare-fun res!581543 () Bool)

(assert (=> b!856679 (=> (not res!581543) (not e!477651))))

(assert (=> b!856679 (= res!581543 (and (= (size!23982 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23981 _keys!868) (size!23982 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73510 res!581545) b!856670))

(assert (= (and b!856670 res!581542) b!856679))

(assert (= (and b!856679 res!581543) b!856671))

(assert (= (and b!856671 res!581540) b!856675))

(assert (= (and b!856675 res!581538) b!856677))

(assert (= (and b!856677 res!581541) b!856678))

(assert (= (and b!856678 res!581544) b!856674))

(assert (= (and b!856674 res!581539) b!856669))

(assert (= (and b!856676 condMapEmpty!26189) mapIsEmpty!26189))

(assert (= (and b!856676 (not condMapEmpty!26189)) mapNonEmpty!26189))

(get-info :version)

(assert (= (and mapNonEmpty!26189 ((_ is ValueCellFull!7757) mapValue!26189)) b!856673))

(assert (= (and b!856676 ((_ is ValueCellFull!7757) mapDefault!26189)) b!856672))

(assert (= start!73510 b!856676))

(declare-fun m!798149 () Bool)

(assert (=> b!856675 m!798149))

(declare-fun m!798151 () Bool)

(assert (=> b!856678 m!798151))

(declare-fun m!798153 () Bool)

(assert (=> start!73510 m!798153))

(declare-fun m!798155 () Bool)

(assert (=> start!73510 m!798155))

(declare-fun m!798157 () Bool)

(assert (=> b!856670 m!798157))

(declare-fun m!798159 () Bool)

(assert (=> b!856669 m!798159))

(declare-fun m!798161 () Bool)

(assert (=> b!856669 m!798161))

(declare-fun m!798163 () Bool)

(assert (=> b!856669 m!798163))

(declare-fun m!798165 () Bool)

(assert (=> b!856674 m!798165))

(declare-fun m!798167 () Bool)

(assert (=> b!856671 m!798167))

(declare-fun m!798169 () Bool)

(assert (=> mapNonEmpty!26189 m!798169))

(check-sat (not b!856670) tp_is_empty!16393 (not mapNonEmpty!26189) (not b!856671) b_and!23623 (not b_next!14257) (not b!856675) (not start!73510) (not b!856678) (not b!856669))
(check-sat b_and!23623 (not b_next!14257))
