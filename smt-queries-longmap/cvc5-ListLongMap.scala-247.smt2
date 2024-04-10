; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4164 () Bool)

(assert start!4164)

(declare-fun b_free!1069 () Bool)

(declare-fun b_next!1069 () Bool)

(assert (=> start!4164 (= b_free!1069 (not b_next!1069))))

(declare-fun tp!4627 () Bool)

(declare-fun b_and!1879 () Bool)

(assert (=> start!4164 (= tp!4627 b_and!1879)))

(declare-fun mapNonEmpty!1663 () Bool)

(declare-fun mapRes!1663 () Bool)

(declare-fun tp!4626 () Bool)

(declare-fun e!20084 () Bool)

(assert (=> mapNonEmpty!1663 (= mapRes!1663 (and tp!4626 e!20084))))

(declare-datatypes ((V!1723 0))(
  ( (V!1724 (val!738 Int)) )
))
(declare-datatypes ((ValueCell!512 0))(
  ( (ValueCellFull!512 (v!1827 V!1723)) (EmptyCell!512) )
))
(declare-datatypes ((array!2065 0))(
  ( (array!2066 (arr!986 (Array (_ BitVec 32) ValueCell!512)) (size!1087 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2065)

(declare-fun mapValue!1663 () ValueCell!512)

(declare-fun mapKey!1663 () (_ BitVec 32))

(declare-fun mapRest!1663 () (Array (_ BitVec 32) ValueCell!512))

(assert (=> mapNonEmpty!1663 (= (arr!986 _values!1501) (store mapRest!1663 mapKey!1663 mapValue!1663))))

(declare-fun b!31421 () Bool)

(declare-fun e!20080 () Bool)

(assert (=> b!31421 (= e!20080 false)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun lt!11564 () Bool)

(declare-datatypes ((array!2067 0))(
  ( (array!2068 (arr!987 (Array (_ BitVec 32) (_ BitVec 64))) (size!1088 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2067)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1723)

(declare-fun minValue!1443 () V!1723)

(declare-datatypes ((tuple2!1204 0))(
  ( (tuple2!1205 (_1!613 (_ BitVec 64)) (_2!613 V!1723)) )
))
(declare-datatypes ((List!799 0))(
  ( (Nil!796) (Cons!795 (h!1362 tuple2!1204) (t!3492 List!799)) )
))
(declare-datatypes ((ListLongMap!781 0))(
  ( (ListLongMap!782 (toList!406 List!799)) )
))
(declare-fun contains!346 (ListLongMap!781 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!234 (array!2067 array!2065 (_ BitVec 32) (_ BitVec 32) V!1723 V!1723 (_ BitVec 32) Int) ListLongMap!781)

(assert (=> b!31421 (= lt!11564 (contains!346 (getCurrentListMap!234 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304))))

(declare-fun res!19031 () Bool)

(assert (=> start!4164 (=> (not res!19031) (not e!20080))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4164 (= res!19031 (validMask!0 mask!2294))))

(assert (=> start!4164 e!20080))

(assert (=> start!4164 true))

(assert (=> start!4164 tp!4627))

(declare-fun e!20083 () Bool)

(declare-fun array_inv!687 (array!2065) Bool)

(assert (=> start!4164 (and (array_inv!687 _values!1501) e!20083)))

(declare-fun array_inv!688 (array!2067) Bool)

(assert (=> start!4164 (array_inv!688 _keys!1833)))

(declare-fun tp_is_empty!1423 () Bool)

(assert (=> start!4164 tp_is_empty!1423))

(declare-fun b!31422 () Bool)

(declare-fun res!19032 () Bool)

(assert (=> b!31422 (=> (not res!19032) (not e!20080))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2067 (_ BitVec 32)) Bool)

(assert (=> b!31422 (= res!19032 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!31423 () Bool)

(declare-fun res!19029 () Bool)

(assert (=> b!31423 (=> (not res!19029) (not e!20080))))

(assert (=> b!31423 (= res!19029 (and (= (size!1087 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1088 _keys!1833) (size!1087 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!31424 () Bool)

(declare-fun e!20082 () Bool)

(assert (=> b!31424 (= e!20083 (and e!20082 mapRes!1663))))

(declare-fun condMapEmpty!1663 () Bool)

(declare-fun mapDefault!1663 () ValueCell!512)

