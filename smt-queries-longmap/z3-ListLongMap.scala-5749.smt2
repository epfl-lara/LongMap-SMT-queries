; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74490 () Bool)

(assert start!74490)

(declare-fun b_free!15085 () Bool)

(declare-fun b_next!15085 () Bool)

(assert (=> start!74490 (= b_free!15085 (not b_next!15085))))

(declare-fun tp!52931 () Bool)

(declare-fun b_and!24871 () Bool)

(assert (=> start!74490 (= tp!52931 b_and!24871)))

(declare-fun b!875480 () Bool)

(declare-fun e!487517 () Bool)

(declare-fun tp_is_empty!17329 () Bool)

(assert (=> b!875480 (= e!487517 tp_is_empty!17329)))

(declare-fun b!875481 () Bool)

(declare-fun res!594697 () Bool)

(declare-fun e!487514 () Bool)

(assert (=> b!875481 (=> (not res!594697) (not e!487514))))

(declare-datatypes ((array!50839 0))(
  ( (array!50840 (arr!24443 (Array (_ BitVec 32) (_ BitVec 64))) (size!24884 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50839)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50839 (_ BitVec 32)) Bool)

(assert (=> b!875481 (= res!594697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun res!594698 () Bool)

(assert (=> start!74490 (=> (not res!594698) (not e!487514))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74490 (= res!594698 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24884 _keys!868))))))

(assert (=> start!74490 e!487514))

(assert (=> start!74490 tp_is_empty!17329))

(assert (=> start!74490 true))

(assert (=> start!74490 tp!52931))

(declare-fun array_inv!19334 (array!50839) Bool)

(assert (=> start!74490 (array_inv!19334 _keys!868)))

(declare-datatypes ((V!28153 0))(
  ( (V!28154 (val!8712 Int)) )
))
(declare-datatypes ((ValueCell!8225 0))(
  ( (ValueCellFull!8225 (v!11141 V!28153)) (EmptyCell!8225) )
))
(declare-datatypes ((array!50841 0))(
  ( (array!50842 (arr!24444 (Array (_ BitVec 32) ValueCell!8225)) (size!24885 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50841)

(declare-fun e!487513 () Bool)

(declare-fun array_inv!19335 (array!50841) Bool)

(assert (=> start!74490 (and (array_inv!19335 _values!688) e!487513)))

(declare-fun b!875482 () Bool)

(declare-fun res!594694 () Bool)

(assert (=> b!875482 (=> (not res!594694) (not e!487514))))

(declare-datatypes ((List!17286 0))(
  ( (Nil!17283) (Cons!17282 (h!18419 (_ BitVec 64)) (t!24319 List!17286)) )
))
(declare-fun arrayNoDuplicates!0 (array!50839 (_ BitVec 32) List!17286) Bool)

(assert (=> b!875482 (= res!594694 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17283))))

(declare-fun b!875483 () Bool)

(declare-fun res!594693 () Bool)

(assert (=> b!875483 (=> (not res!594693) (not e!487514))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!875483 (= res!594693 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24884 _keys!868))))))

(declare-fun b!875484 () Bool)

(assert (=> b!875484 (= e!487514 false)))

(declare-fun v!557 () V!28153)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((tuple2!11440 0))(
  ( (tuple2!11441 (_1!5731 (_ BitVec 64)) (_2!5731 V!28153)) )
))
(declare-datatypes ((List!17287 0))(
  ( (Nil!17284) (Cons!17283 (h!18420 tuple2!11440) (t!24320 List!17287)) )
))
(declare-datatypes ((ListLongMap!10211 0))(
  ( (ListLongMap!10212 (toList!5121 List!17287)) )
))
(declare-fun lt!396330 () ListLongMap!10211)

(declare-fun minValue!654 () V!28153)

(declare-fun zeroValue!654 () V!28153)

(declare-fun getCurrentListMapNoExtraKeys!3164 (array!50839 array!50841 (_ BitVec 32) (_ BitVec 32) V!28153 V!28153 (_ BitVec 32) Int) ListLongMap!10211)

