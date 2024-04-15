; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!78690 () Bool)

(assert start!78690)

(declare-fun b_free!16921 () Bool)

(declare-fun b_next!16921 () Bool)

(assert (=> start!78690 (= b_free!16921 (not b_next!16921))))

(declare-fun tp!59204 () Bool)

(declare-fun b_and!27553 () Bool)

(assert (=> start!78690 (= tp!59204 b_and!27553)))

(declare-fun res!618773 () Bool)

(declare-fun e!515185 () Bool)

(assert (=> start!78690 (=> (not res!618773) (not e!515185))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!78690 (= res!618773 (validMask!0 mask!1881))))

(assert (=> start!78690 e!515185))

(assert (=> start!78690 true))

(declare-fun tp_is_empty!19429 () Bool)

(assert (=> start!78690 tp_is_empty!19429))

(declare-datatypes ((V!30871 0))(
  ( (V!30872 (val!9765 Int)) )
))
(declare-datatypes ((ValueCell!9233 0))(
  ( (ValueCellFull!9233 (v!12282 V!30871)) (EmptyCell!9233) )
))
(declare-datatypes ((array!54827 0))(
  ( (array!54828 (arr!26359 (Array (_ BitVec 32) ValueCell!9233)) (size!26820 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54827)

(declare-fun e!515184 () Bool)

(declare-fun array_inv!20632 (array!54827) Bool)

(assert (=> start!78690 (and (array_inv!20632 _values!1231) e!515184)))

(assert (=> start!78690 tp!59204))

(declare-datatypes ((array!54829 0))(
  ( (array!54830 (arr!26360 (Array (_ BitVec 32) (_ BitVec 64))) (size!26821 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54829)

(declare-fun array_inv!20633 (array!54829) Bool)

(assert (=> start!78690 (array_inv!20633 _keys!1487)))

(declare-fun mapIsEmpty!30900 () Bool)

(declare-fun mapRes!30900 () Bool)

(assert (=> mapIsEmpty!30900 mapRes!30900))

(declare-fun b!917721 () Bool)

(declare-fun res!618775 () Bool)

(declare-fun e!515183 () Bool)

(assert (=> b!917721 (=> (not res!618775) (not e!515183))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!917721 (= res!618775 (validKeyInArray!0 k0!1099))))

(declare-fun b!917722 () Bool)

(assert (=> b!917722 (= e!515185 e!515183)))

(declare-fun res!618779 () Bool)

(assert (=> b!917722 (=> (not res!618779) (not e!515183))))

(declare-datatypes ((tuple2!12730 0))(
  ( (tuple2!12731 (_1!6376 (_ BitVec 64)) (_2!6376 V!30871)) )
))
(declare-datatypes ((List!18519 0))(
  ( (Nil!18516) (Cons!18515 (h!19661 tuple2!12730) (t!26161 List!18519)) )
))
(declare-datatypes ((ListLongMap!11417 0))(
  ( (ListLongMap!11418 (toList!5724 List!18519)) )
))
(declare-fun lt!411892 () ListLongMap!11417)

(declare-fun contains!4726 (ListLongMap!11417 (_ BitVec 64)) Bool)

(assert (=> b!917722 (= res!618779 (contains!4726 lt!411892 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!30871)

(declare-fun minValue!1173 () V!30871)

(declare-fun getCurrentListMap!2917 (array!54829 array!54827 (_ BitVec 32) (_ BitVec 32) V!30871 V!30871 (_ BitVec 32) Int) ListLongMap!11417)

(assert (=> b!917722 (= lt!411892 (getCurrentListMap!2917 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!917723 () Bool)

(declare-fun e!515187 () Bool)

(assert (=> b!917723 (= e!515187 tp_is_empty!19429)))

(declare-fun b!917724 () Bool)

(declare-fun e!515186 () Bool)

(assert (=> b!917724 (= e!515183 e!515186)))

(declare-fun res!618772 () Bool)

(assert (=> b!917724 (=> (not res!618772) (not e!515186))))

(declare-fun lt!411893 () (_ BitVec 64))

(assert (=> b!917724 (= res!618772 (validKeyInArray!0 lt!411893))))

(assert (=> b!917724 (= lt!411893 (select (arr!26360 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!917725 () Bool)

(declare-fun res!618778 () Bool)

(assert (=> b!917725 (=> (not res!618778) (not e!515185))))

(declare-datatypes ((List!18520 0))(
  ( (Nil!18517) (Cons!18516 (h!19662 (_ BitVec 64)) (t!26162 List!18520)) )
))
(declare-fun arrayNoDuplicates!0 (array!54829 (_ BitVec 32) List!18520) Bool)

(assert (=> b!917725 (= res!618778 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18517))))

(declare-fun b!917726 () Bool)

(declare-fun res!618771 () Bool)

(assert (=> b!917726 (=> (not res!618771) (not e!515183))))

(declare-fun v!791 () V!30871)

(declare-fun apply!561 (ListLongMap!11417 (_ BitVec 64)) V!30871)

(assert (=> b!917726 (= res!618771 (= (apply!561 lt!411892 k0!1099) v!791))))

(declare-fun b!917727 () Bool)

(declare-fun res!618774 () Bool)

(assert (=> b!917727 (=> (not res!618774) (not e!515185))))

(assert (=> b!917727 (= res!618774 (and (= (size!26820 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!26821 _keys!1487) (size!26820 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!917728 () Bool)

(declare-fun res!618776 () Bool)

(assert (=> b!917728 (=> (not res!618776) (not e!515185))))

(assert (=> b!917728 (= res!618776 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!26821 _keys!1487))))))

(declare-fun b!917729 () Bool)

(declare-fun res!618770 () Bool)

(assert (=> b!917729 (=> (not res!618770) (not e!515185))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54829 (_ BitVec 32)) Bool)

(assert (=> b!917729 (= res!618770 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!917730 () Bool)

(declare-fun res!618777 () Bool)

(assert (=> b!917730 (=> (not res!618777) (not e!515183))))

(assert (=> b!917730 (= res!618777 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!30900 () Bool)

(declare-fun tp!59205 () Bool)

(assert (=> mapNonEmpty!30900 (= mapRes!30900 (and tp!59205 e!515187))))

(declare-fun mapKey!30900 () (_ BitVec 32))

(declare-fun mapRest!30900 () (Array (_ BitVec 32) ValueCell!9233))

(declare-fun mapValue!30900 () ValueCell!9233)

(assert (=> mapNonEmpty!30900 (= (arr!26359 _values!1231) (store mapRest!30900 mapKey!30900 mapValue!30900))))

(declare-fun b!917731 () Bool)

(declare-fun e!515181 () Bool)

(assert (=> b!917731 (= e!515184 (and e!515181 mapRes!30900))))

(declare-fun condMapEmpty!30900 () Bool)

(declare-fun mapDefault!30900 () ValueCell!9233)

(assert (=> b!917731 (= condMapEmpty!30900 (= (arr!26359 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9233)) mapDefault!30900)))))

(declare-fun b!917732 () Bool)

(assert (=> b!917732 (= e!515186 (not true))))

(declare-fun +!2648 (ListLongMap!11417 tuple2!12730) ListLongMap!11417)

(declare-fun get!13817 (ValueCell!9233 V!30871) V!30871)

(declare-fun dynLambda!1404 (Int (_ BitVec 64)) V!30871)

(assert (=> b!917732 (= (getCurrentListMap!2917 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2648 (getCurrentListMap!2917 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!12731 lt!411893 (get!13817 (select (arr!26359 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1404 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!30908 0))(
  ( (Unit!30909) )
))
(declare-fun lt!411891 () Unit!30908)

(declare-fun lemmaListMapRecursiveValidKeyArray!12 (array!54829 array!54827 (_ BitVec 32) (_ BitVec 32) V!30871 V!30871 (_ BitVec 32) Int) Unit!30908)

(assert (=> b!917732 (= lt!411891 (lemmaListMapRecursiveValidKeyArray!12 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!917733 () Bool)

(assert (=> b!917733 (= e!515181 tp_is_empty!19429)))

(assert (= (and start!78690 res!618773) b!917727))

(assert (= (and b!917727 res!618774) b!917729))

(assert (= (and b!917729 res!618770) b!917725))

(assert (= (and b!917725 res!618778) b!917728))

(assert (= (and b!917728 res!618776) b!917722))

(assert (= (and b!917722 res!618779) b!917726))

(assert (= (and b!917726 res!618771) b!917730))

(assert (= (and b!917730 res!618777) b!917721))

(assert (= (and b!917721 res!618775) b!917724))

(assert (= (and b!917724 res!618772) b!917732))

(assert (= (and b!917731 condMapEmpty!30900) mapIsEmpty!30900))

(assert (= (and b!917731 (not condMapEmpty!30900)) mapNonEmpty!30900))

(get-info :version)

(assert (= (and mapNonEmpty!30900 ((_ is ValueCellFull!9233) mapValue!30900)) b!917723))

(assert (= (and b!917731 ((_ is ValueCellFull!9233) mapDefault!30900)) b!917733))

(assert (= start!78690 b!917731))

(declare-fun b_lambda!13405 () Bool)

(assert (=> (not b_lambda!13405) (not b!917732)))

(declare-fun t!26160 () Bool)

(declare-fun tb!5493 () Bool)

(assert (=> (and start!78690 (= defaultEntry!1235 defaultEntry!1235) t!26160) tb!5493))

(declare-fun result!10817 () Bool)

(assert (=> tb!5493 (= result!10817 tp_is_empty!19429)))

(assert (=> b!917732 t!26160))

(declare-fun b_and!27555 () Bool)

(assert (= b_and!27553 (and (=> t!26160 result!10817) b_and!27555)))

(declare-fun m!850909 () Bool)

(assert (=> b!917721 m!850909))

(declare-fun m!850911 () Bool)

(assert (=> mapNonEmpty!30900 m!850911))

(declare-fun m!850913 () Bool)

(assert (=> b!917732 m!850913))

(declare-fun m!850915 () Bool)

(assert (=> b!917732 m!850915))

(declare-fun m!850917 () Bool)

(assert (=> b!917732 m!850917))

(declare-fun m!850919 () Bool)

(assert (=> b!917732 m!850919))

(assert (=> b!917732 m!850917))

(assert (=> b!917732 m!850919))

(declare-fun m!850921 () Bool)

(assert (=> b!917732 m!850921))

(declare-fun m!850923 () Bool)

(assert (=> b!917732 m!850923))

(assert (=> b!917732 m!850913))

(declare-fun m!850925 () Bool)

(assert (=> b!917732 m!850925))

(declare-fun m!850927 () Bool)

(assert (=> b!917729 m!850927))

(declare-fun m!850929 () Bool)

(assert (=> start!78690 m!850929))

(declare-fun m!850931 () Bool)

(assert (=> start!78690 m!850931))

(declare-fun m!850933 () Bool)

(assert (=> start!78690 m!850933))

(declare-fun m!850935 () Bool)

(assert (=> b!917724 m!850935))

(declare-fun m!850937 () Bool)

(assert (=> b!917724 m!850937))

(declare-fun m!850939 () Bool)

(assert (=> b!917722 m!850939))

(declare-fun m!850941 () Bool)

(assert (=> b!917722 m!850941))

(declare-fun m!850943 () Bool)

(assert (=> b!917725 m!850943))

(declare-fun m!850945 () Bool)

(assert (=> b!917726 m!850945))

(check-sat (not mapNonEmpty!30900) (not start!78690) (not b!917722) (not b!917724) (not b_lambda!13405) (not b!917732) (not b!917729) (not b!917726) (not b_next!16921) tp_is_empty!19429 (not b!917725) (not b!917721) b_and!27555)
(check-sat b_and!27555 (not b_next!16921))
