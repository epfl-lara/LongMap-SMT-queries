; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111746 () Bool)

(assert start!111746)

(declare-fun b_free!30403 () Bool)

(declare-fun b_next!30403 () Bool)

(assert (=> start!111746 (= b_free!30403 (not b_next!30403))))

(declare-fun tp!106686 () Bool)

(declare-fun b_and!48923 () Bool)

(assert (=> start!111746 (= tp!106686 b_and!48923)))

(declare-fun b!1324063 () Bool)

(declare-fun res!878873 () Bool)

(declare-fun e!754828 () Bool)

(assert (=> b!1324063 (=> (not res!878873) (not e!754828))))

(declare-datatypes ((array!89291 0))(
  ( (array!89292 (arr!43120 (Array (_ BitVec 32) (_ BitVec 64))) (size!43672 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!89291)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53401 0))(
  ( (V!53402 (val!18186 Int)) )
))
(declare-datatypes ((ValueCell!17213 0))(
  ( (ValueCellFull!17213 (v!20815 V!53401)) (EmptyCell!17213) )
))
(declare-datatypes ((array!89293 0))(
  ( (array!89294 (arr!43121 (Array (_ BitVec 32) ValueCell!17213)) (size!43673 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!89293)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1324063 (= res!878873 (and (= (size!43673 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43672 _keys!1609) (size!43673 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1324064 () Bool)

(declare-fun res!878870 () Bool)

(assert (=> b!1324064 (=> (not res!878870) (not e!754828))))

(declare-datatypes ((List!30647 0))(
  ( (Nil!30644) (Cons!30643 (h!31852 (_ BitVec 64)) (t!44565 List!30647)) )
))
(declare-fun arrayNoDuplicates!0 (array!89291 (_ BitVec 32) List!30647) Bool)

(assert (=> b!1324064 (= res!878870 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30644))))

(declare-fun mapIsEmpty!55982 () Bool)

(declare-fun mapRes!55982 () Bool)

(assert (=> mapIsEmpty!55982 mapRes!55982))

(declare-fun b!1324065 () Bool)

(declare-fun res!878871 () Bool)

(assert (=> b!1324065 (=> (not res!878871) (not e!754828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!89291 (_ BitVec 32)) Bool)

(assert (=> b!1324065 (= res!878871 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1324066 () Bool)

(declare-fun e!754827 () Bool)

(declare-fun tp_is_empty!36223 () Bool)

(assert (=> b!1324066 (= e!754827 tp_is_empty!36223)))

(declare-fun mapNonEmpty!55982 () Bool)

(declare-fun tp!106685 () Bool)

(assert (=> mapNonEmpty!55982 (= mapRes!55982 (and tp!106685 e!754827))))

(declare-fun mapValue!55982 () ValueCell!17213)

(declare-fun mapKey!55982 () (_ BitVec 32))

(declare-fun mapRest!55982 () (Array (_ BitVec 32) ValueCell!17213))

(assert (=> mapNonEmpty!55982 (= (arr!43121 _values!1337) (store mapRest!55982 mapKey!55982 mapValue!55982))))

(declare-fun b!1324067 () Bool)

(declare-fun res!878872 () Bool)

(assert (=> b!1324067 (=> (not res!878872) (not e!754828))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1324067 (= res!878872 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43672 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!878874 () Bool)

(assert (=> start!111746 (=> (not res!878874) (not e!754828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111746 (= res!878874 (validMask!0 mask!2019))))

(assert (=> start!111746 e!754828))

(declare-fun array_inv!32737 (array!89291) Bool)

(assert (=> start!111746 (array_inv!32737 _keys!1609)))

(assert (=> start!111746 true))

(assert (=> start!111746 tp_is_empty!36223))

(declare-fun e!754829 () Bool)

(declare-fun array_inv!32738 (array!89293) Bool)

(assert (=> start!111746 (and (array_inv!32738 _values!1337) e!754829)))

(assert (=> start!111746 tp!106686))

(declare-fun b!1324062 () Bool)

(declare-fun e!754831 () Bool)

(assert (=> b!1324062 (= e!754829 (and e!754831 mapRes!55982))))

(declare-fun condMapEmpty!55982 () Bool)

(declare-fun mapDefault!55982 () ValueCell!17213)

(assert (=> b!1324062 (= condMapEmpty!55982 (= (arr!43121 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17213)) mapDefault!55982)))))

(declare-fun b!1324068 () Bool)

(assert (=> b!1324068 (= e!754828 false)))

(declare-fun lt!589251 () Bool)

(declare-fun zeroValue!1279 () V!53401)

(declare-fun minValue!1279 () V!53401)

(declare-fun defaultEntry!1340 () Int)

(declare-datatypes ((tuple2!23516 0))(
  ( (tuple2!23517 (_1!11769 (_ BitVec 64)) (_2!11769 V!53401)) )
))
(declare-datatypes ((List!30648 0))(
  ( (Nil!30645) (Cons!30644 (h!31853 tuple2!23516) (t!44566 List!30648)) )
))
(declare-datatypes ((ListLongMap!21173 0))(
  ( (ListLongMap!21174 (toList!10602 List!30648)) )
))
(declare-fun contains!8685 (ListLongMap!21173 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5481 (array!89291 array!89293 (_ BitVec 32) (_ BitVec 32) V!53401 V!53401 (_ BitVec 32) Int) ListLongMap!21173)

(assert (=> b!1324068 (= lt!589251 (contains!8685 (getCurrentListMap!5481 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1324069 () Bool)

(assert (=> b!1324069 (= e!754831 tp_is_empty!36223)))

(assert (= (and start!111746 res!878874) b!1324063))

(assert (= (and b!1324063 res!878873) b!1324065))

(assert (= (and b!1324065 res!878871) b!1324064))

(assert (= (and b!1324064 res!878870) b!1324067))

(assert (= (and b!1324067 res!878872) b!1324068))

(assert (= (and b!1324062 condMapEmpty!55982) mapIsEmpty!55982))

(assert (= (and b!1324062 (not condMapEmpty!55982)) mapNonEmpty!55982))

(get-info :version)

(assert (= (and mapNonEmpty!55982 ((_ is ValueCellFull!17213) mapValue!55982)) b!1324066))

(assert (= (and b!1324062 ((_ is ValueCellFull!17213) mapDefault!55982)) b!1324069))

(assert (= start!111746 b!1324062))

(declare-fun m!1212579 () Bool)

(assert (=> b!1324068 m!1212579))

(assert (=> b!1324068 m!1212579))

(declare-fun m!1212581 () Bool)

(assert (=> b!1324068 m!1212581))

(declare-fun m!1212583 () Bool)

(assert (=> start!111746 m!1212583))

(declare-fun m!1212585 () Bool)

(assert (=> start!111746 m!1212585))

(declare-fun m!1212587 () Bool)

(assert (=> start!111746 m!1212587))

(declare-fun m!1212589 () Bool)

(assert (=> b!1324064 m!1212589))

(declare-fun m!1212591 () Bool)

(assert (=> mapNonEmpty!55982 m!1212591))

(declare-fun m!1212593 () Bool)

(assert (=> b!1324065 m!1212593))

(check-sat (not mapNonEmpty!55982) b_and!48923 (not b!1324065) (not b!1324064) tp_is_empty!36223 (not start!111746) (not b!1324068) (not b_next!30403))
(check-sat b_and!48923 (not b_next!30403))
