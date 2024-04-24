; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74466 () Bool)

(assert start!74466)

(declare-fun b_free!15061 () Bool)

(declare-fun b_next!15061 () Bool)

(assert (=> start!74466 (= b_free!15061 (not b_next!15061))))

(declare-fun tp!52858 () Bool)

(declare-fun b_and!24847 () Bool)

(assert (=> start!74466 (= tp!52858 b_and!24847)))

(declare-fun b!875084 () Bool)

(declare-fun e!487333 () Bool)

(declare-fun tp_is_empty!17305 () Bool)

(assert (=> b!875084 (= e!487333 tp_is_empty!17305)))

(declare-fun res!594409 () Bool)

(declare-fun e!487337 () Bool)

(assert (=> start!74466 (=> (not res!594409) (not e!487337))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!50793 0))(
  ( (array!50794 (arr!24420 (Array (_ BitVec 32) (_ BitVec 64))) (size!24861 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50793)

(assert (=> start!74466 (= res!594409 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24861 _keys!868))))))

(assert (=> start!74466 e!487337))

(assert (=> start!74466 tp_is_empty!17305))

(assert (=> start!74466 true))

(assert (=> start!74466 tp!52858))

(declare-fun array_inv!19320 (array!50793) Bool)

(assert (=> start!74466 (array_inv!19320 _keys!868)))

