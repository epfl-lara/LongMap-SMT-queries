; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4368 () Bool)

(assert start!4368)

(declare-fun b_free!1183 () Bool)

(declare-fun b_next!1183 () Bool)

(assert (=> start!4368 (= b_free!1183 (not b_next!1183))))

(declare-fun tp!4980 () Bool)

(declare-fun b_and!2001 () Bool)

(assert (=> start!4368 (= tp!4980 b_and!2001)))

(declare-fun b!33667 () Bool)

(declare-fun res!20443 () Bool)

(declare-fun e!21383 () Bool)

(assert (=> b!33667 (=> (not res!20443) (not e!21383))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((V!1875 0))(
  ( (V!1876 (val!795 Int)) )
))
(declare-datatypes ((ValueCell!569 0))(
  ( (ValueCellFull!569 (v!1888 V!1875)) (EmptyCell!569) )
))
(declare-datatypes ((array!2287 0))(
  ( (array!2288 (arr!1093 (Array (_ BitVec 32) ValueCell!569)) (size!1194 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2287)

(declare-datatypes ((array!2289 0))(
  ( (array!2290 (arr!1094 (Array (_ BitVec 32) (_ BitVec 64))) (size!1195 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2289)

(assert (=> b!33667 (= res!20443 (and (= (size!1194 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1195 _keys!1833) (size!1194 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!33668 () Bool)

(declare-fun e!21379 () Bool)

(assert (=> b!33668 (= e!21383 e!21379)))

(declare-fun res!20442 () Bool)

(assert (=> b!33668 (=> (not res!20442) (not e!21379))))

(declare-datatypes ((tuple2!1294 0))(
  ( (tuple2!1295 (_1!658 (_ BitVec 64)) (_2!658 V!1875)) )
))
(declare-datatypes ((List!884 0))(
  ( (Nil!881) (Cons!880 (h!1447 tuple2!1294) (t!3585 List!884)) )
))
(declare-datatypes ((ListLongMap!871 0))(
  ( (ListLongMap!872 (toList!451 List!884)) )
))
(declare-fun lt!12345 () ListLongMap!871)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun contains!395 (ListLongMap!871 (_ BitVec 64)) Bool)

(assert (=> b!33668 (= res!20442 (not (contains!395 lt!12345 k!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1875)

(declare-fun minValue!1443 () V!1875)

(declare-fun getCurrentListMap!277 (array!2289 array!2287 (_ BitVec 32) (_ BitVec 32) V!1875 V!1875 (_ BitVec 32) Int) ListLongMap!871)

(assert (=> b!33668 (= lt!12345 (getCurrentListMap!277 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun mapIsEmpty!1846 () Bool)

(declare-fun mapRes!1846 () Bool)

(assert (=> mapIsEmpty!1846 mapRes!1846))

(declare-fun lt!12343 () (_ BitVec 32))

(declare-fun b!33669 () Bool)

(assert (=> b!33669 (= e!21379 (not (or (not (= (size!1195 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))) (bvsgt #b00000000000000000000000000000000 (size!1195 _keys!1833)) (and (bvsge lt!12343 #b00000000000000000000000000000000) (bvsle lt!12343 (size!1195 _keys!1833))))))))

(declare-datatypes ((SeekEntryResult!131 0))(
  ( (MissingZero!131 (index!2646 (_ BitVec 32))) (Found!131 (index!2647 (_ BitVec 32))) (Intermediate!131 (undefined!943 Bool) (index!2648 (_ BitVec 32)) (x!6841 (_ BitVec 32))) (Undefined!131) (MissingVacant!131 (index!2649 (_ BitVec 32))) )
))
(declare-fun lt!12342 () SeekEntryResult!131)

(assert (=> b!33669 (and (is-Found!131 lt!12342) (= (index!2647 lt!12342) lt!12343))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2289 (_ BitVec 32)) SeekEntryResult!131)

(assert (=> b!33669 (= lt!12342 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-datatypes ((Unit!753 0))(
  ( (Unit!754) )
))
(declare-fun lt!12346 () Unit!753)

(declare-fun lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 ((_ BitVec 64) (_ BitVec 32) array!2289 (_ BitVec 32)) Unit!753)

(assert (=> b!33669 (= lt!12346 (lemmaSeekEntryOrOpenFindsThenSeekEntryFinds!0 k!1304 lt!12343 _keys!1833 mask!2294))))

(assert (=> b!33669 (contains!395 lt!12345 (select (arr!1094 _keys!1833) lt!12343))))

(declare-fun lt!12344 () Unit!753)

(declare-fun lemmaValidKeyInArrayIsInListMap!63 (array!2289 array!2287 (_ BitVec 32) (_ BitVec 32) V!1875 V!1875 (_ BitVec 32) Int) Unit!753)

(assert (=> b!33669 (= lt!12344 (lemmaValidKeyInArrayIsInListMap!63 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!12343 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2289 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33669 (= lt!12343 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!33670 () Bool)

(declare-fun e!21380 () Bool)

(declare-fun tp_is_empty!1537 () Bool)

(assert (=> b!33670 (= e!21380 tp_is_empty!1537)))

(declare-fun b!33671 () Bool)

(declare-fun e!21384 () Bool)

(assert (=> b!33671 (= e!21384 (and e!21380 mapRes!1846))))

(declare-fun condMapEmpty!1846 () Bool)

(declare-fun mapDefault!1846 () ValueCell!569)

