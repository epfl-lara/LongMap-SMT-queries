; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40808 () Bool)

(assert start!40808)

(declare-fun b_free!10797 () Bool)

(declare-fun b_next!10797 () Bool)

(assert (=> start!40808 (= b_free!10797 (not b_next!10797))))

(declare-fun tp!38213 () Bool)

(declare-fun b_and!18881 () Bool)

(assert (=> start!40808 (= tp!38213 b_and!18881)))

(declare-fun res!269806 () Bool)

(declare-fun e!265114 () Bool)

(assert (=> start!40808 (=> (not res!269806) (not e!265114))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28077 0))(
  ( (array!28078 (arr!13483 (Array (_ BitVec 32) (_ BitVec 64))) (size!13835 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28077)

(assert (=> start!40808 (= res!269806 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13835 _keys!709))))))

(assert (=> start!40808 e!265114))

(declare-fun tp_is_empty!12135 () Bool)

(assert (=> start!40808 tp_is_empty!12135))

(assert (=> start!40808 tp!38213))

(assert (=> start!40808 true))

(declare-datatypes ((V!17285 0))(
  ( (V!17286 (val!6112 Int)) )
))
(declare-datatypes ((ValueCell!5724 0))(
  ( (ValueCellFull!5724 (v!8371 V!17285)) (EmptyCell!5724) )
))
(declare-datatypes ((array!28079 0))(
  ( (array!28080 (arr!13484 (Array (_ BitVec 32) ValueCell!5724)) (size!13836 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28079)

(declare-fun e!265120 () Bool)

(declare-fun array_inv!9766 (array!28079) Bool)

(assert (=> start!40808 (and (array_inv!9766 _values!549) e!265120)))

(declare-fun array_inv!9767 (array!28077) Bool)

(assert (=> start!40808 (array_inv!9767 _keys!709)))

(declare-fun b!452884 () Bool)

(declare-fun e!265121 () Bool)

(declare-fun e!265116 () Bool)

(assert (=> b!452884 (= e!265121 (not e!265116))))

(declare-fun res!269810 () Bool)

(assert (=> b!452884 (=> res!269810 e!265116)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452884 (= res!269810 (validKeyInArray!0 (select (arr!13483 _keys!709) from!863)))))

(declare-fun e!265119 () Bool)

(assert (=> b!452884 e!265119))

(declare-fun c!56144 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!452884 (= c!56144 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!17285)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17285)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17285)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((Unit!13242 0))(
  ( (Unit!13243) )
))
(declare-fun lt!205492 () Unit!13242)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!735 (array!28077 array!28079 (_ BitVec 32) (_ BitVec 32) V!17285 V!17285 (_ BitVec 32) (_ BitVec 64) V!17285 (_ BitVec 32) Int) Unit!13242)

(assert (=> b!452884 (= lt!205492 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!735 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452885 () Bool)

(declare-fun res!269803 () Bool)

(declare-fun e!265118 () Bool)

(assert (=> b!452885 (=> (not res!269803) (not e!265118))))

(assert (=> b!452885 (= res!269803 (bvsle from!863 i!563))))

(declare-fun b!452886 () Bool)

(declare-fun res!269802 () Bool)

(assert (=> b!452886 (=> (not res!269802) (not e!265118))))

(declare-fun lt!205493 () array!28077)

(declare-datatypes ((List!8107 0))(
  ( (Nil!8104) (Cons!8103 (h!8959 (_ BitVec 64)) (t!13927 List!8107)) )
))
(declare-fun arrayNoDuplicates!0 (array!28077 (_ BitVec 32) List!8107) Bool)

(assert (=> b!452886 (= res!269802 (arrayNoDuplicates!0 lt!205493 #b00000000000000000000000000000000 Nil!8104))))

(declare-fun lt!205495 () array!28079)

(declare-fun bm!30001 () Bool)

(declare-datatypes ((tuple2!8050 0))(
  ( (tuple2!8051 (_1!4036 (_ BitVec 64)) (_2!4036 V!17285)) )
))
(declare-datatypes ((List!8108 0))(
  ( (Nil!8105) (Cons!8104 (h!8960 tuple2!8050) (t!13928 List!8108)) )
))
(declare-datatypes ((ListLongMap!6963 0))(
  ( (ListLongMap!6964 (toList!3497 List!8108)) )
))
(declare-fun call!30004 () ListLongMap!6963)

(declare-fun getCurrentListMapNoExtraKeys!1680 (array!28077 array!28079 (_ BitVec 32) (_ BitVec 32) V!17285 V!17285 (_ BitVec 32) Int) ListLongMap!6963)

(assert (=> bm!30001 (= call!30004 (getCurrentListMapNoExtraKeys!1680 (ite c!56144 _keys!709 lt!205493) (ite c!56144 _values!549 lt!205495) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452887 () Bool)

(declare-fun call!30005 () ListLongMap!6963)

(declare-fun +!1573 (ListLongMap!6963 tuple2!8050) ListLongMap!6963)

(assert (=> b!452887 (= e!265119 (= call!30005 (+!1573 call!30004 (tuple2!8051 k0!794 v!412))))))

(declare-fun b!452888 () Bool)

(declare-fun res!269809 () Bool)

(assert (=> b!452888 (=> (not res!269809) (not e!265114))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452888 (= res!269809 (validMask!0 mask!1025))))

(declare-fun b!452889 () Bool)

(declare-fun e!265113 () Bool)

(assert (=> b!452889 (= e!265113 tp_is_empty!12135)))

(declare-fun b!452890 () Bool)

(declare-fun res!269813 () Bool)

(assert (=> b!452890 (=> (not res!269813) (not e!265114))))

(assert (=> b!452890 (= res!269813 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13835 _keys!709))))))

(declare-fun b!452891 () Bool)

(assert (=> b!452891 (= e!265118 e!265121)))

(declare-fun res!269807 () Bool)

(assert (=> b!452891 (=> (not res!269807) (not e!265121))))

(assert (=> b!452891 (= res!269807 (= from!863 i!563))))

(declare-fun lt!205490 () ListLongMap!6963)

(assert (=> b!452891 (= lt!205490 (getCurrentListMapNoExtraKeys!1680 lt!205493 lt!205495 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!452891 (= lt!205495 (array!28080 (store (arr!13484 _values!549) i!563 (ValueCellFull!5724 v!412)) (size!13836 _values!549)))))

(declare-fun lt!205491 () ListLongMap!6963)

(assert (=> b!452891 (= lt!205491 (getCurrentListMapNoExtraKeys!1680 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!19839 () Bool)

(declare-fun mapRes!19839 () Bool)

(assert (=> mapIsEmpty!19839 mapRes!19839))

(declare-fun b!452892 () Bool)

(declare-fun res!269800 () Bool)

(assert (=> b!452892 (=> (not res!269800) (not e!265114))))

(assert (=> b!452892 (= res!269800 (validKeyInArray!0 k0!794))))

(declare-fun b!452893 () Bool)

(declare-fun res!269805 () Bool)

(assert (=> b!452893 (=> (not res!269805) (not e!265114))))

(assert (=> b!452893 (= res!269805 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8104))))

(declare-fun b!452894 () Bool)

(declare-fun e!265115 () Bool)

(assert (=> b!452894 (= e!265115 tp_is_empty!12135)))

(declare-fun b!452895 () Bool)

(declare-fun res!269808 () Bool)

(assert (=> b!452895 (=> (not res!269808) (not e!265114))))

(declare-fun arrayContainsKey!0 (array!28077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452895 (= res!269808 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!452896 () Bool)

(assert (=> b!452896 (= e!265114 e!265118)))

(declare-fun res!269804 () Bool)

(assert (=> b!452896 (=> (not res!269804) (not e!265118))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28077 (_ BitVec 32)) Bool)

(assert (=> b!452896 (= res!269804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205493 mask!1025))))

(assert (=> b!452896 (= lt!205493 (array!28078 (store (arr!13483 _keys!709) i!563 k0!794) (size!13835 _keys!709)))))

(declare-fun mapNonEmpty!19839 () Bool)

(declare-fun tp!38214 () Bool)

(assert (=> mapNonEmpty!19839 (= mapRes!19839 (and tp!38214 e!265113))))

(declare-fun mapKey!19839 () (_ BitVec 32))

(declare-fun mapRest!19839 () (Array (_ BitVec 32) ValueCell!5724))

(declare-fun mapValue!19839 () ValueCell!5724)

(assert (=> mapNonEmpty!19839 (= (arr!13484 _values!549) (store mapRest!19839 mapKey!19839 mapValue!19839))))

(declare-fun b!452897 () Bool)

(assert (=> b!452897 (= e!265116 true)))

(declare-fun lt!205496 () tuple2!8050)

(declare-fun lt!205488 () V!17285)

(declare-fun lt!205487 () ListLongMap!6963)

(assert (=> b!452897 (= (+!1573 lt!205487 lt!205496) (+!1573 (+!1573 lt!205487 (tuple2!8051 k0!794 lt!205488)) lt!205496))))

(declare-fun lt!205486 () V!17285)

(assert (=> b!452897 (= lt!205496 (tuple2!8051 k0!794 lt!205486))))

(declare-fun lt!205489 () Unit!13242)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!84 (ListLongMap!6963 (_ BitVec 64) V!17285 V!17285) Unit!13242)

(assert (=> b!452897 (= lt!205489 (addSameAsAddTwiceSameKeyDiffValues!84 lt!205487 k0!794 lt!205488 lt!205486))))

(declare-fun lt!205494 () V!17285)

(declare-fun get!6648 (ValueCell!5724 V!17285) V!17285)

(assert (=> b!452897 (= lt!205488 (get!6648 (select (arr!13484 _values!549) from!863) lt!205494))))

(assert (=> b!452897 (= lt!205490 (+!1573 lt!205487 (tuple2!8051 (select (arr!13483 lt!205493) from!863) lt!205486)))))

(assert (=> b!452897 (= lt!205486 (get!6648 (select (store (arr!13484 _values!549) i!563 (ValueCellFull!5724 v!412)) from!863) lt!205494))))

(declare-fun dynLambda!871 (Int (_ BitVec 64)) V!17285)

(assert (=> b!452897 (= lt!205494 (dynLambda!871 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452897 (= lt!205487 (getCurrentListMapNoExtraKeys!1680 lt!205493 lt!205495 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452898 () Bool)

(assert (=> b!452898 (= e!265119 (= call!30004 call!30005))))

(declare-fun b!452899 () Bool)

(assert (=> b!452899 (= e!265120 (and e!265115 mapRes!19839))))

(declare-fun condMapEmpty!19839 () Bool)

(declare-fun mapDefault!19839 () ValueCell!5724)

(assert (=> b!452899 (= condMapEmpty!19839 (= (arr!13484 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5724)) mapDefault!19839)))))

(declare-fun b!452900 () Bool)

(declare-fun res!269811 () Bool)

(assert (=> b!452900 (=> (not res!269811) (not e!265114))))

(assert (=> b!452900 (= res!269811 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452901 () Bool)

(declare-fun res!269801 () Bool)

(assert (=> b!452901 (=> (not res!269801) (not e!265114))))

(assert (=> b!452901 (= res!269801 (and (= (size!13836 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13835 _keys!709) (size!13836 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!30002 () Bool)

(assert (=> bm!30002 (= call!30005 (getCurrentListMapNoExtraKeys!1680 (ite c!56144 lt!205493 _keys!709) (ite c!56144 lt!205495 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452902 () Bool)

(declare-fun res!269812 () Bool)

(assert (=> b!452902 (=> (not res!269812) (not e!265114))))

(assert (=> b!452902 (= res!269812 (or (= (select (arr!13483 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13483 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40808 res!269806) b!452888))

(assert (= (and b!452888 res!269809) b!452901))

(assert (= (and b!452901 res!269801) b!452900))

(assert (= (and b!452900 res!269811) b!452893))

(assert (= (and b!452893 res!269805) b!452890))

(assert (= (and b!452890 res!269813) b!452892))

(assert (= (and b!452892 res!269800) b!452902))

(assert (= (and b!452902 res!269812) b!452895))

(assert (= (and b!452895 res!269808) b!452896))

(assert (= (and b!452896 res!269804) b!452886))

(assert (= (and b!452886 res!269802) b!452885))

(assert (= (and b!452885 res!269803) b!452891))

(assert (= (and b!452891 res!269807) b!452884))

(assert (= (and b!452884 c!56144) b!452887))

(assert (= (and b!452884 (not c!56144)) b!452898))

(assert (= (or b!452887 b!452898) bm!30002))

(assert (= (or b!452887 b!452898) bm!30001))

(assert (= (and b!452884 (not res!269810)) b!452897))

(assert (= (and b!452899 condMapEmpty!19839) mapIsEmpty!19839))

(assert (= (and b!452899 (not condMapEmpty!19839)) mapNonEmpty!19839))

(get-info :version)

(assert (= (and mapNonEmpty!19839 ((_ is ValueCellFull!5724) mapValue!19839)) b!452889))

(assert (= (and b!452899 ((_ is ValueCellFull!5724) mapDefault!19839)) b!452894))

(assert (= start!40808 b!452899))

(declare-fun b_lambda!9575 () Bool)

(assert (=> (not b_lambda!9575) (not b!452897)))

(declare-fun t!13926 () Bool)

(declare-fun tb!3777 () Bool)

(assert (=> (and start!40808 (= defaultEntry!557 defaultEntry!557) t!13926) tb!3777))

(declare-fun result!7091 () Bool)

(assert (=> tb!3777 (= result!7091 tp_is_empty!12135)))

(assert (=> b!452897 t!13926))

(declare-fun b_and!18883 () Bool)

(assert (= b_and!18881 (and (=> t!13926 result!7091) b_and!18883)))

(declare-fun m!436655 () Bool)

(assert (=> b!452887 m!436655))

(declare-fun m!436657 () Bool)

(assert (=> b!452900 m!436657))

(declare-fun m!436659 () Bool)

(assert (=> b!452891 m!436659))

(declare-fun m!436661 () Bool)

(assert (=> b!452891 m!436661))

(declare-fun m!436663 () Bool)

(assert (=> b!452891 m!436663))

(declare-fun m!436665 () Bool)

(assert (=> b!452888 m!436665))

(declare-fun m!436667 () Bool)

(assert (=> b!452892 m!436667))

(declare-fun m!436669 () Bool)

(assert (=> b!452893 m!436669))

(declare-fun m!436671 () Bool)

(assert (=> bm!30002 m!436671))

(declare-fun m!436673 () Bool)

(assert (=> start!40808 m!436673))

(declare-fun m!436675 () Bool)

(assert (=> start!40808 m!436675))

(declare-fun m!436677 () Bool)

(assert (=> b!452895 m!436677))

(declare-fun m!436679 () Bool)

(assert (=> b!452886 m!436679))

(declare-fun m!436681 () Bool)

(assert (=> bm!30001 m!436681))

(declare-fun m!436683 () Bool)

(assert (=> mapNonEmpty!19839 m!436683))

(declare-fun m!436685 () Bool)

(assert (=> b!452896 m!436685))

(declare-fun m!436687 () Bool)

(assert (=> b!452896 m!436687))

(declare-fun m!436689 () Bool)

(assert (=> b!452884 m!436689))

(assert (=> b!452884 m!436689))

(declare-fun m!436691 () Bool)

(assert (=> b!452884 m!436691))

(declare-fun m!436693 () Bool)

(assert (=> b!452884 m!436693))

(declare-fun m!436695 () Bool)

(assert (=> b!452897 m!436695))

(declare-fun m!436697 () Bool)

(assert (=> b!452897 m!436697))

(declare-fun m!436699 () Bool)

(assert (=> b!452897 m!436699))

(assert (=> b!452897 m!436697))

(declare-fun m!436701 () Bool)

(assert (=> b!452897 m!436701))

(declare-fun m!436703 () Bool)

(assert (=> b!452897 m!436703))

(declare-fun m!436705 () Bool)

(assert (=> b!452897 m!436705))

(declare-fun m!436707 () Bool)

(assert (=> b!452897 m!436707))

(declare-fun m!436709 () Bool)

(assert (=> b!452897 m!436709))

(assert (=> b!452897 m!436703))

(declare-fun m!436711 () Bool)

(assert (=> b!452897 m!436711))

(declare-fun m!436713 () Bool)

(assert (=> b!452897 m!436713))

(assert (=> b!452897 m!436707))

(declare-fun m!436715 () Bool)

(assert (=> b!452897 m!436715))

(assert (=> b!452897 m!436661))

(declare-fun m!436717 () Bool)

(assert (=> b!452897 m!436717))

(declare-fun m!436719 () Bool)

(assert (=> b!452902 m!436719))

(check-sat (not b!452896) (not mapNonEmpty!19839) (not b_next!10797) (not b!452888) (not b!452900) (not start!40808) (not bm!30001) (not b!452897) (not b!452892) (not b!452891) (not b!452887) (not b!452884) (not bm!30002) tp_is_empty!12135 (not b!452895) (not b!452893) (not b_lambda!9575) (not b!452886) b_and!18883)
(check-sat b_and!18883 (not b_next!10797))
