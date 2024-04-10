; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4298 () Bool)

(assert start!4298)

(declare-fun b_free!1163 () Bool)

(declare-fun b_next!1163 () Bool)

(assert (=> start!4298 (= b_free!1163 (not b_next!1163))))

(declare-fun tp!4914 () Bool)

(declare-fun b_and!1977 () Bool)

(assert (=> start!4298 (= tp!4914 b_and!1977)))

(declare-fun mapIsEmpty!1810 () Bool)

(declare-fun mapRes!1810 () Bool)

(assert (=> mapIsEmpty!1810 mapRes!1810))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun e!21008 () Bool)

(declare-fun b!33076 () Bool)

(declare-datatypes ((array!2247 0))(
  ( (array!2248 (arr!1075 (Array (_ BitVec 32) (_ BitVec 64))) (size!1176 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2247)

(declare-fun lt!11975 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((SeekEntryResult!125 0))(
  ( (MissingZero!125 (index!2622 (_ BitVec 32))) (Found!125 (index!2623 (_ BitVec 32))) (Intermediate!125 (undefined!937 Bool) (index!2624 (_ BitVec 32)) (x!6783 (_ BitVec 32))) (Undefined!125) (MissingVacant!125 (index!2625 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!2247 (_ BitVec 32)) SeekEntryResult!125)

(assert (=> b!33076 (= e!21008 (= (seekEntryOrOpen!0 k!1304 _keys!1833 mask!2294) (Found!125 lt!11975)))))

(declare-fun mapNonEmpty!1810 () Bool)

(declare-fun tp!4915 () Bool)

(declare-fun e!21011 () Bool)

(assert (=> mapNonEmpty!1810 (= mapRes!1810 (and tp!4915 e!21011))))

(declare-datatypes ((V!1847 0))(
  ( (V!1848 (val!785 Int)) )
))
(declare-datatypes ((ValueCell!559 0))(
  ( (ValueCellFull!559 (v!1876 V!1847)) (EmptyCell!559) )
))
(declare-datatypes ((array!2249 0))(
  ( (array!2250 (arr!1076 (Array (_ BitVec 32) ValueCell!559)) (size!1177 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2249)

(declare-fun mapValue!1810 () ValueCell!559)

(declare-fun mapKey!1810 () (_ BitVec 32))

(declare-fun mapRest!1810 () (Array (_ BitVec 32) ValueCell!559))

(assert (=> mapNonEmpty!1810 (= (arr!1076 _values!1501) (store mapRest!1810 mapKey!1810 mapValue!1810))))

(declare-fun b!33077 () Bool)

(declare-fun e!21009 () Bool)

(assert (=> b!33077 (= e!21009 (not e!21008))))

(declare-fun res!20120 () Bool)

(assert (=> b!33077 (=> res!20120 e!21008)))

(assert (=> b!33077 (= res!20120 (not (= (size!1176 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((tuple2!1280 0))(
  ( (tuple2!1281 (_1!651 (_ BitVec 64)) (_2!651 V!1847)) )
))
(declare-datatypes ((List!871 0))(
  ( (Nil!868) (Cons!867 (h!1434 tuple2!1280) (t!3568 List!871)) )
))
(declare-datatypes ((ListLongMap!857 0))(
  ( (ListLongMap!858 (toList!444 List!871)) )
))
(declare-fun lt!11974 () ListLongMap!857)

(declare-fun contains!386 (ListLongMap!857 (_ BitVec 64)) Bool)

(assert (=> b!33077 (contains!386 lt!11974 (select (arr!1075 _keys!1833) lt!11975))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!735 0))(
  ( (Unit!736) )
))
(declare-fun lt!11973 () Unit!735)

(declare-fun zeroValue!1443 () V!1847)

(declare-fun minValue!1443 () V!1847)

(declare-fun lemmaValidKeyInArrayIsInListMap!57 (array!2247 array!2249 (_ BitVec 32) (_ BitVec 32) V!1847 V!1847 (_ BitVec 32) Int) Unit!735)

(assert (=> b!33077 (= lt!11973 (lemmaValidKeyInArrayIsInListMap!57 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11975 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2247 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33077 (= lt!11975 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!33078 () Bool)

(declare-fun tp_is_empty!1517 () Bool)

(assert (=> b!33078 (= e!21011 tp_is_empty!1517)))

(declare-fun b!33079 () Bool)

(declare-fun res!20122 () Bool)

(declare-fun e!21010 () Bool)

(assert (=> b!33079 (=> (not res!20122) (not e!21010))))

(assert (=> b!33079 (= res!20122 (and (= (size!1177 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1176 _keys!1833) (size!1177 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33080 () Bool)

(declare-fun res!20121 () Bool)

(assert (=> b!33080 (=> (not res!20121) (not e!21010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!33080 (= res!20121 (validKeyInArray!0 k!1304))))

(declare-fun res!20127 () Bool)

(assert (=> start!4298 (=> (not res!20127) (not e!21010))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4298 (= res!20127 (validMask!0 mask!2294))))

(assert (=> start!4298 e!21010))

(assert (=> start!4298 true))

(assert (=> start!4298 tp!4914))

(declare-fun e!21012 () Bool)

(declare-fun array_inv!757 (array!2249) Bool)

(assert (=> start!4298 (and (array_inv!757 _values!1501) e!21012)))

(declare-fun array_inv!758 (array!2247) Bool)

(assert (=> start!4298 (array_inv!758 _keys!1833)))

(assert (=> start!4298 tp_is_empty!1517))

(declare-fun b!33081 () Bool)

(declare-fun res!20123 () Bool)

(assert (=> b!33081 (=> (not res!20123) (not e!21010))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2247 (_ BitVec 32)) Bool)

(assert (=> b!33081 (= res!20123 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33082 () Bool)

(declare-fun res!20125 () Bool)

(assert (=> b!33082 (=> (not res!20125) (not e!21010))))

(declare-datatypes ((List!872 0))(
  ( (Nil!869) (Cons!868 (h!1435 (_ BitVec 64)) (t!3569 List!872)) )
))
(declare-fun arrayNoDuplicates!0 (array!2247 (_ BitVec 32) List!872) Bool)

(assert (=> b!33082 (= res!20125 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!869))))

(declare-fun b!33083 () Bool)

(assert (=> b!33083 (= e!21010 e!21009)))

(declare-fun res!20126 () Bool)

(assert (=> b!33083 (=> (not res!20126) (not e!21009))))

(assert (=> b!33083 (= res!20126 (not (contains!386 lt!11974 k!1304)))))

(declare-fun getCurrentListMap!271 (array!2247 array!2249 (_ BitVec 32) (_ BitVec 32) V!1847 V!1847 (_ BitVec 32) Int) ListLongMap!857)

(assert (=> b!33083 (= lt!11974 (getCurrentListMap!271 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!33084 () Bool)

(declare-fun res!20124 () Bool)

(assert (=> b!33084 (=> (not res!20124) (not e!21009))))

(declare-fun arrayContainsKey!0 (array!2247 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!33084 (= res!20124 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!33085 () Bool)

(declare-fun e!21013 () Bool)

(assert (=> b!33085 (= e!21012 (and e!21013 mapRes!1810))))

(declare-fun condMapEmpty!1810 () Bool)

(declare-fun mapDefault!1810 () ValueCell!559)

