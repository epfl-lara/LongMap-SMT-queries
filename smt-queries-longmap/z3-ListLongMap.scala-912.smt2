; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20572 () Bool)

(assert start!20572)

(declare-fun b_free!5227 () Bool)

(declare-fun b_next!5227 () Bool)

(assert (=> start!20572 (= b_free!5227 (not b_next!5227))))

(declare-fun tp!18712 () Bool)

(declare-fun b_and!11987 () Bool)

(assert (=> start!20572 (= tp!18712 b_and!11987)))

(declare-fun b!204779 () Bool)

(declare-fun e!133956 () Bool)

(declare-fun tp_is_empty!5083 () Bool)

(assert (=> b!204779 (= e!133956 tp_is_empty!5083)))

(declare-fun b!204780 () Bool)

(declare-fun e!133958 () Bool)

(assert (=> b!204780 (= e!133958 true)))

(declare-datatypes ((V!6425 0))(
  ( (V!6426 (val!2586 Int)) )
))
(declare-datatypes ((tuple2!3870 0))(
  ( (tuple2!3871 (_1!1946 (_ BitVec 64)) (_2!1946 V!6425)) )
))
(declare-datatypes ((List!2764 0))(
  ( (Nil!2761) (Cons!2760 (h!3402 tuple2!3870) (t!7687 List!2764)) )
))
(declare-datatypes ((ListLongMap!2785 0))(
  ( (ListLongMap!2786 (toList!1408 List!2764)) )
))
(declare-fun lt!103925 () ListLongMap!2785)

(declare-fun lt!103924 () ListLongMap!2785)

(declare-fun lt!103927 () tuple2!3870)

(declare-fun +!462 (ListLongMap!2785 tuple2!3870) ListLongMap!2785)

(assert (=> b!204780 (= lt!103925 (+!462 lt!103924 lt!103927))))

(declare-datatypes ((Unit!6202 0))(
  ( (Unit!6203) )
))
(declare-fun lt!103934 () Unit!6202)

(declare-fun minValue!615 () V!6425)

(declare-fun v!520 () V!6425)

(declare-fun lt!103929 () ListLongMap!2785)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun addCommutativeForDiffKeys!170 (ListLongMap!2785 (_ BitVec 64) V!6425 (_ BitVec 64) V!6425) Unit!6202)

