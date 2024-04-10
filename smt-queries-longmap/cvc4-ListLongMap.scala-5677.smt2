; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73850 () Bool)

(assert start!73850)

(declare-fun b_free!14765 () Bool)

(declare-fun b_next!14765 () Bool)

(assert (=> start!73850 (= b_free!14765 (not b_next!14765))))

(declare-fun tp!51798 () Bool)

(declare-fun b_and!24509 () Bool)

(assert (=> start!73850 (= tp!51798 b_and!24509)))

(declare-fun b!867375 () Bool)

(declare-fun e!483158 () Bool)

(declare-fun tp_is_empty!16901 () Bool)

(assert (=> b!867375 (= e!483158 tp_is_empty!16901)))

(declare-fun mapNonEmpty!26951 () Bool)

(declare-fun mapRes!26951 () Bool)

(declare-fun tp!51799 () Bool)

(assert (=> mapNonEmpty!26951 (= mapRes!26951 (and tp!51799 e!483158))))

(declare-fun mapKey!26951 () (_ BitVec 32))

(declare-datatypes ((V!27581 0))(
  ( (V!27582 (val!8498 Int)) )
))
(declare-datatypes ((ValueCell!8011 0))(
  ( (ValueCellFull!8011 (v!10923 V!27581)) (EmptyCell!8011) )
))
(declare-fun mapValue!26951 () ValueCell!8011)

(declare-datatypes ((array!49962 0))(
  ( (array!49963 (arr!24012 (Array (_ BitVec 32) ValueCell!8011)) (size!24452 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!49962)

(declare-fun mapRest!26951 () (Array (_ BitVec 32) ValueCell!8011))

(assert (=> mapNonEmpty!26951 (= (arr!24012 _values!688) (store mapRest!26951 mapKey!26951 mapValue!26951))))

(declare-fun b!867376 () Bool)

(declare-fun res!589329 () Bool)

(declare-fun e!483155 () Bool)

(assert (=> b!867376 (=> (not res!589329) (not e!483155))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!49964 0))(
  ( (array!49965 (arr!24013 (Array (_ BitVec 32) (_ BitVec 64))) (size!24453 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49964)

(assert (=> b!867376 (= res!589329 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24453 _keys!868))))))

(declare-fun b!867377 () Bool)

(declare-fun res!589322 () Bool)

(assert (=> b!867377 (=> (not res!589322) (not e!483155))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!867377 (= res!589322 (and (= (select (arr!24013 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!867378 () Bool)

(declare-datatypes ((Unit!29754 0))(
  ( (Unit!29755) )
))
(declare-fun e!483160 () Unit!29754)

(declare-fun Unit!29756 () Unit!29754)

(assert (=> b!867378 (= e!483160 Unit!29756)))

(declare-fun lt!394023 () Unit!29754)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49964 (_ BitVec 32) (_ BitVec 32)) Unit!29754)

(assert (=> b!867378 (= lt!394023 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(declare-datatypes ((List!17073 0))(
  ( (Nil!17070) (Cons!17069 (h!18200 (_ BitVec 64)) (t!24104 List!17073)) )
))
(declare-fun arrayNoDuplicates!0 (array!49964 (_ BitVec 32) List!17073) Bool)

(assert (=> b!867378 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!17070)))

(declare-fun lt!394018 () Unit!29754)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49964 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29754)

(assert (=> b!867378 (= lt!394018 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49964 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!867378 (arrayContainsKey!0 _keys!868 k!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!394010 () Unit!29754)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49964 (_ BitVec 64) (_ BitVec 32) List!17073) Unit!29754)

(assert (=> b!867378 (= lt!394010 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k!854 from!1053 Nil!17070))))

(assert (=> b!867378 false))

(declare-fun b!867379 () Bool)

(declare-fun res!589326 () Bool)

(assert (=> b!867379 (=> (not res!589326) (not e!483155))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!867379 (= res!589326 (and (= (size!24452 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24453 _keys!868) (size!24452 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!589324 () Bool)

(assert (=> start!73850 (=> (not res!589324) (not e!483155))))

(assert (=> start!73850 (= res!589324 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24453 _keys!868))))))

(assert (=> start!73850 e!483155))

(assert (=> start!73850 tp_is_empty!16901))

(assert (=> start!73850 true))

(assert (=> start!73850 tp!51798))

(declare-fun array_inv!18974 (array!49964) Bool)

(assert (=> start!73850 (array_inv!18974 _keys!868)))

(declare-fun e!483157 () Bool)

(declare-fun array_inv!18975 (array!49962) Bool)

(assert (=> start!73850 (and (array_inv!18975 _values!688) e!483157)))

(declare-fun b!867380 () Bool)

(declare-fun res!589323 () Bool)

(assert (=> b!867380 (=> (not res!589323) (not e!483155))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!867380 (= res!589323 (validKeyInArray!0 k!854))))

(declare-fun b!867381 () Bool)

(declare-fun Unit!29757 () Unit!29754)

(assert (=> b!867381 (= e!483160 Unit!29757)))

(declare-fun b!867382 () Bool)

(declare-fun e!483156 () Bool)

(assert (=> b!867382 (= e!483157 (and e!483156 mapRes!26951))))

(declare-fun condMapEmpty!26951 () Bool)

(declare-fun mapDefault!26951 () ValueCell!8011)

