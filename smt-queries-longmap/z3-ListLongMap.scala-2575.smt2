; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39254 () Bool)

(assert start!39254)

(declare-fun b_free!9535 () Bool)

(declare-fun b_next!9535 () Bool)

(assert (=> start!39254 (= b_free!9535 (not b_next!9535))))

(declare-fun tp!34134 () Bool)

(declare-fun b_and!16919 () Bool)

(assert (=> start!39254 (= tp!34134 b_and!16919)))

(declare-fun b!414799 () Bool)

(declare-fun e!247802 () Bool)

(declare-fun e!247806 () Bool)

(declare-fun mapRes!17652 () Bool)

(assert (=> b!414799 (= e!247802 (and e!247806 mapRes!17652))))

(declare-fun condMapEmpty!17652 () Bool)

(declare-datatypes ((V!15355 0))(
  ( (V!15356 (val!5388 Int)) )
))
(declare-datatypes ((ValueCell!5000 0))(
  ( (ValueCellFull!5000 (v!7629 V!15355)) (EmptyCell!5000) )
))
(declare-datatypes ((array!25221 0))(
  ( (array!25222 (arr!12060 (Array (_ BitVec 32) ValueCell!5000)) (size!12413 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25221)

(declare-fun mapDefault!17652 () ValueCell!5000)

(assert (=> b!414799 (= condMapEmpty!17652 (= (arr!12060 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5000)) mapDefault!17652)))))

(declare-fun res!241298 () Bool)

(declare-fun e!247801 () Bool)

(assert (=> start!39254 (=> (not res!241298) (not e!247801))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25223 0))(
  ( (array!25224 (arr!12061 (Array (_ BitVec 32) (_ BitVec 64))) (size!12414 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25223)

(assert (=> start!39254 (= res!241298 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12414 _keys!709))))))

(assert (=> start!39254 e!247801))

(declare-fun tp_is_empty!10687 () Bool)

(assert (=> start!39254 tp_is_empty!10687))

(assert (=> start!39254 tp!34134))

(assert (=> start!39254 true))

(declare-fun array_inv!8842 (array!25221) Bool)

(assert (=> start!39254 (and (array_inv!8842 _values!549) e!247802)))

(declare-fun array_inv!8843 (array!25223) Bool)

(assert (=> start!39254 (array_inv!8843 _keys!709)))

(declare-fun b!414800 () Bool)

(declare-fun res!241293 () Bool)

(assert (=> b!414800 (=> (not res!241293) (not e!247801))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!414800 (= res!241293 (and (= (size!12413 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12414 _keys!709) (size!12413 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414801 () Bool)

(declare-fun res!241297 () Bool)

(assert (=> b!414801 (=> (not res!241297) (not e!247801))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414801 (= res!241297 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12414 _keys!709))))))

(declare-fun b!414802 () Bool)

(declare-fun res!241292 () Bool)

(declare-fun e!247800 () Bool)

(assert (=> b!414802 (=> (not res!241292) (not e!247800))))

(assert (=> b!414802 (= res!241292 (bvsle from!863 i!563))))

(declare-fun c!54945 () Bool)

(declare-fun minValue!515 () V!15355)

(declare-datatypes ((tuple2!6996 0))(
  ( (tuple2!6997 (_1!3509 (_ BitVec 64)) (_2!3509 V!15355)) )
))
(declare-datatypes ((List!7009 0))(
  ( (Nil!7006) (Cons!7005 (h!7861 tuple2!6996) (t!12200 List!7009)) )
))
(declare-datatypes ((ListLongMap!5899 0))(
  ( (ListLongMap!5900 (toList!2965 List!7009)) )
))
(declare-fun call!28758 () ListLongMap!5899)

(declare-fun zeroValue!515 () V!15355)

(declare-fun lt!189928 () array!25221)

(declare-fun lt!189925 () array!25223)

(declare-fun bm!28755 () Bool)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1177 (array!25223 array!25221 (_ BitVec 32) (_ BitVec 32) V!15355 V!15355 (_ BitVec 32) Int) ListLongMap!5899)

(assert (=> bm!28755 (= call!28758 (getCurrentListMapNoExtraKeys!1177 (ite c!54945 lt!189925 _keys!709) (ite c!54945 lt!189928 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414803 () Bool)

(declare-fun res!241289 () Bool)

(assert (=> b!414803 (=> (not res!241289) (not e!247801))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414803 (= res!241289 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!414804 () Bool)

(declare-fun res!241295 () Bool)

(assert (=> b!414804 (=> (not res!241295) (not e!247801))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414804 (= res!241295 (validMask!0 mask!1025))))

(declare-fun b!414805 () Bool)

(declare-fun e!247799 () Bool)

(assert (=> b!414805 (= e!247799 tp_is_empty!10687)))

(declare-fun b!414806 () Bool)

(declare-fun res!241294 () Bool)

(assert (=> b!414806 (=> (not res!241294) (not e!247801))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414806 (= res!241294 (validKeyInArray!0 k0!794))))

(declare-fun b!414807 () Bool)

(assert (=> b!414807 (= e!247801 e!247800)))

(declare-fun res!241290 () Bool)

(assert (=> b!414807 (=> (not res!241290) (not e!247800))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25223 (_ BitVec 32)) Bool)

(assert (=> b!414807 (= res!241290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189925 mask!1025))))

(assert (=> b!414807 (= lt!189925 (array!25224 (store (arr!12061 _keys!709) i!563 k0!794) (size!12414 _keys!709)))))

(declare-fun call!28759 () ListLongMap!5899)

(declare-fun bm!28756 () Bool)

(assert (=> bm!28756 (= call!28759 (getCurrentListMapNoExtraKeys!1177 (ite c!54945 _keys!709 lt!189925) (ite c!54945 _values!549 lt!189928) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414808 () Bool)

(declare-fun e!247804 () Bool)

(assert (=> b!414808 (= e!247800 e!247804)))

(declare-fun res!241300 () Bool)

(assert (=> b!414808 (=> (not res!241300) (not e!247804))))

(assert (=> b!414808 (= res!241300 (= from!863 i!563))))

(declare-fun lt!189927 () ListLongMap!5899)

(assert (=> b!414808 (= lt!189927 (getCurrentListMapNoExtraKeys!1177 lt!189925 lt!189928 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15355)

(assert (=> b!414808 (= lt!189928 (array!25222 (store (arr!12060 _values!549) i!563 (ValueCellFull!5000 v!412)) (size!12413 _values!549)))))

(declare-fun lt!189929 () ListLongMap!5899)

(assert (=> b!414808 (= lt!189929 (getCurrentListMapNoExtraKeys!1177 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun e!247803 () Bool)

(declare-fun b!414809 () Bool)

(declare-fun +!1199 (ListLongMap!5899 tuple2!6996) ListLongMap!5899)

(assert (=> b!414809 (= e!247803 (= call!28758 (+!1199 call!28759 (tuple2!6997 k0!794 v!412))))))

(declare-fun mapNonEmpty!17652 () Bool)

(declare-fun tp!34133 () Bool)

(assert (=> mapNonEmpty!17652 (= mapRes!17652 (and tp!34133 e!247799))))

(declare-fun mapRest!17652 () (Array (_ BitVec 32) ValueCell!5000))

(declare-fun mapValue!17652 () ValueCell!5000)

(declare-fun mapKey!17652 () (_ BitVec 32))

(assert (=> mapNonEmpty!17652 (= (arr!12060 _values!549) (store mapRest!17652 mapKey!17652 mapValue!17652))))

(declare-fun b!414810 () Bool)

(declare-fun res!241291 () Bool)

(assert (=> b!414810 (=> (not res!241291) (not e!247801))))

(assert (=> b!414810 (= res!241291 (or (= (select (arr!12061 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12061 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414811 () Bool)

(assert (=> b!414811 (= e!247803 (= call!28759 call!28758))))

(declare-fun b!414812 () Bool)

(declare-fun e!247798 () Bool)

(assert (=> b!414812 (= e!247798 true)))

(declare-fun get!5945 (ValueCell!5000 V!15355) V!15355)

(declare-fun dynLambda!649 (Int (_ BitVec 64)) V!15355)

(assert (=> b!414812 (= lt!189927 (+!1199 (getCurrentListMapNoExtraKeys!1177 lt!189925 lt!189928 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6997 (select (arr!12061 lt!189925) from!863) (get!5945 (select (arr!12060 lt!189928) from!863) (dynLambda!649 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414813 () Bool)

(assert (=> b!414813 (= e!247806 tp_is_empty!10687)))

(declare-fun b!414814 () Bool)

(declare-fun res!241299 () Bool)

(assert (=> b!414814 (=> (not res!241299) (not e!247800))))

(declare-datatypes ((List!7010 0))(
  ( (Nil!7007) (Cons!7006 (h!7862 (_ BitVec 64)) (t!12201 List!7010)) )
))
(declare-fun arrayNoDuplicates!0 (array!25223 (_ BitVec 32) List!7010) Bool)

(assert (=> b!414814 (= res!241299 (arrayNoDuplicates!0 lt!189925 #b00000000000000000000000000000000 Nil!7007))))

(declare-fun b!414815 () Bool)

(declare-fun res!241301 () Bool)

(assert (=> b!414815 (=> (not res!241301) (not e!247801))))

(assert (=> b!414815 (= res!241301 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7007))))

(declare-fun b!414816 () Bool)

(assert (=> b!414816 (= e!247804 (not e!247798))))

(declare-fun res!241302 () Bool)

(assert (=> b!414816 (=> res!241302 e!247798)))

(assert (=> b!414816 (= res!241302 (validKeyInArray!0 (select (arr!12061 _keys!709) from!863)))))

(assert (=> b!414816 e!247803))

(assert (=> b!414816 (= c!54945 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12244 0))(
  ( (Unit!12245) )
))
(declare-fun lt!189926 () Unit!12244)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!385 (array!25223 array!25221 (_ BitVec 32) (_ BitVec 32) V!15355 V!15355 (_ BitVec 32) (_ BitVec 64) V!15355 (_ BitVec 32) Int) Unit!12244)

(assert (=> b!414816 (= lt!189926 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!385 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17652 () Bool)

(assert (=> mapIsEmpty!17652 mapRes!17652))

(declare-fun b!414817 () Bool)

(declare-fun res!241296 () Bool)

(assert (=> b!414817 (=> (not res!241296) (not e!247801))))

(assert (=> b!414817 (= res!241296 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39254 res!241298) b!414804))

(assert (= (and b!414804 res!241295) b!414800))

(assert (= (and b!414800 res!241293) b!414817))

(assert (= (and b!414817 res!241296) b!414815))

(assert (= (and b!414815 res!241301) b!414801))

(assert (= (and b!414801 res!241297) b!414806))

(assert (= (and b!414806 res!241294) b!414810))

(assert (= (and b!414810 res!241291) b!414803))

(assert (= (and b!414803 res!241289) b!414807))

(assert (= (and b!414807 res!241290) b!414814))

(assert (= (and b!414814 res!241299) b!414802))

(assert (= (and b!414802 res!241292) b!414808))

(assert (= (and b!414808 res!241300) b!414816))

(assert (= (and b!414816 c!54945) b!414809))

(assert (= (and b!414816 (not c!54945)) b!414811))

(assert (= (or b!414809 b!414811) bm!28755))

(assert (= (or b!414809 b!414811) bm!28756))

(assert (= (and b!414816 (not res!241302)) b!414812))

(assert (= (and b!414799 condMapEmpty!17652) mapIsEmpty!17652))

(assert (= (and b!414799 (not condMapEmpty!17652)) mapNonEmpty!17652))

(get-info :version)

(assert (= (and mapNonEmpty!17652 ((_ is ValueCellFull!5000) mapValue!17652)) b!414805))

(assert (= (and b!414799 ((_ is ValueCellFull!5000) mapDefault!17652)) b!414813))

(assert (= start!39254 b!414799))

(declare-fun b_lambda!8821 () Bool)

(assert (=> (not b_lambda!8821) (not b!414812)))

(declare-fun t!12199 () Bool)

(declare-fun tb!3149 () Bool)

(assert (=> (and start!39254 (= defaultEntry!557 defaultEntry!557) t!12199) tb!3149))

(declare-fun result!5833 () Bool)

(assert (=> tb!3149 (= result!5833 tp_is_empty!10687)))

(assert (=> b!414812 t!12199))

(declare-fun b_and!16921 () Bool)

(assert (= b_and!16919 (and (=> t!12199 result!5833) b_and!16921)))

(declare-fun m!403513 () Bool)

(assert (=> b!414814 m!403513))

(declare-fun m!403515 () Bool)

(assert (=> b!414806 m!403515))

(declare-fun m!403517 () Bool)

(assert (=> b!414808 m!403517))

(declare-fun m!403519 () Bool)

(assert (=> b!414808 m!403519))

(declare-fun m!403521 () Bool)

(assert (=> b!414808 m!403521))

(declare-fun m!403523 () Bool)

(assert (=> b!414815 m!403523))

(declare-fun m!403525 () Bool)

(assert (=> bm!28755 m!403525))

(declare-fun m!403527 () Bool)

(assert (=> b!414812 m!403527))

(declare-fun m!403529 () Bool)

(assert (=> b!414812 m!403529))

(declare-fun m!403531 () Bool)

(assert (=> b!414812 m!403531))

(declare-fun m!403533 () Bool)

(assert (=> b!414812 m!403533))

(assert (=> b!414812 m!403527))

(declare-fun m!403535 () Bool)

(assert (=> b!414812 m!403535))

(assert (=> b!414812 m!403529))

(declare-fun m!403537 () Bool)

(assert (=> b!414812 m!403537))

(assert (=> b!414812 m!403533))

(declare-fun m!403539 () Bool)

(assert (=> b!414803 m!403539))

(declare-fun m!403541 () Bool)

(assert (=> bm!28756 m!403541))

(declare-fun m!403543 () Bool)

(assert (=> start!39254 m!403543))

(declare-fun m!403545 () Bool)

(assert (=> start!39254 m!403545))

(declare-fun m!403547 () Bool)

(assert (=> b!414804 m!403547))

(declare-fun m!403549 () Bool)

(assert (=> mapNonEmpty!17652 m!403549))

(declare-fun m!403551 () Bool)

(assert (=> b!414817 m!403551))

(declare-fun m!403553 () Bool)

(assert (=> b!414807 m!403553))

(declare-fun m!403555 () Bool)

(assert (=> b!414807 m!403555))

(declare-fun m!403557 () Bool)

(assert (=> b!414816 m!403557))

(assert (=> b!414816 m!403557))

(declare-fun m!403559 () Bool)

(assert (=> b!414816 m!403559))

(declare-fun m!403561 () Bool)

(assert (=> b!414816 m!403561))

(declare-fun m!403563 () Bool)

(assert (=> b!414810 m!403563))

(declare-fun m!403565 () Bool)

(assert (=> b!414809 m!403565))

(check-sat (not bm!28755) b_and!16921 (not b!414816) (not b!414803) (not b_next!9535) (not b!414807) (not b!414812) (not b!414815) (not start!39254) (not b!414806) (not bm!28756) tp_is_empty!10687 (not b!414804) (not b_lambda!8821) (not b!414817) (not b!414809) (not mapNonEmpty!17652) (not b!414814) (not b!414808))
(check-sat b_and!16921 (not b_next!9535))
