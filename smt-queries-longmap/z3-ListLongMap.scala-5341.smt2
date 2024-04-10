; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71374 () Bool)

(assert start!71374)

(declare-fun b_free!13455 () Bool)

(declare-fun b_next!13455 () Bool)

(assert (=> start!71374 (= b_free!13455 (not b_next!13455))))

(declare-fun tp!47140 () Bool)

(declare-fun b_and!22437 () Bool)

(assert (=> start!71374 (= tp!47140 b_and!22437)))

(declare-fun b!828925 () Bool)

(declare-fun e!461975 () Bool)

(declare-fun tp_is_empty!15165 () Bool)

(assert (=> b!828925 (= e!461975 tp_is_empty!15165)))

(declare-fun b!828926 () Bool)

(declare-fun e!461973 () Bool)

(assert (=> b!828926 (= e!461973 tp_is_empty!15165)))

(declare-fun mapIsEmpty!24388 () Bool)

(declare-fun mapRes!24388 () Bool)

(assert (=> mapIsEmpty!24388 mapRes!24388))

(declare-fun b!828927 () Bool)

(declare-fun res!564764 () Bool)

(declare-fun e!461976 () Bool)

(assert (=> b!828927 (=> (not res!564764) (not e!461976))))

(declare-datatypes ((array!46494 0))(
  ( (array!46495 (arr!22287 (Array (_ BitVec 32) (_ BitVec 64))) (size!22708 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46494)

(declare-datatypes ((List!15910 0))(
  ( (Nil!15907) (Cons!15906 (h!17035 (_ BitVec 64)) (t!22267 List!15910)) )
))
(declare-fun arrayNoDuplicates!0 (array!46494 (_ BitVec 32) List!15910) Bool)

(assert (=> b!828927 (= res!564764 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15907))))

(declare-fun mapNonEmpty!24388 () Bool)

(declare-fun tp!47139 () Bool)

(assert (=> mapNonEmpty!24388 (= mapRes!24388 (and tp!47139 e!461975))))

(declare-datatypes ((V!25221 0))(
  ( (V!25222 (val!7630 Int)) )
))
(declare-datatypes ((ValueCell!7167 0))(
  ( (ValueCellFull!7167 (v!10068 V!25221)) (EmptyCell!7167) )
))
(declare-datatypes ((array!46496 0))(
  ( (array!46497 (arr!22288 (Array (_ BitVec 32) ValueCell!7167)) (size!22709 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46496)

(declare-fun mapValue!24388 () ValueCell!7167)

(declare-fun mapRest!24388 () (Array (_ BitVec 32) ValueCell!7167))

(declare-fun mapKey!24388 () (_ BitVec 32))

(assert (=> mapNonEmpty!24388 (= (arr!22288 _values!788) (store mapRest!24388 mapKey!24388 mapValue!24388))))

(declare-fun e!461979 () Bool)

(declare-datatypes ((tuple2!10118 0))(
  ( (tuple2!10119 (_1!5070 (_ BitVec 64)) (_2!5070 V!25221)) )
))
(declare-fun lt!375754 () tuple2!10118)

(declare-datatypes ((List!15911 0))(
  ( (Nil!15908) (Cons!15907 (h!17036 tuple2!10118) (t!22268 List!15911)) )
))
(declare-datatypes ((ListLongMap!8941 0))(
  ( (ListLongMap!8942 (toList!4486 List!15911)) )
))
(declare-fun lt!375758 () ListLongMap!8941)

(declare-fun b!828929 () Bool)

(declare-fun lt!375757 () ListLongMap!8941)

(declare-fun +!1967 (ListLongMap!8941 tuple2!10118) ListLongMap!8941)

(assert (=> b!828929 (= e!461979 (= (+!1967 lt!375757 lt!375754) lt!375758))))

(declare-fun b!828930 () Bool)

(declare-fun e!461974 () Bool)

(assert (=> b!828930 (= e!461974 (and e!461973 mapRes!24388))))

(declare-fun condMapEmpty!24388 () Bool)

(declare-fun mapDefault!24388 () ValueCell!7167)

(assert (=> b!828930 (= condMapEmpty!24388 (= (arr!22288 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7167)) mapDefault!24388)))))

(declare-fun b!828931 () Bool)

(declare-fun res!564769 () Bool)

(assert (=> b!828931 (=> (not res!564769) (not e!461976))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!828931 (= res!564769 (and (= (size!22709 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22708 _keys!976) (size!22709 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!828932 () Bool)

(declare-fun e!461980 () Bool)

(assert (=> b!828932 (= e!461980 e!461979)))

(declare-fun res!564770 () Bool)

(assert (=> b!828932 (=> res!564770 e!461979)))

(declare-fun lt!375755 () tuple2!10118)

(declare-fun lt!375753 () ListLongMap!8941)

(assert (=> b!828932 (= res!564770 (not (= lt!375758 (+!1967 (+!1967 lt!375753 lt!375755) lt!375754))))))

(declare-fun lt!375760 () ListLongMap!8941)

(declare-fun lt!375756 () ListLongMap!8941)

(assert (=> b!828932 (= (+!1967 lt!375760 lt!375754) (+!1967 lt!375756 lt!375754))))

(declare-datatypes ((Unit!28393 0))(
  ( (Unit!28394) )
))
(declare-fun lt!375759 () Unit!28393)

(declare-fun zeroValueBefore!34 () V!25221)

(declare-fun zeroValueAfter!34 () V!25221)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!239 (ListLongMap!8941 (_ BitVec 64) V!25221 V!25221) Unit!28393)

(assert (=> b!828932 (= lt!375759 (addSameAsAddTwiceSameKeyDiffValues!239 lt!375760 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!828932 (= lt!375754 (tuple2!10119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!461978 () Bool)

(assert (=> b!828932 e!461978))

(declare-fun res!564768 () Bool)

(assert (=> b!828932 (=> (not res!564768) (not e!461978))))

(assert (=> b!828932 (= res!564768 (= lt!375757 lt!375756))))

(assert (=> b!828932 (= lt!375756 (+!1967 lt!375760 lt!375755))))

(assert (=> b!828932 (= lt!375755 (tuple2!10119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun minValue!754 () V!25221)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2586 (array!46494 array!46496 (_ BitVec 32) (_ BitVec 32) V!25221 V!25221 (_ BitVec 32) Int) ListLongMap!8941)

(assert (=> b!828932 (= lt!375758 (getCurrentListMap!2586 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828932 (= lt!375757 (getCurrentListMap!2586 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun res!564767 () Bool)

(assert (=> start!71374 (=> (not res!564767) (not e!461976))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71374 (= res!564767 (validMask!0 mask!1312))))

(assert (=> start!71374 e!461976))

(assert (=> start!71374 tp_is_empty!15165))

(declare-fun array_inv!17755 (array!46494) Bool)

(assert (=> start!71374 (array_inv!17755 _keys!976)))

(assert (=> start!71374 true))

(declare-fun array_inv!17756 (array!46496) Bool)

(assert (=> start!71374 (and (array_inv!17756 _values!788) e!461974)))

(assert (=> start!71374 tp!47140))

(declare-fun b!828928 () Bool)

(declare-fun res!564766 () Bool)

(assert (=> b!828928 (=> (not res!564766) (not e!461976))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46494 (_ BitVec 32)) Bool)

(assert (=> b!828928 (= res!564766 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!828933 () Bool)

(assert (=> b!828933 (= e!461978 (= lt!375758 (+!1967 lt!375753 (tuple2!10119 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!828934 () Bool)

(assert (=> b!828934 (= e!461976 (not e!461980))))

(declare-fun res!564765 () Bool)

(assert (=> b!828934 (=> res!564765 e!461980)))

(assert (=> b!828934 (= res!564765 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!828934 (= lt!375760 lt!375753)))

(declare-fun lt!375752 () Unit!28393)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!575 (array!46494 array!46496 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25221 V!25221 V!25221 V!25221 (_ BitVec 32) Int) Unit!28393)

(assert (=> b!828934 (= lt!375752 (lemmaNoChangeToArrayThenSameMapNoExtras!575 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2487 (array!46494 array!46496 (_ BitVec 32) (_ BitVec 32) V!25221 V!25221 (_ BitVec 32) Int) ListLongMap!8941)

(assert (=> b!828934 (= lt!375753 (getCurrentListMapNoExtraKeys!2487 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!828934 (= lt!375760 (getCurrentListMapNoExtraKeys!2487 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71374 res!564767) b!828931))

(assert (= (and b!828931 res!564769) b!828928))

(assert (= (and b!828928 res!564766) b!828927))

(assert (= (and b!828927 res!564764) b!828934))

(assert (= (and b!828934 (not res!564765)) b!828932))

(assert (= (and b!828932 res!564768) b!828933))

(assert (= (and b!828932 (not res!564770)) b!828929))

(assert (= (and b!828930 condMapEmpty!24388) mapIsEmpty!24388))

(assert (= (and b!828930 (not condMapEmpty!24388)) mapNonEmpty!24388))

(get-info :version)

(assert (= (and mapNonEmpty!24388 ((_ is ValueCellFull!7167) mapValue!24388)) b!828925))

(assert (= (and b!828930 ((_ is ValueCellFull!7167) mapDefault!24388)) b!828926))

(assert (= start!71374 b!828930))

(declare-fun m!771889 () Bool)

(assert (=> mapNonEmpty!24388 m!771889))

(declare-fun m!771891 () Bool)

(assert (=> b!828928 m!771891))

(declare-fun m!771893 () Bool)

(assert (=> start!71374 m!771893))

(declare-fun m!771895 () Bool)

(assert (=> start!71374 m!771895))

(declare-fun m!771897 () Bool)

(assert (=> start!71374 m!771897))

(declare-fun m!771899 () Bool)

(assert (=> b!828933 m!771899))

(declare-fun m!771901 () Bool)

(assert (=> b!828934 m!771901))

(declare-fun m!771903 () Bool)

(assert (=> b!828934 m!771903))

(declare-fun m!771905 () Bool)

(assert (=> b!828934 m!771905))

(declare-fun m!771907 () Bool)

(assert (=> b!828927 m!771907))

(declare-fun m!771909 () Bool)

(assert (=> b!828932 m!771909))

(declare-fun m!771911 () Bool)

(assert (=> b!828932 m!771911))

(declare-fun m!771913 () Bool)

(assert (=> b!828932 m!771913))

(declare-fun m!771915 () Bool)

(assert (=> b!828932 m!771915))

(declare-fun m!771917 () Bool)

(assert (=> b!828932 m!771917))

(declare-fun m!771919 () Bool)

(assert (=> b!828932 m!771919))

(declare-fun m!771921 () Bool)

(assert (=> b!828932 m!771921))

(assert (=> b!828932 m!771917))

(declare-fun m!771923 () Bool)

(assert (=> b!828932 m!771923))

(declare-fun m!771925 () Bool)

(assert (=> b!828929 m!771925))

(check-sat tp_is_empty!15165 (not start!71374) (not b!828933) (not b!828932) (not b_next!13455) (not b!828928) (not b!828927) b_and!22437 (not b!828934) (not b!828929) (not mapNonEmpty!24388))
(check-sat b_and!22437 (not b_next!13455))
