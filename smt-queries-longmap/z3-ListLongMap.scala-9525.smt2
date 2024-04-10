; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113014 () Bool)

(assert start!113014)

(declare-fun b!1339504 () Bool)

(declare-fun e!762968 () Bool)

(declare-fun tp_is_empty!37065 () Bool)

(assert (=> b!1339504 (= e!762968 tp_is_empty!37065)))

(declare-fun b!1339505 () Bool)

(declare-datatypes ((array!90986 0))(
  ( (array!90987 (arr!43949 (Array (_ BitVec 32) (_ BitVec 64))) (size!44499 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90986)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun e!762966 () Bool)

(declare-fun k0!1142 () (_ BitVec 64))

(assert (=> b!1339505 (= e!762966 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44499 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsgt from!1960 (size!44499 _keys!1571))))))

(declare-fun b!1339506 () Bool)

(declare-fun e!762964 () Bool)

(assert (=> b!1339506 (= e!762964 tp_is_empty!37065)))

(declare-fun b!1339507 () Bool)

(declare-fun res!888592 () Bool)

(assert (=> b!1339507 (=> (not res!888592) (not e!762966))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((V!54523 0))(
  ( (V!54524 (val!18607 Int)) )
))
(declare-datatypes ((ValueCell!17634 0))(
  ( (ValueCellFull!17634 (v!21255 V!54523)) (EmptyCell!17634) )
))
(declare-datatypes ((array!90988 0))(
  ( (array!90989 (arr!43950 (Array (_ BitVec 32) ValueCell!17634)) (size!44500 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90988)

(assert (=> b!1339507 (= res!888592 (and (= (size!44500 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44499 _keys!1571) (size!44500 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!888594 () Bool)

(assert (=> start!113014 (=> (not res!888594) (not e!762966))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113014 (= res!888594 (validMask!0 mask!1977))))

(assert (=> start!113014 e!762966))

(assert (=> start!113014 true))

(declare-fun array_inv!33139 (array!90986) Bool)

(assert (=> start!113014 (array_inv!33139 _keys!1571)))

(declare-fun e!762967 () Bool)

(declare-fun array_inv!33140 (array!90988) Bool)

(assert (=> start!113014 (and (array_inv!33140 _values!1303) e!762967)))

(declare-fun b!1339508 () Bool)

(declare-fun mapRes!57304 () Bool)

(assert (=> b!1339508 (= e!762967 (and e!762964 mapRes!57304))))

(declare-fun condMapEmpty!57304 () Bool)

(declare-fun mapDefault!57304 () ValueCell!17634)

(assert (=> b!1339508 (= condMapEmpty!57304 (= (arr!43950 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17634)) mapDefault!57304)))))

(declare-fun b!1339509 () Bool)

(declare-fun res!888591 () Bool)

(assert (=> b!1339509 (=> (not res!888591) (not e!762966))))

(declare-datatypes ((List!31111 0))(
  ( (Nil!31108) (Cons!31107 (h!32316 (_ BitVec 64)) (t!45443 List!31111)) )
))
(declare-fun arrayNoDuplicates!0 (array!90986 (_ BitVec 32) List!31111) Bool)

(assert (=> b!1339509 (= res!888591 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31108))))

(declare-fun b!1339510 () Bool)

(declare-fun res!888593 () Bool)

(assert (=> b!1339510 (=> (not res!888593) (not e!762966))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90986 (_ BitVec 32)) Bool)

(assert (=> b!1339510 (= res!888593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57304 () Bool)

(declare-fun tp!109003 () Bool)

(assert (=> mapNonEmpty!57304 (= mapRes!57304 (and tp!109003 e!762968))))

(declare-fun mapKey!57304 () (_ BitVec 32))

(declare-fun mapRest!57304 () (Array (_ BitVec 32) ValueCell!17634))

(declare-fun mapValue!57304 () ValueCell!17634)

(assert (=> mapNonEmpty!57304 (= (arr!43950 _values!1303) (store mapRest!57304 mapKey!57304 mapValue!57304))))

(declare-fun mapIsEmpty!57304 () Bool)

(assert (=> mapIsEmpty!57304 mapRes!57304))

(assert (= (and start!113014 res!888594) b!1339507))

(assert (= (and b!1339507 res!888592) b!1339510))

(assert (= (and b!1339510 res!888593) b!1339509))

(assert (= (and b!1339509 res!888591) b!1339505))

(assert (= (and b!1339508 condMapEmpty!57304) mapIsEmpty!57304))

(assert (= (and b!1339508 (not condMapEmpty!57304)) mapNonEmpty!57304))

(get-info :version)

(assert (= (and mapNonEmpty!57304 ((_ is ValueCellFull!17634) mapValue!57304)) b!1339504))

(assert (= (and b!1339508 ((_ is ValueCellFull!17634) mapDefault!57304)) b!1339506))

(assert (= start!113014 b!1339508))

(declare-fun m!1227541 () Bool)

(assert (=> start!113014 m!1227541))

(declare-fun m!1227543 () Bool)

(assert (=> start!113014 m!1227543))

(declare-fun m!1227545 () Bool)

(assert (=> start!113014 m!1227545))

(declare-fun m!1227547 () Bool)

(assert (=> b!1339509 m!1227547))

(declare-fun m!1227549 () Bool)

(assert (=> b!1339510 m!1227549))

(declare-fun m!1227551 () Bool)

(assert (=> mapNonEmpty!57304 m!1227551))

(check-sat (not b!1339509) tp_is_empty!37065 (not start!113014) (not mapNonEmpty!57304) (not b!1339510))
(check-sat)
