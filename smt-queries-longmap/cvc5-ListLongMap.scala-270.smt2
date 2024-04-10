; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4446 () Bool)

(assert start!4446)

(declare-fun b_free!1207 () Bool)

(declare-fun b_next!1207 () Bool)

(assert (=> start!4446 (= b_free!1207 (not b_next!1207))))

(declare-fun tp!5059 () Bool)

(declare-fun b_and!2029 () Bool)

(assert (=> start!4446 (= tp!5059 b_and!2029)))

(declare-fun b!34321 () Bool)

(declare-fun res!20810 () Bool)

(declare-fun e!21789 () Bool)

(assert (=> b!34321 (=> (not res!20810) (not e!21789))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1907 0))(
  ( (V!1908 (val!807 Int)) )
))
(declare-datatypes ((ValueCell!581 0))(
  ( (ValueCellFull!581 (v!1902 V!1907)) (EmptyCell!581) )
))
(declare-datatypes ((array!2339 0))(
  ( (array!2340 (arr!1117 (Array (_ BitVec 32) ValueCell!581)) (size!1218 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2339)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!2341 0))(
  ( (array!2342 (arr!1118 (Array (_ BitVec 32) (_ BitVec 64))) (size!1219 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2341)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1907)

(declare-fun minValue!1443 () V!1907)

(declare-datatypes ((tuple2!1314 0))(
  ( (tuple2!1315 (_1!668 (_ BitVec 64)) (_2!668 V!1907)) )
))
(declare-datatypes ((List!902 0))(
  ( (Nil!899) (Cons!898 (h!1465 tuple2!1314) (t!3607 List!902)) )
))
(declare-datatypes ((ListLongMap!891 0))(
  ( (ListLongMap!892 (toList!461 List!902)) )
))
(declare-fun contains!407 (ListLongMap!891 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!285 (array!2341 array!2339 (_ BitVec 32) (_ BitVec 32) V!1907 V!1907 (_ BitVec 32) Int) ListLongMap!891)

(assert (=> b!34321 (= res!20810 (not (contains!407 (getCurrentListMap!285 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!34322 () Bool)

(declare-fun res!20805 () Bool)

(assert (=> b!34322 (=> (not res!20805) (not e!21789))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34322 (= res!20805 (validKeyInArray!0 k!1304))))

(declare-fun b!34323 () Bool)

(declare-fun res!20806 () Bool)

(assert (=> b!34323 (=> (not res!20806) (not e!21789))))

(assert (=> b!34323 (= res!20806 (and (= (size!1218 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1219 _keys!1833) (size!1218 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1888 () Bool)

(declare-fun mapRes!1888 () Bool)

(declare-fun tp!5058 () Bool)

(declare-fun e!21786 () Bool)

(assert (=> mapNonEmpty!1888 (= mapRes!1888 (and tp!5058 e!21786))))

(declare-fun mapValue!1888 () ValueCell!581)

(declare-fun mapKey!1888 () (_ BitVec 32))

(declare-fun mapRest!1888 () (Array (_ BitVec 32) ValueCell!581))

(assert (=> mapNonEmpty!1888 (= (arr!1117 _values!1501) (store mapRest!1888 mapKey!1888 mapValue!1888))))

(declare-fun b!34324 () Bool)

(assert (=> b!34324 (= e!21789 false)))

(declare-datatypes ((SeekEntryResult!140 0))(
  ( (MissingZero!140 (index!2682 (_ BitVec 32))) (Found!140 (index!2683 (_ BitVec 32))) (Intermediate!140 (undefined!952 Bool) (index!2684 (_ BitVec 32)) (x!6902 (_ BitVec 32))) (Undefined!140) (MissingVacant!140 (index!2685 (_ BitVec 32))) )
))
(declare-fun lt!12768 () SeekEntryResult!140)

(declare-fun seekEntry!0 ((_ BitVec 64) array!2341 (_ BitVec 32)) SeekEntryResult!140)

(assert (=> b!34324 (= lt!12768 (seekEntry!0 k!1304 _keys!1833 mask!2294))))

(declare-fun res!20809 () Bool)

(assert (=> start!4446 (=> (not res!20809) (not e!21789))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4446 (= res!20809 (validMask!0 mask!2294))))

(assert (=> start!4446 e!21789))

(assert (=> start!4446 true))

(assert (=> start!4446 tp!5059))

(declare-fun e!21788 () Bool)

(declare-fun array_inv!787 (array!2339) Bool)

(assert (=> start!4446 (and (array_inv!787 _values!1501) e!21788)))

(declare-fun array_inv!788 (array!2341) Bool)

(assert (=> start!4446 (array_inv!788 _keys!1833)))

(declare-fun tp_is_empty!1561 () Bool)

(assert (=> start!4446 tp_is_empty!1561))

(declare-fun b!34325 () Bool)

(declare-fun e!21790 () Bool)

(assert (=> b!34325 (= e!21788 (and e!21790 mapRes!1888))))

(declare-fun condMapEmpty!1888 () Bool)

(declare-fun mapDefault!1888 () ValueCell!581)