(declare-datatypes ((V!28121 0))(
  ( (V!28122 (val!8700 Int)) )
))
(declare-datatypes ((ValueCell!8213 0))(
  ( (ValueCellFull!8213 (v!11129 V!28121)) (EmptyCell!8213) )
))
(declare-datatypes ((array!50795 0))(
  ( (array!50796 (arr!24421 (Array (_ BitVec 32) ValueCell!8213)) (size!24862 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50795)

(declare-fun e!487335 () Bool)

(declare-fun array_inv!19321 (array!50795) Bool)

(assert (=> start!74466 (and (array_inv!19321 _values!688) e!487335)))

(declare-fun b!875085 () Bool)

(declare-fun res!594407 () Bool)

(assert (=> b!875085 (=> (not res!594407) (not e!487337))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50793 (_ BitVec 32)) Bool)

(assert (=> b!875085 (= res!594407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!875086 () Bool)

(declare-fun e!487336 () Bool)

(assert (=> b!875086 (= e!487336 tp_is_empty!17305)))

(declare-fun b!875087 () Bool)

(declare-fun res!594403 () Bool)

(assert (=> b!875087 (=> (not res!594403) (not e!487337))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875087 (= res!594403 (validMask!0 mask!1196))))

(declare-fun b!875088 () Bool)

(assert (=> b!875088 (= e!487337 false)))

(declare-fun v!557 () V!28121)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((tuple2!11428 0))(
  ( (tuple2!11429 (_1!5725 (_ BitVec 64)) (_2!5725 V!28121)) )
))
(declare-datatypes ((List!17274 0))(
  ( (Nil!17271) (Cons!17270 (h!18407 tuple2!11428) (t!24307 List!17274)) )
))
(declare-datatypes ((ListLongMap!10199 0))(
  ( (ListLongMap!10200 (toList!5115 List!17274)) )
))
(declare-fun lt!396257 () ListLongMap!10199)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!28121)

(declare-fun zeroValue!654 () V!28121)

(declare-fun getCurrentListMapNoExtraKeys!3158 (array!50793 array!50795 (_ BitVec 32) (_ BitVec 32) V!28121 V!28121 (_ BitVec 32) Int) ListLongMap!10199)

(assert (=> b!875088 (= lt!396257 (getCurrentListMapNoExtraKeys!3158 _keys!868 (array!50796 (store (arr!24421 _values!688) i!612 (ValueCellFull!8213 v!557)) (size!24862 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396258 () ListLongMap!10199)

(assert (=> b!875088 (= lt!396258 (getCurrentListMapNoExtraKeys!3158 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875089 () Bool)

(declare-fun res!594410 () Bool)

(assert (=> b!875089 (=> (not res!594410) (not e!487337))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875089 (= res!594410 (validKeyInArray!0 k0!854))))

(declare-fun b!875090 () Bool)

(declare-fun res!594405 () Bool)

(assert (=> b!875090 (=> (not res!594405) (not e!487337))))

(assert (=> b!875090 (= res!594405 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24861 _keys!868))))))

(declare-fun b!875091 () Bool)

(declare-fun mapRes!27566 () Bool)

(assert (=> b!875091 (= e!487335 (and e!487336 mapRes!27566))))

(declare-fun condMapEmpty!27566 () Bool)

(declare-fun mapDefault!27566 () ValueCell!8213)

(assert (=> b!875091 (= condMapEmpty!27566 (= (arr!24421 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8213)) mapDefault!27566)))))

(declare-fun mapNonEmpty!27566 () Bool)

(declare-fun tp!52859 () Bool)

(assert (=> mapNonEmpty!27566 (= mapRes!27566 (and tp!52859 e!487333))))

(declare-fun mapKey!27566 () (_ BitVec 32))

(declare-fun mapValue!27566 () ValueCell!8213)

(declare-fun mapRest!27566 () (Array (_ BitVec 32) ValueCell!8213))

(assert (=> mapNonEmpty!27566 (= (arr!24421 _values!688) (store mapRest!27566 mapKey!27566 mapValue!27566))))

(declare-fun b!875092 () Bool)

(declare-fun res!594408 () Bool)

(assert (=> b!875092 (=> (not res!594408) (not e!487337))))

(assert (=> b!875092 (= res!594408 (and (= (select (arr!24420 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27566 () Bool)

(assert (=> mapIsEmpty!27566 mapRes!27566))

(declare-fun b!875093 () Bool)

(declare-fun res!594406 () Bool)

(assert (=> b!875093 (=> (not res!594406) (not e!487337))))

(declare-datatypes ((List!17275 0))(
  ( (Nil!17272) (Cons!17271 (h!18408 (_ BitVec 64)) (t!24308 List!17275)) )
))
(declare-fun arrayNoDuplicates!0 (array!50793 (_ BitVec 32) List!17275) Bool)

(assert (=> b!875093 (= res!594406 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17272))))

(declare-fun b!875094 () Bool)

(declare-fun res!594404 () Bool)

(assert (=> b!875094 (=> (not res!594404) (not e!487337))))

(assert (=> b!875094 (= res!594404 (and (= (size!24862 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24861 _keys!868) (size!24862 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!74466 res!594409) b!875087))

(assert (= (and b!875087 res!594403) b!875094))

(assert (= (and b!875094 res!594404) b!875085))

(assert (= (and b!875085 res!594407) b!875093))

(assert (= (and b!875093 res!594406) b!875090))

(assert (= (and b!875090 res!594405) b!875089))

(assert (= (and b!875089 res!594410) b!875092))

(assert (= (and b!875092 res!594408) b!875088))

(assert (= (and b!875091 condMapEmpty!27566) mapIsEmpty!27566))

(assert (= (and b!875091 (not condMapEmpty!27566)) mapNonEmpty!27566))

(get-info :version)

(assert (= (and mapNonEmpty!27566 ((_ is ValueCellFull!8213) mapValue!27566)) b!875084))

(assert (= (and b!875091 ((_ is ValueCellFull!8213) mapDefault!27566)) b!875086))

(assert (= start!74466 b!875091))

(declare-fun m!815725 () Bool)

(assert (=> mapNonEmpty!27566 m!815725))

(declare-fun m!815727 () Bool)

(assert (=> b!875087 m!815727))

(declare-fun m!815729 () Bool)

(assert (=> b!875089 m!815729))

(declare-fun m!815731 () Bool)

(assert (=> b!875088 m!815731))

(declare-fun m!815733 () Bool)

(assert (=> b!875088 m!815733))

(declare-fun m!815735 () Bool)

(assert (=> b!875088 m!815735))

(declare-fun m!815737 () Bool)

(assert (=> b!875085 m!815737))

(declare-fun m!815739 () Bool)

(assert (=> b!875093 m!815739))

(declare-fun m!815741 () Bool)

(assert (=> start!74466 m!815741))

(declare-fun m!815743 () Bool)

(assert (=> start!74466 m!815743))

(declare-fun m!815745 () Bool)

(assert (=> b!875092 m!815745))

(check-sat (not mapNonEmpty!27566) (not b!875089) (not b!875088) (not b!875085) b_and!24847 (not b_next!15061) (not b!875087) tp_is_empty!17305 (not b!875093) (not start!74466))
(check-sat b_and!24847 (not b_next!15061))
