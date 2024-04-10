; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3826 () Bool)

(assert start!3826)

(declare-fun b_free!781 () Bool)

(declare-fun b_next!781 () Bool)

(assert (=> start!3826 (= b_free!781 (not b_next!781))))

(declare-fun tp!3754 () Bool)

(declare-fun b_and!1585 () Bool)

(assert (=> start!3826 (= tp!3754 b_and!1585)))

(declare-fun mapNonEmpty!1222 () Bool)

(declare-fun mapRes!1222 () Bool)

(declare-fun tp!3753 () Bool)

(declare-fun e!17486 () Bool)

(assert (=> mapNonEmpty!1222 (= mapRes!1222 (and tp!3753 e!17486))))

(declare-datatypes ((V!1339 0))(
  ( (V!1340 (val!594 Int)) )
))
(declare-datatypes ((ValueCell!368 0))(
  ( (ValueCellFull!368 (v!1680 V!1339)) (EmptyCell!368) )
))
(declare-datatypes ((array!1511 0))(
  ( (array!1512 (arr!712 (Array (_ BitVec 32) ValueCell!368)) (size!813 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1511)

(declare-fun mapRest!1222 () (Array (_ BitVec 32) ValueCell!368))

(declare-fun mapValue!1222 () ValueCell!368)

(declare-fun mapKey!1222 () (_ BitVec 32))

(assert (=> mapNonEmpty!1222 (= (arr!712 _values!1501) (store mapRest!1222 mapKey!1222 mapValue!1222))))

(declare-fun b!26797 () Bool)

(declare-fun res!15897 () Bool)

(declare-fun e!17485 () Bool)

(assert (=> b!26797 (=> (not res!15897) (not e!17485))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1513 0))(
  ( (array!1514 (arr!713 (Array (_ BitVec 32) (_ BitVec 64))) (size!814 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1513)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1339)

(declare-fun minValue!1443 () V!1339)

(declare-datatypes ((tuple2!1002 0))(
  ( (tuple2!1003 (_1!512 (_ BitVec 64)) (_2!512 V!1339)) )
))
(declare-datatypes ((List!603 0))(
  ( (Nil!600) (Cons!599 (h!1166 tuple2!1002) (t!3290 List!603)) )
))
(declare-datatypes ((ListLongMap!579 0))(
  ( (ListLongMap!580 (toList!305 List!603)) )
))
(declare-fun contains!242 (ListLongMap!579 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!135 (array!1513 array!1511 (_ BitVec 32) (_ BitVec 32) V!1339 V!1339 (_ BitVec 32) Int) ListLongMap!579)

(assert (=> b!26797 (= res!15897 (not (contains!242 (getCurrentListMap!135 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun mapIsEmpty!1222 () Bool)

(assert (=> mapIsEmpty!1222 mapRes!1222))

(declare-fun b!26798 () Bool)

(declare-fun e!17484 () Bool)

(declare-fun tp_is_empty!1135 () Bool)

(assert (=> b!26798 (= e!17484 tp_is_empty!1135)))

(declare-fun b!26800 () Bool)

(declare-fun res!15893 () Bool)

(assert (=> b!26800 (=> (not res!15893) (not e!17485))))

(assert (=> b!26800 (= res!15893 (and (= (size!813 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!814 _keys!1833) (size!813 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26801 () Bool)

(declare-fun res!15896 () Bool)

(assert (=> b!26801 (=> (not res!15896) (not e!17485))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!26801 (= res!15896 (validKeyInArray!0 k!1304))))

(declare-fun b!26802 () Bool)

(assert (=> b!26802 (= e!17486 tp_is_empty!1135)))

(declare-fun b!26803 () Bool)

(declare-fun e!17482 () Bool)

(assert (=> b!26803 (= e!17482 (and e!17484 mapRes!1222))))

(declare-fun condMapEmpty!1222 () Bool)

(declare-fun mapDefault!1222 () ValueCell!368)

