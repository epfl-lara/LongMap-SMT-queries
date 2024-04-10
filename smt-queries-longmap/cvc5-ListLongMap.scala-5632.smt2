; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73576 () Bool)

(assert start!73576)

(declare-fun b_free!14491 () Bool)

(declare-fun b_next!14491 () Bool)

(assert (=> start!73576 (= b_free!14491 (not b_next!14491))))

(declare-fun tp!50976 () Bool)

(declare-fun b_and!23961 () Bool)

(assert (=> start!73576 (= tp!50976 b_and!23961)))

(declare-fun b!860608 () Bool)

(declare-fun e!479543 () Bool)

(declare-fun e!479549 () Bool)

(assert (=> b!860608 (= e!479543 e!479549)))

(declare-fun res!584873 () Bool)

(assert (=> b!860608 (=> res!584873 e!479549)))

(declare-datatypes ((array!49430 0))(
  ( (array!49431 (arr!23746 (Array (_ BitVec 32) (_ BitVec 64))) (size!24186 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49430)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!860608 (= res!584873 (or (bvsge (size!24186 _keys!868) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) (size!24186 _keys!868)) (bvsge from!1053 (size!24186 _keys!868))))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!49430 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!860608 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((Unit!29339 0))(
  ( (Unit!29340) )
))
(declare-fun lt!387933 () Unit!29339)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49430 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29339)

(assert (=> b!860608 (= lt!387933 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-datatypes ((List!16860 0))(
  ( (Nil!16857) (Cons!16856 (h!17987 (_ BitVec 64)) (t!23617 List!16860)) )
))
(declare-fun arrayNoDuplicates!0 (array!49430 (_ BitVec 32) List!16860) Bool)

(assert (=> b!860608 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16857)))

(declare-fun lt!387928 () Unit!29339)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49430 (_ BitVec 32) (_ BitVec 32)) Unit!29339)

(assert (=> b!860608 (= lt!387928 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-fun b!860609 () Bool)

(declare-fun res!584872 () Bool)

(declare-fun e!479545 () Bool)

(assert (=> b!860609 (=> (not res!584872) (not e!479545))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!27217 0))(
  ( (V!27218 (val!8361 Int)) )
))
(declare-datatypes ((ValueCell!7874 0))(
  ( (ValueCellFull!7874 (v!10786 V!27217)) (EmptyCell!7874) )
))
(declare-datatypes ((array!49432 0))(
  ( (array!49433 (arr!23747 (Array (_ BitVec 32) ValueCell!7874)) (size!24187 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49432)

(assert (=> b!860609 (= res!584872 (and (= (size!24187 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24186 _keys!868) (size!24187 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!860610 () Bool)

(declare-fun res!584881 () Bool)

(assert (=> b!860610 (=> (not res!584881) (not e!479545))))

(assert (=> b!860610 (= res!584881 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24186 _keys!868))))))

(declare-fun mapIsEmpty!26540 () Bool)

(declare-fun mapRes!26540 () Bool)

(assert (=> mapIsEmpty!26540 mapRes!26540))

(declare-fun b!860611 () Bool)

(declare-fun e!479547 () Bool)

(declare-fun e!479550 () Bool)

(assert (=> b!860611 (= e!479547 (and e!479550 mapRes!26540))))

(declare-fun condMapEmpty!26540 () Bool)

(declare-fun mapDefault!26540 () ValueCell!7874)

