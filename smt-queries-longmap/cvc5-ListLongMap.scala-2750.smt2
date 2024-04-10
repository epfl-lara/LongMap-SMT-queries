; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40338 () Bool)

(assert start!40338)

(declare-fun b!443153 () Bool)

(declare-fun e!260767 () Bool)

(declare-fun tp_is_empty!11737 () Bool)

(assert (=> b!443153 (= e!260767 tp_is_empty!11737)))

(declare-fun b!443154 () Bool)

(declare-fun res!262561 () Bool)

(declare-fun e!260766 () Bool)

(assert (=> b!443154 (=> (not res!262561) (not e!260766))))

(declare-datatypes ((array!27285 0))(
  ( (array!27286 (arr!13091 (Array (_ BitVec 32) (_ BitVec 64))) (size!13443 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27285)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((V!16755 0))(
  ( (V!16756 (val!5913 Int)) )
))
(declare-datatypes ((ValueCell!5525 0))(
  ( (ValueCellFull!5525 (v!8164 V!16755)) (EmptyCell!5525) )
))
(declare-datatypes ((array!27287 0))(
  ( (array!27288 (arr!13092 (Array (_ BitVec 32) ValueCell!5525)) (size!13444 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27287)

(assert (=> b!443154 (= res!262561 (and (= (size!13444 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13443 _keys!709) (size!13444 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!19230 () Bool)

(declare-fun mapRes!19230 () Bool)

(declare-fun tp!37212 () Bool)

(assert (=> mapNonEmpty!19230 (= mapRes!19230 (and tp!37212 e!260767))))

(declare-fun mapRest!19230 () (Array (_ BitVec 32) ValueCell!5525))

(declare-fun mapKey!19230 () (_ BitVec 32))

(declare-fun mapValue!19230 () ValueCell!5525)

(assert (=> mapNonEmpty!19230 (= (arr!13092 _values!549) (store mapRest!19230 mapKey!19230 mapValue!19230))))

(declare-fun b!443155 () Bool)

(declare-fun res!262566 () Bool)

(assert (=> b!443155 (=> (not res!262566) (not e!260766))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!443155 (= res!262566 (or (= (select (arr!13091 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13091 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!262562 () Bool)

(assert (=> start!40338 (=> (not res!262562) (not e!260766))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40338 (= res!262562 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13443 _keys!709))))))

(assert (=> start!40338 e!260766))

(assert (=> start!40338 true))

(declare-fun e!260769 () Bool)

(declare-fun array_inv!9494 (array!27287) Bool)

(assert (=> start!40338 (and (array_inv!9494 _values!549) e!260769)))

(declare-fun array_inv!9495 (array!27285) Bool)

(assert (=> start!40338 (array_inv!9495 _keys!709)))

(declare-fun b!443156 () Bool)

(declare-fun e!260768 () Bool)

(assert (=> b!443156 (= e!260769 (and e!260768 mapRes!19230))))

(declare-fun condMapEmpty!19230 () Bool)

(declare-fun mapDefault!19230 () ValueCell!5525)

