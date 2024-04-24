; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111568 () Bool)

(assert start!111568)

(declare-fun mapIsEmpty!55379 () Bool)

(declare-fun mapRes!55379 () Bool)

(assert (=> mapIsEmpty!55379 mapRes!55379))

(declare-fun res!874954 () Bool)

(declare-fun e!752690 () Bool)

(assert (=> start!111568 (=> (not res!874954) (not e!752690))))

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111568 (= res!874954 (validMask!0 mask!2019))))

(assert (=> start!111568 e!752690))

(declare-datatypes ((array!88663 0))(
  ( (array!88664 (arr!42801 (Array (_ BitVec 32) (_ BitVec 64))) (size!43352 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88663)

(declare-fun array_inv!32597 (array!88663) Bool)

(assert (=> start!111568 (array_inv!32597 _keys!1609)))

(assert (=> start!111568 true))

(declare-datatypes ((V!52865 0))(
  ( (V!52866 (val!17985 Int)) )
))
(declare-datatypes ((ValueCell!17012 0))(
  ( (ValueCellFull!17012 (v!20610 V!52865)) (EmptyCell!17012) )
))
(declare-datatypes ((array!88665 0))(
  ( (array!88666 (arr!42802 (Array (_ BitVec 32) ValueCell!17012)) (size!43353 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88665)

(declare-fun e!752691 () Bool)

(declare-fun array_inv!32598 (array!88665) Bool)

(assert (=> start!111568 (and (array_inv!32598 _values!1337) e!752691)))

(declare-fun b!1318838 () Bool)

(declare-fun res!874952 () Bool)

(assert (=> b!1318838 (=> (not res!874952) (not e!752690))))

(declare-datatypes ((List!30340 0))(
  ( (Nil!30337) (Cons!30336 (h!31554 (_ BitVec 64)) (t!43940 List!30340)) )
))
(declare-fun arrayNoDuplicates!0 (array!88663 (_ BitVec 32) List!30340) Bool)

(assert (=> b!1318838 (= res!874952 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30337))))

(declare-fun b!1318839 () Bool)

(declare-fun e!752692 () Bool)

(declare-fun tp_is_empty!35821 () Bool)

(assert (=> b!1318839 (= e!752692 tp_is_empty!35821)))

(declare-fun b!1318840 () Bool)

(declare-fun e!752689 () Bool)

(assert (=> b!1318840 (= e!752691 (and e!752689 mapRes!55379))))

(declare-fun condMapEmpty!55379 () Bool)

(declare-fun mapDefault!55379 () ValueCell!17012)

(assert (=> b!1318840 (= condMapEmpty!55379 (= (arr!42802 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17012)) mapDefault!55379)))))

(declare-fun b!1318841 () Bool)

(declare-fun res!874951 () Bool)

(assert (=> b!1318841 (=> (not res!874951) (not e!752690))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318841 (= res!874951 (and (= (size!43353 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43352 _keys!1609) (size!43353 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun b!1318842 () Bool)

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1318842 (= e!752690 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43352 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!2000 (size!43352 _keys!1609))))))

(declare-fun b!1318843 () Bool)

(declare-fun res!874953 () Bool)

(assert (=> b!1318843 (=> (not res!874953) (not e!752690))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88663 (_ BitVec 32)) Bool)

(assert (=> b!1318843 (= res!874953 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1318844 () Bool)

(assert (=> b!1318844 (= e!752689 tp_is_empty!35821)))

(declare-fun mapNonEmpty!55379 () Bool)

(declare-fun tp!105485 () Bool)

(assert (=> mapNonEmpty!55379 (= mapRes!55379 (and tp!105485 e!752692))))

(declare-fun mapRest!55379 () (Array (_ BitVec 32) ValueCell!17012))

(declare-fun mapKey!55379 () (_ BitVec 32))

(declare-fun mapValue!55379 () ValueCell!17012)

(assert (=> mapNonEmpty!55379 (= (arr!42802 _values!1337) (store mapRest!55379 mapKey!55379 mapValue!55379))))

(assert (= (and start!111568 res!874954) b!1318841))

(assert (= (and b!1318841 res!874951) b!1318843))

(assert (= (and b!1318843 res!874953) b!1318838))

(assert (= (and b!1318838 res!874952) b!1318842))

(assert (= (and b!1318840 condMapEmpty!55379) mapIsEmpty!55379))

(assert (= (and b!1318840 (not condMapEmpty!55379)) mapNonEmpty!55379))

(get-info :version)

(assert (= (and mapNonEmpty!55379 ((_ is ValueCellFull!17012) mapValue!55379)) b!1318839))

(assert (= (and b!1318840 ((_ is ValueCellFull!17012) mapDefault!55379)) b!1318844))

(assert (= start!111568 b!1318840))

(declare-fun m!1206965 () Bool)

(assert (=> start!111568 m!1206965))

(declare-fun m!1206967 () Bool)

(assert (=> start!111568 m!1206967))

(declare-fun m!1206969 () Bool)

(assert (=> start!111568 m!1206969))

(declare-fun m!1206971 () Bool)

(assert (=> b!1318838 m!1206971))

(declare-fun m!1206973 () Bool)

(assert (=> b!1318843 m!1206973))

(declare-fun m!1206975 () Bool)

(assert (=> mapNonEmpty!55379 m!1206975))

(check-sat (not b!1318838) (not b!1318843) (not start!111568) tp_is_empty!35821 (not mapNonEmpty!55379))
(check-sat)
