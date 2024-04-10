; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20616 () Bool)

(assert start!20616)

(declare-fun b_free!5275 () Bool)

(declare-fun b_next!5275 () Bool)

(assert (=> start!20616 (= b_free!5275 (not b_next!5275))))

(declare-fun tp!18856 () Bool)

(declare-fun b_and!12021 () Bool)

(assert (=> start!20616 (= tp!18856 b_and!12021)))

(declare-fun res!99380 () Bool)

(declare-fun e!134441 () Bool)

(assert (=> start!20616 (=> (not res!99380) (not e!134441))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20616 (= res!99380 (validMask!0 mask!1149))))

(assert (=> start!20616 e!134441))

(declare-datatypes ((V!6489 0))(
  ( (V!6490 (val!2610 Int)) )
))
(declare-datatypes ((ValueCell!2222 0))(
  ( (ValueCellFull!2222 (v!4580 V!6489)) (EmptyCell!2222) )
))
(declare-datatypes ((array!9475 0))(
  ( (array!9476 (arr!4488 (Array (_ BitVec 32) ValueCell!2222)) (size!4813 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9475)

(declare-fun e!134436 () Bool)

(declare-fun array_inv!2969 (array!9475) Bool)

(assert (=> start!20616 (and (array_inv!2969 _values!649) e!134436)))

(assert (=> start!20616 true))

(declare-fun tp_is_empty!5131 () Bool)

(assert (=> start!20616 tp_is_empty!5131))

(declare-datatypes ((array!9477 0))(
  ( (array!9478 (arr!4489 (Array (_ BitVec 32) (_ BitVec 64))) (size!4814 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9477)

(declare-fun array_inv!2970 (array!9477) Bool)

(assert (=> start!20616 (array_inv!2970 _keys!825)))

(assert (=> start!20616 tp!18856))

(declare-fun b!205596 () Bool)

(declare-fun res!99376 () Bool)

(assert (=> b!205596 (=> (not res!99376) (not e!134441))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205596 (= res!99376 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4814 _keys!825))))))

(declare-fun b!205597 () Bool)

(declare-fun res!99375 () Bool)

(assert (=> b!205597 (=> (not res!99375) (not e!134441))))

(declare-datatypes ((List!2857 0))(
  ( (Nil!2854) (Cons!2853 (h!3495 (_ BitVec 64)) (t!7788 List!2857)) )
))
(declare-fun arrayNoDuplicates!0 (array!9477 (_ BitVec 32) List!2857) Bool)

(assert (=> b!205597 (= res!99375 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2854))))

(declare-fun b!205598 () Bool)

(declare-fun e!134440 () Bool)

(declare-fun mapRes!8765 () Bool)

(assert (=> b!205598 (= e!134436 (and e!134440 mapRes!8765))))

(declare-fun condMapEmpty!8765 () Bool)

(declare-fun mapDefault!8765 () ValueCell!2222)

