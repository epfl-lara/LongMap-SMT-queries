; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40178 () Bool)

(assert start!40178)

(declare-fun b_free!10459 () Bool)

(declare-fun b_next!10459 () Bool)

(assert (=> start!40178 (= b_free!10459 (not b_next!10459))))

(declare-fun tp!36905 () Bool)

(declare-fun b_and!18401 () Bool)

(assert (=> start!40178 (= tp!36905 b_and!18401)))

(declare-fun b!440101 () Bool)

(declare-fun res!260317 () Bool)

(declare-fun e!259290 () Bool)

(assert (=> b!440101 (=> (not res!260317) (not e!259290))))

(declare-datatypes ((array!27039 0))(
  ( (array!27040 (arr!12969 (Array (_ BitVec 32) (_ BitVec 64))) (size!13322 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27039)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16587 0))(
  ( (V!16588 (val!5850 Int)) )
))
(declare-datatypes ((ValueCell!5462 0))(
  ( (ValueCellFull!5462 (v!8091 V!16587)) (EmptyCell!5462) )
))
(declare-datatypes ((array!27041 0))(
  ( (array!27042 (arr!12970 (Array (_ BitVec 32) ValueCell!5462)) (size!13323 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27041)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!440101 (= res!260317 (and (= (size!13323 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13322 _keys!709) (size!13323 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19038 () Bool)

(declare-fun mapRes!19038 () Bool)

(declare-fun tp!36906 () Bool)

(declare-fun e!259292 () Bool)

(assert (=> mapNonEmpty!19038 (= mapRes!19038 (and tp!36906 e!259292))))

(declare-fun mapValue!19038 () ValueCell!5462)

(declare-fun mapKey!19038 () (_ BitVec 32))

(declare-fun mapRest!19038 () (Array (_ BitVec 32) ValueCell!5462))

(assert (=> mapNonEmpty!19038 (= (arr!12970 _values!549) (store mapRest!19038 mapKey!19038 mapValue!19038))))

(declare-fun b!440102 () Bool)

(declare-fun tp_is_empty!11611 () Bool)

(assert (=> b!440102 (= e!259292 tp_is_empty!11611)))

(declare-fun mapIsEmpty!19038 () Bool)

(assert (=> mapIsEmpty!19038 mapRes!19038))

(declare-fun b!440103 () Bool)

(declare-fun res!260313 () Bool)

(assert (=> b!440103 (=> (not res!260313) (not e!259290))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!440103 (= res!260313 (or (= (select (arr!12969 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12969 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!440104 () Bool)

(declare-fun e!259288 () Bool)

(assert (=> b!440104 (= e!259288 tp_is_empty!11611)))

(declare-fun b!440106 () Bool)

(declare-fun res!260314 () Bool)

(declare-fun e!259287 () Bool)

(assert (=> b!440106 (=> (not res!260314) (not e!259287))))

(declare-fun lt!202329 () array!27039)

(declare-datatypes ((List!7777 0))(
  ( (Nil!7774) (Cons!7773 (h!8629 (_ BitVec 64)) (t!13524 List!7777)) )
))
(declare-fun arrayNoDuplicates!0 (array!27039 (_ BitVec 32) List!7777) Bool)

(assert (=> b!440106 (= res!260314 (arrayNoDuplicates!0 lt!202329 #b00000000000000000000000000000000 Nil!7774))))

(declare-fun b!440107 () Bool)

(declare-fun e!259289 () Bool)

(assert (=> b!440107 (= e!259289 (not true))))

(declare-fun minValue!515 () V!16587)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16587)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!202331 () array!27041)

(declare-fun v!412 () V!16587)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7790 0))(
  ( (tuple2!7791 (_1!3906 (_ BitVec 64)) (_2!3906 V!16587)) )
))
(declare-datatypes ((List!7778 0))(
  ( (Nil!7775) (Cons!7774 (h!8630 tuple2!7790) (t!13525 List!7778)) )
))
(declare-datatypes ((ListLongMap!6693 0))(
  ( (ListLongMap!6694 (toList!3362 List!7778)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1561 (array!27039 array!27041 (_ BitVec 32) (_ BitVec 32) V!16587 V!16587 (_ BitVec 32) Int) ListLongMap!6693)

(declare-fun +!1523 (ListLongMap!6693 tuple2!7790) ListLongMap!6693)

(assert (=> b!440107 (= (getCurrentListMapNoExtraKeys!1561 lt!202329 lt!202331 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1523 (getCurrentListMapNoExtraKeys!1561 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7791 k0!794 v!412)))))

(declare-datatypes ((Unit!13063 0))(
  ( (Unit!13064) )
))
(declare-fun lt!202330 () Unit!13063)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!661 (array!27039 array!27041 (_ BitVec 32) (_ BitVec 32) V!16587 V!16587 (_ BitVec 32) (_ BitVec 64) V!16587 (_ BitVec 32) Int) Unit!13063)

(assert (=> b!440107 (= lt!202330 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!661 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!440108 () Bool)

(declare-fun e!259293 () Bool)

(assert (=> b!440108 (= e!259293 (and e!259288 mapRes!19038))))

(declare-fun condMapEmpty!19038 () Bool)

(declare-fun mapDefault!19038 () ValueCell!5462)

(assert (=> b!440108 (= condMapEmpty!19038 (= (arr!12970 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5462)) mapDefault!19038)))))

(declare-fun b!440109 () Bool)

(assert (=> b!440109 (= e!259287 e!259289)))

(declare-fun res!260325 () Bool)

(assert (=> b!440109 (=> (not res!260325) (not e!259289))))

(assert (=> b!440109 (= res!260325 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202328 () ListLongMap!6693)

(assert (=> b!440109 (= lt!202328 (getCurrentListMapNoExtraKeys!1561 lt!202329 lt!202331 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!440109 (= lt!202331 (array!27042 (store (arr!12970 _values!549) i!563 (ValueCellFull!5462 v!412)) (size!13323 _values!549)))))

(declare-fun lt!202327 () ListLongMap!6693)

(assert (=> b!440109 (= lt!202327 (getCurrentListMapNoExtraKeys!1561 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!440110 () Bool)

(assert (=> b!440110 (= e!259290 e!259287)))

(declare-fun res!260323 () Bool)

(assert (=> b!440110 (=> (not res!260323) (not e!259287))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27039 (_ BitVec 32)) Bool)

(assert (=> b!440110 (= res!260323 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202329 mask!1025))))

(assert (=> b!440110 (= lt!202329 (array!27040 (store (arr!12969 _keys!709) i!563 k0!794) (size!13322 _keys!709)))))

(declare-fun b!440111 () Bool)

(declare-fun res!260322 () Bool)

(assert (=> b!440111 (=> (not res!260322) (not e!259290))))

(declare-fun arrayContainsKey!0 (array!27039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!440111 (= res!260322 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!440112 () Bool)

(declare-fun res!260320 () Bool)

(assert (=> b!440112 (=> (not res!260320) (not e!259290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!440112 (= res!260320 (validMask!0 mask!1025))))

(declare-fun b!440113 () Bool)

(declare-fun res!260324 () Bool)

(assert (=> b!440113 (=> (not res!260324) (not e!259290))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!440113 (= res!260324 (validKeyInArray!0 k0!794))))

(declare-fun b!440114 () Bool)

(declare-fun res!260318 () Bool)

(assert (=> b!440114 (=> (not res!260318) (not e!259287))))

(assert (=> b!440114 (= res!260318 (bvsle from!863 i!563))))

(declare-fun res!260316 () Bool)

(assert (=> start!40178 (=> (not res!260316) (not e!259290))))

(assert (=> start!40178 (= res!260316 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13322 _keys!709))))))

(assert (=> start!40178 e!259290))

(assert (=> start!40178 tp_is_empty!11611))

(assert (=> start!40178 tp!36905))

(assert (=> start!40178 true))

(declare-fun array_inv!9462 (array!27041) Bool)

(assert (=> start!40178 (and (array_inv!9462 _values!549) e!259293)))

(declare-fun array_inv!9463 (array!27039) Bool)

(assert (=> start!40178 (array_inv!9463 _keys!709)))

(declare-fun b!440105 () Bool)

(declare-fun res!260321 () Bool)

(assert (=> b!440105 (=> (not res!260321) (not e!259290))))

(assert (=> b!440105 (= res!260321 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13322 _keys!709))))))

(declare-fun b!440115 () Bool)

(declare-fun res!260319 () Bool)

(assert (=> b!440115 (=> (not res!260319) (not e!259290))))

(assert (=> b!440115 (= res!260319 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!440116 () Bool)

(declare-fun res!260315 () Bool)

(assert (=> b!440116 (=> (not res!260315) (not e!259290))))

(assert (=> b!440116 (= res!260315 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7774))))

(assert (= (and start!40178 res!260316) b!440112))

(assert (= (and b!440112 res!260320) b!440101))

(assert (= (and b!440101 res!260317) b!440115))

(assert (= (and b!440115 res!260319) b!440116))

(assert (= (and b!440116 res!260315) b!440105))

(assert (= (and b!440105 res!260321) b!440113))

(assert (= (and b!440113 res!260324) b!440103))

(assert (= (and b!440103 res!260313) b!440111))

(assert (= (and b!440111 res!260322) b!440110))

(assert (= (and b!440110 res!260323) b!440106))

(assert (= (and b!440106 res!260314) b!440114))

(assert (= (and b!440114 res!260318) b!440109))

(assert (= (and b!440109 res!260325) b!440107))

(assert (= (and b!440108 condMapEmpty!19038) mapIsEmpty!19038))

(assert (= (and b!440108 (not condMapEmpty!19038)) mapNonEmpty!19038))

(get-info :version)

(assert (= (and mapNonEmpty!19038 ((_ is ValueCellFull!5462) mapValue!19038)) b!440102))

(assert (= (and b!440108 ((_ is ValueCellFull!5462) mapDefault!19038)) b!440104))

(assert (= start!40178 b!440108))

(declare-fun m!426699 () Bool)

(assert (=> b!440103 m!426699))

(declare-fun m!426701 () Bool)

(assert (=> b!440113 m!426701))

(declare-fun m!426703 () Bool)

(assert (=> b!440116 m!426703))

(declare-fun m!426705 () Bool)

(assert (=> b!440106 m!426705))

(declare-fun m!426707 () Bool)

(assert (=> b!440115 m!426707))

(declare-fun m!426709 () Bool)

(assert (=> start!40178 m!426709))

(declare-fun m!426711 () Bool)

(assert (=> start!40178 m!426711))

(declare-fun m!426713 () Bool)

(assert (=> b!440109 m!426713))

(declare-fun m!426715 () Bool)

(assert (=> b!440109 m!426715))

(declare-fun m!426717 () Bool)

(assert (=> b!440109 m!426717))

(declare-fun m!426719 () Bool)

(assert (=> b!440111 m!426719))

(declare-fun m!426721 () Bool)

(assert (=> b!440107 m!426721))

(declare-fun m!426723 () Bool)

(assert (=> b!440107 m!426723))

(assert (=> b!440107 m!426723))

(declare-fun m!426725 () Bool)

(assert (=> b!440107 m!426725))

(declare-fun m!426727 () Bool)

(assert (=> b!440107 m!426727))

(declare-fun m!426729 () Bool)

(assert (=> b!440110 m!426729))

(declare-fun m!426731 () Bool)

(assert (=> b!440110 m!426731))

(declare-fun m!426733 () Bool)

(assert (=> mapNonEmpty!19038 m!426733))

(declare-fun m!426735 () Bool)

(assert (=> b!440112 m!426735))

(check-sat (not b_next!10459) (not b!440110) (not start!40178) (not b!440115) (not mapNonEmpty!19038) (not b!440113) (not b!440111) (not b!440106) tp_is_empty!11611 (not b!440116) b_and!18401 (not b!440107) (not b!440109) (not b!440112))
(check-sat b_and!18401 (not b_next!10459))
