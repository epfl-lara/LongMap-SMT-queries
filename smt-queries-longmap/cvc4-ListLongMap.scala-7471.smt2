; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94754 () Bool)

(assert start!94754)

(declare-fun b_free!22007 () Bool)

(declare-fun b_next!22007 () Bool)

(assert (=> start!94754 (= b_free!22007 (not b_next!22007))))

(declare-fun tp!77479 () Bool)

(declare-fun b_and!34837 () Bool)

(assert (=> start!94754 (= tp!77479 b_and!34837)))

(declare-fun b!1071399 () Bool)

(declare-fun e!611765 () Bool)

(assert (=> b!1071399 (= e!611765 true)))

(declare-datatypes ((V!39557 0))(
  ( (V!39558 (val!12959 Int)) )
))
(declare-datatypes ((tuple2!16494 0))(
  ( (tuple2!16495 (_1!8258 (_ BitVec 64)) (_2!8258 V!39557)) )
))
(declare-datatypes ((List!23035 0))(
  ( (Nil!23032) (Cons!23031 (h!24240 tuple2!16494) (t!32368 List!23035)) )
))
(declare-datatypes ((ListLongMap!14463 0))(
  ( (ListLongMap!14464 (toList!7247 List!23035)) )
))
(declare-fun lt!474023 () ListLongMap!14463)

(declare-fun lt!474029 () ListLongMap!14463)

(declare-fun -!680 (ListLongMap!14463 (_ BitVec 64)) ListLongMap!14463)

(assert (=> b!1071399 (= lt!474023 (-!680 lt!474029 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!474030 () ListLongMap!14463)

(declare-fun lt!474025 () ListLongMap!14463)

(assert (=> b!1071399 (= lt!474030 lt!474025)))

(declare-fun zeroValueBefore!47 () V!39557)

(declare-fun lt!474026 () ListLongMap!14463)

(declare-datatypes ((Unit!35290 0))(
  ( (Unit!35291) )
))
(declare-fun lt!474022 () Unit!35290)

(declare-fun minValue!907 () V!39557)

(declare-fun addCommutativeForDiffKeys!725 (ListLongMap!14463 (_ BitVec 64) V!39557 (_ BitVec 64) V!39557) Unit!35290)

(assert (=> b!1071399 (= lt!474022 (addCommutativeForDiffKeys!725 lt!474026 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(declare-fun lt!474032 () ListLongMap!14463)

(assert (=> b!1071399 (= (-!680 lt!474025 #b0000000000000000000000000000000000000000000000000000000000000000) lt!474032)))

(declare-fun lt!474020 () tuple2!16494)

(declare-fun +!3182 (ListLongMap!14463 tuple2!16494) ListLongMap!14463)

(assert (=> b!1071399 (= lt!474025 (+!3182 lt!474032 lt!474020))))

(declare-fun lt!474021 () Unit!35290)

(declare-fun addThenRemoveForNewKeyIsSame!50 (ListLongMap!14463 (_ BitVec 64) V!39557) Unit!35290)

(assert (=> b!1071399 (= lt!474021 (addThenRemoveForNewKeyIsSame!50 lt!474032 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!474027 () tuple2!16494)

(assert (=> b!1071399 (= lt!474032 (+!3182 lt!474026 lt!474027))))

(declare-fun e!611768 () Bool)

(assert (=> b!1071399 e!611768))

(declare-fun res!714715 () Bool)

(assert (=> b!1071399 (=> (not res!714715) (not e!611768))))

(assert (=> b!1071399 (= res!714715 (= lt!474029 lt!474030))))

(assert (=> b!1071399 (= lt!474030 (+!3182 (+!3182 lt!474026 lt!474020) lt!474027))))

(assert (=> b!1071399 (= lt!474027 (tuple2!16495 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!907))))

(assert (=> b!1071399 (= lt!474020 (tuple2!16495 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun lt!474028 () ListLongMap!14463)

(declare-datatypes ((ValueCell!12205 0))(
  ( (ValueCellFull!12205 (v!15575 V!39557)) (EmptyCell!12205) )
))
(declare-datatypes ((array!68607 0))(
  ( (array!68608 (arr!32999 (Array (_ BitVec 32) ValueCell!12205)) (size!33535 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68607)

(declare-datatypes ((array!68609 0))(
  ( (array!68610 (arr!33000 (Array (_ BitVec 32) (_ BitVec 64))) (size!33536 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68609)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39557)

(declare-fun getCurrentListMap!4146 (array!68609 array!68607 (_ BitVec 32) (_ BitVec 32) V!39557 V!39557 (_ BitVec 32) Int) ListLongMap!14463)

(assert (=> b!1071399 (= lt!474028 (getCurrentListMap!4146 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1071399 (= lt!474029 (getCurrentListMap!4146 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1071400 () Bool)

(declare-fun res!714718 () Bool)

(declare-fun e!611767 () Bool)

(assert (=> b!1071400 (=> (not res!714718) (not e!611767))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!68609 (_ BitVec 32)) Bool)

(assert (=> b!1071400 (= res!714718 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1071401 () Bool)

(declare-fun res!714713 () Bool)

(assert (=> b!1071401 (=> (not res!714713) (not e!611767))))

(assert (=> b!1071401 (= res!714713 (and (= (size!33535 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33536 _keys!1163) (size!33535 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1071402 () Bool)

(declare-fun e!611762 () Bool)

(declare-fun e!611766 () Bool)

(declare-fun mapRes!40432 () Bool)

(assert (=> b!1071402 (= e!611762 (and e!611766 mapRes!40432))))

(declare-fun condMapEmpty!40432 () Bool)

(declare-fun mapDefault!40432 () ValueCell!12205)

