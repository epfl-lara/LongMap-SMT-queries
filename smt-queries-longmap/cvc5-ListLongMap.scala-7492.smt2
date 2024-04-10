; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94924 () Bool)

(assert start!94924)

(declare-fun b_free!22129 () Bool)

(declare-fun b_next!22129 () Bool)

(assert (=> start!94924 (= b_free!22129 (not b_next!22129))))

(declare-fun tp!77851 () Bool)

(declare-fun b_and!34983 () Bool)

(assert (=> start!94924 (= tp!77851 b_and!34983)))

(declare-fun b!1073300 () Bool)

(declare-fun e!613161 () Bool)

(declare-fun tp_is_empty!25939 () Bool)

(assert (=> b!1073300 (= e!613161 tp_is_empty!25939)))

(declare-fun b!1073301 () Bool)

(declare-fun res!715863 () Bool)

(declare-fun e!613162 () Bool)

(assert (=> b!1073301 (=> (not res!715863) (not e!613162))))

(declare-datatypes ((array!68841 0))(
  ( (array!68842 (arr!33114 (Array (_ BitVec 32) (_ BitVec 64))) (size!33650 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68841)

(declare-datatypes ((List!23115 0))(
  ( (Nil!23112) (Cons!23111 (h!24320 (_ BitVec 64)) (t!32452 List!23115)) )
))
(declare-fun arrayNoDuplicates!0 (array!68841 (_ BitVec 32) List!23115) Bool)

(assert (=> b!1073301 (= res!715863 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23112))))

(declare-fun b!1073302 () Bool)

(declare-fun e!613159 () Bool)

(declare-fun e!613160 () Bool)

(declare-fun mapRes!40621 () Bool)

(assert (=> b!1073302 (= e!613159 (and e!613160 mapRes!40621))))

(declare-fun condMapEmpty!40621 () Bool)

(declare-datatypes ((V!39721 0))(
  ( (V!39722 (val!13020 Int)) )
))
(declare-datatypes ((ValueCell!12266 0))(
  ( (ValueCellFull!12266 (v!15638 V!39721)) (EmptyCell!12266) )
))
(declare-datatypes ((array!68843 0))(
  ( (array!68844 (arr!33115 (Array (_ BitVec 32) ValueCell!12266)) (size!33651 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68843)

(declare-fun mapDefault!40621 () ValueCell!12266)

