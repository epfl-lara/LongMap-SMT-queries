; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39288 () Bool)

(assert start!39288)

(declare-fun b_free!9555 () Bool)

(declare-fun b_next!9555 () Bool)

(assert (=> start!39288 (= b_free!9555 (not b_next!9555))))

(declare-fun tp!34194 () Bool)

(declare-fun b_and!16985 () Bool)

(assert (=> start!39288 (= tp!34194 b_and!16985)))

(declare-fun b!415660 () Bool)

(declare-fun res!241849 () Bool)

(declare-fun e!248250 () Bool)

(assert (=> b!415660 (=> (not res!241849) (not e!248250))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!25271 0))(
  ( (array!25272 (arr!12085 (Array (_ BitVec 32) (_ BitVec 64))) (size!12437 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25271)

(assert (=> b!415660 (= res!241849 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12437 _keys!709))))))

(declare-fun e!248247 () Bool)

(declare-datatypes ((V!15381 0))(
  ( (V!15382 (val!5398 Int)) )
))
(declare-datatypes ((tuple2!7032 0))(
  ( (tuple2!7033 (_1!3527 (_ BitVec 64)) (_2!3527 V!15381)) )
))
(declare-datatypes ((List!7053 0))(
  ( (Nil!7050) (Cons!7049 (h!7905 tuple2!7032) (t!12273 List!7053)) )
))
(declare-datatypes ((ListLongMap!5945 0))(
  ( (ListLongMap!5946 (toList!2988 List!7053)) )
))
(declare-fun call!28844 () ListLongMap!5945)

(declare-fun b!415661 () Bool)

(declare-fun v!412 () V!15381)

(declare-fun call!28843 () ListLongMap!5945)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1192 (ListLongMap!5945 tuple2!7032) ListLongMap!5945)

(assert (=> b!415661 (= e!248247 (= call!28843 (+!1192 call!28844 (tuple2!7033 k0!794 v!412))))))

(declare-fun b!415662 () Bool)

(declare-fun e!248248 () Bool)

(assert (=> b!415662 (= e!248250 e!248248)))

(declare-fun res!241838 () Bool)

(assert (=> b!415662 (=> (not res!241838) (not e!248248))))

(declare-fun lt!190309 () array!25271)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25271 (_ BitVec 32)) Bool)

(assert (=> b!415662 (= res!241838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190309 mask!1025))))

(assert (=> b!415662 (= lt!190309 (array!25272 (store (arr!12085 _keys!709) i!563 k0!794) (size!12437 _keys!709)))))

(declare-fun b!415663 () Bool)

(declare-fun e!248246 () Bool)

(declare-fun tp_is_empty!10707 () Bool)

(assert (=> b!415663 (= e!248246 tp_is_empty!10707)))

(declare-fun b!415664 () Bool)

(declare-fun e!248245 () Bool)

(assert (=> b!415664 (= e!248245 tp_is_empty!10707)))

(declare-fun b!415665 () Bool)

(declare-fun e!248249 () Bool)

(declare-fun e!248244 () Bool)

(assert (=> b!415665 (= e!248249 (not e!248244))))

(declare-fun res!241851 () Bool)

(assert (=> b!415665 (=> res!241851 e!248244)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!415665 (= res!241851 (validKeyInArray!0 (select (arr!12085 _keys!709) from!863)))))

(assert (=> b!415665 e!248247))

(declare-fun c!55046 () Bool)

