; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39386 () Bool)

(assert start!39386)

(declare-fun b_free!9667 () Bool)

(declare-fun b_next!9667 () Bool)

(assert (=> start!39386 (= b_free!9667 (not b_next!9667))))

(declare-fun tp!34530 () Bool)

(declare-fun b_and!17223 () Bool)

(assert (=> start!39386 (= tp!34530 b_and!17223)))

(declare-fun b!418915 () Bool)

(declare-fun res!244188 () Bool)

(declare-fun e!249723 () Bool)

(assert (=> b!418915 (=> (not res!244188) (not e!249723))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418915 (= res!244188 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17850 () Bool)

(declare-fun mapRes!17850 () Bool)

(declare-fun tp!34529 () Bool)

(declare-fun e!249726 () Bool)

(assert (=> mapNonEmpty!17850 (= mapRes!17850 (and tp!34529 e!249726))))

(declare-datatypes ((V!15531 0))(
  ( (V!15532 (val!5454 Int)) )
))
(declare-datatypes ((ValueCell!5066 0))(
  ( (ValueCellFull!5066 (v!7702 V!15531)) (EmptyCell!5066) )
))
(declare-datatypes ((array!25496 0))(
  ( (array!25497 (arr!12197 (Array (_ BitVec 32) ValueCell!5066)) (size!12549 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25496)

(declare-fun mapKey!17850 () (_ BitVec 32))

(declare-fun mapRest!17850 () (Array (_ BitVec 32) ValueCell!5066))

(declare-fun mapValue!17850 () ValueCell!5066)

(assert (=> mapNonEmpty!17850 (= (arr!12197 _values!549) (store mapRest!17850 mapKey!17850 mapValue!17850))))

(declare-fun lt!192102 () array!25496)

(declare-fun minValue!515 () V!15531)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7014 0))(
  ( (tuple2!7015 (_1!3518 (_ BitVec 64)) (_2!3518 V!15531)) )
))
(declare-datatypes ((List!7026 0))(
  ( (Nil!7023) (Cons!7022 (h!7878 tuple2!7014) (t!12350 List!7026)) )
))
(declare-datatypes ((ListLongMap!5929 0))(
  ( (ListLongMap!5930 (toList!2980 List!7026)) )
))
(declare-fun call!29167 () ListLongMap!5929)

(declare-fun zeroValue!515 () V!15531)

(declare-fun bm!29163 () Bool)

(declare-fun c!55191 () Bool)

(declare-datatypes ((array!25498 0))(
  ( (array!25499 (arr!12198 (Array (_ BitVec 32) (_ BitVec 64))) (size!12550 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25498)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lt!192104 () array!25498)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1226 (array!25498 array!25496 (_ BitVec 32) (_ BitVec 32) V!15531 V!15531 (_ BitVec 32) Int) ListLongMap!5929)

(assert (=> bm!29163 (= call!29167 (getCurrentListMapNoExtraKeys!1226 (ite c!55191 lt!192104 _keys!709) (ite c!55191 lt!192102 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17850 () Bool)

(assert (=> mapIsEmpty!17850 mapRes!17850))

(declare-fun b!418916 () Bool)

(declare-fun e!249730 () Bool)

(declare-fun e!249722 () Bool)

(assert (=> b!418916 (= e!249730 e!249722)))

(declare-fun res!244192 () Bool)

(assert (=> b!418916 (=> (not res!244192) (not e!249722))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418916 (= res!244192 (= from!863 i!563))))

(declare-fun lt!192107 () ListLongMap!5929)

(assert (=> b!418916 (= lt!192107 (getCurrentListMapNoExtraKeys!1226 lt!192104 lt!192102 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15531)

(assert (=> b!418916 (= lt!192102 (array!25497 (store (arr!12197 _values!549) i!563 (ValueCellFull!5066 v!412)) (size!12549 _values!549)))))

(declare-fun lt!192106 () ListLongMap!5929)

(assert (=> b!418916 (= lt!192106 (getCurrentListMapNoExtraKeys!1226 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!418917 () Bool)

(declare-fun res!244198 () Bool)

(assert (=> b!418917 (=> (not res!244198) (not e!249723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25498 (_ BitVec 32)) Bool)

(assert (=> b!418917 (= res!244198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!418918 () Bool)

(declare-fun res!244197 () Bool)

(assert (=> b!418918 (=> (not res!244197) (not e!249723))))

(assert (=> b!418918 (= res!244197 (or (= (select (arr!12198 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12198 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418919 () Bool)

(declare-fun e!249724 () Bool)

(declare-fun call!29166 () ListLongMap!5929)

(assert (=> b!418919 (= e!249724 (= call!29166 call!29167))))

(declare-fun b!418920 () Bool)

(declare-fun res!244195 () Bool)

(assert (=> b!418920 (=> (not res!244195) (not e!249723))))

(assert (=> b!418920 (= res!244195 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12550 _keys!709))))))

(declare-fun b!418921 () Bool)

(declare-fun res!244196 () Bool)

(assert (=> b!418921 (=> (not res!244196) (not e!249730))))

(assert (=> b!418921 (= res!244196 (bvsle from!863 i!563))))

(declare-fun b!418922 () Bool)

(assert (=> b!418922 (= e!249723 e!249730)))

(declare-fun res!244200 () Bool)

(assert (=> b!418922 (=> (not res!244200) (not e!249730))))

(assert (=> b!418922 (= res!244200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!192104 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!418922 (= lt!192104 (array!25499 (store (arr!12198 _keys!709) i!563 k0!794) (size!12550 _keys!709)))))

(declare-fun b!418923 () Bool)

(declare-fun res!244187 () Bool)

(assert (=> b!418923 (=> (not res!244187) (not e!249723))))

(assert (=> b!418923 (= res!244187 (and (= (size!12549 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12550 _keys!709) (size!12549 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418924 () Bool)

(declare-fun res!244189 () Bool)

(assert (=> b!418924 (=> (not res!244189) (not e!249723))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418924 (= res!244189 (validKeyInArray!0 k0!794))))

(declare-fun b!418925 () Bool)

(declare-fun tp_is_empty!10819 () Bool)

(assert (=> b!418925 (= e!249726 tp_is_empty!10819)))

(declare-fun b!418926 () Bool)

(declare-fun res!244199 () Bool)

(assert (=> b!418926 (=> (not res!244199) (not e!249730))))

(declare-datatypes ((List!7027 0))(
  ( (Nil!7024) (Cons!7023 (h!7879 (_ BitVec 64)) (t!12351 List!7027)) )
))
(declare-fun arrayNoDuplicates!0 (array!25498 (_ BitVec 32) List!7027) Bool)

(assert (=> b!418926 (= res!244199 (arrayNoDuplicates!0 lt!192104 #b00000000000000000000000000000000 Nil!7024))))

(declare-fun b!418927 () Bool)

(declare-fun +!1245 (ListLongMap!5929 tuple2!7014) ListLongMap!5929)

(assert (=> b!418927 (= e!249724 (= call!29167 (+!1245 call!29166 (tuple2!7015 k0!794 v!412))))))

(declare-fun b!418928 () Bool)

(declare-fun e!249729 () Bool)

(declare-fun e!249725 () Bool)

(assert (=> b!418928 (= e!249729 (and e!249725 mapRes!17850))))

(declare-fun condMapEmpty!17850 () Bool)

(declare-fun mapDefault!17850 () ValueCell!5066)

(assert (=> b!418928 (= condMapEmpty!17850 (= (arr!12197 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5066)) mapDefault!17850)))))

(declare-fun b!418929 () Bool)

(declare-fun e!249727 () Bool)

(assert (=> b!418929 (= e!249722 (not e!249727))))

(declare-fun res!244190 () Bool)

(assert (=> b!418929 (=> res!244190 e!249727)))

(assert (=> b!418929 (= res!244190 (validKeyInArray!0 (select (arr!12198 _keys!709) from!863)))))

(assert (=> b!418929 e!249724))

(assert (=> b!418929 (= c!55191 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12361 0))(
  ( (Unit!12362) )
))
(declare-fun lt!192101 () Unit!12361)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!437 (array!25498 array!25496 (_ BitVec 32) (_ BitVec 32) V!15531 V!15531 (_ BitVec 32) (_ BitVec 64) V!15531 (_ BitVec 32) Int) Unit!12361)

(assert (=> b!418929 (= lt!192101 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!437 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!244193 () Bool)

(assert (=> start!39386 (=> (not res!244193) (not e!249723))))

(assert (=> start!39386 (= res!244193 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12550 _keys!709))))))

(assert (=> start!39386 e!249723))

(assert (=> start!39386 tp_is_empty!10819))

(assert (=> start!39386 tp!34530))

(assert (=> start!39386 true))

(declare-fun array_inv!8968 (array!25496) Bool)

(assert (=> start!39386 (and (array_inv!8968 _values!549) e!249729)))

(declare-fun array_inv!8969 (array!25498) Bool)

(assert (=> start!39386 (array_inv!8969 _keys!709)))

(declare-fun b!418930 () Bool)

(assert (=> b!418930 (= e!249727 true)))

(declare-fun lt!192100 () tuple2!7014)

(declare-fun lt!192103 () V!15531)

(declare-fun lt!192108 () ListLongMap!5929)

(assert (=> b!418930 (= (+!1245 lt!192108 lt!192100) (+!1245 (+!1245 lt!192108 (tuple2!7015 k0!794 lt!192103)) lt!192100))))

(declare-fun lt!192105 () V!15531)

(assert (=> b!418930 (= lt!192100 (tuple2!7015 k0!794 lt!192105))))

(declare-fun lt!192099 () Unit!12361)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!35 (ListLongMap!5929 (_ BitVec 64) V!15531 V!15531) Unit!12361)

(assert (=> b!418930 (= lt!192099 (addSameAsAddTwiceSameKeyDiffValues!35 lt!192108 k0!794 lt!192103 lt!192105))))

(declare-fun lt!192098 () V!15531)

(declare-fun get!6045 (ValueCell!5066 V!15531) V!15531)

(assert (=> b!418930 (= lt!192103 (get!6045 (select (arr!12197 _values!549) from!863) lt!192098))))

(assert (=> b!418930 (= lt!192107 (+!1245 lt!192108 (tuple2!7015 (select (arr!12198 lt!192104) from!863) lt!192105)))))

(assert (=> b!418930 (= lt!192105 (get!6045 (select (store (arr!12197 _values!549) i!563 (ValueCellFull!5066 v!412)) from!863) lt!192098))))

(declare-fun dynLambda!702 (Int (_ BitVec 64)) V!15531)

(assert (=> b!418930 (= lt!192098 (dynLambda!702 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418930 (= lt!192108 (getCurrentListMapNoExtraKeys!1226 lt!192104 lt!192102 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!29164 () Bool)

(assert (=> bm!29164 (= call!29166 (getCurrentListMapNoExtraKeys!1226 (ite c!55191 _keys!709 lt!192104) (ite c!55191 _values!549 lt!192102) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418931 () Bool)

(declare-fun res!244194 () Bool)

(assert (=> b!418931 (=> (not res!244194) (not e!249723))))

(assert (=> b!418931 (= res!244194 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7024))))

(declare-fun b!418932 () Bool)

(declare-fun res!244191 () Bool)

(assert (=> b!418932 (=> (not res!244191) (not e!249723))))

(declare-fun arrayContainsKey!0 (array!25498 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418932 (= res!244191 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!418933 () Bool)

(assert (=> b!418933 (= e!249725 tp_is_empty!10819)))

(assert (= (and start!39386 res!244193) b!418915))

(assert (= (and b!418915 res!244188) b!418923))

(assert (= (and b!418923 res!244187) b!418917))

(assert (= (and b!418917 res!244198) b!418931))

(assert (= (and b!418931 res!244194) b!418920))

(assert (= (and b!418920 res!244195) b!418924))

(assert (= (and b!418924 res!244189) b!418918))

(assert (= (and b!418918 res!244197) b!418932))

(assert (= (and b!418932 res!244191) b!418922))

(assert (= (and b!418922 res!244200) b!418926))

(assert (= (and b!418926 res!244199) b!418921))

(assert (= (and b!418921 res!244196) b!418916))

(assert (= (and b!418916 res!244192) b!418929))

(assert (= (and b!418929 c!55191) b!418927))

(assert (= (and b!418929 (not c!55191)) b!418919))

(assert (= (or b!418927 b!418919) bm!29163))

(assert (= (or b!418927 b!418919) bm!29164))

(assert (= (and b!418929 (not res!244190)) b!418930))

(assert (= (and b!418928 condMapEmpty!17850) mapIsEmpty!17850))

(assert (= (and b!418928 (not condMapEmpty!17850)) mapNonEmpty!17850))

(get-info :version)

(assert (= (and mapNonEmpty!17850 ((_ is ValueCellFull!5066) mapValue!17850)) b!418925))

(assert (= (and b!418928 ((_ is ValueCellFull!5066) mapDefault!17850)) b!418933))

(assert (= start!39386 b!418928))

(declare-fun b_lambda!8993 () Bool)

(assert (=> (not b_lambda!8993) (not b!418930)))

(declare-fun t!12349 () Bool)

(declare-fun tb!3281 () Bool)

(assert (=> (and start!39386 (= defaultEntry!557 defaultEntry!557) t!12349) tb!3281))

(declare-fun result!6097 () Bool)

(assert (=> tb!3281 (= result!6097 tp_is_empty!10819)))

(assert (=> b!418930 t!12349))

(declare-fun b_and!17225 () Bool)

(assert (= b_and!17223 (and (=> t!12349 result!6097) b_and!17225)))

(declare-fun m!408635 () Bool)

(assert (=> start!39386 m!408635))

(declare-fun m!408637 () Bool)

(assert (=> start!39386 m!408637))

(declare-fun m!408639 () Bool)

(assert (=> bm!29163 m!408639))

(declare-fun m!408641 () Bool)

(assert (=> b!418927 m!408641))

(declare-fun m!408643 () Bool)

(assert (=> b!418915 m!408643))

(declare-fun m!408645 () Bool)

(assert (=> b!418916 m!408645))

(declare-fun m!408647 () Bool)

(assert (=> b!418916 m!408647))

(declare-fun m!408649 () Bool)

(assert (=> b!418916 m!408649))

(declare-fun m!408651 () Bool)

(assert (=> b!418931 m!408651))

(declare-fun m!408653 () Bool)

(assert (=> b!418930 m!408653))

(declare-fun m!408655 () Bool)

(assert (=> b!418930 m!408655))

(assert (=> b!418930 m!408653))

(declare-fun m!408657 () Bool)

(assert (=> b!418930 m!408657))

(declare-fun m!408659 () Bool)

(assert (=> b!418930 m!408659))

(declare-fun m!408661 () Bool)

(assert (=> b!418930 m!408661))

(assert (=> b!418930 m!408647))

(declare-fun m!408663 () Bool)

(assert (=> b!418930 m!408663))

(declare-fun m!408665 () Bool)

(assert (=> b!418930 m!408665))

(declare-fun m!408667 () Bool)

(assert (=> b!418930 m!408667))

(declare-fun m!408669 () Bool)

(assert (=> b!418930 m!408669))

(declare-fun m!408671 () Bool)

(assert (=> b!418930 m!408671))

(assert (=> b!418930 m!408657))

(declare-fun m!408673 () Bool)

(assert (=> b!418930 m!408673))

(assert (=> b!418930 m!408665))

(declare-fun m!408675 () Bool)

(assert (=> b!418930 m!408675))

(declare-fun m!408677 () Bool)

(assert (=> bm!29164 m!408677))

(declare-fun m!408679 () Bool)

(assert (=> b!418929 m!408679))

(assert (=> b!418929 m!408679))

(declare-fun m!408681 () Bool)

(assert (=> b!418929 m!408681))

(declare-fun m!408683 () Bool)

(assert (=> b!418929 m!408683))

(declare-fun m!408685 () Bool)

(assert (=> b!418922 m!408685))

(declare-fun m!408687 () Bool)

(assert (=> b!418922 m!408687))

(declare-fun m!408689 () Bool)

(assert (=> mapNonEmpty!17850 m!408689))

(declare-fun m!408691 () Bool)

(assert (=> b!418924 m!408691))

(declare-fun m!408693 () Bool)

(assert (=> b!418918 m!408693))

(declare-fun m!408695 () Bool)

(assert (=> b!418917 m!408695))

(declare-fun m!408697 () Bool)

(assert (=> b!418926 m!408697))

(declare-fun m!408699 () Bool)

(assert (=> b!418932 m!408699))

(check-sat (not b!418917) (not bm!29163) (not b!418924) (not b!418926) tp_is_empty!10819 (not b!418932) (not b!418915) (not b!418929) (not b!418927) (not b_lambda!8993) b_and!17225 (not b_next!9667) (not b!418916) (not b!418930) (not b!418922) (not bm!29164) (not mapNonEmpty!17850) (not start!39386) (not b!418931))
(check-sat b_and!17225 (not b_next!9667))
