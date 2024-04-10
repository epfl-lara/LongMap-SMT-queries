; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40294 () Bool)

(assert start!40294)

(declare-fun b_free!10535 () Bool)

(declare-fun b_next!10535 () Bool)

(assert (=> start!40294 (= b_free!10535 (not b_next!10535))))

(declare-fun tp!37145 () Bool)

(declare-fun b_and!18519 () Bool)

(assert (=> start!40294 (= tp!37145 b_and!18519)))

(declare-fun b!442462 () Bool)

(declare-fun res!262069 () Bool)

(declare-fun e!260406 () Bool)

(assert (=> b!442462 (=> (not res!262069) (not e!260406))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!442462 (= res!262069 (bvsle from!863 i!563))))

(declare-fun b!442463 () Bool)

(declare-fun res!262070 () Bool)

(declare-fun e!260408 () Bool)

(assert (=> b!442463 (=> (not res!262070) (not e!260408))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!442463 (= res!262070 (validKeyInArray!0 k!794))))

(declare-fun b!442464 () Bool)

(declare-fun res!262073 () Bool)

(assert (=> b!442464 (=> (not res!262073) (not e!260408))))

(declare-datatypes ((array!27199 0))(
  ( (array!27200 (arr!13048 (Array (_ BitVec 32) (_ BitVec 64))) (size!13400 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27199)

(assert (=> b!442464 (= res!262073 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13400 _keys!709))))))

(declare-fun b!442465 () Bool)

(declare-fun e!260405 () Bool)

(declare-fun tp_is_empty!11693 () Bool)

(assert (=> b!442465 (= e!260405 tp_is_empty!11693)))

(declare-fun b!442466 () Bool)

(declare-fun res!262072 () Bool)

(assert (=> b!442466 (=> (not res!262072) (not e!260408))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16695 0))(
  ( (V!16696 (val!5891 Int)) )
))
(declare-datatypes ((ValueCell!5503 0))(
  ( (ValueCellFull!5503 (v!8142 V!16695)) (EmptyCell!5503) )
))
(declare-datatypes ((array!27201 0))(
  ( (array!27202 (arr!13049 (Array (_ BitVec 32) ValueCell!5503)) (size!13401 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27201)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!442466 (= res!262072 (and (= (size!13401 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13400 _keys!709) (size!13401 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19164 () Bool)

(declare-fun mapRes!19164 () Bool)

(assert (=> mapIsEmpty!19164 mapRes!19164))

(declare-fun b!442467 () Bool)

(declare-fun e!260409 () Bool)

(assert (=> b!442467 (= e!260409 tp_is_empty!11693)))

(declare-fun b!442468 () Bool)

(declare-fun e!260407 () Bool)

(assert (=> b!442468 (= e!260407 (and e!260409 mapRes!19164))))

(declare-fun condMapEmpty!19164 () Bool)

(declare-fun mapDefault!19164 () ValueCell!5503)

