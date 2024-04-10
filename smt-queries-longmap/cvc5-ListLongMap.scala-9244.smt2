; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110812 () Bool)

(assert start!110812)

(declare-fun b_free!29647 () Bool)

(declare-fun b_next!29647 () Bool)

(assert (=> start!110812 (= b_free!29647 (not b_next!29647))))

(declare-fun tp!104263 () Bool)

(declare-fun b_and!47855 () Bool)

(assert (=> start!110812 (= tp!104263 b_and!47855)))

(declare-fun b!1311559 () Bool)

(declare-fun res!870691 () Bool)

(declare-fun e!748213 () Bool)

(assert (=> b!1311559 (=> (not res!870691) (not e!748213))))

(declare-datatypes ((array!87742 0))(
  ( (array!87743 (arr!42351 (Array (_ BitVec 32) (_ BitVec 64))) (size!42901 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87742)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-datatypes ((V!52273 0))(
  ( (V!52274 (val!17763 Int)) )
))
(declare-datatypes ((ValueCell!16790 0))(
  ( (ValueCellFull!16790 (v!20390 V!52273)) (EmptyCell!16790) )
))
(declare-datatypes ((array!87744 0))(
  ( (array!87745 (arr!42352 (Array (_ BitVec 32) ValueCell!16790)) (size!42902 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87744)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1311559 (= res!870691 (and (= (size!42902 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42901 _keys!1628) (size!42902 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!54694 () Bool)

(declare-fun mapRes!54694 () Bool)

(assert (=> mapIsEmpty!54694 mapRes!54694))

(declare-fun res!870697 () Bool)

(assert (=> start!110812 (=> (not res!870697) (not e!748213))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110812 (= res!870697 (validMask!0 mask!2040))))

(assert (=> start!110812 e!748213))

(assert (=> start!110812 tp!104263))

(declare-fun array_inv!32005 (array!87742) Bool)

(assert (=> start!110812 (array_inv!32005 _keys!1628)))

(assert (=> start!110812 true))

(declare-fun tp_is_empty!35377 () Bool)

(assert (=> start!110812 tp_is_empty!35377))

(declare-fun e!748217 () Bool)

(declare-fun array_inv!32006 (array!87744) Bool)

(assert (=> start!110812 (and (array_inv!32006 _values!1354) e!748217)))

(declare-fun b!1311560 () Bool)

(declare-fun res!870693 () Bool)

(assert (=> b!1311560 (=> (not res!870693) (not e!748213))))

(declare-fun defaultEntry!1357 () Int)

(declare-fun k!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52273)

(declare-fun zeroValue!1296 () V!52273)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!22890 0))(
  ( (tuple2!22891 (_1!11456 (_ BitVec 64)) (_2!11456 V!52273)) )
))
(declare-datatypes ((List!30032 0))(
  ( (Nil!30029) (Cons!30028 (h!31237 tuple2!22890) (t!43638 List!30032)) )
))
(declare-datatypes ((ListLongMap!20547 0))(
  ( (ListLongMap!20548 (toList!10289 List!30032)) )
))
(declare-fun contains!8439 (ListLongMap!20547 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5302 (array!87742 array!87744 (_ BitVec 32) (_ BitVec 32) V!52273 V!52273 (_ BitVec 32) Int) ListLongMap!20547)

(assert (=> b!1311560 (= res!870693 (contains!8439 (getCurrentListMap!5302 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k!1175))))

(declare-fun b!1311561 () Bool)

(declare-fun e!748216 () Bool)

(assert (=> b!1311561 (= e!748217 (and e!748216 mapRes!54694))))

(declare-fun condMapEmpty!54694 () Bool)

(declare-fun mapDefault!54694 () ValueCell!16790)

