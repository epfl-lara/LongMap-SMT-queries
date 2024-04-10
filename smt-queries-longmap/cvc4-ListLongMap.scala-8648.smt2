; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!105210 () Bool)

(assert start!105210)

(declare-fun b_free!26927 () Bool)

(declare-fun b_next!26927 () Bool)

(assert (=> start!105210 (= b_free!26927 (not b_next!26927))))

(declare-fun tp!94286 () Bool)

(declare-fun b_and!44741 () Bool)

(assert (=> start!105210 (= tp!94286 b_and!44741)))

(declare-fun b!1253749 () Bool)

(declare-fun e!712308 () Bool)

(declare-fun e!712310 () Bool)

(declare-fun mapRes!49519 () Bool)

(assert (=> b!1253749 (= e!712308 (and e!712310 mapRes!49519))))

(declare-fun condMapEmpty!49519 () Bool)

(declare-datatypes ((V!47803 0))(
  ( (V!47804 (val!15977 Int)) )
))
(declare-datatypes ((ValueCell!15151 0))(
  ( (ValueCellFull!15151 (v!18675 V!47803)) (EmptyCell!15151) )
))
(declare-datatypes ((array!81316 0))(
  ( (array!81317 (arr!39220 (Array (_ BitVec 32) ValueCell!15151)) (size!39756 (_ BitVec 32))) )
))
(declare-fun _values!914 () array!81316)

(declare-fun mapDefault!49519 () ValueCell!15151)

