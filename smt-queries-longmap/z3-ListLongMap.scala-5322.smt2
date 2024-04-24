; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71338 () Bool)

(assert start!71338)

(declare-fun b_free!13339 () Bool)

(declare-fun b_next!13339 () Bool)

(assert (=> start!71338 (= b_free!13339 (not b_next!13339))))

(declare-fun tp!46776 () Bool)

(declare-fun b_and!22275 () Bool)

(assert (=> start!71338 (= tp!46776 b_and!22275)))

(declare-fun b!827648 () Bool)

(declare-fun e!461035 () Bool)

(declare-fun tp_is_empty!15049 () Bool)

(assert (=> b!827648 (= e!461035 tp_is_empty!15049)))

(declare-fun mapNonEmpty!24199 () Bool)

(declare-fun mapRes!24199 () Bool)

(declare-fun tp!46777 () Bool)

(declare-fun e!461031 () Bool)

(assert (=> mapNonEmpty!24199 (= mapRes!24199 (and tp!46777 e!461031))))

(declare-datatypes ((V!25067 0))(
  ( (V!25068 (val!7572 Int)) )
))
(declare-datatypes ((ValueCell!7109 0))(
  ( (ValueCellFull!7109 (v!10006 V!25067)) (EmptyCell!7109) )
))
(declare-fun mapValue!24199 () ValueCell!7109)