(assert (=> b!415665 (= c!55046 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!15381)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5010 0))(
  ( (ValueCellFull!5010 (v!7645 V!15381)) (EmptyCell!5010) )
))
(declare-datatypes ((array!25273 0))(
  ( (array!25274 (arr!12086 (Array (_ BitVec 32) ValueCell!5010)) (size!12438 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25273)

(declare-datatypes ((Unit!12288 0))(
  ( (Unit!12289) )
))
(declare-fun lt!190310 () Unit!12288)

(declare-fun zeroValue!515 () V!15381)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!402 (array!25271 array!25273 (_ BitVec 32) (_ BitVec 32) V!15381 V!15381 (_ BitVec 32) (_ BitVec 64) V!15381 (_ BitVec 32) Int) Unit!12288)

(assert (=> b!415665 (= lt!190310 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!402 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415666 () Bool)

(declare-fun res!241842 () Bool)

(assert (=> b!415666 (=> (not res!241842) (not e!248250))))

(declare-fun arrayContainsKey!0 (array!25271 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!415666 (= res!241842 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17682 () Bool)

(declare-fun mapRes!17682 () Bool)

(declare-fun tp!34193 () Bool)

(assert (=> mapNonEmpty!17682 (= mapRes!17682 (and tp!34193 e!248245))))

(declare-fun mapKey!17682 () (_ BitVec 32))

(declare-fun mapValue!17682 () ValueCell!5010)

(declare-fun mapRest!17682 () (Array (_ BitVec 32) ValueCell!5010))

(assert (=> mapNonEmpty!17682 (= (arr!12086 _values!549) (store mapRest!17682 mapKey!17682 mapValue!17682))))

(declare-fun b!415667 () Bool)

(declare-fun res!241844 () Bool)

(assert (=> b!415667 (=> (not res!241844) (not e!248248))))

(declare-datatypes ((List!7054 0))(
  ( (Nil!7051) (Cons!7050 (h!7906 (_ BitVec 64)) (t!12274 List!7054)) )
))
(declare-fun arrayNoDuplicates!0 (array!25271 (_ BitVec 32) List!7054) Bool)

(assert (=> b!415667 (= res!241844 (arrayNoDuplicates!0 lt!190309 #b00000000000000000000000000000000 Nil!7051))))

(declare-fun b!415668 () Bool)

(declare-fun res!241840 () Bool)

(assert (=> b!415668 (=> (not res!241840) (not e!248248))))

(assert (=> b!415668 (= res!241840 (bvsle from!863 i!563))))

(declare-fun b!415669 () Bool)

(assert (=> b!415669 (= e!248244 true)))

(declare-fun lt!190311 () array!25273)

(declare-fun lt!190313 () ListLongMap!5945)

(declare-fun getCurrentListMapNoExtraKeys!1194 (array!25271 array!25273 (_ BitVec 32) (_ BitVec 32) V!15381 V!15381 (_ BitVec 32) Int) ListLongMap!5945)

(declare-fun get!5968 (ValueCell!5010 V!15381) V!15381)

(declare-fun dynLambda!669 (Int (_ BitVec 64)) V!15381)

(assert (=> b!415669 (= lt!190313 (+!1192 (getCurrentListMapNoExtraKeys!1194 lt!190309 lt!190311 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7033 (select (arr!12085 lt!190309) from!863) (get!5968 (select (arr!12086 lt!190311) from!863) (dynLambda!669 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!415670 () Bool)

(declare-fun res!241839 () Bool)

(assert (=> b!415670 (=> (not res!241839) (not e!248250))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!415670 (= res!241839 (validMask!0 mask!1025))))

(declare-fun b!415671 () Bool)

(declare-fun res!241843 () Bool)

(assert (=> b!415671 (=> (not res!241843) (not e!248250))))

(assert (=> b!415671 (= res!241843 (and (= (size!12438 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12437 _keys!709) (size!12438 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!415672 () Bool)

(assert (=> b!415672 (= e!248247 (= call!28844 call!28843))))

(declare-fun b!415673 () Bool)

(declare-fun res!241845 () Bool)

(assert (=> b!415673 (=> (not res!241845) (not e!248250))))

(assert (=> b!415673 (= res!241845 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!28840 () Bool)

(assert (=> bm!28840 (= call!28844 (getCurrentListMapNoExtraKeys!1194 (ite c!55046 _keys!709 lt!190309) (ite c!55046 _values!549 lt!190311) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415674 () Bool)

(declare-fun res!241846 () Bool)

(assert (=> b!415674 (=> (not res!241846) (not e!248250))))

(assert (=> b!415674 (= res!241846 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17682 () Bool)

(assert (=> mapIsEmpty!17682 mapRes!17682))

(declare-fun res!241850 () Bool)

(assert (=> start!39288 (=> (not res!241850) (not e!248250))))

(assert (=> start!39288 (= res!241850 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12437 _keys!709))))))

(assert (=> start!39288 e!248250))

(assert (=> start!39288 tp_is_empty!10707))

(assert (=> start!39288 tp!34194))

(assert (=> start!39288 true))

(declare-fun e!248242 () Bool)

(declare-fun array_inv!8814 (array!25273) Bool)

(assert (=> start!39288 (and (array_inv!8814 _values!549) e!248242)))

(declare-fun array_inv!8815 (array!25271) Bool)

(assert (=> start!39288 (array_inv!8815 _keys!709)))

(declare-fun b!415675 () Bool)

(declare-fun res!241848 () Bool)

(assert (=> b!415675 (=> (not res!241848) (not e!248250))))

(assert (=> b!415675 (= res!241848 (or (= (select (arr!12085 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12085 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!415676 () Bool)

(assert (=> b!415676 (= e!248242 (and e!248246 mapRes!17682))))

(declare-fun condMapEmpty!17682 () Bool)

(declare-fun mapDefault!17682 () ValueCell!5010)

(assert (=> b!415676 (= condMapEmpty!17682 (= (arr!12086 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5010)) mapDefault!17682)))))

(declare-fun bm!28841 () Bool)

(assert (=> bm!28841 (= call!28843 (getCurrentListMapNoExtraKeys!1194 (ite c!55046 lt!190309 _keys!709) (ite c!55046 lt!190311 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!415677 () Bool)

(assert (=> b!415677 (= e!248248 e!248249)))

(declare-fun res!241841 () Bool)

(assert (=> b!415677 (=> (not res!241841) (not e!248249))))

(assert (=> b!415677 (= res!241841 (= from!863 i!563))))

(assert (=> b!415677 (= lt!190313 (getCurrentListMapNoExtraKeys!1194 lt!190309 lt!190311 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!415677 (= lt!190311 (array!25274 (store (arr!12086 _values!549) i!563 (ValueCellFull!5010 v!412)) (size!12438 _values!549)))))

(declare-fun lt!190312 () ListLongMap!5945)

(assert (=> b!415677 (= lt!190312 (getCurrentListMapNoExtraKeys!1194 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!415678 () Bool)

(declare-fun res!241847 () Bool)

(assert (=> b!415678 (=> (not res!241847) (not e!248250))))

(assert (=> b!415678 (= res!241847 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7051))))

(assert (= (and start!39288 res!241850) b!415670))

(assert (= (and b!415670 res!241839) b!415671))

(assert (= (and b!415671 res!241843) b!415673))

(assert (= (and b!415673 res!241845) b!415678))

(assert (= (and b!415678 res!241847) b!415660))

(assert (= (and b!415660 res!241849) b!415674))

(assert (= (and b!415674 res!241846) b!415675))

(assert (= (and b!415675 res!241848) b!415666))

(assert (= (and b!415666 res!241842) b!415662))

(assert (= (and b!415662 res!241838) b!415667))

(assert (= (and b!415667 res!241844) b!415668))

(assert (= (and b!415668 res!241840) b!415677))

(assert (= (and b!415677 res!241841) b!415665))

(assert (= (and b!415665 c!55046) b!415661))

(assert (= (and b!415665 (not c!55046)) b!415672))

(assert (= (or b!415661 b!415672) bm!28841))

(assert (= (or b!415661 b!415672) bm!28840))

(assert (= (and b!415665 (not res!241851)) b!415669))

(assert (= (and b!415676 condMapEmpty!17682) mapIsEmpty!17682))

(assert (= (and b!415676 (not condMapEmpty!17682)) mapNonEmpty!17682))

(get-info :version)

(assert (= (and mapNonEmpty!17682 ((_ is ValueCellFull!5010) mapValue!17682)) b!415664))

(assert (= (and b!415676 ((_ is ValueCellFull!5010) mapDefault!17682)) b!415663))

(assert (= start!39288 b!415676))

(declare-fun b_lambda!8859 () Bool)

(assert (=> (not b_lambda!8859) (not b!415669)))

(declare-fun t!12272 () Bool)

(declare-fun tb!3177 () Bool)

(assert (=> (and start!39288 (= defaultEntry!557 defaultEntry!557) t!12272) tb!3177))

(declare-fun result!5881 () Bool)

(assert (=> tb!3177 (= result!5881 tp_is_empty!10707)))

(assert (=> b!415669 t!12272))

(declare-fun b_and!16987 () Bool)

(assert (= b_and!16985 (and (=> t!12272 result!5881) b_and!16987)))

(declare-fun m!404777 () Bool)

(assert (=> start!39288 m!404777))

(declare-fun m!404779 () Bool)

(assert (=> start!39288 m!404779))

(declare-fun m!404781 () Bool)

(assert (=> b!415677 m!404781))

(declare-fun m!404783 () Bool)

(assert (=> b!415677 m!404783))

(declare-fun m!404785 () Bool)

(assert (=> b!415677 m!404785))

(declare-fun m!404787 () Bool)

(assert (=> b!415662 m!404787))

(declare-fun m!404789 () Bool)

(assert (=> b!415662 m!404789))

(declare-fun m!404791 () Bool)

(assert (=> b!415665 m!404791))

(assert (=> b!415665 m!404791))

(declare-fun m!404793 () Bool)

(assert (=> b!415665 m!404793))

(declare-fun m!404795 () Bool)

(assert (=> b!415665 m!404795))

(declare-fun m!404797 () Bool)

(assert (=> mapNonEmpty!17682 m!404797))

(declare-fun m!404799 () Bool)

(assert (=> b!415661 m!404799))

(declare-fun m!404801 () Bool)

(assert (=> bm!28841 m!404801))

(declare-fun m!404803 () Bool)

(assert (=> b!415667 m!404803))

(declare-fun m!404805 () Bool)

(assert (=> b!415674 m!404805))

(declare-fun m!404807 () Bool)

(assert (=> b!415669 m!404807))

(declare-fun m!404809 () Bool)

(assert (=> b!415669 m!404809))

(declare-fun m!404811 () Bool)

(assert (=> b!415669 m!404811))

(assert (=> b!415669 m!404809))

(declare-fun m!404813 () Bool)

(assert (=> b!415669 m!404813))

(declare-fun m!404815 () Bool)

(assert (=> b!415669 m!404815))

(declare-fun m!404817 () Bool)

(assert (=> b!415669 m!404817))

(assert (=> b!415669 m!404815))

(assert (=> b!415669 m!404807))

(declare-fun m!404819 () Bool)

(assert (=> b!415675 m!404819))

(declare-fun m!404821 () Bool)

(assert (=> bm!28840 m!404821))

(declare-fun m!404823 () Bool)

(assert (=> b!415673 m!404823))

(declare-fun m!404825 () Bool)

(assert (=> b!415670 m!404825))

(declare-fun m!404827 () Bool)

(assert (=> b!415666 m!404827))

(declare-fun m!404829 () Bool)

(assert (=> b!415678 m!404829))

(check-sat (not b!415666) (not b!415673) (not b!415667) tp_is_empty!10707 (not b_next!9555) (not bm!28841) (not mapNonEmpty!17682) (not b!415677) (not b!415661) b_and!16987 (not b!415665) (not b!415674) (not bm!28840) (not start!39288) (not b!415678) (not b!415662) (not b!415670) (not b_lambda!8859) (not b!415669))
(check-sat b_and!16987 (not b_next!9555))
