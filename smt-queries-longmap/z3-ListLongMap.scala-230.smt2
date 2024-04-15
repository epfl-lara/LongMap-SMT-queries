; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4052 () Bool)

(assert start!4052)

(declare-fun b_free!967 () Bool)

(declare-fun b_next!967 () Bool)

(assert (=> start!4052 (= b_free!967 (not b_next!967))))

(declare-fun tp!4320 () Bool)

(declare-fun b_and!1771 () Bool)

(assert (=> start!4052 (= tp!4320 b_and!1771)))

(declare-fun b!29841 () Bool)

(declare-fun res!17930 () Bool)

(declare-fun e!19220 () Bool)

(assert (=> b!29841 (=> (not res!17930) (not e!19220))))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29841 (= res!17930 (validKeyInArray!0 k0!1304))))

(declare-fun b!29842 () Bool)

(declare-fun res!17933 () Bool)

(assert (=> b!29842 (=> (not res!17933) (not e!19220))))

(declare-datatypes ((array!1845 0))(
  ( (array!1846 (arr!876 (Array (_ BitVec 32) (_ BitVec 64))) (size!977 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1845)

(declare-datatypes ((List!726 0))(
  ( (Nil!723) (Cons!722 (h!1289 (_ BitVec 64)) (t!3412 List!726)) )
))
(declare-fun arrayNoDuplicates!0 (array!1845 (_ BitVec 32) List!726) Bool)

(assert (=> b!29842 (= res!17933 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!723))))

(declare-fun b!29843 () Bool)

(declare-fun e!19219 () Bool)

(declare-fun tp_is_empty!1321 () Bool)

(assert (=> b!29843 (= e!19219 tp_is_empty!1321)))

(declare-fun b!29844 () Bool)

(declare-fun res!17932 () Bool)

(assert (=> b!29844 (=> (not res!17932) (not e!19220))))

(declare-datatypes ((V!1587 0))(
  ( (V!1588 (val!687 Int)) )
))
(declare-datatypes ((ValueCell!461 0))(
  ( (ValueCellFull!461 (v!1775 V!1587)) (EmptyCell!461) )
))
(declare-datatypes ((array!1847 0))(
  ( (array!1848 (arr!877 (Array (_ BitVec 32) ValueCell!461)) (size!978 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1847)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!29844 (= res!17932 (and (= (size!978 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!977 _keys!1833) (size!978 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29845 () Bool)

(declare-fun e!19221 () Bool)

(assert (=> b!29845 (= e!19221 tp_is_empty!1321)))

(declare-fun res!17935 () Bool)

(assert (=> start!4052 (=> (not res!17935) (not e!19220))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4052 (= res!17935 (validMask!0 mask!2294))))

(assert (=> start!4052 e!19220))

(assert (=> start!4052 true))

(assert (=> start!4052 tp!4320))

(declare-fun e!19222 () Bool)

(declare-fun array_inv!615 (array!1847) Bool)

(assert (=> start!4052 (and (array_inv!615 _values!1501) e!19222)))

(declare-fun array_inv!616 (array!1845) Bool)

(assert (=> start!4052 (array_inv!616 _keys!1833)))

(assert (=> start!4052 tp_is_empty!1321))

(declare-fun mapIsEmpty!1510 () Bool)

(declare-fun mapRes!1510 () Bool)

(assert (=> mapIsEmpty!1510 mapRes!1510))

(declare-fun b!29846 () Bool)

(declare-fun res!17931 () Bool)

(assert (=> b!29846 (=> (not res!17931) (not e!19220))))

(declare-fun arrayContainsKey!0 (array!1845 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29846 (= res!17931 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!1510 () Bool)

(declare-fun tp!4321 () Bool)

(assert (=> mapNonEmpty!1510 (= mapRes!1510 (and tp!4321 e!19219))))

(declare-fun mapValue!1510 () ValueCell!461)

(declare-fun mapRest!1510 () (Array (_ BitVec 32) ValueCell!461))

(declare-fun mapKey!1510 () (_ BitVec 32))

(assert (=> mapNonEmpty!1510 (= (arr!877 _values!1501) (store mapRest!1510 mapKey!1510 mapValue!1510))))

(declare-fun b!29847 () Bool)

(declare-fun res!17929 () Bool)

(assert (=> b!29847 (=> (not res!17929) (not e!19220))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1845 (_ BitVec 32)) Bool)

(assert (=> b!29847 (= res!17929 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29848 () Bool)

(assert (=> b!29848 (= e!19222 (and e!19221 mapRes!1510))))

(declare-fun condMapEmpty!1510 () Bool)

(declare-fun mapDefault!1510 () ValueCell!461)

(assert (=> b!29848 (= condMapEmpty!1510 (= (arr!877 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!461)) mapDefault!1510)))))

(declare-fun b!29849 () Bool)

(declare-fun res!17934 () Bool)

(assert (=> b!29849 (=> (not res!17934) (not e!19220))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1587)

(declare-fun minValue!1443 () V!1587)

(declare-datatypes ((tuple2!1144 0))(
  ( (tuple2!1145 (_1!583 (_ BitVec 64)) (_2!583 V!1587)) )
))
(declare-datatypes ((List!727 0))(
  ( (Nil!724) (Cons!723 (h!1290 tuple2!1144) (t!3413 List!727)) )
))
(declare-datatypes ((ListLongMap!709 0))(
  ( (ListLongMap!710 (toList!370 List!727)) )
))
(declare-fun contains!311 (ListLongMap!709 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!194 (array!1845 array!1847 (_ BitVec 32) (_ BitVec 32) V!1587 V!1587 (_ BitVec 32) Int) ListLongMap!709)

(assert (=> b!29849 (= res!17934 (not (contains!311 (getCurrentListMap!194 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!29850 () Bool)

(assert (=> b!29850 (= e!19220 false)))

(declare-datatypes ((SeekEntryResult!96 0))(
  ( (MissingZero!96 (index!2506 (_ BitVec 32))) (Found!96 (index!2507 (_ BitVec 32))) (Intermediate!96 (undefined!908 Bool) (index!2508 (_ BitVec 32)) (x!6478 (_ BitVec 32))) (Undefined!96) (MissingVacant!96 (index!2509 (_ BitVec 32))) )
))
(declare-fun lt!11362 () SeekEntryResult!96)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1845 (_ BitVec 32)) SeekEntryResult!96)

(assert (=> b!29850 (= lt!11362 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(assert (= (and start!4052 res!17935) b!29844))

(assert (= (and b!29844 res!17932) b!29847))

(assert (= (and b!29847 res!17929) b!29842))

(assert (= (and b!29842 res!17933) b!29841))

(assert (= (and b!29841 res!17930) b!29849))

(assert (= (and b!29849 res!17934) b!29846))

(assert (= (and b!29846 res!17931) b!29850))

(assert (= (and b!29848 condMapEmpty!1510) mapIsEmpty!1510))

(assert (= (and b!29848 (not condMapEmpty!1510)) mapNonEmpty!1510))

(get-info :version)

(assert (= (and mapNonEmpty!1510 ((_ is ValueCellFull!461) mapValue!1510)) b!29843))

(assert (= (and b!29848 ((_ is ValueCellFull!461) mapDefault!1510)) b!29845))

(assert (= start!4052 b!29848))

(declare-fun m!23985 () Bool)

(assert (=> b!29849 m!23985))

(assert (=> b!29849 m!23985))

(declare-fun m!23987 () Bool)

(assert (=> b!29849 m!23987))

(declare-fun m!23989 () Bool)

(assert (=> b!29842 m!23989))

(declare-fun m!23991 () Bool)

(assert (=> b!29847 m!23991))

(declare-fun m!23993 () Bool)

(assert (=> b!29841 m!23993))

(declare-fun m!23995 () Bool)

(assert (=> mapNonEmpty!1510 m!23995))

(declare-fun m!23997 () Bool)

(assert (=> start!4052 m!23997))

(declare-fun m!23999 () Bool)

(assert (=> start!4052 m!23999))

(declare-fun m!24001 () Bool)

(assert (=> start!4052 m!24001))

(declare-fun m!24003 () Bool)

(assert (=> b!29850 m!24003))

(declare-fun m!24005 () Bool)

(assert (=> b!29846 m!24005))

(check-sat (not start!4052) (not b!29841) (not b_next!967) (not b!29846) (not b!29849) (not b!29842) (not b!29850) (not mapNonEmpty!1510) b_and!1771 (not b!29847) tp_is_empty!1321)
(check-sat b_and!1771 (not b_next!967))
