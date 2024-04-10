; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4132 () Bool)

(assert start!4132)

(declare-fun b_free!1037 () Bool)

(declare-fun b_next!1037 () Bool)

(assert (=> start!4132 (= b_free!1037 (not b_next!1037))))

(declare-fun tp!4531 () Bool)

(declare-fun b_and!1847 () Bool)

(assert (=> start!4132 (= tp!4531 b_and!1847)))

(declare-fun b!30971 () Bool)

(declare-fun res!18727 () Bool)

(declare-fun e!19842 () Bool)

(assert (=> b!30971 (=> (not res!18727) (not e!19842))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!30971 (= res!18727 (validKeyInArray!0 k!1304))))

(declare-fun b!30972 () Bool)

(declare-fun e!19844 () Bool)

(declare-fun e!19841 () Bool)

(assert (=> b!30972 (= e!19844 e!19841)))

(declare-fun res!18725 () Bool)

(assert (=> b!30972 (=> (not res!18725) (not e!19841))))

(declare-datatypes ((SeekEntryResult!114 0))(
  ( (MissingZero!114 (index!2578 (_ BitVec 32))) (Found!114 (index!2579 (_ BitVec 32))) (Intermediate!114 (undefined!926 Bool) (index!2580 (_ BitVec 32)) (x!6584 (_ BitVec 32))) (Undefined!114) (MissingVacant!114 (index!2581 (_ BitVec 32))) )
))
(declare-fun lt!11524 () SeekEntryResult!114)

(assert (=> b!30972 (= res!18725 (is-Found!114 lt!11524))))

(declare-datatypes ((array!2005 0))(
  ( (array!2006 (arr!956 (Array (_ BitVec 32) (_ BitVec 64))) (size!1057 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2005)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2005 (_ BitVec 32)) SeekEntryResult!114)

(assert (=> b!30972 (= lt!11524 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!30973 () Bool)

(assert (=> b!30973 (= e!19841 (not true))))

(declare-datatypes ((V!1679 0))(
  ( (V!1680 (val!722 Int)) )
))
(declare-datatypes ((tuple2!1184 0))(
  ( (tuple2!1185 (_1!603 (_ BitVec 64)) (_2!603 V!1679)) )
))
(declare-datatypes ((List!778 0))(
  ( (Nil!775) (Cons!774 (h!1341 tuple2!1184) (t!3471 List!778)) )
))
(declare-datatypes ((ListLongMap!761 0))(
  ( (ListLongMap!762 (toList!396 List!778)) )
))
(declare-fun lt!11523 () ListLongMap!761)

(declare-fun contains!336 (ListLongMap!761 (_ BitVec 64)) Bool)

(assert (=> b!30973 (contains!336 lt!11523 (select (arr!956 _keys!1833) (index!2579 lt!11524)))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!496 0))(
  ( (ValueCellFull!496 (v!1811 V!1679)) (EmptyCell!496) )
))
(declare-datatypes ((array!2007 0))(
  ( (array!2008 (arr!957 (Array (_ BitVec 32) ValueCell!496)) (size!1058 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2007)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!697 0))(
  ( (Unit!698) )
))
(declare-fun lt!11525 () Unit!697)

(declare-fun zeroValue!1443 () V!1679)

(declare-fun minValue!1443 () V!1679)

(declare-fun lemmaValidKeyInArrayIsInListMap!42 (array!2005 array!2007 (_ BitVec 32) (_ BitVec 32) V!1679 V!1679 (_ BitVec 32) Int) Unit!697)

(assert (=> b!30973 (= lt!11525 (lemmaValidKeyInArrayIsInListMap!42 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 (index!2579 lt!11524) defaultEntry!1504))))

(declare-fun mapNonEmpty!1615 () Bool)

(declare-fun mapRes!1615 () Bool)

(declare-fun tp!4530 () Bool)

(declare-fun e!19838 () Bool)

(assert (=> mapNonEmpty!1615 (= mapRes!1615 (and tp!4530 e!19838))))

(declare-fun mapKey!1615 () (_ BitVec 32))

(declare-fun mapRest!1615 () (Array (_ BitVec 32) ValueCell!496))

(declare-fun mapValue!1615 () ValueCell!496)

(assert (=> mapNonEmpty!1615 (= (arr!957 _values!1501) (store mapRest!1615 mapKey!1615 mapValue!1615))))

(declare-fun b!30974 () Bool)

(declare-fun e!19843 () Bool)

(declare-fun tp_is_empty!1391 () Bool)

(assert (=> b!30974 (= e!19843 tp_is_empty!1391)))

(declare-fun b!30975 () Bool)

(declare-fun res!18724 () Bool)

(assert (=> b!30975 (=> (not res!18724) (not e!19844))))

(declare-fun arrayContainsKey!0 (array!2005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!30975 (= res!18724 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!30976 () Bool)

(declare-fun res!18726 () Bool)

(assert (=> b!30976 (=> (not res!18726) (not e!19842))))

(assert (=> b!30976 (= res!18726 (and (= (size!1058 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1057 _keys!1833) (size!1058 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1615 () Bool)

(assert (=> mapIsEmpty!1615 mapRes!1615))

(declare-fun res!18723 () Bool)

(assert (=> start!4132 (=> (not res!18723) (not e!19842))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4132 (= res!18723 (validMask!0 mask!2294))))

(assert (=> start!4132 e!19842))

(assert (=> start!4132 true))

(assert (=> start!4132 tp!4531))

(declare-fun e!19840 () Bool)

(declare-fun array_inv!667 (array!2007) Bool)

(assert (=> start!4132 (and (array_inv!667 _values!1501) e!19840)))

(declare-fun array_inv!668 (array!2005) Bool)

(assert (=> start!4132 (array_inv!668 _keys!1833)))

(assert (=> start!4132 tp_is_empty!1391))

(declare-fun b!30977 () Bool)

(assert (=> b!30977 (= e!19842 e!19844)))

(declare-fun res!18728 () Bool)

(assert (=> b!30977 (=> (not res!18728) (not e!19844))))

(assert (=> b!30977 (= res!18728 (not (contains!336 lt!11523 k!1304)))))

(declare-fun getCurrentListMap!224 (array!2005 array!2007 (_ BitVec 32) (_ BitVec 32) V!1679 V!1679 (_ BitVec 32) Int) ListLongMap!761)

(assert (=> b!30977 (= lt!11523 (getCurrentListMap!224 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!30978 () Bool)

(assert (=> b!30978 (= e!19840 (and e!19843 mapRes!1615))))

(declare-fun condMapEmpty!1615 () Bool)

(declare-fun mapDefault!1615 () ValueCell!496)

