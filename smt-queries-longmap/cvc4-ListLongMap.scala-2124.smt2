; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35954 () Bool)

(assert start!35954)

(declare-fun b!361289 () Bool)

(declare-fun e!221224 () Bool)

(declare-fun e!221223 () Bool)

(declare-fun mapRes!14073 () Bool)

(assert (=> b!361289 (= e!221224 (and e!221223 mapRes!14073))))

(declare-fun condMapEmpty!14073 () Bool)

(declare-datatypes ((V!12135 0))(
  ( (V!12136 (val!4229 Int)) )
))
(declare-datatypes ((ValueCell!3841 0))(
  ( (ValueCellFull!3841 (v!6423 V!12135)) (EmptyCell!3841) )
))
(declare-datatypes ((array!20291 0))(
  ( (array!20292 (arr!9635 (Array (_ BitVec 32) ValueCell!3841)) (size!9987 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20291)

(declare-fun mapDefault!14073 () ValueCell!3841)

