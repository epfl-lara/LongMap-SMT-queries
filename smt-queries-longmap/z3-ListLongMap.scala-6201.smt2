; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79482 () Bool)

(assert start!79482)

(declare-fun b_free!17527 () Bool)

(declare-fun b_next!17527 () Bool)

(assert (=> start!79482 (= b_free!17527 (not b_next!17527))))

(declare-fun tp!61022 () Bool)

(declare-fun b_and!28615 () Bool)

(assert (=> start!79482 (= tp!61022 b_and!28615)))

(declare-fun b!932522 () Bool)

(declare-fun res!627777 () Bool)

(declare-fun e!523769 () Bool)

(assert (=> b!932522 (=> (not res!627777) (not e!523769))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!31679 0))(
  ( (V!31680 (val!10068 Int)) )
))
(declare-fun v!791 () V!31679)

(declare-datatypes ((tuple2!13178 0))(
  ( (tuple2!13179 (_1!6600 (_ BitVec 64)) (_2!6600 V!31679)) )
))
(declare-datatypes ((List!18963 0))(
  ( (Nil!18960) (Cons!18959 (h!20111 tuple2!13178) (t!27026 List!18963)) )
))
(declare-datatypes ((ListLongMap!11877 0))(
  ( (ListLongMap!11878 (toList!5954 List!18963)) )
))
(declare-fun lt!419833 () ListLongMap!11877)

(declare-fun apply!783 (ListLongMap!11877 (_ BitVec 64)) V!31679)

(assert (=> b!932522 (= res!627777 (= (apply!783 lt!419833 k0!1099) v!791))))

(declare-fun mapIsEmpty!31809 () Bool)

(declare-fun mapRes!31809 () Bool)

(assert (=> mapIsEmpty!31809 mapRes!31809))

(declare-fun b!932523 () Bool)

(declare-fun e!523773 () Bool)

(declare-fun e!523768 () Bool)

(assert (=> b!932523 (= e!523773 (and e!523768 mapRes!31809))))

(declare-fun condMapEmpty!31809 () Bool)

