; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!36582 () Bool)

(assert start!36582)

(declare-fun b!365316 () Bool)

(declare-fun e!223682 () Bool)

(declare-fun e!223681 () Bool)

(declare-fun mapRes!14214 () Bool)

(assert (=> b!365316 (= e!223682 (and e!223681 mapRes!14214))))

(declare-fun condMapEmpty!14214 () Bool)

(declare-datatypes ((V!12367 0))(
  ( (V!12368 (val!4268 Int)) )
))
(declare-datatypes ((ValueCell!3880 0))(
  ( (ValueCellFull!3880 (v!6463 V!12367)) (EmptyCell!3880) )
))
(declare-datatypes ((array!20851 0))(
  ( (array!20852 (arr!9901 (Array (_ BitVec 32) ValueCell!3880)) (size!10253 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!20851)

(declare-fun mapDefault!14214 () ValueCell!3880)

