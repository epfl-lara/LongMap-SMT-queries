; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72724 () Bool)

(assert start!72724)

(declare-fun b!844067 () Bool)

(declare-fun e!471050 () Bool)

(declare-fun e!471049 () Bool)

(declare-fun mapRes!25262 () Bool)

(assert (=> b!844067 (= e!471050 (and e!471049 mapRes!25262))))

(declare-fun condMapEmpty!25262 () Bool)

(declare-datatypes ((V!26081 0))(
  ( (V!26082 (val!7935 Int)) )
))
(declare-datatypes ((ValueCell!7448 0))(
  ( (ValueCellFull!7448 (v!10360 V!26081)) (EmptyCell!7448) )
))
(declare-datatypes ((array!47790 0))(
  ( (array!47791 (arr!22926 (Array (_ BitVec 32) ValueCell!7448)) (size!23366 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47790)

(declare-fun mapDefault!25262 () ValueCell!7448)

