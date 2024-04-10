; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4200 () Bool)

(assert start!4200)

(declare-fun b_free!1105 () Bool)

(declare-fun b_next!1105 () Bool)

(assert (=> start!4200 (= b_free!1105 (not b_next!1105))))

(declare-fun tp!4735 () Bool)

(declare-fun b_and!1915 () Bool)

(assert (=> start!4200 (= tp!4735 b_and!1915)))

(declare-fun b!31947 () Bool)

(declare-fun e!20350 () Bool)

(assert (=> b!31947 (= e!20350 false)))

(declare-fun lt!11618 () (_ BitVec 32))

(declare-datatypes ((array!2131 0))(
  ( (array!2132 (arr!1019 (Array (_ BitVec 32) (_ BitVec 64))) (size!1120 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2131)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!2131 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!31947 (= lt!11618 (arrayScanForKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!1717 () Bool)

(declare-fun mapRes!1717 () Bool)

(assert (=> mapIsEmpty!1717 mapRes!1717))

(declare-fun b!31948 () Bool)

(declare-fun res!19393 () Bool)

(assert (=> b!31948 (=> (not res!19393) (not e!20350))))

(declare-datatypes ((List!823 0))(
  ( (Nil!820) (Cons!819 (h!1386 (_ BitVec 64)) (t!3516 List!823)) )
))
(declare-fun arrayNoDuplicates!0 (array!2131 (_ BitVec 32) List!823) Bool)

(assert (=> b!31948 (= res!19393 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!820))))

(declare-fun res!19392 () Bool)

(assert (=> start!4200 (=> (not res!19392) (not e!20350))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4200 (= res!19392 (validMask!0 mask!2294))))

(assert (=> start!4200 e!20350))

(assert (=> start!4200 true))

(assert (=> start!4200 tp!4735))

(declare-datatypes ((V!1771 0))(
  ( (V!1772 (val!756 Int)) )
))
(declare-datatypes ((ValueCell!530 0))(
  ( (ValueCellFull!530 (v!1845 V!1771)) (EmptyCell!530) )
))
(declare-datatypes ((array!2133 0))(
  ( (array!2134 (arr!1020 (Array (_ BitVec 32) ValueCell!530)) (size!1121 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2133)

(declare-fun e!20354 () Bool)

(declare-fun array_inv!711 (array!2133) Bool)

(assert (=> start!4200 (and (array_inv!711 _values!1501) e!20354)))

(declare-fun array_inv!712 (array!2131) Bool)

(assert (=> start!4200 (array_inv!712 _keys!1833)))

(declare-fun tp_is_empty!1459 () Bool)

(assert (=> start!4200 tp_is_empty!1459))

(declare-fun b!31949 () Bool)

(declare-fun e!20353 () Bool)

(assert (=> b!31949 (= e!20354 (and e!20353 mapRes!1717))))

(declare-fun condMapEmpty!1717 () Bool)

(declare-fun mapDefault!1717 () ValueCell!530)

