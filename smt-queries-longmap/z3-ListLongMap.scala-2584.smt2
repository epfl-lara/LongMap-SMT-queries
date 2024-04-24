; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39308 () Bool)

(assert start!39308)

(declare-fun b_free!9589 () Bool)

(declare-fun b_next!9589 () Bool)

(assert (=> start!39308 (= b_free!9589 (not b_next!9589))))

(declare-fun tp!34296 () Bool)

(declare-fun b_and!17067 () Bool)

(assert (=> start!39308 (= tp!34296 b_and!17067)))

(declare-fun b!416614 () Bool)

(declare-fun e!248676 () Bool)

(assert (=> b!416614 (= e!248676 true)))

(declare-datatypes ((V!15427 0))(
  ( (V!15428 (val!5415 Int)) )
))
(declare-datatypes ((tuple2!6940 0))(
  ( (tuple2!6941 (_1!3481 (_ BitVec 64)) (_2!3481 V!15427)) )
))
(declare-fun lt!190811 () tuple2!6940)

(declare-fun lt!190820 () V!15427)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((List!6958 0))(
  ( (Nil!6955) (Cons!6954 (h!7810 tuple2!6940) (t!12204 List!6958)) )
))
(declare-datatypes ((ListLongMap!5855 0))(
  ( (ListLongMap!5856 (toList!2943 List!6958)) )
))
(declare-fun lt!190817 () ListLongMap!5855)

(declare-fun +!1214 (ListLongMap!5855 tuple2!6940) ListLongMap!5855)

(assert (=> b!416614 (= (+!1214 lt!190817 lt!190811) (+!1214 (+!1214 lt!190817 (tuple2!6941 k0!794 lt!190820)) lt!190811))))

(declare-fun lt!190815 () V!15427)

(assert (=> b!416614 (= lt!190811 (tuple2!6941 k0!794 lt!190815))))

(declare-datatypes ((Unit!12305 0))(
  ( (Unit!12306) )
))
(declare-fun lt!190816 () Unit!12305)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!9 (ListLongMap!5855 (_ BitVec 64) V!15427 V!15427) Unit!12305)

