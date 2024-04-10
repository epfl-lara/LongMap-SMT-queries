; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74174 () Bool)

(assert start!74174)

(declare-fun b!872530 () Bool)

(declare-fun res!593009 () Bool)

(declare-fun e!485902 () Bool)

(assert (=> b!872530 (=> (not res!593009) (not e!485902))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!872530 (= res!593009 (validMask!0 mask!1196))))

(declare-fun b!872531 () Bool)

(assert (=> b!872531 (= e!485902 false)))

(declare-fun lt!395635 () Bool)

(declare-datatypes ((array!50560 0))(
  ( (array!50561 (arr!24310 (Array (_ BitVec 32) (_ BitVec 64))) (size!24750 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50560)

(declare-datatypes ((List!17266 0))(
  ( (Nil!17263) (Cons!17262 (h!18393 (_ BitVec 64)) (t!24303 List!17266)) )
))
(declare-fun arrayNoDuplicates!0 (array!50560 (_ BitVec 32) List!17266) Bool)

(assert (=> b!872531 (= lt!395635 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17263))))

(declare-fun b!872532 () Bool)

(declare-fun e!485901 () Bool)

(declare-fun tp_is_empty!17213 () Bool)

(assert (=> b!872532 (= e!485901 tp_is_empty!17213)))

(declare-fun b!872533 () Bool)

(declare-fun e!485903 () Bool)

(declare-fun e!485905 () Bool)

(declare-fun mapRes!27422 () Bool)

(assert (=> b!872533 (= e!485903 (and e!485905 mapRes!27422))))

(declare-fun condMapEmpty!27422 () Bool)

(declare-datatypes ((V!27997 0))(
  ( (V!27998 (val!8654 Int)) )
))
(declare-datatypes ((ValueCell!8167 0))(
  ( (ValueCellFull!8167 (v!11079 V!27997)) (EmptyCell!8167) )
))
(declare-datatypes ((array!50562 0))(
  ( (array!50563 (arr!24311 (Array (_ BitVec 32) ValueCell!8167)) (size!24751 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50562)

(declare-fun mapDefault!27422 () ValueCell!8167)

