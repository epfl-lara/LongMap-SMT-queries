; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71246 () Bool)

(assert start!71246)

(declare-fun b_free!13267 () Bool)

(declare-fun b_next!13267 () Bool)

(assert (=> start!71246 (= b_free!13267 (not b_next!13267))))

(declare-fun tp!46557 () Bool)

(declare-fun b_and!22191 () Bool)

(assert (=> start!71246 (= tp!46557 b_and!22191)))

(declare-fun b!826362 () Bool)

(declare-fun e!460036 () Bool)

(declare-fun e!460038 () Bool)

(assert (=> b!826362 (= e!460036 (not e!460038))))

(declare-fun res!563068 () Bool)

(assert (=> b!826362 (=> res!563068 e!460038)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!826362 (= res!563068 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24971 0))(
  ( (V!24972 (val!7536 Int)) )
))
(declare-datatypes ((tuple2!9898 0))(
  ( (tuple2!9899 (_1!4960 (_ BitVec 64)) (_2!4960 V!24971)) )
))
(declare-datatypes ((List!15683 0))(
  ( (Nil!15680) (Cons!15679 (h!16814 tuple2!9898) (t!22020 List!15683)) )
))
(declare-datatypes ((ListLongMap!8723 0))(
  ( (ListLongMap!8724 (toList!4377 List!15683)) )
))
(declare-fun lt!373070 () ListLongMap!8723)

(declare-fun lt!373068 () ListLongMap!8723)

(assert (=> b!826362 (= lt!373070 lt!373068)))

(declare-datatypes ((Unit!28306 0))(
  ( (Unit!28307) )
))
(declare-fun lt!373079 () Unit!28306)

(declare-fun zeroValueBefore!34 () V!24971)

