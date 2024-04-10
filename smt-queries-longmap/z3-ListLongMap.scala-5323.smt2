; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71180 () Bool)

(assert start!71180)

(declare-fun b_free!13347 () Bool)

(declare-fun b_next!13347 () Bool)

(assert (=> start!71180 (= b_free!13347 (not b_next!13347))))

(declare-fun tp!46801 () Bool)

(declare-fun b_and!22273 () Bool)

(assert (=> start!71180 (= tp!46801 b_and!22273)))

(declare-fun b!826879 () Bool)

(declare-fun e!460557 () Bool)

(declare-fun tp_is_empty!15057 () Bool)

(assert (=> b!826879 (= e!460557 tp_is_empty!15057)))

(declare-fun b!826880 () Bool)

(declare-fun e!460558 () Bool)

(assert (=> b!826880 (= e!460558 tp_is_empty!15057)))

(declare-fun b!826881 () Bool)

(declare-fun e!460555 () Bool)

(declare-datatypes ((array!46290 0))(
  ( (array!46291 (arr!22190 (Array (_ BitVec 32) (_ BitVec 64))) (size!22611 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46290)

(assert (=> b!826881 (= e!460555 (bvsle #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(declare-fun b!826882 () Bool)

(declare-fun e!460561 () Bool)

(declare-fun mapRes!24211 () Bool)

(assert (=> b!826882 (= e!460561 (and e!460558 mapRes!24211))))

(declare-fun condMapEmpty!24211 () Bool)

(declare-datatypes ((V!25077 0))(
  ( (V!25078 (val!7576 Int)) )
))
(declare-datatypes ((ValueCell!7113 0))(
  ( (ValueCellFull!7113 (v!10010 V!25077)) (EmptyCell!7113) )
))
(declare-datatypes ((array!46292 0))(
  ( (array!46293 (arr!22191 (Array (_ BitVec 32) ValueCell!7113)) (size!22612 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46292)

(declare-fun mapDefault!24211 () ValueCell!7113)

(assert (=> b!826882 (= condMapEmpty!24211 (= (arr!22191 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7113)) mapDefault!24211)))))

(declare-fun res!563670 () Bool)

(declare-fun e!460559 () Bool)

(assert (=> start!71180 (=> (not res!563670) (not e!460559))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71180 (= res!563670 (validMask!0 mask!1312))))

(assert (=> start!71180 e!460559))

(assert (=> start!71180 tp_is_empty!15057))

(declare-fun array_inv!17685 (array!46290) Bool)

(assert (=> start!71180 (array_inv!17685 _keys!976)))

(assert (=> start!71180 true))

(declare-fun array_inv!17686 (array!46292) Bool)

(assert (=> start!71180 (and (array_inv!17686 _values!788) e!460561)))

(assert (=> start!71180 tp!46801))

(declare-datatypes ((tuple2!10042 0))(
  ( (tuple2!10043 (_1!5032 (_ BitVec 64)) (_2!5032 V!25077)) )
))
(declare-datatypes ((List!15839 0))(
  ( (Nil!15836) (Cons!15835 (h!16964 tuple2!10042) (t!22186 List!15839)) )
))
(declare-datatypes ((ListLongMap!8865 0))(
  ( (ListLongMap!8866 (toList!4448 List!15839)) )
))
(declare-fun lt!374567 () ListLongMap!8865)

(declare-fun lt!374576 () tuple2!10042)

(declare-fun b!826883 () Bool)

(declare-fun e!460560 () Bool)

(declare-fun lt!374575 () tuple2!10042)

(declare-fun lt!374570 () ListLongMap!8865)

(declare-fun +!1955 (ListLongMap!8865 tuple2!10042) ListLongMap!8865)

(assert (=> b!826883 (= e!460560 (= lt!374570 (+!1955 (+!1955 lt!374567 lt!374575) lt!374576)))))

(declare-fun b!826884 () Bool)

(declare-fun res!563673 () Bool)

(assert (=> b!826884 (=> (not res!563673) (not e!460559))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46290 (_ BitVec 32)) Bool)

(assert (=> b!826884 (= res!563673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826885 () Bool)

(declare-fun res!563667 () Bool)

(assert (=> b!826885 (=> (not res!563667) (not e!460559))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!826885 (= res!563667 (and (= (size!22612 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22611 _keys!976) (size!22612 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!826886 () Bool)

(declare-fun zeroValueAfter!34 () V!25077)

(declare-fun e!460556 () Bool)

(assert (=> b!826886 (= e!460556 (= lt!374570 (+!1955 (+!1955 lt!374567 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374575)))))

(declare-fun b!826887 () Bool)

(declare-fun e!460553 () Bool)

(assert (=> b!826887 (= e!460553 e!460555)))

(declare-fun res!563666 () Bool)

(assert (=> b!826887 (=> res!563666 e!460555)))

(declare-fun lt!374572 () ListLongMap!8865)

(assert (=> b!826887 (= res!563666 (not (= lt!374570 (+!1955 (+!1955 lt!374572 lt!374576) lt!374575))))))

(declare-fun lt!374578 () ListLongMap!8865)

(declare-fun lt!374571 () ListLongMap!8865)

(assert (=> b!826887 (and (= lt!374578 lt!374571) (= lt!374570 lt!374571) (= lt!374570 lt!374578))))

(declare-fun lt!374566 () ListLongMap!8865)

(assert (=> b!826887 (= lt!374571 (+!1955 lt!374566 lt!374576))))

(declare-fun lt!374574 () ListLongMap!8865)

(assert (=> b!826887 (= lt!374578 (+!1955 lt!374574 lt!374576))))

(declare-fun zeroValueBefore!34 () V!25077)

(declare-datatypes ((Unit!28353 0))(
  ( (Unit!28354) )
))
(declare-fun lt!374569 () Unit!28353)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!235 (ListLongMap!8865 (_ BitVec 64) V!25077 V!25077) Unit!28353)

(assert (=> b!826887 (= lt!374569 (addSameAsAddTwiceSameKeyDiffValues!235 lt!374574 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826887 e!460560))

(declare-fun res!563668 () Bool)

(assert (=> b!826887 (=> (not res!563668) (not e!460560))))

(declare-fun lt!374568 () ListLongMap!8865)

(assert (=> b!826887 (= res!563668 (= lt!374568 lt!374566))))

(declare-fun lt!374573 () tuple2!10042)

(assert (=> b!826887 (= lt!374566 (+!1955 lt!374574 lt!374573))))

(assert (=> b!826887 (= lt!374574 (+!1955 lt!374572 lt!374575))))

(assert (=> b!826887 (= lt!374576 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!826887 e!460556))

(declare-fun res!563672 () Bool)

(assert (=> b!826887 (=> (not res!563672) (not e!460556))))

(assert (=> b!826887 (= res!563672 (= lt!374568 (+!1955 (+!1955 lt!374572 lt!374573) lt!374575)))))

(declare-fun minValue!754 () V!25077)

(assert (=> b!826887 (= lt!374575 (tuple2!10043 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826887 (= lt!374573 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2575 (array!46290 array!46292 (_ BitVec 32) (_ BitVec 32) V!25077 V!25077 (_ BitVec 32) Int) ListLongMap!8865)

(assert (=> b!826887 (= lt!374570 (getCurrentListMap!2575 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826887 (= lt!374568 (getCurrentListMap!2575 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24211 () Bool)

(declare-fun tp!46800 () Bool)

(assert (=> mapNonEmpty!24211 (= mapRes!24211 (and tp!46800 e!460557))))

(declare-fun mapKey!24211 () (_ BitVec 32))

(declare-fun mapValue!24211 () ValueCell!7113)

(declare-fun mapRest!24211 () (Array (_ BitVec 32) ValueCell!7113))

(assert (=> mapNonEmpty!24211 (= (arr!22191 _values!788) (store mapRest!24211 mapKey!24211 mapValue!24211))))

(declare-fun b!826888 () Bool)

(assert (=> b!826888 (= e!460559 (not e!460553))))

(declare-fun res!563671 () Bool)

(assert (=> b!826888 (=> res!563671 e!460553)))

(assert (=> b!826888 (= res!563671 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!826888 (= lt!374572 lt!374567)))

(declare-fun lt!374577 () Unit!28353)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!561 (array!46290 array!46292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25077 V!25077 V!25077 V!25077 (_ BitVec 32) Int) Unit!28353)

(assert (=> b!826888 (= lt!374577 (lemmaNoChangeToArrayThenSameMapNoExtras!561 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2451 (array!46290 array!46292 (_ BitVec 32) (_ BitVec 32) V!25077 V!25077 (_ BitVec 32) Int) ListLongMap!8865)

(assert (=> b!826888 (= lt!374567 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826888 (= lt!374572 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapIsEmpty!24211 () Bool)

(assert (=> mapIsEmpty!24211 mapRes!24211))

(declare-fun b!826889 () Bool)

(declare-fun res!563669 () Bool)

(assert (=> b!826889 (=> (not res!563669) (not e!460559))))

(declare-datatypes ((List!15840 0))(
  ( (Nil!15837) (Cons!15836 (h!16965 (_ BitVec 64)) (t!22187 List!15840)) )
))
(declare-fun arrayNoDuplicates!0 (array!46290 (_ BitVec 32) List!15840) Bool)

(assert (=> b!826889 (= res!563669 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15837))))

(assert (= (and start!71180 res!563670) b!826885))

(assert (= (and b!826885 res!563667) b!826884))

(assert (= (and b!826884 res!563673) b!826889))

(assert (= (and b!826889 res!563669) b!826888))

(assert (= (and b!826888 (not res!563671)) b!826887))

(assert (= (and b!826887 res!563672) b!826886))

(assert (= (and b!826887 res!563668) b!826883))

(assert (= (and b!826887 (not res!563666)) b!826881))

(assert (= (and b!826882 condMapEmpty!24211) mapIsEmpty!24211))

(assert (= (and b!826882 (not condMapEmpty!24211)) mapNonEmpty!24211))

(get-info :version)

(assert (= (and mapNonEmpty!24211 ((_ is ValueCellFull!7113) mapValue!24211)) b!826879))

(assert (= (and b!826882 ((_ is ValueCellFull!7113) mapDefault!24211)) b!826880))

(assert (= start!71180 b!826882))

(declare-fun m!769875 () Bool)

(assert (=> b!826884 m!769875))

(declare-fun m!769877 () Bool)

(assert (=> b!826886 m!769877))

(assert (=> b!826886 m!769877))

(declare-fun m!769879 () Bool)

(assert (=> b!826886 m!769879))

(declare-fun m!769881 () Bool)

(assert (=> b!826883 m!769881))

(assert (=> b!826883 m!769881))

(declare-fun m!769883 () Bool)

(assert (=> b!826883 m!769883))

(declare-fun m!769885 () Bool)

(assert (=> b!826889 m!769885))

(declare-fun m!769887 () Bool)

(assert (=> start!71180 m!769887))

(declare-fun m!769889 () Bool)

(assert (=> start!71180 m!769889))

(declare-fun m!769891 () Bool)

(assert (=> start!71180 m!769891))

(declare-fun m!769893 () Bool)

(assert (=> b!826888 m!769893))

(declare-fun m!769895 () Bool)

(assert (=> b!826888 m!769895))

(declare-fun m!769897 () Bool)

(assert (=> b!826888 m!769897))

(declare-fun m!769899 () Bool)

(assert (=> b!826887 m!769899))

(declare-fun m!769901 () Bool)

(assert (=> b!826887 m!769901))

(declare-fun m!769903 () Bool)

(assert (=> b!826887 m!769903))

(declare-fun m!769905 () Bool)

(assert (=> b!826887 m!769905))

(declare-fun m!769907 () Bool)

(assert (=> b!826887 m!769907))

(declare-fun m!769909 () Bool)

(assert (=> b!826887 m!769909))

(declare-fun m!769911 () Bool)

(assert (=> b!826887 m!769911))

(declare-fun m!769913 () Bool)

(assert (=> b!826887 m!769913))

(declare-fun m!769915 () Bool)

(assert (=> b!826887 m!769915))

(assert (=> b!826887 m!769915))

(declare-fun m!769917 () Bool)

(assert (=> b!826887 m!769917))

(assert (=> b!826887 m!769903))

(declare-fun m!769919 () Bool)

(assert (=> b!826887 m!769919))

(declare-fun m!769921 () Bool)

(assert (=> mapNonEmpty!24211 m!769921))

(check-sat tp_is_empty!15057 (not b!826887) (not b!826889) (not b!826884) (not mapNonEmpty!24211) b_and!22273 (not b_next!13347) (not b!826883) (not b!826888) (not b!826886) (not start!71180))
(check-sat b_and!22273 (not b_next!13347))
(get-model)

(declare-fun b!826931 () Bool)

(declare-fun e!460595 () Bool)

(declare-fun call!35911 () Bool)

(assert (=> b!826931 (= e!460595 call!35911)))

(declare-fun b!826932 () Bool)

(declare-fun e!460596 () Bool)

(assert (=> b!826932 (= e!460596 call!35911)))

(declare-fun b!826933 () Bool)

(assert (=> b!826933 (= e!460596 e!460595)))

(declare-fun lt!374624 () (_ BitVec 64))

(assert (=> b!826933 (= lt!374624 (select (arr!22190 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374625 () Unit!28353)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!46290 (_ BitVec 64) (_ BitVec 32)) Unit!28353)

(assert (=> b!826933 (= lt!374625 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!374624 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!46290 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!826933 (arrayContainsKey!0 _keys!976 lt!374624 #b00000000000000000000000000000000)))

(declare-fun lt!374626 () Unit!28353)

(assert (=> b!826933 (= lt!374626 lt!374625)))

(declare-fun res!563703 () Bool)

(declare-datatypes ((SeekEntryResult!8735 0))(
  ( (MissingZero!8735 (index!37311 (_ BitVec 32))) (Found!8735 (index!37312 (_ BitVec 32))) (Intermediate!8735 (undefined!9547 Bool) (index!37313 (_ BitVec 32)) (x!69801 (_ BitVec 32))) (Undefined!8735) (MissingVacant!8735 (index!37314 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!46290 (_ BitVec 32)) SeekEntryResult!8735)

(assert (=> b!826933 (= res!563703 (= (seekEntryOrOpen!0 (select (arr!22190 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8735 #b00000000000000000000000000000000)))))

(assert (=> b!826933 (=> (not res!563703) (not e!460595))))

(declare-fun b!826934 () Bool)

(declare-fun e!460597 () Bool)

(assert (=> b!826934 (= e!460597 e!460596)))

(declare-fun c!89479 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!826934 (= c!89479 (validKeyInArray!0 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!105059 () Bool)

(declare-fun res!563702 () Bool)

(assert (=> d!105059 (=> res!563702 e!460597)))

(assert (=> d!105059 (= res!563702 (bvsge #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(assert (=> d!105059 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!460597)))

(declare-fun bm!35908 () Bool)

(assert (=> bm!35908 (= call!35911 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!105059 (not res!563702)) b!826934))

(assert (= (and b!826934 c!89479) b!826933))

(assert (= (and b!826934 (not c!89479)) b!826932))

(assert (= (and b!826933 res!563703) b!826931))

(assert (= (or b!826931 b!826932) bm!35908))

(declare-fun m!769971 () Bool)

(assert (=> b!826933 m!769971))

(declare-fun m!769973 () Bool)

(assert (=> b!826933 m!769973))

(declare-fun m!769975 () Bool)

(assert (=> b!826933 m!769975))

(assert (=> b!826933 m!769971))

(declare-fun m!769977 () Bool)

(assert (=> b!826933 m!769977))

(assert (=> b!826934 m!769971))

(assert (=> b!826934 m!769971))

(declare-fun m!769979 () Bool)

(assert (=> b!826934 m!769979))

(declare-fun m!769981 () Bool)

(assert (=> bm!35908 m!769981))

(assert (=> b!826884 d!105059))

(declare-fun d!105061 () Bool)

(assert (=> d!105061 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!71180 d!105061))

(declare-fun d!105063 () Bool)

(assert (=> d!105063 (= (array_inv!17685 _keys!976) (bvsge (size!22611 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!71180 d!105063))

(declare-fun d!105065 () Bool)

(assert (=> d!105065 (= (array_inv!17686 _values!788) (bvsge (size!22612 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!71180 d!105065))

(declare-fun d!105067 () Bool)

(declare-fun e!460600 () Bool)

(assert (=> d!105067 e!460600))

(declare-fun res!563709 () Bool)

(assert (=> d!105067 (=> (not res!563709) (not e!460600))))

(declare-fun lt!374635 () ListLongMap!8865)

(declare-fun contains!4182 (ListLongMap!8865 (_ BitVec 64)) Bool)

(assert (=> d!105067 (= res!563709 (contains!4182 lt!374635 (_1!5032 lt!374575)))))

(declare-fun lt!374636 () List!15839)

(assert (=> d!105067 (= lt!374635 (ListLongMap!8866 lt!374636))))

(declare-fun lt!374638 () Unit!28353)

(declare-fun lt!374637 () Unit!28353)

(assert (=> d!105067 (= lt!374638 lt!374637)))

(declare-datatypes ((Option!413 0))(
  ( (Some!412 (v!10012 V!25077)) (None!411) )
))
(declare-fun getValueByKey!407 (List!15839 (_ BitVec 64)) Option!413)

(assert (=> d!105067 (= (getValueByKey!407 lt!374636 (_1!5032 lt!374575)) (Some!412 (_2!5032 lt!374575)))))

(declare-fun lemmaContainsTupThenGetReturnValue!221 (List!15839 (_ BitVec 64) V!25077) Unit!28353)

(assert (=> d!105067 (= lt!374637 (lemmaContainsTupThenGetReturnValue!221 lt!374636 (_1!5032 lt!374575) (_2!5032 lt!374575)))))

(declare-fun insertStrictlySorted!260 (List!15839 (_ BitVec 64) V!25077) List!15839)

(assert (=> d!105067 (= lt!374636 (insertStrictlySorted!260 (toList!4448 (+!1955 lt!374567 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (_1!5032 lt!374575) (_2!5032 lt!374575)))))

(assert (=> d!105067 (= (+!1955 (+!1955 lt!374567 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374575) lt!374635)))

(declare-fun b!826939 () Bool)

(declare-fun res!563708 () Bool)

(assert (=> b!826939 (=> (not res!563708) (not e!460600))))

(assert (=> b!826939 (= res!563708 (= (getValueByKey!407 (toList!4448 lt!374635) (_1!5032 lt!374575)) (Some!412 (_2!5032 lt!374575))))))

(declare-fun b!826940 () Bool)

(declare-fun contains!4183 (List!15839 tuple2!10042) Bool)

(assert (=> b!826940 (= e!460600 (contains!4183 (toList!4448 lt!374635) lt!374575))))

(assert (= (and d!105067 res!563709) b!826939))

(assert (= (and b!826939 res!563708) b!826940))

(declare-fun m!769983 () Bool)

(assert (=> d!105067 m!769983))

(declare-fun m!769985 () Bool)

(assert (=> d!105067 m!769985))

(declare-fun m!769987 () Bool)

(assert (=> d!105067 m!769987))

(declare-fun m!769989 () Bool)

(assert (=> d!105067 m!769989))

(declare-fun m!769991 () Bool)

(assert (=> b!826939 m!769991))

(declare-fun m!769993 () Bool)

(assert (=> b!826940 m!769993))

(assert (=> b!826886 d!105067))

(declare-fun d!105069 () Bool)

(declare-fun e!460601 () Bool)

(assert (=> d!105069 e!460601))

(declare-fun res!563711 () Bool)

(assert (=> d!105069 (=> (not res!563711) (not e!460601))))

(declare-fun lt!374639 () ListLongMap!8865)

(assert (=> d!105069 (= res!563711 (contains!4182 lt!374639 (_1!5032 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun lt!374640 () List!15839)

(assert (=> d!105069 (= lt!374639 (ListLongMap!8866 lt!374640))))

(declare-fun lt!374642 () Unit!28353)

(declare-fun lt!374641 () Unit!28353)

(assert (=> d!105069 (= lt!374642 lt!374641)))

(assert (=> d!105069 (= (getValueByKey!407 lt!374640 (_1!5032 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!412 (_2!5032 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105069 (= lt!374641 (lemmaContainsTupThenGetReturnValue!221 lt!374640 (_1!5032 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5032 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105069 (= lt!374640 (insertStrictlySorted!260 (toList!4448 lt!374567) (_1!5032 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (_2!5032 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(assert (=> d!105069 (= (+!1955 lt!374567 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374639)))

(declare-fun b!826941 () Bool)

(declare-fun res!563710 () Bool)

(assert (=> b!826941 (=> (not res!563710) (not e!460601))))

(assert (=> b!826941 (= res!563710 (= (getValueByKey!407 (toList!4448 lt!374639) (_1!5032 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))) (Some!412 (_2!5032 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))))

(declare-fun b!826942 () Bool)

(assert (=> b!826942 (= e!460601 (contains!4183 (toList!4448 lt!374639) (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(assert (= (and d!105069 res!563711) b!826941))

(assert (= (and b!826941 res!563710) b!826942))

(declare-fun m!769995 () Bool)

(assert (=> d!105069 m!769995))

(declare-fun m!769997 () Bool)

(assert (=> d!105069 m!769997))

(declare-fun m!769999 () Bool)

(assert (=> d!105069 m!769999))

(declare-fun m!770001 () Bool)

(assert (=> d!105069 m!770001))

(declare-fun m!770003 () Bool)

(assert (=> b!826941 m!770003))

(declare-fun m!770005 () Bool)

(assert (=> b!826942 m!770005))

(assert (=> b!826886 d!105069))

(declare-fun d!105071 () Bool)

(declare-fun res!563719 () Bool)

(declare-fun e!460612 () Bool)

(assert (=> d!105071 (=> res!563719 e!460612)))

(assert (=> d!105071 (= res!563719 (bvsge #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(assert (=> d!105071 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15837) e!460612)))

(declare-fun b!826953 () Bool)

(declare-fun e!460610 () Bool)

(declare-fun contains!4184 (List!15840 (_ BitVec 64)) Bool)

(assert (=> b!826953 (= e!460610 (contains!4184 Nil!15837 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826954 () Bool)

(declare-fun e!460611 () Bool)

(declare-fun e!460613 () Bool)

(assert (=> b!826954 (= e!460611 e!460613)))

(declare-fun c!89482 () Bool)

(assert (=> b!826954 (= c!89482 (validKeyInArray!0 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!826955 () Bool)

(declare-fun call!35914 () Bool)

(assert (=> b!826955 (= e!460613 call!35914)))

(declare-fun bm!35911 () Bool)

(assert (=> bm!35911 (= call!35914 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89482 (Cons!15836 (select (arr!22190 _keys!976) #b00000000000000000000000000000000) Nil!15837) Nil!15837)))))

(declare-fun b!826956 () Bool)

(assert (=> b!826956 (= e!460613 call!35914)))

(declare-fun b!826957 () Bool)

(assert (=> b!826957 (= e!460612 e!460611)))

(declare-fun res!563718 () Bool)

(assert (=> b!826957 (=> (not res!563718) (not e!460611))))

(assert (=> b!826957 (= res!563718 (not e!460610))))

(declare-fun res!563720 () Bool)

(assert (=> b!826957 (=> (not res!563720) (not e!460610))))

(assert (=> b!826957 (= res!563720 (validKeyInArray!0 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!105071 (not res!563719)) b!826957))

(assert (= (and b!826957 res!563720) b!826953))

(assert (= (and b!826957 res!563718) b!826954))

(assert (= (and b!826954 c!89482) b!826956))

(assert (= (and b!826954 (not c!89482)) b!826955))

(assert (= (or b!826956 b!826955) bm!35911))

(assert (=> b!826953 m!769971))

(assert (=> b!826953 m!769971))

(declare-fun m!770007 () Bool)

(assert (=> b!826953 m!770007))

(assert (=> b!826954 m!769971))

(assert (=> b!826954 m!769971))

(assert (=> b!826954 m!769979))

(assert (=> bm!35911 m!769971))

(declare-fun m!770009 () Bool)

(assert (=> bm!35911 m!770009))

(assert (=> b!826957 m!769971))

(assert (=> b!826957 m!769971))

(assert (=> b!826957 m!769979))

(assert (=> b!826889 d!105071))

(declare-fun d!105073 () Bool)

(declare-fun e!460614 () Bool)

(assert (=> d!105073 e!460614))

(declare-fun res!563722 () Bool)

(assert (=> d!105073 (=> (not res!563722) (not e!460614))))

(declare-fun lt!374643 () ListLongMap!8865)

(assert (=> d!105073 (= res!563722 (contains!4182 lt!374643 (_1!5032 lt!374575)))))

(declare-fun lt!374644 () List!15839)

(assert (=> d!105073 (= lt!374643 (ListLongMap!8866 lt!374644))))

(declare-fun lt!374646 () Unit!28353)

(declare-fun lt!374645 () Unit!28353)

(assert (=> d!105073 (= lt!374646 lt!374645)))

(assert (=> d!105073 (= (getValueByKey!407 lt!374644 (_1!5032 lt!374575)) (Some!412 (_2!5032 lt!374575)))))

(assert (=> d!105073 (= lt!374645 (lemmaContainsTupThenGetReturnValue!221 lt!374644 (_1!5032 lt!374575) (_2!5032 lt!374575)))))

(assert (=> d!105073 (= lt!374644 (insertStrictlySorted!260 (toList!4448 (+!1955 lt!374572 lt!374576)) (_1!5032 lt!374575) (_2!5032 lt!374575)))))

(assert (=> d!105073 (= (+!1955 (+!1955 lt!374572 lt!374576) lt!374575) lt!374643)))

(declare-fun b!826958 () Bool)

(declare-fun res!563721 () Bool)

(assert (=> b!826958 (=> (not res!563721) (not e!460614))))

(assert (=> b!826958 (= res!563721 (= (getValueByKey!407 (toList!4448 lt!374643) (_1!5032 lt!374575)) (Some!412 (_2!5032 lt!374575))))))

(declare-fun b!826959 () Bool)

(assert (=> b!826959 (= e!460614 (contains!4183 (toList!4448 lt!374643) lt!374575))))

(assert (= (and d!105073 res!563722) b!826958))

(assert (= (and b!826958 res!563721) b!826959))

(declare-fun m!770011 () Bool)

(assert (=> d!105073 m!770011))

(declare-fun m!770013 () Bool)

(assert (=> d!105073 m!770013))

(declare-fun m!770015 () Bool)

(assert (=> d!105073 m!770015))

(declare-fun m!770017 () Bool)

(assert (=> d!105073 m!770017))

(declare-fun m!770019 () Bool)

(assert (=> b!826958 m!770019))

(declare-fun m!770021 () Bool)

(assert (=> b!826959 m!770021))

(assert (=> b!826887 d!105073))

(declare-fun d!105075 () Bool)

(declare-fun e!460645 () Bool)

(assert (=> d!105075 e!460645))

(declare-fun res!563744 () Bool)

(assert (=> d!105075 (=> (not res!563744) (not e!460645))))

(assert (=> d!105075 (= res!563744 (or (bvsge #b00000000000000000000000000000000 (size!22611 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))))

(declare-fun lt!374702 () ListLongMap!8865)

(declare-fun lt!374708 () ListLongMap!8865)

(assert (=> d!105075 (= lt!374702 lt!374708)))

(declare-fun lt!374692 () Unit!28353)

(declare-fun e!460646 () Unit!28353)

(assert (=> d!105075 (= lt!374692 e!460646)))

(declare-fun c!89497 () Bool)

(declare-fun e!460643 () Bool)

(assert (=> d!105075 (= c!89497 e!460643)))

(declare-fun res!563746 () Bool)

(assert (=> d!105075 (=> (not res!563746) (not e!460643))))

(assert (=> d!105075 (= res!563746 (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(declare-fun e!460648 () ListLongMap!8865)

(assert (=> d!105075 (= lt!374708 e!460648)))

(declare-fun c!89495 () Bool)

(assert (=> d!105075 (= c!89495 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105075 (validMask!0 mask!1312)))

(assert (=> d!105075 (= (getCurrentListMap!2575 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374702)))

(declare-fun b!827002 () Bool)

(declare-fun Unit!28357 () Unit!28353)

(assert (=> b!827002 (= e!460646 Unit!28357)))

(declare-fun b!827003 () Bool)

(declare-fun e!460652 () Bool)

(declare-fun apply!363 (ListLongMap!8865 (_ BitVec 64)) V!25077)

(declare-fun get!11758 (ValueCell!7113 V!25077) V!25077)

(declare-fun dynLambda!974 (Int (_ BitVec 64)) V!25077)

(assert (=> b!827003 (= e!460652 (= (apply!363 lt!374702 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)) (get!11758 (select (arr!22191 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!827003 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22612 _values!788)))))

(assert (=> b!827003 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(declare-fun b!827004 () Bool)

(declare-fun e!460641 () ListLongMap!8865)

(assert (=> b!827004 (= e!460648 e!460641)))

(declare-fun c!89496 () Bool)

(assert (=> b!827004 (= c!89496 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35926 () Bool)

(declare-fun call!35931 () Bool)

(assert (=> bm!35926 (= call!35931 (contains!4182 lt!374702 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!827005 () Bool)

(declare-fun e!460653 () ListLongMap!8865)

(declare-fun call!35933 () ListLongMap!8865)

(assert (=> b!827005 (= e!460653 call!35933)))

(declare-fun bm!35927 () Bool)

(declare-fun call!35935 () ListLongMap!8865)

(declare-fun call!35934 () ListLongMap!8865)

(assert (=> bm!35927 (= call!35935 call!35934)))

(declare-fun call!35930 () ListLongMap!8865)

(declare-fun call!35929 () ListLongMap!8865)

(declare-fun bm!35928 () Bool)

(assert (=> bm!35928 (= call!35929 (+!1955 (ite c!89495 call!35934 (ite c!89496 call!35935 call!35930)) (ite (or c!89495 c!89496) (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!10043 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!827006 () Bool)

(declare-fun res!563749 () Bool)

(assert (=> b!827006 (=> (not res!563749) (not e!460645))))

(declare-fun e!460649 () Bool)

(assert (=> b!827006 (= res!563749 e!460649)))

(declare-fun c!89499 () Bool)

(assert (=> b!827006 (= c!89499 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!827007 () Bool)

(assert (=> b!827007 (= e!460648 (+!1955 call!35929 (tuple2!10043 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35929 () Bool)

(assert (=> bm!35929 (= call!35934 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827008 () Bool)

(declare-fun res!563748 () Bool)

(assert (=> b!827008 (=> (not res!563748) (not e!460645))))

(declare-fun e!460651 () Bool)

(assert (=> b!827008 (= res!563748 e!460651)))

(declare-fun res!563743 () Bool)

(assert (=> b!827008 (=> res!563743 e!460651)))

(declare-fun e!460650 () Bool)

(assert (=> b!827008 (= res!563743 (not e!460650))))

(declare-fun res!563741 () Bool)

(assert (=> b!827008 (=> (not res!563741) (not e!460650))))

(assert (=> b!827008 (= res!563741 (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(declare-fun b!827009 () Bool)

(declare-fun e!460642 () Bool)

(declare-fun e!460644 () Bool)

(assert (=> b!827009 (= e!460642 e!460644)))

(declare-fun res!563742 () Bool)

(declare-fun call!35932 () Bool)

(assert (=> b!827009 (= res!563742 call!35932)))

(assert (=> b!827009 (=> (not res!563742) (not e!460644))))

(declare-fun b!827010 () Bool)

(assert (=> b!827010 (= e!460644 (= (apply!363 lt!374702 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!35930 () Bool)

(assert (=> bm!35930 (= call!35932 (contains!4182 lt!374702 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!827011 () Bool)

(assert (=> b!827011 (= e!460641 call!35933)))

(declare-fun b!827012 () Bool)

(assert (=> b!827012 (= e!460643 (validKeyInArray!0 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827013 () Bool)

(declare-fun e!460647 () Bool)

(assert (=> b!827013 (= e!460649 e!460647)))

(declare-fun res!563747 () Bool)

(assert (=> b!827013 (= res!563747 call!35931)))

(assert (=> b!827013 (=> (not res!563747) (not e!460647))))

(declare-fun bm!35931 () Bool)

(assert (=> bm!35931 (= call!35930 call!35935)))

(declare-fun b!827014 () Bool)

(assert (=> b!827014 (= e!460649 (not call!35931))))

(declare-fun b!827015 () Bool)

(assert (=> b!827015 (= e!460651 e!460652)))

(declare-fun res!563745 () Bool)

(assert (=> b!827015 (=> (not res!563745) (not e!460652))))

(assert (=> b!827015 (= res!563745 (contains!4182 lt!374702 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827015 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(declare-fun b!827016 () Bool)

(assert (=> b!827016 (= e!460653 call!35930)))

(declare-fun b!827017 () Bool)

(declare-fun c!89498 () Bool)

(assert (=> b!827017 (= c!89498 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!827017 (= e!460641 e!460653)))

(declare-fun b!827018 () Bool)

(assert (=> b!827018 (= e!460650 (validKeyInArray!0 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827019 () Bool)

(assert (=> b!827019 (= e!460645 e!460642)))

(declare-fun c!89500 () Bool)

(assert (=> b!827019 (= c!89500 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35932 () Bool)

(assert (=> bm!35932 (= call!35933 call!35929)))

(declare-fun b!827020 () Bool)

(assert (=> b!827020 (= e!460642 (not call!35932))))

(declare-fun b!827021 () Bool)

(declare-fun lt!374699 () Unit!28353)

(assert (=> b!827021 (= e!460646 lt!374699)))

(declare-fun lt!374691 () ListLongMap!8865)

(assert (=> b!827021 (= lt!374691 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374694 () (_ BitVec 64))

(assert (=> b!827021 (= lt!374694 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374706 () (_ BitVec 64))

(assert (=> b!827021 (= lt!374706 (select (arr!22190 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374697 () Unit!28353)

(declare-fun addStillContains!315 (ListLongMap!8865 (_ BitVec 64) V!25077 (_ BitVec 64)) Unit!28353)

(assert (=> b!827021 (= lt!374697 (addStillContains!315 lt!374691 lt!374694 zeroValueBefore!34 lt!374706))))

(assert (=> b!827021 (contains!4182 (+!1955 lt!374691 (tuple2!10043 lt!374694 zeroValueBefore!34)) lt!374706)))

(declare-fun lt!374701 () Unit!28353)

(assert (=> b!827021 (= lt!374701 lt!374697)))

(declare-fun lt!374704 () ListLongMap!8865)

(assert (=> b!827021 (= lt!374704 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374707 () (_ BitVec 64))

(assert (=> b!827021 (= lt!374707 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374695 () (_ BitVec 64))

(assert (=> b!827021 (= lt!374695 (select (arr!22190 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374705 () Unit!28353)

(declare-fun addApplyDifferent!315 (ListLongMap!8865 (_ BitVec 64) V!25077 (_ BitVec 64)) Unit!28353)

(assert (=> b!827021 (= lt!374705 (addApplyDifferent!315 lt!374704 lt!374707 minValue!754 lt!374695))))

(assert (=> b!827021 (= (apply!363 (+!1955 lt!374704 (tuple2!10043 lt!374707 minValue!754)) lt!374695) (apply!363 lt!374704 lt!374695))))

(declare-fun lt!374703 () Unit!28353)

(assert (=> b!827021 (= lt!374703 lt!374705)))

(declare-fun lt!374693 () ListLongMap!8865)

(assert (=> b!827021 (= lt!374693 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374696 () (_ BitVec 64))

(assert (=> b!827021 (= lt!374696 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374710 () (_ BitVec 64))

(assert (=> b!827021 (= lt!374710 (select (arr!22190 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374711 () Unit!28353)

(assert (=> b!827021 (= lt!374711 (addApplyDifferent!315 lt!374693 lt!374696 zeroValueBefore!34 lt!374710))))

(assert (=> b!827021 (= (apply!363 (+!1955 lt!374693 (tuple2!10043 lt!374696 zeroValueBefore!34)) lt!374710) (apply!363 lt!374693 lt!374710))))

(declare-fun lt!374712 () Unit!28353)

(assert (=> b!827021 (= lt!374712 lt!374711)))

(declare-fun lt!374700 () ListLongMap!8865)

(assert (=> b!827021 (= lt!374700 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374698 () (_ BitVec 64))

(assert (=> b!827021 (= lt!374698 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374709 () (_ BitVec 64))

(assert (=> b!827021 (= lt!374709 (select (arr!22190 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827021 (= lt!374699 (addApplyDifferent!315 lt!374700 lt!374698 minValue!754 lt!374709))))

(assert (=> b!827021 (= (apply!363 (+!1955 lt!374700 (tuple2!10043 lt!374698 minValue!754)) lt!374709) (apply!363 lt!374700 lt!374709))))

(declare-fun b!827022 () Bool)

(assert (=> b!827022 (= e!460647 (= (apply!363 lt!374702 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(assert (= (and d!105075 c!89495) b!827007))

(assert (= (and d!105075 (not c!89495)) b!827004))

(assert (= (and b!827004 c!89496) b!827011))

(assert (= (and b!827004 (not c!89496)) b!827017))

(assert (= (and b!827017 c!89498) b!827005))

(assert (= (and b!827017 (not c!89498)) b!827016))

(assert (= (or b!827005 b!827016) bm!35931))

(assert (= (or b!827011 bm!35931) bm!35927))

(assert (= (or b!827011 b!827005) bm!35932))

(assert (= (or b!827007 bm!35927) bm!35929))

(assert (= (or b!827007 bm!35932) bm!35928))

(assert (= (and d!105075 res!563746) b!827012))

(assert (= (and d!105075 c!89497) b!827021))

(assert (= (and d!105075 (not c!89497)) b!827002))

(assert (= (and d!105075 res!563744) b!827008))

(assert (= (and b!827008 res!563741) b!827018))

(assert (= (and b!827008 (not res!563743)) b!827015))

(assert (= (and b!827015 res!563745) b!827003))

(assert (= (and b!827008 res!563748) b!827006))

(assert (= (and b!827006 c!89499) b!827013))

(assert (= (and b!827006 (not c!89499)) b!827014))

(assert (= (and b!827013 res!563747) b!827022))

(assert (= (or b!827013 b!827014) bm!35926))

(assert (= (and b!827006 res!563749) b!827019))

(assert (= (and b!827019 c!89500) b!827009))

(assert (= (and b!827019 (not c!89500)) b!827020))

(assert (= (and b!827009 res!563742) b!827010))

(assert (= (or b!827009 b!827020) bm!35930))

(declare-fun b_lambda!11139 () Bool)

(assert (=> (not b_lambda!11139) (not b!827003)))

(declare-fun t!22190 () Bool)

(declare-fun tb!4207 () Bool)

(assert (=> (and start!71180 (= defaultEntry!796 defaultEntry!796) t!22190) tb!4207))

(declare-fun result!7961 () Bool)

(assert (=> tb!4207 (= result!7961 tp_is_empty!15057)))

(assert (=> b!827003 t!22190))

(declare-fun b_and!22277 () Bool)

(assert (= b_and!22273 (and (=> t!22190 result!7961) b_and!22277)))

(declare-fun m!770023 () Bool)

(assert (=> b!827021 m!770023))

(declare-fun m!770025 () Bool)

(assert (=> b!827021 m!770025))

(declare-fun m!770027 () Bool)

(assert (=> b!827021 m!770027))

(declare-fun m!770029 () Bool)

(assert (=> b!827021 m!770029))

(declare-fun m!770031 () Bool)

(assert (=> b!827021 m!770031))

(declare-fun m!770033 () Bool)

(assert (=> b!827021 m!770033))

(assert (=> b!827021 m!769897))

(declare-fun m!770035 () Bool)

(assert (=> b!827021 m!770035))

(declare-fun m!770037 () Bool)

(assert (=> b!827021 m!770037))

(declare-fun m!770039 () Bool)

(assert (=> b!827021 m!770039))

(assert (=> b!827021 m!770023))

(declare-fun m!770041 () Bool)

(assert (=> b!827021 m!770041))

(declare-fun m!770043 () Bool)

(assert (=> b!827021 m!770043))

(assert (=> b!827021 m!770035))

(assert (=> b!827021 m!770029))

(declare-fun m!770045 () Bool)

(assert (=> b!827021 m!770045))

(assert (=> b!827021 m!769971))

(declare-fun m!770047 () Bool)

(assert (=> b!827021 m!770047))

(declare-fun m!770049 () Bool)

(assert (=> b!827021 m!770049))

(declare-fun m!770051 () Bool)

(assert (=> b!827021 m!770051))

(assert (=> b!827021 m!770049))

(assert (=> b!827018 m!769971))

(assert (=> b!827018 m!769971))

(assert (=> b!827018 m!769979))

(declare-fun m!770053 () Bool)

(assert (=> bm!35928 m!770053))

(assert (=> d!105075 m!769887))

(declare-fun m!770055 () Bool)

(assert (=> b!827003 m!770055))

(assert (=> b!827003 m!770055))

(declare-fun m!770057 () Bool)

(assert (=> b!827003 m!770057))

(declare-fun m!770059 () Bool)

(assert (=> b!827003 m!770059))

(assert (=> b!827003 m!770057))

(assert (=> b!827003 m!769971))

(declare-fun m!770061 () Bool)

(assert (=> b!827003 m!770061))

(assert (=> b!827003 m!769971))

(declare-fun m!770063 () Bool)

(assert (=> b!827010 m!770063))

(declare-fun m!770065 () Bool)

(assert (=> b!827007 m!770065))

(declare-fun m!770067 () Bool)

(assert (=> b!827022 m!770067))

(declare-fun m!770069 () Bool)

(assert (=> bm!35926 m!770069))

(assert (=> b!827015 m!769971))

(assert (=> b!827015 m!769971))

(declare-fun m!770071 () Bool)

(assert (=> b!827015 m!770071))

(assert (=> bm!35929 m!769897))

(declare-fun m!770073 () Bool)

(assert (=> bm!35930 m!770073))

(assert (=> b!827012 m!769971))

(assert (=> b!827012 m!769971))

(assert (=> b!827012 m!769979))

(assert (=> b!826887 d!105075))

(declare-fun d!105077 () Bool)

(declare-fun e!460654 () Bool)

(assert (=> d!105077 e!460654))

(declare-fun res!563751 () Bool)

(assert (=> d!105077 (=> (not res!563751) (not e!460654))))

(declare-fun lt!374713 () ListLongMap!8865)

(assert (=> d!105077 (= res!563751 (contains!4182 lt!374713 (_1!5032 lt!374573)))))

(declare-fun lt!374714 () List!15839)

(assert (=> d!105077 (= lt!374713 (ListLongMap!8866 lt!374714))))

(declare-fun lt!374716 () Unit!28353)

(declare-fun lt!374715 () Unit!28353)

(assert (=> d!105077 (= lt!374716 lt!374715)))

(assert (=> d!105077 (= (getValueByKey!407 lt!374714 (_1!5032 lt!374573)) (Some!412 (_2!5032 lt!374573)))))

(assert (=> d!105077 (= lt!374715 (lemmaContainsTupThenGetReturnValue!221 lt!374714 (_1!5032 lt!374573) (_2!5032 lt!374573)))))

(assert (=> d!105077 (= lt!374714 (insertStrictlySorted!260 (toList!4448 lt!374574) (_1!5032 lt!374573) (_2!5032 lt!374573)))))

(assert (=> d!105077 (= (+!1955 lt!374574 lt!374573) lt!374713)))

(declare-fun b!827025 () Bool)

(declare-fun res!563750 () Bool)

(assert (=> b!827025 (=> (not res!563750) (not e!460654))))

(assert (=> b!827025 (= res!563750 (= (getValueByKey!407 (toList!4448 lt!374713) (_1!5032 lt!374573)) (Some!412 (_2!5032 lt!374573))))))

(declare-fun b!827026 () Bool)

(assert (=> b!827026 (= e!460654 (contains!4183 (toList!4448 lt!374713) lt!374573))))

(assert (= (and d!105077 res!563751) b!827025))

(assert (= (and b!827025 res!563750) b!827026))

(declare-fun m!770075 () Bool)

(assert (=> d!105077 m!770075))

(declare-fun m!770077 () Bool)

(assert (=> d!105077 m!770077))

(declare-fun m!770079 () Bool)

(assert (=> d!105077 m!770079))

(declare-fun m!770081 () Bool)

(assert (=> d!105077 m!770081))

(declare-fun m!770083 () Bool)

(assert (=> b!827025 m!770083))

(declare-fun m!770085 () Bool)

(assert (=> b!827026 m!770085))

(assert (=> b!826887 d!105077))

(declare-fun d!105079 () Bool)

(declare-fun e!460659 () Bool)

(assert (=> d!105079 e!460659))

(declare-fun res!563755 () Bool)

(assert (=> d!105079 (=> (not res!563755) (not e!460659))))

(assert (=> d!105079 (= res!563755 (or (bvsge #b00000000000000000000000000000000 (size!22611 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))))

(declare-fun lt!374728 () ListLongMap!8865)

(declare-fun lt!374734 () ListLongMap!8865)

(assert (=> d!105079 (= lt!374728 lt!374734)))

(declare-fun lt!374718 () Unit!28353)

(declare-fun e!460660 () Unit!28353)

(assert (=> d!105079 (= lt!374718 e!460660)))

(declare-fun c!89503 () Bool)

(declare-fun e!460657 () Bool)

(assert (=> d!105079 (= c!89503 e!460657)))

(declare-fun res!563757 () Bool)

(assert (=> d!105079 (=> (not res!563757) (not e!460657))))

(assert (=> d!105079 (= res!563757 (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(declare-fun e!460662 () ListLongMap!8865)

(assert (=> d!105079 (= lt!374734 e!460662)))

(declare-fun c!89501 () Bool)

(assert (=> d!105079 (= c!89501 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!105079 (validMask!0 mask!1312)))

(assert (=> d!105079 (= (getCurrentListMap!2575 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374728)))

(declare-fun b!827027 () Bool)

(declare-fun Unit!28358 () Unit!28353)

(assert (=> b!827027 (= e!460660 Unit!28358)))

(declare-fun e!460666 () Bool)

(declare-fun b!827028 () Bool)

(assert (=> b!827028 (= e!460666 (= (apply!363 lt!374728 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)) (get!11758 (select (arr!22191 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!827028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22612 _values!788)))))

(assert (=> b!827028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(declare-fun b!827029 () Bool)

(declare-fun e!460655 () ListLongMap!8865)

(assert (=> b!827029 (= e!460662 e!460655)))

(declare-fun c!89502 () Bool)

(assert (=> b!827029 (= c!89502 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35933 () Bool)

(declare-fun call!35938 () Bool)

(assert (=> bm!35933 (= call!35938 (contains!4182 lt!374728 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!827030 () Bool)

(declare-fun e!460667 () ListLongMap!8865)

(declare-fun call!35940 () ListLongMap!8865)

(assert (=> b!827030 (= e!460667 call!35940)))

(declare-fun bm!35934 () Bool)

(declare-fun call!35942 () ListLongMap!8865)

(declare-fun call!35941 () ListLongMap!8865)

(assert (=> bm!35934 (= call!35942 call!35941)))

(declare-fun call!35936 () ListLongMap!8865)

(declare-fun bm!35935 () Bool)

(declare-fun call!35937 () ListLongMap!8865)

(assert (=> bm!35935 (= call!35936 (+!1955 (ite c!89501 call!35941 (ite c!89502 call!35942 call!35937)) (ite (or c!89501 c!89502) (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34) (tuple2!10043 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!827031 () Bool)

(declare-fun res!563760 () Bool)

(assert (=> b!827031 (=> (not res!563760) (not e!460659))))

(declare-fun e!460663 () Bool)

(assert (=> b!827031 (= res!563760 e!460663)))

(declare-fun c!89505 () Bool)

(assert (=> b!827031 (= c!89505 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!827032 () Bool)

(assert (=> b!827032 (= e!460662 (+!1955 call!35936 (tuple2!10043 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun bm!35936 () Bool)

(assert (=> bm!35936 (= call!35941 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827033 () Bool)

(declare-fun res!563759 () Bool)

(assert (=> b!827033 (=> (not res!563759) (not e!460659))))

(declare-fun e!460665 () Bool)

(assert (=> b!827033 (= res!563759 e!460665)))

(declare-fun res!563754 () Bool)

(assert (=> b!827033 (=> res!563754 e!460665)))

(declare-fun e!460664 () Bool)

(assert (=> b!827033 (= res!563754 (not e!460664))))

(declare-fun res!563752 () Bool)

(assert (=> b!827033 (=> (not res!563752) (not e!460664))))

(assert (=> b!827033 (= res!563752 (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(declare-fun b!827034 () Bool)

(declare-fun e!460656 () Bool)

(declare-fun e!460658 () Bool)

(assert (=> b!827034 (= e!460656 e!460658)))

(declare-fun res!563753 () Bool)

(declare-fun call!35939 () Bool)

(assert (=> b!827034 (= res!563753 call!35939)))

(assert (=> b!827034 (=> (not res!563753) (not e!460658))))

(declare-fun b!827035 () Bool)

(assert (=> b!827035 (= e!460658 (= (apply!363 lt!374728 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!35937 () Bool)

(assert (=> bm!35937 (= call!35939 (contains!4182 lt!374728 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!827036 () Bool)

(assert (=> b!827036 (= e!460655 call!35940)))

(declare-fun b!827037 () Bool)

(assert (=> b!827037 (= e!460657 (validKeyInArray!0 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827038 () Bool)

(declare-fun e!460661 () Bool)

(assert (=> b!827038 (= e!460663 e!460661)))

(declare-fun res!563758 () Bool)

(assert (=> b!827038 (= res!563758 call!35938)))

(assert (=> b!827038 (=> (not res!563758) (not e!460661))))

(declare-fun bm!35938 () Bool)

(assert (=> bm!35938 (= call!35937 call!35942)))

(declare-fun b!827039 () Bool)

(assert (=> b!827039 (= e!460663 (not call!35938))))

(declare-fun b!827040 () Bool)

(assert (=> b!827040 (= e!460665 e!460666)))

(declare-fun res!563756 () Bool)

(assert (=> b!827040 (=> (not res!563756) (not e!460666))))

(assert (=> b!827040 (= res!563756 (contains!4182 lt!374728 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827040 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(declare-fun b!827041 () Bool)

(assert (=> b!827041 (= e!460667 call!35937)))

(declare-fun b!827042 () Bool)

(declare-fun c!89504 () Bool)

(assert (=> b!827042 (= c!89504 (and (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!827042 (= e!460655 e!460667)))

(declare-fun b!827043 () Bool)

(assert (=> b!827043 (= e!460664 (validKeyInArray!0 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!827044 () Bool)

(assert (=> b!827044 (= e!460659 e!460656)))

(declare-fun c!89506 () Bool)

(assert (=> b!827044 (= c!89506 (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35939 () Bool)

(assert (=> bm!35939 (= call!35940 call!35936)))

(declare-fun b!827045 () Bool)

(assert (=> b!827045 (= e!460656 (not call!35939))))

(declare-fun b!827046 () Bool)

(declare-fun lt!374725 () Unit!28353)

(assert (=> b!827046 (= e!460660 lt!374725)))

(declare-fun lt!374717 () ListLongMap!8865)

(assert (=> b!827046 (= lt!374717 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374720 () (_ BitVec 64))

(assert (=> b!827046 (= lt!374720 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374732 () (_ BitVec 64))

(assert (=> b!827046 (= lt!374732 (select (arr!22190 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374723 () Unit!28353)

(assert (=> b!827046 (= lt!374723 (addStillContains!315 lt!374717 lt!374720 zeroValueAfter!34 lt!374732))))

(assert (=> b!827046 (contains!4182 (+!1955 lt!374717 (tuple2!10043 lt!374720 zeroValueAfter!34)) lt!374732)))

(declare-fun lt!374727 () Unit!28353)

(assert (=> b!827046 (= lt!374727 lt!374723)))

(declare-fun lt!374730 () ListLongMap!8865)

(assert (=> b!827046 (= lt!374730 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374733 () (_ BitVec 64))

(assert (=> b!827046 (= lt!374733 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374721 () (_ BitVec 64))

(assert (=> b!827046 (= lt!374721 (select (arr!22190 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374731 () Unit!28353)

(assert (=> b!827046 (= lt!374731 (addApplyDifferent!315 lt!374730 lt!374733 minValue!754 lt!374721))))

(assert (=> b!827046 (= (apply!363 (+!1955 lt!374730 (tuple2!10043 lt!374733 minValue!754)) lt!374721) (apply!363 lt!374730 lt!374721))))

(declare-fun lt!374729 () Unit!28353)

(assert (=> b!827046 (= lt!374729 lt!374731)))

(declare-fun lt!374719 () ListLongMap!8865)

(assert (=> b!827046 (= lt!374719 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374722 () (_ BitVec 64))

(assert (=> b!827046 (= lt!374722 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374736 () (_ BitVec 64))

(assert (=> b!827046 (= lt!374736 (select (arr!22190 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!374737 () Unit!28353)

(assert (=> b!827046 (= lt!374737 (addApplyDifferent!315 lt!374719 lt!374722 zeroValueAfter!34 lt!374736))))

(assert (=> b!827046 (= (apply!363 (+!1955 lt!374719 (tuple2!10043 lt!374722 zeroValueAfter!34)) lt!374736) (apply!363 lt!374719 lt!374736))))

(declare-fun lt!374738 () Unit!28353)

(assert (=> b!827046 (= lt!374738 lt!374737)))

(declare-fun lt!374726 () ListLongMap!8865)

(assert (=> b!827046 (= lt!374726 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374724 () (_ BitVec 64))

(assert (=> b!827046 (= lt!374724 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!374735 () (_ BitVec 64))

(assert (=> b!827046 (= lt!374735 (select (arr!22190 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827046 (= lt!374725 (addApplyDifferent!315 lt!374726 lt!374724 minValue!754 lt!374735))))

(assert (=> b!827046 (= (apply!363 (+!1955 lt!374726 (tuple2!10043 lt!374724 minValue!754)) lt!374735) (apply!363 lt!374726 lt!374735))))

(declare-fun b!827047 () Bool)

(assert (=> b!827047 (= e!460661 (= (apply!363 lt!374728 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueAfter!34))))

(assert (= (and d!105079 c!89501) b!827032))

(assert (= (and d!105079 (not c!89501)) b!827029))

(assert (= (and b!827029 c!89502) b!827036))

(assert (= (and b!827029 (not c!89502)) b!827042))

(assert (= (and b!827042 c!89504) b!827030))

(assert (= (and b!827042 (not c!89504)) b!827041))

(assert (= (or b!827030 b!827041) bm!35938))

(assert (= (or b!827036 bm!35938) bm!35934))

(assert (= (or b!827036 b!827030) bm!35939))

(assert (= (or b!827032 bm!35934) bm!35936))

(assert (= (or b!827032 bm!35939) bm!35935))

(assert (= (and d!105079 res!563757) b!827037))

(assert (= (and d!105079 c!89503) b!827046))

(assert (= (and d!105079 (not c!89503)) b!827027))

(assert (= (and d!105079 res!563755) b!827033))

(assert (= (and b!827033 res!563752) b!827043))

(assert (= (and b!827033 (not res!563754)) b!827040))

(assert (= (and b!827040 res!563756) b!827028))

(assert (= (and b!827033 res!563759) b!827031))

(assert (= (and b!827031 c!89505) b!827038))

(assert (= (and b!827031 (not c!89505)) b!827039))

(assert (= (and b!827038 res!563758) b!827047))

(assert (= (or b!827038 b!827039) bm!35933))

(assert (= (and b!827031 res!563760) b!827044))

(assert (= (and b!827044 c!89506) b!827034))

(assert (= (and b!827044 (not c!89506)) b!827045))

(assert (= (and b!827034 res!563753) b!827035))

(assert (= (or b!827034 b!827045) bm!35937))

(declare-fun b_lambda!11141 () Bool)

(assert (=> (not b_lambda!11141) (not b!827028)))

(assert (=> b!827028 t!22190))

(declare-fun b_and!22279 () Bool)

(assert (= b_and!22277 (and (=> t!22190 result!7961) b_and!22279)))

(declare-fun m!770087 () Bool)

(assert (=> b!827046 m!770087))

(declare-fun m!770089 () Bool)

(assert (=> b!827046 m!770089))

(declare-fun m!770091 () Bool)

(assert (=> b!827046 m!770091))

(declare-fun m!770093 () Bool)

(assert (=> b!827046 m!770093))

(declare-fun m!770095 () Bool)

(assert (=> b!827046 m!770095))

(declare-fun m!770097 () Bool)

(assert (=> b!827046 m!770097))

(assert (=> b!827046 m!769895))

(declare-fun m!770099 () Bool)

(assert (=> b!827046 m!770099))

(declare-fun m!770101 () Bool)

(assert (=> b!827046 m!770101))

(declare-fun m!770103 () Bool)

(assert (=> b!827046 m!770103))

(assert (=> b!827046 m!770087))

(declare-fun m!770105 () Bool)

(assert (=> b!827046 m!770105))

(declare-fun m!770107 () Bool)

(assert (=> b!827046 m!770107))

(assert (=> b!827046 m!770099))

(assert (=> b!827046 m!770093))

(declare-fun m!770109 () Bool)

(assert (=> b!827046 m!770109))

(assert (=> b!827046 m!769971))

(declare-fun m!770111 () Bool)

(assert (=> b!827046 m!770111))

(declare-fun m!770113 () Bool)

(assert (=> b!827046 m!770113))

(declare-fun m!770115 () Bool)

(assert (=> b!827046 m!770115))

(assert (=> b!827046 m!770113))

(assert (=> b!827043 m!769971))

(assert (=> b!827043 m!769971))

(assert (=> b!827043 m!769979))

(declare-fun m!770117 () Bool)

(assert (=> bm!35935 m!770117))

(assert (=> d!105079 m!769887))

(assert (=> b!827028 m!770055))

(assert (=> b!827028 m!770055))

(assert (=> b!827028 m!770057))

(assert (=> b!827028 m!770059))

(assert (=> b!827028 m!770057))

(assert (=> b!827028 m!769971))

(declare-fun m!770119 () Bool)

(assert (=> b!827028 m!770119))

(assert (=> b!827028 m!769971))

(declare-fun m!770121 () Bool)

(assert (=> b!827035 m!770121))

(declare-fun m!770123 () Bool)

(assert (=> b!827032 m!770123))

(declare-fun m!770125 () Bool)

(assert (=> b!827047 m!770125))

(declare-fun m!770127 () Bool)

(assert (=> bm!35933 m!770127))

(assert (=> b!827040 m!769971))

(assert (=> b!827040 m!769971))

(declare-fun m!770129 () Bool)

(assert (=> b!827040 m!770129))

(assert (=> bm!35936 m!769895))

(declare-fun m!770131 () Bool)

(assert (=> bm!35937 m!770131))

(assert (=> b!827037 m!769971))

(assert (=> b!827037 m!769971))

(assert (=> b!827037 m!769979))

(assert (=> b!826887 d!105079))

(declare-fun d!105081 () Bool)

(declare-fun e!460668 () Bool)

(assert (=> d!105081 e!460668))

(declare-fun res!563762 () Bool)

(assert (=> d!105081 (=> (not res!563762) (not e!460668))))

(declare-fun lt!374739 () ListLongMap!8865)

(assert (=> d!105081 (= res!563762 (contains!4182 lt!374739 (_1!5032 lt!374576)))))

(declare-fun lt!374740 () List!15839)

(assert (=> d!105081 (= lt!374739 (ListLongMap!8866 lt!374740))))

(declare-fun lt!374742 () Unit!28353)

(declare-fun lt!374741 () Unit!28353)

(assert (=> d!105081 (= lt!374742 lt!374741)))

(assert (=> d!105081 (= (getValueByKey!407 lt!374740 (_1!5032 lt!374576)) (Some!412 (_2!5032 lt!374576)))))

(assert (=> d!105081 (= lt!374741 (lemmaContainsTupThenGetReturnValue!221 lt!374740 (_1!5032 lt!374576) (_2!5032 lt!374576)))))

(assert (=> d!105081 (= lt!374740 (insertStrictlySorted!260 (toList!4448 lt!374572) (_1!5032 lt!374576) (_2!5032 lt!374576)))))

(assert (=> d!105081 (= (+!1955 lt!374572 lt!374576) lt!374739)))

(declare-fun b!827048 () Bool)

(declare-fun res!563761 () Bool)

(assert (=> b!827048 (=> (not res!563761) (not e!460668))))

(assert (=> b!827048 (= res!563761 (= (getValueByKey!407 (toList!4448 lt!374739) (_1!5032 lt!374576)) (Some!412 (_2!5032 lt!374576))))))

(declare-fun b!827049 () Bool)

(assert (=> b!827049 (= e!460668 (contains!4183 (toList!4448 lt!374739) lt!374576))))

(assert (= (and d!105081 res!563762) b!827048))

(assert (= (and b!827048 res!563761) b!827049))

(declare-fun m!770133 () Bool)

(assert (=> d!105081 m!770133))

(declare-fun m!770135 () Bool)

(assert (=> d!105081 m!770135))

(declare-fun m!770137 () Bool)

(assert (=> d!105081 m!770137))

(declare-fun m!770139 () Bool)

(assert (=> d!105081 m!770139))

(declare-fun m!770141 () Bool)

(assert (=> b!827048 m!770141))

(declare-fun m!770143 () Bool)

(assert (=> b!827049 m!770143))

(assert (=> b!826887 d!105081))

(declare-fun d!105083 () Bool)

(assert (=> d!105083 (= (+!1955 lt!374574 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) (+!1955 (+!1955 lt!374574 (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34)) (tuple2!10043 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)))))

(declare-fun lt!374745 () Unit!28353)

(declare-fun choose!1407 (ListLongMap!8865 (_ BitVec 64) V!25077 V!25077) Unit!28353)

(assert (=> d!105083 (= lt!374745 (choose!1407 lt!374574 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> d!105083 (= (addSameAsAddTwiceSameKeyDiffValues!235 lt!374574 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34) lt!374745)))

(declare-fun bs!23100 () Bool)

(assert (= bs!23100 d!105083))

(declare-fun m!770145 () Bool)

(assert (=> bs!23100 m!770145))

(declare-fun m!770147 () Bool)

(assert (=> bs!23100 m!770147))

(assert (=> bs!23100 m!770147))

(declare-fun m!770149 () Bool)

(assert (=> bs!23100 m!770149))

(declare-fun m!770151 () Bool)

(assert (=> bs!23100 m!770151))

(assert (=> b!826887 d!105083))

(declare-fun d!105085 () Bool)

(declare-fun e!460669 () Bool)

(assert (=> d!105085 e!460669))

(declare-fun res!563764 () Bool)

(assert (=> d!105085 (=> (not res!563764) (not e!460669))))

(declare-fun lt!374746 () ListLongMap!8865)

(assert (=> d!105085 (= res!563764 (contains!4182 lt!374746 (_1!5032 lt!374576)))))

(declare-fun lt!374747 () List!15839)

(assert (=> d!105085 (= lt!374746 (ListLongMap!8866 lt!374747))))

(declare-fun lt!374749 () Unit!28353)

(declare-fun lt!374748 () Unit!28353)

(assert (=> d!105085 (= lt!374749 lt!374748)))

(assert (=> d!105085 (= (getValueByKey!407 lt!374747 (_1!5032 lt!374576)) (Some!412 (_2!5032 lt!374576)))))

(assert (=> d!105085 (= lt!374748 (lemmaContainsTupThenGetReturnValue!221 lt!374747 (_1!5032 lt!374576) (_2!5032 lt!374576)))))

(assert (=> d!105085 (= lt!374747 (insertStrictlySorted!260 (toList!4448 lt!374566) (_1!5032 lt!374576) (_2!5032 lt!374576)))))

(assert (=> d!105085 (= (+!1955 lt!374566 lt!374576) lt!374746)))

(declare-fun b!827050 () Bool)

(declare-fun res!563763 () Bool)

(assert (=> b!827050 (=> (not res!563763) (not e!460669))))

(assert (=> b!827050 (= res!563763 (= (getValueByKey!407 (toList!4448 lt!374746) (_1!5032 lt!374576)) (Some!412 (_2!5032 lt!374576))))))

(declare-fun b!827051 () Bool)

(assert (=> b!827051 (= e!460669 (contains!4183 (toList!4448 lt!374746) lt!374576))))

(assert (= (and d!105085 res!563764) b!827050))

(assert (= (and b!827050 res!563763) b!827051))

(declare-fun m!770153 () Bool)

(assert (=> d!105085 m!770153))

(declare-fun m!770155 () Bool)

(assert (=> d!105085 m!770155))

(declare-fun m!770157 () Bool)

(assert (=> d!105085 m!770157))

(declare-fun m!770159 () Bool)

(assert (=> d!105085 m!770159))

(declare-fun m!770161 () Bool)

(assert (=> b!827050 m!770161))

(declare-fun m!770163 () Bool)

(assert (=> b!827051 m!770163))

(assert (=> b!826887 d!105085))

(declare-fun d!105087 () Bool)

(declare-fun e!460670 () Bool)

(assert (=> d!105087 e!460670))

(declare-fun res!563766 () Bool)

(assert (=> d!105087 (=> (not res!563766) (not e!460670))))

(declare-fun lt!374750 () ListLongMap!8865)

(assert (=> d!105087 (= res!563766 (contains!4182 lt!374750 (_1!5032 lt!374575)))))

(declare-fun lt!374751 () List!15839)

(assert (=> d!105087 (= lt!374750 (ListLongMap!8866 lt!374751))))

(declare-fun lt!374753 () Unit!28353)

(declare-fun lt!374752 () Unit!28353)

(assert (=> d!105087 (= lt!374753 lt!374752)))

(assert (=> d!105087 (= (getValueByKey!407 lt!374751 (_1!5032 lt!374575)) (Some!412 (_2!5032 lt!374575)))))

(assert (=> d!105087 (= lt!374752 (lemmaContainsTupThenGetReturnValue!221 lt!374751 (_1!5032 lt!374575) (_2!5032 lt!374575)))))

(assert (=> d!105087 (= lt!374751 (insertStrictlySorted!260 (toList!4448 (+!1955 lt!374572 lt!374573)) (_1!5032 lt!374575) (_2!5032 lt!374575)))))

(assert (=> d!105087 (= (+!1955 (+!1955 lt!374572 lt!374573) lt!374575) lt!374750)))

(declare-fun b!827052 () Bool)

(declare-fun res!563765 () Bool)

(assert (=> b!827052 (=> (not res!563765) (not e!460670))))

(assert (=> b!827052 (= res!563765 (= (getValueByKey!407 (toList!4448 lt!374750) (_1!5032 lt!374575)) (Some!412 (_2!5032 lt!374575))))))

(declare-fun b!827053 () Bool)

(assert (=> b!827053 (= e!460670 (contains!4183 (toList!4448 lt!374750) lt!374575))))

(assert (= (and d!105087 res!563766) b!827052))

(assert (= (and b!827052 res!563765) b!827053))

(declare-fun m!770165 () Bool)

(assert (=> d!105087 m!770165))

(declare-fun m!770167 () Bool)

(assert (=> d!105087 m!770167))

(declare-fun m!770169 () Bool)

(assert (=> d!105087 m!770169))

(declare-fun m!770171 () Bool)

(assert (=> d!105087 m!770171))

(declare-fun m!770173 () Bool)

(assert (=> b!827052 m!770173))

(declare-fun m!770175 () Bool)

(assert (=> b!827053 m!770175))

(assert (=> b!826887 d!105087))

(declare-fun d!105089 () Bool)

(declare-fun e!460671 () Bool)

(assert (=> d!105089 e!460671))

(declare-fun res!563768 () Bool)

(assert (=> d!105089 (=> (not res!563768) (not e!460671))))

(declare-fun lt!374754 () ListLongMap!8865)

(assert (=> d!105089 (= res!563768 (contains!4182 lt!374754 (_1!5032 lt!374573)))))

(declare-fun lt!374755 () List!15839)

(assert (=> d!105089 (= lt!374754 (ListLongMap!8866 lt!374755))))

(declare-fun lt!374757 () Unit!28353)

(declare-fun lt!374756 () Unit!28353)

(assert (=> d!105089 (= lt!374757 lt!374756)))

(assert (=> d!105089 (= (getValueByKey!407 lt!374755 (_1!5032 lt!374573)) (Some!412 (_2!5032 lt!374573)))))

(assert (=> d!105089 (= lt!374756 (lemmaContainsTupThenGetReturnValue!221 lt!374755 (_1!5032 lt!374573) (_2!5032 lt!374573)))))

(assert (=> d!105089 (= lt!374755 (insertStrictlySorted!260 (toList!4448 lt!374572) (_1!5032 lt!374573) (_2!5032 lt!374573)))))

(assert (=> d!105089 (= (+!1955 lt!374572 lt!374573) lt!374754)))

(declare-fun b!827054 () Bool)

(declare-fun res!563767 () Bool)

(assert (=> b!827054 (=> (not res!563767) (not e!460671))))

(assert (=> b!827054 (= res!563767 (= (getValueByKey!407 (toList!4448 lt!374754) (_1!5032 lt!374573)) (Some!412 (_2!5032 lt!374573))))))

(declare-fun b!827055 () Bool)

(assert (=> b!827055 (= e!460671 (contains!4183 (toList!4448 lt!374754) lt!374573))))

(assert (= (and d!105089 res!563768) b!827054))

(assert (= (and b!827054 res!563767) b!827055))

(declare-fun m!770177 () Bool)

(assert (=> d!105089 m!770177))

(declare-fun m!770179 () Bool)

(assert (=> d!105089 m!770179))

(declare-fun m!770181 () Bool)

(assert (=> d!105089 m!770181))

(declare-fun m!770183 () Bool)

(assert (=> d!105089 m!770183))

(declare-fun m!770185 () Bool)

(assert (=> b!827054 m!770185))

(declare-fun m!770187 () Bool)

(assert (=> b!827055 m!770187))

(assert (=> b!826887 d!105089))

(declare-fun d!105091 () Bool)

(declare-fun e!460672 () Bool)

(assert (=> d!105091 e!460672))

(declare-fun res!563770 () Bool)

(assert (=> d!105091 (=> (not res!563770) (not e!460672))))

(declare-fun lt!374758 () ListLongMap!8865)

(assert (=> d!105091 (= res!563770 (contains!4182 lt!374758 (_1!5032 lt!374575)))))

(declare-fun lt!374759 () List!15839)

(assert (=> d!105091 (= lt!374758 (ListLongMap!8866 lt!374759))))

(declare-fun lt!374761 () Unit!28353)

(declare-fun lt!374760 () Unit!28353)

(assert (=> d!105091 (= lt!374761 lt!374760)))

(assert (=> d!105091 (= (getValueByKey!407 lt!374759 (_1!5032 lt!374575)) (Some!412 (_2!5032 lt!374575)))))

(assert (=> d!105091 (= lt!374760 (lemmaContainsTupThenGetReturnValue!221 lt!374759 (_1!5032 lt!374575) (_2!5032 lt!374575)))))

(assert (=> d!105091 (= lt!374759 (insertStrictlySorted!260 (toList!4448 lt!374572) (_1!5032 lt!374575) (_2!5032 lt!374575)))))

(assert (=> d!105091 (= (+!1955 lt!374572 lt!374575) lt!374758)))

(declare-fun b!827056 () Bool)

(declare-fun res!563769 () Bool)

(assert (=> b!827056 (=> (not res!563769) (not e!460672))))

(assert (=> b!827056 (= res!563769 (= (getValueByKey!407 (toList!4448 lt!374758) (_1!5032 lt!374575)) (Some!412 (_2!5032 lt!374575))))))

(declare-fun b!827057 () Bool)

(assert (=> b!827057 (= e!460672 (contains!4183 (toList!4448 lt!374758) lt!374575))))

(assert (= (and d!105091 res!563770) b!827056))

(assert (= (and b!827056 res!563769) b!827057))

(declare-fun m!770189 () Bool)

(assert (=> d!105091 m!770189))

(declare-fun m!770191 () Bool)

(assert (=> d!105091 m!770191))

(declare-fun m!770193 () Bool)

(assert (=> d!105091 m!770193))

(declare-fun m!770195 () Bool)

(assert (=> d!105091 m!770195))

(declare-fun m!770197 () Bool)

(assert (=> b!827056 m!770197))

(declare-fun m!770199 () Bool)

(assert (=> b!827057 m!770199))

(assert (=> b!826887 d!105091))

(declare-fun d!105093 () Bool)

(declare-fun e!460673 () Bool)

(assert (=> d!105093 e!460673))

(declare-fun res!563772 () Bool)

(assert (=> d!105093 (=> (not res!563772) (not e!460673))))

(declare-fun lt!374762 () ListLongMap!8865)

(assert (=> d!105093 (= res!563772 (contains!4182 lt!374762 (_1!5032 lt!374576)))))

(declare-fun lt!374763 () List!15839)

(assert (=> d!105093 (= lt!374762 (ListLongMap!8866 lt!374763))))

(declare-fun lt!374765 () Unit!28353)

(declare-fun lt!374764 () Unit!28353)

(assert (=> d!105093 (= lt!374765 lt!374764)))

(assert (=> d!105093 (= (getValueByKey!407 lt!374763 (_1!5032 lt!374576)) (Some!412 (_2!5032 lt!374576)))))

(assert (=> d!105093 (= lt!374764 (lemmaContainsTupThenGetReturnValue!221 lt!374763 (_1!5032 lt!374576) (_2!5032 lt!374576)))))

(assert (=> d!105093 (= lt!374763 (insertStrictlySorted!260 (toList!4448 lt!374574) (_1!5032 lt!374576) (_2!5032 lt!374576)))))

(assert (=> d!105093 (= (+!1955 lt!374574 lt!374576) lt!374762)))

(declare-fun b!827058 () Bool)

(declare-fun res!563771 () Bool)

(assert (=> b!827058 (=> (not res!563771) (not e!460673))))

(assert (=> b!827058 (= res!563771 (= (getValueByKey!407 (toList!4448 lt!374762) (_1!5032 lt!374576)) (Some!412 (_2!5032 lt!374576))))))

(declare-fun b!827059 () Bool)

(assert (=> b!827059 (= e!460673 (contains!4183 (toList!4448 lt!374762) lt!374576))))

(assert (= (and d!105093 res!563772) b!827058))

(assert (= (and b!827058 res!563771) b!827059))

(declare-fun m!770201 () Bool)

(assert (=> d!105093 m!770201))

(declare-fun m!770203 () Bool)

(assert (=> d!105093 m!770203))

(declare-fun m!770205 () Bool)

(assert (=> d!105093 m!770205))

(declare-fun m!770207 () Bool)

(assert (=> d!105093 m!770207))

(declare-fun m!770209 () Bool)

(assert (=> b!827058 m!770209))

(declare-fun m!770211 () Bool)

(assert (=> b!827059 m!770211))

(assert (=> b!826887 d!105093))

(declare-fun d!105095 () Bool)

(assert (=> d!105095 (= (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!374768 () Unit!28353)

(declare-fun choose!1408 (array!46290 array!46292 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25077 V!25077 V!25077 V!25077 (_ BitVec 32) Int) Unit!28353)

(assert (=> d!105095 (= lt!374768 (choose!1408 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!105095 (validMask!0 mask!1312)))

(assert (=> d!105095 (= (lemmaNoChangeToArrayThenSameMapNoExtras!561 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374768)))

(declare-fun bs!23101 () Bool)

(assert (= bs!23101 d!105095))

(assert (=> bs!23101 m!769897))

(assert (=> bs!23101 m!769895))

(declare-fun m!770213 () Bool)

(assert (=> bs!23101 m!770213))

(assert (=> bs!23101 m!769887))

(assert (=> b!826888 d!105095))

(declare-fun b!827084 () Bool)

(declare-fun e!460690 () ListLongMap!8865)

(declare-fun e!460693 () ListLongMap!8865)

(assert (=> b!827084 (= e!460690 e!460693)))

(declare-fun c!89515 () Bool)

(assert (=> b!827084 (= c!89515 (validKeyInArray!0 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35942 () Bool)

(declare-fun call!35945 () ListLongMap!8865)

(assert (=> bm!35942 (= call!35945 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!827085 () Bool)

(assert (=> b!827085 (= e!460690 (ListLongMap!8866 Nil!15836))))

(declare-fun d!105097 () Bool)

(declare-fun e!460691 () Bool)

(assert (=> d!105097 e!460691))

(declare-fun res!563784 () Bool)

(assert (=> d!105097 (=> (not res!563784) (not e!460691))))

(declare-fun lt!374788 () ListLongMap!8865)

(assert (=> d!105097 (= res!563784 (not (contains!4182 lt!374788 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105097 (= lt!374788 e!460690)))

(declare-fun c!89517 () Bool)

(assert (=> d!105097 (= c!89517 (bvsge #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(assert (=> d!105097 (validMask!0 mask!1312)))

(assert (=> d!105097 (= (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374788)))

(declare-fun b!827086 () Bool)

(assert (=> b!827086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(assert (=> b!827086 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22612 _values!788)))))

(declare-fun e!460694 () Bool)

(assert (=> b!827086 (= e!460694 (= (apply!363 lt!374788 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)) (get!11758 (select (arr!22191 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!827087 () Bool)

(declare-fun e!460692 () Bool)

(assert (=> b!827087 (= e!460691 e!460692)))

(declare-fun c!89518 () Bool)

(declare-fun e!460688 () Bool)

(assert (=> b!827087 (= c!89518 e!460688)))

(declare-fun res!563783 () Bool)

(assert (=> b!827087 (=> (not res!563783) (not e!460688))))

(assert (=> b!827087 (= res!563783 (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(declare-fun b!827088 () Bool)

(assert (=> b!827088 (= e!460693 call!35945)))

(declare-fun b!827089 () Bool)

(declare-fun e!460689 () Bool)

(declare-fun isEmpty!645 (ListLongMap!8865) Bool)

(assert (=> b!827089 (= e!460689 (isEmpty!645 lt!374788))))

(declare-fun b!827090 () Bool)

(assert (=> b!827090 (= e!460688 (validKeyInArray!0 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827090 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!827091 () Bool)

(assert (=> b!827091 (= e!460692 e!460694)))

(assert (=> b!827091 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(declare-fun res!563782 () Bool)

(assert (=> b!827091 (= res!563782 (contains!4182 lt!374788 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827091 (=> (not res!563782) (not e!460694))))

(declare-fun b!827092 () Bool)

(declare-fun res!563781 () Bool)

(assert (=> b!827092 (=> (not res!563781) (not e!460691))))

(assert (=> b!827092 (= res!563781 (not (contains!4182 lt!374788 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!827093 () Bool)

(declare-fun lt!374783 () Unit!28353)

(declare-fun lt!374787 () Unit!28353)

(assert (=> b!827093 (= lt!374783 lt!374787)))

(declare-fun lt!374786 () (_ BitVec 64))

(declare-fun lt!374789 () ListLongMap!8865)

(declare-fun lt!374785 () V!25077)

(declare-fun lt!374784 () (_ BitVec 64))

(assert (=> b!827093 (not (contains!4182 (+!1955 lt!374789 (tuple2!10043 lt!374784 lt!374785)) lt!374786))))

(declare-fun addStillNotContains!188 (ListLongMap!8865 (_ BitVec 64) V!25077 (_ BitVec 64)) Unit!28353)

(assert (=> b!827093 (= lt!374787 (addStillNotContains!188 lt!374789 lt!374784 lt!374785 lt!374786))))

(assert (=> b!827093 (= lt!374786 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!827093 (= lt!374785 (get!11758 (select (arr!22191 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!827093 (= lt!374784 (select (arr!22190 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827093 (= lt!374789 call!35945)))

(assert (=> b!827093 (= e!460693 (+!1955 call!35945 (tuple2!10043 (select (arr!22190 _keys!976) #b00000000000000000000000000000000) (get!11758 (select (arr!22191 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!827094 () Bool)

(assert (=> b!827094 (= e!460689 (= lt!374788 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!827095 () Bool)

(assert (=> b!827095 (= e!460692 e!460689)))

(declare-fun c!89516 () Bool)

(assert (=> b!827095 (= c!89516 (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(assert (= (and d!105097 c!89517) b!827085))

(assert (= (and d!105097 (not c!89517)) b!827084))

(assert (= (and b!827084 c!89515) b!827093))

(assert (= (and b!827084 (not c!89515)) b!827088))

(assert (= (or b!827093 b!827088) bm!35942))

(assert (= (and d!105097 res!563784) b!827092))

(assert (= (and b!827092 res!563781) b!827087))

(assert (= (and b!827087 res!563783) b!827090))

(assert (= (and b!827087 c!89518) b!827091))

(assert (= (and b!827087 (not c!89518)) b!827095))

(assert (= (and b!827091 res!563782) b!827086))

(assert (= (and b!827095 c!89516) b!827094))

(assert (= (and b!827095 (not c!89516)) b!827089))

(declare-fun b_lambda!11143 () Bool)

(assert (=> (not b_lambda!11143) (not b!827086)))

(assert (=> b!827086 t!22190))

(declare-fun b_and!22281 () Bool)

(assert (= b_and!22279 (and (=> t!22190 result!7961) b_and!22281)))

(declare-fun b_lambda!11145 () Bool)

(assert (=> (not b_lambda!11145) (not b!827093)))

(assert (=> b!827093 t!22190))

(declare-fun b_and!22283 () Bool)

(assert (= b_and!22281 (and (=> t!22190 result!7961) b_and!22283)))

(declare-fun m!770215 () Bool)

(assert (=> b!827089 m!770215))

(assert (=> b!827086 m!770055))

(assert (=> b!827086 m!770057))

(assert (=> b!827086 m!770059))

(assert (=> b!827086 m!770057))

(assert (=> b!827086 m!770055))

(assert (=> b!827086 m!769971))

(assert (=> b!827086 m!769971))

(declare-fun m!770217 () Bool)

(assert (=> b!827086 m!770217))

(declare-fun m!770219 () Bool)

(assert (=> d!105097 m!770219))

(assert (=> d!105097 m!769887))

(declare-fun m!770221 () Bool)

(assert (=> b!827092 m!770221))

(declare-fun m!770223 () Bool)

(assert (=> bm!35942 m!770223))

(assert (=> b!827090 m!769971))

(assert (=> b!827090 m!769971))

(assert (=> b!827090 m!769979))

(assert (=> b!827084 m!769971))

(assert (=> b!827084 m!769971))

(assert (=> b!827084 m!769979))

(assert (=> b!827093 m!770055))

(assert (=> b!827093 m!770057))

(assert (=> b!827093 m!770059))

(assert (=> b!827093 m!770057))

(assert (=> b!827093 m!770055))

(assert (=> b!827093 m!769971))

(declare-fun m!770225 () Bool)

(assert (=> b!827093 m!770225))

(declare-fun m!770227 () Bool)

(assert (=> b!827093 m!770227))

(assert (=> b!827093 m!770227))

(declare-fun m!770229 () Bool)

(assert (=> b!827093 m!770229))

(declare-fun m!770231 () Bool)

(assert (=> b!827093 m!770231))

(assert (=> b!827094 m!770223))

(assert (=> b!827091 m!769971))

(assert (=> b!827091 m!769971))

(declare-fun m!770233 () Bool)

(assert (=> b!827091 m!770233))

(assert (=> b!826888 d!105097))

(declare-fun b!827096 () Bool)

(declare-fun e!460697 () ListLongMap!8865)

(declare-fun e!460700 () ListLongMap!8865)

(assert (=> b!827096 (= e!460697 e!460700)))

(declare-fun c!89519 () Bool)

(assert (=> b!827096 (= c!89519 (validKeyInArray!0 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun bm!35943 () Bool)

(declare-fun call!35946 () ListLongMap!8865)

(assert (=> bm!35943 (= call!35946 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!827097 () Bool)

(assert (=> b!827097 (= e!460697 (ListLongMap!8866 Nil!15836))))

(declare-fun d!105099 () Bool)

(declare-fun e!460698 () Bool)

(assert (=> d!105099 e!460698))

(declare-fun res!563788 () Bool)

(assert (=> d!105099 (=> (not res!563788) (not e!460698))))

(declare-fun lt!374795 () ListLongMap!8865)

(assert (=> d!105099 (= res!563788 (not (contains!4182 lt!374795 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!105099 (= lt!374795 e!460697)))

(declare-fun c!89521 () Bool)

(assert (=> d!105099 (= c!89521 (bvsge #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(assert (=> d!105099 (validMask!0 mask!1312)))

(assert (=> d!105099 (= (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!374795)))

(declare-fun b!827098 () Bool)

(assert (=> b!827098 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(assert (=> b!827098 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22612 _values!788)))))

(declare-fun e!460701 () Bool)

(assert (=> b!827098 (= e!460701 (= (apply!363 lt!374795 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)) (get!11758 (select (arr!22191 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!827099 () Bool)

(declare-fun e!460699 () Bool)

(assert (=> b!827099 (= e!460698 e!460699)))

(declare-fun c!89522 () Bool)

(declare-fun e!460695 () Bool)

(assert (=> b!827099 (= c!89522 e!460695)))

(declare-fun res!563787 () Bool)

(assert (=> b!827099 (=> (not res!563787) (not e!460695))))

(assert (=> b!827099 (= res!563787 (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(declare-fun b!827100 () Bool)

(assert (=> b!827100 (= e!460700 call!35946)))

(declare-fun b!827101 () Bool)

(declare-fun e!460696 () Bool)

(assert (=> b!827101 (= e!460696 (isEmpty!645 lt!374795))))

(declare-fun b!827102 () Bool)

(assert (=> b!827102 (= e!460695 (validKeyInArray!0 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827102 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!827103 () Bool)

(assert (=> b!827103 (= e!460699 e!460701)))

(assert (=> b!827103 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(declare-fun res!563786 () Bool)

(assert (=> b!827103 (= res!563786 (contains!4182 lt!374795 (select (arr!22190 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!827103 (=> (not res!563786) (not e!460701))))

(declare-fun b!827104 () Bool)

(declare-fun res!563785 () Bool)

(assert (=> b!827104 (=> (not res!563785) (not e!460698))))

(assert (=> b!827104 (= res!563785 (not (contains!4182 lt!374795 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!827105 () Bool)

(declare-fun lt!374790 () Unit!28353)

(declare-fun lt!374794 () Unit!28353)

(assert (=> b!827105 (= lt!374790 lt!374794)))

(declare-fun lt!374796 () ListLongMap!8865)

(declare-fun lt!374793 () (_ BitVec 64))

(declare-fun lt!374792 () V!25077)

(declare-fun lt!374791 () (_ BitVec 64))

(assert (=> b!827105 (not (contains!4182 (+!1955 lt!374796 (tuple2!10043 lt!374791 lt!374792)) lt!374793))))

(assert (=> b!827105 (= lt!374794 (addStillNotContains!188 lt!374796 lt!374791 lt!374792 lt!374793))))

(assert (=> b!827105 (= lt!374793 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!827105 (= lt!374792 (get!11758 (select (arr!22191 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!827105 (= lt!374791 (select (arr!22190 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!827105 (= lt!374796 call!35946)))

(assert (=> b!827105 (= e!460700 (+!1955 call!35946 (tuple2!10043 (select (arr!22190 _keys!976) #b00000000000000000000000000000000) (get!11758 (select (arr!22191 _values!788) #b00000000000000000000000000000000) (dynLambda!974 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!827106 () Bool)

(assert (=> b!827106 (= e!460696 (= lt!374795 (getCurrentListMapNoExtraKeys!2451 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!827107 () Bool)

(assert (=> b!827107 (= e!460699 e!460696)))

(declare-fun c!89520 () Bool)

(assert (=> b!827107 (= c!89520 (bvslt #b00000000000000000000000000000000 (size!22611 _keys!976)))))

(assert (= (and d!105099 c!89521) b!827097))

(assert (= (and d!105099 (not c!89521)) b!827096))

(assert (= (and b!827096 c!89519) b!827105))

(assert (= (and b!827096 (not c!89519)) b!827100))

(assert (= (or b!827105 b!827100) bm!35943))

(assert (= (and d!105099 res!563788) b!827104))

(assert (= (and b!827104 res!563785) b!827099))

(assert (= (and b!827099 res!563787) b!827102))

(assert (= (and b!827099 c!89522) b!827103))

(assert (= (and b!827099 (not c!89522)) b!827107))

(assert (= (and b!827103 res!563786) b!827098))

(assert (= (and b!827107 c!89520) b!827106))

(assert (= (and b!827107 (not c!89520)) b!827101))

(declare-fun b_lambda!11147 () Bool)

(assert (=> (not b_lambda!11147) (not b!827098)))

(assert (=> b!827098 t!22190))

(declare-fun b_and!22285 () Bool)

(assert (= b_and!22283 (and (=> t!22190 result!7961) b_and!22285)))

(declare-fun b_lambda!11149 () Bool)

(assert (=> (not b_lambda!11149) (not b!827105)))

(assert (=> b!827105 t!22190))

(declare-fun b_and!22287 () Bool)

(assert (= b_and!22285 (and (=> t!22190 result!7961) b_and!22287)))

(declare-fun m!770235 () Bool)

(assert (=> b!827101 m!770235))

(assert (=> b!827098 m!770055))

(assert (=> b!827098 m!770057))

(assert (=> b!827098 m!770059))

(assert (=> b!827098 m!770057))

(assert (=> b!827098 m!770055))

(assert (=> b!827098 m!769971))

(assert (=> b!827098 m!769971))

(declare-fun m!770237 () Bool)

(assert (=> b!827098 m!770237))

(declare-fun m!770239 () Bool)

(assert (=> d!105099 m!770239))

(assert (=> d!105099 m!769887))

(declare-fun m!770241 () Bool)

(assert (=> b!827104 m!770241))

(declare-fun m!770243 () Bool)

(assert (=> bm!35943 m!770243))

(assert (=> b!827102 m!769971))

(assert (=> b!827102 m!769971))

(assert (=> b!827102 m!769979))

(assert (=> b!827096 m!769971))

(assert (=> b!827096 m!769971))

(assert (=> b!827096 m!769979))

(assert (=> b!827105 m!770055))

(assert (=> b!827105 m!770057))

(assert (=> b!827105 m!770059))

(assert (=> b!827105 m!770057))

(assert (=> b!827105 m!770055))

(assert (=> b!827105 m!769971))

(declare-fun m!770245 () Bool)

(assert (=> b!827105 m!770245))

(declare-fun m!770247 () Bool)

(assert (=> b!827105 m!770247))

(assert (=> b!827105 m!770247))

(declare-fun m!770249 () Bool)

(assert (=> b!827105 m!770249))

(declare-fun m!770251 () Bool)

(assert (=> b!827105 m!770251))

(assert (=> b!827106 m!770243))

(assert (=> b!827103 m!769971))

(assert (=> b!827103 m!769971))

(declare-fun m!770253 () Bool)

(assert (=> b!827103 m!770253))

(assert (=> b!826888 d!105099))

(declare-fun d!105101 () Bool)

(declare-fun e!460702 () Bool)

(assert (=> d!105101 e!460702))

(declare-fun res!563790 () Bool)

(assert (=> d!105101 (=> (not res!563790) (not e!460702))))

(declare-fun lt!374797 () ListLongMap!8865)

(assert (=> d!105101 (= res!563790 (contains!4182 lt!374797 (_1!5032 lt!374576)))))

(declare-fun lt!374798 () List!15839)

(assert (=> d!105101 (= lt!374797 (ListLongMap!8866 lt!374798))))

(declare-fun lt!374800 () Unit!28353)

(declare-fun lt!374799 () Unit!28353)

(assert (=> d!105101 (= lt!374800 lt!374799)))

(assert (=> d!105101 (= (getValueByKey!407 lt!374798 (_1!5032 lt!374576)) (Some!412 (_2!5032 lt!374576)))))

(assert (=> d!105101 (= lt!374799 (lemmaContainsTupThenGetReturnValue!221 lt!374798 (_1!5032 lt!374576) (_2!5032 lt!374576)))))

(assert (=> d!105101 (= lt!374798 (insertStrictlySorted!260 (toList!4448 (+!1955 lt!374567 lt!374575)) (_1!5032 lt!374576) (_2!5032 lt!374576)))))

(assert (=> d!105101 (= (+!1955 (+!1955 lt!374567 lt!374575) lt!374576) lt!374797)))

(declare-fun b!827108 () Bool)

(declare-fun res!563789 () Bool)

(assert (=> b!827108 (=> (not res!563789) (not e!460702))))

(assert (=> b!827108 (= res!563789 (= (getValueByKey!407 (toList!4448 lt!374797) (_1!5032 lt!374576)) (Some!412 (_2!5032 lt!374576))))))

(declare-fun b!827109 () Bool)

(assert (=> b!827109 (= e!460702 (contains!4183 (toList!4448 lt!374797) lt!374576))))

(assert (= (and d!105101 res!563790) b!827108))

(assert (= (and b!827108 res!563789) b!827109))

(declare-fun m!770255 () Bool)

(assert (=> d!105101 m!770255))

(declare-fun m!770257 () Bool)

(assert (=> d!105101 m!770257))

(declare-fun m!770259 () Bool)

(assert (=> d!105101 m!770259))

(declare-fun m!770261 () Bool)

(assert (=> d!105101 m!770261))

(declare-fun m!770263 () Bool)

(assert (=> b!827108 m!770263))

(declare-fun m!770265 () Bool)

(assert (=> b!827109 m!770265))

(assert (=> b!826883 d!105101))

(declare-fun d!105103 () Bool)

(declare-fun e!460703 () Bool)

(assert (=> d!105103 e!460703))

(declare-fun res!563792 () Bool)

(assert (=> d!105103 (=> (not res!563792) (not e!460703))))

(declare-fun lt!374801 () ListLongMap!8865)

(assert (=> d!105103 (= res!563792 (contains!4182 lt!374801 (_1!5032 lt!374575)))))

(declare-fun lt!374802 () List!15839)

(assert (=> d!105103 (= lt!374801 (ListLongMap!8866 lt!374802))))

(declare-fun lt!374804 () Unit!28353)

(declare-fun lt!374803 () Unit!28353)

(assert (=> d!105103 (= lt!374804 lt!374803)))

(assert (=> d!105103 (= (getValueByKey!407 lt!374802 (_1!5032 lt!374575)) (Some!412 (_2!5032 lt!374575)))))

(assert (=> d!105103 (= lt!374803 (lemmaContainsTupThenGetReturnValue!221 lt!374802 (_1!5032 lt!374575) (_2!5032 lt!374575)))))

(assert (=> d!105103 (= lt!374802 (insertStrictlySorted!260 (toList!4448 lt!374567) (_1!5032 lt!374575) (_2!5032 lt!374575)))))

(assert (=> d!105103 (= (+!1955 lt!374567 lt!374575) lt!374801)))

(declare-fun b!827110 () Bool)

(declare-fun res!563791 () Bool)

(assert (=> b!827110 (=> (not res!563791) (not e!460703))))

(assert (=> b!827110 (= res!563791 (= (getValueByKey!407 (toList!4448 lt!374801) (_1!5032 lt!374575)) (Some!412 (_2!5032 lt!374575))))))

(declare-fun b!827111 () Bool)

(assert (=> b!827111 (= e!460703 (contains!4183 (toList!4448 lt!374801) lt!374575))))

(assert (= (and d!105103 res!563792) b!827110))

(assert (= (and b!827110 res!563791) b!827111))

(declare-fun m!770267 () Bool)

(assert (=> d!105103 m!770267))

(declare-fun m!770269 () Bool)

(assert (=> d!105103 m!770269))

(declare-fun m!770271 () Bool)

(assert (=> d!105103 m!770271))

(declare-fun m!770273 () Bool)

(assert (=> d!105103 m!770273))

(declare-fun m!770275 () Bool)

(assert (=> b!827110 m!770275))

(declare-fun m!770277 () Bool)

(assert (=> b!827111 m!770277))

(assert (=> b!826883 d!105103))

(declare-fun mapIsEmpty!24217 () Bool)

(declare-fun mapRes!24217 () Bool)

(assert (=> mapIsEmpty!24217 mapRes!24217))

(declare-fun b!827118 () Bool)

(declare-fun e!460709 () Bool)

(assert (=> b!827118 (= e!460709 tp_is_empty!15057)))

(declare-fun b!827119 () Bool)

(declare-fun e!460708 () Bool)

(assert (=> b!827119 (= e!460708 tp_is_empty!15057)))

(declare-fun condMapEmpty!24217 () Bool)

(declare-fun mapDefault!24217 () ValueCell!7113)

(assert (=> mapNonEmpty!24211 (= condMapEmpty!24217 (= mapRest!24211 ((as const (Array (_ BitVec 32) ValueCell!7113)) mapDefault!24217)))))

(assert (=> mapNonEmpty!24211 (= tp!46800 (and e!460708 mapRes!24217))))

(declare-fun mapNonEmpty!24217 () Bool)

(declare-fun tp!46810 () Bool)

(assert (=> mapNonEmpty!24217 (= mapRes!24217 (and tp!46810 e!460709))))

(declare-fun mapRest!24217 () (Array (_ BitVec 32) ValueCell!7113))

(declare-fun mapValue!24217 () ValueCell!7113)

(declare-fun mapKey!24217 () (_ BitVec 32))

(assert (=> mapNonEmpty!24217 (= mapRest!24211 (store mapRest!24217 mapKey!24217 mapValue!24217))))

(assert (= (and mapNonEmpty!24211 condMapEmpty!24217) mapIsEmpty!24217))

(assert (= (and mapNonEmpty!24211 (not condMapEmpty!24217)) mapNonEmpty!24217))

(assert (= (and mapNonEmpty!24217 ((_ is ValueCellFull!7113) mapValue!24217)) b!827118))

(assert (= (and mapNonEmpty!24211 ((_ is ValueCellFull!7113) mapDefault!24217)) b!827119))

(declare-fun m!770279 () Bool)

(assert (=> mapNonEmpty!24217 m!770279))

(declare-fun b_lambda!11151 () Bool)

(assert (= b_lambda!11141 (or (and start!71180 b_free!13347) b_lambda!11151)))

(declare-fun b_lambda!11153 () Bool)

(assert (= b_lambda!11139 (or (and start!71180 b_free!13347) b_lambda!11153)))

(declare-fun b_lambda!11155 () Bool)

(assert (= b_lambda!11143 (or (and start!71180 b_free!13347) b_lambda!11155)))

(declare-fun b_lambda!11157 () Bool)

(assert (= b_lambda!11147 (or (and start!71180 b_free!13347) b_lambda!11157)))

(declare-fun b_lambda!11159 () Bool)

(assert (= b_lambda!11145 (or (and start!71180 b_free!13347) b_lambda!11159)))

(declare-fun b_lambda!11161 () Bool)

(assert (= b_lambda!11149 (or (and start!71180 b_free!13347) b_lambda!11161)))

(check-sat (not b!827089) (not b!827018) (not d!105067) (not d!105093) (not bm!35926) (not d!105085) (not b_lambda!11157) (not bm!35930) (not b!826933) (not b!827108) (not b!826959) (not b!827056) (not d!105101) tp_is_empty!15057 (not d!105077) (not b!827102) (not b!826934) (not b!826942) (not b!827049) (not b!827096) (not b!827090) (not d!105075) (not b!827022) (not b!827043) (not bm!35908) (not d!105091) (not bm!35928) (not b!827101) (not b!826939) (not b!827086) (not d!105087) (not b!826941) (not b!827010) (not bm!35942) (not b!827104) (not b!827003) (not b!827047) (not bm!35936) (not b!827053) (not d!105099) (not b!826940) (not d!105079) (not b!827007) (not mapNonEmpty!24217) (not b!827026) (not b!827021) (not b!827110) (not d!105069) (not b!827048) (not b!827057) (not d!105073) (not b!827012) (not b!827032) (not b!827084) (not bm!35937) (not b!827015) (not b!827055) (not b!827058) (not b!827111) (not d!105095) (not b!827028) (not b!827035) (not bm!35935) (not d!105097) (not b!827103) b_and!22287 (not b!827092) (not b!827094) (not bm!35943) (not b!827050) (not b_lambda!11153) (not b_lambda!11161) (not b!826957) (not b!827091) (not d!105083) (not b!827052) (not d!105103) (not b!826954) (not b!826958) (not b!827054) (not bm!35911) (not b!827051) (not b_lambda!11155) (not bm!35933) (not b!827025) (not bm!35929) (not b_next!13347) (not b!827098) (not b!827109) (not b_lambda!11159) (not b!827037) (not b!827040) (not b!827046) (not b_lambda!11151) (not b!827059) (not b!827105) (not b!826953) (not d!105089) (not b!827106) (not d!105081) (not b!827093))
(check-sat b_and!22287 (not b_next!13347))
