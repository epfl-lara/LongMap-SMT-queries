; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111482 () Bool)

(assert start!111482)

(declare-fun b_free!30139 () Bool)

(declare-fun b_next!30139 () Bool)

(assert (=> start!111482 (= b_free!30139 (not b_next!30139))))

(declare-fun tp!105893 () Bool)

(declare-fun b_and!48419 () Bool)

(assert (=> start!111482 (= tp!105893 b_and!48419)))

(declare-fun b!1319580 () Bool)

(declare-fun res!875819 () Bool)

(declare-fun e!752849 () Bool)

(assert (=> b!1319580 (=> (not res!875819) (not e!752849))))

(declare-datatypes ((array!88783 0))(
  ( (array!88784 (arr!42866 (Array (_ BitVec 32) (_ BitVec 64))) (size!43418 (_ BitVec 32))) )
))
(declare-fun _keys!1609 () array!88783)

(declare-fun extraKeys!1258 () (_ BitVec 32))

(declare-datatypes ((V!53049 0))(
  ( (V!53050 (val!18054 Int)) )
))
(declare-datatypes ((ValueCell!17081 0))(
  ( (ValueCellFull!17081 (v!20683 V!53049)) (EmptyCell!17081) )
))
(declare-datatypes ((array!88785 0))(
  ( (array!88786 (arr!42867 (Array (_ BitVec 32) ValueCell!17081)) (size!43419 (_ BitVec 32))) )
))
(declare-fun _values!1337 () array!88785)

(declare-fun mask!2019 () (_ BitVec 32))