(declare-datatypes ((ValueCell!9536 0))(
  ( (ValueCellFull!9536 (v!12583 V!31679)) (EmptyCell!9536) )
))
(declare-datatypes ((array!56067 0))(
  ( (array!56068 (arr!26974 (Array (_ BitVec 32) ValueCell!9536)) (size!27434 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56067)

(declare-fun mapDefault!31809 () ValueCell!9536)

(assert (=> b!932523 (= condMapEmpty!31809 (= (arr!26974 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9536)) mapDefault!31809)))))

(declare-fun b!932524 () Bool)

(declare-fun e!523772 () Bool)

(assert (=> b!932524 (= e!523772 (not true))))

(declare-datatypes ((array!56069 0))(
  ( (array!56070 (arr!26975 (Array (_ BitVec 32) (_ BitVec 64))) (size!27435 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56069)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun lt!419832 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!31679)

(declare-fun minValue!1173 () V!31679)

(declare-fun getCurrentListMap!3197 (array!56069 array!56067 (_ BitVec 32) (_ BitVec 32) V!31679 V!31679 (_ BitVec 32) Int) ListLongMap!11877)

(declare-fun +!2785 (ListLongMap!11877 tuple2!13178) ListLongMap!11877)

(declare-fun get!14196 (ValueCell!9536 V!31679) V!31679)

(declare-fun dynLambda!1582 (Int (_ BitVec 64)) V!31679)

(assert (=> b!932524 (= (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2785 (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) (tuple2!13179 lt!419832 (get!14196 (select (arr!26974 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1582 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!31435 0))(
  ( (Unit!31436) )
))
(declare-fun lt!419834 () Unit!31435)

(declare-fun lemmaListMapRecursiveValidKeyArray!165 (array!56069 array!56067 (_ BitVec 32) (_ BitVec 32) V!31679 V!31679 (_ BitVec 32) Int) Unit!31435)

(assert (=> b!932524 (= lt!419834 (lemmaListMapRecursiveValidKeyArray!165 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932525 () Bool)

(declare-fun res!627774 () Bool)

(declare-fun e!523774 () Bool)

(assert (=> b!932525 (=> (not res!627774) (not e!523774))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56069 (_ BitVec 32)) Bool)

(assert (=> b!932525 (= res!627774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!932526 () Bool)

(declare-fun e!523771 () Bool)

(declare-fun tp_is_empty!20035 () Bool)

(assert (=> b!932526 (= e!523771 tp_is_empty!20035)))

(declare-fun b!932527 () Bool)

(assert (=> b!932527 (= e!523769 e!523772)))

(declare-fun res!627775 () Bool)

(assert (=> b!932527 (=> (not res!627775) (not e!523772))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932527 (= res!627775 (validKeyInArray!0 lt!419832))))

(assert (=> b!932527 (= lt!419832 (select (arr!26975 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun b!932528 () Bool)

(assert (=> b!932528 (= e!523774 e!523769)))

(declare-fun res!627783 () Bool)

(assert (=> b!932528 (=> (not res!627783) (not e!523769))))

(declare-fun contains!5018 (ListLongMap!11877 (_ BitVec 64)) Bool)

(assert (=> b!932528 (= res!627783 (contains!5018 lt!419833 k0!1099))))

(assert (=> b!932528 (= lt!419833 (getCurrentListMap!3197 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932529 () Bool)

(declare-fun res!627776 () Bool)

(assert (=> b!932529 (=> (not res!627776) (not e!523774))))

(assert (=> b!932529 (= res!627776 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27435 _keys!1487))))))

(declare-fun b!932530 () Bool)

(declare-fun res!627782 () Bool)

(assert (=> b!932530 (=> (not res!627782) (not e!523769))))

(assert (=> b!932530 (= res!627782 (validKeyInArray!0 k0!1099))))

(declare-fun mapNonEmpty!31809 () Bool)

(declare-fun tp!61023 () Bool)

(assert (=> mapNonEmpty!31809 (= mapRes!31809 (and tp!61023 e!523771))))

(declare-fun mapValue!31809 () ValueCell!9536)

(declare-fun mapRest!31809 () (Array (_ BitVec 32) ValueCell!9536))

(declare-fun mapKey!31809 () (_ BitVec 32))

(assert (=> mapNonEmpty!31809 (= (arr!26974 _values!1231) (store mapRest!31809 mapKey!31809 mapValue!31809))))

(declare-fun res!627780 () Bool)

(assert (=> start!79482 (=> (not res!627780) (not e!523774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79482 (= res!627780 (validMask!0 mask!1881))))

(assert (=> start!79482 e!523774))

(assert (=> start!79482 true))

(assert (=> start!79482 tp_is_empty!20035))

(declare-fun array_inv!21084 (array!56067) Bool)

(assert (=> start!79482 (and (array_inv!21084 _values!1231) e!523773)))

(assert (=> start!79482 tp!61022))

(declare-fun array_inv!21085 (array!56069) Bool)

(assert (=> start!79482 (array_inv!21085 _keys!1487)))

(declare-fun b!932531 () Bool)

(assert (=> b!932531 (= e!523768 tp_is_empty!20035)))

(declare-fun b!932532 () Bool)

(declare-fun res!627779 () Bool)

(assert (=> b!932532 (=> (not res!627779) (not e!523774))))

(declare-datatypes ((List!18964 0))(
  ( (Nil!18961) (Cons!18960 (h!20112 (_ BitVec 64)) (t!27027 List!18964)) )
))
(declare-fun arrayNoDuplicates!0 (array!56069 (_ BitVec 32) List!18964) Bool)

(assert (=> b!932532 (= res!627779 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18961))))

(declare-fun b!932533 () Bool)

(declare-fun res!627781 () Bool)

(assert (=> b!932533 (=> (not res!627781) (not e!523774))))

(assert (=> b!932533 (= res!627781 (and (= (size!27434 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27435 _keys!1487) (size!27434 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932534 () Bool)

(declare-fun res!627778 () Bool)

(assert (=> b!932534 (=> (not res!627778) (not e!523769))))

(assert (=> b!932534 (= res!627778 (bvsgt from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!79482 res!627780) b!932533))

(assert (= (and b!932533 res!627781) b!932525))

(assert (= (and b!932525 res!627774) b!932532))

(assert (= (and b!932532 res!627779) b!932529))

(assert (= (and b!932529 res!627776) b!932528))

(assert (= (and b!932528 res!627783) b!932522))

(assert (= (and b!932522 res!627777) b!932534))

(assert (= (and b!932534 res!627778) b!932530))

(assert (= (and b!932530 res!627782) b!932527))

(assert (= (and b!932527 res!627775) b!932524))

(assert (= (and b!932523 condMapEmpty!31809) mapIsEmpty!31809))

(assert (= (and b!932523 (not condMapEmpty!31809)) mapNonEmpty!31809))

(get-info :version)

(assert (= (and mapNonEmpty!31809 ((_ is ValueCellFull!9536) mapValue!31809)) b!932526))

(assert (= (and b!932523 ((_ is ValueCellFull!9536) mapDefault!31809)) b!932531))

(assert (= start!79482 b!932523))

(declare-fun b_lambda!13857 () Bool)

(assert (=> (not b_lambda!13857) (not b!932524)))

(declare-fun t!27025 () Bool)

(declare-fun tb!5913 () Bool)

(assert (=> (and start!79482 (= defaultEntry!1235 defaultEntry!1235) t!27025) tb!5913))

(declare-fun result!11657 () Bool)

(assert (=> tb!5913 (= result!11657 tp_is_empty!20035)))

(assert (=> b!932524 t!27025))

(declare-fun b_and!28617 () Bool)

(assert (= b_and!28615 (and (=> t!27025 result!11657) b_and!28617)))

(declare-fun m!866785 () Bool)

(assert (=> mapNonEmpty!31809 m!866785))

(declare-fun m!866787 () Bool)

(assert (=> b!932532 m!866787))

(declare-fun m!866789 () Bool)

(assert (=> b!932524 m!866789))

(declare-fun m!866791 () Bool)

(assert (=> b!932524 m!866791))

(assert (=> b!932524 m!866789))

(assert (=> b!932524 m!866791))

(declare-fun m!866793 () Bool)

(assert (=> b!932524 m!866793))

(declare-fun m!866795 () Bool)

(assert (=> b!932524 m!866795))

(declare-fun m!866797 () Bool)

(assert (=> b!932524 m!866797))

(declare-fun m!866799 () Bool)

(assert (=> b!932524 m!866799))

(assert (=> b!932524 m!866797))

(declare-fun m!866801 () Bool)

(assert (=> b!932524 m!866801))

(declare-fun m!866803 () Bool)

(assert (=> b!932525 m!866803))

(declare-fun m!866805 () Bool)

(assert (=> b!932530 m!866805))

(declare-fun m!866807 () Bool)

(assert (=> b!932528 m!866807))

(declare-fun m!866809 () Bool)

(assert (=> b!932528 m!866809))

(declare-fun m!866811 () Bool)

(assert (=> b!932527 m!866811))

(declare-fun m!866813 () Bool)

(assert (=> b!932527 m!866813))

(declare-fun m!866815 () Bool)

(assert (=> start!79482 m!866815))

(declare-fun m!866817 () Bool)

(assert (=> start!79482 m!866817))

(declare-fun m!866819 () Bool)

(assert (=> start!79482 m!866819))

(declare-fun m!866821 () Bool)

(assert (=> b!932522 m!866821))

(check-sat (not b!932524) b_and!28617 tp_is_empty!20035 (not b_next!17527) (not b!932525) (not b!932522) (not b_lambda!13857) (not b!932527) (not b!932530) (not start!79482) (not mapNonEmpty!31809) (not b!932528) (not b!932532))
(check-sat b_and!28617 (not b_next!17527))
