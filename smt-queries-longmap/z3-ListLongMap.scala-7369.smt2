; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93934 () Bool)

(assert start!93934)

(declare-fun b_free!21393 () Bool)

(declare-fun b_next!21393 () Bool)

(assert (=> start!93934 (= b_free!21393 (not b_next!21393))))

(declare-fun tp!75604 () Bool)

(declare-fun b_and!34115 () Bool)

(assert (=> start!93934 (= tp!75604 b_and!34115)))

(declare-fun b!1062382 () Bool)

(declare-fun e!605143 () Bool)

(declare-fun tp_is_empty!25203 () Bool)

(assert (=> b!1062382 (= e!605143 tp_is_empty!25203)))

(declare-fun b!1062383 () Bool)

(declare-fun res!709391 () Bool)

(declare-fun e!605144 () Bool)

(assert (=> b!1062383 (=> (not res!709391) (not e!605144))))

(declare-datatypes ((array!67409 0))(
  ( (array!67410 (arr!32411 (Array (_ BitVec 32) (_ BitVec 64))) (size!32947 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67409)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67409 (_ BitVec 32)) Bool)

(assert (=> b!1062383 (= res!709391 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062384 () Bool)

(declare-fun res!709389 () Bool)

(assert (=> b!1062384 (=> (not res!709389) (not e!605144))))

(declare-datatypes ((List!22587 0))(
  ( (Nil!22584) (Cons!22583 (h!23792 (_ BitVec 64)) (t!31898 List!22587)) )
))
(declare-fun arrayNoDuplicates!0 (array!67409 (_ BitVec 32) List!22587) Bool)

(assert (=> b!1062384 (= res!709389 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22584))))

(declare-fun b!1062385 () Bool)

(declare-fun e!605148 () Bool)

(assert (=> b!1062385 (= e!605148 true)))

(declare-datatypes ((V!38739 0))(
  ( (V!38740 (val!12652 Int)) )
))
(declare-datatypes ((tuple2!16004 0))(
  ( (tuple2!16005 (_1!8013 (_ BitVec 64)) (_2!8013 V!38739)) )
))
(declare-datatypes ((List!22588 0))(
  ( (Nil!22585) (Cons!22584 (h!23793 tuple2!16004) (t!31899 List!22588)) )
))
(declare-datatypes ((ListLongMap!13973 0))(
  ( (ListLongMap!13974 (toList!7002 List!22588)) )
))
(declare-fun lt!468067 () ListLongMap!13973)

(declare-fun -!566 (ListLongMap!13973 (_ BitVec 64)) ListLongMap!13973)

(assert (=> b!1062385 (= (-!566 lt!468067 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468067)))

(declare-datatypes ((Unit!34802 0))(
  ( (Unit!34803) )
))
(declare-fun lt!468068 () Unit!34802)

(declare-fun removeNotPresentStillSame!13 (ListLongMap!13973 (_ BitVec 64)) Unit!34802)

(assert (=> b!1062385 (= lt!468068 (removeNotPresentStillSame!13 lt!468067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062386 () Bool)

(declare-fun e!605149 () Bool)

(declare-fun mapRes!39478 () Bool)

(assert (=> b!1062386 (= e!605149 (and e!605143 mapRes!39478))))

(declare-fun condMapEmpty!39478 () Bool)

(declare-datatypes ((ValueCell!11898 0))(
  ( (ValueCellFull!11898 (v!15262 V!38739)) (EmptyCell!11898) )
))
(declare-datatypes ((array!67411 0))(
  ( (array!67412 (arr!32412 (Array (_ BitVec 32) ValueCell!11898)) (size!32948 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67411)

(declare-fun mapDefault!39478 () ValueCell!11898)

(assert (=> b!1062386 (= condMapEmpty!39478 (= (arr!32412 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11898)) mapDefault!39478)))))

(declare-fun b!1062387 () Bool)

(declare-fun e!605147 () Bool)

(assert (=> b!1062387 (= e!605144 (not e!605147))))

(declare-fun res!709394 () Bool)

(assert (=> b!1062387 (=> res!709394 e!605147)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062387 (= res!709394 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!468070 () ListLongMap!13973)

(declare-fun lt!468069 () ListLongMap!13973)

(assert (=> b!1062387 (= lt!468070 lt!468069)))

(declare-fun zeroValueBefore!47 () V!38739)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38739)

(declare-fun minValue!907 () V!38739)

(declare-fun lt!468071 () Unit!34802)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!637 (array!67409 array!67411 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38739 V!38739 V!38739 V!38739 (_ BitVec 32) Int) Unit!34802)

(assert (=> b!1062387 (= lt!468071 (lemmaNoChangeToArrayThenSameMapNoExtras!637 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3600 (array!67409 array!67411 (_ BitVec 32) (_ BitVec 32) V!38739 V!38739 (_ BitVec 32) Int) ListLongMap!13973)

(assert (=> b!1062387 (= lt!468069 (getCurrentListMapNoExtraKeys!3600 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062387 (= lt!468070 (getCurrentListMapNoExtraKeys!3600 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!709390 () Bool)

(assert (=> start!93934 (=> (not res!709390) (not e!605144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93934 (= res!709390 (validMask!0 mask!1515))))

(assert (=> start!93934 e!605144))

(assert (=> start!93934 true))

(assert (=> start!93934 tp_is_empty!25203))

(declare-fun array_inv!25108 (array!67411) Bool)

(assert (=> start!93934 (and (array_inv!25108 _values!955) e!605149)))

(assert (=> start!93934 tp!75604))

(declare-fun array_inv!25109 (array!67409) Bool)

(assert (=> start!93934 (array_inv!25109 _keys!1163)))

(declare-fun b!1062388 () Bool)

(assert (=> b!1062388 (= e!605147 e!605148)))

(declare-fun res!709393 () Bool)

(assert (=> b!1062388 (=> res!709393 e!605148)))

(declare-fun contains!6234 (ListLongMap!13973 (_ BitVec 64)) Bool)

(assert (=> b!1062388 (= res!709393 (contains!6234 lt!468067 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3987 (array!67409 array!67411 (_ BitVec 32) (_ BitVec 32) V!38739 V!38739 (_ BitVec 32) Int) ListLongMap!13973)

(assert (=> b!1062388 (= lt!468067 (getCurrentListMap!3987 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062389 () Bool)

(declare-fun res!709392 () Bool)

(assert (=> b!1062389 (=> (not res!709392) (not e!605144))))

(assert (=> b!1062389 (= res!709392 (and (= (size!32948 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32947 _keys!1163) (size!32948 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39478 () Bool)

(declare-fun tp!75605 () Bool)

(declare-fun e!605146 () Bool)

(assert (=> mapNonEmpty!39478 (= mapRes!39478 (and tp!75605 e!605146))))

(declare-fun mapKey!39478 () (_ BitVec 32))

(declare-fun mapValue!39478 () ValueCell!11898)

(declare-fun mapRest!39478 () (Array (_ BitVec 32) ValueCell!11898))

(assert (=> mapNonEmpty!39478 (= (arr!32412 _values!955) (store mapRest!39478 mapKey!39478 mapValue!39478))))

(declare-fun b!1062390 () Bool)

(assert (=> b!1062390 (= e!605146 tp_is_empty!25203)))

(declare-fun mapIsEmpty!39478 () Bool)

(assert (=> mapIsEmpty!39478 mapRes!39478))

(assert (= (and start!93934 res!709390) b!1062389))

(assert (= (and b!1062389 res!709392) b!1062383))

(assert (= (and b!1062383 res!709391) b!1062384))

(assert (= (and b!1062384 res!709389) b!1062387))

(assert (= (and b!1062387 (not res!709394)) b!1062388))

(assert (= (and b!1062388 (not res!709393)) b!1062385))

(assert (= (and b!1062386 condMapEmpty!39478) mapIsEmpty!39478))

(assert (= (and b!1062386 (not condMapEmpty!39478)) mapNonEmpty!39478))

(get-info :version)

(assert (= (and mapNonEmpty!39478 ((_ is ValueCellFull!11898) mapValue!39478)) b!1062390))

(assert (= (and b!1062386 ((_ is ValueCellFull!11898) mapDefault!39478)) b!1062382))

(assert (= start!93934 b!1062386))

(declare-fun m!981137 () Bool)

(assert (=> mapNonEmpty!39478 m!981137))

(declare-fun m!981139 () Bool)

(assert (=> b!1062383 m!981139))

(declare-fun m!981141 () Bool)

(assert (=> b!1062385 m!981141))

(declare-fun m!981143 () Bool)

(assert (=> b!1062385 m!981143))

(declare-fun m!981145 () Bool)

(assert (=> start!93934 m!981145))

(declare-fun m!981147 () Bool)

(assert (=> start!93934 m!981147))

(declare-fun m!981149 () Bool)

(assert (=> start!93934 m!981149))

(declare-fun m!981151 () Bool)

(assert (=> b!1062387 m!981151))

(declare-fun m!981153 () Bool)

(assert (=> b!1062387 m!981153))

(declare-fun m!981155 () Bool)

(assert (=> b!1062387 m!981155))

(declare-fun m!981157 () Bool)

(assert (=> b!1062388 m!981157))

(declare-fun m!981159 () Bool)

(assert (=> b!1062388 m!981159))

(declare-fun m!981161 () Bool)

(assert (=> b!1062384 m!981161))

(check-sat (not b!1062388) b_and!34115 (not b!1062387) (not b!1062385) tp_is_empty!25203 (not mapNonEmpty!39478) (not b_next!21393) (not b!1062384) (not b!1062383) (not start!93934))
(check-sat b_and!34115 (not b_next!21393))
