; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35988 () Bool)

(assert start!35988)

(declare-fun b!361485 () Bool)

(declare-fun e!221376 () Bool)

(declare-fun tp_is_empty!8381 () Bool)

(assert (=> b!361485 (= e!221376 tp_is_empty!8381)))

(declare-fun b!361486 () Bool)

(declare-fun e!221375 () Bool)

(assert (=> b!361486 (= e!221375 tp_is_empty!8381)))

(declare-fun b!361487 () Bool)

(declare-fun e!221372 () Bool)

(declare-fun mapRes!14097 () Bool)

(assert (=> b!361487 (= e!221372 (and e!221376 mapRes!14097))))

(declare-fun condMapEmpty!14097 () Bool)

(declare-datatypes ((V!12151 0))(
  ( (V!12152 (val!4235 Int)) )
))
(declare-datatypes ((ValueCell!3847 0))(
  ( (ValueCellFull!3847 (v!6430 V!12151)) (EmptyCell!3847) )
))
(declare-datatypes ((array!20315 0))(
  ( (array!20316 (arr!9645 (Array (_ BitVec 32) ValueCell!3847)) (size!9997 (_ BitVec 32))) )
))
(declare-fun _values!1277 () array!20315)

(declare-fun mapDefault!14097 () ValueCell!3847)

