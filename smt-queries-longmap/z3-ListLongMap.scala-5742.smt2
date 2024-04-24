; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74448 () Bool)

(assert start!74448)

(declare-fun b_free!15043 () Bool)

(declare-fun b_next!15043 () Bool)

(assert (=> start!74448 (= b_free!15043 (not b_next!15043))))

(declare-fun tp!52805 () Bool)

(declare-fun b_and!24829 () Bool)

(assert (=> start!74448 (= tp!52805 b_and!24829)))

(declare-fun b!874787 () Bool)

(declare-fun e!487202 () Bool)

(declare-fun e!487201 () Bool)

(declare-fun mapRes!27539 () Bool)

(assert (=> b!874787 (= e!487202 (and e!487201 mapRes!27539))))

(declare-fun condMapEmpty!27539 () Bool)

(declare-datatypes ((V!28097 0))(
  ( (V!28098 (val!8691 Int)) )
))
(declare-datatypes ((ValueCell!8204 0))(
  ( (ValueCellFull!8204 (v!11120 V!28097)) (EmptyCell!8204) )
))
(declare-datatypes ((array!50757 0))(
  ( (array!50758 (arr!24402 (Array (_ BitVec 32) ValueCell!8204)) (size!24843 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50757)

(declare-fun mapDefault!27539 () ValueCell!8204)

(assert (=> b!874787 (= condMapEmpty!27539 (= (arr!24402 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8204)) mapDefault!27539)))))

(declare-fun b!874788 () Bool)

(declare-fun tp_is_empty!17287 () Bool)

(assert (=> b!874788 (= e!487201 tp_is_empty!17287)))

(declare-fun b!874790 () Bool)

(declare-fun res!594194 () Bool)

(declare-fun e!487198 () Bool)

(assert (=> b!874790 (=> (not res!594194) (not e!487198))))

(declare-datatypes ((array!50759 0))(
  ( (array!50760 (arr!24403 (Array (_ BitVec 32) (_ BitVec 64))) (size!24844 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50759)

(declare-datatypes ((List!17260 0))(
  ( (Nil!17257) (Cons!17256 (h!18393 (_ BitVec 64)) (t!24293 List!17260)) )
))
(declare-fun arrayNoDuplicates!0 (array!50759 (_ BitVec 32) List!17260) Bool)

(assert (=> b!874790 (= res!594194 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17257))))

(declare-fun b!874791 () Bool)

(declare-fun res!594191 () Bool)

(assert (=> b!874791 (=> (not res!594191) (not e!487198))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874791 (= res!594191 (validMask!0 mask!1196))))

(declare-fun b!874792 () Bool)

(declare-fun res!594192 () Bool)

(assert (=> b!874792 (=> (not res!594192) (not e!487198))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!874792 (= res!594192 (and (= (size!24843 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24844 _keys!868) (size!24843 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!27539 () Bool)

(declare-fun tp!52804 () Bool)

(declare-fun e!487199 () Bool)

(assert (=> mapNonEmpty!27539 (= mapRes!27539 (and tp!52804 e!487199))))

(declare-fun mapKey!27539 () (_ BitVec 32))

(declare-fun mapValue!27539 () ValueCell!8204)

(declare-fun mapRest!27539 () (Array (_ BitVec 32) ValueCell!8204))

(assert (=> mapNonEmpty!27539 (= (arr!24402 _values!688) (store mapRest!27539 mapKey!27539 mapValue!27539))))

(declare-fun b!874793 () Bool)

(declare-fun res!594189 () Bool)

(assert (=> b!874793 (=> (not res!594189) (not e!487198))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874793 (= res!594189 (and (= (select (arr!24403 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874794 () Bool)

(declare-fun res!594187 () Bool)

(assert (=> b!874794 (=> (not res!594187) (not e!487198))))

(assert (=> b!874794 (= res!594187 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24844 _keys!868))))))

(declare-fun mapIsEmpty!27539 () Bool)

(assert (=> mapIsEmpty!27539 mapRes!27539))

(declare-fun b!874795 () Bool)

(assert (=> b!874795 (= e!487198 false)))

(declare-fun v!557 () V!28097)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28097)

(declare-fun zeroValue!654 () V!28097)

(declare-datatypes ((tuple2!11412 0))(
  ( (tuple2!11413 (_1!5717 (_ BitVec 64)) (_2!5717 V!28097)) )
))
(declare-datatypes ((List!17261 0))(
  ( (Nil!17258) (Cons!17257 (h!18394 tuple2!11412) (t!24294 List!17261)) )
))
(declare-datatypes ((ListLongMap!10183 0))(
  ( (ListLongMap!10184 (toList!5107 List!17261)) )
))
(declare-fun lt!396203 () ListLongMap!10183)

(declare-fun getCurrentListMapNoExtraKeys!3150 (array!50759 array!50757 (_ BitVec 32) (_ BitVec 32) V!28097 V!28097 (_ BitVec 32) Int) ListLongMap!10183)

(assert (=> b!874795 (= lt!396203 (getCurrentListMapNoExtraKeys!3150 _keys!868 (array!50758 (store (arr!24402 _values!688) i!612 (ValueCellFull!8204 v!557)) (size!24843 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396204 () ListLongMap!10183)

(assert (=> b!874795 (= lt!396204 (getCurrentListMapNoExtraKeys!3150 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874796 () Bool)

(assert (=> b!874796 (= e!487199 tp_is_empty!17287)))

(declare-fun b!874797 () Bool)

(declare-fun res!594190 () Bool)

(assert (=> b!874797 (=> (not res!594190) (not e!487198))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50759 (_ BitVec 32)) Bool)

(assert (=> b!874797 (= res!594190 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!594193 () Bool)

(assert (=> start!74448 (=> (not res!594193) (not e!487198))))

(assert (=> start!74448 (= res!594193 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24844 _keys!868))))))

(assert (=> start!74448 e!487198))

(assert (=> start!74448 tp_is_empty!17287))

(assert (=> start!74448 true))

(assert (=> start!74448 tp!52805))

(declare-fun array_inv!19306 (array!50759) Bool)

(assert (=> start!74448 (array_inv!19306 _keys!868)))

(declare-fun array_inv!19307 (array!50757) Bool)

(assert (=> start!74448 (and (array_inv!19307 _values!688) e!487202)))

(declare-fun b!874789 () Bool)

(declare-fun res!594188 () Bool)

(assert (=> b!874789 (=> (not res!594188) (not e!487198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874789 (= res!594188 (validKeyInArray!0 k0!854))))

(assert (= (and start!74448 res!594193) b!874791))

(assert (= (and b!874791 res!594191) b!874792))

(assert (= (and b!874792 res!594192) b!874797))

(assert (= (and b!874797 res!594190) b!874790))

(assert (= (and b!874790 res!594194) b!874794))

(assert (= (and b!874794 res!594187) b!874789))

(assert (= (and b!874789 res!594188) b!874793))

(assert (= (and b!874793 res!594189) b!874795))

(assert (= (and b!874787 condMapEmpty!27539) mapIsEmpty!27539))

(assert (= (and b!874787 (not condMapEmpty!27539)) mapNonEmpty!27539))

(get-info :version)

(assert (= (and mapNonEmpty!27539 ((_ is ValueCellFull!8204) mapValue!27539)) b!874796))

(assert (= (and b!874787 ((_ is ValueCellFull!8204) mapDefault!27539)) b!874788))

(assert (= start!74448 b!874787))

(declare-fun m!815527 () Bool)

(assert (=> b!874789 m!815527))

(declare-fun m!815529 () Bool)

(assert (=> start!74448 m!815529))

(declare-fun m!815531 () Bool)

(assert (=> start!74448 m!815531))

(declare-fun m!815533 () Bool)

(assert (=> mapNonEmpty!27539 m!815533))

(declare-fun m!815535 () Bool)

(assert (=> b!874791 m!815535))

(declare-fun m!815537 () Bool)

(assert (=> b!874797 m!815537))

(declare-fun m!815539 () Bool)

(assert (=> b!874790 m!815539))

(declare-fun m!815541 () Bool)

(assert (=> b!874793 m!815541))

(declare-fun m!815543 () Bool)

(assert (=> b!874795 m!815543))

(declare-fun m!815545 () Bool)

(assert (=> b!874795 m!815545))

(declare-fun m!815547 () Bool)

(assert (=> b!874795 m!815547))

(check-sat (not start!74448) (not b!874789) b_and!24829 (not b!874790) tp_is_empty!17287 (not mapNonEmpty!27539) (not b!874795) (not b!874797) (not b!874791) (not b_next!15043))
(check-sat b_and!24829 (not b_next!15043))
