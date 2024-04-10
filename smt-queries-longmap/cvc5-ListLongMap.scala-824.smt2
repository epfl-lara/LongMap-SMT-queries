; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20040 () Bool)

(assert start!20040)

(declare-fun b!196251 () Bool)

(declare-fun e!129221 () Bool)

(declare-fun e!129222 () Bool)

(declare-fun mapRes!7901 () Bool)

(assert (=> b!196251 (= e!129221 (and e!129222 mapRes!7901))))

(declare-fun condMapEmpty!7901 () Bool)

(declare-datatypes ((V!5721 0))(
  ( (V!5722 (val!2322 Int)) )
))
(declare-datatypes ((ValueCell!1934 0))(
  ( (ValueCellFull!1934 (v!4292 V!5721)) (EmptyCell!1934) )
))
(declare-datatypes ((array!8371 0))(
  ( (array!8372 (arr!3936 (Array (_ BitVec 32) ValueCell!1934)) (size!4261 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8371)

(declare-fun mapDefault!7901 () ValueCell!1934)

