; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39380 () Bool)

(assert start!39380)

(declare-fun b_free!9661 () Bool)

(declare-fun b_next!9661 () Bool)

(assert (=> start!39380 (= b_free!9661 (not b_next!9661))))

(declare-fun tp!34512 () Bool)

(declare-fun b_and!17211 () Bool)

(assert (=> start!39380 (= tp!34512 b_and!17211)))

(declare-fun b!418738 () Bool)

(declare-fun e!249642 () Bool)

(declare-datatypes ((V!15523 0))(
  ( (V!15524 (val!5451 Int)) )
))
(declare-datatypes ((tuple2!7008 0))(
  ( (tuple2!7009 (_1!3515 (_ BitVec 64)) (_2!3515 V!15523)) )
))
(declare-datatypes ((List!7020 0))(
  ( (Nil!7017) (Cons!7016 (h!7872 tuple2!7008) (t!12338 List!7020)) )
))
(declare-datatypes ((ListLongMap!5923 0))(
  ( (ListLongMap!5924 (toList!2977 List!7020)) )
))
(declare-fun call!29148 () ListLongMap!5923)

(declare-fun call!29149 () ListLongMap!5923)

(assert (=> b!418738 (= e!249642 (= call!29148 call!29149))))

(declare-fun b!418740 () Bool)

(declare-fun res!244065 () Bool)

(declare-fun e!249645 () Bool)

(assert (=> b!418740 (=> (not res!244065) (not e!249645))))

