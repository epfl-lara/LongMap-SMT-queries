; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33968 () Bool)

(assert start!33968)

(declare-fun b_free!7099 () Bool)

(declare-fun b_next!7099 () Bool)

(assert (=> start!33968 (= b_free!7099 (not b_next!7099))))

(declare-fun tp!24815 () Bool)

(declare-fun b_and!14289 () Bool)

(assert (=> start!33968 (= tp!24815 b_and!14289)))

(declare-fun b!338260 () Bool)

(declare-fun e!207558 () Bool)

(declare-fun tp_is_empty!7051 () Bool)

(assert (=> b!338260 (= e!207558 tp_is_empty!7051)))

(declare-fun b!338261 () Bool)

(declare-fun res!186846 () Bool)

(declare-fun e!207554 () Bool)

(assert (=> b!338261 (=> (not res!186846) (not e!207554))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun k!1348 () (_ BitVec 64))

(declare-datatypes ((V!10379 0))(
  ( (V!10380 (val!3570 Int)) )
))
(declare-fun zeroValue!1467 () V!10379)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3182 0))(
  ( (ValueCellFull!3182 (v!5737 V!10379)) (EmptyCell!3182) )
))
(declare-datatypes ((array!17697 0))(
  ( (array!17698 (arr!8374 (Array (_ BitVec 32) ValueCell!3182)) (size!8726 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17697)

(declare-datatypes ((array!17699 0))(
  ( (array!17700 (arr!8375 (Array (_ BitVec 32) (_ BitVec 64))) (size!8727 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17699)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-fun minValue!1467 () V!10379)

(declare-datatypes ((tuple2!5184 0))(
  ( (tuple2!5185 (_1!2603 (_ BitVec 64)) (_2!2603 V!10379)) )
))
(declare-datatypes ((List!4800 0))(
  ( (Nil!4797) (Cons!4796 (h!5652 tuple2!5184) (t!9898 List!4800)) )
))
(declare-datatypes ((ListLongMap!4097 0))(
  ( (ListLongMap!4098 (toList!2064 List!4800)) )
))
(declare-fun contains!2113 (ListLongMap!4097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1585 (array!17699 array!17697 (_ BitVec 32) (_ BitVec 32) V!10379 V!10379 (_ BitVec 32) Int) ListLongMap!4097)

(assert (=> b!338261 (= res!186846 (not (contains!2113 (getCurrentListMap!1585 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 #b00000000000000000000000000000000 defaultEntry!1528) k!1348)))))

(declare-fun b!338262 () Bool)

(declare-fun res!186845 () Bool)

(assert (=> b!338262 (=> (not res!186845) (not e!207554))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!338262 (= res!186845 (validKeyInArray!0 k!1348))))

(declare-fun b!338263 () Bool)

(declare-datatypes ((Unit!10497 0))(
  ( (Unit!10498) )
))
(declare-fun e!207557 () Unit!10497)

(declare-fun Unit!10499 () Unit!10497)

(assert (=> b!338263 (= e!207557 Unit!10499)))

(declare-fun lt!160761 () Unit!10497)

(declare-fun lemmaArrayContainsKeyThenInListMap!270 (array!17699 array!17697 (_ BitVec 32) (_ BitVec 32) V!10379 V!10379 (_ BitVec 64) (_ BitVec 32) Int) Unit!10497)

(declare-fun arrayScanForKey!0 (array!17699 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!338263 (= lt!160761 (lemmaArrayContainsKeyThenInListMap!270 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 k!1348 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000) defaultEntry!1528))))

(assert (=> b!338263 false))

(declare-fun b!338264 () Bool)

(declare-fun res!186843 () Bool)

(assert (=> b!338264 (=> (not res!186843) (not e!207554))))

(assert (=> b!338264 (= res!186843 (and (= (size!8726 _values!1525) (bvadd #b00000000000000000000000000000001 mask!2385)) (= (size!8727 _keys!1895) (size!8726 _values!1525)) (bvsge mask!2385 #b00000000000000000000000000000000) (bvsge extraKeys!1446 #b00000000000000000000000000000000) (bvsle extraKeys!1446 #b00000000000000000000000000000011)))))

(declare-fun b!338265 () Bool)

(declare-fun res!186842 () Bool)

(assert (=> b!338265 (=> (not res!186842) (not e!207554))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17699 (_ BitVec 32)) Bool)

(assert (=> b!338265 (= res!186842 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!338266 () Bool)

(declare-fun res!186844 () Bool)

(assert (=> b!338266 (=> (not res!186844) (not e!207554))))

(declare-datatypes ((List!4801 0))(
  ( (Nil!4798) (Cons!4797 (h!5653 (_ BitVec 64)) (t!9899 List!4801)) )
))
(declare-fun arrayNoDuplicates!0 (array!17699 (_ BitVec 32) List!4801) Bool)

(assert (=> b!338266 (= res!186844 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4798))))

(declare-fun b!338267 () Bool)

(declare-fun Unit!10500 () Unit!10497)

(assert (=> b!338267 (= e!207557 Unit!10500)))

(declare-fun b!338268 () Bool)

(declare-fun e!207552 () Bool)

(assert (=> b!338268 (= e!207552 false)))

(declare-fun lt!160760 () Unit!10497)

(assert (=> b!338268 (= lt!160760 e!207557)))

(declare-fun c!52410 () Bool)

(declare-fun arrayContainsKey!0 (array!17699 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!338268 (= c!52410 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!338269 () Bool)

(assert (=> b!338269 (= e!207554 e!207552)))

(declare-fun res!186848 () Bool)

(assert (=> b!338269 (=> (not res!186848) (not e!207552))))

(declare-datatypes ((SeekEntryResult!3234 0))(
  ( (MissingZero!3234 (index!15115 (_ BitVec 32))) (Found!3234 (index!15116 (_ BitVec 32))) (Intermediate!3234 (undefined!4046 Bool) (index!15117 (_ BitVec 32)) (x!33706 (_ BitVec 32))) (Undefined!3234) (MissingVacant!3234 (index!15118 (_ BitVec 32))) )
))
(declare-fun lt!160762 () SeekEntryResult!3234)

(assert (=> b!338269 (= res!186848 (and (not (is-Found!3234 lt!160762)) (is-MissingZero!3234 lt!160762)))))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!17699 (_ BitVec 32)) SeekEntryResult!3234)

(assert (=> b!338269 (= lt!160762 (seekEntryOrOpen!0 k!1348 _keys!1895 mask!2385))))

(declare-fun b!338270 () Bool)

(declare-fun e!207553 () Bool)

(declare-fun e!207556 () Bool)

(declare-fun mapRes!11988 () Bool)

(assert (=> b!338270 (= e!207553 (and e!207556 mapRes!11988))))

(declare-fun condMapEmpty!11988 () Bool)

(declare-fun mapDefault!11988 () ValueCell!3182)