(assert (=> b!204780 (= lt!103934 (addCommutativeForDiffKeys!170 lt!103929 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204781 () Bool)

(declare-fun e!133959 () Bool)

(assert (=> b!204781 (= e!133959 tp_is_empty!5083)))

(declare-fun b!204782 () Bool)

(declare-fun e!133957 () Bool)

(declare-fun mapRes!8693 () Bool)

(assert (=> b!204782 (= e!133957 (and e!133956 mapRes!8693))))

(declare-fun condMapEmpty!8693 () Bool)

(declare-datatypes ((ValueCell!2198 0))(
  ( (ValueCellFull!2198 (v!4557 V!6425)) (EmptyCell!2198) )
))
(declare-datatypes ((array!9375 0))(
  ( (array!9376 (arr!4438 (Array (_ BitVec 32) ValueCell!2198)) (size!4763 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9375)

(declare-fun mapDefault!8693 () ValueCell!2198)

(assert (=> b!204782 (= condMapEmpty!8693 (= (arr!4438 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2198)) mapDefault!8693)))))

(declare-fun b!204783 () Bool)

(declare-fun e!133960 () Bool)

(assert (=> b!204783 (= e!133960 e!133958)))

(declare-fun res!98751 () Bool)

(assert (=> b!204783 (=> res!98751 e!133958)))

(assert (=> b!204783 (= res!98751 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103930 () ListLongMap!2785)

(assert (=> b!204783 (= lt!103930 lt!103924)))

(declare-fun lt!103926 () tuple2!3870)

(assert (=> b!204783 (= lt!103924 (+!462 lt!103929 lt!103926))))

(declare-fun lt!103931 () ListLongMap!2785)

(assert (=> b!204783 (= lt!103931 lt!103925)))

(declare-fun lt!103932 () ListLongMap!2785)

(assert (=> b!204783 (= lt!103925 (+!462 lt!103932 lt!103926))))

(declare-fun lt!103933 () ListLongMap!2785)

(assert (=> b!204783 (= lt!103931 (+!462 lt!103933 lt!103926))))

(assert (=> b!204783 (= lt!103926 (tuple2!3871 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!204784 () Bool)

(declare-fun res!98747 () Bool)

(declare-fun e!133955 () Bool)

(assert (=> b!204784 (=> (not res!98747) (not e!133955))))

(declare-datatypes ((array!9377 0))(
  ( (array!9378 (arr!4439 (Array (_ BitVec 32) (_ BitVec 64))) (size!4764 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9377)

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!204784 (= res!98747 (= (select (arr!4439 _keys!825) i!601) k0!843))))

(declare-fun b!204785 () Bool)

(assert (=> b!204785 (= e!133955 (not e!133960))))

(declare-fun res!98752 () Bool)

(assert (=> b!204785 (=> res!98752 e!133960)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!204785 (= res!98752 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6425)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!983 (array!9377 array!9375 (_ BitVec 32) (_ BitVec 32) V!6425 V!6425 (_ BitVec 32) Int) ListLongMap!2785)

(assert (=> b!204785 (= lt!103930 (getCurrentListMap!983 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103923 () array!9375)

(assert (=> b!204785 (= lt!103931 (getCurrentListMap!983 _keys!825 lt!103923 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204785 (and (= lt!103933 lt!103932) (= lt!103932 lt!103933))))

(assert (=> b!204785 (= lt!103932 (+!462 lt!103929 lt!103927))))

(assert (=> b!204785 (= lt!103927 (tuple2!3871 k0!843 v!520))))

(declare-fun lt!103928 () Unit!6202)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!119 (array!9377 array!9375 (_ BitVec 32) (_ BitVec 32) V!6425 V!6425 (_ BitVec 32) (_ BitVec 64) V!6425 (_ BitVec 32) Int) Unit!6202)

(assert (=> b!204785 (= lt!103928 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!119 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!376 (array!9377 array!9375 (_ BitVec 32) (_ BitVec 32) V!6425 V!6425 (_ BitVec 32) Int) ListLongMap!2785)

(assert (=> b!204785 (= lt!103933 (getCurrentListMapNoExtraKeys!376 _keys!825 lt!103923 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!204785 (= lt!103923 (array!9376 (store (arr!4438 _values!649) i!601 (ValueCellFull!2198 v!520)) (size!4763 _values!649)))))

(assert (=> b!204785 (= lt!103929 (getCurrentListMapNoExtraKeys!376 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!204786 () Bool)

(declare-fun res!98750 () Bool)

(assert (=> b!204786 (=> (not res!98750) (not e!133955))))

(declare-datatypes ((List!2765 0))(
  ( (Nil!2762) (Cons!2761 (h!3403 (_ BitVec 64)) (t!7688 List!2765)) )
))
(declare-fun arrayNoDuplicates!0 (array!9377 (_ BitVec 32) List!2765) Bool)

(assert (=> b!204786 (= res!98750 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2762))))

(declare-fun mapIsEmpty!8693 () Bool)

(assert (=> mapIsEmpty!8693 mapRes!8693))

(declare-fun b!204787 () Bool)

(declare-fun res!98753 () Bool)

(assert (=> b!204787 (=> (not res!98753) (not e!133955))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!204787 (= res!98753 (validKeyInArray!0 k0!843))))

(declare-fun mapNonEmpty!8693 () Bool)

(declare-fun tp!18713 () Bool)

(assert (=> mapNonEmpty!8693 (= mapRes!8693 (and tp!18713 e!133959))))

(declare-fun mapKey!8693 () (_ BitVec 32))

(declare-fun mapValue!8693 () ValueCell!2198)

(declare-fun mapRest!8693 () (Array (_ BitVec 32) ValueCell!2198))

(assert (=> mapNonEmpty!8693 (= (arr!4438 _values!649) (store mapRest!8693 mapKey!8693 mapValue!8693))))

(declare-fun b!204788 () Bool)

(declare-fun res!98754 () Bool)

(assert (=> b!204788 (=> (not res!98754) (not e!133955))))

(assert (=> b!204788 (= res!98754 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4764 _keys!825))))))

(declare-fun b!204789 () Bool)

(declare-fun res!98748 () Bool)

(assert (=> b!204789 (=> (not res!98748) (not e!133955))))

(assert (=> b!204789 (= res!98748 (and (= (size!4763 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4764 _keys!825) (size!4763 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!204790 () Bool)

(declare-fun res!98749 () Bool)

(assert (=> b!204790 (=> (not res!98749) (not e!133955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9377 (_ BitVec 32)) Bool)

(assert (=> b!204790 (= res!98749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!98755 () Bool)

(assert (=> start!20572 (=> (not res!98755) (not e!133955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20572 (= res!98755 (validMask!0 mask!1149))))

(assert (=> start!20572 e!133955))

(declare-fun array_inv!2903 (array!9375) Bool)

(assert (=> start!20572 (and (array_inv!2903 _values!649) e!133957)))

(assert (=> start!20572 true))

(assert (=> start!20572 tp_is_empty!5083))

(declare-fun array_inv!2904 (array!9377) Bool)

(assert (=> start!20572 (array_inv!2904 _keys!825)))

(assert (=> start!20572 tp!18712))

(assert (= (and start!20572 res!98755) b!204789))

(assert (= (and b!204789 res!98748) b!204790))

(assert (= (and b!204790 res!98749) b!204786))

(assert (= (and b!204786 res!98750) b!204788))

(assert (= (and b!204788 res!98754) b!204787))

(assert (= (and b!204787 res!98753) b!204784))

(assert (= (and b!204784 res!98747) b!204785))

(assert (= (and b!204785 (not res!98752)) b!204783))

(assert (= (and b!204783 (not res!98751)) b!204780))

(assert (= (and b!204782 condMapEmpty!8693) mapIsEmpty!8693))

(assert (= (and b!204782 (not condMapEmpty!8693)) mapNonEmpty!8693))

(get-info :version)

(assert (= (and mapNonEmpty!8693 ((_ is ValueCellFull!2198) mapValue!8693)) b!204781))

(assert (= (and b!204782 ((_ is ValueCellFull!2198) mapDefault!8693)) b!204779))

(assert (= start!20572 b!204782))

(declare-fun m!232461 () Bool)

(assert (=> mapNonEmpty!8693 m!232461))

(declare-fun m!232463 () Bool)

(assert (=> b!204787 m!232463))

(declare-fun m!232465 () Bool)

(assert (=> b!204780 m!232465))

(declare-fun m!232467 () Bool)

(assert (=> b!204780 m!232467))

(declare-fun m!232469 () Bool)

(assert (=> b!204786 m!232469))

(declare-fun m!232471 () Bool)

(assert (=> b!204790 m!232471))

(declare-fun m!232473 () Bool)

(assert (=> b!204784 m!232473))

(declare-fun m!232475 () Bool)

(assert (=> b!204785 m!232475))

(declare-fun m!232477 () Bool)

(assert (=> b!204785 m!232477))

(declare-fun m!232479 () Bool)

(assert (=> b!204785 m!232479))

(declare-fun m!232481 () Bool)

(assert (=> b!204785 m!232481))

(declare-fun m!232483 () Bool)

(assert (=> b!204785 m!232483))

(declare-fun m!232485 () Bool)

(assert (=> b!204785 m!232485))

(declare-fun m!232487 () Bool)

(assert (=> b!204785 m!232487))

(declare-fun m!232489 () Bool)

(assert (=> b!204783 m!232489))

(declare-fun m!232491 () Bool)

(assert (=> b!204783 m!232491))

(declare-fun m!232493 () Bool)

(assert (=> b!204783 m!232493))

(declare-fun m!232495 () Bool)

(assert (=> start!20572 m!232495))

(declare-fun m!232497 () Bool)

(assert (=> start!20572 m!232497))

(declare-fun m!232499 () Bool)

(assert (=> start!20572 m!232499))

(check-sat (not b!204786) (not start!20572) (not b!204790) (not mapNonEmpty!8693) tp_is_empty!5083 (not b!204780) (not b!204783) b_and!11987 (not b!204787) (not b!204785) (not b_next!5227))
(check-sat b_and!11987 (not b_next!5227))
