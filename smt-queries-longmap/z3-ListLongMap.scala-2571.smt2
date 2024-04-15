; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39230 () Bool)

(assert start!39230)

(declare-fun b_free!9511 () Bool)

(declare-fun b_next!9511 () Bool)

(assert (=> start!39230 (= b_free!9511 (not b_next!9511))))

(declare-fun tp!34062 () Bool)

(declare-fun b_and!16871 () Bool)

(assert (=> start!39230 (= tp!34062 b_and!16871)))

(declare-fun b!414091 () Bool)

(declare-fun res!240797 () Bool)

(declare-fun e!247480 () Bool)

(assert (=> b!414091 (=> (not res!240797) (not e!247480))))

(declare-datatypes ((array!25175 0))(
  ( (array!25176 (arr!12037 (Array (_ BitVec 32) (_ BitVec 64))) (size!12390 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25175)

(declare-datatypes ((List!6989 0))(
  ( (Nil!6986) (Cons!6985 (h!7841 (_ BitVec 64)) (t!12156 List!6989)) )
))
(declare-fun arrayNoDuplicates!0 (array!25175 (_ BitVec 32) List!6989) Bool)

(assert (=> b!414091 (= res!240797 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6986))))

(declare-fun b!414092 () Bool)

(declare-fun e!247482 () Bool)

(declare-fun tp_is_empty!10663 () Bool)

(assert (=> b!414092 (= e!247482 tp_is_empty!10663)))

(declare-fun b!414094 () Bool)

(declare-fun res!240795 () Bool)

(declare-fun e!247478 () Bool)

(assert (=> b!414094 (=> (not res!240795) (not e!247478))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!414094 (= res!240795 (bvsle from!863 i!563))))

(declare-fun mapIsEmpty!17616 () Bool)

(declare-fun mapRes!17616 () Bool)

(assert (=> mapIsEmpty!17616 mapRes!17616))

(declare-fun b!414095 () Bool)

(declare-fun res!240794 () Bool)

(assert (=> b!414095 (=> (not res!240794) (not e!247478))))

(declare-fun lt!189746 () array!25175)

(assert (=> b!414095 (= res!240794 (arrayNoDuplicates!0 lt!189746 #b00000000000000000000000000000000 Nil!6986))))

(declare-fun b!414096 () Bool)

(declare-fun e!247476 () Bool)

(assert (=> b!414096 (= e!247476 true)))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15323 0))(
  ( (V!15324 (val!5376 Int)) )
))
(declare-fun zeroValue!515 () V!15323)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!6976 0))(
  ( (tuple2!6977 (_1!3499 (_ BitVec 64)) (_2!3499 V!15323)) )
))
(declare-datatypes ((List!6990 0))(
  ( (Nil!6987) (Cons!6986 (h!7842 tuple2!6976) (t!12157 List!6990)) )
))
(declare-datatypes ((ListLongMap!5879 0))(
  ( (ListLongMap!5880 (toList!2955 List!6990)) )
))
(declare-fun lt!189748 () ListLongMap!5879)

(declare-fun minValue!515 () V!15323)

(declare-datatypes ((ValueCell!4988 0))(
  ( (ValueCellFull!4988 (v!7617 V!15323)) (EmptyCell!4988) )
))
(declare-datatypes ((array!25177 0))(
  ( (array!25178 (arr!12038 (Array (_ BitVec 32) ValueCell!4988)) (size!12391 (_ BitVec 32))) )
))
(declare-fun lt!189745 () array!25177)

(declare-fun +!1192 (ListLongMap!5879 tuple2!6976) ListLongMap!5879)

(declare-fun getCurrentListMapNoExtraKeys!1168 (array!25175 array!25177 (_ BitVec 32) (_ BitVec 32) V!15323 V!15323 (_ BitVec 32) Int) ListLongMap!5879)

(declare-fun get!5931 (ValueCell!4988 V!15323) V!15323)

(declare-fun dynLambda!643 (Int (_ BitVec 64)) V!15323)

(assert (=> b!414096 (= lt!189748 (+!1192 (getCurrentListMapNoExtraKeys!1168 lt!189746 lt!189745 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!6977 (select (arr!12037 lt!189746) from!863) (get!5931 (select (arr!12038 lt!189745) from!863) (dynLambda!643 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!414097 () Bool)

(declare-fun e!247477 () Bool)

(assert (=> b!414097 (= e!247478 e!247477)))

(declare-fun res!240793 () Bool)

(assert (=> b!414097 (=> (not res!240793) (not e!247477))))

(assert (=> b!414097 (= res!240793 (= from!863 i!563))))

(assert (=> b!414097 (= lt!189748 (getCurrentListMapNoExtraKeys!1168 lt!189746 lt!189745 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!25177)

(declare-fun v!412 () V!15323)

(assert (=> b!414097 (= lt!189745 (array!25178 (store (arr!12038 _values!549) i!563 (ValueCellFull!4988 v!412)) (size!12391 _values!549)))))

(declare-fun lt!189747 () ListLongMap!5879)

(assert (=> b!414097 (= lt!189747 (getCurrentListMapNoExtraKeys!1168 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!414098 () Bool)

(assert (=> b!414098 (= e!247477 (not e!247476))))

(declare-fun res!240796 () Bool)

(assert (=> b!414098 (=> res!240796 e!247476)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!414098 (= res!240796 (validKeyInArray!0 (select (arr!12037 _keys!709) from!863)))))

(declare-fun e!247475 () Bool)

(assert (=> b!414098 e!247475))

(declare-fun c!54909 () Bool)

(assert (=> b!414098 (= c!54909 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12226 0))(
  ( (Unit!12227) )
))
(declare-fun lt!189749 () Unit!12226)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!376 (array!25175 array!25177 (_ BitVec 32) (_ BitVec 32) V!15323 V!15323 (_ BitVec 32) (_ BitVec 64) V!15323 (_ BitVec 32) Int) Unit!12226)

(assert (=> b!414098 (= lt!189749 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!376 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414099 () Bool)

(declare-fun res!240788 () Bool)

(assert (=> b!414099 (=> (not res!240788) (not e!247480))))

(assert (=> b!414099 (= res!240788 (and (= (size!12391 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12390 _keys!709) (size!12391 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!414100 () Bool)

(declare-fun e!247481 () Bool)

(assert (=> b!414100 (= e!247481 tp_is_empty!10663)))

(declare-fun b!414101 () Bool)

(declare-fun res!240787 () Bool)

(assert (=> b!414101 (=> (not res!240787) (not e!247480))))

(assert (=> b!414101 (= res!240787 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12390 _keys!709))))))

(declare-fun bm!28683 () Bool)

(declare-fun call!28686 () ListLongMap!5879)

(assert (=> bm!28683 (= call!28686 (getCurrentListMapNoExtraKeys!1168 (ite c!54909 _keys!709 lt!189746) (ite c!54909 _values!549 lt!189745) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17616 () Bool)

(declare-fun tp!34061 () Bool)

(assert (=> mapNonEmpty!17616 (= mapRes!17616 (and tp!34061 e!247482))))

(declare-fun mapRest!17616 () (Array (_ BitVec 32) ValueCell!4988))

(declare-fun mapKey!17616 () (_ BitVec 32))

(declare-fun mapValue!17616 () ValueCell!4988)

(assert (=> mapNonEmpty!17616 (= (arr!12038 _values!549) (store mapRest!17616 mapKey!17616 mapValue!17616))))

(declare-fun b!414102 () Bool)

(declare-fun res!240785 () Bool)

(assert (=> b!414102 (=> (not res!240785) (not e!247480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!414102 (= res!240785 (validMask!0 mask!1025))))

(declare-fun b!414103 () Bool)

(declare-fun e!247479 () Bool)

(assert (=> b!414103 (= e!247479 (and e!247481 mapRes!17616))))

(declare-fun condMapEmpty!17616 () Bool)

(declare-fun mapDefault!17616 () ValueCell!4988)

(assert (=> b!414103 (= condMapEmpty!17616 (= (arr!12038 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4988)) mapDefault!17616)))))

(declare-fun b!414104 () Bool)

(declare-fun res!240798 () Bool)

(assert (=> b!414104 (=> (not res!240798) (not e!247480))))

(declare-fun arrayContainsKey!0 (array!25175 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!414104 (= res!240798 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!414105 () Bool)

(declare-fun res!240792 () Bool)

(assert (=> b!414105 (=> (not res!240792) (not e!247480))))

(assert (=> b!414105 (= res!240792 (or (= (select (arr!12037 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12037 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!414106 () Bool)

(declare-fun call!28687 () ListLongMap!5879)

(assert (=> b!414106 (= e!247475 (= call!28686 call!28687))))

(declare-fun b!414093 () Bool)

(assert (=> b!414093 (= e!247475 (= call!28687 (+!1192 call!28686 (tuple2!6977 k0!794 v!412))))))

(declare-fun res!240790 () Bool)

(assert (=> start!39230 (=> (not res!240790) (not e!247480))))

(assert (=> start!39230 (= res!240790 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12390 _keys!709))))))

(assert (=> start!39230 e!247480))

(assert (=> start!39230 tp_is_empty!10663))

(assert (=> start!39230 tp!34062))

(assert (=> start!39230 true))

(declare-fun array_inv!8830 (array!25177) Bool)

(assert (=> start!39230 (and (array_inv!8830 _values!549) e!247479)))

(declare-fun array_inv!8831 (array!25175) Bool)

(assert (=> start!39230 (array_inv!8831 _keys!709)))

(declare-fun bm!28684 () Bool)

(assert (=> bm!28684 (= call!28687 (getCurrentListMapNoExtraKeys!1168 (ite c!54909 lt!189746 _keys!709) (ite c!54909 lt!189745 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!414107 () Bool)

(declare-fun res!240789 () Bool)

(assert (=> b!414107 (=> (not res!240789) (not e!247480))))

(assert (=> b!414107 (= res!240789 (validKeyInArray!0 k0!794))))

(declare-fun b!414108 () Bool)

(assert (=> b!414108 (= e!247480 e!247478)))

(declare-fun res!240791 () Bool)

(assert (=> b!414108 (=> (not res!240791) (not e!247478))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25175 (_ BitVec 32)) Bool)

(assert (=> b!414108 (= res!240791 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189746 mask!1025))))

(assert (=> b!414108 (= lt!189746 (array!25176 (store (arr!12037 _keys!709) i!563 k0!794) (size!12390 _keys!709)))))

(declare-fun b!414109 () Bool)

(declare-fun res!240786 () Bool)

(assert (=> b!414109 (=> (not res!240786) (not e!247480))))

(assert (=> b!414109 (= res!240786 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39230 res!240790) b!414102))

(assert (= (and b!414102 res!240785) b!414099))

(assert (= (and b!414099 res!240788) b!414109))

(assert (= (and b!414109 res!240786) b!414091))

(assert (= (and b!414091 res!240797) b!414101))

(assert (= (and b!414101 res!240787) b!414107))

(assert (= (and b!414107 res!240789) b!414105))

(assert (= (and b!414105 res!240792) b!414104))

(assert (= (and b!414104 res!240798) b!414108))

(assert (= (and b!414108 res!240791) b!414095))

(assert (= (and b!414095 res!240794) b!414094))

(assert (= (and b!414094 res!240795) b!414097))

(assert (= (and b!414097 res!240793) b!414098))

(assert (= (and b!414098 c!54909) b!414093))

(assert (= (and b!414098 (not c!54909)) b!414106))

(assert (= (or b!414093 b!414106) bm!28684))

(assert (= (or b!414093 b!414106) bm!28683))

(assert (= (and b!414098 (not res!240796)) b!414096))

(assert (= (and b!414103 condMapEmpty!17616) mapIsEmpty!17616))

(assert (= (and b!414103 (not condMapEmpty!17616)) mapNonEmpty!17616))

(get-info :version)

(assert (= (and mapNonEmpty!17616 ((_ is ValueCellFull!4988) mapValue!17616)) b!414092))

(assert (= (and b!414103 ((_ is ValueCellFull!4988) mapDefault!17616)) b!414100))

(assert (= start!39230 b!414103))

(declare-fun b_lambda!8797 () Bool)

(assert (=> (not b_lambda!8797) (not b!414096)))

(declare-fun t!12155 () Bool)

(declare-fun tb!3125 () Bool)

(assert (=> (and start!39230 (= defaultEntry!557 defaultEntry!557) t!12155) tb!3125))

(declare-fun result!5785 () Bool)

(assert (=> tb!3125 (= result!5785 tp_is_empty!10663)))

(assert (=> b!414096 t!12155))

(declare-fun b_and!16873 () Bool)

(assert (= b_and!16871 (and (=> t!12155 result!5785) b_and!16873)))

(declare-fun m!402867 () Bool)

(assert (=> mapNonEmpty!17616 m!402867))

(declare-fun m!402869 () Bool)

(assert (=> b!414098 m!402869))

(assert (=> b!414098 m!402869))

(declare-fun m!402871 () Bool)

(assert (=> b!414098 m!402871))

(declare-fun m!402873 () Bool)

(assert (=> b!414098 m!402873))

(declare-fun m!402875 () Bool)

(assert (=> b!414102 m!402875))

(declare-fun m!402877 () Bool)

(assert (=> bm!28683 m!402877))

(declare-fun m!402879 () Bool)

(assert (=> b!414109 m!402879))

(declare-fun m!402881 () Bool)

(assert (=> b!414095 m!402881))

(declare-fun m!402883 () Bool)

(assert (=> b!414105 m!402883))

(declare-fun m!402885 () Bool)

(assert (=> b!414096 m!402885))

(declare-fun m!402887 () Bool)

(assert (=> b!414096 m!402887))

(declare-fun m!402889 () Bool)

(assert (=> b!414096 m!402889))

(assert (=> b!414096 m!402885))

(declare-fun m!402891 () Bool)

(assert (=> b!414096 m!402891))

(assert (=> b!414096 m!402889))

(declare-fun m!402893 () Bool)

(assert (=> b!414096 m!402893))

(assert (=> b!414096 m!402893))

(declare-fun m!402895 () Bool)

(assert (=> b!414096 m!402895))

(declare-fun m!402897 () Bool)

(assert (=> b!414097 m!402897))

(declare-fun m!402899 () Bool)

(assert (=> b!414097 m!402899))

(declare-fun m!402901 () Bool)

(assert (=> b!414097 m!402901))

(declare-fun m!402903 () Bool)

(assert (=> b!414108 m!402903))

(declare-fun m!402905 () Bool)

(assert (=> b!414108 m!402905))

(declare-fun m!402907 () Bool)

(assert (=> start!39230 m!402907))

(declare-fun m!402909 () Bool)

(assert (=> start!39230 m!402909))

(declare-fun m!402911 () Bool)

(assert (=> b!414104 m!402911))

(declare-fun m!402913 () Bool)

(assert (=> b!414107 m!402913))

(declare-fun m!402915 () Bool)

(assert (=> bm!28684 m!402915))

(declare-fun m!402917 () Bool)

(assert (=> b!414093 m!402917))

(declare-fun m!402919 () Bool)

(assert (=> b!414091 m!402919))

(check-sat (not b_next!9511) b_and!16873 (not b!414093) (not bm!28684) (not b!414108) (not b!414091) (not bm!28683) tp_is_empty!10663 (not b!414109) (not b!414107) (not b!414104) (not b!414102) (not start!39230) (not b!414095) (not b!414096) (not b!414098) (not b_lambda!8797) (not mapNonEmpty!17616) (not b!414097))
(check-sat b_and!16873 (not b_next!9511))
