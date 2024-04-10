; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4078 () Bool)

(assert start!4078)

(declare-fun b_free!983 () Bool)

(declare-fun b_next!983 () Bool)

(assert (=> start!4078 (= b_free!983 (not b_next!983))))

(declare-fun tp!4369 () Bool)

(declare-fun b_and!1793 () Bool)

(assert (=> start!4078 (= tp!4369 b_and!1793)))

(declare-fun b!30135 () Bool)

(declare-fun e!19385 () Bool)

(assert (=> b!30135 (= e!19385 false)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-datatypes ((array!1903 0))(
  ( (array!1904 (arr!905 (Array (_ BitVec 32) (_ BitVec 64))) (size!1006 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1903)

(declare-datatypes ((SeekEntryResult!98 0))(
  ( (MissingZero!98 (index!2514 (_ BitVec 32))) (Found!98 (index!2515 (_ BitVec 32))) (Intermediate!98 (undefined!910 Bool) (index!2516 (_ BitVec 32)) (x!6496 (_ BitVec 32))) (Undefined!98) (MissingVacant!98 (index!2517 (_ BitVec 32))) )
))
(declare-fun lt!11390 () SeekEntryResult!98)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1903 (_ BitVec 32)) SeekEntryResult!98)

(assert (=> b!30135 (= lt!11390 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun res!18131 () Bool)

(assert (=> start!4078 (=> (not res!18131) (not e!19385))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4078 (= res!18131 (validMask!0 mask!2294))))

(assert (=> start!4078 e!19385))

(assert (=> start!4078 true))

(assert (=> start!4078 tp!4369))

(declare-datatypes ((V!1607 0))(
  ( (V!1608 (val!695 Int)) )
))
(declare-datatypes ((ValueCell!469 0))(
  ( (ValueCellFull!469 (v!1784 V!1607)) (EmptyCell!469) )
))
(declare-datatypes ((array!1905 0))(
  ( (array!1906 (arr!906 (Array (_ BitVec 32) ValueCell!469)) (size!1007 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1905)

(declare-fun e!19381 () Bool)

(declare-fun array_inv!633 (array!1905) Bool)

(assert (=> start!4078 (and (array_inv!633 _values!1501) e!19381)))

(declare-fun array_inv!634 (array!1903) Bool)

(assert (=> start!4078 (array_inv!634 _keys!1833)))

(declare-fun tp_is_empty!1337 () Bool)

(assert (=> start!4078 tp_is_empty!1337))

(declare-fun b!30136 () Bool)

(declare-fun res!18134 () Bool)

(assert (=> b!30136 (=> (not res!18134) (not e!19385))))

(declare-fun arrayContainsKey!0 (array!1903 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30136 (= res!18134 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30137 () Bool)

(declare-fun e!19382 () Bool)

(declare-fun mapRes!1534 () Bool)

(assert (=> b!30137 (= e!19381 (and e!19382 mapRes!1534))))

(declare-fun condMapEmpty!1534 () Bool)

(declare-fun mapDefault!1534 () ValueCell!469)

