; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4108 () Bool)

(assert start!4108)

(declare-fun b_free!1013 () Bool)

(declare-fun b_next!1013 () Bool)

(assert (=> start!4108 (= b_free!1013 (not b_next!1013))))

(declare-fun tp!4458 () Bool)

(declare-fun b_and!1823 () Bool)

(assert (=> start!4108 (= tp!4458 b_and!1823)))

(declare-fun b!30585 () Bool)

(declare-fun res!18444 () Bool)

(declare-fun e!19607 () Bool)

(assert (=> b!30585 (=> (not res!18444) (not e!19607))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30585 (= res!18444 (validKeyInArray!0 k!1304))))

(declare-fun b!30586 () Bool)

(declare-fun e!19609 () Bool)

(declare-fun tp_is_empty!1367 () Bool)

(assert (=> b!30586 (= e!19609 tp_is_empty!1367)))

(declare-fun b!30587 () Bool)

(declare-fun res!18445 () Bool)

(assert (=> b!30587 (=> (not res!18445) (not e!19607))))

(declare-datatypes ((array!1963 0))(
  ( (array!1964 (arr!935 (Array (_ BitVec 32) (_ BitVec 64))) (size!1036 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1963)

(declare-fun arrayContainsKey!0 (array!1963 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30587 (= res!18445 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30588 () Bool)

(assert (=> b!30588 (= e!19607 false)))

(declare-datatypes ((SeekEntryResult!106 0))(
  ( (MissingZero!106 (index!2546 (_ BitVec 32))) (Found!106 (index!2547 (_ BitVec 32))) (Intermediate!106 (undefined!918 Bool) (index!2548 (_ BitVec 32)) (x!6544 (_ BitVec 32))) (Undefined!106) (MissingVacant!106 (index!2549 (_ BitVec 32))) )
))
(declare-fun lt!11435 () SeekEntryResult!106)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1963 (_ BitVec 32)) SeekEntryResult!106)

(assert (=> b!30588 (= lt!11435 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!30589 () Bool)

(declare-fun res!18446 () Bool)

(assert (=> b!30589 (=> (not res!18446) (not e!19607))))

(declare-datatypes ((V!1647 0))(
  ( (V!1648 (val!710 Int)) )
))
(declare-datatypes ((ValueCell!484 0))(
  ( (ValueCellFull!484 (v!1799 V!1647)) (EmptyCell!484) )
))
(declare-datatypes ((array!1965 0))(
  ( (array!1966 (arr!936 (Array (_ BitVec 32) ValueCell!484)) (size!1037 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1965)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!30589 (= res!18446 (and (= (size!1037 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1036 _keys!1833) (size!1037 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30590 () Bool)

(declare-fun res!18447 () Bool)

(assert (=> b!30590 (=> (not res!18447) (not e!19607))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1647)

(declare-fun minValue!1443 () V!1647)

(declare-datatypes ((tuple2!1170 0))(
  ( (tuple2!1171 (_1!596 (_ BitVec 64)) (_2!596 V!1647)) )
))
(declare-datatypes ((List!765 0))(
  ( (Nil!762) (Cons!761 (h!1328 tuple2!1170) (t!3458 List!765)) )
))
(declare-datatypes ((ListLongMap!747 0))(
  ( (ListLongMap!748 (toList!389 List!765)) )
))
(declare-fun contains!329 (ListLongMap!747 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!217 (array!1963 array!1965 (_ BitVec 32) (_ BitVec 32) V!1647 V!1647 (_ BitVec 32) Int) ListLongMap!747)

(assert (=> b!30590 (= res!18447 (not (contains!329 (getCurrentListMap!217 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!30591 () Bool)

(declare-fun e!19608 () Bool)

(declare-fun mapRes!1579 () Bool)

(assert (=> b!30591 (= e!19608 (and e!19609 mapRes!1579))))

(declare-fun condMapEmpty!1579 () Bool)

(declare-fun mapDefault!1579 () ValueCell!484)

