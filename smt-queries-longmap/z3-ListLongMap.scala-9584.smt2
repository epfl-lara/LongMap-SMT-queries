; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113366 () Bool)

(assert start!113366)

(declare-fun b_free!31417 () Bool)

(declare-fun b_next!31417 () Bool)

(assert (=> start!113366 (= b_free!31417 (not b_next!31417))))

(declare-fun tp!110057 () Bool)

(declare-fun b_and!50669 () Bool)

(assert (=> start!113366 (= tp!110057 b_and!50669)))

(declare-fun b!1345508 () Bool)

(declare-fun res!892821 () Bool)

(declare-fun e!765627 () Bool)

(assert (=> b!1345508 (=> (not res!892821) (not e!765627))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-datatypes ((array!91617 0))(
  ( (array!91618 (arr!44265 (Array (_ BitVec 32) (_ BitVec 64))) (size!44817 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91617)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-datatypes ((V!54993 0))(
  ( (V!54994 (val!18783 Int)) )
))
(declare-datatypes ((ValueCell!17810 0))(
  ( (ValueCellFull!17810 (v!21430 V!54993)) (EmptyCell!17810) )
))
(declare-datatypes ((array!91619 0))(
  ( (array!91620 (arr!44266 (Array (_ BitVec 32) ValueCell!17810)) (size!44818 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91619)

(assert (=> b!1345508 (= res!892821 (and (= (size!44818 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44817 _keys!1571) (size!44818 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1345509 () Bool)

(declare-fun e!765631 () Bool)

(assert (=> b!1345509 (= e!765627 e!765631)))

(declare-fun res!892818 () Bool)

(assert (=> b!1345509 (=> (not res!892818) (not e!765631))))

(declare-datatypes ((tuple2!24278 0))(
  ( (tuple2!24279 (_1!12150 (_ BitVec 64)) (_2!12150 V!54993)) )
))
(declare-datatypes ((List!31413 0))(
  ( (Nil!31410) (Cons!31409 (h!32618 tuple2!24278) (t!45979 List!31413)) )
))
(declare-datatypes ((ListLongMap!21935 0))(
  ( (ListLongMap!21936 (toList!10983 List!31413)) )
))
(declare-fun lt!595194 () ListLongMap!21935)

(declare-fun lt!595192 () V!54993)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun contains!9088 (ListLongMap!21935 (_ BitVec 64)) Bool)

(declare-fun +!4858 (ListLongMap!21935 tuple2!24278) ListLongMap!21935)

(assert (=> b!1345509 (= res!892818 (contains!9088 (+!4858 lt!595194 (tuple2!24279 (select (arr!44265 _keys!1571) from!1960) lt!595192)) k0!1142))))

(declare-fun minValue!1245 () V!54993)

(declare-fun zeroValue!1245 () V!54993)

(declare-fun defaultEntry!1306 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6501 (array!91617 array!91619 (_ BitVec 32) (_ BitVec 32) V!54993 V!54993 (_ BitVec 32) Int) ListLongMap!21935)

(assert (=> b!1345509 (= lt!595194 (getCurrentListMapNoExtraKeys!6501 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun get!22370 (ValueCell!17810 V!54993) V!54993)

(declare-fun dynLambda!3788 (Int (_ BitVec 64)) V!54993)

(assert (=> b!1345509 (= lt!595192 (get!22370 (select (arr!44266 _values!1303) from!1960) (dynLambda!3788 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1345510 () Bool)

(declare-fun res!892819 () Bool)

(assert (=> b!1345510 (=> (not res!892819) (not e!765627))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1345510 (= res!892819 (validKeyInArray!0 (select (arr!44265 _keys!1571) from!1960)))))

(declare-fun res!892817 () Bool)

(assert (=> start!113366 (=> (not res!892817) (not e!765627))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113366 (= res!892817 (validMask!0 mask!1977))))

(assert (=> start!113366 e!765627))

(declare-fun tp_is_empty!37417 () Bool)

(assert (=> start!113366 tp_is_empty!37417))

(assert (=> start!113366 true))

(declare-fun array_inv!33551 (array!91617) Bool)

(assert (=> start!113366 (array_inv!33551 _keys!1571)))

(declare-fun e!765630 () Bool)

(declare-fun array_inv!33552 (array!91619) Bool)

(assert (=> start!113366 (and (array_inv!33552 _values!1303) e!765630)))

(assert (=> start!113366 tp!110057))

(declare-fun b!1345511 () Bool)

(declare-fun res!892814 () Bool)

(assert (=> b!1345511 (=> (not res!892814) (not e!765631))))

(assert (=> b!1345511 (= res!892814 (not (= k0!1142 (select (arr!44265 _keys!1571) from!1960))))))

(declare-fun b!1345512 () Bool)

(declare-fun res!892813 () Bool)

(assert (=> b!1345512 (=> (not res!892813) (not e!765627))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91617 (_ BitVec 32)) Bool)

(assert (=> b!1345512 (= res!892813 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1345513 () Bool)

(declare-fun res!892820 () Bool)

(assert (=> b!1345513 (=> (not res!892820) (not e!765627))))

(declare-datatypes ((List!31414 0))(
  ( (Nil!31411) (Cons!31410 (h!32619 (_ BitVec 64)) (t!45980 List!31414)) )
))
(declare-fun arrayNoDuplicates!0 (array!91617 (_ BitVec 32) List!31414) Bool)

(assert (=> b!1345513 (= res!892820 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31411))))

(declare-fun b!1345514 () Bool)

(declare-fun e!765632 () Bool)

(declare-fun mapRes!57832 () Bool)

(assert (=> b!1345514 (= e!765630 (and e!765632 mapRes!57832))))

(declare-fun condMapEmpty!57832 () Bool)

(declare-fun mapDefault!57832 () ValueCell!17810)

(assert (=> b!1345514 (= condMapEmpty!57832 (= (arr!44266 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17810)) mapDefault!57832)))))

(declare-fun b!1345515 () Bool)

(declare-fun e!765628 () Bool)

(assert (=> b!1345515 (= e!765628 tp_is_empty!37417)))

(declare-fun b!1345516 () Bool)

(declare-fun res!892822 () Bool)

(assert (=> b!1345516 (=> (not res!892822) (not e!765627))))

(declare-fun getCurrentListMap!5823 (array!91617 array!91619 (_ BitVec 32) (_ BitVec 32) V!54993 V!54993 (_ BitVec 32) Int) ListLongMap!21935)

(assert (=> b!1345516 (= res!892822 (contains!9088 (getCurrentListMap!5823 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1345517 () Bool)

(declare-fun res!892815 () Bool)

(assert (=> b!1345517 (=> (not res!892815) (not e!765627))))

(assert (=> b!1345517 (= res!892815 (not (= (select (arr!44265 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1345518 () Bool)

(assert (=> b!1345518 (= e!765631 (not true))))

(assert (=> b!1345518 (contains!9088 lt!595194 k0!1142)))

(declare-datatypes ((Unit!43956 0))(
  ( (Unit!43957) )
))
(declare-fun lt!595193 () Unit!43956)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!396 ((_ BitVec 64) (_ BitVec 64) V!54993 ListLongMap!21935) Unit!43956)

(assert (=> b!1345518 (= lt!595193 (lemmaInListMapAfterAddingDiffThenInBefore!396 k0!1142 (select (arr!44265 _keys!1571) from!1960) lt!595192 lt!595194))))

(declare-fun b!1345519 () Bool)

(assert (=> b!1345519 (= e!765632 tp_is_empty!37417)))

(declare-fun b!1345520 () Bool)

(declare-fun res!892812 () Bool)

(assert (=> b!1345520 (=> (not res!892812) (not e!765627))))

(assert (=> b!1345520 (= res!892812 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44817 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!57832 () Bool)

(assert (=> mapIsEmpty!57832 mapRes!57832))

(declare-fun mapNonEmpty!57832 () Bool)

(declare-fun tp!110056 () Bool)

(assert (=> mapNonEmpty!57832 (= mapRes!57832 (and tp!110056 e!765628))))

(declare-fun mapValue!57832 () ValueCell!17810)

(declare-fun mapRest!57832 () (Array (_ BitVec 32) ValueCell!17810))

(declare-fun mapKey!57832 () (_ BitVec 32))

(assert (=> mapNonEmpty!57832 (= (arr!44266 _values!1303) (store mapRest!57832 mapKey!57832 mapValue!57832))))

(declare-fun b!1345521 () Bool)

(declare-fun res!892816 () Bool)

(assert (=> b!1345521 (=> (not res!892816) (not e!765627))))

(assert (=> b!1345521 (= res!892816 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(assert (= (and start!113366 res!892817) b!1345508))

(assert (= (and b!1345508 res!892821) b!1345512))

(assert (= (and b!1345512 res!892813) b!1345513))

(assert (= (and b!1345513 res!892820) b!1345520))

(assert (= (and b!1345520 res!892812) b!1345516))

(assert (= (and b!1345516 res!892822) b!1345517))

(assert (= (and b!1345517 res!892815) b!1345510))

(assert (= (and b!1345510 res!892819) b!1345521))

(assert (= (and b!1345521 res!892816) b!1345509))

(assert (= (and b!1345509 res!892818) b!1345511))

(assert (= (and b!1345511 res!892814) b!1345518))

(assert (= (and b!1345514 condMapEmpty!57832) mapIsEmpty!57832))

(assert (= (and b!1345514 (not condMapEmpty!57832)) mapNonEmpty!57832))

(get-info :version)

(assert (= (and mapNonEmpty!57832 ((_ is ValueCellFull!17810) mapValue!57832)) b!1345515))

(assert (= (and b!1345514 ((_ is ValueCellFull!17810) mapDefault!57832)) b!1345519))

(assert (= start!113366 b!1345514))

(declare-fun b_lambda!24529 () Bool)

(assert (=> (not b_lambda!24529) (not b!1345509)))

(declare-fun t!45978 () Bool)

(declare-fun tb!12369 () Bool)

(assert (=> (and start!113366 (= defaultEntry!1306 defaultEntry!1306) t!45978) tb!12369))

(declare-fun result!25837 () Bool)

(assert (=> tb!12369 (= result!25837 tp_is_empty!37417)))

(assert (=> b!1345509 t!45978))

(declare-fun b_and!50671 () Bool)

(assert (= b_and!50669 (and (=> t!45978 result!25837) b_and!50671)))

(declare-fun m!1232431 () Bool)

(assert (=> b!1345510 m!1232431))

(assert (=> b!1345510 m!1232431))

(declare-fun m!1232433 () Bool)

(assert (=> b!1345510 m!1232433))

(assert (=> b!1345517 m!1232431))

(declare-fun m!1232435 () Bool)

(assert (=> b!1345518 m!1232435))

(assert (=> b!1345518 m!1232431))

(assert (=> b!1345518 m!1232431))

(declare-fun m!1232437 () Bool)

(assert (=> b!1345518 m!1232437))

(declare-fun m!1232439 () Bool)

(assert (=> b!1345513 m!1232439))

(declare-fun m!1232441 () Bool)

(assert (=> b!1345516 m!1232441))

(assert (=> b!1345516 m!1232441))

(declare-fun m!1232443 () Bool)

(assert (=> b!1345516 m!1232443))

(assert (=> b!1345511 m!1232431))

(declare-fun m!1232445 () Bool)

(assert (=> mapNonEmpty!57832 m!1232445))

(declare-fun m!1232447 () Bool)

(assert (=> b!1345512 m!1232447))

(declare-fun m!1232449 () Bool)

(assert (=> b!1345509 m!1232449))

(declare-fun m!1232451 () Bool)

(assert (=> b!1345509 m!1232451))

(declare-fun m!1232453 () Bool)

(assert (=> b!1345509 m!1232453))

(declare-fun m!1232455 () Bool)

(assert (=> b!1345509 m!1232455))

(assert (=> b!1345509 m!1232451))

(declare-fun m!1232457 () Bool)

(assert (=> b!1345509 m!1232457))

(assert (=> b!1345509 m!1232453))

(assert (=> b!1345509 m!1232457))

(declare-fun m!1232459 () Bool)

(assert (=> b!1345509 m!1232459))

(assert (=> b!1345509 m!1232431))

(declare-fun m!1232461 () Bool)

(assert (=> start!113366 m!1232461))

(declare-fun m!1232463 () Bool)

(assert (=> start!113366 m!1232463))

(declare-fun m!1232465 () Bool)

(assert (=> start!113366 m!1232465))

(check-sat (not mapNonEmpty!57832) (not b!1345509) (not b!1345510) (not b_lambda!24529) (not start!113366) b_and!50671 (not b!1345512) (not b_next!31417) (not b!1345516) (not b!1345518) (not b!1345513) tp_is_empty!37417)
(check-sat b_and!50671 (not b_next!31417))
