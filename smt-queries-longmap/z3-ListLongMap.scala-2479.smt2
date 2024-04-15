; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38678 () Bool)

(assert start!38678)

(declare-fun b_free!9229 () Bool)

(declare-fun b_next!9229 () Bool)

(assert (=> start!38678 (= b_free!9229 (not b_next!9229))))

(declare-fun tp!32811 () Bool)

(declare-fun b_and!16589 () Bool)

(assert (=> start!38678 (= tp!32811 b_and!16589)))

(declare-fun b!402027 () Bool)

(declare-fun res!231570 () Bool)

(declare-fun e!242234 () Bool)

(assert (=> b!402027 (=> (not res!231570) (not e!242234))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!402027 (= res!231570 (validMask!0 mask!1025))))

(declare-fun b!402028 () Bool)

(declare-fun e!242236 () Bool)

(assert (=> b!402028 (= e!242234 e!242236)))

(declare-fun res!231576 () Bool)

(assert (=> b!402028 (=> (not res!231576) (not e!242236))))

(declare-datatypes ((array!24103 0))(
  ( (array!24104 (arr!11501 (Array (_ BitVec 32) (_ BitVec 64))) (size!11854 (_ BitVec 32))) )
))
(declare-fun lt!187679 () array!24103)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24103 (_ BitVec 32)) Bool)

(assert (=> b!402028 (= res!231576 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187679 mask!1025))))

(declare-fun _keys!709 () array!24103)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!402028 (= lt!187679 (array!24104 (store (arr!11501 _keys!709) i!563 k0!794) (size!11854 _keys!709)))))

(declare-fun mapNonEmpty!16788 () Bool)

(declare-fun mapRes!16788 () Bool)

(declare-fun tp!32810 () Bool)

(declare-fun e!242237 () Bool)

(assert (=> mapNonEmpty!16788 (= mapRes!16788 (and tp!32810 e!242237))))

