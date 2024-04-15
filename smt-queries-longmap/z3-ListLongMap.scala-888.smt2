; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20428 () Bool)

(assert start!20428)

(declare-fun b_free!5083 () Bool)

(declare-fun b_next!5083 () Bool)

(assert (=> start!20428 (= b_free!5083 (not b_next!5083))))

(declare-fun tp!18280 () Bool)

(declare-fun b_and!11803 () Bool)

(assert (=> start!20428 (= tp!18280 b_and!11803)))

(declare-fun b!201975 () Bool)

(declare-fun e!132322 () Bool)

(declare-fun e!132319 () Bool)

(declare-fun mapRes!8477 () Bool)

(assert (=> b!201975 (= e!132322 (and e!132319 mapRes!8477))))

(declare-fun condMapEmpty!8477 () Bool)

(declare-datatypes ((V!6233 0))(
  ( (V!6234 (val!2514 Int)) )
))
(declare-datatypes ((ValueCell!2126 0))(
  ( (ValueCellFull!2126 (v!4478 V!6233)) (EmptyCell!2126) )
))
(declare-datatypes ((array!9091 0))(
  ( (array!9092 (arr!4295 (Array (_ BitVec 32) ValueCell!2126)) (size!4621 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9091)

(declare-fun mapDefault!8477 () ValueCell!2126)

(assert (=> b!201975 (= condMapEmpty!8477 (= (arr!4295 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2126)) mapDefault!8477)))))

(declare-fun b!201976 () Bool)

(declare-fun e!132320 () Bool)

(assert (=> b!201976 (= e!132320 true)))

(declare-datatypes ((tuple2!3784 0))(
  ( (tuple2!3785 (_1!1903 (_ BitVec 64)) (_2!1903 V!6233)) )
))
(declare-datatypes ((List!2700 0))(
  ( (Nil!2697) (Cons!2696 (h!3338 tuple2!3784) (t!7622 List!2700)) )
))
(declare-datatypes ((ListLongMap!2687 0))(
  ( (ListLongMap!2688 (toList!1359 List!2700)) )
))
(declare-fun lt!101107 () ListLongMap!2687)

(declare-fun lt!101105 () ListLongMap!2687)

(declare-fun lt!101103 () tuple2!3784)

(declare-fun lt!101099 () tuple2!3784)

(declare-fun +!408 (ListLongMap!2687 tuple2!3784) ListLongMap!2687)

(assert (=> b!201976 (= (+!408 lt!101105 lt!101099) (+!408 lt!101107 lt!101103))))

(declare-datatypes ((Unit!6068 0))(
  ( (Unit!6069) )
))
(declare-fun lt!101102 () Unit!6068)

(declare-fun minValue!615 () V!6233)

(declare-fun v!520 () V!6233)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!101100 () ListLongMap!2687)

(declare-fun addCommutativeForDiffKeys!117 (ListLongMap!2687 (_ BitVec 64) V!6233 (_ BitVec 64) V!6233) Unit!6068)

(assert (=> b!201976 (= lt!101102 (addCommutativeForDiffKeys!117 lt!101100 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201977 () Bool)

(declare-fun res!96676 () Bool)

(declare-fun e!132324 () Bool)

(assert (=> b!201977 (=> (not res!96676) (not e!132324))))

(declare-datatypes ((array!9093 0))(
  ( (array!9094 (arr!4296 (Array (_ BitVec 32) (_ BitVec 64))) (size!4622 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9093)

(declare-datatypes ((List!2701 0))(
  ( (Nil!2698) (Cons!2697 (h!3339 (_ BitVec 64)) (t!7623 List!2701)) )
))
(declare-fun arrayNoDuplicates!0 (array!9093 (_ BitVec 32) List!2701) Bool)

(assert (=> b!201977 (= res!96676 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2698))))

(declare-fun b!201978 () Bool)

(declare-fun res!96677 () Bool)

(assert (=> b!201978 (=> (not res!96677) (not e!132324))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201978 (= res!96677 (validKeyInArray!0 k0!843))))

(declare-fun b!201979 () Bool)

(declare-fun e!132321 () Bool)

(assert (=> b!201979 (= e!132324 (not e!132321))))

(declare-fun res!96672 () Bool)

(assert (=> b!201979 (=> res!96672 e!132321)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201979 (= res!96672 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!101112 () ListLongMap!2687)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6233)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!917 (array!9093 array!9091 (_ BitVec 32) (_ BitVec 32) V!6233 V!6233 (_ BitVec 32) Int) ListLongMap!2687)

(assert (=> b!201979 (= lt!101112 (getCurrentListMap!917 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101101 () array!9091)

(declare-fun lt!101114 () ListLongMap!2687)

(assert (=> b!201979 (= lt!101114 (getCurrentListMap!917 _keys!825 lt!101101 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101113 () ListLongMap!2687)

(declare-fun lt!101104 () ListLongMap!2687)

(assert (=> b!201979 (and (= lt!101113 lt!101104) (= lt!101104 lt!101113))))

(declare-fun lt!101106 () ListLongMap!2687)

(assert (=> b!201979 (= lt!101104 (+!408 lt!101106 lt!101103))))

(assert (=> b!201979 (= lt!101103 (tuple2!3785 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lt!101109 () Unit!6068)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!76 (array!9093 array!9091 (_ BitVec 32) (_ BitVec 32) V!6233 V!6233 (_ BitVec 32) (_ BitVec 64) V!6233 (_ BitVec 32) Int) Unit!6068)

(assert (=> b!201979 (= lt!101109 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!76 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!327 (array!9093 array!9091 (_ BitVec 32) (_ BitVec 32) V!6233 V!6233 (_ BitVec 32) Int) ListLongMap!2687)

(assert (=> b!201979 (= lt!101113 (getCurrentListMapNoExtraKeys!327 _keys!825 lt!101101 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201979 (= lt!101101 (array!9092 (store (arr!4295 _values!649) i!601 (ValueCellFull!2126 v!520)) (size!4621 _values!649)))))

(assert (=> b!201979 (= lt!101106 (getCurrentListMapNoExtraKeys!327 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201980 () Bool)

(declare-fun res!96671 () Bool)

(assert (=> b!201980 (=> (not res!96671) (not e!132324))))

(assert (=> b!201980 (= res!96671 (= (select (arr!4296 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!8477 () Bool)

(declare-fun tp!18281 () Bool)

(declare-fun e!132318 () Bool)

(assert (=> mapNonEmpty!8477 (= mapRes!8477 (and tp!18281 e!132318))))

(declare-fun mapRest!8477 () (Array (_ BitVec 32) ValueCell!2126))

(declare-fun mapKey!8477 () (_ BitVec 32))

(declare-fun mapValue!8477 () ValueCell!2126)

(assert (=> mapNonEmpty!8477 (= (arr!4295 _values!649) (store mapRest!8477 mapKey!8477 mapValue!8477))))

(declare-fun b!201982 () Bool)

(declare-fun tp_is_empty!4939 () Bool)

(assert (=> b!201982 (= e!132319 tp_is_empty!4939)))

(declare-fun mapIsEmpty!8477 () Bool)

(assert (=> mapIsEmpty!8477 mapRes!8477))

(declare-fun b!201983 () Bool)

(assert (=> b!201983 (= e!132318 tp_is_empty!4939)))

(declare-fun b!201984 () Bool)

(declare-fun res!96674 () Bool)

(assert (=> b!201984 (=> (not res!96674) (not e!132324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9093 (_ BitVec 32)) Bool)

(assert (=> b!201984 (= res!96674 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!96673 () Bool)

(assert (=> start!20428 (=> (not res!96673) (not e!132324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20428 (= res!96673 (validMask!0 mask!1149))))

(assert (=> start!20428 e!132324))

(declare-fun array_inv!2815 (array!9091) Bool)

(assert (=> start!20428 (and (array_inv!2815 _values!649) e!132322)))

(assert (=> start!20428 true))

(assert (=> start!20428 tp_is_empty!4939))

(declare-fun array_inv!2816 (array!9093) Bool)

(assert (=> start!20428 (array_inv!2816 _keys!825)))

(assert (=> start!20428 tp!18280))

(declare-fun b!201981 () Bool)

(declare-fun res!96669 () Bool)

(assert (=> b!201981 (=> (not res!96669) (not e!132324))))

(assert (=> b!201981 (= res!96669 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4622 _keys!825))))))

(declare-fun b!201985 () Bool)

(declare-fun res!96675 () Bool)

(assert (=> b!201985 (=> (not res!96675) (not e!132324))))

(assert (=> b!201985 (= res!96675 (and (= (size!4621 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4622 _keys!825) (size!4621 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201986 () Bool)

(assert (=> b!201986 (= e!132321 e!132320)))

(declare-fun res!96670 () Bool)

(assert (=> b!201986 (=> res!96670 e!132320)))

(assert (=> b!201986 (= res!96670 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!101111 () ListLongMap!2687)

(assert (=> b!201986 (= lt!101111 lt!101105)))

(assert (=> b!201986 (= lt!101105 (+!408 lt!101100 lt!101103))))

(declare-fun lt!101110 () Unit!6068)

(assert (=> b!201986 (= lt!101110 (addCommutativeForDiffKeys!117 lt!101106 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (=> b!201986 (= lt!101114 (+!408 lt!101111 lt!101099))))

(declare-fun lt!101108 () tuple2!3784)

(assert (=> b!201986 (= lt!101111 (+!408 lt!101104 lt!101108))))

(assert (=> b!201986 (= lt!101112 lt!101107)))

(assert (=> b!201986 (= lt!101107 (+!408 lt!101100 lt!101099))))

(assert (=> b!201986 (= lt!101100 (+!408 lt!101106 lt!101108))))

(assert (=> b!201986 (= lt!101114 (+!408 (+!408 lt!101113 lt!101108) lt!101099))))

(assert (=> b!201986 (= lt!101099 (tuple2!3785 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201986 (= lt!101108 (tuple2!3785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(assert (= (and start!20428 res!96673) b!201985))

(assert (= (and b!201985 res!96675) b!201984))

(assert (= (and b!201984 res!96674) b!201977))

(assert (= (and b!201977 res!96676) b!201981))

(assert (= (and b!201981 res!96669) b!201978))

(assert (= (and b!201978 res!96677) b!201980))

(assert (= (and b!201980 res!96671) b!201979))

(assert (= (and b!201979 (not res!96672)) b!201986))

(assert (= (and b!201986 (not res!96670)) b!201976))

(assert (= (and b!201975 condMapEmpty!8477) mapIsEmpty!8477))

(assert (= (and b!201975 (not condMapEmpty!8477)) mapNonEmpty!8477))

(get-info :version)

(assert (= (and mapNonEmpty!8477 ((_ is ValueCellFull!2126) mapValue!8477)) b!201983))

(assert (= (and b!201975 ((_ is ValueCellFull!2126) mapDefault!8477)) b!201982))

(assert (= start!20428 b!201975))

(declare-fun m!228735 () Bool)

(assert (=> b!201977 m!228735))

(declare-fun m!228737 () Bool)

(assert (=> b!201986 m!228737))

(declare-fun m!228739 () Bool)

(assert (=> b!201986 m!228739))

(declare-fun m!228741 () Bool)

(assert (=> b!201986 m!228741))

(declare-fun m!228743 () Bool)

(assert (=> b!201986 m!228743))

(declare-fun m!228745 () Bool)

(assert (=> b!201986 m!228745))

(declare-fun m!228747 () Bool)

(assert (=> b!201986 m!228747))

(declare-fun m!228749 () Bool)

(assert (=> b!201986 m!228749))

(assert (=> b!201986 m!228747))

(declare-fun m!228751 () Bool)

(assert (=> b!201986 m!228751))

(declare-fun m!228753 () Bool)

(assert (=> b!201984 m!228753))

(declare-fun m!228755 () Bool)

(assert (=> b!201979 m!228755))

(declare-fun m!228757 () Bool)

(assert (=> b!201979 m!228757))

(declare-fun m!228759 () Bool)

(assert (=> b!201979 m!228759))

(declare-fun m!228761 () Bool)

(assert (=> b!201979 m!228761))

(declare-fun m!228763 () Bool)

(assert (=> b!201979 m!228763))

(declare-fun m!228765 () Bool)

(assert (=> b!201979 m!228765))

(declare-fun m!228767 () Bool)

(assert (=> b!201979 m!228767))

(declare-fun m!228769 () Bool)

(assert (=> b!201978 m!228769))

(declare-fun m!228771 () Bool)

(assert (=> b!201976 m!228771))

(declare-fun m!228773 () Bool)

(assert (=> b!201976 m!228773))

(declare-fun m!228775 () Bool)

(assert (=> b!201976 m!228775))

(declare-fun m!228777 () Bool)

(assert (=> start!20428 m!228777))

(declare-fun m!228779 () Bool)

(assert (=> start!20428 m!228779))

(declare-fun m!228781 () Bool)

(assert (=> start!20428 m!228781))

(declare-fun m!228783 () Bool)

(assert (=> b!201980 m!228783))

(declare-fun m!228785 () Bool)

(assert (=> mapNonEmpty!8477 m!228785))

(check-sat (not b!201976) b_and!11803 (not start!20428) (not b!201977) tp_is_empty!4939 (not b!201978) (not b!201979) (not b!201984) (not b!201986) (not mapNonEmpty!8477) (not b_next!5083))
(check-sat b_and!11803 (not b_next!5083))
