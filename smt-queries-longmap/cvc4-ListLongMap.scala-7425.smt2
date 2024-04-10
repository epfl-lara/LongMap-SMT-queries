; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94390 () Bool)

(assert start!94390)

(declare-fun b_free!21731 () Bool)

(declare-fun b_next!21731 () Bool)

(assert (=> start!94390 (= b_free!21731 (not b_next!21731))))

(declare-fun tp!76636 () Bool)

(declare-fun b_and!34515 () Bool)

(assert (=> start!94390 (= tp!76636 b_and!34515)))

(declare-fun b!1067331 () Bool)

(declare-fun e!608750 () Bool)

(declare-fun e!608751 () Bool)

(declare-fun mapRes!40003 () Bool)

(assert (=> b!1067331 (= e!608750 (and e!608751 mapRes!40003))))

(declare-fun condMapEmpty!40003 () Bool)

(declare-datatypes ((V!39189 0))(
  ( (V!39190 (val!12821 Int)) )
))
(declare-datatypes ((ValueCell!12067 0))(
  ( (ValueCellFull!12067 (v!15435 V!39189)) (EmptyCell!12067) )
))
(declare-datatypes ((array!68065 0))(
  ( (array!68066 (arr!32733 (Array (_ BitVec 32) ValueCell!12067)) (size!33269 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68065)

(declare-fun mapDefault!40003 () ValueCell!12067)

