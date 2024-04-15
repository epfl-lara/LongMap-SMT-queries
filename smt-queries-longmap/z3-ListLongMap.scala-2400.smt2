; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37982 () Bool)

(assert start!37982)

(declare-fun b_free!8965 () Bool)

(declare-fun b_next!8965 () Bool)

(assert (=> start!37982 (= b_free!8965 (not b_next!8965))))

(declare-fun tp!31664 () Bool)

(declare-fun b_and!16253 () Bool)

(assert (=> start!37982 (= tp!31664 b_and!16253)))

(declare-fun b!390637 () Bool)

(declare-fun res!223566 () Bool)

(declare-fun e!236619 () Bool)

(assert (=> b!390637 (=> (not res!223566) (not e!236619))))

(declare-datatypes ((array!23161 0))(
  ( (array!23162 (arr!11043 (Array (_ BitVec 32) (_ BitVec 64))) (size!11396 (_ BitVec 32))) )
))
(declare-fun lt!184114 () array!23161)

(declare-datatypes ((List!6364 0))(
  ( (Nil!6361) (Cons!6360 (h!7216 (_ BitVec 64)) (t!11517 List!6364)) )
))
(declare-fun arrayNoDuplicates!0 (array!23161 (_ BitVec 32) List!6364) Bool)

