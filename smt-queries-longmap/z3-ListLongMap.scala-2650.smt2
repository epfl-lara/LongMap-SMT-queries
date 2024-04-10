; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39720 () Bool)

(assert start!39720)

(declare-fun b_free!9987 () Bool)

(declare-fun b_next!9987 () Bool)

(assert (=> start!39720 (= b_free!9987 (not b_next!9987))))

(declare-fun tp!35490 () Bool)

(declare-fun b_and!17643 () Bool)

(assert (=> start!39720 (= tp!35490 b_and!17643)))

(declare-fun b!427103 () Bool)

(declare-fun e!253292 () Bool)

(declare-fun tp_is_empty!11139 () Bool)

(assert (=> b!427103 (= e!253292 tp_is_empty!11139)))

(declare-fun b!427104 () Bool)

(declare-fun e!253291 () Bool)

(assert (=> b!427104 (= e!253291 tp_is_empty!11139)))

(declare-fun mapNonEmpty!18330 () Bool)

(declare-fun mapRes!18330 () Bool)

(declare-fun tp!35489 () Bool)

(assert (=> mapNonEmpty!18330 (= mapRes!18330 (and tp!35489 e!253291))))

(declare-datatypes ((V!15957 0))(
  ( (V!15958 (val!5614 Int)) )
))
(declare-datatypes ((ValueCell!5226 0))(
  ( (ValueCellFull!5226 (v!7861 V!15957)) (EmptyCell!5226) )
))
(declare-fun mapRest!18330 () (Array (_ BitVec 32) ValueCell!5226))

