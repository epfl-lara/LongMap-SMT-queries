; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94018 () Bool)

(assert start!94018)

(declare-fun b_free!21455 () Bool)

(declare-fun b_next!21455 () Bool)

(assert (=> start!94018 (= b_free!21455 (not b_next!21455))))

(declare-fun tp!75793 () Bool)

(declare-fun b_and!34187 () Bool)

(assert (=> start!94018 (= tp!75793 b_and!34187)))

(declare-fun b!1063376 () Bool)

(declare-fun res!710008 () Bool)

(declare-fun e!605894 () Bool)

(assert (=> b!1063376 (=> (not res!710008) (not e!605894))))

(declare-datatypes ((array!67529 0))(
  ( (array!67530 (arr!32470 (Array (_ BitVec 32) (_ BitVec 64))) (size!33006 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67529)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67529 (_ BitVec 32)) Bool)

(assert (=> b!1063376 (= res!710008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1063377 () Bool)

(declare-fun e!605895 () Bool)

(assert (=> b!1063377 (= e!605895 true)))

(declare-datatypes ((V!38821 0))(
  ( (V!38822 (val!12683 Int)) )
))
(declare-datatypes ((tuple2!16056 0))(
  ( (tuple2!16057 (_1!8039 (_ BitVec 64)) (_2!8039 V!38821)) )
))
(declare-datatypes ((List!22634 0))(
  ( (Nil!22631) (Cons!22630 (h!23839 tuple2!16056) (t!31947 List!22634)) )
))
(declare-datatypes ((ListLongMap!14025 0))(
  ( (ListLongMap!14026 (toList!7028 List!22634)) )
))
(declare-fun lt!468660 () ListLongMap!14025)

(declare-fun -!588 (ListLongMap!14025 (_ BitVec 64)) ListLongMap!14025)

(assert (=> b!1063377 (= (-!588 lt!468660 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468660)))

(declare-datatypes ((Unit!34854 0))(
  ( (Unit!34855) )
))
(declare-fun lt!468659 () Unit!34854)

(declare-fun removeNotPresentStillSame!35 (ListLongMap!14025 (_ BitVec 64)) Unit!34854)

(assert (=> b!1063377 (= lt!468659 (removeNotPresentStillSame!35 lt!468660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1063378 () Bool)

(declare-fun e!605900 () Bool)

(assert (=> b!1063378 (= e!605894 (not e!605900))))

(declare-fun res!710011 () Bool)

(assert (=> b!1063378 (=> res!710011 e!605900)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1063378 (= res!710011 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468657 () ListLongMap!14025)

(declare-fun lt!468656 () ListLongMap!14025)

(assert (=> b!1063378 (= lt!468657 lt!468656)))

(declare-fun zeroValueBefore!47 () V!38821)

(declare-datatypes ((ValueCell!11929 0))(
  ( (ValueCellFull!11929 (v!15294 V!38821)) (EmptyCell!11929) )
))
(declare-datatypes ((array!67531 0))(
  ( (array!67532 (arr!32471 (Array (_ BitVec 32) ValueCell!11929)) (size!33007 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67531)

(declare-fun minValue!907 () V!38821)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lt!468658 () Unit!34854)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38821)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!657 (array!67529 array!67531 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38821 V!38821 V!38821 V!38821 (_ BitVec 32) Int) Unit!34854)

(assert (=> b!1063378 (= lt!468658 (lemmaNoChangeToArrayThenSameMapNoExtras!657 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3620 (array!67529 array!67531 (_ BitVec 32) (_ BitVec 32) V!38821 V!38821 (_ BitVec 32) Int) ListLongMap!14025)

(assert (=> b!1063378 (= lt!468656 (getCurrentListMapNoExtraKeys!3620 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1063378 (= lt!468657 (getCurrentListMapNoExtraKeys!3620 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1063379 () Bool)

(declare-fun res!710012 () Bool)

(assert (=> b!1063379 (=> (not res!710012) (not e!605894))))

(declare-datatypes ((List!22635 0))(
  ( (Nil!22632) (Cons!22631 (h!23840 (_ BitVec 64)) (t!31948 List!22635)) )
))
(declare-fun arrayNoDuplicates!0 (array!67529 (_ BitVec 32) List!22635) Bool)

(assert (=> b!1063379 (= res!710012 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22632))))

(declare-fun b!1063380 () Bool)

(declare-fun res!710013 () Bool)

(assert (=> b!1063380 (=> (not res!710013) (not e!605894))))

(assert (=> b!1063380 (= res!710013 (and (= (size!33007 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33006 _keys!1163) (size!33007 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1063381 () Bool)

(declare-fun e!605897 () Bool)

(declare-fun tp_is_empty!25265 () Bool)

(assert (=> b!1063381 (= e!605897 tp_is_empty!25265)))

(declare-fun b!1063382 () Bool)

(assert (=> b!1063382 (= e!605900 e!605895)))

(declare-fun res!710010 () Bool)

(assert (=> b!1063382 (=> res!710010 e!605895)))

(declare-fun contains!6257 (ListLongMap!14025 (_ BitVec 64)) Bool)

(assert (=> b!1063382 (= res!710010 (contains!6257 lt!468660 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!4009 (array!67529 array!67531 (_ BitVec 32) (_ BitVec 32) V!38821 V!38821 (_ BitVec 32) Int) ListLongMap!14025)

(assert (=> b!1063382 (= lt!468660 (getCurrentListMap!4009 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun mapNonEmpty!39574 () Bool)

(declare-fun mapRes!39574 () Bool)

(declare-fun tp!75794 () Bool)

(declare-fun e!605899 () Bool)

(assert (=> mapNonEmpty!39574 (= mapRes!39574 (and tp!75794 e!605899))))

(declare-fun mapRest!39574 () (Array (_ BitVec 32) ValueCell!11929))

(declare-fun mapKey!39574 () (_ BitVec 32))

(declare-fun mapValue!39574 () ValueCell!11929)

(assert (=> mapNonEmpty!39574 (= (arr!32471 _values!955) (store mapRest!39574 mapKey!39574 mapValue!39574))))

(declare-fun b!1063383 () Bool)

(assert (=> b!1063383 (= e!605899 tp_is_empty!25265)))

(declare-fun res!710009 () Bool)

(assert (=> start!94018 (=> (not res!710009) (not e!605894))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94018 (= res!710009 (validMask!0 mask!1515))))

(assert (=> start!94018 e!605894))

(assert (=> start!94018 true))

(assert (=> start!94018 tp_is_empty!25265))

(declare-fun e!605898 () Bool)

(declare-fun array_inv!25150 (array!67531) Bool)

(assert (=> start!94018 (and (array_inv!25150 _values!955) e!605898)))

(assert (=> start!94018 tp!75793))

(declare-fun array_inv!25151 (array!67529) Bool)

(assert (=> start!94018 (array_inv!25151 _keys!1163)))

(declare-fun b!1063384 () Bool)

(assert (=> b!1063384 (= e!605898 (and e!605897 mapRes!39574))))

(declare-fun condMapEmpty!39574 () Bool)

(declare-fun mapDefault!39574 () ValueCell!11929)

