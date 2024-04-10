; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77796 () Bool)

(assert start!77796)

(declare-fun b_free!16355 () Bool)

(declare-fun b_next!16355 () Bool)

(assert (=> start!77796 (= b_free!16355 (not b_next!16355))))

(declare-fun tp!57329 () Bool)

(declare-fun b_and!26867 () Bool)

(assert (=> start!77796 (= tp!57329 b_and!26867)))

(declare-fun b!907940 () Bool)

(declare-fun res!612779 () Bool)

(declare-fun e!508860 () Bool)

(assert (=> b!907940 (=> res!612779 e!508860)))

(declare-datatypes ((V!29995 0))(
  ( (V!29996 (val!9437 Int)) )
))
(declare-fun lt!409531 () V!29995)

(declare-fun k!1033 () (_ BitVec 64))

(declare-datatypes ((tuple2!12290 0))(
  ( (tuple2!12291 (_1!6156 (_ BitVec 64)) (_2!6156 V!29995)) )
))
(declare-datatypes ((List!18090 0))(
  ( (Nil!18087) (Cons!18086 (h!19232 tuple2!12290) (t!25617 List!18090)) )
))
(declare-datatypes ((ListLongMap!10987 0))(
  ( (ListLongMap!10988 (toList!5509 List!18090)) )
))
(declare-fun lt!409535 () ListLongMap!10987)

(declare-fun apply!493 (ListLongMap!10987 (_ BitVec 64)) V!29995)

(assert (=> b!907940 (= res!612779 (not (= (apply!493 lt!409535 k!1033) lt!409531)))))

(declare-fun b!907941 () Bool)

(declare-fun res!612778 () Bool)

(declare-fun e!508856 () Bool)

(assert (=> b!907941 (=> (not res!612778) (not e!508856))))

(declare-fun i!717 () (_ BitVec 32))

(declare-fun mask!1756 () (_ BitVec 32))

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!907941 (= res!612778 (inRange!0 i!717 mask!1756))))

(declare-fun mapIsEmpty!29875 () Bool)

(declare-fun mapRes!29875 () Bool)

(assert (=> mapIsEmpty!29875 mapRes!29875))

(declare-fun mapNonEmpty!29875 () Bool)

(declare-fun tp!57330 () Bool)

(declare-fun e!508861 () Bool)

(assert (=> mapNonEmpty!29875 (= mapRes!29875 (and tp!57330 e!508861))))

(declare-datatypes ((ValueCell!8905 0))(
  ( (ValueCellFull!8905 (v!11944 V!29995)) (EmptyCell!8905) )
))
(declare-fun mapValue!29875 () ValueCell!8905)

(declare-fun mapRest!29875 () (Array (_ BitVec 32) ValueCell!8905))

(declare-datatypes ((array!53580 0))(
  ( (array!53581 (arr!25748 (Array (_ BitVec 32) ValueCell!8905)) (size!26207 (_ BitVec 32))) )
))
(declare-fun _values!1152 () array!53580)

(declare-fun mapKey!29875 () (_ BitVec 32))

(assert (=> mapNonEmpty!29875 (= (arr!25748 _values!1152) (store mapRest!29875 mapKey!29875 mapValue!29875))))

(declare-fun b!907942 () Bool)

(assert (=> b!907942 (= e!508860 true)))

(declare-fun lt!409534 () ListLongMap!10987)

(assert (=> b!907942 (= (apply!493 lt!409534 k!1033) lt!409531)))

(declare-fun defaultEntry!1160 () Int)

(declare-fun zeroValue!1094 () V!29995)

(declare-datatypes ((array!53582 0))(
  ( (array!53583 (arr!25749 (Array (_ BitVec 32) (_ BitVec 64))) (size!26208 (_ BitVec 32))) )
))
(declare-fun _keys!1386 () array!53582)

(declare-fun extraKeys!1073 () (_ BitVec 32))

(declare-fun minValue!1094 () V!29995)

(declare-datatypes ((Unit!30816 0))(
  ( (Unit!30817) )
))
(declare-fun lt!409532 () Unit!30816)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!46 (array!53582 array!53580 (_ BitVec 32) (_ BitVec 32) V!29995 V!29995 (_ BitVec 64) V!29995 (_ BitVec 32) Int) Unit!30816)

