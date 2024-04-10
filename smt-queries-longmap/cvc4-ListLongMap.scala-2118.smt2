; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35896 () Bool)

(assert start!35896)

(declare-fun b!360886 () Bool)

(declare-fun e!220909 () Bool)

(declare-fun e!220912 () Bool)

(declare-fun mapRes!14010 () Bool)

(assert (=> b!360886 (= e!220909 (and e!220912 mapRes!14010))))

(declare-fun condMapEmpty!14010 () Bool)

(declare-datatypes ((V!12087 0))(
  ( (V!12088 (val!4211 Int)) )
))
(declare-datatypes ((ValueCell!3823 0))(
  ( (ValueCellFull!3823 (v!6405 V!12087)) (EmptyCell!3823) )
))
(declare-datatypes ((array!20219 0))(
  ( (array!20220 (arr!9602 (Array (_ BitVec 32) ValueCell!3823)) (size!9954 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!20219)

(declare-fun mapDefault!14010 () ValueCell!3823)

