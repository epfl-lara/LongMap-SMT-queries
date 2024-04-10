; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!70556 () Bool)

(assert start!70556)

(declare-fun b_free!12863 () Bool)

(declare-fun b_next!12863 () Bool)

(assert (=> start!70556 (= b_free!12863 (not b_next!12863))))

(declare-fun tp!45324 () Bool)

(declare-fun b_and!21705 () Bool)

(assert (=> start!70556 (= tp!45324 b_and!21705)))

(declare-fun mapNonEmpty!23461 () Bool)

(declare-fun mapRes!23461 () Bool)

(declare-fun tp!45325 () Bool)

(declare-fun e!455183 () Bool)

(assert (=> mapNonEmpty!23461 (= mapRes!23461 (and tp!45325 e!455183))))

(declare-datatypes ((V!24431 0))(
  ( (V!24432 (val!7334 Int)) )
))
(declare-datatypes ((ValueCell!6871 0))(
  ( (ValueCellFull!6871 (v!9764 V!24431)) (EmptyCell!6871) )
))
(declare-fun mapValue!23461 () ValueCell!6871)

(declare-fun mapRest!23461 () (Array (_ BitVec 32) ValueCell!6871))

(declare-datatypes ((array!45344 0))(
  ( (array!45345 (arr!21725 (Array (_ BitVec 32) ValueCell!6871)) (size!22146 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45344)

(declare-fun mapKey!23461 () (_ BitVec 32))

(assert (=> mapNonEmpty!23461 (= (arr!21725 _values!788) (store mapRest!23461 mapKey!23461 mapValue!23461))))

(declare-fun b!819602 () Bool)

(declare-fun res!559266 () Bool)

(declare-fun e!455179 () Bool)

(assert (=> b!819602 (=> (not res!559266) (not e!455179))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(declare-datatypes ((array!45346 0))(
  ( (array!45347 (arr!21726 (Array (_ BitVec 32) (_ BitVec 64))) (size!22147 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45346)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(assert (=> b!819602 (= res!559266 (and (= (size!22146 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22147 _keys!976) (size!22146 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!819603 () Bool)

(declare-fun e!455181 () Bool)

(declare-fun tp_is_empty!14573 () Bool)

(assert (=> b!819603 (= e!455181 tp_is_empty!14573)))

(declare-fun b!819604 () Bool)

(declare-fun e!455178 () Bool)

(assert (=> b!819604 (= e!455179 (not e!455178))))

(declare-fun res!559267 () Bool)

(assert (=> b!819604 (=> res!559267 e!455178)))

(assert (=> b!819604 (= res!559267 (or (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!9652 0))(
  ( (tuple2!9653 (_1!4837 (_ BitVec 64)) (_2!4837 V!24431)) )
))
(declare-datatypes ((List!15479 0))(
  ( (Nil!15476) (Cons!15475 (h!16604 tuple2!9652) (t!21810 List!15479)) )
))
(declare-datatypes ((ListLongMap!8475 0))(
  ( (ListLongMap!8476 (toList!4253 List!15479)) )
))
(declare-fun lt!367887 () ListLongMap!8475)

(declare-fun lt!367889 () ListLongMap!8475)

(assert (=> b!819604 (= lt!367887 lt!367889)))

(declare-fun zeroValueBefore!34 () V!24431)

(declare-fun zeroValueAfter!34 () V!24431)

(declare-fun minValue!754 () V!24431)

(declare-datatypes ((Unit!27985 0))(
  ( (Unit!27986) )
))
(declare-fun lt!367894 () Unit!27985)

(declare-fun defaultEntry!796 () Int)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!395 (array!45346 array!45344 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24431 V!24431 V!24431 V!24431 (_ BitVec 32) Int) Unit!27985)

(assert (=> b!819604 (= lt!367894 (lemmaNoChangeToArrayThenSameMapNoExtras!395 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2285 (array!45346 array!45344 (_ BitVec 32) (_ BitVec 32) V!24431 V!24431 (_ BitVec 32) Int) ListLongMap!8475)

(assert (=> b!819604 (= lt!367889 (getCurrentListMapNoExtraKeys!2285 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819604 (= lt!367887 (getCurrentListMapNoExtraKeys!2285 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819605 () Bool)

(assert (=> b!819605 (= e!455178 true)))

(declare-fun lt!367891 () tuple2!9652)

(declare-fun lt!367895 () ListLongMap!8475)

(declare-fun lt!367893 () tuple2!9652)

(declare-fun +!1849 (ListLongMap!8475 tuple2!9652) ListLongMap!8475)

(assert (=> b!819605 (= lt!367895 (+!1849 (+!1849 lt!367889 lt!367891) lt!367893))))

(declare-fun lt!367892 () ListLongMap!8475)

(assert (=> b!819605 (= (+!1849 lt!367887 lt!367893) (+!1849 lt!367892 lt!367893))))

(declare-fun lt!367896 () Unit!27985)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!188 (ListLongMap!8475 (_ BitVec 64) V!24431 V!24431) Unit!27985)

(assert (=> b!819605 (= lt!367896 (addSameAsAddTwiceSameKeyDiffValues!188 lt!367887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34 zeroValueAfter!34))))

(assert (=> b!819605 (= lt!367893 (tuple2!9653 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueAfter!34))))

(declare-fun e!455182 () Bool)

(assert (=> b!819605 e!455182))

(declare-fun res!559268 () Bool)

(assert (=> b!819605 (=> (not res!559268) (not e!455182))))

(declare-fun lt!367890 () ListLongMap!8475)

(assert (=> b!819605 (= res!559268 (= lt!367890 lt!367892))))

(assert (=> b!819605 (= lt!367892 (+!1849 lt!367887 lt!367891))))

(assert (=> b!819605 (= lt!367891 (tuple2!9653 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34))))

(declare-fun lt!367888 () ListLongMap!8475)

(declare-fun getCurrentListMap!2454 (array!45346 array!45344 (_ BitVec 32) (_ BitVec 32) V!24431 V!24431 (_ BitVec 32) Int) ListLongMap!8475)

(assert (=> b!819605 (= lt!367888 (getCurrentListMap!2454 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!819605 (= lt!367890 (getCurrentListMap!2454 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!819606 () Bool)

(declare-fun e!455184 () Bool)

(assert (=> b!819606 (= e!455184 (and e!455181 mapRes!23461))))

(declare-fun condMapEmpty!23461 () Bool)

(declare-fun mapDefault!23461 () ValueCell!6871)

