; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133772 () Bool)

(assert start!133772)

(declare-fun res!1069334 () Bool)

(declare-fun e!871791 () Bool)

(assert (=> start!133772 (=> (not res!1069334) (not e!871791))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133772 (= res!1069334 (validMask!0 mask!947))))

(assert (=> start!133772 e!871791))

(assert (=> start!133772 true))

(declare-datatypes ((array!104384 0))(
  ( (array!104385 (arr!50383 (Array (_ BitVec 32) (_ BitVec 64))) (size!50933 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104384)

(declare-fun array_inv!39155 (array!104384) Bool)

(assert (=> start!133772 (array_inv!39155 _keys!637)))

(declare-datatypes ((V!60001 0))(
  ( (V!60002 (val!19506 Int)) )
))
(declare-datatypes ((ValueCell!18392 0))(
  ( (ValueCellFull!18392 (v!22258 V!60001)) (EmptyCell!18392) )
))
(declare-datatypes ((array!104386 0))(
  ( (array!104387 (arr!50384 (Array (_ BitVec 32) ValueCell!18392)) (size!50934 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104386)

(declare-fun e!871795 () Bool)

(declare-fun array_inv!39156 (array!104386) Bool)

(assert (=> start!133772 (and (array_inv!39156 _values!487) e!871795)))

(declare-fun b!1564160 () Bool)

(declare-fun res!1069333 () Bool)

(assert (=> b!1564160 (=> (not res!1069333) (not e!871791))))

(declare-datatypes ((List!36553 0))(
  ( (Nil!36550) (Cons!36549 (h!37995 (_ BitVec 64)) (t!51400 List!36553)) )
))
(declare-fun arrayNoDuplicates!0 (array!104384 (_ BitVec 32) List!36553) Bool)

(assert (=> b!1564160 (= res!1069333 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36550))))

(declare-fun b!1564161 () Bool)

(declare-fun e!871794 () Bool)

(declare-fun tp_is_empty!38845 () Bool)

(assert (=> b!1564161 (= e!871794 tp_is_empty!38845)))

(declare-fun b!1564162 () Bool)

(declare-fun res!1069337 () Bool)

(assert (=> b!1564162 (=> (not res!1069337) (not e!871791))))

(declare-datatypes ((tuple2!25164 0))(
  ( (tuple2!25165 (_1!12593 (_ BitVec 64)) (_2!12593 V!60001)) )
))
(declare-datatypes ((List!36554 0))(
  ( (Nil!36551) (Cons!36550 (h!37996 tuple2!25164) (t!51401 List!36554)) )
))
(declare-datatypes ((ListLongMap!22599 0))(
  ( (ListLongMap!22600 (toList!11315 List!36554)) )
))
(declare-fun contains!10306 (ListLongMap!22599 (_ BitVec 64)) Bool)

(assert (=> b!1564162 (= res!1069337 (not (contains!10306 (ListLongMap!22600 Nil!36551) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!59646 () Bool)

(declare-fun mapRes!59646 () Bool)

(declare-fun tp!113571 () Bool)

(assert (=> mapNonEmpty!59646 (= mapRes!59646 (and tp!113571 e!871794))))

(declare-fun mapKey!59646 () (_ BitVec 32))

(declare-fun mapRest!59646 () (Array (_ BitVec 32) ValueCell!18392))

(declare-fun mapValue!59646 () ValueCell!18392)

(assert (=> mapNonEmpty!59646 (= (arr!50384 _values!487) (store mapRest!59646 mapKey!59646 mapValue!59646))))

(declare-fun mapIsEmpty!59646 () Bool)

(assert (=> mapIsEmpty!59646 mapRes!59646))

(declare-fun b!1564163 () Bool)

(declare-fun res!1069336 () Bool)

(assert (=> b!1564163 (=> (not res!1069336) (not e!871791))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564163 (= res!1069336 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50933 _keys!637)) (bvsge from!782 (size!50933 _keys!637))))))

(declare-fun b!1564164 () Bool)

(declare-fun e!871792 () Bool)

(assert (=> b!1564164 (= e!871792 tp_is_empty!38845)))

(declare-fun b!1564165 () Bool)

(assert (=> b!1564165 (= e!871795 (and e!871792 mapRes!59646))))

(declare-fun condMapEmpty!59646 () Bool)

(declare-fun mapDefault!59646 () ValueCell!18392)

