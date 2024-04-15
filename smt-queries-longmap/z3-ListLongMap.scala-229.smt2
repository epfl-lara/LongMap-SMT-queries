; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4046 () Bool)

(assert start!4046)

(declare-fun b_free!961 () Bool)

(declare-fun b_next!961 () Bool)

(assert (=> start!4046 (= b_free!961 (not b_next!961))))

(declare-fun tp!4303 () Bool)

(declare-fun b_and!1765 () Bool)

(assert (=> start!4046 (= tp!4303 b_and!1765)))

(declare-fun b!29751 () Bool)

(declare-fun res!17868 () Bool)

(declare-fun e!19174 () Bool)

(assert (=> b!29751 (=> (not res!17868) (not e!19174))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29751 (= res!17868 (validKeyInArray!0 k0!1304))))

(declare-fun b!29752 () Bool)

(declare-fun res!17869 () Bool)

(assert (=> b!29752 (=> (not res!17869) (not e!19174))))

(declare-datatypes ((V!1579 0))(
  ( (V!1580 (val!684 Int)) )
))
(declare-datatypes ((ValueCell!458 0))(
  ( (ValueCellFull!458 (v!1772 V!1579)) (EmptyCell!458) )
))
(declare-datatypes ((array!1833 0))(
  ( (array!1834 (arr!870 (Array (_ BitVec 32) ValueCell!458)) (size!971 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1833)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1835 0))(
  ( (array!1836 (arr!871 (Array (_ BitVec 32) (_ BitVec 64))) (size!972 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1835)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!29752 (= res!17869 (and (= (size!971 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!972 _keys!1833) (size!971 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29753 () Bool)

(declare-fun res!17866 () Bool)

(assert (=> b!29753 (=> (not res!17866) (not e!19174))))

(declare-fun arrayContainsKey!0 (array!1835 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29753 (= res!17866 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!29754 () Bool)

(declare-fun res!17867 () Bool)

(assert (=> b!29754 (=> (not res!17867) (not e!19174))))

(declare-datatypes ((List!721 0))(
  ( (Nil!718) (Cons!717 (h!1284 (_ BitVec 64)) (t!3407 List!721)) )
))
(declare-fun arrayNoDuplicates!0 (array!1835 (_ BitVec 32) List!721) Bool)

(assert (=> b!29754 (= res!17867 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!718))))

(declare-fun res!17871 () Bool)

(assert (=> start!4046 (=> (not res!17871) (not e!19174))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4046 (= res!17871 (validMask!0 mask!2294))))

(assert (=> start!4046 e!19174))

(assert (=> start!4046 true))

(assert (=> start!4046 tp!4303))

(declare-fun e!19176 () Bool)

(declare-fun array_inv!609 (array!1833) Bool)

(assert (=> start!4046 (and (array_inv!609 _values!1501) e!19176)))

(declare-fun array_inv!610 (array!1835) Bool)

(assert (=> start!4046 (array_inv!610 _keys!1833)))

(declare-fun tp_is_empty!1315 () Bool)

(assert (=> start!4046 tp_is_empty!1315))

(declare-fun mapIsEmpty!1501 () Bool)

(declare-fun mapRes!1501 () Bool)

(assert (=> mapIsEmpty!1501 mapRes!1501))

(declare-fun b!29755 () Bool)

(declare-fun res!17870 () Bool)

(assert (=> b!29755 (=> (not res!17870) (not e!19174))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1835 (_ BitVec 32)) Bool)

(assert (=> b!29755 (= res!17870 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29756 () Bool)

(assert (=> b!29756 (= e!19174 false)))

(declare-datatypes ((SeekEntryResult!94 0))(
  ( (MissingZero!94 (index!2498 (_ BitVec 32))) (Found!94 (index!2499 (_ BitVec 32))) (Intermediate!94 (undefined!906 Bool) (index!2500 (_ BitVec 32)) (x!6468 (_ BitVec 32))) (Undefined!94) (MissingVacant!94 (index!2501 (_ BitVec 32))) )
))
(declare-fun lt!11353 () SeekEntryResult!94)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1835 (_ BitVec 32)) SeekEntryResult!94)

(assert (=> b!29756 (= lt!11353 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!29757 () Bool)

(declare-fun res!17872 () Bool)

(assert (=> b!29757 (=> (not res!17872) (not e!19174))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1579)

(declare-fun minValue!1443 () V!1579)

(declare-datatypes ((tuple2!1140 0))(
  ( (tuple2!1141 (_1!581 (_ BitVec 64)) (_2!581 V!1579)) )
))
(declare-datatypes ((List!722 0))(
  ( (Nil!719) (Cons!718 (h!1285 tuple2!1140) (t!3408 List!722)) )
))
(declare-datatypes ((ListLongMap!705 0))(
  ( (ListLongMap!706 (toList!368 List!722)) )
))
(declare-fun contains!309 (ListLongMap!705 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!192 (array!1835 array!1833 (_ BitVec 32) (_ BitVec 32) V!1579 V!1579 (_ BitVec 32) Int) ListLongMap!705)

(assert (=> b!29757 (= res!17872 (not (contains!309 (getCurrentListMap!192 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!29758 () Bool)

(declare-fun e!19177 () Bool)

(assert (=> b!29758 (= e!19176 (and e!19177 mapRes!1501))))

(declare-fun condMapEmpty!1501 () Bool)

(declare-fun mapDefault!1501 () ValueCell!458)

(assert (=> b!29758 (= condMapEmpty!1501 (= (arr!870 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!458)) mapDefault!1501)))))

(declare-fun b!29759 () Bool)

(declare-fun e!19173 () Bool)

(assert (=> b!29759 (= e!19173 tp_is_empty!1315)))

(declare-fun mapNonEmpty!1501 () Bool)

(declare-fun tp!4302 () Bool)

(assert (=> mapNonEmpty!1501 (= mapRes!1501 (and tp!4302 e!19173))))

(declare-fun mapRest!1501 () (Array (_ BitVec 32) ValueCell!458))

(declare-fun mapValue!1501 () ValueCell!458)

(declare-fun mapKey!1501 () (_ BitVec 32))

(assert (=> mapNonEmpty!1501 (= (arr!870 _values!1501) (store mapRest!1501 mapKey!1501 mapValue!1501))))

(declare-fun b!29760 () Bool)

(assert (=> b!29760 (= e!19177 tp_is_empty!1315)))

(assert (= (and start!4046 res!17871) b!29752))

(assert (= (and b!29752 res!17869) b!29755))

(assert (= (and b!29755 res!17870) b!29754))

(assert (= (and b!29754 res!17867) b!29751))

(assert (= (and b!29751 res!17868) b!29757))

(assert (= (and b!29757 res!17872) b!29753))

(assert (= (and b!29753 res!17866) b!29756))

(assert (= (and b!29758 condMapEmpty!1501) mapIsEmpty!1501))

(assert (= (and b!29758 (not condMapEmpty!1501)) mapNonEmpty!1501))

(get-info :version)

(assert (= (and mapNonEmpty!1501 ((_ is ValueCellFull!458) mapValue!1501)) b!29759))

(assert (= (and b!29758 ((_ is ValueCellFull!458) mapDefault!1501)) b!29760))

(assert (= start!4046 b!29758))

(declare-fun m!23919 () Bool)

(assert (=> b!29753 m!23919))

(declare-fun m!23921 () Bool)

(assert (=> b!29756 m!23921))

(declare-fun m!23923 () Bool)

(assert (=> mapNonEmpty!1501 m!23923))

(declare-fun m!23925 () Bool)

(assert (=> start!4046 m!23925))

(declare-fun m!23927 () Bool)

(assert (=> start!4046 m!23927))

(declare-fun m!23929 () Bool)

(assert (=> start!4046 m!23929))

(declare-fun m!23931 () Bool)

(assert (=> b!29754 m!23931))

(declare-fun m!23933 () Bool)

(assert (=> b!29751 m!23933))

(declare-fun m!23935 () Bool)

(assert (=> b!29757 m!23935))

(assert (=> b!29757 m!23935))

(declare-fun m!23937 () Bool)

(assert (=> b!29757 m!23937))

(declare-fun m!23939 () Bool)

(assert (=> b!29755 m!23939))

(check-sat b_and!1765 (not b!29753) (not b!29757) (not mapNonEmpty!1501) (not start!4046) (not b_next!961) tp_is_empty!1315 (not b!29751) (not b!29756) (not b!29755) (not b!29754))
(check-sat b_and!1765 (not b_next!961))
