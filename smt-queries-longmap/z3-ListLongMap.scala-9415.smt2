; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112098 () Bool)

(assert start!112098)

(declare-fun b!1327669 () Bool)

(declare-fun e!756865 () Bool)

(assert (=> b!1327669 (= e!756865 false)))

(declare-fun lt!590560 () Bool)

(declare-datatypes ((array!89645 0))(
  ( (array!89646 (arr!43289 (Array (_ BitVec 32) (_ BitVec 64))) (size!43841 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!89645)

(declare-datatypes ((List!30749 0))(
  ( (Nil!30746) (Cons!30745 (h!31954 (_ BitVec 64)) (t!44747 List!30749)) )
))
(declare-fun arrayNoDuplicates!0 (array!89645 (_ BitVec 32) List!30749) Bool)

(assert (=> b!1327669 (= lt!590560 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30746))))

(declare-fun b!1327670 () Bool)

(declare-fun res!880992 () Bool)

(assert (=> b!1327670 (=> (not res!880992) (not e!756865))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89645 (_ BitVec 32)) Bool)

(assert (=> b!1327670 (= res!880992 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun mapIsEmpty!56278 () Bool)

(declare-fun mapRes!56278 () Bool)

(assert (=> mapIsEmpty!56278 mapRes!56278))

(declare-fun res!880993 () Bool)

(assert (=> start!112098 (=> (not res!880993) (not e!756865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112098 (= res!880993 (validMask!0 mask!1998))))

(assert (=> start!112098 e!756865))

(assert (=> start!112098 true))

(declare-datatypes ((V!53641 0))(
  ( (V!53642 (val!18276 Int)) )
))
(declare-datatypes ((ValueCell!17303 0))(
  ( (ValueCellFull!17303 (v!20912 V!53641)) (EmptyCell!17303) )
))
(declare-datatypes ((array!89647 0))(
  ( (array!89648 (arr!43290 (Array (_ BitVec 32) ValueCell!17303)) (size!43842 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!89647)

(declare-fun e!756864 () Bool)

(declare-fun array_inv!32839 (array!89647) Bool)

(assert (=> start!112098 (and (array_inv!32839 _values!1320) e!756864)))

(declare-fun array_inv!32840 (array!89645) Bool)

(assert (=> start!112098 (array_inv!32840 _keys!1590)))

(declare-fun b!1327671 () Bool)

(declare-fun e!756868 () Bool)

(declare-fun tp_is_empty!36403 () Bool)

(assert (=> b!1327671 (= e!756868 tp_is_empty!36403)))

(declare-fun mapNonEmpty!56278 () Bool)

(declare-fun tp!107186 () Bool)

(assert (=> mapNonEmpty!56278 (= mapRes!56278 (and tp!107186 e!756868))))

(declare-fun mapValue!56278 () ValueCell!17303)

(declare-fun mapKey!56278 () (_ BitVec 32))

(declare-fun mapRest!56278 () (Array (_ BitVec 32) ValueCell!17303))

(assert (=> mapNonEmpty!56278 (= (arr!43290 _values!1320) (store mapRest!56278 mapKey!56278 mapValue!56278))))

(declare-fun b!1327672 () Bool)

(declare-fun e!756867 () Bool)

(assert (=> b!1327672 (= e!756864 (and e!756867 mapRes!56278))))

(declare-fun condMapEmpty!56278 () Bool)

(declare-fun mapDefault!56278 () ValueCell!17303)

(assert (=> b!1327672 (= condMapEmpty!56278 (= (arr!43290 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17303)) mapDefault!56278)))))

(declare-fun b!1327673 () Bool)

(declare-fun res!880991 () Bool)

(assert (=> b!1327673 (=> (not res!880991) (not e!756865))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1327673 (= res!880991 (and (= (size!43842 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!43841 _keys!1590) (size!43842 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1327674 () Bool)

(assert (=> b!1327674 (= e!756867 tp_is_empty!36403)))

(assert (= (and start!112098 res!880993) b!1327673))

(assert (= (and b!1327673 res!880991) b!1327670))

(assert (= (and b!1327670 res!880992) b!1327669))

(assert (= (and b!1327672 condMapEmpty!56278) mapIsEmpty!56278))

(assert (= (and b!1327672 (not condMapEmpty!56278)) mapNonEmpty!56278))

(get-info :version)

(assert (= (and mapNonEmpty!56278 ((_ is ValueCellFull!17303) mapValue!56278)) b!1327671))

(assert (= (and b!1327672 ((_ is ValueCellFull!17303) mapDefault!56278)) b!1327674))

(assert (= start!112098 b!1327672))

(declare-fun m!1216437 () Bool)

(assert (=> b!1327669 m!1216437))

(declare-fun m!1216439 () Bool)

(assert (=> b!1327670 m!1216439))

(declare-fun m!1216441 () Bool)

(assert (=> start!112098 m!1216441))

(declare-fun m!1216443 () Bool)

(assert (=> start!112098 m!1216443))

(declare-fun m!1216445 () Bool)

(assert (=> start!112098 m!1216445))

(declare-fun m!1216447 () Bool)

(assert (=> mapNonEmpty!56278 m!1216447))

(check-sat (not b!1327669) (not mapNonEmpty!56278) (not start!112098) (not b!1327670) tp_is_empty!36403)
(check-sat)
