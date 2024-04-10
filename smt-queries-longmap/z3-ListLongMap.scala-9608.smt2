; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113596 () Bool)

(assert start!113596)

(declare-fun b_free!31563 () Bool)

(declare-fun b_next!31563 () Bool)

(assert (=> start!113596 (= b_free!31563 (not b_next!31563))))

(declare-fun tp!110501 () Bool)

(declare-fun b_and!50921 () Bool)

(assert (=> start!113596 (= tp!110501 b_and!50921)))

(declare-fun b!1348508 () Bool)

(declare-fun e!767147 () Bool)

(declare-fun tp_is_empty!37563 () Bool)

(assert (=> b!1348508 (= e!767147 tp_is_empty!37563)))

(declare-fun b!1348509 () Bool)

(declare-fun e!767146 () Bool)

(declare-fun e!767145 () Bool)

(declare-fun mapRes!58058 () Bool)

(assert (=> b!1348509 (= e!767146 (and e!767145 mapRes!58058))))

(declare-fun condMapEmpty!58058 () Bool)

(declare-datatypes ((V!55187 0))(
  ( (V!55188 (val!18856 Int)) )
))
(declare-datatypes ((ValueCell!17883 0))(
  ( (ValueCellFull!17883 (v!21508 V!55187)) (EmptyCell!17883) )
))
(declare-datatypes ((array!91954 0))(
  ( (array!91955 (arr!44431 (Array (_ BitVec 32) ValueCell!17883)) (size!44981 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91954)

(declare-fun mapDefault!58058 () ValueCell!17883)

(assert (=> b!1348509 (= condMapEmpty!58058 (= (arr!44431 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17883)) mapDefault!58058)))))

(declare-fun b!1348510 () Bool)

(declare-fun res!894714 () Bool)

(declare-fun e!767144 () Bool)

(assert (=> b!1348510 (=> (not res!894714) (not e!767144))))

(declare-datatypes ((array!91956 0))(
  ( (array!91957 (arr!44432 (Array (_ BitVec 32) (_ BitVec 64))) (size!44982 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91956)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91956 (_ BitVec 32)) Bool)

(assert (=> b!1348510 (= res!894714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun res!894716 () Bool)

(assert (=> start!113596 (=> (not res!894716) (not e!767144))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113596 (= res!894716 (validMask!0 mask!1977))))

(assert (=> start!113596 e!767144))

(assert (=> start!113596 tp_is_empty!37563))

(assert (=> start!113596 true))

(declare-fun array_inv!33469 (array!91956) Bool)

(assert (=> start!113596 (array_inv!33469 _keys!1571)))

(declare-fun array_inv!33470 (array!91954) Bool)

(assert (=> start!113596 (and (array_inv!33470 _values!1303) e!767146)))

(assert (=> start!113596 tp!110501))

(declare-fun b!1348511 () Bool)

(assert (=> b!1348511 (= e!767144 false)))

(declare-fun minValue!1245 () V!55187)

(declare-fun lt!596174 () Bool)

(declare-fun zeroValue!1245 () V!55187)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24312 0))(
  ( (tuple2!24313 (_1!12167 (_ BitVec 64)) (_2!12167 V!55187)) )
))
(declare-datatypes ((List!31464 0))(
  ( (Nil!31461) (Cons!31460 (h!32669 tuple2!24312) (t!46102 List!31464)) )
))
(declare-datatypes ((ListLongMap!21969 0))(
  ( (ListLongMap!21970 (toList!11000 List!31464)) )
))
(declare-fun contains!9180 (ListLongMap!21969 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5949 (array!91956 array!91954 (_ BitVec 32) (_ BitVec 32) V!55187 V!55187 (_ BitVec 32) Int) ListLongMap!21969)

(assert (=> b!1348511 (= lt!596174 (contains!9180 (getCurrentListMap!5949 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1348512 () Bool)

(assert (=> b!1348512 (= e!767145 tp_is_empty!37563)))

(declare-fun b!1348513 () Bool)

(declare-fun res!894713 () Bool)

(assert (=> b!1348513 (=> (not res!894713) (not e!767144))))

(assert (=> b!1348513 (= res!894713 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44982 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1348514 () Bool)

(declare-fun res!894715 () Bool)

(assert (=> b!1348514 (=> (not res!894715) (not e!767144))))

(declare-datatypes ((List!31465 0))(
  ( (Nil!31462) (Cons!31461 (h!32670 (_ BitVec 64)) (t!46103 List!31465)) )
))
(declare-fun arrayNoDuplicates!0 (array!91956 (_ BitVec 32) List!31465) Bool)

(assert (=> b!1348514 (= res!894715 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31462))))

(declare-fun b!1348515 () Bool)

(declare-fun res!894712 () Bool)

(assert (=> b!1348515 (=> (not res!894712) (not e!767144))))

(assert (=> b!1348515 (= res!894712 (and (= (size!44981 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44982 _keys!1571) (size!44981 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58058 () Bool)

(assert (=> mapIsEmpty!58058 mapRes!58058))

(declare-fun mapNonEmpty!58058 () Bool)

(declare-fun tp!110500 () Bool)

(assert (=> mapNonEmpty!58058 (= mapRes!58058 (and tp!110500 e!767147))))

(declare-fun mapValue!58058 () ValueCell!17883)

(declare-fun mapRest!58058 () (Array (_ BitVec 32) ValueCell!17883))

(declare-fun mapKey!58058 () (_ BitVec 32))

(assert (=> mapNonEmpty!58058 (= (arr!44431 _values!1303) (store mapRest!58058 mapKey!58058 mapValue!58058))))

(assert (= (and start!113596 res!894716) b!1348515))

(assert (= (and b!1348515 res!894712) b!1348510))

(assert (= (and b!1348510 res!894714) b!1348514))

(assert (= (and b!1348514 res!894715) b!1348513))

(assert (= (and b!1348513 res!894713) b!1348511))

(assert (= (and b!1348509 condMapEmpty!58058) mapIsEmpty!58058))

(assert (= (and b!1348509 (not condMapEmpty!58058)) mapNonEmpty!58058))

(get-info :version)

(assert (= (and mapNonEmpty!58058 ((_ is ValueCellFull!17883) mapValue!58058)) b!1348508))

(assert (= (and b!1348509 ((_ is ValueCellFull!17883) mapDefault!58058)) b!1348512))

(assert (= start!113596 b!1348509))

(declare-fun m!1235587 () Bool)

(assert (=> start!113596 m!1235587))

(declare-fun m!1235589 () Bool)

(assert (=> start!113596 m!1235589))

(declare-fun m!1235591 () Bool)

(assert (=> start!113596 m!1235591))

(declare-fun m!1235593 () Bool)

(assert (=> b!1348514 m!1235593))

(declare-fun m!1235595 () Bool)

(assert (=> b!1348510 m!1235595))

(declare-fun m!1235597 () Bool)

(assert (=> mapNonEmpty!58058 m!1235597))

(declare-fun m!1235599 () Bool)

(assert (=> b!1348511 m!1235599))

(assert (=> b!1348511 m!1235599))

(declare-fun m!1235601 () Bool)

(assert (=> b!1348511 m!1235601))

(check-sat tp_is_empty!37563 (not b!1348511) (not start!113596) (not mapNonEmpty!58058) (not b!1348510) b_and!50921 (not b_next!31563) (not b!1348514))
(check-sat b_and!50921 (not b_next!31563))
