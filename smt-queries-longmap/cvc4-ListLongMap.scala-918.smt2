; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20608 () Bool)

(assert start!20608)

(declare-fun b_free!5267 () Bool)

(declare-fun b_next!5267 () Bool)

(assert (=> start!20608 (= b_free!5267 (not b_next!5267))))

(declare-fun tp!18833 () Bool)

(declare-fun b_and!12013 () Bool)

(assert (=> start!20608 (= tp!18833 b_and!12013)))

(declare-fun mapIsEmpty!8753 () Bool)

(declare-fun mapRes!8753 () Bool)

(assert (=> mapIsEmpty!8753 mapRes!8753))

(declare-fun b!205452 () Bool)

(declare-fun res!99270 () Bool)

(declare-fun e!134352 () Bool)

(assert (=> b!205452 (=> (not res!99270) (not e!134352))))

(declare-datatypes ((array!9459 0))(
  ( (array!9460 (arr!4480 (Array (_ BitVec 32) (_ BitVec 64))) (size!4805 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9459)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6477 0))(
  ( (V!6478 (val!2606 Int)) )
))
(declare-datatypes ((ValueCell!2218 0))(
  ( (ValueCellFull!2218 (v!4576 V!6477)) (EmptyCell!2218) )
))
(declare-datatypes ((array!9461 0))(
  ( (array!9462 (arr!4481 (Array (_ BitVec 32) ValueCell!2218)) (size!4806 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9461)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!205452 (= res!99270 (and (= (size!4806 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4805 _keys!825) (size!4806 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205453 () Bool)

(declare-fun e!134355 () Bool)

(declare-fun tp_is_empty!5123 () Bool)

(assert (=> b!205453 (= e!134355 tp_is_empty!5123)))

(declare-fun b!205454 () Bool)

(declare-fun e!134357 () Bool)

(assert (=> b!205454 (= e!134352 (not e!134357))))

(declare-fun res!99272 () Bool)

(assert (=> b!205454 (=> res!99272 e!134357)))

(assert (=> b!205454 (= res!99272 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!3954 0))(
  ( (tuple2!3955 (_1!1988 (_ BitVec 64)) (_2!1988 V!6477)) )
))
(declare-datatypes ((List!2851 0))(
  ( (Nil!2848) (Cons!2847 (h!3489 tuple2!3954) (t!7782 List!2851)) )
))
(declare-datatypes ((ListLongMap!2867 0))(
  ( (ListLongMap!2868 (toList!1449 List!2851)) )
))
(declare-fun lt!104585 () ListLongMap!2867)

(declare-fun zeroValue!615 () V!6477)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6477)

(declare-fun getCurrentListMap!1020 (array!9459 array!9461 (_ BitVec 32) (_ BitVec 32) V!6477 V!6477 (_ BitVec 32) Int) ListLongMap!2867)

(assert (=> b!205454 (= lt!104585 (getCurrentListMap!1020 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104590 () array!9461)

(declare-fun lt!104594 () ListLongMap!2867)

(assert (=> b!205454 (= lt!104594 (getCurrentListMap!1020 _keys!825 lt!104590 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104584 () ListLongMap!2867)

(declare-fun lt!104592 () ListLongMap!2867)

(assert (=> b!205454 (and (= lt!104584 lt!104592) (= lt!104592 lt!104584))))

(declare-fun lt!104588 () ListLongMap!2867)

(declare-fun lt!104587 () tuple2!3954)

(declare-fun +!476 (ListLongMap!2867 tuple2!3954) ListLongMap!2867)

(assert (=> b!205454 (= lt!104592 (+!476 lt!104588 lt!104587))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6477)

(assert (=> b!205454 (= lt!104587 (tuple2!3955 k!843 v!520))))

(declare-datatypes ((Unit!6244 0))(
  ( (Unit!6245) )
))
(declare-fun lt!104595 () Unit!6244)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!133 (array!9459 array!9461 (_ BitVec 32) (_ BitVec 32) V!6477 V!6477 (_ BitVec 32) (_ BitVec 64) V!6477 (_ BitVec 32) Int) Unit!6244)

(assert (=> b!205454 (= lt!104595 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!133 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!394 (array!9459 array!9461 (_ BitVec 32) (_ BitVec 32) V!6477 V!6477 (_ BitVec 32) Int) ListLongMap!2867)

(assert (=> b!205454 (= lt!104584 (getCurrentListMapNoExtraKeys!394 _keys!825 lt!104590 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205454 (= lt!104590 (array!9462 (store (arr!4481 _values!649) i!601 (ValueCellFull!2218 v!520)) (size!4806 _values!649)))))

(assert (=> b!205454 (= lt!104588 (getCurrentListMapNoExtraKeys!394 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205455 () Bool)

(declare-fun res!99274 () Bool)

(assert (=> b!205455 (=> (not res!99274) (not e!134352))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205455 (= res!99274 (validKeyInArray!0 k!843))))

(declare-fun res!99271 () Bool)

(assert (=> start!20608 (=> (not res!99271) (not e!134352))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20608 (= res!99271 (validMask!0 mask!1149))))

(assert (=> start!20608 e!134352))

(declare-fun e!134351 () Bool)

(declare-fun array_inv!2963 (array!9461) Bool)

(assert (=> start!20608 (and (array_inv!2963 _values!649) e!134351)))

(assert (=> start!20608 true))

(assert (=> start!20608 tp_is_empty!5123))

(declare-fun array_inv!2964 (array!9459) Bool)

(assert (=> start!20608 (array_inv!2964 _keys!825)))

(assert (=> start!20608 tp!18833))

(declare-fun b!205456 () Bool)

(declare-fun e!134353 () Bool)

(assert (=> b!205456 (= e!134353 tp_is_empty!5123)))

(declare-fun b!205457 () Bool)

(assert (=> b!205457 (= e!134351 (and e!134355 mapRes!8753))))

(declare-fun condMapEmpty!8753 () Bool)

(declare-fun mapDefault!8753 () ValueCell!2218)

