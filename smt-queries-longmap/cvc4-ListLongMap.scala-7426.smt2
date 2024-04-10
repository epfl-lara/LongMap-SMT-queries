; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94396 () Bool)

(assert start!94396)

(declare-fun b_free!21737 () Bool)

(declare-fun b_next!21737 () Bool)

(assert (=> start!94396 (= b_free!21737 (not b_next!21737))))

(declare-fun tp!76655 () Bool)

(declare-fun b_and!34521 () Bool)

(assert (=> start!94396 (= tp!76655 b_and!34521)))

(declare-fun b!1067394 () Bool)

(declare-fun res!712314 () Bool)

(declare-fun e!608798 () Bool)

(assert (=> b!1067394 (=> (not res!712314) (not e!608798))))

(declare-datatypes ((array!68075 0))(
  ( (array!68076 (arr!32738 (Array (_ BitVec 32) (_ BitVec 64))) (size!33274 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68075)

(declare-datatypes ((List!22831 0))(
  ( (Nil!22828) (Cons!22827 (h!24036 (_ BitVec 64)) (t!32154 List!22831)) )
))
(declare-fun arrayNoDuplicates!0 (array!68075 (_ BitVec 32) List!22831) Bool)

(assert (=> b!1067394 (= res!712314 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22828))))

(declare-fun res!712315 () Bool)

(assert (=> start!94396 (=> (not res!712315) (not e!608798))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!94396 (= res!712315 (validMask!0 mask!1515))))

(assert (=> start!94396 e!608798))

(assert (=> start!94396 true))

(declare-fun tp_is_empty!25547 () Bool)

(assert (=> start!94396 tp_is_empty!25547))

(declare-datatypes ((V!39197 0))(
  ( (V!39198 (val!12824 Int)) )
))
(declare-datatypes ((ValueCell!12070 0))(
  ( (ValueCellFull!12070 (v!15438 V!39197)) (EmptyCell!12070) )
))
(declare-datatypes ((array!68077 0))(
  ( (array!68078 (arr!32739 (Array (_ BitVec 32) ValueCell!12070)) (size!33275 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68077)

(declare-fun e!608795 () Bool)

(declare-fun array_inv!25344 (array!68077) Bool)

(assert (=> start!94396 (and (array_inv!25344 _values!955) e!608795)))

(assert (=> start!94396 tp!76655))

(declare-fun array_inv!25345 (array!68075) Bool)

(assert (=> start!94396 (array_inv!25345 _keys!1163)))

(declare-fun b!1067395 () Bool)

(declare-fun e!608796 () Bool)

(declare-fun mapRes!40012 () Bool)

(assert (=> b!1067395 (= e!608795 (and e!608796 mapRes!40012))))

(declare-fun condMapEmpty!40012 () Bool)

(declare-fun mapDefault!40012 () ValueCell!12070)

