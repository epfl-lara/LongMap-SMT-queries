; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40050 () Bool)

(assert start!40050)

(declare-fun b_free!10317 () Bool)

(declare-fun b_next!10317 () Bool)

(assert (=> start!40050 (= b_free!10317 (not b_next!10317))))

(declare-fun tp!36480 () Bool)

(declare-fun b_and!18285 () Bool)

(assert (=> start!40050 (= tp!36480 b_and!18285)))

(declare-fun b!436964 () Bool)

(declare-fun e!257976 () Bool)

(declare-fun tp_is_empty!11469 () Bool)

(assert (=> b!436964 (= e!257976 tp_is_empty!11469)))

(declare-fun b!436965 () Bool)

(declare-fun res!257679 () Bool)

(declare-fun e!257972 () Bool)

(assert (=> b!436965 (=> (not res!257679) (not e!257972))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!436965 (= res!257679 (bvsle from!863 i!563))))

(declare-fun b!436966 () Bool)

(declare-fun res!257681 () Bool)

(declare-fun e!257970 () Bool)

(assert (=> b!436966 (=> (not res!257681) (not e!257970))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!436966 (= res!257681 (validKeyInArray!0 k0!794))))

(declare-fun b!436967 () Bool)

(declare-fun res!257677 () Bool)

(assert (=> b!436967 (=> (not res!257677) (not e!257970))))