(declare-datatypes ((array!46277 0))(
  ( (array!46278 (arr!22179 (Array (_ BitVec 32) ValueCell!7109)) (size!22599 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46277)

(declare-fun mapKey!24199 () (_ BitVec 32))

(declare-fun mapRest!24199 () (Array (_ BitVec 32) ValueCell!7109))

(assert (=> mapNonEmpty!24199 (= (arr!22179 _values!788) (store mapRest!24199 mapKey!24199 mapValue!24199))))

(declare-fun b!827649 () Bool)

(declare-fun res!563927 () Bool)

(declare-fun e!461033 () Bool)

(assert (=> b!827649 (=> (not res!563927) (not e!461033))))

(declare-datatypes ((array!46279 0))(
  ( (array!46280 (arr!22180 (Array (_ BitVec 32) (_ BitVec 64))) (size!22600 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46279)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827649 (= res!563927 (and (= (size!22599 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22600 _keys!976) (size!22599 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827650 () Bool)

(assert (=> b!827650 (= e!461031 tp_is_empty!15049)))

(declare-fun b!827651 () Bool)

(declare-fun e!461030 () Bool)

(assert (=> b!827651 (= e!461030 (and e!461035 mapRes!24199))))

(declare-fun condMapEmpty!24199 () Bool)

(declare-fun mapDefault!24199 () ValueCell!7109)

(assert (=> b!827651 (= condMapEmpty!24199 (= (arr!22179 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7109)) mapDefault!24199)))))

(declare-fun res!563925 () Bool)

(assert (=> start!71338 (=> (not res!563925) (not e!461033))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71338 (= res!563925 (validMask!0 mask!1312))))

(assert (=> start!71338 e!461033))

(assert (=> start!71338 tp_is_empty!15049))

(declare-fun array_inv!17719 (array!46279) Bool)

(assert (=> start!71338 (array_inv!17719 _keys!976)))

(assert (=> start!71338 true))

(declare-fun array_inv!17720 (array!46277) Bool)

(assert (=> start!71338 (and (array_inv!17720 _values!788) e!461030)))

(assert (=> start!71338 tp!46776))

(declare-fun b!827652 () Bool)

(declare-fun res!563928 () Bool)

(assert (=> b!827652 (=> (not res!563928) (not e!461033))))

(declare-datatypes ((List!15736 0))(
  ( (Nil!15733) (Cons!15732 (h!16867 (_ BitVec 64)) (t!22075 List!15736)) )
))
(declare-fun arrayNoDuplicates!0 (array!46279 (_ BitVec 32) List!15736) Bool)

(assert (=> b!827652 (= res!563928 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15733))))

(declare-fun e!461037 () Bool)

(declare-fun zeroValueAfter!34 () V!25067)

(declare-datatypes ((tuple2!9960 0))(
  ( (tuple2!9961 (_1!4991 (_ BitVec 64)) (_2!4991 V!25067)) )
))
(declare-datatypes ((List!15737 0))(
  ( (Nil!15734) (Cons!15733 (h!16868 tuple2!9960) (t!22076 List!15737)) )
))
(declare-datatypes ((ListLongMap!8785 0))(
  ( (ListLongMap!8786 (toList!4408 List!15737)) )
))
(declare-fun lt!374759 () ListLongMap!8785)

(declare-fun lt!374763 () ListLongMap!8785)

(declare-fun lt!374762 () tuple2!9960)

(declare-fun b!827653 () Bool)

(declare-fun +!1954 (ListLongMap!8785 tuple2!9960) ListLongMap!8785)

(assert (=> b!827653 (= e!461037 (= lt!374759 (+!1954 (+!1954 lt!374763 (tuple2!9961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!374762)))))

(declare-fun mapIsEmpty!24199 () Bool)

(assert (=> mapIsEmpty!24199 mapRes!24199))

(declare-fun lt!374768 () tuple2!9960)

(declare-fun b!827654 () Bool)

(declare-fun e!461034 () Bool)

(assert (=> b!827654 (= e!461034 (= lt!374759 (+!1954 (+!1954 lt!374763 lt!374762) lt!374768)))))

(declare-fun b!827655 () Bool)

(declare-fun e!461036 () Bool)

(assert (=> b!827655 (= e!461036 true)))

(declare-fun lt!374764 () ListLongMap!8785)

(declare-fun lt!374758 () ListLongMap!8785)

(assert (=> b!827655 (= lt!374758 (+!1954 (+!1954 lt!374764 lt!374768) lt!374762))))

(declare-fun lt!374761 () ListLongMap!8785)

(declare-fun lt!374760 () ListLongMap!8785)

(assert (=> b!827655 (and (= lt!374761 lt!374760) (= lt!374759 lt!374760) (= lt!374759 lt!374761))))

(declare-fun lt!374767 () ListLongMap!8785)

(assert (=> b!827655 (= lt!374760 (+!1954 lt!374767 lt!374768))))

(declare-fun lt!374766 () ListLongMap!8785)

(assert (=> b!827655 (= lt!374761 (+!1954 lt!374766 lt!374768))))

(declare-fun zeroValueBefore!34 () V!25067)

(declare-datatypes ((Unit!28368 0))(
  ( (Unit!28369) )
))
(declare-fun lt!374769 () Unit!28368)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!238 (ListLongMap!8785 (_ BitVec 64) V!25067 V!25067) Unit!28368)

(assert (=> b!827655 (= lt!374769 (addSameAsAddTwiceSameKeyDiffValues!238 lt!374766 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!827655 e!461034))

(declare-fun res!563924 () Bool)

(assert (=> b!827655 (=> (not res!563924) (not e!461034))))

(declare-fun lt!374765 () ListLongMap!8785)

(assert (=> b!827655 (= res!563924 (= lt!374765 lt!374767))))

(declare-fun lt!374757 () tuple2!9960)

(assert (=> b!827655 (= lt!374767 (+!1954 lt!374766 lt!374757))))

(assert (=> b!827655 (= lt!374766 (+!1954 lt!374764 lt!374762))))

(assert (=> b!827655 (= lt!374768 (tuple2!9961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!827655 e!461037))

(declare-fun res!563926 () Bool)

(assert (=> b!827655 (=> (not res!563926) (not e!461037))))

(assert (=> b!827655 (= res!563926 (= lt!374765 (+!1954 (+!1954 lt!374764 lt!374757) lt!374762)))))

(declare-fun minValue!754 () V!25067)

(assert (=> b!827655 (= lt!374762 (tuple2!9961 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!827655 (= lt!374757 (tuple2!9961 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2529 (array!46279 array!46277 (_ BitVec 32) (_ BitVec 32) V!25067 V!25067 (_ BitVec 32) Int) ListLongMap!8785)

(assert (=> b!827655 (= lt!374759 (getCurrentListMap!2529 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827655 (= lt!374765 (getCurrentListMap!2529 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827656 () Bool)

(assert (=> b!827656 (= e!461033 (not e!461036))))

(declare-fun res!563929 () Bool)

(assert (=> b!827656 (=> res!563929 e!461036)))

(assert (=> b!827656 (= res!563929 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!827656 (= lt!374764 lt!374763)))

(declare-fun lt!374770 () Unit!28368)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!574 (array!46279 array!46277 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!25067 V!25067 V!25067 V!25067 (_ BitVec 32) Int) Unit!28368)

(assert (=> b!827656 (= lt!374770 (lemmaNoChangeToArrayThenSameMapNoExtras!574 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2486 (array!46279 array!46277 (_ BitVec 32) (_ BitVec 32) V!25067 V!25067 (_ BitVec 32) Int) ListLongMap!8785)

(assert (=> b!827656 (= lt!374763 (getCurrentListMapNoExtraKeys!2486 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!827656 (= lt!374764 (getCurrentListMapNoExtraKeys!2486 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!827657 () Bool)

(declare-fun res!563923 () Bool)

(assert (=> b!827657 (=> (not res!563923) (not e!461033))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46279 (_ BitVec 32)) Bool)

(assert (=> b!827657 (= res!563923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(assert (= (and start!71338 res!563925) b!827649))

(assert (= (and b!827649 res!563927) b!827657))

(assert (= (and b!827657 res!563923) b!827652))

(assert (= (and b!827652 res!563928) b!827656))

(assert (= (and b!827656 (not res!563929)) b!827655))

(assert (= (and b!827655 res!563926) b!827653))

(assert (= (and b!827655 res!563924) b!827654))

(assert (= (and b!827651 condMapEmpty!24199) mapIsEmpty!24199))

(assert (= (and b!827651 (not condMapEmpty!24199)) mapNonEmpty!24199))

(get-info :version)

(assert (= (and mapNonEmpty!24199 ((_ is ValueCellFull!7109) mapValue!24199)) b!827650))

(assert (= (and b!827651 ((_ is ValueCellFull!7109) mapDefault!24199)) b!827648))

(assert (= start!71338 b!827651))

(declare-fun m!770965 () Bool)

(assert (=> mapNonEmpty!24199 m!770965))

(declare-fun m!770967 () Bool)

(assert (=> b!827657 m!770967))

(declare-fun m!770969 () Bool)

(assert (=> b!827653 m!770969))

(assert (=> b!827653 m!770969))

(declare-fun m!770971 () Bool)

(assert (=> b!827653 m!770971))

(declare-fun m!770973 () Bool)

(assert (=> b!827654 m!770973))

(assert (=> b!827654 m!770973))

(declare-fun m!770975 () Bool)

(assert (=> b!827654 m!770975))

(declare-fun m!770977 () Bool)

(assert (=> start!71338 m!770977))

(declare-fun m!770979 () Bool)

(assert (=> start!71338 m!770979))

(declare-fun m!770981 () Bool)

(assert (=> start!71338 m!770981))

(declare-fun m!770983 () Bool)

(assert (=> b!827655 m!770983))

(declare-fun m!770985 () Bool)

(assert (=> b!827655 m!770985))

(declare-fun m!770987 () Bool)

(assert (=> b!827655 m!770987))

(declare-fun m!770989 () Bool)

(assert (=> b!827655 m!770989))

(declare-fun m!770991 () Bool)

(assert (=> b!827655 m!770991))

(declare-fun m!770993 () Bool)

(assert (=> b!827655 m!770993))

(declare-fun m!770995 () Bool)

(assert (=> b!827655 m!770995))

(assert (=> b!827655 m!770993))

(declare-fun m!770997 () Bool)

(assert (=> b!827655 m!770997))

(assert (=> b!827655 m!770991))

(declare-fun m!770999 () Bool)

(assert (=> b!827655 m!770999))

(declare-fun m!771001 () Bool)

(assert (=> b!827655 m!771001))

(declare-fun m!771003 () Bool)

(assert (=> b!827655 m!771003))

(declare-fun m!771005 () Bool)

(assert (=> b!827652 m!771005))

(declare-fun m!771007 () Bool)

(assert (=> b!827656 m!771007))

(declare-fun m!771009 () Bool)

(assert (=> b!827656 m!771009))

(declare-fun m!771011 () Bool)

(assert (=> b!827656 m!771011))

(check-sat (not b!827656) b_and!22275 (not b!827652) (not b!827653) (not b!827654) (not b!827657) (not b!827655) tp_is_empty!15049 (not mapNonEmpty!24199) (not start!71338) (not b_next!13339))
(check-sat b_and!22275 (not b_next!13339))
