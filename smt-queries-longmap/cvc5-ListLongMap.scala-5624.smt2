; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73528 () Bool)

(assert start!73528)

(declare-fun b_free!14443 () Bool)

(declare-fun b_next!14443 () Bool)

(assert (=> start!73528 (= b_free!14443 (not b_next!14443))))

(declare-fun tp!50832 () Bool)

(declare-fun b_and!23865 () Bool)

(assert (=> start!73528 (= tp!50832 b_and!23865)))

(declare-fun b!859336 () Bool)

(declare-fun e!478902 () Bool)

(declare-fun tp_is_empty!16579 () Bool)

(assert (=> b!859336 (= e!478902 tp_is_empty!16579)))

(declare-fun b!859337 () Bool)

(declare-fun e!478900 () Bool)

(declare-fun e!478903 () Bool)

(declare-fun mapRes!26468 () Bool)

(assert (=> b!859337 (= e!478900 (and e!478903 mapRes!26468))))

(declare-fun condMapEmpty!26468 () Bool)

(declare-datatypes ((V!27153 0))(
  ( (V!27154 (val!8337 Int)) )
))
(declare-datatypes ((ValueCell!7850 0))(
  ( (ValueCellFull!7850 (v!10762 V!27153)) (EmptyCell!7850) )
))
(declare-datatypes ((array!49336 0))(
  ( (array!49337 (arr!23699 (Array (_ BitVec 32) ValueCell!7850)) (size!24139 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49336)

(declare-fun mapDefault!26468 () ValueCell!7850)