(declare-datatypes ((V!14587 0))(
  ( (V!14588 (val!5100 Int)) )
))
(declare-datatypes ((ValueCell!4712 0))(
  ( (ValueCellFull!4712 (v!7341 V!14587)) (EmptyCell!4712) )
))
(declare-datatypes ((array!24105 0))(
  ( (array!24106 (arr!11502 (Array (_ BitVec 32) ValueCell!4712)) (size!11855 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24105)

(declare-fun mapRest!16788 () (Array (_ BitVec 32) ValueCell!4712))

(declare-fun mapKey!16788 () (_ BitVec 32))

(declare-fun mapValue!16788 () ValueCell!4712)

(assert (=> mapNonEmpty!16788 (= (arr!11502 _values!549) (store mapRest!16788 mapKey!16788 mapValue!16788))))

(declare-fun b!402029 () Bool)

(declare-fun res!231575 () Bool)

(assert (=> b!402029 (=> (not res!231575) (not e!242234))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!402029 (= res!231575 (validKeyInArray!0 k0!794))))

(declare-fun b!402030 () Bool)

(declare-fun res!231574 () Bool)

(assert (=> b!402030 (=> (not res!231574) (not e!242234))))

(assert (=> b!402030 (= res!231574 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11854 _keys!709))))))

(declare-fun b!402031 () Bool)

(declare-fun res!231565 () Bool)

(assert (=> b!402031 (=> (not res!231565) (not e!242234))))

(assert (=> b!402031 (= res!231565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!402032 () Bool)

(declare-fun e!242233 () Bool)

(declare-datatypes ((tuple2!6754 0))(
  ( (tuple2!6755 (_1!3388 (_ BitVec 64)) (_2!3388 V!14587)) )
))
(declare-datatypes ((List!6658 0))(
  ( (Nil!6655) (Cons!6654 (h!7510 tuple2!6754) (t!11823 List!6658)) )
))
(declare-datatypes ((ListLongMap!5657 0))(
  ( (ListLongMap!5658 (toList!2844 List!6658)) )
))
(declare-fun call!28327 () ListLongMap!5657)

(declare-fun call!28326 () ListLongMap!5657)

(assert (=> b!402032 (= e!242233 (= call!28327 call!28326))))

(declare-fun b!402033 () Bool)

(declare-fun res!231567 () Bool)

(assert (=> b!402033 (=> (not res!231567) (not e!242234))))

(declare-fun arrayContainsKey!0 (array!24103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!402033 (= res!231567 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!402034 () Bool)

(declare-fun res!231568 () Bool)

(assert (=> b!402034 (=> (not res!231568) (not e!242234))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!402034 (= res!231568 (and (= (size!11855 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11854 _keys!709) (size!11855 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!402035 () Bool)

(declare-fun v!412 () V!14587)

(declare-fun +!1149 (ListLongMap!5657 tuple2!6754) ListLongMap!5657)

(assert (=> b!402035 (= e!242233 (= call!28326 (+!1149 call!28327 (tuple2!6755 k0!794 v!412))))))

(declare-fun b!402036 () Bool)

(declare-fun tp_is_empty!10111 () Bool)

(assert (=> b!402036 (= e!242237 tp_is_empty!10111)))

(declare-fun res!231572 () Bool)

(assert (=> start!38678 (=> (not res!231572) (not e!242234))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38678 (= res!231572 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11854 _keys!709))))))

(assert (=> start!38678 e!242234))

(assert (=> start!38678 tp_is_empty!10111))

(assert (=> start!38678 tp!32811))

(assert (=> start!38678 true))

(declare-fun e!242238 () Bool)

(declare-fun array_inv!8436 (array!24105) Bool)

(assert (=> start!38678 (and (array_inv!8436 _values!549) e!242238)))

(declare-fun array_inv!8437 (array!24103) Bool)

(assert (=> start!38678 (array_inv!8437 _keys!709)))

(declare-fun b!402037 () Bool)

(declare-fun e!242235 () Bool)

(assert (=> b!402037 (= e!242235 tp_is_empty!10111)))

(declare-fun minValue!515 () V!14587)

(declare-fun defaultEntry!557 () Int)

(declare-fun c!54729 () Bool)

(declare-fun bm!28323 () Bool)

(declare-fun zeroValue!515 () V!14587)

(declare-fun getCurrentListMapNoExtraKeys!1060 (array!24103 array!24105 (_ BitVec 32) (_ BitVec 32) V!14587 V!14587 (_ BitVec 32) Int) ListLongMap!5657)

(assert (=> bm!28323 (= call!28327 (getCurrentListMapNoExtraKeys!1060 (ite c!54729 _keys!709 lt!187679) (ite c!54729 _values!549 (array!24106 (store (arr!11502 _values!549) i!563 (ValueCellFull!4712 v!412)) (size!11855 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402038 () Bool)

(declare-fun res!231573 () Bool)

(assert (=> b!402038 (=> (not res!231573) (not e!242234))))

(declare-datatypes ((List!6659 0))(
  ( (Nil!6656) (Cons!6655 (h!7511 (_ BitVec 64)) (t!11824 List!6659)) )
))
(declare-fun arrayNoDuplicates!0 (array!24103 (_ BitVec 32) List!6659) Bool)

(assert (=> b!402038 (= res!231573 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6656))))

(declare-fun b!402039 () Bool)

(declare-fun res!231569 () Bool)

(assert (=> b!402039 (=> (not res!231569) (not e!242234))))

(assert (=> b!402039 (= res!231569 (or (= (select (arr!11501 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11501 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!16788 () Bool)

(assert (=> mapIsEmpty!16788 mapRes!16788))

(declare-fun bm!28324 () Bool)

(assert (=> bm!28324 (= call!28326 (getCurrentListMapNoExtraKeys!1060 (ite c!54729 lt!187679 _keys!709) (ite c!54729 (array!24106 (store (arr!11502 _values!549) i!563 (ValueCellFull!4712 v!412)) (size!11855 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402040 () Bool)

(declare-fun res!231571 () Bool)

(assert (=> b!402040 (=> (not res!231571) (not e!242236))))

(assert (=> b!402040 (= res!231571 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11854 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!402041 () Bool)

(declare-fun res!231566 () Bool)

(assert (=> b!402041 (=> (not res!231566) (not e!242236))))

(assert (=> b!402041 (= res!231566 (arrayNoDuplicates!0 lt!187679 #b00000000000000000000000000000000 Nil!6656))))

(declare-fun b!402042 () Bool)

(assert (=> b!402042 (= e!242236 (not true))))

(assert (=> b!402042 e!242233))

(assert (=> b!402042 (= c!54729 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12150 0))(
  ( (Unit!12151) )
))
(declare-fun lt!187678 () Unit!12150)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!338 (array!24103 array!24105 (_ BitVec 32) (_ BitVec 32) V!14587 V!14587 (_ BitVec 32) (_ BitVec 64) V!14587 (_ BitVec 32) Int) Unit!12150)

(assert (=> b!402042 (= lt!187678 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!338 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!402043 () Bool)

(assert (=> b!402043 (= e!242238 (and e!242235 mapRes!16788))))

(declare-fun condMapEmpty!16788 () Bool)

(declare-fun mapDefault!16788 () ValueCell!4712)

(assert (=> b!402043 (= condMapEmpty!16788 (= (arr!11502 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4712)) mapDefault!16788)))))

(assert (= (and start!38678 res!231572) b!402027))

(assert (= (and b!402027 res!231570) b!402034))

(assert (= (and b!402034 res!231568) b!402031))

(assert (= (and b!402031 res!231565) b!402038))

(assert (= (and b!402038 res!231573) b!402030))

(assert (= (and b!402030 res!231574) b!402029))

(assert (= (and b!402029 res!231575) b!402039))

(assert (= (and b!402039 res!231569) b!402033))

(assert (= (and b!402033 res!231567) b!402028))

(assert (= (and b!402028 res!231576) b!402041))

(assert (= (and b!402041 res!231566) b!402040))

(assert (= (and b!402040 res!231571) b!402042))

(assert (= (and b!402042 c!54729) b!402035))

(assert (= (and b!402042 (not c!54729)) b!402032))

(assert (= (or b!402035 b!402032) bm!28324))

(assert (= (or b!402035 b!402032) bm!28323))

(assert (= (and b!402043 condMapEmpty!16788) mapIsEmpty!16788))

(assert (= (and b!402043 (not condMapEmpty!16788)) mapNonEmpty!16788))

(get-info :version)

(assert (= (and mapNonEmpty!16788 ((_ is ValueCellFull!4712) mapValue!16788)) b!402036))

(assert (= (and b!402043 ((_ is ValueCellFull!4712) mapDefault!16788)) b!402037))

(assert (= start!38678 b!402043))

(declare-fun m!395145 () Bool)

(assert (=> b!402038 m!395145))

(declare-fun m!395147 () Bool)

(assert (=> b!402027 m!395147))

(declare-fun m!395149 () Bool)

(assert (=> bm!28323 m!395149))

(declare-fun m!395151 () Bool)

(assert (=> bm!28323 m!395151))

(declare-fun m!395153 () Bool)

(assert (=> b!402033 m!395153))

(declare-fun m!395155 () Bool)

(assert (=> start!38678 m!395155))

(declare-fun m!395157 () Bool)

(assert (=> start!38678 m!395157))

(declare-fun m!395159 () Bool)

(assert (=> b!402039 m!395159))

(assert (=> bm!28324 m!395149))

(declare-fun m!395161 () Bool)

(assert (=> bm!28324 m!395161))

(declare-fun m!395163 () Bool)

(assert (=> b!402031 m!395163))

(declare-fun m!395165 () Bool)

(assert (=> b!402041 m!395165))

(declare-fun m!395167 () Bool)

(assert (=> b!402042 m!395167))

(declare-fun m!395169 () Bool)

(assert (=> b!402028 m!395169))

(declare-fun m!395171 () Bool)

(assert (=> b!402028 m!395171))

(declare-fun m!395173 () Bool)

(assert (=> b!402035 m!395173))

(declare-fun m!395175 () Bool)

(assert (=> mapNonEmpty!16788 m!395175))

(declare-fun m!395177 () Bool)

(assert (=> b!402029 m!395177))

(check-sat (not bm!28323) (not b_next!9229) (not bm!28324) tp_is_empty!10111 (not b!402041) (not b!402028) (not b!402031) (not b!402027) (not b!402035) (not b!402038) (not mapNonEmpty!16788) (not b!402029) b_and!16589 (not start!38678) (not b!402042) (not b!402033))
(check-sat b_and!16589 (not b_next!9229))
