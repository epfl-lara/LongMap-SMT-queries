; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41104 () Bool)

(assert start!41104)

(declare-fun b_free!10995 () Bool)

(declare-fun b_next!10995 () Bool)

(assert (=> start!41104 (= b_free!10995 (not b_next!10995))))

(declare-fun tp!38817 () Bool)

(declare-fun b_and!19213 () Bool)

(assert (=> start!41104 (= tp!38817 b_and!19213)))

(declare-fun res!273964 () Bool)

(declare-fun e!267717 () Bool)

(assert (=> start!41104 (=> (not res!273964) (not e!267717))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!28467 0))(
  ( (array!28468 (arr!13675 (Array (_ BitVec 32) (_ BitVec 64))) (size!14027 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28467)

(assert (=> start!41104 (= res!273964 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14027 _keys!709))))))

(assert (=> start!41104 e!267717))

(declare-fun tp_is_empty!12333 () Bool)

(assert (=> start!41104 tp_is_empty!12333))

(assert (=> start!41104 tp!38817))

(assert (=> start!41104 true))

(declare-datatypes ((V!17549 0))(
  ( (V!17550 (val!6211 Int)) )
))
(declare-datatypes ((ValueCell!5823 0))(
  ( (ValueCellFull!5823 (v!8485 V!17549)) (EmptyCell!5823) )
))
(declare-datatypes ((array!28469 0))(
  ( (array!28470 (arr!13676 (Array (_ BitVec 32) ValueCell!5823)) (size!14028 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28469)

(declare-fun e!267712 () Bool)

(declare-fun array_inv!9898 (array!28469) Bool)

(assert (=> start!41104 (and (array_inv!9898 _values!549) e!267712)))

(declare-fun array_inv!9899 (array!28467) Bool)

(assert (=> start!41104 (array_inv!9899 _keys!709)))

(declare-fun b!458559 () Bool)

(declare-fun res!273961 () Bool)

(declare-fun e!267715 () Bool)

(assert (=> b!458559 (=> (not res!273961) (not e!267715))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!458559 (= res!273961 (bvsle from!863 i!563))))

(declare-fun b!458560 () Bool)

(declare-fun res!273960 () Bool)

(assert (=> b!458560 (=> (not res!273960) (not e!267717))))

(assert (=> b!458560 (= res!273960 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14027 _keys!709))))))

(declare-fun b!458561 () Bool)

(declare-fun res!273963 () Bool)

(assert (=> b!458561 (=> (not res!273963) (not e!267715))))

(declare-fun lt!207430 () array!28467)

(declare-datatypes ((List!8257 0))(
  ( (Nil!8254) (Cons!8253 (h!9109 (_ BitVec 64)) (t!14131 List!8257)) )
))
(declare-fun arrayNoDuplicates!0 (array!28467 (_ BitVec 32) List!8257) Bool)

(assert (=> b!458561 (= res!273963 (arrayNoDuplicates!0 lt!207430 #b00000000000000000000000000000000 Nil!8254))))

(declare-fun b!458562 () Bool)

(declare-fun res!273966 () Bool)

(assert (=> b!458562 (=> (not res!273966) (not e!267717))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28467 (_ BitVec 32)) Bool)

(assert (=> b!458562 (= res!273966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!458563 () Bool)

(declare-fun res!273962 () Bool)

(assert (=> b!458563 (=> (not res!273962) (not e!267717))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!458563 (= res!273962 (validMask!0 mask!1025))))

(declare-fun b!458564 () Bool)

(assert (=> b!458564 (= e!267717 e!267715)))

(declare-fun res!273965 () Bool)

(assert (=> b!458564 (=> (not res!273965) (not e!267715))))

(assert (=> b!458564 (= res!273965 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207430 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!458564 (= lt!207430 (array!28468 (store (arr!13675 _keys!709) i!563 k0!794) (size!14027 _keys!709)))))

(declare-fun b!458565 () Bool)

(declare-fun e!267713 () Bool)

(assert (=> b!458565 (= e!267713 tp_is_empty!12333)))

(declare-fun b!458566 () Bool)

(declare-fun e!267718 () Bool)

(assert (=> b!458566 (= e!267718 tp_is_empty!12333)))

(declare-fun b!458567 () Bool)

(declare-fun e!267719 () Bool)

(declare-fun e!267714 () Bool)

(assert (=> b!458567 (= e!267719 (not e!267714))))

(declare-fun res!273969 () Bool)

(assert (=> b!458567 (=> res!273969 e!267714)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!458567 (= res!273969 (not (validKeyInArray!0 (select (arr!13675 _keys!709) from!863))))))

(declare-datatypes ((tuple2!8186 0))(
  ( (tuple2!8187 (_1!4104 (_ BitVec 64)) (_2!4104 V!17549)) )
))
(declare-datatypes ((List!8258 0))(
  ( (Nil!8255) (Cons!8254 (h!9110 tuple2!8186) (t!14132 List!8258)) )
))
(declare-datatypes ((ListLongMap!7099 0))(
  ( (ListLongMap!7100 (toList!3565 List!8258)) )
))
(declare-fun lt!207427 () ListLongMap!7099)

(declare-fun lt!207428 () ListLongMap!7099)

(assert (=> b!458567 (= lt!207427 lt!207428)))

(declare-fun lt!207432 () ListLongMap!7099)

(declare-fun v!412 () V!17549)

(declare-fun +!1601 (ListLongMap!7099 tuple2!8186) ListLongMap!7099)

(assert (=> b!458567 (= lt!207428 (+!1601 lt!207432 (tuple2!8187 k0!794 v!412)))))

(declare-fun minValue!515 () V!17549)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!17549)

(declare-fun lt!207433 () array!28469)

(declare-fun getCurrentListMapNoExtraKeys!1747 (array!28467 array!28469 (_ BitVec 32) (_ BitVec 32) V!17549 V!17549 (_ BitVec 32) Int) ListLongMap!7099)

(assert (=> b!458567 (= lt!207427 (getCurrentListMapNoExtraKeys!1747 lt!207430 lt!207433 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!458567 (= lt!207432 (getCurrentListMapNoExtraKeys!1747 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!13322 0))(
  ( (Unit!13323) )
))
(declare-fun lt!207429 () Unit!13322)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!760 (array!28467 array!28469 (_ BitVec 32) (_ BitVec 32) V!17549 V!17549 (_ BitVec 32) (_ BitVec 64) V!17549 (_ BitVec 32) Int) Unit!13322)

(assert (=> b!458567 (= lt!207429 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!760 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458568 () Bool)

(declare-fun res!273967 () Bool)

(assert (=> b!458568 (=> (not res!273967) (not e!267717))))

(assert (=> b!458568 (= res!273967 (and (= (size!14028 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14027 _keys!709) (size!14028 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!20146 () Bool)

(declare-fun mapRes!20146 () Bool)

(declare-fun tp!38818 () Bool)

(assert (=> mapNonEmpty!20146 (= mapRes!20146 (and tp!38818 e!267713))))

(declare-fun mapKey!20146 () (_ BitVec 32))

(declare-fun mapValue!20146 () ValueCell!5823)

(declare-fun mapRest!20146 () (Array (_ BitVec 32) ValueCell!5823))

(assert (=> mapNonEmpty!20146 (= (arr!13676 _values!549) (store mapRest!20146 mapKey!20146 mapValue!20146))))

(declare-fun b!458569 () Bool)

(declare-fun res!273970 () Bool)

(assert (=> b!458569 (=> (not res!273970) (not e!267717))))

(assert (=> b!458569 (= res!273970 (validKeyInArray!0 k0!794))))

(declare-fun b!458570 () Bool)

(declare-fun res!273959 () Bool)

(assert (=> b!458570 (=> (not res!273959) (not e!267717))))

(assert (=> b!458570 (= res!273959 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8254))))

(declare-fun b!458571 () Bool)

(assert (=> b!458571 (= e!267715 e!267719)))

(declare-fun res!273972 () Bool)

(assert (=> b!458571 (=> (not res!273972) (not e!267719))))

(assert (=> b!458571 (= res!273972 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!207431 () ListLongMap!7099)

(assert (=> b!458571 (= lt!207431 (getCurrentListMapNoExtraKeys!1747 lt!207430 lt!207433 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!458571 (= lt!207433 (array!28470 (store (arr!13676 _values!549) i!563 (ValueCellFull!5823 v!412)) (size!14028 _values!549)))))

(declare-fun lt!207426 () ListLongMap!7099)

(assert (=> b!458571 (= lt!207426 (getCurrentListMapNoExtraKeys!1747 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!458572 () Bool)

(declare-fun e!267716 () Bool)

(declare-fun arrayContainsKey!0 (array!28467 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!458572 (= e!267716 (arrayContainsKey!0 _keys!709 k0!794 from!863))))

(declare-fun b!458573 () Bool)

(declare-fun res!273968 () Bool)

(assert (=> b!458573 (=> (not res!273968) (not e!267717))))

(assert (=> b!458573 (= res!273968 (or (= (select (arr!13675 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13675 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!20146 () Bool)

(assert (=> mapIsEmpty!20146 mapRes!20146))

(declare-fun b!458574 () Bool)

(assert (=> b!458574 (= e!267712 (and e!267718 mapRes!20146))))

(declare-fun condMapEmpty!20146 () Bool)

(declare-fun mapDefault!20146 () ValueCell!5823)

(assert (=> b!458574 (= condMapEmpty!20146 (= (arr!13676 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5823)) mapDefault!20146)))))

(declare-fun b!458575 () Bool)

(declare-fun res!273973 () Bool)

(assert (=> b!458575 (=> (not res!273973) (not e!267717))))

(assert (=> b!458575 (= res!273973 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!458576 () Bool)

(assert (=> b!458576 (= e!267714 e!267716)))

(declare-fun res!273971 () Bool)

(assert (=> b!458576 (=> res!273971 e!267716)))

(assert (=> b!458576 (= res!273971 (or (not (= (select (arr!13675 _keys!709) from!863) k0!794)) (bvsge from!863 (size!14027 _keys!709)) (bvsge (size!14027 _keys!709) #b01111111111111111111111111111111)))))

(declare-fun get!6739 (ValueCell!5823 V!17549) V!17549)

(declare-fun dynLambda!889 (Int (_ BitVec 64)) V!17549)

(assert (=> b!458576 (= lt!207431 (+!1601 lt!207428 (tuple2!8187 (select (arr!13675 _keys!709) from!863) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!41104 res!273964) b!458563))

(assert (= (and b!458563 res!273962) b!458568))

(assert (= (and b!458568 res!273967) b!458562))

(assert (= (and b!458562 res!273966) b!458570))

(assert (= (and b!458570 res!273959) b!458560))

(assert (= (and b!458560 res!273960) b!458569))

(assert (= (and b!458569 res!273970) b!458573))

(assert (= (and b!458573 res!273968) b!458575))

(assert (= (and b!458575 res!273973) b!458564))

(assert (= (and b!458564 res!273965) b!458561))

(assert (= (and b!458561 res!273963) b!458559))

(assert (= (and b!458559 res!273961) b!458571))

(assert (= (and b!458571 res!273972) b!458567))

(assert (= (and b!458567 (not res!273969)) b!458576))

(assert (= (and b!458576 (not res!273971)) b!458572))

(assert (= (and b!458574 condMapEmpty!20146) mapIsEmpty!20146))

(assert (= (and b!458574 (not condMapEmpty!20146)) mapNonEmpty!20146))

(get-info :version)

(assert (= (and mapNonEmpty!20146 ((_ is ValueCellFull!5823) mapValue!20146)) b!458565))

(assert (= (and b!458574 ((_ is ValueCellFull!5823) mapDefault!20146)) b!458566))

(assert (= start!41104 b!458574))

(declare-fun b_lambda!9795 () Bool)

(assert (=> (not b_lambda!9795) (not b!458576)))

(declare-fun t!14130 () Bool)

(declare-fun tb!3831 () Bool)

(assert (=> (and start!41104 (= defaultEntry!557 defaultEntry!557) t!14130) tb!3831))

(declare-fun result!7205 () Bool)

(assert (=> tb!3831 (= result!7205 tp_is_empty!12333)))

(assert (=> b!458576 t!14130))

(declare-fun b_and!19215 () Bool)

(assert (= b_and!19213 (and (=> t!14130 result!7205) b_and!19215)))

(declare-fun m!441887 () Bool)

(assert (=> b!458572 m!441887))

(declare-fun m!441889 () Bool)

(assert (=> mapNonEmpty!20146 m!441889))

(declare-fun m!441891 () Bool)

(assert (=> b!458563 m!441891))

(declare-fun m!441893 () Bool)

(assert (=> b!458569 m!441893))

(declare-fun m!441895 () Bool)

(assert (=> b!458575 m!441895))

(declare-fun m!441897 () Bool)

(assert (=> b!458576 m!441897))

(declare-fun m!441899 () Bool)

(assert (=> b!458576 m!441899))

(assert (=> b!458576 m!441899))

(declare-fun m!441901 () Bool)

(assert (=> b!458576 m!441901))

(declare-fun m!441903 () Bool)

(assert (=> b!458576 m!441903))

(assert (=> b!458576 m!441901))

(declare-fun m!441905 () Bool)

(assert (=> b!458576 m!441905))

(declare-fun m!441907 () Bool)

(assert (=> b!458564 m!441907))

(declare-fun m!441909 () Bool)

(assert (=> b!458564 m!441909))

(declare-fun m!441911 () Bool)

(assert (=> b!458561 m!441911))

(declare-fun m!441913 () Bool)

(assert (=> start!41104 m!441913))

(declare-fun m!441915 () Bool)

(assert (=> start!41104 m!441915))

(assert (=> b!458567 m!441897))

(declare-fun m!441917 () Bool)

(assert (=> b!458567 m!441917))

(declare-fun m!441919 () Bool)

(assert (=> b!458567 m!441919))

(declare-fun m!441921 () Bool)

(assert (=> b!458567 m!441921))

(assert (=> b!458567 m!441897))

(declare-fun m!441923 () Bool)

(assert (=> b!458567 m!441923))

(declare-fun m!441925 () Bool)

(assert (=> b!458567 m!441925))

(declare-fun m!441927 () Bool)

(assert (=> b!458573 m!441927))

(declare-fun m!441929 () Bool)

(assert (=> b!458562 m!441929))

(declare-fun m!441931 () Bool)

(assert (=> b!458571 m!441931))

(declare-fun m!441933 () Bool)

(assert (=> b!458571 m!441933))

(declare-fun m!441935 () Bool)

(assert (=> b!458571 m!441935))

(declare-fun m!441937 () Bool)

(assert (=> b!458570 m!441937))

(check-sat tp_is_empty!12333 (not b!458576) (not b!458561) (not b!458572) (not b!458569) (not mapNonEmpty!20146) (not start!41104) b_and!19215 (not b!458570) (not b!458562) (not b!458563) (not b!458567) (not b!458564) (not b_next!10995) (not b!458571) (not b_lambda!9795) (not b!458575))
(check-sat b_and!19215 (not b_next!10995))
(get-model)

(declare-fun b_lambda!9799 () Bool)

(assert (= b_lambda!9795 (or (and start!41104 b_free!10995) b_lambda!9799)))

(check-sat tp_is_empty!12333 (not b!458576) (not b!458561) (not b!458572) (not b_lambda!9799) (not b!458569) (not mapNonEmpty!20146) (not b!458575) (not start!41104) b_and!19215 (not b!458570) (not b!458562) (not b!458563) (not b!458567) (not b!458564) (not b_next!10995) (not b!458571))
(check-sat b_and!19215 (not b_next!10995))
(get-model)

(declare-fun bm!30131 () Bool)

(declare-fun call!30134 () Bool)

(declare-fun c!56418 () Bool)

(assert (=> bm!30131 (= call!30134 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56418 (Cons!8253 (select (arr!13675 _keys!709) #b00000000000000000000000000000000) Nil!8254) Nil!8254)))))

(declare-fun d!74749 () Bool)

(declare-fun res!274026 () Bool)

(declare-fun e!267756 () Bool)

(assert (=> d!74749 (=> res!274026 e!267756)))

(assert (=> d!74749 (= res!274026 (bvsge #b00000000000000000000000000000000 (size!14027 _keys!709)))))

(assert (=> d!74749 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8254) e!267756)))

(declare-fun b!458645 () Bool)

(declare-fun e!267755 () Bool)

(assert (=> b!458645 (= e!267755 call!30134)))

(declare-fun b!458646 () Bool)

(declare-fun e!267758 () Bool)

(declare-fun contains!2506 (List!8257 (_ BitVec 64)) Bool)

(assert (=> b!458646 (= e!267758 (contains!2506 Nil!8254 (select (arr!13675 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!458647 () Bool)

(assert (=> b!458647 (= e!267755 call!30134)))

(declare-fun b!458648 () Bool)

(declare-fun e!267757 () Bool)

(assert (=> b!458648 (= e!267756 e!267757)))

(declare-fun res!274027 () Bool)

(assert (=> b!458648 (=> (not res!274027) (not e!267757))))

(assert (=> b!458648 (= res!274027 (not e!267758))))

(declare-fun res!274025 () Bool)

(assert (=> b!458648 (=> (not res!274025) (not e!267758))))

(assert (=> b!458648 (= res!274025 (validKeyInArray!0 (select (arr!13675 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!458649 () Bool)

(assert (=> b!458649 (= e!267757 e!267755)))

(assert (=> b!458649 (= c!56418 (validKeyInArray!0 (select (arr!13675 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74749 (not res!274026)) b!458648))

(assert (= (and b!458648 res!274025) b!458646))

(assert (= (and b!458648 res!274027) b!458649))

(assert (= (and b!458649 c!56418) b!458645))

(assert (= (and b!458649 (not c!56418)) b!458647))

(assert (= (or b!458645 b!458647) bm!30131))

(declare-fun m!441991 () Bool)

(assert (=> bm!30131 m!441991))

(declare-fun m!441993 () Bool)

(assert (=> bm!30131 m!441993))

(assert (=> b!458646 m!441991))

(assert (=> b!458646 m!441991))

(declare-fun m!441995 () Bool)

(assert (=> b!458646 m!441995))

(assert (=> b!458648 m!441991))

(assert (=> b!458648 m!441991))

(declare-fun m!441997 () Bool)

(assert (=> b!458648 m!441997))

(assert (=> b!458649 m!441991))

(assert (=> b!458649 m!441991))

(assert (=> b!458649 m!441997))

(assert (=> b!458570 d!74749))

(declare-fun d!74751 () Bool)

(assert (=> d!74751 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!458569 d!74751))

(declare-fun d!74753 () Bool)

(assert (=> d!74753 (= (array_inv!9898 _values!549) (bvsge (size!14028 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41104 d!74753))

(declare-fun d!74755 () Bool)

(assert (=> d!74755 (= (array_inv!9899 _keys!709) (bvsge (size!14027 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41104 d!74755))

(declare-fun d!74757 () Bool)

(declare-fun res!274032 () Bool)

(declare-fun e!267763 () Bool)

(assert (=> d!74757 (=> res!274032 e!267763)))

(assert (=> d!74757 (= res!274032 (= (select (arr!13675 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74757 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!267763)))

(declare-fun b!458654 () Bool)

(declare-fun e!267764 () Bool)

(assert (=> b!458654 (= e!267763 e!267764)))

(declare-fun res!274033 () Bool)

(assert (=> b!458654 (=> (not res!274033) (not e!267764))))

(assert (=> b!458654 (= res!274033 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!14027 _keys!709)))))

(declare-fun b!458655 () Bool)

(assert (=> b!458655 (= e!267764 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74757 (not res!274032)) b!458654))

(assert (= (and b!458654 res!274033) b!458655))

(assert (=> d!74757 m!441991))

(declare-fun m!441999 () Bool)

(assert (=> b!458655 m!441999))

(assert (=> b!458575 d!74757))

(declare-fun b!458680 () Bool)

(declare-fun e!267782 () Bool)

(declare-fun lt!207477 () ListLongMap!7099)

(declare-fun isEmpty!563 (ListLongMap!7099) Bool)

(assert (=> b!458680 (= e!267782 (isEmpty!563 lt!207477))))

(declare-fun b!458681 () Bool)

(declare-fun e!267779 () Bool)

(declare-fun e!267785 () Bool)

(assert (=> b!458681 (= e!267779 e!267785)))

(declare-fun c!56427 () Bool)

(declare-fun e!267783 () Bool)

(assert (=> b!458681 (= c!56427 e!267783)))

(declare-fun res!274043 () Bool)

(assert (=> b!458681 (=> (not res!274043) (not e!267783))))

(assert (=> b!458681 (= res!274043 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14027 _keys!709)))))

(declare-fun call!30137 () ListLongMap!7099)

(declare-fun bm!30134 () Bool)

(assert (=> bm!30134 (= call!30137 (getCurrentListMapNoExtraKeys!1747 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458682 () Bool)

(assert (=> b!458682 (= e!267782 (= lt!207477 (getCurrentListMapNoExtraKeys!1747 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458684 () Bool)

(assert (=> b!458684 (= e!267785 e!267782)))

(declare-fun c!56429 () Bool)

(assert (=> b!458684 (= c!56429 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14027 _keys!709)))))

(declare-fun b!458685 () Bool)

(declare-fun res!274045 () Bool)

(assert (=> b!458685 (=> (not res!274045) (not e!267779))))

(declare-fun contains!2507 (ListLongMap!7099 (_ BitVec 64)) Bool)

(assert (=> b!458685 (= res!274045 (not (contains!2507 lt!207477 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458686 () Bool)

(declare-fun e!267784 () ListLongMap!7099)

(assert (=> b!458686 (= e!267784 call!30137)))

(declare-fun b!458687 () Bool)

(declare-fun e!267780 () ListLongMap!7099)

(assert (=> b!458687 (= e!267780 (ListLongMap!7100 Nil!8255))))

(declare-fun d!74759 () Bool)

(assert (=> d!74759 e!267779))

(declare-fun res!274044 () Bool)

(assert (=> d!74759 (=> (not res!274044) (not e!267779))))

(assert (=> d!74759 (= res!274044 (not (contains!2507 lt!207477 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74759 (= lt!207477 e!267780)))

(declare-fun c!56428 () Bool)

(assert (=> d!74759 (= c!56428 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14027 _keys!709)))))

(assert (=> d!74759 (validMask!0 mask!1025)))

(assert (=> d!74759 (= (getCurrentListMapNoExtraKeys!1747 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207477)))

(declare-fun b!458683 () Bool)

(declare-fun lt!207478 () Unit!13322)

(declare-fun lt!207473 () Unit!13322)

(assert (=> b!458683 (= lt!207478 lt!207473)))

(declare-fun lt!207474 () ListLongMap!7099)

(declare-fun lt!207476 () (_ BitVec 64))

(declare-fun lt!207472 () (_ BitVec 64))

(declare-fun lt!207475 () V!17549)

(assert (=> b!458683 (not (contains!2507 (+!1601 lt!207474 (tuple2!8187 lt!207476 lt!207475)) lt!207472))))

(declare-fun addStillNotContains!149 (ListLongMap!7099 (_ BitVec 64) V!17549 (_ BitVec 64)) Unit!13322)

(assert (=> b!458683 (= lt!207473 (addStillNotContains!149 lt!207474 lt!207476 lt!207475 lt!207472))))

(assert (=> b!458683 (= lt!207472 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458683 (= lt!207475 (get!6739 (select (arr!13676 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458683 (= lt!207476 (select (arr!13675 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!458683 (= lt!207474 call!30137)))

(assert (=> b!458683 (= e!267784 (+!1601 call!30137 (tuple2!8187 (select (arr!13675 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6739 (select (arr!13676 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458688 () Bool)

(declare-fun e!267781 () Bool)

(assert (=> b!458688 (= e!267785 e!267781)))

(assert (=> b!458688 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14027 _keys!709)))))

(declare-fun res!274042 () Bool)

(assert (=> b!458688 (= res!274042 (contains!2507 lt!207477 (select (arr!13675 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458688 (=> (not res!274042) (not e!267781))))

(declare-fun b!458689 () Bool)

(assert (=> b!458689 (= e!267783 (validKeyInArray!0 (select (arr!13675 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458689 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!458690 () Bool)

(assert (=> b!458690 (= e!267780 e!267784)))

(declare-fun c!56430 () Bool)

(assert (=> b!458690 (= c!56430 (validKeyInArray!0 (select (arr!13675 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!458691 () Bool)

(assert (=> b!458691 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14027 _keys!709)))))

(assert (=> b!458691 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14028 _values!549)))))

(declare-fun apply!316 (ListLongMap!7099 (_ BitVec 64)) V!17549)

(assert (=> b!458691 (= e!267781 (= (apply!316 lt!207477 (select (arr!13675 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6739 (select (arr!13676 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!74759 c!56428) b!458687))

(assert (= (and d!74759 (not c!56428)) b!458690))

(assert (= (and b!458690 c!56430) b!458683))

(assert (= (and b!458690 (not c!56430)) b!458686))

(assert (= (or b!458683 b!458686) bm!30134))

(assert (= (and d!74759 res!274044) b!458685))

(assert (= (and b!458685 res!274045) b!458681))

(assert (= (and b!458681 res!274043) b!458689))

(assert (= (and b!458681 c!56427) b!458688))

(assert (= (and b!458681 (not c!56427)) b!458684))

(assert (= (and b!458688 res!274042) b!458691))

(assert (= (and b!458684 c!56429) b!458682))

(assert (= (and b!458684 (not c!56429)) b!458680))

(declare-fun b_lambda!9801 () Bool)

(assert (=> (not b_lambda!9801) (not b!458683)))

(assert (=> b!458683 t!14130))

(declare-fun b_and!19221 () Bool)

(assert (= b_and!19215 (and (=> t!14130 result!7205) b_and!19221)))

(declare-fun b_lambda!9803 () Bool)

(assert (=> (not b_lambda!9803) (not b!458691)))

(assert (=> b!458691 t!14130))

(declare-fun b_and!19223 () Bool)

(assert (= b_and!19221 (and (=> t!14130 result!7205) b_and!19223)))

(declare-fun m!442001 () Bool)

(assert (=> b!458691 m!442001))

(declare-fun m!442003 () Bool)

(assert (=> b!458691 m!442003))

(assert (=> b!458691 m!442003))

(assert (=> b!458691 m!441901))

(declare-fun m!442005 () Bool)

(assert (=> b!458691 m!442005))

(assert (=> b!458691 m!442001))

(declare-fun m!442007 () Bool)

(assert (=> b!458691 m!442007))

(assert (=> b!458691 m!441901))

(declare-fun m!442009 () Bool)

(assert (=> b!458680 m!442009))

(assert (=> b!458689 m!442001))

(assert (=> b!458689 m!442001))

(declare-fun m!442011 () Bool)

(assert (=> b!458689 m!442011))

(declare-fun m!442013 () Bool)

(assert (=> b!458685 m!442013))

(assert (=> b!458683 m!442001))

(assert (=> b!458683 m!442003))

(declare-fun m!442015 () Bool)

(assert (=> b!458683 m!442015))

(declare-fun m!442017 () Bool)

(assert (=> b!458683 m!442017))

(assert (=> b!458683 m!441901))

(assert (=> b!458683 m!442017))

(declare-fun m!442019 () Bool)

(assert (=> b!458683 m!442019))

(assert (=> b!458683 m!442003))

(assert (=> b!458683 m!441901))

(assert (=> b!458683 m!442005))

(declare-fun m!442021 () Bool)

(assert (=> b!458683 m!442021))

(assert (=> b!458688 m!442001))

(assert (=> b!458688 m!442001))

(declare-fun m!442023 () Bool)

(assert (=> b!458688 m!442023))

(declare-fun m!442025 () Bool)

(assert (=> bm!30134 m!442025))

(declare-fun m!442027 () Bool)

(assert (=> d!74759 m!442027))

(assert (=> d!74759 m!441891))

(assert (=> b!458682 m!442025))

(assert (=> b!458690 m!442001))

(assert (=> b!458690 m!442001))

(assert (=> b!458690 m!442011))

(assert (=> b!458567 d!74759))

(declare-fun b!458692 () Bool)

(declare-fun e!267789 () Bool)

(declare-fun lt!207484 () ListLongMap!7099)

(assert (=> b!458692 (= e!267789 (isEmpty!563 lt!207484))))

(declare-fun b!458693 () Bool)

(declare-fun e!267786 () Bool)

(declare-fun e!267792 () Bool)

(assert (=> b!458693 (= e!267786 e!267792)))

(declare-fun c!56431 () Bool)

(declare-fun e!267790 () Bool)

(assert (=> b!458693 (= c!56431 e!267790)))

(declare-fun res!274047 () Bool)

(assert (=> b!458693 (=> (not res!274047) (not e!267790))))

(assert (=> b!458693 (= res!274047 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14027 lt!207430)))))

(declare-fun call!30138 () ListLongMap!7099)

(declare-fun bm!30135 () Bool)

(assert (=> bm!30135 (= call!30138 (getCurrentListMapNoExtraKeys!1747 lt!207430 lt!207433 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458694 () Bool)

(assert (=> b!458694 (= e!267789 (= lt!207484 (getCurrentListMapNoExtraKeys!1747 lt!207430 lt!207433 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458696 () Bool)

(assert (=> b!458696 (= e!267792 e!267789)))

(declare-fun c!56433 () Bool)

(assert (=> b!458696 (= c!56433 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14027 lt!207430)))))

(declare-fun b!458697 () Bool)

(declare-fun res!274049 () Bool)

(assert (=> b!458697 (=> (not res!274049) (not e!267786))))

(assert (=> b!458697 (= res!274049 (not (contains!2507 lt!207484 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458698 () Bool)

(declare-fun e!267791 () ListLongMap!7099)

(assert (=> b!458698 (= e!267791 call!30138)))

(declare-fun b!458699 () Bool)

(declare-fun e!267787 () ListLongMap!7099)

(assert (=> b!458699 (= e!267787 (ListLongMap!7100 Nil!8255))))

(declare-fun d!74761 () Bool)

(assert (=> d!74761 e!267786))

(declare-fun res!274048 () Bool)

(assert (=> d!74761 (=> (not res!274048) (not e!267786))))

(assert (=> d!74761 (= res!274048 (not (contains!2507 lt!207484 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74761 (= lt!207484 e!267787)))

(declare-fun c!56432 () Bool)

(assert (=> d!74761 (= c!56432 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14027 lt!207430)))))

(assert (=> d!74761 (validMask!0 mask!1025)))

(assert (=> d!74761 (= (getCurrentListMapNoExtraKeys!1747 lt!207430 lt!207433 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207484)))

(declare-fun b!458695 () Bool)

(declare-fun lt!207485 () Unit!13322)

(declare-fun lt!207480 () Unit!13322)

(assert (=> b!458695 (= lt!207485 lt!207480)))

(declare-fun lt!207479 () (_ BitVec 64))

(declare-fun lt!207481 () ListLongMap!7099)

(declare-fun lt!207483 () (_ BitVec 64))

(declare-fun lt!207482 () V!17549)

(assert (=> b!458695 (not (contains!2507 (+!1601 lt!207481 (tuple2!8187 lt!207483 lt!207482)) lt!207479))))

(assert (=> b!458695 (= lt!207480 (addStillNotContains!149 lt!207481 lt!207483 lt!207482 lt!207479))))

(assert (=> b!458695 (= lt!207479 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458695 (= lt!207482 (get!6739 (select (arr!13676 lt!207433) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458695 (= lt!207483 (select (arr!13675 lt!207430) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!458695 (= lt!207481 call!30138)))

(assert (=> b!458695 (= e!267791 (+!1601 call!30138 (tuple2!8187 (select (arr!13675 lt!207430) (bvadd #b00000000000000000000000000000001 from!863)) (get!6739 (select (arr!13676 lt!207433) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458700 () Bool)

(declare-fun e!267788 () Bool)

(assert (=> b!458700 (= e!267792 e!267788)))

(assert (=> b!458700 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14027 lt!207430)))))

(declare-fun res!274046 () Bool)

(assert (=> b!458700 (= res!274046 (contains!2507 lt!207484 (select (arr!13675 lt!207430) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458700 (=> (not res!274046) (not e!267788))))

(declare-fun b!458701 () Bool)

(assert (=> b!458701 (= e!267790 (validKeyInArray!0 (select (arr!13675 lt!207430) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!458701 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(declare-fun b!458702 () Bool)

(assert (=> b!458702 (= e!267787 e!267791)))

(declare-fun c!56434 () Bool)

(assert (=> b!458702 (= c!56434 (validKeyInArray!0 (select (arr!13675 lt!207430) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!458703 () Bool)

(assert (=> b!458703 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14027 lt!207430)))))

(assert (=> b!458703 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14028 lt!207433)))))

(assert (=> b!458703 (= e!267788 (= (apply!316 lt!207484 (select (arr!13675 lt!207430) (bvadd #b00000000000000000000000000000001 from!863))) (get!6739 (select (arr!13676 lt!207433) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!74761 c!56432) b!458699))

(assert (= (and d!74761 (not c!56432)) b!458702))

(assert (= (and b!458702 c!56434) b!458695))

(assert (= (and b!458702 (not c!56434)) b!458698))

(assert (= (or b!458695 b!458698) bm!30135))

(assert (= (and d!74761 res!274048) b!458697))

(assert (= (and b!458697 res!274049) b!458693))

(assert (= (and b!458693 res!274047) b!458701))

(assert (= (and b!458693 c!56431) b!458700))

(assert (= (and b!458693 (not c!56431)) b!458696))

(assert (= (and b!458700 res!274046) b!458703))

(assert (= (and b!458696 c!56433) b!458694))

(assert (= (and b!458696 (not c!56433)) b!458692))

(declare-fun b_lambda!9805 () Bool)

(assert (=> (not b_lambda!9805) (not b!458695)))

(assert (=> b!458695 t!14130))

(declare-fun b_and!19225 () Bool)

(assert (= b_and!19223 (and (=> t!14130 result!7205) b_and!19225)))

(declare-fun b_lambda!9807 () Bool)

(assert (=> (not b_lambda!9807) (not b!458703)))

(assert (=> b!458703 t!14130))

(declare-fun b_and!19227 () Bool)

(assert (= b_and!19225 (and (=> t!14130 result!7205) b_and!19227)))

(declare-fun m!442029 () Bool)

(assert (=> b!458703 m!442029))

(declare-fun m!442031 () Bool)

(assert (=> b!458703 m!442031))

(assert (=> b!458703 m!442031))

(assert (=> b!458703 m!441901))

(declare-fun m!442033 () Bool)

(assert (=> b!458703 m!442033))

(assert (=> b!458703 m!442029))

(declare-fun m!442035 () Bool)

(assert (=> b!458703 m!442035))

(assert (=> b!458703 m!441901))

(declare-fun m!442037 () Bool)

(assert (=> b!458692 m!442037))

(assert (=> b!458701 m!442029))

(assert (=> b!458701 m!442029))

(declare-fun m!442039 () Bool)

(assert (=> b!458701 m!442039))

(declare-fun m!442041 () Bool)

(assert (=> b!458697 m!442041))

(assert (=> b!458695 m!442029))

(assert (=> b!458695 m!442031))

(declare-fun m!442043 () Bool)

(assert (=> b!458695 m!442043))

(declare-fun m!442045 () Bool)

(assert (=> b!458695 m!442045))

(assert (=> b!458695 m!441901))

(assert (=> b!458695 m!442045))

(declare-fun m!442047 () Bool)

(assert (=> b!458695 m!442047))

(assert (=> b!458695 m!442031))

(assert (=> b!458695 m!441901))

(assert (=> b!458695 m!442033))

(declare-fun m!442049 () Bool)

(assert (=> b!458695 m!442049))

(assert (=> b!458700 m!442029))

(assert (=> b!458700 m!442029))

(declare-fun m!442051 () Bool)

(assert (=> b!458700 m!442051))

(declare-fun m!442053 () Bool)

(assert (=> bm!30135 m!442053))

(declare-fun m!442055 () Bool)

(assert (=> d!74761 m!442055))

(assert (=> d!74761 m!441891))

(assert (=> b!458694 m!442053))

(assert (=> b!458702 m!442029))

(assert (=> b!458702 m!442029))

(assert (=> b!458702 m!442039))

(assert (=> b!458567 d!74761))

(declare-fun d!74763 () Bool)

(declare-fun e!267795 () Bool)

(assert (=> d!74763 e!267795))

(declare-fun res!274054 () Bool)

(assert (=> d!74763 (=> (not res!274054) (not e!267795))))

(declare-fun lt!207494 () ListLongMap!7099)

(assert (=> d!74763 (= res!274054 (contains!2507 lt!207494 (_1!4104 (tuple2!8187 k0!794 v!412))))))

(declare-fun lt!207496 () List!8258)

(assert (=> d!74763 (= lt!207494 (ListLongMap!7100 lt!207496))))

(declare-fun lt!207497 () Unit!13322)

(declare-fun lt!207495 () Unit!13322)

(assert (=> d!74763 (= lt!207497 lt!207495)))

(declare-datatypes ((Option!379 0))(
  ( (Some!378 (v!8490 V!17549)) (None!377) )
))
(declare-fun getValueByKey!373 (List!8258 (_ BitVec 64)) Option!379)

(assert (=> d!74763 (= (getValueByKey!373 lt!207496 (_1!4104 (tuple2!8187 k0!794 v!412))) (Some!378 (_2!4104 (tuple2!8187 k0!794 v!412))))))

(declare-fun lemmaContainsTupThenGetReturnValue!195 (List!8258 (_ BitVec 64) V!17549) Unit!13322)

(assert (=> d!74763 (= lt!207495 (lemmaContainsTupThenGetReturnValue!195 lt!207496 (_1!4104 (tuple2!8187 k0!794 v!412)) (_2!4104 (tuple2!8187 k0!794 v!412))))))

(declare-fun insertStrictlySorted!198 (List!8258 (_ BitVec 64) V!17549) List!8258)

(assert (=> d!74763 (= lt!207496 (insertStrictlySorted!198 (toList!3565 lt!207432) (_1!4104 (tuple2!8187 k0!794 v!412)) (_2!4104 (tuple2!8187 k0!794 v!412))))))

(assert (=> d!74763 (= (+!1601 lt!207432 (tuple2!8187 k0!794 v!412)) lt!207494)))

(declare-fun b!458708 () Bool)

(declare-fun res!274055 () Bool)

(assert (=> b!458708 (=> (not res!274055) (not e!267795))))

(assert (=> b!458708 (= res!274055 (= (getValueByKey!373 (toList!3565 lt!207494) (_1!4104 (tuple2!8187 k0!794 v!412))) (Some!378 (_2!4104 (tuple2!8187 k0!794 v!412)))))))

(declare-fun b!458709 () Bool)

(declare-fun contains!2508 (List!8258 tuple2!8186) Bool)

(assert (=> b!458709 (= e!267795 (contains!2508 (toList!3565 lt!207494) (tuple2!8187 k0!794 v!412)))))

(assert (= (and d!74763 res!274054) b!458708))

(assert (= (and b!458708 res!274055) b!458709))

(declare-fun m!442057 () Bool)

(assert (=> d!74763 m!442057))

(declare-fun m!442059 () Bool)

(assert (=> d!74763 m!442059))

(declare-fun m!442061 () Bool)

(assert (=> d!74763 m!442061))

(declare-fun m!442063 () Bool)

(assert (=> d!74763 m!442063))

(declare-fun m!442065 () Bool)

(assert (=> b!458708 m!442065))

(declare-fun m!442067 () Bool)

(assert (=> b!458709 m!442067))

(assert (=> b!458567 d!74763))

(declare-fun d!74765 () Bool)

(assert (=> d!74765 (= (validKeyInArray!0 (select (arr!13675 _keys!709) from!863)) (and (not (= (select (arr!13675 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13675 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!458567 d!74765))

(declare-fun d!74767 () Bool)

(declare-fun e!267801 () Bool)

(assert (=> d!74767 e!267801))

(declare-fun res!274058 () Bool)

(assert (=> d!74767 (=> (not res!274058) (not e!267801))))

(assert (=> d!74767 (= res!274058 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14027 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14028 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14027 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14028 _values!549))))))))

(declare-fun lt!207500 () Unit!13322)

(declare-fun choose!1333 (array!28467 array!28469 (_ BitVec 32) (_ BitVec 32) V!17549 V!17549 (_ BitVec 32) (_ BitVec 64) V!17549 (_ BitVec 32) Int) Unit!13322)

(assert (=> d!74767 (= lt!207500 (choose!1333 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74767 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!14027 _keys!709)))))

(assert (=> d!74767 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!760 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!207500)))

(declare-fun bm!30140 () Bool)

(declare-fun call!30144 () ListLongMap!7099)

(assert (=> bm!30140 (= call!30144 (getCurrentListMapNoExtraKeys!1747 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458716 () Bool)

(declare-fun e!267800 () Bool)

(declare-fun call!30143 () ListLongMap!7099)

(assert (=> b!458716 (= e!267800 (= call!30143 call!30144))))

(declare-fun b!458717 () Bool)

(assert (=> b!458717 (= e!267800 (= call!30143 (+!1601 call!30144 (tuple2!8187 k0!794 v!412))))))

(declare-fun bm!30141 () Bool)

(assert (=> bm!30141 (= call!30143 (getCurrentListMapNoExtraKeys!1747 (array!28468 (store (arr!13675 _keys!709) i!563 k0!794) (size!14027 _keys!709)) (array!28470 (store (arr!13676 _values!549) i!563 (ValueCellFull!5823 v!412)) (size!14028 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!458718 () Bool)

(assert (=> b!458718 (= e!267801 e!267800)))

(declare-fun c!56437 () Bool)

(assert (=> b!458718 (= c!56437 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(assert (= (and d!74767 res!274058) b!458718))

(assert (= (and b!458718 c!56437) b!458717))

(assert (= (and b!458718 (not c!56437)) b!458716))

(assert (= (or b!458717 b!458716) bm!30140))

(assert (= (or b!458717 b!458716) bm!30141))

(declare-fun m!442069 () Bool)

(assert (=> d!74767 m!442069))

(assert (=> bm!30140 m!441919))

(declare-fun m!442071 () Bool)

(assert (=> b!458717 m!442071))

(assert (=> bm!30141 m!441909))

(assert (=> bm!30141 m!441933))

(declare-fun m!442073 () Bool)

(assert (=> bm!30141 m!442073))

(assert (=> b!458567 d!74767))

(declare-fun d!74769 () Bool)

(declare-fun e!267802 () Bool)

(assert (=> d!74769 e!267802))

(declare-fun res!274059 () Bool)

(assert (=> d!74769 (=> (not res!274059) (not e!267802))))

(declare-fun lt!207501 () ListLongMap!7099)

(assert (=> d!74769 (= res!274059 (contains!2507 lt!207501 (_1!4104 (tuple2!8187 (select (arr!13675 _keys!709) from!863) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun lt!207503 () List!8258)

(assert (=> d!74769 (= lt!207501 (ListLongMap!7100 lt!207503))))

(declare-fun lt!207504 () Unit!13322)

(declare-fun lt!207502 () Unit!13322)

(assert (=> d!74769 (= lt!207504 lt!207502)))

(assert (=> d!74769 (= (getValueByKey!373 lt!207503 (_1!4104 (tuple2!8187 (select (arr!13675 _keys!709) from!863) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!378 (_2!4104 (tuple2!8187 (select (arr!13675 _keys!709) from!863) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74769 (= lt!207502 (lemmaContainsTupThenGetReturnValue!195 lt!207503 (_1!4104 (tuple2!8187 (select (arr!13675 _keys!709) from!863) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4104 (tuple2!8187 (select (arr!13675 _keys!709) from!863) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74769 (= lt!207503 (insertStrictlySorted!198 (toList!3565 lt!207428) (_1!4104 (tuple2!8187 (select (arr!13675 _keys!709) from!863) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) (_2!4104 (tuple2!8187 (select (arr!13675 _keys!709) from!863) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))))

(assert (=> d!74769 (= (+!1601 lt!207428 (tuple2!8187 (select (arr!13675 _keys!709) from!863) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))) lt!207501)))

(declare-fun b!458719 () Bool)

(declare-fun res!274060 () Bool)

(assert (=> b!458719 (=> (not res!274060) (not e!267802))))

(assert (=> b!458719 (= res!274060 (= (getValueByKey!373 (toList!3565 lt!207501) (_1!4104 (tuple2!8187 (select (arr!13675 _keys!709) from!863) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))) (Some!378 (_2!4104 (tuple2!8187 (select (arr!13675 _keys!709) from!863) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!458720 () Bool)

(assert (=> b!458720 (= e!267802 (contains!2508 (toList!3565 lt!207501) (tuple2!8187 (select (arr!13675 _keys!709) from!863) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and d!74769 res!274059) b!458719))

(assert (= (and b!458719 res!274060) b!458720))

(declare-fun m!442075 () Bool)

(assert (=> d!74769 m!442075))

(declare-fun m!442077 () Bool)

(assert (=> d!74769 m!442077))

(declare-fun m!442079 () Bool)

(assert (=> d!74769 m!442079))

(declare-fun m!442081 () Bool)

(assert (=> d!74769 m!442081))

(declare-fun m!442083 () Bool)

(assert (=> b!458719 m!442083))

(declare-fun m!442085 () Bool)

(assert (=> b!458720 m!442085))

(assert (=> b!458576 d!74769))

(declare-fun d!74771 () Bool)

(declare-fun c!56440 () Bool)

(assert (=> d!74771 (= c!56440 ((_ is ValueCellFull!5823) (select (arr!13676 _values!549) from!863)))))

(declare-fun e!267805 () V!17549)

(assert (=> d!74771 (= (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)) e!267805)))

(declare-fun b!458725 () Bool)

(declare-fun get!6740 (ValueCell!5823 V!17549) V!17549)

(assert (=> b!458725 (= e!267805 (get!6740 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458726 () Bool)

(declare-fun get!6741 (ValueCell!5823 V!17549) V!17549)

(assert (=> b!458726 (= e!267805 (get!6741 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!74771 c!56440) b!458725))

(assert (= (and d!74771 (not c!56440)) b!458726))

(assert (=> b!458725 m!441899))

(assert (=> b!458725 m!441901))

(declare-fun m!442087 () Bool)

(assert (=> b!458725 m!442087))

(assert (=> b!458726 m!441899))

(assert (=> b!458726 m!441901))

(declare-fun m!442089 () Bool)

(assert (=> b!458726 m!442089))

(assert (=> b!458576 d!74771))

(declare-fun b!458735 () Bool)

(declare-fun e!267813 () Bool)

(declare-fun e!267812 () Bool)

(assert (=> b!458735 (= e!267813 e!267812)))

(declare-fun lt!207511 () (_ BitVec 64))

(assert (=> b!458735 (= lt!207511 (select (arr!13675 lt!207430) #b00000000000000000000000000000000))))

(declare-fun lt!207513 () Unit!13322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28467 (_ BitVec 64) (_ BitVec 32)) Unit!13322)

(assert (=> b!458735 (= lt!207513 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!207430 lt!207511 #b00000000000000000000000000000000))))

(assert (=> b!458735 (arrayContainsKey!0 lt!207430 lt!207511 #b00000000000000000000000000000000)))

(declare-fun lt!207512 () Unit!13322)

(assert (=> b!458735 (= lt!207512 lt!207513)))

(declare-fun res!274066 () Bool)

(declare-datatypes ((SeekEntryResult!3535 0))(
  ( (MissingZero!3535 (index!16319 (_ BitVec 32))) (Found!3535 (index!16320 (_ BitVec 32))) (Intermediate!3535 (undefined!4347 Bool) (index!16321 (_ BitVec 32)) (x!42805 (_ BitVec 32))) (Undefined!3535) (MissingVacant!3535 (index!16322 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28467 (_ BitVec 32)) SeekEntryResult!3535)

(assert (=> b!458735 (= res!274066 (= (seekEntryOrOpen!0 (select (arr!13675 lt!207430) #b00000000000000000000000000000000) lt!207430 mask!1025) (Found!3535 #b00000000000000000000000000000000)))))

(assert (=> b!458735 (=> (not res!274066) (not e!267812))))

(declare-fun b!458736 () Bool)

(declare-fun e!267814 () Bool)

(assert (=> b!458736 (= e!267814 e!267813)))

(declare-fun c!56443 () Bool)

(assert (=> b!458736 (= c!56443 (validKeyInArray!0 (select (arr!13675 lt!207430) #b00000000000000000000000000000000)))))

(declare-fun b!458737 () Bool)

(declare-fun call!30147 () Bool)

(assert (=> b!458737 (= e!267812 call!30147)))

(declare-fun d!74773 () Bool)

(declare-fun res!274065 () Bool)

(assert (=> d!74773 (=> res!274065 e!267814)))

(assert (=> d!74773 (= res!274065 (bvsge #b00000000000000000000000000000000 (size!14027 lt!207430)))))

(assert (=> d!74773 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!207430 mask!1025) e!267814)))

(declare-fun b!458738 () Bool)

(assert (=> b!458738 (= e!267813 call!30147)))

(declare-fun bm!30144 () Bool)

(assert (=> bm!30144 (= call!30147 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!207430 mask!1025))))

(assert (= (and d!74773 (not res!274065)) b!458736))

(assert (= (and b!458736 c!56443) b!458735))

(assert (= (and b!458736 (not c!56443)) b!458738))

(assert (= (and b!458735 res!274066) b!458737))

(assert (= (or b!458737 b!458738) bm!30144))

(declare-fun m!442091 () Bool)

(assert (=> b!458735 m!442091))

(declare-fun m!442093 () Bool)

(assert (=> b!458735 m!442093))

(declare-fun m!442095 () Bool)

(assert (=> b!458735 m!442095))

(assert (=> b!458735 m!442091))

(declare-fun m!442097 () Bool)

(assert (=> b!458735 m!442097))

(assert (=> b!458736 m!442091))

(assert (=> b!458736 m!442091))

(declare-fun m!442099 () Bool)

(assert (=> b!458736 m!442099))

(declare-fun m!442101 () Bool)

(assert (=> bm!30144 m!442101))

(assert (=> b!458564 d!74773))

(declare-fun d!74775 () Bool)

(declare-fun res!274067 () Bool)

(declare-fun e!267815 () Bool)

(assert (=> d!74775 (=> res!274067 e!267815)))

(assert (=> d!74775 (= res!274067 (= (select (arr!13675 _keys!709) from!863) k0!794))))

(assert (=> d!74775 (= (arrayContainsKey!0 _keys!709 k0!794 from!863) e!267815)))

(declare-fun b!458739 () Bool)

(declare-fun e!267816 () Bool)

(assert (=> b!458739 (= e!267815 e!267816)))

(declare-fun res!274068 () Bool)

(assert (=> b!458739 (=> (not res!274068) (not e!267816))))

(assert (=> b!458739 (= res!274068 (bvslt (bvadd from!863 #b00000000000000000000000000000001) (size!14027 _keys!709)))))

(declare-fun b!458740 () Bool)

(assert (=> b!458740 (= e!267816 (arrayContainsKey!0 _keys!709 k0!794 (bvadd from!863 #b00000000000000000000000000000001)))))

(assert (= (and d!74775 (not res!274067)) b!458739))

(assert (= (and b!458739 res!274068) b!458740))

(assert (=> d!74775 m!441897))

(declare-fun m!442103 () Bool)

(assert (=> b!458740 m!442103))

(assert (=> b!458572 d!74775))

(declare-fun d!74777 () Bool)

(assert (=> d!74777 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!458563 d!74777))

(declare-fun bm!30145 () Bool)

(declare-fun call!30148 () Bool)

(declare-fun c!56444 () Bool)

(assert (=> bm!30145 (= call!30148 (arrayNoDuplicates!0 lt!207430 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56444 (Cons!8253 (select (arr!13675 lt!207430) #b00000000000000000000000000000000) Nil!8254) Nil!8254)))))

(declare-fun d!74779 () Bool)

(declare-fun res!274070 () Bool)

(declare-fun e!267818 () Bool)

(assert (=> d!74779 (=> res!274070 e!267818)))

(assert (=> d!74779 (= res!274070 (bvsge #b00000000000000000000000000000000 (size!14027 lt!207430)))))

(assert (=> d!74779 (= (arrayNoDuplicates!0 lt!207430 #b00000000000000000000000000000000 Nil!8254) e!267818)))

(declare-fun b!458741 () Bool)

(declare-fun e!267817 () Bool)

(assert (=> b!458741 (= e!267817 call!30148)))

(declare-fun b!458742 () Bool)

(declare-fun e!267820 () Bool)

(assert (=> b!458742 (= e!267820 (contains!2506 Nil!8254 (select (arr!13675 lt!207430) #b00000000000000000000000000000000)))))

(declare-fun b!458743 () Bool)

(assert (=> b!458743 (= e!267817 call!30148)))

(declare-fun b!458744 () Bool)

(declare-fun e!267819 () Bool)

(assert (=> b!458744 (= e!267818 e!267819)))

(declare-fun res!274071 () Bool)

(assert (=> b!458744 (=> (not res!274071) (not e!267819))))

(assert (=> b!458744 (= res!274071 (not e!267820))))

(declare-fun res!274069 () Bool)

(assert (=> b!458744 (=> (not res!274069) (not e!267820))))

(assert (=> b!458744 (= res!274069 (validKeyInArray!0 (select (arr!13675 lt!207430) #b00000000000000000000000000000000)))))

(declare-fun b!458745 () Bool)

(assert (=> b!458745 (= e!267819 e!267817)))

(assert (=> b!458745 (= c!56444 (validKeyInArray!0 (select (arr!13675 lt!207430) #b00000000000000000000000000000000)))))

(assert (= (and d!74779 (not res!274070)) b!458744))

(assert (= (and b!458744 res!274069) b!458742))

(assert (= (and b!458744 res!274071) b!458745))

(assert (= (and b!458745 c!56444) b!458741))

(assert (= (and b!458745 (not c!56444)) b!458743))

(assert (= (or b!458741 b!458743) bm!30145))

(assert (=> bm!30145 m!442091))

(declare-fun m!442105 () Bool)

(assert (=> bm!30145 m!442105))

(assert (=> b!458742 m!442091))

(assert (=> b!458742 m!442091))

(declare-fun m!442107 () Bool)

(assert (=> b!458742 m!442107))

(assert (=> b!458744 m!442091))

(assert (=> b!458744 m!442091))

(assert (=> b!458744 m!442099))

(assert (=> b!458745 m!442091))

(assert (=> b!458745 m!442091))

(assert (=> b!458745 m!442099))

(assert (=> b!458561 d!74779))

(declare-fun b!458746 () Bool)

(declare-fun e!267824 () Bool)

(declare-fun lt!207519 () ListLongMap!7099)

(assert (=> b!458746 (= e!267824 (isEmpty!563 lt!207519))))

(declare-fun b!458747 () Bool)

(declare-fun e!267821 () Bool)

(declare-fun e!267827 () Bool)

(assert (=> b!458747 (= e!267821 e!267827)))

(declare-fun c!56445 () Bool)

(declare-fun e!267825 () Bool)

(assert (=> b!458747 (= c!56445 e!267825)))

(declare-fun res!274073 () Bool)

(assert (=> b!458747 (=> (not res!274073) (not e!267825))))

(assert (=> b!458747 (= res!274073 (bvslt from!863 (size!14027 lt!207430)))))

(declare-fun call!30149 () ListLongMap!7099)

(declare-fun bm!30146 () Bool)

(assert (=> bm!30146 (= call!30149 (getCurrentListMapNoExtraKeys!1747 lt!207430 lt!207433 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458748 () Bool)

(assert (=> b!458748 (= e!267824 (= lt!207519 (getCurrentListMapNoExtraKeys!1747 lt!207430 lt!207433 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458750 () Bool)

(assert (=> b!458750 (= e!267827 e!267824)))

(declare-fun c!56447 () Bool)

(assert (=> b!458750 (= c!56447 (bvslt from!863 (size!14027 lt!207430)))))

(declare-fun b!458751 () Bool)

(declare-fun res!274075 () Bool)

(assert (=> b!458751 (=> (not res!274075) (not e!267821))))

(assert (=> b!458751 (= res!274075 (not (contains!2507 lt!207519 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458752 () Bool)

(declare-fun e!267826 () ListLongMap!7099)

(assert (=> b!458752 (= e!267826 call!30149)))

(declare-fun b!458753 () Bool)

(declare-fun e!267822 () ListLongMap!7099)

(assert (=> b!458753 (= e!267822 (ListLongMap!7100 Nil!8255))))

(declare-fun d!74781 () Bool)

(assert (=> d!74781 e!267821))

(declare-fun res!274074 () Bool)

(assert (=> d!74781 (=> (not res!274074) (not e!267821))))

(assert (=> d!74781 (= res!274074 (not (contains!2507 lt!207519 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74781 (= lt!207519 e!267822)))

(declare-fun c!56446 () Bool)

(assert (=> d!74781 (= c!56446 (bvsge from!863 (size!14027 lt!207430)))))

(assert (=> d!74781 (validMask!0 mask!1025)))

(assert (=> d!74781 (= (getCurrentListMapNoExtraKeys!1747 lt!207430 lt!207433 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!207519)))

(declare-fun b!458749 () Bool)

(declare-fun lt!207520 () Unit!13322)

(declare-fun lt!207515 () Unit!13322)

(assert (=> b!458749 (= lt!207520 lt!207515)))

(declare-fun lt!207517 () V!17549)

(declare-fun lt!207518 () (_ BitVec 64))

(declare-fun lt!207514 () (_ BitVec 64))

(declare-fun lt!207516 () ListLongMap!7099)

(assert (=> b!458749 (not (contains!2507 (+!1601 lt!207516 (tuple2!8187 lt!207518 lt!207517)) lt!207514))))

(assert (=> b!458749 (= lt!207515 (addStillNotContains!149 lt!207516 lt!207518 lt!207517 lt!207514))))

(assert (=> b!458749 (= lt!207514 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458749 (= lt!207517 (get!6739 (select (arr!13676 lt!207433) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458749 (= lt!207518 (select (arr!13675 lt!207430) from!863))))

(assert (=> b!458749 (= lt!207516 call!30149)))

(assert (=> b!458749 (= e!267826 (+!1601 call!30149 (tuple2!8187 (select (arr!13675 lt!207430) from!863) (get!6739 (select (arr!13676 lt!207433) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458754 () Bool)

(declare-fun e!267823 () Bool)

(assert (=> b!458754 (= e!267827 e!267823)))

(assert (=> b!458754 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14027 lt!207430)))))

(declare-fun res!274072 () Bool)

(assert (=> b!458754 (= res!274072 (contains!2507 lt!207519 (select (arr!13675 lt!207430) from!863)))))

(assert (=> b!458754 (=> (not res!274072) (not e!267823))))

(declare-fun b!458755 () Bool)

(assert (=> b!458755 (= e!267825 (validKeyInArray!0 (select (arr!13675 lt!207430) from!863)))))

(assert (=> b!458755 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!458756 () Bool)

(assert (=> b!458756 (= e!267822 e!267826)))

(declare-fun c!56448 () Bool)

(assert (=> b!458756 (= c!56448 (validKeyInArray!0 (select (arr!13675 lt!207430) from!863)))))

(declare-fun b!458757 () Bool)

(assert (=> b!458757 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14027 lt!207430)))))

(assert (=> b!458757 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14028 lt!207433)))))

(assert (=> b!458757 (= e!267823 (= (apply!316 lt!207519 (select (arr!13675 lt!207430) from!863)) (get!6739 (select (arr!13676 lt!207433) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!74781 c!56446) b!458753))

(assert (= (and d!74781 (not c!56446)) b!458756))

(assert (= (and b!458756 c!56448) b!458749))

(assert (= (and b!458756 (not c!56448)) b!458752))

(assert (= (or b!458749 b!458752) bm!30146))

(assert (= (and d!74781 res!274074) b!458751))

(assert (= (and b!458751 res!274075) b!458747))

(assert (= (and b!458747 res!274073) b!458755))

(assert (= (and b!458747 c!56445) b!458754))

(assert (= (and b!458747 (not c!56445)) b!458750))

(assert (= (and b!458754 res!274072) b!458757))

(assert (= (and b!458750 c!56447) b!458748))

(assert (= (and b!458750 (not c!56447)) b!458746))

(declare-fun b_lambda!9809 () Bool)

(assert (=> (not b_lambda!9809) (not b!458749)))

(assert (=> b!458749 t!14130))

(declare-fun b_and!19229 () Bool)

(assert (= b_and!19227 (and (=> t!14130 result!7205) b_and!19229)))

(declare-fun b_lambda!9811 () Bool)

(assert (=> (not b_lambda!9811) (not b!458757)))

(assert (=> b!458757 t!14130))

(declare-fun b_and!19231 () Bool)

(assert (= b_and!19229 (and (=> t!14130 result!7205) b_and!19231)))

(declare-fun m!442109 () Bool)

(assert (=> b!458757 m!442109))

(declare-fun m!442111 () Bool)

(assert (=> b!458757 m!442111))

(assert (=> b!458757 m!442111))

(assert (=> b!458757 m!441901))

(declare-fun m!442113 () Bool)

(assert (=> b!458757 m!442113))

(assert (=> b!458757 m!442109))

(declare-fun m!442115 () Bool)

(assert (=> b!458757 m!442115))

(assert (=> b!458757 m!441901))

(declare-fun m!442117 () Bool)

(assert (=> b!458746 m!442117))

(assert (=> b!458755 m!442109))

(assert (=> b!458755 m!442109))

(declare-fun m!442119 () Bool)

(assert (=> b!458755 m!442119))

(declare-fun m!442121 () Bool)

(assert (=> b!458751 m!442121))

(assert (=> b!458749 m!442109))

(assert (=> b!458749 m!442111))

(declare-fun m!442123 () Bool)

(assert (=> b!458749 m!442123))

(declare-fun m!442125 () Bool)

(assert (=> b!458749 m!442125))

(assert (=> b!458749 m!441901))

(assert (=> b!458749 m!442125))

(declare-fun m!442127 () Bool)

(assert (=> b!458749 m!442127))

(assert (=> b!458749 m!442111))

(assert (=> b!458749 m!441901))

(assert (=> b!458749 m!442113))

(declare-fun m!442129 () Bool)

(assert (=> b!458749 m!442129))

(assert (=> b!458754 m!442109))

(assert (=> b!458754 m!442109))

(declare-fun m!442131 () Bool)

(assert (=> b!458754 m!442131))

(declare-fun m!442133 () Bool)

(assert (=> bm!30146 m!442133))

(declare-fun m!442135 () Bool)

(assert (=> d!74781 m!442135))

(assert (=> d!74781 m!441891))

(assert (=> b!458748 m!442133))

(assert (=> b!458756 m!442109))

(assert (=> b!458756 m!442109))

(assert (=> b!458756 m!442119))

(assert (=> b!458571 d!74781))

(declare-fun b!458758 () Bool)

(declare-fun e!267831 () Bool)

(declare-fun lt!207526 () ListLongMap!7099)

(assert (=> b!458758 (= e!267831 (isEmpty!563 lt!207526))))

(declare-fun b!458759 () Bool)

(declare-fun e!267828 () Bool)

(declare-fun e!267834 () Bool)

(assert (=> b!458759 (= e!267828 e!267834)))

(declare-fun c!56449 () Bool)

(declare-fun e!267832 () Bool)

(assert (=> b!458759 (= c!56449 e!267832)))

(declare-fun res!274077 () Bool)

(assert (=> b!458759 (=> (not res!274077) (not e!267832))))

(assert (=> b!458759 (= res!274077 (bvslt from!863 (size!14027 _keys!709)))))

(declare-fun call!30150 () ListLongMap!7099)

(declare-fun bm!30147 () Bool)

(assert (=> bm!30147 (= call!30150 (getCurrentListMapNoExtraKeys!1747 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!458760 () Bool)

(assert (=> b!458760 (= e!267831 (= lt!207526 (getCurrentListMapNoExtraKeys!1747 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!458762 () Bool)

(assert (=> b!458762 (= e!267834 e!267831)))

(declare-fun c!56451 () Bool)

(assert (=> b!458762 (= c!56451 (bvslt from!863 (size!14027 _keys!709)))))

(declare-fun b!458763 () Bool)

(declare-fun res!274079 () Bool)

(assert (=> b!458763 (=> (not res!274079) (not e!267828))))

(assert (=> b!458763 (= res!274079 (not (contains!2507 lt!207526 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!458764 () Bool)

(declare-fun e!267833 () ListLongMap!7099)

(assert (=> b!458764 (= e!267833 call!30150)))

(declare-fun b!458765 () Bool)

(declare-fun e!267829 () ListLongMap!7099)

(assert (=> b!458765 (= e!267829 (ListLongMap!7100 Nil!8255))))

(declare-fun d!74783 () Bool)

(assert (=> d!74783 e!267828))

(declare-fun res!274078 () Bool)

(assert (=> d!74783 (=> (not res!274078) (not e!267828))))

(assert (=> d!74783 (= res!274078 (not (contains!2507 lt!207526 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74783 (= lt!207526 e!267829)))

(declare-fun c!56450 () Bool)

(assert (=> d!74783 (= c!56450 (bvsge from!863 (size!14027 _keys!709)))))

(assert (=> d!74783 (validMask!0 mask!1025)))

(assert (=> d!74783 (= (getCurrentListMapNoExtraKeys!1747 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!207526)))

(declare-fun b!458761 () Bool)

(declare-fun lt!207527 () Unit!13322)

(declare-fun lt!207522 () Unit!13322)

(assert (=> b!458761 (= lt!207527 lt!207522)))

(declare-fun lt!207521 () (_ BitVec 64))

(declare-fun lt!207524 () V!17549)

(declare-fun lt!207525 () (_ BitVec 64))

(declare-fun lt!207523 () ListLongMap!7099)

(assert (=> b!458761 (not (contains!2507 (+!1601 lt!207523 (tuple2!8187 lt!207525 lt!207524)) lt!207521))))

(assert (=> b!458761 (= lt!207522 (addStillNotContains!149 lt!207523 lt!207525 lt!207524 lt!207521))))

(assert (=> b!458761 (= lt!207521 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!458761 (= lt!207524 (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!458761 (= lt!207525 (select (arr!13675 _keys!709) from!863))))

(assert (=> b!458761 (= lt!207523 call!30150)))

(assert (=> b!458761 (= e!267833 (+!1601 call!30150 (tuple2!8187 (select (arr!13675 _keys!709) from!863) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!458766 () Bool)

(declare-fun e!267830 () Bool)

(assert (=> b!458766 (= e!267834 e!267830)))

(assert (=> b!458766 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14027 _keys!709)))))

(declare-fun res!274076 () Bool)

(assert (=> b!458766 (= res!274076 (contains!2507 lt!207526 (select (arr!13675 _keys!709) from!863)))))

(assert (=> b!458766 (=> (not res!274076) (not e!267830))))

(declare-fun b!458767 () Bool)

(assert (=> b!458767 (= e!267832 (validKeyInArray!0 (select (arr!13675 _keys!709) from!863)))))

(assert (=> b!458767 (bvsge from!863 #b00000000000000000000000000000000)))

(declare-fun b!458768 () Bool)

(assert (=> b!458768 (= e!267829 e!267833)))

(declare-fun c!56452 () Bool)

(assert (=> b!458768 (= c!56452 (validKeyInArray!0 (select (arr!13675 _keys!709) from!863)))))

(declare-fun b!458769 () Bool)

(assert (=> b!458769 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14027 _keys!709)))))

(assert (=> b!458769 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14028 _values!549)))))

(assert (=> b!458769 (= e!267830 (= (apply!316 lt!207526 (select (arr!13675 _keys!709) from!863)) (get!6739 (select (arr!13676 _values!549) from!863) (dynLambda!889 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!74783 c!56450) b!458765))

(assert (= (and d!74783 (not c!56450)) b!458768))

(assert (= (and b!458768 c!56452) b!458761))

(assert (= (and b!458768 (not c!56452)) b!458764))

(assert (= (or b!458761 b!458764) bm!30147))

(assert (= (and d!74783 res!274078) b!458763))

(assert (= (and b!458763 res!274079) b!458759))

(assert (= (and b!458759 res!274077) b!458767))

(assert (= (and b!458759 c!56449) b!458766))

(assert (= (and b!458759 (not c!56449)) b!458762))

(assert (= (and b!458766 res!274076) b!458769))

(assert (= (and b!458762 c!56451) b!458760))

(assert (= (and b!458762 (not c!56451)) b!458758))

(declare-fun b_lambda!9813 () Bool)

(assert (=> (not b_lambda!9813) (not b!458761)))

(assert (=> b!458761 t!14130))

(declare-fun b_and!19233 () Bool)

(assert (= b_and!19231 (and (=> t!14130 result!7205) b_and!19233)))

(declare-fun b_lambda!9815 () Bool)

(assert (=> (not b_lambda!9815) (not b!458769)))

(assert (=> b!458769 t!14130))

(declare-fun b_and!19235 () Bool)

(assert (= b_and!19233 (and (=> t!14130 result!7205) b_and!19235)))

(assert (=> b!458769 m!441897))

(assert (=> b!458769 m!441899))

(assert (=> b!458769 m!441899))

(assert (=> b!458769 m!441901))

(assert (=> b!458769 m!441903))

(assert (=> b!458769 m!441897))

(declare-fun m!442137 () Bool)

(assert (=> b!458769 m!442137))

(assert (=> b!458769 m!441901))

(declare-fun m!442139 () Bool)

(assert (=> b!458758 m!442139))

(assert (=> b!458767 m!441897))

(assert (=> b!458767 m!441897))

(assert (=> b!458767 m!441923))

(declare-fun m!442141 () Bool)

(assert (=> b!458763 m!442141))

(assert (=> b!458761 m!441897))

(assert (=> b!458761 m!441899))

(declare-fun m!442143 () Bool)

(assert (=> b!458761 m!442143))

(declare-fun m!442145 () Bool)

(assert (=> b!458761 m!442145))

(assert (=> b!458761 m!441901))

(assert (=> b!458761 m!442145))

(declare-fun m!442147 () Bool)

(assert (=> b!458761 m!442147))

(assert (=> b!458761 m!441899))

(assert (=> b!458761 m!441901))

(assert (=> b!458761 m!441903))

(declare-fun m!442149 () Bool)

(assert (=> b!458761 m!442149))

(assert (=> b!458766 m!441897))

(assert (=> b!458766 m!441897))

(declare-fun m!442151 () Bool)

(assert (=> b!458766 m!442151))

(declare-fun m!442153 () Bool)

(assert (=> bm!30147 m!442153))

(declare-fun m!442155 () Bool)

(assert (=> d!74783 m!442155))

(assert (=> d!74783 m!441891))

(assert (=> b!458760 m!442153))

(assert (=> b!458768 m!441897))

(assert (=> b!458768 m!441897))

(assert (=> b!458768 m!441923))

(assert (=> b!458571 d!74783))

(declare-fun b!458770 () Bool)

(declare-fun e!267836 () Bool)

(declare-fun e!267835 () Bool)

(assert (=> b!458770 (= e!267836 e!267835)))

(declare-fun lt!207528 () (_ BitVec 64))

(assert (=> b!458770 (= lt!207528 (select (arr!13675 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!207530 () Unit!13322)

(assert (=> b!458770 (= lt!207530 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!207528 #b00000000000000000000000000000000))))

(assert (=> b!458770 (arrayContainsKey!0 _keys!709 lt!207528 #b00000000000000000000000000000000)))

(declare-fun lt!207529 () Unit!13322)

(assert (=> b!458770 (= lt!207529 lt!207530)))

(declare-fun res!274081 () Bool)

(assert (=> b!458770 (= res!274081 (= (seekEntryOrOpen!0 (select (arr!13675 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3535 #b00000000000000000000000000000000)))))

(assert (=> b!458770 (=> (not res!274081) (not e!267835))))

(declare-fun b!458771 () Bool)

(declare-fun e!267837 () Bool)

(assert (=> b!458771 (= e!267837 e!267836)))

(declare-fun c!56453 () Bool)

(assert (=> b!458771 (= c!56453 (validKeyInArray!0 (select (arr!13675 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!458772 () Bool)

(declare-fun call!30151 () Bool)

(assert (=> b!458772 (= e!267835 call!30151)))

(declare-fun d!74785 () Bool)

(declare-fun res!274080 () Bool)

(assert (=> d!74785 (=> res!274080 e!267837)))

(assert (=> d!74785 (= res!274080 (bvsge #b00000000000000000000000000000000 (size!14027 _keys!709)))))

(assert (=> d!74785 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!267837)))

(declare-fun b!458773 () Bool)

(assert (=> b!458773 (= e!267836 call!30151)))

(declare-fun bm!30148 () Bool)

(assert (=> bm!30148 (= call!30151 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(assert (= (and d!74785 (not res!274080)) b!458771))

(assert (= (and b!458771 c!56453) b!458770))

(assert (= (and b!458771 (not c!56453)) b!458773))

(assert (= (and b!458770 res!274081) b!458772))

(assert (= (or b!458772 b!458773) bm!30148))

(assert (=> b!458770 m!441991))

(declare-fun m!442157 () Bool)

(assert (=> b!458770 m!442157))

(declare-fun m!442159 () Bool)

(assert (=> b!458770 m!442159))

(assert (=> b!458770 m!441991))

(declare-fun m!442161 () Bool)

(assert (=> b!458770 m!442161))

(assert (=> b!458771 m!441991))

(assert (=> b!458771 m!441991))

(assert (=> b!458771 m!441997))

(declare-fun m!442163 () Bool)

(assert (=> bm!30148 m!442163))

(assert (=> b!458562 d!74785))

(declare-fun b!458781 () Bool)

(declare-fun e!267842 () Bool)

(assert (=> b!458781 (= e!267842 tp_is_empty!12333)))

(declare-fun condMapEmpty!20152 () Bool)

(declare-fun mapDefault!20152 () ValueCell!5823)

(assert (=> mapNonEmpty!20146 (= condMapEmpty!20152 (= mapRest!20146 ((as const (Array (_ BitVec 32) ValueCell!5823)) mapDefault!20152)))))

(declare-fun mapRes!20152 () Bool)

(assert (=> mapNonEmpty!20146 (= tp!38818 (and e!267842 mapRes!20152))))

(declare-fun b!458780 () Bool)

(declare-fun e!267843 () Bool)

(assert (=> b!458780 (= e!267843 tp_is_empty!12333)))

(declare-fun mapIsEmpty!20152 () Bool)

(assert (=> mapIsEmpty!20152 mapRes!20152))

(declare-fun mapNonEmpty!20152 () Bool)

(declare-fun tp!38827 () Bool)

(assert (=> mapNonEmpty!20152 (= mapRes!20152 (and tp!38827 e!267843))))

(declare-fun mapRest!20152 () (Array (_ BitVec 32) ValueCell!5823))

(declare-fun mapKey!20152 () (_ BitVec 32))

(declare-fun mapValue!20152 () ValueCell!5823)

(assert (=> mapNonEmpty!20152 (= mapRest!20146 (store mapRest!20152 mapKey!20152 mapValue!20152))))

(assert (= (and mapNonEmpty!20146 condMapEmpty!20152) mapIsEmpty!20152))

(assert (= (and mapNonEmpty!20146 (not condMapEmpty!20152)) mapNonEmpty!20152))

(assert (= (and mapNonEmpty!20152 ((_ is ValueCellFull!5823) mapValue!20152)) b!458780))

(assert (= (and mapNonEmpty!20146 ((_ is ValueCellFull!5823) mapDefault!20152)) b!458781))

(declare-fun m!442165 () Bool)

(assert (=> mapNonEmpty!20152 m!442165))

(declare-fun b_lambda!9817 () Bool)

(assert (= b_lambda!9801 (or (and start!41104 b_free!10995) b_lambda!9817)))

(declare-fun b_lambda!9819 () Bool)

(assert (= b_lambda!9813 (or (and start!41104 b_free!10995) b_lambda!9819)))

(declare-fun b_lambda!9821 () Bool)

(assert (= b_lambda!9809 (or (and start!41104 b_free!10995) b_lambda!9821)))

(declare-fun b_lambda!9823 () Bool)

(assert (= b_lambda!9803 (or (and start!41104 b_free!10995) b_lambda!9823)))

(declare-fun b_lambda!9825 () Bool)

(assert (= b_lambda!9815 (or (and start!41104 b_free!10995) b_lambda!9825)))

(declare-fun b_lambda!9827 () Bool)

(assert (= b_lambda!9805 (or (and start!41104 b_free!10995) b_lambda!9827)))

(declare-fun b_lambda!9829 () Bool)

(assert (= b_lambda!9807 (or (and start!41104 b_free!10995) b_lambda!9829)))

(declare-fun b_lambda!9831 () Bool)

(assert (= b_lambda!9811 (or (and start!41104 b_free!10995) b_lambda!9831)))

(check-sat (not b!458648) (not b_next!10995) (not b!458755) (not b!458740) (not b!458754) tp_is_empty!12333 (not b!458756) (not b!458766) (not b!458683) (not b_lambda!9821) (not b!458725) (not b_lambda!9825) (not b!458742) (not b!458735) (not bm!30148) (not b!458767) (not d!74759) (not b_lambda!9829) (not d!74763) (not b_lambda!9823) (not b!458745) (not b!458708) (not b!458682) (not bm!30135) (not b!458700) (not b!458701) (not b!458760) (not b!458769) (not b!458763) (not bm!30141) (not b!458758) (not b!458694) b_and!19235 (not b!458692) (not d!74781) (not b!458685) (not b_lambda!9831) (not b!458749) (not d!74767) (not b!458736) (not b!458695) (not b!458719) (not bm!30140) (not d!74769) (not b!458709) (not b!458751) (not bm!30144) (not bm!30147) (not d!74761) (not bm!30146) (not b_lambda!9799) (not b!458757) (not b!458649) (not b!458680) (not b!458688) (not bm!30131) (not b!458697) (not b!458691) (not b!458748) (not b_lambda!9819) (not b_lambda!9827) (not b!458746) (not b!458690) (not bm!30134) (not bm!30145) (not b!458726) (not b!458761) (not b!458689) (not b_lambda!9817) (not b!458720) (not b!458771) (not b!458646) (not b!458702) (not d!74783) (not b!458703) (not mapNonEmpty!20152) (not b!458768) (not b!458744) (not b!458655) (not b!458717) (not b!458770))
(check-sat b_and!19235 (not b_next!10995))
