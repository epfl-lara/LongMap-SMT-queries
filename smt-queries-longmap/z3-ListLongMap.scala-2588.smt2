; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39332 () Bool)

(assert start!39332)

(declare-fun b_free!9613 () Bool)

(declare-fun b_next!9613 () Bool)

(assert (=> start!39332 (= b_free!9613 (not b_next!9613))))

(declare-fun tp!34367 () Bool)

(declare-fun b_and!17075 () Bool)

(assert (=> start!39332 (= tp!34367 b_and!17075)))

(declare-fun b!417100 () Bool)

(declare-fun res!242929 () Bool)

(declare-fun e!248855 () Bool)

(assert (=> b!417100 (=> (not res!242929) (not e!248855))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!417100 (= res!242929 (validMask!0 mask!1025))))

(declare-fun b!417102 () Bool)

(declare-fun e!248859 () Bool)

(declare-datatypes ((V!15459 0))(
  ( (V!15460 (val!5427 Int)) )
))
(declare-datatypes ((tuple2!7070 0))(
  ( (tuple2!7071 (_1!3546 (_ BitVec 64)) (_2!3546 V!15459)) )
))
(declare-datatypes ((List!7070 0))(
  ( (Nil!7067) (Cons!7066 (h!7922 tuple2!7070) (t!12339 List!7070)) )
))
(declare-datatypes ((ListLongMap!5973 0))(
  ( (ListLongMap!5974 (toList!3002 List!7070)) )
))
(declare-fun call!28993 () ListLongMap!5973)

(declare-fun call!28992 () ListLongMap!5973)

(assert (=> b!417102 (= e!248859 (= call!28993 call!28992))))

(declare-fun b!417103 () Bool)

(declare-fun res!242934 () Bool)

(declare-fun e!248858 () Bool)

(assert (=> b!417103 (=> (not res!242934) (not e!248858))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!417103 (= res!242934 (bvsle from!863 i!563))))

