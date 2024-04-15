; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39488 () Bool)

(assert start!39488)

(declare-fun b_free!9769 () Bool)

(declare-fun b_next!9769 () Bool)

(assert (=> start!39488 (= b_free!9769 (not b_next!9769))))

(declare-fun tp!34835 () Bool)

(declare-fun b_and!17387 () Bool)

(assert (=> start!39488 (= tp!34835 b_and!17387)))

(declare-fun b!421702 () Bool)

(declare-fun res!246209 () Bool)

(declare-fun e!250964 () Bool)

(assert (=> b!421702 (=> (not res!246209) (not e!250964))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421702 (= res!246209 (validMask!0 mask!1025))))

(declare-fun b!421703 () Bool)

(declare-fun e!250965 () Bool)

(declare-fun e!250961 () Bool)

(assert (=> b!421703 (= e!250965 e!250961)))

(declare-fun res!246214 () Bool)

(assert (=> b!421703 (=> (not res!246214) (not e!250961))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421703 (= res!246214 (= from!863 i!563))))

(declare-datatypes ((V!15667 0))(
  ( (V!15668 (val!5505 Int)) )
))
(declare-fun minValue!515 () V!15667)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15667)

(declare-datatypes ((tuple2!7212 0))(
  ( (tuple2!7213 (_1!3617 (_ BitVec 64)) (_2!3617 V!15667)) )
))
(declare-datatypes ((List!7202 0))(
  ( (Nil!7199) (Cons!7198 (h!8054 tuple2!7212) (t!12627 List!7202)) )
))
(declare-datatypes ((ListLongMap!6115 0))(
  ( (ListLongMap!6116 (toList!3073 List!7202)) )
))
(declare-fun lt!193528 () ListLongMap!6115)

(declare-datatypes ((ValueCell!5117 0))(
  ( (ValueCellFull!5117 (v!7746 V!15667)) (EmptyCell!5117) )
))
(declare-datatypes ((array!25673 0))(
  ( (array!25674 (arr!12286 (Array (_ BitVec 32) ValueCell!5117)) (size!12639 (_ BitVec 32))) )
))
(declare-fun lt!193535 () array!25673)

(declare-datatypes ((array!25675 0))(
  ( (array!25676 (arr!12287 (Array (_ BitVec 32) (_ BitVec 64))) (size!12640 (_ BitVec 32))) )
))
(declare-fun lt!193529 () array!25675)

(declare-fun getCurrentListMapNoExtraKeys!1282 (array!25675 array!25673 (_ BitVec 32) (_ BitVec 32) V!15667 V!15667 (_ BitVec 32) Int) ListLongMap!6115)

