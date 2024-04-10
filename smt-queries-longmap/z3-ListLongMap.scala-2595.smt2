; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39390 () Bool)

(assert start!39390)

(declare-fun b_free!9657 () Bool)

(declare-fun b_next!9657 () Bool)

(assert (=> start!39390 (= b_free!9657 (not b_next!9657))))

(declare-fun tp!34500 () Bool)

(declare-fun b_and!17189 () Bool)

(assert (=> start!39390 (= tp!34500 b_and!17189)))

(declare-fun b!418669 () Bool)

(declare-fun e!249619 () Bool)

(declare-datatypes ((V!15517 0))(
  ( (V!15518 (val!5449 Int)) )
))
(declare-datatypes ((tuple2!7128 0))(
  ( (tuple2!7129 (_1!3575 (_ BitVec 64)) (_2!3575 V!15517)) )
))
(declare-datatypes ((List!7141 0))(
  ( (Nil!7138) (Cons!7137 (h!7993 tuple2!7128) (t!12463 List!7141)) )
))
(declare-datatypes ((ListLongMap!6041 0))(
  ( (ListLongMap!6042 (toList!3036 List!7141)) )
))
(declare-fun call!29150 () ListLongMap!6041)

(declare-fun call!29149 () ListLongMap!6041)

(assert (=> b!418669 (= e!249619 (= call!29150 call!29149))))

(declare-fun b!418670 () Bool)

(declare-fun res!243991 () Bool)

(declare-fun e!249625 () Bool)

(assert (=> b!418670 (=> (not res!243991) (not e!249625))))

