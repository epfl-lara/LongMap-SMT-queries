; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74274 () Bool)

(assert start!74274)

(declare-fun b_free!15037 () Bool)

(declare-fun b_next!15037 () Bool)

(assert (=> start!74274 (= b_free!15037 (not b_next!15037))))

(declare-fun tp!52786 () Bool)

(declare-fun b_and!24813 () Bool)

(assert (=> start!74274 (= tp!52786 b_and!24813)))

(declare-fun b!873785 () Bool)

(declare-fun res!593773 () Bool)

(declare-fun e!486575 () Bool)

(assert (=> b!873785 (=> (not res!593773) (not e!486575))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!50690 0))(
  ( (array!50691 (arr!24373 (Array (_ BitVec 32) (_ BitVec 64))) (size!24813 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50690)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!873785 (= res!593773 (and (= (select (arr!24373 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!873786 () Bool)

(declare-fun res!593777 () Bool)

(assert (=> b!873786 (=> (not res!593777) (not e!486575))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873786 (= res!593777 (validMask!0 mask!1196))))

(declare-fun res!593771 () Bool)

(assert (=> start!74274 (=> (not res!593771) (not e!486575))))

(assert (=> start!74274 (= res!593771 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24813 _keys!868))))))

(assert (=> start!74274 e!486575))

(declare-fun tp_is_empty!17281 () Bool)

(assert (=> start!74274 tp_is_empty!17281))

(assert (=> start!74274 true))

(assert (=> start!74274 tp!52786))

(declare-fun array_inv!19228 (array!50690) Bool)

(assert (=> start!74274 (array_inv!19228 _keys!868)))

(declare-datatypes ((V!28089 0))(
  ( (V!28090 (val!8688 Int)) )
))
(declare-datatypes ((ValueCell!8201 0))(
  ( (ValueCellFull!8201 (v!11117 V!28089)) (EmptyCell!8201) )
))
(declare-datatypes ((array!50692 0))(
  ( (array!50693 (arr!24374 (Array (_ BitVec 32) ValueCell!8201)) (size!24814 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50692)

(declare-fun e!486571 () Bool)

(declare-fun array_inv!19229 (array!50692) Bool)

(assert (=> start!74274 (and (array_inv!19229 _values!688) e!486571)))

(declare-fun b!873787 () Bool)

(declare-fun res!593776 () Bool)

(assert (=> b!873787 (=> (not res!593776) (not e!486575))))

(assert (=> b!873787 (= res!593776 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24813 _keys!868))))))

(declare-fun b!873788 () Bool)

(declare-fun e!486574 () Bool)

(assert (=> b!873788 (= e!486574 tp_is_empty!17281)))

(declare-fun b!873789 () Bool)

(declare-fun res!593774 () Bool)

(assert (=> b!873789 (=> (not res!593774) (not e!486575))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(assert (=> b!873789 (= res!593774 (and (= (size!24814 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24813 _keys!868) (size!24814 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873790 () Bool)

(declare-fun res!593775 () Bool)

(assert (=> b!873790 (=> (not res!593775) (not e!486575))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50690 (_ BitVec 32)) Bool)

(assert (=> b!873790 (= res!593775 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!27530 () Bool)

(declare-fun mapRes!27530 () Bool)

(assert (=> mapIsEmpty!27530 mapRes!27530))

(declare-fun b!873791 () Bool)

(assert (=> b!873791 (= e!486575 false)))

(declare-datatypes ((tuple2!11482 0))(
  ( (tuple2!11483 (_1!5752 (_ BitVec 64)) (_2!5752 V!28089)) )
))
(declare-datatypes ((List!17300 0))(
  ( (Nil!17297) (Cons!17296 (h!18427 tuple2!11482) (t!24341 List!17300)) )
))
(declare-datatypes ((ListLongMap!10251 0))(
  ( (ListLongMap!10252 (toList!5141 List!17300)) )
))
(declare-fun lt!395824 () ListLongMap!10251)

(declare-fun v!557 () V!28089)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28089)

(declare-fun zeroValue!654 () V!28089)

(declare-fun getCurrentListMapNoExtraKeys!3108 (array!50690 array!50692 (_ BitVec 32) (_ BitVec 32) V!28089 V!28089 (_ BitVec 32) Int) ListLongMap!10251)

(assert (=> b!873791 (= lt!395824 (getCurrentListMapNoExtraKeys!3108 _keys!868 (array!50693 (store (arr!24374 _values!688) i!612 (ValueCellFull!8201 v!557)) (size!24814 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395825 () ListLongMap!10251)

(assert (=> b!873791 (= lt!395825 (getCurrentListMapNoExtraKeys!3108 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!873792 () Bool)

(declare-fun res!593772 () Bool)

(assert (=> b!873792 (=> (not res!593772) (not e!486575))))

(declare-datatypes ((List!17301 0))(
  ( (Nil!17298) (Cons!17297 (h!18428 (_ BitVec 64)) (t!24342 List!17301)) )
))
(declare-fun arrayNoDuplicates!0 (array!50690 (_ BitVec 32) List!17301) Bool)

(assert (=> b!873792 (= res!593772 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17298))))

(declare-fun mapNonEmpty!27530 () Bool)

(declare-fun tp!52785 () Bool)

(assert (=> mapNonEmpty!27530 (= mapRes!27530 (and tp!52785 e!486574))))

(declare-fun mapKey!27530 () (_ BitVec 32))

(declare-fun mapRest!27530 () (Array (_ BitVec 32) ValueCell!8201))

(declare-fun mapValue!27530 () ValueCell!8201)

(assert (=> mapNonEmpty!27530 (= (arr!24374 _values!688) (store mapRest!27530 mapKey!27530 mapValue!27530))))

(declare-fun b!873793 () Bool)

(declare-fun e!486572 () Bool)

(assert (=> b!873793 (= e!486571 (and e!486572 mapRes!27530))))

(declare-fun condMapEmpty!27530 () Bool)

(declare-fun mapDefault!27530 () ValueCell!8201)

