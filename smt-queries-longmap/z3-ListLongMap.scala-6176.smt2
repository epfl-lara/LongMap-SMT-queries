; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79166 () Bool)

(assert start!79166)

(declare-fun b_free!17379 () Bool)

(declare-fun b_next!17379 () Bool)

(assert (=> start!79166 (= b_free!17379 (not b_next!17379))))

(declare-fun tp!60578 () Bool)

(declare-fun b_and!28445 () Bool)

(assert (=> start!79166 (= tp!60578 b_and!28445)))

(declare-fun b!929273 () Bool)

(declare-fun e!521836 () Bool)

(declare-fun tp_is_empty!19887 () Bool)

(assert (=> b!929273 (= e!521836 tp_is_empty!19887)))

(declare-fun res!625762 () Bool)

(declare-fun e!521837 () Bool)

(assert (=> start!79166 (=> (not res!625762) (not e!521837))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79166 (= res!625762 (validMask!0 mask!1881))))

(assert (=> start!79166 e!521837))

(assert (=> start!79166 true))

(assert (=> start!79166 tp_is_empty!19887))

(declare-datatypes ((V!31481 0))(
  ( (V!31482 (val!9994 Int)) )
))
(declare-datatypes ((ValueCell!9462 0))(
  ( (ValueCellFull!9462 (v!12512 V!31481)) (EmptyCell!9462) )
))
(declare-datatypes ((array!55728 0))(
  ( (array!55729 (arr!26809 (Array (_ BitVec 32) ValueCell!9462)) (size!27268 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55728)

(declare-fun e!521839 () Bool)

(declare-fun array_inv!20862 (array!55728) Bool)

(assert (=> start!79166 (and (array_inv!20862 _values!1231) e!521839)))

(assert (=> start!79166 tp!60578))

(declare-datatypes ((array!55730 0))(
  ( (array!55731 (arr!26810 (Array (_ BitVec 32) (_ BitVec 64))) (size!27269 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55730)

(declare-fun array_inv!20863 (array!55730) Bool)

(assert (=> start!79166 (array_inv!20863 _keys!1487)))

(declare-fun b!929274 () Bool)

(declare-fun res!625768 () Bool)

(assert (=> b!929274 (=> (not res!625768) (not e!521837))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!929274 (= res!625768 (and (= (size!27268 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27269 _keys!1487) (size!27268 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929275 () Bool)

(declare-fun e!521838 () Bool)

(assert (=> b!929275 (= e!521838 tp_is_empty!19887)))

(declare-fun b!929276 () Bool)

(declare-fun res!625763 () Bool)

(assert (=> b!929276 (=> (not res!625763) (not e!521837))))

(declare-datatypes ((List!18859 0))(
  ( (Nil!18856) (Cons!18855 (h!20001 (_ BitVec 64)) (t!26916 List!18859)) )
))
(declare-fun arrayNoDuplicates!0 (array!55730 (_ BitVec 32) List!18859) Bool)

(assert (=> b!929276 (= res!625763 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18856))))

(declare-fun b!929277 () Bool)

(declare-fun mapRes!31587 () Bool)

(assert (=> b!929277 (= e!521839 (and e!521836 mapRes!31587))))

(declare-fun condMapEmpty!31587 () Bool)

(declare-fun mapDefault!31587 () ValueCell!9462)

(assert (=> b!929277 (= condMapEmpty!31587 (= (arr!26809 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9462)) mapDefault!31587)))))

(declare-fun mapNonEmpty!31587 () Bool)

(declare-fun tp!60577 () Bool)

(assert (=> mapNonEmpty!31587 (= mapRes!31587 (and tp!60577 e!521838))))

(declare-fun mapRest!31587 () (Array (_ BitVec 32) ValueCell!9462))

(declare-fun mapKey!31587 () (_ BitVec 32))

(declare-fun mapValue!31587 () ValueCell!9462)

(assert (=> mapNonEmpty!31587 (= (arr!26809 _values!1231) (store mapRest!31587 mapKey!31587 mapValue!31587))))

(declare-fun b!929278 () Bool)

(declare-fun res!625764 () Bool)

(assert (=> b!929278 (=> (not res!625764) (not e!521837))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55730 (_ BitVec 32)) Bool)

(assert (=> b!929278 (= res!625764 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!929279 () Bool)

(declare-fun res!625767 () Bool)

(declare-fun e!521834 () Bool)

(assert (=> b!929279 (=> (not res!625767) (not e!521834))))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun v!791 () V!31481)

(declare-datatypes ((tuple2!13066 0))(
  ( (tuple2!13067 (_1!6544 (_ BitVec 64)) (_2!6544 V!31481)) )
))
(declare-datatypes ((List!18860 0))(
  ( (Nil!18857) (Cons!18856 (h!20002 tuple2!13066) (t!26917 List!18860)) )
))
(declare-datatypes ((ListLongMap!11763 0))(
  ( (ListLongMap!11764 (toList!5897 List!18860)) )
))
(declare-fun lt!419038 () ListLongMap!11763)

(declare-fun apply!723 (ListLongMap!11763 (_ BitVec 64)) V!31481)

(assert (=> b!929279 (= res!625767 (= (apply!723 lt!419038 k0!1099) v!791))))

(declare-fun mapIsEmpty!31587 () Bool)

(assert (=> mapIsEmpty!31587 mapRes!31587))

(declare-fun b!929280 () Bool)

(declare-fun res!625766 () Bool)

(assert (=> b!929280 (=> (not res!625766) (not e!521837))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929280 (= res!625766 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27269 _keys!1487))))))

(declare-fun b!929281 () Bool)

(assert (=> b!929281 (= e!521837 e!521834)))

(declare-fun res!625765 () Bool)

(assert (=> b!929281 (=> (not res!625765) (not e!521834))))

(declare-fun contains!4950 (ListLongMap!11763 (_ BitVec 64)) Bool)

(assert (=> b!929281 (= res!625765 (contains!4950 lt!419038 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31481)

(declare-fun minValue!1173 () V!31481)

(declare-fun getCurrentListMap!3141 (array!55730 array!55728 (_ BitVec 32) (_ BitVec 32) V!31481 V!31481 (_ BitVec 32) Int) ListLongMap!11763)

(assert (=> b!929281 (= lt!419038 (getCurrentListMap!3141 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929282 () Bool)

(assert (=> b!929282 (= e!521834 (and (bvsle from!1844 #b00000000000000000000000000000000) (bvsgt #b00000000000000000000000000000000 (size!27269 _keys!1487))))))

(assert (= (and start!79166 res!625762) b!929274))

(assert (= (and b!929274 res!625768) b!929278))

(assert (= (and b!929278 res!625764) b!929276))

(assert (= (and b!929276 res!625763) b!929280))

(assert (= (and b!929280 res!625766) b!929281))

(assert (= (and b!929281 res!625765) b!929279))

(assert (= (and b!929279 res!625767) b!929282))

(assert (= (and b!929277 condMapEmpty!31587) mapIsEmpty!31587))

(assert (= (and b!929277 (not condMapEmpty!31587)) mapNonEmpty!31587))

(get-info :version)

(assert (= (and mapNonEmpty!31587 ((_ is ValueCellFull!9462) mapValue!31587)) b!929275))

(assert (= (and b!929277 ((_ is ValueCellFull!9462) mapDefault!31587)) b!929273))

(assert (= start!79166 b!929277))

(declare-fun m!863895 () Bool)

(assert (=> b!929278 m!863895))

(declare-fun m!863897 () Bool)

(assert (=> b!929279 m!863897))

(declare-fun m!863899 () Bool)

(assert (=> mapNonEmpty!31587 m!863899))

(declare-fun m!863901 () Bool)

(assert (=> b!929276 m!863901))

(declare-fun m!863903 () Bool)

(assert (=> b!929281 m!863903))

(declare-fun m!863905 () Bool)

(assert (=> b!929281 m!863905))

(declare-fun m!863907 () Bool)

(assert (=> start!79166 m!863907))

(declare-fun m!863909 () Bool)

(assert (=> start!79166 m!863909))

(declare-fun m!863911 () Bool)

(assert (=> start!79166 m!863911))

(check-sat (not b!929278) (not b!929276) (not b!929279) tp_is_empty!19887 b_and!28445 (not b_next!17379) (not mapNonEmpty!31587) (not start!79166) (not b!929281))
(check-sat b_and!28445 (not b_next!17379))
