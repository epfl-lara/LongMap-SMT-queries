; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94662 () Bool)

(assert start!94662)

(declare-fun b_free!21931 () Bool)

(declare-fun b_next!21931 () Bool)

(assert (=> start!94662 (= b_free!21931 (not b_next!21931))))

(declare-fun tp!77248 () Bool)

(declare-fun b_and!34751 () Bool)

(assert (=> start!94662 (= tp!77248 b_and!34751)))

(declare-fun b!1070277 () Bool)

(declare-fun res!714025 () Bool)

(declare-fun e!610922 () Bool)

(assert (=> b!1070277 (=> (not res!714025) (not e!610922))))

(declare-datatypes ((array!68457 0))(
  ( (array!68458 (arr!32925 (Array (_ BitVec 32) (_ BitVec 64))) (size!33461 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68457)

(declare-datatypes ((List!22970 0))(
  ( (Nil!22967) (Cons!22966 (h!24175 (_ BitVec 64)) (t!32301 List!22970)) )
))
(declare-fun arrayNoDuplicates!0 (array!68457 (_ BitVec 32) List!22970) Bool)

(assert (=> b!1070277 (= res!714025 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22967))))

(declare-fun mapIsEmpty!40315 () Bool)

(declare-fun mapRes!40315 () Bool)

(assert (=> mapIsEmpty!40315 mapRes!40315))

(declare-fun b!1070279 () Bool)

(declare-fun e!610924 () Bool)

(declare-fun e!610925 () Bool)

(assert (=> b!1070279 (= e!610924 (and e!610925 mapRes!40315))))

(declare-fun condMapEmpty!40315 () Bool)

(declare-datatypes ((V!39457 0))(
  ( (V!39458 (val!12921 Int)) )
))
(declare-datatypes ((ValueCell!12167 0))(
  ( (ValueCellFull!12167 (v!15537 V!39457)) (EmptyCell!12167) )
))
(declare-datatypes ((array!68459 0))(
  ( (array!68460 (arr!32926 (Array (_ BitVec 32) ValueCell!12167)) (size!33462 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68459)

(declare-fun mapDefault!40315 () ValueCell!12167)

