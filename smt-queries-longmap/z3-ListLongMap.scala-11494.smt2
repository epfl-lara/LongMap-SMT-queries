; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133774 () Bool)

(assert start!133774)

(declare-fun b!1564187 () Bool)

(declare-fun e!871806 () Bool)

(declare-fun tp_is_empty!38847 () Bool)

(assert (=> b!1564187 (= e!871806 tp_is_empty!38847)))

(declare-fun b!1564188 () Bool)

(declare-fun res!1069352 () Bool)

(declare-fun e!871807 () Bool)

(assert (=> b!1564188 (=> (not res!1069352) (not e!871807))))

(declare-datatypes ((array!104388 0))(
  ( (array!104389 (arr!50385 (Array (_ BitVec 32) (_ BitVec 64))) (size!50935 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104388)

(declare-datatypes ((List!36555 0))(
  ( (Nil!36552) (Cons!36551 (h!37997 (_ BitVec 64)) (t!51402 List!36555)) )
))
(declare-fun arrayNoDuplicates!0 (array!104388 (_ BitVec 32) List!36555) Bool)

(assert (=> b!1564188 (= res!1069352 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36552))))

(declare-fun b!1564189 () Bool)

(declare-fun res!1069353 () Bool)

(assert (=> b!1564189 (=> (not res!1069353) (not e!871807))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104388 (_ BitVec 32)) Bool)

(assert (=> b!1564189 (= res!1069353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun mapNonEmpty!59649 () Bool)

(declare-fun mapRes!59649 () Bool)

(declare-fun tp!113574 () Bool)

(declare-fun e!871810 () Bool)

(assert (=> mapNonEmpty!59649 (= mapRes!59649 (and tp!113574 e!871810))))

(declare-datatypes ((V!60003 0))(
  ( (V!60004 (val!19507 Int)) )
))
(declare-datatypes ((ValueCell!18393 0))(
  ( (ValueCellFull!18393 (v!22259 V!60003)) (EmptyCell!18393) )
))
(declare-fun mapValue!59649 () ValueCell!18393)

(declare-fun mapRest!59649 () (Array (_ BitVec 32) ValueCell!18393))

(declare-datatypes ((array!104390 0))(
  ( (array!104391 (arr!50386 (Array (_ BitVec 32) ValueCell!18393)) (size!50936 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104390)

(declare-fun mapKey!59649 () (_ BitVec 32))

(assert (=> mapNonEmpty!59649 (= (arr!50386 _values!487) (store mapRest!59649 mapKey!59649 mapValue!59649))))

(declare-fun res!1069351 () Bool)

(assert (=> start!133774 (=> (not res!1069351) (not e!871807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133774 (= res!1069351 (validMask!0 mask!947))))

(assert (=> start!133774 e!871807))

(assert (=> start!133774 true))

(declare-fun array_inv!39157 (array!104388) Bool)

(assert (=> start!133774 (array_inv!39157 _keys!637)))

(declare-fun e!871809 () Bool)

(declare-fun array_inv!39158 (array!104390) Bool)

(assert (=> start!133774 (and (array_inv!39158 _values!487) e!871809)))

(declare-fun b!1564190 () Bool)

(declare-fun res!1069355 () Bool)

(assert (=> b!1564190 (=> (not res!1069355) (not e!871807))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564190 (= res!1069355 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50935 _keys!637)) (bvsge from!782 (size!50935 _keys!637))))))

(declare-fun mapIsEmpty!59649 () Bool)

(assert (=> mapIsEmpty!59649 mapRes!59649))

(declare-fun b!1564191 () Bool)

(declare-fun res!1069356 () Bool)

(assert (=> b!1564191 (=> (not res!1069356) (not e!871807))))

(declare-datatypes ((tuple2!25166 0))(
  ( (tuple2!25167 (_1!12594 (_ BitVec 64)) (_2!12594 V!60003)) )
))
(declare-datatypes ((List!36556 0))(
  ( (Nil!36553) (Cons!36552 (h!37998 tuple2!25166) (t!51403 List!36556)) )
))
(declare-datatypes ((ListLongMap!22601 0))(
  ( (ListLongMap!22602 (toList!11316 List!36556)) )
))
(declare-fun contains!10307 (ListLongMap!22601 (_ BitVec 64)) Bool)

(assert (=> b!1564191 (= res!1069356 (not (contains!10307 (ListLongMap!22602 Nil!36553) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1564192 () Bool)

(assert (=> b!1564192 (= e!871810 tp_is_empty!38847)))

(declare-fun b!1564193 () Bool)

(assert (=> b!1564193 (= e!871809 (and e!871806 mapRes!59649))))

(declare-fun condMapEmpty!59649 () Bool)

(declare-fun mapDefault!59649 () ValueCell!18393)

(assert (=> b!1564193 (= condMapEmpty!59649 (= (arr!50386 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18393)) mapDefault!59649)))))

(declare-fun b!1564194 () Bool)

(assert (=> b!1564194 (= e!871807 false)))

(declare-fun lt!672012 () Bool)

(assert (=> b!1564194 (= lt!672012 (contains!10307 (ListLongMap!22602 Nil!36553) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564195 () Bool)

(declare-fun res!1069354 () Bool)

(assert (=> b!1564195 (=> (not res!1069354) (not e!871807))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564195 (= res!1069354 (and (= (size!50936 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50935 _keys!637) (size!50936 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(assert (= (and start!133774 res!1069351) b!1564195))

(assert (= (and b!1564195 res!1069354) b!1564189))

(assert (= (and b!1564189 res!1069353) b!1564188))

(assert (= (and b!1564188 res!1069352) b!1564190))

(assert (= (and b!1564190 res!1069355) b!1564191))

(assert (= (and b!1564191 res!1069356) b!1564194))

(assert (= (and b!1564193 condMapEmpty!59649) mapIsEmpty!59649))

(assert (= (and b!1564193 (not condMapEmpty!59649)) mapNonEmpty!59649))

(get-info :version)

(assert (= (and mapNonEmpty!59649 ((_ is ValueCellFull!18393) mapValue!59649)) b!1564192))

(assert (= (and b!1564193 ((_ is ValueCellFull!18393) mapDefault!59649)) b!1564187))

(assert (= start!133774 b!1564193))

(declare-fun m!1439483 () Bool)

(assert (=> b!1564191 m!1439483))

(declare-fun m!1439485 () Bool)

(assert (=> b!1564188 m!1439485))

(declare-fun m!1439487 () Bool)

(assert (=> b!1564189 m!1439487))

(declare-fun m!1439489 () Bool)

(assert (=> b!1564194 m!1439489))

(declare-fun m!1439491 () Bool)

(assert (=> start!133774 m!1439491))

(declare-fun m!1439493 () Bool)

(assert (=> start!133774 m!1439493))

(declare-fun m!1439495 () Bool)

(assert (=> start!133774 m!1439495))

(declare-fun m!1439497 () Bool)

(assert (=> mapNonEmpty!59649 m!1439497))

(check-sat (not b!1564191) (not mapNonEmpty!59649) (not b!1564188) (not b!1564189) (not start!133774) tp_is_empty!38847 (not b!1564194))
(check-sat)
