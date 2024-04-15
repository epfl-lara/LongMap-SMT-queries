; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113384 () Bool)

(assert start!113384)

(declare-fun b_free!31435 () Bool)

(declare-fun b_next!31435 () Bool)

(assert (=> start!113384 (= b_free!31435 (not b_next!31435))))

(declare-fun tp!110111 () Bool)

(declare-fun b_and!50705 () Bool)

(assert (=> start!113384 (= tp!110111 b_and!50705)))

(declare-fun b!1345892 () Bool)

(declare-fun res!893101 () Bool)

(declare-fun e!765788 () Bool)

(assert (=> b!1345892 (=> (not res!893101) (not e!765788))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91651 0))(
  ( (array!91652 (arr!44282 (Array (_ BitVec 32) (_ BitVec 64))) (size!44834 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91651)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!55017 0))(
  ( (V!55018 (val!18792 Int)) )
))
(declare-datatypes ((ValueCell!17819 0))(
  ( (ValueCellFull!17819 (v!21439 V!55017)) (EmptyCell!17819) )
))
(declare-datatypes ((array!91653 0))(
  ( (array!91654 (arr!44283 (Array (_ BitVec 32) ValueCell!17819)) (size!44835 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91653)

(assert (=> b!1345892 (= res!893101 (and (= (size!44835 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44834 _keys!1571) (size!44835 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345893 () Bool)

(declare-fun e!765790 () Bool)

(declare-fun tp_is_empty!37435 () Bool)

(assert (=> b!1345893 (= e!765790 tp_is_empty!37435)))

(declare-fun b!1345894 () Bool)

(declare-fun res!893097 () Bool)

(assert (=> b!1345894 (=> (not res!893097) (not e!765788))))

(declare-datatypes ((List!31429 0))(
  ( (Nil!31426) (Cons!31425 (h!32634 (_ BitVec 64)) (t!46011 List!31429)) )
))
(declare-fun arrayNoDuplicates!0 (array!91651 (_ BitVec 32) List!31429) Bool)

(assert (=> b!1345894 (= res!893097 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31426))))

(declare-fun b!1345896 () Bool)

(declare-fun e!765787 () Bool)

(declare-fun e!765789 () Bool)

(declare-fun mapRes!57859 () Bool)

(assert (=> b!1345896 (= e!765787 (and e!765789 mapRes!57859))))

(declare-fun condMapEmpty!57859 () Bool)

(declare-fun mapDefault!57859 () ValueCell!17819)

(assert (=> b!1345896 (= condMapEmpty!57859 (= (arr!44283 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17819)) mapDefault!57859)))))

(declare-fun mapIsEmpty!57859 () Bool)

(assert (=> mapIsEmpty!57859 mapRes!57859))

(declare-fun b!1345897 () Bool)

(assert (=> b!1345897 (= e!765788 false)))

(declare-fun minValue!1245 () V!55017)

(declare-fun zeroValue!1245 () V!55017)

(declare-fun lt!595269 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24294 0))(
  ( (tuple2!24295 (_1!12158 (_ BitVec 64)) (_2!12158 V!55017)) )
))
(declare-datatypes ((List!31430 0))(
  ( (Nil!31427) (Cons!31426 (h!32635 tuple2!24294) (t!46012 List!31430)) )
))
(declare-datatypes ((ListLongMap!21951 0))(
  ( (ListLongMap!21952 (toList!10991 List!31430)) )
))
(declare-fun contains!9096 (ListLongMap!21951 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5830 (array!91651 array!91653 (_ BitVec 32) (_ BitVec 32) V!55017 V!55017 (_ BitVec 32) Int) ListLongMap!21951)

(assert (=> b!1345897 (= lt!595269 (contains!9096 (getCurrentListMap!5830 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345898 () Bool)

(assert (=> b!1345898 (= e!765789 tp_is_empty!37435)))

(declare-fun b!1345899 () Bool)

(declare-fun res!893099 () Bool)

(assert (=> b!1345899 (=> (not res!893099) (not e!765788))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91651 (_ BitVec 32)) Bool)

(assert (=> b!1345899 (= res!893099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapNonEmpty!57859 () Bool)

(declare-fun tp!110110 () Bool)

(assert (=> mapNonEmpty!57859 (= mapRes!57859 (and tp!110110 e!765790))))

(declare-fun mapValue!57859 () ValueCell!17819)

(declare-fun mapKey!57859 () (_ BitVec 32))

(declare-fun mapRest!57859 () (Array (_ BitVec 32) ValueCell!17819))

(assert (=> mapNonEmpty!57859 (= (arr!44283 _values!1303) (store mapRest!57859 mapKey!57859 mapValue!57859))))

(declare-fun b!1345895 () Bool)

(declare-fun res!893100 () Bool)

(assert (=> b!1345895 (=> (not res!893100) (not e!765788))))

(assert (=> b!1345895 (= res!893100 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44834 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!893098 () Bool)

(assert (=> start!113384 (=> (not res!893098) (not e!765788))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113384 (= res!893098 (validMask!0 mask!1977))))

(assert (=> start!113384 e!765788))

(assert (=> start!113384 tp_is_empty!37435))

(assert (=> start!113384 true))

(declare-fun array_inv!33563 (array!91651) Bool)

(assert (=> start!113384 (array_inv!33563 _keys!1571)))

(declare-fun array_inv!33564 (array!91653) Bool)

(assert (=> start!113384 (and (array_inv!33564 _values!1303) e!765787)))

(assert (=> start!113384 tp!110111))

(assert (= (and start!113384 res!893098) b!1345892))

(assert (= (and b!1345892 res!893101) b!1345899))

(assert (= (and b!1345899 res!893099) b!1345894))

(assert (= (and b!1345894 res!893097) b!1345895))

(assert (= (and b!1345895 res!893100) b!1345897))

(assert (= (and b!1345896 condMapEmpty!57859) mapIsEmpty!57859))

(assert (= (and b!1345896 (not condMapEmpty!57859)) mapNonEmpty!57859))

(get-info :version)

(assert (= (and mapNonEmpty!57859 ((_ is ValueCellFull!17819) mapValue!57859)) b!1345893))

(assert (= (and b!1345896 ((_ is ValueCellFull!17819) mapDefault!57859)) b!1345898))

(assert (= start!113384 b!1345896))

(declare-fun m!1232755 () Bool)

(assert (=> start!113384 m!1232755))

(declare-fun m!1232757 () Bool)

(assert (=> start!113384 m!1232757))

(declare-fun m!1232759 () Bool)

(assert (=> start!113384 m!1232759))

(declare-fun m!1232761 () Bool)

(assert (=> b!1345897 m!1232761))

(assert (=> b!1345897 m!1232761))

(declare-fun m!1232763 () Bool)

(assert (=> b!1345897 m!1232763))

(declare-fun m!1232765 () Bool)

(assert (=> b!1345899 m!1232765))

(declare-fun m!1232767 () Bool)

(assert (=> b!1345894 m!1232767))

(declare-fun m!1232769 () Bool)

(assert (=> mapNonEmpty!57859 m!1232769))

(check-sat (not mapNonEmpty!57859) (not b!1345894) tp_is_empty!37435 (not b!1345897) (not b_next!31435) b_and!50705 (not b!1345899) (not start!113384))
(check-sat b_and!50705 (not b_next!31435))
