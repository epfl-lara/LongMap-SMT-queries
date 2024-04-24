; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113512 () Bool)

(assert start!113512)

(declare-fun b_free!31339 () Bool)

(declare-fun b_next!31339 () Bool)

(assert (=> start!113512 (= b_free!31339 (not b_next!31339))))

(declare-fun tp!109821 () Bool)

(declare-fun b_and!50563 () Bool)

(assert (=> start!113512 (= tp!109821 b_and!50563)))

(declare-fun b!1345458 () Bool)

(declare-fun e!765864 () Bool)

(declare-fun e!765862 () Bool)

(declare-fun mapRes!57715 () Bool)

(assert (=> b!1345458 (= e!765864 (and e!765862 mapRes!57715))))

(declare-fun condMapEmpty!57715 () Bool)

(declare-datatypes ((V!54889 0))(
  ( (V!54890 (val!18744 Int)) )
))
(declare-datatypes ((ValueCell!17771 0))(
  ( (ValueCellFull!17771 (v!21387 V!54889)) (EmptyCell!17771) )
))
(declare-datatypes ((array!91629 0))(
  ( (array!91630 (arr!44266 (Array (_ BitVec 32) ValueCell!17771)) (size!44817 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91629)

(declare-fun mapDefault!57715 () ValueCell!17771)

(assert (=> b!1345458 (= condMapEmpty!57715 (= (arr!44266 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17771)) mapDefault!57715)))))

(declare-fun mapNonEmpty!57715 () Bool)

(declare-fun tp!109822 () Bool)

(declare-fun e!765866 () Bool)

(assert (=> mapNonEmpty!57715 (= mapRes!57715 (and tp!109822 e!765866))))

(declare-fun mapKey!57715 () (_ BitVec 32))

(declare-fun mapRest!57715 () (Array (_ BitVec 32) ValueCell!17771))

(declare-fun mapValue!57715 () ValueCell!17771)

(assert (=> mapNonEmpty!57715 (= (arr!44266 _values!1303) (store mapRest!57715 mapKey!57715 mapValue!57715))))

(declare-fun b!1345459 () Bool)

(declare-fun res!892341 () Bool)

(declare-fun e!765863 () Bool)

(assert (=> b!1345459 (=> (not res!892341) (not e!765863))))

(declare-datatypes ((array!91631 0))(
  ( (array!91632 (arr!44267 (Array (_ BitVec 32) (_ BitVec 64))) (size!44818 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91631)

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91631 (_ BitVec 32)) Bool)

(assert (=> b!1345459 (= res!892341 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345460 () Bool)

(assert (=> b!1345460 (= e!765863 false)))

(declare-fun minValue!1245 () V!54889)

(declare-fun lt!595634 () Bool)

(declare-fun zeroValue!1245 () V!54889)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24198 0))(
  ( (tuple2!24199 (_1!12110 (_ BitVec 64)) (_2!12110 V!54889)) )
))
(declare-datatypes ((List!31340 0))(
  ( (Nil!31337) (Cons!31336 (h!32554 tuple2!24198) (t!45856 List!31340)) )
))
(declare-datatypes ((ListLongMap!21863 0))(
  ( (ListLongMap!21864 (toList!10947 List!31340)) )
))
(declare-fun contains!9135 (ListLongMap!21863 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5891 (array!91631 array!91629 (_ BitVec 32) (_ BitVec 32) V!54889 V!54889 (_ BitVec 32) Int) ListLongMap!21863)

(assert (=> b!1345460 (= lt!595634 (contains!9135 (getCurrentListMap!5891 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345461 () Bool)

(declare-fun res!892342 () Bool)

(assert (=> b!1345461 (=> (not res!892342) (not e!765863))))

(assert (=> b!1345461 (= res!892342 (and (= (size!44817 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44818 _keys!1571) (size!44817 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345462 () Bool)

(declare-fun res!892340 () Bool)

(assert (=> b!1345462 (=> (not res!892340) (not e!765863))))

(assert (=> b!1345462 (= res!892340 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44818 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!892339 () Bool)

(assert (=> start!113512 (=> (not res!892339) (not e!765863))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113512 (= res!892339 (validMask!0 mask!1977))))

(assert (=> start!113512 e!765863))

(declare-fun tp_is_empty!37339 () Bool)

(assert (=> start!113512 tp_is_empty!37339))

(assert (=> start!113512 true))

(declare-fun array_inv!33631 (array!91631) Bool)

(assert (=> start!113512 (array_inv!33631 _keys!1571)))

(declare-fun array_inv!33632 (array!91629) Bool)

(assert (=> start!113512 (and (array_inv!33632 _values!1303) e!765864)))

(assert (=> start!113512 tp!109821))

(declare-fun b!1345463 () Bool)

(assert (=> b!1345463 (= e!765866 tp_is_empty!37339)))

(declare-fun mapIsEmpty!57715 () Bool)

(assert (=> mapIsEmpty!57715 mapRes!57715))

(declare-fun b!1345464 () Bool)

(assert (=> b!1345464 (= e!765862 tp_is_empty!37339)))

(declare-fun b!1345465 () Bool)

(declare-fun res!892343 () Bool)

(assert (=> b!1345465 (=> (not res!892343) (not e!765863))))

(declare-datatypes ((List!31341 0))(
  ( (Nil!31338) (Cons!31337 (h!32555 (_ BitVec 64)) (t!45857 List!31341)) )
))
(declare-fun arrayNoDuplicates!0 (array!91631 (_ BitVec 32) List!31341) Bool)

(assert (=> b!1345465 (= res!892343 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31338))))

(assert (= (and start!113512 res!892339) b!1345461))

(assert (= (and b!1345461 res!892342) b!1345459))

(assert (= (and b!1345459 res!892341) b!1345465))

(assert (= (and b!1345465 res!892343) b!1345462))

(assert (= (and b!1345462 res!892340) b!1345460))

(assert (= (and b!1345458 condMapEmpty!57715) mapIsEmpty!57715))

(assert (= (and b!1345458 (not condMapEmpty!57715)) mapNonEmpty!57715))

(get-info :version)

(assert (= (and mapNonEmpty!57715 ((_ is ValueCellFull!17771) mapValue!57715)) b!1345463))

(assert (= (and b!1345458 ((_ is ValueCellFull!17771) mapDefault!57715)) b!1345464))

(assert (= start!113512 b!1345458))

(declare-fun m!1233453 () Bool)

(assert (=> b!1345465 m!1233453))

(declare-fun m!1233455 () Bool)

(assert (=> b!1345460 m!1233455))

(assert (=> b!1345460 m!1233455))

(declare-fun m!1233457 () Bool)

(assert (=> b!1345460 m!1233457))

(declare-fun m!1233459 () Bool)

(assert (=> mapNonEmpty!57715 m!1233459))

(declare-fun m!1233461 () Bool)

(assert (=> start!113512 m!1233461))

(declare-fun m!1233463 () Bool)

(assert (=> start!113512 m!1233463))

(declare-fun m!1233465 () Bool)

(assert (=> start!113512 m!1233465))

(declare-fun m!1233467 () Bool)

(assert (=> b!1345459 m!1233467))

(check-sat (not b!1345460) tp_is_empty!37339 (not b!1345465) (not b_next!31339) (not mapNonEmpty!57715) (not start!113512) b_and!50563 (not b!1345459))
(check-sat b_and!50563 (not b_next!31339))
