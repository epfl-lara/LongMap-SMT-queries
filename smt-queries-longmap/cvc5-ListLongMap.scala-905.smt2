; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20526 () Bool)

(assert start!20526)

(declare-fun b_free!5185 () Bool)

(declare-fun b_next!5185 () Bool)

(assert (=> start!20526 (= b_free!5185 (not b_next!5185))))

(declare-fun tp!18587 () Bool)

(declare-fun b_and!11931 () Bool)

(assert (=> start!20526 (= tp!18587 b_and!11931)))

(declare-fun mapNonEmpty!8630 () Bool)

(declare-fun mapRes!8630 () Bool)

(declare-fun tp!18586 () Bool)

(declare-fun e!133494 () Bool)

(assert (=> mapNonEmpty!8630 (= mapRes!8630 (and tp!18586 e!133494))))

(declare-datatypes ((V!6369 0))(
  ( (V!6370 (val!2565 Int)) )
))
(declare-datatypes ((ValueCell!2177 0))(
  ( (ValueCellFull!2177 (v!4535 V!6369)) (EmptyCell!2177) )
))
(declare-datatypes ((array!9301 0))(
  ( (array!9302 (arr!4401 (Array (_ BitVec 32) ValueCell!2177)) (size!4726 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9301)

(declare-fun mapValue!8630 () ValueCell!2177)

(declare-fun mapRest!8630 () (Array (_ BitVec 32) ValueCell!2177))

(declare-fun mapKey!8630 () (_ BitVec 32))

(assert (=> mapNonEmpty!8630 (= (arr!4401 _values!649) (store mapRest!8630 mapKey!8630 mapValue!8630))))

(declare-fun b!203967 () Bool)

(declare-fun res!98158 () Bool)

(declare-fun e!133492 () Bool)

(assert (=> b!203967 (=> (not res!98158) (not e!133492))))

(declare-datatypes ((array!9303 0))(
  ( (array!9304 (arr!4402 (Array (_ BitVec 32) (_ BitVec 64))) (size!4727 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9303)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!203967 (= res!98158 (and (= (size!4726 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4727 _keys!825) (size!4726 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!203968 () Bool)

(declare-fun res!98151 () Bool)

(assert (=> b!203968 (=> (not res!98151) (not e!133492))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203968 (= res!98151 (= (select (arr!4402 _keys!825) i!601) k!843))))

(declare-fun b!203969 () Bool)

(declare-fun res!98150 () Bool)

(assert (=> b!203969 (=> (not res!98150) (not e!133492))))

(declare-datatypes ((List!2790 0))(
  ( (Nil!2787) (Cons!2786 (h!3428 (_ BitVec 64)) (t!7721 List!2790)) )
))
(declare-fun arrayNoDuplicates!0 (array!9303 (_ BitVec 32) List!2790) Bool)

(assert (=> b!203969 (= res!98150 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2787))))

(declare-fun b!203970 () Bool)

(declare-fun res!98157 () Bool)

(assert (=> b!203970 (=> (not res!98157) (not e!133492))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203970 (= res!98157 (validKeyInArray!0 k!843))))

(declare-fun b!203971 () Bool)

(declare-fun e!133496 () Bool)

(declare-fun tp_is_empty!5041 () Bool)

(assert (=> b!203971 (= e!133496 tp_is_empty!5041)))

(declare-fun b!203973 () Bool)

(declare-fun e!133495 () Bool)

(assert (=> b!203973 (= e!133495 true)))

(declare-datatypes ((tuple2!3890 0))(
  ( (tuple2!3891 (_1!1956 (_ BitVec 64)) (_2!1956 V!6369)) )
))
(declare-datatypes ((List!2791 0))(
  ( (Nil!2788) (Cons!2787 (h!3429 tuple2!3890) (t!7722 List!2791)) )
))
(declare-datatypes ((ListLongMap!2803 0))(
  ( (ListLongMap!2804 (toList!1417 List!2791)) )
))
(declare-fun lt!103145 () ListLongMap!2803)

(declare-fun lt!103150 () ListLongMap!2803)

(declare-fun lt!103148 () tuple2!3890)

(declare-fun +!444 (ListLongMap!2803 tuple2!3890) ListLongMap!2803)

(assert (=> b!203973 (= lt!103145 (+!444 lt!103150 lt!103148))))

(declare-datatypes ((Unit!6182 0))(
  ( (Unit!6183) )
))
(declare-fun lt!103147 () Unit!6182)

(declare-fun v!520 () V!6369)

(declare-fun zeroValue!615 () V!6369)

(declare-fun lt!103155 () ListLongMap!2803)

(declare-fun addCommutativeForDiffKeys!154 (ListLongMap!2803 (_ BitVec 64) V!6369 (_ BitVec 64) V!6369) Unit!6182)

(assert (=> b!203973 (= lt!103147 (addCommutativeForDiffKeys!154 lt!103155 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203974 () Bool)

(declare-fun res!98155 () Bool)

(assert (=> b!203974 (=> (not res!98155) (not e!133492))))

(assert (=> b!203974 (= res!98155 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4727 _keys!825))))))

(declare-fun b!203975 () Bool)

(assert (=> b!203975 (= e!133494 tp_is_empty!5041)))

(declare-fun b!203976 () Bool)

(declare-fun e!133491 () Bool)

(assert (=> b!203976 (= e!133491 e!133495)))

(declare-fun res!98156 () Bool)

(assert (=> b!203976 (=> res!98156 e!133495)))

(assert (=> b!203976 (= res!98156 (= k!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!103152 () ListLongMap!2803)

(assert (=> b!203976 (= lt!103152 lt!103145)))

(declare-fun lt!103151 () ListLongMap!2803)

(declare-fun lt!103154 () tuple2!3890)

(assert (=> b!203976 (= lt!103145 (+!444 lt!103151 lt!103154))))

(declare-fun lt!103144 () ListLongMap!2803)

(assert (=> b!203976 (= lt!103144 lt!103150)))

(assert (=> b!203976 (= lt!103150 (+!444 lt!103155 lt!103154))))

(declare-fun lt!103149 () ListLongMap!2803)

(assert (=> b!203976 (= lt!103152 (+!444 lt!103149 lt!103154))))

(assert (=> b!203976 (= lt!103154 (tuple2!3891 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun mapIsEmpty!8630 () Bool)

(assert (=> mapIsEmpty!8630 mapRes!8630))

(declare-fun b!203977 () Bool)

(declare-fun res!98152 () Bool)

(assert (=> b!203977 (=> (not res!98152) (not e!133492))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9303 (_ BitVec 32)) Bool)

(assert (=> b!203977 (= res!98152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203978 () Bool)

(assert (=> b!203978 (= e!133492 (not e!133491))))

(declare-fun res!98154 () Bool)

(assert (=> b!203978 (=> res!98154 e!133491)))

(assert (=> b!203978 (= res!98154 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6369)

(declare-fun getCurrentListMap!991 (array!9303 array!9301 (_ BitVec 32) (_ BitVec 32) V!6369 V!6369 (_ BitVec 32) Int) ListLongMap!2803)

(assert (=> b!203978 (= lt!103144 (getCurrentListMap!991 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103146 () array!9301)

(assert (=> b!203978 (= lt!103152 (getCurrentListMap!991 _keys!825 lt!103146 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203978 (and (= lt!103149 lt!103151) (= lt!103151 lt!103149))))

(assert (=> b!203978 (= lt!103151 (+!444 lt!103155 lt!103148))))

(assert (=> b!203978 (= lt!103148 (tuple2!3891 k!843 v!520))))

(declare-fun lt!103153 () Unit!6182)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!104 (array!9303 array!9301 (_ BitVec 32) (_ BitVec 32) V!6369 V!6369 (_ BitVec 32) (_ BitVec 64) V!6369 (_ BitVec 32) Int) Unit!6182)

(assert (=> b!203978 (= lt!103153 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!104 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!365 (array!9303 array!9301 (_ BitVec 32) (_ BitVec 32) V!6369 V!6369 (_ BitVec 32) Int) ListLongMap!2803)

(assert (=> b!203978 (= lt!103149 (getCurrentListMapNoExtraKeys!365 _keys!825 lt!103146 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203978 (= lt!103146 (array!9302 (store (arr!4401 _values!649) i!601 (ValueCellFull!2177 v!520)) (size!4726 _values!649)))))

(assert (=> b!203978 (= lt!103155 (getCurrentListMapNoExtraKeys!365 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!98153 () Bool)

(assert (=> start!20526 (=> (not res!98153) (not e!133492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20526 (= res!98153 (validMask!0 mask!1149))))

(assert (=> start!20526 e!133492))

(declare-fun e!133490 () Bool)

(declare-fun array_inv!2907 (array!9301) Bool)

(assert (=> start!20526 (and (array_inv!2907 _values!649) e!133490)))

(assert (=> start!20526 true))

(assert (=> start!20526 tp_is_empty!5041))

(declare-fun array_inv!2908 (array!9303) Bool)

(assert (=> start!20526 (array_inv!2908 _keys!825)))

(assert (=> start!20526 tp!18587))

(declare-fun b!203972 () Bool)

(assert (=> b!203972 (= e!133490 (and e!133496 mapRes!8630))))

(declare-fun condMapEmpty!8630 () Bool)

(declare-fun mapDefault!8630 () ValueCell!2177)