(assert (=> b!907942 (= lt!409532 (lemmaListMapApplyFromThenApplyFromZero!46 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 lt!409531 i!717 defaultEntry!1160))))

(declare-fun b!907943 () Bool)

(declare-fun res!612774 () Bool)

(declare-fun e!508862 () Bool)

(assert (=> b!907943 (=> (not res!612774) (not e!508862))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!53582 (_ BitVec 32)) Bool)

(assert (=> b!907943 (= res!612774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1386 mask!1756))))

(declare-fun res!612777 () Bool)

(assert (=> start!77796 (=> (not res!612777) (not e!508862))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!77796 (= res!612777 (validMask!0 mask!1756))))

(assert (=> start!77796 e!508862))

(declare-fun e!508863 () Bool)

(declare-fun array_inv!20160 (array!53580) Bool)

(assert (=> start!77796 (and (array_inv!20160 _values!1152) e!508863)))

(assert (=> start!77796 tp!57329))

(assert (=> start!77796 true))

(declare-fun tp_is_empty!18773 () Bool)

(assert (=> start!77796 tp_is_empty!18773))

(declare-fun array_inv!20161 (array!53582) Bool)

(assert (=> start!77796 (array_inv!20161 _keys!1386)))

(declare-fun b!907944 () Bool)

(declare-fun res!612783 () Bool)

(assert (=> b!907944 (=> (not res!612783) (not e!508856))))

(assert (=> b!907944 (= res!612783 (and (= (select (arr!25749 _keys!1386) i!717) k!1033) (not (= k!1033 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1033 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!907945 () Bool)

(declare-fun e!508858 () Bool)

(assert (=> b!907945 (= e!508856 (not e!508858))))

(declare-fun res!612780 () Bool)

(assert (=> b!907945 (=> res!612780 e!508858)))

(assert (=> b!907945 (= res!612780 (or (bvslt i!717 #b00000000000000000000000000000000) (bvsge i!717 (size!26208 _keys!1386))))))

(declare-fun get!13551 (ValueCell!8905 V!29995) V!29995)

(declare-fun dynLambda!1370 (Int (_ BitVec 64)) V!29995)

(assert (=> b!907945 (= lt!409531 (get!13551 (select (arr!25748 _values!1152) i!717) (dynLambda!1370 defaultEntry!1160 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!53582 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!907945 (arrayContainsKey!0 _keys!1386 k!1033 #b00000000000000000000000000000000)))

(declare-fun lt!409533 () Unit!30816)

(declare-fun lemmaKeyInListMapIsInArray!242 (array!53582 array!53580 (_ BitVec 32) (_ BitVec 32) V!29995 V!29995 (_ BitVec 64) Int) Unit!30816)

(assert (=> b!907945 (= lt!409533 (lemmaKeyInListMapIsInArray!242 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 k!1033 defaultEntry!1160))))

(declare-fun b!907946 () Bool)

(assert (=> b!907946 (= e!508858 e!508860)))

(declare-fun res!612782 () Bool)

(assert (=> b!907946 (=> res!612782 e!508860)))

(declare-fun contains!4553 (ListLongMap!10987 (_ BitVec 64)) Bool)

(assert (=> b!907946 (= res!612782 (not (contains!4553 lt!409535 k!1033)))))

(declare-fun getCurrentListMap!2773 (array!53582 array!53580 (_ BitVec 32) (_ BitVec 32) V!29995 V!29995 (_ BitVec 32) Int) ListLongMap!10987)

(assert (=> b!907946 (= lt!409535 (getCurrentListMap!2773 _keys!1386 _values!1152 mask!1756 extraKeys!1073 zeroValue!1094 minValue!1094 i!717 defaultEntry!1160))))

(declare-fun b!907947 () Bool)

(declare-fun e!508857 () Bool)

(assert (=> b!907947 (= e!508857 tp_is_empty!18773)))

(declare-fun b!907948 () Bool)

(assert (=> b!907948 (= e!508863 (and e!508857 mapRes!29875))))

(declare-fun condMapEmpty!29875 () Bool)

(declare-fun mapDefault!29875 () ValueCell!8905)

