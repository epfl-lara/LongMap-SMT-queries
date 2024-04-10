; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99416 () Bool)

(assert start!99416)

(declare-fun b_free!24995 () Bool)

(declare-fun b_next!24995 () Bool)

(assert (=> start!99416 (= b_free!24995 (not b_next!24995))))

(declare-fun tp!87699 () Bool)

(declare-fun b_and!40857 () Bool)

(assert (=> start!99416 (= tp!87699 b_and!40857)))

(declare-fun b!1173789 () Bool)

(declare-fun res!779447 () Bool)

(declare-fun e!667189 () Bool)

(assert (=> b!1173789 (=> (not res!779447) (not e!667189))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((array!75861 0))(
  ( (array!75862 (arr!36580 (Array (_ BitVec 32) (_ BitVec 64))) (size!37116 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75861)

(assert (=> b!1173789 (= res!779447 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37116 _keys!1208))))))

(declare-fun b!1173790 () Bool)

(declare-datatypes ((Unit!38712 0))(
  ( (Unit!38713) )
))
(declare-fun e!667196 () Unit!38712)

(declare-fun Unit!38714 () Unit!38712)

(assert (=> b!1173790 (= e!667196 Unit!38714)))

(declare-fun mapNonEmpty!46115 () Bool)

(declare-fun mapRes!46115 () Bool)

(declare-fun tp!87698 () Bool)

(declare-fun e!667197 () Bool)

(assert (=> mapNonEmpty!46115 (= mapRes!46115 (and tp!87698 e!667197))))

(declare-datatypes ((V!44493 0))(
  ( (V!44494 (val!14819 Int)) )
))
(declare-datatypes ((ValueCell!14053 0))(
  ( (ValueCellFull!14053 (v!17457 V!44493)) (EmptyCell!14053) )
))
(declare-fun mapValue!46115 () ValueCell!14053)

(declare-fun mapKey!46115 () (_ BitVec 32))

(declare-datatypes ((array!75863 0))(
  ( (array!75864 (arr!36581 (Array (_ BitVec 32) ValueCell!14053)) (size!37117 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75863)

(declare-fun mapRest!46115 () (Array (_ BitVec 32) ValueCell!14053))

(assert (=> mapNonEmpty!46115 (= (arr!36581 _values!996) (store mapRest!46115 mapKey!46115 mapValue!46115))))

(declare-fun res!779455 () Bool)

(assert (=> start!99416 (=> (not res!779455) (not e!667189))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99416 (= res!779455 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37116 _keys!1208))))))

(assert (=> start!99416 e!667189))

(declare-fun tp_is_empty!29525 () Bool)

(assert (=> start!99416 tp_is_empty!29525))

(declare-fun array_inv!27948 (array!75861) Bool)

(assert (=> start!99416 (array_inv!27948 _keys!1208)))

(assert (=> start!99416 true))

(assert (=> start!99416 tp!87699))

(declare-fun e!667195 () Bool)

(declare-fun array_inv!27949 (array!75863) Bool)

(assert (=> start!99416 (and (array_inv!27949 _values!996) e!667195)))

(declare-fun b!1173791 () Bool)

(declare-fun e!667193 () Bool)

(assert (=> b!1173791 (= e!667193 true)))

(declare-fun k!934 () (_ BitVec 64))

(assert (=> b!1173791 (not (= (select (arr!36580 _keys!1208) from!1455) k!934))))

(declare-fun lt!529173 () Unit!38712)

(assert (=> b!1173791 (= lt!529173 e!667196)))

(declare-fun c!116616 () Bool)

(assert (=> b!1173791 (= c!116616 (= (select (arr!36580 _keys!1208) from!1455) k!934))))

(declare-fun e!667198 () Bool)

(assert (=> b!1173791 e!667198))

(declare-fun res!779448 () Bool)

(assert (=> b!1173791 (=> (not res!779448) (not e!667198))))

(declare-fun lt!529171 () V!44493)

(declare-datatypes ((tuple2!18940 0))(
  ( (tuple2!18941 (_1!9481 (_ BitVec 64)) (_2!9481 V!44493)) )
))
(declare-datatypes ((List!25677 0))(
  ( (Nil!25674) (Cons!25673 (h!26882 tuple2!18940) (t!37664 List!25677)) )
))
(declare-datatypes ((ListLongMap!16909 0))(
  ( (ListLongMap!16910 (toList!8470 List!25677)) )
))
(declare-fun lt!529175 () ListLongMap!16909)

(declare-fun lt!529174 () ListLongMap!16909)

(declare-fun +!3788 (ListLongMap!16909 tuple2!18940) ListLongMap!16909)

(declare-fun get!18666 (ValueCell!14053 V!44493) V!44493)

(assert (=> b!1173791 (= res!779448 (= lt!529174 (+!3788 lt!529175 (tuple2!18941 (select (arr!36580 _keys!1208) from!1455) (get!18666 (select (arr!36581 _values!996) from!1455) lt!529171)))))))

(declare-fun b!1173792 () Bool)

(declare-fun res!779449 () Bool)

(assert (=> b!1173792 (=> (not res!779449) (not e!667189))))

(declare-datatypes ((List!25678 0))(
  ( (Nil!25675) (Cons!25674 (h!26883 (_ BitVec 64)) (t!37665 List!25678)) )
))
(declare-fun arrayNoDuplicates!0 (array!75861 (_ BitVec 32) List!25678) Bool)

(assert (=> b!1173792 (= res!779449 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25675))))

(declare-fun b!1173793 () Bool)

(declare-fun res!779451 () Bool)

(assert (=> b!1173793 (=> (not res!779451) (not e!667189))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173793 (= res!779451 (validMask!0 mask!1564))))

(declare-fun b!1173794 () Bool)

(declare-fun res!779457 () Bool)

(declare-fun e!667194 () Bool)

(assert (=> b!1173794 (=> (not res!779457) (not e!667194))))

(declare-fun lt!529167 () array!75861)

(assert (=> b!1173794 (= res!779457 (arrayNoDuplicates!0 lt!529167 #b00000000000000000000000000000000 Nil!25675))))

(declare-fun b!1173795 () Bool)

(declare-fun res!779453 () Bool)

(assert (=> b!1173795 (=> (not res!779453) (not e!667189))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75861 (_ BitVec 32)) Bool)

(assert (=> b!1173795 (= res!779453 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!46115 () Bool)

(assert (=> mapIsEmpty!46115 mapRes!46115))

(declare-fun b!1173796 () Bool)

(declare-fun e!667191 () Bool)

(assert (=> b!1173796 (= e!667194 (not e!667191))))

(declare-fun res!779458 () Bool)

(assert (=> b!1173796 (=> res!779458 e!667191)))

(assert (=> b!1173796 (= res!779458 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75861 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173796 (arrayContainsKey!0 _keys!1208 k!934 #b00000000000000000000000000000000)))

(declare-fun lt!529164 () Unit!38712)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75861 (_ BitVec 64) (_ BitVec 32)) Unit!38712)

(assert (=> b!1173796 (= lt!529164 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k!934 i!673))))

(declare-fun b!1173797 () Bool)

(assert (=> b!1173797 (= e!667197 tp_is_empty!29525)))

(declare-fun b!1173798 () Bool)

(declare-fun res!779452 () Bool)

(assert (=> b!1173798 (=> (not res!779452) (not e!667189))))

(assert (=> b!1173798 (= res!779452 (= (select (arr!36580 _keys!1208) i!673) k!934))))

(declare-fun b!1173799 () Bool)

(assert (=> b!1173799 (= e!667189 e!667194)))

(declare-fun res!779454 () Bool)

(assert (=> b!1173799 (=> (not res!779454) (not e!667194))))

(assert (=> b!1173799 (= res!779454 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529167 mask!1564))))

(assert (=> b!1173799 (= lt!529167 (array!75862 (store (arr!36580 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37116 _keys!1208)))))

(declare-fun b!1173800 () Bool)

(declare-fun e!667190 () Bool)

(assert (=> b!1173800 (= e!667195 (and e!667190 mapRes!46115))))

(declare-fun condMapEmpty!46115 () Bool)

(declare-fun mapDefault!46115 () ValueCell!14053)

