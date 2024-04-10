; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81850 () Bool)

(assert start!81850)

(declare-fun b_free!18345 () Bool)

(declare-fun b_next!18345 () Bool)

(assert (=> start!81850 (= b_free!18345 (not b_next!18345))))

(declare-fun tp!63735 () Bool)

(declare-fun b_and!29831 () Bool)

(assert (=> start!81850 (= tp!63735 b_and!29831)))

(declare-fun res!639204 () Bool)

(declare-fun e!537777 () Bool)

(assert (=> start!81850 (=> (not res!639204) (not e!537777))))

(declare-fun mask!1823 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81850 (= res!639204 (validMask!0 mask!1823))))

(assert (=> start!81850 e!537777))

(assert (=> start!81850 true))

(declare-fun tp_is_empty!20889 () Bool)

(assert (=> start!81850 tp_is_empty!20889))

(declare-datatypes ((array!57889 0))(
  ( (array!57890 (arr!27824 (Array (_ BitVec 32) (_ BitVec 64))) (size!28303 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57889)

(declare-fun array_inv!21603 (array!57889) Bool)

(assert (=> start!81850 (array_inv!21603 _keys!1441)))

(declare-datatypes ((V!32835 0))(
  ( (V!32836 (val!10495 Int)) )
))
(declare-datatypes ((ValueCell!9963 0))(
  ( (ValueCellFull!9963 (v!13050 V!32835)) (EmptyCell!9963) )
))
(declare-datatypes ((array!57891 0))(
  ( (array!57892 (arr!27825 (Array (_ BitVec 32) ValueCell!9963)) (size!28304 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57891)

(declare-fun e!537778 () Bool)

(declare-fun array_inv!21604 (array!57891) Bool)

(assert (=> start!81850 (and (array_inv!21604 _values!1197) e!537778)))

(assert (=> start!81850 tp!63735))

(declare-fun b!954535 () Bool)

(declare-fun e!537774 () Bool)

(assert (=> b!954535 (= e!537774 tp_is_empty!20889)))

(declare-fun b!954536 () Bool)

(declare-fun res!639200 () Bool)

(assert (=> b!954536 (=> (not res!639200) (not e!537777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57889 (_ BitVec 32)) Bool)

(assert (=> b!954536 (= res!639200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954537 () Bool)

(declare-fun res!639203 () Bool)

(assert (=> b!954537 (=> (not res!639203) (not e!537777))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(assert (=> b!954537 (= res!639203 (and (= (size!28304 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28303 _keys!1441) (size!28304 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33295 () Bool)

(declare-fun mapRes!33295 () Bool)

(assert (=> mapIsEmpty!33295 mapRes!33295))

(declare-fun b!954538 () Bool)

(assert (=> b!954538 (= e!537777 false)))

(declare-fun zeroValue!1139 () V!32835)

(declare-fun i!735 () (_ BitVec 32))

(declare-fun lt!429911 () Bool)

(declare-fun minValue!1139 () V!32835)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13618 0))(
  ( (tuple2!13619 (_1!6820 (_ BitVec 64)) (_2!6820 V!32835)) )
))
(declare-datatypes ((List!19398 0))(
  ( (Nil!19395) (Cons!19394 (h!20556 tuple2!13618) (t!27759 List!19398)) )
))
(declare-datatypes ((ListLongMap!12315 0))(
  ( (ListLongMap!12316 (toList!6173 List!19398)) )
))
(declare-fun contains!5271 (ListLongMap!12315 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3406 (array!57889 array!57891 (_ BitVec 32) (_ BitVec 32) V!32835 V!32835 (_ BitVec 32) Int) ListLongMap!12315)

(assert (=> b!954538 (= lt!429911 (contains!5271 (getCurrentListMap!3406 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27824 _keys!1441) i!735)))))

(declare-fun b!954539 () Bool)

(declare-fun res!639199 () Bool)

(assert (=> b!954539 (=> (not res!639199) (not e!537777))))

(assert (=> b!954539 (= res!639199 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28303 _keys!1441))))))

(declare-fun b!954540 () Bool)

(declare-fun res!639202 () Bool)

(assert (=> b!954540 (=> (not res!639202) (not e!537777))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954540 (= res!639202 (validKeyInArray!0 (select (arr!27824 _keys!1441) i!735)))))

(declare-fun b!954541 () Bool)

(declare-fun res!639201 () Bool)

(assert (=> b!954541 (=> (not res!639201) (not e!537777))))

(declare-datatypes ((List!19399 0))(
  ( (Nil!19396) (Cons!19395 (h!20557 (_ BitVec 64)) (t!27760 List!19399)) )
))
(declare-fun arrayNoDuplicates!0 (array!57889 (_ BitVec 32) List!19399) Bool)

(assert (=> b!954541 (= res!639201 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19396))))

(declare-fun b!954542 () Bool)

(declare-fun e!537775 () Bool)

(assert (=> b!954542 (= e!537775 tp_is_empty!20889)))

(declare-fun b!954543 () Bool)

(assert (=> b!954543 (= e!537778 (and e!537775 mapRes!33295))))

(declare-fun condMapEmpty!33295 () Bool)

(declare-fun mapDefault!33295 () ValueCell!9963)

(assert (=> b!954543 (= condMapEmpty!33295 (= (arr!27825 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9963)) mapDefault!33295)))))

(declare-fun mapNonEmpty!33295 () Bool)

(declare-fun tp!63734 () Bool)

(assert (=> mapNonEmpty!33295 (= mapRes!33295 (and tp!63734 e!537774))))

(declare-fun mapRest!33295 () (Array (_ BitVec 32) ValueCell!9963))

(declare-fun mapKey!33295 () (_ BitVec 32))

(declare-fun mapValue!33295 () ValueCell!9963)

(assert (=> mapNonEmpty!33295 (= (arr!27825 _values!1197) (store mapRest!33295 mapKey!33295 mapValue!33295))))

(assert (= (and start!81850 res!639204) b!954537))

(assert (= (and b!954537 res!639203) b!954536))

(assert (= (and b!954536 res!639200) b!954541))

(assert (= (and b!954541 res!639201) b!954539))

(assert (= (and b!954539 res!639199) b!954540))

(assert (= (and b!954540 res!639202) b!954538))

(assert (= (and b!954543 condMapEmpty!33295) mapIsEmpty!33295))

(assert (= (and b!954543 (not condMapEmpty!33295)) mapNonEmpty!33295))

(get-info :version)

(assert (= (and mapNonEmpty!33295 ((_ is ValueCellFull!9963) mapValue!33295)) b!954535))

(assert (= (and b!954543 ((_ is ValueCellFull!9963) mapDefault!33295)) b!954542))

(assert (= start!81850 b!954543))

(declare-fun m!886243 () Bool)

(assert (=> b!954541 m!886243))

(declare-fun m!886245 () Bool)

(assert (=> b!954536 m!886245))

(declare-fun m!886247 () Bool)

(assert (=> b!954538 m!886247))

(declare-fun m!886249 () Bool)

(assert (=> b!954538 m!886249))

(assert (=> b!954538 m!886247))

(assert (=> b!954538 m!886249))

(declare-fun m!886251 () Bool)

(assert (=> b!954538 m!886251))

(assert (=> b!954540 m!886249))

(assert (=> b!954540 m!886249))

(declare-fun m!886253 () Bool)

(assert (=> b!954540 m!886253))

(declare-fun m!886255 () Bool)

(assert (=> start!81850 m!886255))

(declare-fun m!886257 () Bool)

(assert (=> start!81850 m!886257))

(declare-fun m!886259 () Bool)

(assert (=> start!81850 m!886259))

(declare-fun m!886261 () Bool)

(assert (=> mapNonEmpty!33295 m!886261))

(check-sat (not b_next!18345) b_and!29831 tp_is_empty!20889 (not mapNonEmpty!33295) (not b!954536) (not start!81850) (not b!954538) (not b!954541) (not b!954540))
(check-sat b_and!29831 (not b_next!18345))