(declare-datatypes ((array!26761 0))(
  ( (array!26762 (arr!12830 (Array (_ BitVec 32) (_ BitVec 64))) (size!13182 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26761)

(declare-fun arrayContainsKey!0 (array!26761 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!436967 (= res!257677 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!436968 () Bool)

(declare-fun e!257973 () Bool)

(assert (=> b!436968 (= e!257973 (not true))))

(declare-fun lt!201496 () array!26761)

(declare-datatypes ((V!16397 0))(
  ( (V!16398 (val!5779 Int)) )
))
(declare-fun minValue!515 () V!16397)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5391 0))(
  ( (ValueCellFull!5391 (v!8026 V!16397)) (EmptyCell!5391) )
))
(declare-datatypes ((array!26763 0))(
  ( (array!26764 (arr!12831 (Array (_ BitVec 32) ValueCell!5391)) (size!13183 (_ BitVec 32))) )
))
(declare-fun lt!201497 () array!26763)

(declare-fun _values!549 () array!26763)

(declare-fun zeroValue!515 () V!16397)

(declare-fun v!412 () V!16397)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7660 0))(
  ( (tuple2!7661 (_1!3841 (_ BitVec 64)) (_2!3841 V!16397)) )
))
(declare-datatypes ((List!7659 0))(
  ( (Nil!7656) (Cons!7655 (h!8511 tuple2!7660) (t!13415 List!7659)) )
))
(declare-datatypes ((ListLongMap!6573 0))(
  ( (ListLongMap!6574 (toList!3302 List!7659)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1491 (array!26761 array!26763 (_ BitVec 32) (_ BitVec 32) V!16397 V!16397 (_ BitVec 32) Int) ListLongMap!6573)

(declare-fun +!1448 (ListLongMap!6573 tuple2!7660) ListLongMap!6573)

(assert (=> b!436968 (= (getCurrentListMapNoExtraKeys!1491 lt!201496 lt!201497 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1448 (getCurrentListMapNoExtraKeys!1491 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7661 k0!794 v!412)))))

(declare-datatypes ((Unit!13000 0))(
  ( (Unit!13001) )
))
(declare-fun lt!201499 () Unit!13000)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!617 (array!26761 array!26763 (_ BitVec 32) (_ BitVec 32) V!16397 V!16397 (_ BitVec 32) (_ BitVec 64) V!16397 (_ BitVec 32) Int) Unit!13000)

(assert (=> b!436968 (= lt!201499 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!617 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!436969 () Bool)

(assert (=> b!436969 (= e!257970 e!257972)))

(declare-fun res!257678 () Bool)

(assert (=> b!436969 (=> (not res!257678) (not e!257972))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26761 (_ BitVec 32)) Bool)

(assert (=> b!436969 (= res!257678 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201496 mask!1025))))

(assert (=> b!436969 (= lt!201496 (array!26762 (store (arr!12830 _keys!709) i!563 k0!794) (size!13182 _keys!709)))))

(declare-fun b!436970 () Bool)

(declare-fun res!257675 () Bool)

(assert (=> b!436970 (=> (not res!257675) (not e!257970))))

(assert (=> b!436970 (= res!257675 (and (= (size!13183 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13182 _keys!709) (size!13183 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!257673 () Bool)

(assert (=> start!40050 (=> (not res!257673) (not e!257970))))

(assert (=> start!40050 (= res!257673 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13182 _keys!709))))))

(assert (=> start!40050 e!257970))

(assert (=> start!40050 tp_is_empty!11469))

(assert (=> start!40050 tp!36480))

(assert (=> start!40050 true))

(declare-fun e!257971 () Bool)

(declare-fun array_inv!9322 (array!26763) Bool)

(assert (=> start!40050 (and (array_inv!9322 _values!549) e!257971)))

(declare-fun array_inv!9323 (array!26761) Bool)

(assert (=> start!40050 (array_inv!9323 _keys!709)))

(declare-fun b!436971 () Bool)

(declare-fun res!257684 () Bool)

(assert (=> b!436971 (=> (not res!257684) (not e!257970))))

(assert (=> b!436971 (= res!257684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!436972 () Bool)

(declare-fun res!257680 () Bool)

(assert (=> b!436972 (=> (not res!257680) (not e!257970))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!436972 (= res!257680 (validMask!0 mask!1025))))

(declare-fun b!436973 () Bool)

(declare-fun e!257974 () Bool)

(assert (=> b!436973 (= e!257974 tp_is_empty!11469)))

(declare-fun b!436974 () Bool)

(declare-fun res!257683 () Bool)

(assert (=> b!436974 (=> (not res!257683) (not e!257972))))

(declare-datatypes ((List!7660 0))(
  ( (Nil!7657) (Cons!7656 (h!8512 (_ BitVec 64)) (t!13416 List!7660)) )
))
(declare-fun arrayNoDuplicates!0 (array!26761 (_ BitVec 32) List!7660) Bool)

(assert (=> b!436974 (= res!257683 (arrayNoDuplicates!0 lt!201496 #b00000000000000000000000000000000 Nil!7657))))

(declare-fun mapNonEmpty!18825 () Bool)

(declare-fun mapRes!18825 () Bool)

(declare-fun tp!36479 () Bool)

(assert (=> mapNonEmpty!18825 (= mapRes!18825 (and tp!36479 e!257976))))

(declare-fun mapKey!18825 () (_ BitVec 32))

(declare-fun mapRest!18825 () (Array (_ BitVec 32) ValueCell!5391))

(declare-fun mapValue!18825 () ValueCell!5391)

(assert (=> mapNonEmpty!18825 (= (arr!12831 _values!549) (store mapRest!18825 mapKey!18825 mapValue!18825))))

(declare-fun b!436975 () Bool)

(declare-fun res!257685 () Bool)

(assert (=> b!436975 (=> (not res!257685) (not e!257970))))

(assert (=> b!436975 (= res!257685 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7657))))

(declare-fun b!436976 () Bool)

(assert (=> b!436976 (= e!257971 (and e!257974 mapRes!18825))))

(declare-fun condMapEmpty!18825 () Bool)

(declare-fun mapDefault!18825 () ValueCell!5391)

(assert (=> b!436976 (= condMapEmpty!18825 (= (arr!12831 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5391)) mapDefault!18825)))))

(declare-fun b!436977 () Bool)

(assert (=> b!436977 (= e!257972 e!257973)))

(declare-fun res!257676 () Bool)

(assert (=> b!436977 (=> (not res!257676) (not e!257973))))

(assert (=> b!436977 (= res!257676 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201498 () ListLongMap!6573)

(assert (=> b!436977 (= lt!201498 (getCurrentListMapNoExtraKeys!1491 lt!201496 lt!201497 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!436977 (= lt!201497 (array!26764 (store (arr!12831 _values!549) i!563 (ValueCellFull!5391 v!412)) (size!13183 _values!549)))))

(declare-fun lt!201500 () ListLongMap!6573)

(assert (=> b!436977 (= lt!201500 (getCurrentListMapNoExtraKeys!1491 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18825 () Bool)

(assert (=> mapIsEmpty!18825 mapRes!18825))

(declare-fun b!436978 () Bool)

(declare-fun res!257682 () Bool)

(assert (=> b!436978 (=> (not res!257682) (not e!257970))))

(assert (=> b!436978 (= res!257682 (or (= (select (arr!12830 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12830 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!436979 () Bool)

(declare-fun res!257674 () Bool)

(assert (=> b!436979 (=> (not res!257674) (not e!257970))))

(assert (=> b!436979 (= res!257674 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13182 _keys!709))))))

(assert (= (and start!40050 res!257673) b!436972))

(assert (= (and b!436972 res!257680) b!436970))

(assert (= (and b!436970 res!257675) b!436971))

(assert (= (and b!436971 res!257684) b!436975))

(assert (= (and b!436975 res!257685) b!436979))

(assert (= (and b!436979 res!257674) b!436966))

(assert (= (and b!436966 res!257681) b!436978))

(assert (= (and b!436978 res!257682) b!436967))

(assert (= (and b!436967 res!257677) b!436969))

(assert (= (and b!436969 res!257678) b!436974))

(assert (= (and b!436974 res!257683) b!436965))

(assert (= (and b!436965 res!257679) b!436977))

(assert (= (and b!436977 res!257676) b!436968))

(assert (= (and b!436976 condMapEmpty!18825) mapIsEmpty!18825))

(assert (= (and b!436976 (not condMapEmpty!18825)) mapNonEmpty!18825))

(get-info :version)

(assert (= (and mapNonEmpty!18825 ((_ is ValueCellFull!5391) mapValue!18825)) b!436964))

(assert (= (and b!436976 ((_ is ValueCellFull!5391) mapDefault!18825)) b!436973))

(assert (= start!40050 b!436976))

(declare-fun m!424733 () Bool)

(assert (=> b!436966 m!424733))

(declare-fun m!424735 () Bool)

(assert (=> start!40050 m!424735))

(declare-fun m!424737 () Bool)

(assert (=> start!40050 m!424737))

(declare-fun m!424739 () Bool)

(assert (=> b!436967 m!424739))

(declare-fun m!424741 () Bool)

(assert (=> b!436969 m!424741))

(declare-fun m!424743 () Bool)

(assert (=> b!436969 m!424743))

(declare-fun m!424745 () Bool)

(assert (=> b!436975 m!424745))

(declare-fun m!424747 () Bool)

(assert (=> b!436971 m!424747))

(declare-fun m!424749 () Bool)

(assert (=> b!436974 m!424749))

(declare-fun m!424751 () Bool)

(assert (=> b!436972 m!424751))

(declare-fun m!424753 () Bool)

(assert (=> b!436977 m!424753))

(declare-fun m!424755 () Bool)

(assert (=> b!436977 m!424755))

(declare-fun m!424757 () Bool)

(assert (=> b!436977 m!424757))

(declare-fun m!424759 () Bool)

(assert (=> mapNonEmpty!18825 m!424759))

(declare-fun m!424761 () Bool)

(assert (=> b!436968 m!424761))

(declare-fun m!424763 () Bool)

(assert (=> b!436968 m!424763))

(assert (=> b!436968 m!424763))

(declare-fun m!424765 () Bool)

(assert (=> b!436968 m!424765))

(declare-fun m!424767 () Bool)

(assert (=> b!436968 m!424767))

(declare-fun m!424769 () Bool)

(assert (=> b!436978 m!424769))

(check-sat (not b!436972) b_and!18285 (not b!436974) (not b!436969) (not b!436967) (not mapNonEmpty!18825) (not b!436971) (not b!436966) (not b!436968) (not b_next!10317) (not b!436977) (not b!436975) (not start!40050) tp_is_empty!11469)
(check-sat b_and!18285 (not b_next!10317))
