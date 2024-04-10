; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20478 () Bool)

(assert start!20478)

(declare-fun b_free!5137 () Bool)

(declare-fun b_next!5137 () Bool)

(assert (=> start!20478 (= b_free!5137 (not b_next!5137))))

(declare-fun tp!18442 () Bool)

(declare-fun b_and!11883 () Bool)

(assert (=> start!20478 (= tp!18442 b_and!11883)))

(declare-fun mapNonEmpty!8558 () Bool)

(declare-fun mapRes!8558 () Bool)

(declare-fun tp!18443 () Bool)

(declare-fun e!132987 () Bool)

(assert (=> mapNonEmpty!8558 (= mapRes!8558 (and tp!18443 e!132987))))

(declare-datatypes ((V!6305 0))(
  ( (V!6306 (val!2541 Int)) )
))
(declare-datatypes ((ValueCell!2153 0))(
  ( (ValueCellFull!2153 (v!4511 V!6305)) (EmptyCell!2153) )
))
(declare-fun mapValue!8558 () ValueCell!2153)

(declare-datatypes ((array!9211 0))(
  ( (array!9212 (arr!4356 (Array (_ BitVec 32) ValueCell!2153)) (size!4681 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9211)

(declare-fun mapRest!8558 () (Array (_ BitVec 32) ValueCell!2153))

(declare-fun mapKey!8558 () (_ BitVec 32))

(assert (=> mapNonEmpty!8558 (= (arr!4356 _values!649) (store mapRest!8558 mapKey!8558 mapValue!8558))))

(declare-fun b!203103 () Bool)

(declare-fun res!97507 () Bool)

(declare-fun e!132989 () Bool)

(assert (=> b!203103 (=> (not res!97507) (not e!132989))))

(declare-datatypes ((array!9213 0))(
  ( (array!9214 (arr!4357 (Array (_ BitVec 32) (_ BitVec 64))) (size!4682 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9213)

(declare-datatypes ((List!2758 0))(
  ( (Nil!2755) (Cons!2754 (h!3396 (_ BitVec 64)) (t!7689 List!2758)) )
))
(declare-fun arrayNoDuplicates!0 (array!9213 (_ BitVec 32) List!2758) Bool)

(assert (=> b!203103 (= res!97507 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2755))))

(declare-fun b!203104 () Bool)

(declare-fun e!132986 () Bool)

(declare-fun e!132992 () Bool)

(assert (=> b!203104 (= e!132986 e!132992)))

(declare-fun res!97503 () Bool)

(assert (=> b!203104 (=> res!97503 e!132992)))

(declare-fun k!843 () (_ BitVec 64))

(assert (=> b!203104 (= res!97503 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3854 0))(
  ( (tuple2!3855 (_1!1938 (_ BitVec 64)) (_2!1938 V!6305)) )
))
(declare-datatypes ((List!2759 0))(
  ( (Nil!2756) (Cons!2755 (h!3397 tuple2!3854) (t!7690 List!2759)) )
))
(declare-datatypes ((ListLongMap!2767 0))(
  ( (ListLongMap!2768 (toList!1399 List!2759)) )
))
(declare-fun lt!102281 () ListLongMap!2767)

(declare-fun lt!102289 () ListLongMap!2767)

(assert (=> b!203104 (= lt!102281 lt!102289)))

(declare-fun lt!102285 () ListLongMap!2767)

(declare-fun lt!102288 () tuple2!3854)

(declare-fun +!426 (ListLongMap!2767 tuple2!3854) ListLongMap!2767)

(assert (=> b!203104 (= lt!102289 (+!426 lt!102285 lt!102288))))

(declare-fun lt!102287 () ListLongMap!2767)

(declare-fun lt!102286 () ListLongMap!2767)

(assert (=> b!203104 (= lt!102287 lt!102286)))

(declare-fun lt!102280 () ListLongMap!2767)

(assert (=> b!203104 (= lt!102286 (+!426 lt!102280 lt!102288))))

(declare-fun lt!102291 () ListLongMap!2767)

(assert (=> b!203104 (= lt!102281 (+!426 lt!102291 lt!102288))))

(declare-fun zeroValue!615 () V!6305)

(assert (=> b!203104 (= lt!102288 (tuple2!3855 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203105 () Bool)

(declare-fun res!97510 () Bool)

(assert (=> b!203105 (=> (not res!97510) (not e!132989))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9213 (_ BitVec 32)) Bool)

(assert (=> b!203105 (= res!97510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203106 () Bool)

(declare-fun res!97506 () Bool)

(assert (=> b!203106 (=> (not res!97506) (not e!132989))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203106 (= res!97506 (= (select (arr!4357 _keys!825) i!601) k!843))))

(declare-fun res!97509 () Bool)

(assert (=> start!20478 (=> (not res!97509) (not e!132989))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20478 (= res!97509 (validMask!0 mask!1149))))

(assert (=> start!20478 e!132989))

(declare-fun e!132988 () Bool)

(declare-fun array_inv!2879 (array!9211) Bool)

(assert (=> start!20478 (and (array_inv!2879 _values!649) e!132988)))

(assert (=> start!20478 true))

(declare-fun tp_is_empty!4993 () Bool)

(assert (=> start!20478 tp_is_empty!4993))

(declare-fun array_inv!2880 (array!9213) Bool)

(assert (=> start!20478 (array_inv!2880 _keys!825)))

(assert (=> start!20478 tp!18442))

(declare-fun mapIsEmpty!8558 () Bool)

(assert (=> mapIsEmpty!8558 mapRes!8558))

(declare-fun b!203107 () Bool)

(declare-fun res!97505 () Bool)

(assert (=> b!203107 (=> (not res!97505) (not e!132989))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!203107 (= res!97505 (and (= (size!4681 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4682 _keys!825) (size!4681 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203108 () Bool)

(assert (=> b!203108 (= e!132989 (not e!132986))))

(declare-fun res!97508 () Bool)

(assert (=> b!203108 (=> res!97508 e!132986)))

(assert (=> b!203108 (= res!97508 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6305)

(declare-fun getCurrentListMap!976 (array!9213 array!9211 (_ BitVec 32) (_ BitVec 32) V!6305 V!6305 (_ BitVec 32) Int) ListLongMap!2767)

(assert (=> b!203108 (= lt!102287 (getCurrentListMap!976 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!102290 () array!9211)

(assert (=> b!203108 (= lt!102281 (getCurrentListMap!976 _keys!825 lt!102290 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203108 (and (= lt!102291 lt!102285) (= lt!102285 lt!102291))))

(declare-fun lt!102282 () tuple2!3854)

(assert (=> b!203108 (= lt!102285 (+!426 lt!102280 lt!102282))))

(declare-fun v!520 () V!6305)

(assert (=> b!203108 (= lt!102282 (tuple2!3855 k!843 v!520))))

(declare-datatypes ((Unit!6146 0))(
  ( (Unit!6147) )
))
(declare-fun lt!102283 () Unit!6146)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!89 (array!9213 array!9211 (_ BitVec 32) (_ BitVec 32) V!6305 V!6305 (_ BitVec 32) (_ BitVec 64) V!6305 (_ BitVec 32) Int) Unit!6146)

(assert (=> b!203108 (= lt!102283 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!89 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!350 (array!9213 array!9211 (_ BitVec 32) (_ BitVec 32) V!6305 V!6305 (_ BitVec 32) Int) ListLongMap!2767)

(assert (=> b!203108 (= lt!102291 (getCurrentListMapNoExtraKeys!350 _keys!825 lt!102290 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203108 (= lt!102290 (array!9212 (store (arr!4356 _values!649) i!601 (ValueCellFull!2153 v!520)) (size!4681 _values!649)))))

(assert (=> b!203108 (= lt!102280 (getCurrentListMapNoExtraKeys!350 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!203109 () Bool)

(declare-fun e!132990 () Bool)

(assert (=> b!203109 (= e!132988 (and e!132990 mapRes!8558))))

(declare-fun condMapEmpty!8558 () Bool)

(declare-fun mapDefault!8558 () ValueCell!2153)

