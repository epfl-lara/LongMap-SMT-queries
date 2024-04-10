; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133794 () Bool)

(assert start!133794)

(declare-fun b!1564457 () Bool)

(declare-fun res!1069531 () Bool)

(declare-fun e!871957 () Bool)

(assert (=> b!1564457 (=> (not res!1069531) (not e!871957))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104424 0))(
  ( (array!104425 (arr!50403 (Array (_ BitVec 32) (_ BitVec 64))) (size!50953 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104424)

(assert (=> b!1564457 (= res!1069531 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50953 _keys!637)) (bvsge from!782 (size!50953 _keys!637))))))

(declare-fun b!1564458 () Bool)

(declare-fun res!1069536 () Bool)

(assert (=> b!1564458 (=> (not res!1069536) (not e!871957))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(declare-datatypes ((V!60029 0))(
  ( (V!60030 (val!19517 Int)) )
))
(declare-datatypes ((ValueCell!18403 0))(
  ( (ValueCellFull!18403 (v!22269 V!60029)) (EmptyCell!18403) )
))
(declare-datatypes ((array!104426 0))(
  ( (array!104427 (arr!50404 (Array (_ BitVec 32) ValueCell!18403)) (size!50954 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104426)

(assert (=> b!1564458 (= res!1069536 (and (= (size!50954 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50953 _keys!637) (size!50954 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!59679 () Bool)

(declare-fun mapRes!59679 () Bool)

(declare-fun tp!113604 () Bool)

(declare-fun e!871960 () Bool)

(assert (=> mapNonEmpty!59679 (= mapRes!59679 (and tp!113604 e!871960))))

(declare-fun mapRest!59679 () (Array (_ BitVec 32) ValueCell!18403))

(declare-fun mapKey!59679 () (_ BitVec 32))

(declare-fun mapValue!59679 () ValueCell!18403)

(assert (=> mapNonEmpty!59679 (= (arr!50404 _values!487) (store mapRest!59679 mapKey!59679 mapValue!59679))))

(declare-fun res!1069535 () Bool)

(assert (=> start!133794 (=> (not res!1069535) (not e!871957))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133794 (= res!1069535 (validMask!0 mask!947))))

(assert (=> start!133794 e!871957))

(assert (=> start!133794 true))

(declare-fun array_inv!39171 (array!104424) Bool)

(assert (=> start!133794 (array_inv!39171 _keys!637)))

(declare-fun e!871956 () Bool)

(declare-fun array_inv!39172 (array!104426) Bool)

(assert (=> start!133794 (and (array_inv!39172 _values!487) e!871956)))

(declare-fun b!1564459 () Bool)

(declare-fun tp_is_empty!38867 () Bool)

(assert (=> b!1564459 (= e!871960 tp_is_empty!38867)))

(declare-fun b!1564460 () Bool)

(declare-fun res!1069533 () Bool)

(assert (=> b!1564460 (=> (not res!1069533) (not e!871957))))

(declare-datatypes ((tuple2!25182 0))(
  ( (tuple2!25183 (_1!12602 (_ BitVec 64)) (_2!12602 V!60029)) )
))
(declare-datatypes ((List!36569 0))(
  ( (Nil!36566) (Cons!36565 (h!38011 tuple2!25182) (t!51416 List!36569)) )
))
(declare-datatypes ((ListLongMap!22617 0))(
  ( (ListLongMap!22618 (toList!11324 List!36569)) )
))
(declare-fun contains!10315 (ListLongMap!22617 (_ BitVec 64)) Bool)

(assert (=> b!1564460 (= res!1069533 (not (contains!10315 (ListLongMap!22618 Nil!36566) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!59679 () Bool)

(assert (=> mapIsEmpty!59679 mapRes!59679))

(declare-fun b!1564461 () Bool)

(declare-fun res!1069534 () Bool)

(assert (=> b!1564461 (=> (not res!1069534) (not e!871957))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104424 (_ BitVec 32)) Bool)

(assert (=> b!1564461 (= res!1069534 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564462 () Bool)

(declare-fun e!871959 () Bool)

(assert (=> b!1564462 (= e!871959 tp_is_empty!38867)))

(declare-fun b!1564463 () Bool)

(assert (=> b!1564463 (= e!871956 (and e!871959 mapRes!59679))))

(declare-fun condMapEmpty!59679 () Bool)

(declare-fun mapDefault!59679 () ValueCell!18403)