(assert (=> b!875484 (= lt!396330 (getCurrentListMapNoExtraKeys!3164 _keys!868 (array!50842 (store (arr!24444 _values!688) i!612 (ValueCellFull!8225 v!557)) (size!24885 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun lt!396329 () ListLongMap!10211)

(assert (=> b!875484 (= lt!396329 (getCurrentListMapNoExtraKeys!3164 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!875485 () Bool)

(declare-fun mapRes!27602 () Bool)

(assert (=> b!875485 (= e!487513 (and e!487517 mapRes!27602))))

(declare-fun condMapEmpty!27602 () Bool)

(declare-fun mapDefault!27602 () ValueCell!8225)

(assert (=> b!875485 (= condMapEmpty!27602 (= (arr!24444 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8225)) mapDefault!27602)))))

(declare-fun b!875486 () Bool)

(declare-fun e!487515 () Bool)

(assert (=> b!875486 (= e!487515 tp_is_empty!17329)))

(declare-fun b!875487 () Bool)

(declare-fun res!594692 () Bool)

(assert (=> b!875487 (=> (not res!594692) (not e!487514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!875487 (= res!594692 (validMask!0 mask!1196))))

(declare-fun b!875488 () Bool)

(declare-fun res!594696 () Bool)

(assert (=> b!875488 (=> (not res!594696) (not e!487514))))

(assert (=> b!875488 (= res!594696 (and (= (size!24885 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24884 _keys!868) (size!24885 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!875489 () Bool)

(declare-fun res!594691 () Bool)

(assert (=> b!875489 (=> (not res!594691) (not e!487514))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!875489 (= res!594691 (and (= (select (arr!24443 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!27602 () Bool)

(assert (=> mapIsEmpty!27602 mapRes!27602))

(declare-fun b!875490 () Bool)

(declare-fun res!594695 () Bool)

(assert (=> b!875490 (=> (not res!594695) (not e!487514))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!875490 (= res!594695 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!27602 () Bool)

(declare-fun tp!52930 () Bool)

(assert (=> mapNonEmpty!27602 (= mapRes!27602 (and tp!52930 e!487515))))

(declare-fun mapValue!27602 () ValueCell!8225)

(declare-fun mapRest!27602 () (Array (_ BitVec 32) ValueCell!8225))

(declare-fun mapKey!27602 () (_ BitVec 32))

(assert (=> mapNonEmpty!27602 (= (arr!24444 _values!688) (store mapRest!27602 mapKey!27602 mapValue!27602))))

(assert (= (and start!74490 res!594698) b!875487))

(assert (= (and b!875487 res!594692) b!875488))

(assert (= (and b!875488 res!594696) b!875481))

(assert (= (and b!875481 res!594697) b!875482))

(assert (= (and b!875482 res!594694) b!875483))

(assert (= (and b!875483 res!594693) b!875490))

(assert (= (and b!875490 res!594695) b!875489))

(assert (= (and b!875489 res!594691) b!875484))

(assert (= (and b!875485 condMapEmpty!27602) mapIsEmpty!27602))

(assert (= (and b!875485 (not condMapEmpty!27602)) mapNonEmpty!27602))

(get-info :version)

(assert (= (and mapNonEmpty!27602 ((_ is ValueCellFull!8225) mapValue!27602)) b!875486))

(assert (= (and b!875485 ((_ is ValueCellFull!8225) mapDefault!27602)) b!875480))

(assert (= start!74490 b!875485))

(declare-fun m!815989 () Bool)

(assert (=> b!875482 m!815989))

(declare-fun m!815991 () Bool)

(assert (=> b!875484 m!815991))

(declare-fun m!815993 () Bool)

(assert (=> b!875484 m!815993))

(declare-fun m!815995 () Bool)

(assert (=> b!875484 m!815995))

(declare-fun m!815997 () Bool)

(assert (=> b!875481 m!815997))

(declare-fun m!815999 () Bool)

(assert (=> b!875487 m!815999))

(declare-fun m!816001 () Bool)

(assert (=> b!875490 m!816001))

(declare-fun m!816003 () Bool)

(assert (=> start!74490 m!816003))

(declare-fun m!816005 () Bool)

(assert (=> start!74490 m!816005))

(declare-fun m!816007 () Bool)

(assert (=> b!875489 m!816007))

(declare-fun m!816009 () Bool)

(assert (=> mapNonEmpty!27602 m!816009))

(check-sat (not b_next!15085) (not mapNonEmpty!27602) tp_is_empty!17329 (not b!875490) b_and!24871 (not start!74490) (not b!875481) (not b!875484) (not b!875487) (not b!875482))
(check-sat b_and!24871 (not b_next!15085))
