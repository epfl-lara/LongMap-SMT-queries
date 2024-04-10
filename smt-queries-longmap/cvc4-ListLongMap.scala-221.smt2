; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4012 () Bool)

(assert start!4012)

(declare-fun b_free!917 () Bool)

(declare-fun b_next!917 () Bool)

(assert (=> start!4012 (= b_free!917 (not b_next!917))))

(declare-fun tp!4171 () Bool)

(declare-fun b_and!1727 () Bool)

(assert (=> start!4012 (= tp!4171 b_and!1727)))

(declare-fun b!29181 () Bool)

(declare-fun res!17472 () Bool)

(declare-fun e!18853 () Bool)

(assert (=> b!29181 (=> (not res!17472) (not e!18853))))

(declare-datatypes ((array!1775 0))(
  ( (array!1776 (arr!841 (Array (_ BitVec 32) (_ BitVec 64))) (size!942 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1775)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1775 (_ BitVec 32)) Bool)

(assert (=> b!29181 (= res!17472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!29182 () Bool)

(declare-fun e!18852 () Bool)

(assert (=> b!29182 (= e!18853 e!18852)))

(declare-fun res!17475 () Bool)

(assert (=> b!29182 (=> (not res!17475) (not e!18852))))

(declare-datatypes ((V!1519 0))(
  ( (V!1520 (val!662 Int)) )
))
(declare-datatypes ((tuple2!1098 0))(
  ( (tuple2!1099 (_1!560 (_ BitVec 64)) (_2!560 V!1519)) )
))
(declare-datatypes ((List!698 0))(
  ( (Nil!695) (Cons!694 (h!1261 tuple2!1098) (t!3391 List!698)) )
))
(declare-datatypes ((ListLongMap!675 0))(
  ( (ListLongMap!676 (toList!353 List!698)) )
))
(declare-fun lt!11125 () ListLongMap!675)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun contains!293 (ListLongMap!675 (_ BitVec 64)) Bool)

(assert (=> b!29182 (= res!17475 (not (contains!293 lt!11125 k!1304)))))

(declare-datatypes ((ValueCell!436 0))(
  ( (ValueCellFull!436 (v!1751 V!1519)) (EmptyCell!436) )
))
(declare-datatypes ((array!1777 0))(
  ( (array!1778 (arr!842 (Array (_ BitVec 32) ValueCell!436)) (size!943 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1777)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun defaultEntry!1504 () Int)

(declare-fun zeroValue!1443 () V!1519)

(declare-fun minValue!1443 () V!1519)

(declare-fun getCurrentListMap!183 (array!1775 array!1777 (_ BitVec 32) (_ BitVec 32) V!1519 V!1519 (_ BitVec 32) Int) ListLongMap!675)

(assert (=> b!29182 (= lt!11125 (getCurrentListMap!183 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun res!17476 () Bool)

(assert (=> start!4012 (=> (not res!17476) (not e!18853))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4012 (= res!17476 (validMask!0 mask!2294))))

(assert (=> start!4012 e!18853))

(assert (=> start!4012 true))

(assert (=> start!4012 tp!4171))

(declare-fun e!18851 () Bool)

(declare-fun array_inv!583 (array!1777) Bool)

(assert (=> start!4012 (and (array_inv!583 _values!1501) e!18851)))

(declare-fun array_inv!584 (array!1775) Bool)

(assert (=> start!4012 (array_inv!584 _keys!1833)))

(declare-fun tp_is_empty!1271 () Bool)

(assert (=> start!4012 tp_is_empty!1271))

(declare-fun b!29183 () Bool)

(declare-fun e!18850 () Bool)

(assert (=> b!29183 (= e!18850 tp_is_empty!1271)))

(declare-fun b!29184 () Bool)

(declare-fun e!18854 () Bool)

(assert (=> b!29184 (= e!18854 tp_is_empty!1271)))

(declare-fun b!29185 () Bool)

(declare-fun res!17473 () Bool)

(assert (=> b!29185 (=> (not res!17473) (not e!18853))))

(assert (=> b!29185 (= res!17473 (and (= (size!943 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!942 _keys!1833) (size!943 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!1435 () Bool)

(declare-fun mapRes!1435 () Bool)

(declare-fun tp!4170 () Bool)

(assert (=> mapNonEmpty!1435 (= mapRes!1435 (and tp!4170 e!18850))))

(declare-fun mapValue!1435 () ValueCell!436)

(declare-fun mapKey!1435 () (_ BitVec 32))

(declare-fun mapRest!1435 () (Array (_ BitVec 32) ValueCell!436))

(assert (=> mapNonEmpty!1435 (= (arr!842 _values!1501) (store mapRest!1435 mapKey!1435 mapValue!1435))))

(declare-fun b!29186 () Bool)

(declare-fun res!17474 () Bool)

(assert (=> b!29186 (=> (not res!17474) (not e!18853))))

(declare-datatypes ((List!699 0))(
  ( (Nil!696) (Cons!695 (h!1262 (_ BitVec 64)) (t!3392 List!699)) )
))
(declare-fun arrayNoDuplicates!0 (array!1775 (_ BitVec 32) List!699) Bool)

(assert (=> b!29186 (= res!17474 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!696))))

(declare-fun mapIsEmpty!1435 () Bool)

(assert (=> mapIsEmpty!1435 mapRes!1435))

(declare-fun b!29187 () Bool)

(declare-fun res!17477 () Bool)

(assert (=> b!29187 (=> (not res!17477) (not e!18853))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!29187 (= res!17477 (validKeyInArray!0 k!1304))))

(declare-fun b!29188 () Bool)

(assert (=> b!29188 (= e!18851 (and e!18854 mapRes!1435))))

(declare-fun condMapEmpty!1435 () Bool)

(declare-fun mapDefault!1435 () ValueCell!436)

