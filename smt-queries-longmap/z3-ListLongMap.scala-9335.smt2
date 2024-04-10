; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111448 () Bool)

(assert start!111448)

(declare-fun b_free!30105 () Bool)

(declare-fun b_next!30105 () Bool)

(assert (=> start!111448 (= b_free!30105 (not b_next!30105))))

(declare-fun tp!105791 () Bool)

(declare-fun b_and!48369 () Bool)

(assert (=> start!111448 (= tp!105791 b_and!48369)))

(declare-fun b!1319055 () Bool)

(declare-fun res!875438 () Bool)

(declare-fun e!752626 () Bool)

(assert (=> b!1319055 (=> (not res!875438) (not e!752626))))

(declare-datatypes ((array!88788 0))(
  ( (array!88789 (arr!42868 (Array (_ BitVec 32) (_ BitVec 64))) (size!43418 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88788)

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun k0!1164 () (_ BitVec 64))

(assert (=> b!1319055 (= res!875438 (not (= (select (arr!42868 _keys!1609) from!2000) k0!1164)))))

(declare-fun mapIsEmpty!55535 () Bool)

(declare-fun mapRes!55535 () Bool)

(assert (=> mapIsEmpty!55535 mapRes!55535))

(declare-fun b!1319056 () Bool)

(declare-fun res!875439 () Bool)

(assert (=> b!1319056 (=> (not res!875439) (not e!752626))))

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53003 0))(
  ( (V!53004 (val!18037 Int)) )
))
(declare-fun zeroValue!1279 () V!53003)

