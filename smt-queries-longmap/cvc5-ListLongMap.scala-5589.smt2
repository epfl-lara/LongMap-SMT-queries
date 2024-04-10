; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73318 () Bool)

(assert start!73318)

(declare-fun b_free!14233 () Bool)

(declare-fun b_next!14233 () Bool)

(assert (=> start!73318 (= b_free!14233 (not b_next!14233))))

(declare-fun tp!50203 () Bool)

(declare-fun b_and!23589 () Bool)

(assert (=> start!73318 (= tp!50203 b_and!23589)))

(declare-fun b!855370 () Bool)

(declare-fun res!580906 () Bool)

(declare-fun e!476890 () Bool)

(assert (=> b!855370 (=> (not res!580906) (not e!476890))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!855370 (= res!580906 (validMask!0 mask!1196))))

(declare-fun b!855371 () Bool)

(declare-fun res!580913 () Bool)

(assert (=> b!855371 (=> (not res!580913) (not e!476890))))

(declare-datatypes ((array!48934 0))(
  ( (array!48935 (arr!23498 (Array (_ BitVec 32) (_ BitVec 64))) (size!23938 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48934)

(declare-datatypes ((List!16660 0))(
  ( (Nil!16657) (Cons!16656 (h!17787 (_ BitVec 64)) (t!23301 List!16660)) )
))
(declare-fun arrayNoDuplicates!0 (array!48934 (_ BitVec 32) List!16660) Bool)

(assert (=> b!855371 (= res!580913 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16657))))

(declare-fun b!855372 () Bool)

(declare-fun e!476893 () Bool)

(declare-fun tp_is_empty!16369 () Bool)

(assert (=> b!855372 (= e!476893 tp_is_empty!16369)))

(declare-fun b!855373 () Bool)

(declare-fun res!580907 () Bool)

(assert (=> b!855373 (=> (not res!580907) (not e!476890))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26873 0))(
  ( (V!26874 (val!8232 Int)) )
))
(declare-datatypes ((ValueCell!7745 0))(
  ( (ValueCellFull!7745 (v!10657 V!26873)) (EmptyCell!7745) )
))
(declare-datatypes ((array!48936 0))(
  ( (array!48937 (arr!23499 (Array (_ BitVec 32) ValueCell!7745)) (size!23939 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48936)

(assert (=> b!855373 (= res!580907 (and (= (size!23939 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23938 _keys!868) (size!23939 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!855374 () Bool)

(declare-fun res!580909 () Bool)

(assert (=> b!855374 (=> (not res!580909) (not e!476890))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!855374 (= res!580909 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23938 _keys!868))))))

(declare-fun b!855375 () Bool)

(declare-fun e!476891 () Bool)

(declare-fun e!476889 () Bool)

(declare-fun mapRes!26153 () Bool)

(assert (=> b!855375 (= e!476891 (and e!476889 mapRes!26153))))

(declare-fun condMapEmpty!26153 () Bool)

(declare-fun mapDefault!26153 () ValueCell!7745)

