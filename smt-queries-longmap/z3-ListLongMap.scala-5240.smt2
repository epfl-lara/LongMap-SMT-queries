; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70686 () Bool)

(assert start!70686)

(declare-fun b_free!12847 () Bool)

(declare-fun b_next!12847 () Bool)

(assert (=> start!70686 (= b_free!12847 (not b_next!12847))))

(declare-fun tp!45273 () Bool)

(declare-fun b_and!21687 () Bool)

(assert (=> start!70686 (= tp!45273 b_and!21687)))

(declare-fun mapIsEmpty!23434 () Bool)

(declare-fun mapRes!23434 () Bool)

(assert (=> mapIsEmpty!23434 mapRes!23434))

(declare-fun b!820086 () Bool)

(declare-fun e!455465 () Bool)

(declare-fun e!455464 () Bool)

(assert (=> b!820086 (= e!455465 (not e!455464))))

(declare-fun res!559375 () Bool)

(assert (=> b!820086 (=> res!559375 e!455464)))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!820086 (= res!559375 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!24411 0))(
  ( (V!24412 (val!7326 Int)) )
))
(declare-datatypes ((tuple2!9550 0))(
  ( (tuple2!9551 (_1!4786 (_ BitVec 64)) (_2!4786 V!24411)) )
))
(declare-datatypes ((List!15355 0))(
  ( (Nil!15352) (Cons!15351 (h!16486 tuple2!9550) (t!21676 List!15355)) )
))
(declare-datatypes ((ListLongMap!8375 0))(
  ( (ListLongMap!8376 (toList!4203 List!15355)) )
))
(declare-fun lt!367856 () ListLongMap!8375)

(declare-fun lt!367851 () ListLongMap!8375)

(assert (=> b!820086 (= lt!367856 lt!367851)))

(declare-fun zeroValueBefore!34 () V!24411)

