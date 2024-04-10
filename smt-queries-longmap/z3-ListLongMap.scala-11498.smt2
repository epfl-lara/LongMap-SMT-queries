; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!133798 () Bool)

(assert start!133798)

(declare-fun res!1069568 () Bool)

(declare-fun e!871990 () Bool)

(assert (=> start!133798 (=> (not res!1069568) (not e!871990))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133798 (= res!1069568 (validMask!0 mask!947))))

(assert (=> start!133798 e!871990))

(assert (=> start!133798 true))

(declare-datatypes ((array!104432 0))(
  ( (array!104433 (arr!50407 (Array (_ BitVec 32) (_ BitVec 64))) (size!50957 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104432)

(declare-fun array_inv!39175 (array!104432) Bool)

(assert (=> start!133798 (array_inv!39175 _keys!637)))

(declare-datatypes ((V!60035 0))(
  ( (V!60036 (val!19519 Int)) )
))
(declare-datatypes ((ValueCell!18405 0))(
  ( (ValueCellFull!18405 (v!22271 V!60035)) (EmptyCell!18405) )
))
(declare-datatypes ((array!104434 0))(
  ( (array!104435 (arr!50408 (Array (_ BitVec 32) ValueCell!18405)) (size!50958 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104434)

(declare-fun e!871987 () Bool)

(declare-fun array_inv!39176 (array!104434) Bool)

(assert (=> start!133798 (and (array_inv!39176 _values!487) e!871987)))

(declare-fun b!1564511 () Bool)

(declare-fun res!1069571 () Bool)

(assert (=> b!1564511 (=> (not res!1069571) (not e!871990))))

(declare-datatypes ((tuple2!25186 0))(
  ( (tuple2!25187 (_1!12604 (_ BitVec 64)) (_2!12604 V!60035)) )
))
(declare-datatypes ((List!36572 0))(
  ( (Nil!36569) (Cons!36568 (h!38014 tuple2!25186) (t!51419 List!36572)) )
))
(declare-datatypes ((ListLongMap!22621 0))(
  ( (ListLongMap!22622 (toList!11326 List!36572)) )
))
(declare-fun contains!10317 (ListLongMap!22621 (_ BitVec 64)) Bool)

(assert (=> b!1564511 (= res!1069571 (not (contains!10317 (ListLongMap!22622 Nil!36569) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1564512 () Bool)

(declare-fun e!871989 () Bool)

(declare-fun tp_is_empty!38871 () Bool)

(assert (=> b!1564512 (= e!871989 tp_is_empty!38871)))

(declare-fun b!1564513 () Bool)

(declare-fun res!1069567 () Bool)

(assert (=> b!1564513 (=> (not res!1069567) (not e!871990))))

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1564513 (= res!1069567 (and (= (size!50958 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50957 _keys!637) (size!50958 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun b!1564514 () Bool)

(declare-fun res!1069572 () Bool)

(assert (=> b!1564514 (=> (not res!1069572) (not e!871990))))

(declare-datatypes ((List!36573 0))(
  ( (Nil!36570) (Cons!36569 (h!38015 (_ BitVec 64)) (t!51420 List!36573)) )
))
(declare-fun arrayNoDuplicates!0 (array!104432 (_ BitVec 32) List!36573) Bool)

(assert (=> b!1564514 (= res!1069572 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36570))))

(declare-fun b!1564515 () Bool)

(declare-fun res!1069570 () Bool)

(assert (=> b!1564515 (=> (not res!1069570) (not e!871990))))

(declare-fun from!782 () (_ BitVec 32))

(assert (=> b!1564515 (= res!1069570 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50957 _keys!637)) (bvsge from!782 (size!50957 _keys!637))))))

(declare-fun b!1564516 () Bool)

(declare-fun mapRes!59685 () Bool)

(assert (=> b!1564516 (= e!871987 (and e!871989 mapRes!59685))))

(declare-fun condMapEmpty!59685 () Bool)

(declare-fun mapDefault!59685 () ValueCell!18405)

(assert (=> b!1564516 (= condMapEmpty!59685 (= (arr!50408 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18405)) mapDefault!59685)))))

(declare-fun mapIsEmpty!59685 () Bool)

(assert (=> mapIsEmpty!59685 mapRes!59685))

(declare-fun mapNonEmpty!59685 () Bool)

(declare-fun tp!113610 () Bool)

(declare-fun e!871988 () Bool)

(assert (=> mapNonEmpty!59685 (= mapRes!59685 (and tp!113610 e!871988))))

(declare-fun mapKey!59685 () (_ BitVec 32))

(declare-fun mapRest!59685 () (Array (_ BitVec 32) ValueCell!18405))

(declare-fun mapValue!59685 () ValueCell!18405)

(assert (=> mapNonEmpty!59685 (= (arr!50408 _values!487) (store mapRest!59685 mapKey!59685 mapValue!59685))))

(declare-fun b!1564517 () Bool)

(assert (=> b!1564517 (= e!871990 false)))

(declare-fun lt!672048 () Bool)

(assert (=> b!1564517 (= lt!672048 (contains!10317 (ListLongMap!22622 Nil!36569) #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1564518 () Bool)

(declare-fun res!1069569 () Bool)

(assert (=> b!1564518 (=> (not res!1069569) (not e!871990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104432 (_ BitVec 32)) Bool)

(assert (=> b!1564518 (= res!1069569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1564519 () Bool)

(assert (=> b!1564519 (= e!871988 tp_is_empty!38871)))

(assert (= (and start!133798 res!1069568) b!1564513))

(assert (= (and b!1564513 res!1069567) b!1564518))

(assert (= (and b!1564518 res!1069569) b!1564514))

(assert (= (and b!1564514 res!1069572) b!1564515))

(assert (= (and b!1564515 res!1069570) b!1564511))

(assert (= (and b!1564511 res!1069571) b!1564517))

(assert (= (and b!1564516 condMapEmpty!59685) mapIsEmpty!59685))

(assert (= (and b!1564516 (not condMapEmpty!59685)) mapNonEmpty!59685))

(get-info :version)

(assert (= (and mapNonEmpty!59685 ((_ is ValueCellFull!18405) mapValue!59685)) b!1564519))

(assert (= (and b!1564516 ((_ is ValueCellFull!18405) mapDefault!59685)) b!1564512))

(assert (= start!133798 b!1564516))

(declare-fun m!1439675 () Bool)

(assert (=> b!1564518 m!1439675))

(declare-fun m!1439677 () Bool)

(assert (=> b!1564517 m!1439677))

(declare-fun m!1439679 () Bool)

(assert (=> start!133798 m!1439679))

(declare-fun m!1439681 () Bool)

(assert (=> start!133798 m!1439681))

(declare-fun m!1439683 () Bool)

(assert (=> start!133798 m!1439683))

(declare-fun m!1439685 () Bool)

(assert (=> mapNonEmpty!59685 m!1439685))

(declare-fun m!1439687 () Bool)

(assert (=> b!1564514 m!1439687))

(declare-fun m!1439689 () Bool)

(assert (=> b!1564511 m!1439689))

(check-sat (not b!1564511) (not mapNonEmpty!59685) (not b!1564514) (not start!133798) (not b!1564518) tp_is_empty!38871 (not b!1564517))
(check-sat)