(assert (=> b!416614 (= lt!190816 (addSameAsAddTwiceSameKeyDiffValues!9 lt!190817 k0!794 lt!190820 lt!190815))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5027 0))(
  ( (ValueCellFull!5027 (v!7663 V!15427)) (EmptyCell!5027) )
))
(declare-datatypes ((array!25342 0))(
  ( (array!25343 (arr!12120 (Array (_ BitVec 32) ValueCell!5027)) (size!12472 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25342)

(declare-fun lt!190819 () V!15427)

(declare-fun get!5993 (ValueCell!5027 V!15427) V!15427)

(assert (=> b!416614 (= lt!190820 (get!5993 (select (arr!12120 _values!549) from!863) lt!190819))))

(declare-datatypes ((array!25344 0))(
  ( (array!25345 (arr!12121 (Array (_ BitVec 32) (_ BitVec 64))) (size!12473 (_ BitVec 32))) )
))
(declare-fun lt!190812 () array!25344)

(declare-fun lt!190821 () ListLongMap!5855)

(assert (=> b!416614 (= lt!190821 (+!1214 lt!190817 (tuple2!6941 (select (arr!12121 lt!190812) from!863) lt!190815)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!15427)

(assert (=> b!416614 (= lt!190815 (get!5993 (select (store (arr!12120 _values!549) i!563 (ValueCellFull!5027 v!412)) from!863) lt!190819))))

(declare-fun defaultEntry!557 () Int)

(declare-fun dynLambda!676 (Int (_ BitVec 64)) V!15427)

(assert (=> b!416614 (= lt!190819 (dynLambda!676 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun minValue!515 () V!15427)

(declare-fun zeroValue!515 () V!15427)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!190818 () array!25342)

(declare-fun getCurrentListMapNoExtraKeys!1190 (array!25344 array!25342 (_ BitVec 32) (_ BitVec 32) V!15427 V!15427 (_ BitVec 32) Int) ListLongMap!5855)

(assert (=> b!416614 (= lt!190817 (getCurrentListMapNoExtraKeys!1190 lt!190812 lt!190818 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!242553 () Bool)

(declare-fun e!248671 () Bool)

(assert (=> start!39308 (=> (not res!242553) (not e!248671))))

(declare-fun _keys!709 () array!25344)

(assert (=> start!39308 (= res!242553 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12473 _keys!709))))))

(assert (=> start!39308 e!248671))

(declare-fun tp_is_empty!10741 () Bool)

(assert (=> start!39308 tp_is_empty!10741))

(assert (=> start!39308 tp!34296))

(assert (=> start!39308 true))

(declare-fun e!248675 () Bool)

(declare-fun array_inv!8918 (array!25342) Bool)

(assert (=> start!39308 (and (array_inv!8918 _values!549) e!248675)))

(declare-fun array_inv!8919 (array!25344) Bool)

(assert (=> start!39308 (array_inv!8919 _keys!709)))

(declare-fun b!416615 () Bool)

(declare-fun res!242560 () Bool)

(assert (=> b!416615 (=> (not res!242560) (not e!248671))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!416615 (= res!242560 (validKeyInArray!0 k0!794))))

(declare-fun b!416616 () Bool)

(declare-fun res!242556 () Bool)

(assert (=> b!416616 (=> (not res!242556) (not e!248671))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25344 (_ BitVec 32)) Bool)

(assert (=> b!416616 (= res!242556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!416617 () Bool)

(declare-fun e!248672 () Bool)

(declare-fun call!28932 () ListLongMap!5855)

(declare-fun call!28933 () ListLongMap!5855)

(assert (=> b!416617 (= e!248672 (= call!28932 call!28933))))

(declare-fun b!416618 () Bool)

(declare-fun e!248674 () Bool)

(declare-fun mapRes!17733 () Bool)

(assert (=> b!416618 (= e!248675 (and e!248674 mapRes!17733))))

(declare-fun condMapEmpty!17733 () Bool)

(declare-fun mapDefault!17733 () ValueCell!5027)

(assert (=> b!416618 (= condMapEmpty!17733 (= (arr!12120 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5027)) mapDefault!17733)))))

(declare-fun b!416619 () Bool)

(declare-fun res!242552 () Bool)

(assert (=> b!416619 (=> (not res!242552) (not e!248671))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!416619 (= res!242552 (validMask!0 mask!1025))))

(declare-fun b!416620 () Bool)

(declare-fun res!242558 () Bool)

(assert (=> b!416620 (=> (not res!242558) (not e!248671))))

(assert (=> b!416620 (= res!242558 (and (= (size!12472 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12473 _keys!709) (size!12472 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!17733 () Bool)

(declare-fun tp!34295 () Bool)

(declare-fun e!248669 () Bool)

(assert (=> mapNonEmpty!17733 (= mapRes!17733 (and tp!34295 e!248669))))

(declare-fun mapRest!17733 () (Array (_ BitVec 32) ValueCell!5027))

(declare-fun mapKey!17733 () (_ BitVec 32))

(declare-fun mapValue!17733 () ValueCell!5027)

(assert (=> mapNonEmpty!17733 (= (arr!12120 _values!549) (store mapRest!17733 mapKey!17733 mapValue!17733))))

(declare-fun b!416621 () Bool)

(assert (=> b!416621 (= e!248669 tp_is_empty!10741)))

(declare-fun b!416622 () Bool)

(declare-fun e!248670 () Bool)

(declare-fun e!248673 () Bool)

(assert (=> b!416622 (= e!248670 e!248673)))

(declare-fun res!242562 () Bool)

(assert (=> b!416622 (=> (not res!242562) (not e!248673))))

(assert (=> b!416622 (= res!242562 (= from!863 i!563))))

(assert (=> b!416622 (= lt!190821 (getCurrentListMapNoExtraKeys!1190 lt!190812 lt!190818 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!416622 (= lt!190818 (array!25343 (store (arr!12120 _values!549) i!563 (ValueCellFull!5027 v!412)) (size!12472 _values!549)))))

(declare-fun lt!190814 () ListLongMap!5855)

(assert (=> b!416622 (= lt!190814 (getCurrentListMapNoExtraKeys!1190 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!28929 () Bool)

(declare-fun c!55074 () Bool)

(assert (=> bm!28929 (= call!28933 (getCurrentListMapNoExtraKeys!1190 (ite c!55074 lt!190812 _keys!709) (ite c!55074 lt!190818 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416623 () Bool)

(assert (=> b!416623 (= e!248672 (= call!28933 (+!1214 call!28932 (tuple2!6941 k0!794 v!412))))))

(declare-fun b!416624 () Bool)

(declare-fun res!242555 () Bool)

(assert (=> b!416624 (=> (not res!242555) (not e!248671))))

(assert (=> b!416624 (= res!242555 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12473 _keys!709))))))

(declare-fun b!416625 () Bool)

(declare-fun res!242561 () Bool)

(assert (=> b!416625 (=> (not res!242561) (not e!248671))))

(declare-datatypes ((List!6959 0))(
  ( (Nil!6956) (Cons!6955 (h!7811 (_ BitVec 64)) (t!12205 List!6959)) )
))
(declare-fun arrayNoDuplicates!0 (array!25344 (_ BitVec 32) List!6959) Bool)

(assert (=> b!416625 (= res!242561 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6956))))

(declare-fun b!416626 () Bool)

(assert (=> b!416626 (= e!248674 tp_is_empty!10741)))

(declare-fun b!416627 () Bool)

(assert (=> b!416627 (= e!248673 (not e!248676))))

(declare-fun res!242551 () Bool)

(assert (=> b!416627 (=> res!242551 e!248676)))

(assert (=> b!416627 (= res!242551 (validKeyInArray!0 (select (arr!12121 _keys!709) from!863)))))

(assert (=> b!416627 e!248672))

(assert (=> b!416627 (= c!55074 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun lt!190813 () Unit!12305)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!418 (array!25344 array!25342 (_ BitVec 32) (_ BitVec 32) V!15427 V!15427 (_ BitVec 32) (_ BitVec 64) V!15427 (_ BitVec 32) Int) Unit!12305)

(assert (=> b!416627 (= lt!190813 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!418 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!416628 () Bool)

(declare-fun res!242550 () Bool)

(assert (=> b!416628 (=> (not res!242550) (not e!248670))))

(assert (=> b!416628 (= res!242550 (arrayNoDuplicates!0 lt!190812 #b00000000000000000000000000000000 Nil!6956))))

(declare-fun b!416629 () Bool)

(declare-fun res!242549 () Bool)

(assert (=> b!416629 (=> (not res!242549) (not e!248670))))

(assert (=> b!416629 (= res!242549 (bvsle from!863 i!563))))

(declare-fun b!416630 () Bool)

(declare-fun res!242554 () Bool)

(assert (=> b!416630 (=> (not res!242554) (not e!248671))))

(assert (=> b!416630 (= res!242554 (or (= (select (arr!12121 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12121 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!28930 () Bool)

(assert (=> bm!28930 (= call!28932 (getCurrentListMapNoExtraKeys!1190 (ite c!55074 _keys!709 lt!190812) (ite c!55074 _values!549 lt!190818) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17733 () Bool)

(assert (=> mapIsEmpty!17733 mapRes!17733))

(declare-fun b!416631 () Bool)

(assert (=> b!416631 (= e!248671 e!248670)))

(declare-fun res!242557 () Bool)

(assert (=> b!416631 (=> (not res!242557) (not e!248670))))

(assert (=> b!416631 (= res!242557 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!190812 mask!1025))))

(assert (=> b!416631 (= lt!190812 (array!25345 (store (arr!12121 _keys!709) i!563 k0!794) (size!12473 _keys!709)))))

(declare-fun b!416632 () Bool)

(declare-fun res!242559 () Bool)

(assert (=> b!416632 (=> (not res!242559) (not e!248671))))

(declare-fun arrayContainsKey!0 (array!25344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!416632 (= res!242559 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!39308 res!242553) b!416619))

(assert (= (and b!416619 res!242552) b!416620))

(assert (= (and b!416620 res!242558) b!416616))

(assert (= (and b!416616 res!242556) b!416625))

(assert (= (and b!416625 res!242561) b!416624))

(assert (= (and b!416624 res!242555) b!416615))

(assert (= (and b!416615 res!242560) b!416630))

(assert (= (and b!416630 res!242554) b!416632))

(assert (= (and b!416632 res!242559) b!416631))

(assert (= (and b!416631 res!242557) b!416628))

(assert (= (and b!416628 res!242550) b!416629))

(assert (= (and b!416629 res!242549) b!416622))

(assert (= (and b!416622 res!242562) b!416627))

(assert (= (and b!416627 c!55074) b!416623))

(assert (= (and b!416627 (not c!55074)) b!416617))

(assert (= (or b!416623 b!416617) bm!28929))

(assert (= (or b!416623 b!416617) bm!28930))

(assert (= (and b!416627 (not res!242551)) b!416614))

(assert (= (and b!416618 condMapEmpty!17733) mapIsEmpty!17733))

(assert (= (and b!416618 (not condMapEmpty!17733)) mapNonEmpty!17733))

(get-info :version)

(assert (= (and mapNonEmpty!17733 ((_ is ValueCellFull!5027) mapValue!17733)) b!416621))

(assert (= (and b!416618 ((_ is ValueCellFull!5027) mapDefault!17733)) b!416626))

(assert (= start!39308 b!416618))

(declare-fun b_lambda!8915 () Bool)

(assert (=> (not b_lambda!8915) (not b!416614)))

(declare-fun t!12203 () Bool)

(declare-fun tb!3203 () Bool)

(assert (=> (and start!39308 (= defaultEntry!557 defaultEntry!557) t!12203) tb!3203))

(declare-fun result!5941 () Bool)

(assert (=> tb!3203 (= result!5941 tp_is_empty!10741)))

(assert (=> b!416614 t!12203))

(declare-fun b_and!17069 () Bool)

(assert (= b_and!17067 (and (=> t!12203 result!5941) b_and!17069)))

(declare-fun m!406069 () Bool)

(assert (=> b!416622 m!406069))

(declare-fun m!406071 () Bool)

(assert (=> b!416622 m!406071))

(declare-fun m!406073 () Bool)

(assert (=> b!416622 m!406073))

(declare-fun m!406075 () Bool)

(assert (=> b!416631 m!406075))

(declare-fun m!406077 () Bool)

(assert (=> b!416631 m!406077))

(declare-fun m!406079 () Bool)

(assert (=> b!416625 m!406079))

(declare-fun m!406081 () Bool)

(assert (=> bm!28930 m!406081))

(declare-fun m!406083 () Bool)

(assert (=> b!416627 m!406083))

(assert (=> b!416627 m!406083))

(declare-fun m!406085 () Bool)

(assert (=> b!416627 m!406085))

(declare-fun m!406087 () Bool)

(assert (=> b!416627 m!406087))

(declare-fun m!406089 () Bool)

(assert (=> bm!28929 m!406089))

(declare-fun m!406091 () Bool)

(assert (=> b!416614 m!406091))

(assert (=> b!416614 m!406071))

(declare-fun m!406093 () Bool)

(assert (=> b!416614 m!406093))

(declare-fun m!406095 () Bool)

(assert (=> b!416614 m!406095))

(declare-fun m!406097 () Bool)

(assert (=> b!416614 m!406097))

(declare-fun m!406099 () Bool)

(assert (=> b!416614 m!406099))

(declare-fun m!406101 () Bool)

(assert (=> b!416614 m!406101))

(declare-fun m!406103 () Bool)

(assert (=> b!416614 m!406103))

(declare-fun m!406105 () Bool)

(assert (=> b!416614 m!406105))

(declare-fun m!406107 () Bool)

(assert (=> b!416614 m!406107))

(assert (=> b!416614 m!406101))

(declare-fun m!406109 () Bool)

(assert (=> b!416614 m!406109))

(assert (=> b!416614 m!406103))

(declare-fun m!406111 () Bool)

(assert (=> b!416614 m!406111))

(declare-fun m!406113 () Bool)

(assert (=> b!416614 m!406113))

(assert (=> b!416614 m!406097))

(declare-fun m!406115 () Bool)

(assert (=> start!39308 m!406115))

(declare-fun m!406117 () Bool)

(assert (=> start!39308 m!406117))

(declare-fun m!406119 () Bool)

(assert (=> mapNonEmpty!17733 m!406119))

(declare-fun m!406121 () Bool)

(assert (=> b!416628 m!406121))

(declare-fun m!406123 () Bool)

(assert (=> b!416623 m!406123))

(declare-fun m!406125 () Bool)

(assert (=> b!416616 m!406125))

(declare-fun m!406127 () Bool)

(assert (=> b!416615 m!406127))

(declare-fun m!406129 () Bool)

(assert (=> b!416630 m!406129))

(declare-fun m!406131 () Bool)

(assert (=> b!416632 m!406131))

(declare-fun m!406133 () Bool)

(assert (=> b!416619 m!406133))

(check-sat (not b!416619) (not bm!28930) (not mapNonEmpty!17733) (not b!416615) (not b!416623) (not b_lambda!8915) b_and!17069 (not b!416614) (not b!416616) (not b!416631) (not b_next!9589) (not b!416625) (not b!416632) (not b!416622) tp_is_empty!10741 (not start!39308) (not b!416627) (not bm!28929) (not b!416628))
(check-sat b_and!17069 (not b_next!9589))