(assert (=> b!421703 (= lt!193528 (getCurrentListMapNoExtraKeys!1282 lt!193529 lt!193535 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25673)

(declare-fun v!412 () V!15667)

(assert (=> b!421703 (= lt!193535 (array!25674 (store (arr!12286 _values!549) i!563 (ValueCellFull!5117 v!412)) (size!12639 _values!549)))))

(declare-fun _keys!709 () array!25675)

(declare-fun lt!193532 () ListLongMap!6115)

(assert (=> b!421703 (= lt!193532 (getCurrentListMapNoExtraKeys!1282 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421704 () Bool)

(declare-fun res!246207 () Bool)

(assert (=> b!421704 (=> (not res!246207) (not e!250965))))

(declare-datatypes ((List!7203 0))(
  ( (Nil!7200) (Cons!7199 (h!8055 (_ BitVec 64)) (t!12628 List!7203)) )
))
(declare-fun arrayNoDuplicates!0 (array!25675 (_ BitVec 32) List!7203) Bool)

(assert (=> b!421704 (= res!246207 (arrayNoDuplicates!0 lt!193529 #b00000000000000000000000000000000 Nil!7200))))

(declare-fun b!421705 () Bool)

(declare-fun e!250963 () Bool)

(declare-fun tp_is_empty!10921 () Bool)

(assert (=> b!421705 (= e!250963 tp_is_empty!10921)))

(declare-fun b!421706 () Bool)

(declare-fun e!250962 () Bool)

(declare-fun call!29461 () ListLongMap!6115)

(declare-fun call!29460 () ListLongMap!6115)

(assert (=> b!421706 (= e!250962 (= call!29461 call!29460))))

(declare-fun b!421707 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun +!1293 (ListLongMap!6115 tuple2!7212) ListLongMap!6115)

(assert (=> b!421707 (= e!250962 (= call!29460 (+!1293 call!29461 (tuple2!7213 k0!794 v!412))))))

(declare-fun b!421708 () Bool)

(declare-fun res!246212 () Bool)

(assert (=> b!421708 (=> (not res!246212) (not e!250964))))

(assert (=> b!421708 (= res!246212 (or (= (select (arr!12287 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12287 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18003 () Bool)

(declare-fun mapRes!18003 () Bool)

(assert (=> mapIsEmpty!18003 mapRes!18003))

(declare-fun b!421709 () Bool)

(declare-fun e!250958 () Bool)

(declare-fun e!250960 () Bool)

(assert (=> b!421709 (= e!250958 (and e!250960 mapRes!18003))))

(declare-fun condMapEmpty!18003 () Bool)

(declare-fun mapDefault!18003 () ValueCell!5117)

(assert (=> b!421709 (= condMapEmpty!18003 (= (arr!12286 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5117)) mapDefault!18003)))))

(declare-fun b!421710 () Bool)

(declare-fun res!246213 () Bool)

(assert (=> b!421710 (=> (not res!246213) (not e!250965))))

(assert (=> b!421710 (= res!246213 (bvsle from!863 i!563))))

(declare-fun c!55296 () Bool)

(declare-fun bm!29457 () Bool)

(assert (=> bm!29457 (= call!29461 (getCurrentListMapNoExtraKeys!1282 (ite c!55296 _keys!709 lt!193529) (ite c!55296 _values!549 lt!193535) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!246215 () Bool)

(assert (=> start!39488 (=> (not res!246215) (not e!250964))))

(assert (=> start!39488 (= res!246215 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12640 _keys!709))))))

(assert (=> start!39488 e!250964))

(assert (=> start!39488 tp_is_empty!10921))

(assert (=> start!39488 tp!34835))

(assert (=> start!39488 true))

(declare-fun array_inv!8994 (array!25673) Bool)

(assert (=> start!39488 (and (array_inv!8994 _values!549) e!250958)))

(declare-fun array_inv!8995 (array!25675) Bool)

(assert (=> start!39488 (array_inv!8995 _keys!709)))

(declare-fun b!421711 () Bool)

(declare-fun e!250959 () Bool)

(assert (=> b!421711 (= e!250961 (not e!250959))))

(declare-fun res!246204 () Bool)

(assert (=> b!421711 (=> res!246204 e!250959)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421711 (= res!246204 (validKeyInArray!0 (select (arr!12287 _keys!709) from!863)))))

(assert (=> b!421711 e!250962))

(assert (=> b!421711 (= c!55296 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12434 0))(
  ( (Unit!12435) )
))
(declare-fun lt!193531 () Unit!12434)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!465 (array!25675 array!25673 (_ BitVec 32) (_ BitVec 32) V!15667 V!15667 (_ BitVec 32) (_ BitVec 64) V!15667 (_ BitVec 32) Int) Unit!12434)

(assert (=> b!421711 (= lt!193531 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!465 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421712 () Bool)

(declare-fun res!246203 () Bool)

(assert (=> b!421712 (=> (not res!246203) (not e!250964))))

(declare-fun arrayContainsKey!0 (array!25675 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421712 (= res!246203 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421713 () Bool)

(declare-fun res!246210 () Bool)

(assert (=> b!421713 (=> (not res!246210) (not e!250964))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25675 (_ BitVec 32)) Bool)

(assert (=> b!421713 (= res!246210 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421714 () Bool)

(declare-fun res!246206 () Bool)

(assert (=> b!421714 (=> (not res!246206) (not e!250964))))

(assert (=> b!421714 (= res!246206 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12640 _keys!709))))))

(declare-fun b!421715 () Bool)

(declare-fun res!246205 () Bool)

(assert (=> b!421715 (=> (not res!246205) (not e!250964))))

(assert (=> b!421715 (= res!246205 (and (= (size!12639 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12640 _keys!709) (size!12639 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!29458 () Bool)

(assert (=> bm!29458 (= call!29460 (getCurrentListMapNoExtraKeys!1282 (ite c!55296 lt!193529 _keys!709) (ite c!55296 lt!193535 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!18003 () Bool)

(declare-fun tp!34836 () Bool)

(assert (=> mapNonEmpty!18003 (= mapRes!18003 (and tp!34836 e!250963))))

(declare-fun mapValue!18003 () ValueCell!5117)

(declare-fun mapRest!18003 () (Array (_ BitVec 32) ValueCell!5117))

(declare-fun mapKey!18003 () (_ BitVec 32))

(assert (=> mapNonEmpty!18003 (= (arr!12286 _values!549) (store mapRest!18003 mapKey!18003 mapValue!18003))))

(declare-fun b!421716 () Bool)

(assert (=> b!421716 (= e!250959 true)))

(declare-fun lt!193538 () V!15667)

(declare-fun lt!193530 () tuple2!7212)

(declare-fun lt!193533 () ListLongMap!6115)

(assert (=> b!421716 (= (+!1293 lt!193533 lt!193530) (+!1293 (+!1293 lt!193533 (tuple2!7213 k0!794 lt!193538)) lt!193530))))

(declare-fun lt!193534 () V!15667)

(assert (=> b!421716 (= lt!193530 (tuple2!7213 k0!794 lt!193534))))

(declare-fun lt!193536 () Unit!12434)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!76 (ListLongMap!6115 (_ BitVec 64) V!15667 V!15667) Unit!12434)

(assert (=> b!421716 (= lt!193536 (addSameAsAddTwiceSameKeyDiffValues!76 lt!193533 k0!794 lt!193538 lt!193534))))

(declare-fun lt!193537 () V!15667)

(declare-fun get!6107 (ValueCell!5117 V!15667) V!15667)

(assert (=> b!421716 (= lt!193538 (get!6107 (select (arr!12286 _values!549) from!863) lt!193537))))

(assert (=> b!421716 (= lt!193528 (+!1293 lt!193533 (tuple2!7213 (select (arr!12287 lt!193529) from!863) lt!193534)))))

(assert (=> b!421716 (= lt!193534 (get!6107 (select (store (arr!12286 _values!549) i!563 (ValueCellFull!5117 v!412)) from!863) lt!193537))))

(declare-fun dynLambda!733 (Int (_ BitVec 64)) V!15667)

(assert (=> b!421716 (= lt!193537 (dynLambda!733 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!421716 (= lt!193533 (getCurrentListMapNoExtraKeys!1282 lt!193529 lt!193535 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421717 () Bool)

(assert (=> b!421717 (= e!250964 e!250965)))

(declare-fun res!246211 () Bool)

(assert (=> b!421717 (=> (not res!246211) (not e!250965))))

(assert (=> b!421717 (= res!246211 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193529 mask!1025))))

(assert (=> b!421717 (= lt!193529 (array!25676 (store (arr!12287 _keys!709) i!563 k0!794) (size!12640 _keys!709)))))

(declare-fun b!421718 () Bool)

(declare-fun res!246208 () Bool)

(assert (=> b!421718 (=> (not res!246208) (not e!250964))))

(assert (=> b!421718 (= res!246208 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7200))))

(declare-fun b!421719 () Bool)

(declare-fun res!246216 () Bool)

(assert (=> b!421719 (=> (not res!246216) (not e!250964))))

(assert (=> b!421719 (= res!246216 (validKeyInArray!0 k0!794))))

(declare-fun b!421720 () Bool)

(assert (=> b!421720 (= e!250960 tp_is_empty!10921)))

(assert (= (and start!39488 res!246215) b!421702))

(assert (= (and b!421702 res!246209) b!421715))

(assert (= (and b!421715 res!246205) b!421713))

(assert (= (and b!421713 res!246210) b!421718))

(assert (= (and b!421718 res!246208) b!421714))

(assert (= (and b!421714 res!246206) b!421719))

(assert (= (and b!421719 res!246216) b!421708))

(assert (= (and b!421708 res!246212) b!421712))

(assert (= (and b!421712 res!246203) b!421717))

(assert (= (and b!421717 res!246211) b!421704))

(assert (= (and b!421704 res!246207) b!421710))

(assert (= (and b!421710 res!246213) b!421703))

(assert (= (and b!421703 res!246214) b!421711))

(assert (= (and b!421711 c!55296) b!421707))

(assert (= (and b!421711 (not c!55296)) b!421706))

(assert (= (or b!421707 b!421706) bm!29458))

(assert (= (or b!421707 b!421706) bm!29457))

(assert (= (and b!421711 (not res!246204)) b!421716))

(assert (= (and b!421709 condMapEmpty!18003) mapIsEmpty!18003))

(assert (= (and b!421709 (not condMapEmpty!18003)) mapNonEmpty!18003))

(get-info :version)

(assert (= (and mapNonEmpty!18003 ((_ is ValueCellFull!5117) mapValue!18003)) b!421705))

(assert (= (and b!421709 ((_ is ValueCellFull!5117) mapDefault!18003)) b!421720))

(assert (= start!39488 b!421709))

(declare-fun b_lambda!9055 () Bool)

(assert (=> (not b_lambda!9055) (not b!421716)))

(declare-fun t!12626 () Bool)

(declare-fun tb!3383 () Bool)

(assert (=> (and start!39488 (= defaultEntry!557 defaultEntry!557) t!12626) tb!3383))

(declare-fun result!6301 () Bool)

(assert (=> tb!3383 (= result!6301 tp_is_empty!10921)))

(assert (=> b!421716 t!12626))

(declare-fun b_and!17389 () Bool)

(assert (= b_and!17387 (and (=> t!12626 result!6301) b_and!17389)))

(declare-fun m!411045 () Bool)

(assert (=> b!421713 m!411045))

(declare-fun m!411047 () Bool)

(assert (=> b!421717 m!411047))

(declare-fun m!411049 () Bool)

(assert (=> b!421717 m!411049))

(declare-fun m!411051 () Bool)

(assert (=> start!39488 m!411051))

(declare-fun m!411053 () Bool)

(assert (=> start!39488 m!411053))

(declare-fun m!411055 () Bool)

(assert (=> b!421712 m!411055))

(declare-fun m!411057 () Bool)

(assert (=> b!421702 m!411057))

(declare-fun m!411059 () Bool)

(assert (=> bm!29457 m!411059))

(declare-fun m!411061 () Bool)

(assert (=> b!421716 m!411061))

(declare-fun m!411063 () Bool)

(assert (=> b!421716 m!411063))

(declare-fun m!411065 () Bool)

(assert (=> b!421716 m!411065))

(declare-fun m!411067 () Bool)

(assert (=> b!421716 m!411067))

(declare-fun m!411069 () Bool)

(assert (=> b!421716 m!411069))

(declare-fun m!411071 () Bool)

(assert (=> b!421716 m!411071))

(declare-fun m!411073 () Bool)

(assert (=> b!421716 m!411073))

(declare-fun m!411075 () Bool)

(assert (=> b!421716 m!411075))

(assert (=> b!421716 m!411061))

(declare-fun m!411077 () Bool)

(assert (=> b!421716 m!411077))

(assert (=> b!421716 m!411073))

(declare-fun m!411079 () Bool)

(assert (=> b!421716 m!411079))

(declare-fun m!411081 () Bool)

(assert (=> b!421716 m!411081))

(assert (=> b!421716 m!411081))

(declare-fun m!411083 () Bool)

(assert (=> b!421716 m!411083))

(declare-fun m!411085 () Bool)

(assert (=> b!421716 m!411085))

(declare-fun m!411087 () Bool)

(assert (=> b!421708 m!411087))

(declare-fun m!411089 () Bool)

(assert (=> mapNonEmpty!18003 m!411089))

(declare-fun m!411091 () Bool)

(assert (=> b!421707 m!411091))

(declare-fun m!411093 () Bool)

(assert (=> b!421704 m!411093))

(declare-fun m!411095 () Bool)

(assert (=> b!421718 m!411095))

(declare-fun m!411097 () Bool)

(assert (=> b!421711 m!411097))

(assert (=> b!421711 m!411097))

(declare-fun m!411099 () Bool)

(assert (=> b!421711 m!411099))

(declare-fun m!411101 () Bool)

(assert (=> b!421711 m!411101))

(declare-fun m!411103 () Bool)

(assert (=> b!421703 m!411103))

(assert (=> b!421703 m!411069))

(declare-fun m!411105 () Bool)

(assert (=> b!421703 m!411105))

(declare-fun m!411107 () Bool)

(assert (=> bm!29458 m!411107))

(declare-fun m!411109 () Bool)

(assert (=> b!421719 m!411109))

(check-sat (not b!421718) (not b!421702) (not b!421712) (not b_lambda!9055) (not b!421719) (not start!39488) (not b!421704) (not b_next!9769) (not bm!29458) (not mapNonEmpty!18003) (not b!421711) (not b!421717) (not bm!29457) (not b!421716) (not b!421713) (not b!421707) b_and!17389 tp_is_empty!10921 (not b!421703))
(check-sat b_and!17389 (not b_next!9769))