(declare-datatypes ((array!46139 0))(
  ( (array!46140 (arr!22111 (Array (_ BitVec 32) (_ BitVec 64))) (size!22531 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46139)

(declare-fun zeroValueAfter!34 () V!24971)

(declare-fun minValue!754 () V!24971)

(declare-datatypes ((ValueCell!7073 0))(
  ( (ValueCellFull!7073 (v!9969 V!24971)) (EmptyCell!7073) )
))
(declare-datatypes ((array!46141 0))(
  ( (array!46142 (arr!22112 (Array (_ BitVec 32) ValueCell!7073)) (size!22532 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46141)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!547 (array!46139 array!46141 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24971 V!24971 V!24971 V!24971 (_ BitVec 32) Int) Unit!28306)

(assert (=> b!826362 (= lt!373079 (lemmaNoChangeToArrayThenSameMapNoExtras!547 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2459 (array!46139 array!46141 (_ BitVec 32) (_ BitVec 32) V!24971 V!24971 (_ BitVec 32) Int) ListLongMap!8723)

(assert (=> b!826362 (= lt!373068 (getCurrentListMapNoExtraKeys!2459 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826362 (= lt!373070 (getCurrentListMapNoExtraKeys!2459 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!826363 () Bool)

(declare-fun res!563069 () Bool)

(assert (=> b!826363 (=> (not res!563069) (not e!460036))))

(assert (=> b!826363 (= res!563069 (and (= (size!22532 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22531 _keys!976) (size!22532 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!373069 () ListLongMap!8723)

(declare-fun lt!373074 () tuple2!9898)

(declare-fun e!460042 () Bool)

(declare-fun lt!373077 () tuple2!9898)

(declare-fun b!826364 () Bool)

(declare-fun +!1924 (ListLongMap!8723 tuple2!9898) ListLongMap!8723)

(assert (=> b!826364 (= e!460042 (= lt!373069 (+!1924 (+!1924 lt!373068 lt!373077) lt!373074)))))

(declare-fun b!826365 () Bool)

(assert (=> b!826365 (= e!460038 true)))

(declare-fun lt!373080 () ListLongMap!8723)

(assert (=> b!826365 (= lt!373080 (+!1924 (+!1924 lt!373070 lt!373074) lt!373077))))

(declare-fun lt!373071 () ListLongMap!8723)

(declare-fun lt!373078 () ListLongMap!8723)

(assert (=> b!826365 (and (= lt!373071 lt!373078) (= lt!373069 lt!373078) (= lt!373069 lt!373071))))

(declare-fun lt!373075 () ListLongMap!8723)

(assert (=> b!826365 (= lt!373078 (+!1924 lt!373075 lt!373074))))

(declare-fun lt!373073 () ListLongMap!8723)

(assert (=> b!826365 (= lt!373071 (+!1924 lt!373073 lt!373074))))

(declare-fun lt!373067 () Unit!28306)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!212 (ListLongMap!8723 (_ BitVec 64) V!24971 V!24971) Unit!28306)

(assert (=> b!826365 (= lt!373067 (addSameAsAddTwiceSameKeyDiffValues!212 lt!373073 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!826365 e!460042))

(declare-fun res!563067 () Bool)

(assert (=> b!826365 (=> (not res!563067) (not e!460042))))

(declare-fun lt!373072 () ListLongMap!8723)

(assert (=> b!826365 (= res!563067 (= lt!373072 lt!373075))))

(declare-fun lt!373076 () tuple2!9898)

(assert (=> b!826365 (= lt!373075 (+!1924 lt!373073 lt!373076))))

(assert (=> b!826365 (= lt!373073 (+!1924 lt!373070 lt!373077))))

(assert (=> b!826365 (= lt!373074 (tuple2!9899 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!460041 () Bool)

(assert (=> b!826365 e!460041))

(declare-fun res!563065 () Bool)

(assert (=> b!826365 (=> (not res!563065) (not e!460041))))

(assert (=> b!826365 (= res!563065 (= lt!373072 (+!1924 (+!1924 lt!373070 lt!373076) lt!373077)))))

(assert (=> b!826365 (= lt!373077 (tuple2!9899 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))

(assert (=> b!826365 (= lt!373076 (tuple2!9899 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2503 (array!46139 array!46141 (_ BitVec 32) (_ BitVec 32) V!24971 V!24971 (_ BitVec 32) Int) ListLongMap!8723)

(assert (=> b!826365 (= lt!373069 (getCurrentListMap!2503 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!826365 (= lt!373072 (getCurrentListMap!2503 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun mapNonEmpty!24088 () Bool)

(declare-fun mapRes!24088 () Bool)

(declare-fun tp!46558 () Bool)

(declare-fun e!460037 () Bool)

(assert (=> mapNonEmpty!24088 (= mapRes!24088 (and tp!46558 e!460037))))

(declare-fun mapValue!24088 () ValueCell!7073)

(declare-fun mapKey!24088 () (_ BitVec 32))

(declare-fun mapRest!24088 () (Array (_ BitVec 32) ValueCell!7073))

(assert (=> mapNonEmpty!24088 (= (arr!22112 _values!788) (store mapRest!24088 mapKey!24088 mapValue!24088))))

(declare-fun res!563063 () Bool)

(assert (=> start!71246 (=> (not res!563063) (not e!460036))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71246 (= res!563063 (validMask!0 mask!1312))))

(assert (=> start!71246 e!460036))

(declare-fun tp_is_empty!14977 () Bool)

(assert (=> start!71246 tp_is_empty!14977))

(declare-fun array_inv!17669 (array!46139) Bool)

(assert (=> start!71246 (array_inv!17669 _keys!976)))

(assert (=> start!71246 true))

(declare-fun e!460043 () Bool)

(declare-fun array_inv!17670 (array!46141) Bool)

(assert (=> start!71246 (and (array_inv!17670 _values!788) e!460043)))

(assert (=> start!71246 tp!46557))

(declare-fun b!826366 () Bool)

(declare-fun res!563064 () Bool)

(assert (=> b!826366 (=> (not res!563064) (not e!460036))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46139 (_ BitVec 32)) Bool)

(assert (=> b!826366 (= res!563064 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!826367 () Bool)

(declare-fun e!460039 () Bool)

(assert (=> b!826367 (= e!460039 tp_is_empty!14977)))

(declare-fun b!826368 () Bool)

(assert (=> b!826368 (= e!460041 (= lt!373069 (+!1924 (+!1924 lt!373068 (tuple2!9899 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34)) lt!373077)))))

(declare-fun b!826369 () Bool)

(assert (=> b!826369 (= e!460043 (and e!460039 mapRes!24088))))

(declare-fun condMapEmpty!24088 () Bool)

(declare-fun mapDefault!24088 () ValueCell!7073)

(assert (=> b!826369 (= condMapEmpty!24088 (= (arr!22112 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7073)) mapDefault!24088)))))

(declare-fun b!826370 () Bool)

(assert (=> b!826370 (= e!460037 tp_is_empty!14977)))

(declare-fun b!826371 () Bool)

(declare-fun res!563066 () Bool)

(assert (=> b!826371 (=> (not res!563066) (not e!460036))))

(declare-datatypes ((List!15684 0))(
  ( (Nil!15681) (Cons!15680 (h!16815 (_ BitVec 64)) (t!22021 List!15684)) )
))
(declare-fun arrayNoDuplicates!0 (array!46139 (_ BitVec 32) List!15684) Bool)

(assert (=> b!826371 (= res!563066 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15681))))

(declare-fun mapIsEmpty!24088 () Bool)

(assert (=> mapIsEmpty!24088 mapRes!24088))

(assert (= (and start!71246 res!563063) b!826363))

(assert (= (and b!826363 res!563069) b!826366))

(assert (= (and b!826366 res!563064) b!826371))

(assert (= (and b!826371 res!563066) b!826362))

(assert (= (and b!826362 (not res!563068)) b!826365))

(assert (= (and b!826365 res!563065) b!826368))

(assert (= (and b!826365 res!563067) b!826364))

(assert (= (and b!826369 condMapEmpty!24088) mapIsEmpty!24088))

(assert (= (and b!826369 (not condMapEmpty!24088)) mapNonEmpty!24088))

(get-info :version)

(assert (= (and mapNonEmpty!24088 ((_ is ValueCellFull!7073) mapValue!24088)) b!826370))

(assert (= (and b!826369 ((_ is ValueCellFull!7073) mapDefault!24088)) b!826367))

(assert (= start!71246 b!826369))

(declare-fun m!768927 () Bool)

(assert (=> b!826366 m!768927))

(declare-fun m!768929 () Bool)

(assert (=> b!826368 m!768929))

(assert (=> b!826368 m!768929))

(declare-fun m!768931 () Bool)

(assert (=> b!826368 m!768931))

(declare-fun m!768933 () Bool)

(assert (=> b!826362 m!768933))

(declare-fun m!768935 () Bool)

(assert (=> b!826362 m!768935))

(declare-fun m!768937 () Bool)

(assert (=> b!826362 m!768937))

(declare-fun m!768939 () Bool)

(assert (=> b!826371 m!768939))

(declare-fun m!768941 () Bool)

(assert (=> mapNonEmpty!24088 m!768941))

(declare-fun m!768943 () Bool)

(assert (=> start!71246 m!768943))

(declare-fun m!768945 () Bool)

(assert (=> start!71246 m!768945))

(declare-fun m!768947 () Bool)

(assert (=> start!71246 m!768947))

(declare-fun m!768949 () Bool)

(assert (=> b!826364 m!768949))

(assert (=> b!826364 m!768949))

(declare-fun m!768951 () Bool)

(assert (=> b!826364 m!768951))

(declare-fun m!768953 () Bool)

(assert (=> b!826365 m!768953))

(declare-fun m!768955 () Bool)

(assert (=> b!826365 m!768955))

(declare-fun m!768957 () Bool)

(assert (=> b!826365 m!768957))

(declare-fun m!768959 () Bool)

(assert (=> b!826365 m!768959))

(declare-fun m!768961 () Bool)

(assert (=> b!826365 m!768961))

(declare-fun m!768963 () Bool)

(assert (=> b!826365 m!768963))

(declare-fun m!768965 () Bool)

(assert (=> b!826365 m!768965))

(assert (=> b!826365 m!768959))

(declare-fun m!768967 () Bool)

(assert (=> b!826365 m!768967))

(declare-fun m!768969 () Bool)

(assert (=> b!826365 m!768969))

(assert (=> b!826365 m!768963))

(declare-fun m!768971 () Bool)

(assert (=> b!826365 m!768971))

(declare-fun m!768973 () Bool)

(assert (=> b!826365 m!768973))

(check-sat b_and!22191 (not b!826368) (not b!826366) (not b!826364) (not start!71246) tp_is_empty!14977 (not mapNonEmpty!24088) (not b!826362) (not b!826371) (not b!826365) (not b_next!13267))
(check-sat b_and!22191 (not b_next!13267))
