; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39498 () Bool)

(assert start!39498)

(declare-fun b_free!9765 () Bool)

(declare-fun b_next!9765 () Bool)

(assert (=> start!39498 (= b_free!9765 (not b_next!9765))))

(declare-fun tp!34824 () Bool)

(declare-fun b_and!17405 () Bool)

(assert (=> start!39498 (= tp!34824 b_and!17405)))

(declare-datatypes ((V!15661 0))(
  ( (V!15662 (val!5503 Int)) )
))
(declare-fun minValue!515 () V!15661)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7220 0))(
  ( (tuple2!7221 (_1!3621 (_ BitVec 64)) (_2!3621 V!15661)) )
))
(declare-datatypes ((List!7225 0))(
  ( (Nil!7222) (Cons!7221 (h!8077 tuple2!7220) (t!12655 List!7225)) )
))
(declare-datatypes ((ListLongMap!6133 0))(
  ( (ListLongMap!6134 (toList!3082 List!7225)) )
))
(declare-fun call!29474 () ListLongMap!6133)

(declare-fun bm!29470 () Bool)

(declare-datatypes ((ValueCell!5115 0))(
  ( (ValueCellFull!5115 (v!7750 V!15661)) (EmptyCell!5115) )
))
(declare-datatypes ((array!25681 0))(
  ( (array!25682 (arr!12290 (Array (_ BitVec 32) ValueCell!5115)) (size!12642 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25681)

(declare-fun zeroValue!515 () V!15661)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!25683 0))(
  ( (array!25684 (arr!12291 (Array (_ BitVec 32) (_ BitVec 64))) (size!12643 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25683)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1286 (array!25683 array!25681 (_ BitVec 32) (_ BitVec 32) V!15661 V!15661 (_ BitVec 32) Int) ListLongMap!6133)

(assert (=> bm!29470 (= call!29474 (getCurrentListMapNoExtraKeys!1286 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421855 () Bool)

(declare-fun res!246249 () Bool)

(declare-fun e!251084 () Bool)

(assert (=> b!421855 (=> (not res!246249) (not e!251084))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25683 (_ BitVec 32)) Bool)

(assert (=> b!421855 (= res!246249 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17997 () Bool)

(declare-fun mapRes!17997 () Bool)

(declare-fun tp!34823 () Bool)

(declare-fun e!251081 () Bool)

(assert (=> mapNonEmpty!17997 (= mapRes!17997 (and tp!34823 e!251081))))

(declare-fun mapKey!17997 () (_ BitVec 32))

(declare-fun mapRest!17997 () (Array (_ BitVec 32) ValueCell!5115))

(declare-fun mapValue!17997 () ValueCell!5115)

(assert (=> mapNonEmpty!17997 (= (arr!12290 _values!549) (store mapRest!17997 mapKey!17997 mapValue!17997))))

(declare-fun mapIsEmpty!17997 () Bool)

(assert (=> mapIsEmpty!17997 mapRes!17997))

(declare-fun b!421857 () Bool)

(declare-fun res!246261 () Bool)

(assert (=> b!421857 (=> (not res!246261) (not e!251084))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421857 (= res!246261 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12643 _keys!709))))))

(declare-fun b!421858 () Bool)

(declare-fun res!246250 () Bool)

(assert (=> b!421858 (=> (not res!246250) (not e!251084))))

(assert (=> b!421858 (= res!246250 (and (= (size!12642 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12643 _keys!709) (size!12642 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun lt!193704 () array!25681)

(declare-fun call!29473 () ListLongMap!6133)

(declare-fun lt!193700 () array!25683)

(declare-fun bm!29471 () Bool)

(assert (=> bm!29471 (= call!29473 (getCurrentListMapNoExtraKeys!1286 lt!193700 lt!193704 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421859 () Bool)

(declare-fun res!246255 () Bool)

(assert (=> b!421859 (=> (not res!246255) (not e!251084))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421859 (= res!246255 (validKeyInArray!0 k0!794))))

(declare-fun b!421860 () Bool)

(declare-fun res!246253 () Bool)

(assert (=> b!421860 (=> (not res!246253) (not e!251084))))

(declare-datatypes ((List!7226 0))(
  ( (Nil!7223) (Cons!7222 (h!8078 (_ BitVec 64)) (t!12656 List!7226)) )
))
(declare-fun arrayNoDuplicates!0 (array!25683 (_ BitVec 32) List!7226) Bool)

(assert (=> b!421860 (= res!246253 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7223))))

(declare-fun b!421861 () Bool)

(declare-fun e!251085 () Bool)

(declare-fun e!251082 () Bool)

(assert (=> b!421861 (= e!251085 (and e!251082 mapRes!17997))))

(declare-fun condMapEmpty!17997 () Bool)

(declare-fun mapDefault!17997 () ValueCell!5115)

(assert (=> b!421861 (= condMapEmpty!17997 (= (arr!12290 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5115)) mapDefault!17997)))))

(declare-fun b!421862 () Bool)

(declare-fun res!246256 () Bool)

(assert (=> b!421862 (=> (not res!246256) (not e!251084))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421862 (= res!246256 (validMask!0 mask!1025))))

(declare-fun b!421863 () Bool)

(declare-fun e!251083 () Bool)

(assert (=> b!421863 (= e!251083 true)))

(declare-fun lt!193698 () V!15661)

(declare-fun lt!193701 () ListLongMap!6133)

(declare-fun lt!193697 () tuple2!7220)

(declare-fun +!1277 (ListLongMap!6133 tuple2!7220) ListLongMap!6133)

(assert (=> b!421863 (= (+!1277 lt!193701 lt!193697) (+!1277 (+!1277 lt!193701 (tuple2!7221 k0!794 lt!193698)) lt!193697))))

(declare-fun lt!193702 () V!15661)

(assert (=> b!421863 (= lt!193697 (tuple2!7221 k0!794 lt!193702))))

(declare-datatypes ((Unit!12456 0))(
  ( (Unit!12457) )
))
(declare-fun lt!193696 () Unit!12456)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!71 (ListLongMap!6133 (_ BitVec 64) V!15661 V!15661) Unit!12456)

(assert (=> b!421863 (= lt!193696 (addSameAsAddTwiceSameKeyDiffValues!71 lt!193701 k0!794 lt!193698 lt!193702))))

(declare-fun lt!193705 () V!15661)

(declare-fun get!6111 (ValueCell!5115 V!15661) V!15661)

(assert (=> b!421863 (= lt!193698 (get!6111 (select (arr!12290 _values!549) from!863) lt!193705))))

(declare-fun lt!193699 () ListLongMap!6133)

(assert (=> b!421863 (= lt!193699 (+!1277 lt!193701 (tuple2!7221 (select (arr!12291 lt!193700) from!863) lt!193702)))))

(declare-fun v!412 () V!15661)

(assert (=> b!421863 (= lt!193702 (get!6111 (select (store (arr!12290 _values!549) i!563 (ValueCellFull!5115 v!412)) from!863) lt!193705))))

(declare-fun dynLambda!742 (Int (_ BitVec 64)) V!15661)

(assert (=> b!421863 (= lt!193705 (dynLambda!742 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!421863 (= lt!193701 (getCurrentListMapNoExtraKeys!1286 lt!193700 lt!193704 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421856 () Bool)

(declare-fun res!246257 () Bool)

(assert (=> b!421856 (=> (not res!246257) (not e!251084))))

(assert (=> b!421856 (= res!246257 (or (= (select (arr!12291 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12291 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!246254 () Bool)

(assert (=> start!39498 (=> (not res!246254) (not e!251084))))

(assert (=> start!39498 (= res!246254 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12643 _keys!709))))))

(assert (=> start!39498 e!251084))

(declare-fun tp_is_empty!10917 () Bool)

(assert (=> start!39498 tp_is_empty!10917))

(assert (=> start!39498 tp!34824))

(assert (=> start!39498 true))

(declare-fun array_inv!8954 (array!25681) Bool)

(assert (=> start!39498 (and (array_inv!8954 _values!549) e!251085)))

(declare-fun array_inv!8955 (array!25683) Bool)

(assert (=> start!39498 (array_inv!8955 _keys!709)))

(declare-fun b!421864 () Bool)

(declare-fun res!246260 () Bool)

(declare-fun e!251077 () Bool)

(assert (=> b!421864 (=> (not res!246260) (not e!251077))))

(assert (=> b!421864 (= res!246260 (arrayNoDuplicates!0 lt!193700 #b00000000000000000000000000000000 Nil!7223))))

(declare-fun b!421865 () Bool)

(declare-fun e!251079 () Bool)

(assert (=> b!421865 (= e!251077 e!251079)))

(declare-fun res!246258 () Bool)

(assert (=> b!421865 (=> (not res!246258) (not e!251079))))

(assert (=> b!421865 (= res!246258 (= from!863 i!563))))

(assert (=> b!421865 (= lt!193699 (getCurrentListMapNoExtraKeys!1286 lt!193700 lt!193704 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421865 (= lt!193704 (array!25682 (store (arr!12290 _values!549) i!563 (ValueCellFull!5115 v!412)) (size!12642 _values!549)))))

(declare-fun lt!193706 () ListLongMap!6133)

(assert (=> b!421865 (= lt!193706 (getCurrentListMapNoExtraKeys!1286 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!421866 () Bool)

(declare-fun res!246248 () Bool)

(assert (=> b!421866 (=> (not res!246248) (not e!251084))))

(declare-fun arrayContainsKey!0 (array!25683 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421866 (= res!246248 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421867 () Bool)

(declare-fun e!251080 () Bool)

(assert (=> b!421867 (= e!251080 (= call!29473 call!29474))))

(declare-fun b!421868 () Bool)

(declare-fun res!246251 () Bool)

(assert (=> b!421868 (=> (not res!246251) (not e!251077))))

(assert (=> b!421868 (= res!246251 (bvsle from!863 i!563))))

(declare-fun b!421869 () Bool)

(assert (=> b!421869 (= e!251079 (not e!251083))))

(declare-fun res!246259 () Bool)

(assert (=> b!421869 (=> res!246259 e!251083)))

(assert (=> b!421869 (= res!246259 (validKeyInArray!0 (select (arr!12291 _keys!709) from!863)))))

(assert (=> b!421869 e!251080))

(declare-fun c!55361 () Bool)

(assert (=> b!421869 (= c!55361 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!193703 () Unit!12456)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!473 (array!25683 array!25681 (_ BitVec 32) (_ BitVec 32) V!15661 V!15661 (_ BitVec 32) (_ BitVec 64) V!15661 (_ BitVec 32) Int) Unit!12456)

(assert (=> b!421869 (= lt!193703 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!473 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421870 () Bool)

(assert (=> b!421870 (= e!251082 tp_is_empty!10917)))

(declare-fun b!421871 () Bool)

(assert (=> b!421871 (= e!251081 tp_is_empty!10917)))

(declare-fun b!421872 () Bool)

(assert (=> b!421872 (= e!251084 e!251077)))

(declare-fun res!246252 () Bool)

(assert (=> b!421872 (=> (not res!246252) (not e!251077))))

(assert (=> b!421872 (= res!246252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193700 mask!1025))))

(assert (=> b!421872 (= lt!193700 (array!25684 (store (arr!12291 _keys!709) i!563 k0!794) (size!12643 _keys!709)))))

(declare-fun b!421873 () Bool)

(assert (=> b!421873 (= e!251080 (= call!29473 (+!1277 call!29474 (tuple2!7221 k0!794 v!412))))))

(assert (= (and start!39498 res!246254) b!421862))

(assert (= (and b!421862 res!246256) b!421858))

(assert (= (and b!421858 res!246250) b!421855))

(assert (= (and b!421855 res!246249) b!421860))

(assert (= (and b!421860 res!246253) b!421857))

(assert (= (and b!421857 res!246261) b!421859))

(assert (= (and b!421859 res!246255) b!421856))

(assert (= (and b!421856 res!246257) b!421866))

(assert (= (and b!421866 res!246248) b!421872))

(assert (= (and b!421872 res!246252) b!421864))

(assert (= (and b!421864 res!246260) b!421868))

(assert (= (and b!421868 res!246251) b!421865))

(assert (= (and b!421865 res!246258) b!421869))

(assert (= (and b!421869 c!55361) b!421873))

(assert (= (and b!421869 (not c!55361)) b!421867))

(assert (= (or b!421873 b!421867) bm!29471))

(assert (= (or b!421873 b!421867) bm!29470))

(assert (= (and b!421869 (not res!246259)) b!421863))

(assert (= (and b!421861 condMapEmpty!17997) mapIsEmpty!17997))

(assert (= (and b!421861 (not condMapEmpty!17997)) mapNonEmpty!17997))

(get-info :version)

(assert (= (and mapNonEmpty!17997 ((_ is ValueCellFull!5115) mapValue!17997)) b!421871))

(assert (= (and b!421861 ((_ is ValueCellFull!5115) mapDefault!17997)) b!421870))

(assert (= start!39498 b!421861))

(declare-fun b_lambda!9069 () Bool)

(assert (=> (not b_lambda!9069) (not b!421863)))

(declare-fun t!12654 () Bool)

(declare-fun tb!3387 () Bool)

(assert (=> (and start!39498 (= defaultEntry!557 defaultEntry!557) t!12654) tb!3387))

(declare-fun result!6301 () Bool)

(assert (=> tb!3387 (= result!6301 tp_is_empty!10917)))

(assert (=> b!421863 t!12654))

(declare-fun b_and!17407 () Bool)

(assert (= b_and!17405 (and (=> t!12654 result!6301) b_and!17407)))

(declare-fun m!411647 () Bool)

(assert (=> b!421873 m!411647))

(declare-fun m!411649 () Bool)

(assert (=> b!421855 m!411649))

(declare-fun m!411651 () Bool)

(assert (=> bm!29470 m!411651))

(declare-fun m!411653 () Bool)

(assert (=> b!421864 m!411653))

(declare-fun m!411655 () Bool)

(assert (=> b!421862 m!411655))

(declare-fun m!411657 () Bool)

(assert (=> b!421856 m!411657))

(declare-fun m!411659 () Bool)

(assert (=> b!421859 m!411659))

(declare-fun m!411661 () Bool)

(assert (=> bm!29471 m!411661))

(assert (=> b!421863 m!411661))

(declare-fun m!411663 () Bool)

(assert (=> b!421863 m!411663))

(declare-fun m!411665 () Bool)

(assert (=> b!421863 m!411665))

(declare-fun m!411667 () Bool)

(assert (=> b!421863 m!411667))

(declare-fun m!411669 () Bool)

(assert (=> b!421863 m!411669))

(assert (=> b!421863 m!411663))

(declare-fun m!411671 () Bool)

(assert (=> b!421863 m!411671))

(declare-fun m!411673 () Bool)

(assert (=> b!421863 m!411673))

(declare-fun m!411675 () Bool)

(assert (=> b!421863 m!411675))

(assert (=> b!421863 m!411671))

(assert (=> b!421863 m!411675))

(declare-fun m!411677 () Bool)

(assert (=> b!421863 m!411677))

(declare-fun m!411679 () Bool)

(assert (=> b!421863 m!411679))

(declare-fun m!411681 () Bool)

(assert (=> b!421863 m!411681))

(declare-fun m!411683 () Bool)

(assert (=> b!421863 m!411683))

(declare-fun m!411685 () Bool)

(assert (=> b!421863 m!411685))

(declare-fun m!411687 () Bool)

(assert (=> b!421860 m!411687))

(declare-fun m!411689 () Bool)

(assert (=> b!421869 m!411689))

(assert (=> b!421869 m!411689))

(declare-fun m!411691 () Bool)

(assert (=> b!421869 m!411691))

(declare-fun m!411693 () Bool)

(assert (=> b!421869 m!411693))

(declare-fun m!411695 () Bool)

(assert (=> b!421866 m!411695))

(declare-fun m!411697 () Bool)

(assert (=> b!421865 m!411697))

(assert (=> b!421865 m!411669))

(declare-fun m!411699 () Bool)

(assert (=> b!421865 m!411699))

(declare-fun m!411701 () Bool)

(assert (=> mapNonEmpty!17997 m!411701))

(declare-fun m!411703 () Bool)

(assert (=> start!39498 m!411703))

(declare-fun m!411705 () Bool)

(assert (=> start!39498 m!411705))

(declare-fun m!411707 () Bool)

(assert (=> b!421872 m!411707))

(declare-fun m!411709 () Bool)

(assert (=> b!421872 m!411709))

(check-sat (not b!421866) (not b_next!9765) b_and!17407 (not b!421873) (not b!421872) (not b!421859) (not b_lambda!9069) (not b!421864) (not b!421869) (not b!421865) (not mapNonEmpty!17997) (not b!421862) (not b!421863) (not bm!29471) (not start!39498) (not b!421855) (not b!421860) (not bm!29470) tp_is_empty!10917)
(check-sat b_and!17407 (not b_next!9765))
