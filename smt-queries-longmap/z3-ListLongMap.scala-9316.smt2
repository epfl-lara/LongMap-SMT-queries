; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111556 () Bool)

(assert start!111556)

(declare-fun b!1318728 () Bool)

(declare-fun res!874897 () Bool)

(declare-fun e!752600 () Bool)

(assert (=> b!1318728 (=> (not res!874897) (not e!752600))))

(declare-datatypes ((array!88641 0))(
  ( (array!88642 (arr!42790 (Array (_ BitVec 32) (_ BitVec 64))) (size!43341 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88641)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88641 (_ BitVec 32)) Bool)

(assert (=> b!1318728 (= res!874897 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun mapNonEmpty!55361 () Bool)

(declare-fun mapRes!55361 () Bool)

(declare-fun tp!105467 () Bool)

(declare-fun e!752599 () Bool)

(assert (=> mapNonEmpty!55361 (= mapRes!55361 (and tp!105467 e!752599))))

(declare-datatypes ((V!52849 0))(
  ( (V!52850 (val!17979 Int)) )
))
(declare-datatypes ((ValueCell!17006 0))(
  ( (ValueCellFull!17006 (v!20604 V!52849)) (EmptyCell!17006) )
))
(declare-fun mapRest!55361 () (Array (_ BitVec 32) ValueCell!17006))

(declare-fun mapValue!55361 () ValueCell!17006)

(declare-datatypes ((array!88643 0))(
  ( (array!88644 (arr!42791 (Array (_ BitVec 32) ValueCell!17006)) (size!43342 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88643)

(declare-fun mapKey!55361 () (_ BitVec 32))

(assert (=> mapNonEmpty!55361 (= (arr!42791 _values!1337) (store mapRest!55361 mapKey!55361 mapValue!55361))))

(declare-fun b!1318729 () Bool)

(declare-fun e!752601 () Bool)

(declare-fun tp_is_empty!35809 () Bool)

(assert (=> b!1318729 (= e!752601 tp_is_empty!35809)))

(declare-fun b!1318731 () Bool)

(assert (=> b!1318731 (= e!752600 false)))

(declare-fun lt!586844 () Bool)

(declare-datatypes ((List!30338 0))(
  ( (Nil!30335) (Cons!30334 (h!31552 (_ BitVec 64)) (t!43938 List!30338)) )
))
(declare-fun arrayNoDuplicates!0 (array!88641 (_ BitVec 32) List!30338) Bool)

(assert (=> b!1318731 (= lt!586844 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30335))))

(declare-fun mapIsEmpty!55361 () Bool)

(assert (=> mapIsEmpty!55361 mapRes!55361))

(declare-fun b!1318732 () Bool)

(assert (=> b!1318732 (= e!752599 tp_is_empty!35809)))

(declare-fun b!1318733 () Bool)

(declare-fun res!874896 () Bool)

(assert (=> b!1318733 (=> (not res!874896) (not e!752600))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(assert (=> b!1318733 (= res!874896 (and (= (size!43342 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43341 _keys!1609) (size!43342 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1318730 () Bool)

(declare-fun e!752598 () Bool)

(assert (=> b!1318730 (= e!752598 (and e!752601 mapRes!55361))))

(declare-fun condMapEmpty!55361 () Bool)

(declare-fun mapDefault!55361 () ValueCell!17006)

(assert (=> b!1318730 (= condMapEmpty!55361 (= (arr!42791 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17006)) mapDefault!55361)))))

(declare-fun res!874895 () Bool)

(assert (=> start!111556 (=> (not res!874895) (not e!752600))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111556 (= res!874895 (validMask!0 mask!2019))))

(assert (=> start!111556 e!752600))

(assert (=> start!111556 true))

(declare-fun array_inv!32591 (array!88643) Bool)

(assert (=> start!111556 (and (array_inv!32591 _values!1337) e!752598)))

(declare-fun array_inv!32592 (array!88641) Bool)

(assert (=> start!111556 (array_inv!32592 _keys!1609)))

(assert (= (and start!111556 res!874895) b!1318733))

(assert (= (and b!1318733 res!874896) b!1318728))

(assert (= (and b!1318728 res!874897) b!1318731))

(assert (= (and b!1318730 condMapEmpty!55361) mapIsEmpty!55361))

(assert (= (and b!1318730 (not condMapEmpty!55361)) mapNonEmpty!55361))

(get-info :version)

(assert (= (and mapNonEmpty!55361 ((_ is ValueCellFull!17006) mapValue!55361)) b!1318732))

(assert (= (and b!1318730 ((_ is ValueCellFull!17006) mapDefault!55361)) b!1318729))

(assert (= start!111556 b!1318730))

(declare-fun m!1206893 () Bool)

(assert (=> b!1318728 m!1206893))

(declare-fun m!1206895 () Bool)

(assert (=> mapNonEmpty!55361 m!1206895))

(declare-fun m!1206897 () Bool)

(assert (=> b!1318731 m!1206897))

(declare-fun m!1206899 () Bool)

(assert (=> start!111556 m!1206899))

(declare-fun m!1206901 () Bool)

(assert (=> start!111556 m!1206901))

(declare-fun m!1206903 () Bool)

(assert (=> start!111556 m!1206903))

(check-sat (not b!1318728) tp_is_empty!35809 (not start!111556) (not mapNonEmpty!55361) (not b!1318731))
(check-sat)
