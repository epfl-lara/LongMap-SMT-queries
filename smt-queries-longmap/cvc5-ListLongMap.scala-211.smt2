; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3948 () Bool)

(assert start!3948)

(declare-fun b_free!853 () Bool)

(declare-fun b_next!853 () Bool)

(assert (=> start!3948 (= b_free!853 (not b_next!853))))

(declare-fun tp!3979 () Bool)

(declare-fun b_and!1663 () Bool)

(assert (=> start!3948 (= tp!3979 b_and!1663)))

(declare-fun b!28176 () Bool)

(declare-fun res!16759 () Bool)

(declare-fun e!18244 () Bool)

(assert (=> b!28176 (=> (not res!16759) (not e!18244))))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1435 0))(
  ( (V!1436 (val!630 Int)) )
))
(declare-datatypes ((ValueCell!404 0))(
  ( (ValueCellFull!404 (v!1719 V!1435)) (EmptyCell!404) )
))
(declare-datatypes ((array!1653 0))(
  ( (array!1654 (arr!780 (Array (_ BitVec 32) ValueCell!404)) (size!881 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1653)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1655 0))(
  ( (array!1656 (arr!781 (Array (_ BitVec 32) (_ BitVec 64))) (size!882 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1655)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1435)

(declare-fun minValue!1443 () V!1435)

(declare-datatypes ((tuple2!1050 0))(
  ( (tuple2!1051 (_1!536 (_ BitVec 64)) (_2!536 V!1435)) )
))
(declare-datatypes ((List!651 0))(
  ( (Nil!648) (Cons!647 (h!1214 tuple2!1050) (t!3344 List!651)) )
))
(declare-datatypes ((ListLongMap!627 0))(
  ( (ListLongMap!628 (toList!329 List!651)) )
))
(declare-fun contains!269 (ListLongMap!627 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!159 (array!1655 array!1653 (_ BitVec 32) (_ BitVec 32) V!1435 V!1435 (_ BitVec 32) Int) ListLongMap!627)

(assert (=> b!28176 (= res!16759 (not (contains!269 (getCurrentListMap!159 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304)))))

(declare-fun b!28177 () Bool)

(declare-fun res!16760 () Bool)

(assert (=> b!28177 (=> (not res!16760) (not e!18244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!28177 (= res!16760 (validKeyInArray!0 k!1304))))

(declare-fun b!28178 () Bool)

(declare-fun e!18248 () Bool)

(declare-fun tp_is_empty!1207 () Bool)

(assert (=> b!28178 (= e!18248 tp_is_empty!1207)))

(declare-fun b!28179 () Bool)

(declare-fun res!16755 () Bool)

(assert (=> b!28179 (=> (not res!16755) (not e!18244))))

(declare-fun arrayContainsKey!0 (array!1655 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!28179 (= res!16755 (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun b!28180 () Bool)

(declare-fun res!16758 () Bool)

(assert (=> b!28180 (=> (not res!16758) (not e!18244))))

(declare-datatypes ((List!652 0))(
  ( (Nil!649) (Cons!648 (h!1215 (_ BitVec 64)) (t!3345 List!652)) )
))
(declare-fun arrayNoDuplicates!0 (array!1655 (_ BitVec 32) List!652) Bool)

(assert (=> b!28180 (= res!16758 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!649))))

(declare-fun res!16756 () Bool)

(assert (=> start!3948 (=> (not res!16756) (not e!18244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3948 (= res!16756 (validMask!0 mask!2294))))

(assert (=> start!3948 e!18244))

(assert (=> start!3948 true))

(assert (=> start!3948 tp!3979))

(declare-fun e!18245 () Bool)

(declare-fun array_inv!535 (array!1653) Bool)

(assert (=> start!3948 (and (array_inv!535 _values!1501) e!18245)))

(declare-fun array_inv!536 (array!1655) Bool)

(assert (=> start!3948 (array_inv!536 _keys!1833)))

(assert (=> start!3948 tp_is_empty!1207))

(declare-fun b!28181 () Bool)

(declare-fun e!18247 () Bool)

(declare-fun mapRes!1339 () Bool)

(assert (=> b!28181 (= e!18245 (and e!18247 mapRes!1339))))

(declare-fun condMapEmpty!1339 () Bool)

(declare-fun mapDefault!1339 () ValueCell!404)

