; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133350 () Bool)

(assert start!133350)

(declare-fun b!1559252 () Bool)

(declare-fun res!1066298 () Bool)

(declare-fun e!868773 () Bool)

(assert (=> b!1559252 (=> (not res!1066298) (not e!868773))))

(declare-datatypes ((array!103662 0))(
  ( (array!103663 (arr!50027 (Array (_ BitVec 32) (_ BitVec 64))) (size!50577 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!103662)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!103662 (_ BitVec 32)) Bool)

(assert (=> b!1559252 (= res!1066298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1559253 () Bool)

(declare-fun res!1066300 () Bool)

(assert (=> b!1559253 (=> (not res!1066300) (not e!868773))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!59501 0))(
  ( (V!59502 (val!19319 Int)) )
))
(declare-datatypes ((ValueCell!18205 0))(
  ( (ValueCellFull!18205 (v!22070 V!59501)) (EmptyCell!18205) )
))
(declare-datatypes ((array!103664 0))(
  ( (array!103665 (arr!50028 (Array (_ BitVec 32) ValueCell!18205)) (size!50578 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!103664)

(assert (=> b!1559253 (= res!1066300 (and (= (size!50578 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50577 _keys!637) (size!50578 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1559254 () Bool)

(assert (=> b!1559254 (= e!868773 (bvsgt #b00000000000000000000000000000000 (size!50577 _keys!637)))))

(declare-fun res!1066299 () Bool)

(assert (=> start!133350 (=> (not res!1066299) (not e!868773))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133350 (= res!1066299 (validMask!0 mask!947))))

(assert (=> start!133350 e!868773))

(assert (=> start!133350 true))

(declare-fun e!868772 () Bool)

(declare-fun array_inv!38889 (array!103664) Bool)

(assert (=> start!133350 (and (array_inv!38889 _values!487) e!868772)))

(declare-fun array_inv!38890 (array!103662) Bool)

(assert (=> start!133350 (array_inv!38890 _keys!637)))

(declare-fun b!1559255 () Bool)

(declare-fun e!868775 () Bool)

(declare-fun tp_is_empty!38471 () Bool)

(assert (=> b!1559255 (= e!868775 tp_is_empty!38471)))

(declare-fun b!1559256 () Bool)

(declare-fun e!868774 () Bool)

(assert (=> b!1559256 (= e!868774 tp_is_empty!38471)))

(declare-fun mapNonEmpty!59070 () Bool)

(declare-fun mapRes!59070 () Bool)

(declare-fun tp!112725 () Bool)

(assert (=> mapNonEmpty!59070 (= mapRes!59070 (and tp!112725 e!868774))))

(declare-fun mapRest!59070 () (Array (_ BitVec 32) ValueCell!18205))

(declare-fun mapValue!59070 () ValueCell!18205)

(declare-fun mapKey!59070 () (_ BitVec 32))

(assert (=> mapNonEmpty!59070 (= (arr!50028 _values!487) (store mapRest!59070 mapKey!59070 mapValue!59070))))

(declare-fun b!1559257 () Bool)

(assert (=> b!1559257 (= e!868772 (and e!868775 mapRes!59070))))

(declare-fun condMapEmpty!59070 () Bool)

(declare-fun mapDefault!59070 () ValueCell!18205)

