; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94644 () Bool)

(assert start!94644)

(declare-fun b_free!21913 () Bool)

(declare-fun b_next!21913 () Bool)

(assert (=> start!94644 (= b_free!21913 (not b_next!21913))))

(declare-fun tp!77194 () Bool)

(declare-fun b_and!34733 () Bool)

(assert (=> start!94644 (= tp!77194 b_and!34733)))

(declare-fun b!1070061 () Bool)

(declare-fun e!610761 () Bool)

(declare-fun tp_is_empty!25723 () Bool)

(assert (=> b!1070061 (= e!610761 tp_is_empty!25723)))

(declare-fun b!1070062 () Bool)

(declare-fun e!610764 () Bool)

(assert (=> b!1070062 (= e!610764 true)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!39433 0))(
  ( (V!39434 (val!12912 Int)) )
))
(declare-fun zeroValueBefore!47 () V!39433)

(declare-datatypes ((ValueCell!12158 0))(
  ( (ValueCellFull!12158 (v!15528 V!39433)) (EmptyCell!12158) )
))
(declare-datatypes ((array!68425 0))(
  ( (array!68426 (arr!32909 (Array (_ BitVec 32) ValueCell!12158)) (size!33445 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68425)

(declare-fun minValue!907 () V!39433)

(declare-datatypes ((tuple2!16416 0))(
  ( (tuple2!16417 (_1!8219 (_ BitVec 64)) (_2!8219 V!39433)) )
))
(declare-datatypes ((List!22959 0))(
  ( (Nil!22956) (Cons!22955 (h!24164 tuple2!16416) (t!32290 List!22959)) )
))
(declare-datatypes ((ListLongMap!14385 0))(
  ( (ListLongMap!14386 (toList!7208 List!22959)) )
))
(declare-fun lt!472882 () ListLongMap!14385)

(declare-fun defaultEntry!963 () Int)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!68427 0))(
  ( (array!68428 (arr!32910 (Array (_ BitVec 32) (_ BitVec 64))) (size!33446 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68427)

(declare-fun getCurrentListMap!4112 (array!68427 array!68425 (_ BitVec 32) (_ BitVec 32) V!39433 V!39433 (_ BitVec 32) Int) ListLongMap!14385)

(assert (=> b!1070062 (= lt!472882 (getCurrentListMap!4112 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070063 () Bool)

(declare-fun e!610762 () Bool)

(assert (=> b!1070063 (= e!610762 tp_is_empty!25723)))

(declare-fun mapIsEmpty!40288 () Bool)

(declare-fun mapRes!40288 () Bool)

(assert (=> mapIsEmpty!40288 mapRes!40288))

(declare-fun mapNonEmpty!40288 () Bool)

(declare-fun tp!77195 () Bool)

(assert (=> mapNonEmpty!40288 (= mapRes!40288 (and tp!77195 e!610762))))

(declare-fun mapRest!40288 () (Array (_ BitVec 32) ValueCell!12158))

(declare-fun mapValue!40288 () ValueCell!12158)

(declare-fun mapKey!40288 () (_ BitVec 32))

(assert (=> mapNonEmpty!40288 (= (arr!32909 _values!955) (store mapRest!40288 mapKey!40288 mapValue!40288))))

(declare-fun b!1070065 () Bool)

(declare-fun res!713888 () Bool)

(declare-fun e!610760 () Bool)

(assert (=> b!1070065 (=> (not res!713888) (not e!610760))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68427 (_ BitVec 32)) Bool)

(assert (=> b!1070065 (= res!713888 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1070066 () Bool)

(assert (=> b!1070066 (= e!610760 (not e!610764))))

(declare-fun res!713890 () Bool)

(assert (=> b!1070066 (=> res!713890 e!610764)))

(assert (=> b!1070066 (= res!713890 (or (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun lt!472884 () ListLongMap!14385)

(declare-fun lt!472883 () ListLongMap!14385)

(assert (=> b!1070066 (= lt!472884 lt!472883)))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-datatypes ((Unit!35215 0))(
  ( (Unit!35216) )
))
(declare-fun lt!472885 () Unit!35215)

(declare-fun zeroValueAfter!47 () V!39433)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!821 (array!68427 array!68425 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!39433 V!39433 V!39433 V!39433 (_ BitVec 32) Int) Unit!35215)

(assert (=> b!1070066 (= lt!472885 (lemmaNoChangeToArrayThenSameMapNoExtras!821 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3784 (array!68427 array!68425 (_ BitVec 32) (_ BitVec 32) V!39433 V!39433 (_ BitVec 32) Int) ListLongMap!14385)

(assert (=> b!1070066 (= lt!472883 (getCurrentListMapNoExtraKeys!3784 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1070066 (= lt!472884 (getCurrentListMapNoExtraKeys!3784 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1070067 () Bool)

(declare-fun e!610763 () Bool)

(assert (=> b!1070067 (= e!610763 (and e!610761 mapRes!40288))))

(declare-fun condMapEmpty!40288 () Bool)

(declare-fun mapDefault!40288 () ValueCell!12158)

