; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73540 () Bool)

(assert start!73540)

(declare-fun b_free!14455 () Bool)

(declare-fun b_next!14455 () Bool)

(assert (=> start!73540 (= b_free!14455 (not b_next!14455))))

(declare-fun tp!50869 () Bool)

(declare-fun b_and!23889 () Bool)

(assert (=> start!73540 (= tp!50869 b_and!23889)))

(declare-fun b!859654 () Bool)

(declare-fun res!584126 () Bool)

(declare-fun e!479060 () Bool)

(assert (=> b!859654 (=> (not res!584126) (not e!479060))))

(declare-datatypes ((array!49358 0))(
  ( (array!49359 (arr!23710 (Array (_ BitVec 32) (_ BitVec 64))) (size!24150 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49358)

(declare-datatypes ((List!16827 0))(
  ( (Nil!16824) (Cons!16823 (h!17954 (_ BitVec 64)) (t!23548 List!16827)) )
))
(declare-fun arrayNoDuplicates!0 (array!49358 (_ BitVec 32) List!16827) Bool)

(assert (=> b!859654 (= res!584126 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16824))))

(declare-fun b!859655 () Bool)

(declare-fun res!584114 () Bool)

(declare-fun e!479058 () Bool)

(assert (=> b!859655 (=> res!584114 e!479058)))

(declare-fun noDuplicate!1304 (List!16827) Bool)

(assert (=> b!859655 (= res!584114 (not (noDuplicate!1304 Nil!16824)))))

(declare-fun b!859656 () Bool)

(declare-fun res!584113 () Bool)

(assert (=> b!859656 (=> res!584113 e!479058)))

(declare-fun contains!4222 (List!16827 (_ BitVec 64)) Bool)

(assert (=> b!859656 (= res!584113 (contains!4222 Nil!16824 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapNonEmpty!26486 () Bool)

(declare-fun mapRes!26486 () Bool)

(declare-fun tp!50868 () Bool)

(declare-fun e!479065 () Bool)

(assert (=> mapNonEmpty!26486 (= mapRes!26486 (and tp!50868 e!479065))))

(declare-fun mapKey!26486 () (_ BitVec 32))

(declare-datatypes ((V!27169 0))(
  ( (V!27170 (val!8343 Int)) )
))
(declare-datatypes ((ValueCell!7856 0))(
  ( (ValueCellFull!7856 (v!10768 V!27169)) (EmptyCell!7856) )
))
(declare-fun mapRest!26486 () (Array (_ BitVec 32) ValueCell!7856))

(declare-fun mapValue!26486 () ValueCell!7856)

(declare-datatypes ((array!49360 0))(
  ( (array!49361 (arr!23711 (Array (_ BitVec 32) ValueCell!7856)) (size!24151 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49360)

(assert (=> mapNonEmpty!26486 (= (arr!23711 _values!688) (store mapRest!26486 mapKey!26486 mapValue!26486))))

(declare-fun res!584122 () Bool)

(assert (=> start!73540 (=> (not res!584122) (not e!479060))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73540 (= res!584122 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24150 _keys!868))))))

(assert (=> start!73540 e!479060))

(declare-fun tp_is_empty!16591 () Bool)

(assert (=> start!73540 tp_is_empty!16591))

(assert (=> start!73540 true))

(assert (=> start!73540 tp!50869))

(declare-fun array_inv!18770 (array!49358) Bool)

(assert (=> start!73540 (array_inv!18770 _keys!868)))

(declare-fun e!479061 () Bool)

(declare-fun array_inv!18771 (array!49360) Bool)

(assert (=> start!73540 (and (array_inv!18771 _values!688) e!479061)))

(declare-fun b!859657 () Bool)

(declare-fun res!584118 () Bool)

(assert (=> b!859657 (=> (not res!584118) (not e!479060))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!859657 (= res!584118 (validKeyInArray!0 k!854))))

(declare-fun b!859658 () Bool)

(assert (=> b!859658 (= e!479065 tp_is_empty!16591)))

(declare-fun b!859659 () Bool)

(declare-fun e!479059 () Bool)

(declare-fun e!479057 () Bool)

(assert (=> b!859659 (= e!479059 e!479057)))

(declare-fun res!584120 () Bool)

(assert (=> b!859659 (=> res!584120 e!479057)))

(assert (=> b!859659 (= res!584120 (not (= (select (arr!23710 _keys!868) from!1053) k!854)))))

(declare-datatypes ((tuple2!11018 0))(
  ( (tuple2!11019 (_1!5520 (_ BitVec 64)) (_2!5520 V!27169)) )
))
(declare-datatypes ((List!16828 0))(
  ( (Nil!16825) (Cons!16824 (h!17955 tuple2!11018) (t!23549 List!16828)) )
))
(declare-datatypes ((ListLongMap!9787 0))(
  ( (ListLongMap!9788 (toList!4909 List!16828)) )
))
(declare-fun lt!387393 () ListLongMap!9787)

(declare-fun defaultEntry!696 () Int)

(declare-fun lt!387386 () ListLongMap!9787)

(declare-fun +!2262 (ListLongMap!9787 tuple2!11018) ListLongMap!9787)

(declare-fun get!12496 (ValueCell!7856 V!27169) V!27169)

(declare-fun dynLambda!1100 (Int (_ BitVec 64)) V!27169)

(assert (=> b!859659 (= lt!387393 (+!2262 lt!387386 (tuple2!11019 (select (arr!23710 _keys!868) from!1053) (get!12496 (select (arr!23711 _values!688) from!1053) (dynLambda!1100 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!859660 () Bool)

(declare-fun e!479062 () Bool)

(assert (=> b!859660 (= e!479061 (and e!479062 mapRes!26486))))

(declare-fun condMapEmpty!26486 () Bool)

(declare-fun mapDefault!26486 () ValueCell!7856)

