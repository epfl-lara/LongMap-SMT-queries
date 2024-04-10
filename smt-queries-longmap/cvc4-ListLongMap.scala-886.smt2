; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20416 () Bool)

(assert start!20416)

(declare-fun b_free!5075 () Bool)

(declare-fun b_next!5075 () Bool)

(assert (=> start!20416 (= b_free!5075 (not b_next!5075))))

(declare-fun tp!18257 () Bool)

(declare-fun b_and!11821 () Bool)

(assert (=> start!20416 (= tp!18257 b_and!11821)))

(declare-fun b!201978 () Bool)

(declare-fun res!96661 () Bool)

(declare-fun e!132338 () Bool)

(assert (=> b!201978 (=> (not res!96661) (not e!132338))))

(declare-datatypes ((array!9091 0))(
  ( (array!9092 (arr!4296 (Array (_ BitVec 32) (_ BitVec 64))) (size!4621 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9091)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9091 (_ BitVec 32)) Bool)

(assert (=> b!201978 (= res!96661 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8465 () Bool)

(declare-fun mapRes!8465 () Bool)

(declare-fun tp!18256 () Bool)

(declare-fun e!132335 () Bool)

(assert (=> mapNonEmpty!8465 (= mapRes!8465 (and tp!18256 e!132335))))

(declare-fun mapKey!8465 () (_ BitVec 32))

(declare-datatypes ((V!6221 0))(
  ( (V!6222 (val!2510 Int)) )
))
(declare-datatypes ((ValueCell!2122 0))(
  ( (ValueCellFull!2122 (v!4480 V!6221)) (EmptyCell!2122) )
))
(declare-fun mapValue!8465 () ValueCell!2122)

(declare-fun mapRest!8465 () (Array (_ BitVec 32) ValueCell!2122))

(declare-datatypes ((array!9093 0))(
  ( (array!9094 (arr!4297 (Array (_ BitVec 32) ValueCell!2122)) (size!4622 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9093)

(assert (=> mapNonEmpty!8465 (= (arr!4297 _values!649) (store mapRest!8465 mapKey!8465 mapValue!8465))))

(declare-fun b!201979 () Bool)

(declare-fun res!96658 () Bool)

(assert (=> b!201979 (=> (not res!96658) (not e!132338))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!201979 (= res!96658 (= (select (arr!4296 _keys!825) i!601) k!843))))

(declare-fun b!201980 () Bool)

(declare-fun res!96662 () Bool)

(assert (=> b!201980 (=> (not res!96662) (not e!132338))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!201980 (= res!96662 (validKeyInArray!0 k!843))))

(declare-fun res!96660 () Bool)

(assert (=> start!20416 (=> (not res!96660) (not e!132338))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20416 (= res!96660 (validMask!0 mask!1149))))

(assert (=> start!20416 e!132338))

(declare-fun e!132341 () Bool)

(declare-fun array_inv!2835 (array!9093) Bool)

(assert (=> start!20416 (and (array_inv!2835 _values!649) e!132341)))

(assert (=> start!20416 true))

(declare-fun tp_is_empty!4931 () Bool)

(assert (=> start!20416 tp_is_empty!4931))

(declare-fun array_inv!2836 (array!9091) Bool)

(assert (=> start!20416 (array_inv!2836 _keys!825)))

(assert (=> start!20416 tp!18257))

(declare-fun b!201981 () Bool)

(declare-fun e!132340 () Bool)

(declare-fun e!132336 () Bool)

(assert (=> b!201981 (= e!132340 e!132336)))

(declare-fun res!96657 () Bool)

(assert (=> b!201981 (=> res!96657 e!132336)))

(assert (=> b!201981 (= res!96657 (= k!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3804 0))(
  ( (tuple2!3805 (_1!1913 (_ BitVec 64)) (_2!1913 V!6221)) )
))
(declare-datatypes ((List!2714 0))(
  ( (Nil!2711) (Cons!2710 (h!3352 tuple2!3804) (t!7645 List!2714)) )
))
(declare-datatypes ((ListLongMap!2717 0))(
  ( (ListLongMap!2718 (toList!1374 List!2714)) )
))
(declare-fun lt!101089 () ListLongMap!2717)

(declare-fun lt!101099 () ListLongMap!2717)

(assert (=> b!201981 (= lt!101089 lt!101099)))

(declare-fun lt!101103 () ListLongMap!2717)

(declare-fun lt!101100 () tuple2!3804)

(declare-fun +!401 (ListLongMap!2717 tuple2!3804) ListLongMap!2717)

(assert (=> b!201981 (= lt!101099 (+!401 lt!101103 lt!101100))))

(declare-fun lt!101102 () ListLongMap!2717)

(declare-datatypes ((Unit!6102 0))(
  ( (Unit!6103) )
))
(declare-fun lt!101092 () Unit!6102)

(declare-fun v!520 () V!6221)

(declare-fun zeroValue!615 () V!6221)

(declare-fun addCommutativeForDiffKeys!122 (ListLongMap!2717 (_ BitVec 64) V!6221 (_ BitVec 64) V!6221) Unit!6102)

(assert (=> b!201981 (= lt!101092 (addCommutativeForDiffKeys!122 lt!101102 k!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun lt!101095 () ListLongMap!2717)

(declare-fun lt!101090 () tuple2!3804)

(assert (=> b!201981 (= lt!101095 (+!401 lt!101089 lt!101090))))

(declare-fun lt!101088 () ListLongMap!2717)

(declare-fun lt!101094 () tuple2!3804)

(assert (=> b!201981 (= lt!101089 (+!401 lt!101088 lt!101094))))

(declare-fun lt!101098 () ListLongMap!2717)

(declare-fun lt!101097 () ListLongMap!2717)

(assert (=> b!201981 (= lt!101098 lt!101097)))

(assert (=> b!201981 (= lt!101097 (+!401 lt!101103 lt!101090))))

(assert (=> b!201981 (= lt!101103 (+!401 lt!101102 lt!101094))))

(declare-fun lt!101101 () ListLongMap!2717)

(assert (=> b!201981 (= lt!101095 (+!401 (+!401 lt!101101 lt!101094) lt!101090))))

(declare-fun minValue!615 () V!6221)

(assert (=> b!201981 (= lt!101090 (tuple2!3805 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(assert (=> b!201981 (= lt!101094 (tuple2!3805 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!201982 () Bool)

(declare-fun res!96656 () Bool)

(assert (=> b!201982 (=> (not res!96656) (not e!132338))))

(declare-datatypes ((List!2715 0))(
  ( (Nil!2712) (Cons!2711 (h!3353 (_ BitVec 64)) (t!7646 List!2715)) )
))
(declare-fun arrayNoDuplicates!0 (array!9091 (_ BitVec 32) List!2715) Bool)

(assert (=> b!201982 (= res!96656 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2712))))

(declare-fun b!201983 () Bool)

(assert (=> b!201983 (= e!132335 tp_is_empty!4931)))

(declare-fun b!201984 () Bool)

(declare-fun res!96663 () Bool)

(assert (=> b!201984 (=> (not res!96663) (not e!132338))))

(assert (=> b!201984 (= res!96663 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4621 _keys!825))))))

(declare-fun b!201985 () Bool)

(assert (=> b!201985 (= e!132338 (not e!132340))))

(declare-fun res!96664 () Bool)

(assert (=> b!201985 (=> res!96664 e!132340)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!201985 (= res!96664 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!958 (array!9091 array!9093 (_ BitVec 32) (_ BitVec 32) V!6221 V!6221 (_ BitVec 32) Int) ListLongMap!2717)

(assert (=> b!201985 (= lt!101098 (getCurrentListMap!958 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!101091 () array!9093)

(assert (=> b!201985 (= lt!101095 (getCurrentListMap!958 _keys!825 lt!101091 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201985 (and (= lt!101101 lt!101088) (= lt!101088 lt!101101))))

(assert (=> b!201985 (= lt!101088 (+!401 lt!101102 lt!101100))))

(assert (=> b!201985 (= lt!101100 (tuple2!3805 k!843 v!520))))

(declare-fun lt!101093 () Unit!6102)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!71 (array!9091 array!9093 (_ BitVec 32) (_ BitVec 32) V!6221 V!6221 (_ BitVec 32) (_ BitVec 64) V!6221 (_ BitVec 32) Int) Unit!6102)

(assert (=> b!201985 (= lt!101093 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!71 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!332 (array!9091 array!9093 (_ BitVec 32) (_ BitVec 32) V!6221 V!6221 (_ BitVec 32) Int) ListLongMap!2717)

(assert (=> b!201985 (= lt!101101 (getCurrentListMapNoExtraKeys!332 _keys!825 lt!101091 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!201985 (= lt!101091 (array!9094 (store (arr!4297 _values!649) i!601 (ValueCellFull!2122 v!520)) (size!4622 _values!649)))))

(assert (=> b!201985 (= lt!101102 (getCurrentListMapNoExtraKeys!332 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!201986 () Bool)

(declare-fun res!96659 () Bool)

(assert (=> b!201986 (=> (not res!96659) (not e!132338))))

(assert (=> b!201986 (= res!96659 (and (= (size!4622 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4621 _keys!825) (size!4622 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!201987 () Bool)

(declare-fun e!132337 () Bool)

(assert (=> b!201987 (= e!132337 tp_is_empty!4931)))

(declare-fun b!201988 () Bool)

(assert (=> b!201988 (= e!132336 true)))

(assert (=> b!201988 (= (+!401 lt!101099 lt!101090) (+!401 lt!101097 lt!101100))))

(declare-fun lt!101096 () Unit!6102)

(assert (=> b!201988 (= lt!101096 (addCommutativeForDiffKeys!122 lt!101103 k!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!201989 () Bool)

(assert (=> b!201989 (= e!132341 (and e!132337 mapRes!8465))))

(declare-fun condMapEmpty!8465 () Bool)

(declare-fun mapDefault!8465 () ValueCell!2122)