(declare-datatypes ((array!45313 0))(
  ( (array!45314 (arr!21706 (Array (_ BitVec 32) (_ BitVec 64))) (size!22126 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45313)

(declare-fun zeroValueAfter!34 () V!24411)

(declare-fun minValue!754 () V!24411)

(declare-datatypes ((ValueCell!6863 0))(
  ( (ValueCellFull!6863 (v!9755 V!24411)) (EmptyCell!6863) )
))
(declare-datatypes ((array!45315 0))(
  ( (array!45316 (arr!21707 (Array (_ BitVec 32) ValueCell!6863)) (size!22127 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45315)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-fun defaultEntry!796 () Int)

(declare-datatypes ((Unit!27956 0))(
  ( (Unit!27957) )
))
(declare-fun lt!367847 () Unit!27956)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!387 (array!45313 array!45315 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24411 V!24411 V!24411 V!24411 (_ BitVec 32) Int) Unit!27956)

(assert (=> b!820086 (= lt!367847 (lemmaNoChangeToArrayThenSameMapNoExtras!387 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2299 (array!45313 array!45315 (_ BitVec 32) (_ BitVec 32) V!24411 V!24411 (_ BitVec 32) Int) ListLongMap!8375)

(assert (=> b!820086 (= lt!367851 (getCurrentListMapNoExtraKeys!2299 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820086 (= lt!367856 (getCurrentListMapNoExtraKeys!2299 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!820087 () Bool)

(declare-fun res!559373 () Bool)

(assert (=> b!820087 (=> (not res!559373) (not e!455465))))

(assert (=> b!820087 (= res!559373 (and (= (size!22127 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22126 _keys!976) (size!22127 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!820088 () Bool)

(declare-fun res!559377 () Bool)

(assert (=> b!820088 (=> (not res!559377) (not e!455465))))

(declare-datatypes ((List!15356 0))(
  ( (Nil!15353) (Cons!15352 (h!16487 (_ BitVec 64)) (t!21677 List!15356)) )
))
(declare-fun arrayNoDuplicates!0 (array!45313 (_ BitVec 32) List!15356) Bool)

(assert (=> b!820088 (= res!559377 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15353))))

(declare-fun b!820089 () Bool)

(declare-fun res!559378 () Bool)

(assert (=> b!820089 (=> (not res!559378) (not e!455465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45313 (_ BitVec 32)) Bool)

(assert (=> b!820089 (= res!559378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!820090 () Bool)

(declare-fun e!455470 () Bool)

(declare-fun tp_is_empty!14557 () Bool)

(assert (=> b!820090 (= e!455470 tp_is_empty!14557)))

(declare-fun mapNonEmpty!23434 () Bool)

(declare-fun tp!45274 () Bool)

(assert (=> mapNonEmpty!23434 (= mapRes!23434 (and tp!45274 e!455470))))

(declare-fun mapRest!23434 () (Array (_ BitVec 32) ValueCell!6863))

(declare-fun mapValue!23434 () ValueCell!6863)

(declare-fun mapKey!23434 () (_ BitVec 32))

(assert (=> mapNonEmpty!23434 (= (arr!21707 _values!788) (store mapRest!23434 mapKey!23434 mapValue!23434))))

(declare-fun b!820091 () Bool)

(declare-fun e!455468 () Bool)

(declare-fun e!455469 () Bool)

(assert (=> b!820091 (= e!455468 (and e!455469 mapRes!23434))))

(declare-fun condMapEmpty!23434 () Bool)

(declare-fun mapDefault!23434 () ValueCell!6863)

(assert (=> b!820091 (= condMapEmpty!23434 (= (arr!21707 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6863)) mapDefault!23434)))))

(declare-fun b!820092 () Bool)

(assert (=> b!820092 (= e!455469 tp_is_empty!14557)))

(declare-fun res!559376 () Bool)

(assert (=> start!70686 (=> (not res!559376) (not e!455465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70686 (= res!559376 (validMask!0 mask!1312))))

(assert (=> start!70686 e!455465))

(assert (=> start!70686 tp_is_empty!14557))

(declare-fun array_inv!17379 (array!45313) Bool)

(assert (=> start!70686 (array_inv!17379 _keys!976)))

(assert (=> start!70686 true))

(declare-fun array_inv!17380 (array!45315) Bool)

(assert (=> start!70686 (and (array_inv!17380 _values!788) e!455468)))

(assert (=> start!70686 tp!45273))

(declare-fun e!455466 () Bool)

(declare-fun b!820093 () Bool)

(declare-fun lt!367848 () ListLongMap!8375)

(declare-fun +!1840 (ListLongMap!8375 tuple2!9550) ListLongMap!8375)

(assert (=> b!820093 (= e!455466 (= lt!367848 (+!1840 lt!367851 (tuple2!9551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))))

(declare-fun b!820094 () Bool)

(assert (=> b!820094 (= e!455464 true)))

(declare-fun lt!367850 () ListLongMap!8375)

(declare-fun lt!367855 () tuple2!9550)

(declare-fun lt!367853 () tuple2!9550)

(assert (=> b!820094 (= lt!367850 (+!1840 (+!1840 lt!367851 lt!367853) lt!367855))))

(declare-fun lt!367849 () ListLongMap!8375)

(assert (=> b!820094 (= (+!1840 lt!367856 lt!367855) (+!1840 lt!367849 lt!367855))))

(declare-fun lt!367852 () Unit!27956)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!179 (ListLongMap!8375 (_ BitVec 64) V!24411 V!24411) Unit!27956)

(assert (=> b!820094 (= lt!367852 (addSameAsAddTwiceSameKeyDiffValues!179 lt!367856 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!820094 (= lt!367855 (tuple2!9551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(assert (=> b!820094 e!455466))

(declare-fun res!559374 () Bool)

(assert (=> b!820094 (=> (not res!559374) (not e!455466))))

(declare-fun lt!367854 () ListLongMap!8375)

(assert (=> b!820094 (= res!559374 (= lt!367854 lt!367849))))

(assert (=> b!820094 (= lt!367849 (+!1840 lt!367856 lt!367853))))

(assert (=> b!820094 (= lt!367853 (tuple2!9551 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun getCurrentListMap!2392 (array!45313 array!45315 (_ BitVec 32) (_ BitVec 32) V!24411 V!24411 (_ BitVec 32) Int) ListLongMap!8375)

(assert (=> b!820094 (= lt!367848 (getCurrentListMap!2392 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!820094 (= lt!367854 (getCurrentListMap!2392 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70686 res!559376) b!820087))

(assert (= (and b!820087 res!559373) b!820089))

(assert (= (and b!820089 res!559378) b!820088))

(assert (= (and b!820088 res!559377) b!820086))

(assert (= (and b!820086 (not res!559375)) b!820094))

(assert (= (and b!820094 res!559374) b!820093))

(assert (= (and b!820091 condMapEmpty!23434) mapIsEmpty!23434))

(assert (= (and b!820091 (not condMapEmpty!23434)) mapNonEmpty!23434))

(get-info :version)

(assert (= (and mapNonEmpty!23434 ((_ is ValueCellFull!6863) mapValue!23434)) b!820090))

(assert (= (and b!820091 ((_ is ValueCellFull!6863) mapDefault!23434)) b!820092))

(assert (= start!70686 b!820091))

(declare-fun m!762035 () Bool)

(assert (=> b!820093 m!762035))

(declare-fun m!762037 () Bool)

(assert (=> b!820089 m!762037))

(declare-fun m!762039 () Bool)

(assert (=> start!70686 m!762039))

(declare-fun m!762041 () Bool)

(assert (=> start!70686 m!762041))

(declare-fun m!762043 () Bool)

(assert (=> start!70686 m!762043))

(declare-fun m!762045 () Bool)

(assert (=> b!820086 m!762045))

(declare-fun m!762047 () Bool)

(assert (=> b!820086 m!762047))

(declare-fun m!762049 () Bool)

(assert (=> b!820086 m!762049))

(declare-fun m!762051 () Bool)

(assert (=> b!820094 m!762051))

(declare-fun m!762053 () Bool)

(assert (=> b!820094 m!762053))

(declare-fun m!762055 () Bool)

(assert (=> b!820094 m!762055))

(declare-fun m!762057 () Bool)

(assert (=> b!820094 m!762057))

(declare-fun m!762059 () Bool)

(assert (=> b!820094 m!762059))

(assert (=> b!820094 m!762051))

(declare-fun m!762061 () Bool)

(assert (=> b!820094 m!762061))

(declare-fun m!762063 () Bool)

(assert (=> b!820094 m!762063))

(declare-fun m!762065 () Bool)

(assert (=> b!820094 m!762065))

(declare-fun m!762067 () Bool)

(assert (=> b!820088 m!762067))

(declare-fun m!762069 () Bool)

(assert (=> mapNonEmpty!23434 m!762069))

(check-sat (not b!820093) (not b!820089) (not b!820088) (not start!70686) b_and!21687 (not b!820086) (not b_next!12847) tp_is_empty!14557 (not b!820094) (not mapNonEmpty!23434))
(check-sat b_and!21687 (not b_next!12847))