(declare-datatypes ((array!26117 0))(
  ( (array!26118 (arr!12508 (Array (_ BitVec 32) ValueCell!5226)) (size!12860 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26117)

(declare-fun mapValue!18330 () ValueCell!5226)

(declare-fun mapKey!18330 () (_ BitVec 32))

(assert (=> mapNonEmpty!18330 (= (arr!12508 _values!549) (store mapRest!18330 mapKey!18330 mapValue!18330))))

(declare-fun b!427105 () Bool)

(declare-fun res!250441 () Bool)

(declare-fun e!253293 () Bool)

(assert (=> b!427105 (=> (not res!250441) (not e!253293))))

(declare-datatypes ((array!26119 0))(
  ( (array!26120 (arr!12509 (Array (_ BitVec 32) (_ BitVec 64))) (size!12861 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26119)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427105 (= res!250441 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427106 () Bool)

(declare-fun res!250449 () Bool)

(assert (=> b!427106 (=> (not res!250449) (not e!253293))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427106 (= res!250449 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12861 _keys!709))))))

(declare-fun mapIsEmpty!18330 () Bool)

(assert (=> mapIsEmpty!18330 mapRes!18330))

(declare-fun b!427107 () Bool)

(declare-fun e!253290 () Bool)

(declare-fun e!253296 () Bool)

(assert (=> b!427107 (= e!253290 e!253296)))

(declare-fun res!250446 () Bool)

(assert (=> b!427107 (=> (not res!250446) (not e!253296))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!427107 (= res!250446 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195169 () array!26117)

(declare-fun minValue!515 () V!15957)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15957)

(declare-fun lt!195171 () array!26119)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7376 0))(
  ( (tuple2!7377 (_1!3699 (_ BitVec 64)) (_2!3699 V!15957)) )
))
(declare-datatypes ((List!7392 0))(
  ( (Nil!7389) (Cons!7388 (h!8244 tuple2!7376) (t!12836 List!7392)) )
))
(declare-datatypes ((ListLongMap!6289 0))(
  ( (ListLongMap!6290 (toList!3160 List!7392)) )
))
(declare-fun lt!195170 () ListLongMap!6289)

(declare-fun getCurrentListMapNoExtraKeys!1364 (array!26119 array!26117 (_ BitVec 32) (_ BitVec 32) V!15957 V!15957 (_ BitVec 32) Int) ListLongMap!6289)

(assert (=> b!427107 (= lt!195170 (getCurrentListMapNoExtraKeys!1364 lt!195171 lt!195169 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15957)

(assert (=> b!427107 (= lt!195169 (array!26118 (store (arr!12508 _values!549) i!563 (ValueCellFull!5226 v!412)) (size!12860 _values!549)))))

(declare-fun lt!195172 () ListLongMap!6289)

(assert (=> b!427107 (= lt!195172 (getCurrentListMapNoExtraKeys!1364 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427108 () Bool)

(declare-fun res!250440 () Bool)

(assert (=> b!427108 (=> (not res!250440) (not e!253290))))

(assert (=> b!427108 (= res!250440 (bvsle from!863 i!563))))

(declare-fun b!427109 () Bool)

(declare-fun res!250437 () Bool)

(assert (=> b!427109 (=> (not res!250437) (not e!253293))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427109 (= res!250437 (validMask!0 mask!1025))))

(declare-fun b!427111 () Bool)

(assert (=> b!427111 (= e!253293 e!253290)))

(declare-fun res!250442 () Bool)

(assert (=> b!427111 (=> (not res!250442) (not e!253290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26119 (_ BitVec 32)) Bool)

(assert (=> b!427111 (= res!250442 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195171 mask!1025))))

(assert (=> b!427111 (= lt!195171 (array!26120 (store (arr!12509 _keys!709) i!563 k0!794) (size!12861 _keys!709)))))

(declare-fun b!427112 () Bool)

(assert (=> b!427112 (= e!253296 (not true))))

(declare-fun +!1316 (ListLongMap!6289 tuple2!7376) ListLongMap!6289)

(assert (=> b!427112 (= (getCurrentListMapNoExtraKeys!1364 lt!195171 lt!195169 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1316 (getCurrentListMapNoExtraKeys!1364 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7377 k0!794 v!412)))))

(declare-datatypes ((Unit!12534 0))(
  ( (Unit!12535) )
))
(declare-fun lt!195173 () Unit!12534)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!511 (array!26119 array!26117 (_ BitVec 32) (_ BitVec 32) V!15957 V!15957 (_ BitVec 32) (_ BitVec 64) V!15957 (_ BitVec 32) Int) Unit!12534)

(assert (=> b!427112 (= lt!195173 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!511 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427113 () Bool)

(declare-fun res!250439 () Bool)

(assert (=> b!427113 (=> (not res!250439) (not e!253290))))

(declare-datatypes ((List!7393 0))(
  ( (Nil!7390) (Cons!7389 (h!8245 (_ BitVec 64)) (t!12837 List!7393)) )
))
(declare-fun arrayNoDuplicates!0 (array!26119 (_ BitVec 32) List!7393) Bool)

(assert (=> b!427113 (= res!250439 (arrayNoDuplicates!0 lt!195171 #b00000000000000000000000000000000 Nil!7390))))

(declare-fun b!427114 () Bool)

(declare-fun res!250438 () Bool)

(assert (=> b!427114 (=> (not res!250438) (not e!253293))))

(assert (=> b!427114 (= res!250438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427115 () Bool)

(declare-fun res!250445 () Bool)

(assert (=> b!427115 (=> (not res!250445) (not e!253293))))

(assert (=> b!427115 (= res!250445 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7390))))

(declare-fun b!427116 () Bool)

(declare-fun res!250448 () Bool)

(assert (=> b!427116 (=> (not res!250448) (not e!253293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427116 (= res!250448 (validKeyInArray!0 k0!794))))

(declare-fun b!427117 () Bool)

(declare-fun res!250444 () Bool)

(assert (=> b!427117 (=> (not res!250444) (not e!253293))))

(assert (=> b!427117 (= res!250444 (or (= (select (arr!12509 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12509 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427118 () Bool)

(declare-fun e!253295 () Bool)

(assert (=> b!427118 (= e!253295 (and e!253292 mapRes!18330))))

(declare-fun condMapEmpty!18330 () Bool)

(declare-fun mapDefault!18330 () ValueCell!5226)

(assert (=> b!427118 (= condMapEmpty!18330 (= (arr!12508 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5226)) mapDefault!18330)))))

(declare-fun b!427110 () Bool)

(declare-fun res!250447 () Bool)

(assert (=> b!427110 (=> (not res!250447) (not e!253293))))

(assert (=> b!427110 (= res!250447 (and (= (size!12860 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12861 _keys!709) (size!12860 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!250443 () Bool)

(assert (=> start!39720 (=> (not res!250443) (not e!253293))))

(assert (=> start!39720 (= res!250443 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12861 _keys!709))))))

(assert (=> start!39720 e!253293))

(assert (=> start!39720 tp_is_empty!11139))

(assert (=> start!39720 tp!35490))

(assert (=> start!39720 true))

(declare-fun array_inv!9114 (array!26117) Bool)

(assert (=> start!39720 (and (array_inv!9114 _values!549) e!253295)))

(declare-fun array_inv!9115 (array!26119) Bool)

(assert (=> start!39720 (array_inv!9115 _keys!709)))

(assert (= (and start!39720 res!250443) b!427109))

(assert (= (and b!427109 res!250437) b!427110))

(assert (= (and b!427110 res!250447) b!427114))

(assert (= (and b!427114 res!250438) b!427115))

(assert (= (and b!427115 res!250445) b!427106))

(assert (= (and b!427106 res!250449) b!427116))

(assert (= (and b!427116 res!250448) b!427117))

(assert (= (and b!427117 res!250444) b!427105))

(assert (= (and b!427105 res!250441) b!427111))

(assert (= (and b!427111 res!250442) b!427113))

(assert (= (and b!427113 res!250439) b!427108))

(assert (= (and b!427108 res!250440) b!427107))

(assert (= (and b!427107 res!250446) b!427112))

(assert (= (and b!427118 condMapEmpty!18330) mapIsEmpty!18330))

(assert (= (and b!427118 (not condMapEmpty!18330)) mapNonEmpty!18330))

(get-info :version)

(assert (= (and mapNonEmpty!18330 ((_ is ValueCellFull!5226) mapValue!18330)) b!427104))

(assert (= (and b!427118 ((_ is ValueCellFull!5226) mapDefault!18330)) b!427103))

(assert (= start!39720 b!427118))

(declare-fun m!415655 () Bool)

(assert (=> b!427109 m!415655))

(declare-fun m!415657 () Bool)

(assert (=> b!427117 m!415657))

(declare-fun m!415659 () Bool)

(assert (=> b!427115 m!415659))

(declare-fun m!415661 () Bool)

(assert (=> start!39720 m!415661))

(declare-fun m!415663 () Bool)

(assert (=> start!39720 m!415663))

(declare-fun m!415665 () Bool)

(assert (=> b!427111 m!415665))

(declare-fun m!415667 () Bool)

(assert (=> b!427111 m!415667))

(declare-fun m!415669 () Bool)

(assert (=> b!427113 m!415669))

(declare-fun m!415671 () Bool)

(assert (=> b!427112 m!415671))

(declare-fun m!415673 () Bool)

(assert (=> b!427112 m!415673))

(assert (=> b!427112 m!415673))

(declare-fun m!415675 () Bool)

(assert (=> b!427112 m!415675))

(declare-fun m!415677 () Bool)

(assert (=> b!427112 m!415677))

(declare-fun m!415679 () Bool)

(assert (=> b!427116 m!415679))

(declare-fun m!415681 () Bool)

(assert (=> b!427114 m!415681))

(declare-fun m!415683 () Bool)

(assert (=> b!427105 m!415683))

(declare-fun m!415685 () Bool)

(assert (=> mapNonEmpty!18330 m!415685))

(declare-fun m!415687 () Bool)

(assert (=> b!427107 m!415687))

(declare-fun m!415689 () Bool)

(assert (=> b!427107 m!415689))

(declare-fun m!415691 () Bool)

(assert (=> b!427107 m!415691))

(check-sat (not b!427115) b_and!17643 (not b!427112) (not b!427113) (not b_next!9987) (not start!39720) (not b!427107) tp_is_empty!11139 (not b!427109) (not b!427105) (not b!427111) (not mapNonEmpty!18330) (not b!427116) (not b!427114))
(check-sat b_and!17643 (not b_next!9987))
