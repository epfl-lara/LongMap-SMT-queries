; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!33720 () Bool)

(assert start!33720)

(declare-fun b_free!6955 () Bool)

(declare-fun b_next!6955 () Bool)

(assert (=> start!33720 (= b_free!6955 (not b_next!6955))))

(declare-fun tp!24368 () Bool)

(declare-fun b_and!14135 () Bool)

(assert (=> start!33720 (= tp!24368 b_and!14135)))

(declare-fun b!335262 () Bool)

(declare-fun e!205797 () Bool)

(assert (=> b!335262 (= e!205797 (not true))))

(declare-datatypes ((V!10187 0))(
  ( (V!10188 (val!3498 Int)) )
))
(declare-datatypes ((tuple2!5078 0))(
  ( (tuple2!5079 (_1!2550 (_ BitVec 64)) (_2!2550 V!10187)) )
))
(declare-datatypes ((List!4700 0))(
  ( (Nil!4697) (Cons!4696 (h!5552 tuple2!5078) (t!9788 List!4700)) )
))
(declare-datatypes ((ListLongMap!3991 0))(
  ( (ListLongMap!3992 (toList!2011 List!4700)) )
))
(declare-fun lt!159768 () ListLongMap!3991)

(declare-datatypes ((array!17407 0))(
  ( (array!17408 (arr!8234 (Array (_ BitVec 32) (_ BitVec 64))) (size!8586 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17407)

(declare-datatypes ((SeekEntryResult!3183 0))(
  ( (MissingZero!3183 (index!14911 (_ BitVec 32))) (Found!3183 (index!14912 (_ BitVec 32))) (Intermediate!3183 (undefined!3995 Bool) (index!14913 (_ BitVec 32)) (x!33413 (_ BitVec 32))) (Undefined!3183) (MissingVacant!3183 (index!14914 (_ BitVec 32))) )
))
(declare-fun lt!159769 () SeekEntryResult!3183)

(declare-fun contains!2055 (ListLongMap!3991 (_ BitVec 64)) Bool)

(assert (=> b!335262 (contains!2055 lt!159768 (select (arr!8234 _keys!1895) (index!14912 lt!159769)))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun zeroValue!1467 () V!10187)

(declare-fun defaultEntry!1528 () Int)

(declare-datatypes ((ValueCell!3110 0))(
  ( (ValueCellFull!3110 (v!5660 V!10187)) (EmptyCell!3110) )
))
(declare-datatypes ((array!17409 0))(
  ( (array!17410 (arr!8235 (Array (_ BitVec 32) ValueCell!3110)) (size!8587 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17409)

(declare-fun minValue!1467 () V!10187)

(declare-fun extraKeys!1446 () (_ BitVec 32))

(declare-datatypes ((Unit!10433 0))(
  ( (Unit!10434) )
))
(declare-fun lt!159767 () Unit!10433)

(declare-fun lemmaValidKeyInArrayIsInListMap!163 (array!17407 array!17409 (_ BitVec 32) (_ BitVec 32) V!10187 V!10187 (_ BitVec 32) Int) Unit!10433)

(assert (=> b!335262 (= lt!159767 (lemmaValidKeyInArrayIsInListMap!163 _keys!1895 _values!1525 mask!2385 extraKeys!1446 zeroValue!1467 minValue!1467 (index!14912 lt!159769) defaultEntry!1528))))

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17407 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!335262 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000)))

(declare-fun lt!159766 () Unit!10433)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!17407 (_ BitVec 64) (_ BitVec 32)) Unit!10433)

(assert (=> b!335262 (= lt!159766 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1895 k!1348 (index!14912 lt!159769)))))

(declare-fun mapIsEmpty!11757 () Bool)

(declare-fun mapRes!11757 () Bool)

(assert (=> mapIsEmpty!11757 mapRes!11757))

(declare-fun b!335263 () Bool)

(declare-fun e!205792 () Bool)

(declare-fun e!205795 () Bool)

(assert (=> b!335263 (= e!205792 (and e!205795 mapRes!11757))))

(declare-fun condMapEmpty!11757 () Bool)

(declare-fun mapDefault!11757 () ValueCell!3110)