(assert (=> b!1319580 (= res!875819 (and (= (size!43419 _values!1337) (bvadd #b00000000000000000000000000000001 mask!2019)) (= (size!43418 _keys!1609) (size!43419 _values!1337)) (bvsge mask!2019 #b00000000000000000000000000000000) (bvsge extraKeys!1258 #b00000000000000000000000000000000) (bvsle extraKeys!1258 #b00000000000000000000000000000011)))))

(declare-fun b!1319581 () Bool)

(assert (=> b!1319581 (= e!752849 (not true))))

(declare-datatypes ((tuple2!23326 0))(
  ( (tuple2!23327 (_1!11674 (_ BitVec 64)) (_2!11674 V!53049)) )
))
(declare-datatypes ((List!30465 0))(
  ( (Nil!30462) (Cons!30461 (h!31670 tuple2!23326) (t!44145 List!30465)) )
))
(declare-datatypes ((ListLongMap!20983 0))(
  ( (ListLongMap!20984 (toList!10507 List!30465)) )
))
(declare-fun lt!586496 () ListLongMap!20983)

(declare-fun k0!1164 () (_ BitVec 64))

(declare-fun contains!8590 (ListLongMap!20983 (_ BitVec 64)) Bool)

(assert (=> b!1319581 (contains!8590 lt!586496 k0!1164)))

(declare-fun zeroValue!1279 () V!53049)

(declare-datatypes ((Unit!43291 0))(
  ( (Unit!43292) )
))
(declare-fun lt!586495 () Unit!43291)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!119 ((_ BitVec 64) (_ BitVec 64) V!53049 ListLongMap!20983) Unit!43291)

(assert (=> b!1319581 (= lt!586495 (lemmaInListMapAfterAddingDiffThenInBefore!119 k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279 lt!586496))))

(declare-fun lt!586494 () ListLongMap!20983)

(assert (=> b!1319581 (contains!8590 lt!586494 k0!1164)))

(declare-fun lt!586497 () Unit!43291)

(declare-fun minValue!1279 () V!53049)

(assert (=> b!1319581 (= lt!586497 (lemmaInListMapAfterAddingDiffThenInBefore!119 k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1279 lt!586494))))

(declare-fun +!4554 (ListLongMap!20983 tuple2!23326) ListLongMap!20983)

(assert (=> b!1319581 (= lt!586494 (+!4554 lt!586496 (tuple2!23327 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1279)))))

(declare-fun from!2000 () (_ BitVec 32))

(declare-fun defaultEntry!1340 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6187 (array!88783 array!88785 (_ BitVec 32) (_ BitVec 32) V!53049 V!53049 (_ BitVec 32) Int) ListLongMap!20983)

(declare-fun get!21559 (ValueCell!17081 V!53049) V!53049)

(declare-fun dynLambda!3484 (Int (_ BitVec 64)) V!53049)

(assert (=> b!1319581 (= lt!586496 (+!4554 (getCurrentListMapNoExtraKeys!6187 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 (bvadd #b00000000000000000000000000000001 from!2000) defaultEntry!1340) (tuple2!23327 (select (arr!42866 _keys!1609) from!2000) (get!21559 (select (arr!42867 _values!1337) from!2000) (dynLambda!3484 defaultEntry!1340 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!1319582 () Bool)

(declare-fun e!752851 () Bool)

(declare-fun e!752847 () Bool)

(declare-fun mapRes!55586 () Bool)

(assert (=> b!1319582 (= e!752851 (and e!752847 mapRes!55586))))

(declare-fun condMapEmpty!55586 () Bool)

(declare-fun mapDefault!55586 () ValueCell!17081)

(assert (=> b!1319582 (= condMapEmpty!55586 (= (arr!42867 _values!1337) ((as const (Array (_ BitVec 32) ValueCell!17081)) mapDefault!55586)))))

(declare-fun res!875822 () Bool)

(assert (=> start!111482 (=> (not res!875822) (not e!752849))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111482 (= res!875822 (validMask!0 mask!2019))))

(assert (=> start!111482 e!752849))

(declare-fun array_inv!32555 (array!88783) Bool)

(assert (=> start!111482 (array_inv!32555 _keys!1609)))

(assert (=> start!111482 true))

(declare-fun tp_is_empty!35959 () Bool)

(assert (=> start!111482 tp_is_empty!35959))

(declare-fun array_inv!32556 (array!88785) Bool)

(assert (=> start!111482 (and (array_inv!32556 _values!1337) e!752851)))

(assert (=> start!111482 tp!105893))

(declare-fun mapNonEmpty!55586 () Bool)

(declare-fun tp!105894 () Bool)

(declare-fun e!752848 () Bool)

(assert (=> mapNonEmpty!55586 (= mapRes!55586 (and tp!105894 e!752848))))

(declare-fun mapRest!55586 () (Array (_ BitVec 32) ValueCell!17081))

(declare-fun mapValue!55586 () ValueCell!17081)

(declare-fun mapKey!55586 () (_ BitVec 32))

(assert (=> mapNonEmpty!55586 (= (arr!42867 _values!1337) (store mapRest!55586 mapKey!55586 mapValue!55586))))

(declare-fun b!1319583 () Bool)

(declare-fun res!875817 () Bool)

(assert (=> b!1319583 (=> (not res!875817) (not e!752849))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!88783 (_ BitVec 32)) Bool)

(assert (=> b!1319583 (= res!875817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1609 mask!2019))))

(declare-fun b!1319584 () Bool)

(assert (=> b!1319584 (= e!752847 tp_is_empty!35959)))

(declare-fun b!1319585 () Bool)

(declare-fun res!875823 () Bool)

(assert (=> b!1319585 (=> (not res!875823) (not e!752849))))

(declare-fun getCurrentListMap!5398 (array!88783 array!88785 (_ BitVec 32) (_ BitVec 32) V!53049 V!53049 (_ BitVec 32) Int) ListLongMap!20983)

(assert (=> b!1319585 (= res!875823 (contains!8590 (getCurrentListMap!5398 _keys!1609 _values!1337 mask!2019 extraKeys!1258 zeroValue!1279 minValue!1279 from!2000 defaultEntry!1340) k0!1164))))

(declare-fun b!1319586 () Bool)

(assert (=> b!1319586 (= e!752848 tp_is_empty!35959)))

(declare-fun b!1319587 () Bool)

(declare-fun res!875818 () Bool)

(assert (=> b!1319587 (=> (not res!875818) (not e!752849))))

(declare-datatypes ((List!30466 0))(
  ( (Nil!30463) (Cons!30462 (h!31671 (_ BitVec 64)) (t!44146 List!30466)) )
))
(declare-fun arrayNoDuplicates!0 (array!88783 (_ BitVec 32) List!30466) Bool)

(assert (=> b!1319587 (= res!875818 (arrayNoDuplicates!0 _keys!1609 #b00000000000000000000000000000000 Nil!30463))))

(declare-fun mapIsEmpty!55586 () Bool)

(assert (=> mapIsEmpty!55586 mapRes!55586))

(declare-fun b!1319588 () Bool)

(declare-fun res!875820 () Bool)

(assert (=> b!1319588 (=> (not res!875820) (not e!752849))))

(assert (=> b!1319588 (= res!875820 (not (= (select (arr!42866 _keys!1609) from!2000) k0!1164)))))

(declare-fun b!1319589 () Bool)

(declare-fun res!875816 () Bool)

(assert (=> b!1319589 (=> (not res!875816) (not e!752849))))

(assert (=> b!1319589 (= res!875816 (and (not (= (bvand extraKeys!1258 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1258 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (bvsge from!2000 #b00000000000000000000000000000000) (bvslt from!2000 (size!43418 _keys!1609)) (not (= k0!1164 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1164 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1319590 () Bool)

(declare-fun res!875821 () Bool)

(assert (=> b!1319590 (=> (not res!875821) (not e!752849))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1319590 (= res!875821 (validKeyInArray!0 (select (arr!42866 _keys!1609) from!2000)))))

(assert (= (and start!111482 res!875822) b!1319580))

(assert (= (and b!1319580 res!875819) b!1319583))

(assert (= (and b!1319583 res!875817) b!1319587))

(assert (= (and b!1319587 res!875818) b!1319589))

(assert (= (and b!1319589 res!875816) b!1319585))

(assert (= (and b!1319585 res!875823) b!1319588))

(assert (= (and b!1319588 res!875820) b!1319590))

(assert (= (and b!1319590 res!875821) b!1319581))

(assert (= (and b!1319582 condMapEmpty!55586) mapIsEmpty!55586))

(assert (= (and b!1319582 (not condMapEmpty!55586)) mapNonEmpty!55586))

(get-info :version)

(assert (= (and mapNonEmpty!55586 ((_ is ValueCellFull!17081) mapValue!55586)) b!1319586))

(assert (= (and b!1319582 ((_ is ValueCellFull!17081) mapDefault!55586)) b!1319584))

(assert (= start!111482 b!1319582))

(declare-fun b_lambda!23455 () Bool)

(assert (=> (not b_lambda!23455) (not b!1319581)))

(declare-fun t!44144 () Bool)

(declare-fun tb!11483 () Bool)

(assert (=> (and start!111482 (= defaultEntry!1340 defaultEntry!1340) t!44144) tb!11483))

(declare-fun result!24029 () Bool)

(assert (=> tb!11483 (= result!24029 tp_is_empty!35959)))

(assert (=> b!1319581 t!44144))

(declare-fun b_and!48421 () Bool)

(assert (= b_and!48419 (and (=> t!44144 result!24029) b_and!48421)))

(declare-fun m!1206735 () Bool)

(assert (=> mapNonEmpty!55586 m!1206735))

(declare-fun m!1206737 () Bool)

(assert (=> b!1319588 m!1206737))

(declare-fun m!1206739 () Bool)

(assert (=> b!1319581 m!1206739))

(declare-fun m!1206741 () Bool)

(assert (=> b!1319581 m!1206741))

(declare-fun m!1206743 () Bool)

(assert (=> b!1319581 m!1206743))

(declare-fun m!1206745 () Bool)

(assert (=> b!1319581 m!1206745))

(assert (=> b!1319581 m!1206739))

(declare-fun m!1206747 () Bool)

(assert (=> b!1319581 m!1206747))

(declare-fun m!1206749 () Bool)

(assert (=> b!1319581 m!1206749))

(declare-fun m!1206751 () Bool)

(assert (=> b!1319581 m!1206751))

(assert (=> b!1319581 m!1206749))

(assert (=> b!1319581 m!1206745))

(declare-fun m!1206753 () Bool)

(assert (=> b!1319581 m!1206753))

(assert (=> b!1319581 m!1206737))

(declare-fun m!1206755 () Bool)

(assert (=> b!1319581 m!1206755))

(declare-fun m!1206757 () Bool)

(assert (=> b!1319581 m!1206757))

(declare-fun m!1206759 () Bool)

(assert (=> start!111482 m!1206759))

(declare-fun m!1206761 () Bool)

(assert (=> start!111482 m!1206761))

(declare-fun m!1206763 () Bool)

(assert (=> start!111482 m!1206763))

(declare-fun m!1206765 () Bool)

(assert (=> b!1319585 m!1206765))

(assert (=> b!1319585 m!1206765))

(declare-fun m!1206767 () Bool)

(assert (=> b!1319585 m!1206767))

(assert (=> b!1319590 m!1206737))

(assert (=> b!1319590 m!1206737))

(declare-fun m!1206769 () Bool)

(assert (=> b!1319590 m!1206769))

(declare-fun m!1206771 () Bool)

(assert (=> b!1319587 m!1206771))

(declare-fun m!1206773 () Bool)

(assert (=> b!1319583 m!1206773))

(check-sat (not b!1319590) (not b!1319585) tp_is_empty!35959 b_and!48421 (not b!1319587) (not start!111482) (not b!1319583) (not b_lambda!23455) (not b_next!30139) (not b!1319581) (not mapNonEmpty!55586))
(check-sat b_and!48421 (not b_next!30139))
