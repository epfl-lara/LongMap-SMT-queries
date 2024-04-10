; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4294 () Bool)

(assert start!4294)

(declare-fun b_free!1159 () Bool)

(declare-fun b_next!1159 () Bool)

(assert (=> start!4294 (= b_free!1159 (not b_next!1159))))

(declare-fun tp!4902 () Bool)

(declare-fun b_and!1973 () Bool)

(assert (=> start!4294 (= tp!4902 b_and!1973)))

(declare-fun mapIsEmpty!1804 () Bool)

(declare-fun mapRes!1804 () Bool)

(assert (=> mapIsEmpty!1804 mapRes!1804))

(declare-fun b!33010 () Bool)

(declare-fun res!20077 () Bool)

(declare-fun e!20971 () Bool)

(assert (=> b!33010 (=> (not res!20077) (not e!20971))))

(declare-datatypes ((array!2239 0))(
  ( (array!2240 (arr!1071 (Array (_ BitVec 32) (_ BitVec 64))) (size!1172 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2239)

(declare-datatypes ((List!867 0))(
  ( (Nil!864) (Cons!863 (h!1430 (_ BitVec 64)) (t!3564 List!867)) )
))
(declare-fun arrayNoDuplicates!0 (array!2239 (_ BitVec 32) List!867) Bool)

(assert (=> b!33010 (= res!20077 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!864))))

(declare-fun b!33011 () Bool)

(declare-fun res!20078 () Bool)

(assert (=> b!33011 (=> (not res!20078) (not e!20971))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2239 (_ BitVec 32)) Bool)

(assert (=> b!33011 (= res!20078 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!33012 () Bool)

(declare-fun e!20966 () Bool)

(declare-fun e!20970 () Bool)

(assert (=> b!33012 (= e!20966 (not e!20970))))

(declare-fun res!20076 () Bool)

(assert (=> b!33012 (=> res!20076 e!20970)))

(assert (=> b!33012 (= res!20076 (not (= (size!1172 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294))))))

(declare-datatypes ((V!1843 0))(
  ( (V!1844 (val!783 Int)) )
))
(declare-datatypes ((tuple2!1276 0))(
  ( (tuple2!1277 (_1!649 (_ BitVec 64)) (_2!649 V!1843)) )
))
(declare-datatypes ((List!868 0))(
  ( (Nil!865) (Cons!864 (h!1431 tuple2!1276) (t!3565 List!868)) )
))
(declare-datatypes ((ListLongMap!853 0))(
  ( (ListLongMap!854 (toList!442 List!868)) )
))
(declare-fun lt!11956 () ListLongMap!853)

(declare-fun lt!11955 () (_ BitVec 32))

(declare-fun contains!384 (ListLongMap!853 (_ BitVec 64)) Bool)

(assert (=> b!33012 (contains!384 lt!11956 (select (arr!1071 _keys!1833) lt!11955))))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((ValueCell!557 0))(
  ( (ValueCellFull!557 (v!1874 V!1843)) (EmptyCell!557) )
))
(declare-datatypes ((array!2241 0))(
  ( (array!2242 (arr!1072 (Array (_ BitVec 32) ValueCell!557)) (size!1173 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2241)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((Unit!731 0))(
  ( (Unit!732) )
))
(declare-fun lt!11957 () Unit!731)

(declare-fun zeroValue!1443 () V!1843)

(declare-fun minValue!1443 () V!1843)

(declare-fun lemmaValidKeyInArrayIsInListMap!55 (array!2239 array!2241 (_ BitVec 32) (_ BitVec 32) V!1843 V!1843 (_ BitVec 32) Int) Unit!731)

(assert (=> b!33012 (= lt!11957 (lemmaValidKeyInArrayIsInListMap!55 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11955 defaultEntry!1504))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2239 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!33012 (= lt!11955 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!33013 () Bool)

(declare-fun res!20073 () Bool)

(assert (=> b!33013 (=> (not res!20073) (not e!20971))))

(assert (=> b!33013 (= res!20073 (and (= (size!1173 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1172 _keys!1833) (size!1173 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun res!20072 () Bool)

(assert (=> start!4294 (=> (not res!20072) (not e!20971))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4294 (= res!20072 (validMask!0 mask!2294))))

(assert (=> start!4294 e!20971))

(assert (=> start!4294 true))

(assert (=> start!4294 tp!4902))

(declare-fun e!20968 () Bool)

(declare-fun array_inv!753 (array!2241) Bool)

(assert (=> start!4294 (and (array_inv!753 _values!1501) e!20968)))

(declare-fun array_inv!754 (array!2239) Bool)

(assert (=> start!4294 (array_inv!754 _keys!1833)))

(declare-fun tp_is_empty!1513 () Bool)

(assert (=> start!4294 tp_is_empty!1513))

(declare-fun b!33014 () Bool)

(declare-fun e!20972 () Bool)

(assert (=> b!33014 (= e!20972 tp_is_empty!1513)))

(declare-fun b!33015 () Bool)

(assert (=> b!33015 (= e!20968 (and e!20972 mapRes!1804))))

(declare-fun condMapEmpty!1804 () Bool)

(declare-fun mapDefault!1804 () ValueCell!557)

