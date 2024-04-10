; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4068 () Bool)

(assert start!4068)

(declare-fun b_free!973 () Bool)

(declare-fun b_next!973 () Bool)

(assert (=> start!4068 (= b_free!973 (not b_next!973))))

(declare-fun tp!4339 () Bool)

(declare-fun b_and!1783 () Bool)

(assert (=> start!4068 (= tp!4339 b_and!1783)))

(declare-fun b!29985 () Bool)

(declare-fun res!18030 () Bool)

(declare-fun e!19308 () Bool)

(assert (=> b!29985 (=> (not res!18030) (not e!19308))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1595 0))(
  ( (V!1596 (val!690 Int)) )
))
(declare-datatypes ((ValueCell!464 0))(
  ( (ValueCellFull!464 (v!1779 V!1595)) (EmptyCell!464) )
))
(declare-datatypes ((array!1883 0))(
  ( (array!1884 (arr!895 (Array (_ BitVec 32) ValueCell!464)) (size!996 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1883)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-datatypes ((array!1885 0))(
  ( (array!1886 (arr!896 (Array (_ BitVec 32) (_ BitVec 64))) (size!997 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1885)

(declare-fun zeroValue!1443 () V!1595)

(declare-fun minValue!1443 () V!1595)

(declare-datatypes ((tuple2!1144 0))(
  ( (tuple2!1145 (_1!583 (_ BitVec 64)) (_2!583 V!1595)) )
))
(declare-datatypes ((List!740 0))(
  ( (Nil!737) (Cons!736 (h!1303 tuple2!1144) (t!3433 List!740)) )
))
(declare-datatypes ((ListLongMap!721 0))(
  ( (ListLongMap!722 (toList!376 List!740)) )
))
(declare-fun contains!316 (ListLongMap!721 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!204 (array!1885 array!1883 (_ BitVec 32) (_ BitVec 32) V!1595 V!1595 (_ BitVec 32) Int) ListLongMap!721)

(assert (=> b!29985 (= res!18030 (not (contains!316 (getCurrentListMap!204 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!29986 () Bool)

(declare-fun res!18024 () Bool)

(assert (=> b!29986 (=> (not res!18024) (not e!19308))))

(declare-fun arrayContainsKey!0 (array!1885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!29986 (= res!18024 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!29987 () Bool)

(declare-fun e!19306 () Bool)

(declare-fun tp_is_empty!1327 () Bool)

(assert (=> b!29987 (= e!19306 tp_is_empty!1327)))

(declare-fun mapNonEmpty!1519 () Bool)

(declare-fun mapRes!1519 () Bool)

(declare-fun tp!4338 () Bool)

(assert (=> mapNonEmpty!1519 (= mapRes!1519 (and tp!4338 e!19306))))

(declare-fun mapRest!1519 () (Array (_ BitVec 32) ValueCell!464))

(declare-fun mapValue!1519 () ValueCell!464)

(declare-fun mapKey!1519 () (_ BitVec 32))

(assert (=> mapNonEmpty!1519 (= (arr!895 _values!1501) (store mapRest!1519 mapKey!1519 mapValue!1519))))

(declare-fun b!29988 () Bool)

(declare-fun res!18027 () Bool)

(assert (=> b!29988 (=> (not res!18027) (not e!19308))))

(assert (=> b!29988 (= res!18027 (and (= (size!996 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!997 _keys!1833) (size!996 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!29989 () Bool)

(declare-fun res!18026 () Bool)

(assert (=> b!29989 (=> (not res!18026) (not e!19308))))

(declare-datatypes ((List!741 0))(
  ( (Nil!738) (Cons!737 (h!1304 (_ BitVec 64)) (t!3434 List!741)) )
))
(declare-fun arrayNoDuplicates!0 (array!1885 (_ BitVec 32) List!741) Bool)

(assert (=> b!29989 (= res!18026 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!738))))

(declare-fun mapIsEmpty!1519 () Bool)

(assert (=> mapIsEmpty!1519 mapRes!1519))

(declare-fun b!29990 () Bool)

(assert (=> b!29990 (= e!19308 false)))

(declare-datatypes ((SeekEntryResult!94 0))(
  ( (MissingZero!94 (index!2498 (_ BitVec 32))) (Found!94 (index!2499 (_ BitVec 32))) (Intermediate!94 (undefined!906 Bool) (index!2500 (_ BitVec 32)) (x!6484 (_ BitVec 32))) (Undefined!94) (MissingVacant!94 (index!2501 (_ BitVec 32))) )
))
(declare-fun lt!11375 () SeekEntryResult!94)

(declare-fun seekEntry!0 ((_ BitVec 64) array!1885 (_ BitVec 32)) SeekEntryResult!94)

(assert (=> b!29990 (= lt!11375 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!29991 () Bool)

(declare-fun res!18029 () Bool)

(assert (=> b!29991 (=> (not res!18029) (not e!19308))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29991 (= res!18029 (validKeyInArray!0 k!1304))))

(declare-fun b!29992 () Bool)

(declare-fun e!19310 () Bool)

(declare-fun e!19309 () Bool)

(assert (=> b!29992 (= e!19310 (and e!19309 mapRes!1519))))

(declare-fun condMapEmpty!1519 () Bool)

(declare-fun mapDefault!1519 () ValueCell!464)

