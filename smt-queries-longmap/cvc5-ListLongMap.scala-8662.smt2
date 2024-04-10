; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105334 () Bool)

(assert start!105334)

(declare-fun b_free!27007 () Bool)

(declare-fun b_next!27007 () Bool)

(assert (=> start!105334 (= b_free!27007 (not b_next!27007))))

(declare-fun tp!94532 () Bool)

(declare-fun b_and!44845 () Bool)

(assert (=> start!105334 (= tp!94532 b_and!44845)))

(declare-fun b!1255057 () Bool)

(declare-fun e!713245 () Bool)

(declare-fun e!713246 () Bool)

(declare-fun mapRes!49645 () Bool)

(assert (=> b!1255057 (= e!713245 (and e!713246 mapRes!49645))))

(declare-fun condMapEmpty!49645 () Bool)

(declare-datatypes ((V!47911 0))(
  ( (V!47912 (val!16017 Int)) )
))
(declare-datatypes ((ValueCell!15191 0))(
  ( (ValueCellFull!15191 (v!18717 V!47911)) (EmptyCell!15191) )
))
(declare-datatypes ((array!81470 0))(
  ( (array!81471 (arr!39295 (Array (_ BitVec 32) ValueCell!15191)) (size!39831 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81470)

(declare-fun mapDefault!49645 () ValueCell!15191)

