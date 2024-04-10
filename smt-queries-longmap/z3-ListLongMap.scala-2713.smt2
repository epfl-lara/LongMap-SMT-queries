; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40098 () Bool)

(assert start!40098)

(declare-fun b_free!10365 () Bool)

(declare-fun b_next!10365 () Bool)

(assert (=> start!40098 (= b_free!10365 (not b_next!10365))))

(declare-fun tp!36623 () Bool)

(declare-fun b_and!18333 () Bool)

(assert (=> start!40098 (= tp!36623 b_and!18333)))

(declare-fun b!438116 () Bool)

(declare-fun res!258618 () Bool)

(declare-fun e!258476 () Bool)

(assert (=> b!438116 (=> (not res!258618) (not e!258476))))

(declare-datatypes ((array!26851 0))(
  ( (array!26852 (arr!12875 (Array (_ BitVec 32) (_ BitVec 64))) (size!13227 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26851)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!26851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!438116 (= res!258618 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!438117 () Bool)

(declare-fun res!258619 () Bool)

(assert (=> b!438117 (=> (not res!258619) (not e!258476))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26851 (_ BitVec 32)) Bool)

(assert (=> b!438117 (= res!258619 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!438118 () Bool)

(declare-fun e!258478 () Bool)

(assert (=> b!438118 (= e!258476 e!258478)))

(declare-fun res!258615 () Bool)

(assert (=> b!438118 (=> (not res!258615) (not e!258478))))

(declare-fun lt!201857 () array!26851)

(assert (=> b!438118 (= res!258615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201857 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!438118 (= lt!201857 (array!26852 (store (arr!12875 _keys!709) i!563 k0!794) (size!13227 _keys!709)))))

(declare-fun b!438119 () Bool)

(declare-fun res!258611 () Bool)

(assert (=> b!438119 (=> (not res!258611) (not e!258476))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16461 0))(
  ( (V!16462 (val!5803 Int)) )
))
(declare-datatypes ((ValueCell!5415 0))(
  ( (ValueCellFull!5415 (v!8050 V!16461)) (EmptyCell!5415) )
))
(declare-datatypes ((array!26853 0))(
  ( (array!26854 (arr!12876 (Array (_ BitVec 32) ValueCell!5415)) (size!13228 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26853)

(assert (=> b!438119 (= res!258611 (and (= (size!13228 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13227 _keys!709) (size!13228 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!438120 () Bool)

(declare-fun res!258612 () Bool)

(assert (=> b!438120 (=> (not res!258612) (not e!258476))))

(declare-datatypes ((List!7691 0))(
  ( (Nil!7688) (Cons!7687 (h!8543 (_ BitVec 64)) (t!13447 List!7691)) )
))
(declare-fun arrayNoDuplicates!0 (array!26851 (_ BitVec 32) List!7691) Bool)

(assert (=> b!438120 (= res!258612 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7688))))

(declare-fun b!438121 () Bool)

(declare-fun res!258609 () Bool)

(assert (=> b!438121 (=> (not res!258609) (not e!258476))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!438121 (= res!258609 (validKeyInArray!0 k0!794))))

(declare-fun b!438122 () Bool)

(declare-fun e!258474 () Bool)

(assert (=> b!438122 (= e!258478 e!258474)))

(declare-fun res!258614 () Bool)

(assert (=> b!438122 (=> (not res!258614) (not e!258474))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!438122 (= res!258614 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16461)

(declare-datatypes ((tuple2!7692 0))(
  ( (tuple2!7693 (_1!3857 (_ BitVec 64)) (_2!3857 V!16461)) )
))
(declare-datatypes ((List!7692 0))(
  ( (Nil!7689) (Cons!7688 (h!8544 tuple2!7692) (t!13448 List!7692)) )
))
(declare-datatypes ((ListLongMap!6605 0))(
  ( (ListLongMap!6606 (toList!3318 List!7692)) )
))
(declare-fun lt!201858 () ListLongMap!6605)

(declare-fun lt!201856 () array!26853)

(declare-fun minValue!515 () V!16461)

(declare-fun getCurrentListMapNoExtraKeys!1507 (array!26851 array!26853 (_ BitVec 32) (_ BitVec 32) V!16461 V!16461 (_ BitVec 32) Int) ListLongMap!6605)

(assert (=> b!438122 (= lt!201858 (getCurrentListMapNoExtraKeys!1507 lt!201857 lt!201856 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!16461)

(assert (=> b!438122 (= lt!201856 (array!26854 (store (arr!12876 _values!549) i!563 (ValueCellFull!5415 v!412)) (size!13228 _values!549)))))

(declare-fun lt!201859 () ListLongMap!6605)

(assert (=> b!438122 (= lt!201859 (getCurrentListMapNoExtraKeys!1507 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!438123 () Bool)

(declare-fun res!258617 () Bool)

(assert (=> b!438123 (=> (not res!258617) (not e!258478))))

(assert (=> b!438123 (= res!258617 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18897 () Bool)

(declare-fun mapRes!18897 () Bool)

(declare-fun tp!36624 () Bool)

(declare-fun e!258475 () Bool)

(assert (=> mapNonEmpty!18897 (= mapRes!18897 (and tp!36624 e!258475))))

(declare-fun mapKey!18897 () (_ BitVec 32))

(declare-fun mapRest!18897 () (Array (_ BitVec 32) ValueCell!5415))

(declare-fun mapValue!18897 () ValueCell!5415)

(assert (=> mapNonEmpty!18897 (= (arr!12876 _values!549) (store mapRest!18897 mapKey!18897 mapValue!18897))))

(declare-fun b!438124 () Bool)

(declare-fun tp_is_empty!11517 () Bool)

(assert (=> b!438124 (= e!258475 tp_is_empty!11517)))

(declare-fun res!258620 () Bool)

(assert (=> start!40098 (=> (not res!258620) (not e!258476))))

(assert (=> start!40098 (= res!258620 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13227 _keys!709))))))

(assert (=> start!40098 e!258476))

(assert (=> start!40098 tp_is_empty!11517))

(assert (=> start!40098 tp!36623))

(assert (=> start!40098 true))

(declare-fun e!258479 () Bool)

(declare-fun array_inv!9352 (array!26853) Bool)

(assert (=> start!40098 (and (array_inv!9352 _values!549) e!258479)))

(declare-fun array_inv!9353 (array!26851) Bool)

(assert (=> start!40098 (array_inv!9353 _keys!709)))

(declare-fun b!438125 () Bool)

(declare-fun res!258613 () Bool)

(assert (=> b!438125 (=> (not res!258613) (not e!258476))))

(assert (=> b!438125 (= res!258613 (or (= (select (arr!12875 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12875 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18897 () Bool)

(assert (=> mapIsEmpty!18897 mapRes!18897))

(declare-fun b!438126 () Bool)

(declare-fun res!258616 () Bool)

(assert (=> b!438126 (=> (not res!258616) (not e!258476))))

(assert (=> b!438126 (= res!258616 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13227 _keys!709))))))

(declare-fun b!438127 () Bool)

(declare-fun res!258610 () Bool)

(assert (=> b!438127 (=> (not res!258610) (not e!258478))))

(assert (=> b!438127 (= res!258610 (arrayNoDuplicates!0 lt!201857 #b00000000000000000000000000000000 Nil!7688))))

(declare-fun b!438128 () Bool)

(declare-fun e!258480 () Bool)

(assert (=> b!438128 (= e!258480 tp_is_empty!11517)))

(declare-fun b!438129 () Bool)

(assert (=> b!438129 (= e!258479 (and e!258480 mapRes!18897))))

(declare-fun condMapEmpty!18897 () Bool)

(declare-fun mapDefault!18897 () ValueCell!5415)

(assert (=> b!438129 (= condMapEmpty!18897 (= (arr!12876 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5415)) mapDefault!18897)))))

(declare-fun b!438130 () Bool)

(assert (=> b!438130 (= e!258474 (not true))))

(declare-fun +!1462 (ListLongMap!6605 tuple2!7692) ListLongMap!6605)

(assert (=> b!438130 (= (getCurrentListMapNoExtraKeys!1507 lt!201857 lt!201856 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1462 (getCurrentListMapNoExtraKeys!1507 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7693 k0!794 v!412)))))

(declare-datatypes ((Unit!13028 0))(
  ( (Unit!13029) )
))
(declare-fun lt!201860 () Unit!13028)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!631 (array!26851 array!26853 (_ BitVec 32) (_ BitVec 32) V!16461 V!16461 (_ BitVec 32) (_ BitVec 64) V!16461 (_ BitVec 32) Int) Unit!13028)

(assert (=> b!438130 (= lt!201860 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!631 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!438131 () Bool)

(declare-fun res!258621 () Bool)

(assert (=> b!438131 (=> (not res!258621) (not e!258476))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!438131 (= res!258621 (validMask!0 mask!1025))))

(assert (= (and start!40098 res!258620) b!438131))

(assert (= (and b!438131 res!258621) b!438119))

(assert (= (and b!438119 res!258611) b!438117))

(assert (= (and b!438117 res!258619) b!438120))

(assert (= (and b!438120 res!258612) b!438126))

(assert (= (and b!438126 res!258616) b!438121))

(assert (= (and b!438121 res!258609) b!438125))

(assert (= (and b!438125 res!258613) b!438116))

(assert (= (and b!438116 res!258618) b!438118))

(assert (= (and b!438118 res!258615) b!438127))

(assert (= (and b!438127 res!258610) b!438123))

(assert (= (and b!438123 res!258617) b!438122))

(assert (= (and b!438122 res!258614) b!438130))

(assert (= (and b!438129 condMapEmpty!18897) mapIsEmpty!18897))

(assert (= (and b!438129 (not condMapEmpty!18897)) mapNonEmpty!18897))

(get-info :version)

(assert (= (and mapNonEmpty!18897 ((_ is ValueCellFull!5415) mapValue!18897)) b!438124))

(assert (= (and b!438129 ((_ is ValueCellFull!5415) mapDefault!18897)) b!438128))

(assert (= start!40098 b!438129))

(declare-fun m!425645 () Bool)

(assert (=> b!438122 m!425645))

(declare-fun m!425647 () Bool)

(assert (=> b!438122 m!425647))

(declare-fun m!425649 () Bool)

(assert (=> b!438122 m!425649))

(declare-fun m!425651 () Bool)

(assert (=> b!438130 m!425651))

(declare-fun m!425653 () Bool)

(assert (=> b!438130 m!425653))

(assert (=> b!438130 m!425653))

(declare-fun m!425655 () Bool)

(assert (=> b!438130 m!425655))

(declare-fun m!425657 () Bool)

(assert (=> b!438130 m!425657))

(declare-fun m!425659 () Bool)

(assert (=> b!438116 m!425659))

(declare-fun m!425661 () Bool)

(assert (=> start!40098 m!425661))

(declare-fun m!425663 () Bool)

(assert (=> start!40098 m!425663))

(declare-fun m!425665 () Bool)

(assert (=> b!438120 m!425665))

(declare-fun m!425667 () Bool)

(assert (=> b!438121 m!425667))

(declare-fun m!425669 () Bool)

(assert (=> b!438118 m!425669))

(declare-fun m!425671 () Bool)

(assert (=> b!438118 m!425671))

(declare-fun m!425673 () Bool)

(assert (=> b!438117 m!425673))

(declare-fun m!425675 () Bool)

(assert (=> b!438127 m!425675))

(declare-fun m!425677 () Bool)

(assert (=> mapNonEmpty!18897 m!425677))

(declare-fun m!425679 () Bool)

(assert (=> b!438131 m!425679))

(declare-fun m!425681 () Bool)

(assert (=> b!438125 m!425681))

(check-sat b_and!18333 (not b!438118) (not start!40098) (not b!438131) (not b!438121) (not mapNonEmpty!18897) (not b_next!10365) (not b!438117) (not b!438122) (not b!438116) (not b!438130) (not b!438127) (not b!438120) tp_is_empty!11517)
(check-sat b_and!18333 (not b_next!10365))
