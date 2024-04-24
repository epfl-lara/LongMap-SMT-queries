; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113506 () Bool)

(assert start!113506)

(declare-fun b_free!31333 () Bool)

(declare-fun b_next!31333 () Bool)

(assert (=> start!113506 (= b_free!31333 (not b_next!31333))))

(declare-fun tp!109803 () Bool)

(declare-fun b_and!50557 () Bool)

(assert (=> start!113506 (= tp!109803 b_and!50557)))

(declare-fun res!892294 () Bool)

(declare-fun e!765819 () Bool)

(assert (=> start!113506 (=> (not res!892294) (not e!765819))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113506 (= res!892294 (validMask!0 mask!1977))))

(assert (=> start!113506 e!765819))

(declare-fun tp_is_empty!37333 () Bool)

(assert (=> start!113506 tp_is_empty!37333))

(assert (=> start!113506 true))

(declare-datatypes ((array!91617 0))(
  ( (array!91618 (arr!44260 (Array (_ BitVec 32) (_ BitVec 64))) (size!44811 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91617)

(declare-fun array_inv!33627 (array!91617) Bool)

(assert (=> start!113506 (array_inv!33627 _keys!1571)))

(declare-datatypes ((V!54881 0))(
  ( (V!54882 (val!18741 Int)) )
))
(declare-datatypes ((ValueCell!17768 0))(
  ( (ValueCellFull!17768 (v!21384 V!54881)) (EmptyCell!17768) )
))
(declare-datatypes ((array!91619 0))(
  ( (array!91620 (arr!44261 (Array (_ BitVec 32) ValueCell!17768)) (size!44812 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91619)

(declare-fun e!765817 () Bool)

(declare-fun array_inv!33628 (array!91619) Bool)

(assert (=> start!113506 (and (array_inv!33628 _values!1303) e!765817)))

(assert (=> start!113506 tp!109803))

(declare-fun mapIsEmpty!57706 () Bool)

(declare-fun mapRes!57706 () Bool)

(assert (=> mapIsEmpty!57706 mapRes!57706))

(declare-fun b!1345386 () Bool)

(declare-fun res!892296 () Bool)

(assert (=> b!1345386 (=> (not res!892296) (not e!765819))))

(declare-datatypes ((List!31336 0))(
  ( (Nil!31333) (Cons!31332 (h!32550 (_ BitVec 64)) (t!45852 List!31336)) )
))
(declare-fun arrayNoDuplicates!0 (array!91617 (_ BitVec 32) List!31336) Bool)

(assert (=> b!1345386 (= res!892296 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31333))))

(declare-fun mapNonEmpty!57706 () Bool)

(declare-fun tp!109804 () Bool)

(declare-fun e!765820 () Bool)

(assert (=> mapNonEmpty!57706 (= mapRes!57706 (and tp!109804 e!765820))))

(declare-fun mapKey!57706 () (_ BitVec 32))

(declare-fun mapRest!57706 () (Array (_ BitVec 32) ValueCell!17768))

(declare-fun mapValue!57706 () ValueCell!17768)

(assert (=> mapNonEmpty!57706 (= (arr!44261 _values!1303) (store mapRest!57706 mapKey!57706 mapValue!57706))))

(declare-fun b!1345387 () Bool)

(assert (=> b!1345387 (= e!765820 tp_is_empty!37333)))

(declare-fun b!1345388 () Bool)

(assert (=> b!1345388 (= e!765819 false)))

(declare-fun minValue!1245 () V!54881)

(declare-fun lt!595625 () Bool)

(declare-fun zeroValue!1245 () V!54881)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun defaultEntry!1306 () Int)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-datatypes ((tuple2!24194 0))(
  ( (tuple2!24195 (_1!12108 (_ BitVec 64)) (_2!12108 V!54881)) )
))
(declare-datatypes ((List!31337 0))(
  ( (Nil!31334) (Cons!31333 (h!32551 tuple2!24194) (t!45853 List!31337)) )
))
(declare-datatypes ((ListLongMap!21859 0))(
  ( (ListLongMap!21860 (toList!10945 List!31337)) )
))
(declare-fun contains!9133 (ListLongMap!21859 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5889 (array!91617 array!91619 (_ BitVec 32) (_ BitVec 32) V!54881 V!54881 (_ BitVec 32) Int) ListLongMap!21859)

(assert (=> b!1345388 (= lt!595625 (contains!9133 (getCurrentListMap!5889 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345389 () Bool)

(declare-fun res!892298 () Bool)

(assert (=> b!1345389 (=> (not res!892298) (not e!765819))))

(assert (=> b!1345389 (= res!892298 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44811 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1345390 () Bool)

(declare-fun e!765818 () Bool)

(assert (=> b!1345390 (= e!765818 tp_is_empty!37333)))

(declare-fun b!1345391 () Bool)

(declare-fun res!892295 () Bool)

(assert (=> b!1345391 (=> (not res!892295) (not e!765819))))

(assert (=> b!1345391 (= res!892295 (and (= (size!44812 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44811 _keys!1571) (size!44812 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345392 () Bool)

(assert (=> b!1345392 (= e!765817 (and e!765818 mapRes!57706))))

(declare-fun condMapEmpty!57706 () Bool)

(declare-fun mapDefault!57706 () ValueCell!17768)

(assert (=> b!1345392 (= condMapEmpty!57706 (= (arr!44261 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17768)) mapDefault!57706)))))

(declare-fun b!1345393 () Bool)

(declare-fun res!892297 () Bool)

(assert (=> b!1345393 (=> (not res!892297) (not e!765819))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91617 (_ BitVec 32)) Bool)

(assert (=> b!1345393 (= res!892297 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(assert (= (and start!113506 res!892294) b!1345391))

(assert (= (and b!1345391 res!892295) b!1345393))

(assert (= (and b!1345393 res!892297) b!1345386))

(assert (= (and b!1345386 res!892296) b!1345389))

(assert (= (and b!1345389 res!892298) b!1345388))

(assert (= (and b!1345392 condMapEmpty!57706) mapIsEmpty!57706))

(assert (= (and b!1345392 (not condMapEmpty!57706)) mapNonEmpty!57706))

(get-info :version)

(assert (= (and mapNonEmpty!57706 ((_ is ValueCellFull!17768) mapValue!57706)) b!1345387))

(assert (= (and b!1345392 ((_ is ValueCellFull!17768) mapDefault!57706)) b!1345390))

(assert (= start!113506 b!1345392))

(declare-fun m!1233405 () Bool)

(assert (=> b!1345393 m!1233405))

(declare-fun m!1233407 () Bool)

(assert (=> start!113506 m!1233407))

(declare-fun m!1233409 () Bool)

(assert (=> start!113506 m!1233409))

(declare-fun m!1233411 () Bool)

(assert (=> start!113506 m!1233411))

(declare-fun m!1233413 () Bool)

(assert (=> b!1345386 m!1233413))

(declare-fun m!1233415 () Bool)

(assert (=> mapNonEmpty!57706 m!1233415))

(declare-fun m!1233417 () Bool)

(assert (=> b!1345388 m!1233417))

(assert (=> b!1345388 m!1233417))

(declare-fun m!1233419 () Bool)

(assert (=> b!1345388 m!1233419))

(check-sat tp_is_empty!37333 (not b_next!31333) (not mapNonEmpty!57706) (not b!1345386) (not b!1345393) b_and!50557 (not b!1345388) (not start!113506))
(check-sat b_and!50557 (not b_next!31333))
