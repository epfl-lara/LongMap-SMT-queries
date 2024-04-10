; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133786 () Bool)

(assert start!133786)

(declare-fun mapNonEmpty!59667 () Bool)

(declare-fun mapRes!59667 () Bool)

(declare-fun tp!113592 () Bool)

(declare-fun e!871897 () Bool)

(assert (=> mapNonEmpty!59667 (= mapRes!59667 (and tp!113592 e!871897))))

(declare-datatypes ((V!60019 0))(
  ( (V!60020 (val!19513 Int)) )
))
(declare-datatypes ((ValueCell!18399 0))(
  ( (ValueCellFull!18399 (v!22265 V!60019)) (EmptyCell!18399) )
))
(declare-fun mapRest!59667 () (Array (_ BitVec 32) ValueCell!18399))

(declare-fun mapValue!59667 () ValueCell!18399)

(declare-fun mapKey!59667 () (_ BitVec 32))

(declare-datatypes ((array!104408 0))(
  ( (array!104409 (arr!50395 (Array (_ BitVec 32) ValueCell!18399)) (size!50945 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104408)

(assert (=> mapNonEmpty!59667 (= (arr!50395 _values!487) (store mapRest!59667 mapKey!59667 mapValue!59667))))

(declare-fun b!1564349 () Bool)

(declare-fun res!1069459 () Bool)

(declare-fun e!871896 () Bool)

(assert (=> b!1564349 (=> (not res!1069459) (not e!871896))))

(declare-datatypes ((tuple2!25174 0))(
  ( (tuple2!25175 (_1!12598 (_ BitVec 64)) (_2!12598 V!60019)) )
))
(declare-datatypes ((List!36562 0))(
  ( (Nil!36559) (Cons!36558 (h!38004 tuple2!25174) (t!51409 List!36562)) )
))
(declare-datatypes ((ListLongMap!22609 0))(
  ( (ListLongMap!22610 (toList!11320 List!36562)) )
))
(declare-fun contains!10311 (ListLongMap!22609 (_ BitVec 64)) Bool)

(assert (=> b!1564349 (= res!1069459 (not (contains!10311 (ListLongMap!22610 Nil!36559) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1564350 () Bool)

(declare-fun e!871898 () Bool)

(declare-fun tp_is_empty!38859 () Bool)

(assert (=> b!1564350 (= e!871898 tp_is_empty!38859)))

(declare-fun b!1564351 () Bool)

(declare-fun res!1069461 () Bool)

(assert (=> b!1564351 (=> (not res!1069461) (not e!871896))))

(declare-fun from!782 () (_ BitVec 32))

(declare-datatypes ((array!104410 0))(
  ( (array!104411 (arr!50396 (Array (_ BitVec 32) (_ BitVec 64))) (size!50946 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104410)

(assert (=> b!1564351 (= res!1069461 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50946 _keys!637)) (bvsge from!782 (size!50946 _keys!637))))))

(declare-fun b!1564352 () Bool)

(declare-fun res!1069464 () Bool)

(assert (=> b!1564352 (=> (not res!1069464) (not e!871896))))

(declare-datatypes ((List!36563 0))(
  ( (Nil!36560) (Cons!36559 (h!38005 (_ BitVec 64)) (t!51410 List!36563)) )
))
(declare-fun arrayNoDuplicates!0 (array!104410 (_ BitVec 32) List!36563) Bool)

(assert (=> b!1564352 (= res!1069464 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36560))))

(declare-fun b!1564353 () Bool)

(declare-fun res!1069460 () Bool)

(assert (=> b!1564353 (=> (not res!1069460) (not e!871896))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564353 (= res!1069460 (and (= (size!50945 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50946 _keys!637) (size!50945 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1069462 () Bool)

(assert (=> start!133786 (=> (not res!1069462) (not e!871896))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133786 (= res!1069462 (validMask!0 mask!947))))

(assert (=> start!133786 e!871896))

(assert (=> start!133786 true))

(declare-fun array_inv!39165 (array!104410) Bool)

(assert (=> start!133786 (array_inv!39165 _keys!637)))

(declare-fun e!871899 () Bool)

(declare-fun array_inv!39166 (array!104408) Bool)

(assert (=> start!133786 (and (array_inv!39166 _values!487) e!871899)))

(declare-fun b!1564354 () Bool)

(assert (=> b!1564354 (= e!871896 false)))

(declare-fun lt!672030 () Bool)

(assert (=> b!1564354 (= lt!672030 (contains!10311 (ListLongMap!22610 Nil!36559) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564355 () Bool)

(assert (=> b!1564355 (= e!871899 (and e!871898 mapRes!59667))))

(declare-fun condMapEmpty!59667 () Bool)

(declare-fun mapDefault!59667 () ValueCell!18399)

(assert (=> b!1564355 (= condMapEmpty!59667 (= (arr!50395 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18399)) mapDefault!59667)))))

(declare-fun b!1564356 () Bool)

(assert (=> b!1564356 (= e!871897 tp_is_empty!38859)))

(declare-fun b!1564357 () Bool)

(declare-fun res!1069463 () Bool)

(assert (=> b!1564357 (=> (not res!1069463) (not e!871896))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104410 (_ BitVec 32)) Bool)

(assert (=> b!1564357 (= res!1069463 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapIsEmpty!59667 () Bool)

(assert (=> mapIsEmpty!59667 mapRes!59667))

(assert (= (and start!133786 res!1069462) b!1564353))

(assert (= (and b!1564353 res!1069460) b!1564357))

(assert (= (and b!1564357 res!1069463) b!1564352))

(assert (= (and b!1564352 res!1069464) b!1564351))

(assert (= (and b!1564351 res!1069461) b!1564349))

(assert (= (and b!1564349 res!1069459) b!1564354))

(assert (= (and b!1564355 condMapEmpty!59667) mapIsEmpty!59667))

(assert (= (and b!1564355 (not condMapEmpty!59667)) mapNonEmpty!59667))

(get-info :version)

(assert (= (and mapNonEmpty!59667 ((_ is ValueCellFull!18399) mapValue!59667)) b!1564356))

(assert (= (and b!1564355 ((_ is ValueCellFull!18399) mapDefault!59667)) b!1564350))

(assert (= start!133786 b!1564355))

(declare-fun m!1439579 () Bool)

(assert (=> start!133786 m!1439579))

(declare-fun m!1439581 () Bool)

(assert (=> start!133786 m!1439581))

(declare-fun m!1439583 () Bool)

(assert (=> start!133786 m!1439583))

(declare-fun m!1439585 () Bool)

(assert (=> b!1564352 m!1439585))

(declare-fun m!1439587 () Bool)

(assert (=> b!1564354 m!1439587))

(declare-fun m!1439589 () Bool)

(assert (=> b!1564349 m!1439589))

(declare-fun m!1439591 () Bool)

(assert (=> mapNonEmpty!59667 m!1439591))

(declare-fun m!1439593 () Bool)

(assert (=> b!1564357 m!1439593))

(check-sat (not b!1564357) (not b!1564352) (not mapNonEmpty!59667) tp_is_empty!38859 (not b!1564354) (not b!1564349) (not start!133786))
(check-sat)
