; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111304 () Bool)

(assert start!111304)

(declare-fun mapNonEmpty!55319 () Bool)

(declare-fun mapRes!55319 () Bool)

(declare-fun tp!105425 () Bool)

(declare-fun e!751546 () Bool)

(assert (=> mapNonEmpty!55319 (= mapRes!55319 (and tp!105425 e!751546))))

(declare-datatypes ((V!52811 0))(
  ( (V!52812 (val!17965 Int)) )
))
(declare-datatypes ((ValueCell!16992 0))(
  ( (ValueCellFull!16992 (v!20595 V!52811)) (EmptyCell!16992) )
))
(declare-datatypes ((array!88522 0))(
  ( (array!88523 (arr!42735 (Array (_ BitVec 32) ValueCell!16992)) (size!43285 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88522)

(declare-fun mapKey!55319 () (_ BitVec 32))

(declare-fun mapValue!55319 () ValueCell!16992)

(declare-fun mapRest!55319 () (Array (_ BitVec 32) ValueCell!16992))

(assert (=> mapNonEmpty!55319 (= (arr!42735 _values!1337) (store mapRest!55319 mapKey!55319 mapValue!55319))))

(declare-fun b!1317177 () Bool)

(declare-fun res!874252 () Bool)

(declare-fun e!751547 () Bool)

(assert (=> b!1317177 (=> (not res!874252) (not e!751547))))

(declare-datatypes ((array!88524 0))(
  ( (array!88525 (arr!42736 (Array (_ BitVec 32) (_ BitVec 64))) (size!43286 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88524)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88524 (_ BitVec 32)) Bool)

(assert (=> b!1317177 (= res!874252 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun res!874253 () Bool)

(assert (=> start!111304 (=> (not res!874253) (not e!751547))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111304 (= res!874253 (validMask!0 mask!2019))))

(assert (=> start!111304 e!751547))

(assert (=> start!111304 true))

(declare-fun e!751545 () Bool)

(declare-fun array_inv!32275 (array!88522) Bool)

(assert (=> start!111304 (and (array_inv!32275 _values!1337) e!751545)))

(declare-fun array_inv!32276 (array!88524) Bool)

(assert (=> start!111304 (array_inv!32276 _keys!1609)))

(declare-fun b!1317178 () Bool)

(declare-fun e!751548 () Bool)

(declare-fun tp_is_empty!35781 () Bool)

(assert (=> b!1317178 (= e!751548 tp_is_empty!35781)))

(declare-fun mapIsEmpty!55319 () Bool)

(assert (=> mapIsEmpty!55319 mapRes!55319))

(declare-fun b!1317179 () Bool)

(assert (=> b!1317179 (= e!751545 (and e!751548 mapRes!55319))))

(declare-fun condMapEmpty!55319 () Bool)

(declare-fun mapDefault!55319 () ValueCell!16992)

(assert (=> b!1317179 (= condMapEmpty!55319 (= (arr!42735 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!16992)) mapDefault!55319)))))

(declare-fun b!1317180 () Bool)

(assert (=> b!1317180 (= e!751547 false)))

(declare-fun lt!586326 () Bool)

(declare-datatypes ((List!30295 0))(
  ( (Nil!30292) (Cons!30291 (h!31500 (_ BitVec 64)) (t!43903 List!30295)) )
))
(declare-fun arrayNoDuplicates!0 (array!88524 (_ BitVec 32) List!30295) Bool)

(assert (=> b!1317180 (= lt!586326 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30292))))

(declare-fun b!1317181 () Bool)

(declare-fun res!874251 () Bool)

(assert (=> b!1317181 (=> (not res!874251) (not e!751547))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1317181 (= res!874251 (and (= (size!43285 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43286 _keys!1609) (size!43285 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1317182 () Bool)

(assert (=> b!1317182 (= e!751546 tp_is_empty!35781)))

(assert (= (and start!111304 res!874253) b!1317181))

(assert (= (and b!1317181 res!874251) b!1317177))

(assert (= (and b!1317177 res!874252) b!1317180))

(assert (= (and b!1317179 condMapEmpty!55319) mapIsEmpty!55319))

(assert (= (and b!1317179 (not condMapEmpty!55319)) mapNonEmpty!55319))

(get-info :version)

(assert (= (and mapNonEmpty!55319 ((_ is ValueCellFull!16992) mapValue!55319)) b!1317182))

(assert (= (and b!1317179 ((_ is ValueCellFull!16992) mapDefault!55319)) b!1317178))

(assert (= start!111304 b!1317179))

(declare-fun m!1205127 () Bool)

(assert (=> mapNonEmpty!55319 m!1205127))

(declare-fun m!1205129 () Bool)

(assert (=> b!1317177 m!1205129))

(declare-fun m!1205131 () Bool)

(assert (=> start!111304 m!1205131))

(declare-fun m!1205133 () Bool)

(assert (=> start!111304 m!1205133))

(declare-fun m!1205135 () Bool)

(assert (=> start!111304 m!1205135))

(declare-fun m!1205137 () Bool)

(assert (=> b!1317180 m!1205137))

(check-sat tp_is_empty!35781 (not start!111304) (not mapNonEmpty!55319) (not b!1317180) (not b!1317177))
(check-sat)
