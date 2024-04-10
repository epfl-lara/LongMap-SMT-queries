; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94146 () Bool)

(assert start!94146)

(declare-fun b_free!21547 () Bool)

(declare-fun b_next!21547 () Bool)

(assert (=> start!94146 (= b_free!21547 (not b_next!21547))))

(declare-fun tp!76075 () Bool)

(declare-fun b_and!34297 () Bool)

(assert (=> start!94146 (= tp!76075 b_and!34297)))

(declare-fun b!1064660 () Bool)

(declare-fun res!710729 () Bool)

(declare-fun e!606817 () Bool)

(assert (=> b!1064660 (=> (not res!710729) (not e!606817))))

(declare-datatypes ((array!67701 0))(
  ( (array!67702 (arr!32554 (Array (_ BitVec 32) (_ BitVec 64))) (size!33090 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67701)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67701 (_ BitVec 32)) Bool)

(assert (=> b!1064660 (= res!710729 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064661 () Bool)

(declare-fun e!606818 () Bool)

(assert (=> b!1064661 (= e!606818 true)))

(declare-datatypes ((V!38945 0))(
  ( (V!38946 (val!12729 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38945)

(declare-datatypes ((tuple2!16122 0))(
  ( (tuple2!16123 (_1!8072 (_ BitVec 64)) (_2!8072 V!38945)) )
))
(declare-datatypes ((List!22694 0))(
  ( (Nil!22691) (Cons!22690 (h!23899 tuple2!16122) (t!32011 List!22694)) )
))
(declare-datatypes ((ListLongMap!14091 0))(
  ( (ListLongMap!14092 (toList!7061 List!22694)) )
))
(declare-fun lt!469313 () ListLongMap!14091)

(declare-datatypes ((ValueCell!11975 0))(
  ( (ValueCellFull!11975 (v!15341 V!38945)) (EmptyCell!11975) )
))
(declare-datatypes ((array!67703 0))(
  ( (array!67704 (arr!32555 (Array (_ BitVec 32) ValueCell!11975)) (size!33091 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67703)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38945)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-fun getCurrentListMap!4021 (array!67701 array!67703 (_ BitVec 32) (_ BitVec 32) V!38945 V!38945 (_ BitVec 32) Int) ListLongMap!14091)

(assert (=> b!1064661 (= lt!469313 (getCurrentListMap!4021 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun res!710730 () Bool)

(assert (=> start!94146 (=> (not res!710730) (not e!606817))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94146 (= res!710730 (validMask!0 mask!1515))))

(assert (=> start!94146 e!606817))

(assert (=> start!94146 true))

(declare-fun tp_is_empty!25357 () Bool)

(assert (=> start!94146 tp_is_empty!25357))

(declare-fun e!606819 () Bool)

(declare-fun array_inv!25208 (array!67703) Bool)

(assert (=> start!94146 (and (array_inv!25208 _values!955) e!606819)))

(assert (=> start!94146 tp!76075))

(declare-fun array_inv!25209 (array!67701) Bool)

(assert (=> start!94146 (array_inv!25209 _keys!1163)))

(declare-fun b!1064662 () Bool)

(declare-fun res!710728 () Bool)

(assert (=> b!1064662 (=> (not res!710728) (not e!606817))))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(assert (=> b!1064662 (= res!710728 (and (= (size!33091 _values!955) (bvadd mask!1515 #b00000000000000000000000000000001)) (= (size!33090 _keys!1163) (size!33091 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!1064663 () Bool)

(declare-fun e!606815 () Bool)

(declare-fun mapRes!39718 () Bool)

(assert (=> b!1064663 (= e!606819 (and e!606815 mapRes!39718))))

(declare-fun condMapEmpty!39718 () Bool)

(declare-fun mapDefault!39718 () ValueCell!11975)

