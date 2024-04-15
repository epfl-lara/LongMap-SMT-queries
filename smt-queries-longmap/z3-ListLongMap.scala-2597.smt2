; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39386 () Bool)

(assert start!39386)

(declare-fun b_free!9667 () Bool)

(declare-fun b_next!9667 () Bool)

(assert (=> start!39386 (= b_free!9667 (not b_next!9667))))

(declare-fun tp!34530 () Bool)

(declare-fun b_and!17183 () Bool)

(assert (=> start!39386 (= tp!34530 b_and!17183)))

(declare-datatypes ((V!15531 0))(
  ( (V!15532 (val!5454 Int)) )
))
(declare-datatypes ((ValueCell!5066 0))(
  ( (ValueCellFull!5066 (v!7695 V!15531)) (EmptyCell!5066) )
))
(declare-datatypes ((array!25475 0))(
  ( (array!25476 (arr!12187 (Array (_ BitVec 32) ValueCell!5066)) (size!12540 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25475)

(declare-fun bm!29151 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!25477 0))(
  ( (array!25478 (arr!12188 (Array (_ BitVec 32) (_ BitVec 64))) (size!12541 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25477)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun minValue!515 () V!15531)

(declare-datatypes ((tuple2!7116 0))(
  ( (tuple2!7117 (_1!3569 (_ BitVec 64)) (_2!3569 V!15531)) )
))
(declare-datatypes ((List!7115 0))(
  ( (Nil!7112) (Cons!7111 (h!7967 tuple2!7116) (t!12438 List!7115)) )
))
(declare-datatypes ((ListLongMap!6019 0))(
  ( (ListLongMap!6020 (toList!3025 List!7115)) )
))
(declare-fun call!29155 () ListLongMap!6019)

(declare-fun defaultEntry!557 () Int)

(declare-fun c!55143 () Bool)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!191854 () array!25475)

(declare-fun zeroValue!515 () V!15531)

(declare-fun lt!191847 () array!25477)

(declare-fun getCurrentListMapNoExtraKeys!1236 (array!25477 array!25475 (_ BitVec 32) (_ BitVec 32) V!15531 V!15531 (_ BitVec 32) Int) ListLongMap!6019)

(assert (=> bm!29151 (= call!29155 (getCurrentListMapNoExtraKeys!1236 (ite c!55143 lt!191847 _keys!709) (ite c!55143 lt!191854 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418693 () Bool)

(declare-fun e!249581 () Bool)

(declare-fun call!29154 () ListLongMap!6019)

(assert (=> b!418693 (= e!249581 (= call!29154 call!29155))))

(declare-fun b!418694 () Bool)

(declare-fun res!244064 () Bool)

(declare-fun e!249584 () Bool)

(assert (=> b!418694 (=> (not res!244064) (not e!249584))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25477 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418694 (= res!244064 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!244069 () Bool)

(assert (=> start!39386 (=> (not res!244069) (not e!249584))))

(assert (=> start!39386 (= res!244069 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12541 _keys!709))))))

(assert (=> start!39386 e!249584))

(declare-fun tp_is_empty!10819 () Bool)

(assert (=> start!39386 tp_is_empty!10819))

(assert (=> start!39386 tp!34530))

(assert (=> start!39386 true))

(declare-fun e!249585 () Bool)

(declare-fun array_inv!8932 (array!25475) Bool)

(assert (=> start!39386 (and (array_inv!8932 _values!549) e!249585)))

(declare-fun array_inv!8933 (array!25477) Bool)

(assert (=> start!39386 (array_inv!8933 _keys!709)))

(declare-fun b!418695 () Bool)

(declare-fun e!249583 () Bool)

(assert (=> b!418695 (= e!249583 true)))

(declare-fun lt!191845 () ListLongMap!6019)

(declare-fun lt!191848 () tuple2!7116)

(declare-fun lt!191855 () V!15531)

(declare-fun +!1252 (ListLongMap!6019 tuple2!7116) ListLongMap!6019)

(assert (=> b!418695 (= (+!1252 lt!191845 lt!191848) (+!1252 (+!1252 lt!191845 (tuple2!7117 k0!794 lt!191855)) lt!191848))))

(declare-fun lt!191852 () V!15531)

(assert (=> b!418695 (= lt!191848 (tuple2!7117 k0!794 lt!191852))))

(declare-datatypes ((Unit!12348 0))(
  ( (Unit!12349) )
))
(declare-fun lt!191849 () Unit!12348)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!38 (ListLongMap!6019 (_ BitVec 64) V!15531 V!15531) Unit!12348)

(assert (=> b!418695 (= lt!191849 (addSameAsAddTwiceSameKeyDiffValues!38 lt!191845 k0!794 lt!191855 lt!191852))))

(declare-fun lt!191853 () V!15531)

(declare-fun get!6035 (ValueCell!5066 V!15531) V!15531)

(assert (=> b!418695 (= lt!191855 (get!6035 (select (arr!12187 _values!549) from!863) lt!191853))))

(declare-fun lt!191851 () ListLongMap!6019)

(assert (=> b!418695 (= lt!191851 (+!1252 lt!191845 (tuple2!7117 (select (arr!12188 lt!191847) from!863) lt!191852)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15531)

(assert (=> b!418695 (= lt!191852 (get!6035 (select (store (arr!12187 _values!549) i!563 (ValueCellFull!5066 v!412)) from!863) lt!191853))))

(declare-fun dynLambda!695 (Int (_ BitVec 64)) V!15531)

(assert (=> b!418695 (= lt!191853 (dynLambda!695 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418695 (= lt!191845 (getCurrentListMapNoExtraKeys!1236 lt!191847 lt!191854 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418696 () Bool)

(declare-fun res!244061 () Bool)

(assert (=> b!418696 (=> (not res!244061) (not e!249584))))

(assert (=> b!418696 (= res!244061 (and (= (size!12540 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12541 _keys!709) (size!12540 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418697 () Bool)

(declare-fun e!249580 () Bool)

(assert (=> b!418697 (= e!249580 tp_is_empty!10819)))

(declare-fun b!418698 () Bool)

(declare-fun res!244065 () Bool)

(assert (=> b!418698 (=> (not res!244065) (not e!249584))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418698 (= res!244065 (validKeyInArray!0 k0!794))))

(declare-fun b!418699 () Bool)

(declare-fun res!244067 () Bool)

(assert (=> b!418699 (=> (not res!244067) (not e!249584))))

(assert (=> b!418699 (= res!244067 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12541 _keys!709))))))

(declare-fun b!418700 () Bool)

(declare-fun e!249587 () Bool)

(assert (=> b!418700 (= e!249584 e!249587)))

(declare-fun res!244072 () Bool)

(assert (=> b!418700 (=> (not res!244072) (not e!249587))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25477 (_ BitVec 32)) Bool)

(assert (=> b!418700 (= res!244072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191847 mask!1025))))

(assert (=> b!418700 (= lt!191847 (array!25478 (store (arr!12188 _keys!709) i!563 k0!794) (size!12541 _keys!709)))))

(declare-fun b!418701 () Bool)

(declare-fun res!244068 () Bool)

(assert (=> b!418701 (=> (not res!244068) (not e!249584))))

(assert (=> b!418701 (= res!244068 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!17850 () Bool)

(declare-fun mapRes!17850 () Bool)

(assert (=> mapIsEmpty!17850 mapRes!17850))

(declare-fun b!418702 () Bool)

(declare-fun res!244062 () Bool)

(assert (=> b!418702 (=> (not res!244062) (not e!249587))))

(declare-datatypes ((List!7116 0))(
  ( (Nil!7113) (Cons!7112 (h!7968 (_ BitVec 64)) (t!12439 List!7116)) )
))
(declare-fun arrayNoDuplicates!0 (array!25477 (_ BitVec 32) List!7116) Bool)

(assert (=> b!418702 (= res!244062 (arrayNoDuplicates!0 lt!191847 #b00000000000000000000000000000000 Nil!7113))))

(declare-fun bm!29152 () Bool)

(assert (=> bm!29152 (= call!29154 (getCurrentListMapNoExtraKeys!1236 (ite c!55143 _keys!709 lt!191847) (ite c!55143 _values!549 lt!191854) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418703 () Bool)

(declare-fun res!244074 () Bool)

(assert (=> b!418703 (=> (not res!244074) (not e!249587))))

(assert (=> b!418703 (= res!244074 (bvsle from!863 i!563))))

(declare-fun b!418704 () Bool)

(assert (=> b!418704 (= e!249581 (= call!29155 (+!1252 call!29154 (tuple2!7117 k0!794 v!412))))))

(declare-fun b!418705 () Bool)

(declare-fun res!244073 () Bool)

(assert (=> b!418705 (=> (not res!244073) (not e!249584))))

(assert (=> b!418705 (= res!244073 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7113))))

(declare-fun b!418706 () Bool)

(declare-fun e!249582 () Bool)

(assert (=> b!418706 (= e!249582 (not e!249583))))

(declare-fun res!244071 () Bool)

(assert (=> b!418706 (=> res!244071 e!249583)))

(assert (=> b!418706 (= res!244071 (validKeyInArray!0 (select (arr!12188 _keys!709) from!863)))))

(assert (=> b!418706 e!249581))

(assert (=> b!418706 (= c!55143 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191846 () Unit!12348)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!429 (array!25477 array!25475 (_ BitVec 32) (_ BitVec 32) V!15531 V!15531 (_ BitVec 32) (_ BitVec 64) V!15531 (_ BitVec 32) Int) Unit!12348)

(assert (=> b!418706 (= lt!191846 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!429 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17850 () Bool)

(declare-fun tp!34529 () Bool)

(declare-fun e!249586 () Bool)

(assert (=> mapNonEmpty!17850 (= mapRes!17850 (and tp!34529 e!249586))))

(declare-fun mapRest!17850 () (Array (_ BitVec 32) ValueCell!5066))

(declare-fun mapValue!17850 () ValueCell!5066)

(declare-fun mapKey!17850 () (_ BitVec 32))

(assert (=> mapNonEmpty!17850 (= (arr!12187 _values!549) (store mapRest!17850 mapKey!17850 mapValue!17850))))

(declare-fun b!418707 () Bool)

(declare-fun res!244070 () Bool)

(assert (=> b!418707 (=> (not res!244070) (not e!249584))))

(assert (=> b!418707 (= res!244070 (or (= (select (arr!12188 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12188 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418708 () Bool)

(declare-fun res!244066 () Bool)

(assert (=> b!418708 (=> (not res!244066) (not e!249584))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418708 (= res!244066 (validMask!0 mask!1025))))

(declare-fun b!418709 () Bool)

(assert (=> b!418709 (= e!249586 tp_is_empty!10819)))

(declare-fun b!418710 () Bool)

(assert (=> b!418710 (= e!249585 (and e!249580 mapRes!17850))))

(declare-fun condMapEmpty!17850 () Bool)

(declare-fun mapDefault!17850 () ValueCell!5066)

(assert (=> b!418710 (= condMapEmpty!17850 (= (arr!12187 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5066)) mapDefault!17850)))))

(declare-fun b!418711 () Bool)

(assert (=> b!418711 (= e!249587 e!249582)))

(declare-fun res!244063 () Bool)

(assert (=> b!418711 (=> (not res!244063) (not e!249582))))

(assert (=> b!418711 (= res!244063 (= from!863 i!563))))

(assert (=> b!418711 (= lt!191851 (getCurrentListMapNoExtraKeys!1236 lt!191847 lt!191854 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!418711 (= lt!191854 (array!25476 (store (arr!12187 _values!549) i!563 (ValueCellFull!5066 v!412)) (size!12540 _values!549)))))

(declare-fun lt!191850 () ListLongMap!6019)

(assert (=> b!418711 (= lt!191850 (getCurrentListMapNoExtraKeys!1236 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (= (and start!39386 res!244069) b!418708))

(assert (= (and b!418708 res!244066) b!418696))

(assert (= (and b!418696 res!244061) b!418701))

(assert (= (and b!418701 res!244068) b!418705))

(assert (= (and b!418705 res!244073) b!418699))

(assert (= (and b!418699 res!244067) b!418698))

(assert (= (and b!418698 res!244065) b!418707))

(assert (= (and b!418707 res!244070) b!418694))

(assert (= (and b!418694 res!244064) b!418700))

(assert (= (and b!418700 res!244072) b!418702))

(assert (= (and b!418702 res!244062) b!418703))

(assert (= (and b!418703 res!244074) b!418711))

(assert (= (and b!418711 res!244063) b!418706))

(assert (= (and b!418706 c!55143) b!418704))

(assert (= (and b!418706 (not c!55143)) b!418693))

(assert (= (or b!418704 b!418693) bm!29151))

(assert (= (or b!418704 b!418693) bm!29152))

(assert (= (and b!418706 (not res!244071)) b!418695))

(assert (= (and b!418710 condMapEmpty!17850) mapIsEmpty!17850))

(assert (= (and b!418710 (not condMapEmpty!17850)) mapNonEmpty!17850))

(get-info :version)

(assert (= (and mapNonEmpty!17850 ((_ is ValueCellFull!5066) mapValue!17850)) b!418709))

(assert (= (and b!418710 ((_ is ValueCellFull!5066) mapDefault!17850)) b!418697))

(assert (= start!39386 b!418710))

(declare-fun b_lambda!8953 () Bool)

(assert (=> (not b_lambda!8953) (not b!418695)))

(declare-fun t!12437 () Bool)

(declare-fun tb!3281 () Bool)

(assert (=> (and start!39386 (= defaultEntry!557 defaultEntry!557) t!12437) tb!3281))

(declare-fun result!6097 () Bool)

(assert (=> tb!3281 (= result!6097 tp_is_empty!10819)))

(assert (=> b!418695 t!12437))

(declare-fun b_and!17185 () Bool)

(assert (= b_and!17183 (and (=> t!12437 result!6097) b_and!17185)))

(declare-fun m!407685 () Bool)

(assert (=> b!418698 m!407685))

(declare-fun m!407687 () Bool)

(assert (=> b!418705 m!407687))

(declare-fun m!407689 () Bool)

(assert (=> b!418694 m!407689))

(declare-fun m!407691 () Bool)

(assert (=> b!418704 m!407691))

(declare-fun m!407693 () Bool)

(assert (=> b!418706 m!407693))

(assert (=> b!418706 m!407693))

(declare-fun m!407695 () Bool)

(assert (=> b!418706 m!407695))

(declare-fun m!407697 () Bool)

(assert (=> b!418706 m!407697))

(declare-fun m!407699 () Bool)

(assert (=> b!418711 m!407699))

(declare-fun m!407701 () Bool)

(assert (=> b!418711 m!407701))

(declare-fun m!407703 () Bool)

(assert (=> b!418711 m!407703))

(declare-fun m!407705 () Bool)

(assert (=> b!418708 m!407705))

(declare-fun m!407707 () Bool)

(assert (=> mapNonEmpty!17850 m!407707))

(declare-fun m!407709 () Bool)

(assert (=> b!418707 m!407709))

(declare-fun m!407711 () Bool)

(assert (=> bm!29152 m!407711))

(declare-fun m!407713 () Bool)

(assert (=> b!418701 m!407713))

(declare-fun m!407715 () Bool)

(assert (=> start!39386 m!407715))

(declare-fun m!407717 () Bool)

(assert (=> start!39386 m!407717))

(declare-fun m!407719 () Bool)

(assert (=> b!418695 m!407719))

(declare-fun m!407721 () Bool)

(assert (=> b!418695 m!407721))

(declare-fun m!407723 () Bool)

(assert (=> b!418695 m!407723))

(declare-fun m!407725 () Bool)

(assert (=> b!418695 m!407725))

(declare-fun m!407727 () Bool)

(assert (=> b!418695 m!407727))

(declare-fun m!407729 () Bool)

(assert (=> b!418695 m!407729))

(assert (=> b!418695 m!407719))

(declare-fun m!407731 () Bool)

(assert (=> b!418695 m!407731))

(assert (=> b!418695 m!407727))

(declare-fun m!407733 () Bool)

(assert (=> b!418695 m!407733))

(declare-fun m!407735 () Bool)

(assert (=> b!418695 m!407735))

(assert (=> b!418695 m!407735))

(declare-fun m!407737 () Bool)

(assert (=> b!418695 m!407737))

(declare-fun m!407739 () Bool)

(assert (=> b!418695 m!407739))

(assert (=> b!418695 m!407701))

(declare-fun m!407741 () Bool)

(assert (=> b!418695 m!407741))

(declare-fun m!407743 () Bool)

(assert (=> b!418702 m!407743))

(declare-fun m!407745 () Bool)

(assert (=> b!418700 m!407745))

(declare-fun m!407747 () Bool)

(assert (=> b!418700 m!407747))

(declare-fun m!407749 () Bool)

(assert (=> bm!29151 m!407749))

(check-sat (not b!418695) (not b!418701) (not b!418705) (not bm!29151) (not b!418706) (not b_lambda!8953) (not start!39386) (not b!418702) (not b!418708) (not b!418700) b_and!17185 (not b!418704) (not bm!29152) (not b!418698) (not b_next!9667) tp_is_empty!10819 (not b!418711) (not b!418694) (not mapNonEmpty!17850))
(check-sat b_and!17185 (not b_next!9667))