(declare-datatypes ((array!25484 0))(
  ( (array!25485 (arr!12191 (Array (_ BitVec 32) (_ BitVec 64))) (size!12543 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25484)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418740 (= res!244065 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!418741 () Bool)

(declare-fun e!249643 () Bool)

(declare-fun e!249648 () Bool)

(assert (=> b!418741 (= e!249643 e!249648)))

(declare-fun res!244064 () Bool)

(assert (=> b!418741 (=> (not res!244064) (not e!249648))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418741 (= res!244064 (= from!863 i!563))))

(declare-fun minValue!515 () V!15523)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!192005 () ListLongMap!5923)

(declare-fun zeroValue!515 () V!15523)

(declare-datatypes ((ValueCell!5063 0))(
  ( (ValueCellFull!5063 (v!7699 V!15523)) (EmptyCell!5063) )
))
(declare-datatypes ((array!25486 0))(
  ( (array!25487 (arr!12192 (Array (_ BitVec 32) ValueCell!5063)) (size!12544 (_ BitVec 32))) )
))
(declare-fun lt!192002 () array!25486)

(declare-fun lt!192004 () array!25484)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1223 (array!25484 array!25486 (_ BitVec 32) (_ BitVec 32) V!15523 V!15523 (_ BitVec 32) Int) ListLongMap!5923)

(assert (=> b!418741 (= lt!192005 (getCurrentListMapNoExtraKeys!1223 lt!192004 lt!192002 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25486)

(declare-fun v!412 () V!15523)

(assert (=> b!418741 (= lt!192002 (array!25487 (store (arr!12192 _values!549) i!563 (ValueCellFull!5063 v!412)) (size!12544 _values!549)))))

(declare-fun lt!192006 () ListLongMap!5923)

(assert (=> b!418741 (= lt!192006 (getCurrentListMapNoExtraKeys!1223 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418742 () Bool)

(declare-fun e!249649 () Bool)

(assert (=> b!418742 (= e!249648 (not e!249649))))

(declare-fun res!244068 () Bool)

(assert (=> b!418742 (=> res!244068 e!249649)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418742 (= res!244068 (validKeyInArray!0 (select (arr!12191 _keys!709) from!863)))))

(assert (=> b!418742 e!249642))

(declare-fun c!55182 () Bool)

(assert (=> b!418742 (= c!55182 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12355 0))(
  ( (Unit!12356) )
))
(declare-fun lt!192008 () Unit!12355)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!435 (array!25484 array!25486 (_ BitVec 32) (_ BitVec 32) V!15523 V!15523 (_ BitVec 32) (_ BitVec 64) V!15523 (_ BitVec 32) Int) Unit!12355)

(assert (=> b!418742 (= lt!192008 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!435 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418743 () Bool)

(assert (=> b!418743 (= e!249645 e!249643)))

(declare-fun res!244062 () Bool)

(assert (=> b!418743 (=> (not res!244062) (not e!249643))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25484 (_ BitVec 32)) Bool)

(assert (=> b!418743 (= res!244062 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192004 mask!1025))))

(assert (=> b!418743 (= lt!192004 (array!25485 (store (arr!12191 _keys!709) i!563 k0!794) (size!12543 _keys!709)))))

(declare-fun b!418744 () Bool)

(declare-fun res!244074 () Bool)

(assert (=> b!418744 (=> (not res!244074) (not e!249645))))

(declare-datatypes ((List!7021 0))(
  ( (Nil!7018) (Cons!7017 (h!7873 (_ BitVec 64)) (t!12339 List!7021)) )
))
(declare-fun arrayNoDuplicates!0 (array!25484 (_ BitVec 32) List!7021) Bool)

(assert (=> b!418744 (= res!244074 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7018))))

(declare-fun b!418745 () Bool)

(declare-fun +!1243 (ListLongMap!5923 tuple2!7008) ListLongMap!5923)

(assert (=> b!418745 (= e!249642 (= call!29149 (+!1243 call!29148 (tuple2!7009 k0!794 v!412))))))

(declare-fun b!418746 () Bool)

(declare-fun res!244063 () Bool)

(assert (=> b!418746 (=> (not res!244063) (not e!249643))))

(assert (=> b!418746 (= res!244063 (bvsle from!863 i!563))))

(declare-fun b!418747 () Bool)

(declare-fun res!244061 () Bool)

(assert (=> b!418747 (=> (not res!244061) (not e!249645))))

(assert (=> b!418747 (= res!244061 (validKeyInArray!0 k0!794))))

(declare-fun b!418748 () Bool)

(declare-fun res!244069 () Bool)

(assert (=> b!418748 (=> (not res!244069) (not e!249645))))

(assert (=> b!418748 (= res!244069 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418749 () Bool)

(declare-fun res!244072 () Bool)

(assert (=> b!418749 (=> (not res!244072) (not e!249645))))

(assert (=> b!418749 (= res!244072 (or (= (select (arr!12191 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12191 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418750 () Bool)

(declare-fun res!244071 () Bool)

(assert (=> b!418750 (=> (not res!244071) (not e!249645))))

(assert (=> b!418750 (= res!244071 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12543 _keys!709))))))

(declare-fun res!244066 () Bool)

(assert (=> start!39380 (=> (not res!244066) (not e!249645))))

(assert (=> start!39380 (= res!244066 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12543 _keys!709))))))

(assert (=> start!39380 e!249645))

(declare-fun tp_is_empty!10813 () Bool)

(assert (=> start!39380 tp_is_empty!10813))

(assert (=> start!39380 tp!34512))

(assert (=> start!39380 true))

(declare-fun e!249647 () Bool)

(declare-fun array_inv!8964 (array!25486) Bool)

(assert (=> start!39380 (and (array_inv!8964 _values!549) e!249647)))

(declare-fun array_inv!8965 (array!25484) Bool)

(assert (=> start!39380 (array_inv!8965 _keys!709)))

(declare-fun b!418739 () Bool)

(declare-fun e!249641 () Bool)

(assert (=> b!418739 (= e!249641 tp_is_empty!10813)))

(declare-fun b!418751 () Bool)

(declare-fun e!249646 () Bool)

(assert (=> b!418751 (= e!249646 tp_is_empty!10813)))

(declare-fun b!418752 () Bool)

(assert (=> b!418752 (= e!249649 true)))

(declare-fun lt!192000 () tuple2!7008)

(declare-fun lt!192003 () V!15523)

(declare-fun lt!191999 () ListLongMap!5923)

(assert (=> b!418752 (= (+!1243 lt!191999 lt!192000) (+!1243 (+!1243 lt!191999 (tuple2!7009 k0!794 lt!192003)) lt!192000))))

(declare-fun lt!192009 () V!15523)

(assert (=> b!418752 (= lt!192000 (tuple2!7009 k0!794 lt!192009))))

(declare-fun lt!192001 () Unit!12355)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!33 (ListLongMap!5923 (_ BitVec 64) V!15523 V!15523) Unit!12355)

(assert (=> b!418752 (= lt!192001 (addSameAsAddTwiceSameKeyDiffValues!33 lt!191999 k0!794 lt!192003 lt!192009))))

(declare-fun lt!192007 () V!15523)

(declare-fun get!6041 (ValueCell!5063 V!15523) V!15523)

(assert (=> b!418752 (= lt!192003 (get!6041 (select (arr!12192 _values!549) from!863) lt!192007))))

(assert (=> b!418752 (= lt!192005 (+!1243 lt!191999 (tuple2!7009 (select (arr!12191 lt!192004) from!863) lt!192009)))))

(assert (=> b!418752 (= lt!192009 (get!6041 (select (store (arr!12192 _values!549) i!563 (ValueCellFull!5063 v!412)) from!863) lt!192007))))

(declare-fun dynLambda!700 (Int (_ BitVec 64)) V!15523)

(assert (=> b!418752 (= lt!192007 (dynLambda!700 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418752 (= lt!191999 (getCurrentListMapNoExtraKeys!1223 lt!192004 lt!192002 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418753 () Bool)

(declare-fun res!244073 () Bool)

(assert (=> b!418753 (=> (not res!244073) (not e!249645))))

(assert (=> b!418753 (= res!244073 (and (= (size!12544 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12543 _keys!709) (size!12544 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418754 () Bool)

(declare-fun res!244070 () Bool)

(assert (=> b!418754 (=> (not res!244070) (not e!249643))))

(assert (=> b!418754 (= res!244070 (arrayNoDuplicates!0 lt!192004 #b00000000000000000000000000000000 Nil!7018))))

(declare-fun mapNonEmpty!17841 () Bool)

(declare-fun mapRes!17841 () Bool)

(declare-fun tp!34511 () Bool)

(assert (=> mapNonEmpty!17841 (= mapRes!17841 (and tp!34511 e!249641))))

(declare-fun mapValue!17841 () ValueCell!5063)

(declare-fun mapRest!17841 () (Array (_ BitVec 32) ValueCell!5063))

(declare-fun mapKey!17841 () (_ BitVec 32))

(assert (=> mapNonEmpty!17841 (= (arr!12192 _values!549) (store mapRest!17841 mapKey!17841 mapValue!17841))))

(declare-fun b!418755 () Bool)

(declare-fun res!244067 () Bool)

(assert (=> b!418755 (=> (not res!244067) (not e!249645))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418755 (= res!244067 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17841 () Bool)

(assert (=> mapIsEmpty!17841 mapRes!17841))

(declare-fun bm!29145 () Bool)

(assert (=> bm!29145 (= call!29149 (getCurrentListMapNoExtraKeys!1223 (ite c!55182 lt!192004 _keys!709) (ite c!55182 lt!192002 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29146 () Bool)

(assert (=> bm!29146 (= call!29148 (getCurrentListMapNoExtraKeys!1223 (ite c!55182 _keys!709 lt!192004) (ite c!55182 _values!549 lt!192002) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418756 () Bool)

(assert (=> b!418756 (= e!249647 (and e!249646 mapRes!17841))))

(declare-fun condMapEmpty!17841 () Bool)

(declare-fun mapDefault!17841 () ValueCell!5063)

(assert (=> b!418756 (= condMapEmpty!17841 (= (arr!12192 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5063)) mapDefault!17841)))))

(assert (= (and start!39380 res!244066) b!418755))

(assert (= (and b!418755 res!244067) b!418753))

(assert (= (and b!418753 res!244073) b!418748))

(assert (= (and b!418748 res!244069) b!418744))

(assert (= (and b!418744 res!244074) b!418750))

(assert (= (and b!418750 res!244071) b!418747))

(assert (= (and b!418747 res!244061) b!418749))

(assert (= (and b!418749 res!244072) b!418740))

(assert (= (and b!418740 res!244065) b!418743))

(assert (= (and b!418743 res!244062) b!418754))

(assert (= (and b!418754 res!244070) b!418746))

(assert (= (and b!418746 res!244063) b!418741))

(assert (= (and b!418741 res!244064) b!418742))

(assert (= (and b!418742 c!55182) b!418745))

(assert (= (and b!418742 (not c!55182)) b!418738))

(assert (= (or b!418745 b!418738) bm!29145))

(assert (= (or b!418745 b!418738) bm!29146))

(assert (= (and b!418742 (not res!244068)) b!418752))

(assert (= (and b!418756 condMapEmpty!17841) mapIsEmpty!17841))

(assert (= (and b!418756 (not condMapEmpty!17841)) mapNonEmpty!17841))

(get-info :version)

(assert (= (and mapNonEmpty!17841 ((_ is ValueCellFull!5063) mapValue!17841)) b!418739))

(assert (= (and b!418756 ((_ is ValueCellFull!5063) mapDefault!17841)) b!418751))

(assert (= start!39380 b!418756))

(declare-fun b_lambda!8987 () Bool)

(assert (=> (not b_lambda!8987) (not b!418752)))

(declare-fun t!12337 () Bool)

(declare-fun tb!3275 () Bool)

(assert (=> (and start!39380 (= defaultEntry!557 defaultEntry!557) t!12337) tb!3275))

(declare-fun result!6085 () Bool)

(assert (=> tb!3275 (= result!6085 tp_is_empty!10813)))

(assert (=> b!418752 t!12337))

(declare-fun b_and!17213 () Bool)

(assert (= b_and!17211 (and (=> t!12337 result!6085) b_and!17213)))

(declare-fun m!408437 () Bool)

(assert (=> bm!29145 m!408437))

(declare-fun m!408439 () Bool)

(assert (=> start!39380 m!408439))

(declare-fun m!408441 () Bool)

(assert (=> start!39380 m!408441))

(declare-fun m!408443 () Bool)

(assert (=> bm!29146 m!408443))

(declare-fun m!408445 () Bool)

(assert (=> b!418743 m!408445))

(declare-fun m!408447 () Bool)

(assert (=> b!418743 m!408447))

(declare-fun m!408449 () Bool)

(assert (=> b!418740 m!408449))

(declare-fun m!408451 () Bool)

(assert (=> b!418754 m!408451))

(declare-fun m!408453 () Bool)

(assert (=> b!418745 m!408453))

(declare-fun m!408455 () Bool)

(assert (=> b!418755 m!408455))

(declare-fun m!408457 () Bool)

(assert (=> b!418748 m!408457))

(declare-fun m!408459 () Bool)

(assert (=> b!418752 m!408459))

(declare-fun m!408461 () Bool)

(assert (=> b!418752 m!408461))

(declare-fun m!408463 () Bool)

(assert (=> b!418752 m!408463))

(declare-fun m!408465 () Bool)

(assert (=> b!418752 m!408465))

(declare-fun m!408467 () Bool)

(assert (=> b!418752 m!408467))

(declare-fun m!408469 () Bool)

(assert (=> b!418752 m!408469))

(declare-fun m!408471 () Bool)

(assert (=> b!418752 m!408471))

(assert (=> b!418752 m!408461))

(declare-fun m!408473 () Bool)

(assert (=> b!418752 m!408473))

(declare-fun m!408475 () Bool)

(assert (=> b!418752 m!408475))

(declare-fun m!408477 () Bool)

(assert (=> b!418752 m!408477))

(declare-fun m!408479 () Bool)

(assert (=> b!418752 m!408479))

(assert (=> b!418752 m!408473))

(declare-fun m!408481 () Bool)

(assert (=> b!418752 m!408481))

(assert (=> b!418752 m!408475))

(declare-fun m!408483 () Bool)

(assert (=> b!418752 m!408483))

(declare-fun m!408485 () Bool)

(assert (=> b!418749 m!408485))

(declare-fun m!408487 () Bool)

(assert (=> mapNonEmpty!17841 m!408487))

(declare-fun m!408489 () Bool)

(assert (=> b!418742 m!408489))

(assert (=> b!418742 m!408489))

(declare-fun m!408491 () Bool)

(assert (=> b!418742 m!408491))

(declare-fun m!408493 () Bool)

(assert (=> b!418742 m!408493))

(declare-fun m!408495 () Bool)

(assert (=> b!418741 m!408495))

(assert (=> b!418741 m!408469))

(declare-fun m!408497 () Bool)

(assert (=> b!418741 m!408497))

(declare-fun m!408499 () Bool)

(assert (=> b!418747 m!408499))

(declare-fun m!408501 () Bool)

(assert (=> b!418744 m!408501))

(check-sat (not start!39380) (not b_lambda!8987) (not b_next!9661) (not b!418755) (not b!418748) (not b!418744) (not b!418745) (not b!418752) tp_is_empty!10813 (not b!418743) (not b!418742) (not b!418754) (not mapNonEmpty!17841) (not b!418741) (not bm!29145) b_and!17213 (not b!418747) (not bm!29146) (not b!418740))
(check-sat b_and!17213 (not b_next!9661))
