; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!74350 () Bool)

(assert start!74350)

(declare-fun b!873517 () Bool)

(declare-fun e!486546 () Bool)

(declare-fun tp_is_empty!17221 () Bool)

(assert (=> b!873517 (= e!486546 tp_is_empty!17221)))

(declare-fun b!873518 () Bool)

(declare-fun res!593400 () Bool)

(declare-fun e!486545 () Bool)

(assert (=> b!873518 (=> (not res!593400) (not e!486545))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!50629 0))(
  ( (array!50630 (arr!24340 (Array (_ BitVec 32) (_ BitVec 64))) (size!24781 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!50629)

(declare-datatypes ((V!28009 0))(
  ( (V!28010 (val!8658 Int)) )
))
(declare-datatypes ((ValueCell!8171 0))(
  ( (ValueCellFull!8171 (v!11083 V!28009)) (EmptyCell!8171) )
))
(declare-datatypes ((array!50631 0))(
  ( (array!50632 (arr!24341 (Array (_ BitVec 32) ValueCell!8171)) (size!24782 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!50631)

(assert (=> b!873518 (= res!593400 (and (= (size!24782 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24781 _keys!868) (size!24782 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun res!593401 () Bool)

(assert (=> start!74350 (=> (not res!593401) (not e!486545))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!74350 (= res!593401 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24781 _keys!868))))))

(assert (=> start!74350 e!486545))

(assert (=> start!74350 true))

(declare-fun array_inv!19258 (array!50629) Bool)

(assert (=> start!74350 (array_inv!19258 _keys!868)))

(declare-fun e!486543 () Bool)

(declare-fun array_inv!19259 (array!50631) Bool)

(assert (=> start!74350 (and (array_inv!19259 _values!688) e!486543)))

(declare-fun mapNonEmpty!27434 () Bool)

(declare-fun mapRes!27434 () Bool)

(declare-fun tp!52634 () Bool)

(assert (=> mapNonEmpty!27434 (= mapRes!27434 (and tp!52634 e!486546))))

(declare-fun mapKey!27434 () (_ BitVec 32))

(declare-fun mapValue!27434 () ValueCell!8171)

(declare-fun mapRest!27434 () (Array (_ BitVec 32) ValueCell!8171))

(assert (=> mapNonEmpty!27434 (= (arr!24341 _values!688) (store mapRest!27434 mapKey!27434 mapValue!27434))))

(declare-fun mapIsEmpty!27434 () Bool)

(assert (=> mapIsEmpty!27434 mapRes!27434))

(declare-fun b!873519 () Bool)

(assert (=> b!873519 (= e!486545 false)))

(declare-fun lt!396008 () Bool)

(declare-datatypes ((List!17220 0))(
  ( (Nil!17217) (Cons!17216 (h!18353 (_ BitVec 64)) (t!24249 List!17220)) )
))
(declare-fun arrayNoDuplicates!0 (array!50629 (_ BitVec 32) List!17220) Bool)

(assert (=> b!873519 (= lt!396008 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!17217))))

(declare-fun b!873520 () Bool)

(declare-fun e!486544 () Bool)

(assert (=> b!873520 (= e!486544 tp_is_empty!17221)))

(declare-fun b!873521 () Bool)

(declare-fun res!593398 () Bool)

(assert (=> b!873521 (=> (not res!593398) (not e!486545))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!873521 (= res!593398 (validMask!0 mask!1196))))

(declare-fun b!873522 () Bool)

(assert (=> b!873522 (= e!486543 (and e!486544 mapRes!27434))))

(declare-fun condMapEmpty!27434 () Bool)

(declare-fun mapDefault!27434 () ValueCell!8171)

(assert (=> b!873522 (= condMapEmpty!27434 (= (arr!24341 _values!688) ((as const (Array (_ BitVec 32) ValueCell!8171)) mapDefault!27434)))))

(declare-fun b!873523 () Bool)

(declare-fun res!593399 () Bool)

(assert (=> b!873523 (=> (not res!593399) (not e!486545))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!50629 (_ BitVec 32)) Bool)

(assert (=> b!873523 (= res!593399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!74350 res!593401) b!873521))

(assert (= (and b!873521 res!593398) b!873518))

(assert (= (and b!873518 res!593400) b!873523))

(assert (= (and b!873523 res!593399) b!873519))

(assert (= (and b!873522 condMapEmpty!27434) mapIsEmpty!27434))

(assert (= (and b!873522 (not condMapEmpty!27434)) mapNonEmpty!27434))

(get-info :version)

(assert (= (and mapNonEmpty!27434 ((_ is ValueCellFull!8171) mapValue!27434)) b!873517))

(assert (= (and b!873522 ((_ is ValueCellFull!8171) mapDefault!27434)) b!873520))

(assert (= start!74350 b!873522))

(declare-fun m!814649 () Bool)

(assert (=> b!873523 m!814649))

(declare-fun m!814651 () Bool)

(assert (=> mapNonEmpty!27434 m!814651))

(declare-fun m!814653 () Bool)

(assert (=> b!873519 m!814653))

(declare-fun m!814655 () Bool)

(assert (=> b!873521 m!814655))

(declare-fun m!814657 () Bool)

(assert (=> start!74350 m!814657))

(declare-fun m!814659 () Bool)

(assert (=> start!74350 m!814659))

(check-sat (not b!873519) (not b!873521) tp_is_empty!17221 (not b!873523) (not mapNonEmpty!27434) (not start!74350))
(check-sat)
