; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74436 () Bool)

(assert start!74436)

(declare-fun b_free!15031 () Bool)

(declare-fun b_next!15031 () Bool)

(assert (=> start!74436 (= b_free!15031 (not b_next!15031))))

(declare-fun tp!52769 () Bool)

(declare-fun b_and!24817 () Bool)

(assert (=> start!74436 (= tp!52769 b_and!24817)))

(declare-fun b!874589 () Bool)

(declare-fun e!487111 () Bool)

(declare-fun tp_is_empty!17275 () Bool)

(assert (=> b!874589 (= e!487111 tp_is_empty!17275)))

(declare-fun b!874590 () Bool)

(declare-fun e!487110 () Bool)

(declare-fun mapRes!27521 () Bool)

(assert (=> b!874590 (= e!487110 (and e!487111 mapRes!27521))))

(declare-fun condMapEmpty!27521 () Bool)

(declare-datatypes ((V!28081 0))(
  ( (V!28082 (val!8685 Int)) )
))
(declare-datatypes ((ValueCell!8198 0))(
  ( (ValueCellFull!8198 (v!11114 V!28081)) (EmptyCell!8198) )
))
(declare-datatypes ((array!50733 0))(
  ( (array!50734 (arr!24390 (Array (_ BitVec 32) ValueCell!8198)) (size!24831 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50733)

(declare-fun mapDefault!27521 () ValueCell!8198)

(assert (=> b!874590 (= condMapEmpty!27521 (= (arr!24390 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8198)) mapDefault!27521)))))

(declare-fun b!874591 () Bool)

(declare-fun res!594045 () Bool)

(declare-fun e!487109 () Bool)

(assert (=> b!874591 (=> (not res!594045) (not e!487109))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!874591 (= res!594045 (validKeyInArray!0 k0!854))))

(declare-fun b!874592 () Bool)

(declare-fun res!594046 () Bool)

(assert (=> b!874592 (=> (not res!594046) (not e!487109))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!50735 0))(
  ( (array!50736 (arr!24391 (Array (_ BitVec 32) (_ BitVec 64))) (size!24832 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50735)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!874592 (= res!594046 (and (= (select (arr!24391 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!874593 () Bool)

(declare-fun res!594047 () Bool)

(assert (=> b!874593 (=> (not res!594047) (not e!487109))))

(declare-datatypes ((List!17249 0))(
  ( (Nil!17246) (Cons!17245 (h!18382 (_ BitVec 64)) (t!24282 List!17249)) )
))
(declare-fun arrayNoDuplicates!0 (array!50735 (_ BitVec 32) List!17249) Bool)

(assert (=> b!874593 (= res!594047 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17246))))

(declare-fun b!874594 () Bool)

(declare-fun res!594043 () Bool)

(assert (=> b!874594 (=> (not res!594043) (not e!487109))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!874594 (= res!594043 (validMask!0 mask!1196))))

(declare-fun b!874595 () Bool)

(declare-fun res!594044 () Bool)

(assert (=> b!874595 (=> (not res!594044) (not e!487109))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50735 (_ BitVec 32)) Bool)

(assert (=> b!874595 (= res!594044 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!874596 () Bool)

(assert (=> b!874596 (= e!487109 (and (= from!1053 i!612) (or (bvslt (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsgt (bvadd #b00000000000000000000000000000001 from!1053) (size!24832 _keys!868)))))))

(declare-fun v!557 () V!28081)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28081)

(declare-fun zeroValue!654 () V!28081)

(declare-datatypes ((tuple2!11402 0))(
  ( (tuple2!11403 (_1!5712 (_ BitVec 64)) (_2!5712 V!28081)) )
))
(declare-datatypes ((List!17250 0))(
  ( (Nil!17247) (Cons!17246 (h!18383 tuple2!11402) (t!24283 List!17250)) )
))
(declare-datatypes ((ListLongMap!10173 0))(
  ( (ListLongMap!10174 (toList!5102 List!17250)) )
))
(declare-fun lt!396168 () ListLongMap!10173)

(declare-fun getCurrentListMapNoExtraKeys!3145 (array!50735 array!50733 (_ BitVec 32) (_ BitVec 32) V!28081 V!28081 (_ BitVec 32) Int) ListLongMap!10173)

(assert (=> b!874596 (= lt!396168 (getCurrentListMapNoExtraKeys!3145 _keys!868 (array!50734 (store (arr!24390 _values!688) i!612 (ValueCellFull!8198 v!557)) (size!24831 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396167 () ListLongMap!10173)

(assert (=> b!874596 (= lt!396167 (getCurrentListMapNoExtraKeys!3145 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!874597 () Bool)

(declare-fun res!594048 () Bool)

(assert (=> b!874597 (=> (not res!594048) (not e!487109))))

(assert (=> b!874597 (= res!594048 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24832 _keys!868))))))

(declare-fun mapNonEmpty!27521 () Bool)

(declare-fun tp!52768 () Bool)

(declare-fun e!487112 () Bool)

(assert (=> mapNonEmpty!27521 (= mapRes!27521 (and tp!52768 e!487112))))

(declare-fun mapRest!27521 () (Array (_ BitVec 32) ValueCell!8198))

(declare-fun mapKey!27521 () (_ BitVec 32))

(declare-fun mapValue!27521 () ValueCell!8198)

(assert (=> mapNonEmpty!27521 (= (arr!24390 _values!688) (store mapRest!27521 mapKey!27521 mapValue!27521))))

(declare-fun res!594050 () Bool)

(assert (=> start!74436 (=> (not res!594050) (not e!487109))))

(assert (=> start!74436 (= res!594050 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24832 _keys!868))))))

(assert (=> start!74436 e!487109))

(assert (=> start!74436 tp_is_empty!17275))

(assert (=> start!74436 true))

(assert (=> start!74436 tp!52769))

(declare-fun array_inv!19294 (array!50735) Bool)

(assert (=> start!74436 (array_inv!19294 _keys!868)))

(declare-fun array_inv!19295 (array!50733) Bool)

(assert (=> start!74436 (and (array_inv!19295 _values!688) e!487110)))

(declare-fun b!874598 () Bool)

(declare-fun res!594049 () Bool)

(assert (=> b!874598 (=> (not res!594049) (not e!487109))))

(assert (=> b!874598 (= res!594049 (and (= (size!24831 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24832 _keys!868) (size!24831 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!27521 () Bool)

(assert (=> mapIsEmpty!27521 mapRes!27521))

(declare-fun b!874599 () Bool)

(assert (=> b!874599 (= e!487112 tp_is_empty!17275)))

(assert (= (and start!74436 res!594050) b!874594))

(assert (= (and b!874594 res!594043) b!874598))

(assert (= (and b!874598 res!594049) b!874595))

(assert (= (and b!874595 res!594044) b!874593))

(assert (= (and b!874593 res!594047) b!874597))

(assert (= (and b!874597 res!594048) b!874591))

(assert (= (and b!874591 res!594045) b!874592))

(assert (= (and b!874592 res!594046) b!874596))

(assert (= (and b!874590 condMapEmpty!27521) mapIsEmpty!27521))

(assert (= (and b!874590 (not condMapEmpty!27521)) mapNonEmpty!27521))

(get-info :version)

(assert (= (and mapNonEmpty!27521 ((_ is ValueCellFull!8198) mapValue!27521)) b!874599))

(assert (= (and b!874590 ((_ is ValueCellFull!8198) mapDefault!27521)) b!874589))

(assert (= start!74436 b!874590))

(declare-fun m!815395 () Bool)

(assert (=> b!874592 m!815395))

(declare-fun m!815397 () Bool)

(assert (=> b!874591 m!815397))

(declare-fun m!815399 () Bool)

(assert (=> b!874593 m!815399))

(declare-fun m!815401 () Bool)

(assert (=> mapNonEmpty!27521 m!815401))

(declare-fun m!815403 () Bool)

(assert (=> b!874594 m!815403))

(declare-fun m!815405 () Bool)

(assert (=> start!74436 m!815405))

(declare-fun m!815407 () Bool)

(assert (=> start!74436 m!815407))

(declare-fun m!815409 () Bool)

(assert (=> b!874595 m!815409))

(declare-fun m!815411 () Bool)

(assert (=> b!874596 m!815411))

(declare-fun m!815413 () Bool)

(assert (=> b!874596 m!815413))

(declare-fun m!815415 () Bool)

(assert (=> b!874596 m!815415))

(check-sat (not start!74436) (not b!874594) (not mapNonEmpty!27521) (not b!874591) (not b!874596) (not b_next!15031) tp_is_empty!17275 (not b!874593) (not b!874595) b_and!24817)
(check-sat b_and!24817 (not b_next!15031))
