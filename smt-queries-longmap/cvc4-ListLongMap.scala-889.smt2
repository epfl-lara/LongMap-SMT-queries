; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20434 () Bool)

(assert start!20434)

(declare-fun b_free!5093 () Bool)

(declare-fun b_next!5093 () Bool)

(assert (=> start!20434 (= b_free!5093 (not b_next!5093))))

(declare-fun tp!18311 () Bool)

(declare-fun b_and!11839 () Bool)

(assert (=> start!20434 (= tp!18311 b_and!11839)))

(declare-fun mapIsEmpty!8492 () Bool)

(declare-fun mapRes!8492 () Bool)

(assert (=> mapIsEmpty!8492 mapRes!8492))

(declare-fun b!202302 () Bool)

(declare-fun res!96900 () Bool)

(declare-fun e!132525 () Bool)

(assert (=> b!202302 (=> (not res!96900) (not e!132525))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9123 0))(
  ( (array!9124 (arr!4312 (Array (_ BitVec 32) (_ BitVec 64))) (size!4637 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9123)

(assert (=> b!202302 (= res!96900 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4637 _keys!825))))))

(declare-fun b!202303 () Bool)

(declare-fun e!132527 () Bool)

(assert (=> b!202303 (= e!132525 (not e!132527))))

(declare-fun res!96901 () Bool)

(assert (=> b!202303 (=> res!96901 e!132527)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!202303 (= res!96901 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!6245 0))(
  ( (V!6246 (val!2519 Int)) )
))
(declare-datatypes ((ValueCell!2131 0))(
  ( (ValueCellFull!2131 (v!4489 V!6245)) (EmptyCell!2131) )
))
(declare-datatypes ((array!9125 0))(
  ( (array!9126 (arr!4313 (Array (_ BitVec 32) ValueCell!2131)) (size!4638 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9125)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3818 0))(
  ( (tuple2!3819 (_1!1920 (_ BitVec 64)) (_2!1920 V!6245)) )
))
(declare-datatypes ((List!2726 0))(
  ( (Nil!2723) (Cons!2722 (h!3364 tuple2!3818) (t!7657 List!2726)) )
))
(declare-datatypes ((ListLongMap!2731 0))(
  ( (ListLongMap!2732 (toList!1381 List!2726)) )
))
(declare-fun lt!101522 () ListLongMap!2731)

(declare-fun zeroValue!615 () V!6245)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6245)

(declare-fun getCurrentListMap!964 (array!9123 array!9125 (_ BitVec 32) (_ BitVec 32) V!6245 V!6245 (_ BitVec 32) Int) ListLongMap!2731)

