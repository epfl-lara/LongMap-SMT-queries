; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113374 () Bool)

(assert start!113374)

(declare-fun b_free!31201 () Bool)

(declare-fun b_next!31201 () Bool)

(assert (=> start!113374 (= b_free!31201 (not b_next!31201))))

(declare-fun tp!109408 () Bool)

(declare-fun b_and!50311 () Bool)

(assert (=> start!113374 (= tp!109408 b_and!50311)))

(declare-fun b!1343012 () Bool)

(declare-fun e!764827 () Bool)

(declare-fun e!764830 () Bool)

(declare-fun mapRes!57508 () Bool)

(assert (=> b!1343012 (= e!764827 (and e!764830 mapRes!57508))))

(declare-fun condMapEmpty!57508 () Bool)

(declare-datatypes ((V!54705 0))(
  ( (V!54706 (val!18675 Int)) )
))
(declare-datatypes ((ValueCell!17702 0))(
  ( (ValueCellFull!17702 (v!21318 V!54705)) (EmptyCell!17702) )
))
(declare-datatypes ((array!91371 0))(
  ( (array!91372 (arr!44137 (Array (_ BitVec 32) ValueCell!17702)) (size!44688 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91371)

(declare-fun mapDefault!57508 () ValueCell!17702)

(assert (=> b!1343012 (= condMapEmpty!57508 (= (arr!44137 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17702)) mapDefault!57508)))))

(declare-fun res!890636 () Bool)

(declare-fun e!764829 () Bool)

(assert (=> start!113374 (=> (not res!890636) (not e!764829))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113374 (= res!890636 (validMask!0 mask!1977))))

(assert (=> start!113374 e!764829))

(declare-fun tp_is_empty!37201 () Bool)

(assert (=> start!113374 tp_is_empty!37201))

(assert (=> start!113374 true))

(declare-datatypes ((array!91373 0))(
  ( (array!91374 (arr!44138 (Array (_ BitVec 32) (_ BitVec 64))) (size!44689 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91373)

(declare-fun array_inv!33541 (array!91373) Bool)

(assert (=> start!113374 (array_inv!33541 _keys!1571)))

(declare-fun array_inv!33542 (array!91371) Bool)

(assert (=> start!113374 (and (array_inv!33542 _values!1303) e!764827)))

(assert (=> start!113374 tp!109408))

(declare-fun b!1343013 () Bool)

(assert (=> b!1343013 (= e!764829 (not true))))

(declare-datatypes ((tuple2!24104 0))(
  ( (tuple2!24105 (_1!12063 (_ BitVec 64)) (_2!12063 V!54705)) )
))
(declare-datatypes ((List!31256 0))(
  ( (Nil!31253) (Cons!31252 (h!32470 tuple2!24104) (t!45660 List!31256)) )
))
(declare-datatypes ((ListLongMap!21769 0))(
  ( (ListLongMap!21770 (toList!10900 List!31256)) )
))
(declare-fun lt!594672 () ListLongMap!21769)

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun contains!9088 (ListLongMap!21769 (_ BitVec 64)) Bool)

(assert (=> b!1343013 (contains!9088 lt!594672 k0!1142)))

(declare-datatypes ((Unit!43976 0))(
  ( (Unit!43977) )
))
(declare-fun lt!594671 () Unit!43976)

(declare-fun lt!594673 () V!54705)

(declare-fun from!1960 () (_ BitVec 32))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!344 ((_ BitVec 64) (_ BitVec 64) V!54705 ListLongMap!21769) Unit!43976)

(assert (=> b!1343013 (= lt!594671 (lemmaInListMapAfterAddingDiffThenInBefore!344 k0!1142 (select (arr!44138 _keys!1571) from!1960) lt!594673 lt!594672))))

(declare-fun lt!594670 () ListLongMap!21769)

(assert (=> b!1343013 (contains!9088 lt!594670 k0!1142)))

(declare-fun lt!594674 () Unit!43976)

(declare-fun zeroValue!1245 () V!54705)

(assert (=> b!1343013 (= lt!594674 (lemmaInListMapAfterAddingDiffThenInBefore!344 k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1245 lt!594670))))

(declare-fun +!4818 (ListLongMap!21769 tuple2!24104) ListLongMap!21769)

(assert (=> b!1343013 (= lt!594670 (+!4818 lt!594672 (tuple2!24105 (select (arr!44138 _keys!1571) from!1960) lt!594673)))))

(declare-fun defaultEntry!1306 () Int)

(declare-fun get!22294 (ValueCell!17702 V!54705) V!54705)

(declare-fun dynLambda!3772 (Int (_ BitVec 64)) V!54705)

(assert (=> b!1343013 (= lt!594673 (get!22294 (select (arr!44137 _values!1303) from!1960) (dynLambda!3772 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun minValue!1245 () V!54705)

(declare-fun extraKeys!1224 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6467 (array!91373 array!91371 (_ BitVec 32) (_ BitVec 32) V!54705 V!54705 (_ BitVec 32) Int) ListLongMap!21769)

(assert (=> b!1343013 (= lt!594672 (getCurrentListMapNoExtraKeys!6467 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306))))

(declare-fun b!1343014 () Bool)

(declare-fun res!890633 () Bool)

(assert (=> b!1343014 (=> (not res!890633) (not e!764829))))

(assert (=> b!1343014 (= res!890633 (and (= (size!44688 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44689 _keys!1571) (size!44688 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun b!1343015 () Bool)

(declare-fun res!890630 () Bool)

(assert (=> b!1343015 (=> (not res!890630) (not e!764829))))

(declare-datatypes ((List!31257 0))(
  ( (Nil!31254) (Cons!31253 (h!32471 (_ BitVec 64)) (t!45661 List!31257)) )
))
(declare-fun arrayNoDuplicates!0 (array!91373 (_ BitVec 32) List!31257) Bool)

(assert (=> b!1343015 (= res!890630 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31254))))

(declare-fun mapNonEmpty!57508 () Bool)

(declare-fun tp!109407 () Bool)

(declare-fun e!764828 () Bool)

(assert (=> mapNonEmpty!57508 (= mapRes!57508 (and tp!109407 e!764828))))

(declare-fun mapRest!57508 () (Array (_ BitVec 32) ValueCell!17702))

(declare-fun mapKey!57508 () (_ BitVec 32))

(declare-fun mapValue!57508 () ValueCell!17702)

(assert (=> mapNonEmpty!57508 (= (arr!44137 _values!1303) (store mapRest!57508 mapKey!57508 mapValue!57508))))

(declare-fun b!1343016 () Bool)

(assert (=> b!1343016 (= e!764828 tp_is_empty!37201)))

(declare-fun b!1343017 () Bool)

(declare-fun res!890634 () Bool)

(assert (=> b!1343017 (=> (not res!890634) (not e!764829))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1343017 (= res!890634 (validKeyInArray!0 (select (arr!44138 _keys!1571) from!1960)))))

(declare-fun b!1343018 () Bool)

(declare-fun res!890632 () Bool)

(assert (=> b!1343018 (=> (not res!890632) (not e!764829))))

(assert (=> b!1343018 (= res!890632 (not (= (select (arr!44138 _keys!1571) from!1960) k0!1142)))))

(declare-fun b!1343019 () Bool)

(declare-fun res!890635 () Bool)

(assert (=> b!1343019 (=> (not res!890635) (not e!764829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91373 (_ BitVec 32)) Bool)

(assert (=> b!1343019 (= res!890635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun b!1343020 () Bool)

(declare-fun res!890629 () Bool)

(assert (=> b!1343020 (=> (not res!890629) (not e!764829))))

(assert (=> b!1343020 (= res!890629 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44689 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1343021 () Bool)

(assert (=> b!1343021 (= e!764830 tp_is_empty!37201)))

(declare-fun b!1343022 () Bool)

(declare-fun res!890631 () Bool)

(assert (=> b!1343022 (=> (not res!890631) (not e!764829))))

(declare-fun getCurrentListMap!5848 (array!91373 array!91371 (_ BitVec 32) (_ BitVec 32) V!54705 V!54705 (_ BitVec 32) Int) ListLongMap!21769)

(assert (=> b!1343022 (= res!890631 (contains!9088 (getCurrentListMap!5848 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1343023 () Bool)

(declare-fun res!890628 () Bool)

(assert (=> b!1343023 (=> (not res!890628) (not e!764829))))

(assert (=> b!1343023 (= res!890628 (not (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!57508 () Bool)

(assert (=> mapIsEmpty!57508 mapRes!57508))

(assert (= (and start!113374 res!890636) b!1343014))

(assert (= (and b!1343014 res!890633) b!1343019))

(assert (= (and b!1343019 res!890635) b!1343015))

(assert (= (and b!1343015 res!890630) b!1343020))

(assert (= (and b!1343020 res!890629) b!1343022))

(assert (= (and b!1343022 res!890631) b!1343018))

(assert (= (and b!1343018 res!890632) b!1343017))

(assert (= (and b!1343017 res!890634) b!1343023))

(assert (= (and b!1343023 res!890628) b!1343013))

(assert (= (and b!1343012 condMapEmpty!57508) mapIsEmpty!57508))

(assert (= (and b!1343012 (not condMapEmpty!57508)) mapNonEmpty!57508))

(get-info :version)

(assert (= (and mapNonEmpty!57508 ((_ is ValueCellFull!17702) mapValue!57508)) b!1343016))

(assert (= (and b!1343012 ((_ is ValueCellFull!17702) mapDefault!57508)) b!1343021))

(assert (= start!113374 b!1343012))

(declare-fun b_lambda!24371 () Bool)

(assert (=> (not b_lambda!24371) (not b!1343013)))

(declare-fun t!45659 () Bool)

(declare-fun tb!12207 () Bool)

(assert (=> (and start!113374 (= defaultEntry!1306 defaultEntry!1306) t!45659) tb!12207))

(declare-fun result!25513 () Bool)

(assert (=> tb!12207 (= result!25513 tp_is_empty!37201)))

(assert (=> b!1343013 t!45659))

(declare-fun b_and!50313 () Bool)

(assert (= b_and!50311 (and (=> t!45659 result!25513) b_and!50313)))

(declare-fun m!1230933 () Bool)

(assert (=> b!1343018 m!1230933))

(assert (=> b!1343017 m!1230933))

(assert (=> b!1343017 m!1230933))

(declare-fun m!1230935 () Bool)

(assert (=> b!1343017 m!1230935))

(declare-fun m!1230937 () Bool)

(assert (=> b!1343013 m!1230937))

(declare-fun m!1230939 () Bool)

(assert (=> b!1343013 m!1230939))

(declare-fun m!1230941 () Bool)

(assert (=> b!1343013 m!1230941))

(declare-fun m!1230943 () Bool)

(assert (=> b!1343013 m!1230943))

(declare-fun m!1230945 () Bool)

(assert (=> b!1343013 m!1230945))

(assert (=> b!1343013 m!1230941))

(assert (=> b!1343013 m!1230943))

(assert (=> b!1343013 m!1230933))

(assert (=> b!1343013 m!1230933))

(declare-fun m!1230947 () Bool)

(assert (=> b!1343013 m!1230947))

(declare-fun m!1230949 () Bool)

(assert (=> b!1343013 m!1230949))

(declare-fun m!1230951 () Bool)

(assert (=> b!1343013 m!1230951))

(declare-fun m!1230953 () Bool)

(assert (=> b!1343013 m!1230953))

(declare-fun m!1230955 () Bool)

(assert (=> b!1343022 m!1230955))

(assert (=> b!1343022 m!1230955))

(declare-fun m!1230957 () Bool)

(assert (=> b!1343022 m!1230957))

(declare-fun m!1230959 () Bool)

(assert (=> b!1343015 m!1230959))

(declare-fun m!1230961 () Bool)

(assert (=> b!1343019 m!1230961))

(declare-fun m!1230963 () Bool)

(assert (=> start!113374 m!1230963))

(declare-fun m!1230965 () Bool)

(assert (=> start!113374 m!1230965))

(declare-fun m!1230967 () Bool)

(assert (=> start!113374 m!1230967))

(declare-fun m!1230969 () Bool)

(assert (=> mapNonEmpty!57508 m!1230969))

(check-sat (not b_lambda!24371) (not b!1343019) (not start!113374) (not b!1343013) (not b!1343022) (not mapNonEmpty!57508) tp_is_empty!37201 (not b!1343017) (not b!1343015) b_and!50313 (not b_next!31201))
(check-sat b_and!50313 (not b_next!31201))
