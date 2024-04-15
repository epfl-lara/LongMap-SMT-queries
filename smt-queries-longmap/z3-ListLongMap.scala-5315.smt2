; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71110 () Bool)

(assert start!71110)

(declare-fun b_free!13297 () Bool)

(declare-fun b_next!13297 () Bool)

(assert (=> start!71110 (= b_free!13297 (not b_next!13297))))

(declare-fun tp!46650 () Bool)

(declare-fun b_and!22197 () Bool)

(assert (=> start!71110 (= tp!46650 b_and!22197)))

(declare-fun b!825878 () Bool)

(declare-fun e!459804 () Bool)

(declare-fun tp_is_empty!15007 () Bool)

(assert (=> b!825878 (= e!459804 tp_is_empty!15007)))

(declare-fun mapNonEmpty!24136 () Bool)

(declare-fun mapRes!24136 () Bool)

(declare-fun tp!46651 () Bool)

(assert (=> mapNonEmpty!24136 (= mapRes!24136 (and tp!46651 e!459804))))

(declare-datatypes ((V!25011 0))(
  ( (V!25012 (val!7551 Int)) )
))
(declare-datatypes ((ValueCell!7088 0))(
  ( (ValueCellFull!7088 (v!9979 V!25011)) (EmptyCell!7088) )
))
(declare-fun mapRest!24136 () (Array (_ BitVec 32) ValueCell!7088))

(declare-fun mapValue!24136 () ValueCell!7088)

(declare-fun mapKey!24136 () (_ BitVec 32))

