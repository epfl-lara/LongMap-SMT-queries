; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3796 () Bool)

(assert start!3796)

(declare-fun b!26558 () Bool)

(declare-fun e!17320 () Bool)

(declare-fun e!17321 () Bool)

(declare-fun mapRes!1192 () Bool)

(assert (=> b!26558 (= e!17320 (and e!17321 mapRes!1192))))

(declare-fun condMapEmpty!1192 () Bool)

(declare-datatypes ((V!1315 0))(
  ( (V!1316 (val!585 Int)) )
))
(declare-datatypes ((ValueCell!359 0))(
  ( (ValueCellFull!359 (v!1671 V!1315)) (EmptyCell!359) )
))
(declare-datatypes ((array!1477 0))(
  ( (array!1478 (arr!696 (Array (_ BitVec 32) ValueCell!359)) (size!797 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1477)

(declare-fun mapDefault!1192 () ValueCell!359)

