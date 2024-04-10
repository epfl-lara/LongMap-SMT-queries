; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39324 () Bool)

(assert start!39324)

(declare-fun b_free!9591 () Bool)

(declare-fun b_next!9591 () Bool)

(assert (=> start!39324 (= b_free!9591 (not b_next!9591))))

(declare-fun tp!34301 () Bool)

(declare-fun b_and!17057 () Bool)

(assert (=> start!39324 (= tp!34301 b_and!17057)))

(declare-fun c!55100 () Bool)

(declare-datatypes ((array!25341 0))(
  ( (array!25342 (arr!12120 (Array (_ BitVec 32) (_ BitVec 64))) (size!12472 (_ BitVec 32))) )
))
(declare-fun lt!190831 () array!25341)

(declare-datatypes ((V!15429 0))(
  ( (V!15430 (val!5416 Int)) )
))
(declare-fun minValue!515 () V!15429)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5028 0))(
  ( (ValueCellFull!5028 (v!7663 V!15429)) (EmptyCell!5028) )
))
(declare-datatypes ((array!25343 0))(
  ( (array!25344 (arr!12121 (Array (_ BitVec 32) ValueCell!5028)) (size!12473 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25343)

(declare-fun zeroValue!515 () V!15429)

(declare-fun lt!190835 () array!25343)

(declare-datatypes ((tuple2!7066 0))(
  ( (tuple2!7067 (_1!3544 (_ BitVec 64)) (_2!3544 V!15429)) )
))
(declare-datatypes ((List!7084 0))(
  ( (Nil!7081) (Cons!7080 (h!7936 tuple2!7066) (t!12340 List!7084)) )
))
(declare-datatypes ((ListLongMap!5979 0))(
  ( (ListLongMap!5980 (toList!3005 List!7084)) )
))
(declare-fun call!28951 () ListLongMap!5979)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun bm!28948 () Bool)

(declare-fun _keys!709 () array!25341)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1210 (array!25341 array!25343 (_ BitVec 32) (_ BitVec 32) V!15429 V!15429 (_ BitVec 32) Int) ListLongMap!5979)

(assert (=> bm!28948 (= call!28951 (getCurrentListMapNoExtraKeys!1210 (ite c!55100 _keys!709 lt!190831) (ite c!55100 _values!549 lt!190835) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416722 () Bool)

(declare-fun res!242598 () Bool)

(declare-fun e!248729 () Bool)

(assert (=> b!416722 (=> (not res!242598) (not e!248729))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!416722 (= res!242598 (or (= (select (arr!12120 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12120 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun call!28952 () ListLongMap!5979)

(declare-fun b!416723 () Bool)

(declare-fun v!412 () V!15429)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun e!248730 () Bool)

(declare-fun +!1207 (ListLongMap!5979 tuple2!7066) ListLongMap!5979)

(assert (=> b!416723 (= e!248730 (= call!28952 (+!1207 call!28951 (tuple2!7067 k0!794 v!412))))))

(declare-fun b!416724 () Bool)

(declare-fun res!242596 () Bool)

(assert (=> b!416724 (=> (not res!242596) (not e!248729))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416724 (= res!242596 (validKeyInArray!0 k0!794))))

(declare-fun b!416725 () Bool)

(declare-fun e!248736 () Bool)

(assert (=> b!416725 (= e!248736 true)))

(declare-fun lt!190830 () ListLongMap!5979)

(declare-fun lt!190832 () V!15429)

(declare-fun lt!190827 () tuple2!7066)

(assert (=> b!416725 (= (+!1207 lt!190830 lt!190827) (+!1207 (+!1207 lt!190830 (tuple2!7067 k0!794 lt!190832)) lt!190827))))

(declare-fun lt!190826 () V!15429)

(assert (=> b!416725 (= lt!190827 (tuple2!7067 k0!794 lt!190826))))

(declare-datatypes ((Unit!12318 0))(
  ( (Unit!12319) )
))
(declare-fun lt!190834 () Unit!12318)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!11 (ListLongMap!5979 (_ BitVec 64) V!15429 V!15429) Unit!12318)

(assert (=> b!416725 (= lt!190834 (addSameAsAddTwiceSameKeyDiffValues!11 lt!190830 k0!794 lt!190832 lt!190826))))

(declare-fun lt!190829 () V!15429)

(declare-fun get!5993 (ValueCell!5028 V!15429) V!15429)

(assert (=> b!416725 (= lt!190832 (get!5993 (select (arr!12121 _values!549) from!863) lt!190829))))

(declare-fun lt!190828 () ListLongMap!5979)

(assert (=> b!416725 (= lt!190828 (+!1207 lt!190830 (tuple2!7067 (select (arr!12120 lt!190831) from!863) lt!190826)))))

(assert (=> b!416725 (= lt!190826 (get!5993 (select (store (arr!12121 _values!549) i!563 (ValueCellFull!5028 v!412)) from!863) lt!190829))))

(declare-fun dynLambda!682 (Int (_ BitVec 64)) V!15429)

(assert (=> b!416725 (= lt!190829 (dynLambda!682 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!416725 (= lt!190830 (getCurrentListMapNoExtraKeys!1210 lt!190831 lt!190835 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416726 () Bool)

(declare-fun e!248731 () Bool)

(declare-fun e!248733 () Bool)

(assert (=> b!416726 (= e!248731 e!248733)))

(declare-fun res!242602 () Bool)

(assert (=> b!416726 (=> (not res!242602) (not e!248733))))

(assert (=> b!416726 (= res!242602 (= from!863 i!563))))

(assert (=> b!416726 (= lt!190828 (getCurrentListMapNoExtraKeys!1210 lt!190831 lt!190835 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416726 (= lt!190835 (array!25344 (store (arr!12121 _values!549) i!563 (ValueCellFull!5028 v!412)) (size!12473 _values!549)))))

(declare-fun lt!190833 () ListLongMap!5979)

(assert (=> b!416726 (= lt!190833 (getCurrentListMapNoExtraKeys!1210 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!416727 () Bool)

(declare-fun e!248734 () Bool)

(declare-fun tp_is_empty!10743 () Bool)

(assert (=> b!416727 (= e!248734 tp_is_empty!10743)))

(declare-fun b!416728 () Bool)

(declare-fun res!242603 () Bool)

(assert (=> b!416728 (=> (not res!242603) (not e!248729))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416728 (= res!242603 (validMask!0 mask!1025))))

(declare-fun b!416729 () Bool)

(assert (=> b!416729 (= e!248729 e!248731)))

(declare-fun res!242600 () Bool)

(assert (=> b!416729 (=> (not res!242600) (not e!248731))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25341 (_ BitVec 32)) Bool)

(assert (=> b!416729 (= res!242600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190831 mask!1025))))

(assert (=> b!416729 (= lt!190831 (array!25342 (store (arr!12120 _keys!709) i!563 k0!794) (size!12472 _keys!709)))))

(declare-fun b!416730 () Bool)

(declare-fun res!242595 () Bool)

(assert (=> b!416730 (=> (not res!242595) (not e!248729))))

(assert (=> b!416730 (= res!242595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416731 () Bool)

(declare-fun e!248728 () Bool)

(assert (=> b!416731 (= e!248728 tp_is_empty!10743)))

(declare-fun b!416733 () Bool)

(declare-fun res!242607 () Bool)

(assert (=> b!416733 (=> (not res!242607) (not e!248731))))

(declare-datatypes ((List!7085 0))(
  ( (Nil!7082) (Cons!7081 (h!7937 (_ BitVec 64)) (t!12341 List!7085)) )
))
(declare-fun arrayNoDuplicates!0 (array!25341 (_ BitVec 32) List!7085) Bool)

(assert (=> b!416733 (= res!242607 (arrayNoDuplicates!0 lt!190831 #b00000000000000000000000000000000 Nil!7082))))

(declare-fun b!416734 () Bool)

(assert (=> b!416734 (= e!248730 (= call!28951 call!28952))))

(declare-fun b!416735 () Bool)

(declare-fun res!242604 () Bool)

(assert (=> b!416735 (=> (not res!242604) (not e!248729))))

(assert (=> b!416735 (= res!242604 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12472 _keys!709))))))

(declare-fun mapIsEmpty!17736 () Bool)

(declare-fun mapRes!17736 () Bool)

(assert (=> mapIsEmpty!17736 mapRes!17736))

(declare-fun b!416736 () Bool)

(declare-fun res!242605 () Bool)

(assert (=> b!416736 (=> (not res!242605) (not e!248729))))

(declare-fun arrayContainsKey!0 (array!25341 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416736 (= res!242605 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!416737 () Bool)

(declare-fun res!242601 () Bool)

(assert (=> b!416737 (=> (not res!242601) (not e!248729))))

(assert (=> b!416737 (= res!242601 (and (= (size!12473 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12472 _keys!709) (size!12473 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!416738 () Bool)

(declare-fun res!242594 () Bool)

(assert (=> b!416738 (=> (not res!242594) (not e!248731))))

(assert (=> b!416738 (= res!242594 (bvsle from!863 i!563))))

(declare-fun b!416739 () Bool)

(assert (=> b!416739 (= e!248733 (not e!248736))))

(declare-fun res!242599 () Bool)

(assert (=> b!416739 (=> res!242599 e!248736)))

(assert (=> b!416739 (= res!242599 (validKeyInArray!0 (select (arr!12120 _keys!709) from!863)))))

(assert (=> b!416739 e!248730))

(assert (=> b!416739 (= c!55100 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!190825 () Unit!12318)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!415 (array!25341 array!25343 (_ BitVec 32) (_ BitVec 32) V!15429 V!15429 (_ BitVec 32) (_ BitVec 64) V!15429 (_ BitVec 32) Int) Unit!12318)

(assert (=> b!416739 (= lt!190825 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!415 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28949 () Bool)

(assert (=> bm!28949 (= call!28952 (getCurrentListMapNoExtraKeys!1210 (ite c!55100 lt!190831 _keys!709) (ite c!55100 lt!190835 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416732 () Bool)

(declare-fun res!242597 () Bool)

(assert (=> b!416732 (=> (not res!242597) (not e!248729))))

(assert (=> b!416732 (= res!242597 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7082))))

(declare-fun res!242606 () Bool)

(assert (=> start!39324 (=> (not res!242606) (not e!248729))))

(assert (=> start!39324 (= res!242606 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12472 _keys!709))))))

(assert (=> start!39324 e!248729))

(assert (=> start!39324 tp_is_empty!10743))

(assert (=> start!39324 tp!34301))

(assert (=> start!39324 true))

(declare-fun e!248735 () Bool)

(declare-fun array_inv!8840 (array!25343) Bool)

(assert (=> start!39324 (and (array_inv!8840 _values!549) e!248735)))

(declare-fun array_inv!8841 (array!25341) Bool)

(assert (=> start!39324 (array_inv!8841 _keys!709)))

(declare-fun b!416740 () Bool)

(assert (=> b!416740 (= e!248735 (and e!248734 mapRes!17736))))

(declare-fun condMapEmpty!17736 () Bool)

(declare-fun mapDefault!17736 () ValueCell!5028)

(assert (=> b!416740 (= condMapEmpty!17736 (= (arr!12121 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5028)) mapDefault!17736)))))

(declare-fun mapNonEmpty!17736 () Bool)

(declare-fun tp!34302 () Bool)

(assert (=> mapNonEmpty!17736 (= mapRes!17736 (and tp!34302 e!248728))))

(declare-fun mapRest!17736 () (Array (_ BitVec 32) ValueCell!5028))

(declare-fun mapValue!17736 () ValueCell!5028)

(declare-fun mapKey!17736 () (_ BitVec 32))

(assert (=> mapNonEmpty!17736 (= (arr!12121 _values!549) (store mapRest!17736 mapKey!17736 mapValue!17736))))

(assert (= (and start!39324 res!242606) b!416728))

(assert (= (and b!416728 res!242603) b!416737))

(assert (= (and b!416737 res!242601) b!416730))

(assert (= (and b!416730 res!242595) b!416732))

(assert (= (and b!416732 res!242597) b!416735))

(assert (= (and b!416735 res!242604) b!416724))

(assert (= (and b!416724 res!242596) b!416722))

(assert (= (and b!416722 res!242598) b!416736))

(assert (= (and b!416736 res!242605) b!416729))

(assert (= (and b!416729 res!242600) b!416733))

(assert (= (and b!416733 res!242607) b!416738))

(assert (= (and b!416738 res!242594) b!416726))

(assert (= (and b!416726 res!242602) b!416739))

(assert (= (and b!416739 c!55100) b!416723))

(assert (= (and b!416739 (not c!55100)) b!416734))

(assert (= (or b!416723 b!416734) bm!28949))

(assert (= (or b!416723 b!416734) bm!28948))

(assert (= (and b!416739 (not res!242599)) b!416725))

(assert (= (and b!416740 condMapEmpty!17736) mapIsEmpty!17736))

(assert (= (and b!416740 (not condMapEmpty!17736)) mapNonEmpty!17736))

(get-info :version)

(assert (= (and mapNonEmpty!17736 ((_ is ValueCellFull!5028) mapValue!17736)) b!416731))

(assert (= (and b!416740 ((_ is ValueCellFull!5028) mapDefault!17736)) b!416727))

(assert (= start!39324 b!416740))

(declare-fun b_lambda!8895 () Bool)

(assert (=> (not b_lambda!8895) (not b!416725)))

(declare-fun t!12339 () Bool)

(declare-fun tb!3213 () Bool)

(assert (=> (and start!39324 (= defaultEntry!557 defaultEntry!557) t!12339) tb!3213))

(declare-fun result!5953 () Bool)

(assert (=> tb!3213 (= result!5953 tp_is_empty!10743)))

(assert (=> b!416725 t!12339))

(declare-fun b_and!17059 () Bool)

(assert (= b_and!17057 (and (=> t!12339 result!5953) b_and!17059)))

(declare-fun m!405905 () Bool)

(assert (=> b!416736 m!405905))

(declare-fun m!405907 () Bool)

(assert (=> b!416733 m!405907))

(declare-fun m!405909 () Bool)

(assert (=> b!416730 m!405909))

(declare-fun m!405911 () Bool)

(assert (=> b!416723 m!405911))

(declare-fun m!405913 () Bool)

(assert (=> b!416729 m!405913))

(declare-fun m!405915 () Bool)

(assert (=> b!416729 m!405915))

(declare-fun m!405917 () Bool)

(assert (=> b!416725 m!405917))

(declare-fun m!405919 () Bool)

(assert (=> b!416725 m!405919))

(declare-fun m!405921 () Bool)

(assert (=> b!416725 m!405921))

(declare-fun m!405923 () Bool)

(assert (=> b!416725 m!405923))

(declare-fun m!405925 () Bool)

(assert (=> b!416725 m!405925))

(declare-fun m!405927 () Bool)

(assert (=> b!416725 m!405927))

(declare-fun m!405929 () Bool)

(assert (=> b!416725 m!405929))

(declare-fun m!405931 () Bool)

(assert (=> b!416725 m!405931))

(declare-fun m!405933 () Bool)

(assert (=> b!416725 m!405933))

(declare-fun m!405935 () Bool)

(assert (=> b!416725 m!405935))

(declare-fun m!405937 () Bool)

(assert (=> b!416725 m!405937))

(assert (=> b!416725 m!405931))

(declare-fun m!405939 () Bool)

(assert (=> b!416725 m!405939))

(assert (=> b!416725 m!405925))

(assert (=> b!416725 m!405929))

(declare-fun m!405941 () Bool)

(assert (=> b!416725 m!405941))

(declare-fun m!405943 () Bool)

(assert (=> b!416724 m!405943))

(declare-fun m!405945 () Bool)

(assert (=> start!39324 m!405945))

(declare-fun m!405947 () Bool)

(assert (=> start!39324 m!405947))

(declare-fun m!405949 () Bool)

(assert (=> bm!28949 m!405949))

(declare-fun m!405951 () Bool)

(assert (=> b!416732 m!405951))

(declare-fun m!405953 () Bool)

(assert (=> b!416726 m!405953))

(assert (=> b!416726 m!405923))

(declare-fun m!405955 () Bool)

(assert (=> b!416726 m!405955))

(declare-fun m!405957 () Bool)

(assert (=> bm!28948 m!405957))

(declare-fun m!405959 () Bool)

(assert (=> b!416722 m!405959))

(declare-fun m!405961 () Bool)

(assert (=> b!416739 m!405961))

(assert (=> b!416739 m!405961))

(declare-fun m!405963 () Bool)

(assert (=> b!416739 m!405963))

(declare-fun m!405965 () Bool)

(assert (=> b!416739 m!405965))

(declare-fun m!405967 () Bool)

(assert (=> b!416728 m!405967))

(declare-fun m!405969 () Bool)

(assert (=> mapNonEmpty!17736 m!405969))

(check-sat (not b_next!9591) (not b!416736) (not bm!28949) (not b!416724) (not b!416725) (not bm!28948) (not b!416723) (not b!416726) tp_is_empty!10743 (not b_lambda!8895) (not b!416729) (not b!416739) b_and!17059 (not b!416732) (not b!416730) (not b!416733) (not start!39324) (not b!416728) (not mapNonEmpty!17736))
(check-sat b_and!17059 (not b_next!9591))