(declare-datatypes ((array!46161 0))(
  ( (array!46162 (arr!22126 (Array (_ BitVec 32) ValueCell!7088)) (size!22547 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46161)

(assert (=> mapNonEmpty!24136 (= (arr!22126 _values!788) (store mapRest!24136 mapKey!24136 mapValue!24136))))

(declare-fun b!825879 () Bool)

(declare-fun e!459798 () Bool)

(declare-fun e!459802 () Bool)

(assert (=> b!825879 (= e!459798 (and e!459802 mapRes!24136))))

(declare-fun condMapEmpty!24136 () Bool)

(declare-fun mapDefault!24136 () ValueCell!7088)

(assert (=> b!825879 (= condMapEmpty!24136 (= (arr!22126 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7088)) mapDefault!24136)))))

(declare-fun b!825880 () Bool)

(declare-fun res!563033 () Bool)

(declare-fun e!459803 () Bool)

(assert (=> b!825880 (=> (not res!563033) (not e!459803))))

(declare-datatypes ((array!46163 0))(
  ( (array!46164 (arr!22127 (Array (_ BitVec 32) (_ BitVec 64))) (size!22548 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46163)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(assert (=> b!825880 (= res!563033 (and (= (size!22547 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22548 _keys!976) (size!22547 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!825881 () Bool)

(declare-fun e!459800 () Bool)

(assert (=> b!825881 (= e!459800 true)))

(declare-datatypes ((tuple2!10008 0))(
  ( (tuple2!10009 (_1!5015 (_ BitVec 64)) (_2!5015 V!25011)) )
))
(declare-fun lt!373290 () tuple2!10008)

(declare-fun lt!373283 () tuple2!10008)

(declare-datatypes ((List!15800 0))(
  ( (Nil!15797) (Cons!15796 (h!16925 tuple2!10008) (t!22138 List!15800)) )
))
(declare-datatypes ((ListLongMap!8821 0))(
  ( (ListLongMap!8822 (toList!4426 List!15800)) )
))
(declare-fun lt!373278 () ListLongMap!8821)

(declare-fun lt!373284 () ListLongMap!8821)

(declare-fun +!1962 (ListLongMap!8821 tuple2!10008) ListLongMap!8821)

(assert (=> b!825881 (= lt!373284 (+!1962 (+!1962 lt!373278 lt!373283) lt!373290))))

(declare-fun lt!373288 () ListLongMap!8821)

(declare-fun lt!373287 () ListLongMap!8821)

(declare-fun lt!373291 () ListLongMap!8821)

(assert (=> b!825881 (and (= lt!373288 lt!373287) (= lt!373291 lt!373287) (= lt!373291 lt!373288))))

(declare-fun lt!373286 () ListLongMap!8821)

(assert (=> b!825881 (= lt!373287 (+!1962 lt!373286 lt!373283))))

(declare-fun lt!373281 () ListLongMap!8821)

(assert (=> b!825881 (= lt!373288 (+!1962 lt!373281 lt!373283))))

(declare-fun zeroValueBefore!34 () V!25011)

(declare-fun zeroValueAfter!34 () V!25011)

(declare-datatypes ((Unit!28267 0))(
  ( (Unit!28268) )
))
(declare-fun lt!373289 () Unit!28267)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!229 (ListLongMap!8821 (_ BitVec 64) V!25011 V!25011) Unit!28267)

(assert (=> b!825881 (= lt!373289 (addSameAsAddTwiceSameKeyDiffValues!229 lt!373281 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(declare-fun e!459799 () Bool)

(assert (=> b!825881 e!459799))

(declare-fun res!563030 () Bool)

(assert (=> b!825881 (=> (not res!563030) (not e!459799))))

(declare-fun lt!373285 () ListLongMap!8821)

(assert (=> b!825881 (= res!563030 (= lt!373285 lt!373286))))

(declare-fun lt!373280 () tuple2!10008)

(assert (=> b!825881 (= lt!373286 (+!1962 lt!373281 lt!373280))))

(assert (=> b!825881 (= lt!373281 (+!1962 lt!373278 lt!373290))))

(assert (=> b!825881 (= lt!373283 (tuple2!10009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!459801 () Bool)

(assert (=> b!825881 e!459801))

(declare-fun res!563034 () Bool)

(assert (=> b!825881 (=> (not res!563034) (not e!459801))))

(assert (=> b!825881 (= res!563034 (= lt!373285 (+!1962 (+!1962 lt!373278 lt!373280) lt!373290)))))

(declare-fun minValue!754 () V!25011)

(assert (=> b!825881 (= lt!373290 (tuple2!10009 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!825881 (= lt!373280 (tuple2!10009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2512 (array!46163 array!46161 (_ BitVec 32) (_ BitVec 32) V!25011 V!25011 (_ BitVec 32) Int) ListLongMap!8821)

(assert (=> b!825881 (= lt!373291 (getCurrentListMap!2512 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825881 (= lt!373285 (getCurrentListMap!2512 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825882 () Bool)

(declare-fun lt!373279 () ListLongMap!8821)

(assert (=> b!825882 (= e!459799 (= lt!373291 (+!1962 (+!1962 lt!373279 lt!373290) lt!373283)))))

(declare-fun mapIsEmpty!24136 () Bool)

(assert (=> mapIsEmpty!24136 mapRes!24136))

(declare-fun b!825883 () Bool)

(declare-fun res!563031 () Bool)

(assert (=> b!825883 (=> (not res!563031) (not e!459803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46163 (_ BitVec 32)) Bool)

(assert (=> b!825883 (= res!563031 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!825884 () Bool)

(declare-fun res!563035 () Bool)

(assert (=> b!825884 (=> (not res!563035) (not e!459803))))

(declare-datatypes ((List!15801 0))(
  ( (Nil!15798) (Cons!15797 (h!16926 (_ BitVec 64)) (t!22139 List!15801)) )
))
(declare-fun arrayNoDuplicates!0 (array!46163 (_ BitVec 32) List!15801) Bool)

(assert (=> b!825884 (= res!563035 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15798))))

(declare-fun b!825885 () Bool)

(assert (=> b!825885 (= e!459802 tp_is_empty!15007)))

(declare-fun res!563032 () Bool)

(assert (=> start!71110 (=> (not res!563032) (not e!459803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71110 (= res!563032 (validMask!0 mask!1312))))

(assert (=> start!71110 e!459803))

(assert (=> start!71110 tp_is_empty!15007))

(declare-fun array_inv!17707 (array!46163) Bool)

(assert (=> start!71110 (array_inv!17707 _keys!976)))

(assert (=> start!71110 true))

(declare-fun array_inv!17708 (array!46161) Bool)

(assert (=> start!71110 (and (array_inv!17708 _values!788) e!459798)))

(assert (=> start!71110 tp!46650))

(declare-fun b!825886 () Bool)

(assert (=> b!825886 (= e!459803 (not e!459800))))

(declare-fun res!563036 () Bool)

(assert (=> b!825886 (=> res!563036 e!459800)))

(assert (=> b!825886 (= res!563036 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!825886 (= lt!373278 lt!373279)))

(declare-fun lt!373282 () Unit!28267)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!556 (array!46163 array!46161 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25011 V!25011 V!25011 V!25011 (_ BitVec 32) Int) Unit!28267)

(assert (=> b!825886 (= lt!373282 (lemmaNoChangeToArrayThenSameMapNoExtras!556 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2463 (array!46163 array!46161 (_ BitVec 32) (_ BitVec 32) V!25011 V!25011 (_ BitVec 32) Int) ListLongMap!8821)

(assert (=> b!825886 (= lt!373279 (getCurrentListMapNoExtraKeys!2463 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!825886 (= lt!373278 (getCurrentListMapNoExtraKeys!2463 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!825887 () Bool)

(assert (=> b!825887 (= e!459801 (= lt!373291 (+!1962 (+!1962 lt!373279 (tuple2!10009 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373290)))))

(assert (= (and start!71110 res!563032) b!825880))

(assert (= (and b!825880 res!563033) b!825883))

(assert (= (and b!825883 res!563031) b!825884))

(assert (= (and b!825884 res!563035) b!825886))

(assert (= (and b!825886 (not res!563036)) b!825881))

(assert (= (and b!825881 res!563034) b!825887))

(assert (= (and b!825881 res!563030) b!825882))

(assert (= (and b!825879 condMapEmpty!24136) mapIsEmpty!24136))

(assert (= (and b!825879 (not condMapEmpty!24136)) mapNonEmpty!24136))

(get-info :version)

(assert (= (and mapNonEmpty!24136 ((_ is ValueCellFull!7088) mapValue!24136)) b!825878))

(assert (= (and b!825879 ((_ is ValueCellFull!7088) mapDefault!24136)) b!825885))

(assert (= start!71110 b!825879))

(declare-fun m!767923 () Bool)

(assert (=> b!825881 m!767923))

(assert (=> b!825881 m!767923))

(declare-fun m!767925 () Bool)

(assert (=> b!825881 m!767925))

(declare-fun m!767927 () Bool)

(assert (=> b!825881 m!767927))

(declare-fun m!767929 () Bool)

(assert (=> b!825881 m!767929))

(assert (=> b!825881 m!767929))

(declare-fun m!767931 () Bool)

(assert (=> b!825881 m!767931))

(declare-fun m!767933 () Bool)

(assert (=> b!825881 m!767933))

(declare-fun m!767935 () Bool)

(assert (=> b!825881 m!767935))

(declare-fun m!767937 () Bool)

(assert (=> b!825881 m!767937))

(declare-fun m!767939 () Bool)

(assert (=> b!825881 m!767939))

(declare-fun m!767941 () Bool)

(assert (=> b!825881 m!767941))

(declare-fun m!767943 () Bool)

(assert (=> b!825881 m!767943))

(declare-fun m!767945 () Bool)

(assert (=> b!825884 m!767945))

(declare-fun m!767947 () Bool)

(assert (=> start!71110 m!767947))

(declare-fun m!767949 () Bool)

(assert (=> start!71110 m!767949))

(declare-fun m!767951 () Bool)

(assert (=> start!71110 m!767951))

(declare-fun m!767953 () Bool)

(assert (=> b!825882 m!767953))

(assert (=> b!825882 m!767953))

(declare-fun m!767955 () Bool)

(assert (=> b!825882 m!767955))

(declare-fun m!767957 () Bool)

(assert (=> b!825886 m!767957))

(declare-fun m!767959 () Bool)

(assert (=> b!825886 m!767959))

(declare-fun m!767961 () Bool)

(assert (=> b!825886 m!767961))

(declare-fun m!767963 () Bool)

(assert (=> b!825887 m!767963))

(assert (=> b!825887 m!767963))

(declare-fun m!767965 () Bool)

(assert (=> b!825887 m!767965))

(declare-fun m!767967 () Bool)

(assert (=> mapNonEmpty!24136 m!767967))

(declare-fun m!767969 () Bool)

(assert (=> b!825883 m!767969))

(check-sat (not b_next!13297) (not b!825886) (not b!825884) (not b!825887) (not b!825883) (not mapNonEmpty!24136) tp_is_empty!15007 (not start!71110) b_and!22197 (not b!825881) (not b!825882))
(check-sat b_and!22197 (not b_next!13297))
