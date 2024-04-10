; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3898 () Bool)

(assert start!3898)

(declare-fun b_free!803 () Bool)

(declare-fun b_next!803 () Bool)

(assert (=> start!3898 (= b_free!803 (not b_next!803))))

(declare-fun tp!3829 () Bool)

(declare-fun b_and!1613 () Bool)

(assert (=> start!3898 (= tp!3829 b_and!1613)))

(declare-fun b!27428 () Bool)

(declare-fun e!17871 () Bool)

(declare-fun tp_is_empty!1157 () Bool)

(assert (=> b!27428 (= e!17871 tp_is_empty!1157)))

(declare-fun b!27429 () Bool)

(declare-fun e!17872 () Bool)

(assert (=> b!27429 (= e!17872 false)))

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun defaultEntry!1504 () Int)

(declare-datatypes ((V!1367 0))(
  ( (V!1368 (val!605 Int)) )
))
(declare-datatypes ((ValueCell!379 0))(
  ( (ValueCellFull!379 (v!1694 V!1367)) (EmptyCell!379) )
))
(declare-datatypes ((array!1557 0))(
  ( (array!1558 (arr!732 (Array (_ BitVec 32) ValueCell!379)) (size!833 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1557)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1559 0))(
  ( (array!1560 (arr!733 (Array (_ BitVec 32) (_ BitVec 64))) (size!834 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1559)

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1367)

(declare-fun minValue!1443 () V!1367)

(declare-fun lt!10679 () Bool)

(declare-datatypes ((tuple2!1018 0))(
  ( (tuple2!1019 (_1!520 (_ BitVec 64)) (_2!520 V!1367)) )
))
(declare-datatypes ((List!618 0))(
  ( (Nil!615) (Cons!614 (h!1181 tuple2!1018) (t!3311 List!618)) )
))
(declare-datatypes ((ListLongMap!595 0))(
  ( (ListLongMap!596 (toList!313 List!618)) )
))
(declare-fun contains!253 (ListLongMap!595 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!143 (array!1559 array!1557 (_ BitVec 32) (_ BitVec 32) V!1367 V!1367 (_ BitVec 32) Int) ListLongMap!595)

(assert (=> b!27429 (= lt!10679 (contains!253 (getCurrentListMap!143 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k!1304))))

(declare-fun res!16232 () Bool)

(assert (=> start!3898 (=> (not res!16232) (not e!17872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3898 (= res!16232 (validMask!0 mask!2294))))

(assert (=> start!3898 e!17872))

(assert (=> start!3898 true))

(assert (=> start!3898 tp!3829))

(declare-fun e!17873 () Bool)

(declare-fun array_inv!505 (array!1557) Bool)

(assert (=> start!3898 (and (array_inv!505 _values!1501) e!17873)))

(declare-fun array_inv!506 (array!1559) Bool)

(assert (=> start!3898 (array_inv!506 _keys!1833)))

(assert (=> start!3898 tp_is_empty!1157))

(declare-fun b!27430 () Bool)

(declare-fun res!16234 () Bool)

(assert (=> b!27430 (=> (not res!16234) (not e!17872))))

(declare-datatypes ((List!619 0))(
  ( (Nil!616) (Cons!615 (h!1182 (_ BitVec 64)) (t!3312 List!619)) )
))
(declare-fun arrayNoDuplicates!0 (array!1559 (_ BitVec 32) List!619) Bool)

(assert (=> b!27430 (= res!16234 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!616))))

(declare-fun b!27431 () Bool)

(declare-fun e!17870 () Bool)

(assert (=> b!27431 (= e!17870 tp_is_empty!1157)))

(declare-fun mapIsEmpty!1264 () Bool)

(declare-fun mapRes!1264 () Bool)

(assert (=> mapIsEmpty!1264 mapRes!1264))

(declare-fun b!27432 () Bool)

(assert (=> b!27432 (= e!17873 (and e!17870 mapRes!1264))))

(declare-fun condMapEmpty!1264 () Bool)

(declare-fun mapDefault!1264 () ValueCell!379)

