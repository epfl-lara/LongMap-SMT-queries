; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112012 () Bool)

(assert start!112012)

(declare-fun b!1327179 () Bool)

(declare-fun e!756458 () Bool)

(declare-fun e!756454 () Bool)

(declare-fun mapRes!56200 () Bool)

(assert (=> b!1327179 (= e!756458 (and e!756454 mapRes!56200))))

(declare-fun condMapEmpty!56200 () Bool)

(declare-datatypes ((V!53585 0))(
  ( (V!53586 (val!18255 Int)) )
))
(declare-datatypes ((ValueCell!17282 0))(
  ( (ValueCellFull!17282 (v!20890 V!53585)) (EmptyCell!17282) )
))
(declare-datatypes ((array!89563 0))(
  ( (array!89564 (arr!43253 (Array (_ BitVec 32) ValueCell!17282)) (size!43805 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89563)

(declare-fun mapDefault!56200 () ValueCell!17282)

(assert (=> b!1327179 (= condMapEmpty!56200 (= (arr!43253 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17282)) mapDefault!56200)))))

(declare-fun res!880754 () Bool)

(declare-fun e!756457 () Bool)

(assert (=> start!112012 (=> (not res!880754) (not e!756457))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112012 (= res!880754 (validMask!0 mask!1998))))

(assert (=> start!112012 e!756457))

(assert (=> start!112012 true))

(declare-fun array_inv!32817 (array!89563) Bool)

(assert (=> start!112012 (and (array_inv!32817 _values!1320) e!756458)))

(declare-datatypes ((array!89565 0))(
  ( (array!89566 (arr!43254 (Array (_ BitVec 32) (_ BitVec 64))) (size!43806 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89565)

(declare-fun array_inv!32818 (array!89565) Bool)

(assert (=> start!112012 (array_inv!32818 _keys!1590)))

(declare-fun mapNonEmpty!56200 () Bool)

(declare-fun tp!107108 () Bool)

(declare-fun e!756456 () Bool)

(assert (=> mapNonEmpty!56200 (= mapRes!56200 (and tp!107108 e!756456))))

(declare-fun mapValue!56200 () ValueCell!17282)

(declare-fun mapKey!56200 () (_ BitVec 32))

(declare-fun mapRest!56200 () (Array (_ BitVec 32) ValueCell!17282))

(assert (=> mapNonEmpty!56200 (= (arr!43253 _values!1320) (store mapRest!56200 mapKey!56200 mapValue!56200))))

(declare-fun mapIsEmpty!56200 () Bool)

(assert (=> mapIsEmpty!56200 mapRes!56200))

(declare-fun b!1327180 () Bool)

(declare-fun tp_is_empty!36361 () Bool)

(assert (=> b!1327180 (= e!756456 tp_is_empty!36361)))

(declare-fun b!1327181 () Bool)

(assert (=> b!1327181 (= e!756454 tp_is_empty!36361)))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(declare-fun b!1327182 () Bool)

(assert (=> b!1327182 (= e!756457 (and (= (size!43805 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43806 _keys!1590) (size!43805 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011) (not (= (size!43806 _keys!1590) (bvadd #b00000000000000000000000000000001 mask!1998)))))))

(assert (= (and start!112012 res!880754) b!1327182))

(assert (= (and b!1327179 condMapEmpty!56200) mapIsEmpty!56200))

(assert (= (and b!1327179 (not condMapEmpty!56200)) mapNonEmpty!56200))

(get-info :version)

(assert (= (and mapNonEmpty!56200 ((_ is ValueCellFull!17282) mapValue!56200)) b!1327180))

(assert (= (and b!1327179 ((_ is ValueCellFull!17282) mapDefault!56200)) b!1327181))

(assert (= start!112012 b!1327179))

(declare-fun m!1216133 () Bool)

(assert (=> start!112012 m!1216133))

(declare-fun m!1216135 () Bool)

(assert (=> start!112012 m!1216135))

(declare-fun m!1216137 () Bool)

(assert (=> start!112012 m!1216137))

(declare-fun m!1216139 () Bool)

(assert (=> mapNonEmpty!56200 m!1216139))

(check-sat (not start!112012) (not mapNonEmpty!56200) tp_is_empty!36361)
(check-sat)
