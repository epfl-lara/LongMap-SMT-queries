; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133806 () Bool)

(assert start!133806)

(declare-fun b!1564627 () Bool)

(declare-fun e!872054 () Bool)

(declare-fun e!872058 () Bool)

(assert (=> b!1564627 (= e!872054 e!872058)))

(declare-fun res!1069650 () Bool)

(assert (=> b!1564627 (=> res!1069650 e!872058)))

(declare-datatypes ((V!60045 0))(
  ( (V!60046 (val!19523 Int)) )
))
(declare-datatypes ((tuple2!25194 0))(
  ( (tuple2!25195 (_1!12608 (_ BitVec 64)) (_2!12608 V!60045)) )
))
(declare-datatypes ((List!36579 0))(
  ( (Nil!36576) (Cons!36575 (h!38021 tuple2!25194) (t!51426 List!36579)) )
))
(declare-datatypes ((ListLongMap!22629 0))(
  ( (ListLongMap!22630 (toList!11330 List!36579)) )
))
(declare-fun contains!10320 (ListLongMap!22629 (_ BitVec 64)) Bool)

(assert (=> b!1564627 (= res!1069650 (contains!10320 (ListLongMap!22630 Nil!36576) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564628 () Bool)

(declare-fun res!1069649 () Bool)

(assert (=> b!1564628 (=> (not res!1069649) (not e!872054))))

(declare-datatypes ((array!104446 0))(
  ( (array!104447 (arr!50414 (Array (_ BitVec 32) (_ BitVec 64))) (size!50964 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104446)

(declare-datatypes ((List!36580 0))(
  ( (Nil!36577) (Cons!36576 (h!38022 (_ BitVec 64)) (t!51427 List!36580)) )
))
(declare-fun arrayNoDuplicates!0 (array!104446 (_ BitVec 32) List!36580) Bool)

(assert (=> b!1564628 (= res!1069649 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36577))))

(declare-fun mapIsEmpty!59697 () Bool)

(declare-fun mapRes!59697 () Bool)

(assert (=> mapIsEmpty!59697 mapRes!59697))

(declare-fun b!1564629 () Bool)

(declare-fun e!872055 () Bool)

(declare-fun e!872059 () Bool)

(assert (=> b!1564629 (= e!872055 (and e!872059 mapRes!59697))))

(declare-fun condMapEmpty!59697 () Bool)

(declare-datatypes ((ValueCell!18409 0))(
  ( (ValueCellFull!18409 (v!22275 V!60045)) (EmptyCell!18409) )
))
(declare-datatypes ((array!104448 0))(
  ( (array!104449 (arr!50415 (Array (_ BitVec 32) ValueCell!18409)) (size!50965 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104448)

(declare-fun mapDefault!59697 () ValueCell!18409)