(declare-datatypes ((ValueCell!17064 0))(
  ( (ValueCellFull!17064 (v!20667 V!53003)) (EmptyCell!17064) )
))
(declare-datatypes ((array!88790 0))(
  ( (array!88791 (arr!42869 (Array (_ BitVec 32) ValueCell!17064)) (size!43419 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88790)

(declare-fun minValue!1279 () V!53003)

(declare-fun defaultEntry!1340 () Int)

(declare-fun mask!2019 () (_ BitVec 32))

(declare-datatypes ((tuple2!23208 0))(
  ( (tuple2!23209 (_1!11615 (_ BitVec 64)) (_2!11615 V!53003)) )
))
(declare-datatypes ((List!30363 0))(
  ( (Nil!30360) (Cons!30359 (h!31568 tuple2!23208) (t!44017 List!30363)) )
))
(declare-datatypes ((ListLongMap!20865 0))(
  ( (ListLongMap!20866 (toList!10448 List!30363)) )
))
(declare-fun contains!8603 (ListLongMap!20865 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5460 (array!88788 array!88790 (_ BitVec 32) (_ BitVec 32) V!53003 V!53003 (_ BitVec 32) Int) ListLongMap!20865)

(assert (=> b!1319056 (= res!875439 (contains!8603 (getCurrentListMap!5460 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319057 () Bool)

(declare-fun e!752629 () Bool)

(declare-fun tp_is_empty!35925 () Bool)

(assert (=> b!1319057 (= e!752629 tp_is_empty!35925)))

(declare-fun b!1319058 () Bool)

(declare-fun res!875441 () Bool)

(assert (=> b!1319058 (=> (not res!875441) (not e!752626))))

(assert (=> b!1319058 (= res!875441 (and (= (size!43419 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43418 _keys!1609) (size!43419 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319059 () Bool)

(assert (=> b!1319059 (= e!752626 (not true))))

(declare-fun lt!586575 () ListLongMap!20865)

(assert (=> b!1319059 (contains!8603 lt!586575 k0!1164)))

(declare-datatypes ((Unit!43438 0))(
  ( (Unit!43439) )
))
(declare-fun lt!586574 () Unit!43438)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!105 ((_ BitVec 64) (_ BitVec 64) V!53003 ListLongMap!20865) Unit!43438)

(assert (=> b!1319059 (= lt!586574 (lemmaInListMapAfterAddingDiffThenInBefore!105 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586575))))

(declare-fun +!4509 (ListLongMap!20865 tuple2!23208) ListLongMap!20865)

(declare-fun getCurrentListMapNoExtraKeys!6144 (array!88788 array!88790 (_ BitVec 32) (_ BitVec 32) V!53003 V!53003 (_ BitVec 32) Int) ListLongMap!20865)

(declare-fun get!21535 (ValueCell!17064 V!53003) V!53003)

(declare-fun dynLambda!3448 (Int (_ BitVec 64)) V!53003)

(assert (=> b!1319059 (= lt!586575 (+!4509 (+!4509 (getCurrentListMapNoExtraKeys!6144 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23209 (select (arr!42868 _keys!1609) from!2000) (get!21535 (select (arr!42869 _values!1337) from!2000) (dynLambda!3448 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))) (tuple2!23209 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun mapNonEmpty!55535 () Bool)

(declare-fun tp!105790 () Bool)

(declare-fun e!752625 () Bool)

(assert (=> mapNonEmpty!55535 (= mapRes!55535 (and tp!105790 e!752625))))

(declare-fun mapValue!55535 () ValueCell!17064)

(declare-fun mapKey!55535 () (_ BitVec 32))

(declare-fun mapRest!55535 () (Array (_ BitVec 32) ValueCell!17064))

(assert (=> mapNonEmpty!55535 (= (arr!42869 _values!1337) (store mapRest!55535 mapKey!55535 mapValue!55535))))

(declare-fun res!875442 () Bool)

(assert (=> start!111448 (=> (not res!875442) (not e!752626))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111448 (= res!875442 (validMask!0 mask!2019))))

(assert (=> start!111448 e!752626))

(declare-fun array_inv!32365 (array!88788) Bool)

(assert (=> start!111448 (array_inv!32365 _keys!1609)))

(assert (=> start!111448 true))

(assert (=> start!111448 tp_is_empty!35925))

(declare-fun e!752627 () Bool)

(declare-fun array_inv!32366 (array!88790) Bool)

(assert (=> start!111448 (and (array_inv!32366 _values!1337) e!752627)))

(assert (=> start!111448 tp!105791))

(declare-fun b!1319060 () Bool)

(declare-fun res!875437 () Bool)

(assert (=> b!1319060 (=> (not res!875437) (not e!752626))))

(declare-datatypes ((List!30364 0))(
  ( (Nil!30361) (Cons!30360 (h!31569 (_ BitVec 64)) (t!44018 List!30364)) )
))
(declare-fun arrayNoDuplicates!0 (array!88788 (_ BitVec 32) List!30364) Bool)

(assert (=> b!1319060 (= res!875437 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30361))))

(declare-fun b!1319061 () Bool)

(assert (=> b!1319061 (= e!752625 tp_is_empty!35925)))

(declare-fun b!1319062 () Bool)

(declare-fun res!875444 () Bool)

(assert (=> b!1319062 (=> (not res!875444) (not e!752626))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88788 (_ BitVec 32)) Bool)

(assert (=> b!1319062 (= res!875444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319063 () Bool)

(declare-fun res!875440 () Bool)

(assert (=> b!1319063 (=> (not res!875440) (not e!752626))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319063 (= res!875440 (validKeyInArray!0 (select (arr!42868 _keys!1609) from!2000)))))

(declare-fun b!1319064 () Bool)

(assert (=> b!1319064 (= e!752627 (and e!752629 mapRes!55535))))

(declare-fun condMapEmpty!55535 () Bool)

(declare-fun mapDefault!55535 () ValueCell!17064)

(assert (=> b!1319064 (= condMapEmpty!55535 (= (arr!42869 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17064)) mapDefault!55535)))))

(declare-fun b!1319065 () Bool)

(declare-fun res!875443 () Bool)

(assert (=> b!1319065 (=> (not res!875443) (not e!752626))))

(assert (=> b!1319065 (= res!875443 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43418 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and start!111448 res!875442) b!1319058))

(assert (= (and b!1319058 res!875441) b!1319062))

(assert (= (and b!1319062 res!875444) b!1319060))

(assert (= (and b!1319060 res!875437) b!1319065))

(assert (= (and b!1319065 res!875443) b!1319056))

(assert (= (and b!1319056 res!875439) b!1319055))

(assert (= (and b!1319055 res!875438) b!1319063))

(assert (= (and b!1319063 res!875440) b!1319059))

(assert (= (and b!1319064 condMapEmpty!55535) mapIsEmpty!55535))

(assert (= (and b!1319064 (not condMapEmpty!55535)) mapNonEmpty!55535))

(get-info :version)

(assert (= (and mapNonEmpty!55535 ((_ is ValueCellFull!17064) mapValue!55535)) b!1319061))

(assert (= (and b!1319064 ((_ is ValueCellFull!17064) mapDefault!55535)) b!1319057))

(assert (= start!111448 b!1319064))

(declare-fun b_lambda!23431 () Bool)

(assert (=> (not b_lambda!23431) (not b!1319059)))

(declare-fun t!44016 () Bool)

(declare-fun tb!11457 () Bool)

(assert (=> (and start!111448 (= defaultEntry!1340 defaultEntry!1340) t!44016) tb!11457))

(declare-fun result!23969 () Bool)

(assert (=> tb!11457 (= result!23969 tp_is_empty!35925)))

(assert (=> b!1319059 t!44016))

(declare-fun b_and!48371 () Bool)

(assert (= b_and!48369 (and (=> t!44016 result!23969) b_and!48371)))

(declare-fun m!1206639 () Bool)

(assert (=> start!111448 m!1206639))

(declare-fun m!1206641 () Bool)

(assert (=> start!111448 m!1206641))

(declare-fun m!1206643 () Bool)

(assert (=> start!111448 m!1206643))

(declare-fun m!1206645 () Bool)

(assert (=> b!1319063 m!1206645))

(assert (=> b!1319063 m!1206645))

(declare-fun m!1206647 () Bool)

(assert (=> b!1319063 m!1206647))

(declare-fun m!1206649 () Bool)

(assert (=> b!1319059 m!1206649))

(declare-fun m!1206651 () Bool)

(assert (=> b!1319059 m!1206651))

(declare-fun m!1206653 () Bool)

(assert (=> b!1319059 m!1206653))

(assert (=> b!1319059 m!1206649))

(declare-fun m!1206655 () Bool)

(assert (=> b!1319059 m!1206655))

(declare-fun m!1206657 () Bool)

(assert (=> b!1319059 m!1206657))

(assert (=> b!1319059 m!1206655))

(declare-fun m!1206659 () Bool)

(assert (=> b!1319059 m!1206659))

(declare-fun m!1206661 () Bool)

(assert (=> b!1319059 m!1206661))

(assert (=> b!1319059 m!1206657))

(assert (=> b!1319059 m!1206653))

(declare-fun m!1206663 () Bool)

(assert (=> b!1319059 m!1206663))

(assert (=> b!1319059 m!1206645))

(declare-fun m!1206665 () Bool)

(assert (=> b!1319060 m!1206665))

(declare-fun m!1206667 () Bool)

(assert (=> mapNonEmpty!55535 m!1206667))

(declare-fun m!1206669 () Bool)

(assert (=> b!1319062 m!1206669))

(assert (=> b!1319055 m!1206645))

(declare-fun m!1206671 () Bool)

(assert (=> b!1319056 m!1206671))

(assert (=> b!1319056 m!1206671))

(declare-fun m!1206673 () Bool)

(assert (=> b!1319056 m!1206673))

(check-sat (not b_next!30105) (not mapNonEmpty!55535) (not b!1319063) (not b!1319059) (not b_lambda!23431) tp_is_empty!35925 (not start!111448) (not b!1319062) (not b!1319056) b_and!48371 (not b!1319060))
(check-sat b_and!48371 (not b_next!30105))
