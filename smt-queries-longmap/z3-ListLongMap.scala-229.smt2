; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4052 () Bool)

(assert start!4052)

(declare-fun b_free!961 () Bool)

(declare-fun b_next!961 () Bool)

(assert (=> start!4052 (= b_free!961 (not b_next!961))))

(declare-fun tp!4303 () Bool)

(declare-fun b_and!1761 () Bool)

(assert (=> start!4052 (= tp!4303 b_and!1761)))

(declare-fun b!29733 () Bool)

(declare-fun res!17862 () Bool)

(declare-fun e!19168 () Bool)

(assert (=> b!29733 (=> (not res!17862) (not e!19168))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1579 0))(
  ( (V!1580 (val!684 Int)) )
))
(declare-datatypes ((ValueCell!458 0))(
  ( (ValueCellFull!458 (v!1773 V!1579)) (EmptyCell!458) )
))
(declare-datatypes ((array!1841 0))(
  ( (array!1842 (arr!874 (Array (_ BitVec 32) ValueCell!458)) (size!975 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1841)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1843 0))(
  ( (array!1844 (arr!875 (Array (_ BitVec 32) (_ BitVec 64))) (size!976 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1843)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun zeroValue!1443 () V!1579)

(declare-fun minValue!1443 () V!1579)

(declare-datatypes ((tuple2!1132 0))(
  ( (tuple2!1133 (_1!577 (_ BitVec 64)) (_2!577 V!1579)) )
))
(declare-datatypes ((List!723 0))(
  ( (Nil!720) (Cons!719 (h!1286 tuple2!1132) (t!3410 List!723)) )
))
(declare-datatypes ((ListLongMap!703 0))(
  ( (ListLongMap!704 (toList!367 List!723)) )
))
(declare-fun contains!309 (ListLongMap!703 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!192 (array!1843 array!1841 (_ BitVec 32) (_ BitVec 32) V!1579 V!1579 (_ BitVec 32) Int) ListLongMap!703)

(assert (=> b!29733 (= res!17862 (not (contains!309 (getCurrentListMap!192 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!29734 () Bool)

(declare-fun e!19165 () Bool)

(declare-fun tp_is_empty!1315 () Bool)

(assert (=> b!29734 (= e!19165 tp_is_empty!1315)))

(declare-fun b!29735 () Bool)

(declare-fun res!17861 () Bool)

(assert (=> b!29735 (=> (not res!17861) (not e!19168))))

(assert (=> b!29735 (= res!17861 (and (= (size!975 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!976 _keys!1833) (size!975 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!17859 () Bool)

(assert (=> start!4052 (=> (not res!17859) (not e!19168))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4052 (= res!17859 (validMask!0 mask!2294))))

(assert (=> start!4052 e!19168))

(assert (=> start!4052 true))

(assert (=> start!4052 tp!4303))

(declare-fun e!19166 () Bool)

(declare-fun array_inv!605 (array!1841) Bool)

(assert (=> start!4052 (and (array_inv!605 _values!1501) e!19166)))

(declare-fun array_inv!606 (array!1843) Bool)

(assert (=> start!4052 (array_inv!606 _keys!1833)))

(assert (=> start!4052 tp_is_empty!1315))

(declare-fun b!29736 () Bool)

(declare-fun res!17858 () Bool)

(assert (=> b!29736 (=> (not res!17858) (not e!19168))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29736 (= res!17858 (validKeyInArray!0 k0!1304))))

(declare-fun b!29737 () Bool)

(assert (=> b!29737 (= e!19168 false)))

(declare-datatypes ((SeekEntryResult!92 0))(
  ( (MissingZero!92 (index!2490 (_ BitVec 32))) (Found!92 (index!2491 (_ BitVec 32))) (Intermediate!92 (undefined!904 Bool) (index!2492 (_ BitVec 32)) (x!6466 (_ BitVec 32))) (Undefined!92) (MissingVacant!92 (index!2493 (_ BitVec 32))) )
))
(declare-fun lt!11313 () SeekEntryResult!92)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1843 (_ BitVec 32)) SeekEntryResult!92)

(assert (=> b!29737 (= lt!11313 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!29738 () Bool)

(declare-fun res!17863 () Bool)

(assert (=> b!29738 (=> (not res!17863) (not e!19168))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1843 (_ BitVec 32)) Bool)

(assert (=> b!29738 (= res!17863 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun mapNonEmpty!1501 () Bool)

(declare-fun mapRes!1501 () Bool)

(declare-fun tp!4302 () Bool)

(declare-fun e!19167 () Bool)

(assert (=> mapNonEmpty!1501 (= mapRes!1501 (and tp!4302 e!19167))))

(declare-fun mapRest!1501 () (Array (_ BitVec 32) ValueCell!458))

(declare-fun mapKey!1501 () (_ BitVec 32))

(declare-fun mapValue!1501 () ValueCell!458)

(assert (=> mapNonEmpty!1501 (= (arr!874 _values!1501) (store mapRest!1501 mapKey!1501 mapValue!1501))))

(declare-fun b!29739 () Bool)

(assert (=> b!29739 (= e!19166 (and e!19165 mapRes!1501))))

(declare-fun condMapEmpty!1501 () Bool)

(declare-fun mapDefault!1501 () ValueCell!458)

(assert (=> b!29739 (= condMapEmpty!1501 (= (arr!874 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!458)) mapDefault!1501)))))

(declare-fun b!29740 () Bool)

(declare-fun res!17860 () Bool)

(assert (=> b!29740 (=> (not res!17860) (not e!19168))))

(declare-datatypes ((List!724 0))(
  ( (Nil!721) (Cons!720 (h!1287 (_ BitVec 64)) (t!3411 List!724)) )
))
(declare-fun arrayNoDuplicates!0 (array!1843 (_ BitVec 32) List!724) Bool)

(assert (=> b!29740 (= res!17860 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!721))))

(declare-fun b!29741 () Bool)

(assert (=> b!29741 (= e!19167 tp_is_empty!1315)))

(declare-fun b!29742 () Bool)

(declare-fun res!17864 () Bool)

(assert (=> b!29742 (=> (not res!17864) (not e!19168))))

(declare-fun arrayContainsKey!0 (array!1843 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29742 (= res!17864 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!1501 () Bool)

(assert (=> mapIsEmpty!1501 mapRes!1501))

(assert (= (and start!4052 res!17859) b!29735))

(assert (= (and b!29735 res!17861) b!29738))

(assert (= (and b!29738 res!17863) b!29740))

(assert (= (and b!29740 res!17860) b!29736))

(assert (= (and b!29736 res!17858) b!29733))

(assert (= (and b!29733 res!17862) b!29742))

(assert (= (and b!29742 res!17864) b!29737))

(assert (= (and b!29739 condMapEmpty!1501) mapIsEmpty!1501))

(assert (= (and b!29739 (not condMapEmpty!1501)) mapNonEmpty!1501))

(get-info :version)

(assert (= (and mapNonEmpty!1501 ((_ is ValueCellFull!458) mapValue!1501)) b!29741))

(assert (= (and b!29739 ((_ is ValueCellFull!458) mapDefault!1501)) b!29734))

(assert (= start!4052 b!29739))

(declare-fun m!23837 () Bool)

(assert (=> b!29740 m!23837))

(declare-fun m!23839 () Bool)

(assert (=> b!29738 m!23839))

(declare-fun m!23841 () Bool)

(assert (=> b!29733 m!23841))

(assert (=> b!29733 m!23841))

(declare-fun m!23843 () Bool)

(assert (=> b!29733 m!23843))

(declare-fun m!23845 () Bool)

(assert (=> b!29742 m!23845))

(declare-fun m!23847 () Bool)

(assert (=> mapNonEmpty!1501 m!23847))

(declare-fun m!23849 () Bool)

(assert (=> b!29736 m!23849))

(declare-fun m!23851 () Bool)

(assert (=> start!4052 m!23851))

(declare-fun m!23853 () Bool)

(assert (=> start!4052 m!23853))

(declare-fun m!23855 () Bool)

(assert (=> start!4052 m!23855))

(declare-fun m!23857 () Bool)

(assert (=> b!29737 m!23857))

(check-sat (not mapNonEmpty!1501) (not b!29736) (not b!29742) (not b!29737) (not b!29738) (not b!29733) (not b_next!961) b_and!1761 tp_is_empty!1315 (not b!29740) (not start!4052))
(check-sat b_and!1761 (not b_next!961))
