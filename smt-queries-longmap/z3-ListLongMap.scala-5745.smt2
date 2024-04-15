; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74280 () Bool)

(assert start!74280)

(declare-fun b_free!15061 () Bool)

(declare-fun b_next!15061 () Bool)

(assert (=> start!74280 (= b_free!15061 (not b_next!15061))))

(declare-fun tp!52858 () Bool)

(declare-fun b_and!24811 () Bool)

(assert (=> start!74280 (= tp!52858 b_and!24811)))

(declare-fun b!873942 () Bool)

(declare-fun res!593955 () Bool)

(declare-fun e!486607 () Bool)

(assert (=> b!873942 (=> (not res!593955) (not e!486607))))

(declare-datatypes ((array!50723 0))(
  ( (array!50724 (arr!24390 (Array (_ BitVec 32) (_ BitVec 64))) (size!24832 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50723)

(declare-datatypes ((List!17319 0))(
  ( (Nil!17316) (Cons!17315 (h!18446 (_ BitVec 64)) (t!24351 List!17319)) )
))
(declare-fun arrayNoDuplicates!0 (array!50723 (_ BitVec 32) List!17319) Bool)

(assert (=> b!873942 (= res!593955 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17316))))

(declare-fun b!873943 () Bool)

(declare-fun res!593953 () Bool)

(assert (=> b!873943 (=> (not res!593953) (not e!486607))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50723 (_ BitVec 32)) Bool)

(assert (=> b!873943 (= res!593953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!873944 () Bool)

(declare-fun res!593950 () Bool)

(assert (=> b!873944 (=> (not res!593950) (not e!486607))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!28121 0))(
  ( (V!28122 (val!8700 Int)) )
))
(declare-datatypes ((ValueCell!8213 0))(
  ( (ValueCellFull!8213 (v!11123 V!28121)) (EmptyCell!8213) )
))
(declare-datatypes ((array!50725 0))(
  ( (array!50726 (arr!24391 (Array (_ BitVec 32) ValueCell!8213)) (size!24833 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50725)

(assert (=> b!873944 (= res!593950 (and (= (size!24833 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24832 _keys!868) (size!24833 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!873945 () Bool)

(declare-fun res!593951 () Bool)

(assert (=> b!873945 (=> (not res!593951) (not e!486607))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!873945 (= res!593951 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24832 _keys!868))))))

(declare-fun res!593956 () Bool)

(assert (=> start!74280 (=> (not res!593956) (not e!486607))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74280 (= res!593956 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24832 _keys!868))))))

(assert (=> start!74280 e!486607))

(declare-fun tp_is_empty!17305 () Bool)

(assert (=> start!74280 tp_is_empty!17305))

(assert (=> start!74280 true))

(assert (=> start!74280 tp!52858))

(declare-fun array_inv!19292 (array!50723) Bool)

(assert (=> start!74280 (array_inv!19292 _keys!868)))

(declare-fun e!486605 () Bool)

(declare-fun array_inv!19293 (array!50725) Bool)

(assert (=> start!74280 (and (array_inv!19293 _values!688) e!486605)))

(declare-fun b!873946 () Bool)

(declare-fun res!593954 () Bool)

(assert (=> b!873946 (=> (not res!593954) (not e!486607))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!873946 (= res!593954 (and (= (select (arr!24390 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!873947 () Bool)

(declare-fun e!486606 () Bool)

(declare-fun mapRes!27566 () Bool)

(assert (=> b!873947 (= e!486605 (and e!486606 mapRes!27566))))

(declare-fun condMapEmpty!27566 () Bool)

(declare-fun mapDefault!27566 () ValueCell!8213)

(assert (=> b!873947 (= condMapEmpty!27566 (= (arr!24391 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8213)) mapDefault!27566)))))

(declare-fun b!873948 () Bool)

(assert (=> b!873948 (= e!486606 tp_is_empty!17305)))

(declare-fun b!873949 () Bool)

(declare-fun res!593949 () Bool)

(assert (=> b!873949 (=> (not res!593949) (not e!486607))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!873949 (= res!593949 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!27566 () Bool)

(assert (=> mapIsEmpty!27566 mapRes!27566))

(declare-fun b!873950 () Bool)

(declare-fun e!486603 () Bool)

(assert (=> b!873950 (= e!486603 tp_is_empty!17305)))

(declare-fun mapNonEmpty!27566 () Bool)

(declare-fun tp!52859 () Bool)

(assert (=> mapNonEmpty!27566 (= mapRes!27566 (and tp!52859 e!486603))))

(declare-fun mapValue!27566 () ValueCell!8213)

(declare-fun mapKey!27566 () (_ BitVec 32))

(declare-fun mapRest!27566 () (Array (_ BitVec 32) ValueCell!8213))

(assert (=> mapNonEmpty!27566 (= (arr!24391 _values!688) (store mapRest!27566 mapKey!27566 mapValue!27566))))

(declare-fun b!873951 () Bool)

(declare-fun res!593952 () Bool)

(assert (=> b!873951 (=> (not res!593952) (not e!486607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873951 (= res!593952 (validMask!0 mask!1196))))

(declare-fun b!873952 () Bool)

(assert (=> b!873952 (= e!486607 false)))

(declare-fun v!557 () V!28121)

(declare-fun defaultEntry!696 () Int)

(declare-fun minValue!654 () V!28121)

(declare-fun zeroValue!654 () V!28121)

(declare-datatypes ((tuple2!11506 0))(
  ( (tuple2!11507 (_1!5764 (_ BitVec 64)) (_2!5764 V!28121)) )
))
(declare-datatypes ((List!17320 0))(
  ( (Nil!17317) (Cons!17316 (h!18447 tuple2!11506) (t!24352 List!17320)) )
))
(declare-datatypes ((ListLongMap!10265 0))(
  ( (ListLongMap!10266 (toList!5148 List!17320)) )
))
(declare-fun lt!395660 () ListLongMap!10265)

(declare-fun getCurrentListMapNoExtraKeys!3141 (array!50723 array!50725 (_ BitVec 32) (_ BitVec 32) V!28121 V!28121 (_ BitVec 32) Int) ListLongMap!10265)

(assert (=> b!873952 (= lt!395660 (getCurrentListMapNoExtraKeys!3141 _keys!868 (array!50726 (store (arr!24391 _values!688) i!612 (ValueCellFull!8213 v!557)) (size!24833 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!395661 () ListLongMap!10265)

(assert (=> b!873952 (= lt!395661 (getCurrentListMapNoExtraKeys!3141 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (= (and start!74280 res!593956) b!873951))

(assert (= (and b!873951 res!593952) b!873944))

(assert (= (and b!873944 res!593950) b!873943))

(assert (= (and b!873943 res!593953) b!873942))

(assert (= (and b!873942 res!593955) b!873945))

(assert (= (and b!873945 res!593951) b!873949))

(assert (= (and b!873949 res!593949) b!873946))

(assert (= (and b!873946 res!593954) b!873952))

(assert (= (and b!873947 condMapEmpty!27566) mapIsEmpty!27566))

(assert (= (and b!873947 (not condMapEmpty!27566)) mapNonEmpty!27566))

(get-info :version)

(assert (= (and mapNonEmpty!27566 ((_ is ValueCellFull!8213) mapValue!27566)) b!873950))

(assert (= (and b!873947 ((_ is ValueCellFull!8213) mapDefault!27566)) b!873948))

(assert (= start!74280 b!873947))

(declare-fun m!813677 () Bool)

(assert (=> mapNonEmpty!27566 m!813677))

(declare-fun m!813679 () Bool)

(assert (=> b!873951 m!813679))

(declare-fun m!813681 () Bool)

(assert (=> start!74280 m!813681))

(declare-fun m!813683 () Bool)

(assert (=> start!74280 m!813683))

(declare-fun m!813685 () Bool)

(assert (=> b!873952 m!813685))

(declare-fun m!813687 () Bool)

(assert (=> b!873952 m!813687))

(declare-fun m!813689 () Bool)

(assert (=> b!873952 m!813689))

(declare-fun m!813691 () Bool)

(assert (=> b!873946 m!813691))

(declare-fun m!813693 () Bool)

(assert (=> b!873943 m!813693))

(declare-fun m!813695 () Bool)

(assert (=> b!873949 m!813695))

(declare-fun m!813697 () Bool)

(assert (=> b!873942 m!813697))

(check-sat (not mapNonEmpty!27566) (not b_next!15061) (not b!873951) (not b!873949) b_and!24811 tp_is_empty!17305 (not b!873952) (not b!873942) (not b!873943) (not start!74280))
(check-sat b_and!24811 (not b_next!15061))
