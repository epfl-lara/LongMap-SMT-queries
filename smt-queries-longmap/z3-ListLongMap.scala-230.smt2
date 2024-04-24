; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4058 () Bool)

(assert start!4058)

(declare-fun b_free!967 () Bool)

(declare-fun b_next!967 () Bool)

(assert (=> start!4058 (= b_free!967 (not b_next!967))))

(declare-fun tp!4321 () Bool)

(declare-fun b_and!1767 () Bool)

(assert (=> start!4058 (= tp!4321 b_and!1767)))

(declare-fun b!29823 () Bool)

(declare-fun e!19210 () Bool)

(declare-fun e!19211 () Bool)

(declare-fun mapRes!1510 () Bool)

(assert (=> b!29823 (= e!19210 (and e!19211 mapRes!1510))))

(declare-fun condMapEmpty!1510 () Bool)

(declare-datatypes ((V!1587 0))(
  ( (V!1588 (val!687 Int)) )
))
(declare-datatypes ((ValueCell!461 0))(
  ( (ValueCellFull!461 (v!1776 V!1587)) (EmptyCell!461) )
))
(declare-datatypes ((array!1853 0))(
  ( (array!1854 (arr!880 (Array (_ BitVec 32) ValueCell!461)) (size!981 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1853)

(declare-fun mapDefault!1510 () ValueCell!461)

(assert (=> b!29823 (= condMapEmpty!1510 (= (arr!880 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!461)) mapDefault!1510)))))

(declare-fun b!29824 () Bool)

(declare-fun res!17922 () Bool)

(declare-fun e!19209 () Bool)

(assert (=> b!29824 (=> (not res!17922) (not e!19209))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1855 0))(
  ( (array!1856 (arr!881 (Array (_ BitVec 32) (_ BitVec 64))) (size!982 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1855)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!29824 (= res!17922 (and (= (size!981 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!982 _keys!1833) (size!981 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29825 () Bool)

(assert (=> b!29825 (= e!19209 false)))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!93 0))(
  ( (MissingZero!93 (index!2494 (_ BitVec 32))) (Found!93 (index!2495 (_ BitVec 32))) (Intermediate!93 (undefined!905 Bool) (index!2496 (_ BitVec 32)) (x!6475 (_ BitVec 32))) (Undefined!93) (MissingVacant!93 (index!2497 (_ BitVec 32))) )
))
(declare-fun lt!11322 () SeekEntryResult!93)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1855 (_ BitVec 32)) SeekEntryResult!93)

(assert (=> b!29825 (= lt!11322 (seekEntry!0 k0!1304 _keys!1833 mask!2294))))

(declare-fun b!29826 () Bool)

(declare-fun res!17925 () Bool)

(assert (=> b!29826 (=> (not res!17925) (not e!19209))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1587)

(declare-fun minValue!1443 () V!1587)

(declare-datatypes ((tuple2!1134 0))(
  ( (tuple2!1135 (_1!578 (_ BitVec 64)) (_2!578 V!1587)) )
))
(declare-datatypes ((List!725 0))(
  ( (Nil!722) (Cons!721 (h!1288 tuple2!1134) (t!3412 List!725)) )
))
(declare-datatypes ((ListLongMap!705 0))(
  ( (ListLongMap!706 (toList!368 List!725)) )
))
(declare-fun contains!310 (ListLongMap!705 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!193 (array!1855 array!1853 (_ BitVec 32) (_ BitVec 32) V!1587 V!1587 (_ BitVec 32) Int) ListLongMap!705)

(assert (=> b!29826 (= res!17925 (not (contains!310 (getCurrentListMap!193 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!29827 () Bool)

(declare-fun res!17923 () Bool)

(assert (=> b!29827 (=> (not res!17923) (not e!19209))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29827 (= res!17923 (validKeyInArray!0 k0!1304))))

(declare-fun mapIsEmpty!1510 () Bool)

(assert (=> mapIsEmpty!1510 mapRes!1510))

(declare-fun b!29828 () Bool)

(declare-fun res!17926 () Bool)

(assert (=> b!29828 (=> (not res!17926) (not e!19209))))

(declare-datatypes ((List!726 0))(
  ( (Nil!723) (Cons!722 (h!1289 (_ BitVec 64)) (t!3413 List!726)) )
))
(declare-fun arrayNoDuplicates!0 (array!1855 (_ BitVec 32) List!726) Bool)

(assert (=> b!29828 (= res!17926 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!723))))

(declare-fun mapNonEmpty!1510 () Bool)

(declare-fun tp!4320 () Bool)

(declare-fun e!19212 () Bool)

(assert (=> mapNonEmpty!1510 (= mapRes!1510 (and tp!4320 e!19212))))

(declare-fun mapKey!1510 () (_ BitVec 32))

(declare-fun mapValue!1510 () ValueCell!461)

(declare-fun mapRest!1510 () (Array (_ BitVec 32) ValueCell!461))

(assert (=> mapNonEmpty!1510 (= (arr!880 _values!1501) (store mapRest!1510 mapKey!1510 mapValue!1510))))

(declare-fun b!29829 () Bool)

(declare-fun res!17927 () Bool)

(assert (=> b!29829 (=> (not res!17927) (not e!19209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1855 (_ BitVec 32)) Bool)

(assert (=> b!29829 (= res!17927 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!17921 () Bool)

(assert (=> start!4058 (=> (not res!17921) (not e!19209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4058 (= res!17921 (validMask!0 mask!2294))))

(assert (=> start!4058 e!19209))

(assert (=> start!4058 true))

(assert (=> start!4058 tp!4321))

(declare-fun array_inv!609 (array!1853) Bool)

(assert (=> start!4058 (and (array_inv!609 _values!1501) e!19210)))

(declare-fun array_inv!610 (array!1855) Bool)

(assert (=> start!4058 (array_inv!610 _keys!1833)))

(declare-fun tp_is_empty!1321 () Bool)

(assert (=> start!4058 tp_is_empty!1321))

(declare-fun b!29830 () Bool)

(declare-fun res!17924 () Bool)

(assert (=> b!29830 (=> (not res!17924) (not e!19209))))

(declare-fun arrayContainsKey!0 (array!1855 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29830 (= res!17924 (not (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000)))))

(declare-fun b!29831 () Bool)

(assert (=> b!29831 (= e!19212 tp_is_empty!1321)))

(declare-fun b!29832 () Bool)

(assert (=> b!29832 (= e!19211 tp_is_empty!1321)))

(assert (= (and start!4058 res!17921) b!29824))

(assert (= (and b!29824 res!17922) b!29829))

(assert (= (and b!29829 res!17927) b!29828))

(assert (= (and b!29828 res!17926) b!29827))

(assert (= (and b!29827 res!17923) b!29826))

(assert (= (and b!29826 res!17925) b!29830))

(assert (= (and b!29830 res!17924) b!29825))

(assert (= (and b!29823 condMapEmpty!1510) mapIsEmpty!1510))

(assert (= (and b!29823 (not condMapEmpty!1510)) mapNonEmpty!1510))

(get-info :version)

(assert (= (and mapNonEmpty!1510 ((_ is ValueCellFull!461) mapValue!1510)) b!29831))

(assert (= (and b!29823 ((_ is ValueCellFull!461) mapDefault!1510)) b!29832))

(assert (= start!4058 b!29823))

(declare-fun m!23903 () Bool)

(assert (=> b!29830 m!23903))

(declare-fun m!23905 () Bool)

(assert (=> b!29829 m!23905))

(declare-fun m!23907 () Bool)

(assert (=> b!29825 m!23907))

(declare-fun m!23909 () Bool)

(assert (=> b!29828 m!23909))

(declare-fun m!23911 () Bool)

(assert (=> b!29826 m!23911))

(assert (=> b!29826 m!23911))

(declare-fun m!23913 () Bool)

(assert (=> b!29826 m!23913))

(declare-fun m!23915 () Bool)

(assert (=> b!29827 m!23915))

(declare-fun m!23917 () Bool)

(assert (=> start!4058 m!23917))

(declare-fun m!23919 () Bool)

(assert (=> start!4058 m!23919))

(declare-fun m!23921 () Bool)

(assert (=> start!4058 m!23921))

(declare-fun m!23923 () Bool)

(assert (=> mapNonEmpty!1510 m!23923))

(check-sat (not b!29825) (not b!29826) (not b!29829) (not b!29830) (not mapNonEmpty!1510) b_and!1767 (not b!29827) (not start!4058) tp_is_empty!1321 (not b_next!967) (not b!29828))
(check-sat b_and!1767 (not b_next!967))