(declare-fun minValue!515 () V!15459)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!5039 0))(
  ( (ValueCellFull!5039 (v!7668 V!15459)) (EmptyCell!5039) )
))
(declare-datatypes ((array!25373 0))(
  ( (array!25374 (arr!12136 (Array (_ BitVec 32) ValueCell!5039)) (size!12489 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25373)

(declare-fun lt!190956 () array!25373)

(declare-fun zeroValue!515 () V!15459)

(declare-datatypes ((array!25375 0))(
  ( (array!25376 (arr!12137 (Array (_ BitVec 32) (_ BitVec 64))) (size!12490 (_ BitVec 32))) )
))
(declare-fun lt!190959 () array!25375)

(declare-fun _keys!709 () array!25375)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28989 () Bool)

(declare-fun c!55062 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1213 (array!25375 array!25373 (_ BitVec 32) (_ BitVec 32) V!15459 V!15459 (_ BitVec 32) Int) ListLongMap!5973)

(assert (=> bm!28989 (= call!28993 (getCurrentListMapNoExtraKeys!1213 (ite c!55062 _keys!709 lt!190959) (ite c!55062 _values!549 lt!190956) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417104 () Bool)

(declare-fun e!248852 () Bool)

(declare-fun e!248856 () Bool)

(assert (=> b!417104 (= e!248852 (not e!248856))))

(declare-fun res!242935 () Bool)

(assert (=> b!417104 (=> res!242935 e!248856)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!417104 (= res!242935 (validKeyInArray!0 (select (arr!12137 _keys!709) from!863)))))

(assert (=> b!417104 e!248859))

(assert (=> b!417104 (= c!55062 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12304 0))(
  ( (Unit!12305) )
))
(declare-fun lt!190960 () Unit!12304)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!15459)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!410 (array!25375 array!25373 (_ BitVec 32) (_ BitVec 32) V!15459 V!15459 (_ BitVec 32) (_ BitVec 64) V!15459 (_ BitVec 32) Int) Unit!12304)

(assert (=> b!417104 (= lt!190960 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!410 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17769 () Bool)

(declare-fun mapRes!17769 () Bool)

(assert (=> mapIsEmpty!17769 mapRes!17769))

(declare-fun b!417105 () Bool)

(declare-fun +!1231 (ListLongMap!5973 tuple2!7070) ListLongMap!5973)

(assert (=> b!417105 (= e!248859 (= call!28992 (+!1231 call!28993 (tuple2!7071 k0!794 v!412))))))

(declare-fun b!417106 () Bool)

(declare-fun e!248854 () Bool)

(declare-fun tp_is_empty!10765 () Bool)

(assert (=> b!417106 (= e!248854 tp_is_empty!10765)))

(declare-fun b!417107 () Bool)

(declare-fun res!242930 () Bool)

(assert (=> b!417107 (=> (not res!242930) (not e!248855))))

(assert (=> b!417107 (= res!242930 (and (= (size!12489 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12490 _keys!709) (size!12489 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!28990 () Bool)

(assert (=> bm!28990 (= call!28992 (getCurrentListMapNoExtraKeys!1213 (ite c!55062 lt!190959 _keys!709) (ite c!55062 lt!190956 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417108 () Bool)

(assert (=> b!417108 (= e!248856 true)))

(declare-fun lt!190963 () V!15459)

(declare-fun lt!190962 () ListLongMap!5973)

(declare-fun lt!190958 () tuple2!7070)

(assert (=> b!417108 (= (+!1231 lt!190962 lt!190958) (+!1231 (+!1231 lt!190962 (tuple2!7071 k0!794 lt!190963)) lt!190958))))

(declare-fun lt!190957 () V!15459)

(assert (=> b!417108 (= lt!190958 (tuple2!7071 k0!794 lt!190957))))

(declare-fun lt!190961 () Unit!12304)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!19 (ListLongMap!5973 (_ BitVec 64) V!15459 V!15459) Unit!12304)

(assert (=> b!417108 (= lt!190961 (addSameAsAddTwiceSameKeyDiffValues!19 lt!190962 k0!794 lt!190963 lt!190957))))

(declare-fun lt!190954 () V!15459)

(declare-fun get!5998 (ValueCell!5039 V!15459) V!15459)

(assert (=> b!417108 (= lt!190963 (get!5998 (select (arr!12136 _values!549) from!863) lt!190954))))

(declare-fun lt!190964 () ListLongMap!5973)

(assert (=> b!417108 (= lt!190964 (+!1231 lt!190962 (tuple2!7071 (select (arr!12137 lt!190959) from!863) lt!190957)))))

(assert (=> b!417108 (= lt!190957 (get!5998 (select (store (arr!12136 _values!549) i!563 (ValueCellFull!5039 v!412)) from!863) lt!190954))))

(declare-fun dynLambda!676 (Int (_ BitVec 64)) V!15459)

(assert (=> b!417108 (= lt!190954 (dynLambda!676 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!417108 (= lt!190962 (getCurrentListMapNoExtraKeys!1213 lt!190959 lt!190956 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!417101 () Bool)

(assert (=> b!417101 (= e!248858 e!248852)))

(declare-fun res!242931 () Bool)

(assert (=> b!417101 (=> (not res!242931) (not e!248852))))

(assert (=> b!417101 (= res!242931 (= from!863 i!563))))

(assert (=> b!417101 (= lt!190964 (getCurrentListMapNoExtraKeys!1213 lt!190959 lt!190956 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!417101 (= lt!190956 (array!25374 (store (arr!12136 _values!549) i!563 (ValueCellFull!5039 v!412)) (size!12489 _values!549)))))

(declare-fun lt!190955 () ListLongMap!5973)

(assert (=> b!417101 (= lt!190955 (getCurrentListMapNoExtraKeys!1213 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!242928 () Bool)

(assert (=> start!39332 (=> (not res!242928) (not e!248855))))

(assert (=> start!39332 (= res!242928 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12490 _keys!709))))))

(assert (=> start!39332 e!248855))

(assert (=> start!39332 tp_is_empty!10765))

(assert (=> start!39332 tp!34367))

(assert (=> start!39332 true))

(declare-fun e!248851 () Bool)

(declare-fun array_inv!8894 (array!25373) Bool)

(assert (=> start!39332 (and (array_inv!8894 _values!549) e!248851)))

(declare-fun array_inv!8895 (array!25375) Bool)

(assert (=> start!39332 (array_inv!8895 _keys!709)))

(declare-fun b!417109 () Bool)

(declare-fun res!242936 () Bool)

(assert (=> b!417109 (=> (not res!242936) (not e!248855))))

(assert (=> b!417109 (= res!242936 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12490 _keys!709))))))

(declare-fun b!417110 () Bool)

(assert (=> b!417110 (= e!248855 e!248858)))

(declare-fun res!242940 () Bool)

(assert (=> b!417110 (=> (not res!242940) (not e!248858))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25375 (_ BitVec 32)) Bool)

(assert (=> b!417110 (= res!242940 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190959 mask!1025))))

(assert (=> b!417110 (= lt!190959 (array!25376 (store (arr!12137 _keys!709) i!563 k0!794) (size!12490 _keys!709)))))

(declare-fun b!417111 () Bool)

(assert (=> b!417111 (= e!248851 (and e!248854 mapRes!17769))))

(declare-fun condMapEmpty!17769 () Bool)

(declare-fun mapDefault!17769 () ValueCell!5039)

(assert (=> b!417111 (= condMapEmpty!17769 (= (arr!12136 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5039)) mapDefault!17769)))))

(declare-fun b!417112 () Bool)

(declare-fun res!242937 () Bool)

(assert (=> b!417112 (=> (not res!242937) (not e!248855))))

(assert (=> b!417112 (= res!242937 (validKeyInArray!0 k0!794))))

(declare-fun b!417113 () Bool)

(declare-fun res!242939 () Bool)

(assert (=> b!417113 (=> (not res!242939) (not e!248855))))

(assert (=> b!417113 (= res!242939 (or (= (select (arr!12137 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12137 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!417114 () Bool)

(declare-fun res!242927 () Bool)

(assert (=> b!417114 (=> (not res!242927) (not e!248855))))

(declare-datatypes ((List!7071 0))(
  ( (Nil!7068) (Cons!7067 (h!7923 (_ BitVec 64)) (t!12340 List!7071)) )
))
(declare-fun arrayNoDuplicates!0 (array!25375 (_ BitVec 32) List!7071) Bool)

(assert (=> b!417114 (= res!242927 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7068))))

(declare-fun b!417115 () Bool)

(declare-fun res!242932 () Bool)

(assert (=> b!417115 (=> (not res!242932) (not e!248855))))

(declare-fun arrayContainsKey!0 (array!25375 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!417115 (= res!242932 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!417116 () Bool)

(declare-fun res!242938 () Bool)

(assert (=> b!417116 (=> (not res!242938) (not e!248858))))

(assert (=> b!417116 (= res!242938 (arrayNoDuplicates!0 lt!190959 #b00000000000000000000000000000000 Nil!7068))))

(declare-fun b!417117 () Bool)

(declare-fun res!242933 () Bool)

(assert (=> b!417117 (=> (not res!242933) (not e!248855))))

(assert (=> b!417117 (= res!242933 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!417118 () Bool)

(declare-fun e!248853 () Bool)

(assert (=> b!417118 (= e!248853 tp_is_empty!10765)))

(declare-fun mapNonEmpty!17769 () Bool)

(declare-fun tp!34368 () Bool)

(assert (=> mapNonEmpty!17769 (= mapRes!17769 (and tp!34368 e!248853))))

(declare-fun mapValue!17769 () ValueCell!5039)

(declare-fun mapRest!17769 () (Array (_ BitVec 32) ValueCell!5039))

(declare-fun mapKey!17769 () (_ BitVec 32))

(assert (=> mapNonEmpty!17769 (= (arr!12136 _values!549) (store mapRest!17769 mapKey!17769 mapValue!17769))))

(assert (= (and start!39332 res!242928) b!417100))

(assert (= (and b!417100 res!242929) b!417107))

(assert (= (and b!417107 res!242930) b!417117))

(assert (= (and b!417117 res!242933) b!417114))

(assert (= (and b!417114 res!242927) b!417109))

(assert (= (and b!417109 res!242936) b!417112))

(assert (= (and b!417112 res!242937) b!417113))

(assert (= (and b!417113 res!242939) b!417115))

(assert (= (and b!417115 res!242932) b!417110))

(assert (= (and b!417110 res!242940) b!417116))

(assert (= (and b!417116 res!242938) b!417103))

(assert (= (and b!417103 res!242934) b!417101))

(assert (= (and b!417101 res!242931) b!417104))

(assert (= (and b!417104 c!55062) b!417105))

(assert (= (and b!417104 (not c!55062)) b!417102))

(assert (= (or b!417105 b!417102) bm!28990))

(assert (= (or b!417105 b!417102) bm!28989))

(assert (= (and b!417104 (not res!242935)) b!417108))

(assert (= (and b!417111 condMapEmpty!17769) mapIsEmpty!17769))

(assert (= (and b!417111 (not condMapEmpty!17769)) mapNonEmpty!17769))

(get-info :version)

(assert (= (and mapNonEmpty!17769 ((_ is ValueCellFull!5039) mapValue!17769)) b!417118))

(assert (= (and b!417111 ((_ is ValueCellFull!5039) mapDefault!17769)) b!417106))

(assert (= start!39332 b!417111))

(declare-fun b_lambda!8899 () Bool)

(assert (=> (not b_lambda!8899) (not b!417108)))

(declare-fun t!12338 () Bool)

(declare-fun tb!3227 () Bool)

(assert (=> (and start!39332 (= defaultEntry!557 defaultEntry!557) t!12338) tb!3227))

(declare-fun result!5989 () Bool)

(assert (=> tb!3227 (= result!5989 tp_is_empty!10765)))

(assert (=> b!417108 t!12338))

(declare-fun b_and!17077 () Bool)

(assert (= b_and!17075 (and (=> t!12338 result!5989) b_and!17077)))

(declare-fun m!405903 () Bool)

(assert (=> bm!28990 m!405903))

(declare-fun m!405905 () Bool)

(assert (=> b!417114 m!405905))

(declare-fun m!405907 () Bool)

(assert (=> mapNonEmpty!17769 m!405907))

(declare-fun m!405909 () Bool)

(assert (=> b!417110 m!405909))

(declare-fun m!405911 () Bool)

(assert (=> b!417110 m!405911))

(declare-fun m!405913 () Bool)

(assert (=> b!417105 m!405913))

(declare-fun m!405915 () Bool)

(assert (=> b!417112 m!405915))

(declare-fun m!405917 () Bool)

(assert (=> b!417104 m!405917))

(assert (=> b!417104 m!405917))

(declare-fun m!405919 () Bool)

(assert (=> b!417104 m!405919))

(declare-fun m!405921 () Bool)

(assert (=> b!417104 m!405921))

(declare-fun m!405923 () Bool)

(assert (=> b!417116 m!405923))

(declare-fun m!405925 () Bool)

(assert (=> b!417100 m!405925))

(declare-fun m!405927 () Bool)

(assert (=> b!417113 m!405927))

(declare-fun m!405929 () Bool)

(assert (=> b!417101 m!405929))

(declare-fun m!405931 () Bool)

(assert (=> b!417101 m!405931))

(declare-fun m!405933 () Bool)

(assert (=> b!417101 m!405933))

(declare-fun m!405935 () Bool)

(assert (=> b!417108 m!405935))

(declare-fun m!405937 () Bool)

(assert (=> b!417108 m!405937))

(assert (=> b!417108 m!405937))

(declare-fun m!405939 () Bool)

(assert (=> b!417108 m!405939))

(declare-fun m!405941 () Bool)

(assert (=> b!417108 m!405941))

(declare-fun m!405943 () Bool)

(assert (=> b!417108 m!405943))

(declare-fun m!405945 () Bool)

(assert (=> b!417108 m!405945))

(assert (=> b!417108 m!405943))

(declare-fun m!405947 () Bool)

(assert (=> b!417108 m!405947))

(declare-fun m!405949 () Bool)

(assert (=> b!417108 m!405949))

(declare-fun m!405951 () Bool)

(assert (=> b!417108 m!405951))

(declare-fun m!405953 () Bool)

(assert (=> b!417108 m!405953))

(assert (=> b!417108 m!405951))

(declare-fun m!405955 () Bool)

(assert (=> b!417108 m!405955))

(declare-fun m!405957 () Bool)

(assert (=> b!417108 m!405957))

(assert (=> b!417108 m!405931))

(declare-fun m!405959 () Bool)

(assert (=> b!417117 m!405959))

(declare-fun m!405961 () Bool)

(assert (=> b!417115 m!405961))

(declare-fun m!405963 () Bool)

(assert (=> start!39332 m!405963))

(declare-fun m!405965 () Bool)

(assert (=> start!39332 m!405965))

(declare-fun m!405967 () Bool)

(assert (=> bm!28989 m!405967))

(check-sat (not b!417101) (not b!417110) (not b!417116) (not b_next!9613) b_and!17077 (not b!417100) (not b!417117) (not b!417114) (not b!417108) (not start!39332) (not b_lambda!8899) tp_is_empty!10765 (not mapNonEmpty!17769) (not b!417105) (not b!417112) (not b!417115) (not bm!28990) (not b!417104) (not bm!28989))
(check-sat b_and!17077 (not b_next!9613))
