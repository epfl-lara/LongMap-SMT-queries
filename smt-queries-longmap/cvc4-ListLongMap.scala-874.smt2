; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20344 () Bool)

(assert start!20344)

(declare-fun b_free!5003 () Bool)

(declare-fun b_next!5003 () Bool)

(assert (=> start!20344 (= b_free!5003 (not b_next!5003))))

(declare-fun tp!18040 () Bool)

(declare-fun b_and!11749 () Bool)

(assert (=> start!20344 (= tp!18040 b_and!11749)))

(declare-fun b!200682 () Bool)

(declare-fun e!131585 () Bool)

(declare-fun e!131583 () Bool)

(assert (=> b!200682 (= e!131585 (not e!131583))))

(declare-fun res!95687 () Bool)

(assert (=> b!200682 (=> res!95687 e!131583)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!200682 (= res!95687 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6125 0))(
  ( (V!6126 (val!2474 Int)) )
))
(declare-datatypes ((ValueCell!2086 0))(
  ( (ValueCellFull!2086 (v!4444 V!6125)) (EmptyCell!2086) )
))
(declare-datatypes ((array!8949 0))(
  ( (array!8950 (arr!4225 (Array (_ BitVec 32) ValueCell!2086)) (size!4550 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8949)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3740 0))(
  ( (tuple2!3741 (_1!1881 (_ BitVec 64)) (_2!1881 V!6125)) )
))
(declare-datatypes ((List!2657 0))(
  ( (Nil!2654) (Cons!2653 (h!3295 tuple2!3740) (t!7588 List!2657)) )
))
(declare-datatypes ((ListLongMap!2653 0))(
  ( (ListLongMap!2654 (toList!1342 List!2657)) )
))
(declare-fun lt!99375 () ListLongMap!2653)

(declare-fun zeroValue!615 () V!6125)

(declare-datatypes ((array!8951 0))(
  ( (array!8952 (arr!4226 (Array (_ BitVec 32) (_ BitVec 64))) (size!4551 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8951)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6125)

(declare-fun getCurrentListMap!932 (array!8951 array!8949 (_ BitVec 32) (_ BitVec 32) V!6125 V!6125 (_ BitVec 32) Int) ListLongMap!2653)

(assert (=> b!200682 (= lt!99375 (getCurrentListMap!932 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99373 () ListLongMap!2653)

(declare-fun lt!99364 () array!8949)

(assert (=> b!200682 (= lt!99373 (getCurrentListMap!932 _keys!825 lt!99364 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!99362 () ListLongMap!2653)

(declare-fun lt!99365 () ListLongMap!2653)

(assert (=> b!200682 (and (= lt!99362 lt!99365) (= lt!99365 lt!99362))))

(declare-fun lt!99367 () ListLongMap!2653)

(declare-fun lt!99372 () tuple2!3740)

(declare-fun +!369 (ListLongMap!2653 tuple2!3740) ListLongMap!2653)

(assert (=> b!200682 (= lt!99365 (+!369 lt!99367 lt!99372))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6125)

(assert (=> b!200682 (= lt!99372 (tuple2!3741 k!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6038 0))(
  ( (Unit!6039) )
))
(declare-fun lt!99361 () Unit!6038)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!45 (array!8951 array!8949 (_ BitVec 32) (_ BitVec 32) V!6125 V!6125 (_ BitVec 32) (_ BitVec 64) V!6125 (_ BitVec 32) Int) Unit!6038)

(assert (=> b!200682 (= lt!99361 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!45 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!306 (array!8951 array!8949 (_ BitVec 32) (_ BitVec 32) V!6125 V!6125 (_ BitVec 32) Int) ListLongMap!2653)

(assert (=> b!200682 (= lt!99362 (getCurrentListMapNoExtraKeys!306 _keys!825 lt!99364 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!200682 (= lt!99364 (array!8950 (store (arr!4225 _values!649) i!601 (ValueCellFull!2086 v!520)) (size!4550 _values!649)))))

(assert (=> b!200682 (= lt!99367 (getCurrentListMapNoExtraKeys!306 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8357 () Bool)

(declare-fun mapRes!8357 () Bool)

(declare-fun tp!18041 () Bool)

(declare-fun e!131580 () Bool)

(assert (=> mapNonEmpty!8357 (= mapRes!8357 (and tp!18041 e!131580))))

(declare-fun mapValue!8357 () ValueCell!2086)

(declare-fun mapRest!8357 () (Array (_ BitVec 32) ValueCell!2086))

(declare-fun mapKey!8357 () (_ BitVec 32))

(assert (=> mapNonEmpty!8357 (= (arr!4225 _values!649) (store mapRest!8357 mapKey!8357 mapValue!8357))))

(declare-fun b!200683 () Bool)

(declare-fun res!95686 () Bool)

(assert (=> b!200683 (=> (not res!95686) (not e!131585))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!200683 (= res!95686 (validKeyInArray!0 k!843))))

(declare-fun b!200684 () Bool)

(declare-fun tp_is_empty!4859 () Bool)

(assert (=> b!200684 (= e!131580 tp_is_empty!4859)))

(declare-fun b!200685 () Bool)

(declare-fun res!95689 () Bool)

(assert (=> b!200685 (=> (not res!95689) (not e!131585))))

(assert (=> b!200685 (= res!95689 (and (= (size!4550 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4551 _keys!825) (size!4550 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!200686 () Bool)

(declare-fun res!95690 () Bool)

(assert (=> b!200686 (=> (not res!95690) (not e!131585))))

(declare-datatypes ((List!2658 0))(
  ( (Nil!2655) (Cons!2654 (h!3296 (_ BitVec 64)) (t!7589 List!2658)) )
))
(declare-fun arrayNoDuplicates!0 (array!8951 (_ BitVec 32) List!2658) Bool)

(assert (=> b!200686 (= res!95690 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2655))))

(declare-fun b!200687 () Bool)

(declare-fun e!131579 () Bool)

(declare-fun e!131582 () Bool)

(assert (=> b!200687 (= e!131579 (and e!131582 mapRes!8357))))

(declare-fun condMapEmpty!8357 () Bool)

(declare-fun mapDefault!8357 () ValueCell!2086)

