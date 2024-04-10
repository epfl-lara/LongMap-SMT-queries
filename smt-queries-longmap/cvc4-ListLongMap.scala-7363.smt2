; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!93900 () Bool)

(assert start!93900)

(declare-fun b_free!21359 () Bool)

(declare-fun b_next!21359 () Bool)

(assert (=> start!93900 (= b_free!21359 (not b_next!21359))))

(declare-fun tp!75503 () Bool)

(declare-fun b_and!34081 () Bool)

(assert (=> start!93900 (= tp!75503 b_and!34081)))

(declare-fun b!1061924 () Bool)

(declare-fun e!604787 () Bool)

(declare-fun tp_is_empty!25169 () Bool)

(assert (=> b!1061924 (= e!604787 tp_is_empty!25169)))

(declare-fun b!1061925 () Bool)

(declare-fun res!709087 () Bool)

(declare-fun e!604791 () Bool)

(assert (=> b!1061925 (=> (not res!709087) (not e!604791))))

(declare-datatypes ((array!67343 0))(
  ( (array!67344 (arr!32378 (Array (_ BitVec 32) (_ BitVec 64))) (size!32914 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67343)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67343 (_ BitVec 32)) Bool)

(assert (=> b!1061925 (= res!709087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1061926 () Bool)

(declare-fun res!709085 () Bool)

(assert (=> b!1061926 (=> (not res!709085) (not e!604791))))

(declare-datatypes ((V!38693 0))(
  ( (V!38694 (val!12635 Int)) )
))
(declare-datatypes ((ValueCell!11881 0))(
  ( (ValueCellFull!11881 (v!15245 V!38693)) (EmptyCell!11881) )
))
(declare-datatypes ((array!67345 0))(
  ( (array!67346 (arr!32379 (Array (_ BitVec 32) ValueCell!11881)) (size!32915 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67345)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1061926 (= res!709085 (and (= (size!32915 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!32914 _keys!1163) (size!32915 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!39427 () Bool)

(declare-fun mapRes!39427 () Bool)

(declare-fun tp!75502 () Bool)

(declare-fun e!604792 () Bool)

(assert (=> mapNonEmpty!39427 (= mapRes!39427 (and tp!75502 e!604792))))

(declare-fun mapKey!39427 () (_ BitVec 32))

(declare-fun mapValue!39427 () ValueCell!11881)

(declare-fun mapRest!39427 () (Array (_ BitVec 32) ValueCell!11881))

(assert (=> mapNonEmpty!39427 (= (arr!32379 _values!955) (store mapRest!39427 mapKey!39427 mapValue!39427))))

(declare-fun mapIsEmpty!39427 () Bool)

(assert (=> mapIsEmpty!39427 mapRes!39427))

(declare-fun b!1061928 () Bool)

(declare-fun e!604788 () Bool)

(assert (=> b!1061928 (= e!604791 (not e!604788))))

(declare-fun res!709088 () Bool)

(assert (=> b!1061928 (=> res!709088 e!604788)))

(assert (=> b!1061928 (= res!709088 (or (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-datatypes ((tuple2!15974 0))(
  ( (tuple2!15975 (_1!7998 (_ BitVec 64)) (_2!7998 V!38693)) )
))
(declare-datatypes ((List!22558 0))(
  ( (Nil!22555) (Cons!22554 (h!23763 tuple2!15974) (t!31869 List!22558)) )
))
(declare-datatypes ((ListLongMap!13943 0))(
  ( (ListLongMap!13944 (toList!6987 List!22558)) )
))
(declare-fun lt!467813 () ListLongMap!13943)

(declare-fun lt!467816 () ListLongMap!13943)

(assert (=> b!1061928 (= lt!467813 lt!467816)))

(declare-fun zeroValueBefore!47 () V!38693)

(declare-fun minValue!907 () V!38693)

(declare-datatypes ((Unit!34776 0))(
  ( (Unit!34777) )
))
(declare-fun lt!467815 () Unit!34776)

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38693)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!626 (array!67343 array!67345 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38693 V!38693 V!38693 V!38693 (_ BitVec 32) Int) Unit!34776)

(assert (=> b!1061928 (= lt!467815 (lemmaNoChangeToArrayThenSameMapNoExtras!626 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3589 (array!67343 array!67345 (_ BitVec 32) (_ BitVec 32) V!38693 V!38693 (_ BitVec 32) Int) ListLongMap!13943)

(assert (=> b!1061928 (= lt!467816 (getCurrentListMapNoExtraKeys!3589 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1061928 (= lt!467813 (getCurrentListMapNoExtraKeys!3589 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1061929 () Bool)

(assert (=> b!1061929 (= e!604792 tp_is_empty!25169)))

(declare-fun b!1061930 () Bool)

(declare-fun e!604790 () Bool)

(assert (=> b!1061930 (= e!604790 (and e!604787 mapRes!39427))))

(declare-fun condMapEmpty!39427 () Bool)

(declare-fun mapDefault!39427 () ValueCell!11881)

