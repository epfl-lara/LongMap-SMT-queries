; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38640 () Bool)

(assert start!38640)

(declare-fun b_free!9177 () Bool)

(declare-fun b_next!9177 () Bool)

(assert (=> start!38640 (= b_free!9177 (not b_next!9177))))

(declare-fun tp!32654 () Bool)

(declare-fun b_and!16563 () Bool)

(assert (=> start!38640 (= tp!32654 b_and!16563)))

(declare-fun b!400972 () Bool)

(declare-fun res!230762 () Bool)

(declare-fun e!241865 () Bool)

(assert (=> b!400972 (=> (not res!230762) (not e!241865))))

(declare-datatypes ((array!24027 0))(
  ( (array!24028 (arr!11463 (Array (_ BitVec 32) (_ BitVec 64))) (size!11815 (_ BitVec 32))) )
))
(declare-fun lt!187756 () array!24027)

(declare-datatypes ((List!6652 0))(
  ( (Nil!6649) (Cons!6648 (h!7504 (_ BitVec 64)) (t!11826 List!6652)) )
))
(declare-fun arrayNoDuplicates!0 (array!24027 (_ BitVec 32) List!6652) Bool)

(assert (=> b!400972 (= res!230762 (arrayNoDuplicates!0 lt!187756 #b00000000000000000000000000000000 Nil!6649))))

(declare-fun b!400973 () Bool)

(declare-fun res!230763 () Bool)

(declare-fun e!241866 () Bool)

(assert (=> b!400973 (=> (not res!230763) (not e!241866))))

(declare-fun _keys!709 () array!24027)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24027 (_ BitVec 32)) Bool)

(assert (=> b!400973 (= res!230763 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400974 () Bool)

(declare-fun e!241860 () Bool)

(declare-datatypes ((V!14517 0))(
  ( (V!14518 (val!5074 Int)) )
))
(declare-datatypes ((tuple2!6728 0))(
  ( (tuple2!6729 (_1!3375 (_ BitVec 64)) (_2!3375 V!14517)) )
))
(declare-datatypes ((List!6653 0))(
  ( (Nil!6650) (Cons!6649 (h!7505 tuple2!6728) (t!11827 List!6653)) )
))
(declare-datatypes ((ListLongMap!5641 0))(
  ( (ListLongMap!5642 (toList!2836 List!6653)) )
))
(declare-fun call!28195 () ListLongMap!5641)

(declare-fun call!28196 () ListLongMap!5641)

(assert (=> b!400974 (= e!241860 (= call!28195 call!28196))))

(declare-fun b!400975 () Bool)

(declare-fun res!230759 () Bool)

(assert (=> b!400975 (=> (not res!230759) (not e!241866))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24027 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400975 (= res!230759 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun minValue!515 () V!14517)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun c!54722 () Bool)

(declare-datatypes ((ValueCell!4686 0))(
  ( (ValueCellFull!4686 (v!7321 V!14517)) (EmptyCell!4686) )
))
(declare-datatypes ((array!24029 0))(
  ( (array!24030 (arr!11464 (Array (_ BitVec 32) ValueCell!4686)) (size!11816 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24029)

(declare-fun zeroValue!515 () V!14517)

(declare-fun bm!28192 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!14517)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1049 (array!24027 array!24029 (_ BitVec 32) (_ BitVec 32) V!14517 V!14517 (_ BitVec 32) Int) ListLongMap!5641)

(assert (=> bm!28192 (= call!28196 (getCurrentListMapNoExtraKeys!1049 (ite c!54722 lt!187756 _keys!709) (ite c!54722 (array!24030 (store (arr!11464 _values!549) i!563 (ValueCellFull!4686 v!412)) (size!11816 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400976 () Bool)

(assert (=> b!400976 (= e!241865 (not true))))

(assert (=> b!400976 e!241860))

(assert (=> b!400976 (= c!54722 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12144 0))(
  ( (Unit!12145) )
))
(declare-fun lt!187757 () Unit!12144)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!330 (array!24027 array!24029 (_ BitVec 32) (_ BitVec 32) V!14517 V!14517 (_ BitVec 32) (_ BitVec 64) V!14517 (_ BitVec 32) Int) Unit!12144)

(assert (=> b!400976 (= lt!187757 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!330 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400977 () Bool)

(declare-fun e!241864 () Bool)

(declare-fun tp_is_empty!10059 () Bool)

(assert (=> b!400977 (= e!241864 tp_is_empty!10059)))

(declare-fun b!400978 () Bool)

(declare-fun e!241861 () Bool)

(declare-fun mapRes!16710 () Bool)

(assert (=> b!400978 (= e!241861 (and e!241864 mapRes!16710))))

(declare-fun condMapEmpty!16710 () Bool)

(declare-fun mapDefault!16710 () ValueCell!4686)

(assert (=> b!400978 (= condMapEmpty!16710 (= (arr!11464 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4686)) mapDefault!16710)))))

(declare-fun mapNonEmpty!16710 () Bool)

(declare-fun tp!32655 () Bool)

(declare-fun e!241863 () Bool)

(assert (=> mapNonEmpty!16710 (= mapRes!16710 (and tp!32655 e!241863))))

(declare-fun mapRest!16710 () (Array (_ BitVec 32) ValueCell!4686))

(declare-fun mapKey!16710 () (_ BitVec 32))

(declare-fun mapValue!16710 () ValueCell!4686)

(assert (=> mapNonEmpty!16710 (= (arr!11464 _values!549) (store mapRest!16710 mapKey!16710 mapValue!16710))))

(declare-fun b!400980 () Bool)

(declare-fun +!1121 (ListLongMap!5641 tuple2!6728) ListLongMap!5641)

(assert (=> b!400980 (= e!241860 (= call!28196 (+!1121 call!28195 (tuple2!6729 k0!794 v!412))))))

(declare-fun b!400981 () Bool)

(declare-fun res!230761 () Bool)

(assert (=> b!400981 (=> (not res!230761) (not e!241865))))

(assert (=> b!400981 (= res!230761 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11815 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400982 () Bool)

(assert (=> b!400982 (= e!241863 tp_is_empty!10059)))

(declare-fun b!400983 () Bool)

(declare-fun res!230758 () Bool)

(assert (=> b!400983 (=> (not res!230758) (not e!241866))))

(assert (=> b!400983 (= res!230758 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6649))))

(declare-fun b!400984 () Bool)

(declare-fun res!230767 () Bool)

(assert (=> b!400984 (=> (not res!230767) (not e!241866))))

(assert (=> b!400984 (= res!230767 (and (= (size!11816 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11815 _keys!709) (size!11816 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400985 () Bool)

(assert (=> b!400985 (= e!241866 e!241865)))

(declare-fun res!230768 () Bool)

(assert (=> b!400985 (=> (not res!230768) (not e!241865))))

(assert (=> b!400985 (= res!230768 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187756 mask!1025))))

(assert (=> b!400985 (= lt!187756 (array!24028 (store (arr!11463 _keys!709) i!563 k0!794) (size!11815 _keys!709)))))

(declare-fun mapIsEmpty!16710 () Bool)

(assert (=> mapIsEmpty!16710 mapRes!16710))

(declare-fun res!230766 () Bool)

(assert (=> start!38640 (=> (not res!230766) (not e!241866))))

(assert (=> start!38640 (= res!230766 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11815 _keys!709))))))

(assert (=> start!38640 e!241866))

(assert (=> start!38640 tp_is_empty!10059))

(assert (=> start!38640 tp!32654))

(assert (=> start!38640 true))

(declare-fun array_inv!8392 (array!24029) Bool)

(assert (=> start!38640 (and (array_inv!8392 _values!549) e!241861)))

(declare-fun array_inv!8393 (array!24027) Bool)

(assert (=> start!38640 (array_inv!8393 _keys!709)))

(declare-fun b!400979 () Bool)

(declare-fun res!230760 () Bool)

(assert (=> b!400979 (=> (not res!230760) (not e!241866))))

(assert (=> b!400979 (= res!230760 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11815 _keys!709))))))

(declare-fun b!400986 () Bool)

(declare-fun res!230765 () Bool)

(assert (=> b!400986 (=> (not res!230765) (not e!241866))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400986 (= res!230765 (validKeyInArray!0 k0!794))))

(declare-fun bm!28193 () Bool)

(assert (=> bm!28193 (= call!28195 (getCurrentListMapNoExtraKeys!1049 (ite c!54722 _keys!709 lt!187756) (ite c!54722 _values!549 (array!24030 (store (arr!11464 _values!549) i!563 (ValueCellFull!4686 v!412)) (size!11816 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400987 () Bool)

(declare-fun res!230769 () Bool)

(assert (=> b!400987 (=> (not res!230769) (not e!241866))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400987 (= res!230769 (validMask!0 mask!1025))))

(declare-fun b!400988 () Bool)

(declare-fun res!230764 () Bool)

(assert (=> b!400988 (=> (not res!230764) (not e!241866))))

(assert (=> b!400988 (= res!230764 (or (= (select (arr!11463 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11463 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!38640 res!230766) b!400987))

(assert (= (and b!400987 res!230769) b!400984))

(assert (= (and b!400984 res!230767) b!400973))

(assert (= (and b!400973 res!230763) b!400983))

(assert (= (and b!400983 res!230758) b!400979))

(assert (= (and b!400979 res!230760) b!400986))

(assert (= (and b!400986 res!230765) b!400988))

(assert (= (and b!400988 res!230764) b!400975))

(assert (= (and b!400975 res!230759) b!400985))

(assert (= (and b!400985 res!230768) b!400972))

(assert (= (and b!400972 res!230762) b!400981))

(assert (= (and b!400981 res!230761) b!400976))

(assert (= (and b!400976 c!54722) b!400980))

(assert (= (and b!400976 (not c!54722)) b!400974))

(assert (= (or b!400980 b!400974) bm!28192))

(assert (= (or b!400980 b!400974) bm!28193))

(assert (= (and b!400978 condMapEmpty!16710) mapIsEmpty!16710))

(assert (= (and b!400978 (not condMapEmpty!16710)) mapNonEmpty!16710))

(get-info :version)

(assert (= (and mapNonEmpty!16710 ((_ is ValueCellFull!4686) mapValue!16710)) b!400982))

(assert (= (and b!400978 ((_ is ValueCellFull!4686) mapDefault!16710)) b!400977))

(assert (= start!38640 b!400978))

(declare-fun m!394985 () Bool)

(assert (=> b!400987 m!394985))

(declare-fun m!394987 () Bool)

(assert (=> b!400976 m!394987))

(declare-fun m!394989 () Bool)

(assert (=> start!38640 m!394989))

(declare-fun m!394991 () Bool)

(assert (=> start!38640 m!394991))

(declare-fun m!394993 () Bool)

(assert (=> b!400980 m!394993))

(declare-fun m!394995 () Bool)

(assert (=> b!400986 m!394995))

(declare-fun m!394997 () Bool)

(assert (=> b!400973 m!394997))

(declare-fun m!394999 () Bool)

(assert (=> b!400988 m!394999))

(declare-fun m!395001 () Bool)

(assert (=> b!400972 m!395001))

(declare-fun m!395003 () Bool)

(assert (=> mapNonEmpty!16710 m!395003))

(declare-fun m!395005 () Bool)

(assert (=> b!400983 m!395005))

(declare-fun m!395007 () Bool)

(assert (=> b!400975 m!395007))

(declare-fun m!395009 () Bool)

(assert (=> bm!28193 m!395009))

(declare-fun m!395011 () Bool)

(assert (=> bm!28193 m!395011))

(assert (=> bm!28192 m!395009))

(declare-fun m!395013 () Bool)

(assert (=> bm!28192 m!395013))

(declare-fun m!395015 () Bool)

(assert (=> b!400985 m!395015))

(declare-fun m!395017 () Bool)

(assert (=> b!400985 m!395017))

(check-sat (not b!400983) (not bm!28192) (not b!400980) (not b!400987) tp_is_empty!10059 (not b!400972) (not b_next!9177) (not b!400973) (not b!400976) (not b!400975) (not bm!28193) (not mapNonEmpty!16710) (not b!400986) b_and!16563 (not start!38640) (not b!400985))
(check-sat b_and!16563 (not b_next!9177))
