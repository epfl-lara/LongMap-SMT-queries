; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79384 () Bool)

(assert start!79384)

(declare-fun b_free!17571 () Bool)

(declare-fun b_next!17571 () Bool)

(assert (=> start!79384 (= b_free!17571 (not b_next!17571))))

(declare-fun tp!61156 () Bool)

(declare-fun b_and!28701 () Bool)

(assert (=> start!79384 (= tp!61156 b_and!28701)))

(declare-fun b!932691 () Bool)

(declare-fun res!628167 () Bool)

(declare-fun e!523760 () Bool)

(assert (=> b!932691 (=> (not res!628167) (not e!523760))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!932691 (= res!628167 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!31878 () Bool)

(declare-fun mapRes!31878 () Bool)

(declare-fun tp!61157 () Bool)

(declare-fun e!523762 () Bool)

(assert (=> mapNonEmpty!31878 (= mapRes!31878 (and tp!61157 e!523762))))

(declare-datatypes ((V!31737 0))(
  ( (V!31738 (val!10090 Int)) )
))
(declare-datatypes ((ValueCell!9558 0))(
  ( (ValueCellFull!9558 (v!12609 V!31737)) (EmptyCell!9558) )
))
(declare-fun mapRest!31878 () (Array (_ BitVec 32) ValueCell!9558))

(declare-fun mapValue!31878 () ValueCell!9558)

(declare-datatypes ((array!56096 0))(
  ( (array!56097 (arr!26992 (Array (_ BitVec 32) ValueCell!9558)) (size!27451 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56096)

(declare-fun mapKey!31878 () (_ BitVec 32))

(assert (=> mapNonEmpty!31878 (= (arr!26992 _values!1231) (store mapRest!31878 mapKey!31878 mapValue!31878))))

(declare-fun b!932692 () Bool)

(declare-fun tp_is_empty!20079 () Bool)

(assert (=> b!932692 (= e!523762 tp_is_empty!20079)))

(declare-fun b!932693 () Bool)

(declare-fun res!628171 () Bool)

(declare-fun e!523758 () Bool)

(assert (=> b!932693 (=> (not res!628171) (not e!523758))))

(declare-datatypes ((array!56098 0))(
  ( (array!56099 (arr!26993 (Array (_ BitVec 32) (_ BitVec 64))) (size!27452 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56098)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!932693 (= res!628171 (and (= (size!27451 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27452 _keys!1487) (size!27451 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!932694 () Bool)

(declare-fun e!523763 () Bool)

(declare-fun e!523764 () Bool)

(assert (=> b!932694 (= e!523763 (and e!523764 mapRes!31878))))

(declare-fun condMapEmpty!31878 () Bool)

(declare-fun mapDefault!31878 () ValueCell!9558)

(assert (=> b!932694 (= condMapEmpty!31878 (= (arr!26992 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9558)) mapDefault!31878)))))

(declare-fun b!932695 () Bool)

(declare-fun e!523759 () Bool)

(assert (=> b!932695 (= e!523760 e!523759)))

(declare-fun res!628169 () Bool)

(assert (=> b!932695 (=> (not res!628169) (not e!523759))))

(declare-fun lt!420023 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!932695 (= res!628169 (validKeyInArray!0 lt!420023))))

(assert (=> b!932695 (= lt!420023 (select (arr!26993 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun res!628174 () Bool)

(assert (=> start!79384 (=> (not res!628174) (not e!523758))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79384 (= res!628174 (validMask!0 mask!1881))))

(assert (=> start!79384 e!523758))

(assert (=> start!79384 true))

(assert (=> start!79384 tp_is_empty!20079))

(declare-fun array_inv!21008 (array!56096) Bool)

(assert (=> start!79384 (and (array_inv!21008 _values!1231) e!523763)))

(assert (=> start!79384 tp!61156))

(declare-fun array_inv!21009 (array!56098) Bool)

(assert (=> start!79384 (array_inv!21009 _keys!1487)))

(declare-fun b!932696 () Bool)

(declare-fun res!628165 () Bool)

(assert (=> b!932696 (=> (not res!628165) (not e!523758))))

(assert (=> b!932696 (= res!628165 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27452 _keys!1487))))))

(declare-fun b!932697 () Bool)

(declare-fun res!628172 () Bool)

(assert (=> b!932697 (=> (not res!628172) (not e!523758))))

(declare-datatypes ((List!19004 0))(
  ( (Nil!19001) (Cons!19000 (h!20146 (_ BitVec 64)) (t!27119 List!19004)) )
))
(declare-fun arrayNoDuplicates!0 (array!56098 (_ BitVec 32) List!19004) Bool)

(assert (=> b!932697 (= res!628172 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19001))))

(declare-fun b!932698 () Bool)

(assert (=> b!932698 (= e!523759 (not true))))

(assert (=> b!932698 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!19001)))

(declare-datatypes ((Unit!31473 0))(
  ( (Unit!31474) )
))
(declare-fun lt!420018 () Unit!31473)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!56098 (_ BitVec 32) (_ BitVec 32)) Unit!31473)

(assert (=> b!932698 (= lt!420018 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-datatypes ((tuple2!13222 0))(
  ( (tuple2!13223 (_1!6622 (_ BitVec 64)) (_2!6622 V!31737)) )
))
(declare-datatypes ((List!19005 0))(
  ( (Nil!19002) (Cons!19001 (h!20147 tuple2!13222) (t!27120 List!19005)) )
))
(declare-datatypes ((ListLongMap!11919 0))(
  ( (ListLongMap!11920 (toList!5975 List!19005)) )
))
(declare-fun lt!420019 () ListLongMap!11919)

(declare-fun lt!420017 () tuple2!13222)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5024 (ListLongMap!11919 (_ BitVec 64)) Bool)

(declare-fun +!2779 (ListLongMap!11919 tuple2!13222) ListLongMap!11919)

(assert (=> b!932698 (contains!5024 (+!2779 lt!420019 lt!420017) k0!1099)))

(declare-fun lt!420021 () Unit!31473)

(declare-fun lt!420020 () V!31737)

(declare-fun addStillContains!498 (ListLongMap!11919 (_ BitVec 64) V!31737 (_ BitVec 64)) Unit!31473)

(assert (=> b!932698 (= lt!420021 (addStillContains!498 lt!420019 lt!420023 lt!420020 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31737)

(declare-fun minValue!1173 () V!31737)

(declare-fun getCurrentListMap!3213 (array!56098 array!56096 (_ BitVec 32) (_ BitVec 32) V!31737 V!31737 (_ BitVec 32) Int) ListLongMap!11919)

(assert (=> b!932698 (= (getCurrentListMap!3213 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2779 (getCurrentListMap!3213 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!420017))))

(assert (=> b!932698 (= lt!420017 (tuple2!13223 lt!420023 lt!420020))))

(declare-fun get!14195 (ValueCell!9558 V!31737) V!31737)

(declare-fun dynLambda!1568 (Int (_ BitVec 64)) V!31737)

(assert (=> b!932698 (= lt!420020 (get!14195 (select (arr!26992 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1568 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!420022 () Unit!31473)

(declare-fun lemmaListMapRecursiveValidKeyArray!169 (array!56098 array!56096 (_ BitVec 32) (_ BitVec 32) V!31737 V!31737 (_ BitVec 32) Int) Unit!31473)

(assert (=> b!932698 (= lt!420022 (lemmaListMapRecursiveValidKeyArray!169 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!932699 () Bool)

(assert (=> b!932699 (= e!523764 tp_is_empty!20079)))

(declare-fun b!932700 () Bool)

(declare-fun res!628168 () Bool)

(assert (=> b!932700 (=> (not res!628168) (not e!523758))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56098 (_ BitVec 32)) Bool)

(assert (=> b!932700 (= res!628168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapIsEmpty!31878 () Bool)

(assert (=> mapIsEmpty!31878 mapRes!31878))

(declare-fun b!932701 () Bool)

(assert (=> b!932701 (= e!523758 e!523760)))

(declare-fun res!628173 () Bool)

(assert (=> b!932701 (=> (not res!628173) (not e!523760))))

(assert (=> b!932701 (= res!628173 (contains!5024 lt!420019 k0!1099))))

(assert (=> b!932701 (= lt!420019 (getCurrentListMap!3213 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!932702 () Bool)

(declare-fun res!628166 () Bool)

(assert (=> b!932702 (=> (not res!628166) (not e!523760))))

(declare-fun v!791 () V!31737)

(declare-fun apply!788 (ListLongMap!11919 (_ BitVec 64)) V!31737)

(assert (=> b!932702 (= res!628166 (= (apply!788 lt!420019 k0!1099) v!791))))

(declare-fun b!932703 () Bool)

(declare-fun res!628170 () Bool)

(assert (=> b!932703 (=> (not res!628170) (not e!523760))))

(assert (=> b!932703 (= res!628170 (validKeyInArray!0 k0!1099))))

(assert (= (and start!79384 res!628174) b!932693))

(assert (= (and b!932693 res!628171) b!932700))

(assert (= (and b!932700 res!628168) b!932697))

(assert (= (and b!932697 res!628172) b!932696))

(assert (= (and b!932696 res!628165) b!932701))

(assert (= (and b!932701 res!628173) b!932702))

(assert (= (and b!932702 res!628166) b!932691))

(assert (= (and b!932691 res!628167) b!932703))

(assert (= (and b!932703 res!628170) b!932695))

(assert (= (and b!932695 res!628169) b!932698))

(assert (= (and b!932694 condMapEmpty!31878) mapIsEmpty!31878))

(assert (= (and b!932694 (not condMapEmpty!31878)) mapNonEmpty!31878))

(get-info :version)

(assert (= (and mapNonEmpty!31878 ((_ is ValueCellFull!9558) mapValue!31878)) b!932692))

(assert (= (and b!932694 ((_ is ValueCellFull!9558) mapDefault!31878)) b!932699))

(assert (= start!79384 b!932694))

(declare-fun b_lambda!13905 () Bool)

(assert (=> (not b_lambda!13905) (not b!932698)))

(declare-fun t!27118 () Bool)

(declare-fun tb!5965 () Bool)

(assert (=> (and start!79384 (= defaultEntry!1235 defaultEntry!1235) t!27118) tb!5965))

(declare-fun result!11755 () Bool)

(assert (=> tb!5965 (= result!11755 tp_is_empty!20079)))

(assert (=> b!932698 t!27118))

(declare-fun b_and!28703 () Bool)

(assert (= b_and!28701 (and (=> t!27118 result!11755) b_and!28703)))

(declare-fun m!866695 () Bool)

(assert (=> b!932698 m!866695))

(declare-fun m!866697 () Bool)

(assert (=> b!932698 m!866697))

(declare-fun m!866699 () Bool)

(assert (=> b!932698 m!866699))

(declare-fun m!866701 () Bool)

(assert (=> b!932698 m!866701))

(declare-fun m!866703 () Bool)

(assert (=> b!932698 m!866703))

(assert (=> b!932698 m!866695))

(assert (=> b!932698 m!866701))

(assert (=> b!932698 m!866703))

(declare-fun m!866705 () Bool)

(assert (=> b!932698 m!866705))

(declare-fun m!866707 () Bool)

(assert (=> b!932698 m!866707))

(declare-fun m!866709 () Bool)

(assert (=> b!932698 m!866709))

(declare-fun m!866711 () Bool)

(assert (=> b!932698 m!866711))

(declare-fun m!866713 () Bool)

(assert (=> b!932698 m!866713))

(declare-fun m!866715 () Bool)

(assert (=> b!932698 m!866715))

(assert (=> b!932698 m!866709))

(declare-fun m!866717 () Bool)

(assert (=> b!932698 m!866717))

(declare-fun m!866719 () Bool)

(assert (=> start!79384 m!866719))

(declare-fun m!866721 () Bool)

(assert (=> start!79384 m!866721))

(declare-fun m!866723 () Bool)

(assert (=> start!79384 m!866723))

(declare-fun m!866725 () Bool)

(assert (=> b!932701 m!866725))

(declare-fun m!866727 () Bool)

(assert (=> b!932701 m!866727))

(declare-fun m!866729 () Bool)

(assert (=> b!932697 m!866729))

(declare-fun m!866731 () Bool)

(assert (=> b!932703 m!866731))

(declare-fun m!866733 () Bool)

(assert (=> mapNonEmpty!31878 m!866733))

(declare-fun m!866735 () Bool)

(assert (=> b!932695 m!866735))

(declare-fun m!866737 () Bool)

(assert (=> b!932695 m!866737))

(declare-fun m!866739 () Bool)

(assert (=> b!932702 m!866739))

(declare-fun m!866741 () Bool)

(assert (=> b!932700 m!866741))

(check-sat (not b!932695) b_and!28703 (not b_lambda!13905) (not b!932698) (not b!932701) (not b!932697) (not b_next!17571) (not mapNonEmpty!31878) (not b!932700) (not b!932703) tp_is_empty!20079 (not start!79384) (not b!932702))
(check-sat b_and!28703 (not b_next!17571))
