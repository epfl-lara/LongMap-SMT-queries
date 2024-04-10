; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38550 () Bool)

(assert start!38550)

(declare-fun b_free!9087 () Bool)

(declare-fun b_next!9087 () Bool)

(assert (=> start!38550 (= b_free!9087 (not b_next!9087))))

(declare-fun tp!32384 () Bool)

(declare-fun b_and!16473 () Bool)

(assert (=> start!38550 (= tp!32384 b_and!16473)))

(declare-datatypes ((V!14397 0))(
  ( (V!14398 (val!5029 Int)) )
))
(declare-fun minValue!515 () V!14397)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!6652 0))(
  ( (tuple2!6653 (_1!3337 (_ BitVec 64)) (_2!3337 V!14397)) )
))
(declare-datatypes ((List!6579 0))(
  ( (Nil!6576) (Cons!6575 (h!7431 tuple2!6652) (t!11753 List!6579)) )
))
(declare-datatypes ((ListLongMap!5565 0))(
  ( (ListLongMap!5566 (toList!2798 List!6579)) )
))
(declare-fun call!27925 () ListLongMap!5565)

(declare-datatypes ((ValueCell!4641 0))(
  ( (ValueCellFull!4641 (v!7276 V!14397)) (EmptyCell!4641) )
))
(declare-datatypes ((array!23849 0))(
  ( (array!23850 (arr!11374 (Array (_ BitVec 32) ValueCell!4641)) (size!11726 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23849)

(declare-fun c!54587 () Bool)

(declare-datatypes ((array!23851 0))(
  ( (array!23852 (arr!11375 (Array (_ BitVec 32) (_ BitVec 64))) (size!11727 (_ BitVec 32))) )
))
(declare-fun lt!187486 () array!23851)

(declare-fun zeroValue!515 () V!14397)

(declare-fun bm!27922 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!14397)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!23851)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1017 (array!23851 array!23849 (_ BitVec 32) (_ BitVec 32) V!14397 V!14397 (_ BitVec 32) Int) ListLongMap!5565)

(assert (=> bm!27922 (= call!27925 (getCurrentListMapNoExtraKeys!1017 (ite c!54587 lt!187486 _keys!709) (ite c!54587 (array!23850 (store (arr!11374 _values!549) i!563 (ValueCellFull!4641 v!412)) (size!11726 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398677 () Bool)

(declare-fun e!240919 () Bool)

(declare-fun tp_is_empty!9969 () Bool)

(assert (=> b!398677 (= e!240919 tp_is_empty!9969)))

(declare-fun b!398678 () Bool)

(declare-fun res!229138 () Bool)

(declare-fun e!240921 () Bool)

(assert (=> b!398678 (=> (not res!229138) (not e!240921))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23851 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398678 (= res!229138 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16575 () Bool)

(declare-fun mapRes!16575 () Bool)

(assert (=> mapIsEmpty!16575 mapRes!16575))

(declare-fun b!398679 () Bool)

(declare-fun e!240915 () Bool)

(assert (=> b!398679 (= e!240915 (not true))))

(declare-fun e!240920 () Bool)

(assert (=> b!398679 e!240920))

(assert (=> b!398679 (= c!54587 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12082 0))(
  ( (Unit!12083) )
))
(declare-fun lt!187487 () Unit!12082)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!299 (array!23851 array!23849 (_ BitVec 32) (_ BitVec 32) V!14397 V!14397 (_ BitVec 32) (_ BitVec 64) V!14397 (_ BitVec 32) Int) Unit!12082)

(assert (=> b!398679 (= lt!187487 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!299 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398680 () Bool)

(declare-fun call!27926 () ListLongMap!5565)

(declare-fun +!1088 (ListLongMap!5565 tuple2!6652) ListLongMap!5565)

(assert (=> b!398680 (= e!240920 (= call!27925 (+!1088 call!27926 (tuple2!6653 k0!794 v!412))))))

(declare-fun b!398681 () Bool)

(declare-fun res!229148 () Bool)

(assert (=> b!398681 (=> (not res!229148) (not e!240915))))

(declare-datatypes ((List!6580 0))(
  ( (Nil!6577) (Cons!6576 (h!7432 (_ BitVec 64)) (t!11754 List!6580)) )
))
(declare-fun arrayNoDuplicates!0 (array!23851 (_ BitVec 32) List!6580) Bool)

(assert (=> b!398681 (= res!229148 (arrayNoDuplicates!0 lt!187486 #b00000000000000000000000000000000 Nil!6577))))

(declare-fun b!398682 () Bool)

(assert (=> b!398682 (= e!240920 (= call!27926 call!27925))))

(declare-fun b!398683 () Bool)

(declare-fun res!229145 () Bool)

(assert (=> b!398683 (=> (not res!229145) (not e!240921))))

(assert (=> b!398683 (= res!229145 (or (= (select (arr!11375 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11375 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!398684 () Bool)

(declare-fun res!229147 () Bool)

(assert (=> b!398684 (=> (not res!229147) (not e!240915))))

(assert (=> b!398684 (= res!229147 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11727 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!398685 () Bool)

(declare-fun res!229141 () Bool)

(assert (=> b!398685 (=> (not res!229141) (not e!240921))))

(assert (=> b!398685 (= res!229141 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11727 _keys!709))))))

(declare-fun bm!27923 () Bool)

(assert (=> bm!27923 (= call!27926 (getCurrentListMapNoExtraKeys!1017 (ite c!54587 _keys!709 lt!187486) (ite c!54587 _values!549 (array!23850 (store (arr!11374 _values!549) i!563 (ValueCellFull!4641 v!412)) (size!11726 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!398686 () Bool)

(declare-fun res!229142 () Bool)

(assert (=> b!398686 (=> (not res!229142) (not e!240921))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!398686 (= res!229142 (validMask!0 mask!1025))))

(declare-fun res!229139 () Bool)

(assert (=> start!38550 (=> (not res!229139) (not e!240921))))

(assert (=> start!38550 (= res!229139 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11727 _keys!709))))))

(assert (=> start!38550 e!240921))

(assert (=> start!38550 tp_is_empty!9969))

(assert (=> start!38550 tp!32384))

(assert (=> start!38550 true))

(declare-fun e!240918 () Bool)

(declare-fun array_inv!8336 (array!23849) Bool)

(assert (=> start!38550 (and (array_inv!8336 _values!549) e!240918)))

(declare-fun array_inv!8337 (array!23851) Bool)

(assert (=> start!38550 (array_inv!8337 _keys!709)))

(declare-fun b!398687 () Bool)

(declare-fun res!229146 () Bool)

(assert (=> b!398687 (=> (not res!229146) (not e!240921))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23851 (_ BitVec 32)) Bool)

(assert (=> b!398687 (= res!229146 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!16575 () Bool)

(declare-fun tp!32385 () Bool)

(assert (=> mapNonEmpty!16575 (= mapRes!16575 (and tp!32385 e!240919))))

(declare-fun mapRest!16575 () (Array (_ BitVec 32) ValueCell!4641))

(declare-fun mapKey!16575 () (_ BitVec 32))

(declare-fun mapValue!16575 () ValueCell!4641)

(assert (=> mapNonEmpty!16575 (= (arr!11374 _values!549) (store mapRest!16575 mapKey!16575 mapValue!16575))))

(declare-fun b!398688 () Bool)

(declare-fun res!229149 () Bool)

(assert (=> b!398688 (=> (not res!229149) (not e!240921))))

(assert (=> b!398688 (= res!229149 (and (= (size!11726 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11727 _keys!709) (size!11726 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398689 () Bool)

(declare-fun res!229143 () Bool)

(assert (=> b!398689 (=> (not res!229143) (not e!240921))))

(assert (=> b!398689 (= res!229143 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6577))))

(declare-fun b!398690 () Bool)

(declare-fun e!240916 () Bool)

(assert (=> b!398690 (= e!240918 (and e!240916 mapRes!16575))))

(declare-fun condMapEmpty!16575 () Bool)

(declare-fun mapDefault!16575 () ValueCell!4641)

(assert (=> b!398690 (= condMapEmpty!16575 (= (arr!11374 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4641)) mapDefault!16575)))))

(declare-fun b!398691 () Bool)

(declare-fun res!229144 () Bool)

(assert (=> b!398691 (=> (not res!229144) (not e!240921))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398691 (= res!229144 (validKeyInArray!0 k0!794))))

(declare-fun b!398692 () Bool)

(assert (=> b!398692 (= e!240921 e!240915)))

(declare-fun res!229140 () Bool)

(assert (=> b!398692 (=> (not res!229140) (not e!240915))))

(assert (=> b!398692 (= res!229140 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187486 mask!1025))))

(assert (=> b!398692 (= lt!187486 (array!23852 (store (arr!11375 _keys!709) i!563 k0!794) (size!11727 _keys!709)))))

(declare-fun b!398693 () Bool)

(assert (=> b!398693 (= e!240916 tp_is_empty!9969)))

(assert (= (and start!38550 res!229139) b!398686))

(assert (= (and b!398686 res!229142) b!398688))

(assert (= (and b!398688 res!229149) b!398687))

(assert (= (and b!398687 res!229146) b!398689))

(assert (= (and b!398689 res!229143) b!398685))

(assert (= (and b!398685 res!229141) b!398691))

(assert (= (and b!398691 res!229144) b!398683))

(assert (= (and b!398683 res!229145) b!398678))

(assert (= (and b!398678 res!229138) b!398692))

(assert (= (and b!398692 res!229140) b!398681))

(assert (= (and b!398681 res!229148) b!398684))

(assert (= (and b!398684 res!229147) b!398679))

(assert (= (and b!398679 c!54587) b!398680))

(assert (= (and b!398679 (not c!54587)) b!398682))

(assert (= (or b!398680 b!398682) bm!27922))

(assert (= (or b!398680 b!398682) bm!27923))

(assert (= (and b!398690 condMapEmpty!16575) mapIsEmpty!16575))

(assert (= (and b!398690 (not condMapEmpty!16575)) mapNonEmpty!16575))

(get-info :version)

(assert (= (and mapNonEmpty!16575 ((_ is ValueCellFull!4641) mapValue!16575)) b!398677))

(assert (= (and b!398690 ((_ is ValueCellFull!4641) mapDefault!16575)) b!398693))

(assert (= start!38550 b!398690))

(declare-fun m!393455 () Bool)

(assert (=> start!38550 m!393455))

(declare-fun m!393457 () Bool)

(assert (=> start!38550 m!393457))

(declare-fun m!393459 () Bool)

(assert (=> b!398689 m!393459))

(declare-fun m!393461 () Bool)

(assert (=> b!398679 m!393461))

(declare-fun m!393463 () Bool)

(assert (=> b!398680 m!393463))

(declare-fun m!393465 () Bool)

(assert (=> bm!27922 m!393465))

(declare-fun m!393467 () Bool)

(assert (=> bm!27922 m!393467))

(declare-fun m!393469 () Bool)

(assert (=> b!398687 m!393469))

(declare-fun m!393471 () Bool)

(assert (=> b!398692 m!393471))

(declare-fun m!393473 () Bool)

(assert (=> b!398692 m!393473))

(declare-fun m!393475 () Bool)

(assert (=> b!398681 m!393475))

(declare-fun m!393477 () Bool)

(assert (=> b!398678 m!393477))

(declare-fun m!393479 () Bool)

(assert (=> b!398691 m!393479))

(declare-fun m!393481 () Bool)

(assert (=> mapNonEmpty!16575 m!393481))

(declare-fun m!393483 () Bool)

(assert (=> b!398683 m!393483))

(assert (=> bm!27923 m!393465))

(declare-fun m!393485 () Bool)

(assert (=> bm!27923 m!393485))

(declare-fun m!393487 () Bool)

(assert (=> b!398686 m!393487))

(check-sat (not b!398692) b_and!16473 (not bm!27922) (not b!398679) (not b!398687) (not bm!27923) (not b!398689) (not mapNonEmpty!16575) (not start!38550) (not b!398680) (not b!398678) (not b!398681) tp_is_empty!9969 (not b!398691) (not b!398686) (not b_next!9087))
(check-sat b_and!16473 (not b_next!9087))
