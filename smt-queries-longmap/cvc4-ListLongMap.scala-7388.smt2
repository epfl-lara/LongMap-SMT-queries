; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94094 () Bool)

(assert start!94094)

(declare-fun b_free!21509 () Bool)

(declare-fun b_next!21509 () Bool)

(assert (=> start!94094 (= b_free!21509 (not b_next!21509))))

(declare-fun tp!75958 () Bool)

(declare-fun b_and!34251 () Bool)

(assert (=> start!94094 (= tp!75958 b_and!34251)))

(declare-fun mapIsEmpty!39658 () Bool)

(declare-fun mapRes!39658 () Bool)

(assert (=> mapIsEmpty!39658 mapRes!39658))

(declare-fun b!1064139 () Bool)

(declare-fun e!606440 () Bool)

(assert (=> b!1064139 (= e!606440 (not true))))

(declare-datatypes ((V!38893 0))(
  ( (V!38894 (val!12710 Int)) )
))
(declare-datatypes ((tuple2!16096 0))(
  ( (tuple2!16097 (_1!8059 (_ BitVec 64)) (_2!8059 V!38893)) )
))
(declare-datatypes ((List!22671 0))(
  ( (Nil!22668) (Cons!22667 (h!23876 tuple2!16096) (t!31986 List!22671)) )
))
(declare-datatypes ((ListLongMap!14065 0))(
  ( (ListLongMap!14066 (toList!7048 List!22671)) )
))
(declare-fun lt!469061 () ListLongMap!14065)

(declare-fun lt!469062 () ListLongMap!14065)

(assert (=> b!1064139 (= lt!469061 lt!469062)))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun zeroValueBefore!47 () V!38893)

(declare-datatypes ((ValueCell!11956 0))(
  ( (ValueCellFull!11956 (v!15322 V!38893)) (EmptyCell!11956) )
))
(declare-datatypes ((array!67633 0))(
  ( (array!67634 (arr!32521 (Array (_ BitVec 32) ValueCell!11956)) (size!33057 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67633)

(declare-fun minValue!907 () V!38893)

(declare-datatypes ((Unit!34896 0))(
  ( (Unit!34897) )
))
(declare-fun lt!469063 () Unit!34896)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun defaultEntry!963 () Int)

(declare-fun zeroValueAfter!47 () V!38893)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67635 0))(
  ( (array!67636 (arr!32522 (Array (_ BitVec 32) (_ BitVec 64))) (size!33058 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67635)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!677 (array!67635 array!67633 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!38893 V!38893 V!38893 V!38893 (_ BitVec 32) Int) Unit!34896)

(assert (=> b!1064139 (= lt!469063 (lemmaNoChangeToArrayThenSameMapNoExtras!677 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 extraKeysAfter!68 zeroValueBefore!47 zeroValueAfter!47 minValue!907 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun getCurrentListMapNoExtraKeys!3640 (array!67635 array!67633 (_ BitVec 32) (_ BitVec 32) V!38893 V!38893 (_ BitVec 32) Int) ListLongMap!14065)

(assert (=> b!1064139 (= lt!469062 (getCurrentListMapNoExtraKeys!3640 _keys!1163 _values!955 mask!1515 extraKeysAfter!68 zeroValueAfter!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(assert (=> b!1064139 (= lt!469061 (getCurrentListMapNoExtraKeys!3640 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064140 () Bool)

(declare-fun e!606438 () Bool)

(declare-fun e!606437 () Bool)

(assert (=> b!1064140 (= e!606438 (and e!606437 mapRes!39658))))

(declare-fun condMapEmpty!39658 () Bool)

(declare-fun mapDefault!39658 () ValueCell!11956)

