; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20610 () Bool)

(assert start!20610)

(declare-fun b_free!5269 () Bool)

(declare-fun b_next!5269 () Bool)

(assert (=> start!20610 (= b_free!5269 (not b_next!5269))))

(declare-fun tp!18839 () Bool)

(declare-fun b_and!12015 () Bool)

(assert (=> start!20610 (= tp!18839 b_and!12015)))

(declare-fun b!205488 () Bool)

(declare-fun e!134374 () Bool)

(declare-fun tp_is_empty!5125 () Bool)

(assert (=> b!205488 (= e!134374 tp_is_empty!5125)))

(declare-fun b!205489 () Bool)

(declare-fun res!99299 () Bool)

(declare-fun e!134375 () Bool)

(assert (=> b!205489 (=> (not res!99299) (not e!134375))))

(declare-datatypes ((array!9463 0))(
  ( (array!9464 (arr!4482 (Array (_ BitVec 32) (_ BitVec 64))) (size!4807 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9463)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9463 (_ BitVec 32)) Bool)

(assert (=> b!205489 (= res!99299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8756 () Bool)

(declare-fun mapRes!8756 () Bool)

(assert (=> mapIsEmpty!8756 mapRes!8756))

(declare-fun b!205490 () Bool)

(declare-fun e!134376 () Bool)

(declare-fun e!134373 () Bool)

(assert (=> b!205490 (= e!134376 e!134373)))

(declare-fun res!99298 () Bool)

(assert (=> b!205490 (=> res!99298 e!134373)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!205490 (= res!99298 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((V!6481 0))(
  ( (V!6482 (val!2607 Int)) )
))
(declare-datatypes ((tuple2!3956 0))(
  ( (tuple2!3957 (_1!1989 (_ BitVec 64)) (_2!1989 V!6481)) )
))
(declare-datatypes ((List!2852 0))(
  ( (Nil!2849) (Cons!2848 (h!3490 tuple2!3956) (t!7783 List!2852)) )
))
(declare-datatypes ((ListLongMap!2869 0))(
  ( (ListLongMap!2870 (toList!1450 List!2852)) )
))
(declare-fun lt!104623 () ListLongMap!2869)

(declare-fun lt!104620 () ListLongMap!2869)

(assert (=> b!205490 (= lt!104623 lt!104620)))

(declare-fun lt!104630 () ListLongMap!2869)

(declare-fun lt!104627 () tuple2!3956)

(declare-fun +!477 (ListLongMap!2869 tuple2!3956) ListLongMap!2869)

(assert (=> b!205490 (= lt!104620 (+!477 lt!104630 lt!104627))))

(declare-fun lt!104628 () ListLongMap!2869)

(declare-fun lt!104626 () ListLongMap!2869)

(assert (=> b!205490 (= lt!104628 lt!104626)))

(declare-fun lt!104631 () ListLongMap!2869)

(assert (=> b!205490 (= lt!104626 (+!477 lt!104631 lt!104627))))

(declare-fun lt!104621 () ListLongMap!2869)

(assert (=> b!205490 (= lt!104628 (+!477 lt!104621 lt!104627))))

(declare-fun minValue!615 () V!6481)

(assert (=> b!205490 (= lt!104627 (tuple2!3957 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205491 () Bool)

(declare-fun res!99293 () Bool)

(assert (=> b!205491 (=> (not res!99293) (not e!134375))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205491 (= res!99293 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4807 _keys!825))))))

(declare-fun b!205492 () Bool)

(declare-fun res!99297 () Bool)

(assert (=> b!205492 (=> (not res!99297) (not e!134375))))

(declare-datatypes ((List!2853 0))(
  ( (Nil!2850) (Cons!2849 (h!3491 (_ BitVec 64)) (t!7784 List!2853)) )
))
(declare-fun arrayNoDuplicates!0 (array!9463 (_ BitVec 32) List!2853) Bool)

(assert (=> b!205492 (= res!99297 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2850))))

(declare-fun b!205493 () Bool)

(declare-fun res!99296 () Bool)

(assert (=> b!205493 (=> (not res!99296) (not e!134375))))

(declare-datatypes ((ValueCell!2219 0))(
  ( (ValueCellFull!2219 (v!4577 V!6481)) (EmptyCell!2219) )
))
(declare-datatypes ((array!9465 0))(
  ( (array!9466 (arr!4483 (Array (_ BitVec 32) ValueCell!2219)) (size!4808 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9465)

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205493 (= res!99296 (and (= (size!4808 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4807 _keys!825) (size!4808 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205494 () Bool)

(assert (=> b!205494 (= e!134375 (not e!134376))))

(declare-fun res!99294 () Bool)

(assert (=> b!205494 (=> res!99294 e!134376)))

(assert (=> b!205494 (= res!99294 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6481)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1021 (array!9463 array!9465 (_ BitVec 32) (_ BitVec 32) V!6481 V!6481 (_ BitVec 32) Int) ListLongMap!2869)

(assert (=> b!205494 (= lt!104623 (getCurrentListMap!1021 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104624 () array!9465)

(assert (=> b!205494 (= lt!104628 (getCurrentListMap!1021 _keys!825 lt!104624 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205494 (and (= lt!104621 lt!104631) (= lt!104631 lt!104621))))

(declare-fun lt!104629 () tuple2!3956)

(assert (=> b!205494 (= lt!104631 (+!477 lt!104630 lt!104629))))

(declare-fun v!520 () V!6481)

(assert (=> b!205494 (= lt!104629 (tuple2!3957 k!843 v!520))))

(declare-datatypes ((Unit!6246 0))(
  ( (Unit!6247) )
))
(declare-fun lt!104622 () Unit!6246)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!134 (array!9463 array!9465 (_ BitVec 32) (_ BitVec 32) V!6481 V!6481 (_ BitVec 32) (_ BitVec 64) V!6481 (_ BitVec 32) Int) Unit!6246)

(assert (=> b!205494 (= lt!104622 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!134 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!395 (array!9463 array!9465 (_ BitVec 32) (_ BitVec 32) V!6481 V!6481 (_ BitVec 32) Int) ListLongMap!2869)

(assert (=> b!205494 (= lt!104621 (getCurrentListMapNoExtraKeys!395 _keys!825 lt!104624 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205494 (= lt!104624 (array!9466 (store (arr!4483 _values!649) i!601 (ValueCellFull!2219 v!520)) (size!4808 _values!649)))))

(assert (=> b!205494 (= lt!104630 (getCurrentListMapNoExtraKeys!395 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205496 () Bool)

(declare-fun res!99295 () Bool)

(assert (=> b!205496 (=> (not res!99295) (not e!134375))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205496 (= res!99295 (validKeyInArray!0 k!843))))

(declare-fun b!205497 () Bool)

(assert (=> b!205497 (= e!134373 true)))

(assert (=> b!205497 (= lt!104626 (+!477 lt!104620 lt!104629))))

(declare-fun lt!104625 () Unit!6246)

(declare-fun addCommutativeForDiffKeys!177 (ListLongMap!2869 (_ BitVec 64) V!6481 (_ BitVec 64) V!6481) Unit!6246)

(assert (=> b!205497 (= lt!104625 (addCommutativeForDiffKeys!177 lt!104630 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205498 () Bool)

(declare-fun res!99301 () Bool)

(assert (=> b!205498 (=> (not res!99301) (not e!134375))))

(assert (=> b!205498 (= res!99301 (= (select (arr!4482 _keys!825) i!601) k!843))))

(declare-fun mapNonEmpty!8756 () Bool)

(declare-fun tp!18838 () Bool)

(declare-fun e!134378 () Bool)

(assert (=> mapNonEmpty!8756 (= mapRes!8756 (and tp!18838 e!134378))))

(declare-fun mapKey!8756 () (_ BitVec 32))

(declare-fun mapRest!8756 () (Array (_ BitVec 32) ValueCell!2219))

(declare-fun mapValue!8756 () ValueCell!2219)

(assert (=> mapNonEmpty!8756 (= (arr!4483 _values!649) (store mapRest!8756 mapKey!8756 mapValue!8756))))

(declare-fun b!205499 () Bool)

(assert (=> b!205499 (= e!134378 tp_is_empty!5125)))

(declare-fun b!205495 () Bool)

(declare-fun e!134377 () Bool)

(assert (=> b!205495 (= e!134377 (and e!134374 mapRes!8756))))

(declare-fun condMapEmpty!8756 () Bool)

(declare-fun mapDefault!8756 () ValueCell!2219)

