; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93926 () Bool)

(assert start!93926)

(declare-fun b_free!21385 () Bool)

(declare-fun b_next!21385 () Bool)

(assert (=> start!93926 (= b_free!21385 (not b_next!21385))))

(declare-fun tp!75581 () Bool)

(declare-fun b_and!34107 () Bool)

(assert (=> start!93926 (= tp!75581 b_and!34107)))

(declare-fun b!1062274 () Bool)

(declare-fun res!709321 () Bool)

(declare-fun e!605062 () Bool)

(assert (=> b!1062274 (=> (not res!709321) (not e!605062))))

(declare-datatypes ((array!67393 0))(
  ( (array!67394 (arr!32403 (Array (_ BitVec 32) (_ BitVec 64))) (size!32939 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67393)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67393 (_ BitVec 32)) Bool)

(assert (=> b!1062274 (= res!709321 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1062275 () Bool)

(declare-fun e!605064 () Bool)

(assert (=> b!1062275 (= e!605062 (not e!605064))))

(declare-fun res!709319 () Bool)

(assert (=> b!1062275 (=> res!709319 e!605064)))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1062275 (= res!709319 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((V!38729 0))(
  ( (V!38730 (val!12648 Int)) )
))
(declare-datatypes ((tuple2!15996 0))(
  ( (tuple2!15997 (_1!8009 (_ BitVec 64)) (_2!8009 V!38729)) )
))
(declare-datatypes ((List!22579 0))(
  ( (Nil!22576) (Cons!22575 (h!23784 tuple2!15996) (t!31890 List!22579)) )
))
(declare-datatypes ((ListLongMap!13965 0))(
  ( (ListLongMap!13966 (toList!6998 List!22579)) )
))
(declare-fun lt!468008 () ListLongMap!13965)

(declare-fun lt!468007 () ListLongMap!13965)

(assert (=> b!1062275 (= lt!468008 lt!468007)))

(declare-fun zeroValueBefore!47 () V!38729)

(declare-datatypes ((ValueCell!11894 0))(
  ( (ValueCellFull!11894 (v!15258 V!38729)) (EmptyCell!11894) )
))
(declare-datatypes ((array!67395 0))(
  ( (array!67396 (arr!32404 (Array (_ BitVec 32) ValueCell!11894)) (size!32940 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67395)

(declare-fun minValue!907 () V!38729)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38729)

(declare-datatypes ((Unit!34796 0))(
  ( (Unit!34797) )
))
(declare-fun lt!468011 () Unit!34796)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!634 (array!67393 array!67395 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38729 V!38729 V!38729 V!38729 (_ BitVec 32) Int) Unit!34796)

(assert (=> b!1062275 (= lt!468011 (lemmaNoChangeToArrayThenSameMapNoExtras!634 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3597 (array!67393 array!67395 (_ BitVec 32) (_ BitVec 32) V!38729 V!38729 (_ BitVec 32) Int) ListLongMap!13965)

(assert (=> b!1062275 (= lt!468007 (getCurrentListMapNoExtraKeys!3597 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1062275 (= lt!468008 (getCurrentListMapNoExtraKeys!3597 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1062276 () Bool)

(declare-fun res!709317 () Bool)

(assert (=> b!1062276 (=> (not res!709317) (not e!605062))))

(declare-datatypes ((List!22580 0))(
  ( (Nil!22577) (Cons!22576 (h!23785 (_ BitVec 64)) (t!31891 List!22580)) )
))
(declare-fun arrayNoDuplicates!0 (array!67393 (_ BitVec 32) List!22580) Bool)

(assert (=> b!1062276 (= res!709317 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22577))))

(declare-fun mapNonEmpty!39466 () Bool)

(declare-fun mapRes!39466 () Bool)

(declare-fun tp!75580 () Bool)

(declare-fun e!605061 () Bool)

(assert (=> mapNonEmpty!39466 (= mapRes!39466 (and tp!75580 e!605061))))

(declare-fun mapRest!39466 () (Array (_ BitVec 32) ValueCell!11894))

(declare-fun mapKey!39466 () (_ BitVec 32))

(declare-fun mapValue!39466 () ValueCell!11894)

(assert (=> mapNonEmpty!39466 (= (arr!32404 _values!955) (store mapRest!39466 mapKey!39466 mapValue!39466))))

(declare-fun mapIsEmpty!39466 () Bool)

(assert (=> mapIsEmpty!39466 mapRes!39466))

(declare-fun b!1062277 () Bool)

(declare-fun res!709322 () Bool)

(assert (=> b!1062277 (=> (not res!709322) (not e!605062))))

(assert (=> b!1062277 (= res!709322 (and (= (size!32940 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32939 _keys!1163) (size!32940 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1062278 () Bool)

(declare-fun e!605065 () Bool)

(assert (=> b!1062278 (= e!605064 e!605065)))

(declare-fun res!709318 () Bool)

(assert (=> b!1062278 (=> res!709318 e!605065)))

(declare-fun lt!468010 () ListLongMap!13965)

(declare-fun contains!6231 (ListLongMap!13965 (_ BitVec 64)) Bool)

(assert (=> b!1062278 (= res!709318 (contains!6231 lt!468010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun getCurrentListMap!3984 (array!67393 array!67395 (_ BitVec 32) (_ BitVec 32) V!38729 V!38729 (_ BitVec 32) Int) ListLongMap!13965)

(assert (=> b!1062278 (= lt!468010 (getCurrentListMap!3984 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!709320 () Bool)

(assert (=> start!93926 (=> (not res!709320) (not e!605062))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93926 (= res!709320 (validMask!0 mask!1515))))

(assert (=> start!93926 e!605062))

(assert (=> start!93926 true))

(declare-fun tp_is_empty!25195 () Bool)

(assert (=> start!93926 tp_is_empty!25195))

(declare-fun e!605060 () Bool)

(declare-fun array_inv!25104 (array!67395) Bool)

(assert (=> start!93926 (and (array_inv!25104 _values!955) e!605060)))

(assert (=> start!93926 tp!75581))

(declare-fun array_inv!25105 (array!67393) Bool)

(assert (=> start!93926 (array_inv!25105 _keys!1163)))

(declare-fun b!1062279 () Bool)

(assert (=> b!1062279 (= e!605061 tp_is_empty!25195)))

(declare-fun b!1062280 () Bool)

(assert (=> b!1062280 (= e!605065 true)))

(declare-fun -!563 (ListLongMap!13965 (_ BitVec 64)) ListLongMap!13965)

(assert (=> b!1062280 (= (-!563 lt!468010 #b0000000000000000000000000000000000000000000000000000000000000000) lt!468010)))

(declare-fun lt!468009 () Unit!34796)

(declare-fun removeNotPresentStillSame!10 (ListLongMap!13965 (_ BitVec 64)) Unit!34796)

(assert (=> b!1062280 (= lt!468009 (removeNotPresentStillSame!10 lt!468010 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1062281 () Bool)

(declare-fun e!605059 () Bool)

(assert (=> b!1062281 (= e!605059 tp_is_empty!25195)))

(declare-fun b!1062282 () Bool)

(assert (=> b!1062282 (= e!605060 (and e!605059 mapRes!39466))))

(declare-fun condMapEmpty!39466 () Bool)

(declare-fun mapDefault!39466 () ValueCell!11894)

