; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20598 () Bool)

(assert start!20598)

(declare-fun b_free!5257 () Bool)

(declare-fun b_next!5257 () Bool)

(assert (=> start!20598 (= b_free!5257 (not b_next!5257))))

(declare-fun tp!18803 () Bool)

(declare-fun b_and!12003 () Bool)

(assert (=> start!20598 (= tp!18803 b_and!12003)))

(declare-fun res!99136 () Bool)

(declare-fun e!134250 () Bool)

(assert (=> start!20598 (=> (not res!99136) (not e!134250))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20598 (= res!99136 (validMask!0 mask!1149))))

(assert (=> start!20598 e!134250))

(declare-datatypes ((V!6465 0))(
  ( (V!6466 (val!2601 Int)) )
))
(declare-datatypes ((ValueCell!2213 0))(
  ( (ValueCellFull!2213 (v!4571 V!6465)) (EmptyCell!2213) )
))
(declare-datatypes ((array!9439 0))(
  ( (array!9440 (arr!4470 (Array (_ BitVec 32) ValueCell!2213)) (size!4795 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9439)

(declare-fun e!134251 () Bool)

(declare-fun array_inv!2953 (array!9439) Bool)

(assert (=> start!20598 (and (array_inv!2953 _values!649) e!134251)))

(assert (=> start!20598 true))

(declare-fun tp_is_empty!5113 () Bool)

(assert (=> start!20598 tp_is_empty!5113))

(declare-datatypes ((array!9441 0))(
  ( (array!9442 (arr!4471 (Array (_ BitVec 32) (_ BitVec 64))) (size!4796 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9441)

(declare-fun array_inv!2954 (array!9441) Bool)

(assert (=> start!20598 (array_inv!2954 _keys!825)))

(assert (=> start!20598 tp!18803))

(declare-fun b!205272 () Bool)

(declare-fun e!134252 () Bool)

(assert (=> b!205272 (= e!134252 tp_is_empty!5113)))

(declare-fun b!205273 () Bool)

(declare-fun e!134246 () Bool)

(assert (=> b!205273 (= e!134250 (not e!134246))))

(declare-fun res!99135 () Bool)

(assert (=> b!205273 (=> res!99135 e!134246)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205273 (= res!99135 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3944 0))(
  ( (tuple2!3945 (_1!1983 (_ BitVec 64)) (_2!1983 V!6465)) )
))
(declare-datatypes ((List!2843 0))(
  ( (Nil!2840) (Cons!2839 (h!3481 tuple2!3944) (t!7774 List!2843)) )
))
(declare-datatypes ((ListLongMap!2857 0))(
  ( (ListLongMap!2858 (toList!1444 List!2843)) )
))
(declare-fun lt!104404 () ListLongMap!2857)

(declare-fun zeroValue!615 () V!6465)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6465)

(declare-fun getCurrentListMap!1015 (array!9441 array!9439 (_ BitVec 32) (_ BitVec 32) V!6465 V!6465 (_ BitVec 32) Int) ListLongMap!2857)

(assert (=> b!205273 (= lt!104404 (getCurrentListMap!1015 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104413 () array!9439)

(declare-fun lt!104411 () ListLongMap!2857)

(assert (=> b!205273 (= lt!104411 (getCurrentListMap!1015 _keys!825 lt!104413 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104412 () ListLongMap!2857)

(declare-fun lt!104410 () ListLongMap!2857)

(assert (=> b!205273 (and (= lt!104412 lt!104410) (= lt!104410 lt!104412))))

(declare-fun lt!104408 () ListLongMap!2857)

(declare-fun lt!104409 () tuple2!3944)

(declare-fun +!471 (ListLongMap!2857 tuple2!3944) ListLongMap!2857)

(assert (=> b!205273 (= lt!104410 (+!471 lt!104408 lt!104409))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6465)

(assert (=> b!205273 (= lt!104409 (tuple2!3945 k!843 v!520))))

(declare-datatypes ((Unit!6234 0))(
  ( (Unit!6235) )
))
(declare-fun lt!104407 () Unit!6234)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!128 (array!9441 array!9439 (_ BitVec 32) (_ BitVec 32) V!6465 V!6465 (_ BitVec 32) (_ BitVec 64) V!6465 (_ BitVec 32) Int) Unit!6234)

(assert (=> b!205273 (= lt!104407 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!128 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!389 (array!9441 array!9439 (_ BitVec 32) (_ BitVec 32) V!6465 V!6465 (_ BitVec 32) Int) ListLongMap!2857)

(assert (=> b!205273 (= lt!104412 (getCurrentListMapNoExtraKeys!389 _keys!825 lt!104413 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205273 (= lt!104413 (array!9440 (store (arr!4470 _values!649) i!601 (ValueCellFull!2213 v!520)) (size!4795 _values!649)))))

(assert (=> b!205273 (= lt!104408 (getCurrentListMapNoExtraKeys!389 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205274 () Bool)

(declare-fun res!99133 () Bool)

(assert (=> b!205274 (=> (not res!99133) (not e!134250))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9441 (_ BitVec 32)) Bool)

(assert (=> b!205274 (= res!99133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205275 () Bool)

(declare-fun res!99138 () Bool)

(assert (=> b!205275 (=> (not res!99138) (not e!134250))))

(assert (=> b!205275 (= res!99138 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4796 _keys!825))))))

(declare-fun mapIsEmpty!8738 () Bool)

(declare-fun mapRes!8738 () Bool)

(assert (=> mapIsEmpty!8738 mapRes!8738))

(declare-fun b!205276 () Bool)

(declare-fun e!134248 () Bool)

(assert (=> b!205276 (= e!134246 e!134248)))

(declare-fun res!99134 () Bool)

(assert (=> b!205276 (=> res!99134 e!134248)))

(assert (=> b!205276 (= res!99134 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!104415 () ListLongMap!2857)

(assert (=> b!205276 (= lt!104404 lt!104415)))

(declare-fun lt!104406 () tuple2!3944)

(assert (=> b!205276 (= lt!104415 (+!471 lt!104408 lt!104406))))

(declare-fun lt!104405 () ListLongMap!2857)

(assert (=> b!205276 (= lt!104411 lt!104405)))

(assert (=> b!205276 (= lt!104405 (+!471 lt!104410 lt!104406))))

(assert (=> b!205276 (= lt!104411 (+!471 lt!104412 lt!104406))))

(assert (=> b!205276 (= lt!104406 (tuple2!3945 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205277 () Bool)

(assert (=> b!205277 (= e!134251 (and e!134252 mapRes!8738))))

(declare-fun condMapEmpty!8738 () Bool)

(declare-fun mapDefault!8738 () ValueCell!2213)

