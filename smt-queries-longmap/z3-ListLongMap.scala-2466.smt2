; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38600 () Bool)

(assert start!38600)

(declare-fun b_free!9151 () Bool)

(declare-fun b_next!9151 () Bool)

(assert (=> start!38600 (= b_free!9151 (not b_next!9151))))

(declare-fun tp!32577 () Bool)

(declare-fun b_and!16511 () Bool)

(assert (=> start!38600 (= tp!32577 b_and!16511)))

(declare-fun b!400038 () Bool)

(declare-fun res!230171 () Bool)

(declare-fun e!241419 () Bool)

(assert (=> b!400038 (=> (not res!230171) (not e!241419))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!23955 0))(
  ( (array!23956 (arr!11427 (Array (_ BitVec 32) (_ BitVec 64))) (size!11780 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23955)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!400038 (= res!230171 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11780 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!400039 () Bool)

(declare-fun res!230168 () Bool)

(declare-fun e!241416 () Bool)

(assert (=> b!400039 (=> (not res!230168) (not e!241416))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23955 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400039 (= res!230168 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400040 () Bool)

(assert (=> b!400040 (= e!241416 e!241419)))

(declare-fun res!230164 () Bool)

(assert (=> b!400040 (=> (not res!230164) (not e!241419))))

(declare-fun lt!187444 () array!23955)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23955 (_ BitVec 32)) Bool)

(assert (=> b!400040 (= res!230164 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187444 mask!1025))))

(assert (=> b!400040 (= lt!187444 (array!23956 (store (arr!11427 _keys!709) i!563 k0!794) (size!11780 _keys!709)))))

(declare-fun b!400041 () Bool)

(declare-fun e!241414 () Bool)

(declare-fun tp_is_empty!10033 () Bool)

(assert (=> b!400041 (= e!241414 tp_is_empty!10033)))

(declare-fun b!400042 () Bool)

(declare-fun res!230163 () Bool)

(assert (=> b!400042 (=> (not res!230163) (not e!241416))))

(assert (=> b!400042 (= res!230163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400043 () Bool)

(declare-fun e!241418 () Bool)

(assert (=> b!400043 (= e!241418 tp_is_empty!10033)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun bm!28089 () Bool)

(declare-datatypes ((V!14483 0))(
  ( (V!14484 (val!5061 Int)) )
))
(declare-fun zeroValue!515 () V!14483)

(declare-fun v!412 () V!14483)

(declare-fun minValue!515 () V!14483)

(declare-datatypes ((tuple2!6684 0))(
  ( (tuple2!6685 (_1!3353 (_ BitVec 64)) (_2!3353 V!14483)) )
))
(declare-datatypes ((List!6592 0))(
  ( (Nil!6589) (Cons!6588 (h!7444 tuple2!6684) (t!11757 List!6592)) )
))
(declare-datatypes ((ListLongMap!5587 0))(
  ( (ListLongMap!5588 (toList!2809 List!6592)) )
))
(declare-fun call!28092 () ListLongMap!5587)

(declare-fun c!54612 () Bool)

(declare-datatypes ((ValueCell!4673 0))(
  ( (ValueCellFull!4673 (v!7302 V!14483)) (EmptyCell!4673) )
))
(declare-datatypes ((array!23957 0))(
  ( (array!23958 (arr!11428 (Array (_ BitVec 32) ValueCell!4673)) (size!11781 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23957)

(declare-fun getCurrentListMapNoExtraKeys!1028 (array!23955 array!23957 (_ BitVec 32) (_ BitVec 32) V!14483 V!14483 (_ BitVec 32) Int) ListLongMap!5587)

(assert (=> bm!28089 (= call!28092 (getCurrentListMapNoExtraKeys!1028 (ite c!54612 lt!187444 _keys!709) (ite c!54612 (array!23958 (store (arr!11428 _values!549) i!563 (ValueCellFull!4673 v!412)) (size!11781 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400044 () Bool)

(declare-fun res!230167 () Bool)

(assert (=> b!400044 (=> (not res!230167) (not e!241416))))

(assert (=> b!400044 (= res!230167 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11780 _keys!709))))))

(declare-fun b!400045 () Bool)

(declare-fun res!230169 () Bool)

(assert (=> b!400045 (=> (not res!230169) (not e!241416))))

(declare-datatypes ((List!6593 0))(
  ( (Nil!6590) (Cons!6589 (h!7445 (_ BitVec 64)) (t!11758 List!6593)) )
))
(declare-fun arrayNoDuplicates!0 (array!23955 (_ BitVec 32) List!6593) Bool)

(assert (=> b!400045 (= res!230169 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6590))))

(declare-fun b!400046 () Bool)

(declare-fun res!230161 () Bool)

(assert (=> b!400046 (=> (not res!230161) (not e!241416))))

(assert (=> b!400046 (= res!230161 (and (= (size!11781 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11780 _keys!709) (size!11781 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!400047 () Bool)

(assert (=> b!400047 (= e!241419 (not true))))

(declare-fun e!241415 () Bool)

(assert (=> b!400047 e!241415))

(assert (=> b!400047 (= c!54612 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12100 0))(
  ( (Unit!12101) )
))
(declare-fun lt!187445 () Unit!12100)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!313 (array!23955 array!23957 (_ BitVec 32) (_ BitVec 32) V!14483 V!14483 (_ BitVec 32) (_ BitVec 64) V!14483 (_ BitVec 32) Int) Unit!12100)

(assert (=> b!400047 (= lt!187445 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!313 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400048 () Bool)

(declare-fun e!241413 () Bool)

(declare-fun mapRes!16671 () Bool)

(assert (=> b!400048 (= e!241413 (and e!241414 mapRes!16671))))

(declare-fun condMapEmpty!16671 () Bool)

(declare-fun mapDefault!16671 () ValueCell!4673)

(assert (=> b!400048 (= condMapEmpty!16671 (= (arr!11428 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4673)) mapDefault!16671)))))

(declare-fun b!400049 () Bool)

(declare-fun res!230162 () Bool)

(assert (=> b!400049 (=> (not res!230162) (not e!241416))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400049 (= res!230162 (validKeyInArray!0 k0!794))))

(declare-fun b!400050 () Bool)

(declare-fun res!230165 () Bool)

(assert (=> b!400050 (=> (not res!230165) (not e!241416))))

(assert (=> b!400050 (= res!230165 (or (= (select (arr!11427 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11427 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!400051 () Bool)

(declare-fun call!28093 () ListLongMap!5587)

(declare-fun +!1120 (ListLongMap!5587 tuple2!6684) ListLongMap!5587)

(assert (=> b!400051 (= e!241415 (= call!28092 (+!1120 call!28093 (tuple2!6685 k0!794 v!412))))))

(declare-fun b!400052 () Bool)

(declare-fun res!230170 () Bool)

(assert (=> b!400052 (=> (not res!230170) (not e!241416))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400052 (= res!230170 (validMask!0 mask!1025))))

(declare-fun b!400053 () Bool)

(declare-fun res!230172 () Bool)

(assert (=> b!400053 (=> (not res!230172) (not e!241419))))

(assert (=> b!400053 (= res!230172 (arrayNoDuplicates!0 lt!187444 #b00000000000000000000000000000000 Nil!6590))))

(declare-fun mapIsEmpty!16671 () Bool)

(assert (=> mapIsEmpty!16671 mapRes!16671))

(declare-fun bm!28090 () Bool)

(assert (=> bm!28090 (= call!28093 (getCurrentListMapNoExtraKeys!1028 (ite c!54612 _keys!709 lt!187444) (ite c!54612 _values!549 (array!23958 (store (arr!11428 _values!549) i!563 (ValueCellFull!4673 v!412)) (size!11781 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16671 () Bool)

(declare-fun tp!32576 () Bool)

(assert (=> mapNonEmpty!16671 (= mapRes!16671 (and tp!32576 e!241418))))

(declare-fun mapKey!16671 () (_ BitVec 32))

(declare-fun mapRest!16671 () (Array (_ BitVec 32) ValueCell!4673))

(declare-fun mapValue!16671 () ValueCell!4673)

(assert (=> mapNonEmpty!16671 (= (arr!11428 _values!549) (store mapRest!16671 mapKey!16671 mapValue!16671))))

(declare-fun res!230166 () Bool)

(assert (=> start!38600 (=> (not res!230166) (not e!241416))))

(assert (=> start!38600 (= res!230166 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11780 _keys!709))))))

(assert (=> start!38600 e!241416))

(assert (=> start!38600 tp_is_empty!10033))

(assert (=> start!38600 tp!32577))

(assert (=> start!38600 true))

(declare-fun array_inv!8386 (array!23957) Bool)

(assert (=> start!38600 (and (array_inv!8386 _values!549) e!241413)))

(declare-fun array_inv!8387 (array!23955) Bool)

(assert (=> start!38600 (array_inv!8387 _keys!709)))

(declare-fun b!400054 () Bool)

(assert (=> b!400054 (= e!241415 (= call!28093 call!28092))))

(assert (= (and start!38600 res!230166) b!400052))

(assert (= (and b!400052 res!230170) b!400046))

(assert (= (and b!400046 res!230161) b!400042))

(assert (= (and b!400042 res!230163) b!400045))

(assert (= (and b!400045 res!230169) b!400044))

(assert (= (and b!400044 res!230167) b!400049))

(assert (= (and b!400049 res!230162) b!400050))

(assert (= (and b!400050 res!230165) b!400039))

(assert (= (and b!400039 res!230168) b!400040))

(assert (= (and b!400040 res!230164) b!400053))

(assert (= (and b!400053 res!230172) b!400038))

(assert (= (and b!400038 res!230171) b!400047))

(assert (= (and b!400047 c!54612) b!400051))

(assert (= (and b!400047 (not c!54612)) b!400054))

(assert (= (or b!400051 b!400054) bm!28089))

(assert (= (or b!400051 b!400054) bm!28090))

(assert (= (and b!400048 condMapEmpty!16671) mapIsEmpty!16671))

(assert (= (and b!400048 (not condMapEmpty!16671)) mapNonEmpty!16671))

(get-info :version)

(assert (= (and mapNonEmpty!16671 ((_ is ValueCellFull!4673) mapValue!16671)) b!400043))

(assert (= (and b!400048 ((_ is ValueCellFull!4673) mapDefault!16671)) b!400041))

(assert (= start!38600 b!400048))

(declare-fun m!393819 () Bool)

(assert (=> b!400045 m!393819))

(declare-fun m!393821 () Bool)

(assert (=> bm!28089 m!393821))

(declare-fun m!393823 () Bool)

(assert (=> bm!28089 m!393823))

(declare-fun m!393825 () Bool)

(assert (=> b!400040 m!393825))

(declare-fun m!393827 () Bool)

(assert (=> b!400040 m!393827))

(declare-fun m!393829 () Bool)

(assert (=> b!400049 m!393829))

(declare-fun m!393831 () Bool)

(assert (=> start!38600 m!393831))

(declare-fun m!393833 () Bool)

(assert (=> start!38600 m!393833))

(assert (=> bm!28090 m!393821))

(declare-fun m!393835 () Bool)

(assert (=> bm!28090 m!393835))

(declare-fun m!393837 () Bool)

(assert (=> b!400051 m!393837))

(declare-fun m!393839 () Bool)

(assert (=> b!400052 m!393839))

(declare-fun m!393841 () Bool)

(assert (=> b!400039 m!393841))

(declare-fun m!393843 () Bool)

(assert (=> b!400053 m!393843))

(declare-fun m!393845 () Bool)

(assert (=> b!400042 m!393845))

(declare-fun m!393847 () Bool)

(assert (=> mapNonEmpty!16671 m!393847))

(declare-fun m!393849 () Bool)

(assert (=> b!400050 m!393849))

(declare-fun m!393851 () Bool)

(assert (=> b!400047 m!393851))

(check-sat (not b!400047) (not bm!28090) (not mapNonEmpty!16671) (not b!400040) (not b!400053) (not b!400042) (not b!400045) (not b_next!9151) (not bm!28089) (not b!400049) b_and!16511 tp_is_empty!10033 (not b!400052) (not start!38600) (not b!400051) (not b!400039))
(check-sat b_and!16511 (not b_next!9151))
