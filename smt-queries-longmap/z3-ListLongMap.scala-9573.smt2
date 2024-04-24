; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113524 () Bool)

(assert start!113524)

(declare-fun b_free!31351 () Bool)

(declare-fun b_next!31351 () Bool)

(assert (=> start!113524 (= b_free!31351 (not b_next!31351))))

(declare-fun tp!109858 () Bool)

(declare-fun b_and!50575 () Bool)

(assert (=> start!113524 (= tp!109858 b_and!50575)))

(declare-fun b!1345602 () Bool)

(declare-fun e!765953 () Bool)

(declare-fun tp_is_empty!37351 () Bool)

(assert (=> b!1345602 (= e!765953 tp_is_empty!37351)))

(declare-fun b!1345603 () Bool)

(declare-fun e!765955 () Bool)

(assert (=> b!1345603 (= e!765955 false)))

(declare-datatypes ((V!54905 0))(
  ( (V!54906 (val!18750 Int)) )
))
(declare-fun minValue!1245 () V!54905)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91653 0))(
  ( (array!91654 (arr!44278 (Array (_ BitVec 32) (_ BitVec 64))) (size!44829 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91653)

(declare-fun zeroValue!1245 () V!54905)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((ValueCell!17777 0))(
  ( (ValueCellFull!17777 (v!21393 V!54905)) (EmptyCell!17777) )
))
(declare-datatypes ((array!91655 0))(
  ( (array!91656 (arr!44279 (Array (_ BitVec 32) ValueCell!17777)) (size!44830 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91655)

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun lt!595652 () Bool)

(declare-fun from!1960 () (_ BitVec 32))

(declare-datatypes ((tuple2!24206 0))(
  ( (tuple2!24207 (_1!12114 (_ BitVec 64)) (_2!12114 V!54905)) )
))
(declare-datatypes ((List!31348 0))(
  ( (Nil!31345) (Cons!31344 (h!32562 tuple2!24206) (t!45864 List!31348)) )
))
(declare-datatypes ((ListLongMap!21871 0))(
  ( (ListLongMap!21872 (toList!10951 List!31348)) )
))
(declare-fun contains!9139 (ListLongMap!21871 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5895 (array!91653 array!91655 (_ BitVec 32) (_ BitVec 32) V!54905 V!54905 (_ BitVec 32) Int) ListLongMap!21871)

(assert (=> b!1345603 (= lt!595652 (contains!9139 (getCurrentListMap!5895 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345604 () Bool)

(declare-fun res!892432 () Bool)

(assert (=> b!1345604 (=> (not res!892432) (not e!765955))))

(assert (=> b!1345604 (= res!892432 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44829 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345605 () Bool)

(declare-fun e!765956 () Bool)

(assert (=> b!1345605 (= e!765956 tp_is_empty!37351)))

(declare-fun mapIsEmpty!57733 () Bool)

(declare-fun mapRes!57733 () Bool)

(assert (=> mapIsEmpty!57733 mapRes!57733))

(declare-fun b!1345606 () Bool)

(declare-fun e!765954 () Bool)

(assert (=> b!1345606 (= e!765954 (and e!765956 mapRes!57733))))

(declare-fun condMapEmpty!57733 () Bool)

(declare-fun mapDefault!57733 () ValueCell!17777)

(assert (=> b!1345606 (= condMapEmpty!57733 (= (arr!44279 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17777)) mapDefault!57733)))))

(declare-fun b!1345607 () Bool)

(declare-fun res!892430 () Bool)

(assert (=> b!1345607 (=> (not res!892430) (not e!765955))))

(declare-datatypes ((List!31349 0))(
  ( (Nil!31346) (Cons!31345 (h!32563 (_ BitVec 64)) (t!45865 List!31349)) )
))
(declare-fun arrayNoDuplicates!0 (array!91653 (_ BitVec 32) List!31349) Bool)

(assert (=> b!1345607 (= res!892430 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31346))))

(declare-fun res!892431 () Bool)

(assert (=> start!113524 (=> (not res!892431) (not e!765955))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113524 (= res!892431 (validMask!0 mask!1977))))

(assert (=> start!113524 e!765955))

(assert (=> start!113524 tp_is_empty!37351))

(assert (=> start!113524 true))

(declare-fun array_inv!33639 (array!91653) Bool)

(assert (=> start!113524 (array_inv!33639 _keys!1571)))

(declare-fun array_inv!33640 (array!91655) Bool)

(assert (=> start!113524 (and (array_inv!33640 _values!1303) e!765954)))

(assert (=> start!113524 tp!109858))

(declare-fun mapNonEmpty!57733 () Bool)

(declare-fun tp!109857 () Bool)

(assert (=> mapNonEmpty!57733 (= mapRes!57733 (and tp!109857 e!765953))))

(declare-fun mapKey!57733 () (_ BitVec 32))

(declare-fun mapValue!57733 () ValueCell!17777)

(declare-fun mapRest!57733 () (Array (_ BitVec 32) ValueCell!17777))

(assert (=> mapNonEmpty!57733 (= (arr!44279 _values!1303) (store mapRest!57733 mapKey!57733 mapValue!57733))))

(declare-fun b!1345608 () Bool)

(declare-fun res!892429 () Bool)

(assert (=> b!1345608 (=> (not res!892429) (not e!765955))))

(assert (=> b!1345608 (= res!892429 (and (= (size!44830 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44829 _keys!1571) (size!44830 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345609 () Bool)

(declare-fun res!892433 () Bool)

(assert (=> b!1345609 (=> (not res!892433) (not e!765955))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91653 (_ BitVec 32)) Bool)

(assert (=> b!1345609 (= res!892433 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113524 res!892431) b!1345608))

(assert (= (and b!1345608 res!892429) b!1345609))

(assert (= (and b!1345609 res!892433) b!1345607))

(assert (= (and b!1345607 res!892430) b!1345604))

(assert (= (and b!1345604 res!892432) b!1345603))

(assert (= (and b!1345606 condMapEmpty!57733) mapIsEmpty!57733))

(assert (= (and b!1345606 (not condMapEmpty!57733)) mapNonEmpty!57733))

(get-info :version)

(assert (= (and mapNonEmpty!57733 ((_ is ValueCellFull!17777) mapValue!57733)) b!1345602))

(assert (= (and b!1345606 ((_ is ValueCellFull!17777) mapDefault!57733)) b!1345605))

(assert (= start!113524 b!1345606))

(declare-fun m!1233549 () Bool)

(assert (=> b!1345603 m!1233549))

(assert (=> b!1345603 m!1233549))

(declare-fun m!1233551 () Bool)

(assert (=> b!1345603 m!1233551))

(declare-fun m!1233553 () Bool)

(assert (=> b!1345607 m!1233553))

(declare-fun m!1233555 () Bool)

(assert (=> start!113524 m!1233555))

(declare-fun m!1233557 () Bool)

(assert (=> start!113524 m!1233557))

(declare-fun m!1233559 () Bool)

(assert (=> start!113524 m!1233559))

(declare-fun m!1233561 () Bool)

(assert (=> mapNonEmpty!57733 m!1233561))

(declare-fun m!1233563 () Bool)

(assert (=> b!1345609 m!1233563))

(check-sat (not start!113524) (not b!1345603) (not b!1345607) (not mapNonEmpty!57733) tp_is_empty!37351 (not b_next!31351) b_and!50575 (not b!1345609))
(check-sat b_and!50575 (not b_next!31351))
