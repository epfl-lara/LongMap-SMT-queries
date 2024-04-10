; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94134 () Bool)

(assert start!94134)

(declare-fun b_free!21535 () Bool)

(declare-fun b_next!21535 () Bool)

(assert (=> start!94134 (= b_free!21535 (not b_next!21535))))

(declare-fun tp!76040 () Bool)

(declare-fun b_and!34285 () Bool)

(assert (=> start!94134 (= tp!76040 b_and!34285)))

(declare-fun b!1064516 () Bool)

(declare-fun e!606711 () Bool)

(assert (=> b!1064516 (= e!606711 true)))

(declare-datatypes ((V!38929 0))(
  ( (V!38930 (val!12723 Int)) )
))
(declare-fun zeroValueBefore!47 () V!38929)

(declare-datatypes ((ValueCell!11969 0))(
  ( (ValueCellFull!11969 (v!15335 V!38929)) (EmptyCell!11969) )
))
(declare-datatypes ((array!67679 0))(
  ( (array!67680 (arr!32543 (Array (_ BitVec 32) ValueCell!11969)) (size!33079 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!67679)

(declare-fun defaultEntry!963 () Int)

(declare-fun minValue!907 () V!38929)

(declare-datatypes ((tuple2!16112 0))(
  ( (tuple2!16113 (_1!8067 (_ BitVec 64)) (_2!8067 V!38929)) )
))
(declare-datatypes ((List!22686 0))(
  ( (Nil!22683) (Cons!22682 (h!23891 tuple2!16112) (t!32003 List!22686)) )
))
(declare-datatypes ((ListLongMap!14081 0))(
  ( (ListLongMap!14082 (toList!7056 List!22686)) )
))
(declare-fun lt!469238 () ListLongMap!14081)

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!67681 0))(
  ( (array!67682 (arr!32544 (Array (_ BitVec 32) (_ BitVec 64))) (size!33080 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!67681)

(declare-fun getCurrentListMap!4017 (array!67681 array!67679 (_ BitVec 32) (_ BitVec 32) V!38929 V!38929 (_ BitVec 32) Int) ListLongMap!14081)

(assert (=> b!1064516 (= lt!469238 (getCurrentListMap!4017 _keys!1163 _values!955 mask!1515 extraKeysBefore!76 zeroValueBefore!47 minValue!907 #b00000000000000000000000000000000 defaultEntry!963))))

(declare-fun b!1064517 () Bool)

(declare-fun res!710641 () Bool)

(declare-fun e!606708 () Bool)

(assert (=> b!1064517 (=> (not res!710641) (not e!606708))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!67681 (_ BitVec 32)) Bool)

(assert (=> b!1064517 (= res!710641 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1064518 () Bool)

(declare-fun e!606709 () Bool)

(declare-fun e!606710 () Bool)

(declare-fun mapRes!39700 () Bool)

(assert (=> b!1064518 (= e!606709 (and e!606710 mapRes!39700))))

(declare-fun condMapEmpty!39700 () Bool)

(declare-fun mapDefault!39700 () ValueCell!11969)

