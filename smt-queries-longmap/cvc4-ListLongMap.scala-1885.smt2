; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33748 () Bool)

(assert start!33748)

(declare-fun b_free!6983 () Bool)

(declare-fun b_next!6983 () Bool)

(assert (=> start!33748 (= b_free!6983 (not b_next!6983))))

(declare-fun tp!24453 () Bool)

(declare-fun b_and!14163 () Bool)

(assert (=> start!33748 (= tp!24453 b_and!14163)))

(declare-fun b!335724 () Bool)

(declare-fun res!185313 () Bool)

(declare-fun e!206085 () Bool)

(assert (=> b!335724 (=> (not res!185313) (not e!206085))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!335724 (= res!185313 (validKeyInArray!0 k!1348))))

(declare-fun b!335725 () Bool)

(declare-fun e!206088 () Bool)

(assert (=> b!335725 (= e!206088 (not true))))

(declare-datatypes ((V!10223 0))(
  ( (V!10224 (val!3512 Int)) )
))
(declare-datatypes ((tuple2!5104 0))(
  ( (tuple2!5105 (_1!2563 (_ BitVec 64)) (_2!2563 V!10223)) )
))
(declare-datatypes ((List!4721 0))(
  ( (Nil!4718) (Cons!4717 (h!5573 tuple2!5104) (t!9809 List!4721)) )
))
(declare-datatypes ((ListLongMap!4017 0))(
  ( (ListLongMap!4018 (toList!2024 List!4721)) )
))
(declare-fun lt!159937 () ListLongMap!4017)

(declare-datatypes ((array!17463 0))(
  ( (array!17464 (arr!8262 (Array (_ BitVec 32) (_ BitVec 64))) (size!8614 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17463)

(declare-datatypes ((SeekEntryResult!3195 0))(
  ( (MissingZero!3195 (index!14959 (_ BitVec 32))) (Found!3195 (index!14960 (_ BitVec 32))) (Intermediate!3195 (undefined!4007 Bool) (index!14961 (_ BitVec 32)) (x!33457 (_ BitVec 32))) (Undefined!3195) (MissingVacant!3195 (index!14962 (_ BitVec 32))) )
))
(declare-fun lt!159934 () SeekEntryResult!3195)

(declare-fun contains!2068 (ListLongMap!4017 (_ BitVec 64)) Bool)

(assert (=> b!335725 (contains!2068 lt!159937 (select (arr!8262 _keys!1895) (index!14960 lt!159934)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10223)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3124 0))(
  ( (ValueCellFull!3124 (v!5674 V!10223)) (EmptyCell!3124) )
))
(declare-datatypes ((array!17465 0))(
  ( (array!17466 (arr!8263 (Array (_ BitVec 32) ValueCell!3124)) (size!8615 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17465)

(declare-datatypes ((Unit!10453 0))(
  ( (Unit!10454) )
))
(declare-fun lt!159936 () Unit!10453)

(declare-fun minValue!1467 () V!10223)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun lemmaValidKeyInArrayIsInListMap!173 (array!17463 array!17465 (_ BitVec 32) (_ BitVec 32) V!10223 V!10223 (_ BitVec 32) Int) Unit!10453)

(assert (=> b!335725 (= lt!159936 (lemmaValidKeyInArrayIsInListMap!173 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14960 lt!159934) defaultEntry!1528))))

(declare-fun arrayContainsKey!0 (array!17463 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335725 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159935 () Unit!10453)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17463 (_ BitVec 64) (_ BitVec 32)) Unit!10453)

(assert (=> b!335725 (= lt!159935 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14960 lt!159934)))))

(declare-fun b!335726 () Bool)

(declare-fun res!185315 () Bool)

(assert (=> b!335726 (=> (not res!185315) (not e!206085))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17463 (_ BitVec 32)) Bool)

(assert (=> b!335726 (= res!185315 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun mapIsEmpty!11799 () Bool)

(declare-fun mapRes!11799 () Bool)

(assert (=> mapIsEmpty!11799 mapRes!11799))

(declare-fun res!185308 () Bool)

(assert (=> start!33748 (=> (not res!185308) (not e!206085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!33748 (= res!185308 (validMask!0 mask!2385))))

(assert (=> start!33748 e!206085))

(assert (=> start!33748 true))

(declare-fun tp_is_empty!6935 () Bool)

(assert (=> start!33748 tp_is_empty!6935))

(assert (=> start!33748 tp!24453))

(declare-fun e!206086 () Bool)

(declare-fun array_inv!6136 (array!17465) Bool)

(assert (=> start!33748 (and (array_inv!6136 _values!1525) e!206086)))

(declare-fun array_inv!6137 (array!17463) Bool)

(assert (=> start!33748 (array_inv!6137 _keys!1895)))

(declare-fun b!335727 () Bool)

(declare-fun e!206087 () Bool)

(assert (=> b!335727 (= e!206087 e!206088)))

(declare-fun res!185312 () Bool)

(assert (=> b!335727 (=> (not res!185312) (not e!206088))))

(assert (=> b!335727 (= res!185312 (and (is-Found!3195 lt!159934) (= (select (arr!8262 _keys!1895) (index!14960 lt!159934)) k!1348)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17463 (_ BitVec 32)) SeekEntryResult!3195)

(assert (=> b!335727 (= lt!159934 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!335728 () Bool)

(declare-fun e!206091 () Bool)

(assert (=> b!335728 (= e!206086 (and e!206091 mapRes!11799))))

(declare-fun condMapEmpty!11799 () Bool)

(declare-fun mapDefault!11799 () ValueCell!3124)

