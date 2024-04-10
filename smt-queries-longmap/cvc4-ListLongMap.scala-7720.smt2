; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96988 () Bool)

(assert start!96988)

(declare-fun b!1103323 () Bool)

(declare-fun e!629812 () Bool)

(declare-fun tp_is_empty!27299 () Bool)

(assert (=> b!1103323 (= e!629812 tp_is_empty!27299)))

(declare-fun b!1103324 () Bool)

(declare-fun e!629811 () Bool)

(declare-datatypes ((List!24037 0))(
  ( (Nil!24034) (Cons!24033 (h!25242 (_ BitVec 64)) (t!34302 List!24037)) )
))
(declare-fun noDuplicate!1583 (List!24037) Bool)

(assert (=> b!1103324 (= e!629811 (not (noDuplicate!1583 Nil!24034)))))

(declare-fun b!1103325 () Bool)

(declare-fun res!736080 () Bool)

(assert (=> b!1103325 (=> (not res!736080) (not e!629811))))

(declare-datatypes ((array!71519 0))(
  ( (array!71520 (arr!34418 (Array (_ BitVec 32) (_ BitVec 64))) (size!34954 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71519)

(assert (=> b!1103325 (= res!736080 (and (bvsle #b00000000000000000000000000000000 (size!34954 _keys!1208)) (bvslt (size!34954 _keys!1208) #b01111111111111111111111111111111)))))

(declare-fun b!1103326 () Bool)

(declare-fun e!629810 () Bool)

(declare-fun e!629809 () Bool)

(declare-fun mapRes!42748 () Bool)

(assert (=> b!1103326 (= e!629810 (and e!629809 mapRes!42748))))

(declare-fun condMapEmpty!42748 () Bool)

(declare-datatypes ((V!41525 0))(
  ( (V!41526 (val!13706 Int)) )
))
(declare-datatypes ((ValueCell!12940 0))(
  ( (ValueCellFull!12940 (v!16337 V!41525)) (EmptyCell!12940) )
))
(declare-datatypes ((array!71521 0))(
  ( (array!71522 (arr!34419 (Array (_ BitVec 32) ValueCell!12940)) (size!34955 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71521)

(declare-fun mapDefault!42748 () ValueCell!12940)

