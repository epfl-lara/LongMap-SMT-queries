; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!134108 () Bool)

(assert start!134108)

(declare-fun b_free!32059 () Bool)

(declare-fun b_next!32059 () Bool)

(assert (=> start!134108 (= b_free!32059 (not b_next!32059))))

(declare-fun tp!113382 () Bool)

(declare-fun b_and!51631 () Bool)

(assert (=> start!134108 (= tp!113382 b_and!51631)))

(declare-fun b!1565591 () Bool)

(declare-fun e!872695 () Bool)

(declare-fun tp_is_empty!38779 () Bool)

(assert (=> b!1565591 (= e!872695 tp_is_empty!38779)))

(declare-fun b!1565592 () Bool)

(declare-fun res!1069510 () Bool)

(declare-fun e!872694 () Bool)

(assert (=> b!1565592 (=> (not res!1069510) (not e!872694))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-datatypes ((array!104380 0))(
  ( (array!104381 (arr!50375 (Array (_ BitVec 32) (_ BitVec 64))) (size!50926 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104380)

(declare-datatypes ((V!59913 0))(
  ( (V!59914 (val!19473 Int)) )
))
(declare-datatypes ((ValueCell!18359 0))(
  ( (ValueCellFull!18359 (v!22217 V!59913)) (EmptyCell!18359) )
))
(declare-datatypes ((array!104382 0))(
  ( (array!104383 (arr!50376 (Array (_ BitVec 32) ValueCell!18359)) (size!50927 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104382)

(declare-fun extraKeys!434 () (_ BitVec 32))

(assert (=> b!1565592 (= res!1069510 (and (= (size!50927 _values!487) (bvadd #b00000000000000000000000000000001 mask!947)) (= (size!50926 _keys!637) (size!50927 _values!487)) (bvsge mask!947 #b00000000000000000000000000000000) (bvsge extraKeys!434 #b00000000000000000000000000000000) (bvsle extraKeys!434 #b00000000000000000000000000000011)))))

(declare-fun res!1069505 () Bool)

(assert (=> start!134108 (=> (not res!1069505) (not e!872694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!134108 (= res!1069505 (validMask!0 mask!947))))

(assert (=> start!134108 e!872694))

(assert (=> start!134108 tp!113382))

(assert (=> start!134108 tp_is_empty!38779))

(assert (=> start!134108 true))

(declare-fun array_inv!39397 (array!104380) Bool)

(assert (=> start!134108 (array_inv!39397 _keys!637)))

(declare-fun e!872693 () Bool)

(declare-fun array_inv!39398 (array!104382) Bool)

(assert (=> start!134108 (and (array_inv!39398 _values!487) e!872693)))

(declare-fun mapNonEmpty!59544 () Bool)

(declare-fun mapRes!59544 () Bool)

(declare-fun tp!113381 () Bool)

(declare-fun e!872692 () Bool)

(assert (=> mapNonEmpty!59544 (= mapRes!59544 (and tp!113381 e!872692))))

(declare-fun mapRest!59544 () (Array (_ BitVec 32) ValueCell!18359))

(declare-fun mapValue!59544 () ValueCell!18359)

(declare-fun mapKey!59544 () (_ BitVec 32))

(assert (=> mapNonEmpty!59544 (= (arr!50376 _values!487) (store mapRest!59544 mapKey!59544 mapValue!59544))))

(declare-fun mapIsEmpty!59544 () Bool)

(assert (=> mapIsEmpty!59544 mapRes!59544))

(declare-fun b!1565593 () Bool)

(declare-fun e!872690 () Bool)

(assert (=> b!1565593 (= e!872694 e!872690)))

(declare-fun res!1069509 () Bool)

(assert (=> b!1565593 (=> (not res!1069509) (not e!872690))))

(declare-datatypes ((tuple2!25182 0))(
  ( (tuple2!25183 (_1!12602 (_ BitVec 64)) (_2!12602 V!59913)) )
))
(declare-datatypes ((List!36546 0))(
  ( (Nil!36543) (Cons!36542 (h!38006 tuple2!25182) (t!51385 List!36546)) )
))
(declare-datatypes ((ListLongMap!22625 0))(
  ( (ListLongMap!22626 (toList!11328 List!36546)) )
))
(declare-fun lt!672739 () ListLongMap!22625)

(declare-fun contains!10329 (ListLongMap!22625 (_ BitVec 64)) Bool)

(assert (=> b!1565593 (= res!1069509 (not (contains!10329 lt!672739 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun defaultEntry!495 () Int)

(declare-fun zeroValue!453 () V!59913)

(declare-fun minValue!453 () V!59913)

(declare-fun from!782 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6727 (array!104380 array!104382 (_ BitVec 32) (_ BitVec 32) V!59913 V!59913 (_ BitVec 32) Int) ListLongMap!22625)

(assert (=> b!1565593 (= lt!672739 (getCurrentListMapNoExtraKeys!6727 _keys!637 _values!487 mask!947 extraKeys!434 zeroValue!453 minValue!453 (bvadd #b00000000000000000000000000000001 from!782) defaultEntry!495))))

(declare-fun b!1565594 () Bool)

(declare-fun res!1069507 () Bool)

(assert (=> b!1565594 (=> (not res!1069507) (not e!872694))))

(assert (=> b!1565594 (= res!1069507 (and (bvsge from!782 #b00000000000000000000000000000000) (bvsle from!782 (size!50926 _keys!637)) (bvslt from!782 (size!50926 _keys!637))))))

(declare-fun b!1565595 () Bool)

(declare-fun res!1069506 () Bool)

(assert (=> b!1565595 (=> (not res!1069506) (not e!872694))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104380 (_ BitVec 32)) Bool)

(assert (=> b!1565595 (= res!1069506 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1565596 () Bool)

(assert (=> b!1565596 (= e!872690 false)))

(declare-fun lt!672740 () Bool)

(assert (=> b!1565596 (= lt!672740 (contains!10329 lt!672739 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1565597 () Bool)

(assert (=> b!1565597 (= e!872693 (and e!872695 mapRes!59544))))

(declare-fun condMapEmpty!59544 () Bool)

(declare-fun mapDefault!59544 () ValueCell!18359)

(assert (=> b!1565597 (= condMapEmpty!59544 (= (arr!50376 _values!487) ((as const (Array (_ BitVec 32) ValueCell!18359)) mapDefault!59544)))))

(declare-fun b!1565598 () Bool)

(assert (=> b!1565598 (= e!872692 tp_is_empty!38779)))

(declare-fun b!1565599 () Bool)

(declare-fun res!1069508 () Bool)

(assert (=> b!1565599 (=> (not res!1069508) (not e!872694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1565599 (= res!1069508 (not (validKeyInArray!0 (select (arr!50375 _keys!637) from!782))))))

(declare-fun b!1565600 () Bool)

(declare-fun res!1069511 () Bool)

(assert (=> b!1565600 (=> (not res!1069511) (not e!872694))))

(declare-datatypes ((List!36547 0))(
  ( (Nil!36544) (Cons!36543 (h!38007 (_ BitVec 64)) (t!51386 List!36547)) )
))
(declare-fun arrayNoDuplicates!0 (array!104380 (_ BitVec 32) List!36547) Bool)

(assert (=> b!1565600 (= res!1069511 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36544))))

(assert (= (and start!134108 res!1069505) b!1565592))

(assert (= (and b!1565592 res!1069510) b!1565595))

(assert (= (and b!1565595 res!1069506) b!1565600))

(assert (= (and b!1565600 res!1069511) b!1565594))

(assert (= (and b!1565594 res!1069507) b!1565599))

(assert (= (and b!1565599 res!1069508) b!1565593))

(assert (= (and b!1565593 res!1069509) b!1565596))

(assert (= (and b!1565597 condMapEmpty!59544) mapIsEmpty!59544))

(assert (= (and b!1565597 (not condMapEmpty!59544)) mapNonEmpty!59544))

(get-info :version)

(assert (= (and mapNonEmpty!59544 ((_ is ValueCellFull!18359) mapValue!59544)) b!1565598))

(assert (= (and b!1565597 ((_ is ValueCellFull!18359) mapDefault!59544)) b!1565591))

(assert (= start!134108 b!1565597))

(declare-fun m!1441011 () Bool)

(assert (=> b!1565600 m!1441011))

(declare-fun m!1441013 () Bool)

(assert (=> start!134108 m!1441013))

(declare-fun m!1441015 () Bool)

(assert (=> start!134108 m!1441015))

(declare-fun m!1441017 () Bool)

(assert (=> start!134108 m!1441017))

(declare-fun m!1441019 () Bool)

(assert (=> b!1565596 m!1441019))

(declare-fun m!1441021 () Bool)

(assert (=> b!1565593 m!1441021))

(declare-fun m!1441023 () Bool)

(assert (=> b!1565593 m!1441023))

(declare-fun m!1441025 () Bool)

(assert (=> mapNonEmpty!59544 m!1441025))

(declare-fun m!1441027 () Bool)

(assert (=> b!1565595 m!1441027))

(declare-fun m!1441029 () Bool)

(assert (=> b!1565599 m!1441029))

(assert (=> b!1565599 m!1441029))

(declare-fun m!1441031 () Bool)

(assert (=> b!1565599 m!1441031))

(check-sat (not b_next!32059) (not b!1565593) tp_is_empty!38779 (not mapNonEmpty!59544) (not b!1565596) (not b!1565600) b_and!51631 (not start!134108) (not b!1565595) (not b!1565599))
(check-sat b_and!51631 (not b_next!32059))