(declare-datatypes ((array!25469 0))(
  ( (array!25470 (arr!12184 (Array (_ BitVec 32) (_ BitVec 64))) (size!12536 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25469)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418670 (= res!243991 (or (= (select (arr!12184 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12184 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418671 () Bool)

(declare-fun res!243982 () Bool)

(assert (=> b!418671 (=> (not res!243982) (not e!249625))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418671 (= res!243982 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17835 () Bool)

(declare-fun mapRes!17835 () Bool)

(assert (=> mapIsEmpty!17835 mapRes!17835))

(declare-fun b!418672 () Bool)

(declare-fun e!249626 () Bool)

(assert (=> b!418672 (= e!249626 true)))

(declare-fun lt!191914 () tuple2!7128)

(declare-fun lt!191920 () V!15517)

(declare-fun lt!191915 () ListLongMap!6041)

(declare-fun +!1235 (ListLongMap!6041 tuple2!7128) ListLongMap!6041)

(assert (=> b!418672 (= (+!1235 lt!191915 lt!191914) (+!1235 (+!1235 lt!191915 (tuple2!7129 k0!794 lt!191920)) lt!191914))))

(declare-fun lt!191916 () V!15517)

(assert (=> b!418672 (= lt!191914 (tuple2!7129 k0!794 lt!191916))))

(declare-datatypes ((Unit!12374 0))(
  ( (Unit!12375) )
))
(declare-fun lt!191918 () Unit!12374)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!35 (ListLongMap!6041 (_ BitVec 64) V!15517 V!15517) Unit!12374)

(assert (=> b!418672 (= lt!191918 (addSameAsAddTwiceSameKeyDiffValues!35 lt!191915 k0!794 lt!191920 lt!191916))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!191923 () V!15517)

(declare-datatypes ((ValueCell!5061 0))(
  ( (ValueCellFull!5061 (v!7696 V!15517)) (EmptyCell!5061) )
))
(declare-datatypes ((array!25471 0))(
  ( (array!25472 (arr!12185 (Array (_ BitVec 32) ValueCell!5061)) (size!12537 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25471)

(declare-fun get!6039 (ValueCell!5061 V!15517) V!15517)

(assert (=> b!418672 (= lt!191920 (get!6039 (select (arr!12185 _values!549) from!863) lt!191923))))

(declare-fun lt!191924 () ListLongMap!6041)

(declare-fun lt!191919 () array!25469)

(assert (=> b!418672 (= lt!191924 (+!1235 lt!191915 (tuple2!7129 (select (arr!12184 lt!191919) from!863) lt!191916)))))

(declare-fun v!412 () V!15517)

(assert (=> b!418672 (= lt!191916 (get!6039 (select (store (arr!12185 _values!549) i!563 (ValueCellFull!5061 v!412)) from!863) lt!191923))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!706 (Int (_ BitVec 64)) V!15517)

(assert (=> b!418672 (= lt!191923 (dynLambda!706 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15517)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15517)

(declare-fun lt!191921 () array!25471)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1241 (array!25469 array!25471 (_ BitVec 32) (_ BitVec 32) V!15517 V!15517 (_ BitVec 32) Int) ListLongMap!6041)

(assert (=> b!418672 (= lt!191915 (getCurrentListMapNoExtraKeys!1241 lt!191919 lt!191921 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418673 () Bool)

(declare-fun res!243983 () Bool)

(declare-fun e!249621 () Bool)

(assert (=> b!418673 (=> (not res!243983) (not e!249621))))

(declare-datatypes ((List!7142 0))(
  ( (Nil!7139) (Cons!7138 (h!7994 (_ BitVec 64)) (t!12464 List!7142)) )
))
(declare-fun arrayNoDuplicates!0 (array!25469 (_ BitVec 32) List!7142) Bool)

(assert (=> b!418673 (= res!243983 (arrayNoDuplicates!0 lt!191919 #b00000000000000000000000000000000 Nil!7139))))

(declare-fun b!418674 () Bool)

(declare-fun e!249622 () Bool)

(assert (=> b!418674 (= e!249621 e!249622)))

(declare-fun res!243989 () Bool)

(assert (=> b!418674 (=> (not res!243989) (not e!249622))))

(assert (=> b!418674 (= res!243989 (= from!863 i!563))))

(assert (=> b!418674 (= lt!191924 (getCurrentListMapNoExtraKeys!1241 lt!191919 lt!191921 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!418674 (= lt!191921 (array!25472 (store (arr!12185 _values!549) i!563 (ValueCellFull!5061 v!412)) (size!12537 _values!549)))))

(declare-fun lt!191922 () ListLongMap!6041)

(assert (=> b!418674 (= lt!191922 (getCurrentListMapNoExtraKeys!1241 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418675 () Bool)

(declare-fun res!243986 () Bool)

(assert (=> b!418675 (=> (not res!243986) (not e!249625))))

(assert (=> b!418675 (= res!243986 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12536 _keys!709))))))

(declare-fun mapNonEmpty!17835 () Bool)

(declare-fun tp!34499 () Bool)

(declare-fun e!249620 () Bool)

(assert (=> mapNonEmpty!17835 (= mapRes!17835 (and tp!34499 e!249620))))

(declare-fun mapKey!17835 () (_ BitVec 32))

(declare-fun mapRest!17835 () (Array (_ BitVec 32) ValueCell!5061))

(declare-fun mapValue!17835 () ValueCell!5061)

(assert (=> mapNonEmpty!17835 (= (arr!12185 _values!549) (store mapRest!17835 mapKey!17835 mapValue!17835))))

(declare-fun b!418676 () Bool)

(declare-fun e!249624 () Bool)

(declare-fun tp_is_empty!10809 () Bool)

(assert (=> b!418676 (= e!249624 tp_is_empty!10809)))

(declare-fun b!418677 () Bool)

(declare-fun res!243985 () Bool)

(assert (=> b!418677 (=> (not res!243985) (not e!249625))))

(declare-fun arrayContainsKey!0 (array!25469 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418677 (= res!243985 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!418678 () Bool)

(declare-fun res!243987 () Bool)

(assert (=> b!418678 (=> (not res!243987) (not e!249625))))

(assert (=> b!418678 (= res!243987 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7139))))

(declare-fun res!243988 () Bool)

(assert (=> start!39390 (=> (not res!243988) (not e!249625))))

(assert (=> start!39390 (= res!243988 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12536 _keys!709))))))

(assert (=> start!39390 e!249625))

(assert (=> start!39390 tp_is_empty!10809))

(assert (=> start!39390 tp!34500))

(assert (=> start!39390 true))

(declare-fun e!249627 () Bool)

(declare-fun array_inv!8884 (array!25471) Bool)

(assert (=> start!39390 (and (array_inv!8884 _values!549) e!249627)))

(declare-fun array_inv!8885 (array!25469) Bool)

(assert (=> start!39390 (array_inv!8885 _keys!709)))

(declare-fun b!418679 () Bool)

(assert (=> b!418679 (= e!249622 (not e!249626))))

(declare-fun res!243992 () Bool)

(assert (=> b!418679 (=> res!243992 e!249626)))

(assert (=> b!418679 (= res!243992 (validKeyInArray!0 (select (arr!12184 _keys!709) from!863)))))

(assert (=> b!418679 e!249619))

(declare-fun c!55199 () Bool)

(assert (=> b!418679 (= c!55199 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!191917 () Unit!12374)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!438 (array!25469 array!25471 (_ BitVec 32) (_ BitVec 32) V!15517 V!15517 (_ BitVec 32) (_ BitVec 64) V!15517 (_ BitVec 32) Int) Unit!12374)

(assert (=> b!418679 (= lt!191917 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!438 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418680 () Bool)

(assert (=> b!418680 (= e!249627 (and e!249624 mapRes!17835))))

(declare-fun condMapEmpty!17835 () Bool)

(declare-fun mapDefault!17835 () ValueCell!5061)

(assert (=> b!418680 (= condMapEmpty!17835 (= (arr!12185 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5061)) mapDefault!17835)))))

(declare-fun b!418681 () Bool)

(declare-fun res!243993 () Bool)

(assert (=> b!418681 (=> (not res!243993) (not e!249625))))

(assert (=> b!418681 (= res!243993 (and (= (size!12537 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12536 _keys!709) (size!12537 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!29146 () Bool)

(assert (=> bm!29146 (= call!29150 (getCurrentListMapNoExtraKeys!1241 (ite c!55199 _keys!709 lt!191919) (ite c!55199 _values!549 lt!191921) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418682 () Bool)

(declare-fun res!243981 () Bool)

(assert (=> b!418682 (=> (not res!243981) (not e!249621))))

(assert (=> b!418682 (= res!243981 (bvsle from!863 i!563))))

(declare-fun b!418683 () Bool)

(assert (=> b!418683 (= e!249620 tp_is_empty!10809)))

(declare-fun bm!29147 () Bool)

(assert (=> bm!29147 (= call!29149 (getCurrentListMapNoExtraKeys!1241 (ite c!55199 lt!191919 _keys!709) (ite c!55199 lt!191921 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418684 () Bool)

(assert (=> b!418684 (= e!249625 e!249621)))

(declare-fun res!243990 () Bool)

(assert (=> b!418684 (=> (not res!243990) (not e!249621))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25469 (_ BitVec 32)) Bool)

(assert (=> b!418684 (= res!243990 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191919 mask!1025))))

(assert (=> b!418684 (= lt!191919 (array!25470 (store (arr!12184 _keys!709) i!563 k0!794) (size!12536 _keys!709)))))

(declare-fun b!418685 () Bool)

(declare-fun res!243980 () Bool)

(assert (=> b!418685 (=> (not res!243980) (not e!249625))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418685 (= res!243980 (validMask!0 mask!1025))))

(declare-fun b!418686 () Bool)

(assert (=> b!418686 (= e!249619 (= call!29149 (+!1235 call!29150 (tuple2!7129 k0!794 v!412))))))

(declare-fun b!418687 () Bool)

(declare-fun res!243984 () Bool)

(assert (=> b!418687 (=> (not res!243984) (not e!249625))))

(assert (=> b!418687 (= res!243984 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39390 res!243988) b!418685))

(assert (= (and b!418685 res!243980) b!418681))

(assert (= (and b!418681 res!243993) b!418687))

(assert (= (and b!418687 res!243984) b!418678))

(assert (= (and b!418678 res!243987) b!418675))

(assert (= (and b!418675 res!243986) b!418671))

(assert (= (and b!418671 res!243982) b!418670))

(assert (= (and b!418670 res!243991) b!418677))

(assert (= (and b!418677 res!243985) b!418684))

(assert (= (and b!418684 res!243990) b!418673))

(assert (= (and b!418673 res!243983) b!418682))

(assert (= (and b!418682 res!243981) b!418674))

(assert (= (and b!418674 res!243989) b!418679))

(assert (= (and b!418679 c!55199) b!418686))

(assert (= (and b!418679 (not c!55199)) b!418669))

(assert (= (or b!418686 b!418669) bm!29147))

(assert (= (or b!418686 b!418669) bm!29146))

(assert (= (and b!418679 (not res!243992)) b!418672))

(assert (= (and b!418680 condMapEmpty!17835) mapIsEmpty!17835))

(assert (= (and b!418680 (not condMapEmpty!17835)) mapNonEmpty!17835))

(get-info :version)

(assert (= (and mapNonEmpty!17835 ((_ is ValueCellFull!5061) mapValue!17835)) b!418683))

(assert (= (and b!418680 ((_ is ValueCellFull!5061) mapDefault!17835)) b!418676))

(assert (= start!39390 b!418680))

(declare-fun b_lambda!8961 () Bool)

(assert (=> (not b_lambda!8961) (not b!418672)))

(declare-fun t!12462 () Bool)

(declare-fun tb!3279 () Bool)

(assert (=> (and start!39390 (= defaultEntry!557 defaultEntry!557) t!12462) tb!3279))

(declare-fun result!6085 () Bool)

(assert (=> tb!3279 (= result!6085 tp_is_empty!10809)))

(assert (=> b!418672 t!12462))

(declare-fun b_and!17191 () Bool)

(assert (= b_and!17189 (and (=> t!12462 result!6085) b_and!17191)))

(declare-fun m!408083 () Bool)

(assert (=> b!418674 m!408083))

(declare-fun m!408085 () Bool)

(assert (=> b!418674 m!408085))

(declare-fun m!408087 () Bool)

(assert (=> b!418674 m!408087))

(declare-fun m!408089 () Bool)

(assert (=> mapNonEmpty!17835 m!408089))

(declare-fun m!408091 () Bool)

(assert (=> b!418670 m!408091))

(declare-fun m!408093 () Bool)

(assert (=> b!418678 m!408093))

(declare-fun m!408095 () Bool)

(assert (=> b!418684 m!408095))

(declare-fun m!408097 () Bool)

(assert (=> b!418684 m!408097))

(declare-fun m!408099 () Bool)

(assert (=> b!418672 m!408099))

(declare-fun m!408101 () Bool)

(assert (=> b!418672 m!408101))

(declare-fun m!408103 () Bool)

(assert (=> b!418672 m!408103))

(declare-fun m!408105 () Bool)

(assert (=> b!418672 m!408105))

(assert (=> b!418672 m!408103))

(declare-fun m!408107 () Bool)

(assert (=> b!418672 m!408107))

(assert (=> b!418672 m!408099))

(declare-fun m!408109 () Bool)

(assert (=> b!418672 m!408109))

(declare-fun m!408111 () Bool)

(assert (=> b!418672 m!408111))

(declare-fun m!408113 () Bool)

(assert (=> b!418672 m!408113))

(declare-fun m!408115 () Bool)

(assert (=> b!418672 m!408115))

(declare-fun m!408117 () Bool)

(assert (=> b!418672 m!408117))

(declare-fun m!408119 () Bool)

(assert (=> b!418672 m!408119))

(assert (=> b!418672 m!408085))

(declare-fun m!408121 () Bool)

(assert (=> b!418672 m!408121))

(assert (=> b!418672 m!408115))

(declare-fun m!408123 () Bool)

(assert (=> b!418673 m!408123))

(declare-fun m!408125 () Bool)

(assert (=> bm!29146 m!408125))

(declare-fun m!408127 () Bool)

(assert (=> b!418687 m!408127))

(declare-fun m!408129 () Bool)

(assert (=> b!418685 m!408129))

(declare-fun m!408131 () Bool)

(assert (=> b!418686 m!408131))

(declare-fun m!408133 () Bool)

(assert (=> b!418671 m!408133))

(declare-fun m!408135 () Bool)

(assert (=> b!418679 m!408135))

(assert (=> b!418679 m!408135))

(declare-fun m!408137 () Bool)

(assert (=> b!418679 m!408137))

(declare-fun m!408139 () Bool)

(assert (=> b!418679 m!408139))

(declare-fun m!408141 () Bool)

(assert (=> start!39390 m!408141))

(declare-fun m!408143 () Bool)

(assert (=> start!39390 m!408143))

(declare-fun m!408145 () Bool)

(assert (=> b!418677 m!408145))

(declare-fun m!408147 () Bool)

(assert (=> bm!29147 m!408147))

(check-sat b_and!17191 (not b!418686) (not b!418674) tp_is_empty!10809 (not b!418684) (not b!418687) (not b_lambda!8961) (not bm!29146) (not b!418677) (not b!418685) (not b_next!9657) (not mapNonEmpty!17835) (not b!418672) (not bm!29147) (not start!39390) (not b!418673) (not b!418671) (not b!418679) (not b!418678))
(check-sat b_and!17191 (not b_next!9657))
