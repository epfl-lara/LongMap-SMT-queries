; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4170 () Bool)

(assert start!4170)

(declare-fun b_free!1075 () Bool)

(declare-fun b_next!1075 () Bool)

(assert (=> start!4170 (= b_free!1075 (not b_next!1075))))

(declare-fun tp!4645 () Bool)

(declare-fun b_and!1885 () Bool)

(assert (=> start!4170 (= tp!4645 b_and!1885)))

(declare-fun b!31497 () Bool)

(declare-fun e!20126 () Bool)

(declare-fun tp_is_empty!1429 () Bool)

(assert (=> b!31497 (= e!20126 tp_is_empty!1429)))

(declare-fun b!31498 () Bool)

(declare-fun e!20128 () Bool)

(assert (=> b!31498 (= e!20128 tp_is_empty!1429)))

(declare-fun b!31499 () Bool)

(declare-fun res!19078 () Bool)

(declare-fun e!20125 () Bool)

(assert (=> b!31499 (=> (not res!19078) (not e!20125))))

(declare-datatypes ((array!2075 0))(
  ( (array!2076 (arr!991 (Array (_ BitVec 32) (_ BitVec 64))) (size!1092 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2075)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2075 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!31499 (= res!19078 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1672 () Bool)

(declare-fun mapRes!1672 () Bool)

(declare-fun tp!4644 () Bool)

(assert (=> mapNonEmpty!1672 (= mapRes!1672 (and tp!4644 e!20126))))

(declare-datatypes ((V!1731 0))(
  ( (V!1732 (val!741 Int)) )
))
(declare-datatypes ((ValueCell!515 0))(
  ( (ValueCellFull!515 (v!1830 V!1731)) (EmptyCell!515) )
))
(declare-datatypes ((array!2077 0))(
  ( (array!2078 (arr!992 (Array (_ BitVec 32) ValueCell!515)) (size!1093 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2077)

(declare-fun mapValue!1672 () ValueCell!515)

(declare-fun mapRest!1672 () (Array (_ BitVec 32) ValueCell!515))

(declare-fun mapKey!1672 () (_ BitVec 32))

(assert (=> mapNonEmpty!1672 (= (arr!992 _values!1501) (store mapRest!1672 mapKey!1672 mapValue!1672))))

(declare-fun b!31500 () Bool)

(declare-fun res!19083 () Bool)

(assert (=> b!31500 (=> (not res!19083) (not e!20125))))

(declare-datatypes ((List!802 0))(
  ( (Nil!799) (Cons!798 (h!1365 (_ BitVec 64)) (t!3495 List!802)) )
))
(declare-fun arrayNoDuplicates!0 (array!2075 (_ BitVec 32) List!802) Bool)

(assert (=> b!31500 (= res!19083 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!799))))

(declare-fun b!31501 () Bool)

(declare-fun res!19079 () Bool)

(assert (=> b!31501 (=> (not res!19079) (not e!20125))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!31501 (= res!19079 (and (= (size!1093 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1092 _keys!1833) (size!1093 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!1672 () Bool)

(assert (=> mapIsEmpty!1672 mapRes!1672))

(declare-fun res!19082 () Bool)

(assert (=> start!4170 (=> (not res!19082) (not e!20125))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4170 (= res!19082 (validMask!0 mask!2294))))

(assert (=> start!4170 e!20125))

(assert (=> start!4170 true))

(assert (=> start!4170 tp!4645))

(declare-fun e!20129 () Bool)

(declare-fun array_inv!691 (array!2077) Bool)

(assert (=> start!4170 (and (array_inv!691 _values!1501) e!20129)))

(declare-fun array_inv!692 (array!2075) Bool)

(assert (=> start!4170 (array_inv!692 _keys!1833)))

(assert (=> start!4170 tp_is_empty!1429))

(declare-fun b!31502 () Bool)

(declare-fun res!19080 () Bool)

(assert (=> b!31502 (=> (not res!19080) (not e!20125))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1731)

(declare-fun minValue!1443 () V!1731)

(declare-datatypes ((tuple2!1208 0))(
  ( (tuple2!1209 (_1!615 (_ BitVec 64)) (_2!615 V!1731)) )
))
(declare-datatypes ((List!803 0))(
  ( (Nil!800) (Cons!799 (h!1366 tuple2!1208) (t!3496 List!803)) )
))
(declare-datatypes ((ListLongMap!785 0))(
  ( (ListLongMap!786 (toList!408 List!803)) )
))
(declare-fun contains!348 (ListLongMap!785 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!236 (array!2075 array!2077 (_ BitVec 32) (_ BitVec 32) V!1731 V!1731 (_ BitVec 32) Int) ListLongMap!785)

(assert (=> b!31502 (= res!19080 (not (contains!348 (getCurrentListMap!236 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!31503 () Bool)

(assert (=> b!31503 (= e!20129 (and e!20128 mapRes!1672))))

(declare-fun condMapEmpty!1672 () Bool)

(declare-fun mapDefault!1672 () ValueCell!515)

