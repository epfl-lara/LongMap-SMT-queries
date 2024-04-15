; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!113670 () Bool)

(assert start!113670)

(declare-fun b_free!31579 () Bool)

(declare-fun b_next!31579 () Bool)

(assert (=> start!113670 (= b_free!31579 (not b_next!31579))))

(declare-fun tp!110553 () Bool)

(declare-fun b_and!50939 () Bool)

(assert (=> start!113670 (= tp!110553 b_and!50939)))

(declare-fun b!1349066 () Bool)

(declare-fun res!895036 () Bool)

(declare-fun e!767460 () Bool)

(assert (=> b!1349066 (=> (not res!895036) (not e!767460))))

(declare-datatypes ((array!91937 0))(
  ( (array!91938 (arr!44422 (Array (_ BitVec 32) (_ BitVec 64))) (size!44974 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!91937)

(declare-datatypes ((List!31531 0))(
  ( (Nil!31528) (Cons!31527 (h!32736 (_ BitVec 64)) (t!46169 List!31531)) )
))
(declare-fun arrayNoDuplicates!0 (array!91937 (_ BitVec 32) List!31531) Bool)

(assert (=> b!1349066 (= res!895036 (arrayNoDuplicates!0 _keys!1571 #b00000000000000000000000000000000 Nil!31528))))

(declare-fun b!1349067 () Bool)

(declare-fun res!895035 () Bool)

(assert (=> b!1349067 (=> (not res!895035) (not e!767460))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!91937 (_ BitVec 32)) Bool)

(assert (=> b!1349067 (= res!895035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!58086 () Bool)

(declare-fun mapRes!58086 () Bool)

(assert (=> mapIsEmpty!58086 mapRes!58086))

(declare-fun b!1349068 () Bool)

(declare-fun res!895032 () Bool)

(assert (=> b!1349068 (=> (not res!895032) (not e!767460))))

(declare-fun k0!1142 () (_ BitVec 64))

(declare-fun from!1960 () (_ BitVec 32))

(assert (=> b!1349068 (= res!895032 (not (= (select (arr!44422 _keys!1571) from!1960) k0!1142)))))

(declare-fun res!895031 () Bool)

(assert (=> start!113670 (=> (not res!895031) (not e!767460))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!113670 (= res!895031 (validMask!0 mask!1977))))

(assert (=> start!113670 e!767460))

(declare-fun tp_is_empty!37579 () Bool)

(assert (=> start!113670 tp_is_empty!37579))

(assert (=> start!113670 true))

(declare-fun array_inv!33659 (array!91937) Bool)

(assert (=> start!113670 (array_inv!33659 _keys!1571)))

(declare-datatypes ((V!55209 0))(
  ( (V!55210 (val!18864 Int)) )
))
(declare-datatypes ((ValueCell!17891 0))(
  ( (ValueCellFull!17891 (v!21518 V!55209)) (EmptyCell!17891) )
))
(declare-datatypes ((array!91939 0))(
  ( (array!91940 (arr!44423 (Array (_ BitVec 32) ValueCell!17891)) (size!44975 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!91939)

(declare-fun e!767463 () Bool)

(declare-fun array_inv!33660 (array!91939) Bool)

(assert (=> start!113670 (and (array_inv!33660 _values!1303) e!767463)))

(assert (=> start!113670 tp!110553))

(declare-fun b!1349069 () Bool)

(declare-fun e!767462 () Bool)

(assert (=> b!1349069 (= e!767463 (and e!767462 mapRes!58086))))

(declare-fun condMapEmpty!58086 () Bool)

(declare-fun mapDefault!58086 () ValueCell!17891)

(assert (=> b!1349069 (= condMapEmpty!58086 (= (arr!44423 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17891)) mapDefault!58086)))))

(declare-fun b!1349070 () Bool)

(declare-fun res!895030 () Bool)

(assert (=> b!1349070 (=> (not res!895030) (not e!767460))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1349070 (= res!895030 (and (= (bvand extraKeys!1224 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsge from!1960 #b00000000000000000000000000000000) (bvslt from!1960 (size!44974 _keys!1571)) (not (= k0!1142 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1142 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1349071 () Bool)

(declare-fun res!895028 () Bool)

(assert (=> b!1349071 (=> (not res!895028) (not e!767460))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1349071 (= res!895028 (validKeyInArray!0 (select (arr!44422 _keys!1571) from!1960)))))

(declare-fun b!1349072 () Bool)

(declare-fun res!895037 () Bool)

(assert (=> b!1349072 (=> (not res!895037) (not e!767460))))

(assert (=> b!1349072 (= res!895037 (= (bvand extraKeys!1224 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun b!1349073 () Bool)

(declare-fun res!895029 () Bool)

(assert (=> b!1349073 (=> (not res!895029) (not e!767460))))

(declare-fun minValue!1245 () V!55209)

(declare-fun zeroValue!1245 () V!55209)

(declare-fun defaultEntry!1306 () Int)

(declare-datatypes ((tuple2!24398 0))(
  ( (tuple2!24399 (_1!12210 (_ BitVec 64)) (_2!12210 V!55209)) )
))
(declare-datatypes ((List!31532 0))(
  ( (Nil!31529) (Cons!31528 (h!32737 tuple2!24398) (t!46170 List!31532)) )
))
(declare-datatypes ((ListLongMap!22055 0))(
  ( (ListLongMap!22056 (toList!11043 List!31532)) )
))
(declare-fun contains!9152 (ListLongMap!22055 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5875 (array!91937 array!91939 (_ BitVec 32) (_ BitVec 32) V!55209 V!55209 (_ BitVec 32) Int) ListLongMap!22055)

(assert (=> b!1349073 (= res!895029 (contains!9152 (getCurrentListMap!5875 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 from!1960 defaultEntry!1306) k0!1142))))

(declare-fun b!1349074 () Bool)

(assert (=> b!1349074 (= e!767462 tp_is_empty!37579)))

(declare-fun b!1349075 () Bool)

(declare-fun e!767461 () Bool)

(assert (=> b!1349075 (= e!767461 tp_is_empty!37579)))

(declare-fun b!1349076 () Bool)

(assert (=> b!1349076 (= e!767460 (= k0!1142 (select (arr!44422 _keys!1571) from!1960)))))

(declare-fun mapNonEmpty!58086 () Bool)

(declare-fun tp!110554 () Bool)

(assert (=> mapNonEmpty!58086 (= mapRes!58086 (and tp!110554 e!767461))))

(declare-fun mapRest!58086 () (Array (_ BitVec 32) ValueCell!17891))

(declare-fun mapValue!58086 () ValueCell!17891)

(declare-fun mapKey!58086 () (_ BitVec 32))

(assert (=> mapNonEmpty!58086 (= (arr!44423 _values!1303) (store mapRest!58086 mapKey!58086 mapValue!58086))))

(declare-fun b!1349077 () Bool)

(declare-fun res!895033 () Bool)

(assert (=> b!1349077 (=> (not res!895033) (not e!767460))))

(declare-fun +!4885 (ListLongMap!22055 tuple2!24398) ListLongMap!22055)

(declare-fun getCurrentListMapNoExtraKeys!6533 (array!91937 array!91939 (_ BitVec 32) (_ BitVec 32) V!55209 V!55209 (_ BitVec 32) Int) ListLongMap!22055)

(declare-fun get!22459 (ValueCell!17891 V!55209) V!55209)

(declare-fun dynLambda!3815 (Int (_ BitVec 64)) V!55209)

(assert (=> b!1349077 (= res!895033 (contains!9152 (+!4885 (getCurrentListMapNoExtraKeys!6533 _keys!1571 _values!1303 mask!1977 extraKeys!1224 zeroValue!1245 minValue!1245 (bvadd #b00000000000000000000000000000001 from!1960) defaultEntry!1306) (tuple2!24399 (select (arr!44422 _keys!1571) from!1960) (get!22459 (select (arr!44423 _values!1303) from!1960) (dynLambda!3815 defaultEntry!1306 #b0000000000000000000000000000000000000000000000000000000000000000)))) k0!1142))))

(declare-fun b!1349078 () Bool)

(declare-fun res!895034 () Bool)

(assert (=> b!1349078 (=> (not res!895034) (not e!767460))))

(assert (=> b!1349078 (= res!895034 (and (= (size!44975 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44974 _keys!1571) (size!44975 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(assert (= (and start!113670 res!895031) b!1349078))

(assert (= (and b!1349078 res!895034) b!1349067))

(assert (= (and b!1349067 res!895035) b!1349066))

(assert (= (and b!1349066 res!895036) b!1349070))

(assert (= (and b!1349070 res!895030) b!1349073))

(assert (= (and b!1349073 res!895029) b!1349068))

(assert (= (and b!1349068 res!895032) b!1349071))

(assert (= (and b!1349071 res!895028) b!1349072))

(assert (= (and b!1349072 res!895037) b!1349077))

(assert (= (and b!1349077 res!895033) b!1349076))

(assert (= (and b!1349069 condMapEmpty!58086) mapIsEmpty!58086))

(assert (= (and b!1349069 (not condMapEmpty!58086)) mapNonEmpty!58086))

(get-info :version)

(assert (= (and mapNonEmpty!58086 ((_ is ValueCellFull!17891) mapValue!58086)) b!1349075))

(assert (= (and b!1349069 ((_ is ValueCellFull!17891) mapDefault!58086)) b!1349074))

(assert (= start!113670 b!1349069))

(declare-fun b_lambda!24679 () Bool)

(assert (=> (not b_lambda!24679) (not b!1349077)))

(declare-fun t!46168 () Bool)

(declare-fun tb!12441 () Bool)

(assert (=> (and start!113670 (= defaultEntry!1306 defaultEntry!1306) t!46168) tb!12441))

(declare-fun result!25987 () Bool)

(assert (=> tb!12441 (= result!25987 tp_is_empty!37579)))

(assert (=> b!1349077 t!46168))

(declare-fun b_and!50941 () Bool)

(assert (= b_and!50939 (and (=> t!46168 result!25987) b_and!50941)))

(declare-fun m!1235749 () Bool)

(assert (=> b!1349071 m!1235749))

(assert (=> b!1349071 m!1235749))

(declare-fun m!1235751 () Bool)

(assert (=> b!1349071 m!1235751))

(declare-fun m!1235753 () Bool)

(assert (=> start!113670 m!1235753))

(declare-fun m!1235755 () Bool)

(assert (=> start!113670 m!1235755))

(declare-fun m!1235757 () Bool)

(assert (=> start!113670 m!1235757))

(declare-fun m!1235759 () Bool)

(assert (=> b!1349067 m!1235759))

(declare-fun m!1235761 () Bool)

(assert (=> b!1349077 m!1235761))

(declare-fun m!1235763 () Bool)

(assert (=> b!1349077 m!1235763))

(declare-fun m!1235765 () Bool)

(assert (=> b!1349077 m!1235765))

(declare-fun m!1235767 () Bool)

(assert (=> b!1349077 m!1235767))

(assert (=> b!1349077 m!1235761))

(declare-fun m!1235769 () Bool)

(assert (=> b!1349077 m!1235769))

(assert (=> b!1349077 m!1235763))

(assert (=> b!1349077 m!1235765))

(assert (=> b!1349077 m!1235769))

(declare-fun m!1235771 () Bool)

(assert (=> b!1349077 m!1235771))

(assert (=> b!1349077 m!1235749))

(declare-fun m!1235773 () Bool)

(assert (=> b!1349073 m!1235773))

(assert (=> b!1349073 m!1235773))

(declare-fun m!1235775 () Bool)

(assert (=> b!1349073 m!1235775))

(assert (=> b!1349076 m!1235749))

(assert (=> b!1349068 m!1235749))

(declare-fun m!1235777 () Bool)

(assert (=> mapNonEmpty!58086 m!1235777))

(declare-fun m!1235779 () Bool)

(assert (=> b!1349066 m!1235779))

(check-sat (not b_next!31579) (not mapNonEmpty!58086) (not b!1349067) (not b_lambda!24679) (not b!1349077) tp_is_empty!37579 (not b!1349071) b_and!50941 (not b!1349073) (not b!1349066) (not start!113670))
(check-sat b_and!50941 (not b_next!31579))
