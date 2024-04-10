; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4128 () Bool)

(assert start!4128)

(declare-fun b_free!1033 () Bool)

(declare-fun b_next!1033 () Bool)

(assert (=> start!4128 (= b_free!1033 (not b_next!1033))))

(declare-fun tp!4518 () Bool)

(declare-fun b_and!1843 () Bool)

(assert (=> start!4128 (= tp!4518 b_and!1843)))

(declare-fun b!30905 () Bool)

(declare-fun e!19799 () Bool)

(declare-fun e!19797 () Bool)

(assert (=> b!30905 (= e!19799 e!19797)))

(declare-fun res!18680 () Bool)

(assert (=> b!30905 (=> (not res!18680) (not e!19797))))

(declare-datatypes ((V!1675 0))(
  ( (V!1676 (val!720 Int)) )
))
(declare-datatypes ((tuple2!1180 0))(
  ( (tuple2!1181 (_1!601 (_ BitVec 64)) (_2!601 V!1675)) )
))
(declare-datatypes ((List!774 0))(
  ( (Nil!771) (Cons!770 (h!1337 tuple2!1180) (t!3467 List!774)) )
))
(declare-datatypes ((ListLongMap!757 0))(
  ( (ListLongMap!758 (toList!394 List!774)) )
))
(declare-fun lt!11505 () ListLongMap!757)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun contains!334 (ListLongMap!757 (_ BitVec 64)) Bool)

(assert (=> b!30905 (= res!18680 (not (contains!334 lt!11505 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!494 0))(
  ( (ValueCellFull!494 (v!1809 V!1675)) (EmptyCell!494) )
))
(declare-datatypes ((array!1997 0))(
  ( (array!1998 (arr!952 (Array (_ BitVec 32) ValueCell!494)) (size!1053 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1997)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1999 0))(
  ( (array!2000 (arr!953 (Array (_ BitVec 32) (_ BitVec 64))) (size!1054 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1999)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1675)

(declare-fun minValue!1443 () V!1675)

(declare-fun getCurrentListMap!222 (array!1999 array!1997 (_ BitVec 32) (_ BitVec 32) V!1675 V!1675 (_ BitVec 32) Int) ListLongMap!757)

(assert (=> b!30905 (= lt!11505 (getCurrentListMap!222 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!18675 () Bool)

(assert (=> start!4128 (=> (not res!18675) (not e!19799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4128 (= res!18675 (validMask!0 mask!2294))))

(assert (=> start!4128 e!19799))

(assert (=> start!4128 true))

(assert (=> start!4128 tp!4518))

(declare-fun e!19796 () Bool)

(declare-fun array_inv!663 (array!1997) Bool)

(assert (=> start!4128 (and (array_inv!663 _values!1501) e!19796)))

(declare-fun array_inv!664 (array!1999) Bool)

(assert (=> start!4128 (array_inv!664 _keys!1833)))

(declare-fun tp_is_empty!1387 () Bool)

(assert (=> start!4128 tp_is_empty!1387))

(declare-fun b!30906 () Bool)

(declare-fun e!19800 () Bool)

(assert (=> b!30906 (= e!19797 e!19800)))

(declare-fun res!18679 () Bool)

(assert (=> b!30906 (=> (not res!18679) (not e!19800))))

(declare-datatypes ((SeekEntryResult!112 0))(
  ( (MissingZero!112 (index!2570 (_ BitVec 32))) (Found!112 (index!2571 (_ BitVec 32))) (Intermediate!112 (undefined!924 Bool) (index!2572 (_ BitVec 32)) (x!6582 (_ BitVec 32))) (Undefined!112) (MissingVacant!112 (index!2573 (_ BitVec 32))) )
))
(declare-fun lt!11506 () SeekEntryResult!112)

(assert (=> b!30906 (= res!18679 (is-Found!112 lt!11506))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!1999 (_ BitVec 32)) SeekEntryResult!112)

(assert (=> b!30906 (= lt!11506 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!30907 () Bool)

(declare-fun res!18676 () Bool)

(assert (=> b!30907 (=> (not res!18676) (not e!19797))))

(declare-fun arrayContainsKey!0 (array!1999 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30907 (= res!18676 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30908 () Bool)

(declare-fun res!18681 () Bool)

(assert (=> b!30908 (=> (not res!18681) (not e!19799))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30908 (= res!18681 (validKeyInArray!0 k!1304))))

(declare-fun b!30909 () Bool)

(declare-fun res!18674 () Bool)

(assert (=> b!30909 (=> (not res!18674) (not e!19799))))

(declare-datatypes ((List!775 0))(
  ( (Nil!772) (Cons!771 (h!1338 (_ BitVec 64)) (t!3468 List!775)) )
))
(declare-fun arrayNoDuplicates!0 (array!1999 (_ BitVec 32) List!775) Bool)

(assert (=> b!30909 (= res!18674 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!772))))

(declare-fun b!30910 () Bool)

(declare-fun res!18678 () Bool)

(assert (=> b!30910 (=> (not res!18678) (not e!19799))))

(assert (=> b!30910 (= res!18678 (and (= (size!1053 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1054 _keys!1833) (size!1053 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!30911 () Bool)

(assert (=> b!30911 (= e!19800 (not true))))

(assert (=> b!30911 (contains!334 lt!11505 (select (arr!953 _keys!1833) (index!2571 lt!11506)))))

(declare-datatypes ((Unit!693 0))(
  ( (Unit!694) )
))
(declare-fun lt!11507 () Unit!693)

(declare-fun lemmaValidKeyInArrayIsInListMap!40 (array!1999 array!1997 (_ BitVec 32) (_ BitVec 32) V!1675 V!1675 (_ BitVec 32) Int) Unit!693)

(assert (=> b!30911 (= lt!11507 (lemmaValidKeyInArrayIsInListMap!40 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2571 lt!11506) defaultEntry!1504))))

(declare-fun mapIsEmpty!1609 () Bool)

(declare-fun mapRes!1609 () Bool)

(assert (=> mapIsEmpty!1609 mapRes!1609))

(declare-fun mapNonEmpty!1609 () Bool)

(declare-fun tp!4519 () Bool)

(declare-fun e!19801 () Bool)

(assert (=> mapNonEmpty!1609 (= mapRes!1609 (and tp!4519 e!19801))))

(declare-fun mapValue!1609 () ValueCell!494)

(declare-fun mapKey!1609 () (_ BitVec 32))

(declare-fun mapRest!1609 () (Array (_ BitVec 32) ValueCell!494))

(assert (=> mapNonEmpty!1609 (= (arr!952 _values!1501) (store mapRest!1609 mapKey!1609 mapValue!1609))))

(declare-fun b!30912 () Bool)

(declare-fun res!18677 () Bool)

(assert (=> b!30912 (=> (not res!18677) (not e!19799))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1999 (_ BitVec 32)) Bool)

(assert (=> b!30912 (= res!18677 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!30913 () Bool)

(declare-fun e!19798 () Bool)

(assert (=> b!30913 (= e!19796 (and e!19798 mapRes!1609))))

(declare-fun condMapEmpty!1609 () Bool)

(declare-fun mapDefault!1609 () ValueCell!494)

