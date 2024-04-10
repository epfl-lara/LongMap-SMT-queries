; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4486 () Bool)

(assert start!4486)

(declare-fun b_free!1247 () Bool)

(declare-fun b_next!1247 () Bool)

(assert (=> start!4486 (= b_free!1247 (not b_next!1247))))

(declare-fun tp!5179 () Bool)

(declare-fun b_and!2069 () Bool)

(assert (=> start!4486 (= tp!5179 b_and!2069)))

(declare-fun b!34921 () Bool)

(declare-fun e!22090 () Bool)

(assert (=> b!34921 (= e!22090 false)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!154 0))(
  ( (MissingZero!154 (index!2738 (_ BitVec 32))) (Found!154 (index!2739 (_ BitVec 32))) (Intermediate!154 (undefined!966 Bool) (index!2740 (_ BitVec 32)) (x!6964 (_ BitVec 32))) (Undefined!154) (MissingVacant!154 (index!2741 (_ BitVec 32))) )
))
(declare-fun lt!12828 () SeekEntryResult!154)

(declare-datatypes ((array!2415 0))(
  ( (array!2416 (arr!1155 (Array (_ BitVec 32) (_ BitVec 64))) (size!1256 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2415)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun seekEntry!0 ((_ BitVec 64) array!2415 (_ BitVec 32)) SeekEntryResult!154)

(assert (=> b!34921 (= lt!12828 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun b!34922 () Bool)

(declare-fun res!21229 () Bool)

(assert (=> b!34922 (=> (not res!21229) (not e!22090))))

(declare-datatypes ((List!928 0))(
  ( (Nil!925) (Cons!924 (h!1491 (_ BitVec 64)) (t!3633 List!928)) )
))
(declare-fun arrayNoDuplicates!0 (array!2415 (_ BitVec 32) List!928) Bool)

(assert (=> b!34922 (= res!21229 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!925))))

(declare-fun b!34923 () Bool)

(declare-fun res!21225 () Bool)

(assert (=> b!34923 (=> (not res!21225) (not e!22090))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1959 0))(
  ( (V!1960 (val!827 Int)) )
))
(declare-datatypes ((ValueCell!601 0))(
  ( (ValueCellFull!601 (v!1922 V!1959)) (EmptyCell!601) )
))
(declare-datatypes ((array!2417 0))(
  ( (array!2418 (arr!1156 (Array (_ BitVec 32) ValueCell!601)) (size!1257 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2417)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1959)

(declare-fun minValue!1443 () V!1959)

(declare-datatypes ((tuple2!1338 0))(
  ( (tuple2!1339 (_1!680 (_ BitVec 64)) (_2!680 V!1959)) )
))
(declare-datatypes ((List!929 0))(
  ( (Nil!926) (Cons!925 (h!1492 tuple2!1338) (t!3634 List!929)) )
))
(declare-datatypes ((ListLongMap!915 0))(
  ( (ListLongMap!916 (toList!473 List!929)) )
))
(declare-fun contains!419 (ListLongMap!915 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!297 (array!2415 array!2417 (_ BitVec 32) (_ BitVec 32) V!1959 V!1959 (_ BitVec 32) Int) ListLongMap!915)

(assert (=> b!34923 (= res!21225 (not (contains!419 (getCurrentListMap!297 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!34924 () Bool)

(declare-fun res!21231 () Bool)

(assert (=> b!34924 (=> (not res!21231) (not e!22090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2415 (_ BitVec 32)) Bool)

(assert (=> b!34924 (= res!21231 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!34925 () Bool)

(declare-fun res!21228 () Bool)

(assert (=> b!34925 (=> (not res!21228) (not e!22090))))

(declare-fun arrayContainsKey!0 (array!2415 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34925 (= res!21228 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34926 () Bool)

(declare-fun res!21230 () Bool)

(assert (=> b!34926 (=> (not res!21230) (not e!22090))))

(assert (=> b!34926 (= res!21230 (and (= (size!1257 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1256 _keys!1833) (size!1257 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34927 () Bool)

(declare-fun e!22086 () Bool)

(declare-fun e!22089 () Bool)

(declare-fun mapRes!1948 () Bool)

(assert (=> b!34927 (= e!22086 (and e!22089 mapRes!1948))))

(declare-fun condMapEmpty!1948 () Bool)

(declare-fun mapDefault!1948 () ValueCell!601)