(assert (=> b!202303 (= lt!101522 (getCurrentListMap!964 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101530 () array!9125)

(declare-fun lt!101521 () ListLongMap!2731)

(assert (=> b!202303 (= lt!101521 (getCurrentListMap!964 _keys!825 lt!101530 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101528 () ListLongMap!2731)

(declare-fun lt!101526 () ListLongMap!2731)

(assert (=> b!202303 (and (= lt!101528 lt!101526) (= lt!101526 lt!101528))))

(declare-fun lt!101524 () ListLongMap!2731)

(declare-fun lt!101532 () tuple2!3818)

(declare-fun +!408 (ListLongMap!2731 tuple2!3818) ListLongMap!2731)

(assert (=> b!202303 (= lt!101526 (+!408 lt!101524 lt!101532))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun v!520 () V!6245)

(assert (=> b!202303 (= lt!101532 (tuple2!3819 k!843 v!520))))

(declare-datatypes ((Unit!6116 0))(
  ( (Unit!6117) )
))
(declare-fun lt!101534 () Unit!6116)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!77 (array!9123 array!9125 (_ BitVec 32) (_ BitVec 32) V!6245 V!6245 (_ BitVec 32) (_ BitVec 64) V!6245 (_ BitVec 32) Int) Unit!6116)

(assert (=> b!202303 (= lt!101534 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!77 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!338 (array!9123 array!9125 (_ BitVec 32) (_ BitVec 32) V!6245 V!6245 (_ BitVec 32) Int) ListLongMap!2731)

(assert (=> b!202303 (= lt!101528 (getCurrentListMapNoExtraKeys!338 _keys!825 lt!101530 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!202303 (= lt!101530 (array!9126 (store (arr!4313 _values!649) i!601 (ValueCellFull!2131 v!520)) (size!4638 _values!649)))))

(assert (=> b!202303 (= lt!101524 (getCurrentListMapNoExtraKeys!338 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!202304 () Bool)

(declare-fun e!132526 () Bool)

(assert (=> b!202304 (= e!132526 (bvsle #b00000000000000000000000000000000 (size!4637 _keys!825)))))

(declare-fun lt!101520 () ListLongMap!2731)

(declare-fun lt!101523 () ListLongMap!2731)

(declare-fun lt!101527 () tuple2!3818)

(assert (=> b!202304 (= (+!408 lt!101520 lt!101527) (+!408 lt!101523 lt!101532))))

(declare-fun lt!101535 () ListLongMap!2731)

(declare-fun lt!101529 () Unit!6116)

(declare-fun addCommutativeForDiffKeys!129 (ListLongMap!2731 (_ BitVec 64) V!6245 (_ BitVec 64) V!6245) Unit!6116)

(assert (=> b!202304 (= lt!101529 (addCommutativeForDiffKeys!129 lt!101535 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!202305 () Bool)

(declare-fun e!132528 () Bool)

(declare-fun tp_is_empty!4949 () Bool)

(assert (=> b!202305 (= e!132528 tp_is_empty!4949)))

(declare-fun res!96899 () Bool)

(assert (=> start!20434 (=> (not res!96899) (not e!132525))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20434 (= res!96899 (validMask!0 mask!1149))))

(assert (=> start!20434 e!132525))

(declare-fun e!132524 () Bool)

(declare-fun array_inv!2847 (array!9125) Bool)

(assert (=> start!20434 (and (array_inv!2847 _values!649) e!132524)))

(assert (=> start!20434 true))

(assert (=> start!20434 tp_is_empty!4949))

(declare-fun array_inv!2848 (array!9123) Bool)

(assert (=> start!20434 (array_inv!2848 _keys!825)))

(assert (=> start!20434 tp!18311))

(declare-fun mapNonEmpty!8492 () Bool)

(declare-fun tp!18310 () Bool)

(declare-fun e!132530 () Bool)

(assert (=> mapNonEmpty!8492 (= mapRes!8492 (and tp!18310 e!132530))))

(declare-fun mapRest!8492 () (Array (_ BitVec 32) ValueCell!2131))

(declare-fun mapKey!8492 () (_ BitVec 32))

(declare-fun mapValue!8492 () ValueCell!2131)

(assert (=> mapNonEmpty!8492 (= (arr!4313 _values!649) (store mapRest!8492 mapKey!8492 mapValue!8492))))

(declare-fun b!202306 () Bool)

(declare-fun res!96906 () Bool)

(assert (=> b!202306 (=> (not res!96906) (not e!132525))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9123 (_ BitVec 32)) Bool)

(assert (=> b!202306 (= res!96906 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!202307 () Bool)

(declare-fun res!96902 () Bool)

(assert (=> b!202307 (=> (not res!96902) (not e!132525))))

(assert (=> b!202307 (= res!96902 (and (= (size!4638 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4637 _keys!825) (size!4638 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!202308 () Bool)

(declare-fun res!96904 () Bool)

(assert (=> b!202308 (=> (not res!96904) (not e!132525))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!202308 (= res!96904 (validKeyInArray!0 k!843))))

(declare-fun b!202309 () Bool)

(declare-fun res!96903 () Bool)

(assert (=> b!202309 (=> (not res!96903) (not e!132525))))

(assert (=> b!202309 (= res!96903 (= (select (arr!4312 _keys!825) i!601) k!843))))

(declare-fun b!202310 () Bool)

(assert (=> b!202310 (= e!132524 (and e!132528 mapRes!8492))))

(declare-fun condMapEmpty!8492 () Bool)

(declare-fun mapDefault!8492 () ValueCell!2131)

