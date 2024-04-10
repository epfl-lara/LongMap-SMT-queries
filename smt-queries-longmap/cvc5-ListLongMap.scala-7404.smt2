; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94216 () Bool)

(assert start!94216)

(declare-fun b_free!21601 () Bool)

(declare-fun b_next!21601 () Bool)

(assert (=> start!94216 (= b_free!21601 (not b_next!21601))))

(declare-fun tp!76241 () Bool)

(declare-fun b_and!34361 () Bool)

(assert (=> start!94216 (= tp!76241 b_and!34361)))

(declare-fun b!1065465 () Bool)

(declare-fun e!607408 () Bool)

(assert (=> b!1065465 (= e!607408 true)))

(declare-datatypes ((V!39017 0))(
  ( (V!39018 (val!12756 Int)) )
))
(declare-datatypes ((tuple2!16166 0))(
  ( (tuple2!16167 (_1!8094 (_ BitVec 64)) (_2!8094 V!39017)) )
))
(declare-datatypes ((List!22735 0))(
  ( (Nil!22732) (Cons!22731 (h!23940 tuple2!16166) (t!32054 List!22735)) )
))
(declare-datatypes ((ListLongMap!14135 0))(
  ( (ListLongMap!14136 (toList!7083 List!22735)) )
))
(declare-fun lt!469881 () ListLongMap!14135)

(declare-fun lt!469874 () ListLongMap!14135)

(declare-fun -!598 (ListLongMap!14135 (_ BitVec 64)) ListLongMap!14135)

(assert (=> b!1065465 (= lt!469881 (-!598 lt!469874 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!469875 () ListLongMap!14135)

(declare-fun lt!469879 () ListLongMap!14135)

(assert (=> b!1065465 (= (-!598 lt!469875 #b0000000000000000000000000000000000000000000000000000000000000000) lt!469879)))

(declare-datatypes ((Unit!34959 0))(
  ( (Unit!34960) )
))
(declare-fun lt!469880 () Unit!34959)

(declare-fun zeroValueBefore!47 () V!39017)

(declare-fun addThenRemoveForNewKeyIsSame!7 (ListLongMap!14135 (_ BitVec 64) V!39017) Unit!34959)

(assert (=> b!1065465 (= lt!469880 (addThenRemoveForNewKeyIsSame!7 lt!469879 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47))))

(declare-fun lt!469878 () ListLongMap!14135)

(declare-fun lt!469876 () ListLongMap!14135)

(assert (=> b!1065465 (and (= lt!469874 lt!469875) (= lt!469878 lt!469876))))

(declare-fun +!3129 (ListLongMap!14135 tuple2!16166) ListLongMap!14135)

(assert (=> b!1065465 (= lt!469875 (+!3129 lt!469879 (tuple2!16167 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!47)))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12002 0))(
  ( (ValueCellFull!12002 (v!15368 V!39017)) (EmptyCell!12002) )
))
(declare-datatypes ((array!67809 0))(
  ( (array!67810 (arr!32607 (Array (_ BitVec 32) ValueCell!12002)) (size!33143 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67809)

(declare-fun minValue!907 () V!39017)

(declare-datatypes ((array!67811 0))(
  ( (array!67812 (arr!32608 (Array (_ BitVec 32) (_ BitVec 64))) (size!33144 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67811)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!39017)

(declare-fun getCurrentListMap!4042 (array!67811 array!67809 (_ BitVec 32) (_ BitVec 32) V!39017 V!39017 (_ BitVec 32) Int) ListLongMap!14135)

(assert (=> b!1065465 (= lt!469878 (getCurrentListMap!4042 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1065465 (= lt!469874 (getCurrentListMap!4042 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1065466 () Bool)

(declare-fun e!607409 () Bool)

(declare-fun tp_is_empty!25411 () Bool)

(assert (=> b!1065466 (= e!607409 tp_is_empty!25411)))

(declare-fun b!1065467 () Bool)

(declare-fun e!607404 () Bool)

(declare-fun e!607407 () Bool)

(declare-fun mapRes!39802 () Bool)

(assert (=> b!1065467 (= e!607404 (and e!607407 mapRes!39802))))

(declare-fun condMapEmpty!39802 () Bool)

(declare-fun mapDefault!39802 () ValueCell!12002)

