; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!74738 () Bool)

(assert start!74738)

(declare-fun b_free!15365 () Bool)

(declare-fun b_next!15365 () Bool)

(assert (=> start!74738 (= b_free!15365 (not b_next!15365))))

(declare-fun tp!53785 () Bool)

(declare-fun b_and!25365 () Bool)

(assert (=> start!74738 (= tp!53785 b_and!25365)))

(declare-fun e!490378 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun b!881185 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!51344 0))(
  ( (array!51345 (arr!24695 (Array (_ BitVec 32) (_ BitVec 64))) (size!25135 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!51344)

(declare-fun arrayContainsKey!0 (array!51344 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!881185 (= e!490378 (arrayContainsKey!0 _keys!868 k!854 i!612))))

(declare-fun b!881186 () Bool)

(declare-fun res!598688 () Bool)

(declare-fun e!490382 () Bool)

(assert (=> b!881186 (=> (not res!598688) (not e!490382))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!881186 (= res!598688 (validKeyInArray!0 k!854))))

(declare-fun b!881187 () Bool)

(declare-fun e!490379 () Bool)

(declare-fun e!490381 () Bool)

(assert (=> b!881187 (= e!490379 (not e!490381))))

(declare-fun res!598692 () Bool)

(assert (=> b!881187 (=> res!598692 e!490381)))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!881187 (= res!598692 (not (validKeyInArray!0 (select (arr!24695 _keys!868) from!1053))))))

(declare-datatypes ((V!28525 0))(
  ( (V!28526 (val!8852 Int)) )
))
(declare-datatypes ((tuple2!11716 0))(
  ( (tuple2!11717 (_1!5869 (_ BitVec 64)) (_2!5869 V!28525)) )
))
(declare-datatypes ((List!17531 0))(
  ( (Nil!17528) (Cons!17527 (h!18658 tuple2!11716) (t!24698 List!17531)) )
))
(declare-datatypes ((ListLongMap!10485 0))(
  ( (ListLongMap!10486 (toList!5258 List!17531)) )
))
(declare-fun lt!398522 () ListLongMap!10485)

(declare-fun lt!398523 () ListLongMap!10485)

(assert (=> b!881187 (= lt!398522 lt!398523)))

(declare-fun v!557 () V!28525)

(declare-fun lt!398529 () ListLongMap!10485)

(declare-fun +!2530 (ListLongMap!10485 tuple2!11716) ListLongMap!10485)

(assert (=> b!881187 (= lt!398523 (+!2530 lt!398529 (tuple2!11717 k!854 v!557)))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((ValueCell!8365 0))(
  ( (ValueCellFull!8365 (v!11304 V!28525)) (EmptyCell!8365) )
))
(declare-datatypes ((array!51346 0))(
  ( (array!51347 (arr!24696 (Array (_ BitVec 32) ValueCell!8365)) (size!25136 (_ BitVec 32))) )
))
(declare-fun lt!398525 () array!51346)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!28525)

(declare-fun zeroValue!654 () V!28525)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!3221 (array!51344 array!51346 (_ BitVec 32) (_ BitVec 32) V!28525 V!28525 (_ BitVec 32) Int) ListLongMap!10485)

(assert (=> b!881187 (= lt!398522 (getCurrentListMapNoExtraKeys!3221 _keys!868 lt!398525 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun _values!688 () array!51346)

(assert (=> b!881187 (= lt!398529 (getCurrentListMapNoExtraKeys!3221 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!30078 0))(
  ( (Unit!30079) )
))
(declare-fun lt!398524 () Unit!30078)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!719 (array!51344 array!51346 (_ BitVec 32) (_ BitVec 32) V!28525 V!28525 (_ BitVec 32) (_ BitVec 64) V!28525 (_ BitVec 32) Int) Unit!30078)

(assert (=> b!881187 (= lt!398524 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!719 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!881188 () Bool)

(declare-fun res!598691 () Bool)

(assert (=> b!881188 (=> (not res!598691) (not e!490382))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51344 (_ BitVec 32)) Bool)

(assert (=> b!881188 (= res!598691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!881189 () Bool)

(declare-fun res!598689 () Bool)

(assert (=> b!881189 (=> (not res!598689) (not e!490382))))

(assert (=> b!881189 (= res!598689 (and (= (select (arr!24695 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!881190 () Bool)

(declare-fun e!490380 () Bool)

(declare-fun tp_is_empty!17609 () Bool)

(assert (=> b!881190 (= e!490380 tp_is_empty!17609)))

(declare-fun b!881191 () Bool)

(declare-fun res!598694 () Bool)

(assert (=> b!881191 (=> (not res!598694) (not e!490382))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!881191 (= res!598694 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!28038 () Bool)

(declare-fun mapRes!28038 () Bool)

(assert (=> mapIsEmpty!28038 mapRes!28038))

(declare-fun b!881193 () Bool)

(declare-fun e!490385 () Bool)

(declare-fun e!490383 () Bool)

(assert (=> b!881193 (= e!490385 (and e!490383 mapRes!28038))))

(declare-fun condMapEmpty!28038 () Bool)

(declare-fun mapDefault!28038 () ValueCell!8365)

