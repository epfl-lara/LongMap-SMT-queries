; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20604 () Bool)

(assert start!20604)

(declare-fun b_free!5263 () Bool)

(declare-fun b_next!5263 () Bool)

(assert (=> start!20604 (= b_free!5263 (not b_next!5263))))

(declare-fun tp!18820 () Bool)

(declare-fun b_and!12009 () Bool)

(assert (=> start!20604 (= tp!18820 b_and!12009)))

(declare-fun b!205380 () Bool)

(declare-fun e!134312 () Bool)

(declare-fun e!134314 () Bool)

(assert (=> b!205380 (= e!134312 (not e!134314))))

(declare-fun res!99216 () Bool)

(assert (=> b!205380 (=> res!99216 e!134314)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205380 (= res!99216 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6473 0))(
  ( (V!6474 (val!2604 Int)) )
))
(declare-datatypes ((ValueCell!2216 0))(
  ( (ValueCellFull!2216 (v!4574 V!6473)) (EmptyCell!2216) )
))
(declare-datatypes ((array!9451 0))(
  ( (array!9452 (arr!4476 (Array (_ BitVec 32) ValueCell!2216)) (size!4801 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9451)

(declare-datatypes ((tuple2!3950 0))(
  ( (tuple2!3951 (_1!1986 (_ BitVec 64)) (_2!1986 V!6473)) )
))
(declare-datatypes ((List!2848 0))(
  ( (Nil!2845) (Cons!2844 (h!3486 tuple2!3950) (t!7779 List!2848)) )
))
(declare-datatypes ((ListLongMap!2863 0))(
  ( (ListLongMap!2864 (toList!1447 List!2848)) )
))
(declare-fun lt!104512 () ListLongMap!2863)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!9453 0))(
  ( (array!9454 (arr!4477 (Array (_ BitVec 32) (_ BitVec 64))) (size!4802 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9453)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6473)

(declare-fun zeroValue!615 () V!6473)

(declare-fun getCurrentListMap!1018 (array!9453 array!9451 (_ BitVec 32) (_ BitVec 32) V!6473 V!6473 (_ BitVec 32) Int) ListLongMap!2863)

(assert (=> b!205380 (= lt!104512 (getCurrentListMap!1018 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104513 () ListLongMap!2863)

(declare-fun lt!104518 () array!9451)

(assert (=> b!205380 (= lt!104513 (getCurrentListMap!1018 _keys!825 lt!104518 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104514 () ListLongMap!2863)

(declare-fun lt!104517 () ListLongMap!2863)

(assert (=> b!205380 (and (= lt!104514 lt!104517) (= lt!104517 lt!104514))))

(declare-fun lt!104523 () ListLongMap!2863)

(declare-fun lt!104521 () tuple2!3950)

(declare-fun +!474 (ListLongMap!2863 tuple2!3950) ListLongMap!2863)

(assert (=> b!205380 (= lt!104517 (+!474 lt!104523 lt!104521))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6473)

(assert (=> b!205380 (= lt!104521 (tuple2!3951 k!843 v!520))))

(declare-datatypes ((Unit!6240 0))(
  ( (Unit!6241) )
))
(declare-fun lt!104515 () Unit!6240)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!131 (array!9453 array!9451 (_ BitVec 32) (_ BitVec 32) V!6473 V!6473 (_ BitVec 32) (_ BitVec 64) V!6473 (_ BitVec 32) Int) Unit!6240)

(assert (=> b!205380 (= lt!104515 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!131 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!392 (array!9453 array!9451 (_ BitVec 32) (_ BitVec 32) V!6473 V!6473 (_ BitVec 32) Int) ListLongMap!2863)

(assert (=> b!205380 (= lt!104514 (getCurrentListMapNoExtraKeys!392 _keys!825 lt!104518 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205380 (= lt!104518 (array!9452 (store (arr!4476 _values!649) i!601 (ValueCellFull!2216 v!520)) (size!4801 _values!649)))))

(assert (=> b!205380 (= lt!104523 (getCurrentListMapNoExtraKeys!392 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205381 () Bool)

(declare-fun res!99217 () Bool)

(assert (=> b!205381 (=> (not res!99217) (not e!134312))))

(assert (=> b!205381 (= res!99217 (= (select (arr!4477 _keys!825) i!601) k!843))))

(declare-fun b!205382 () Bool)

(declare-fun res!99215 () Bool)

(assert (=> b!205382 (=> (not res!99215) (not e!134312))))

(assert (=> b!205382 (= res!99215 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4802 _keys!825))))))

(declare-fun mapNonEmpty!8747 () Bool)

(declare-fun mapRes!8747 () Bool)

(declare-fun tp!18821 () Bool)

(declare-fun e!134313 () Bool)

(assert (=> mapNonEmpty!8747 (= mapRes!8747 (and tp!18821 e!134313))))

(declare-fun mapRest!8747 () (Array (_ BitVec 32) ValueCell!2216))

(declare-fun mapValue!8747 () ValueCell!2216)

(declare-fun mapKey!8747 () (_ BitVec 32))

(assert (=> mapNonEmpty!8747 (= (arr!4476 _values!649) (store mapRest!8747 mapKey!8747 mapValue!8747))))

(declare-fun res!99218 () Bool)

(assert (=> start!20604 (=> (not res!99218) (not e!134312))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20604 (= res!99218 (validMask!0 mask!1149))))

(assert (=> start!20604 e!134312))

(declare-fun e!134309 () Bool)

(declare-fun array_inv!2959 (array!9451) Bool)

(assert (=> start!20604 (and (array_inv!2959 _values!649) e!134309)))

(assert (=> start!20604 true))

(declare-fun tp_is_empty!5119 () Bool)

(assert (=> start!20604 tp_is_empty!5119))

(declare-fun array_inv!2960 (array!9453) Bool)

(assert (=> start!20604 (array_inv!2960 _keys!825)))

(assert (=> start!20604 tp!18820))

(declare-fun b!205383 () Bool)

(declare-fun res!99219 () Bool)

(assert (=> b!205383 (=> (not res!99219) (not e!134312))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205383 (= res!99219 (validKeyInArray!0 k!843))))

(declare-fun b!205384 () Bool)

(declare-fun e!134315 () Bool)

(assert (=> b!205384 (= e!134315 tp_is_empty!5119)))

(declare-fun b!205385 () Bool)

(declare-fun res!99212 () Bool)

(assert (=> b!205385 (=> (not res!99212) (not e!134312))))

(assert (=> b!205385 (= res!99212 (and (= (size!4801 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4802 _keys!825) (size!4801 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205386 () Bool)

(declare-fun res!99220 () Bool)

(assert (=> b!205386 (=> (not res!99220) (not e!134312))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9453 (_ BitVec 32)) Bool)

(assert (=> b!205386 (= res!99220 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205387 () Bool)

(assert (=> b!205387 (= e!134309 (and e!134315 mapRes!8747))))

(declare-fun condMapEmpty!8747 () Bool)

(declare-fun mapDefault!8747 () ValueCell!2216)