(assert (=> b!390637 (= res!223566 (arrayNoDuplicates!0 lt!184114 #b00000000000000000000000000000000 Nil!6361))))

(declare-fun b!390638 () Bool)

(declare-fun res!223565 () Bool)

(declare-fun e!236616 () Bool)

(assert (=> b!390638 (=> (not res!223565) (not e!236616))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390638 (= res!223565 (validKeyInArray!0 k0!778))))

(declare-fun b!390639 () Bool)

(declare-datatypes ((V!13955 0))(
  ( (V!13956 (val!4863 Int)) )
))
(declare-datatypes ((tuple2!6518 0))(
  ( (tuple2!6519 (_1!3270 (_ BitVec 64)) (_2!3270 V!13955)) )
))
(declare-datatypes ((List!6365 0))(
  ( (Nil!6362) (Cons!6361 (h!7217 tuple2!6518) (t!11518 List!6365)) )
))
(declare-datatypes ((ListLongMap!5421 0))(
  ( (ListLongMap!5422 (toList!2726 List!6365)) )
))
(declare-fun lt!184112 () ListLongMap!5421)

(declare-fun e!236615 () Bool)

(declare-fun lt!184110 () tuple2!6518)

(declare-fun lt!184115 () ListLongMap!5421)

(declare-fun +!1046 (ListLongMap!5421 tuple2!6518) ListLongMap!5421)

(assert (=> b!390639 (= e!236615 (= lt!184112 (+!1046 lt!184115 lt!184110)))))

(declare-fun e!236617 () Bool)

(assert (=> b!390639 e!236617))

(declare-fun res!223568 () Bool)

(assert (=> b!390639 (=> (not res!223568) (not e!236617))))

(declare-fun lt!184113 () ListLongMap!5421)

(assert (=> b!390639 (= res!223568 (= lt!184112 (+!1046 lt!184113 lt!184110)))))

(declare-fun zeroValue!472 () V!13955)

(assert (=> b!390639 (= lt!184110 (tuple2!6519 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390640 () Bool)

(declare-fun res!223571 () Bool)

(assert (=> b!390640 (=> (not res!223571) (not e!236616))))

(declare-fun _keys!658 () array!23161)

(declare-fun arrayContainsKey!0 (array!23161 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390640 (= res!223571 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!390641 () Bool)

(declare-fun res!223573 () Bool)

(assert (=> b!390641 (=> (not res!223573) (not e!236616))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4475 0))(
  ( (ValueCellFull!4475 (v!7078 V!13955)) (EmptyCell!4475) )
))
(declare-datatypes ((array!23163 0))(
  ( (array!23164 (arr!11044 (Array (_ BitVec 32) ValueCell!4475)) (size!11397 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23163)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!390641 (= res!223573 (and (= (size!11397 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11396 _keys!658) (size!11397 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!390642 () Bool)

(declare-fun e!236614 () Bool)

(declare-fun tp_is_empty!9637 () Bool)

(assert (=> b!390642 (= e!236614 tp_is_empty!9637)))

(declare-fun mapIsEmpty!16038 () Bool)

(declare-fun mapRes!16038 () Bool)

(assert (=> mapIsEmpty!16038 mapRes!16038))

(declare-fun res!223562 () Bool)

(assert (=> start!37982 (=> (not res!223562) (not e!236616))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37982 (= res!223562 (validMask!0 mask!970))))

(assert (=> start!37982 e!236616))

(declare-fun e!236613 () Bool)

(declare-fun array_inv!8112 (array!23163) Bool)

(assert (=> start!37982 (and (array_inv!8112 _values!506) e!236613)))

(assert (=> start!37982 tp!31664))

(assert (=> start!37982 true))

(assert (=> start!37982 tp_is_empty!9637))

(declare-fun array_inv!8113 (array!23161) Bool)

(assert (=> start!37982 (array_inv!8113 _keys!658)))

(declare-fun lt!184116 () ListLongMap!5421)

(declare-fun b!390643 () Bool)

(declare-fun lt!184111 () ListLongMap!5421)

(assert (=> b!390643 (= e!236617 (= lt!184111 (+!1046 lt!184116 lt!184110)))))

(declare-fun b!390644 () Bool)

(declare-fun res!223570 () Bool)

(assert (=> b!390644 (=> (not res!223570) (not e!236616))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!390644 (= res!223570 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11396 _keys!658))))))

(declare-fun b!390645 () Bool)

(declare-fun res!223572 () Bool)

(assert (=> b!390645 (=> (not res!223572) (not e!236616))))

(assert (=> b!390645 (= res!223572 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6361))))

(declare-fun b!390646 () Bool)

(declare-fun res!223563 () Bool)

(assert (=> b!390646 (=> (not res!223563) (not e!236616))))

(assert (=> b!390646 (= res!223563 (or (= (select (arr!11043 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11043 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16038 () Bool)

(declare-fun tp!31665 () Bool)

(declare-fun e!236618 () Bool)

(assert (=> mapNonEmpty!16038 (= mapRes!16038 (and tp!31665 e!236618))))

(declare-fun mapKey!16038 () (_ BitVec 32))

(declare-fun mapValue!16038 () ValueCell!4475)

(declare-fun mapRest!16038 () (Array (_ BitVec 32) ValueCell!4475))

(assert (=> mapNonEmpty!16038 (= (arr!11044 _values!506) (store mapRest!16038 mapKey!16038 mapValue!16038))))

(declare-fun b!390647 () Bool)

(assert (=> b!390647 (= e!236616 e!236619)))

(declare-fun res!223569 () Bool)

(assert (=> b!390647 (=> (not res!223569) (not e!236619))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23161 (_ BitVec 32)) Bool)

(assert (=> b!390647 (= res!223569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184114 mask!970))))

(assert (=> b!390647 (= lt!184114 (array!23162 (store (arr!11043 _keys!658) i!548 k0!778) (size!11396 _keys!658)))))

(declare-fun b!390648 () Bool)

(declare-fun res!223567 () Bool)

(assert (=> b!390648 (=> (not res!223567) (not e!236616))))

(assert (=> b!390648 (= res!223567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390649 () Bool)

(assert (=> b!390649 (= e!236618 tp_is_empty!9637)))

(declare-fun b!390650 () Bool)

(assert (=> b!390650 (= e!236619 (not e!236615))))

(declare-fun res!223564 () Bool)

(assert (=> b!390650 (=> res!223564 e!236615)))

(assert (=> b!390650 (= res!223564 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13955)

(declare-fun getCurrentListMap!2052 (array!23161 array!23163 (_ BitVec 32) (_ BitVec 32) V!13955 V!13955 (_ BitVec 32) Int) ListLongMap!5421)

(assert (=> b!390650 (= lt!184111 (getCurrentListMap!2052 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184109 () array!23163)

(assert (=> b!390650 (= lt!184112 (getCurrentListMap!2052 lt!184114 lt!184109 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390650 (and (= lt!184113 lt!184115) (= lt!184115 lt!184113))))

(declare-fun v!373 () V!13955)

(assert (=> b!390650 (= lt!184115 (+!1046 lt!184116 (tuple2!6519 k0!778 v!373)))))

(declare-datatypes ((Unit!11940 0))(
  ( (Unit!11941) )
))
(declare-fun lt!184117 () Unit!11940)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!253 (array!23161 array!23163 (_ BitVec 32) (_ BitVec 32) V!13955 V!13955 (_ BitVec 32) (_ BitVec 64) V!13955 (_ BitVec 32) Int) Unit!11940)

(assert (=> b!390650 (= lt!184117 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!253 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!962 (array!23161 array!23163 (_ BitVec 32) (_ BitVec 32) V!13955 V!13955 (_ BitVec 32) Int) ListLongMap!5421)

(assert (=> b!390650 (= lt!184113 (getCurrentListMapNoExtraKeys!962 lt!184114 lt!184109 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390650 (= lt!184109 (array!23164 (store (arr!11044 _values!506) i!548 (ValueCellFull!4475 v!373)) (size!11397 _values!506)))))

(assert (=> b!390650 (= lt!184116 (getCurrentListMapNoExtraKeys!962 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390651 () Bool)

(assert (=> b!390651 (= e!236613 (and e!236614 mapRes!16038))))

(declare-fun condMapEmpty!16038 () Bool)

(declare-fun mapDefault!16038 () ValueCell!4475)

(assert (=> b!390651 (= condMapEmpty!16038 (= (arr!11044 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4475)) mapDefault!16038)))))

(assert (= (and start!37982 res!223562) b!390641))

(assert (= (and b!390641 res!223573) b!390648))

(assert (= (and b!390648 res!223567) b!390645))

(assert (= (and b!390645 res!223572) b!390644))

(assert (= (and b!390644 res!223570) b!390638))

(assert (= (and b!390638 res!223565) b!390646))

(assert (= (and b!390646 res!223563) b!390640))

(assert (= (and b!390640 res!223571) b!390647))

(assert (= (and b!390647 res!223569) b!390637))

(assert (= (and b!390637 res!223566) b!390650))

(assert (= (and b!390650 (not res!223564)) b!390639))

(assert (= (and b!390639 res!223568) b!390643))

(assert (= (and b!390651 condMapEmpty!16038) mapIsEmpty!16038))

(assert (= (and b!390651 (not condMapEmpty!16038)) mapNonEmpty!16038))

(get-info :version)

(assert (= (and mapNonEmpty!16038 ((_ is ValueCellFull!4475) mapValue!16038)) b!390649))

(assert (= (and b!390651 ((_ is ValueCellFull!4475) mapDefault!16038)) b!390642))

(assert (= start!37982 b!390651))

(declare-fun m!386535 () Bool)

(assert (=> b!390640 m!386535))

(declare-fun m!386537 () Bool)

(assert (=> b!390650 m!386537))

(declare-fun m!386539 () Bool)

(assert (=> b!390650 m!386539))

(declare-fun m!386541 () Bool)

(assert (=> b!390650 m!386541))

(declare-fun m!386543 () Bool)

(assert (=> b!390650 m!386543))

(declare-fun m!386545 () Bool)

(assert (=> b!390650 m!386545))

(declare-fun m!386547 () Bool)

(assert (=> b!390650 m!386547))

(declare-fun m!386549 () Bool)

(assert (=> b!390650 m!386549))

(declare-fun m!386551 () Bool)

(assert (=> b!390637 m!386551))

(declare-fun m!386553 () Bool)

(assert (=> b!390646 m!386553))

(declare-fun m!386555 () Bool)

(assert (=> b!390638 m!386555))

(declare-fun m!386557 () Bool)

(assert (=> b!390648 m!386557))

(declare-fun m!386559 () Bool)

(assert (=> start!37982 m!386559))

(declare-fun m!386561 () Bool)

(assert (=> start!37982 m!386561))

(declare-fun m!386563 () Bool)

(assert (=> start!37982 m!386563))

(declare-fun m!386565 () Bool)

(assert (=> b!390643 m!386565))

(declare-fun m!386567 () Bool)

(assert (=> b!390639 m!386567))

(declare-fun m!386569 () Bool)

(assert (=> b!390639 m!386569))

(declare-fun m!386571 () Bool)

(assert (=> mapNonEmpty!16038 m!386571))

(declare-fun m!386573 () Bool)

(assert (=> b!390645 m!386573))

(declare-fun m!386575 () Bool)

(assert (=> b!390647 m!386575))

(declare-fun m!386577 () Bool)

(assert (=> b!390647 m!386577))

(check-sat b_and!16253 (not start!37982) (not b!390638) (not b!390643) (not b!390647) (not b_next!8965) (not b!390645) (not b!390639) (not b!390640) (not mapNonEmpty!16038) (not b!390637) (not b!390650) (not b!390648) tp_is_empty!9637)
(check-sat b_and!16253 (not b_next!8965))
