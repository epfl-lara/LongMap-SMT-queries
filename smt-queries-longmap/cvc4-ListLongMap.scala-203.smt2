; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3904 () Bool)

(assert start!3904)

(declare-fun b_free!809 () Bool)

(declare-fun b_next!809 () Bool)

(assert (=> start!3904 (= b_free!809 (not b_next!809))))

(declare-fun tp!3847 () Bool)

(declare-fun b_and!1619 () Bool)

(assert (=> start!3904 (= tp!3847 b_and!1619)))

(declare-fun b!27516 () Bool)

(declare-fun e!17917 () Bool)

(assert (=> b!27516 (= e!17917 false)))

(declare-fun lt!10688 () (_ BitVec 32))

(declare-datatypes ((array!1569 0))(
  ( (array!1570 (arr!738 (Array (_ BitVec 32) (_ BitVec 64))) (size!839 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1569)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1569 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27516 (= lt!10688 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!27517 () Bool)

(declare-fun res!16295 () Bool)

(assert (=> b!27517 (=> (not res!16295) (not e!17917))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1375 0))(
  ( (V!1376 (val!608 Int)) )
))
(declare-datatypes ((ValueCell!382 0))(
  ( (ValueCellFull!382 (v!1697 V!1375)) (EmptyCell!382) )
))
(declare-datatypes ((array!1571 0))(
  ( (array!1572 (arr!739 (Array (_ BitVec 32) ValueCell!382)) (size!840 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1571)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1375)

(declare-fun minValue!1443 () V!1375)

(declare-datatypes ((tuple2!1024 0))(
  ( (tuple2!1025 (_1!523 (_ BitVec 64)) (_2!523 V!1375)) )
))
(declare-datatypes ((List!624 0))(
  ( (Nil!621) (Cons!620 (h!1187 tuple2!1024) (t!3317 List!624)) )
))
(declare-datatypes ((ListLongMap!601 0))(
  ( (ListLongMap!602 (toList!316 List!624)) )
))
(declare-fun contains!256 (ListLongMap!601 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!146 (array!1569 array!1571 (_ BitVec 32) (_ BitVec 32) V!1375 V!1375 (_ BitVec 32) Int) ListLongMap!601)

(assert (=> b!27517 (= res!16295 (not (contains!256 (getCurrentListMap!146 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!27518 () Bool)

(declare-fun res!16299 () Bool)

(assert (=> b!27518 (=> (not res!16299) (not e!17917))))

(assert (=> b!27518 (= res!16299 (and (= (size!840 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!839 _keys!1833) (size!840 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27519 () Bool)

(declare-fun e!17914 () Bool)

(declare-fun e!17915 () Bool)

(declare-fun mapRes!1273 () Bool)

(assert (=> b!27519 (= e!17914 (and e!17915 mapRes!1273))))

(declare-fun condMapEmpty!1273 () Bool)

(declare-fun mapDefault!1273 () ValueCell!382)

