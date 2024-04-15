; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40798 () Bool)

(assert start!40798)

(declare-fun b_free!10801 () Bool)

(declare-fun b_next!10801 () Bool)

(assert (=> start!40798 (= b_free!10801 (not b_next!10801))))

(declare-fun tp!38226 () Bool)

(declare-fun b_and!18863 () Bool)

(assert (=> start!40798 (= tp!38226 b_and!18863)))

(declare-fun b!452731 () Bool)

(declare-fun res!269764 () Bool)

(declare-fun e!264997 () Bool)

(assert (=> b!452731 (=> (not res!269764) (not e!264997))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!452731 (= res!269764 (validKeyInArray!0 k0!794))))

(declare-fun b!452732 () Bool)

(declare-fun res!269757 () Bool)

(declare-fun e!265001 () Bool)

(assert (=> b!452732 (=> (not res!269757) (not e!265001))))

(declare-datatypes ((array!28073 0))(
  ( (array!28074 (arr!13481 (Array (_ BitVec 32) (_ BitVec 64))) (size!13834 (_ BitVec 32))) )
))
(declare-fun lt!205321 () array!28073)

(declare-datatypes ((List!8117 0))(
  ( (Nil!8114) (Cons!8113 (h!8969 (_ BitVec 64)) (t!13932 List!8117)) )
))
(declare-fun arrayNoDuplicates!0 (array!28073 (_ BitVec 32) List!8117) Bool)

(assert (=> b!452732 (= res!269757 (arrayNoDuplicates!0 lt!205321 #b00000000000000000000000000000000 Nil!8114))))

(declare-datatypes ((V!17291 0))(
  ( (V!17292 (val!6114 Int)) )
))
(declare-datatypes ((tuple2!8060 0))(
  ( (tuple2!8061 (_1!4041 (_ BitVec 64)) (_2!4041 V!17291)) )
))
(declare-datatypes ((List!8118 0))(
  ( (Nil!8115) (Cons!8114 (h!8970 tuple2!8060) (t!13933 List!8118)) )
))
(declare-datatypes ((ListLongMap!6963 0))(
  ( (ListLongMap!6964 (toList!3497 List!8118)) )
))
(declare-fun call!29992 () ListLongMap!6963)

(declare-fun e!265000 () Bool)

(declare-fun call!29991 () ListLongMap!6963)

(declare-fun v!412 () V!17291)

(declare-fun b!452733 () Bool)

(declare-fun +!1594 (ListLongMap!6963 tuple2!8060) ListLongMap!6963)

(assert (=> b!452733 (= e!265000 (= call!29992 (+!1594 call!29991 (tuple2!8061 k0!794 v!412))))))

(declare-fun b!452735 () Bool)

(declare-fun res!269760 () Bool)

(assert (=> b!452735 (=> (not res!269760) (not e!264997))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun _keys!709 () array!28073)

(assert (=> b!452735 (= res!269760 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13834 _keys!709))))))

(declare-fun b!452736 () Bool)

(declare-fun res!269766 () Bool)

(assert (=> b!452736 (=> (not res!269766) (not e!264997))))

(assert (=> b!452736 (= res!269766 (or (= (select (arr!13481 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13481 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!452737 () Bool)

(declare-fun res!269765 () Bool)

(assert (=> b!452737 (=> (not res!269765) (not e!264997))))

(assert (=> b!452737 (= res!269765 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8114))))

(declare-fun b!452738 () Bool)

(declare-fun e!264995 () Bool)

(assert (=> b!452738 (= e!265001 e!264995)))

(declare-fun res!269763 () Bool)

(assert (=> b!452738 (=> (not res!269763) (not e!264995))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!452738 (= res!269763 (= from!863 i!563))))

(declare-fun minValue!515 () V!17291)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!205319 () ListLongMap!6963)

(declare-datatypes ((ValueCell!5726 0))(
  ( (ValueCellFull!5726 (v!8367 V!17291)) (EmptyCell!5726) )
))
(declare-datatypes ((array!28075 0))(
  ( (array!28076 (arr!13482 (Array (_ BitVec 32) ValueCell!5726)) (size!13835 (_ BitVec 32))) )
))
(declare-fun lt!205322 () array!28075)

(declare-fun zeroValue!515 () V!17291)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1692 (array!28073 array!28075 (_ BitVec 32) (_ BitVec 32) V!17291 V!17291 (_ BitVec 32) Int) ListLongMap!6963)

(assert (=> b!452738 (= lt!205319 (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28075)

(assert (=> b!452738 (= lt!205322 (array!28076 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13835 _values!549)))))

(declare-fun lt!205327 () ListLongMap!6963)

(assert (=> b!452738 (= lt!205327 (getCurrentListMapNoExtraKeys!1692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!452739 () Bool)

(declare-fun e!264994 () Bool)

(assert (=> b!452739 (= e!264994 (= lt!205319 (+!1594 lt!205327 (tuple2!8061 k0!794 v!412))))))

(declare-fun lt!205328 () V!17291)

(declare-fun lt!205318 () ListLongMap!6963)

(declare-fun lt!205326 () tuple2!8060)

(assert (=> b!452739 (= (+!1594 lt!205318 lt!205326) (+!1594 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328)) lt!205326))))

(declare-fun lt!205320 () V!17291)

(assert (=> b!452739 (= lt!205326 (tuple2!8061 k0!794 lt!205320))))

(declare-datatypes ((Unit!13211 0))(
  ( (Unit!13212) )
))
(declare-fun lt!205324 () Unit!13211)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!89 (ListLongMap!6963 (_ BitVec 64) V!17291 V!17291) Unit!13211)

(assert (=> b!452739 (= lt!205324 (addSameAsAddTwiceSameKeyDiffValues!89 lt!205318 k0!794 lt!205328 lt!205320))))

(declare-fun lt!205323 () V!17291)

(declare-fun get!6650 (ValueCell!5726 V!17291) V!17291)

(assert (=> b!452739 (= lt!205328 (get!6650 (select (arr!13482 _values!549) from!863) lt!205323))))

(assert (=> b!452739 (= lt!205319 (+!1594 lt!205318 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))

(assert (=> b!452739 (= lt!205320 (get!6650 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863) lt!205323))))

(declare-fun dynLambda!868 (Int (_ BitVec 64)) V!17291)

(assert (=> b!452739 (= lt!205323 (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!452739 (= lt!205318 (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452740 () Bool)

(assert (=> b!452740 (= e!264995 (not e!264994))))

(declare-fun res!269756 () Bool)

(assert (=> b!452740 (=> res!269756 e!264994)))

(assert (=> b!452740 (= res!269756 (validKeyInArray!0 (select (arr!13481 _keys!709) from!863)))))

(assert (=> b!452740 e!265000))

(declare-fun c!56079 () Bool)

(assert (=> b!452740 (= c!56079 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!205325 () Unit!13211)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!731 (array!28073 array!28075 (_ BitVec 32) (_ BitVec 32) V!17291 V!17291 (_ BitVec 32) (_ BitVec 64) V!17291 (_ BitVec 32) Int) Unit!13211)

(assert (=> b!452740 (= lt!205325 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!731 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!19845 () Bool)

(declare-fun mapRes!19845 () Bool)

(assert (=> mapIsEmpty!19845 mapRes!19845))

(declare-fun bm!29988 () Bool)

(assert (=> bm!29988 (= call!29992 (getCurrentListMapNoExtraKeys!1692 (ite c!56079 lt!205321 _keys!709) (ite c!56079 lt!205322 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452741 () Bool)

(declare-fun e!264998 () Bool)

(declare-fun tp_is_empty!12139 () Bool)

(assert (=> b!452741 (= e!264998 tp_is_empty!12139)))

(declare-fun b!452742 () Bool)

(declare-fun e!264996 () Bool)

(assert (=> b!452742 (= e!264996 (and e!264998 mapRes!19845))))

(declare-fun condMapEmpty!19845 () Bool)

(declare-fun mapDefault!19845 () ValueCell!5726)

(assert (=> b!452742 (= condMapEmpty!19845 (= (arr!13482 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5726)) mapDefault!19845)))))

(declare-fun b!452734 () Bool)

(assert (=> b!452734 (= e!265000 (= call!29991 call!29992))))

(declare-fun res!269759 () Bool)

(assert (=> start!40798 (=> (not res!269759) (not e!264997))))

(assert (=> start!40798 (= res!269759 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13834 _keys!709))))))

(assert (=> start!40798 e!264997))

(assert (=> start!40798 tp_is_empty!12139))

(assert (=> start!40798 tp!38226))

(assert (=> start!40798 true))

(declare-fun array_inv!9824 (array!28075) Bool)

(assert (=> start!40798 (and (array_inv!9824 _values!549) e!264996)))

(declare-fun array_inv!9825 (array!28073) Bool)

(assert (=> start!40798 (array_inv!9825 _keys!709)))

(declare-fun b!452743 () Bool)

(assert (=> b!452743 (= e!264997 e!265001)))

(declare-fun res!269755 () Bool)

(assert (=> b!452743 (=> (not res!269755) (not e!265001))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28073 (_ BitVec 32)) Bool)

(assert (=> b!452743 (= res!269755 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205321 mask!1025))))

(assert (=> b!452743 (= lt!205321 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709)))))

(declare-fun b!452744 () Bool)

(declare-fun e!264993 () Bool)

(assert (=> b!452744 (= e!264993 tp_is_empty!12139)))

(declare-fun b!452745 () Bool)

(declare-fun res!269758 () Bool)

(assert (=> b!452745 (=> (not res!269758) (not e!265001))))

(assert (=> b!452745 (= res!269758 (bvsle from!863 i!563))))

(declare-fun b!452746 () Bool)

(declare-fun res!269767 () Bool)

(assert (=> b!452746 (=> (not res!269767) (not e!264997))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!452746 (= res!269767 (validMask!0 mask!1025))))

(declare-fun b!452747 () Bool)

(declare-fun res!269768 () Bool)

(assert (=> b!452747 (=> (not res!269768) (not e!264997))))

(assert (=> b!452747 (= res!269768 (and (= (size!13835 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13834 _keys!709) (size!13835 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!452748 () Bool)

(declare-fun res!269762 () Bool)

(assert (=> b!452748 (=> (not res!269762) (not e!264997))))

(assert (=> b!452748 (= res!269762 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!19845 () Bool)

(declare-fun tp!38225 () Bool)

(assert (=> mapNonEmpty!19845 (= mapRes!19845 (and tp!38225 e!264993))))

(declare-fun mapValue!19845 () ValueCell!5726)

(declare-fun mapRest!19845 () (Array (_ BitVec 32) ValueCell!5726))

(declare-fun mapKey!19845 () (_ BitVec 32))

(assert (=> mapNonEmpty!19845 (= (arr!13482 _values!549) (store mapRest!19845 mapKey!19845 mapValue!19845))))

(declare-fun bm!29989 () Bool)

(assert (=> bm!29989 (= call!29991 (getCurrentListMapNoExtraKeys!1692 (ite c!56079 _keys!709 lt!205321) (ite c!56079 _values!549 lt!205322) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!452749 () Bool)

(declare-fun res!269761 () Bool)

(assert (=> b!452749 (=> (not res!269761) (not e!264997))))

(declare-fun arrayContainsKey!0 (array!28073 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!452749 (= res!269761 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40798 res!269759) b!452746))

(assert (= (and b!452746 res!269767) b!452747))

(assert (= (and b!452747 res!269768) b!452748))

(assert (= (and b!452748 res!269762) b!452737))

(assert (= (and b!452737 res!269765) b!452735))

(assert (= (and b!452735 res!269760) b!452731))

(assert (= (and b!452731 res!269764) b!452736))

(assert (= (and b!452736 res!269766) b!452749))

(assert (= (and b!452749 res!269761) b!452743))

(assert (= (and b!452743 res!269755) b!452732))

(assert (= (and b!452732 res!269757) b!452745))

(assert (= (and b!452745 res!269758) b!452738))

(assert (= (and b!452738 res!269763) b!452740))

(assert (= (and b!452740 c!56079) b!452733))

(assert (= (and b!452740 (not c!56079)) b!452734))

(assert (= (or b!452733 b!452734) bm!29988))

(assert (= (or b!452733 b!452734) bm!29989))

(assert (= (and b!452740 (not res!269756)) b!452739))

(assert (= (and b!452742 condMapEmpty!19845) mapIsEmpty!19845))

(assert (= (and b!452742 (not condMapEmpty!19845)) mapNonEmpty!19845))

(get-info :version)

(assert (= (and mapNonEmpty!19845 ((_ is ValueCellFull!5726) mapValue!19845)) b!452744))

(assert (= (and b!452742 ((_ is ValueCellFull!5726) mapDefault!19845)) b!452741))

(assert (= start!40798 b!452742))

(declare-fun b_lambda!9561 () Bool)

(assert (=> (not b_lambda!9561) (not b!452739)))

(declare-fun t!13931 () Bool)

(declare-fun tb!3773 () Bool)

(assert (=> (and start!40798 (= defaultEntry!557 defaultEntry!557) t!13931) tb!3773))

(declare-fun result!7091 () Bool)

(assert (=> tb!3773 (= result!7091 tp_is_empty!12139)))

(assert (=> b!452739 t!13931))

(declare-fun b_and!18865 () Bool)

(assert (= b_and!18863 (and (=> t!13931 result!7091) b_and!18865)))

(declare-fun m!436053 () Bool)

(assert (=> b!452731 m!436053))

(declare-fun m!436055 () Bool)

(assert (=> bm!29989 m!436055))

(declare-fun m!436057 () Bool)

(assert (=> b!452740 m!436057))

(assert (=> b!452740 m!436057))

(declare-fun m!436059 () Bool)

(assert (=> b!452740 m!436059))

(declare-fun m!436061 () Bool)

(assert (=> b!452740 m!436061))

(declare-fun m!436063 () Bool)

(assert (=> b!452746 m!436063))

(declare-fun m!436065 () Bool)

(assert (=> start!40798 m!436065))

(declare-fun m!436067 () Bool)

(assert (=> start!40798 m!436067))

(declare-fun m!436069 () Bool)

(assert (=> b!452739 m!436069))

(declare-fun m!436071 () Bool)

(assert (=> b!452739 m!436071))

(declare-fun m!436073 () Bool)

(assert (=> b!452739 m!436073))

(declare-fun m!436075 () Bool)

(assert (=> b!452739 m!436075))

(declare-fun m!436077 () Bool)

(assert (=> b!452739 m!436077))

(declare-fun m!436079 () Bool)

(assert (=> b!452739 m!436079))

(declare-fun m!436081 () Bool)

(assert (=> b!452739 m!436081))

(declare-fun m!436083 () Bool)

(assert (=> b!452739 m!436083))

(assert (=> b!452739 m!436079))

(declare-fun m!436085 () Bool)

(assert (=> b!452739 m!436085))

(declare-fun m!436087 () Bool)

(assert (=> b!452739 m!436087))

(declare-fun m!436089 () Bool)

(assert (=> b!452739 m!436089))

(declare-fun m!436091 () Bool)

(assert (=> b!452739 m!436091))

(declare-fun m!436093 () Bool)

(assert (=> b!452739 m!436093))

(assert (=> b!452739 m!436089))

(assert (=> b!452739 m!436077))

(declare-fun m!436095 () Bool)

(assert (=> b!452739 m!436095))

(declare-fun m!436097 () Bool)

(assert (=> bm!29988 m!436097))

(declare-fun m!436099 () Bool)

(assert (=> b!452733 m!436099))

(declare-fun m!436101 () Bool)

(assert (=> b!452743 m!436101))

(declare-fun m!436103 () Bool)

(assert (=> b!452743 m!436103))

(declare-fun m!436105 () Bool)

(assert (=> mapNonEmpty!19845 m!436105))

(declare-fun m!436107 () Bool)

(assert (=> b!452749 m!436107))

(declare-fun m!436109 () Bool)

(assert (=> b!452748 m!436109))

(declare-fun m!436111 () Bool)

(assert (=> b!452738 m!436111))

(assert (=> b!452738 m!436073))

(declare-fun m!436113 () Bool)

(assert (=> b!452738 m!436113))

(declare-fun m!436115 () Bool)

(assert (=> b!452732 m!436115))

(declare-fun m!436117 () Bool)

(assert (=> b!452736 m!436117))

(declare-fun m!436119 () Bool)

(assert (=> b!452737 m!436119))

(check-sat (not mapNonEmpty!19845) (not bm!29989) (not start!40798) (not b!452740) (not b!452746) (not bm!29988) b_and!18865 (not b_next!10801) (not b!452733) (not b!452748) (not b!452732) (not b!452737) (not b!452739) tp_is_empty!12139 (not b_lambda!9561) (not b!452738) (not b!452743) (not b!452749) (not b!452731))
(check-sat b_and!18865 (not b_next!10801))
(get-model)

(declare-fun b_lambda!9567 () Bool)

(assert (= b_lambda!9561 (or (and start!40798 b_free!10801) b_lambda!9567)))

(check-sat (not mapNonEmpty!19845) (not start!40798) (not b!452740) (not b!452746) tp_is_empty!12139 (not bm!29988) b_and!18865 (not b_next!10801) (not b!452733) (not bm!29989) (not b_lambda!9567) (not b!452748) (not b!452732) (not b!452737) (not b!452739) (not b!452738) (not b!452743) (not b!452749) (not b!452731))
(check-sat b_and!18865 (not b_next!10801))
(get-model)

(declare-fun b!452880 () Bool)

(declare-fun e!265065 () Bool)

(declare-fun call!30007 () Bool)

(assert (=> b!452880 (= e!265065 call!30007)))

(declare-fun b!452881 () Bool)

(declare-fun e!265067 () Bool)

(declare-fun e!265066 () Bool)

(assert (=> b!452881 (= e!265067 e!265066)))

(declare-fun res!269859 () Bool)

(assert (=> b!452881 (=> (not res!269859) (not e!265066))))

(declare-fun e!265064 () Bool)

(assert (=> b!452881 (= res!269859 (not e!265064))))

(declare-fun res!269860 () Bool)

(assert (=> b!452881 (=> (not res!269860) (not e!265064))))

(assert (=> b!452881 (= res!269860 (validKeyInArray!0 (select (arr!13481 lt!205321) #b00000000000000000000000000000000)))))

(declare-fun b!452882 () Bool)

(assert (=> b!452882 (= e!265065 call!30007)))

(declare-fun d!74117 () Bool)

(declare-fun res!269861 () Bool)

(assert (=> d!74117 (=> res!269861 e!265067)))

(assert (=> d!74117 (= res!269861 (bvsge #b00000000000000000000000000000000 (size!13834 lt!205321)))))

(assert (=> d!74117 (= (arrayNoDuplicates!0 lt!205321 #b00000000000000000000000000000000 Nil!8114) e!265067)))

(declare-fun b!452883 () Bool)

(assert (=> b!452883 (= e!265066 e!265065)))

(declare-fun c!56088 () Bool)

(assert (=> b!452883 (= c!56088 (validKeyInArray!0 (select (arr!13481 lt!205321) #b00000000000000000000000000000000)))))

(declare-fun b!452884 () Bool)

(declare-fun contains!2486 (List!8117 (_ BitVec 64)) Bool)

(assert (=> b!452884 (= e!265064 (contains!2486 Nil!8114 (select (arr!13481 lt!205321) #b00000000000000000000000000000000)))))

(declare-fun bm!30004 () Bool)

(assert (=> bm!30004 (= call!30007 (arrayNoDuplicates!0 lt!205321 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56088 (Cons!8113 (select (arr!13481 lt!205321) #b00000000000000000000000000000000) Nil!8114) Nil!8114)))))

(assert (= (and d!74117 (not res!269861)) b!452881))

(assert (= (and b!452881 res!269860) b!452884))

(assert (= (and b!452881 res!269859) b!452883))

(assert (= (and b!452883 c!56088) b!452882))

(assert (= (and b!452883 (not c!56088)) b!452880))

(assert (= (or b!452882 b!452880) bm!30004))

(declare-fun m!436257 () Bool)

(assert (=> b!452881 m!436257))

(assert (=> b!452881 m!436257))

(declare-fun m!436259 () Bool)

(assert (=> b!452881 m!436259))

(assert (=> b!452883 m!436257))

(assert (=> b!452883 m!436257))

(assert (=> b!452883 m!436259))

(assert (=> b!452884 m!436257))

(assert (=> b!452884 m!436257))

(declare-fun m!436261 () Bool)

(assert (=> b!452884 m!436261))

(assert (=> bm!30004 m!436257))

(declare-fun m!436263 () Bool)

(assert (=> bm!30004 m!436263))

(assert (=> b!452732 d!74117))

(declare-fun d!74119 () Bool)

(declare-fun res!269866 () Bool)

(declare-fun e!265072 () Bool)

(assert (=> d!74119 (=> res!269866 e!265072)))

(assert (=> d!74119 (= res!269866 (= (select (arr!13481 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74119 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!265072)))

(declare-fun b!452889 () Bool)

(declare-fun e!265073 () Bool)

(assert (=> b!452889 (= e!265072 e!265073)))

(declare-fun res!269867 () Bool)

(assert (=> b!452889 (=> (not res!269867) (not e!265073))))

(assert (=> b!452889 (= res!269867 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13834 _keys!709)))))

(declare-fun b!452890 () Bool)

(assert (=> b!452890 (= e!265073 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74119 (not res!269866)) b!452889))

(assert (= (and b!452889 res!269867) b!452890))

(declare-fun m!436265 () Bool)

(assert (=> d!74119 m!436265))

(declare-fun m!436267 () Bool)

(assert (=> b!452890 m!436267))

(assert (=> b!452749 d!74119))

(declare-fun b!452915 () Bool)

(declare-fun e!265088 () Bool)

(declare-fun e!265094 () Bool)

(assert (=> b!452915 (= e!265088 e!265094)))

(assert (=> b!452915 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (ite c!56079 _keys!709 lt!205321))))))

(declare-fun res!269876 () Bool)

(declare-fun lt!205411 () ListLongMap!6963)

(declare-fun contains!2487 (ListLongMap!6963 (_ BitVec 64)) Bool)

(assert (=> b!452915 (= res!269876 (contains!2487 lt!205411 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!452915 (=> (not res!269876) (not e!265094))))

(declare-fun b!452916 () Bool)

(declare-fun e!265090 () ListLongMap!6963)

(assert (=> b!452916 (= e!265090 (ListLongMap!6964 Nil!8115))))

(declare-fun d!74121 () Bool)

(declare-fun e!265092 () Bool)

(assert (=> d!74121 e!265092))

(declare-fun res!269879 () Bool)

(assert (=> d!74121 (=> (not res!269879) (not e!265092))))

(assert (=> d!74121 (= res!269879 (not (contains!2487 lt!205411 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74121 (= lt!205411 e!265090)))

(declare-fun c!56100 () Bool)

(assert (=> d!74121 (= c!56100 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (ite c!56079 _keys!709 lt!205321))))))

(assert (=> d!74121 (validMask!0 mask!1025)))

(assert (=> d!74121 (= (getCurrentListMapNoExtraKeys!1692 (ite c!56079 _keys!709 lt!205321) (ite c!56079 _values!549 lt!205322) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205411)))

(declare-fun e!265089 () Bool)

(declare-fun b!452917 () Bool)

(assert (=> b!452917 (= e!265089 (= lt!205411 (getCurrentListMapNoExtraKeys!1692 (ite c!56079 _keys!709 lt!205321) (ite c!56079 _values!549 lt!205322) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!452918 () Bool)

(declare-fun isEmpty!563 (ListLongMap!6963) Bool)

(assert (=> b!452918 (= e!265089 (isEmpty!563 lt!205411))))

(declare-fun b!452919 () Bool)

(declare-fun lt!205413 () Unit!13211)

(declare-fun lt!205415 () Unit!13211)

(assert (=> b!452919 (= lt!205413 lt!205415)))

(declare-fun lt!205414 () ListLongMap!6963)

(declare-fun lt!205412 () (_ BitVec 64))

(declare-fun lt!205409 () V!17291)

(declare-fun lt!205410 () (_ BitVec 64))

(assert (=> b!452919 (not (contains!2487 (+!1594 lt!205414 (tuple2!8061 lt!205410 lt!205409)) lt!205412))))

(declare-fun addStillNotContains!147 (ListLongMap!6963 (_ BitVec 64) V!17291 (_ BitVec 64)) Unit!13211)

(assert (=> b!452919 (= lt!205415 (addStillNotContains!147 lt!205414 lt!205410 lt!205409 lt!205412))))

(assert (=> b!452919 (= lt!205412 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!452919 (= lt!205409 (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!452919 (= lt!205410 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30010 () ListLongMap!6963)

(assert (=> b!452919 (= lt!205414 call!30010)))

(declare-fun e!265093 () ListLongMap!6963)

(assert (=> b!452919 (= e!265093 (+!1594 call!30010 (tuple2!8061 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!452920 () Bool)

(assert (=> b!452920 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (ite c!56079 _keys!709 lt!205321))))))

(assert (=> b!452920 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13835 (ite c!56079 _values!549 lt!205322))))))

(declare-fun apply!313 (ListLongMap!6963 (_ BitVec 64)) V!17291)

(assert (=> b!452920 (= e!265094 (= (apply!313 lt!205411 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!452921 () Bool)

(assert (=> b!452921 (= e!265088 e!265089)))

(declare-fun c!56097 () Bool)

(assert (=> b!452921 (= c!56097 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (ite c!56079 _keys!709 lt!205321))))))

(declare-fun b!452922 () Bool)

(assert (=> b!452922 (= e!265090 e!265093)))

(declare-fun c!56098 () Bool)

(assert (=> b!452922 (= c!56098 (validKeyInArray!0 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!452923 () Bool)

(declare-fun e!265091 () Bool)

(assert (=> b!452923 (= e!265091 (validKeyInArray!0 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!452923 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!452924 () Bool)

(assert (=> b!452924 (= e!265093 call!30010)))

(declare-fun bm!30007 () Bool)

(assert (=> bm!30007 (= call!30010 (getCurrentListMapNoExtraKeys!1692 (ite c!56079 _keys!709 lt!205321) (ite c!56079 _values!549 lt!205322) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!452925 () Bool)

(assert (=> b!452925 (= e!265092 e!265088)))

(declare-fun c!56099 () Bool)

(assert (=> b!452925 (= c!56099 e!265091)))

(declare-fun res!269878 () Bool)

(assert (=> b!452925 (=> (not res!269878) (not e!265091))))

(assert (=> b!452925 (= res!269878 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (ite c!56079 _keys!709 lt!205321))))))

(declare-fun b!452926 () Bool)

(declare-fun res!269877 () Bool)

(assert (=> b!452926 (=> (not res!269877) (not e!265092))))

(assert (=> b!452926 (= res!269877 (not (contains!2487 lt!205411 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74121 c!56100) b!452916))

(assert (= (and d!74121 (not c!56100)) b!452922))

(assert (= (and b!452922 c!56098) b!452919))

(assert (= (and b!452922 (not c!56098)) b!452924))

(assert (= (or b!452919 b!452924) bm!30007))

(assert (= (and d!74121 res!269879) b!452926))

(assert (= (and b!452926 res!269877) b!452925))

(assert (= (and b!452925 res!269878) b!452923))

(assert (= (and b!452925 c!56099) b!452915))

(assert (= (and b!452925 (not c!56099)) b!452921))

(assert (= (and b!452915 res!269876) b!452920))

(assert (= (and b!452921 c!56097) b!452917))

(assert (= (and b!452921 (not c!56097)) b!452918))

(declare-fun b_lambda!9569 () Bool)

(assert (=> (not b_lambda!9569) (not b!452919)))

(assert (=> b!452919 t!13931))

(declare-fun b_and!18875 () Bool)

(assert (= b_and!18865 (and (=> t!13931 result!7091) b_and!18875)))

(declare-fun b_lambda!9571 () Bool)

(assert (=> (not b_lambda!9571) (not b!452920)))

(assert (=> b!452920 t!13931))

(declare-fun b_and!18877 () Bool)

(assert (= b_and!18875 (and (=> t!13931 result!7091) b_and!18877)))

(declare-fun m!436269 () Bool)

(assert (=> b!452915 m!436269))

(assert (=> b!452915 m!436269))

(declare-fun m!436271 () Bool)

(assert (=> b!452915 m!436271))

(assert (=> b!452920 m!436269))

(assert (=> b!452920 m!436071))

(declare-fun m!436273 () Bool)

(assert (=> b!452920 m!436273))

(assert (=> b!452920 m!436071))

(declare-fun m!436275 () Bool)

(assert (=> b!452920 m!436275))

(assert (=> b!452920 m!436269))

(declare-fun m!436277 () Bool)

(assert (=> b!452920 m!436277))

(assert (=> b!452920 m!436273))

(declare-fun m!436279 () Bool)

(assert (=> b!452926 m!436279))

(declare-fun m!436281 () Bool)

(assert (=> d!74121 m!436281))

(assert (=> d!74121 m!436063))

(assert (=> b!452923 m!436269))

(assert (=> b!452923 m!436269))

(declare-fun m!436283 () Bool)

(assert (=> b!452923 m!436283))

(assert (=> b!452922 m!436269))

(assert (=> b!452922 m!436269))

(assert (=> b!452922 m!436283))

(declare-fun m!436285 () Bool)

(assert (=> bm!30007 m!436285))

(declare-fun m!436287 () Bool)

(assert (=> b!452918 m!436287))

(assert (=> b!452917 m!436285))

(assert (=> b!452919 m!436269))

(assert (=> b!452919 m!436273))

(declare-fun m!436289 () Bool)

(assert (=> b!452919 m!436289))

(assert (=> b!452919 m!436273))

(assert (=> b!452919 m!436071))

(assert (=> b!452919 m!436275))

(declare-fun m!436291 () Bool)

(assert (=> b!452919 m!436291))

(assert (=> b!452919 m!436071))

(declare-fun m!436293 () Bool)

(assert (=> b!452919 m!436293))

(assert (=> b!452919 m!436289))

(declare-fun m!436295 () Bool)

(assert (=> b!452919 m!436295))

(assert (=> bm!29989 d!74121))

(declare-fun b!452927 () Bool)

(declare-fun e!265095 () Bool)

(declare-fun e!265101 () Bool)

(assert (=> b!452927 (= e!265095 e!265101)))

(assert (=> b!452927 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (ite c!56079 lt!205321 _keys!709))))))

(declare-fun res!269880 () Bool)

(declare-fun lt!205418 () ListLongMap!6963)

(assert (=> b!452927 (= res!269880 (contains!2487 lt!205418 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!452927 (=> (not res!269880) (not e!265101))))

(declare-fun b!452928 () Bool)

(declare-fun e!265097 () ListLongMap!6963)

(assert (=> b!452928 (= e!265097 (ListLongMap!6964 Nil!8115))))

(declare-fun d!74123 () Bool)

(declare-fun e!265099 () Bool)

(assert (=> d!74123 e!265099))

(declare-fun res!269883 () Bool)

(assert (=> d!74123 (=> (not res!269883) (not e!265099))))

(assert (=> d!74123 (= res!269883 (not (contains!2487 lt!205418 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74123 (= lt!205418 e!265097)))

(declare-fun c!56104 () Bool)

(assert (=> d!74123 (= c!56104 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (ite c!56079 lt!205321 _keys!709))))))

(assert (=> d!74123 (validMask!0 mask!1025)))

(assert (=> d!74123 (= (getCurrentListMapNoExtraKeys!1692 (ite c!56079 lt!205321 _keys!709) (ite c!56079 lt!205322 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205418)))

(declare-fun b!452929 () Bool)

(declare-fun e!265096 () Bool)

(assert (=> b!452929 (= e!265096 (= lt!205418 (getCurrentListMapNoExtraKeys!1692 (ite c!56079 lt!205321 _keys!709) (ite c!56079 lt!205322 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!452930 () Bool)

(assert (=> b!452930 (= e!265096 (isEmpty!563 lt!205418))))

(declare-fun b!452931 () Bool)

(declare-fun lt!205420 () Unit!13211)

(declare-fun lt!205422 () Unit!13211)

(assert (=> b!452931 (= lt!205420 lt!205422)))

(declare-fun lt!205417 () (_ BitVec 64))

(declare-fun lt!205419 () (_ BitVec 64))

(declare-fun lt!205416 () V!17291)

(declare-fun lt!205421 () ListLongMap!6963)

(assert (=> b!452931 (not (contains!2487 (+!1594 lt!205421 (tuple2!8061 lt!205417 lt!205416)) lt!205419))))

(assert (=> b!452931 (= lt!205422 (addStillNotContains!147 lt!205421 lt!205417 lt!205416 lt!205419))))

(assert (=> b!452931 (= lt!205419 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!452931 (= lt!205416 (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!452931 (= lt!205417 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30011 () ListLongMap!6963)

(assert (=> b!452931 (= lt!205421 call!30011)))

(declare-fun e!265100 () ListLongMap!6963)

(assert (=> b!452931 (= e!265100 (+!1594 call!30011 (tuple2!8061 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!452932 () Bool)

(assert (=> b!452932 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (ite c!56079 lt!205321 _keys!709))))))

(assert (=> b!452932 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13835 (ite c!56079 lt!205322 _values!549))))))

(assert (=> b!452932 (= e!265101 (= (apply!313 lt!205418 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!452933 () Bool)

(assert (=> b!452933 (= e!265095 e!265096)))

(declare-fun c!56101 () Bool)

(assert (=> b!452933 (= c!56101 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (ite c!56079 lt!205321 _keys!709))))))

(declare-fun b!452934 () Bool)

(assert (=> b!452934 (= e!265097 e!265100)))

(declare-fun c!56102 () Bool)

(assert (=> b!452934 (= c!56102 (validKeyInArray!0 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!452935 () Bool)

(declare-fun e!265098 () Bool)

(assert (=> b!452935 (= e!265098 (validKeyInArray!0 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!452935 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!452936 () Bool)

(assert (=> b!452936 (= e!265100 call!30011)))

(declare-fun bm!30008 () Bool)

(assert (=> bm!30008 (= call!30011 (getCurrentListMapNoExtraKeys!1692 (ite c!56079 lt!205321 _keys!709) (ite c!56079 lt!205322 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!452937 () Bool)

(assert (=> b!452937 (= e!265099 e!265095)))

(declare-fun c!56103 () Bool)

(assert (=> b!452937 (= c!56103 e!265098)))

(declare-fun res!269882 () Bool)

(assert (=> b!452937 (=> (not res!269882) (not e!265098))))

(assert (=> b!452937 (= res!269882 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (ite c!56079 lt!205321 _keys!709))))))

(declare-fun b!452938 () Bool)

(declare-fun res!269881 () Bool)

(assert (=> b!452938 (=> (not res!269881) (not e!265099))))

(assert (=> b!452938 (= res!269881 (not (contains!2487 lt!205418 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74123 c!56104) b!452928))

(assert (= (and d!74123 (not c!56104)) b!452934))

(assert (= (and b!452934 c!56102) b!452931))

(assert (= (and b!452934 (not c!56102)) b!452936))

(assert (= (or b!452931 b!452936) bm!30008))

(assert (= (and d!74123 res!269883) b!452938))

(assert (= (and b!452938 res!269881) b!452937))

(assert (= (and b!452937 res!269882) b!452935))

(assert (= (and b!452937 c!56103) b!452927))

(assert (= (and b!452937 (not c!56103)) b!452933))

(assert (= (and b!452927 res!269880) b!452932))

(assert (= (and b!452933 c!56101) b!452929))

(assert (= (and b!452933 (not c!56101)) b!452930))

(declare-fun b_lambda!9573 () Bool)

(assert (=> (not b_lambda!9573) (not b!452931)))

(assert (=> b!452931 t!13931))

(declare-fun b_and!18879 () Bool)

(assert (= b_and!18877 (and (=> t!13931 result!7091) b_and!18879)))

(declare-fun b_lambda!9575 () Bool)

(assert (=> (not b_lambda!9575) (not b!452932)))

(assert (=> b!452932 t!13931))

(declare-fun b_and!18881 () Bool)

(assert (= b_and!18879 (and (=> t!13931 result!7091) b_and!18881)))

(declare-fun m!436297 () Bool)

(assert (=> b!452927 m!436297))

(assert (=> b!452927 m!436297))

(declare-fun m!436299 () Bool)

(assert (=> b!452927 m!436299))

(assert (=> b!452932 m!436297))

(assert (=> b!452932 m!436071))

(declare-fun m!436301 () Bool)

(assert (=> b!452932 m!436301))

(assert (=> b!452932 m!436071))

(declare-fun m!436303 () Bool)

(assert (=> b!452932 m!436303))

(assert (=> b!452932 m!436297))

(declare-fun m!436305 () Bool)

(assert (=> b!452932 m!436305))

(assert (=> b!452932 m!436301))

(declare-fun m!436307 () Bool)

(assert (=> b!452938 m!436307))

(declare-fun m!436309 () Bool)

(assert (=> d!74123 m!436309))

(assert (=> d!74123 m!436063))

(assert (=> b!452935 m!436297))

(assert (=> b!452935 m!436297))

(declare-fun m!436311 () Bool)

(assert (=> b!452935 m!436311))

(assert (=> b!452934 m!436297))

(assert (=> b!452934 m!436297))

(assert (=> b!452934 m!436311))

(declare-fun m!436313 () Bool)

(assert (=> bm!30008 m!436313))

(declare-fun m!436315 () Bool)

(assert (=> b!452930 m!436315))

(assert (=> b!452929 m!436313))

(assert (=> b!452931 m!436297))

(assert (=> b!452931 m!436301))

(declare-fun m!436317 () Bool)

(assert (=> b!452931 m!436317))

(assert (=> b!452931 m!436301))

(assert (=> b!452931 m!436071))

(assert (=> b!452931 m!436303))

(declare-fun m!436319 () Bool)

(assert (=> b!452931 m!436319))

(assert (=> b!452931 m!436071))

(declare-fun m!436321 () Bool)

(assert (=> b!452931 m!436321))

(assert (=> b!452931 m!436317))

(declare-fun m!436323 () Bool)

(assert (=> b!452931 m!436323))

(assert (=> bm!29988 d!74123))

(declare-fun d!74125 () Bool)

(assert (=> d!74125 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!452731 d!74125))

(declare-fun d!74127 () Bool)

(assert (=> d!74127 (= (validKeyInArray!0 (select (arr!13481 _keys!709) from!863)) (and (not (= (select (arr!13481 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!452740 d!74127))

(declare-fun call!30016 () ListLongMap!6963)

(declare-fun call!30017 () ListLongMap!6963)

(declare-fun e!265107 () Bool)

(declare-fun b!452945 () Bool)

(assert (=> b!452945 (= e!265107 (= call!30017 (+!1594 call!30016 (tuple2!8061 k0!794 v!412))))))

(declare-fun b!452946 () Bool)

(assert (=> b!452946 (= e!265107 (= call!30017 call!30016))))

(declare-fun b!452947 () Bool)

(declare-fun e!265106 () Bool)

(assert (=> b!452947 (= e!265106 e!265107)))

(declare-fun c!56107 () Bool)

(assert (=> b!452947 (= c!56107 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun d!74129 () Bool)

(assert (=> d!74129 e!265106))

(declare-fun res!269886 () Bool)

(assert (=> d!74129 (=> (not res!269886) (not e!265106))))

(assert (=> d!74129 (= res!269886 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13834 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13835 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13834 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13835 _values!549))))))))

(declare-fun lt!205425 () Unit!13211)

(declare-fun choose!1334 (array!28073 array!28075 (_ BitVec 32) (_ BitVec 32) V!17291 V!17291 (_ BitVec 32) (_ BitVec 64) V!17291 (_ BitVec 32) Int) Unit!13211)

(assert (=> d!74129 (= lt!205425 (choose!1334 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74129 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!13834 _keys!709)))))

(assert (=> d!74129 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!731 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205425)))

(declare-fun bm!30013 () Bool)

(assert (=> bm!30013 (= call!30016 (getCurrentListMapNoExtraKeys!1692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!30014 () Bool)

(assert (=> bm!30014 (= call!30017 (getCurrentListMapNoExtraKeys!1692 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709)) (array!28076 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13835 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and d!74129 res!269886) b!452947))

(assert (= (and b!452947 c!56107) b!452945))

(assert (= (and b!452947 (not c!56107)) b!452946))

(assert (= (or b!452945 b!452946) bm!30013))

(assert (= (or b!452945 b!452946) bm!30014))

(declare-fun m!436325 () Bool)

(assert (=> b!452945 m!436325))

(declare-fun m!436327 () Bool)

(assert (=> d!74129 m!436327))

(declare-fun m!436329 () Bool)

(assert (=> bm!30013 m!436329))

(assert (=> bm!30014 m!436103))

(assert (=> bm!30014 m!436073))

(declare-fun m!436331 () Bool)

(assert (=> bm!30014 m!436331))

(assert (=> b!452740 d!74129))

(declare-fun b!452956 () Bool)

(declare-fun e!265116 () Bool)

(declare-fun call!30020 () Bool)

(assert (=> b!452956 (= e!265116 call!30020)))

(declare-fun b!452957 () Bool)

(declare-fun e!265114 () Bool)

(assert (=> b!452957 (= e!265114 call!30020)))

(declare-fun b!452958 () Bool)

(assert (=> b!452958 (= e!265114 e!265116)))

(declare-fun lt!205434 () (_ BitVec 64))

(assert (=> b!452958 (= lt!205434 (select (arr!13481 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!205433 () Unit!13211)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28073 (_ BitVec 64) (_ BitVec 32)) Unit!13211)

(assert (=> b!452958 (= lt!205433 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!205434 #b00000000000000000000000000000000))))

(assert (=> b!452958 (arrayContainsKey!0 _keys!709 lt!205434 #b00000000000000000000000000000000)))

(declare-fun lt!205432 () Unit!13211)

(assert (=> b!452958 (= lt!205432 lt!205433)))

(declare-fun res!269891 () Bool)

(declare-datatypes ((SeekEntryResult!3527 0))(
  ( (MissingZero!3527 (index!16287 (_ BitVec 32))) (Found!3527 (index!16288 (_ BitVec 32))) (Intermediate!3527 (undefined!4339 Bool) (index!16289 (_ BitVec 32)) (x!42451 (_ BitVec 32))) (Undefined!3527) (MissingVacant!3527 (index!16290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28073 (_ BitVec 32)) SeekEntryResult!3527)

(assert (=> b!452958 (= res!269891 (= (seekEntryOrOpen!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3527 #b00000000000000000000000000000000)))))

(assert (=> b!452958 (=> (not res!269891) (not e!265116))))

(declare-fun b!452959 () Bool)

(declare-fun e!265115 () Bool)

(assert (=> b!452959 (= e!265115 e!265114)))

(declare-fun c!56110 () Bool)

(assert (=> b!452959 (= c!56110 (validKeyInArray!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74131 () Bool)

(declare-fun res!269892 () Bool)

(assert (=> d!74131 (=> res!269892 e!265115)))

(assert (=> d!74131 (= res!269892 (bvsge #b00000000000000000000000000000000 (size!13834 _keys!709)))))

(assert (=> d!74131 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!265115)))

(declare-fun bm!30017 () Bool)

(assert (=> bm!30017 (= call!30020 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!74131 (not res!269892)) b!452959))

(assert (= (and b!452959 c!56110) b!452958))

(assert (= (and b!452959 (not c!56110)) b!452957))

(assert (= (and b!452958 res!269891) b!452956))

(assert (= (or b!452956 b!452957) bm!30017))

(assert (=> b!452958 m!436265))

(declare-fun m!436333 () Bool)

(assert (=> b!452958 m!436333))

(declare-fun m!436335 () Bool)

(assert (=> b!452958 m!436335))

(assert (=> b!452958 m!436265))

(declare-fun m!436337 () Bool)

(assert (=> b!452958 m!436337))

(assert (=> b!452959 m!436265))

(assert (=> b!452959 m!436265))

(declare-fun m!436339 () Bool)

(assert (=> b!452959 m!436339))

(declare-fun m!436341 () Bool)

(assert (=> bm!30017 m!436341))

(assert (=> b!452748 d!74131))

(declare-fun d!74133 () Bool)

(assert (=> d!74133 (= (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205320)) (+!1594 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328)) (tuple2!8061 k0!794 lt!205320)))))

(declare-fun lt!205437 () Unit!13211)

(declare-fun choose!1335 (ListLongMap!6963 (_ BitVec 64) V!17291 V!17291) Unit!13211)

(assert (=> d!74133 (= lt!205437 (choose!1335 lt!205318 k0!794 lt!205328 lt!205320))))

(assert (=> d!74133 (= (addSameAsAddTwiceSameKeyDiffValues!89 lt!205318 k0!794 lt!205328 lt!205320) lt!205437)))

(declare-fun bs!14372 () Bool)

(assert (= bs!14372 d!74133))

(declare-fun m!436343 () Bool)

(assert (=> bs!14372 m!436343))

(assert (=> bs!14372 m!436079))

(assert (=> bs!14372 m!436079))

(declare-fun m!436345 () Bool)

(assert (=> bs!14372 m!436345))

(declare-fun m!436347 () Bool)

(assert (=> bs!14372 m!436347))

(assert (=> b!452739 d!74133))

(declare-fun d!74135 () Bool)

(declare-fun e!265119 () Bool)

(assert (=> d!74135 e!265119))

(declare-fun res!269898 () Bool)

(assert (=> d!74135 (=> (not res!269898) (not e!265119))))

(declare-fun lt!205449 () ListLongMap!6963)

(assert (=> d!74135 (= res!269898 (contains!2487 lt!205449 (_1!4041 lt!205326)))))

(declare-fun lt!205446 () List!8118)

(assert (=> d!74135 (= lt!205449 (ListLongMap!6964 lt!205446))))

(declare-fun lt!205448 () Unit!13211)

(declare-fun lt!205447 () Unit!13211)

(assert (=> d!74135 (= lt!205448 lt!205447)))

(declare-datatypes ((Option!374 0))(
  ( (Some!373 (v!8373 V!17291)) (None!372) )
))
(declare-fun getValueByKey!368 (List!8118 (_ BitVec 64)) Option!374)

(assert (=> d!74135 (= (getValueByKey!368 lt!205446 (_1!4041 lt!205326)) (Some!373 (_2!4041 lt!205326)))))

(declare-fun lemmaContainsTupThenGetReturnValue!193 (List!8118 (_ BitVec 64) V!17291) Unit!13211)

(assert (=> d!74135 (= lt!205447 (lemmaContainsTupThenGetReturnValue!193 lt!205446 (_1!4041 lt!205326) (_2!4041 lt!205326)))))

(declare-fun insertStrictlySorted!196 (List!8118 (_ BitVec 64) V!17291) List!8118)

(assert (=> d!74135 (= lt!205446 (insertStrictlySorted!196 (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328))) (_1!4041 lt!205326) (_2!4041 lt!205326)))))

(assert (=> d!74135 (= (+!1594 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328)) lt!205326) lt!205449)))

(declare-fun b!452964 () Bool)

(declare-fun res!269897 () Bool)

(assert (=> b!452964 (=> (not res!269897) (not e!265119))))

(assert (=> b!452964 (= res!269897 (= (getValueByKey!368 (toList!3497 lt!205449) (_1!4041 lt!205326)) (Some!373 (_2!4041 lt!205326))))))

(declare-fun b!452965 () Bool)

(declare-fun contains!2488 (List!8118 tuple2!8060) Bool)

(assert (=> b!452965 (= e!265119 (contains!2488 (toList!3497 lt!205449) lt!205326))))

(assert (= (and d!74135 res!269898) b!452964))

(assert (= (and b!452964 res!269897) b!452965))

(declare-fun m!436349 () Bool)

(assert (=> d!74135 m!436349))

(declare-fun m!436351 () Bool)

(assert (=> d!74135 m!436351))

(declare-fun m!436353 () Bool)

(assert (=> d!74135 m!436353))

(declare-fun m!436355 () Bool)

(assert (=> d!74135 m!436355))

(declare-fun m!436357 () Bool)

(assert (=> b!452964 m!436357))

(declare-fun m!436359 () Bool)

(assert (=> b!452965 m!436359))

(assert (=> b!452739 d!74135))

(declare-fun d!74137 () Bool)

(declare-fun e!265120 () Bool)

(assert (=> d!74137 e!265120))

(declare-fun res!269900 () Bool)

(assert (=> d!74137 (=> (not res!269900) (not e!265120))))

(declare-fun lt!205453 () ListLongMap!6963)

(assert (=> d!74137 (= res!269900 (contains!2487 lt!205453 (_1!4041 (tuple2!8061 k0!794 lt!205328))))))

(declare-fun lt!205450 () List!8118)

(assert (=> d!74137 (= lt!205453 (ListLongMap!6964 lt!205450))))

(declare-fun lt!205452 () Unit!13211)

(declare-fun lt!205451 () Unit!13211)

(assert (=> d!74137 (= lt!205452 lt!205451)))

(assert (=> d!74137 (= (getValueByKey!368 lt!205450 (_1!4041 (tuple2!8061 k0!794 lt!205328))) (Some!373 (_2!4041 (tuple2!8061 k0!794 lt!205328))))))

(assert (=> d!74137 (= lt!205451 (lemmaContainsTupThenGetReturnValue!193 lt!205450 (_1!4041 (tuple2!8061 k0!794 lt!205328)) (_2!4041 (tuple2!8061 k0!794 lt!205328))))))

(assert (=> d!74137 (= lt!205450 (insertStrictlySorted!196 (toList!3497 lt!205318) (_1!4041 (tuple2!8061 k0!794 lt!205328)) (_2!4041 (tuple2!8061 k0!794 lt!205328))))))

(assert (=> d!74137 (= (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328)) lt!205453)))

(declare-fun b!452966 () Bool)

(declare-fun res!269899 () Bool)

(assert (=> b!452966 (=> (not res!269899) (not e!265120))))

(assert (=> b!452966 (= res!269899 (= (getValueByKey!368 (toList!3497 lt!205453) (_1!4041 (tuple2!8061 k0!794 lt!205328))) (Some!373 (_2!4041 (tuple2!8061 k0!794 lt!205328)))))))

(declare-fun b!452967 () Bool)

(assert (=> b!452967 (= e!265120 (contains!2488 (toList!3497 lt!205453) (tuple2!8061 k0!794 lt!205328)))))

(assert (= (and d!74137 res!269900) b!452966))

(assert (= (and b!452966 res!269899) b!452967))

(declare-fun m!436361 () Bool)

(assert (=> d!74137 m!436361))

(declare-fun m!436363 () Bool)

(assert (=> d!74137 m!436363))

(declare-fun m!436365 () Bool)

(assert (=> d!74137 m!436365))

(declare-fun m!436367 () Bool)

(assert (=> d!74137 m!436367))

(declare-fun m!436369 () Bool)

(assert (=> b!452966 m!436369))

(declare-fun m!436371 () Bool)

(assert (=> b!452967 m!436371))

(assert (=> b!452739 d!74137))

(declare-fun d!74139 () Bool)

(declare-fun e!265121 () Bool)

(assert (=> d!74139 e!265121))

(declare-fun res!269902 () Bool)

(assert (=> d!74139 (=> (not res!269902) (not e!265121))))

(declare-fun lt!205457 () ListLongMap!6963)

(assert (=> d!74139 (= res!269902 (contains!2487 lt!205457 (_1!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun lt!205454 () List!8118)

(assert (=> d!74139 (= lt!205457 (ListLongMap!6964 lt!205454))))

(declare-fun lt!205456 () Unit!13211)

(declare-fun lt!205455 () Unit!13211)

(assert (=> d!74139 (= lt!205456 lt!205455)))

(assert (=> d!74139 (= (getValueByKey!368 lt!205454 (_1!4041 (tuple2!8061 k0!794 v!412))) (Some!373 (_2!4041 (tuple2!8061 k0!794 v!412))))))

(assert (=> d!74139 (= lt!205455 (lemmaContainsTupThenGetReturnValue!193 lt!205454 (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))))))

(assert (=> d!74139 (= lt!205454 (insertStrictlySorted!196 (toList!3497 lt!205327) (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))))))

(assert (=> d!74139 (= (+!1594 lt!205327 (tuple2!8061 k0!794 v!412)) lt!205457)))

(declare-fun b!452968 () Bool)

(declare-fun res!269901 () Bool)

(assert (=> b!452968 (=> (not res!269901) (not e!265121))))

(assert (=> b!452968 (= res!269901 (= (getValueByKey!368 (toList!3497 lt!205457) (_1!4041 (tuple2!8061 k0!794 v!412))) (Some!373 (_2!4041 (tuple2!8061 k0!794 v!412)))))))

(declare-fun b!452969 () Bool)

(assert (=> b!452969 (= e!265121 (contains!2488 (toList!3497 lt!205457) (tuple2!8061 k0!794 v!412)))))

(assert (= (and d!74139 res!269902) b!452968))

(assert (= (and b!452968 res!269901) b!452969))

(declare-fun m!436373 () Bool)

(assert (=> d!74139 m!436373))

(declare-fun m!436375 () Bool)

(assert (=> d!74139 m!436375))

(declare-fun m!436377 () Bool)

(assert (=> d!74139 m!436377))

(declare-fun m!436379 () Bool)

(assert (=> d!74139 m!436379))

(declare-fun m!436381 () Bool)

(assert (=> b!452968 m!436381))

(declare-fun m!436383 () Bool)

(assert (=> b!452969 m!436383))

(assert (=> b!452739 d!74139))

(declare-fun c!56113 () Bool)

(declare-fun d!74141 () Bool)

(assert (=> d!74141 (= c!56113 ((_ is ValueCellFull!5726) (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863)))))

(declare-fun e!265124 () V!17291)

(assert (=> d!74141 (= (get!6650 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863) lt!205323) e!265124)))

(declare-fun b!452974 () Bool)

(declare-fun get!6653 (ValueCell!5726 V!17291) V!17291)

(assert (=> b!452974 (= e!265124 (get!6653 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863) lt!205323))))

(declare-fun b!452975 () Bool)

(declare-fun get!6654 (ValueCell!5726 V!17291) V!17291)

(assert (=> b!452975 (= e!265124 (get!6654 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863) lt!205323))))

(assert (= (and d!74141 c!56113) b!452974))

(assert (= (and d!74141 (not c!56113)) b!452975))

(assert (=> b!452974 m!436089))

(declare-fun m!436385 () Bool)

(assert (=> b!452974 m!436385))

(assert (=> b!452975 m!436089))

(declare-fun m!436387 () Bool)

(assert (=> b!452975 m!436387))

(assert (=> b!452739 d!74141))

(declare-fun d!74143 () Bool)

(declare-fun e!265125 () Bool)

(assert (=> d!74143 e!265125))

(declare-fun res!269904 () Bool)

(assert (=> d!74143 (=> (not res!269904) (not e!265125))))

(declare-fun lt!205461 () ListLongMap!6963)

(assert (=> d!74143 (= res!269904 (contains!2487 lt!205461 (_1!4041 lt!205326)))))

(declare-fun lt!205458 () List!8118)

(assert (=> d!74143 (= lt!205461 (ListLongMap!6964 lt!205458))))

(declare-fun lt!205460 () Unit!13211)

(declare-fun lt!205459 () Unit!13211)

(assert (=> d!74143 (= lt!205460 lt!205459)))

(assert (=> d!74143 (= (getValueByKey!368 lt!205458 (_1!4041 lt!205326)) (Some!373 (_2!4041 lt!205326)))))

(assert (=> d!74143 (= lt!205459 (lemmaContainsTupThenGetReturnValue!193 lt!205458 (_1!4041 lt!205326) (_2!4041 lt!205326)))))

(assert (=> d!74143 (= lt!205458 (insertStrictlySorted!196 (toList!3497 lt!205318) (_1!4041 lt!205326) (_2!4041 lt!205326)))))

(assert (=> d!74143 (= (+!1594 lt!205318 lt!205326) lt!205461)))

(declare-fun b!452976 () Bool)

(declare-fun res!269903 () Bool)

(assert (=> b!452976 (=> (not res!269903) (not e!265125))))

(assert (=> b!452976 (= res!269903 (= (getValueByKey!368 (toList!3497 lt!205461) (_1!4041 lt!205326)) (Some!373 (_2!4041 lt!205326))))))

(declare-fun b!452977 () Bool)

(assert (=> b!452977 (= e!265125 (contains!2488 (toList!3497 lt!205461) lt!205326))))

(assert (= (and d!74143 res!269904) b!452976))

(assert (= (and b!452976 res!269903) b!452977))

(declare-fun m!436389 () Bool)

(assert (=> d!74143 m!436389))

(declare-fun m!436391 () Bool)

(assert (=> d!74143 m!436391))

(declare-fun m!436393 () Bool)

(assert (=> d!74143 m!436393))

(declare-fun m!436395 () Bool)

(assert (=> d!74143 m!436395))

(declare-fun m!436397 () Bool)

(assert (=> b!452976 m!436397))

(declare-fun m!436399 () Bool)

(assert (=> b!452977 m!436399))

(assert (=> b!452739 d!74143))

(declare-fun b!452978 () Bool)

(declare-fun e!265126 () Bool)

(declare-fun e!265132 () Bool)

(assert (=> b!452978 (= e!265126 e!265132)))

(assert (=> b!452978 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 lt!205321)))))

(declare-fun lt!205464 () ListLongMap!6963)

(declare-fun res!269905 () Bool)

(assert (=> b!452978 (= res!269905 (contains!2487 lt!205464 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!452978 (=> (not res!269905) (not e!265132))))

(declare-fun b!452979 () Bool)

(declare-fun e!265128 () ListLongMap!6963)

(assert (=> b!452979 (= e!265128 (ListLongMap!6964 Nil!8115))))

(declare-fun d!74145 () Bool)

(declare-fun e!265130 () Bool)

(assert (=> d!74145 e!265130))

(declare-fun res!269908 () Bool)

(assert (=> d!74145 (=> (not res!269908) (not e!265130))))

(assert (=> d!74145 (= res!269908 (not (contains!2487 lt!205464 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74145 (= lt!205464 e!265128)))

(declare-fun c!56117 () Bool)

(assert (=> d!74145 (= c!56117 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13834 lt!205321)))))

(assert (=> d!74145 (validMask!0 mask!1025)))

(assert (=> d!74145 (= (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205464)))

(declare-fun e!265127 () Bool)

(declare-fun b!452980 () Bool)

(assert (=> b!452980 (= e!265127 (= lt!205464 (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!452981 () Bool)

(assert (=> b!452981 (= e!265127 (isEmpty!563 lt!205464))))

(declare-fun b!452982 () Bool)

(declare-fun lt!205466 () Unit!13211)

(declare-fun lt!205468 () Unit!13211)

(assert (=> b!452982 (= lt!205466 lt!205468)))

(declare-fun lt!205465 () (_ BitVec 64))

(declare-fun lt!205463 () (_ BitVec 64))

(declare-fun lt!205462 () V!17291)

(declare-fun lt!205467 () ListLongMap!6963)

(assert (=> b!452982 (not (contains!2487 (+!1594 lt!205467 (tuple2!8061 lt!205463 lt!205462)) lt!205465))))

(assert (=> b!452982 (= lt!205468 (addStillNotContains!147 lt!205467 lt!205463 lt!205462 lt!205465))))

(assert (=> b!452982 (= lt!205465 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!452982 (= lt!205462 (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!452982 (= lt!205463 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30021 () ListLongMap!6963)

(assert (=> b!452982 (= lt!205467 call!30021)))

(declare-fun e!265131 () ListLongMap!6963)

(assert (=> b!452982 (= e!265131 (+!1594 call!30021 (tuple2!8061 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!452983 () Bool)

(assert (=> b!452983 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 lt!205321)))))

(assert (=> b!452983 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13835 lt!205322)))))

(assert (=> b!452983 (= e!265132 (= (apply!313 lt!205464 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863))) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!452984 () Bool)

(assert (=> b!452984 (= e!265126 e!265127)))

(declare-fun c!56114 () Bool)

(assert (=> b!452984 (= c!56114 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 lt!205321)))))

(declare-fun b!452985 () Bool)

(assert (=> b!452985 (= e!265128 e!265131)))

(declare-fun c!56115 () Bool)

(assert (=> b!452985 (= c!56115 (validKeyInArray!0 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!452986 () Bool)

(declare-fun e!265129 () Bool)

(assert (=> b!452986 (= e!265129 (validKeyInArray!0 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!452986 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!452987 () Bool)

(assert (=> b!452987 (= e!265131 call!30021)))

(declare-fun bm!30018 () Bool)

(assert (=> bm!30018 (= call!30021 (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!452988 () Bool)

(assert (=> b!452988 (= e!265130 e!265126)))

(declare-fun c!56116 () Bool)

(assert (=> b!452988 (= c!56116 e!265129)))

(declare-fun res!269907 () Bool)

(assert (=> b!452988 (=> (not res!269907) (not e!265129))))

(assert (=> b!452988 (= res!269907 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 lt!205321)))))

(declare-fun b!452989 () Bool)

(declare-fun res!269906 () Bool)

(assert (=> b!452989 (=> (not res!269906) (not e!265130))))

(assert (=> b!452989 (= res!269906 (not (contains!2487 lt!205464 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74145 c!56117) b!452979))

(assert (= (and d!74145 (not c!56117)) b!452985))

(assert (= (and b!452985 c!56115) b!452982))

(assert (= (and b!452985 (not c!56115)) b!452987))

(assert (= (or b!452982 b!452987) bm!30018))

(assert (= (and d!74145 res!269908) b!452989))

(assert (= (and b!452989 res!269906) b!452988))

(assert (= (and b!452988 res!269907) b!452986))

(assert (= (and b!452988 c!56116) b!452978))

(assert (= (and b!452988 (not c!56116)) b!452984))

(assert (= (and b!452978 res!269905) b!452983))

(assert (= (and b!452984 c!56114) b!452980))

(assert (= (and b!452984 (not c!56114)) b!452981))

(declare-fun b_lambda!9577 () Bool)

(assert (=> (not b_lambda!9577) (not b!452982)))

(assert (=> b!452982 t!13931))

(declare-fun b_and!18883 () Bool)

(assert (= b_and!18881 (and (=> t!13931 result!7091) b_and!18883)))

(declare-fun b_lambda!9579 () Bool)

(assert (=> (not b_lambda!9579) (not b!452983)))

(assert (=> b!452983 t!13931))

(declare-fun b_and!18885 () Bool)

(assert (= b_and!18883 (and (=> t!13931 result!7091) b_and!18885)))

(declare-fun m!436401 () Bool)

(assert (=> b!452978 m!436401))

(assert (=> b!452978 m!436401))

(declare-fun m!436403 () Bool)

(assert (=> b!452978 m!436403))

(assert (=> b!452983 m!436401))

(assert (=> b!452983 m!436071))

(declare-fun m!436405 () Bool)

(assert (=> b!452983 m!436405))

(assert (=> b!452983 m!436071))

(declare-fun m!436407 () Bool)

(assert (=> b!452983 m!436407))

(assert (=> b!452983 m!436401))

(declare-fun m!436409 () Bool)

(assert (=> b!452983 m!436409))

(assert (=> b!452983 m!436405))

(declare-fun m!436411 () Bool)

(assert (=> b!452989 m!436411))

(declare-fun m!436413 () Bool)

(assert (=> d!74145 m!436413))

(assert (=> d!74145 m!436063))

(assert (=> b!452986 m!436401))

(assert (=> b!452986 m!436401))

(declare-fun m!436415 () Bool)

(assert (=> b!452986 m!436415))

(assert (=> b!452985 m!436401))

(assert (=> b!452985 m!436401))

(assert (=> b!452985 m!436415))

(declare-fun m!436417 () Bool)

(assert (=> bm!30018 m!436417))

(declare-fun m!436419 () Bool)

(assert (=> b!452981 m!436419))

(assert (=> b!452980 m!436417))

(assert (=> b!452982 m!436401))

(assert (=> b!452982 m!436405))

(declare-fun m!436421 () Bool)

(assert (=> b!452982 m!436421))

(assert (=> b!452982 m!436405))

(assert (=> b!452982 m!436071))

(assert (=> b!452982 m!436407))

(declare-fun m!436423 () Bool)

(assert (=> b!452982 m!436423))

(assert (=> b!452982 m!436071))

(declare-fun m!436425 () Bool)

(assert (=> b!452982 m!436425))

(assert (=> b!452982 m!436421))

(declare-fun m!436427 () Bool)

(assert (=> b!452982 m!436427))

(assert (=> b!452739 d!74145))

(declare-fun d!74147 () Bool)

(declare-fun e!265133 () Bool)

(assert (=> d!74147 e!265133))

(declare-fun res!269910 () Bool)

(assert (=> d!74147 (=> (not res!269910) (not e!265133))))

(declare-fun lt!205472 () ListLongMap!6963)

(assert (=> d!74147 (= res!269910 (contains!2487 lt!205472 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(declare-fun lt!205469 () List!8118)

(assert (=> d!74147 (= lt!205472 (ListLongMap!6964 lt!205469))))

(declare-fun lt!205471 () Unit!13211)

(declare-fun lt!205470 () Unit!13211)

(assert (=> d!74147 (= lt!205471 lt!205470)))

(assert (=> d!74147 (= (getValueByKey!368 lt!205469 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))) (Some!373 (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(assert (=> d!74147 (= lt!205470 (lemmaContainsTupThenGetReturnValue!193 lt!205469 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)) (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(assert (=> d!74147 (= lt!205469 (insertStrictlySorted!196 (toList!3497 lt!205318) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)) (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(assert (=> d!74147 (= (+!1594 lt!205318 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)) lt!205472)))

(declare-fun b!452990 () Bool)

(declare-fun res!269909 () Bool)

(assert (=> b!452990 (=> (not res!269909) (not e!265133))))

(assert (=> b!452990 (= res!269909 (= (getValueByKey!368 (toList!3497 lt!205472) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))) (Some!373 (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))))

(declare-fun b!452991 () Bool)

(assert (=> b!452991 (= e!265133 (contains!2488 (toList!3497 lt!205472) (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))

(assert (= (and d!74147 res!269910) b!452990))

(assert (= (and b!452990 res!269909) b!452991))

(declare-fun m!436429 () Bool)

(assert (=> d!74147 m!436429))

(declare-fun m!436431 () Bool)

(assert (=> d!74147 m!436431))

(declare-fun m!436433 () Bool)

(assert (=> d!74147 m!436433))

(declare-fun m!436435 () Bool)

(assert (=> d!74147 m!436435))

(declare-fun m!436437 () Bool)

(assert (=> b!452990 m!436437))

(declare-fun m!436439 () Bool)

(assert (=> b!452991 m!436439))

(assert (=> b!452739 d!74147))

(declare-fun d!74149 () Bool)

(declare-fun c!56118 () Bool)

(assert (=> d!74149 (= c!56118 ((_ is ValueCellFull!5726) (select (arr!13482 _values!549) from!863)))))

(declare-fun e!265134 () V!17291)

(assert (=> d!74149 (= (get!6650 (select (arr!13482 _values!549) from!863) lt!205323) e!265134)))

(declare-fun b!452992 () Bool)

(assert (=> b!452992 (= e!265134 (get!6653 (select (arr!13482 _values!549) from!863) lt!205323))))

(declare-fun b!452993 () Bool)

(assert (=> b!452993 (= e!265134 (get!6654 (select (arr!13482 _values!549) from!863) lt!205323))))

(assert (= (and d!74149 c!56118) b!452992))

(assert (= (and d!74149 (not c!56118)) b!452993))

(assert (=> b!452992 m!436077))

(declare-fun m!436441 () Bool)

(assert (=> b!452992 m!436441))

(assert (=> b!452993 m!436077))

(declare-fun m!436443 () Bool)

(assert (=> b!452993 m!436443))

(assert (=> b!452739 d!74149))

(declare-fun d!74151 () Bool)

(assert (=> d!74151 (= (array_inv!9824 _values!549) (bvsge (size!13835 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!40798 d!74151))

(declare-fun d!74153 () Bool)

(assert (=> d!74153 (= (array_inv!9825 _keys!709) (bvsge (size!13834 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!40798 d!74153))

(declare-fun d!74155 () Bool)

(assert (=> d!74155 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!452746 d!74155))

(declare-fun b!452994 () Bool)

(declare-fun e!265136 () Bool)

(declare-fun call!30022 () Bool)

(assert (=> b!452994 (= e!265136 call!30022)))

(declare-fun b!452995 () Bool)

(declare-fun e!265138 () Bool)

(declare-fun e!265137 () Bool)

(assert (=> b!452995 (= e!265138 e!265137)))

(declare-fun res!269911 () Bool)

(assert (=> b!452995 (=> (not res!269911) (not e!265137))))

(declare-fun e!265135 () Bool)

(assert (=> b!452995 (= res!269911 (not e!265135))))

(declare-fun res!269912 () Bool)

(assert (=> b!452995 (=> (not res!269912) (not e!265135))))

(assert (=> b!452995 (= res!269912 (validKeyInArray!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!452996 () Bool)

(assert (=> b!452996 (= e!265136 call!30022)))

(declare-fun d!74157 () Bool)

(declare-fun res!269913 () Bool)

(assert (=> d!74157 (=> res!269913 e!265138)))

(assert (=> d!74157 (= res!269913 (bvsge #b00000000000000000000000000000000 (size!13834 _keys!709)))))

(assert (=> d!74157 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8114) e!265138)))

(declare-fun b!452997 () Bool)

(assert (=> b!452997 (= e!265137 e!265136)))

(declare-fun c!56119 () Bool)

(assert (=> b!452997 (= c!56119 (validKeyInArray!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!452998 () Bool)

(assert (=> b!452998 (= e!265135 (contains!2486 Nil!8114 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun bm!30019 () Bool)

(assert (=> bm!30019 (= call!30022 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56119 (Cons!8113 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) Nil!8114) Nil!8114)))))

(assert (= (and d!74157 (not res!269913)) b!452995))

(assert (= (and b!452995 res!269912) b!452998))

(assert (= (and b!452995 res!269911) b!452997))

(assert (= (and b!452997 c!56119) b!452996))

(assert (= (and b!452997 (not c!56119)) b!452994))

(assert (= (or b!452996 b!452994) bm!30019))

(assert (=> b!452995 m!436265))

(assert (=> b!452995 m!436265))

(assert (=> b!452995 m!436339))

(assert (=> b!452997 m!436265))

(assert (=> b!452997 m!436265))

(assert (=> b!452997 m!436339))

(assert (=> b!452998 m!436265))

(assert (=> b!452998 m!436265))

(declare-fun m!436445 () Bool)

(assert (=> b!452998 m!436445))

(assert (=> bm!30019 m!436265))

(declare-fun m!436447 () Bool)

(assert (=> bm!30019 m!436447))

(assert (=> b!452737 d!74157))

(declare-fun b!452999 () Bool)

(declare-fun e!265139 () Bool)

(declare-fun e!265145 () Bool)

(assert (=> b!452999 (= e!265139 e!265145)))

(assert (=> b!452999 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13834 lt!205321)))))

(declare-fun lt!205475 () ListLongMap!6963)

(declare-fun res!269914 () Bool)

(assert (=> b!452999 (= res!269914 (contains!2487 lt!205475 (select (arr!13481 lt!205321) from!863)))))

(assert (=> b!452999 (=> (not res!269914) (not e!265145))))

(declare-fun b!453000 () Bool)

(declare-fun e!265141 () ListLongMap!6963)

(assert (=> b!453000 (= e!265141 (ListLongMap!6964 Nil!8115))))

(declare-fun d!74159 () Bool)

(declare-fun e!265143 () Bool)

(assert (=> d!74159 e!265143))

(declare-fun res!269917 () Bool)

(assert (=> d!74159 (=> (not res!269917) (not e!265143))))

(assert (=> d!74159 (= res!269917 (not (contains!2487 lt!205475 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74159 (= lt!205475 e!265141)))

(declare-fun c!56123 () Bool)

(assert (=> d!74159 (= c!56123 (bvsge from!863 (size!13834 lt!205321)))))

(assert (=> d!74159 (validMask!0 mask!1025)))

(assert (=> d!74159 (= (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!205475)))

(declare-fun b!453001 () Bool)

(declare-fun e!265140 () Bool)

(assert (=> b!453001 (= e!265140 (= lt!205475 (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!453002 () Bool)

(assert (=> b!453002 (= e!265140 (isEmpty!563 lt!205475))))

(declare-fun b!453003 () Bool)

(declare-fun lt!205477 () Unit!13211)

(declare-fun lt!205479 () Unit!13211)

(assert (=> b!453003 (= lt!205477 lt!205479)))

(declare-fun lt!205473 () V!17291)

(declare-fun lt!205474 () (_ BitVec 64))

(declare-fun lt!205478 () ListLongMap!6963)

(declare-fun lt!205476 () (_ BitVec 64))

(assert (=> b!453003 (not (contains!2487 (+!1594 lt!205478 (tuple2!8061 lt!205474 lt!205473)) lt!205476))))

(assert (=> b!453003 (= lt!205479 (addStillNotContains!147 lt!205478 lt!205474 lt!205473 lt!205476))))

(assert (=> b!453003 (= lt!205476 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453003 (= lt!205473 (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453003 (= lt!205474 (select (arr!13481 lt!205321) from!863))))

(declare-fun call!30023 () ListLongMap!6963)

(assert (=> b!453003 (= lt!205478 call!30023)))

(declare-fun e!265144 () ListLongMap!6963)

(assert (=> b!453003 (= e!265144 (+!1594 call!30023 (tuple2!8061 (select (arr!13481 lt!205321) from!863) (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453004 () Bool)

(assert (=> b!453004 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13834 lt!205321)))))

(assert (=> b!453004 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13835 lt!205322)))))

(assert (=> b!453004 (= e!265145 (= (apply!313 lt!205475 (select (arr!13481 lt!205321) from!863)) (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453005 () Bool)

(assert (=> b!453005 (= e!265139 e!265140)))

(declare-fun c!56120 () Bool)

(assert (=> b!453005 (= c!56120 (bvslt from!863 (size!13834 lt!205321)))))

(declare-fun b!453006 () Bool)

(assert (=> b!453006 (= e!265141 e!265144)))

(declare-fun c!56121 () Bool)

(assert (=> b!453006 (= c!56121 (validKeyInArray!0 (select (arr!13481 lt!205321) from!863)))))

(declare-fun b!453007 () Bool)

(declare-fun e!265142 () Bool)

(assert (=> b!453007 (= e!265142 (validKeyInArray!0 (select (arr!13481 lt!205321) from!863)))))

(assert (=> b!453007 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!453008 () Bool)

(assert (=> b!453008 (= e!265144 call!30023)))

(declare-fun bm!30020 () Bool)

(assert (=> bm!30020 (= call!30023 (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453009 () Bool)

(assert (=> b!453009 (= e!265143 e!265139)))

(declare-fun c!56122 () Bool)

(assert (=> b!453009 (= c!56122 e!265142)))

(declare-fun res!269916 () Bool)

(assert (=> b!453009 (=> (not res!269916) (not e!265142))))

(assert (=> b!453009 (= res!269916 (bvslt from!863 (size!13834 lt!205321)))))

(declare-fun b!453010 () Bool)

(declare-fun res!269915 () Bool)

(assert (=> b!453010 (=> (not res!269915) (not e!265143))))

(assert (=> b!453010 (= res!269915 (not (contains!2487 lt!205475 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74159 c!56123) b!453000))

(assert (= (and d!74159 (not c!56123)) b!453006))

(assert (= (and b!453006 c!56121) b!453003))

(assert (= (and b!453006 (not c!56121)) b!453008))

(assert (= (or b!453003 b!453008) bm!30020))

(assert (= (and d!74159 res!269917) b!453010))

(assert (= (and b!453010 res!269915) b!453009))

(assert (= (and b!453009 res!269916) b!453007))

(assert (= (and b!453009 c!56122) b!452999))

(assert (= (and b!453009 (not c!56122)) b!453005))

(assert (= (and b!452999 res!269914) b!453004))

(assert (= (and b!453005 c!56120) b!453001))

(assert (= (and b!453005 (not c!56120)) b!453002))

(declare-fun b_lambda!9581 () Bool)

(assert (=> (not b_lambda!9581) (not b!453003)))

(assert (=> b!453003 t!13931))

(declare-fun b_and!18887 () Bool)

(assert (= b_and!18885 (and (=> t!13931 result!7091) b_and!18887)))

(declare-fun b_lambda!9583 () Bool)

(assert (=> (not b_lambda!9583) (not b!453004)))

(assert (=> b!453004 t!13931))

(declare-fun b_and!18889 () Bool)

(assert (= b_and!18887 (and (=> t!13931 result!7091) b_and!18889)))

(assert (=> b!452999 m!436081))

(assert (=> b!452999 m!436081))

(declare-fun m!436449 () Bool)

(assert (=> b!452999 m!436449))

(assert (=> b!453004 m!436081))

(assert (=> b!453004 m!436071))

(declare-fun m!436451 () Bool)

(assert (=> b!453004 m!436451))

(assert (=> b!453004 m!436071))

(declare-fun m!436453 () Bool)

(assert (=> b!453004 m!436453))

(assert (=> b!453004 m!436081))

(declare-fun m!436455 () Bool)

(assert (=> b!453004 m!436455))

(assert (=> b!453004 m!436451))

(declare-fun m!436457 () Bool)

(assert (=> b!453010 m!436457))

(declare-fun m!436459 () Bool)

(assert (=> d!74159 m!436459))

(assert (=> d!74159 m!436063))

(assert (=> b!453007 m!436081))

(assert (=> b!453007 m!436081))

(declare-fun m!436461 () Bool)

(assert (=> b!453007 m!436461))

(assert (=> b!453006 m!436081))

(assert (=> b!453006 m!436081))

(assert (=> b!453006 m!436461))

(declare-fun m!436463 () Bool)

(assert (=> bm!30020 m!436463))

(declare-fun m!436465 () Bool)

(assert (=> b!453002 m!436465))

(assert (=> b!453001 m!436463))

(assert (=> b!453003 m!436081))

(assert (=> b!453003 m!436451))

(declare-fun m!436467 () Bool)

(assert (=> b!453003 m!436467))

(assert (=> b!453003 m!436451))

(assert (=> b!453003 m!436071))

(assert (=> b!453003 m!436453))

(declare-fun m!436469 () Bool)

(assert (=> b!453003 m!436469))

(assert (=> b!453003 m!436071))

(declare-fun m!436471 () Bool)

(assert (=> b!453003 m!436471))

(assert (=> b!453003 m!436467))

(declare-fun m!436473 () Bool)

(assert (=> b!453003 m!436473))

(assert (=> b!452738 d!74159))

(declare-fun b!453011 () Bool)

(declare-fun e!265146 () Bool)

(declare-fun e!265152 () Bool)

(assert (=> b!453011 (= e!265146 e!265152)))

(assert (=> b!453011 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13834 _keys!709)))))

(declare-fun lt!205482 () ListLongMap!6963)

(declare-fun res!269918 () Bool)

(assert (=> b!453011 (= res!269918 (contains!2487 lt!205482 (select (arr!13481 _keys!709) from!863)))))

(assert (=> b!453011 (=> (not res!269918) (not e!265152))))

(declare-fun b!453012 () Bool)

(declare-fun e!265148 () ListLongMap!6963)

(assert (=> b!453012 (= e!265148 (ListLongMap!6964 Nil!8115))))

(declare-fun d!74161 () Bool)

(declare-fun e!265150 () Bool)

(assert (=> d!74161 e!265150))

(declare-fun res!269921 () Bool)

(assert (=> d!74161 (=> (not res!269921) (not e!265150))))

(assert (=> d!74161 (= res!269921 (not (contains!2487 lt!205482 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74161 (= lt!205482 e!265148)))

(declare-fun c!56127 () Bool)

(assert (=> d!74161 (= c!56127 (bvsge from!863 (size!13834 _keys!709)))))

(assert (=> d!74161 (validMask!0 mask!1025)))

(assert (=> d!74161 (= (getCurrentListMapNoExtraKeys!1692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!205482)))

(declare-fun b!453013 () Bool)

(declare-fun e!265147 () Bool)

(assert (=> b!453013 (= e!265147 (= lt!205482 (getCurrentListMapNoExtraKeys!1692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!453014 () Bool)

(assert (=> b!453014 (= e!265147 (isEmpty!563 lt!205482))))

(declare-fun b!453015 () Bool)

(declare-fun lt!205484 () Unit!13211)

(declare-fun lt!205486 () Unit!13211)

(assert (=> b!453015 (= lt!205484 lt!205486)))

(declare-fun lt!205485 () ListLongMap!6963)

(declare-fun lt!205480 () V!17291)

(declare-fun lt!205481 () (_ BitVec 64))

(declare-fun lt!205483 () (_ BitVec 64))

(assert (=> b!453015 (not (contains!2487 (+!1594 lt!205485 (tuple2!8061 lt!205481 lt!205480)) lt!205483))))

(assert (=> b!453015 (= lt!205486 (addStillNotContains!147 lt!205485 lt!205481 lt!205480 lt!205483))))

(assert (=> b!453015 (= lt!205483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453015 (= lt!205480 (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453015 (= lt!205481 (select (arr!13481 _keys!709) from!863))))

(declare-fun call!30024 () ListLongMap!6963)

(assert (=> b!453015 (= lt!205485 call!30024)))

(declare-fun e!265151 () ListLongMap!6963)

(assert (=> b!453015 (= e!265151 (+!1594 call!30024 (tuple2!8061 (select (arr!13481 _keys!709) from!863) (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453016 () Bool)

(assert (=> b!453016 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13834 _keys!709)))))

(assert (=> b!453016 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!13835 _values!549)))))

(assert (=> b!453016 (= e!265152 (= (apply!313 lt!205482 (select (arr!13481 _keys!709) from!863)) (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453017 () Bool)

(assert (=> b!453017 (= e!265146 e!265147)))

(declare-fun c!56124 () Bool)

(assert (=> b!453017 (= c!56124 (bvslt from!863 (size!13834 _keys!709)))))

(declare-fun b!453018 () Bool)

(assert (=> b!453018 (= e!265148 e!265151)))

(declare-fun c!56125 () Bool)

(assert (=> b!453018 (= c!56125 (validKeyInArray!0 (select (arr!13481 _keys!709) from!863)))))

(declare-fun b!453019 () Bool)

(declare-fun e!265149 () Bool)

(assert (=> b!453019 (= e!265149 (validKeyInArray!0 (select (arr!13481 _keys!709) from!863)))))

(assert (=> b!453019 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!453020 () Bool)

(assert (=> b!453020 (= e!265151 call!30024)))

(declare-fun bm!30021 () Bool)

(assert (=> bm!30021 (= call!30024 (getCurrentListMapNoExtraKeys!1692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453021 () Bool)

(assert (=> b!453021 (= e!265150 e!265146)))

(declare-fun c!56126 () Bool)

(assert (=> b!453021 (= c!56126 e!265149)))

(declare-fun res!269920 () Bool)

(assert (=> b!453021 (=> (not res!269920) (not e!265149))))

(assert (=> b!453021 (= res!269920 (bvslt from!863 (size!13834 _keys!709)))))

(declare-fun b!453022 () Bool)

(declare-fun res!269919 () Bool)

(assert (=> b!453022 (=> (not res!269919) (not e!265150))))

(assert (=> b!453022 (= res!269919 (not (contains!2487 lt!205482 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74161 c!56127) b!453012))

(assert (= (and d!74161 (not c!56127)) b!453018))

(assert (= (and b!453018 c!56125) b!453015))

(assert (= (and b!453018 (not c!56125)) b!453020))

(assert (= (or b!453015 b!453020) bm!30021))

(assert (= (and d!74161 res!269921) b!453022))

(assert (= (and b!453022 res!269919) b!453021))

(assert (= (and b!453021 res!269920) b!453019))

(assert (= (and b!453021 c!56126) b!453011))

(assert (= (and b!453021 (not c!56126)) b!453017))

(assert (= (and b!453011 res!269918) b!453016))

(assert (= (and b!453017 c!56124) b!453013))

(assert (= (and b!453017 (not c!56124)) b!453014))

(declare-fun b_lambda!9585 () Bool)

(assert (=> (not b_lambda!9585) (not b!453015)))

(assert (=> b!453015 t!13931))

(declare-fun b_and!18891 () Bool)

(assert (= b_and!18889 (and (=> t!13931 result!7091) b_and!18891)))

(declare-fun b_lambda!9587 () Bool)

(assert (=> (not b_lambda!9587) (not b!453016)))

(assert (=> b!453016 t!13931))

(declare-fun b_and!18893 () Bool)

(assert (= b_and!18891 (and (=> t!13931 result!7091) b_and!18893)))

(assert (=> b!453011 m!436057))

(assert (=> b!453011 m!436057))

(declare-fun m!436475 () Bool)

(assert (=> b!453011 m!436475))

(assert (=> b!453016 m!436057))

(assert (=> b!453016 m!436071))

(assert (=> b!453016 m!436077))

(assert (=> b!453016 m!436071))

(declare-fun m!436477 () Bool)

(assert (=> b!453016 m!436477))

(assert (=> b!453016 m!436057))

(declare-fun m!436479 () Bool)

(assert (=> b!453016 m!436479))

(assert (=> b!453016 m!436077))

(declare-fun m!436481 () Bool)

(assert (=> b!453022 m!436481))

(declare-fun m!436483 () Bool)

(assert (=> d!74161 m!436483))

(assert (=> d!74161 m!436063))

(assert (=> b!453019 m!436057))

(assert (=> b!453019 m!436057))

(assert (=> b!453019 m!436059))

(assert (=> b!453018 m!436057))

(assert (=> b!453018 m!436057))

(assert (=> b!453018 m!436059))

(declare-fun m!436485 () Bool)

(assert (=> bm!30021 m!436485))

(declare-fun m!436487 () Bool)

(assert (=> b!453014 m!436487))

(assert (=> b!453013 m!436485))

(assert (=> b!453015 m!436057))

(assert (=> b!453015 m!436077))

(declare-fun m!436489 () Bool)

(assert (=> b!453015 m!436489))

(assert (=> b!453015 m!436077))

(assert (=> b!453015 m!436071))

(assert (=> b!453015 m!436477))

(declare-fun m!436491 () Bool)

(assert (=> b!453015 m!436491))

(assert (=> b!453015 m!436071))

(declare-fun m!436493 () Bool)

(assert (=> b!453015 m!436493))

(assert (=> b!453015 m!436489))

(declare-fun m!436495 () Bool)

(assert (=> b!453015 m!436495))

(assert (=> b!452738 d!74161))

(declare-fun b!453023 () Bool)

(declare-fun e!265155 () Bool)

(declare-fun call!30025 () Bool)

(assert (=> b!453023 (= e!265155 call!30025)))

(declare-fun b!453024 () Bool)

(declare-fun e!265153 () Bool)

(assert (=> b!453024 (= e!265153 call!30025)))

(declare-fun b!453025 () Bool)

(assert (=> b!453025 (= e!265153 e!265155)))

(declare-fun lt!205489 () (_ BitVec 64))

(assert (=> b!453025 (= lt!205489 (select (arr!13481 lt!205321) #b00000000000000000000000000000000))))

(declare-fun lt!205488 () Unit!13211)

(assert (=> b!453025 (= lt!205488 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!205321 lt!205489 #b00000000000000000000000000000000))))

(assert (=> b!453025 (arrayContainsKey!0 lt!205321 lt!205489 #b00000000000000000000000000000000)))

(declare-fun lt!205487 () Unit!13211)

(assert (=> b!453025 (= lt!205487 lt!205488)))

(declare-fun res!269922 () Bool)

(assert (=> b!453025 (= res!269922 (= (seekEntryOrOpen!0 (select (arr!13481 lt!205321) #b00000000000000000000000000000000) lt!205321 mask!1025) (Found!3527 #b00000000000000000000000000000000)))))

(assert (=> b!453025 (=> (not res!269922) (not e!265155))))

(declare-fun b!453026 () Bool)

(declare-fun e!265154 () Bool)

(assert (=> b!453026 (= e!265154 e!265153)))

(declare-fun c!56128 () Bool)

(assert (=> b!453026 (= c!56128 (validKeyInArray!0 (select (arr!13481 lt!205321) #b00000000000000000000000000000000)))))

(declare-fun d!74163 () Bool)

(declare-fun res!269923 () Bool)

(assert (=> d!74163 (=> res!269923 e!265154)))

(assert (=> d!74163 (= res!269923 (bvsge #b00000000000000000000000000000000 (size!13834 lt!205321)))))

(assert (=> d!74163 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!205321 mask!1025) e!265154)))

(declare-fun bm!30022 () Bool)

(assert (=> bm!30022 (= call!30025 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!205321 mask!1025))))

(assert (= (and d!74163 (not res!269923)) b!453026))

(assert (= (and b!453026 c!56128) b!453025))

(assert (= (and b!453026 (not c!56128)) b!453024))

(assert (= (and b!453025 res!269922) b!453023))

(assert (= (or b!453023 b!453024) bm!30022))

(assert (=> b!453025 m!436257))

(declare-fun m!436497 () Bool)

(assert (=> b!453025 m!436497))

(declare-fun m!436499 () Bool)

(assert (=> b!453025 m!436499))

(assert (=> b!453025 m!436257))

(declare-fun m!436501 () Bool)

(assert (=> b!453025 m!436501))

(assert (=> b!453026 m!436257))

(assert (=> b!453026 m!436257))

(assert (=> b!453026 m!436259))

(declare-fun m!436503 () Bool)

(assert (=> bm!30022 m!436503))

(assert (=> b!452743 d!74163))

(declare-fun d!74165 () Bool)

(declare-fun e!265156 () Bool)

(assert (=> d!74165 e!265156))

(declare-fun res!269925 () Bool)

(assert (=> d!74165 (=> (not res!269925) (not e!265156))))

(declare-fun lt!205493 () ListLongMap!6963)

(assert (=> d!74165 (= res!269925 (contains!2487 lt!205493 (_1!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun lt!205490 () List!8118)

(assert (=> d!74165 (= lt!205493 (ListLongMap!6964 lt!205490))))

(declare-fun lt!205492 () Unit!13211)

(declare-fun lt!205491 () Unit!13211)

(assert (=> d!74165 (= lt!205492 lt!205491)))

(assert (=> d!74165 (= (getValueByKey!368 lt!205490 (_1!4041 (tuple2!8061 k0!794 v!412))) (Some!373 (_2!4041 (tuple2!8061 k0!794 v!412))))))

(assert (=> d!74165 (= lt!205491 (lemmaContainsTupThenGetReturnValue!193 lt!205490 (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))))))

(assert (=> d!74165 (= lt!205490 (insertStrictlySorted!196 (toList!3497 call!29991) (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))))))

(assert (=> d!74165 (= (+!1594 call!29991 (tuple2!8061 k0!794 v!412)) lt!205493)))

(declare-fun b!453027 () Bool)

(declare-fun res!269924 () Bool)

(assert (=> b!453027 (=> (not res!269924) (not e!265156))))

(assert (=> b!453027 (= res!269924 (= (getValueByKey!368 (toList!3497 lt!205493) (_1!4041 (tuple2!8061 k0!794 v!412))) (Some!373 (_2!4041 (tuple2!8061 k0!794 v!412)))))))

(declare-fun b!453028 () Bool)

(assert (=> b!453028 (= e!265156 (contains!2488 (toList!3497 lt!205493) (tuple2!8061 k0!794 v!412)))))

(assert (= (and d!74165 res!269925) b!453027))

(assert (= (and b!453027 res!269924) b!453028))

(declare-fun m!436505 () Bool)

(assert (=> d!74165 m!436505))

(declare-fun m!436507 () Bool)

(assert (=> d!74165 m!436507))

(declare-fun m!436509 () Bool)

(assert (=> d!74165 m!436509))

(declare-fun m!436511 () Bool)

(assert (=> d!74165 m!436511))

(declare-fun m!436513 () Bool)

(assert (=> b!453027 m!436513))

(declare-fun m!436515 () Bool)

(assert (=> b!453028 m!436515))

(assert (=> b!452733 d!74165))

(declare-fun b!453035 () Bool)

(declare-fun e!265161 () Bool)

(assert (=> b!453035 (= e!265161 tp_is_empty!12139)))

(declare-fun condMapEmpty!19854 () Bool)

(declare-fun mapDefault!19854 () ValueCell!5726)

(assert (=> mapNonEmpty!19845 (= condMapEmpty!19854 (= mapRest!19845 ((as const (Array (_ BitVec 32) ValueCell!5726)) mapDefault!19854)))))

(declare-fun e!265162 () Bool)

(declare-fun mapRes!19854 () Bool)

(assert (=> mapNonEmpty!19845 (= tp!38225 (and e!265162 mapRes!19854))))

(declare-fun b!453036 () Bool)

(assert (=> b!453036 (= e!265162 tp_is_empty!12139)))

(declare-fun mapNonEmpty!19854 () Bool)

(declare-fun tp!38241 () Bool)

(assert (=> mapNonEmpty!19854 (= mapRes!19854 (and tp!38241 e!265161))))

(declare-fun mapRest!19854 () (Array (_ BitVec 32) ValueCell!5726))

(declare-fun mapKey!19854 () (_ BitVec 32))

(declare-fun mapValue!19854 () ValueCell!5726)

(assert (=> mapNonEmpty!19854 (= mapRest!19845 (store mapRest!19854 mapKey!19854 mapValue!19854))))

(declare-fun mapIsEmpty!19854 () Bool)

(assert (=> mapIsEmpty!19854 mapRes!19854))

(assert (= (and mapNonEmpty!19845 condMapEmpty!19854) mapIsEmpty!19854))

(assert (= (and mapNonEmpty!19845 (not condMapEmpty!19854)) mapNonEmpty!19854))

(assert (= (and mapNonEmpty!19854 ((_ is ValueCellFull!5726) mapValue!19854)) b!453035))

(assert (= (and mapNonEmpty!19845 ((_ is ValueCellFull!5726) mapDefault!19854)) b!453036))

(declare-fun m!436517 () Bool)

(assert (=> mapNonEmpty!19854 m!436517))

(declare-fun b_lambda!9589 () Bool)

(assert (= b_lambda!9575 (or (and start!40798 b_free!10801) b_lambda!9589)))

(declare-fun b_lambda!9591 () Bool)

(assert (= b_lambda!9569 (or (and start!40798 b_free!10801) b_lambda!9591)))

(declare-fun b_lambda!9593 () Bool)

(assert (= b_lambda!9583 (or (and start!40798 b_free!10801) b_lambda!9593)))

(declare-fun b_lambda!9595 () Bool)

(assert (= b_lambda!9573 (or (and start!40798 b_free!10801) b_lambda!9595)))

(declare-fun b_lambda!9597 () Bool)

(assert (= b_lambda!9579 (or (and start!40798 b_free!10801) b_lambda!9597)))

(declare-fun b_lambda!9599 () Bool)

(assert (= b_lambda!9571 (or (and start!40798 b_free!10801) b_lambda!9599)))

(declare-fun b_lambda!9601 () Bool)

(assert (= b_lambda!9577 (or (and start!40798 b_free!10801) b_lambda!9601)))

(declare-fun b_lambda!9603 () Bool)

(assert (= b_lambda!9581 (or (and start!40798 b_free!10801) b_lambda!9603)))

(declare-fun b_lambda!9605 () Bool)

(assert (= b_lambda!9587 (or (and start!40798 b_free!10801) b_lambda!9605)))

(declare-fun b_lambda!9607 () Bool)

(assert (= b_lambda!9585 (or (and start!40798 b_free!10801) b_lambda!9607)))

(check-sat (not b_lambda!9595) (not b!452975) (not b!452997) (not d!74147) (not b!453025) (not b!452959) (not b!452974) (not b!452931) (not b!452934) (not bm!30014) (not b!452993) (not b_lambda!9567) (not b!452935) (not b_lambda!9599) (not b!452917) (not b!452958) (not b!452884) (not b!452992) (not bm!30017) (not b!452995) (not b!453003) (not b!452920) (not d!74139) (not d!74165) (not b!452938) (not b!452968) (not b!452989) (not b!453001) (not b!452986) (not bm!30020) (not b!452991) (not b!453022) (not b!452927) (not b!452983) (not b!453007) (not b!452926) (not b!453004) (not d!74133) (not bm!30019) (not b!453026) (not b!453018) (not d!74143) (not b!452883) tp_is_empty!12139 (not b_lambda!9597) (not mapNonEmpty!19854) (not b!453027) (not d!74159) (not b_lambda!9591) (not b!452998) (not b!452976) (not bm!30004) (not b!452990) (not bm!30008) (not b!452881) (not b!452980) (not d!74161) (not b_lambda!9605) b_and!18893 (not b!452965) (not b!453013) (not b!452918) (not b_lambda!9601) (not bm!30018) (not b_lambda!9589) (not b_lambda!9603) (not d!74121) (not b!452930) (not b!452978) (not b!452982) (not b!453019) (not b!453006) (not b!452969) (not d!74135) (not b!452915) (not b!453011) (not b!453028) (not d!74123) (not b!453002) (not b!452999) (not b_lambda!9593) (not b!452890) (not b!452967) (not bm!30007) (not bm!30022) (not b!452981) (not b!452922) (not bm!30021) (not b!452929) (not b!452919) (not b!452966) (not b!452964) (not d!74145) (not b!453016) (not b_next!10801) (not b!452932) (not b!452945) (not b!452977) (not b_lambda!9607) (not b!453010) (not b!452985) (not d!74129) (not b!453015) (not d!74137) (not b!452923) (not b!453014) (not bm!30013))
(check-sat b_and!18893 (not b_next!10801))
(get-model)

(declare-fun d!74167 () Bool)

(declare-fun e!265163 () Bool)

(assert (=> d!74167 e!265163))

(declare-fun res!269927 () Bool)

(assert (=> d!74167 (=> (not res!269927) (not e!265163))))

(declare-fun lt!205497 () ListLongMap!6963)

(assert (=> d!74167 (= res!269927 (contains!2487 lt!205497 (_1!4041 (tuple2!8061 lt!205481 lt!205480))))))

(declare-fun lt!205494 () List!8118)

(assert (=> d!74167 (= lt!205497 (ListLongMap!6964 lt!205494))))

(declare-fun lt!205496 () Unit!13211)

(declare-fun lt!205495 () Unit!13211)

(assert (=> d!74167 (= lt!205496 lt!205495)))

(assert (=> d!74167 (= (getValueByKey!368 lt!205494 (_1!4041 (tuple2!8061 lt!205481 lt!205480))) (Some!373 (_2!4041 (tuple2!8061 lt!205481 lt!205480))))))

(assert (=> d!74167 (= lt!205495 (lemmaContainsTupThenGetReturnValue!193 lt!205494 (_1!4041 (tuple2!8061 lt!205481 lt!205480)) (_2!4041 (tuple2!8061 lt!205481 lt!205480))))))

(assert (=> d!74167 (= lt!205494 (insertStrictlySorted!196 (toList!3497 lt!205485) (_1!4041 (tuple2!8061 lt!205481 lt!205480)) (_2!4041 (tuple2!8061 lt!205481 lt!205480))))))

(assert (=> d!74167 (= (+!1594 lt!205485 (tuple2!8061 lt!205481 lt!205480)) lt!205497)))

(declare-fun b!453037 () Bool)

(declare-fun res!269926 () Bool)

(assert (=> b!453037 (=> (not res!269926) (not e!265163))))

(assert (=> b!453037 (= res!269926 (= (getValueByKey!368 (toList!3497 lt!205497) (_1!4041 (tuple2!8061 lt!205481 lt!205480))) (Some!373 (_2!4041 (tuple2!8061 lt!205481 lt!205480)))))))

(declare-fun b!453038 () Bool)

(assert (=> b!453038 (= e!265163 (contains!2488 (toList!3497 lt!205497) (tuple2!8061 lt!205481 lt!205480)))))

(assert (= (and d!74167 res!269927) b!453037))

(assert (= (and b!453037 res!269926) b!453038))

(declare-fun m!436519 () Bool)

(assert (=> d!74167 m!436519))

(declare-fun m!436521 () Bool)

(assert (=> d!74167 m!436521))

(declare-fun m!436523 () Bool)

(assert (=> d!74167 m!436523))

(declare-fun m!436525 () Bool)

(assert (=> d!74167 m!436525))

(declare-fun m!436527 () Bool)

(assert (=> b!453037 m!436527))

(declare-fun m!436529 () Bool)

(assert (=> b!453038 m!436529))

(assert (=> b!453015 d!74167))

(declare-fun d!74169 () Bool)

(declare-fun e!265169 () Bool)

(assert (=> d!74169 e!265169))

(declare-fun res!269930 () Bool)

(assert (=> d!74169 (=> res!269930 e!265169)))

(declare-fun lt!205506 () Bool)

(assert (=> d!74169 (= res!269930 (not lt!205506))))

(declare-fun lt!205508 () Bool)

(assert (=> d!74169 (= lt!205506 lt!205508)))

(declare-fun lt!205509 () Unit!13211)

(declare-fun e!265168 () Unit!13211)

(assert (=> d!74169 (= lt!205509 e!265168)))

(declare-fun c!56131 () Bool)

(assert (=> d!74169 (= c!56131 lt!205508)))

(declare-fun containsKey!345 (List!8118 (_ BitVec 64)) Bool)

(assert (=> d!74169 (= lt!205508 (containsKey!345 (toList!3497 (+!1594 lt!205485 (tuple2!8061 lt!205481 lt!205480))) lt!205483))))

(assert (=> d!74169 (= (contains!2487 (+!1594 lt!205485 (tuple2!8061 lt!205481 lt!205480)) lt!205483) lt!205506)))

(declare-fun b!453045 () Bool)

(declare-fun lt!205507 () Unit!13211)

(assert (=> b!453045 (= e!265168 lt!205507)))

(declare-fun lemmaContainsKeyImpliesGetValueByKeyDefined!294 (List!8118 (_ BitVec 64)) Unit!13211)

(assert (=> b!453045 (= lt!205507 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 (+!1594 lt!205485 (tuple2!8061 lt!205481 lt!205480))) lt!205483))))

(declare-fun isDefined!295 (Option!374) Bool)

(assert (=> b!453045 (isDefined!295 (getValueByKey!368 (toList!3497 (+!1594 lt!205485 (tuple2!8061 lt!205481 lt!205480))) lt!205483))))

(declare-fun b!453046 () Bool)

(declare-fun Unit!13217 () Unit!13211)

(assert (=> b!453046 (= e!265168 Unit!13217)))

(declare-fun b!453047 () Bool)

(assert (=> b!453047 (= e!265169 (isDefined!295 (getValueByKey!368 (toList!3497 (+!1594 lt!205485 (tuple2!8061 lt!205481 lt!205480))) lt!205483)))))

(assert (= (and d!74169 c!56131) b!453045))

(assert (= (and d!74169 (not c!56131)) b!453046))

(assert (= (and d!74169 (not res!269930)) b!453047))

(declare-fun m!436531 () Bool)

(assert (=> d!74169 m!436531))

(declare-fun m!436533 () Bool)

(assert (=> b!453045 m!436533))

(declare-fun m!436535 () Bool)

(assert (=> b!453045 m!436535))

(assert (=> b!453045 m!436535))

(declare-fun m!436537 () Bool)

(assert (=> b!453045 m!436537))

(assert (=> b!453047 m!436535))

(assert (=> b!453047 m!436535))

(assert (=> b!453047 m!436537))

(assert (=> b!453015 d!74169))

(declare-fun d!74171 () Bool)

(declare-fun e!265170 () Bool)

(assert (=> d!74171 e!265170))

(declare-fun res!269932 () Bool)

(assert (=> d!74171 (=> (not res!269932) (not e!265170))))

(declare-fun lt!205513 () ListLongMap!6963)

(assert (=> d!74171 (= res!269932 (contains!2487 lt!205513 (_1!4041 (tuple2!8061 (select (arr!13481 _keys!709) from!863) (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205510 () List!8118)

(assert (=> d!74171 (= lt!205513 (ListLongMap!6964 lt!205510))))

(declare-fun lt!205512 () Unit!13211)

(declare-fun lt!205511 () Unit!13211)

(assert (=> d!74171 (= lt!205512 lt!205511)))

(assert (=> d!74171 (= (getValueByKey!368 lt!205510 (_1!4041 (tuple2!8061 (select (arr!13481 _keys!709) from!863) (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!373 (_2!4041 (tuple2!8061 (select (arr!13481 _keys!709) from!863) (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74171 (= lt!205511 (lemmaContainsTupThenGetReturnValue!193 lt!205510 (_1!4041 (tuple2!8061 (select (arr!13481 _keys!709) from!863) (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4041 (tuple2!8061 (select (arr!13481 _keys!709) from!863) (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74171 (= lt!205510 (insertStrictlySorted!196 (toList!3497 call!30024) (_1!4041 (tuple2!8061 (select (arr!13481 _keys!709) from!863) (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4041 (tuple2!8061 (select (arr!13481 _keys!709) from!863) (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74171 (= (+!1594 call!30024 (tuple2!8061 (select (arr!13481 _keys!709) from!863) (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205513)))

(declare-fun b!453048 () Bool)

(declare-fun res!269931 () Bool)

(assert (=> b!453048 (=> (not res!269931) (not e!265170))))

(assert (=> b!453048 (= res!269931 (= (getValueByKey!368 (toList!3497 lt!205513) (_1!4041 (tuple2!8061 (select (arr!13481 _keys!709) from!863) (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!373 (_2!4041 (tuple2!8061 (select (arr!13481 _keys!709) from!863) (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453049 () Bool)

(assert (=> b!453049 (= e!265170 (contains!2488 (toList!3497 lt!205513) (tuple2!8061 (select (arr!13481 _keys!709) from!863) (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74171 res!269932) b!453048))

(assert (= (and b!453048 res!269931) b!453049))

(declare-fun m!436539 () Bool)

(assert (=> d!74171 m!436539))

(declare-fun m!436541 () Bool)

(assert (=> d!74171 m!436541))

(declare-fun m!436543 () Bool)

(assert (=> d!74171 m!436543))

(declare-fun m!436545 () Bool)

(assert (=> d!74171 m!436545))

(declare-fun m!436547 () Bool)

(assert (=> b!453048 m!436547))

(declare-fun m!436549 () Bool)

(assert (=> b!453049 m!436549))

(assert (=> b!453015 d!74171))

(declare-fun d!74173 () Bool)

(declare-fun c!56132 () Bool)

(assert (=> d!74173 (= c!56132 ((_ is ValueCellFull!5726) (select (arr!13482 _values!549) from!863)))))

(declare-fun e!265171 () V!17291)

(assert (=> d!74173 (= (get!6650 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265171)))

(declare-fun b!453050 () Bool)

(assert (=> b!453050 (= e!265171 (get!6653 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453051 () Bool)

(assert (=> b!453051 (= e!265171 (get!6654 (select (arr!13482 _values!549) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74173 c!56132) b!453050))

(assert (= (and d!74173 (not c!56132)) b!453051))

(assert (=> b!453050 m!436077))

(assert (=> b!453050 m!436071))

(declare-fun m!436551 () Bool)

(assert (=> b!453050 m!436551))

(assert (=> b!453051 m!436077))

(assert (=> b!453051 m!436071))

(declare-fun m!436553 () Bool)

(assert (=> b!453051 m!436553))

(assert (=> b!453015 d!74173))

(declare-fun d!74175 () Bool)

(assert (=> d!74175 (not (contains!2487 (+!1594 lt!205485 (tuple2!8061 lt!205481 lt!205480)) lt!205483))))

(declare-fun lt!205516 () Unit!13211)

(declare-fun choose!1336 (ListLongMap!6963 (_ BitVec 64) V!17291 (_ BitVec 64)) Unit!13211)

(assert (=> d!74175 (= lt!205516 (choose!1336 lt!205485 lt!205481 lt!205480 lt!205483))))

(declare-fun e!265174 () Bool)

(assert (=> d!74175 e!265174))

(declare-fun res!269935 () Bool)

(assert (=> d!74175 (=> (not res!269935) (not e!265174))))

(assert (=> d!74175 (= res!269935 (not (contains!2487 lt!205485 lt!205483)))))

(assert (=> d!74175 (= (addStillNotContains!147 lt!205485 lt!205481 lt!205480 lt!205483) lt!205516)))

(declare-fun b!453055 () Bool)

(assert (=> b!453055 (= e!265174 (not (= lt!205481 lt!205483)))))

(assert (= (and d!74175 res!269935) b!453055))

(assert (=> d!74175 m!436489))

(assert (=> d!74175 m!436489))

(assert (=> d!74175 m!436495))

(declare-fun m!436555 () Bool)

(assert (=> d!74175 m!436555))

(declare-fun m!436557 () Bool)

(assert (=> d!74175 m!436557))

(assert (=> b!453015 d!74175))

(declare-fun d!74177 () Bool)

(declare-fun lt!205519 () Bool)

(define-sort InoxSet (T) (Array T Bool))

(declare-fun content!204 (List!8117) (InoxSet (_ BitVec 64)))

(assert (=> d!74177 (= lt!205519 (select (content!204 Nil!8114) (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun e!265180 () Bool)

(assert (=> d!74177 (= lt!205519 e!265180)))

(declare-fun res!269940 () Bool)

(assert (=> d!74177 (=> (not res!269940) (not e!265180))))

(assert (=> d!74177 (= res!269940 ((_ is Cons!8113) Nil!8114))))

(assert (=> d!74177 (= (contains!2486 Nil!8114 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)) lt!205519)))

(declare-fun b!453060 () Bool)

(declare-fun e!265179 () Bool)

(assert (=> b!453060 (= e!265180 e!265179)))

(declare-fun res!269941 () Bool)

(assert (=> b!453060 (=> res!269941 e!265179)))

(assert (=> b!453060 (= res!269941 (= (h!8969 Nil!8114) (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!453061 () Bool)

(assert (=> b!453061 (= e!265179 (contains!2486 (t!13932 Nil!8114) (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74177 res!269940) b!453060))

(assert (= (and b!453060 (not res!269941)) b!453061))

(declare-fun m!436559 () Bool)

(assert (=> d!74177 m!436559))

(assert (=> d!74177 m!436265))

(declare-fun m!436561 () Bool)

(assert (=> d!74177 m!436561))

(assert (=> b!453061 m!436265))

(declare-fun m!436563 () Bool)

(assert (=> b!453061 m!436563))

(assert (=> b!452998 d!74177))

(declare-fun d!74179 () Bool)

(declare-fun get!6655 (Option!374) V!17291)

(assert (=> d!74179 (= (apply!313 lt!205464 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863))) (get!6655 (getValueByKey!368 (toList!3497 lt!205464) (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)))))))

(declare-fun bs!14373 () Bool)

(assert (= bs!14373 d!74179))

(assert (=> bs!14373 m!436401))

(declare-fun m!436565 () Bool)

(assert (=> bs!14373 m!436565))

(assert (=> bs!14373 m!436565))

(declare-fun m!436567 () Bool)

(assert (=> bs!14373 m!436567))

(assert (=> b!452983 d!74179))

(declare-fun d!74181 () Bool)

(declare-fun c!56133 () Bool)

(assert (=> d!74181 (= c!56133 ((_ is ValueCellFull!5726) (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun e!265181 () V!17291)

(assert (=> d!74181 (= (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265181)))

(declare-fun b!453062 () Bool)

(assert (=> b!453062 (= e!265181 (get!6653 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453063 () Bool)

(assert (=> b!453063 (= e!265181 (get!6654 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74181 c!56133) b!453062))

(assert (= (and d!74181 (not c!56133)) b!453063))

(assert (=> b!453062 m!436405))

(assert (=> b!453062 m!436071))

(declare-fun m!436569 () Bool)

(assert (=> b!453062 m!436569))

(assert (=> b!453063 m!436405))

(assert (=> b!453063 m!436071))

(declare-fun m!436571 () Bool)

(assert (=> b!453063 m!436571))

(assert (=> b!452983 d!74181))

(declare-fun d!74183 () Bool)

(declare-fun c!56134 () Bool)

(assert (=> d!74183 (= c!56134 ((_ is ValueCellFull!5726) (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun e!265182 () V!17291)

(assert (=> d!74183 (= (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265182)))

(declare-fun b!453064 () Bool)

(assert (=> b!453064 (= e!265182 (get!6653 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453065 () Bool)

(assert (=> b!453065 (= e!265182 (get!6654 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74183 c!56134) b!453064))

(assert (= (and d!74183 (not c!56134)) b!453065))

(assert (=> b!453064 m!436301))

(assert (=> b!453064 m!436071))

(declare-fun m!436573 () Bool)

(assert (=> b!453064 m!436573))

(assert (=> b!453065 m!436301))

(assert (=> b!453065 m!436071))

(declare-fun m!436575 () Bool)

(assert (=> b!453065 m!436575))

(assert (=> b!452931 d!74183))

(declare-fun d!74185 () Bool)

(declare-fun e!265183 () Bool)

(assert (=> d!74185 e!265183))

(declare-fun res!269943 () Bool)

(assert (=> d!74185 (=> (not res!269943) (not e!265183))))

(declare-fun lt!205523 () ListLongMap!6963)

(assert (=> d!74185 (= res!269943 (contains!2487 lt!205523 (_1!4041 (tuple2!8061 lt!205417 lt!205416))))))

(declare-fun lt!205520 () List!8118)

(assert (=> d!74185 (= lt!205523 (ListLongMap!6964 lt!205520))))

(declare-fun lt!205522 () Unit!13211)

(declare-fun lt!205521 () Unit!13211)

(assert (=> d!74185 (= lt!205522 lt!205521)))

(assert (=> d!74185 (= (getValueByKey!368 lt!205520 (_1!4041 (tuple2!8061 lt!205417 lt!205416))) (Some!373 (_2!4041 (tuple2!8061 lt!205417 lt!205416))))))

(assert (=> d!74185 (= lt!205521 (lemmaContainsTupThenGetReturnValue!193 lt!205520 (_1!4041 (tuple2!8061 lt!205417 lt!205416)) (_2!4041 (tuple2!8061 lt!205417 lt!205416))))))

(assert (=> d!74185 (= lt!205520 (insertStrictlySorted!196 (toList!3497 lt!205421) (_1!4041 (tuple2!8061 lt!205417 lt!205416)) (_2!4041 (tuple2!8061 lt!205417 lt!205416))))))

(assert (=> d!74185 (= (+!1594 lt!205421 (tuple2!8061 lt!205417 lt!205416)) lt!205523)))

(declare-fun b!453066 () Bool)

(declare-fun res!269942 () Bool)

(assert (=> b!453066 (=> (not res!269942) (not e!265183))))

(assert (=> b!453066 (= res!269942 (= (getValueByKey!368 (toList!3497 lt!205523) (_1!4041 (tuple2!8061 lt!205417 lt!205416))) (Some!373 (_2!4041 (tuple2!8061 lt!205417 lt!205416)))))))

(declare-fun b!453067 () Bool)

(assert (=> b!453067 (= e!265183 (contains!2488 (toList!3497 lt!205523) (tuple2!8061 lt!205417 lt!205416)))))

(assert (= (and d!74185 res!269943) b!453066))

(assert (= (and b!453066 res!269942) b!453067))

(declare-fun m!436577 () Bool)

(assert (=> d!74185 m!436577))

(declare-fun m!436579 () Bool)

(assert (=> d!74185 m!436579))

(declare-fun m!436581 () Bool)

(assert (=> d!74185 m!436581))

(declare-fun m!436583 () Bool)

(assert (=> d!74185 m!436583))

(declare-fun m!436585 () Bool)

(assert (=> b!453066 m!436585))

(declare-fun m!436587 () Bool)

(assert (=> b!453067 m!436587))

(assert (=> b!452931 d!74185))

(declare-fun d!74187 () Bool)

(assert (=> d!74187 (not (contains!2487 (+!1594 lt!205421 (tuple2!8061 lt!205417 lt!205416)) lt!205419))))

(declare-fun lt!205524 () Unit!13211)

(assert (=> d!74187 (= lt!205524 (choose!1336 lt!205421 lt!205417 lt!205416 lt!205419))))

(declare-fun e!265184 () Bool)

(assert (=> d!74187 e!265184))

(declare-fun res!269944 () Bool)

(assert (=> d!74187 (=> (not res!269944) (not e!265184))))

(assert (=> d!74187 (= res!269944 (not (contains!2487 lt!205421 lt!205419)))))

(assert (=> d!74187 (= (addStillNotContains!147 lt!205421 lt!205417 lt!205416 lt!205419) lt!205524)))

(declare-fun b!453068 () Bool)

(assert (=> b!453068 (= e!265184 (not (= lt!205417 lt!205419)))))

(assert (= (and d!74187 res!269944) b!453068))

(assert (=> d!74187 m!436317))

(assert (=> d!74187 m!436317))

(assert (=> d!74187 m!436323))

(declare-fun m!436589 () Bool)

(assert (=> d!74187 m!436589))

(declare-fun m!436591 () Bool)

(assert (=> d!74187 m!436591))

(assert (=> b!452931 d!74187))

(declare-fun d!74189 () Bool)

(declare-fun e!265186 () Bool)

(assert (=> d!74189 e!265186))

(declare-fun res!269945 () Bool)

(assert (=> d!74189 (=> res!269945 e!265186)))

(declare-fun lt!205525 () Bool)

(assert (=> d!74189 (= res!269945 (not lt!205525))))

(declare-fun lt!205527 () Bool)

(assert (=> d!74189 (= lt!205525 lt!205527)))

(declare-fun lt!205528 () Unit!13211)

(declare-fun e!265185 () Unit!13211)

(assert (=> d!74189 (= lt!205528 e!265185)))

(declare-fun c!56135 () Bool)

(assert (=> d!74189 (= c!56135 lt!205527)))

(assert (=> d!74189 (= lt!205527 (containsKey!345 (toList!3497 (+!1594 lt!205421 (tuple2!8061 lt!205417 lt!205416))) lt!205419))))

(assert (=> d!74189 (= (contains!2487 (+!1594 lt!205421 (tuple2!8061 lt!205417 lt!205416)) lt!205419) lt!205525)))

(declare-fun b!453069 () Bool)

(declare-fun lt!205526 () Unit!13211)

(assert (=> b!453069 (= e!265185 lt!205526)))

(assert (=> b!453069 (= lt!205526 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 (+!1594 lt!205421 (tuple2!8061 lt!205417 lt!205416))) lt!205419))))

(assert (=> b!453069 (isDefined!295 (getValueByKey!368 (toList!3497 (+!1594 lt!205421 (tuple2!8061 lt!205417 lt!205416))) lt!205419))))

(declare-fun b!453070 () Bool)

(declare-fun Unit!13218 () Unit!13211)

(assert (=> b!453070 (= e!265185 Unit!13218)))

(declare-fun b!453071 () Bool)

(assert (=> b!453071 (= e!265186 (isDefined!295 (getValueByKey!368 (toList!3497 (+!1594 lt!205421 (tuple2!8061 lt!205417 lt!205416))) lt!205419)))))

(assert (= (and d!74189 c!56135) b!453069))

(assert (= (and d!74189 (not c!56135)) b!453070))

(assert (= (and d!74189 (not res!269945)) b!453071))

(declare-fun m!436593 () Bool)

(assert (=> d!74189 m!436593))

(declare-fun m!436595 () Bool)

(assert (=> b!453069 m!436595))

(declare-fun m!436597 () Bool)

(assert (=> b!453069 m!436597))

(assert (=> b!453069 m!436597))

(declare-fun m!436599 () Bool)

(assert (=> b!453069 m!436599))

(assert (=> b!453071 m!436597))

(assert (=> b!453071 m!436597))

(assert (=> b!453071 m!436599))

(assert (=> b!452931 d!74189))

(declare-fun d!74191 () Bool)

(declare-fun e!265187 () Bool)

(assert (=> d!74191 e!265187))

(declare-fun res!269947 () Bool)

(assert (=> d!74191 (=> (not res!269947) (not e!265187))))

(declare-fun lt!205532 () ListLongMap!6963)

(assert (=> d!74191 (= res!269947 (contains!2487 lt!205532 (_1!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205529 () List!8118)

(assert (=> d!74191 (= lt!205532 (ListLongMap!6964 lt!205529))))

(declare-fun lt!205531 () Unit!13211)

(declare-fun lt!205530 () Unit!13211)

(assert (=> d!74191 (= lt!205531 lt!205530)))

(assert (=> d!74191 (= (getValueByKey!368 lt!205529 (_1!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!373 (_2!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74191 (= lt!205530 (lemmaContainsTupThenGetReturnValue!193 lt!205529 (_1!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74191 (= lt!205529 (insertStrictlySorted!196 (toList!3497 call!30011) (_1!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74191 (= (+!1594 call!30011 (tuple2!8061 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205532)))

(declare-fun b!453072 () Bool)

(declare-fun res!269946 () Bool)

(assert (=> b!453072 (=> (not res!269946) (not e!265187))))

(assert (=> b!453072 (= res!269946 (= (getValueByKey!368 (toList!3497 lt!205532) (_1!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!373 (_2!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453073 () Bool)

(assert (=> b!453073 (= e!265187 (contains!2488 (toList!3497 lt!205532) (tuple2!8061 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74191 res!269947) b!453072))

(assert (= (and b!453072 res!269946) b!453073))

(declare-fun m!436601 () Bool)

(assert (=> d!74191 m!436601))

(declare-fun m!436603 () Bool)

(assert (=> d!74191 m!436603))

(declare-fun m!436605 () Bool)

(assert (=> d!74191 m!436605))

(declare-fun m!436607 () Bool)

(assert (=> d!74191 m!436607))

(declare-fun m!436609 () Bool)

(assert (=> b!453072 m!436609))

(declare-fun m!436611 () Bool)

(assert (=> b!453073 m!436611))

(assert (=> b!452931 d!74191))

(declare-fun d!74193 () Bool)

(assert (=> d!74193 (= (validKeyInArray!0 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863))) (and (not (= (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!452985 d!74193))

(declare-fun b!453074 () Bool)

(declare-fun e!265188 () Bool)

(declare-fun e!265194 () Bool)

(assert (=> b!453074 (= e!265188 e!265194)))

(assert (=> b!453074 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 _keys!709)))))

(declare-fun res!269948 () Bool)

(declare-fun lt!205535 () ListLongMap!6963)

(assert (=> b!453074 (= res!269948 (contains!2487 lt!205535 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453074 (=> (not res!269948) (not e!265194))))

(declare-fun b!453075 () Bool)

(declare-fun e!265190 () ListLongMap!6963)

(assert (=> b!453075 (= e!265190 (ListLongMap!6964 Nil!8115))))

(declare-fun d!74195 () Bool)

(declare-fun e!265192 () Bool)

(assert (=> d!74195 e!265192))

(declare-fun res!269951 () Bool)

(assert (=> d!74195 (=> (not res!269951) (not e!265192))))

(assert (=> d!74195 (= res!269951 (not (contains!2487 lt!205535 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74195 (= lt!205535 e!265190)))

(declare-fun c!56139 () Bool)

(assert (=> d!74195 (= c!56139 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13834 _keys!709)))))

(assert (=> d!74195 (validMask!0 mask!1025)))

(assert (=> d!74195 (= (getCurrentListMapNoExtraKeys!1692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205535)))

(declare-fun e!265189 () Bool)

(declare-fun b!453076 () Bool)

(assert (=> b!453076 (= e!265189 (= lt!205535 (getCurrentListMapNoExtraKeys!1692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!453077 () Bool)

(assert (=> b!453077 (= e!265189 (isEmpty!563 lt!205535))))

(declare-fun b!453078 () Bool)

(declare-fun lt!205537 () Unit!13211)

(declare-fun lt!205539 () Unit!13211)

(assert (=> b!453078 (= lt!205537 lt!205539)))

(declare-fun lt!205533 () V!17291)

(declare-fun lt!205538 () ListLongMap!6963)

(declare-fun lt!205534 () (_ BitVec 64))

(declare-fun lt!205536 () (_ BitVec 64))

(assert (=> b!453078 (not (contains!2487 (+!1594 lt!205538 (tuple2!8061 lt!205534 lt!205533)) lt!205536))))

(assert (=> b!453078 (= lt!205539 (addStillNotContains!147 lt!205538 lt!205534 lt!205533 lt!205536))))

(assert (=> b!453078 (= lt!205536 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453078 (= lt!205533 (get!6650 (select (arr!13482 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453078 (= lt!205534 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30026 () ListLongMap!6963)

(assert (=> b!453078 (= lt!205538 call!30026)))

(declare-fun e!265193 () ListLongMap!6963)

(assert (=> b!453078 (= e!265193 (+!1594 call!30026 (tuple2!8061 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453079 () Bool)

(assert (=> b!453079 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 _keys!709)))))

(assert (=> b!453079 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13835 _values!549)))))

(assert (=> b!453079 (= e!265194 (= (apply!313 lt!205535 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6650 (select (arr!13482 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453080 () Bool)

(assert (=> b!453080 (= e!265188 e!265189)))

(declare-fun c!56136 () Bool)

(assert (=> b!453080 (= c!56136 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 _keys!709)))))

(declare-fun b!453081 () Bool)

(assert (=> b!453081 (= e!265190 e!265193)))

(declare-fun c!56137 () Bool)

(assert (=> b!453081 (= c!56137 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453082 () Bool)

(declare-fun e!265191 () Bool)

(assert (=> b!453082 (= e!265191 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453082 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!453083 () Bool)

(assert (=> b!453083 (= e!265193 call!30026)))

(declare-fun bm!30023 () Bool)

(assert (=> bm!30023 (= call!30026 (getCurrentListMapNoExtraKeys!1692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453084 () Bool)

(assert (=> b!453084 (= e!265192 e!265188)))

(declare-fun c!56138 () Bool)

(assert (=> b!453084 (= c!56138 e!265191)))

(declare-fun res!269950 () Bool)

(assert (=> b!453084 (=> (not res!269950) (not e!265191))))

(assert (=> b!453084 (= res!269950 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 _keys!709)))))

(declare-fun b!453085 () Bool)

(declare-fun res!269949 () Bool)

(assert (=> b!453085 (=> (not res!269949) (not e!265192))))

(assert (=> b!453085 (= res!269949 (not (contains!2487 lt!205535 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74195 c!56139) b!453075))

(assert (= (and d!74195 (not c!56139)) b!453081))

(assert (= (and b!453081 c!56137) b!453078))

(assert (= (and b!453081 (not c!56137)) b!453083))

(assert (= (or b!453078 b!453083) bm!30023))

(assert (= (and d!74195 res!269951) b!453085))

(assert (= (and b!453085 res!269949) b!453084))

(assert (= (and b!453084 res!269950) b!453082))

(assert (= (and b!453084 c!56138) b!453074))

(assert (= (and b!453084 (not c!56138)) b!453080))

(assert (= (and b!453074 res!269948) b!453079))

(assert (= (and b!453080 c!56136) b!453076))

(assert (= (and b!453080 (not c!56136)) b!453077))

(declare-fun b_lambda!9609 () Bool)

(assert (=> (not b_lambda!9609) (not b!453078)))

(assert (=> b!453078 t!13931))

(declare-fun b_and!18895 () Bool)

(assert (= b_and!18893 (and (=> t!13931 result!7091) b_and!18895)))

(declare-fun b_lambda!9611 () Bool)

(assert (=> (not b_lambda!9611) (not b!453079)))

(assert (=> b!453079 t!13931))

(declare-fun b_and!18897 () Bool)

(assert (= b_and!18895 (and (=> t!13931 result!7091) b_and!18897)))

(declare-fun m!436613 () Bool)

(assert (=> b!453074 m!436613))

(assert (=> b!453074 m!436613))

(declare-fun m!436615 () Bool)

(assert (=> b!453074 m!436615))

(assert (=> b!453079 m!436613))

(assert (=> b!453079 m!436071))

(declare-fun m!436617 () Bool)

(assert (=> b!453079 m!436617))

(assert (=> b!453079 m!436071))

(declare-fun m!436619 () Bool)

(assert (=> b!453079 m!436619))

(assert (=> b!453079 m!436613))

(declare-fun m!436621 () Bool)

(assert (=> b!453079 m!436621))

(assert (=> b!453079 m!436617))

(declare-fun m!436623 () Bool)

(assert (=> b!453085 m!436623))

(declare-fun m!436625 () Bool)

(assert (=> d!74195 m!436625))

(assert (=> d!74195 m!436063))

(assert (=> b!453082 m!436613))

(assert (=> b!453082 m!436613))

(declare-fun m!436627 () Bool)

(assert (=> b!453082 m!436627))

(assert (=> b!453081 m!436613))

(assert (=> b!453081 m!436613))

(assert (=> b!453081 m!436627))

(declare-fun m!436629 () Bool)

(assert (=> bm!30023 m!436629))

(declare-fun m!436631 () Bool)

(assert (=> b!453077 m!436631))

(assert (=> b!453076 m!436629))

(assert (=> b!453078 m!436613))

(assert (=> b!453078 m!436617))

(declare-fun m!436633 () Bool)

(assert (=> b!453078 m!436633))

(assert (=> b!453078 m!436617))

(assert (=> b!453078 m!436071))

(assert (=> b!453078 m!436619))

(declare-fun m!436635 () Bool)

(assert (=> b!453078 m!436635))

(assert (=> b!453078 m!436071))

(declare-fun m!436637 () Bool)

(assert (=> b!453078 m!436637))

(assert (=> b!453078 m!436633))

(declare-fun m!436639 () Bool)

(assert (=> b!453078 m!436639))

(assert (=> bm!30013 d!74195))

(declare-fun d!74197 () Bool)

(declare-fun e!265196 () Bool)

(assert (=> d!74197 e!265196))

(declare-fun res!269952 () Bool)

(assert (=> d!74197 (=> res!269952 e!265196)))

(declare-fun lt!205540 () Bool)

(assert (=> d!74197 (= res!269952 (not lt!205540))))

(declare-fun lt!205542 () Bool)

(assert (=> d!74197 (= lt!205540 lt!205542)))

(declare-fun lt!205543 () Unit!13211)

(declare-fun e!265195 () Unit!13211)

(assert (=> d!74197 (= lt!205543 e!265195)))

(declare-fun c!56140 () Bool)

(assert (=> d!74197 (= c!56140 lt!205542)))

(assert (=> d!74197 (= lt!205542 (containsKey!345 (toList!3497 lt!205493) (_1!4041 (tuple2!8061 k0!794 v!412))))))

(assert (=> d!74197 (= (contains!2487 lt!205493 (_1!4041 (tuple2!8061 k0!794 v!412))) lt!205540)))

(declare-fun b!453086 () Bool)

(declare-fun lt!205541 () Unit!13211)

(assert (=> b!453086 (= e!265195 lt!205541)))

(assert (=> b!453086 (= lt!205541 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205493) (_1!4041 (tuple2!8061 k0!794 v!412))))))

(assert (=> b!453086 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205493) (_1!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun b!453087 () Bool)

(declare-fun Unit!13219 () Unit!13211)

(assert (=> b!453087 (= e!265195 Unit!13219)))

(declare-fun b!453088 () Bool)

(assert (=> b!453088 (= e!265196 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205493) (_1!4041 (tuple2!8061 k0!794 v!412)))))))

(assert (= (and d!74197 c!56140) b!453086))

(assert (= (and d!74197 (not c!56140)) b!453087))

(assert (= (and d!74197 (not res!269952)) b!453088))

(declare-fun m!436641 () Bool)

(assert (=> d!74197 m!436641))

(declare-fun m!436643 () Bool)

(assert (=> b!453086 m!436643))

(assert (=> b!453086 m!436513))

(assert (=> b!453086 m!436513))

(declare-fun m!436645 () Bool)

(assert (=> b!453086 m!436645))

(assert (=> b!453088 m!436513))

(assert (=> b!453088 m!436513))

(assert (=> b!453088 m!436645))

(assert (=> d!74165 d!74197))

(declare-fun e!265202 () Option!374)

(declare-fun b!453099 () Bool)

(assert (=> b!453099 (= e!265202 (getValueByKey!368 (t!13933 lt!205490) (_1!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun b!453100 () Bool)

(assert (=> b!453100 (= e!265202 None!372)))

(declare-fun c!56145 () Bool)

(declare-fun d!74199 () Bool)

(assert (=> d!74199 (= c!56145 (and ((_ is Cons!8114) lt!205490) (= (_1!4041 (h!8970 lt!205490)) (_1!4041 (tuple2!8061 k0!794 v!412)))))))

(declare-fun e!265201 () Option!374)

(assert (=> d!74199 (= (getValueByKey!368 lt!205490 (_1!4041 (tuple2!8061 k0!794 v!412))) e!265201)))

(declare-fun b!453098 () Bool)

(assert (=> b!453098 (= e!265201 e!265202)))

(declare-fun c!56146 () Bool)

(assert (=> b!453098 (= c!56146 (and ((_ is Cons!8114) lt!205490) (not (= (_1!4041 (h!8970 lt!205490)) (_1!4041 (tuple2!8061 k0!794 v!412))))))))

(declare-fun b!453097 () Bool)

(assert (=> b!453097 (= e!265201 (Some!373 (_2!4041 (h!8970 lt!205490))))))

(assert (= (and d!74199 c!56145) b!453097))

(assert (= (and d!74199 (not c!56145)) b!453098))

(assert (= (and b!453098 c!56146) b!453099))

(assert (= (and b!453098 (not c!56146)) b!453100))

(declare-fun m!436647 () Bool)

(assert (=> b!453099 m!436647))

(assert (=> d!74165 d!74199))

(declare-fun d!74201 () Bool)

(assert (=> d!74201 (= (getValueByKey!368 lt!205490 (_1!4041 (tuple2!8061 k0!794 v!412))) (Some!373 (_2!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun lt!205546 () Unit!13211)

(declare-fun choose!1337 (List!8118 (_ BitVec 64) V!17291) Unit!13211)

(assert (=> d!74201 (= lt!205546 (choose!1337 lt!205490 (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun e!265205 () Bool)

(assert (=> d!74201 e!265205))

(declare-fun res!269957 () Bool)

(assert (=> d!74201 (=> (not res!269957) (not e!265205))))

(declare-fun isStrictlySorted!373 (List!8118) Bool)

(assert (=> d!74201 (= res!269957 (isStrictlySorted!373 lt!205490))))

(assert (=> d!74201 (= (lemmaContainsTupThenGetReturnValue!193 lt!205490 (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))) lt!205546)))

(declare-fun b!453105 () Bool)

(declare-fun res!269958 () Bool)

(assert (=> b!453105 (=> (not res!269958) (not e!265205))))

(assert (=> b!453105 (= res!269958 (containsKey!345 lt!205490 (_1!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun b!453106 () Bool)

(assert (=> b!453106 (= e!265205 (contains!2488 lt!205490 (tuple2!8061 (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412)))))))

(assert (= (and d!74201 res!269957) b!453105))

(assert (= (and b!453105 res!269958) b!453106))

(assert (=> d!74201 m!436507))

(declare-fun m!436649 () Bool)

(assert (=> d!74201 m!436649))

(declare-fun m!436651 () Bool)

(assert (=> d!74201 m!436651))

(declare-fun m!436653 () Bool)

(assert (=> b!453105 m!436653))

(declare-fun m!436655 () Bool)

(assert (=> b!453106 m!436655))

(assert (=> d!74165 d!74201))

(declare-fun d!74203 () Bool)

(declare-fun e!265216 () Bool)

(assert (=> d!74203 e!265216))

(declare-fun res!269964 () Bool)

(assert (=> d!74203 (=> (not res!269964) (not e!265216))))

(declare-fun lt!205549 () List!8118)

(assert (=> d!74203 (= res!269964 (isStrictlySorted!373 lt!205549))))

(declare-fun e!265220 () List!8118)

(assert (=> d!74203 (= lt!205549 e!265220)))

(declare-fun c!56157 () Bool)

(assert (=> d!74203 (= c!56157 (and ((_ is Cons!8114) (toList!3497 call!29991)) (bvslt (_1!4041 (h!8970 (toList!3497 call!29991))) (_1!4041 (tuple2!8061 k0!794 v!412)))))))

(assert (=> d!74203 (isStrictlySorted!373 (toList!3497 call!29991))))

(assert (=> d!74203 (= (insertStrictlySorted!196 (toList!3497 call!29991) (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))) lt!205549)))

(declare-fun b!453127 () Bool)

(declare-fun call!30033 () List!8118)

(assert (=> b!453127 (= e!265220 call!30033)))

(declare-fun bm!30030 () Bool)

(declare-fun e!265217 () List!8118)

(declare-fun $colon$colon!108 (List!8118 tuple2!8060) List!8118)

(assert (=> bm!30030 (= call!30033 ($colon$colon!108 e!265217 (ite c!56157 (h!8970 (toList!3497 call!29991)) (tuple2!8061 (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))))))))

(declare-fun c!56155 () Bool)

(assert (=> bm!30030 (= c!56155 c!56157)))

(declare-fun b!453128 () Bool)

(declare-fun c!56156 () Bool)

(assert (=> b!453128 (= c!56156 (and ((_ is Cons!8114) (toList!3497 call!29991)) (bvsgt (_1!4041 (h!8970 (toList!3497 call!29991))) (_1!4041 (tuple2!8061 k0!794 v!412)))))))

(declare-fun e!265218 () List!8118)

(declare-fun e!265219 () List!8118)

(assert (=> b!453128 (= e!265218 e!265219)))

(declare-fun b!453129 () Bool)

(declare-fun call!30035 () List!8118)

(assert (=> b!453129 (= e!265218 call!30035)))

(declare-fun b!453130 () Bool)

(assert (=> b!453130 (= e!265220 e!265218)))

(declare-fun c!56158 () Bool)

(assert (=> b!453130 (= c!56158 (and ((_ is Cons!8114) (toList!3497 call!29991)) (= (_1!4041 (h!8970 (toList!3497 call!29991))) (_1!4041 (tuple2!8061 k0!794 v!412)))))))

(declare-fun b!453131 () Bool)

(assert (=> b!453131 (= e!265217 (ite c!56158 (t!13933 (toList!3497 call!29991)) (ite c!56156 (Cons!8114 (h!8970 (toList!3497 call!29991)) (t!13933 (toList!3497 call!29991))) Nil!8115)))))

(declare-fun bm!30031 () Bool)

(assert (=> bm!30031 (= call!30035 call!30033)))

(declare-fun bm!30032 () Bool)

(declare-fun call!30034 () List!8118)

(assert (=> bm!30032 (= call!30034 call!30035)))

(declare-fun b!453132 () Bool)

(declare-fun res!269963 () Bool)

(assert (=> b!453132 (=> (not res!269963) (not e!265216))))

(assert (=> b!453132 (= res!269963 (containsKey!345 lt!205549 (_1!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun b!453133 () Bool)

(assert (=> b!453133 (= e!265219 call!30034)))

(declare-fun b!453134 () Bool)

(assert (=> b!453134 (= e!265219 call!30034)))

(declare-fun b!453135 () Bool)

(assert (=> b!453135 (= e!265216 (contains!2488 lt!205549 (tuple2!8061 (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412)))))))

(declare-fun b!453136 () Bool)

(assert (=> b!453136 (= e!265217 (insertStrictlySorted!196 (t!13933 (toList!3497 call!29991)) (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))))))

(assert (= (and d!74203 c!56157) b!453127))

(assert (= (and d!74203 (not c!56157)) b!453130))

(assert (= (and b!453130 c!56158) b!453129))

(assert (= (and b!453130 (not c!56158)) b!453128))

(assert (= (and b!453128 c!56156) b!453134))

(assert (= (and b!453128 (not c!56156)) b!453133))

(assert (= (or b!453134 b!453133) bm!30032))

(assert (= (or b!453129 bm!30032) bm!30031))

(assert (= (or b!453127 bm!30031) bm!30030))

(assert (= (and bm!30030 c!56155) b!453136))

(assert (= (and bm!30030 (not c!56155)) b!453131))

(assert (= (and d!74203 res!269964) b!453132))

(assert (= (and b!453132 res!269963) b!453135))

(declare-fun m!436657 () Bool)

(assert (=> b!453135 m!436657))

(declare-fun m!436659 () Bool)

(assert (=> b!453136 m!436659))

(declare-fun m!436661 () Bool)

(assert (=> d!74203 m!436661))

(declare-fun m!436663 () Bool)

(assert (=> d!74203 m!436663))

(declare-fun m!436665 () Bool)

(assert (=> b!453132 m!436665))

(declare-fun m!436667 () Bool)

(assert (=> bm!30030 m!436667))

(assert (=> d!74165 d!74203))

(declare-fun d!74205 () Bool)

(declare-fun res!269965 () Bool)

(declare-fun e!265221 () Bool)

(assert (=> d!74205 (=> res!269965 e!265221)))

(assert (=> d!74205 (= res!269965 (= (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) k0!794))))

(assert (=> d!74205 (= (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) e!265221)))

(declare-fun b!453137 () Bool)

(declare-fun e!265222 () Bool)

(assert (=> b!453137 (= e!265221 e!265222)))

(declare-fun res!269966 () Bool)

(assert (=> b!453137 (=> (not res!269966) (not e!265222))))

(assert (=> b!453137 (= res!269966 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (size!13834 _keys!709)))))

(declare-fun b!453138 () Bool)

(assert (=> b!453138 (= e!265222 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001)))))

(assert (= (and d!74205 (not res!269965)) b!453137))

(assert (= (and b!453137 res!269966) b!453138))

(declare-fun m!436669 () Bool)

(assert (=> d!74205 m!436669))

(declare-fun m!436671 () Bool)

(assert (=> b!453138 m!436671))

(assert (=> b!452890 d!74205))

(declare-fun d!74207 () Bool)

(declare-fun isEmpty!564 (List!8118) Bool)

(assert (=> d!74207 (= (isEmpty!563 lt!205464) (isEmpty!564 (toList!3497 lt!205464)))))

(declare-fun bs!14374 () Bool)

(assert (= bs!14374 d!74207))

(declare-fun m!436673 () Bool)

(assert (=> bs!14374 m!436673))

(assert (=> b!452981 d!74207))

(declare-fun d!74209 () Bool)

(declare-fun lt!205552 () Bool)

(declare-fun content!205 (List!8118) (InoxSet tuple2!8060))

(assert (=> d!74209 (= lt!205552 (select (content!205 (toList!3497 lt!205457)) (tuple2!8061 k0!794 v!412)))))

(declare-fun e!265228 () Bool)

(assert (=> d!74209 (= lt!205552 e!265228)))

(declare-fun res!269971 () Bool)

(assert (=> d!74209 (=> (not res!269971) (not e!265228))))

(assert (=> d!74209 (= res!269971 ((_ is Cons!8114) (toList!3497 lt!205457)))))

(assert (=> d!74209 (= (contains!2488 (toList!3497 lt!205457) (tuple2!8061 k0!794 v!412)) lt!205552)))

(declare-fun b!453143 () Bool)

(declare-fun e!265227 () Bool)

(assert (=> b!453143 (= e!265228 e!265227)))

(declare-fun res!269972 () Bool)

(assert (=> b!453143 (=> res!269972 e!265227)))

(assert (=> b!453143 (= res!269972 (= (h!8970 (toList!3497 lt!205457)) (tuple2!8061 k0!794 v!412)))))

(declare-fun b!453144 () Bool)

(assert (=> b!453144 (= e!265227 (contains!2488 (t!13933 (toList!3497 lt!205457)) (tuple2!8061 k0!794 v!412)))))

(assert (= (and d!74209 res!269971) b!453143))

(assert (= (and b!453143 (not res!269972)) b!453144))

(declare-fun m!436675 () Bool)

(assert (=> d!74209 m!436675))

(declare-fun m!436677 () Bool)

(assert (=> d!74209 m!436677))

(declare-fun m!436679 () Bool)

(assert (=> b!453144 m!436679))

(assert (=> b!452969 d!74209))

(declare-fun b!453145 () Bool)

(declare-fun e!265231 () Bool)

(declare-fun call!30036 () Bool)

(assert (=> b!453145 (= e!265231 call!30036)))

(declare-fun b!453146 () Bool)

(declare-fun e!265229 () Bool)

(assert (=> b!453146 (= e!265229 call!30036)))

(declare-fun b!453147 () Bool)

(assert (=> b!453147 (= e!265229 e!265231)))

(declare-fun lt!205555 () (_ BitVec 64))

(assert (=> b!453147 (= lt!205555 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!205554 () Unit!13211)

(assert (=> b!453147 (= lt!205554 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!205555 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!453147 (arrayContainsKey!0 _keys!709 lt!205555 #b00000000000000000000000000000000)))

(declare-fun lt!205553 () Unit!13211)

(assert (=> b!453147 (= lt!205553 lt!205554)))

(declare-fun res!269973 () Bool)

(assert (=> b!453147 (= res!269973 (= (seekEntryOrOpen!0 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) _keys!709 mask!1025) (Found!3527 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!453147 (=> (not res!269973) (not e!265231))))

(declare-fun b!453148 () Bool)

(declare-fun e!265230 () Bool)

(assert (=> b!453148 (= e!265230 e!265229)))

(declare-fun c!56159 () Bool)

(assert (=> b!453148 (= c!56159 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!74211 () Bool)

(declare-fun res!269974 () Bool)

(assert (=> d!74211 (=> res!269974 e!265230)))

(assert (=> d!74211 (= res!269974 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13834 _keys!709)))))

(assert (=> d!74211 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025) e!265230)))

(declare-fun bm!30033 () Bool)

(assert (=> bm!30033 (= call!30036 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!74211 (not res!269974)) b!453148))

(assert (= (and b!453148 c!56159) b!453147))

(assert (= (and b!453148 (not c!56159)) b!453146))

(assert (= (and b!453147 res!269973) b!453145))

(assert (= (or b!453145 b!453146) bm!30033))

(assert (=> b!453147 m!436669))

(declare-fun m!436681 () Bool)

(assert (=> b!453147 m!436681))

(declare-fun m!436683 () Bool)

(assert (=> b!453147 m!436683))

(assert (=> b!453147 m!436669))

(declare-fun m!436685 () Bool)

(assert (=> b!453147 m!436685))

(assert (=> b!453148 m!436669))

(assert (=> b!453148 m!436669))

(declare-fun m!436687 () Bool)

(assert (=> b!453148 m!436687))

(declare-fun m!436689 () Bool)

(assert (=> bm!30033 m!436689))

(assert (=> bm!30017 d!74211))

(declare-fun b!453149 () Bool)

(declare-fun e!265232 () Bool)

(declare-fun e!265238 () Bool)

(assert (=> b!453149 (= e!265232 e!265238)))

(assert (=> b!453149 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 (ite c!56079 lt!205321 _keys!709))))))

(declare-fun res!269975 () Bool)

(declare-fun lt!205558 () ListLongMap!6963)

(assert (=> b!453149 (= res!269975 (contains!2487 lt!205558 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453149 (=> (not res!269975) (not e!265238))))

(declare-fun b!453150 () Bool)

(declare-fun e!265234 () ListLongMap!6963)

(assert (=> b!453150 (= e!265234 (ListLongMap!6964 Nil!8115))))

(declare-fun d!74213 () Bool)

(declare-fun e!265236 () Bool)

(assert (=> d!74213 e!265236))

(declare-fun res!269978 () Bool)

(assert (=> d!74213 (=> (not res!269978) (not e!265236))))

(assert (=> d!74213 (= res!269978 (not (contains!2487 lt!205558 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74213 (= lt!205558 e!265234)))

(declare-fun c!56163 () Bool)

(assert (=> d!74213 (= c!56163 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 (ite c!56079 lt!205321 _keys!709))))))

(assert (=> d!74213 (validMask!0 mask!1025)))

(assert (=> d!74213 (= (getCurrentListMapNoExtraKeys!1692 (ite c!56079 lt!205321 _keys!709) (ite c!56079 lt!205322 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205558)))

(declare-fun b!453151 () Bool)

(declare-fun e!265233 () Bool)

(assert (=> b!453151 (= e!265233 (= lt!205558 (getCurrentListMapNoExtraKeys!1692 (ite c!56079 lt!205321 _keys!709) (ite c!56079 lt!205322 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!453152 () Bool)

(assert (=> b!453152 (= e!265233 (isEmpty!563 lt!205558))))

(declare-fun b!453153 () Bool)

(declare-fun lt!205560 () Unit!13211)

(declare-fun lt!205562 () Unit!13211)

(assert (=> b!453153 (= lt!205560 lt!205562)))

(declare-fun lt!205559 () (_ BitVec 64))

(declare-fun lt!205561 () ListLongMap!6963)

(declare-fun lt!205556 () V!17291)

(declare-fun lt!205557 () (_ BitVec 64))

(assert (=> b!453153 (not (contains!2487 (+!1594 lt!205561 (tuple2!8061 lt!205557 lt!205556)) lt!205559))))

(assert (=> b!453153 (= lt!205562 (addStillNotContains!147 lt!205561 lt!205557 lt!205556 lt!205559))))

(assert (=> b!453153 (= lt!205559 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453153 (= lt!205556 (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453153 (= lt!205557 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)))))

(declare-fun call!30037 () ListLongMap!6963)

(assert (=> b!453153 (= lt!205561 call!30037)))

(declare-fun e!265237 () ListLongMap!6963)

(assert (=> b!453153 (= e!265237 (+!1594 call!30037 (tuple2!8061 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453154 () Bool)

(assert (=> b!453154 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 (ite c!56079 lt!205321 _keys!709))))))

(assert (=> b!453154 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13835 (ite c!56079 lt!205322 _values!549))))))

(assert (=> b!453154 (= e!265238 (= (apply!313 lt!205558 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))) (get!6650 (select (arr!13482 (ite c!56079 lt!205322 _values!549)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453155 () Bool)

(assert (=> b!453155 (= e!265232 e!265233)))

(declare-fun c!56160 () Bool)

(assert (=> b!453155 (= c!56160 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 (ite c!56079 lt!205321 _keys!709))))))

(declare-fun b!453156 () Bool)

(assert (=> b!453156 (= e!265234 e!265237)))

(declare-fun c!56161 () Bool)

(assert (=> b!453156 (= c!56161 (validKeyInArray!0 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(declare-fun b!453157 () Bool)

(declare-fun e!265235 () Bool)

(assert (=> b!453157 (= e!265235 (validKeyInArray!0 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453157 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453158 () Bool)

(assert (=> b!453158 (= e!265237 call!30037)))

(declare-fun bm!30034 () Bool)

(assert (=> bm!30034 (= call!30037 (getCurrentListMapNoExtraKeys!1692 (ite c!56079 lt!205321 _keys!709) (ite c!56079 lt!205322 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453159 () Bool)

(assert (=> b!453159 (= e!265236 e!265232)))

(declare-fun c!56162 () Bool)

(assert (=> b!453159 (= c!56162 e!265235)))

(declare-fun res!269977 () Bool)

(assert (=> b!453159 (=> (not res!269977) (not e!265235))))

(assert (=> b!453159 (= res!269977 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 (ite c!56079 lt!205321 _keys!709))))))

(declare-fun b!453160 () Bool)

(declare-fun res!269976 () Bool)

(assert (=> b!453160 (=> (not res!269976) (not e!265236))))

(assert (=> b!453160 (= res!269976 (not (contains!2487 lt!205558 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74213 c!56163) b!453150))

(assert (= (and d!74213 (not c!56163)) b!453156))

(assert (= (and b!453156 c!56161) b!453153))

(assert (= (and b!453156 (not c!56161)) b!453158))

(assert (= (or b!453153 b!453158) bm!30034))

(assert (= (and d!74213 res!269978) b!453160))

(assert (= (and b!453160 res!269976) b!453159))

(assert (= (and b!453159 res!269977) b!453157))

(assert (= (and b!453159 c!56162) b!453149))

(assert (= (and b!453159 (not c!56162)) b!453155))

(assert (= (and b!453149 res!269975) b!453154))

(assert (= (and b!453155 c!56160) b!453151))

(assert (= (and b!453155 (not c!56160)) b!453152))

(declare-fun b_lambda!9613 () Bool)

(assert (=> (not b_lambda!9613) (not b!453153)))

(assert (=> b!453153 t!13931))

(declare-fun b_and!18899 () Bool)

(assert (= b_and!18897 (and (=> t!13931 result!7091) b_and!18899)))

(declare-fun b_lambda!9615 () Bool)

(assert (=> (not b_lambda!9615) (not b!453154)))

(assert (=> b!453154 t!13931))

(declare-fun b_and!18901 () Bool)

(assert (= b_and!18899 (and (=> t!13931 result!7091) b_and!18901)))

(declare-fun m!436691 () Bool)

(assert (=> b!453149 m!436691))

(assert (=> b!453149 m!436691))

(declare-fun m!436693 () Bool)

(assert (=> b!453149 m!436693))

(assert (=> b!453154 m!436691))

(assert (=> b!453154 m!436071))

(declare-fun m!436695 () Bool)

(assert (=> b!453154 m!436695))

(assert (=> b!453154 m!436071))

(declare-fun m!436697 () Bool)

(assert (=> b!453154 m!436697))

(assert (=> b!453154 m!436691))

(declare-fun m!436699 () Bool)

(assert (=> b!453154 m!436699))

(assert (=> b!453154 m!436695))

(declare-fun m!436701 () Bool)

(assert (=> b!453160 m!436701))

(declare-fun m!436703 () Bool)

(assert (=> d!74213 m!436703))

(assert (=> d!74213 m!436063))

(assert (=> b!453157 m!436691))

(assert (=> b!453157 m!436691))

(declare-fun m!436705 () Bool)

(assert (=> b!453157 m!436705))

(assert (=> b!453156 m!436691))

(assert (=> b!453156 m!436691))

(assert (=> b!453156 m!436705))

(declare-fun m!436707 () Bool)

(assert (=> bm!30034 m!436707))

(declare-fun m!436709 () Bool)

(assert (=> b!453152 m!436709))

(assert (=> b!453151 m!436707))

(assert (=> b!453153 m!436691))

(assert (=> b!453153 m!436695))

(declare-fun m!436711 () Bool)

(assert (=> b!453153 m!436711))

(assert (=> b!453153 m!436695))

(assert (=> b!453153 m!436071))

(assert (=> b!453153 m!436697))

(declare-fun m!436713 () Bool)

(assert (=> b!453153 m!436713))

(assert (=> b!453153 m!436071))

(declare-fun m!436715 () Bool)

(assert (=> b!453153 m!436715))

(assert (=> b!453153 m!436711))

(declare-fun m!436717 () Bool)

(assert (=> b!453153 m!436717))

(assert (=> b!452929 d!74213))

(declare-fun b!453161 () Bool)

(declare-fun e!265239 () Bool)

(declare-fun e!265245 () Bool)

(assert (=> b!453161 (= e!265239 e!265245)))

(assert (=> b!453161 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13834 _keys!709)))))

(declare-fun lt!205565 () ListLongMap!6963)

(declare-fun res!269979 () Bool)

(assert (=> b!453161 (= res!269979 (contains!2487 lt!205565 (select (arr!13481 _keys!709) (bvadd from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453161 (=> (not res!269979) (not e!265245))))

(declare-fun b!453162 () Bool)

(declare-fun e!265241 () ListLongMap!6963)

(assert (=> b!453162 (= e!265241 (ListLongMap!6964 Nil!8115))))

(declare-fun d!74215 () Bool)

(declare-fun e!265243 () Bool)

(assert (=> d!74215 e!265243))

(declare-fun res!269982 () Bool)

(assert (=> d!74215 (=> (not res!269982) (not e!265243))))

(assert (=> d!74215 (= res!269982 (not (contains!2487 lt!205565 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74215 (= lt!205565 e!265241)))

(declare-fun c!56167 () Bool)

(assert (=> d!74215 (= c!56167 (bvsge (bvadd from!863 #b00000000000000000000000000000001) (size!13834 _keys!709)))))

(assert (=> d!74215 (validMask!0 mask!1025)))

(assert (=> d!74215 (= (getCurrentListMapNoExtraKeys!1692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205565)))

(declare-fun b!453163 () Bool)

(declare-fun e!265240 () Bool)

(assert (=> b!453163 (= e!265240 (= lt!205565 (getCurrentListMapNoExtraKeys!1692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!453164 () Bool)

(assert (=> b!453164 (= e!265240 (isEmpty!563 lt!205565))))

(declare-fun b!453165 () Bool)

(declare-fun lt!205567 () Unit!13211)

(declare-fun lt!205569 () Unit!13211)

(assert (=> b!453165 (= lt!205567 lt!205569)))

(declare-fun lt!205568 () ListLongMap!6963)

(declare-fun lt!205566 () (_ BitVec 64))

(declare-fun lt!205563 () V!17291)

(declare-fun lt!205564 () (_ BitVec 64))

(assert (=> b!453165 (not (contains!2487 (+!1594 lt!205568 (tuple2!8061 lt!205564 lt!205563)) lt!205566))))

(assert (=> b!453165 (= lt!205569 (addStillNotContains!147 lt!205568 lt!205564 lt!205563 lt!205566))))

(assert (=> b!453165 (= lt!205566 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453165 (= lt!205563 (get!6650 (select (arr!13482 _values!549) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453165 (= lt!205564 (select (arr!13481 _keys!709) (bvadd from!863 #b00000000000000000000000000000001)))))

(declare-fun call!30038 () ListLongMap!6963)

(assert (=> b!453165 (= lt!205568 call!30038)))

(declare-fun e!265244 () ListLongMap!6963)

(assert (=> b!453165 (= e!265244 (+!1594 call!30038 (tuple2!8061 (select (arr!13481 _keys!709) (bvadd from!863 #b00000000000000000000000000000001)) (get!6650 (select (arr!13482 _values!549) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453166 () Bool)

(assert (=> b!453166 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13834 _keys!709)))))

(assert (=> b!453166 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13835 _values!549)))))

(assert (=> b!453166 (= e!265245 (= (apply!313 lt!205565 (select (arr!13481 _keys!709) (bvadd from!863 #b00000000000000000000000000000001))) (get!6650 (select (arr!13482 _values!549) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453167 () Bool)

(assert (=> b!453167 (= e!265239 e!265240)))

(declare-fun c!56164 () Bool)

(assert (=> b!453167 (= c!56164 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13834 _keys!709)))))

(declare-fun b!453168 () Bool)

(assert (=> b!453168 (= e!265241 e!265244)))

(declare-fun c!56165 () Bool)

(assert (=> b!453168 (= c!56165 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd from!863 #b00000000000000000000000000000001))))))

(declare-fun b!453169 () Bool)

(declare-fun e!265242 () Bool)

(assert (=> b!453169 (= e!265242 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453169 (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453170 () Bool)

(assert (=> b!453170 (= e!265244 call!30038)))

(declare-fun bm!30035 () Bool)

(assert (=> bm!30035 (= call!30038 (getCurrentListMapNoExtraKeys!1692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453171 () Bool)

(assert (=> b!453171 (= e!265243 e!265239)))

(declare-fun c!56166 () Bool)

(assert (=> b!453171 (= c!56166 e!265242)))

(declare-fun res!269981 () Bool)

(assert (=> b!453171 (=> (not res!269981) (not e!265242))))

(assert (=> b!453171 (= res!269981 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13834 _keys!709)))))

(declare-fun b!453172 () Bool)

(declare-fun res!269980 () Bool)

(assert (=> b!453172 (=> (not res!269980) (not e!265243))))

(assert (=> b!453172 (= res!269980 (not (contains!2487 lt!205565 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74215 c!56167) b!453162))

(assert (= (and d!74215 (not c!56167)) b!453168))

(assert (= (and b!453168 c!56165) b!453165))

(assert (= (and b!453168 (not c!56165)) b!453170))

(assert (= (or b!453165 b!453170) bm!30035))

(assert (= (and d!74215 res!269982) b!453172))

(assert (= (and b!453172 res!269980) b!453171))

(assert (= (and b!453171 res!269981) b!453169))

(assert (= (and b!453171 c!56166) b!453161))

(assert (= (and b!453171 (not c!56166)) b!453167))

(assert (= (and b!453161 res!269979) b!453166))

(assert (= (and b!453167 c!56164) b!453163))

(assert (= (and b!453167 (not c!56164)) b!453164))

(declare-fun b_lambda!9617 () Bool)

(assert (=> (not b_lambda!9617) (not b!453165)))

(assert (=> b!453165 t!13931))

(declare-fun b_and!18903 () Bool)

(assert (= b_and!18901 (and (=> t!13931 result!7091) b_and!18903)))

(declare-fun b_lambda!9619 () Bool)

(assert (=> (not b_lambda!9619) (not b!453166)))

(assert (=> b!453166 t!13931))

(declare-fun b_and!18905 () Bool)

(assert (= b_and!18903 (and (=> t!13931 result!7091) b_and!18905)))

(declare-fun m!436719 () Bool)

(assert (=> b!453161 m!436719))

(assert (=> b!453161 m!436719))

(declare-fun m!436721 () Bool)

(assert (=> b!453161 m!436721))

(assert (=> b!453166 m!436719))

(assert (=> b!453166 m!436071))

(declare-fun m!436723 () Bool)

(assert (=> b!453166 m!436723))

(assert (=> b!453166 m!436071))

(declare-fun m!436725 () Bool)

(assert (=> b!453166 m!436725))

(assert (=> b!453166 m!436719))

(declare-fun m!436727 () Bool)

(assert (=> b!453166 m!436727))

(assert (=> b!453166 m!436723))

(declare-fun m!436729 () Bool)

(assert (=> b!453172 m!436729))

(declare-fun m!436731 () Bool)

(assert (=> d!74215 m!436731))

(assert (=> d!74215 m!436063))

(assert (=> b!453169 m!436719))

(assert (=> b!453169 m!436719))

(declare-fun m!436733 () Bool)

(assert (=> b!453169 m!436733))

(assert (=> b!453168 m!436719))

(assert (=> b!453168 m!436719))

(assert (=> b!453168 m!436733))

(declare-fun m!436735 () Bool)

(assert (=> bm!30035 m!436735))

(declare-fun m!436737 () Bool)

(assert (=> b!453164 m!436737))

(assert (=> b!453163 m!436735))

(assert (=> b!453165 m!436719))

(assert (=> b!453165 m!436723))

(declare-fun m!436739 () Bool)

(assert (=> b!453165 m!436739))

(assert (=> b!453165 m!436723))

(assert (=> b!453165 m!436071))

(assert (=> b!453165 m!436725))

(declare-fun m!436741 () Bool)

(assert (=> b!453165 m!436741))

(assert (=> b!453165 m!436071))

(declare-fun m!436743 () Bool)

(assert (=> b!453165 m!436743))

(assert (=> b!453165 m!436739))

(declare-fun m!436745 () Bool)

(assert (=> b!453165 m!436745))

(assert (=> b!453013 d!74215))

(declare-fun b!453175 () Bool)

(declare-fun e!265247 () Option!374)

(assert (=> b!453175 (= e!265247 (getValueByKey!368 (t!13933 (toList!3497 lt!205461)) (_1!4041 lt!205326)))))

(declare-fun b!453176 () Bool)

(assert (=> b!453176 (= e!265247 None!372)))

(declare-fun d!74217 () Bool)

(declare-fun c!56168 () Bool)

(assert (=> d!74217 (= c!56168 (and ((_ is Cons!8114) (toList!3497 lt!205461)) (= (_1!4041 (h!8970 (toList!3497 lt!205461))) (_1!4041 lt!205326))))))

(declare-fun e!265246 () Option!374)

(assert (=> d!74217 (= (getValueByKey!368 (toList!3497 lt!205461) (_1!4041 lt!205326)) e!265246)))

(declare-fun b!453174 () Bool)

(assert (=> b!453174 (= e!265246 e!265247)))

(declare-fun c!56169 () Bool)

(assert (=> b!453174 (= c!56169 (and ((_ is Cons!8114) (toList!3497 lt!205461)) (not (= (_1!4041 (h!8970 (toList!3497 lt!205461))) (_1!4041 lt!205326)))))))

(declare-fun b!453173 () Bool)

(assert (=> b!453173 (= e!265246 (Some!373 (_2!4041 (h!8970 (toList!3497 lt!205461)))))))

(assert (= (and d!74217 c!56168) b!453173))

(assert (= (and d!74217 (not c!56168)) b!453174))

(assert (= (and b!453174 c!56169) b!453175))

(assert (= (and b!453174 (not c!56169)) b!453176))

(declare-fun m!436747 () Bool)

(assert (=> b!453175 m!436747))

(assert (=> b!452976 d!74217))

(declare-fun d!74219 () Bool)

(declare-fun e!265249 () Bool)

(assert (=> d!74219 e!265249))

(declare-fun res!269983 () Bool)

(assert (=> d!74219 (=> res!269983 e!265249)))

(declare-fun lt!205570 () Bool)

(assert (=> d!74219 (= res!269983 (not lt!205570))))

(declare-fun lt!205572 () Bool)

(assert (=> d!74219 (= lt!205570 lt!205572)))

(declare-fun lt!205573 () Unit!13211)

(declare-fun e!265248 () Unit!13211)

(assert (=> d!74219 (= lt!205573 e!265248)))

(declare-fun c!56170 () Bool)

(assert (=> d!74219 (= c!56170 lt!205572)))

(assert (=> d!74219 (= lt!205572 (containsKey!345 (toList!3497 lt!205411) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74219 (= (contains!2487 lt!205411 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205570)))

(declare-fun b!453177 () Bool)

(declare-fun lt!205571 () Unit!13211)

(assert (=> b!453177 (= e!265248 lt!205571)))

(assert (=> b!453177 (= lt!205571 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205411) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453177 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205411) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453178 () Bool)

(declare-fun Unit!13220 () Unit!13211)

(assert (=> b!453178 (= e!265248 Unit!13220)))

(declare-fun b!453179 () Bool)

(assert (=> b!453179 (= e!265249 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205411) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74219 c!56170) b!453177))

(assert (= (and d!74219 (not c!56170)) b!453178))

(assert (= (and d!74219 (not res!269983)) b!453179))

(declare-fun m!436749 () Bool)

(assert (=> d!74219 m!436749))

(declare-fun m!436751 () Bool)

(assert (=> b!453177 m!436751))

(declare-fun m!436753 () Bool)

(assert (=> b!453177 m!436753))

(assert (=> b!453177 m!436753))

(declare-fun m!436755 () Bool)

(assert (=> b!453177 m!436755))

(assert (=> b!453179 m!436753))

(assert (=> b!453179 m!436753))

(assert (=> b!453179 m!436755))

(assert (=> d!74121 d!74219))

(assert (=> d!74121 d!74155))

(declare-fun d!74221 () Bool)

(declare-fun e!265251 () Bool)

(assert (=> d!74221 e!265251))

(declare-fun res!269984 () Bool)

(assert (=> d!74221 (=> res!269984 e!265251)))

(declare-fun lt!205574 () Bool)

(assert (=> d!74221 (= res!269984 (not lt!205574))))

(declare-fun lt!205576 () Bool)

(assert (=> d!74221 (= lt!205574 lt!205576)))

(declare-fun lt!205577 () Unit!13211)

(declare-fun e!265250 () Unit!13211)

(assert (=> d!74221 (= lt!205577 e!265250)))

(declare-fun c!56171 () Bool)

(assert (=> d!74221 (= c!56171 lt!205576)))

(assert (=> d!74221 (= lt!205576 (containsKey!345 (toList!3497 lt!205411) (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> d!74221 (= (contains!2487 lt!205411 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863))) lt!205574)))

(declare-fun b!453180 () Bool)

(declare-fun lt!205575 () Unit!13211)

(assert (=> b!453180 (= e!265250 lt!205575)))

(assert (=> b!453180 (= lt!205575 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205411) (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453180 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205411) (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453181 () Bool)

(declare-fun Unit!13221 () Unit!13211)

(assert (=> b!453181 (= e!265250 Unit!13221)))

(declare-fun b!453182 () Bool)

(assert (=> b!453182 (= e!265251 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205411) (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)))))))

(assert (= (and d!74221 c!56171) b!453180))

(assert (= (and d!74221 (not c!56171)) b!453181))

(assert (= (and d!74221 (not res!269984)) b!453182))

(assert (=> d!74221 m!436269))

(declare-fun m!436757 () Bool)

(assert (=> d!74221 m!436757))

(assert (=> b!453180 m!436269))

(declare-fun m!436759 () Bool)

(assert (=> b!453180 m!436759))

(assert (=> b!453180 m!436269))

(declare-fun m!436761 () Bool)

(assert (=> b!453180 m!436761))

(assert (=> b!453180 m!436761))

(declare-fun m!436763 () Bool)

(assert (=> b!453180 m!436763))

(assert (=> b!453182 m!436269))

(assert (=> b!453182 m!436761))

(assert (=> b!453182 m!436761))

(assert (=> b!453182 m!436763))

(assert (=> b!452915 d!74221))

(declare-fun d!74223 () Bool)

(assert (=> d!74223 (= (get!6653 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863) lt!205323) (v!8367 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863)))))

(assert (=> b!452974 d!74223))

(declare-fun d!74225 () Bool)

(assert (=> d!74225 (= (get!6653 (select (arr!13482 _values!549) from!863) lt!205323) (v!8367 (select (arr!13482 _values!549) from!863)))))

(assert (=> b!452992 d!74225))

(assert (=> bm!30008 d!74213))

(assert (=> bm!30021 d!74215))

(declare-fun d!74227 () Bool)

(assert (=> d!74227 (= (validKeyInArray!0 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (and (not (= (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!452935 d!74227))

(assert (=> b!453019 d!74127))

(declare-fun lt!205578 () Bool)

(declare-fun d!74229 () Bool)

(assert (=> d!74229 (= lt!205578 (select (content!205 (toList!3497 lt!205472)) (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))

(declare-fun e!265253 () Bool)

(assert (=> d!74229 (= lt!205578 e!265253)))

(declare-fun res!269985 () Bool)

(assert (=> d!74229 (=> (not res!269985) (not e!265253))))

(assert (=> d!74229 (= res!269985 ((_ is Cons!8114) (toList!3497 lt!205472)))))

(assert (=> d!74229 (= (contains!2488 (toList!3497 lt!205472) (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)) lt!205578)))

(declare-fun b!453183 () Bool)

(declare-fun e!265252 () Bool)

(assert (=> b!453183 (= e!265253 e!265252)))

(declare-fun res!269986 () Bool)

(assert (=> b!453183 (=> res!269986 e!265252)))

(assert (=> b!453183 (= res!269986 (= (h!8970 (toList!3497 lt!205472)) (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))

(declare-fun b!453184 () Bool)

(assert (=> b!453184 (= e!265252 (contains!2488 (t!13933 (toList!3497 lt!205472)) (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))

(assert (= (and d!74229 res!269985) b!453183))

(assert (= (and b!453183 (not res!269986)) b!453184))

(declare-fun m!436765 () Bool)

(assert (=> d!74229 m!436765))

(declare-fun m!436767 () Bool)

(assert (=> d!74229 m!436767))

(declare-fun m!436769 () Bool)

(assert (=> b!453184 m!436769))

(assert (=> b!452991 d!74229))

(declare-fun d!74231 () Bool)

(declare-fun c!56172 () Bool)

(assert (=> d!74231 (= c!56172 ((_ is ValueCellFull!5726) (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun e!265254 () V!17291)

(assert (=> d!74231 (= (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265254)))

(declare-fun b!453185 () Bool)

(assert (=> b!453185 (= e!265254 (get!6653 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453186 () Bool)

(assert (=> b!453186 (= e!265254 (get!6654 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74231 c!56172) b!453185))

(assert (= (and d!74231 (not c!56172)) b!453186))

(assert (=> b!453185 m!436273))

(assert (=> b!453185 m!436071))

(declare-fun m!436771 () Bool)

(assert (=> b!453185 m!436771))

(assert (=> b!453186 m!436273))

(assert (=> b!453186 m!436071))

(declare-fun m!436773 () Bool)

(assert (=> b!453186 m!436773))

(assert (=> b!452919 d!74231))

(declare-fun d!74233 () Bool)

(declare-fun e!265256 () Bool)

(assert (=> d!74233 e!265256))

(declare-fun res!269987 () Bool)

(assert (=> d!74233 (=> res!269987 e!265256)))

(declare-fun lt!205579 () Bool)

(assert (=> d!74233 (= res!269987 (not lt!205579))))

(declare-fun lt!205581 () Bool)

(assert (=> d!74233 (= lt!205579 lt!205581)))

(declare-fun lt!205582 () Unit!13211)

(declare-fun e!265255 () Unit!13211)

(assert (=> d!74233 (= lt!205582 e!265255)))

(declare-fun c!56173 () Bool)

(assert (=> d!74233 (= c!56173 lt!205581)))

(assert (=> d!74233 (= lt!205581 (containsKey!345 (toList!3497 (+!1594 lt!205414 (tuple2!8061 lt!205410 lt!205409))) lt!205412))))

(assert (=> d!74233 (= (contains!2487 (+!1594 lt!205414 (tuple2!8061 lt!205410 lt!205409)) lt!205412) lt!205579)))

(declare-fun b!453187 () Bool)

(declare-fun lt!205580 () Unit!13211)

(assert (=> b!453187 (= e!265255 lt!205580)))

(assert (=> b!453187 (= lt!205580 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 (+!1594 lt!205414 (tuple2!8061 lt!205410 lt!205409))) lt!205412))))

(assert (=> b!453187 (isDefined!295 (getValueByKey!368 (toList!3497 (+!1594 lt!205414 (tuple2!8061 lt!205410 lt!205409))) lt!205412))))

(declare-fun b!453188 () Bool)

(declare-fun Unit!13222 () Unit!13211)

(assert (=> b!453188 (= e!265255 Unit!13222)))

(declare-fun b!453189 () Bool)

(assert (=> b!453189 (= e!265256 (isDefined!295 (getValueByKey!368 (toList!3497 (+!1594 lt!205414 (tuple2!8061 lt!205410 lt!205409))) lt!205412)))))

(assert (= (and d!74233 c!56173) b!453187))

(assert (= (and d!74233 (not c!56173)) b!453188))

(assert (= (and d!74233 (not res!269987)) b!453189))

(declare-fun m!436775 () Bool)

(assert (=> d!74233 m!436775))

(declare-fun m!436777 () Bool)

(assert (=> b!453187 m!436777))

(declare-fun m!436779 () Bool)

(assert (=> b!453187 m!436779))

(assert (=> b!453187 m!436779))

(declare-fun m!436781 () Bool)

(assert (=> b!453187 m!436781))

(assert (=> b!453189 m!436779))

(assert (=> b!453189 m!436779))

(assert (=> b!453189 m!436781))

(assert (=> b!452919 d!74233))

(declare-fun d!74235 () Bool)

(declare-fun e!265257 () Bool)

(assert (=> d!74235 e!265257))

(declare-fun res!269989 () Bool)

(assert (=> d!74235 (=> (not res!269989) (not e!265257))))

(declare-fun lt!205586 () ListLongMap!6963)

(assert (=> d!74235 (= res!269989 (contains!2487 lt!205586 (_1!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205583 () List!8118)

(assert (=> d!74235 (= lt!205586 (ListLongMap!6964 lt!205583))))

(declare-fun lt!205585 () Unit!13211)

(declare-fun lt!205584 () Unit!13211)

(assert (=> d!74235 (= lt!205585 lt!205584)))

(assert (=> d!74235 (= (getValueByKey!368 lt!205583 (_1!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!373 (_2!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74235 (= lt!205584 (lemmaContainsTupThenGetReturnValue!193 lt!205583 (_1!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74235 (= lt!205583 (insertStrictlySorted!196 (toList!3497 call!30010) (_1!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74235 (= (+!1594 call!30010 (tuple2!8061 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205586)))

(declare-fun b!453190 () Bool)

(declare-fun res!269988 () Bool)

(assert (=> b!453190 (=> (not res!269988) (not e!265257))))

(assert (=> b!453190 (= res!269988 (= (getValueByKey!368 (toList!3497 lt!205586) (_1!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!373 (_2!4041 (tuple2!8061 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453191 () Bool)

(assert (=> b!453191 (= e!265257 (contains!2488 (toList!3497 lt!205586) (tuple2!8061 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74235 res!269989) b!453190))

(assert (= (and b!453190 res!269988) b!453191))

(declare-fun m!436783 () Bool)

(assert (=> d!74235 m!436783))

(declare-fun m!436785 () Bool)

(assert (=> d!74235 m!436785))

(declare-fun m!436787 () Bool)

(assert (=> d!74235 m!436787))

(declare-fun m!436789 () Bool)

(assert (=> d!74235 m!436789))

(declare-fun m!436791 () Bool)

(assert (=> b!453190 m!436791))

(declare-fun m!436793 () Bool)

(assert (=> b!453191 m!436793))

(assert (=> b!452919 d!74235))

(declare-fun d!74237 () Bool)

(declare-fun e!265258 () Bool)

(assert (=> d!74237 e!265258))

(declare-fun res!269991 () Bool)

(assert (=> d!74237 (=> (not res!269991) (not e!265258))))

(declare-fun lt!205590 () ListLongMap!6963)

(assert (=> d!74237 (= res!269991 (contains!2487 lt!205590 (_1!4041 (tuple2!8061 lt!205410 lt!205409))))))

(declare-fun lt!205587 () List!8118)

(assert (=> d!74237 (= lt!205590 (ListLongMap!6964 lt!205587))))

(declare-fun lt!205589 () Unit!13211)

(declare-fun lt!205588 () Unit!13211)

(assert (=> d!74237 (= lt!205589 lt!205588)))

(assert (=> d!74237 (= (getValueByKey!368 lt!205587 (_1!4041 (tuple2!8061 lt!205410 lt!205409))) (Some!373 (_2!4041 (tuple2!8061 lt!205410 lt!205409))))))

(assert (=> d!74237 (= lt!205588 (lemmaContainsTupThenGetReturnValue!193 lt!205587 (_1!4041 (tuple2!8061 lt!205410 lt!205409)) (_2!4041 (tuple2!8061 lt!205410 lt!205409))))))

(assert (=> d!74237 (= lt!205587 (insertStrictlySorted!196 (toList!3497 lt!205414) (_1!4041 (tuple2!8061 lt!205410 lt!205409)) (_2!4041 (tuple2!8061 lt!205410 lt!205409))))))

(assert (=> d!74237 (= (+!1594 lt!205414 (tuple2!8061 lt!205410 lt!205409)) lt!205590)))

(declare-fun b!453192 () Bool)

(declare-fun res!269990 () Bool)

(assert (=> b!453192 (=> (not res!269990) (not e!265258))))

(assert (=> b!453192 (= res!269990 (= (getValueByKey!368 (toList!3497 lt!205590) (_1!4041 (tuple2!8061 lt!205410 lt!205409))) (Some!373 (_2!4041 (tuple2!8061 lt!205410 lt!205409)))))))

(declare-fun b!453193 () Bool)

(assert (=> b!453193 (= e!265258 (contains!2488 (toList!3497 lt!205590) (tuple2!8061 lt!205410 lt!205409)))))

(assert (= (and d!74237 res!269991) b!453192))

(assert (= (and b!453192 res!269990) b!453193))

(declare-fun m!436795 () Bool)

(assert (=> d!74237 m!436795))

(declare-fun m!436797 () Bool)

(assert (=> d!74237 m!436797))

(declare-fun m!436799 () Bool)

(assert (=> d!74237 m!436799))

(declare-fun m!436801 () Bool)

(assert (=> d!74237 m!436801))

(declare-fun m!436803 () Bool)

(assert (=> b!453192 m!436803))

(declare-fun m!436805 () Bool)

(assert (=> b!453193 m!436805))

(assert (=> b!452919 d!74237))

(declare-fun d!74239 () Bool)

(assert (=> d!74239 (not (contains!2487 (+!1594 lt!205414 (tuple2!8061 lt!205410 lt!205409)) lt!205412))))

(declare-fun lt!205591 () Unit!13211)

(assert (=> d!74239 (= lt!205591 (choose!1336 lt!205414 lt!205410 lt!205409 lt!205412))))

(declare-fun e!265259 () Bool)

(assert (=> d!74239 e!265259))

(declare-fun res!269992 () Bool)

(assert (=> d!74239 (=> (not res!269992) (not e!265259))))

(assert (=> d!74239 (= res!269992 (not (contains!2487 lt!205414 lt!205412)))))

(assert (=> d!74239 (= (addStillNotContains!147 lt!205414 lt!205410 lt!205409 lt!205412) lt!205591)))

(declare-fun b!453194 () Bool)

(assert (=> b!453194 (= e!265259 (not (= lt!205410 lt!205412)))))

(assert (= (and d!74239 res!269992) b!453194))

(assert (=> d!74239 m!436289))

(assert (=> d!74239 m!436289))

(assert (=> d!74239 m!436295))

(declare-fun m!436807 () Bool)

(assert (=> d!74239 m!436807))

(declare-fun m!436809 () Bool)

(assert (=> d!74239 m!436809))

(assert (=> b!452919 d!74239))

(declare-fun d!74241 () Bool)

(assert (=> d!74241 (= (validKeyInArray!0 (select (arr!13481 lt!205321) #b00000000000000000000000000000000)) (and (not (= (select (arr!13481 lt!205321) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 lt!205321) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453026 d!74241))

(declare-fun b!453195 () Bool)

(declare-fun e!265260 () Bool)

(declare-fun e!265266 () Bool)

(assert (=> b!453195 (= e!265260 e!265266)))

(assert (=> b!453195 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13834 lt!205321)))))

(declare-fun res!269993 () Bool)

(declare-fun lt!205594 () ListLongMap!6963)

(assert (=> b!453195 (= res!269993 (contains!2487 lt!205594 (select (arr!13481 lt!205321) (bvadd from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453195 (=> (not res!269993) (not e!265266))))

(declare-fun b!453196 () Bool)

(declare-fun e!265262 () ListLongMap!6963)

(assert (=> b!453196 (= e!265262 (ListLongMap!6964 Nil!8115))))

(declare-fun d!74243 () Bool)

(declare-fun e!265264 () Bool)

(assert (=> d!74243 e!265264))

(declare-fun res!269996 () Bool)

(assert (=> d!74243 (=> (not res!269996) (not e!265264))))

(assert (=> d!74243 (= res!269996 (not (contains!2487 lt!205594 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74243 (= lt!205594 e!265262)))

(declare-fun c!56177 () Bool)

(assert (=> d!74243 (= c!56177 (bvsge (bvadd from!863 #b00000000000000000000000000000001) (size!13834 lt!205321)))))

(assert (=> d!74243 (validMask!0 mask!1025)))

(assert (=> d!74243 (= (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205594)))

(declare-fun b!453197 () Bool)

(declare-fun e!265261 () Bool)

(assert (=> b!453197 (= e!265261 (= lt!205594 (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!453198 () Bool)

(assert (=> b!453198 (= e!265261 (isEmpty!563 lt!205594))))

(declare-fun b!453199 () Bool)

(declare-fun lt!205596 () Unit!13211)

(declare-fun lt!205598 () Unit!13211)

(assert (=> b!453199 (= lt!205596 lt!205598)))

(declare-fun lt!205593 () (_ BitVec 64))

(declare-fun lt!205592 () V!17291)

(declare-fun lt!205595 () (_ BitVec 64))

(declare-fun lt!205597 () ListLongMap!6963)

(assert (=> b!453199 (not (contains!2487 (+!1594 lt!205597 (tuple2!8061 lt!205593 lt!205592)) lt!205595))))

(assert (=> b!453199 (= lt!205598 (addStillNotContains!147 lt!205597 lt!205593 lt!205592 lt!205595))))

(assert (=> b!453199 (= lt!205595 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453199 (= lt!205592 (get!6650 (select (arr!13482 lt!205322) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453199 (= lt!205593 (select (arr!13481 lt!205321) (bvadd from!863 #b00000000000000000000000000000001)))))

(declare-fun call!30039 () ListLongMap!6963)

(assert (=> b!453199 (= lt!205597 call!30039)))

(declare-fun e!265265 () ListLongMap!6963)

(assert (=> b!453199 (= e!265265 (+!1594 call!30039 (tuple2!8061 (select (arr!13481 lt!205321) (bvadd from!863 #b00000000000000000000000000000001)) (get!6650 (select (arr!13482 lt!205322) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453200 () Bool)

(assert (=> b!453200 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13834 lt!205321)))))

(assert (=> b!453200 (and (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13835 lt!205322)))))

(assert (=> b!453200 (= e!265266 (= (apply!313 lt!205594 (select (arr!13481 lt!205321) (bvadd from!863 #b00000000000000000000000000000001))) (get!6650 (select (arr!13482 lt!205322) (bvadd from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453201 () Bool)

(assert (=> b!453201 (= e!265260 e!265261)))

(declare-fun c!56174 () Bool)

(assert (=> b!453201 (= c!56174 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13834 lt!205321)))))

(declare-fun b!453202 () Bool)

(assert (=> b!453202 (= e!265262 e!265265)))

(declare-fun c!56175 () Bool)

(assert (=> b!453202 (= c!56175 (validKeyInArray!0 (select (arr!13481 lt!205321) (bvadd from!863 #b00000000000000000000000000000001))))))

(declare-fun b!453203 () Bool)

(declare-fun e!265263 () Bool)

(assert (=> b!453203 (= e!265263 (validKeyInArray!0 (select (arr!13481 lt!205321) (bvadd from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453203 (bvsge (bvadd from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453204 () Bool)

(assert (=> b!453204 (= e!265265 call!30039)))

(declare-fun bm!30036 () Bool)

(assert (=> bm!30036 (= call!30039 (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453205 () Bool)

(assert (=> b!453205 (= e!265264 e!265260)))

(declare-fun c!56176 () Bool)

(assert (=> b!453205 (= c!56176 e!265263)))

(declare-fun res!269995 () Bool)

(assert (=> b!453205 (=> (not res!269995) (not e!265263))))

(assert (=> b!453205 (= res!269995 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!13834 lt!205321)))))

(declare-fun b!453206 () Bool)

(declare-fun res!269994 () Bool)

(assert (=> b!453206 (=> (not res!269994) (not e!265264))))

(assert (=> b!453206 (= res!269994 (not (contains!2487 lt!205594 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74243 c!56177) b!453196))

(assert (= (and d!74243 (not c!56177)) b!453202))

(assert (= (and b!453202 c!56175) b!453199))

(assert (= (and b!453202 (not c!56175)) b!453204))

(assert (= (or b!453199 b!453204) bm!30036))

(assert (= (and d!74243 res!269996) b!453206))

(assert (= (and b!453206 res!269994) b!453205))

(assert (= (and b!453205 res!269995) b!453203))

(assert (= (and b!453205 c!56176) b!453195))

(assert (= (and b!453205 (not c!56176)) b!453201))

(assert (= (and b!453195 res!269993) b!453200))

(assert (= (and b!453201 c!56174) b!453197))

(assert (= (and b!453201 (not c!56174)) b!453198))

(declare-fun b_lambda!9621 () Bool)

(assert (=> (not b_lambda!9621) (not b!453199)))

(assert (=> b!453199 t!13931))

(declare-fun b_and!18907 () Bool)

(assert (= b_and!18905 (and (=> t!13931 result!7091) b_and!18907)))

(declare-fun b_lambda!9623 () Bool)

(assert (=> (not b_lambda!9623) (not b!453200)))

(assert (=> b!453200 t!13931))

(declare-fun b_and!18909 () Bool)

(assert (= b_and!18907 (and (=> t!13931 result!7091) b_and!18909)))

(declare-fun m!436811 () Bool)

(assert (=> b!453195 m!436811))

(assert (=> b!453195 m!436811))

(declare-fun m!436813 () Bool)

(assert (=> b!453195 m!436813))

(assert (=> b!453200 m!436811))

(assert (=> b!453200 m!436071))

(declare-fun m!436815 () Bool)

(assert (=> b!453200 m!436815))

(assert (=> b!453200 m!436071))

(declare-fun m!436817 () Bool)

(assert (=> b!453200 m!436817))

(assert (=> b!453200 m!436811))

(declare-fun m!436819 () Bool)

(assert (=> b!453200 m!436819))

(assert (=> b!453200 m!436815))

(declare-fun m!436821 () Bool)

(assert (=> b!453206 m!436821))

(declare-fun m!436823 () Bool)

(assert (=> d!74243 m!436823))

(assert (=> d!74243 m!436063))

(assert (=> b!453203 m!436811))

(assert (=> b!453203 m!436811))

(declare-fun m!436825 () Bool)

(assert (=> b!453203 m!436825))

(assert (=> b!453202 m!436811))

(assert (=> b!453202 m!436811))

(assert (=> b!453202 m!436825))

(declare-fun m!436827 () Bool)

(assert (=> bm!30036 m!436827))

(declare-fun m!436829 () Bool)

(assert (=> b!453198 m!436829))

(assert (=> b!453197 m!436827))

(assert (=> b!453199 m!436811))

(assert (=> b!453199 m!436815))

(declare-fun m!436831 () Bool)

(assert (=> b!453199 m!436831))

(assert (=> b!453199 m!436815))

(assert (=> b!453199 m!436071))

(assert (=> b!453199 m!436817))

(declare-fun m!436833 () Bool)

(assert (=> b!453199 m!436833))

(assert (=> b!453199 m!436071))

(declare-fun m!436835 () Bool)

(assert (=> b!453199 m!436835))

(assert (=> b!453199 m!436831))

(declare-fun m!436837 () Bool)

(assert (=> b!453199 m!436837))

(assert (=> b!453001 d!74243))

(declare-fun b!453207 () Bool)

(declare-fun e!265267 () Bool)

(declare-fun e!265273 () Bool)

(assert (=> b!453207 (= e!265267 e!265273)))

(assert (=> b!453207 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 (ite c!56079 _keys!709 lt!205321))))))

(declare-fun res!269997 () Bool)

(declare-fun lt!205601 () ListLongMap!6963)

(assert (=> b!453207 (= res!269997 (contains!2487 lt!205601 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453207 (=> (not res!269997) (not e!265273))))

(declare-fun b!453208 () Bool)

(declare-fun e!265269 () ListLongMap!6963)

(assert (=> b!453208 (= e!265269 (ListLongMap!6964 Nil!8115))))

(declare-fun d!74245 () Bool)

(declare-fun e!265271 () Bool)

(assert (=> d!74245 e!265271))

(declare-fun res!270000 () Bool)

(assert (=> d!74245 (=> (not res!270000) (not e!265271))))

(assert (=> d!74245 (= res!270000 (not (contains!2487 lt!205601 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74245 (= lt!205601 e!265269)))

(declare-fun c!56181 () Bool)

(assert (=> d!74245 (= c!56181 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 (ite c!56079 _keys!709 lt!205321))))))

(assert (=> d!74245 (validMask!0 mask!1025)))

(assert (=> d!74245 (= (getCurrentListMapNoExtraKeys!1692 (ite c!56079 _keys!709 lt!205321) (ite c!56079 _values!549 lt!205322) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205601)))

(declare-fun e!265268 () Bool)

(declare-fun b!453209 () Bool)

(assert (=> b!453209 (= e!265268 (= lt!205601 (getCurrentListMapNoExtraKeys!1692 (ite c!56079 _keys!709 lt!205321) (ite c!56079 _values!549 lt!205322) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!453210 () Bool)

(assert (=> b!453210 (= e!265268 (isEmpty!563 lt!205601))))

(declare-fun b!453211 () Bool)

(declare-fun lt!205603 () Unit!13211)

(declare-fun lt!205605 () Unit!13211)

(assert (=> b!453211 (= lt!205603 lt!205605)))

(declare-fun lt!205600 () (_ BitVec 64))

(declare-fun lt!205604 () ListLongMap!6963)

(declare-fun lt!205602 () (_ BitVec 64))

(declare-fun lt!205599 () V!17291)

(assert (=> b!453211 (not (contains!2487 (+!1594 lt!205604 (tuple2!8061 lt!205600 lt!205599)) lt!205602))))

(assert (=> b!453211 (= lt!205605 (addStillNotContains!147 lt!205604 lt!205600 lt!205599 lt!205602))))

(assert (=> b!453211 (= lt!205602 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453211 (= lt!205599 (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453211 (= lt!205600 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)))))

(declare-fun call!30040 () ListLongMap!6963)

(assert (=> b!453211 (= lt!205604 call!30040)))

(declare-fun e!265272 () ListLongMap!6963)

(assert (=> b!453211 (= e!265272 (+!1594 call!30040 (tuple2!8061 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453212 () Bool)

(assert (=> b!453212 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 (ite c!56079 _keys!709 lt!205321))))))

(assert (=> b!453212 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13835 (ite c!56079 _values!549 lt!205322))))))

(assert (=> b!453212 (= e!265273 (= (apply!313 lt!205601 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))) (get!6650 (select (arr!13482 (ite c!56079 _values!549 lt!205322)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453213 () Bool)

(assert (=> b!453213 (= e!265267 e!265268)))

(declare-fun c!56178 () Bool)

(assert (=> b!453213 (= c!56178 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 (ite c!56079 _keys!709 lt!205321))))))

(declare-fun b!453214 () Bool)

(assert (=> b!453214 (= e!265269 e!265272)))

(declare-fun c!56179 () Bool)

(assert (=> b!453214 (= c!56179 (validKeyInArray!0 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(declare-fun b!453215 () Bool)

(declare-fun e!265270 () Bool)

(assert (=> b!453215 (= e!265270 (validKeyInArray!0 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453215 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453216 () Bool)

(assert (=> b!453216 (= e!265272 call!30040)))

(declare-fun bm!30037 () Bool)

(assert (=> bm!30037 (= call!30040 (getCurrentListMapNoExtraKeys!1692 (ite c!56079 _keys!709 lt!205321) (ite c!56079 _values!549 lt!205322) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453217 () Bool)

(assert (=> b!453217 (= e!265271 e!265267)))

(declare-fun c!56180 () Bool)

(assert (=> b!453217 (= c!56180 e!265270)))

(declare-fun res!269999 () Bool)

(assert (=> b!453217 (=> (not res!269999) (not e!265270))))

(assert (=> b!453217 (= res!269999 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 (ite c!56079 _keys!709 lt!205321))))))

(declare-fun b!453218 () Bool)

(declare-fun res!269998 () Bool)

(assert (=> b!453218 (=> (not res!269998) (not e!265271))))

(assert (=> b!453218 (= res!269998 (not (contains!2487 lt!205601 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74245 c!56181) b!453208))

(assert (= (and d!74245 (not c!56181)) b!453214))

(assert (= (and b!453214 c!56179) b!453211))

(assert (= (and b!453214 (not c!56179)) b!453216))

(assert (= (or b!453211 b!453216) bm!30037))

(assert (= (and d!74245 res!270000) b!453218))

(assert (= (and b!453218 res!269998) b!453217))

(assert (= (and b!453217 res!269999) b!453215))

(assert (= (and b!453217 c!56180) b!453207))

(assert (= (and b!453217 (not c!56180)) b!453213))

(assert (= (and b!453207 res!269997) b!453212))

(assert (= (and b!453213 c!56178) b!453209))

(assert (= (and b!453213 (not c!56178)) b!453210))

(declare-fun b_lambda!9625 () Bool)

(assert (=> (not b_lambda!9625) (not b!453211)))

(assert (=> b!453211 t!13931))

(declare-fun b_and!18911 () Bool)

(assert (= b_and!18909 (and (=> t!13931 result!7091) b_and!18911)))

(declare-fun b_lambda!9627 () Bool)

(assert (=> (not b_lambda!9627) (not b!453212)))

(assert (=> b!453212 t!13931))

(declare-fun b_and!18913 () Bool)

(assert (= b_and!18911 (and (=> t!13931 result!7091) b_and!18913)))

(declare-fun m!436839 () Bool)

(assert (=> b!453207 m!436839))

(assert (=> b!453207 m!436839))

(declare-fun m!436841 () Bool)

(assert (=> b!453207 m!436841))

(assert (=> b!453212 m!436839))

(assert (=> b!453212 m!436071))

(declare-fun m!436843 () Bool)

(assert (=> b!453212 m!436843))

(assert (=> b!453212 m!436071))

(declare-fun m!436845 () Bool)

(assert (=> b!453212 m!436845))

(assert (=> b!453212 m!436839))

(declare-fun m!436847 () Bool)

(assert (=> b!453212 m!436847))

(assert (=> b!453212 m!436843))

(declare-fun m!436849 () Bool)

(assert (=> b!453218 m!436849))

(declare-fun m!436851 () Bool)

(assert (=> d!74245 m!436851))

(assert (=> d!74245 m!436063))

(assert (=> b!453215 m!436839))

(assert (=> b!453215 m!436839))

(declare-fun m!436853 () Bool)

(assert (=> b!453215 m!436853))

(assert (=> b!453214 m!436839))

(assert (=> b!453214 m!436839))

(assert (=> b!453214 m!436853))

(declare-fun m!436855 () Bool)

(assert (=> bm!30037 m!436855))

(declare-fun m!436857 () Bool)

(assert (=> b!453210 m!436857))

(assert (=> b!453209 m!436855))

(assert (=> b!453211 m!436839))

(assert (=> b!453211 m!436843))

(declare-fun m!436859 () Bool)

(assert (=> b!453211 m!436859))

(assert (=> b!453211 m!436843))

(assert (=> b!453211 m!436071))

(assert (=> b!453211 m!436845))

(declare-fun m!436861 () Bool)

(assert (=> b!453211 m!436861))

(assert (=> b!453211 m!436071))

(declare-fun m!436863 () Bool)

(assert (=> b!453211 m!436863))

(assert (=> b!453211 m!436859))

(declare-fun m!436865 () Bool)

(assert (=> b!453211 m!436865))

(assert (=> b!452917 d!74245))

(declare-fun d!74247 () Bool)

(declare-fun e!265275 () Bool)

(assert (=> d!74247 e!265275))

(declare-fun res!270001 () Bool)

(assert (=> d!74247 (=> res!270001 e!265275)))

(declare-fun lt!205606 () Bool)

(assert (=> d!74247 (= res!270001 (not lt!205606))))

(declare-fun lt!205608 () Bool)

(assert (=> d!74247 (= lt!205606 lt!205608)))

(declare-fun lt!205609 () Unit!13211)

(declare-fun e!265274 () Unit!13211)

(assert (=> d!74247 (= lt!205609 e!265274)))

(declare-fun c!56182 () Bool)

(assert (=> d!74247 (= c!56182 lt!205608)))

(assert (=> d!74247 (= lt!205608 (containsKey!345 (toList!3497 lt!205482) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74247 (= (contains!2487 lt!205482 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205606)))

(declare-fun b!453219 () Bool)

(declare-fun lt!205607 () Unit!13211)

(assert (=> b!453219 (= e!265274 lt!205607)))

(assert (=> b!453219 (= lt!205607 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205482) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453219 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205482) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453220 () Bool)

(declare-fun Unit!13223 () Unit!13211)

(assert (=> b!453220 (= e!265274 Unit!13223)))

(declare-fun b!453221 () Bool)

(assert (=> b!453221 (= e!265275 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205482) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74247 c!56182) b!453219))

(assert (= (and d!74247 (not c!56182)) b!453220))

(assert (= (and d!74247 (not res!270001)) b!453221))

(declare-fun m!436867 () Bool)

(assert (=> d!74247 m!436867))

(declare-fun m!436869 () Bool)

(assert (=> b!453219 m!436869))

(declare-fun m!436871 () Bool)

(assert (=> b!453219 m!436871))

(assert (=> b!453219 m!436871))

(declare-fun m!436873 () Bool)

(assert (=> b!453219 m!436873))

(assert (=> b!453221 m!436871))

(assert (=> b!453221 m!436871))

(assert (=> b!453221 m!436873))

(assert (=> b!453022 d!74247))

(declare-fun d!74249 () Bool)

(declare-fun lt!205610 () Bool)

(assert (=> d!74249 (= lt!205610 (select (content!204 Nil!8114) (select (arr!13481 lt!205321) #b00000000000000000000000000000000)))))

(declare-fun e!265277 () Bool)

(assert (=> d!74249 (= lt!205610 e!265277)))

(declare-fun res!270002 () Bool)

(assert (=> d!74249 (=> (not res!270002) (not e!265277))))

(assert (=> d!74249 (= res!270002 ((_ is Cons!8113) Nil!8114))))

(assert (=> d!74249 (= (contains!2486 Nil!8114 (select (arr!13481 lt!205321) #b00000000000000000000000000000000)) lt!205610)))

(declare-fun b!453222 () Bool)

(declare-fun e!265276 () Bool)

(assert (=> b!453222 (= e!265277 e!265276)))

(declare-fun res!270003 () Bool)

(assert (=> b!453222 (=> res!270003 e!265276)))

(assert (=> b!453222 (= res!270003 (= (h!8969 Nil!8114) (select (arr!13481 lt!205321) #b00000000000000000000000000000000)))))

(declare-fun b!453223 () Bool)

(assert (=> b!453223 (= e!265276 (contains!2486 (t!13932 Nil!8114) (select (arr!13481 lt!205321) #b00000000000000000000000000000000)))))

(assert (= (and d!74249 res!270002) b!453222))

(assert (= (and b!453222 (not res!270003)) b!453223))

(assert (=> d!74249 m!436559))

(assert (=> d!74249 m!436257))

(declare-fun m!436875 () Bool)

(assert (=> d!74249 m!436875))

(assert (=> b!453223 m!436257))

(declare-fun m!436877 () Bool)

(assert (=> b!453223 m!436877))

(assert (=> b!452884 d!74249))

(declare-fun d!74251 () Bool)

(declare-fun e!265279 () Bool)

(assert (=> d!74251 e!265279))

(declare-fun res!270004 () Bool)

(assert (=> d!74251 (=> res!270004 e!265279)))

(declare-fun lt!205611 () Bool)

(assert (=> d!74251 (= res!270004 (not lt!205611))))

(declare-fun lt!205613 () Bool)

(assert (=> d!74251 (= lt!205611 lt!205613)))

(declare-fun lt!205614 () Unit!13211)

(declare-fun e!265278 () Unit!13211)

(assert (=> d!74251 (= lt!205614 e!265278)))

(declare-fun c!56183 () Bool)

(assert (=> d!74251 (= c!56183 lt!205613)))

(assert (=> d!74251 (= lt!205613 (containsKey!345 (toList!3497 lt!205453) (_1!4041 (tuple2!8061 k0!794 lt!205328))))))

(assert (=> d!74251 (= (contains!2487 lt!205453 (_1!4041 (tuple2!8061 k0!794 lt!205328))) lt!205611)))

(declare-fun b!453224 () Bool)

(declare-fun lt!205612 () Unit!13211)

(assert (=> b!453224 (= e!265278 lt!205612)))

(assert (=> b!453224 (= lt!205612 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205453) (_1!4041 (tuple2!8061 k0!794 lt!205328))))))

(assert (=> b!453224 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205453) (_1!4041 (tuple2!8061 k0!794 lt!205328))))))

(declare-fun b!453225 () Bool)

(declare-fun Unit!13224 () Unit!13211)

(assert (=> b!453225 (= e!265278 Unit!13224)))

(declare-fun b!453226 () Bool)

(assert (=> b!453226 (= e!265279 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205453) (_1!4041 (tuple2!8061 k0!794 lt!205328)))))))

(assert (= (and d!74251 c!56183) b!453224))

(assert (= (and d!74251 (not c!56183)) b!453225))

(assert (= (and d!74251 (not res!270004)) b!453226))

(declare-fun m!436879 () Bool)

(assert (=> d!74251 m!436879))

(declare-fun m!436881 () Bool)

(assert (=> b!453224 m!436881))

(assert (=> b!453224 m!436369))

(assert (=> b!453224 m!436369))

(declare-fun m!436883 () Bool)

(assert (=> b!453224 m!436883))

(assert (=> b!453226 m!436369))

(assert (=> b!453226 m!436369))

(assert (=> b!453226 m!436883))

(assert (=> d!74137 d!74251))

(declare-fun b!453229 () Bool)

(declare-fun e!265281 () Option!374)

(assert (=> b!453229 (= e!265281 (getValueByKey!368 (t!13933 lt!205450) (_1!4041 (tuple2!8061 k0!794 lt!205328))))))

(declare-fun b!453230 () Bool)

(assert (=> b!453230 (= e!265281 None!372)))

(declare-fun d!74253 () Bool)

(declare-fun c!56184 () Bool)

(assert (=> d!74253 (= c!56184 (and ((_ is Cons!8114) lt!205450) (= (_1!4041 (h!8970 lt!205450)) (_1!4041 (tuple2!8061 k0!794 lt!205328)))))))

(declare-fun e!265280 () Option!374)

(assert (=> d!74253 (= (getValueByKey!368 lt!205450 (_1!4041 (tuple2!8061 k0!794 lt!205328))) e!265280)))

(declare-fun b!453228 () Bool)

(assert (=> b!453228 (= e!265280 e!265281)))

(declare-fun c!56185 () Bool)

(assert (=> b!453228 (= c!56185 (and ((_ is Cons!8114) lt!205450) (not (= (_1!4041 (h!8970 lt!205450)) (_1!4041 (tuple2!8061 k0!794 lt!205328))))))))

(declare-fun b!453227 () Bool)

(assert (=> b!453227 (= e!265280 (Some!373 (_2!4041 (h!8970 lt!205450))))))

(assert (= (and d!74253 c!56184) b!453227))

(assert (= (and d!74253 (not c!56184)) b!453228))

(assert (= (and b!453228 c!56185) b!453229))

(assert (= (and b!453228 (not c!56185)) b!453230))

(declare-fun m!436885 () Bool)

(assert (=> b!453229 m!436885))

(assert (=> d!74137 d!74253))

(declare-fun d!74255 () Bool)

(assert (=> d!74255 (= (getValueByKey!368 lt!205450 (_1!4041 (tuple2!8061 k0!794 lt!205328))) (Some!373 (_2!4041 (tuple2!8061 k0!794 lt!205328))))))

(declare-fun lt!205615 () Unit!13211)

(assert (=> d!74255 (= lt!205615 (choose!1337 lt!205450 (_1!4041 (tuple2!8061 k0!794 lt!205328)) (_2!4041 (tuple2!8061 k0!794 lt!205328))))))

(declare-fun e!265282 () Bool)

(assert (=> d!74255 e!265282))

(declare-fun res!270005 () Bool)

(assert (=> d!74255 (=> (not res!270005) (not e!265282))))

(assert (=> d!74255 (= res!270005 (isStrictlySorted!373 lt!205450))))

(assert (=> d!74255 (= (lemmaContainsTupThenGetReturnValue!193 lt!205450 (_1!4041 (tuple2!8061 k0!794 lt!205328)) (_2!4041 (tuple2!8061 k0!794 lt!205328))) lt!205615)))

(declare-fun b!453231 () Bool)

(declare-fun res!270006 () Bool)

(assert (=> b!453231 (=> (not res!270006) (not e!265282))))

(assert (=> b!453231 (= res!270006 (containsKey!345 lt!205450 (_1!4041 (tuple2!8061 k0!794 lt!205328))))))

(declare-fun b!453232 () Bool)

(assert (=> b!453232 (= e!265282 (contains!2488 lt!205450 (tuple2!8061 (_1!4041 (tuple2!8061 k0!794 lt!205328)) (_2!4041 (tuple2!8061 k0!794 lt!205328)))))))

(assert (= (and d!74255 res!270005) b!453231))

(assert (= (and b!453231 res!270006) b!453232))

(assert (=> d!74255 m!436363))

(declare-fun m!436887 () Bool)

(assert (=> d!74255 m!436887))

(declare-fun m!436889 () Bool)

(assert (=> d!74255 m!436889))

(declare-fun m!436891 () Bool)

(assert (=> b!453231 m!436891))

(declare-fun m!436893 () Bool)

(assert (=> b!453232 m!436893))

(assert (=> d!74137 d!74255))

(declare-fun d!74257 () Bool)

(declare-fun e!265283 () Bool)

(assert (=> d!74257 e!265283))

(declare-fun res!270008 () Bool)

(assert (=> d!74257 (=> (not res!270008) (not e!265283))))

(declare-fun lt!205616 () List!8118)

(assert (=> d!74257 (= res!270008 (isStrictlySorted!373 lt!205616))))

(declare-fun e!265287 () List!8118)

(assert (=> d!74257 (= lt!205616 e!265287)))

(declare-fun c!56188 () Bool)

(assert (=> d!74257 (= c!56188 (and ((_ is Cons!8114) (toList!3497 lt!205318)) (bvslt (_1!4041 (h!8970 (toList!3497 lt!205318))) (_1!4041 (tuple2!8061 k0!794 lt!205328)))))))

(assert (=> d!74257 (isStrictlySorted!373 (toList!3497 lt!205318))))

(assert (=> d!74257 (= (insertStrictlySorted!196 (toList!3497 lt!205318) (_1!4041 (tuple2!8061 k0!794 lt!205328)) (_2!4041 (tuple2!8061 k0!794 lt!205328))) lt!205616)))

(declare-fun b!453233 () Bool)

(declare-fun call!30041 () List!8118)

(assert (=> b!453233 (= e!265287 call!30041)))

(declare-fun e!265284 () List!8118)

(declare-fun bm!30038 () Bool)

(assert (=> bm!30038 (= call!30041 ($colon$colon!108 e!265284 (ite c!56188 (h!8970 (toList!3497 lt!205318)) (tuple2!8061 (_1!4041 (tuple2!8061 k0!794 lt!205328)) (_2!4041 (tuple2!8061 k0!794 lt!205328))))))))

(declare-fun c!56186 () Bool)

(assert (=> bm!30038 (= c!56186 c!56188)))

(declare-fun b!453234 () Bool)

(declare-fun c!56187 () Bool)

(assert (=> b!453234 (= c!56187 (and ((_ is Cons!8114) (toList!3497 lt!205318)) (bvsgt (_1!4041 (h!8970 (toList!3497 lt!205318))) (_1!4041 (tuple2!8061 k0!794 lt!205328)))))))

(declare-fun e!265285 () List!8118)

(declare-fun e!265286 () List!8118)

(assert (=> b!453234 (= e!265285 e!265286)))

(declare-fun b!453235 () Bool)

(declare-fun call!30043 () List!8118)

(assert (=> b!453235 (= e!265285 call!30043)))

(declare-fun b!453236 () Bool)

(assert (=> b!453236 (= e!265287 e!265285)))

(declare-fun c!56189 () Bool)

(assert (=> b!453236 (= c!56189 (and ((_ is Cons!8114) (toList!3497 lt!205318)) (= (_1!4041 (h!8970 (toList!3497 lt!205318))) (_1!4041 (tuple2!8061 k0!794 lt!205328)))))))

(declare-fun b!453237 () Bool)

(assert (=> b!453237 (= e!265284 (ite c!56189 (t!13933 (toList!3497 lt!205318)) (ite c!56187 (Cons!8114 (h!8970 (toList!3497 lt!205318)) (t!13933 (toList!3497 lt!205318))) Nil!8115)))))

(declare-fun bm!30039 () Bool)

(assert (=> bm!30039 (= call!30043 call!30041)))

(declare-fun bm!30040 () Bool)

(declare-fun call!30042 () List!8118)

(assert (=> bm!30040 (= call!30042 call!30043)))

(declare-fun b!453238 () Bool)

(declare-fun res!270007 () Bool)

(assert (=> b!453238 (=> (not res!270007) (not e!265283))))

(assert (=> b!453238 (= res!270007 (containsKey!345 lt!205616 (_1!4041 (tuple2!8061 k0!794 lt!205328))))))

(declare-fun b!453239 () Bool)

(assert (=> b!453239 (= e!265286 call!30042)))

(declare-fun b!453240 () Bool)

(assert (=> b!453240 (= e!265286 call!30042)))

(declare-fun b!453241 () Bool)

(assert (=> b!453241 (= e!265283 (contains!2488 lt!205616 (tuple2!8061 (_1!4041 (tuple2!8061 k0!794 lt!205328)) (_2!4041 (tuple2!8061 k0!794 lt!205328)))))))

(declare-fun b!453242 () Bool)

(assert (=> b!453242 (= e!265284 (insertStrictlySorted!196 (t!13933 (toList!3497 lt!205318)) (_1!4041 (tuple2!8061 k0!794 lt!205328)) (_2!4041 (tuple2!8061 k0!794 lt!205328))))))

(assert (= (and d!74257 c!56188) b!453233))

(assert (= (and d!74257 (not c!56188)) b!453236))

(assert (= (and b!453236 c!56189) b!453235))

(assert (= (and b!453236 (not c!56189)) b!453234))

(assert (= (and b!453234 c!56187) b!453240))

(assert (= (and b!453234 (not c!56187)) b!453239))

(assert (= (or b!453240 b!453239) bm!30040))

(assert (= (or b!453235 bm!30040) bm!30039))

(assert (= (or b!453233 bm!30039) bm!30038))

(assert (= (and bm!30038 c!56186) b!453242))

(assert (= (and bm!30038 (not c!56186)) b!453237))

(assert (= (and d!74257 res!270008) b!453238))

(assert (= (and b!453238 res!270007) b!453241))

(declare-fun m!436895 () Bool)

(assert (=> b!453241 m!436895))

(declare-fun m!436897 () Bool)

(assert (=> b!453242 m!436897))

(declare-fun m!436899 () Bool)

(assert (=> d!74257 m!436899))

(declare-fun m!436901 () Bool)

(assert (=> d!74257 m!436901))

(declare-fun m!436903 () Bool)

(assert (=> b!453238 m!436903))

(declare-fun m!436905 () Bool)

(assert (=> bm!30038 m!436905))

(assert (=> d!74137 d!74257))

(declare-fun d!74259 () Bool)

(declare-fun e!265289 () Bool)

(assert (=> d!74259 e!265289))

(declare-fun res!270009 () Bool)

(assert (=> d!74259 (=> res!270009 e!265289)))

(declare-fun lt!205617 () Bool)

(assert (=> d!74259 (= res!270009 (not lt!205617))))

(declare-fun lt!205619 () Bool)

(assert (=> d!74259 (= lt!205617 lt!205619)))

(declare-fun lt!205620 () Unit!13211)

(declare-fun e!265288 () Unit!13211)

(assert (=> d!74259 (= lt!205620 e!265288)))

(declare-fun c!56190 () Bool)

(assert (=> d!74259 (= c!56190 lt!205619)))

(assert (=> d!74259 (= lt!205619 (containsKey!345 (toList!3497 lt!205418) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74259 (= (contains!2487 lt!205418 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205617)))

(declare-fun b!453243 () Bool)

(declare-fun lt!205618 () Unit!13211)

(assert (=> b!453243 (= e!265288 lt!205618)))

(assert (=> b!453243 (= lt!205618 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205418) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453243 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205418) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453244 () Bool)

(declare-fun Unit!13225 () Unit!13211)

(assert (=> b!453244 (= e!265288 Unit!13225)))

(declare-fun b!453245 () Bool)

(assert (=> b!453245 (= e!265289 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205418) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74259 c!56190) b!453243))

(assert (= (and d!74259 (not c!56190)) b!453244))

(assert (= (and d!74259 (not res!270009)) b!453245))

(declare-fun m!436907 () Bool)

(assert (=> d!74259 m!436907))

(declare-fun m!436909 () Bool)

(assert (=> b!453243 m!436909))

(declare-fun m!436911 () Bool)

(assert (=> b!453243 m!436911))

(assert (=> b!453243 m!436911))

(declare-fun m!436913 () Bool)

(assert (=> b!453243 m!436913))

(assert (=> b!453245 m!436911))

(assert (=> b!453245 m!436911))

(assert (=> b!453245 m!436913))

(assert (=> b!452938 d!74259))

(declare-fun d!74261 () Bool)

(declare-fun e!265291 () Bool)

(assert (=> d!74261 e!265291))

(declare-fun res!270010 () Bool)

(assert (=> d!74261 (=> res!270010 e!265291)))

(declare-fun lt!205621 () Bool)

(assert (=> d!74261 (= res!270010 (not lt!205621))))

(declare-fun lt!205623 () Bool)

(assert (=> d!74261 (= lt!205621 lt!205623)))

(declare-fun lt!205624 () Unit!13211)

(declare-fun e!265290 () Unit!13211)

(assert (=> d!74261 (= lt!205624 e!265290)))

(declare-fun c!56191 () Bool)

(assert (=> d!74261 (= c!56191 lt!205623)))

(assert (=> d!74261 (= lt!205623 (containsKey!345 (toList!3497 lt!205475) (select (arr!13481 lt!205321) from!863)))))

(assert (=> d!74261 (= (contains!2487 lt!205475 (select (arr!13481 lt!205321) from!863)) lt!205621)))

(declare-fun b!453246 () Bool)

(declare-fun lt!205622 () Unit!13211)

(assert (=> b!453246 (= e!265290 lt!205622)))

(assert (=> b!453246 (= lt!205622 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205475) (select (arr!13481 lt!205321) from!863)))))

(assert (=> b!453246 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205475) (select (arr!13481 lt!205321) from!863)))))

(declare-fun b!453247 () Bool)

(declare-fun Unit!13226 () Unit!13211)

(assert (=> b!453247 (= e!265290 Unit!13226)))

(declare-fun b!453248 () Bool)

(assert (=> b!453248 (= e!265291 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205475) (select (arr!13481 lt!205321) from!863))))))

(assert (= (and d!74261 c!56191) b!453246))

(assert (= (and d!74261 (not c!56191)) b!453247))

(assert (= (and d!74261 (not res!270010)) b!453248))

(assert (=> d!74261 m!436081))

(declare-fun m!436915 () Bool)

(assert (=> d!74261 m!436915))

(assert (=> b!453246 m!436081))

(declare-fun m!436917 () Bool)

(assert (=> b!453246 m!436917))

(assert (=> b!453246 m!436081))

(declare-fun m!436919 () Bool)

(assert (=> b!453246 m!436919))

(assert (=> b!453246 m!436919))

(declare-fun m!436921 () Bool)

(assert (=> b!453246 m!436921))

(assert (=> b!453248 m!436081))

(assert (=> b!453248 m!436919))

(assert (=> b!453248 m!436919))

(assert (=> b!453248 m!436921))

(assert (=> b!452999 d!74261))

(declare-fun b!453251 () Bool)

(declare-fun e!265293 () Option!374)

(assert (=> b!453251 (= e!265293 (getValueByKey!368 (t!13933 (toList!3497 lt!205493)) (_1!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun b!453252 () Bool)

(assert (=> b!453252 (= e!265293 None!372)))

(declare-fun d!74263 () Bool)

(declare-fun c!56192 () Bool)

(assert (=> d!74263 (= c!56192 (and ((_ is Cons!8114) (toList!3497 lt!205493)) (= (_1!4041 (h!8970 (toList!3497 lt!205493))) (_1!4041 (tuple2!8061 k0!794 v!412)))))))

(declare-fun e!265292 () Option!374)

(assert (=> d!74263 (= (getValueByKey!368 (toList!3497 lt!205493) (_1!4041 (tuple2!8061 k0!794 v!412))) e!265292)))

(declare-fun b!453250 () Bool)

(assert (=> b!453250 (= e!265292 e!265293)))

(declare-fun c!56193 () Bool)

(assert (=> b!453250 (= c!56193 (and ((_ is Cons!8114) (toList!3497 lt!205493)) (not (= (_1!4041 (h!8970 (toList!3497 lt!205493))) (_1!4041 (tuple2!8061 k0!794 v!412))))))))

(declare-fun b!453249 () Bool)

(assert (=> b!453249 (= e!265292 (Some!373 (_2!4041 (h!8970 (toList!3497 lt!205493)))))))

(assert (= (and d!74263 c!56192) b!453249))

(assert (= (and d!74263 (not c!56192)) b!453250))

(assert (= (and b!453250 c!56193) b!453251))

(assert (= (and b!453250 (not c!56193)) b!453252))

(declare-fun m!436923 () Bool)

(assert (=> b!453251 m!436923))

(assert (=> b!453027 d!74263))

(declare-fun d!74265 () Bool)

(declare-fun e!265295 () Bool)

(assert (=> d!74265 e!265295))

(declare-fun res!270011 () Bool)

(assert (=> d!74265 (=> res!270011 e!265295)))

(declare-fun lt!205625 () Bool)

(assert (=> d!74265 (= res!270011 (not lt!205625))))

(declare-fun lt!205627 () Bool)

(assert (=> d!74265 (= lt!205625 lt!205627)))

(declare-fun lt!205628 () Unit!13211)

(declare-fun e!265294 () Unit!13211)

(assert (=> d!74265 (= lt!205628 e!265294)))

(declare-fun c!56194 () Bool)

(assert (=> d!74265 (= c!56194 lt!205627)))

(assert (=> d!74265 (= lt!205627 (containsKey!345 (toList!3497 lt!205457) (_1!4041 (tuple2!8061 k0!794 v!412))))))

(assert (=> d!74265 (= (contains!2487 lt!205457 (_1!4041 (tuple2!8061 k0!794 v!412))) lt!205625)))

(declare-fun b!453253 () Bool)

(declare-fun lt!205626 () Unit!13211)

(assert (=> b!453253 (= e!265294 lt!205626)))

(assert (=> b!453253 (= lt!205626 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205457) (_1!4041 (tuple2!8061 k0!794 v!412))))))

(assert (=> b!453253 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205457) (_1!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun b!453254 () Bool)

(declare-fun Unit!13227 () Unit!13211)

(assert (=> b!453254 (= e!265294 Unit!13227)))

(declare-fun b!453255 () Bool)

(assert (=> b!453255 (= e!265295 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205457) (_1!4041 (tuple2!8061 k0!794 v!412)))))))

(assert (= (and d!74265 c!56194) b!453253))

(assert (= (and d!74265 (not c!56194)) b!453254))

(assert (= (and d!74265 (not res!270011)) b!453255))

(declare-fun m!436925 () Bool)

(assert (=> d!74265 m!436925))

(declare-fun m!436927 () Bool)

(assert (=> b!453253 m!436927))

(assert (=> b!453253 m!436381))

(assert (=> b!453253 m!436381))

(declare-fun m!436929 () Bool)

(assert (=> b!453253 m!436929))

(assert (=> b!453255 m!436381))

(assert (=> b!453255 m!436381))

(assert (=> b!453255 m!436929))

(assert (=> d!74139 d!74265))

(declare-fun e!265297 () Option!374)

(declare-fun b!453258 () Bool)

(assert (=> b!453258 (= e!265297 (getValueByKey!368 (t!13933 lt!205454) (_1!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun b!453259 () Bool)

(assert (=> b!453259 (= e!265297 None!372)))

(declare-fun d!74267 () Bool)

(declare-fun c!56195 () Bool)

(assert (=> d!74267 (= c!56195 (and ((_ is Cons!8114) lt!205454) (= (_1!4041 (h!8970 lt!205454)) (_1!4041 (tuple2!8061 k0!794 v!412)))))))

(declare-fun e!265296 () Option!374)

(assert (=> d!74267 (= (getValueByKey!368 lt!205454 (_1!4041 (tuple2!8061 k0!794 v!412))) e!265296)))

(declare-fun b!453257 () Bool)

(assert (=> b!453257 (= e!265296 e!265297)))

(declare-fun c!56196 () Bool)

(assert (=> b!453257 (= c!56196 (and ((_ is Cons!8114) lt!205454) (not (= (_1!4041 (h!8970 lt!205454)) (_1!4041 (tuple2!8061 k0!794 v!412))))))))

(declare-fun b!453256 () Bool)

(assert (=> b!453256 (= e!265296 (Some!373 (_2!4041 (h!8970 lt!205454))))))

(assert (= (and d!74267 c!56195) b!453256))

(assert (= (and d!74267 (not c!56195)) b!453257))

(assert (= (and b!453257 c!56196) b!453258))

(assert (= (and b!453257 (not c!56196)) b!453259))

(declare-fun m!436931 () Bool)

(assert (=> b!453258 m!436931))

(assert (=> d!74139 d!74267))

(declare-fun d!74269 () Bool)

(assert (=> d!74269 (= (getValueByKey!368 lt!205454 (_1!4041 (tuple2!8061 k0!794 v!412))) (Some!373 (_2!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun lt!205629 () Unit!13211)

(assert (=> d!74269 (= lt!205629 (choose!1337 lt!205454 (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun e!265298 () Bool)

(assert (=> d!74269 e!265298))

(declare-fun res!270012 () Bool)

(assert (=> d!74269 (=> (not res!270012) (not e!265298))))

(assert (=> d!74269 (= res!270012 (isStrictlySorted!373 lt!205454))))

(assert (=> d!74269 (= (lemmaContainsTupThenGetReturnValue!193 lt!205454 (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))) lt!205629)))

(declare-fun b!453260 () Bool)

(declare-fun res!270013 () Bool)

(assert (=> b!453260 (=> (not res!270013) (not e!265298))))

(assert (=> b!453260 (= res!270013 (containsKey!345 lt!205454 (_1!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun b!453261 () Bool)

(assert (=> b!453261 (= e!265298 (contains!2488 lt!205454 (tuple2!8061 (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412)))))))

(assert (= (and d!74269 res!270012) b!453260))

(assert (= (and b!453260 res!270013) b!453261))

(assert (=> d!74269 m!436375))

(declare-fun m!436933 () Bool)

(assert (=> d!74269 m!436933))

(declare-fun m!436935 () Bool)

(assert (=> d!74269 m!436935))

(declare-fun m!436937 () Bool)

(assert (=> b!453260 m!436937))

(declare-fun m!436939 () Bool)

(assert (=> b!453261 m!436939))

(assert (=> d!74139 d!74269))

(declare-fun d!74271 () Bool)

(declare-fun e!265299 () Bool)

(assert (=> d!74271 e!265299))

(declare-fun res!270015 () Bool)

(assert (=> d!74271 (=> (not res!270015) (not e!265299))))

(declare-fun lt!205630 () List!8118)

(assert (=> d!74271 (= res!270015 (isStrictlySorted!373 lt!205630))))

(declare-fun e!265303 () List!8118)

(assert (=> d!74271 (= lt!205630 e!265303)))

(declare-fun c!56199 () Bool)

(assert (=> d!74271 (= c!56199 (and ((_ is Cons!8114) (toList!3497 lt!205327)) (bvslt (_1!4041 (h!8970 (toList!3497 lt!205327))) (_1!4041 (tuple2!8061 k0!794 v!412)))))))

(assert (=> d!74271 (isStrictlySorted!373 (toList!3497 lt!205327))))

(assert (=> d!74271 (= (insertStrictlySorted!196 (toList!3497 lt!205327) (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))) lt!205630)))

(declare-fun b!453262 () Bool)

(declare-fun call!30044 () List!8118)

(assert (=> b!453262 (= e!265303 call!30044)))

(declare-fun bm!30041 () Bool)

(declare-fun e!265300 () List!8118)

(assert (=> bm!30041 (= call!30044 ($colon$colon!108 e!265300 (ite c!56199 (h!8970 (toList!3497 lt!205327)) (tuple2!8061 (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))))))))

(declare-fun c!56197 () Bool)

(assert (=> bm!30041 (= c!56197 c!56199)))

(declare-fun b!453263 () Bool)

(declare-fun c!56198 () Bool)

(assert (=> b!453263 (= c!56198 (and ((_ is Cons!8114) (toList!3497 lt!205327)) (bvsgt (_1!4041 (h!8970 (toList!3497 lt!205327))) (_1!4041 (tuple2!8061 k0!794 v!412)))))))

(declare-fun e!265301 () List!8118)

(declare-fun e!265302 () List!8118)

(assert (=> b!453263 (= e!265301 e!265302)))

(declare-fun b!453264 () Bool)

(declare-fun call!30046 () List!8118)

(assert (=> b!453264 (= e!265301 call!30046)))

(declare-fun b!453265 () Bool)

(assert (=> b!453265 (= e!265303 e!265301)))

(declare-fun c!56200 () Bool)

(assert (=> b!453265 (= c!56200 (and ((_ is Cons!8114) (toList!3497 lt!205327)) (= (_1!4041 (h!8970 (toList!3497 lt!205327))) (_1!4041 (tuple2!8061 k0!794 v!412)))))))

(declare-fun b!453266 () Bool)

(assert (=> b!453266 (= e!265300 (ite c!56200 (t!13933 (toList!3497 lt!205327)) (ite c!56198 (Cons!8114 (h!8970 (toList!3497 lt!205327)) (t!13933 (toList!3497 lt!205327))) Nil!8115)))))

(declare-fun bm!30042 () Bool)

(assert (=> bm!30042 (= call!30046 call!30044)))

(declare-fun bm!30043 () Bool)

(declare-fun call!30045 () List!8118)

(assert (=> bm!30043 (= call!30045 call!30046)))

(declare-fun b!453267 () Bool)

(declare-fun res!270014 () Bool)

(assert (=> b!453267 (=> (not res!270014) (not e!265299))))

(assert (=> b!453267 (= res!270014 (containsKey!345 lt!205630 (_1!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun b!453268 () Bool)

(assert (=> b!453268 (= e!265302 call!30045)))

(declare-fun b!453269 () Bool)

(assert (=> b!453269 (= e!265302 call!30045)))

(declare-fun b!453270 () Bool)

(assert (=> b!453270 (= e!265299 (contains!2488 lt!205630 (tuple2!8061 (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412)))))))

(declare-fun b!453271 () Bool)

(assert (=> b!453271 (= e!265300 (insertStrictlySorted!196 (t!13933 (toList!3497 lt!205327)) (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))))))

(assert (= (and d!74271 c!56199) b!453262))

(assert (= (and d!74271 (not c!56199)) b!453265))

(assert (= (and b!453265 c!56200) b!453264))

(assert (= (and b!453265 (not c!56200)) b!453263))

(assert (= (and b!453263 c!56198) b!453269))

(assert (= (and b!453263 (not c!56198)) b!453268))

(assert (= (or b!453269 b!453268) bm!30043))

(assert (= (or b!453264 bm!30043) bm!30042))

(assert (= (or b!453262 bm!30042) bm!30041))

(assert (= (and bm!30041 c!56197) b!453271))

(assert (= (and bm!30041 (not c!56197)) b!453266))

(assert (= (and d!74271 res!270015) b!453267))

(assert (= (and b!453267 res!270014) b!453270))

(declare-fun m!436941 () Bool)

(assert (=> b!453270 m!436941))

(declare-fun m!436943 () Bool)

(assert (=> b!453271 m!436943))

(declare-fun m!436945 () Bool)

(assert (=> d!74271 m!436945))

(declare-fun m!436947 () Bool)

(assert (=> d!74271 m!436947))

(declare-fun m!436949 () Bool)

(assert (=> b!453267 m!436949))

(declare-fun m!436951 () Bool)

(assert (=> bm!30041 m!436951))

(assert (=> d!74139 d!74271))

(declare-fun d!74273 () Bool)

(declare-fun e!265304 () Bool)

(assert (=> d!74273 e!265304))

(declare-fun res!270017 () Bool)

(assert (=> d!74273 (=> (not res!270017) (not e!265304))))

(declare-fun lt!205634 () ListLongMap!6963)

(assert (=> d!74273 (= res!270017 (contains!2487 lt!205634 (_1!4041 (tuple2!8061 k0!794 lt!205320))))))

(declare-fun lt!205631 () List!8118)

(assert (=> d!74273 (= lt!205634 (ListLongMap!6964 lt!205631))))

(declare-fun lt!205633 () Unit!13211)

(declare-fun lt!205632 () Unit!13211)

(assert (=> d!74273 (= lt!205633 lt!205632)))

(assert (=> d!74273 (= (getValueByKey!368 lt!205631 (_1!4041 (tuple2!8061 k0!794 lt!205320))) (Some!373 (_2!4041 (tuple2!8061 k0!794 lt!205320))))))

(assert (=> d!74273 (= lt!205632 (lemmaContainsTupThenGetReturnValue!193 lt!205631 (_1!4041 (tuple2!8061 k0!794 lt!205320)) (_2!4041 (tuple2!8061 k0!794 lt!205320))))))

(assert (=> d!74273 (= lt!205631 (insertStrictlySorted!196 (toList!3497 lt!205318) (_1!4041 (tuple2!8061 k0!794 lt!205320)) (_2!4041 (tuple2!8061 k0!794 lt!205320))))))

(assert (=> d!74273 (= (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205320)) lt!205634)))

(declare-fun b!453272 () Bool)

(declare-fun res!270016 () Bool)

(assert (=> b!453272 (=> (not res!270016) (not e!265304))))

(assert (=> b!453272 (= res!270016 (= (getValueByKey!368 (toList!3497 lt!205634) (_1!4041 (tuple2!8061 k0!794 lt!205320))) (Some!373 (_2!4041 (tuple2!8061 k0!794 lt!205320)))))))

(declare-fun b!453273 () Bool)

(assert (=> b!453273 (= e!265304 (contains!2488 (toList!3497 lt!205634) (tuple2!8061 k0!794 lt!205320)))))

(assert (= (and d!74273 res!270017) b!453272))

(assert (= (and b!453272 res!270016) b!453273))

(declare-fun m!436953 () Bool)

(assert (=> d!74273 m!436953))

(declare-fun m!436955 () Bool)

(assert (=> d!74273 m!436955))

(declare-fun m!436957 () Bool)

(assert (=> d!74273 m!436957))

(declare-fun m!436959 () Bool)

(assert (=> d!74273 m!436959))

(declare-fun m!436961 () Bool)

(assert (=> b!453272 m!436961))

(declare-fun m!436963 () Bool)

(assert (=> b!453273 m!436963))

(assert (=> d!74133 d!74273))

(declare-fun d!74275 () Bool)

(declare-fun e!265305 () Bool)

(assert (=> d!74275 e!265305))

(declare-fun res!270019 () Bool)

(assert (=> d!74275 (=> (not res!270019) (not e!265305))))

(declare-fun lt!205638 () ListLongMap!6963)

(assert (=> d!74275 (= res!270019 (contains!2487 lt!205638 (_1!4041 (tuple2!8061 k0!794 lt!205320))))))

(declare-fun lt!205635 () List!8118)

(assert (=> d!74275 (= lt!205638 (ListLongMap!6964 lt!205635))))

(declare-fun lt!205637 () Unit!13211)

(declare-fun lt!205636 () Unit!13211)

(assert (=> d!74275 (= lt!205637 lt!205636)))

(assert (=> d!74275 (= (getValueByKey!368 lt!205635 (_1!4041 (tuple2!8061 k0!794 lt!205320))) (Some!373 (_2!4041 (tuple2!8061 k0!794 lt!205320))))))

(assert (=> d!74275 (= lt!205636 (lemmaContainsTupThenGetReturnValue!193 lt!205635 (_1!4041 (tuple2!8061 k0!794 lt!205320)) (_2!4041 (tuple2!8061 k0!794 lt!205320))))))

(assert (=> d!74275 (= lt!205635 (insertStrictlySorted!196 (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328))) (_1!4041 (tuple2!8061 k0!794 lt!205320)) (_2!4041 (tuple2!8061 k0!794 lt!205320))))))

(assert (=> d!74275 (= (+!1594 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328)) (tuple2!8061 k0!794 lt!205320)) lt!205638)))

(declare-fun b!453274 () Bool)

(declare-fun res!270018 () Bool)

(assert (=> b!453274 (=> (not res!270018) (not e!265305))))

(assert (=> b!453274 (= res!270018 (= (getValueByKey!368 (toList!3497 lt!205638) (_1!4041 (tuple2!8061 k0!794 lt!205320))) (Some!373 (_2!4041 (tuple2!8061 k0!794 lt!205320)))))))

(declare-fun b!453275 () Bool)

(assert (=> b!453275 (= e!265305 (contains!2488 (toList!3497 lt!205638) (tuple2!8061 k0!794 lt!205320)))))

(assert (= (and d!74275 res!270019) b!453274))

(assert (= (and b!453274 res!270018) b!453275))

(declare-fun m!436965 () Bool)

(assert (=> d!74275 m!436965))

(declare-fun m!436967 () Bool)

(assert (=> d!74275 m!436967))

(declare-fun m!436969 () Bool)

(assert (=> d!74275 m!436969))

(declare-fun m!436971 () Bool)

(assert (=> d!74275 m!436971))

(declare-fun m!436973 () Bool)

(assert (=> b!453274 m!436973))

(declare-fun m!436975 () Bool)

(assert (=> b!453275 m!436975))

(assert (=> d!74133 d!74275))

(assert (=> d!74133 d!74137))

(declare-fun d!74277 () Bool)

(assert (=> d!74277 (= (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205320)) (+!1594 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328)) (tuple2!8061 k0!794 lt!205320)))))

(assert (=> d!74277 true))

(declare-fun _$24!42 () Unit!13211)

(assert (=> d!74277 (= (choose!1335 lt!205318 k0!794 lt!205328 lt!205320) _$24!42)))

(declare-fun bs!14375 () Bool)

(assert (= bs!14375 d!74277))

(assert (=> bs!14375 m!436343))

(assert (=> bs!14375 m!436079))

(assert (=> bs!14375 m!436079))

(assert (=> bs!14375 m!436345))

(assert (=> d!74133 d!74277))

(assert (=> bm!30007 d!74245))

(declare-fun d!74279 () Bool)

(declare-fun e!265307 () Bool)

(assert (=> d!74279 e!265307))

(declare-fun res!270020 () Bool)

(assert (=> d!74279 (=> res!270020 e!265307)))

(declare-fun lt!205639 () Bool)

(assert (=> d!74279 (= res!270020 (not lt!205639))))

(declare-fun lt!205641 () Bool)

(assert (=> d!74279 (= lt!205639 lt!205641)))

(declare-fun lt!205642 () Unit!13211)

(declare-fun e!265306 () Unit!13211)

(assert (=> d!74279 (= lt!205642 e!265306)))

(declare-fun c!56201 () Bool)

(assert (=> d!74279 (= c!56201 lt!205641)))

(assert (=> d!74279 (= lt!205641 (containsKey!345 (toList!3497 lt!205464) (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> d!74279 (= (contains!2487 lt!205464 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863))) lt!205639)))

(declare-fun b!453276 () Bool)

(declare-fun lt!205640 () Unit!13211)

(assert (=> b!453276 (= e!265306 lt!205640)))

(assert (=> b!453276 (= lt!205640 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205464) (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453276 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205464) (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453277 () Bool)

(declare-fun Unit!13228 () Unit!13211)

(assert (=> b!453277 (= e!265306 Unit!13228)))

(declare-fun b!453278 () Bool)

(assert (=> b!453278 (= e!265307 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205464) (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)))))))

(assert (= (and d!74279 c!56201) b!453276))

(assert (= (and d!74279 (not c!56201)) b!453277))

(assert (= (and d!74279 (not res!270020)) b!453278))

(assert (=> d!74279 m!436401))

(declare-fun m!436977 () Bool)

(assert (=> d!74279 m!436977))

(assert (=> b!453276 m!436401))

(declare-fun m!436979 () Bool)

(assert (=> b!453276 m!436979))

(assert (=> b!453276 m!436401))

(assert (=> b!453276 m!436565))

(assert (=> b!453276 m!436565))

(declare-fun m!436981 () Bool)

(assert (=> b!453276 m!436981))

(assert (=> b!453278 m!436401))

(assert (=> b!453278 m!436565))

(assert (=> b!453278 m!436565))

(assert (=> b!453278 m!436981))

(assert (=> b!452978 d!74279))

(declare-fun b!453281 () Bool)

(declare-fun e!265309 () Option!374)

(assert (=> b!453281 (= e!265309 (getValueByKey!368 (t!13933 (toList!3497 lt!205453)) (_1!4041 (tuple2!8061 k0!794 lt!205328))))))

(declare-fun b!453282 () Bool)

(assert (=> b!453282 (= e!265309 None!372)))

(declare-fun c!56202 () Bool)

(declare-fun d!74281 () Bool)

(assert (=> d!74281 (= c!56202 (and ((_ is Cons!8114) (toList!3497 lt!205453)) (= (_1!4041 (h!8970 (toList!3497 lt!205453))) (_1!4041 (tuple2!8061 k0!794 lt!205328)))))))

(declare-fun e!265308 () Option!374)

(assert (=> d!74281 (= (getValueByKey!368 (toList!3497 lt!205453) (_1!4041 (tuple2!8061 k0!794 lt!205328))) e!265308)))

(declare-fun b!453280 () Bool)

(assert (=> b!453280 (= e!265308 e!265309)))

(declare-fun c!56203 () Bool)

(assert (=> b!453280 (= c!56203 (and ((_ is Cons!8114) (toList!3497 lt!205453)) (not (= (_1!4041 (h!8970 (toList!3497 lt!205453))) (_1!4041 (tuple2!8061 k0!794 lt!205328))))))))

(declare-fun b!453279 () Bool)

(assert (=> b!453279 (= e!265308 (Some!373 (_2!4041 (h!8970 (toList!3497 lt!205453)))))))

(assert (= (and d!74281 c!56202) b!453279))

(assert (= (and d!74281 (not c!56202)) b!453280))

(assert (= (and b!453280 c!56203) b!453281))

(assert (= (and b!453280 (not c!56203)) b!453282))

(declare-fun m!436983 () Bool)

(assert (=> b!453281 m!436983))

(assert (=> b!452966 d!74281))

(declare-fun d!74283 () Bool)

(assert (=> d!74283 (= (validKeyInArray!0 (select (arr!13481 lt!205321) from!863)) (and (not (= (select (arr!13481 lt!205321) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 lt!205321) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!453007 d!74283))

(declare-fun e!265311 () Option!374)

(declare-fun b!453285 () Bool)

(assert (=> b!453285 (= e!265311 (getValueByKey!368 (t!13933 (toList!3497 lt!205457)) (_1!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun b!453286 () Bool)

(assert (=> b!453286 (= e!265311 None!372)))

(declare-fun c!56204 () Bool)

(declare-fun d!74285 () Bool)

(assert (=> d!74285 (= c!56204 (and ((_ is Cons!8114) (toList!3497 lt!205457)) (= (_1!4041 (h!8970 (toList!3497 lt!205457))) (_1!4041 (tuple2!8061 k0!794 v!412)))))))

(declare-fun e!265310 () Option!374)

(assert (=> d!74285 (= (getValueByKey!368 (toList!3497 lt!205457) (_1!4041 (tuple2!8061 k0!794 v!412))) e!265310)))

(declare-fun b!453284 () Bool)

(assert (=> b!453284 (= e!265310 e!265311)))

(declare-fun c!56205 () Bool)

(assert (=> b!453284 (= c!56205 (and ((_ is Cons!8114) (toList!3497 lt!205457)) (not (= (_1!4041 (h!8970 (toList!3497 lt!205457))) (_1!4041 (tuple2!8061 k0!794 v!412))))))))

(declare-fun b!453283 () Bool)

(assert (=> b!453283 (= e!265310 (Some!373 (_2!4041 (h!8970 (toList!3497 lt!205457)))))))

(assert (= (and d!74285 c!56204) b!453283))

(assert (= (and d!74285 (not c!56204)) b!453284))

(assert (= (and b!453284 c!56205) b!453285))

(assert (= (and b!453284 (not c!56205)) b!453286))

(declare-fun m!436985 () Bool)

(assert (=> b!453285 m!436985))

(assert (=> b!452968 d!74285))

(declare-fun d!74287 () Bool)

(assert (=> d!74287 (= (validKeyInArray!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)) (and (not (= (select (arr!13481 _keys!709) #b00000000000000000000000000000000) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 _keys!709) #b00000000000000000000000000000000) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!452959 d!74287))

(declare-fun d!74289 () Bool)

(declare-fun e!265313 () Bool)

(assert (=> d!74289 e!265313))

(declare-fun res!270021 () Bool)

(assert (=> d!74289 (=> res!270021 e!265313)))

(declare-fun lt!205643 () Bool)

(assert (=> d!74289 (= res!270021 (not lt!205643))))

(declare-fun lt!205645 () Bool)

(assert (=> d!74289 (= lt!205643 lt!205645)))

(declare-fun lt!205646 () Unit!13211)

(declare-fun e!265312 () Unit!13211)

(assert (=> d!74289 (= lt!205646 e!265312)))

(declare-fun c!56206 () Bool)

(assert (=> d!74289 (= c!56206 lt!205645)))

(assert (=> d!74289 (= lt!205645 (containsKey!345 (toList!3497 lt!205418) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74289 (= (contains!2487 lt!205418 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205643)))

(declare-fun b!453287 () Bool)

(declare-fun lt!205644 () Unit!13211)

(assert (=> b!453287 (= e!265312 lt!205644)))

(assert (=> b!453287 (= lt!205644 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205418) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453287 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205418) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453288 () Bool)

(declare-fun Unit!13229 () Unit!13211)

(assert (=> b!453288 (= e!265312 Unit!13229)))

(declare-fun b!453289 () Bool)

(assert (=> b!453289 (= e!265313 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205418) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74289 c!56206) b!453287))

(assert (= (and d!74289 (not c!56206)) b!453288))

(assert (= (and d!74289 (not res!270021)) b!453289))

(declare-fun m!436987 () Bool)

(assert (=> d!74289 m!436987))

(declare-fun m!436989 () Bool)

(assert (=> b!453287 m!436989))

(declare-fun m!436991 () Bool)

(assert (=> b!453287 m!436991))

(assert (=> b!453287 m!436991))

(declare-fun m!436993 () Bool)

(assert (=> b!453287 m!436993))

(assert (=> b!453289 m!436991))

(assert (=> b!453289 m!436991))

(assert (=> b!453289 m!436993))

(assert (=> d!74123 d!74289))

(assert (=> d!74123 d!74155))

(declare-fun d!74291 () Bool)

(declare-fun c!56207 () Bool)

(assert (=> d!74291 (= c!56207 ((_ is ValueCellFull!5726) (select (arr!13482 lt!205322) from!863)))))

(declare-fun e!265314 () V!17291)

(assert (=> d!74291 (= (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!265314)))

(declare-fun b!453290 () Bool)

(assert (=> b!453290 (= e!265314 (get!6653 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!453291 () Bool)

(assert (=> b!453291 (= e!265314 (get!6654 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74291 c!56207) b!453290))

(assert (= (and d!74291 (not c!56207)) b!453291))

(assert (=> b!453290 m!436451))

(assert (=> b!453290 m!436071))

(declare-fun m!436995 () Bool)

(assert (=> b!453290 m!436995))

(assert (=> b!453291 m!436451))

(assert (=> b!453291 m!436071))

(declare-fun m!436997 () Bool)

(assert (=> b!453291 m!436997))

(assert (=> b!453003 d!74291))

(declare-fun d!74293 () Bool)

(assert (=> d!74293 (not (contains!2487 (+!1594 lt!205478 (tuple2!8061 lt!205474 lt!205473)) lt!205476))))

(declare-fun lt!205647 () Unit!13211)

(assert (=> d!74293 (= lt!205647 (choose!1336 lt!205478 lt!205474 lt!205473 lt!205476))))

(declare-fun e!265315 () Bool)

(assert (=> d!74293 e!265315))

(declare-fun res!270022 () Bool)

(assert (=> d!74293 (=> (not res!270022) (not e!265315))))

(assert (=> d!74293 (= res!270022 (not (contains!2487 lt!205478 lt!205476)))))

(assert (=> d!74293 (= (addStillNotContains!147 lt!205478 lt!205474 lt!205473 lt!205476) lt!205647)))

(declare-fun b!453292 () Bool)

(assert (=> b!453292 (= e!265315 (not (= lt!205474 lt!205476)))))

(assert (= (and d!74293 res!270022) b!453292))

(assert (=> d!74293 m!436467))

(assert (=> d!74293 m!436467))

(assert (=> d!74293 m!436473))

(declare-fun m!436999 () Bool)

(assert (=> d!74293 m!436999))

(declare-fun m!437001 () Bool)

(assert (=> d!74293 m!437001))

(assert (=> b!453003 d!74293))

(declare-fun d!74295 () Bool)

(declare-fun e!265316 () Bool)

(assert (=> d!74295 e!265316))

(declare-fun res!270024 () Bool)

(assert (=> d!74295 (=> (not res!270024) (not e!265316))))

(declare-fun lt!205651 () ListLongMap!6963)

(assert (=> d!74295 (= res!270024 (contains!2487 lt!205651 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205648 () List!8118)

(assert (=> d!74295 (= lt!205651 (ListLongMap!6964 lt!205648))))

(declare-fun lt!205650 () Unit!13211)

(declare-fun lt!205649 () Unit!13211)

(assert (=> d!74295 (= lt!205650 lt!205649)))

(assert (=> d!74295 (= (getValueByKey!368 lt!205648 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!373 (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74295 (= lt!205649 (lemmaContainsTupThenGetReturnValue!193 lt!205648 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74295 (= lt!205648 (insertStrictlySorted!196 (toList!3497 call!30023) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74295 (= (+!1594 call!30023 (tuple2!8061 (select (arr!13481 lt!205321) from!863) (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205651)))

(declare-fun b!453293 () Bool)

(declare-fun res!270023 () Bool)

(assert (=> b!453293 (=> (not res!270023) (not e!265316))))

(assert (=> b!453293 (= res!270023 (= (getValueByKey!368 (toList!3497 lt!205651) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!373 (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453294 () Bool)

(assert (=> b!453294 (= e!265316 (contains!2488 (toList!3497 lt!205651) (tuple2!8061 (select (arr!13481 lt!205321) from!863) (get!6650 (select (arr!13482 lt!205322) from!863) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74295 res!270024) b!453293))

(assert (= (and b!453293 res!270023) b!453294))

(declare-fun m!437003 () Bool)

(assert (=> d!74295 m!437003))

(declare-fun m!437005 () Bool)

(assert (=> d!74295 m!437005))

(declare-fun m!437007 () Bool)

(assert (=> d!74295 m!437007))

(declare-fun m!437009 () Bool)

(assert (=> d!74295 m!437009))

(declare-fun m!437011 () Bool)

(assert (=> b!453293 m!437011))

(declare-fun m!437013 () Bool)

(assert (=> b!453294 m!437013))

(assert (=> b!453003 d!74295))

(declare-fun d!74297 () Bool)

(declare-fun e!265317 () Bool)

(assert (=> d!74297 e!265317))

(declare-fun res!270026 () Bool)

(assert (=> d!74297 (=> (not res!270026) (not e!265317))))

(declare-fun lt!205655 () ListLongMap!6963)

(assert (=> d!74297 (= res!270026 (contains!2487 lt!205655 (_1!4041 (tuple2!8061 lt!205474 lt!205473))))))

(declare-fun lt!205652 () List!8118)

(assert (=> d!74297 (= lt!205655 (ListLongMap!6964 lt!205652))))

(declare-fun lt!205654 () Unit!13211)

(declare-fun lt!205653 () Unit!13211)

(assert (=> d!74297 (= lt!205654 lt!205653)))

(assert (=> d!74297 (= (getValueByKey!368 lt!205652 (_1!4041 (tuple2!8061 lt!205474 lt!205473))) (Some!373 (_2!4041 (tuple2!8061 lt!205474 lt!205473))))))

(assert (=> d!74297 (= lt!205653 (lemmaContainsTupThenGetReturnValue!193 lt!205652 (_1!4041 (tuple2!8061 lt!205474 lt!205473)) (_2!4041 (tuple2!8061 lt!205474 lt!205473))))))

(assert (=> d!74297 (= lt!205652 (insertStrictlySorted!196 (toList!3497 lt!205478) (_1!4041 (tuple2!8061 lt!205474 lt!205473)) (_2!4041 (tuple2!8061 lt!205474 lt!205473))))))

(assert (=> d!74297 (= (+!1594 lt!205478 (tuple2!8061 lt!205474 lt!205473)) lt!205655)))

(declare-fun b!453295 () Bool)

(declare-fun res!270025 () Bool)

(assert (=> b!453295 (=> (not res!270025) (not e!265317))))

(assert (=> b!453295 (= res!270025 (= (getValueByKey!368 (toList!3497 lt!205655) (_1!4041 (tuple2!8061 lt!205474 lt!205473))) (Some!373 (_2!4041 (tuple2!8061 lt!205474 lt!205473)))))))

(declare-fun b!453296 () Bool)

(assert (=> b!453296 (= e!265317 (contains!2488 (toList!3497 lt!205655) (tuple2!8061 lt!205474 lt!205473)))))

(assert (= (and d!74297 res!270026) b!453295))

(assert (= (and b!453295 res!270025) b!453296))

(declare-fun m!437015 () Bool)

(assert (=> d!74297 m!437015))

(declare-fun m!437017 () Bool)

(assert (=> d!74297 m!437017))

(declare-fun m!437019 () Bool)

(assert (=> d!74297 m!437019))

(declare-fun m!437021 () Bool)

(assert (=> d!74297 m!437021))

(declare-fun m!437023 () Bool)

(assert (=> b!453295 m!437023))

(declare-fun m!437025 () Bool)

(assert (=> b!453296 m!437025))

(assert (=> b!453003 d!74297))

(declare-fun d!74299 () Bool)

(declare-fun e!265319 () Bool)

(assert (=> d!74299 e!265319))

(declare-fun res!270027 () Bool)

(assert (=> d!74299 (=> res!270027 e!265319)))

(declare-fun lt!205656 () Bool)

(assert (=> d!74299 (= res!270027 (not lt!205656))))

(declare-fun lt!205658 () Bool)

(assert (=> d!74299 (= lt!205656 lt!205658)))

(declare-fun lt!205659 () Unit!13211)

(declare-fun e!265318 () Unit!13211)

(assert (=> d!74299 (= lt!205659 e!265318)))

(declare-fun c!56208 () Bool)

(assert (=> d!74299 (= c!56208 lt!205658)))

(assert (=> d!74299 (= lt!205658 (containsKey!345 (toList!3497 (+!1594 lt!205478 (tuple2!8061 lt!205474 lt!205473))) lt!205476))))

(assert (=> d!74299 (= (contains!2487 (+!1594 lt!205478 (tuple2!8061 lt!205474 lt!205473)) lt!205476) lt!205656)))

(declare-fun b!453297 () Bool)

(declare-fun lt!205657 () Unit!13211)

(assert (=> b!453297 (= e!265318 lt!205657)))

(assert (=> b!453297 (= lt!205657 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 (+!1594 lt!205478 (tuple2!8061 lt!205474 lt!205473))) lt!205476))))

(assert (=> b!453297 (isDefined!295 (getValueByKey!368 (toList!3497 (+!1594 lt!205478 (tuple2!8061 lt!205474 lt!205473))) lt!205476))))

(declare-fun b!453298 () Bool)

(declare-fun Unit!13230 () Unit!13211)

(assert (=> b!453298 (= e!265318 Unit!13230)))

(declare-fun b!453299 () Bool)

(assert (=> b!453299 (= e!265319 (isDefined!295 (getValueByKey!368 (toList!3497 (+!1594 lt!205478 (tuple2!8061 lt!205474 lt!205473))) lt!205476)))))

(assert (= (and d!74299 c!56208) b!453297))

(assert (= (and d!74299 (not c!56208)) b!453298))

(assert (= (and d!74299 (not res!270027)) b!453299))

(declare-fun m!437027 () Bool)

(assert (=> d!74299 m!437027))

(declare-fun m!437029 () Bool)

(assert (=> b!453297 m!437029))

(declare-fun m!437031 () Bool)

(assert (=> b!453297 m!437031))

(assert (=> b!453297 m!437031))

(declare-fun m!437033 () Bool)

(assert (=> b!453297 m!437033))

(assert (=> b!453299 m!437031))

(assert (=> b!453299 m!437031))

(assert (=> b!453299 m!437033))

(assert (=> b!453003 d!74299))

(declare-fun d!74301 () Bool)

(assert (=> d!74301 (= (validKeyInArray!0 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863))) (and (not (= (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!452923 d!74301))

(declare-fun d!74303 () Bool)

(declare-fun e!265321 () Bool)

(assert (=> d!74303 e!265321))

(declare-fun res!270028 () Bool)

(assert (=> d!74303 (=> res!270028 e!265321)))

(declare-fun lt!205660 () Bool)

(assert (=> d!74303 (= res!270028 (not lt!205660))))

(declare-fun lt!205662 () Bool)

(assert (=> d!74303 (= lt!205660 lt!205662)))

(declare-fun lt!205663 () Unit!13211)

(declare-fun e!265320 () Unit!13211)

(assert (=> d!74303 (= lt!205663 e!265320)))

(declare-fun c!56209 () Bool)

(assert (=> d!74303 (= c!56209 lt!205662)))

(assert (=> d!74303 (= lt!205662 (containsKey!345 (toList!3497 lt!205482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74303 (= (contains!2487 lt!205482 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205660)))

(declare-fun b!453300 () Bool)

(declare-fun lt!205661 () Unit!13211)

(assert (=> b!453300 (= e!265320 lt!205661)))

(assert (=> b!453300 (= lt!205661 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453300 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205482) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453301 () Bool)

(declare-fun Unit!13231 () Unit!13211)

(assert (=> b!453301 (= e!265320 Unit!13231)))

(declare-fun b!453302 () Bool)

(assert (=> b!453302 (= e!265321 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205482) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74303 c!56209) b!453300))

(assert (= (and d!74303 (not c!56209)) b!453301))

(assert (= (and d!74303 (not res!270028)) b!453302))

(declare-fun m!437035 () Bool)

(assert (=> d!74303 m!437035))

(declare-fun m!437037 () Bool)

(assert (=> b!453300 m!437037))

(declare-fun m!437039 () Bool)

(assert (=> b!453300 m!437039))

(assert (=> b!453300 m!437039))

(declare-fun m!437041 () Bool)

(assert (=> b!453300 m!437041))

(assert (=> b!453302 m!437039))

(assert (=> b!453302 m!437039))

(assert (=> b!453302 m!437041))

(assert (=> d!74161 d!74303))

(assert (=> d!74161 d!74155))

(declare-fun b!453305 () Bool)

(declare-fun e!265323 () Option!374)

(assert (=> b!453305 (= e!265323 (getValueByKey!368 (t!13933 (toList!3497 lt!205449)) (_1!4041 lt!205326)))))

(declare-fun b!453306 () Bool)

(assert (=> b!453306 (= e!265323 None!372)))

(declare-fun d!74305 () Bool)

(declare-fun c!56210 () Bool)

(assert (=> d!74305 (= c!56210 (and ((_ is Cons!8114) (toList!3497 lt!205449)) (= (_1!4041 (h!8970 (toList!3497 lt!205449))) (_1!4041 lt!205326))))))

(declare-fun e!265322 () Option!374)

(assert (=> d!74305 (= (getValueByKey!368 (toList!3497 lt!205449) (_1!4041 lt!205326)) e!265322)))

(declare-fun b!453304 () Bool)

(assert (=> b!453304 (= e!265322 e!265323)))

(declare-fun c!56211 () Bool)

(assert (=> b!453304 (= c!56211 (and ((_ is Cons!8114) (toList!3497 lt!205449)) (not (= (_1!4041 (h!8970 (toList!3497 lt!205449))) (_1!4041 lt!205326)))))))

(declare-fun b!453303 () Bool)

(assert (=> b!453303 (= e!265322 (Some!373 (_2!4041 (h!8970 (toList!3497 lt!205449)))))))

(assert (= (and d!74305 c!56210) b!453303))

(assert (= (and d!74305 (not c!56210)) b!453304))

(assert (= (and b!453304 c!56211) b!453305))

(assert (= (and b!453304 (not c!56211)) b!453306))

(declare-fun m!437043 () Bool)

(assert (=> b!453305 m!437043))

(assert (=> b!452964 d!74305))

(declare-fun b!453307 () Bool)

(declare-fun e!265324 () Bool)

(declare-fun e!265330 () Bool)

(assert (=> b!453307 (= e!265324 e!265330)))

(assert (=> b!453307 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709)))))))

(declare-fun lt!205666 () ListLongMap!6963)

(declare-fun res!270029 () Bool)

(assert (=> b!453307 (= res!270029 (contains!2487 lt!205666 (select (arr!13481 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453307 (=> (not res!270029) (not e!265330))))

(declare-fun b!453308 () Bool)

(declare-fun e!265326 () ListLongMap!6963)

(assert (=> b!453308 (= e!265326 (ListLongMap!6964 Nil!8115))))

(declare-fun d!74307 () Bool)

(declare-fun e!265328 () Bool)

(assert (=> d!74307 e!265328))

(declare-fun res!270032 () Bool)

(assert (=> d!74307 (=> (not res!270032) (not e!265328))))

(assert (=> d!74307 (= res!270032 (not (contains!2487 lt!205666 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74307 (= lt!205666 e!265326)))

(declare-fun c!56215 () Bool)

(assert (=> d!74307 (= c!56215 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709)))))))

(assert (=> d!74307 (validMask!0 mask!1025)))

(assert (=> d!74307 (= (getCurrentListMapNoExtraKeys!1692 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709)) (array!28076 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13835 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!205666)))

(declare-fun b!453309 () Bool)

(declare-fun e!265325 () Bool)

(assert (=> b!453309 (= e!265325 (= lt!205666 (getCurrentListMapNoExtraKeys!1692 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709)) (array!28076 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13835 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!453310 () Bool)

(assert (=> b!453310 (= e!265325 (isEmpty!563 lt!205666))))

(declare-fun b!453311 () Bool)

(declare-fun lt!205668 () Unit!13211)

(declare-fun lt!205670 () Unit!13211)

(assert (=> b!453311 (= lt!205668 lt!205670)))

(declare-fun lt!205665 () (_ BitVec 64))

(declare-fun lt!205664 () V!17291)

(declare-fun lt!205667 () (_ BitVec 64))

(declare-fun lt!205669 () ListLongMap!6963)

(assert (=> b!453311 (not (contains!2487 (+!1594 lt!205669 (tuple2!8061 lt!205665 lt!205664)) lt!205667))))

(assert (=> b!453311 (= lt!205670 (addStillNotContains!147 lt!205669 lt!205665 lt!205664 lt!205667))))

(assert (=> b!453311 (= lt!205667 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453311 (= lt!205664 (get!6650 (select (arr!13482 (array!28076 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13835 _values!549))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453311 (= lt!205665 (select (arr!13481 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863)))))

(declare-fun call!30047 () ListLongMap!6963)

(assert (=> b!453311 (= lt!205669 call!30047)))

(declare-fun e!265329 () ListLongMap!6963)

(assert (=> b!453311 (= e!265329 (+!1594 call!30047 (tuple2!8061 (select (arr!13481 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 (array!28076 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13835 _values!549))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453312 () Bool)

(assert (=> b!453312 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709)))))))

(assert (=> b!453312 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13835 (array!28076 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13835 _values!549)))))))

(assert (=> b!453312 (= e!265330 (= (apply!313 lt!205666 (select (arr!13481 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863))) (get!6650 (select (arr!13482 (array!28076 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13835 _values!549))) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453313 () Bool)

(assert (=> b!453313 (= e!265324 e!265325)))

(declare-fun c!56212 () Bool)

(assert (=> b!453313 (= c!56212 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709)))))))

(declare-fun b!453314 () Bool)

(assert (=> b!453314 (= e!265326 e!265329)))

(declare-fun c!56213 () Bool)

(assert (=> b!453314 (= c!56213 (validKeyInArray!0 (select (arr!13481 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453315 () Bool)

(declare-fun e!265327 () Bool)

(assert (=> b!453315 (= e!265327 (validKeyInArray!0 (select (arr!13481 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709))) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453315 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!453316 () Bool)

(assert (=> b!453316 (= e!265329 call!30047)))

(declare-fun bm!30044 () Bool)

(assert (=> bm!30044 (= call!30047 (getCurrentListMapNoExtraKeys!1692 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709)) (array!28076 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13835 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453317 () Bool)

(assert (=> b!453317 (= e!265328 e!265324)))

(declare-fun c!56214 () Bool)

(assert (=> b!453317 (= c!56214 e!265327)))

(declare-fun res!270031 () Bool)

(assert (=> b!453317 (=> (not res!270031) (not e!265327))))

(assert (=> b!453317 (= res!270031 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!13834 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709)))))))

(declare-fun b!453318 () Bool)

(declare-fun res!270030 () Bool)

(assert (=> b!453318 (=> (not res!270030) (not e!265328))))

(assert (=> b!453318 (= res!270030 (not (contains!2487 lt!205666 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74307 c!56215) b!453308))

(assert (= (and d!74307 (not c!56215)) b!453314))

(assert (= (and b!453314 c!56213) b!453311))

(assert (= (and b!453314 (not c!56213)) b!453316))

(assert (= (or b!453311 b!453316) bm!30044))

(assert (= (and d!74307 res!270032) b!453318))

(assert (= (and b!453318 res!270030) b!453317))

(assert (= (and b!453317 res!270031) b!453315))

(assert (= (and b!453317 c!56214) b!453307))

(assert (= (and b!453317 (not c!56214)) b!453313))

(assert (= (and b!453307 res!270029) b!453312))

(assert (= (and b!453313 c!56212) b!453309))

(assert (= (and b!453313 (not c!56212)) b!453310))

(declare-fun b_lambda!9629 () Bool)

(assert (=> (not b_lambda!9629) (not b!453311)))

(assert (=> b!453311 t!13931))

(declare-fun b_and!18915 () Bool)

(assert (= b_and!18913 (and (=> t!13931 result!7091) b_and!18915)))

(declare-fun b_lambda!9631 () Bool)

(assert (=> (not b_lambda!9631) (not b!453312)))

(assert (=> b!453312 t!13931))

(declare-fun b_and!18917 () Bool)

(assert (= b_and!18915 (and (=> t!13931 result!7091) b_and!18917)))

(declare-fun m!437045 () Bool)

(assert (=> b!453307 m!437045))

(assert (=> b!453307 m!437045))

(declare-fun m!437047 () Bool)

(assert (=> b!453307 m!437047))

(assert (=> b!453312 m!437045))

(assert (=> b!453312 m!436071))

(declare-fun m!437049 () Bool)

(assert (=> b!453312 m!437049))

(assert (=> b!453312 m!436071))

(declare-fun m!437051 () Bool)

(assert (=> b!453312 m!437051))

(assert (=> b!453312 m!437045))

(declare-fun m!437053 () Bool)

(assert (=> b!453312 m!437053))

(assert (=> b!453312 m!437049))

(declare-fun m!437055 () Bool)

(assert (=> b!453318 m!437055))

(declare-fun m!437057 () Bool)

(assert (=> d!74307 m!437057))

(assert (=> d!74307 m!436063))

(assert (=> b!453315 m!437045))

(assert (=> b!453315 m!437045))

(declare-fun m!437059 () Bool)

(assert (=> b!453315 m!437059))

(assert (=> b!453314 m!437045))

(assert (=> b!453314 m!437045))

(assert (=> b!453314 m!437059))

(declare-fun m!437061 () Bool)

(assert (=> bm!30044 m!437061))

(declare-fun m!437063 () Bool)

(assert (=> b!453310 m!437063))

(assert (=> b!453309 m!437061))

(assert (=> b!453311 m!437045))

(assert (=> b!453311 m!437049))

(declare-fun m!437065 () Bool)

(assert (=> b!453311 m!437065))

(assert (=> b!453311 m!437049))

(assert (=> b!453311 m!436071))

(assert (=> b!453311 m!437051))

(declare-fun m!437067 () Bool)

(assert (=> b!453311 m!437067))

(assert (=> b!453311 m!436071))

(declare-fun m!437069 () Bool)

(assert (=> b!453311 m!437069))

(assert (=> b!453311 m!437065))

(declare-fun m!437071 () Bool)

(assert (=> b!453311 m!437071))

(assert (=> bm!30014 d!74307))

(declare-fun d!74309 () Bool)

(declare-fun e!265332 () Bool)

(assert (=> d!74309 e!265332))

(declare-fun res!270033 () Bool)

(assert (=> d!74309 (=> res!270033 e!265332)))

(declare-fun lt!205671 () Bool)

(assert (=> d!74309 (= res!270033 (not lt!205671))))

(declare-fun lt!205673 () Bool)

(assert (=> d!74309 (= lt!205671 lt!205673)))

(declare-fun lt!205674 () Unit!13211)

(declare-fun e!265331 () Unit!13211)

(assert (=> d!74309 (= lt!205674 e!265331)))

(declare-fun c!56216 () Bool)

(assert (=> d!74309 (= c!56216 lt!205673)))

(assert (=> d!74309 (= lt!205673 (containsKey!345 (toList!3497 lt!205475) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74309 (= (contains!2487 lt!205475 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205671)))

(declare-fun b!453319 () Bool)

(declare-fun lt!205672 () Unit!13211)

(assert (=> b!453319 (= e!265331 lt!205672)))

(assert (=> b!453319 (= lt!205672 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205475) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453319 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205475) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453320 () Bool)

(declare-fun Unit!13232 () Unit!13211)

(assert (=> b!453320 (= e!265331 Unit!13232)))

(declare-fun b!453321 () Bool)

(assert (=> b!453321 (= e!265332 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205475) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74309 c!56216) b!453319))

(assert (= (and d!74309 (not c!56216)) b!453320))

(assert (= (and d!74309 (not res!270033)) b!453321))

(declare-fun m!437073 () Bool)

(assert (=> d!74309 m!437073))

(declare-fun m!437075 () Bool)

(assert (=> b!453319 m!437075))

(declare-fun m!437077 () Bool)

(assert (=> b!453319 m!437077))

(assert (=> b!453319 m!437077))

(declare-fun m!437079 () Bool)

(assert (=> b!453319 m!437079))

(assert (=> b!453321 m!437077))

(assert (=> b!453321 m!437077))

(assert (=> b!453321 m!437079))

(assert (=> b!453010 d!74309))

(declare-fun d!74311 () Bool)

(assert (=> d!74311 (= (isEmpty!563 lt!205482) (isEmpty!564 (toList!3497 lt!205482)))))

(declare-fun bs!14376 () Bool)

(assert (= bs!14376 d!74311))

(declare-fun m!437081 () Bool)

(assert (=> bs!14376 m!437081))

(assert (=> b!453014 d!74311))

(declare-fun d!74313 () Bool)

(declare-fun lt!205675 () Bool)

(assert (=> d!74313 (= lt!205675 (select (content!205 (toList!3497 lt!205461)) lt!205326))))

(declare-fun e!265334 () Bool)

(assert (=> d!74313 (= lt!205675 e!265334)))

(declare-fun res!270034 () Bool)

(assert (=> d!74313 (=> (not res!270034) (not e!265334))))

(assert (=> d!74313 (= res!270034 ((_ is Cons!8114) (toList!3497 lt!205461)))))

(assert (=> d!74313 (= (contains!2488 (toList!3497 lt!205461) lt!205326) lt!205675)))

(declare-fun b!453322 () Bool)

(declare-fun e!265333 () Bool)

(assert (=> b!453322 (= e!265334 e!265333)))

(declare-fun res!270035 () Bool)

(assert (=> b!453322 (=> res!270035 e!265333)))

(assert (=> b!453322 (= res!270035 (= (h!8970 (toList!3497 lt!205461)) lt!205326))))

(declare-fun b!453323 () Bool)

(assert (=> b!453323 (= e!265333 (contains!2488 (t!13933 (toList!3497 lt!205461)) lt!205326))))

(assert (= (and d!74313 res!270034) b!453322))

(assert (= (and b!453322 (not res!270035)) b!453323))

(declare-fun m!437083 () Bool)

(assert (=> d!74313 m!437083))

(declare-fun m!437085 () Bool)

(assert (=> d!74313 m!437085))

(declare-fun m!437087 () Bool)

(assert (=> b!453323 m!437087))

(assert (=> b!452977 d!74313))

(declare-fun d!74315 () Bool)

(assert (=> d!74315 (= (apply!313 lt!205482 (select (arr!13481 _keys!709) from!863)) (get!6655 (getValueByKey!368 (toList!3497 lt!205482) (select (arr!13481 _keys!709) from!863))))))

(declare-fun bs!14377 () Bool)

(assert (= bs!14377 d!74315))

(assert (=> bs!14377 m!436057))

(declare-fun m!437089 () Bool)

(assert (=> bs!14377 m!437089))

(assert (=> bs!14377 m!437089))

(declare-fun m!437091 () Bool)

(assert (=> bs!14377 m!437091))

(assert (=> b!453016 d!74315))

(assert (=> b!453016 d!74173))

(declare-fun b!453324 () Bool)

(declare-fun e!265336 () Bool)

(declare-fun call!30048 () Bool)

(assert (=> b!453324 (= e!265336 call!30048)))

(declare-fun b!453325 () Bool)

(declare-fun e!265338 () Bool)

(declare-fun e!265337 () Bool)

(assert (=> b!453325 (= e!265338 e!265337)))

(declare-fun res!270036 () Bool)

(assert (=> b!453325 (=> (not res!270036) (not e!265337))))

(declare-fun e!265335 () Bool)

(assert (=> b!453325 (= res!270036 (not e!265335))))

(declare-fun res!270037 () Bool)

(assert (=> b!453325 (=> (not res!270037) (not e!265335))))

(assert (=> b!453325 (= res!270037 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453326 () Bool)

(assert (=> b!453326 (= e!265336 call!30048)))

(declare-fun d!74317 () Bool)

(declare-fun res!270038 () Bool)

(assert (=> d!74317 (=> res!270038 e!265338)))

(assert (=> d!74317 (= res!270038 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13834 _keys!709)))))

(assert (=> d!74317 (= (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56119 (Cons!8113 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) Nil!8114) Nil!8114)) e!265338)))

(declare-fun b!453327 () Bool)

(assert (=> b!453327 (= e!265337 e!265336)))

(declare-fun c!56217 () Bool)

(assert (=> b!453327 (= c!56217 (validKeyInArray!0 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453328 () Bool)

(assert (=> b!453328 (= e!265335 (contains!2486 (ite c!56119 (Cons!8113 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) Nil!8114) Nil!8114) (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!30045 () Bool)

(assert (=> bm!30045 (= call!30048 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!56217 (Cons!8113 (select (arr!13481 _keys!709) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!56119 (Cons!8113 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) Nil!8114) Nil!8114)) (ite c!56119 (Cons!8113 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) Nil!8114) Nil!8114))))))

(assert (= (and d!74317 (not res!270038)) b!453325))

(assert (= (and b!453325 res!270037) b!453328))

(assert (= (and b!453325 res!270036) b!453327))

(assert (= (and b!453327 c!56217) b!453326))

(assert (= (and b!453327 (not c!56217)) b!453324))

(assert (= (or b!453326 b!453324) bm!30045))

(assert (=> b!453325 m!436669))

(assert (=> b!453325 m!436669))

(assert (=> b!453325 m!436687))

(assert (=> b!453327 m!436669))

(assert (=> b!453327 m!436669))

(assert (=> b!453327 m!436687))

(assert (=> b!453328 m!436669))

(assert (=> b!453328 m!436669))

(declare-fun m!437093 () Bool)

(assert (=> b!453328 m!437093))

(assert (=> bm!30045 m!436669))

(declare-fun m!437095 () Bool)

(assert (=> bm!30045 m!437095))

(assert (=> bm!30019 d!74317))

(declare-fun d!74319 () Bool)

(assert (=> d!74319 (= (apply!313 lt!205418 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6655 (getValueByKey!368 (toList!3497 lt!205418) (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))))

(declare-fun bs!14378 () Bool)

(assert (= bs!14378 d!74319))

(assert (=> bs!14378 m!436297))

(declare-fun m!437097 () Bool)

(assert (=> bs!14378 m!437097))

(assert (=> bs!14378 m!437097))

(declare-fun m!437099 () Bool)

(assert (=> bs!14378 m!437099))

(assert (=> b!452932 d!74319))

(assert (=> b!452932 d!74183))

(declare-fun d!74321 () Bool)

(assert (=> d!74321 (= (isEmpty!563 lt!205418) (isEmpty!564 (toList!3497 lt!205418)))))

(declare-fun bs!14379 () Bool)

(assert (= bs!14379 d!74321))

(declare-fun m!437101 () Bool)

(assert (=> bs!14379 m!437101))

(assert (=> b!452930 d!74321))

(assert (=> b!452995 d!74287))

(declare-fun b!453329 () Bool)

(declare-fun e!265339 () Bool)

(declare-fun e!265345 () Bool)

(assert (=> b!453329 (= e!265339 e!265345)))

(assert (=> b!453329 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 lt!205321)))))

(declare-fun lt!205678 () ListLongMap!6963)

(declare-fun res!270039 () Bool)

(assert (=> b!453329 (= res!270039 (contains!2487 lt!205678 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453329 (=> (not res!270039) (not e!265345))))

(declare-fun b!453330 () Bool)

(declare-fun e!265341 () ListLongMap!6963)

(assert (=> b!453330 (= e!265341 (ListLongMap!6964 Nil!8115))))

(declare-fun d!74323 () Bool)

(declare-fun e!265343 () Bool)

(assert (=> d!74323 e!265343))

(declare-fun res!270042 () Bool)

(assert (=> d!74323 (=> (not res!270042) (not e!265343))))

(assert (=> d!74323 (= res!270042 (not (contains!2487 lt!205678 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74323 (= lt!205678 e!265341)))

(declare-fun c!56221 () Bool)

(assert (=> d!74323 (= c!56221 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 lt!205321)))))

(assert (=> d!74323 (validMask!0 mask!1025)))

(assert (=> d!74323 (= (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557) lt!205678)))

(declare-fun e!265340 () Bool)

(declare-fun b!453331 () Bool)

(assert (=> b!453331 (= e!265340 (= lt!205678 (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!453332 () Bool)

(assert (=> b!453332 (= e!265340 (isEmpty!563 lt!205678))))

(declare-fun b!453333 () Bool)

(declare-fun lt!205680 () Unit!13211)

(declare-fun lt!205682 () Unit!13211)

(assert (=> b!453333 (= lt!205680 lt!205682)))

(declare-fun lt!205679 () (_ BitVec 64))

(declare-fun lt!205677 () (_ BitVec 64))

(declare-fun lt!205681 () ListLongMap!6963)

(declare-fun lt!205676 () V!17291)

(assert (=> b!453333 (not (contains!2487 (+!1594 lt!205681 (tuple2!8061 lt!205677 lt!205676)) lt!205679))))

(assert (=> b!453333 (= lt!205682 (addStillNotContains!147 lt!205681 lt!205677 lt!205676 lt!205679))))

(assert (=> b!453333 (= lt!205679 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!453333 (= lt!205676 (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!453333 (= lt!205677 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)))))

(declare-fun call!30049 () ListLongMap!6963)

(assert (=> b!453333 (= lt!205681 call!30049)))

(declare-fun e!265344 () ListLongMap!6963)

(assert (=> b!453333 (= e!265344 (+!1594 call!30049 (tuple2!8061 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!453334 () Bool)

(assert (=> b!453334 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 lt!205321)))))

(assert (=> b!453334 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13835 lt!205322)))))

(assert (=> b!453334 (= e!265345 (= (apply!313 lt!205678 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!453335 () Bool)

(assert (=> b!453335 (= e!265339 e!265340)))

(declare-fun c!56218 () Bool)

(assert (=> b!453335 (= c!56218 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 lt!205321)))))

(declare-fun b!453336 () Bool)

(assert (=> b!453336 (= e!265341 e!265344)))

(declare-fun c!56219 () Bool)

(assert (=> b!453336 (= c!56219 (validKeyInArray!0 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(declare-fun b!453337 () Bool)

(declare-fun e!265342 () Bool)

(assert (=> b!453337 (= e!265342 (validKeyInArray!0 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001))))))

(assert (=> b!453337 (bvsge (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))

(declare-fun b!453338 () Bool)

(assert (=> b!453338 (= e!265344 call!30049)))

(declare-fun bm!30046 () Bool)

(assert (=> bm!30046 (= call!30049 (getCurrentListMapNoExtraKeys!1692 lt!205321 lt!205322 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!453339 () Bool)

(assert (=> b!453339 (= e!265343 e!265339)))

(declare-fun c!56220 () Bool)

(assert (=> b!453339 (= c!56220 e!265342)))

(declare-fun res!270041 () Bool)

(assert (=> b!453339 (=> (not res!270041) (not e!265342))))

(assert (=> b!453339 (= res!270041 (bvslt (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) (size!13834 lt!205321)))))

(declare-fun b!453340 () Bool)

(declare-fun res!270040 () Bool)

(assert (=> b!453340 (=> (not res!270040) (not e!265343))))

(assert (=> b!453340 (= res!270040 (not (contains!2487 lt!205678 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74323 c!56221) b!453330))

(assert (= (and d!74323 (not c!56221)) b!453336))

(assert (= (and b!453336 c!56219) b!453333))

(assert (= (and b!453336 (not c!56219)) b!453338))

(assert (= (or b!453333 b!453338) bm!30046))

(assert (= (and d!74323 res!270042) b!453340))

(assert (= (and b!453340 res!270040) b!453339))

(assert (= (and b!453339 res!270041) b!453337))

(assert (= (and b!453339 c!56220) b!453329))

(assert (= (and b!453339 (not c!56220)) b!453335))

(assert (= (and b!453329 res!270039) b!453334))

(assert (= (and b!453335 c!56218) b!453331))

(assert (= (and b!453335 (not c!56218)) b!453332))

(declare-fun b_lambda!9633 () Bool)

(assert (=> (not b_lambda!9633) (not b!453333)))

(assert (=> b!453333 t!13931))

(declare-fun b_and!18919 () Bool)

(assert (= b_and!18917 (and (=> t!13931 result!7091) b_and!18919)))

(declare-fun b_lambda!9635 () Bool)

(assert (=> (not b_lambda!9635) (not b!453334)))

(assert (=> b!453334 t!13931))

(declare-fun b_and!18921 () Bool)

(assert (= b_and!18919 (and (=> t!13931 result!7091) b_and!18921)))

(declare-fun m!437103 () Bool)

(assert (=> b!453329 m!437103))

(assert (=> b!453329 m!437103))

(declare-fun m!437105 () Bool)

(assert (=> b!453329 m!437105))

(assert (=> b!453334 m!437103))

(assert (=> b!453334 m!436071))

(declare-fun m!437107 () Bool)

(assert (=> b!453334 m!437107))

(assert (=> b!453334 m!436071))

(declare-fun m!437109 () Bool)

(assert (=> b!453334 m!437109))

(assert (=> b!453334 m!437103))

(declare-fun m!437111 () Bool)

(assert (=> b!453334 m!437111))

(assert (=> b!453334 m!437107))

(declare-fun m!437113 () Bool)

(assert (=> b!453340 m!437113))

(declare-fun m!437115 () Bool)

(assert (=> d!74323 m!437115))

(assert (=> d!74323 m!436063))

(assert (=> b!453337 m!437103))

(assert (=> b!453337 m!437103))

(declare-fun m!437117 () Bool)

(assert (=> b!453337 m!437117))

(assert (=> b!453336 m!437103))

(assert (=> b!453336 m!437103))

(assert (=> b!453336 m!437117))

(declare-fun m!437119 () Bool)

(assert (=> bm!30046 m!437119))

(declare-fun m!437121 () Bool)

(assert (=> b!453332 m!437121))

(assert (=> b!453331 m!437119))

(assert (=> b!453333 m!437103))

(assert (=> b!453333 m!437107))

(declare-fun m!437123 () Bool)

(assert (=> b!453333 m!437123))

(assert (=> b!453333 m!437107))

(assert (=> b!453333 m!436071))

(assert (=> b!453333 m!437109))

(declare-fun m!437125 () Bool)

(assert (=> b!453333 m!437125))

(assert (=> b!453333 m!436071))

(declare-fun m!437127 () Bool)

(assert (=> b!453333 m!437127))

(assert (=> b!453333 m!437123))

(declare-fun m!437129 () Bool)

(assert (=> b!453333 m!437129))

(assert (=> b!452980 d!74323))

(declare-fun d!74325 () Bool)

(declare-fun e!265346 () Bool)

(assert (=> d!74325 e!265346))

(declare-fun res!270044 () Bool)

(assert (=> d!74325 (=> (not res!270044) (not e!265346))))

(declare-fun lt!205686 () ListLongMap!6963)

(assert (=> d!74325 (= res!270044 (contains!2487 lt!205686 (_1!4041 (tuple2!8061 k0!794 v!412))))))

(declare-fun lt!205683 () List!8118)

(assert (=> d!74325 (= lt!205686 (ListLongMap!6964 lt!205683))))

(declare-fun lt!205685 () Unit!13211)

(declare-fun lt!205684 () Unit!13211)

(assert (=> d!74325 (= lt!205685 lt!205684)))

(assert (=> d!74325 (= (getValueByKey!368 lt!205683 (_1!4041 (tuple2!8061 k0!794 v!412))) (Some!373 (_2!4041 (tuple2!8061 k0!794 v!412))))))

(assert (=> d!74325 (= lt!205684 (lemmaContainsTupThenGetReturnValue!193 lt!205683 (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))))))

(assert (=> d!74325 (= lt!205683 (insertStrictlySorted!196 (toList!3497 call!30016) (_1!4041 (tuple2!8061 k0!794 v!412)) (_2!4041 (tuple2!8061 k0!794 v!412))))))

(assert (=> d!74325 (= (+!1594 call!30016 (tuple2!8061 k0!794 v!412)) lt!205686)))

(declare-fun b!453341 () Bool)

(declare-fun res!270043 () Bool)

(assert (=> b!453341 (=> (not res!270043) (not e!265346))))

(assert (=> b!453341 (= res!270043 (= (getValueByKey!368 (toList!3497 lt!205686) (_1!4041 (tuple2!8061 k0!794 v!412))) (Some!373 (_2!4041 (tuple2!8061 k0!794 v!412)))))))

(declare-fun b!453342 () Bool)

(assert (=> b!453342 (= e!265346 (contains!2488 (toList!3497 lt!205686) (tuple2!8061 k0!794 v!412)))))

(assert (= (and d!74325 res!270044) b!453341))

(assert (= (and b!453341 res!270043) b!453342))

(declare-fun m!437131 () Bool)

(assert (=> d!74325 m!437131))

(declare-fun m!437133 () Bool)

(assert (=> d!74325 m!437133))

(declare-fun m!437135 () Bool)

(assert (=> d!74325 m!437135))

(declare-fun m!437137 () Bool)

(assert (=> d!74325 m!437137))

(declare-fun m!437139 () Bool)

(assert (=> b!453341 m!437139))

(declare-fun m!437141 () Bool)

(assert (=> b!453342 m!437141))

(assert (=> b!452945 d!74325))

(assert (=> b!452997 d!74287))

(assert (=> b!452982 d!74181))

(declare-fun d!74327 () Bool)

(assert (=> d!74327 (not (contains!2487 (+!1594 lt!205467 (tuple2!8061 lt!205463 lt!205462)) lt!205465))))

(declare-fun lt!205687 () Unit!13211)

(assert (=> d!74327 (= lt!205687 (choose!1336 lt!205467 lt!205463 lt!205462 lt!205465))))

(declare-fun e!265347 () Bool)

(assert (=> d!74327 e!265347))

(declare-fun res!270045 () Bool)

(assert (=> d!74327 (=> (not res!270045) (not e!265347))))

(assert (=> d!74327 (= res!270045 (not (contains!2487 lt!205467 lt!205465)))))

(assert (=> d!74327 (= (addStillNotContains!147 lt!205467 lt!205463 lt!205462 lt!205465) lt!205687)))

(declare-fun b!453343 () Bool)

(assert (=> b!453343 (= e!265347 (not (= lt!205463 lt!205465)))))

(assert (= (and d!74327 res!270045) b!453343))

(assert (=> d!74327 m!436421))

(assert (=> d!74327 m!436421))

(assert (=> d!74327 m!436427))

(declare-fun m!437143 () Bool)

(assert (=> d!74327 m!437143))

(declare-fun m!437145 () Bool)

(assert (=> d!74327 m!437145))

(assert (=> b!452982 d!74327))

(declare-fun d!74329 () Bool)

(declare-fun e!265348 () Bool)

(assert (=> d!74329 e!265348))

(declare-fun res!270047 () Bool)

(assert (=> d!74329 (=> (not res!270047) (not e!265348))))

(declare-fun lt!205691 () ListLongMap!6963)

(assert (=> d!74329 (= res!270047 (contains!2487 lt!205691 (_1!4041 (tuple2!8061 lt!205463 lt!205462))))))

(declare-fun lt!205688 () List!8118)

(assert (=> d!74329 (= lt!205691 (ListLongMap!6964 lt!205688))))

(declare-fun lt!205690 () Unit!13211)

(declare-fun lt!205689 () Unit!13211)

(assert (=> d!74329 (= lt!205690 lt!205689)))

(assert (=> d!74329 (= (getValueByKey!368 lt!205688 (_1!4041 (tuple2!8061 lt!205463 lt!205462))) (Some!373 (_2!4041 (tuple2!8061 lt!205463 lt!205462))))))

(assert (=> d!74329 (= lt!205689 (lemmaContainsTupThenGetReturnValue!193 lt!205688 (_1!4041 (tuple2!8061 lt!205463 lt!205462)) (_2!4041 (tuple2!8061 lt!205463 lt!205462))))))

(assert (=> d!74329 (= lt!205688 (insertStrictlySorted!196 (toList!3497 lt!205467) (_1!4041 (tuple2!8061 lt!205463 lt!205462)) (_2!4041 (tuple2!8061 lt!205463 lt!205462))))))

(assert (=> d!74329 (= (+!1594 lt!205467 (tuple2!8061 lt!205463 lt!205462)) lt!205691)))

(declare-fun b!453344 () Bool)

(declare-fun res!270046 () Bool)

(assert (=> b!453344 (=> (not res!270046) (not e!265348))))

(assert (=> b!453344 (= res!270046 (= (getValueByKey!368 (toList!3497 lt!205691) (_1!4041 (tuple2!8061 lt!205463 lt!205462))) (Some!373 (_2!4041 (tuple2!8061 lt!205463 lt!205462)))))))

(declare-fun b!453345 () Bool)

(assert (=> b!453345 (= e!265348 (contains!2488 (toList!3497 lt!205691) (tuple2!8061 lt!205463 lt!205462)))))

(assert (= (and d!74329 res!270047) b!453344))

(assert (= (and b!453344 res!270046) b!453345))

(declare-fun m!437147 () Bool)

(assert (=> d!74329 m!437147))

(declare-fun m!437149 () Bool)

(assert (=> d!74329 m!437149))

(declare-fun m!437151 () Bool)

(assert (=> d!74329 m!437151))

(declare-fun m!437153 () Bool)

(assert (=> d!74329 m!437153))

(declare-fun m!437155 () Bool)

(assert (=> b!453344 m!437155))

(declare-fun m!437157 () Bool)

(assert (=> b!453345 m!437157))

(assert (=> b!452982 d!74329))

(declare-fun d!74331 () Bool)

(declare-fun e!265350 () Bool)

(assert (=> d!74331 e!265350))

(declare-fun res!270048 () Bool)

(assert (=> d!74331 (=> res!270048 e!265350)))

(declare-fun lt!205692 () Bool)

(assert (=> d!74331 (= res!270048 (not lt!205692))))

(declare-fun lt!205694 () Bool)

(assert (=> d!74331 (= lt!205692 lt!205694)))

(declare-fun lt!205695 () Unit!13211)

(declare-fun e!265349 () Unit!13211)

(assert (=> d!74331 (= lt!205695 e!265349)))

(declare-fun c!56222 () Bool)

(assert (=> d!74331 (= c!56222 lt!205694)))

(assert (=> d!74331 (= lt!205694 (containsKey!345 (toList!3497 (+!1594 lt!205467 (tuple2!8061 lt!205463 lt!205462))) lt!205465))))

(assert (=> d!74331 (= (contains!2487 (+!1594 lt!205467 (tuple2!8061 lt!205463 lt!205462)) lt!205465) lt!205692)))

(declare-fun b!453346 () Bool)

(declare-fun lt!205693 () Unit!13211)

(assert (=> b!453346 (= e!265349 lt!205693)))

(assert (=> b!453346 (= lt!205693 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 (+!1594 lt!205467 (tuple2!8061 lt!205463 lt!205462))) lt!205465))))

(assert (=> b!453346 (isDefined!295 (getValueByKey!368 (toList!3497 (+!1594 lt!205467 (tuple2!8061 lt!205463 lt!205462))) lt!205465))))

(declare-fun b!453347 () Bool)

(declare-fun Unit!13233 () Unit!13211)

(assert (=> b!453347 (= e!265349 Unit!13233)))

(declare-fun b!453348 () Bool)

(assert (=> b!453348 (= e!265350 (isDefined!295 (getValueByKey!368 (toList!3497 (+!1594 lt!205467 (tuple2!8061 lt!205463 lt!205462))) lt!205465)))))

(assert (= (and d!74331 c!56222) b!453346))

(assert (= (and d!74331 (not c!56222)) b!453347))

(assert (= (and d!74331 (not res!270048)) b!453348))

(declare-fun m!437159 () Bool)

(assert (=> d!74331 m!437159))

(declare-fun m!437161 () Bool)

(assert (=> b!453346 m!437161))

(declare-fun m!437163 () Bool)

(assert (=> b!453346 m!437163))

(assert (=> b!453346 m!437163))

(declare-fun m!437165 () Bool)

(assert (=> b!453346 m!437165))

(assert (=> b!453348 m!437163))

(assert (=> b!453348 m!437163))

(assert (=> b!453348 m!437165))

(assert (=> b!452982 d!74331))

(declare-fun d!74333 () Bool)

(declare-fun e!265351 () Bool)

(assert (=> d!74333 e!265351))

(declare-fun res!270050 () Bool)

(assert (=> d!74333 (=> (not res!270050) (not e!265351))))

(declare-fun lt!205699 () ListLongMap!6963)

(assert (=> d!74333 (= res!270050 (contains!2487 lt!205699 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!205696 () List!8118)

(assert (=> d!74333 (= lt!205699 (ListLongMap!6964 lt!205696))))

(declare-fun lt!205698 () Unit!13211)

(declare-fun lt!205697 () Unit!13211)

(assert (=> d!74333 (= lt!205698 lt!205697)))

(assert (=> d!74333 (= (getValueByKey!368 lt!205696 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!373 (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74333 (= lt!205697 (lemmaContainsTupThenGetReturnValue!193 lt!205696 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74333 (= lt!205696 (insertStrictlySorted!196 (toList!3497 call!30021) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74333 (= (+!1594 call!30021 (tuple2!8061 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!205699)))

(declare-fun b!453349 () Bool)

(declare-fun res!270049 () Bool)

(assert (=> b!453349 (=> (not res!270049) (not e!265351))))

(assert (=> b!453349 (= res!270049 (= (getValueByKey!368 (toList!3497 lt!205699) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!373 (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!453350 () Bool)

(assert (=> b!453350 (= e!265351 (contains!2488 (toList!3497 lt!205699) (tuple2!8061 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000001 from!863)) (get!6650 (select (arr!13482 lt!205322) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!868 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74333 res!270050) b!453349))

(assert (= (and b!453349 res!270049) b!453350))

(declare-fun m!437167 () Bool)

(assert (=> d!74333 m!437167))

(declare-fun m!437169 () Bool)

(assert (=> d!74333 m!437169))

(declare-fun m!437171 () Bool)

(assert (=> d!74333 m!437171))

(declare-fun m!437173 () Bool)

(assert (=> d!74333 m!437173))

(declare-fun m!437175 () Bool)

(assert (=> b!453349 m!437175))

(declare-fun m!437177 () Bool)

(assert (=> b!453350 m!437177))

(assert (=> b!452982 d!74333))

(declare-fun d!74335 () Bool)

(declare-fun e!265353 () Bool)

(assert (=> d!74335 e!265353))

(declare-fun res!270051 () Bool)

(assert (=> d!74335 (=> res!270051 e!265353)))

(declare-fun lt!205700 () Bool)

(assert (=> d!74335 (= res!270051 (not lt!205700))))

(declare-fun lt!205702 () Bool)

(assert (=> d!74335 (= lt!205700 lt!205702)))

(declare-fun lt!205703 () Unit!13211)

(declare-fun e!265352 () Unit!13211)

(assert (=> d!74335 (= lt!205703 e!265352)))

(declare-fun c!56223 () Bool)

(assert (=> d!74335 (= c!56223 lt!205702)))

(assert (=> d!74335 (= lt!205702 (containsKey!345 (toList!3497 lt!205411) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74335 (= (contains!2487 lt!205411 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205700)))

(declare-fun b!453351 () Bool)

(declare-fun lt!205701 () Unit!13211)

(assert (=> b!453351 (= e!265352 lt!205701)))

(assert (=> b!453351 (= lt!205701 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205411) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453351 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205411) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453352 () Bool)

(declare-fun Unit!13234 () Unit!13211)

(assert (=> b!453352 (= e!265352 Unit!13234)))

(declare-fun b!453353 () Bool)

(assert (=> b!453353 (= e!265353 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205411) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74335 c!56223) b!453351))

(assert (= (and d!74335 (not c!56223)) b!453352))

(assert (= (and d!74335 (not res!270051)) b!453353))

(declare-fun m!437179 () Bool)

(assert (=> d!74335 m!437179))

(declare-fun m!437181 () Bool)

(assert (=> b!453351 m!437181))

(declare-fun m!437183 () Bool)

(assert (=> b!453351 m!437183))

(assert (=> b!453351 m!437183))

(declare-fun m!437185 () Bool)

(assert (=> b!453351 m!437185))

(assert (=> b!453353 m!437183))

(assert (=> b!453353 m!437183))

(assert (=> b!453353 m!437185))

(assert (=> b!452926 d!74335))

(assert (=> bm!30020 d!74243))

(assert (=> b!452881 d!74241))

(declare-fun d!74337 () Bool)

(assert (=> d!74337 (= (get!6654 (select (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) from!863) lt!205323) lt!205323)))

(assert (=> b!452975 d!74337))

(declare-fun d!74339 () Bool)

(declare-fun e!265355 () Bool)

(assert (=> d!74339 e!265355))

(declare-fun res!270052 () Bool)

(assert (=> d!74339 (=> res!270052 e!265355)))

(declare-fun lt!205704 () Bool)

(assert (=> d!74339 (= res!270052 (not lt!205704))))

(declare-fun lt!205706 () Bool)

(assert (=> d!74339 (= lt!205704 lt!205706)))

(declare-fun lt!205707 () Unit!13211)

(declare-fun e!265354 () Unit!13211)

(assert (=> d!74339 (= lt!205707 e!265354)))

(declare-fun c!56224 () Bool)

(assert (=> d!74339 (= c!56224 lt!205706)))

(assert (=> d!74339 (= lt!205706 (containsKey!345 (toList!3497 lt!205449) (_1!4041 lt!205326)))))

(assert (=> d!74339 (= (contains!2487 lt!205449 (_1!4041 lt!205326)) lt!205704)))

(declare-fun b!453354 () Bool)

(declare-fun lt!205705 () Unit!13211)

(assert (=> b!453354 (= e!265354 lt!205705)))

(assert (=> b!453354 (= lt!205705 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205449) (_1!4041 lt!205326)))))

(assert (=> b!453354 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205449) (_1!4041 lt!205326)))))

(declare-fun b!453355 () Bool)

(declare-fun Unit!13235 () Unit!13211)

(assert (=> b!453355 (= e!265354 Unit!13235)))

(declare-fun b!453356 () Bool)

(assert (=> b!453356 (= e!265355 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205449) (_1!4041 lt!205326))))))

(assert (= (and d!74339 c!56224) b!453354))

(assert (= (and d!74339 (not c!56224)) b!453355))

(assert (= (and d!74339 (not res!270052)) b!453356))

(declare-fun m!437187 () Bool)

(assert (=> d!74339 m!437187))

(declare-fun m!437189 () Bool)

(assert (=> b!453354 m!437189))

(assert (=> b!453354 m!436357))

(assert (=> b!453354 m!436357))

(declare-fun m!437191 () Bool)

(assert (=> b!453354 m!437191))

(assert (=> b!453356 m!436357))

(assert (=> b!453356 m!436357))

(assert (=> b!453356 m!437191))

(assert (=> d!74135 d!74339))

(declare-fun b!453359 () Bool)

(declare-fun e!265357 () Option!374)

(assert (=> b!453359 (= e!265357 (getValueByKey!368 (t!13933 lt!205446) (_1!4041 lt!205326)))))

(declare-fun b!453360 () Bool)

(assert (=> b!453360 (= e!265357 None!372)))

(declare-fun d!74341 () Bool)

(declare-fun c!56225 () Bool)

(assert (=> d!74341 (= c!56225 (and ((_ is Cons!8114) lt!205446) (= (_1!4041 (h!8970 lt!205446)) (_1!4041 lt!205326))))))

(declare-fun e!265356 () Option!374)

(assert (=> d!74341 (= (getValueByKey!368 lt!205446 (_1!4041 lt!205326)) e!265356)))

(declare-fun b!453358 () Bool)

(assert (=> b!453358 (= e!265356 e!265357)))

(declare-fun c!56226 () Bool)

(assert (=> b!453358 (= c!56226 (and ((_ is Cons!8114) lt!205446) (not (= (_1!4041 (h!8970 lt!205446)) (_1!4041 lt!205326)))))))

(declare-fun b!453357 () Bool)

(assert (=> b!453357 (= e!265356 (Some!373 (_2!4041 (h!8970 lt!205446))))))

(assert (= (and d!74341 c!56225) b!453357))

(assert (= (and d!74341 (not c!56225)) b!453358))

(assert (= (and b!453358 c!56226) b!453359))

(assert (= (and b!453358 (not c!56226)) b!453360))

(declare-fun m!437193 () Bool)

(assert (=> b!453359 m!437193))

(assert (=> d!74135 d!74341))

(declare-fun d!74343 () Bool)

(assert (=> d!74343 (= (getValueByKey!368 lt!205446 (_1!4041 lt!205326)) (Some!373 (_2!4041 lt!205326)))))

(declare-fun lt!205708 () Unit!13211)

(assert (=> d!74343 (= lt!205708 (choose!1337 lt!205446 (_1!4041 lt!205326) (_2!4041 lt!205326)))))

(declare-fun e!265358 () Bool)

(assert (=> d!74343 e!265358))

(declare-fun res!270053 () Bool)

(assert (=> d!74343 (=> (not res!270053) (not e!265358))))

(assert (=> d!74343 (= res!270053 (isStrictlySorted!373 lt!205446))))

(assert (=> d!74343 (= (lemmaContainsTupThenGetReturnValue!193 lt!205446 (_1!4041 lt!205326) (_2!4041 lt!205326)) lt!205708)))

(declare-fun b!453361 () Bool)

(declare-fun res!270054 () Bool)

(assert (=> b!453361 (=> (not res!270054) (not e!265358))))

(assert (=> b!453361 (= res!270054 (containsKey!345 lt!205446 (_1!4041 lt!205326)))))

(declare-fun b!453362 () Bool)

(assert (=> b!453362 (= e!265358 (contains!2488 lt!205446 (tuple2!8061 (_1!4041 lt!205326) (_2!4041 lt!205326))))))

(assert (= (and d!74343 res!270053) b!453361))

(assert (= (and b!453361 res!270054) b!453362))

(assert (=> d!74343 m!436351))

(declare-fun m!437195 () Bool)

(assert (=> d!74343 m!437195))

(declare-fun m!437197 () Bool)

(assert (=> d!74343 m!437197))

(declare-fun m!437199 () Bool)

(assert (=> b!453361 m!437199))

(declare-fun m!437201 () Bool)

(assert (=> b!453362 m!437201))

(assert (=> d!74135 d!74343))

(declare-fun d!74345 () Bool)

(declare-fun e!265359 () Bool)

(assert (=> d!74345 e!265359))

(declare-fun res!270056 () Bool)

(assert (=> d!74345 (=> (not res!270056) (not e!265359))))

(declare-fun lt!205709 () List!8118)

(assert (=> d!74345 (= res!270056 (isStrictlySorted!373 lt!205709))))

(declare-fun e!265363 () List!8118)

(assert (=> d!74345 (= lt!205709 e!265363)))

(declare-fun c!56229 () Bool)

(assert (=> d!74345 (= c!56229 (and ((_ is Cons!8114) (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328)))) (bvslt (_1!4041 (h!8970 (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328))))) (_1!4041 lt!205326))))))

(assert (=> d!74345 (isStrictlySorted!373 (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328))))))

(assert (=> d!74345 (= (insertStrictlySorted!196 (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328))) (_1!4041 lt!205326) (_2!4041 lt!205326)) lt!205709)))

(declare-fun b!453363 () Bool)

(declare-fun call!30050 () List!8118)

(assert (=> b!453363 (= e!265363 call!30050)))

(declare-fun e!265360 () List!8118)

(declare-fun bm!30047 () Bool)

(assert (=> bm!30047 (= call!30050 ($colon$colon!108 e!265360 (ite c!56229 (h!8970 (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328)))) (tuple2!8061 (_1!4041 lt!205326) (_2!4041 lt!205326)))))))

(declare-fun c!56227 () Bool)

(assert (=> bm!30047 (= c!56227 c!56229)))

(declare-fun b!453364 () Bool)

(declare-fun c!56228 () Bool)

(assert (=> b!453364 (= c!56228 (and ((_ is Cons!8114) (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328)))) (bvsgt (_1!4041 (h!8970 (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328))))) (_1!4041 lt!205326))))))

(declare-fun e!265361 () List!8118)

(declare-fun e!265362 () List!8118)

(assert (=> b!453364 (= e!265361 e!265362)))

(declare-fun b!453365 () Bool)

(declare-fun call!30052 () List!8118)

(assert (=> b!453365 (= e!265361 call!30052)))

(declare-fun b!453366 () Bool)

(assert (=> b!453366 (= e!265363 e!265361)))

(declare-fun c!56230 () Bool)

(assert (=> b!453366 (= c!56230 (and ((_ is Cons!8114) (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328)))) (= (_1!4041 (h!8970 (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328))))) (_1!4041 lt!205326))))))

(declare-fun b!453367 () Bool)

(assert (=> b!453367 (= e!265360 (ite c!56230 (t!13933 (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328)))) (ite c!56228 (Cons!8114 (h!8970 (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328)))) (t!13933 (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328))))) Nil!8115)))))

(declare-fun bm!30048 () Bool)

(assert (=> bm!30048 (= call!30052 call!30050)))

(declare-fun bm!30049 () Bool)

(declare-fun call!30051 () List!8118)

(assert (=> bm!30049 (= call!30051 call!30052)))

(declare-fun b!453368 () Bool)

(declare-fun res!270055 () Bool)

(assert (=> b!453368 (=> (not res!270055) (not e!265359))))

(assert (=> b!453368 (= res!270055 (containsKey!345 lt!205709 (_1!4041 lt!205326)))))

(declare-fun b!453369 () Bool)

(assert (=> b!453369 (= e!265362 call!30051)))

(declare-fun b!453370 () Bool)

(assert (=> b!453370 (= e!265362 call!30051)))

(declare-fun b!453371 () Bool)

(assert (=> b!453371 (= e!265359 (contains!2488 lt!205709 (tuple2!8061 (_1!4041 lt!205326) (_2!4041 lt!205326))))))

(declare-fun b!453372 () Bool)

(assert (=> b!453372 (= e!265360 (insertStrictlySorted!196 (t!13933 (toList!3497 (+!1594 lt!205318 (tuple2!8061 k0!794 lt!205328)))) (_1!4041 lt!205326) (_2!4041 lt!205326)))))

(assert (= (and d!74345 c!56229) b!453363))

(assert (= (and d!74345 (not c!56229)) b!453366))

(assert (= (and b!453366 c!56230) b!453365))

(assert (= (and b!453366 (not c!56230)) b!453364))

(assert (= (and b!453364 c!56228) b!453370))

(assert (= (and b!453364 (not c!56228)) b!453369))

(assert (= (or b!453370 b!453369) bm!30049))

(assert (= (or b!453365 bm!30049) bm!30048))

(assert (= (or b!453363 bm!30048) bm!30047))

(assert (= (and bm!30047 c!56227) b!453372))

(assert (= (and bm!30047 (not c!56227)) b!453367))

(assert (= (and d!74345 res!270056) b!453368))

(assert (= (and b!453368 res!270055) b!453371))

(declare-fun m!437203 () Bool)

(assert (=> b!453371 m!437203))

(declare-fun m!437205 () Bool)

(assert (=> b!453372 m!437205))

(declare-fun m!437207 () Bool)

(assert (=> d!74345 m!437207))

(declare-fun m!437209 () Bool)

(assert (=> d!74345 m!437209))

(declare-fun m!437211 () Bool)

(assert (=> b!453368 m!437211))

(declare-fun m!437213 () Bool)

(assert (=> bm!30047 m!437213))

(assert (=> d!74135 d!74345))

(assert (=> bm!30018 d!74323))

(declare-fun d!74347 () Bool)

(declare-fun e!265365 () Bool)

(assert (=> d!74347 e!265365))

(declare-fun res!270057 () Bool)

(assert (=> d!74347 (=> res!270057 e!265365)))

(declare-fun lt!205710 () Bool)

(assert (=> d!74347 (= res!270057 (not lt!205710))))

(declare-fun lt!205712 () Bool)

(assert (=> d!74347 (= lt!205710 lt!205712)))

(declare-fun lt!205713 () Unit!13211)

(declare-fun e!265364 () Unit!13211)

(assert (=> d!74347 (= lt!205713 e!265364)))

(declare-fun c!56231 () Bool)

(assert (=> d!74347 (= c!56231 lt!205712)))

(assert (=> d!74347 (= lt!205712 (containsKey!345 (toList!3497 lt!205475) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74347 (= (contains!2487 lt!205475 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205710)))

(declare-fun b!453373 () Bool)

(declare-fun lt!205711 () Unit!13211)

(assert (=> b!453373 (= e!265364 lt!205711)))

(assert (=> b!453373 (= lt!205711 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205475) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453373 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205475) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453374 () Bool)

(declare-fun Unit!13236 () Unit!13211)

(assert (=> b!453374 (= e!265364 Unit!13236)))

(declare-fun b!453375 () Bool)

(assert (=> b!453375 (= e!265365 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205475) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74347 c!56231) b!453373))

(assert (= (and d!74347 (not c!56231)) b!453374))

(assert (= (and d!74347 (not res!270057)) b!453375))

(declare-fun m!437215 () Bool)

(assert (=> d!74347 m!437215))

(declare-fun m!437217 () Bool)

(assert (=> b!453373 m!437217))

(declare-fun m!437219 () Bool)

(assert (=> b!453373 m!437219))

(assert (=> b!453373 m!437219))

(declare-fun m!437221 () Bool)

(assert (=> b!453373 m!437221))

(assert (=> b!453375 m!437219))

(assert (=> b!453375 m!437219))

(assert (=> b!453375 m!437221))

(assert (=> d!74159 d!74347))

(assert (=> d!74159 d!74155))

(declare-fun d!74349 () Bool)

(declare-fun e!265367 () Bool)

(assert (=> d!74349 e!265367))

(declare-fun res!270058 () Bool)

(assert (=> d!74349 (=> res!270058 e!265367)))

(declare-fun lt!205714 () Bool)

(assert (=> d!74349 (= res!270058 (not lt!205714))))

(declare-fun lt!205716 () Bool)

(assert (=> d!74349 (= lt!205714 lt!205716)))

(declare-fun lt!205717 () Unit!13211)

(declare-fun e!265366 () Unit!13211)

(assert (=> d!74349 (= lt!205717 e!265366)))

(declare-fun c!56232 () Bool)

(assert (=> d!74349 (= c!56232 lt!205716)))

(assert (=> d!74349 (= lt!205716 (containsKey!345 (toList!3497 lt!205464) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74349 (= (contains!2487 lt!205464 #b1000000000000000000000000000000000000000000000000000000000000000) lt!205714)))

(declare-fun b!453376 () Bool)

(declare-fun lt!205715 () Unit!13211)

(assert (=> b!453376 (= e!265366 lt!205715)))

(assert (=> b!453376 (= lt!205715 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205464) #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453376 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205464) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453377 () Bool)

(declare-fun Unit!13237 () Unit!13211)

(assert (=> b!453377 (= e!265366 Unit!13237)))

(declare-fun b!453378 () Bool)

(assert (=> b!453378 (= e!265367 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205464) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74349 c!56232) b!453376))

(assert (= (and d!74349 (not c!56232)) b!453377))

(assert (= (and d!74349 (not res!270058)) b!453378))

(declare-fun m!437223 () Bool)

(assert (=> d!74349 m!437223))

(declare-fun m!437225 () Bool)

(assert (=> b!453376 m!437225))

(declare-fun m!437227 () Bool)

(assert (=> b!453376 m!437227))

(assert (=> b!453376 m!437227))

(declare-fun m!437229 () Bool)

(assert (=> b!453376 m!437229))

(assert (=> b!453378 m!437227))

(assert (=> b!453378 m!437227))

(assert (=> b!453378 m!437229))

(assert (=> b!452989 d!74349))

(assert (=> b!452986 d!74193))

(declare-fun d!74351 () Bool)

(declare-fun e!265369 () Bool)

(assert (=> d!74351 e!265369))

(declare-fun res!270059 () Bool)

(assert (=> d!74351 (=> res!270059 e!265369)))

(declare-fun lt!205718 () Bool)

(assert (=> d!74351 (= res!270059 (not lt!205718))))

(declare-fun lt!205720 () Bool)

(assert (=> d!74351 (= lt!205718 lt!205720)))

(declare-fun lt!205721 () Unit!13211)

(declare-fun e!265368 () Unit!13211)

(assert (=> d!74351 (= lt!205721 e!265368)))

(declare-fun c!56233 () Bool)

(assert (=> d!74351 (= c!56233 lt!205720)))

(assert (=> d!74351 (= lt!205720 (containsKey!345 (toList!3497 lt!205472) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(assert (=> d!74351 (= (contains!2487 lt!205472 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))) lt!205718)))

(declare-fun b!453379 () Bool)

(declare-fun lt!205719 () Unit!13211)

(assert (=> b!453379 (= e!265368 lt!205719)))

(assert (=> b!453379 (= lt!205719 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205472) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(assert (=> b!453379 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205472) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(declare-fun b!453380 () Bool)

(declare-fun Unit!13238 () Unit!13211)

(assert (=> b!453380 (= e!265368 Unit!13238)))

(declare-fun b!453381 () Bool)

(assert (=> b!453381 (= e!265369 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205472) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))))

(assert (= (and d!74351 c!56233) b!453379))

(assert (= (and d!74351 (not c!56233)) b!453380))

(assert (= (and d!74351 (not res!270059)) b!453381))

(declare-fun m!437231 () Bool)

(assert (=> d!74351 m!437231))

(declare-fun m!437233 () Bool)

(assert (=> b!453379 m!437233))

(assert (=> b!453379 m!436437))

(assert (=> b!453379 m!436437))

(declare-fun m!437235 () Bool)

(assert (=> b!453379 m!437235))

(assert (=> b!453381 m!436437))

(assert (=> b!453381 m!436437))

(assert (=> b!453381 m!437235))

(assert (=> d!74147 d!74351))

(declare-fun b!453384 () Bool)

(declare-fun e!265371 () Option!374)

(assert (=> b!453384 (= e!265371 (getValueByKey!368 (t!13933 lt!205469) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(declare-fun b!453385 () Bool)

(assert (=> b!453385 (= e!265371 None!372)))

(declare-fun c!56234 () Bool)

(declare-fun d!74353 () Bool)

(assert (=> d!74353 (= c!56234 (and ((_ is Cons!8114) lt!205469) (= (_1!4041 (h!8970 lt!205469)) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))))

(declare-fun e!265370 () Option!374)

(assert (=> d!74353 (= (getValueByKey!368 lt!205469 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))) e!265370)))

(declare-fun b!453383 () Bool)

(assert (=> b!453383 (= e!265370 e!265371)))

(declare-fun c!56235 () Bool)

(assert (=> b!453383 (= c!56235 (and ((_ is Cons!8114) lt!205469) (not (= (_1!4041 (h!8970 lt!205469)) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))))

(declare-fun b!453382 () Bool)

(assert (=> b!453382 (= e!265370 (Some!373 (_2!4041 (h!8970 lt!205469))))))

(assert (= (and d!74353 c!56234) b!453382))

(assert (= (and d!74353 (not c!56234)) b!453383))

(assert (= (and b!453383 c!56235) b!453384))

(assert (= (and b!453383 (not c!56235)) b!453385))

(declare-fun m!437237 () Bool)

(assert (=> b!453384 m!437237))

(assert (=> d!74147 d!74353))

(declare-fun d!74355 () Bool)

(assert (=> d!74355 (= (getValueByKey!368 lt!205469 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))) (Some!373 (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(declare-fun lt!205722 () Unit!13211)

(assert (=> d!74355 (= lt!205722 (choose!1337 lt!205469 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)) (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(declare-fun e!265372 () Bool)

(assert (=> d!74355 e!265372))

(declare-fun res!270060 () Bool)

(assert (=> d!74355 (=> (not res!270060) (not e!265372))))

(assert (=> d!74355 (= res!270060 (isStrictlySorted!373 lt!205469))))

(assert (=> d!74355 (= (lemmaContainsTupThenGetReturnValue!193 lt!205469 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)) (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))) lt!205722)))

(declare-fun b!453386 () Bool)

(declare-fun res!270061 () Bool)

(assert (=> b!453386 (=> (not res!270061) (not e!265372))))

(assert (=> b!453386 (= res!270061 (containsKey!345 lt!205469 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(declare-fun b!453387 () Bool)

(assert (=> b!453387 (= e!265372 (contains!2488 lt!205469 (tuple2!8061 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)) (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))))

(assert (= (and d!74355 res!270060) b!453386))

(assert (= (and b!453386 res!270061) b!453387))

(assert (=> d!74355 m!436431))

(declare-fun m!437239 () Bool)

(assert (=> d!74355 m!437239))

(declare-fun m!437241 () Bool)

(assert (=> d!74355 m!437241))

(declare-fun m!437243 () Bool)

(assert (=> b!453386 m!437243))

(declare-fun m!437245 () Bool)

(assert (=> b!453387 m!437245))

(assert (=> d!74147 d!74355))

(declare-fun d!74357 () Bool)

(declare-fun e!265373 () Bool)

(assert (=> d!74357 e!265373))

(declare-fun res!270063 () Bool)

(assert (=> d!74357 (=> (not res!270063) (not e!265373))))

(declare-fun lt!205723 () List!8118)

(assert (=> d!74357 (= res!270063 (isStrictlySorted!373 lt!205723))))

(declare-fun e!265377 () List!8118)

(assert (=> d!74357 (= lt!205723 e!265377)))

(declare-fun c!56238 () Bool)

(assert (=> d!74357 (= c!56238 (and ((_ is Cons!8114) (toList!3497 lt!205318)) (bvslt (_1!4041 (h!8970 (toList!3497 lt!205318))) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))))

(assert (=> d!74357 (isStrictlySorted!373 (toList!3497 lt!205318))))

(assert (=> d!74357 (= (insertStrictlySorted!196 (toList!3497 lt!205318) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)) (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))) lt!205723)))

(declare-fun b!453388 () Bool)

(declare-fun call!30053 () List!8118)

(assert (=> b!453388 (= e!265377 call!30053)))

(declare-fun bm!30050 () Bool)

(declare-fun e!265374 () List!8118)

(assert (=> bm!30050 (= call!30053 ($colon$colon!108 e!265374 (ite c!56238 (h!8970 (toList!3497 lt!205318)) (tuple2!8061 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)) (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))))

(declare-fun c!56236 () Bool)

(assert (=> bm!30050 (= c!56236 c!56238)))

(declare-fun b!453389 () Bool)

(declare-fun c!56237 () Bool)

(assert (=> b!453389 (= c!56237 (and ((_ is Cons!8114) (toList!3497 lt!205318)) (bvsgt (_1!4041 (h!8970 (toList!3497 lt!205318))) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))))

(declare-fun e!265375 () List!8118)

(declare-fun e!265376 () List!8118)

(assert (=> b!453389 (= e!265375 e!265376)))

(declare-fun b!453390 () Bool)

(declare-fun call!30055 () List!8118)

(assert (=> b!453390 (= e!265375 call!30055)))

(declare-fun b!453391 () Bool)

(assert (=> b!453391 (= e!265377 e!265375)))

(declare-fun c!56239 () Bool)

(assert (=> b!453391 (= c!56239 (and ((_ is Cons!8114) (toList!3497 lt!205318)) (= (_1!4041 (h!8970 (toList!3497 lt!205318))) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))))

(declare-fun b!453392 () Bool)

(assert (=> b!453392 (= e!265374 (ite c!56239 (t!13933 (toList!3497 lt!205318)) (ite c!56237 (Cons!8114 (h!8970 (toList!3497 lt!205318)) (t!13933 (toList!3497 lt!205318))) Nil!8115)))))

(declare-fun bm!30051 () Bool)

(assert (=> bm!30051 (= call!30055 call!30053)))

(declare-fun bm!30052 () Bool)

(declare-fun call!30054 () List!8118)

(assert (=> bm!30052 (= call!30054 call!30055)))

(declare-fun b!453393 () Bool)

(declare-fun res!270062 () Bool)

(assert (=> b!453393 (=> (not res!270062) (not e!265373))))

(assert (=> b!453393 (= res!270062 (containsKey!345 lt!205723 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(declare-fun b!453394 () Bool)

(assert (=> b!453394 (= e!265376 call!30054)))

(declare-fun b!453395 () Bool)

(assert (=> b!453395 (= e!265376 call!30054)))

(declare-fun b!453396 () Bool)

(assert (=> b!453396 (= e!265373 (contains!2488 lt!205723 (tuple2!8061 (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)) (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))))

(declare-fun b!453397 () Bool)

(assert (=> b!453397 (= e!265374 (insertStrictlySorted!196 (t!13933 (toList!3497 lt!205318)) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)) (_2!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(assert (= (and d!74357 c!56238) b!453388))

(assert (= (and d!74357 (not c!56238)) b!453391))

(assert (= (and b!453391 c!56239) b!453390))

(assert (= (and b!453391 (not c!56239)) b!453389))

(assert (= (and b!453389 c!56237) b!453395))

(assert (= (and b!453389 (not c!56237)) b!453394))

(assert (= (or b!453395 b!453394) bm!30052))

(assert (= (or b!453390 bm!30052) bm!30051))

(assert (= (or b!453388 bm!30051) bm!30050))

(assert (= (and bm!30050 c!56236) b!453397))

(assert (= (and bm!30050 (not c!56236)) b!453392))

(assert (= (and d!74357 res!270063) b!453393))

(assert (= (and b!453393 res!270062) b!453396))

(declare-fun m!437247 () Bool)

(assert (=> b!453396 m!437247))

(declare-fun m!437249 () Bool)

(assert (=> b!453397 m!437249))

(declare-fun m!437251 () Bool)

(assert (=> d!74357 m!437251))

(assert (=> d!74357 m!436901))

(declare-fun m!437253 () Bool)

(assert (=> b!453393 m!437253))

(declare-fun m!437255 () Bool)

(assert (=> bm!30050 m!437255))

(assert (=> d!74147 d!74357))

(assert (=> b!452934 d!74227))

(assert (=> b!453018 d!74127))

(declare-fun d!74359 () Bool)

(assert (=> d!74359 (= (apply!313 lt!205411 (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863))) (get!6655 (getValueByKey!368 (toList!3497 lt!205411) (select (arr!13481 (ite c!56079 _keys!709 lt!205321)) (bvadd #b00000000000000000000000000000001 from!863)))))))

(declare-fun bs!14380 () Bool)

(assert (= bs!14380 d!74359))

(assert (=> bs!14380 m!436269))

(assert (=> bs!14380 m!436761))

(assert (=> bs!14380 m!436761))

(declare-fun m!437257 () Bool)

(assert (=> bs!14380 m!437257))

(assert (=> b!452920 d!74359))

(assert (=> b!452920 d!74231))

(declare-fun d!74361 () Bool)

(assert (=> d!74361 (arrayContainsKey!0 lt!205321 lt!205489 #b00000000000000000000000000000000)))

(declare-fun lt!205726 () Unit!13211)

(declare-fun choose!13 (array!28073 (_ BitVec 64) (_ BitVec 32)) Unit!13211)

(assert (=> d!74361 (= lt!205726 (choose!13 lt!205321 lt!205489 #b00000000000000000000000000000000))))

(assert (=> d!74361 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!74361 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!205321 lt!205489 #b00000000000000000000000000000000) lt!205726)))

(declare-fun bs!14381 () Bool)

(assert (= bs!14381 d!74361))

(assert (=> bs!14381 m!436499))

(declare-fun m!437259 () Bool)

(assert (=> bs!14381 m!437259))

(assert (=> b!453025 d!74361))

(declare-fun d!74363 () Bool)

(declare-fun res!270064 () Bool)

(declare-fun e!265378 () Bool)

(assert (=> d!74363 (=> res!270064 e!265378)))

(assert (=> d!74363 (= res!270064 (= (select (arr!13481 lt!205321) #b00000000000000000000000000000000) lt!205489))))

(assert (=> d!74363 (= (arrayContainsKey!0 lt!205321 lt!205489 #b00000000000000000000000000000000) e!265378)))

(declare-fun b!453398 () Bool)

(declare-fun e!265379 () Bool)

(assert (=> b!453398 (= e!265378 e!265379)))

(declare-fun res!270065 () Bool)

(assert (=> b!453398 (=> (not res!270065) (not e!265379))))

(assert (=> b!453398 (= res!270065 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13834 lt!205321)))))

(declare-fun b!453399 () Bool)

(assert (=> b!453399 (= e!265379 (arrayContainsKey!0 lt!205321 lt!205489 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74363 (not res!270064)) b!453398))

(assert (= (and b!453398 res!270065) b!453399))

(assert (=> d!74363 m!436257))

(declare-fun m!437261 () Bool)

(assert (=> b!453399 m!437261))

(assert (=> b!453025 d!74363))

(declare-fun b!453412 () Bool)

(declare-fun e!265386 () SeekEntryResult!3527)

(declare-fun e!265388 () SeekEntryResult!3527)

(assert (=> b!453412 (= e!265386 e!265388)))

(declare-fun lt!205735 () (_ BitVec 64))

(declare-fun lt!205734 () SeekEntryResult!3527)

(assert (=> b!453412 (= lt!205735 (select (arr!13481 lt!205321) (index!16289 lt!205734)))))

(declare-fun c!56247 () Bool)

(assert (=> b!453412 (= c!56247 (= lt!205735 (select (arr!13481 lt!205321) #b00000000000000000000000000000000)))))

(declare-fun b!453413 () Bool)

(declare-fun e!265387 () SeekEntryResult!3527)

(declare-fun seekKeyOrZeroReturnVacant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!28073 (_ BitVec 32)) SeekEntryResult!3527)

(assert (=> b!453413 (= e!265387 (seekKeyOrZeroReturnVacant!0 (x!42451 lt!205734) (index!16289 lt!205734) (index!16289 lt!205734) (select (arr!13481 lt!205321) #b00000000000000000000000000000000) lt!205321 mask!1025))))

(declare-fun b!453414 () Bool)

(assert (=> b!453414 (= e!265386 Undefined!3527)))

(declare-fun d!74365 () Bool)

(declare-fun lt!205733 () SeekEntryResult!3527)

(assert (=> d!74365 (and (or ((_ is Undefined!3527) lt!205733) (not ((_ is Found!3527) lt!205733)) (and (bvsge (index!16288 lt!205733) #b00000000000000000000000000000000) (bvslt (index!16288 lt!205733) (size!13834 lt!205321)))) (or ((_ is Undefined!3527) lt!205733) ((_ is Found!3527) lt!205733) (not ((_ is MissingZero!3527) lt!205733)) (and (bvsge (index!16287 lt!205733) #b00000000000000000000000000000000) (bvslt (index!16287 lt!205733) (size!13834 lt!205321)))) (or ((_ is Undefined!3527) lt!205733) ((_ is Found!3527) lt!205733) ((_ is MissingZero!3527) lt!205733) (not ((_ is MissingVacant!3527) lt!205733)) (and (bvsge (index!16290 lt!205733) #b00000000000000000000000000000000) (bvslt (index!16290 lt!205733) (size!13834 lt!205321)))) (or ((_ is Undefined!3527) lt!205733) (ite ((_ is Found!3527) lt!205733) (= (select (arr!13481 lt!205321) (index!16288 lt!205733)) (select (arr!13481 lt!205321) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!3527) lt!205733) (= (select (arr!13481 lt!205321) (index!16287 lt!205733)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3527) lt!205733) (= (select (arr!13481 lt!205321) (index!16290 lt!205733)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74365 (= lt!205733 e!265386)))

(declare-fun c!56248 () Bool)

(assert (=> d!74365 (= c!56248 (and ((_ is Intermediate!3527) lt!205734) (undefined!4339 lt!205734)))))

(declare-fun seekKeyOrZeroOrLongMinValue!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 64) array!28073 (_ BitVec 32)) SeekEntryResult!3527)

(declare-fun toIndex!0 ((_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> d!74365 (= lt!205734 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!13481 lt!205321) #b00000000000000000000000000000000) mask!1025) (select (arr!13481 lt!205321) #b00000000000000000000000000000000) lt!205321 mask!1025))))

(assert (=> d!74365 (validMask!0 mask!1025)))

(assert (=> d!74365 (= (seekEntryOrOpen!0 (select (arr!13481 lt!205321) #b00000000000000000000000000000000) lt!205321 mask!1025) lt!205733)))

(declare-fun b!453415 () Bool)

(assert (=> b!453415 (= e!265387 (MissingZero!3527 (index!16289 lt!205734)))))

(declare-fun b!453416 () Bool)

(declare-fun c!56246 () Bool)

(assert (=> b!453416 (= c!56246 (= lt!205735 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453416 (= e!265388 e!265387)))

(declare-fun b!453417 () Bool)

(assert (=> b!453417 (= e!265388 (Found!3527 (index!16289 lt!205734)))))

(assert (= (and d!74365 c!56248) b!453414))

(assert (= (and d!74365 (not c!56248)) b!453412))

(assert (= (and b!453412 c!56247) b!453417))

(assert (= (and b!453412 (not c!56247)) b!453416))

(assert (= (and b!453416 c!56246) b!453415))

(assert (= (and b!453416 (not c!56246)) b!453413))

(declare-fun m!437263 () Bool)

(assert (=> b!453412 m!437263))

(assert (=> b!453413 m!436257))

(declare-fun m!437265 () Bool)

(assert (=> b!453413 m!437265))

(declare-fun m!437267 () Bool)

(assert (=> d!74365 m!437267))

(assert (=> d!74365 m!436257))

(declare-fun m!437269 () Bool)

(assert (=> d!74365 m!437269))

(declare-fun m!437271 () Bool)

(assert (=> d!74365 m!437271))

(declare-fun m!437273 () Bool)

(assert (=> d!74365 m!437273))

(assert (=> d!74365 m!436063))

(assert (=> d!74365 m!437269))

(assert (=> d!74365 m!436257))

(declare-fun m!437275 () Bool)

(assert (=> d!74365 m!437275))

(assert (=> b!453025 d!74365))

(declare-fun lt!205736 () Bool)

(declare-fun d!74367 () Bool)

(assert (=> d!74367 (= lt!205736 (select (content!205 (toList!3497 lt!205493)) (tuple2!8061 k0!794 v!412)))))

(declare-fun e!265390 () Bool)

(assert (=> d!74367 (= lt!205736 e!265390)))

(declare-fun res!270066 () Bool)

(assert (=> d!74367 (=> (not res!270066) (not e!265390))))

(assert (=> d!74367 (= res!270066 ((_ is Cons!8114) (toList!3497 lt!205493)))))

(assert (=> d!74367 (= (contains!2488 (toList!3497 lt!205493) (tuple2!8061 k0!794 v!412)) lt!205736)))

(declare-fun b!453418 () Bool)

(declare-fun e!265389 () Bool)

(assert (=> b!453418 (= e!265390 e!265389)))

(declare-fun res!270067 () Bool)

(assert (=> b!453418 (=> res!270067 e!265389)))

(assert (=> b!453418 (= res!270067 (= (h!8970 (toList!3497 lt!205493)) (tuple2!8061 k0!794 v!412)))))

(declare-fun b!453419 () Bool)

(assert (=> b!453419 (= e!265389 (contains!2488 (t!13933 (toList!3497 lt!205493)) (tuple2!8061 k0!794 v!412)))))

(assert (= (and d!74367 res!270066) b!453418))

(assert (= (and b!453418 (not res!270067)) b!453419))

(declare-fun m!437277 () Bool)

(assert (=> d!74367 m!437277))

(declare-fun m!437279 () Bool)

(assert (=> d!74367 m!437279))

(declare-fun m!437281 () Bool)

(assert (=> b!453419 m!437281))

(assert (=> b!453028 d!74367))

(declare-fun b!453422 () Bool)

(declare-fun e!265392 () Option!374)

(assert (=> b!453422 (= e!265392 (getValueByKey!368 (t!13933 (toList!3497 lt!205472)) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))

(declare-fun b!453423 () Bool)

(assert (=> b!453423 (= e!265392 None!372)))

(declare-fun c!56249 () Bool)

(declare-fun d!74369 () Bool)

(assert (=> d!74369 (= c!56249 (and ((_ is Cons!8114) (toList!3497 lt!205472)) (= (_1!4041 (h!8970 (toList!3497 lt!205472))) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320)))))))

(declare-fun e!265391 () Option!374)

(assert (=> d!74369 (= (getValueByKey!368 (toList!3497 lt!205472) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))) e!265391)))

(declare-fun b!453421 () Bool)

(assert (=> b!453421 (= e!265391 e!265392)))

(declare-fun c!56250 () Bool)

(assert (=> b!453421 (= c!56250 (and ((_ is Cons!8114) (toList!3497 lt!205472)) (not (= (_1!4041 (h!8970 (toList!3497 lt!205472))) (_1!4041 (tuple2!8061 (select (arr!13481 lt!205321) from!863) lt!205320))))))))

(declare-fun b!453420 () Bool)

(assert (=> b!453420 (= e!265391 (Some!373 (_2!4041 (h!8970 (toList!3497 lt!205472)))))))

(assert (= (and d!74369 c!56249) b!453420))

(assert (= (and d!74369 (not c!56249)) b!453421))

(assert (= (and b!453421 c!56250) b!453422))

(assert (= (and b!453421 (not c!56250)) b!453423))

(declare-fun m!437283 () Bool)

(assert (=> b!453422 m!437283))

(assert (=> b!452990 d!74369))

(declare-fun b!453424 () Bool)

(declare-fun e!265394 () Bool)

(declare-fun call!30056 () Bool)

(assert (=> b!453424 (= e!265394 call!30056)))

(declare-fun b!453425 () Bool)

(declare-fun e!265396 () Bool)

(declare-fun e!265395 () Bool)

(assert (=> b!453425 (= e!265396 e!265395)))

(declare-fun res!270068 () Bool)

(assert (=> b!453425 (=> (not res!270068) (not e!265395))))

(declare-fun e!265393 () Bool)

(assert (=> b!453425 (= res!270068 (not e!265393))))

(declare-fun res!270069 () Bool)

(assert (=> b!453425 (=> (not res!270069) (not e!265393))))

(assert (=> b!453425 (= res!270069 (validKeyInArray!0 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453426 () Bool)

(assert (=> b!453426 (= e!265394 call!30056)))

(declare-fun d!74371 () Bool)

(declare-fun res!270070 () Bool)

(assert (=> d!74371 (=> res!270070 e!265396)))

(assert (=> d!74371 (= res!270070 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13834 lt!205321)))))

(assert (=> d!74371 (= (arrayNoDuplicates!0 lt!205321 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56088 (Cons!8113 (select (arr!13481 lt!205321) #b00000000000000000000000000000000) Nil!8114) Nil!8114)) e!265396)))

(declare-fun b!453427 () Bool)

(assert (=> b!453427 (= e!265395 e!265394)))

(declare-fun c!56251 () Bool)

(assert (=> b!453427 (= c!56251 (validKeyInArray!0 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun b!453428 () Bool)

(assert (=> b!453428 (= e!265393 (contains!2486 (ite c!56088 (Cons!8113 (select (arr!13481 lt!205321) #b00000000000000000000000000000000) Nil!8114) Nil!8114) (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun bm!30053 () Bool)

(assert (=> bm!30053 (= call!30056 (arrayNoDuplicates!0 lt!205321 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) (ite c!56251 (Cons!8113 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) (ite c!56088 (Cons!8113 (select (arr!13481 lt!205321) #b00000000000000000000000000000000) Nil!8114) Nil!8114)) (ite c!56088 (Cons!8113 (select (arr!13481 lt!205321) #b00000000000000000000000000000000) Nil!8114) Nil!8114))))))

(assert (= (and d!74371 (not res!270070)) b!453425))

(assert (= (and b!453425 res!270069) b!453428))

(assert (= (and b!453425 res!270068) b!453427))

(assert (= (and b!453427 c!56251) b!453426))

(assert (= (and b!453427 (not c!56251)) b!453424))

(assert (= (or b!453426 b!453424) bm!30053))

(declare-fun m!437285 () Bool)

(assert (=> b!453425 m!437285))

(assert (=> b!453425 m!437285))

(declare-fun m!437287 () Bool)

(assert (=> b!453425 m!437287))

(assert (=> b!453427 m!437285))

(assert (=> b!453427 m!437285))

(assert (=> b!453427 m!437287))

(assert (=> b!453428 m!437285))

(assert (=> b!453428 m!437285))

(declare-fun m!437289 () Bool)

(assert (=> b!453428 m!437289))

(assert (=> bm!30053 m!437285))

(declare-fun m!437291 () Bool)

(assert (=> bm!30053 m!437291))

(assert (=> bm!30004 d!74371))

(declare-fun d!74373 () Bool)

(declare-fun e!265398 () Bool)

(assert (=> d!74373 e!265398))

(declare-fun res!270071 () Bool)

(assert (=> d!74373 (=> res!270071 e!265398)))

(declare-fun lt!205737 () Bool)

(assert (=> d!74373 (= res!270071 (not lt!205737))))

(declare-fun lt!205739 () Bool)

(assert (=> d!74373 (= lt!205737 lt!205739)))

(declare-fun lt!205740 () Unit!13211)

(declare-fun e!265397 () Unit!13211)

(assert (=> d!74373 (= lt!205740 e!265397)))

(declare-fun c!56252 () Bool)

(assert (=> d!74373 (= c!56252 lt!205739)))

(assert (=> d!74373 (= lt!205739 (containsKey!345 (toList!3497 lt!205461) (_1!4041 lt!205326)))))

(assert (=> d!74373 (= (contains!2487 lt!205461 (_1!4041 lt!205326)) lt!205737)))

(declare-fun b!453429 () Bool)

(declare-fun lt!205738 () Unit!13211)

(assert (=> b!453429 (= e!265397 lt!205738)))

(assert (=> b!453429 (= lt!205738 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205461) (_1!4041 lt!205326)))))

(assert (=> b!453429 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205461) (_1!4041 lt!205326)))))

(declare-fun b!453430 () Bool)

(declare-fun Unit!13239 () Unit!13211)

(assert (=> b!453430 (= e!265397 Unit!13239)))

(declare-fun b!453431 () Bool)

(assert (=> b!453431 (= e!265398 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205461) (_1!4041 lt!205326))))))

(assert (= (and d!74373 c!56252) b!453429))

(assert (= (and d!74373 (not c!56252)) b!453430))

(assert (= (and d!74373 (not res!270071)) b!453431))

(declare-fun m!437293 () Bool)

(assert (=> d!74373 m!437293))

(declare-fun m!437295 () Bool)

(assert (=> b!453429 m!437295))

(assert (=> b!453429 m!436397))

(assert (=> b!453429 m!436397))

(declare-fun m!437297 () Bool)

(assert (=> b!453429 m!437297))

(assert (=> b!453431 m!436397))

(assert (=> b!453431 m!436397))

(assert (=> b!453431 m!437297))

(assert (=> d!74143 d!74373))

(declare-fun b!453434 () Bool)

(declare-fun e!265400 () Option!374)

(assert (=> b!453434 (= e!265400 (getValueByKey!368 (t!13933 lt!205458) (_1!4041 lt!205326)))))

(declare-fun b!453435 () Bool)

(assert (=> b!453435 (= e!265400 None!372)))

(declare-fun d!74375 () Bool)

(declare-fun c!56253 () Bool)

(assert (=> d!74375 (= c!56253 (and ((_ is Cons!8114) lt!205458) (= (_1!4041 (h!8970 lt!205458)) (_1!4041 lt!205326))))))

(declare-fun e!265399 () Option!374)

(assert (=> d!74375 (= (getValueByKey!368 lt!205458 (_1!4041 lt!205326)) e!265399)))

(declare-fun b!453433 () Bool)

(assert (=> b!453433 (= e!265399 e!265400)))

(declare-fun c!56254 () Bool)

(assert (=> b!453433 (= c!56254 (and ((_ is Cons!8114) lt!205458) (not (= (_1!4041 (h!8970 lt!205458)) (_1!4041 lt!205326)))))))

(declare-fun b!453432 () Bool)

(assert (=> b!453432 (= e!265399 (Some!373 (_2!4041 (h!8970 lt!205458))))))

(assert (= (and d!74375 c!56253) b!453432))

(assert (= (and d!74375 (not c!56253)) b!453433))

(assert (= (and b!453433 c!56254) b!453434))

(assert (= (and b!453433 (not c!56254)) b!453435))

(declare-fun m!437299 () Bool)

(assert (=> b!453434 m!437299))

(assert (=> d!74143 d!74375))

(declare-fun d!74377 () Bool)

(assert (=> d!74377 (= (getValueByKey!368 lt!205458 (_1!4041 lt!205326)) (Some!373 (_2!4041 lt!205326)))))

(declare-fun lt!205741 () Unit!13211)

(assert (=> d!74377 (= lt!205741 (choose!1337 lt!205458 (_1!4041 lt!205326) (_2!4041 lt!205326)))))

(declare-fun e!265401 () Bool)

(assert (=> d!74377 e!265401))

(declare-fun res!270072 () Bool)

(assert (=> d!74377 (=> (not res!270072) (not e!265401))))

(assert (=> d!74377 (= res!270072 (isStrictlySorted!373 lt!205458))))

(assert (=> d!74377 (= (lemmaContainsTupThenGetReturnValue!193 lt!205458 (_1!4041 lt!205326) (_2!4041 lt!205326)) lt!205741)))

(declare-fun b!453436 () Bool)

(declare-fun res!270073 () Bool)

(assert (=> b!453436 (=> (not res!270073) (not e!265401))))

(assert (=> b!453436 (= res!270073 (containsKey!345 lt!205458 (_1!4041 lt!205326)))))

(declare-fun b!453437 () Bool)

(assert (=> b!453437 (= e!265401 (contains!2488 lt!205458 (tuple2!8061 (_1!4041 lt!205326) (_2!4041 lt!205326))))))

(assert (= (and d!74377 res!270072) b!453436))

(assert (= (and b!453436 res!270073) b!453437))

(assert (=> d!74377 m!436391))

(declare-fun m!437301 () Bool)

(assert (=> d!74377 m!437301))

(declare-fun m!437303 () Bool)

(assert (=> d!74377 m!437303))

(declare-fun m!437305 () Bool)

(assert (=> b!453436 m!437305))

(declare-fun m!437307 () Bool)

(assert (=> b!453437 m!437307))

(assert (=> d!74143 d!74377))

(declare-fun d!74379 () Bool)

(declare-fun e!265402 () Bool)

(assert (=> d!74379 e!265402))

(declare-fun res!270075 () Bool)

(assert (=> d!74379 (=> (not res!270075) (not e!265402))))

(declare-fun lt!205742 () List!8118)

(assert (=> d!74379 (= res!270075 (isStrictlySorted!373 lt!205742))))

(declare-fun e!265406 () List!8118)

(assert (=> d!74379 (= lt!205742 e!265406)))

(declare-fun c!56257 () Bool)

(assert (=> d!74379 (= c!56257 (and ((_ is Cons!8114) (toList!3497 lt!205318)) (bvslt (_1!4041 (h!8970 (toList!3497 lt!205318))) (_1!4041 lt!205326))))))

(assert (=> d!74379 (isStrictlySorted!373 (toList!3497 lt!205318))))

(assert (=> d!74379 (= (insertStrictlySorted!196 (toList!3497 lt!205318) (_1!4041 lt!205326) (_2!4041 lt!205326)) lt!205742)))

(declare-fun b!453438 () Bool)

(declare-fun call!30057 () List!8118)

(assert (=> b!453438 (= e!265406 call!30057)))

(declare-fun bm!30054 () Bool)

(declare-fun e!265403 () List!8118)

(assert (=> bm!30054 (= call!30057 ($colon$colon!108 e!265403 (ite c!56257 (h!8970 (toList!3497 lt!205318)) (tuple2!8061 (_1!4041 lt!205326) (_2!4041 lt!205326)))))))

(declare-fun c!56255 () Bool)

(assert (=> bm!30054 (= c!56255 c!56257)))

(declare-fun b!453439 () Bool)

(declare-fun c!56256 () Bool)

(assert (=> b!453439 (= c!56256 (and ((_ is Cons!8114) (toList!3497 lt!205318)) (bvsgt (_1!4041 (h!8970 (toList!3497 lt!205318))) (_1!4041 lt!205326))))))

(declare-fun e!265404 () List!8118)

(declare-fun e!265405 () List!8118)

(assert (=> b!453439 (= e!265404 e!265405)))

(declare-fun b!453440 () Bool)

(declare-fun call!30059 () List!8118)

(assert (=> b!453440 (= e!265404 call!30059)))

(declare-fun b!453441 () Bool)

(assert (=> b!453441 (= e!265406 e!265404)))

(declare-fun c!56258 () Bool)

(assert (=> b!453441 (= c!56258 (and ((_ is Cons!8114) (toList!3497 lt!205318)) (= (_1!4041 (h!8970 (toList!3497 lt!205318))) (_1!4041 lt!205326))))))

(declare-fun b!453442 () Bool)

(assert (=> b!453442 (= e!265403 (ite c!56258 (t!13933 (toList!3497 lt!205318)) (ite c!56256 (Cons!8114 (h!8970 (toList!3497 lt!205318)) (t!13933 (toList!3497 lt!205318))) Nil!8115)))))

(declare-fun bm!30055 () Bool)

(assert (=> bm!30055 (= call!30059 call!30057)))

(declare-fun bm!30056 () Bool)

(declare-fun call!30058 () List!8118)

(assert (=> bm!30056 (= call!30058 call!30059)))

(declare-fun b!453443 () Bool)

(declare-fun res!270074 () Bool)

(assert (=> b!453443 (=> (not res!270074) (not e!265402))))

(assert (=> b!453443 (= res!270074 (containsKey!345 lt!205742 (_1!4041 lt!205326)))))

(declare-fun b!453444 () Bool)

(assert (=> b!453444 (= e!265405 call!30058)))

(declare-fun b!453445 () Bool)

(assert (=> b!453445 (= e!265405 call!30058)))

(declare-fun b!453446 () Bool)

(assert (=> b!453446 (= e!265402 (contains!2488 lt!205742 (tuple2!8061 (_1!4041 lt!205326) (_2!4041 lt!205326))))))

(declare-fun b!453447 () Bool)

(assert (=> b!453447 (= e!265403 (insertStrictlySorted!196 (t!13933 (toList!3497 lt!205318)) (_1!4041 lt!205326) (_2!4041 lt!205326)))))

(assert (= (and d!74379 c!56257) b!453438))

(assert (= (and d!74379 (not c!56257)) b!453441))

(assert (= (and b!453441 c!56258) b!453440))

(assert (= (and b!453441 (not c!56258)) b!453439))

(assert (= (and b!453439 c!56256) b!453445))

(assert (= (and b!453439 (not c!56256)) b!453444))

(assert (= (or b!453445 b!453444) bm!30056))

(assert (= (or b!453440 bm!30056) bm!30055))

(assert (= (or b!453438 bm!30055) bm!30054))

(assert (= (and bm!30054 c!56255) b!453447))

(assert (= (and bm!30054 (not c!56255)) b!453442))

(assert (= (and d!74379 res!270075) b!453443))

(assert (= (and b!453443 res!270074) b!453446))

(declare-fun m!437309 () Bool)

(assert (=> b!453446 m!437309))

(declare-fun m!437311 () Bool)

(assert (=> b!453447 m!437311))

(declare-fun m!437313 () Bool)

(assert (=> d!74379 m!437313))

(assert (=> d!74379 m!436901))

(declare-fun m!437315 () Bool)

(assert (=> b!453443 m!437315))

(declare-fun m!437317 () Bool)

(assert (=> bm!30054 m!437317))

(assert (=> d!74143 d!74379))

(declare-fun d!74381 () Bool)

(assert (=> d!74381 (= (get!6654 (select (arr!13482 _values!549) from!863) lt!205323) lt!205323)))

(assert (=> b!452993 d!74381))

(declare-fun d!74383 () Bool)

(declare-fun e!265409 () Bool)

(assert (=> d!74383 e!265409))

(declare-fun c!56261 () Bool)

(assert (=> d!74383 (= c!56261 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(assert (=> d!74383 true))

(declare-fun _$4!58 () Unit!13211)

(assert (=> d!74383 (= (choose!1334 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) _$4!58)))

(declare-fun call!30064 () ListLongMap!6963)

(declare-fun bm!30062 () Bool)

(assert (=> bm!30062 (= call!30064 (getCurrentListMapNoExtraKeys!1692 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!30065 () ListLongMap!6963)

(declare-fun b!453452 () Bool)

(assert (=> b!453452 (= e!265409 (= call!30065 (+!1594 call!30064 (tuple2!8061 k0!794 v!412))))))

(declare-fun b!453453 () Bool)

(assert (=> b!453453 (= e!265409 (= call!30065 call!30064))))

(declare-fun bm!30061 () Bool)

(assert (=> bm!30061 (= call!30065 (getCurrentListMapNoExtraKeys!1692 (array!28074 (store (arr!13481 _keys!709) i!563 k0!794) (size!13834 _keys!709)) (array!28076 (store (arr!13482 _values!549) i!563 (ValueCellFull!5726 v!412)) (size!13835 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and d!74383 c!56261) b!453452))

(assert (= (and d!74383 (not c!56261)) b!453453))

(assert (= (or b!453452 b!453453) bm!30061))

(assert (= (or b!453452 b!453453) bm!30062))

(assert (=> bm!30062 m!436329))

(declare-fun m!437319 () Bool)

(assert (=> b!453452 m!437319))

(assert (=> bm!30061 m!436103))

(assert (=> bm!30061 m!436073))

(assert (=> bm!30061 m!436331))

(assert (=> d!74129 d!74383))

(declare-fun d!74385 () Bool)

(assert (=> d!74385 (= (isEmpty!563 lt!205411) (isEmpty!564 (toList!3497 lt!205411)))))

(declare-fun bs!14382 () Bool)

(assert (= bs!14382 d!74385))

(declare-fun m!437321 () Bool)

(assert (=> bs!14382 m!437321))

(assert (=> b!452918 d!74385))

(assert (=> b!452883 d!74241))

(declare-fun d!74387 () Bool)

(declare-fun e!265411 () Bool)

(assert (=> d!74387 e!265411))

(declare-fun res!270076 () Bool)

(assert (=> d!74387 (=> res!270076 e!265411)))

(declare-fun lt!205743 () Bool)

(assert (=> d!74387 (= res!270076 (not lt!205743))))

(declare-fun lt!205745 () Bool)

(assert (=> d!74387 (= lt!205743 lt!205745)))

(declare-fun lt!205746 () Unit!13211)

(declare-fun e!265410 () Unit!13211)

(assert (=> d!74387 (= lt!205746 e!265410)))

(declare-fun c!56262 () Bool)

(assert (=> d!74387 (= c!56262 lt!205745)))

(assert (=> d!74387 (= lt!205745 (containsKey!345 (toList!3497 lt!205418) (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> d!74387 (= (contains!2487 lt!205418 (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))) lt!205743)))

(declare-fun b!453454 () Bool)

(declare-fun lt!205744 () Unit!13211)

(assert (=> b!453454 (= e!265410 lt!205744)))

(assert (=> b!453454 (= lt!205744 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205418) (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!453454 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205418) (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!453455 () Bool)

(declare-fun Unit!13240 () Unit!13211)

(assert (=> b!453455 (= e!265410 Unit!13240)))

(declare-fun b!453456 () Bool)

(assert (=> b!453456 (= e!265411 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205418) (select (arr!13481 (ite c!56079 lt!205321 _keys!709)) (bvadd #b00000000000000000000000000000001 from!863)))))))

(assert (= (and d!74387 c!56262) b!453454))

(assert (= (and d!74387 (not c!56262)) b!453455))

(assert (= (and d!74387 (not res!270076)) b!453456))

(assert (=> d!74387 m!436297))

(declare-fun m!437323 () Bool)

(assert (=> d!74387 m!437323))

(assert (=> b!453454 m!436297))

(declare-fun m!437325 () Bool)

(assert (=> b!453454 m!437325))

(assert (=> b!453454 m!436297))

(assert (=> b!453454 m!437097))

(assert (=> b!453454 m!437097))

(declare-fun m!437327 () Bool)

(assert (=> b!453454 m!437327))

(assert (=> b!453456 m!436297))

(assert (=> b!453456 m!437097))

(assert (=> b!453456 m!437097))

(assert (=> b!453456 m!437327))

(assert (=> b!452927 d!74387))

(declare-fun d!74389 () Bool)

(assert (=> d!74389 (arrayContainsKey!0 _keys!709 lt!205434 #b00000000000000000000000000000000)))

(declare-fun lt!205747 () Unit!13211)

(assert (=> d!74389 (= lt!205747 (choose!13 _keys!709 lt!205434 #b00000000000000000000000000000000))))

(assert (=> d!74389 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(assert (=> d!74389 (= (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!205434 #b00000000000000000000000000000000) lt!205747)))

(declare-fun bs!14383 () Bool)

(assert (= bs!14383 d!74389))

(assert (=> bs!14383 m!436335))

(declare-fun m!437329 () Bool)

(assert (=> bs!14383 m!437329))

(assert (=> b!452958 d!74389))

(declare-fun d!74391 () Bool)

(declare-fun res!270077 () Bool)

(declare-fun e!265412 () Bool)

(assert (=> d!74391 (=> res!270077 e!265412)))

(assert (=> d!74391 (= res!270077 (= (select (arr!13481 _keys!709) #b00000000000000000000000000000000) lt!205434))))

(assert (=> d!74391 (= (arrayContainsKey!0 _keys!709 lt!205434 #b00000000000000000000000000000000) e!265412)))

(declare-fun b!453457 () Bool)

(declare-fun e!265413 () Bool)

(assert (=> b!453457 (= e!265412 e!265413)))

(declare-fun res!270078 () Bool)

(assert (=> b!453457 (=> (not res!270078) (not e!265413))))

(assert (=> b!453457 (= res!270078 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13834 _keys!709)))))

(declare-fun b!453458 () Bool)

(assert (=> b!453458 (= e!265413 (arrayContainsKey!0 _keys!709 lt!205434 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74391 (not res!270077)) b!453457))

(assert (= (and b!453457 res!270078) b!453458))

(assert (=> d!74391 m!436265))

(declare-fun m!437331 () Bool)

(assert (=> b!453458 m!437331))

(assert (=> b!452958 d!74391))

(declare-fun b!453459 () Bool)

(declare-fun e!265414 () SeekEntryResult!3527)

(declare-fun e!265416 () SeekEntryResult!3527)

(assert (=> b!453459 (= e!265414 e!265416)))

(declare-fun lt!205750 () (_ BitVec 64))

(declare-fun lt!205749 () SeekEntryResult!3527)

(assert (=> b!453459 (= lt!205750 (select (arr!13481 _keys!709) (index!16289 lt!205749)))))

(declare-fun c!56264 () Bool)

(assert (=> b!453459 (= c!56264 (= lt!205750 (select (arr!13481 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!453460 () Bool)

(declare-fun e!265415 () SeekEntryResult!3527)

(assert (=> b!453460 (= e!265415 (seekKeyOrZeroReturnVacant!0 (x!42451 lt!205749) (index!16289 lt!205749) (index!16289 lt!205749) (select (arr!13481 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025))))

(declare-fun b!453461 () Bool)

(assert (=> b!453461 (= e!265414 Undefined!3527)))

(declare-fun d!74393 () Bool)

(declare-fun lt!205748 () SeekEntryResult!3527)

(assert (=> d!74393 (and (or ((_ is Undefined!3527) lt!205748) (not ((_ is Found!3527) lt!205748)) (and (bvsge (index!16288 lt!205748) #b00000000000000000000000000000000) (bvslt (index!16288 lt!205748) (size!13834 _keys!709)))) (or ((_ is Undefined!3527) lt!205748) ((_ is Found!3527) lt!205748) (not ((_ is MissingZero!3527) lt!205748)) (and (bvsge (index!16287 lt!205748) #b00000000000000000000000000000000) (bvslt (index!16287 lt!205748) (size!13834 _keys!709)))) (or ((_ is Undefined!3527) lt!205748) ((_ is Found!3527) lt!205748) ((_ is MissingZero!3527) lt!205748) (not ((_ is MissingVacant!3527) lt!205748)) (and (bvsge (index!16290 lt!205748) #b00000000000000000000000000000000) (bvslt (index!16290 lt!205748) (size!13834 _keys!709)))) (or ((_ is Undefined!3527) lt!205748) (ite ((_ is Found!3527) lt!205748) (= (select (arr!13481 _keys!709) (index!16288 lt!205748)) (select (arr!13481 _keys!709) #b00000000000000000000000000000000)) (ite ((_ is MissingZero!3527) lt!205748) (= (select (arr!13481 _keys!709) (index!16287 lt!205748)) #b0000000000000000000000000000000000000000000000000000000000000000) (and ((_ is MissingVacant!3527) lt!205748) (= (select (arr!13481 _keys!709) (index!16290 lt!205748)) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74393 (= lt!205748 e!265414)))

(declare-fun c!56265 () Bool)

(assert (=> d!74393 (= c!56265 (and ((_ is Intermediate!3527) lt!205749) (undefined!4339 lt!205749)))))

(assert (=> d!74393 (= lt!205749 (seekKeyOrZeroOrLongMinValue!0 #b00000000000000000000000000000000 (toIndex!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) mask!1025) (select (arr!13481 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025))))

(assert (=> d!74393 (validMask!0 mask!1025)))

(assert (=> d!74393 (= (seekEntryOrOpen!0 (select (arr!13481 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) lt!205748)))

(declare-fun b!453462 () Bool)

(assert (=> b!453462 (= e!265415 (MissingZero!3527 (index!16289 lt!205749)))))

(declare-fun b!453463 () Bool)

(declare-fun c!56263 () Bool)

(assert (=> b!453463 (= c!56263 (= lt!205750 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453463 (= e!265416 e!265415)))

(declare-fun b!453464 () Bool)

(assert (=> b!453464 (= e!265416 (Found!3527 (index!16289 lt!205749)))))

(assert (= (and d!74393 c!56265) b!453461))

(assert (= (and d!74393 (not c!56265)) b!453459))

(assert (= (and b!453459 c!56264) b!453464))

(assert (= (and b!453459 (not c!56264)) b!453463))

(assert (= (and b!453463 c!56263) b!453462))

(assert (= (and b!453463 (not c!56263)) b!453460))

(declare-fun m!437333 () Bool)

(assert (=> b!453459 m!437333))

(assert (=> b!453460 m!436265))

(declare-fun m!437335 () Bool)

(assert (=> b!453460 m!437335))

(declare-fun m!437337 () Bool)

(assert (=> d!74393 m!437337))

(assert (=> d!74393 m!436265))

(declare-fun m!437339 () Bool)

(assert (=> d!74393 m!437339))

(declare-fun m!437341 () Bool)

(assert (=> d!74393 m!437341))

(declare-fun m!437343 () Bool)

(assert (=> d!74393 m!437343))

(assert (=> d!74393 m!436063))

(assert (=> d!74393 m!437339))

(assert (=> d!74393 m!436265))

(declare-fun m!437345 () Bool)

(assert (=> d!74393 m!437345))

(assert (=> b!452958 d!74393))

(declare-fun d!74395 () Bool)

(declare-fun e!265418 () Bool)

(assert (=> d!74395 e!265418))

(declare-fun res!270079 () Bool)

(assert (=> d!74395 (=> res!270079 e!265418)))

(declare-fun lt!205751 () Bool)

(assert (=> d!74395 (= res!270079 (not lt!205751))))

(declare-fun lt!205753 () Bool)

(assert (=> d!74395 (= lt!205751 lt!205753)))

(declare-fun lt!205754 () Unit!13211)

(declare-fun e!265417 () Unit!13211)

(assert (=> d!74395 (= lt!205754 e!265417)))

(declare-fun c!56266 () Bool)

(assert (=> d!74395 (= c!56266 lt!205753)))

(assert (=> d!74395 (= lt!205753 (containsKey!345 (toList!3497 lt!205482) (select (arr!13481 _keys!709) from!863)))))

(assert (=> d!74395 (= (contains!2487 lt!205482 (select (arr!13481 _keys!709) from!863)) lt!205751)))

(declare-fun b!453465 () Bool)

(declare-fun lt!205752 () Unit!13211)

(assert (=> b!453465 (= e!265417 lt!205752)))

(assert (=> b!453465 (= lt!205752 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205482) (select (arr!13481 _keys!709) from!863)))))

(assert (=> b!453465 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205482) (select (arr!13481 _keys!709) from!863)))))

(declare-fun b!453466 () Bool)

(declare-fun Unit!13241 () Unit!13211)

(assert (=> b!453466 (= e!265417 Unit!13241)))

(declare-fun b!453467 () Bool)

(assert (=> b!453467 (= e!265418 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205482) (select (arr!13481 _keys!709) from!863))))))

(assert (= (and d!74395 c!56266) b!453465))

(assert (= (and d!74395 (not c!56266)) b!453466))

(assert (= (and d!74395 (not res!270079)) b!453467))

(assert (=> d!74395 m!436057))

(declare-fun m!437347 () Bool)

(assert (=> d!74395 m!437347))

(assert (=> b!453465 m!436057))

(declare-fun m!437349 () Bool)

(assert (=> b!453465 m!437349))

(assert (=> b!453465 m!436057))

(assert (=> b!453465 m!437089))

(assert (=> b!453465 m!437089))

(declare-fun m!437351 () Bool)

(assert (=> b!453465 m!437351))

(assert (=> b!453467 m!436057))

(assert (=> b!453467 m!437089))

(assert (=> b!453467 m!437089))

(assert (=> b!453467 m!437351))

(assert (=> b!453011 d!74395))

(assert (=> b!453006 d!74283))

(declare-fun d!74397 () Bool)

(declare-fun lt!205755 () Bool)

(assert (=> d!74397 (= lt!205755 (select (content!205 (toList!3497 lt!205453)) (tuple2!8061 k0!794 lt!205328)))))

(declare-fun e!265420 () Bool)

(assert (=> d!74397 (= lt!205755 e!265420)))

(declare-fun res!270080 () Bool)

(assert (=> d!74397 (=> (not res!270080) (not e!265420))))

(assert (=> d!74397 (= res!270080 ((_ is Cons!8114) (toList!3497 lt!205453)))))

(assert (=> d!74397 (= (contains!2488 (toList!3497 lt!205453) (tuple2!8061 k0!794 lt!205328)) lt!205755)))

(declare-fun b!453468 () Bool)

(declare-fun e!265419 () Bool)

(assert (=> b!453468 (= e!265420 e!265419)))

(declare-fun res!270081 () Bool)

(assert (=> b!453468 (=> res!270081 e!265419)))

(assert (=> b!453468 (= res!270081 (= (h!8970 (toList!3497 lt!205453)) (tuple2!8061 k0!794 lt!205328)))))

(declare-fun b!453469 () Bool)

(assert (=> b!453469 (= e!265419 (contains!2488 (t!13933 (toList!3497 lt!205453)) (tuple2!8061 k0!794 lt!205328)))))

(assert (= (and d!74397 res!270080) b!453468))

(assert (= (and b!453468 (not res!270081)) b!453469))

(declare-fun m!437353 () Bool)

(assert (=> d!74397 m!437353))

(declare-fun m!437355 () Bool)

(assert (=> d!74397 m!437355))

(declare-fun m!437357 () Bool)

(assert (=> b!453469 m!437357))

(assert (=> b!452967 d!74397))

(declare-fun d!74399 () Bool)

(declare-fun e!265422 () Bool)

(assert (=> d!74399 e!265422))

(declare-fun res!270082 () Bool)

(assert (=> d!74399 (=> res!270082 e!265422)))

(declare-fun lt!205756 () Bool)

(assert (=> d!74399 (= res!270082 (not lt!205756))))

(declare-fun lt!205758 () Bool)

(assert (=> d!74399 (= lt!205756 lt!205758)))

(declare-fun lt!205759 () Unit!13211)

(declare-fun e!265421 () Unit!13211)

(assert (=> d!74399 (= lt!205759 e!265421)))

(declare-fun c!56267 () Bool)

(assert (=> d!74399 (= c!56267 lt!205758)))

(assert (=> d!74399 (= lt!205758 (containsKey!345 (toList!3497 lt!205464) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!74399 (= (contains!2487 lt!205464 #b0000000000000000000000000000000000000000000000000000000000000000) lt!205756)))

(declare-fun b!453470 () Bool)

(declare-fun lt!205757 () Unit!13211)

(assert (=> b!453470 (= e!265421 lt!205757)))

(assert (=> b!453470 (= lt!205757 (lemmaContainsKeyImpliesGetValueByKeyDefined!294 (toList!3497 lt!205464) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!453470 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205464) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!453471 () Bool)

(declare-fun Unit!13242 () Unit!13211)

(assert (=> b!453471 (= e!265421 Unit!13242)))

(declare-fun b!453472 () Bool)

(assert (=> b!453472 (= e!265422 (isDefined!295 (getValueByKey!368 (toList!3497 lt!205464) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74399 c!56267) b!453470))

(assert (= (and d!74399 (not c!56267)) b!453471))

(assert (= (and d!74399 (not res!270082)) b!453472))

(declare-fun m!437359 () Bool)

(assert (=> d!74399 m!437359))

(declare-fun m!437361 () Bool)

(assert (=> b!453470 m!437361))

(declare-fun m!437363 () Bool)

(assert (=> b!453470 m!437363))

(assert (=> b!453470 m!437363))

(declare-fun m!437365 () Bool)

(assert (=> b!453470 m!437365))

(assert (=> b!453472 m!437363))

(assert (=> b!453472 m!437363))

(assert (=> b!453472 m!437365))

(assert (=> d!74145 d!74399))

(assert (=> d!74145 d!74155))

(declare-fun b!453473 () Bool)

(declare-fun e!265425 () Bool)

(declare-fun call!30066 () Bool)

(assert (=> b!453473 (= e!265425 call!30066)))

(declare-fun b!453474 () Bool)

(declare-fun e!265423 () Bool)

(assert (=> b!453474 (= e!265423 call!30066)))

(declare-fun b!453475 () Bool)

(assert (=> b!453475 (= e!265423 e!265425)))

(declare-fun lt!205762 () (_ BitVec 64))

(assert (=> b!453475 (= lt!205762 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(declare-fun lt!205761 () Unit!13211)

(assert (=> b!453475 (= lt!205761 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!205321 lt!205762 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (=> b!453475 (arrayContainsKey!0 lt!205321 lt!205762 #b00000000000000000000000000000000)))

(declare-fun lt!205760 () Unit!13211)

(assert (=> b!453475 (= lt!205760 lt!205761)))

(declare-fun res!270083 () Bool)

(assert (=> b!453475 (= res!270083 (= (seekEntryOrOpen!0 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)) lt!205321 mask!1025) (Found!3527 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(assert (=> b!453475 (=> (not res!270083) (not e!265425))))

(declare-fun b!453476 () Bool)

(declare-fun e!265424 () Bool)

(assert (=> b!453476 (= e!265424 e!265423)))

(declare-fun c!56268 () Bool)

(assert (=> b!453476 (= c!56268 (validKeyInArray!0 (select (arr!13481 lt!205321) (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001))))))

(declare-fun d!74401 () Bool)

(declare-fun res!270084 () Bool)

(assert (=> d!74401 (=> res!270084 e!265424)))

(assert (=> d!74401 (= res!270084 (bvsge (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!13834 lt!205321)))))

(assert (=> d!74401 (= (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!205321 mask!1025) e!265424)))

(declare-fun bm!30063 () Bool)

(assert (=> bm!30063 (= call!30066 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001 #b00000000000000000000000000000001) lt!205321 mask!1025))))

(assert (= (and d!74401 (not res!270084)) b!453476))

(assert (= (and b!453476 c!56268) b!453475))

(assert (= (and b!453476 (not c!56268)) b!453474))

(assert (= (and b!453475 res!270083) b!453473))

(assert (= (or b!453473 b!453474) bm!30063))

(assert (=> b!453475 m!437285))

(declare-fun m!437367 () Bool)

(assert (=> b!453475 m!437367))

(declare-fun m!437369 () Bool)

(assert (=> b!453475 m!437369))

(assert (=> b!453475 m!437285))

(declare-fun m!437371 () Bool)

(assert (=> b!453475 m!437371))

(assert (=> b!453476 m!437285))

(assert (=> b!453476 m!437285))

(assert (=> b!453476 m!437287))

(declare-fun m!437373 () Bool)

(assert (=> bm!30063 m!437373))

(assert (=> bm!30022 d!74401))

(declare-fun d!74403 () Bool)

(assert (=> d!74403 (= (isEmpty!563 lt!205475) (isEmpty!564 (toList!3497 lt!205475)))))

(declare-fun bs!14384 () Bool)

(assert (= bs!14384 d!74403))

(declare-fun m!437375 () Bool)

(assert (=> bs!14384 m!437375))

(assert (=> b!453002 d!74403))

(declare-fun d!74405 () Bool)

(declare-fun lt!205763 () Bool)

(assert (=> d!74405 (= lt!205763 (select (content!205 (toList!3497 lt!205449)) lt!205326))))

(declare-fun e!265427 () Bool)

(assert (=> d!74405 (= lt!205763 e!265427)))

(declare-fun res!270085 () Bool)

(assert (=> d!74405 (=> (not res!270085) (not e!265427))))

(assert (=> d!74405 (= res!270085 ((_ is Cons!8114) (toList!3497 lt!205449)))))

(assert (=> d!74405 (= (contains!2488 (toList!3497 lt!205449) lt!205326) lt!205763)))

(declare-fun b!453477 () Bool)

(declare-fun e!265426 () Bool)

(assert (=> b!453477 (= e!265427 e!265426)))

(declare-fun res!270086 () Bool)

(assert (=> b!453477 (=> res!270086 e!265426)))

(assert (=> b!453477 (= res!270086 (= (h!8970 (toList!3497 lt!205449)) lt!205326))))

(declare-fun b!453478 () Bool)

(assert (=> b!453478 (= e!265426 (contains!2488 (t!13933 (toList!3497 lt!205449)) lt!205326))))

(assert (= (and d!74405 res!270085) b!453477))

(assert (= (and b!453477 (not res!270086)) b!453478))

(declare-fun m!437377 () Bool)

(assert (=> d!74405 m!437377))

(declare-fun m!437379 () Bool)

(assert (=> d!74405 m!437379))

(declare-fun m!437381 () Bool)

(assert (=> b!453478 m!437381))

(assert (=> b!452965 d!74405))

(declare-fun d!74407 () Bool)

(assert (=> d!74407 (= (apply!313 lt!205475 (select (arr!13481 lt!205321) from!863)) (get!6655 (getValueByKey!368 (toList!3497 lt!205475) (select (arr!13481 lt!205321) from!863))))))

(declare-fun bs!14385 () Bool)

(assert (= bs!14385 d!74407))

(assert (=> bs!14385 m!436081))

(assert (=> bs!14385 m!436919))

(assert (=> bs!14385 m!436919))

(declare-fun m!437383 () Bool)

(assert (=> bs!14385 m!437383))

(assert (=> b!453004 d!74407))

(assert (=> b!453004 d!74291))

(assert (=> b!452922 d!74301))

(declare-fun b!453479 () Bool)

(declare-fun e!265428 () Bool)

(assert (=> b!453479 (= e!265428 tp_is_empty!12139)))

(declare-fun condMapEmpty!19855 () Bool)

(declare-fun mapDefault!19855 () ValueCell!5726)

(assert (=> mapNonEmpty!19854 (= condMapEmpty!19855 (= mapRest!19854 ((as const (Array (_ BitVec 32) ValueCell!5726)) mapDefault!19855)))))

(declare-fun e!265429 () Bool)

(declare-fun mapRes!19855 () Bool)

(assert (=> mapNonEmpty!19854 (= tp!38241 (and e!265429 mapRes!19855))))

(declare-fun b!453480 () Bool)

(assert (=> b!453480 (= e!265429 tp_is_empty!12139)))

(declare-fun mapNonEmpty!19855 () Bool)

(declare-fun tp!38242 () Bool)

(assert (=> mapNonEmpty!19855 (= mapRes!19855 (and tp!38242 e!265428))))

(declare-fun mapKey!19855 () (_ BitVec 32))

(declare-fun mapValue!19855 () ValueCell!5726)

(declare-fun mapRest!19855 () (Array (_ BitVec 32) ValueCell!5726))

(assert (=> mapNonEmpty!19855 (= mapRest!19854 (store mapRest!19855 mapKey!19855 mapValue!19855))))

(declare-fun mapIsEmpty!19855 () Bool)

(assert (=> mapIsEmpty!19855 mapRes!19855))

(assert (= (and mapNonEmpty!19854 condMapEmpty!19855) mapIsEmpty!19855))

(assert (= (and mapNonEmpty!19854 (not condMapEmpty!19855)) mapNonEmpty!19855))

(assert (= (and mapNonEmpty!19855 ((_ is ValueCellFull!5726) mapValue!19855)) b!453479))

(assert (= (and mapNonEmpty!19854 ((_ is ValueCellFull!5726) mapDefault!19855)) b!453480))

(declare-fun m!437385 () Bool)

(assert (=> mapNonEmpty!19855 m!437385))

(declare-fun b_lambda!9637 () Bool)

(assert (= b_lambda!9631 (or (and start!40798 b_free!10801) b_lambda!9637)))

(declare-fun b_lambda!9639 () Bool)

(assert (= b_lambda!9619 (or (and start!40798 b_free!10801) b_lambda!9639)))

(declare-fun b_lambda!9641 () Bool)

(assert (= b_lambda!9609 (or (and start!40798 b_free!10801) b_lambda!9641)))

(declare-fun b_lambda!9643 () Bool)

(assert (= b_lambda!9613 (or (and start!40798 b_free!10801) b_lambda!9643)))

(declare-fun b_lambda!9645 () Bool)

(assert (= b_lambda!9623 (or (and start!40798 b_free!10801) b_lambda!9645)))

(declare-fun b_lambda!9647 () Bool)

(assert (= b_lambda!9633 (or (and start!40798 b_free!10801) b_lambda!9647)))

(declare-fun b_lambda!9649 () Bool)

(assert (= b_lambda!9611 (or (and start!40798 b_free!10801) b_lambda!9649)))

(declare-fun b_lambda!9651 () Bool)

(assert (= b_lambda!9629 (or (and start!40798 b_free!10801) b_lambda!9651)))

(declare-fun b_lambda!9653 () Bool)

(assert (= b_lambda!9621 (or (and start!40798 b_free!10801) b_lambda!9653)))

(declare-fun b_lambda!9655 () Bool)

(assert (= b_lambda!9635 (or (and start!40798 b_free!10801) b_lambda!9655)))

(declare-fun b_lambda!9657 () Bool)

(assert (= b_lambda!9615 (or (and start!40798 b_free!10801) b_lambda!9657)))

(declare-fun b_lambda!9659 () Bool)

(assert (= b_lambda!9625 (or (and start!40798 b_free!10801) b_lambda!9659)))

(declare-fun b_lambda!9661 () Bool)

(assert (= b_lambda!9617 (or (and start!40798 b_free!10801) b_lambda!9661)))

(declare-fun b_lambda!9663 () Bool)

(assert (= b_lambda!9627 (or (and start!40798 b_free!10801) b_lambda!9663)))

(check-sat (not b!453342) (not d!74329) (not d!74379) (not b!453211) (not b!453172) (not bm!30036) (not d!74275) (not b_lambda!9651) (not b!453275) (not b!453165) (not b!453261) (not d!74191) (not b!453086) (not d!74405) (not b!453198) (not b!453253) (not b!453209) (not b!453328) (not b!453337) (not b!453260) (not b!453472) (not bm!30034) (not b_lambda!9663) (not b!453081) (not b!453226) (not b_lambda!9567) (not bm!30044) (not b_lambda!9647) (not b!453050) (not bm!30063) (not b!453218) (not b!453350) (not d!74373) (not b_lambda!9599) (not b!453359) (not bm!30030) (not bm!30035) (not d!74239) (not b!453187) (not bm!30047) (not b!453281) (not b!453223) (not b!453437) (not d!74365) (not d!74167) (not d!74347) (not d!74201) (not d!74251) (not b!453270) (not d!74259) (not b!453207) (not b!453345) (not b!453168) (not b!453373) (not b!453378) (not b!453062) (not b!453190) (not b!453193) (not b!453318) (not b!453309) (not d!74407) (not d!74203) (not d!74175) (not b!453202) (not b!453224) (not b!453210) (not b!453238) (not b!453428) (not d!74245) (not b!453327) (not bm!30037) (not bm!30053) (not b!453386) (not b!453149) (not b!453434) (not d!74179) (not d!74321) (not b!453299) (not d!74377) (not b!453051) (not d!74387) (not b!453179) (not b!453161) (not b!453356) (not b!453105) (not b!453431) (not b_lambda!9637) (not b!453157) (not d!74273) (not b!453246) (not b!453297) (not d!74361) (not bm!30046) (not b!453182) (not b!453315) (not b!453177) (not b!453291) (not b!453045) (not d!74189) (not b!453197) (not b!453152) (not b!453460) (not b!453076) (not b!453362) (not b!453354) (not d!74293) (not b!453346) (not b!453323) (not bm!30023) (not b!453454) (not b!453399) (not b!453314) (not b!453349) (not d!74389) (not b!453376) (not b!453037) (not d!74207) (not d!74271) (not b!453229) (not b!453295) (not b_lambda!9661) (not b!453419) (not b!453192) (not b!453074) (not d!74221) (not b!453334) (not b!453329) (not b!453258) (not b!453296) (not b!453293) (not b!453049) (not b!453164) (not b!453214) (not b!453169) tp_is_empty!12139 (not b!453048) (not b!453353) (not b!453333) (not b!453290) (not b!453300) (not b!453079) (not d!74169) (not d!74345) (not d!74299) (not b!453248) (not b!453061) (not b!453184) (not b!453443) (not b!453199) (not b!453393) (not b_lambda!9597) (not b!453422) (not b!453185) (not b!453160) (not d!74333) (not b!453413) (not b!453065) (not b_lambda!9591) (not b!453425) (not b!453064) (not b!453063) (not mapNonEmpty!19855) (not b!453452) (not b!453396) (not d!74315) (not d!74255) (not b!453206) (not d!74279) (not bm!30045) (not b!453331) (not b_lambda!9659) (not b!453136) (not b!453305) (not b!453278) (not d!74339) (not d!74395) (not b!453221) (not b_lambda!9601) (not b!453038) (not b_lambda!9605) (not d!74237) (not b!453088) (not d!74209) (not d!74307) (not b!453166) (not b!453469) (not d!74335) (not d!74249) (not b!453446) (not bm!30062) (not b!453429) (not d!74277) (not b!453267) (not b!453203) (not b!453271) (not b!453325) (not b_lambda!9589) (not b!453371) (not b_lambda!9639) (not b_lambda!9603) (not b!453073) (not b!453231) (not b_lambda!9645) (not b!453153) (not b!453144) (not b!453138) (not b!453047) (not b!453072) (not b!453294) (not b!453336) (not b!453276) (not b!453397) (not b!453243) (not d!74171) (not d!74185) (not b!453132) (not b!453302) (not b!453381) (not d!74247) (not b!453470) (not d!74367) (not b!453384) (not b!453071) (not d!74235) (not b!453232) (not b!453478) (not b!453069) (not d!74257) (not b!453319) (not b!453082) (not d!74399) b_and!18921 (not bm!30038) (not b!453467) (not b!453289) (not b!453212) (not b!453312) (not b!453272) (not b!453135) (not b!453273) (not b!453251) (not d!74297) (not d!74385) (not b!453348) (not b!453361) (not d!74309) (not b!453163) (not b!453379) (not b!453186) (not b_lambda!9593) (not b!453147) (not bm!30061) (not b!453447) (not b!453077) (not b!453387) (not b!453156) (not b!453321) (not b!453332) (not d!74359) (not d!74213) (not d!74289) (not b!453195) (not b!453285) (not b!453154) (not b!453427) (not d!74357) (not b_lambda!9653) (not b!453287) (not d!74323) (not d!74215) (not b!453180) (not b!453458) (not d!74349) (not b!453189) (not b!453436) (not b_lambda!9657) (not b!453311) (not d!74313) (not d!74343) (not d!74303) (not b!453067) (not b!453274) (not d!74243) (not b!453465) (not d!74397) (not b_next!10801) (not b!453344) (not d!74219) (not b!453106) (not bm!30050) (not b!453241) (not bm!30041) (not d!74261) (not b_lambda!9649) (not bm!30054) (not b!453310) (not d!74355) (not b!453175) (not b_lambda!9641) (not b_lambda!9607) (not d!74195) (not b!453245) (not b!453085) (not d!74177) (not b!453307) (not b_lambda!9655) (not b!453066) (not d!74403) (not d!74295) (not d!74311) (not b!453340) (not b!453351) (not d!74233) (not d!74319) (not b_lambda!9643) (not b!453191) (not d!74197) (not b_lambda!9595) (not d!74229) (not b!453151) (not b!453368) (not b!453341) (not b!453200) (not b!453078) (not d!74269) (not b!453475) (not d!74393) (not d!74331) (not b!453215) (not b!453372) (not b!453219) (not b!453375) (not d!74187) (not b!453255) (not b!453099) (not d!74351) (not b!453242) (not b!453476) (not b!453148) (not d!74325) (not b!453456) (not bm!30033) (not d!74265) (not d!74327))
(check-sat b_and!18921 (not b_next!10801))
