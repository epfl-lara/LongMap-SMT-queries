; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!101214 () Bool)

(assert start!101214)

(declare-fun b_free!26137 () Bool)

(declare-fun b_next!26137 () Bool)

(assert (=> start!101214 (= b_free!26137 (not b_next!26137))))

(declare-fun tp!91433 () Bool)

(declare-fun b_and!43391 () Bool)

(assert (=> start!101214 (= tp!91433 b_and!43391)))

(declare-fun b!1215288 () Bool)

(declare-fun e!690073 () Bool)

(declare-fun e!690074 () Bool)

(declare-fun mapRes!48136 () Bool)

(assert (=> b!1215288 (= e!690073 (and e!690074 mapRes!48136))))

(declare-fun condMapEmpty!48136 () Bool)

(declare-datatypes ((V!46249 0))(
  ( (V!46250 (val!15477 Int)) )
))
(declare-datatypes ((ValueCell!14711 0))(
  ( (ValueCellFull!14711 (v!18130 V!46249)) (EmptyCell!14711) )
))
(declare-datatypes ((array!78459 0))(
  ( (array!78460 (arr!37864 (Array (_ BitVec 32) ValueCell!14711)) (size!38400 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!78459)

(declare-fun mapDefault!48136 () ValueCell!14711)

