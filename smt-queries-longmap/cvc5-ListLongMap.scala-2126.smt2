; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35984 () Bool)

(assert start!35984)

(declare-fun b!361449 () Bool)

(declare-fun e!221344 () Bool)

(declare-fun e!221345 () Bool)

(declare-fun mapRes!14091 () Bool)

(assert (=> b!361449 (= e!221344 (and e!221345 mapRes!14091))))

(declare-fun condMapEmpty!14091 () Bool)

(declare-datatypes ((V!12147 0))(
  ( (V!12148 (val!4233 Int)) )
))
(declare-datatypes ((ValueCell!3845 0))(
  ( (ValueCellFull!3845 (v!6428 V!12147)) (EmptyCell!3845) )
))
(declare-datatypes ((array!20309 0))(
  ( (array!20310 (arr!9642 (Array (_ BitVec 32) ValueCell!3845)) (size!9994 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20309)

(declare-fun mapDefault!14091 () ValueCell!3845)

