; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!99074 () Bool)

(assert start!99074)

(declare-fun b_free!24679 () Bool)

(declare-fun b_next!24679 () Bool)

(assert (=> start!99074 (= b_free!24679 (not b_next!24679))))

(declare-fun tp!86747 () Bool)

(declare-fun b_and!40207 () Bool)

(assert (=> start!99074 (= tp!86747 b_and!40207)))

(declare-fun b!1165062 () Bool)

(declare-fun res!772652 () Bool)

(declare-fun e!662360 () Bool)

(assert (=> b!1165062 (=> (not res!772652) (not e!662360))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1165062 (= res!772652 (validMask!0 mask!1564))))

(declare-fun b!1165063 () Bool)

(declare-fun e!662358 () Bool)

(declare-fun tp_is_empty!29209 () Bool)

(assert (=> b!1165063 (= e!662358 tp_is_empty!29209)))

(declare-fun b!1165064 () Bool)

(declare-fun res!772658 () Bool)

(assert (=> b!1165064 (=> (not res!772658) (not e!662360))))

(declare-datatypes ((array!75249 0))(
  ( (array!75250 (arr!36275 (Array (_ BitVec 32) (_ BitVec 64))) (size!36811 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75249)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75249 (_ BitVec 32)) Bool)

(assert (=> b!1165064 (= res!772658 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1165065 () Bool)

(declare-fun e!662363 () Bool)

(assert (=> b!1165065 (= e!662360 e!662363)))

(declare-fun res!772656 () Bool)

(assert (=> b!1165065 (=> (not res!772656) (not e!662363))))

(declare-fun lt!524809 () array!75249)

(assert (=> b!1165065 (= res!772656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!524809 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1165065 (= lt!524809 (array!75250 (store (arr!36275 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!36811 _keys!1208)))))

(declare-fun res!772650 () Bool)

(assert (=> start!99074 (=> (not res!772650) (not e!662360))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99074 (= res!772650 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!36811 _keys!1208))))))

(assert (=> start!99074 e!662360))

(assert (=> start!99074 tp_is_empty!29209))

(declare-fun array_inv!27748 (array!75249) Bool)

(assert (=> start!99074 (array_inv!27748 _keys!1208)))

(assert (=> start!99074 true))

(assert (=> start!99074 tp!86747))

(declare-datatypes ((V!44073 0))(
  ( (V!44074 (val!14661 Int)) )
))
(declare-datatypes ((ValueCell!13895 0))(
  ( (ValueCellFull!13895 (v!17298 V!44073)) (EmptyCell!13895) )
))
(declare-datatypes ((array!75251 0))(
  ( (array!75252 (arr!36276 (Array (_ BitVec 32) ValueCell!13895)) (size!36812 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75251)

(declare-fun e!662359 () Bool)

(declare-fun array_inv!27749 (array!75251) Bool)

(assert (=> start!99074 (and (array_inv!27749 _values!996) e!662359)))

(declare-fun mapNonEmpty!45638 () Bool)

(declare-fun mapRes!45638 () Bool)

(declare-fun tp!86748 () Bool)

(declare-fun e!662364 () Bool)

(assert (=> mapNonEmpty!45638 (= mapRes!45638 (and tp!86748 e!662364))))

(declare-fun mapKey!45638 () (_ BitVec 32))

(declare-fun mapValue!45638 () ValueCell!13895)

(declare-fun mapRest!45638 () (Array (_ BitVec 32) ValueCell!13895))

(assert (=> mapNonEmpty!45638 (= (arr!36276 _values!996) (store mapRest!45638 mapKey!45638 mapValue!45638))))

(declare-fun b!1165066 () Bool)

(declare-fun e!662362 () Bool)

(assert (=> b!1165066 (= e!662362 true)))

(declare-fun zeroValue!944 () V!44073)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18696 0))(
  ( (tuple2!18697 (_1!9359 (_ BitVec 64)) (_2!9359 V!44073)) )
))
(declare-datatypes ((List!25430 0))(
  ( (Nil!25427) (Cons!25426 (h!26635 tuple2!18696) (t!37101 List!25430)) )
))
(declare-datatypes ((ListLongMap!16665 0))(
  ( (ListLongMap!16666 (toList!8348 List!25430)) )
))
(declare-fun lt!524810 () ListLongMap!16665)

(declare-fun minValue!944 () V!44073)

(declare-fun getCurrentListMapNoExtraKeys!4812 (array!75249 array!75251 (_ BitVec 32) (_ BitVec 32) V!44073 V!44073 (_ BitVec 32) Int) ListLongMap!16665)

(declare-fun dynLambda!2802 (Int (_ BitVec 64)) V!44073)

(assert (=> b!1165066 (= lt!524810 (getCurrentListMapNoExtraKeys!4812 lt!524809 (array!75252 (store (arr!36276 _values!996) i!673 (ValueCellFull!13895 (dynLambda!2802 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!36812 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!524811 () ListLongMap!16665)

(assert (=> b!1165066 (= lt!524811 (getCurrentListMapNoExtraKeys!4812 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1165067 () Bool)

(declare-fun res!772651 () Bool)

(assert (=> b!1165067 (=> (not res!772651) (not e!662360))))

(declare-datatypes ((List!25431 0))(
  ( (Nil!25428) (Cons!25427 (h!26636 (_ BitVec 64)) (t!37102 List!25431)) )
))
(declare-fun arrayNoDuplicates!0 (array!75249 (_ BitVec 32) List!25431) Bool)

(assert (=> b!1165067 (= res!772651 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25428))))

(declare-fun mapIsEmpty!45638 () Bool)

(assert (=> mapIsEmpty!45638 mapRes!45638))

(declare-fun b!1165068 () Bool)

(declare-fun res!772655 () Bool)

(assert (=> b!1165068 (=> (not res!772655) (not e!662360))))

(declare-fun k!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1165068 (= res!772655 (validKeyInArray!0 k!934))))

(declare-fun b!1165069 () Bool)

(declare-fun res!772653 () Bool)

(assert (=> b!1165069 (=> (not res!772653) (not e!662360))))

(assert (=> b!1165069 (= res!772653 (and (= (size!36812 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!36811 _keys!1208) (size!36812 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1165070 () Bool)

(declare-fun res!772649 () Bool)

(assert (=> b!1165070 (=> (not res!772649) (not e!662360))))

(assert (=> b!1165070 (= res!772649 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!36811 _keys!1208))))))

(declare-fun b!1165071 () Bool)

(assert (=> b!1165071 (= e!662359 (and e!662358 mapRes!45638))))

(declare-fun condMapEmpty!45638 () Bool)

(declare-fun mapDefault!45638 () ValueCell!13895)

