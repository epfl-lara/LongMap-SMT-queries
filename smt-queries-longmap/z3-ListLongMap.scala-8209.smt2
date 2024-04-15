; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!100114 () Bool)

(assert start!100114)

(declare-fun b!1193797 () Bool)

(declare-fun res!794275 () Bool)

(declare-fun e!678472 () Bool)

(assert (=> b!1193797 (=> (not res!794275) (not e!678472))))

(declare-datatypes ((array!77174 0))(
  ( (array!77175 (arr!37237 (Array (_ BitVec 32) (_ BitVec 64))) (size!37775 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!77174)

(declare-datatypes ((List!26327 0))(
  ( (Nil!26324) (Cons!26323 (h!27532 (_ BitVec 64)) (t!38989 List!26327)) )
))
(declare-fun arrayNoDuplicates!0 (array!77174 (_ BitVec 32) List!26327) Bool)

(assert (=> b!1193797 (= res!794275 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26324))))

(declare-fun b!1193798 () Bool)

(declare-fun e!678471 () Bool)

(declare-fun tp_is_empty!30229 () Bool)

(assert (=> b!1193798 (= e!678471 tp_is_empty!30229)))

(declare-fun b!1193799 () Bool)

(declare-fun res!794277 () Bool)

(assert (=> b!1193799 (=> (not res!794277) (not e!678472))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!77174 (_ BitVec 32)) Bool)

(assert (=> b!1193799 (= res!794277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1193800 () Bool)

(assert (=> b!1193800 (= e!678472 false)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!542505 () Bool)

(assert (=> b!1193800 (= lt!542505 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (array!77175 (store (arr!37237 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37775 _keys!1208)) mask!1564))))

(declare-fun b!1193801 () Bool)

(declare-fun res!794272 () Bool)

(assert (=> b!1193801 (=> (not res!794272) (not e!678472))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1193801 (= res!794272 (validKeyInArray!0 k0!934))))

(declare-fun b!1193802 () Bool)

(declare-fun res!794273 () Bool)

(assert (=> b!1193802 (=> (not res!794273) (not e!678472))))

(assert (=> b!1193802 (= res!794273 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37775 _keys!1208))))))

(declare-fun mapNonEmpty!47171 () Bool)

(declare-fun mapRes!47171 () Bool)

(declare-fun tp!89781 () Bool)

(assert (=> mapNonEmpty!47171 (= mapRes!47171 (and tp!89781 e!678471))))

(declare-datatypes ((V!45433 0))(
  ( (V!45434 (val!15171 Int)) )
))
(declare-datatypes ((ValueCell!14405 0))(
  ( (ValueCellFull!14405 (v!17808 V!45433)) (EmptyCell!14405) )
))
(declare-fun mapRest!47171 () (Array (_ BitVec 32) ValueCell!14405))

(declare-datatypes ((array!77176 0))(
  ( (array!77177 (arr!37238 (Array (_ BitVec 32) ValueCell!14405)) (size!37776 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!77176)

(declare-fun mapValue!47171 () ValueCell!14405)

(declare-fun mapKey!47171 () (_ BitVec 32))

(assert (=> mapNonEmpty!47171 (= (arr!37238 _values!996) (store mapRest!47171 mapKey!47171 mapValue!47171))))

(declare-fun b!1193804 () Bool)

(declare-fun res!794276 () Bool)

(assert (=> b!1193804 (=> (not res!794276) (not e!678472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1193804 (= res!794276 (validMask!0 mask!1564))))

(declare-fun b!1193805 () Bool)

(declare-fun e!678473 () Bool)

(declare-fun e!678474 () Bool)

(assert (=> b!1193805 (= e!678473 (and e!678474 mapRes!47171))))

(declare-fun condMapEmpty!47171 () Bool)

(declare-fun mapDefault!47171 () ValueCell!14405)

(assert (=> b!1193805 (= condMapEmpty!47171 (= (arr!37238 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14405)) mapDefault!47171)))))

(declare-fun b!1193806 () Bool)

(declare-fun res!794271 () Bool)

(assert (=> b!1193806 (=> (not res!794271) (not e!678472))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1193806 (= res!794271 (and (= (size!37776 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37775 _keys!1208) (size!37776 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1193807 () Bool)

(declare-fun res!794278 () Bool)

(assert (=> b!1193807 (=> (not res!794278) (not e!678472))))

(assert (=> b!1193807 (= res!794278 (= (select (arr!37237 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!47171 () Bool)

(assert (=> mapIsEmpty!47171 mapRes!47171))

(declare-fun b!1193803 () Bool)

(assert (=> b!1193803 (= e!678474 tp_is_empty!30229)))

(declare-fun res!794274 () Bool)

(assert (=> start!100114 (=> (not res!794274) (not e!678472))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!100114 (= res!794274 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37775 _keys!1208))))))

(assert (=> start!100114 e!678472))

(declare-fun array_inv!28510 (array!77174) Bool)

(assert (=> start!100114 (array_inv!28510 _keys!1208)))

(assert (=> start!100114 true))

(declare-fun array_inv!28511 (array!77176) Bool)

(assert (=> start!100114 (and (array_inv!28511 _values!996) e!678473)))

(assert (= (and start!100114 res!794274) b!1193804))

(assert (= (and b!1193804 res!794276) b!1193806))

(assert (= (and b!1193806 res!794271) b!1193799))

(assert (= (and b!1193799 res!794277) b!1193797))

(assert (= (and b!1193797 res!794275) b!1193802))

(assert (= (and b!1193802 res!794273) b!1193801))

(assert (= (and b!1193801 res!794272) b!1193807))

(assert (= (and b!1193807 res!794278) b!1193800))

(assert (= (and b!1193805 condMapEmpty!47171) mapIsEmpty!47171))

(assert (= (and b!1193805 (not condMapEmpty!47171)) mapNonEmpty!47171))

(get-info :version)

(assert (= (and mapNonEmpty!47171 ((_ is ValueCellFull!14405) mapValue!47171)) b!1193798))

(assert (= (and b!1193805 ((_ is ValueCellFull!14405) mapDefault!47171)) b!1193803))

(assert (= start!100114 b!1193805))

(declare-fun m!1101425 () Bool)

(assert (=> b!1193797 m!1101425))

(declare-fun m!1101427 () Bool)

(assert (=> start!100114 m!1101427))

(declare-fun m!1101429 () Bool)

(assert (=> start!100114 m!1101429))

(declare-fun m!1101431 () Bool)

(assert (=> b!1193801 m!1101431))

(declare-fun m!1101433 () Bool)

(assert (=> b!1193799 m!1101433))

(declare-fun m!1101435 () Bool)

(assert (=> b!1193807 m!1101435))

(declare-fun m!1101437 () Bool)

(assert (=> b!1193804 m!1101437))

(declare-fun m!1101439 () Bool)

(assert (=> b!1193800 m!1101439))

(declare-fun m!1101441 () Bool)

(assert (=> b!1193800 m!1101441))

(declare-fun m!1101443 () Bool)

(assert (=> mapNonEmpty!47171 m!1101443))

(check-sat (not start!100114) tp_is_empty!30229 (not b!1193799) (not b!1193800) (not b!1193804) (not b!1193801) (not mapNonEmpty!47171) (not b!1193797))
(check-sat)
