; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!104824 () Bool)

(assert start!104824)

(declare-fun b_free!26629 () Bool)

(declare-fun b_next!26629 () Bool)

(assert (=> start!104824 (= b_free!26629 (not b_next!26629))))

(declare-fun tp!93377 () Bool)

(declare-fun b_and!44397 () Bool)

(assert (=> start!104824 (= tp!93377 b_and!44397)))

(declare-fun b!1249494 () Bool)

(declare-fun e!709175 () Bool)

(declare-fun e!709176 () Bool)

(declare-fun mapRes!49057 () Bool)

(assert (=> b!1249494 (= e!709175 (and e!709176 mapRes!49057))))

(declare-fun condMapEmpty!49057 () Bool)

(declare-datatypes ((V!47407 0))(
  ( (V!47408 (val!15828 Int)) )
))
(declare-datatypes ((ValueCell!15002 0))(
  ( (ValueCellFull!15002 (v!18524 V!47407)) (EmptyCell!15002) )
))
(declare-datatypes ((array!80744 0))(
  ( (array!80745 (arr!38939 (Array (_ BitVec 32) ValueCell!15002)) (size!39475 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!80744)

(declare-fun mapDefault!49057 () ValueCell!15002)

