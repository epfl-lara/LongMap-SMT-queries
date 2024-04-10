; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133790 () Bool)

(assert start!133790)

(declare-fun b!1564403 () Bool)

(declare-fun res!1069495 () Bool)

(declare-fun e!871928 () Bool)

(assert (=> b!1564403 (=> (not res!1069495) (not e!871928))))

(declare-datatypes ((V!60025 0))(
  ( (V!60026 (val!19515 Int)) )
))
(declare-datatypes ((tuple2!25178 0))(
  ( (tuple2!25179 (_1!12600 (_ BitVec 64)) (_2!12600 V!60025)) )
))
(declare-datatypes ((List!36566 0))(
  ( (Nil!36563) (Cons!36562 (h!38008 tuple2!25178) (t!51413 List!36566)) )
))
(declare-datatypes ((ListLongMap!22613 0))(
  ( (ListLongMap!22614 (toList!11322 List!36566)) )
))
(declare-fun contains!10313 (ListLongMap!22613 (_ BitVec 64)) Bool)

(assert (=> b!1564403 (= res!1069495 (not (contains!10313 (ListLongMap!22614 Nil!36563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1564404 () Bool)

(declare-fun e!871930 () Bool)

(declare-fun tp_is_empty!38863 () Bool)

(assert (=> b!1564404 (= e!871930 tp_is_empty!38863)))

(declare-fun b!1564405 () Bool)

(declare-fun e!871926 () Bool)

(assert (=> b!1564405 (= e!871926 tp_is_empty!38863)))

(declare-fun b!1564406 () Bool)

(declare-fun res!1069498 () Bool)

(assert (=> b!1564406 (=> (not res!1069498) (not e!871928))))

(declare-datatypes ((array!104416 0))(
  ( (array!104417 (arr!50399 (Array (_ BitVec 32) (_ BitVec 64))) (size!50949 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104416)

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104416 (_ BitVec 32)) Bool)

(assert (=> b!1564406 (= res!1069498 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564407 () Bool)

(declare-fun e!871929 () Bool)

(declare-fun mapRes!59673 () Bool)

(assert (=> b!1564407 (= e!871929 (and e!871930 mapRes!59673))))

(declare-fun condMapEmpty!59673 () Bool)

(declare-datatypes ((ValueCell!18401 0))(
  ( (ValueCellFull!18401 (v!22267 V!60025)) (EmptyCell!18401) )
))
(declare-datatypes ((array!104418 0))(
  ( (array!104419 (arr!50400 (Array (_ BitVec 32) ValueCell!18401)) (size!50950 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104418)

(declare-fun mapDefault!59673 () ValueCell!18401)

