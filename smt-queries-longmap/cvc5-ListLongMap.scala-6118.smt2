; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78816 () Bool)

(assert start!78816)

(declare-fun b_free!17029 () Bool)

(declare-fun b_next!17029 () Bool)

(assert (=> start!78816 (= b_free!17029 (not b_next!17029))))

(declare-fun tp!59528 () Bool)

(declare-fun b_and!27795 () Bool)

(assert (=> start!78816 (= tp!59528 b_and!27795)))

(declare-fun b!920174 () Bool)

(declare-fun res!620506 () Bool)

(declare-fun e!516467 () Bool)

(assert (=> b!920174 (=> (not res!620506) (not e!516467))))

(declare-datatypes ((array!55054 0))(
  ( (array!55055 (arr!26472 (Array (_ BitVec 32) (_ BitVec 64))) (size!26931 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55054)

(declare-datatypes ((List!18565 0))(
  ( (Nil!18562) (Cons!18561 (h!19707 (_ BitVec 64)) (t!26324 List!18565)) )
))
(declare-fun arrayNoDuplicates!0 (array!55054 (_ BitVec 32) List!18565) Bool)

(assert (=> b!920174 (= res!620506 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18562))))

(declare-fun b!920175 () Bool)

(declare-fun res!620500 () Bool)

(declare-fun e!516464 () Bool)

(assert (=> b!920175 (=> (not res!620500) (not e!516464))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-datatypes ((V!31015 0))(
  ( (V!31016 (val!9819 Int)) )
))
(declare-fun v!791 () V!31015)

(declare-datatypes ((tuple2!12762 0))(
  ( (tuple2!12763 (_1!6392 (_ BitVec 64)) (_2!6392 V!31015)) )
))
(declare-datatypes ((List!18566 0))(
  ( (Nil!18563) (Cons!18562 (h!19708 tuple2!12762) (t!26325 List!18566)) )
))
(declare-datatypes ((ListLongMap!11459 0))(
  ( (ListLongMap!11460 (toList!5745 List!18566)) )
))
(declare-fun lt!413085 () ListLongMap!11459)

(declare-fun apply!587 (ListLongMap!11459 (_ BitVec 64)) V!31015)

(assert (=> b!920175 (= res!620500 (= (apply!587 lt!413085 k!1099) v!791))))

(declare-fun b!920176 () Bool)

(declare-fun res!620503 () Bool)

(assert (=> b!920176 (=> (not res!620503) (not e!516467))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55054 (_ BitVec 32)) Bool)

(assert (=> b!920176 (= res!620503 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!920177 () Bool)

(declare-fun res!620508 () Bool)

(assert (=> b!920177 (=> (not res!620508) (not e!516464))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!920177 (= res!620508 (validKeyInArray!0 k!1099))))

(declare-fun b!920178 () Bool)

(declare-fun e!516469 () Bool)

(declare-fun e!516466 () Bool)

(declare-fun mapRes!31062 () Bool)

(assert (=> b!920178 (= e!516469 (and e!516466 mapRes!31062))))

(declare-fun condMapEmpty!31062 () Bool)

(declare-datatypes ((ValueCell!9287 0))(
  ( (ValueCellFull!9287 (v!12337 V!31015)) (EmptyCell!9287) )
))
(declare-datatypes ((array!55056 0))(
  ( (array!55057 (arr!26473 (Array (_ BitVec 32) ValueCell!9287)) (size!26932 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55056)

(declare-fun mapDefault!31062 () ValueCell!9287)

