; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4274 () Bool)

(assert start!4274)

(declare-fun b_free!1139 () Bool)

(declare-fun b_next!1139 () Bool)

(assert (=> start!4274 (= b_free!1139 (not b_next!1139))))

(declare-fun tp!4843 () Bool)

(declare-fun b_and!1953 () Bool)

(assert (=> start!4274 (= tp!4843 b_and!1953)))

(declare-fun b!32708 () Bool)

(declare-fun res!19865 () Bool)

(declare-fun e!20789 () Bool)

(assert (=> b!32708 (=> (not res!19865) (not e!20789))))

(declare-datatypes ((array!2199 0))(
  ( (array!2200 (arr!1051 (Array (_ BitVec 32) (_ BitVec 64))) (size!1152 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2199)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2199 (_ BitVec 32)) Bool)

(assert (=> b!32708 (= res!19865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1774 () Bool)

(declare-fun mapRes!1774 () Bool)

(declare-fun tp!4842 () Bool)

(declare-fun e!20784 () Bool)

(assert (=> mapNonEmpty!1774 (= mapRes!1774 (and tp!4842 e!20784))))

(declare-datatypes ((V!1815 0))(
  ( (V!1816 (val!773 Int)) )
))
(declare-datatypes ((ValueCell!547 0))(
  ( (ValueCellFull!547 (v!1864 V!1815)) (EmptyCell!547) )
))
(declare-datatypes ((array!2201 0))(
  ( (array!2202 (arr!1052 (Array (_ BitVec 32) ValueCell!547)) (size!1153 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2201)

(declare-fun mapRest!1774 () (Array (_ BitVec 32) ValueCell!547))

(declare-fun mapKey!1774 () (_ BitVec 32))

(declare-fun mapValue!1774 () ValueCell!547)

(assert (=> mapNonEmpty!1774 (= (arr!1052 _values!1501) (store mapRest!1774 mapKey!1774 mapValue!1774))))

(declare-fun b!32709 () Bool)

(declare-fun e!20786 () Bool)

(assert (=> b!32709 (= e!20789 e!20786)))

(declare-fun res!19864 () Bool)

(assert (=> b!32709 (=> (not res!19864) (not e!20786))))

(declare-datatypes ((tuple2!1256 0))(
  ( (tuple2!1257 (_1!639 (_ BitVec 64)) (_2!639 V!1815)) )
))
(declare-datatypes ((List!850 0))(
  ( (Nil!847) (Cons!846 (h!1413 tuple2!1256) (t!3547 List!850)) )
))
(declare-datatypes ((ListLongMap!833 0))(
  ( (ListLongMap!834 (toList!432 List!850)) )
))
(declare-fun lt!11866 () ListLongMap!833)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun contains!374 (ListLongMap!833 (_ BitVec 64)) Bool)

(assert (=> b!32709 (= res!19864 (not (contains!374 lt!11866 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1815)

(declare-fun minValue!1443 () V!1815)

(declare-fun getCurrentListMap!260 (array!2199 array!2201 (_ BitVec 32) (_ BitVec 32) V!1815 V!1815 (_ BitVec 32) Int) ListLongMap!833)

(assert (=> b!32709 (= lt!11866 (getCurrentListMap!260 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32710 () Bool)

(declare-fun res!19862 () Bool)

(assert (=> b!32710 (=> (not res!19862) (not e!20789))))

(declare-datatypes ((List!851 0))(
  ( (Nil!848) (Cons!847 (h!1414 (_ BitVec 64)) (t!3548 List!851)) )
))
(declare-fun arrayNoDuplicates!0 (array!2199 (_ BitVec 32) List!851) Bool)

(assert (=> b!32710 (= res!19862 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!848))))

(declare-fun b!32711 () Bool)

(declare-fun res!19866 () Bool)

(assert (=> b!32711 (=> (not res!19866) (not e!20789))))

(assert (=> b!32711 (= res!19866 (and (= (size!1153 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1152 _keys!1833) (size!1153 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!32712 () Bool)

(declare-fun res!19861 () Bool)

(assert (=> b!32712 (=> (not res!19861) (not e!20789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32712 (= res!19861 (validKeyInArray!0 k!1304))))

(declare-fun mapIsEmpty!1774 () Bool)

(assert (=> mapIsEmpty!1774 mapRes!1774))

(declare-fun b!32713 () Bool)

(declare-fun res!19863 () Bool)

(assert (=> b!32713 (=> (not res!19863) (not e!20786))))

(declare-fun arrayContainsKey!0 (array!2199 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32713 (= res!19863 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun res!19860 () Bool)

(assert (=> start!4274 (=> (not res!19860) (not e!20789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4274 (= res!19860 (validMask!0 mask!2294))))

(assert (=> start!4274 e!20789))

(assert (=> start!4274 true))

(assert (=> start!4274 tp!4843))

(declare-fun e!20788 () Bool)

(declare-fun array_inv!735 (array!2201) Bool)

(assert (=> start!4274 (and (array_inv!735 _values!1501) e!20788)))

(declare-fun array_inv!736 (array!2199) Bool)

(assert (=> start!4274 (array_inv!736 _keys!1833)))

(declare-fun tp_is_empty!1493 () Bool)

(assert (=> start!4274 tp_is_empty!1493))

(declare-fun b!32714 () Bool)

(assert (=> b!32714 (= e!20786 (not true))))

(declare-fun lt!11865 () (_ BitVec 32))

(assert (=> b!32714 (contains!374 lt!11866 (select (arr!1051 _keys!1833) lt!11865))))

(declare-datatypes ((Unit!711 0))(
  ( (Unit!712) )
))
(declare-fun lt!11867 () Unit!711)

(declare-fun lemmaValidKeyInArrayIsInListMap!45 (array!2199 array!2201 (_ BitVec 32) (_ BitVec 32) V!1815 V!1815 (_ BitVec 32) Int) Unit!711)

(assert (=> b!32714 (= lt!11867 (lemmaValidKeyInArrayIsInListMap!45 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11865 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2199 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32714 (= lt!11865 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!32715 () Bool)

(assert (=> b!32715 (= e!20784 tp_is_empty!1493)))

(declare-fun b!32716 () Bool)

(declare-fun e!20785 () Bool)

(assert (=> b!32716 (= e!20785 tp_is_empty!1493)))

(declare-fun b!32717 () Bool)

(assert (=> b!32717 (= e!20788 (and e!20785 mapRes!1774))))

(declare-fun condMapEmpty!1774 () Bool)

(declare-fun mapDefault!1774 () ValueCell!547)

