; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79254 () Bool)

(assert start!79254)

(declare-fun b_free!17299 () Bool)

(declare-fun b_next!17299 () Bool)

(assert (=> start!79254 (= b_free!17299 (not b_next!17299))))

(declare-fun tp!60339 () Bool)

(declare-fun b_and!28345 () Bool)

(assert (=> start!79254 (= tp!60339 b_and!28345)))

(declare-fun b!928588 () Bool)

(declare-fun e!521403 () Bool)

(assert (=> b!928588 (= e!521403 (not true))))

(declare-fun e!521395 () Bool)

(assert (=> b!928588 e!521395))

(declare-fun res!625171 () Bool)

(assert (=> b!928588 (=> (not res!625171) (not e!521395))))

(declare-datatypes ((V!31375 0))(
  ( (V!31376 (val!9954 Int)) )
))
(declare-datatypes ((tuple2!12986 0))(
  ( (tuple2!12987 (_1!6504 (_ BitVec 64)) (_2!6504 V!31375)) )
))
(declare-datatypes ((List!18793 0))(
  ( (Nil!18790) (Cons!18789 (h!19941 tuple2!12986) (t!26814 List!18793)) )
))
(declare-datatypes ((ListLongMap!11685 0))(
  ( (ListLongMap!11686 (toList!5858 List!18793)) )
))
(declare-fun lt!418564 () ListLongMap!11685)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4930 (ListLongMap!11685 (_ BitVec 64)) Bool)

(assert (=> b!928588 (= res!625171 (contains!4930 lt!418564 k0!1099))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9422 0))(
  ( (ValueCellFull!9422 (v!12469 V!31375)) (EmptyCell!9422) )
))
(declare-datatypes ((array!55629 0))(
  ( (array!55630 (arr!26755 (Array (_ BitVec 32) ValueCell!9422)) (size!27215 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55629)

(declare-fun defaultEntry!1235 () Int)

(declare-datatypes ((array!55631 0))(
  ( (array!55632 (arr!26756 (Array (_ BitVec 32) (_ BitVec 64))) (size!27216 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55631)

(declare-fun zeroValue!1173 () V!31375)

(declare-fun minValue!1173 () V!31375)

(declare-fun getCurrentListMap!3108 (array!55631 array!55629 (_ BitVec 32) (_ BitVec 32) V!31375 V!31375 (_ BitVec 32) Int) ListLongMap!11685)

(assert (=> b!928588 (= lt!418564 (getCurrentListMap!3108 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun v!791 () V!31375)

(declare-datatypes ((Unit!31374 0))(
  ( (Unit!31375) )
))
(declare-fun lt!418563 () Unit!31374)

(declare-fun lemmaListMapApplyFromThenApplyFromZero!97 (array!55631 array!55629 (_ BitVec 32) (_ BitVec 32) V!31375 V!31375 (_ BitVec 64) V!31375 (_ BitVec 32) Int) Unit!31374)

(assert (=> b!928588 (= lt!418563 (lemmaListMapApplyFromThenApplyFromZero!97 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 v!791 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun e!521404 () Bool)

(declare-fun b!928590 () Bool)

(declare-fun arrayContainsKey!0 (array!55631 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!928590 (= e!521404 (arrayContainsKey!0 _keys!1487 k0!1099 from!1844))))

(declare-fun b!928591 () Bool)

(declare-fun e!521398 () Bool)

(declare-fun e!521406 () Bool)

(assert (=> b!928591 (= e!521398 e!521406)))

(declare-fun res!625175 () Bool)

(assert (=> b!928591 (=> (not res!625175) (not e!521406))))

(declare-fun lt!418566 () V!31375)

(assert (=> b!928591 (= res!625175 (and (= lt!418566 v!791) (bvsgt from!1844 #b00000000000000000000000000000000)))))

(declare-fun lt!418572 () ListLongMap!11685)

(declare-fun apply!708 (ListLongMap!11685 (_ BitVec 64)) V!31375)

(assert (=> b!928591 (= lt!418566 (apply!708 lt!418572 k0!1099))))

(declare-fun b!928592 () Bool)

(declare-fun e!521399 () Bool)

(declare-fun e!521407 () Bool)

(declare-fun mapRes!31467 () Bool)

(assert (=> b!928592 (= e!521399 (and e!521407 mapRes!31467))))

(declare-fun condMapEmpty!31467 () Bool)

(declare-fun mapDefault!31467 () ValueCell!9422)

(assert (=> b!928592 (= condMapEmpty!31467 (= (arr!26755 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9422)) mapDefault!31467)))))

(declare-fun b!928593 () Bool)

(declare-fun res!625170 () Bool)

(declare-fun e!521397 () Bool)

(assert (=> b!928593 (=> (not res!625170) (not e!521397))))

(declare-datatypes ((List!18794 0))(
  ( (Nil!18791) (Cons!18790 (h!19942 (_ BitVec 64)) (t!26815 List!18794)) )
))
(declare-fun arrayNoDuplicates!0 (array!55631 (_ BitVec 32) List!18794) Bool)

(assert (=> b!928593 (= res!625170 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18791))))

(declare-fun mapIsEmpty!31467 () Bool)

(assert (=> mapIsEmpty!31467 mapRes!31467))

(declare-fun b!928594 () Bool)

(declare-fun e!521400 () Unit!31374)

(declare-fun e!521396 () Unit!31374)

(assert (=> b!928594 (= e!521400 e!521396)))

(declare-fun lt!418562 () (_ BitVec 64))

(assert (=> b!928594 (= lt!418562 (select (arr!26756 _keys!1487) (bvsub from!1844 #b00000000000000000000000000000001)))))

(declare-fun c!97187 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!928594 (= c!97187 (validKeyInArray!0 lt!418562))))

(declare-fun b!928595 () Bool)

(declare-fun res!625167 () Bool)

(assert (=> b!928595 (=> (not res!625167) (not e!521397))))

(assert (=> b!928595 (= res!625167 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27216 _keys!1487))))))

(declare-fun mapNonEmpty!31467 () Bool)

(declare-fun tp!60338 () Bool)

(declare-fun e!521405 () Bool)

(assert (=> mapNonEmpty!31467 (= mapRes!31467 (and tp!60338 e!521405))))

(declare-fun mapValue!31467 () ValueCell!9422)

(declare-fun mapRest!31467 () (Array (_ BitVec 32) ValueCell!9422))

(declare-fun mapKey!31467 () (_ BitVec 32))

(assert (=> mapNonEmpty!31467 (= (arr!26755 _values!1231) (store mapRest!31467 mapKey!31467 mapValue!31467))))

(declare-fun b!928589 () Bool)

(declare-fun Unit!31376 () Unit!31374)

(assert (=> b!928589 (= e!521400 Unit!31376)))

(declare-fun res!625173 () Bool)

(assert (=> start!79254 (=> (not res!625173) (not e!521397))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79254 (= res!625173 (validMask!0 mask!1881))))

(assert (=> start!79254 e!521397))

(assert (=> start!79254 true))

(declare-fun tp_is_empty!19807 () Bool)

(assert (=> start!79254 tp_is_empty!19807))

(declare-fun array_inv!20934 (array!55629) Bool)

(assert (=> start!79254 (and (array_inv!20934 _values!1231) e!521399)))

(assert (=> start!79254 tp!60339))

(declare-fun array_inv!20935 (array!55631) Bool)

(assert (=> start!79254 (array_inv!20935 _keys!1487)))

(declare-fun b!928596 () Bool)

(declare-fun res!625174 () Bool)

(assert (=> b!928596 (=> (not res!625174) (not e!521403))))

(declare-fun lt!418577 () ListLongMap!11685)

(assert (=> b!928596 (= res!625174 (= (apply!708 lt!418577 k0!1099) v!791))))

(declare-fun b!928597 () Bool)

(assert (=> b!928597 (= e!521397 e!521398)))

(declare-fun res!625172 () Bool)

(assert (=> b!928597 (=> (not res!625172) (not e!521398))))

(assert (=> b!928597 (= res!625172 (contains!4930 lt!418572 k0!1099))))

(assert (=> b!928597 (= lt!418572 (getCurrentListMap!3108 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928598 () Bool)

(declare-fun e!521401 () Bool)

(assert (=> b!928598 (= e!521406 e!521401)))

(declare-fun res!625176 () Bool)

(assert (=> b!928598 (=> (not res!625176) (not e!521401))))

(assert (=> b!928598 (= res!625176 (bvslt (bvsub from!1844 #b00000000000000000000000000000001) (size!27216 _keys!1487)))))

(declare-fun lt!418573 () Unit!31374)

(assert (=> b!928598 (= lt!418573 e!521400)))

(declare-fun c!97188 () Bool)

(assert (=> b!928598 (= c!97188 (validKeyInArray!0 k0!1099))))

(declare-fun b!928599 () Bool)

(declare-fun res!625166 () Bool)

(assert (=> b!928599 (=> (not res!625166) (not e!521397))))

(assert (=> b!928599 (= res!625166 (and (= (size!27215 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27216 _keys!1487) (size!27215 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928600 () Bool)

(assert (=> b!928600 (= e!521405 tp_is_empty!19807)))

(declare-fun b!928601 () Bool)

(declare-fun res!625168 () Bool)

(assert (=> b!928601 (=> (not res!625168) (not e!521397))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55631 (_ BitVec 32)) Bool)

(assert (=> b!928601 (= res!625168 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928602 () Bool)

(assert (=> b!928602 (= e!521407 tp_is_empty!19807)))

(declare-fun b!928603 () Bool)

(assert (=> b!928603 (= e!521401 e!521403)))

(declare-fun res!625169 () Bool)

(assert (=> b!928603 (=> (not res!625169) (not e!521403))))

(assert (=> b!928603 (= res!625169 (contains!4930 lt!418577 k0!1099))))

(assert (=> b!928603 (= lt!418577 (getCurrentListMap!3108 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(declare-fun b!928604 () Bool)

(assert (=> b!928604 (= e!521404 (ite (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1152 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!928605 () Bool)

(declare-fun lt!418565 () ListLongMap!11685)

(assert (=> b!928605 (= (apply!708 lt!418565 k0!1099) lt!418566)))

(declare-fun lt!418567 () V!31375)

(declare-fun lt!418574 () Unit!31374)

(declare-fun addApplyDifferent!404 (ListLongMap!11685 (_ BitVec 64) V!31375 (_ BitVec 64)) Unit!31374)

(assert (=> b!928605 (= lt!418574 (addApplyDifferent!404 lt!418572 lt!418562 lt!418567 k0!1099))))

(assert (=> b!928605 (not (= lt!418562 k0!1099))))

(declare-fun lt!418569 () Unit!31374)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!55631 (_ BitVec 64) (_ BitVec 32) List!18794) Unit!31374)

(assert (=> b!928605 (= lt!418569 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1487 k0!1099 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18791))))

(assert (=> b!928605 e!521404))

(declare-fun c!97186 () Bool)

(assert (=> b!928605 (= c!97186 (and (not (= k0!1099 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1099 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!418575 () Unit!31374)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!259 (array!55631 array!55629 (_ BitVec 32) (_ BitVec 32) V!31375 V!31375 (_ BitVec 64) (_ BitVec 32) Int) Unit!31374)

(assert (=> b!928605 (= lt!418575 (lemmaListMapContainsThenArrayContainsFrom!259 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 k0!1099 from!1844 defaultEntry!1235))))

(assert (=> b!928605 (arrayNoDuplicates!0 _keys!1487 (bvsub from!1844 #b00000000000000000000000000000001) Nil!18791)))

(declare-fun lt!418568 () Unit!31374)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!55631 (_ BitVec 32) (_ BitVec 32)) Unit!31374)

(assert (=> b!928605 (= lt!418568 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1487 #b00000000000000000000000000000000 (bvsub from!1844 #b00000000000000000000000000000001)))))

(assert (=> b!928605 (contains!4930 lt!418565 k0!1099)))

(declare-fun lt!418576 () tuple2!12986)

(declare-fun +!2768 (ListLongMap!11685 tuple2!12986) ListLongMap!11685)

(assert (=> b!928605 (= lt!418565 (+!2768 lt!418572 lt!418576))))

(declare-fun lt!418571 () Unit!31374)

(declare-fun addStillContains!477 (ListLongMap!11685 (_ BitVec 64) V!31375 (_ BitVec 64)) Unit!31374)

(assert (=> b!928605 (= lt!418571 (addStillContains!477 lt!418572 lt!418562 lt!418567 k0!1099))))

(assert (=> b!928605 (= (getCurrentListMap!3108 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235) (+!2768 (getCurrentListMap!3108 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvadd #b00000000000000000000000000000001 (bvsub from!1844 #b00000000000000000000000000000001)) defaultEntry!1235) lt!418576))))

(assert (=> b!928605 (= lt!418576 (tuple2!12987 lt!418562 lt!418567))))

(declare-fun get!14103 (ValueCell!9422 V!31375) V!31375)

(declare-fun dynLambda!1565 (Int (_ BitVec 64)) V!31375)

(assert (=> b!928605 (= lt!418567 (get!14103 (select (arr!26755 _values!1231) (bvsub from!1844 #b00000000000000000000000000000001)) (dynLambda!1565 defaultEntry!1235 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!418570 () Unit!31374)

(declare-fun lemmaListMapRecursiveValidKeyArray!148 (array!55631 array!55629 (_ BitVec 32) (_ BitVec 32) V!31375 V!31375 (_ BitVec 32) Int) Unit!31374)

(assert (=> b!928605 (= lt!418570 (lemmaListMapRecursiveValidKeyArray!148 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 (bvsub from!1844 #b00000000000000000000000000000001) defaultEntry!1235))))

(assert (=> b!928605 (= e!521396 lt!418574)))

(declare-fun b!928606 () Bool)

(declare-fun Unit!31377 () Unit!31374)

(assert (=> b!928606 (= e!521396 Unit!31377)))

(declare-fun b!928607 () Bool)

(assert (=> b!928607 (= e!521395 (= (apply!708 lt!418564 k0!1099) v!791))))

(assert (= (and start!79254 res!625173) b!928599))

(assert (= (and b!928599 res!625166) b!928601))

(assert (= (and b!928601 res!625168) b!928593))

(assert (= (and b!928593 res!625170) b!928595))

(assert (= (and b!928595 res!625167) b!928597))

(assert (= (and b!928597 res!625172) b!928591))

(assert (= (and b!928591 res!625175) b!928598))

(assert (= (and b!928598 c!97188) b!928594))

(assert (= (and b!928598 (not c!97188)) b!928589))

(assert (= (and b!928594 c!97187) b!928605))

(assert (= (and b!928594 (not c!97187)) b!928606))

(assert (= (and b!928605 c!97186) b!928590))

(assert (= (and b!928605 (not c!97186)) b!928604))

(assert (= (and b!928598 res!625176) b!928603))

(assert (= (and b!928603 res!625169) b!928596))

(assert (= (and b!928596 res!625174) b!928588))

(assert (= (and b!928588 res!625171) b!928607))

(assert (= (and b!928592 condMapEmpty!31467) mapIsEmpty!31467))

(assert (= (and b!928592 (not condMapEmpty!31467)) mapNonEmpty!31467))

(get-info :version)

(assert (= (and mapNonEmpty!31467 ((_ is ValueCellFull!9422) mapValue!31467)) b!928600))

(assert (= (and b!928592 ((_ is ValueCellFull!9422) mapDefault!31467)) b!928602))

(assert (= start!79254 b!928592))

(declare-fun b_lambda!13815 () Bool)

(assert (=> (not b_lambda!13815) (not b!928605)))

(declare-fun t!26813 () Bool)

(declare-fun tb!5871 () Bool)

(assert (=> (and start!79254 (= defaultEntry!1235 defaultEntry!1235) t!26813) tb!5871))

(declare-fun result!11573 () Bool)

(assert (=> tb!5871 (= result!11573 tp_is_empty!19807)))

(assert (=> b!928605 t!26813))

(declare-fun b_and!28347 () Bool)

(assert (= b_and!28345 (and (=> t!26813 result!11573) b_and!28347)))

(declare-fun m!863689 () Bool)

(assert (=> b!928588 m!863689))

(declare-fun m!863691 () Bool)

(assert (=> b!928588 m!863691))

(declare-fun m!863693 () Bool)

(assert (=> b!928588 m!863693))

(declare-fun m!863695 () Bool)

(assert (=> b!928594 m!863695))

(declare-fun m!863697 () Bool)

(assert (=> b!928594 m!863697))

(declare-fun m!863699 () Bool)

(assert (=> b!928605 m!863699))

(declare-fun m!863701 () Bool)

(assert (=> b!928605 m!863701))

(declare-fun m!863703 () Bool)

(assert (=> b!928605 m!863703))

(declare-fun m!863705 () Bool)

(assert (=> b!928605 m!863705))

(declare-fun m!863707 () Bool)

(assert (=> b!928605 m!863707))

(declare-fun m!863709 () Bool)

(assert (=> b!928605 m!863709))

(assert (=> b!928605 m!863703))

(assert (=> b!928605 m!863705))

(declare-fun m!863711 () Bool)

(assert (=> b!928605 m!863711))

(declare-fun m!863713 () Bool)

(assert (=> b!928605 m!863713))

(declare-fun m!863715 () Bool)

(assert (=> b!928605 m!863715))

(declare-fun m!863717 () Bool)

(assert (=> b!928605 m!863717))

(declare-fun m!863719 () Bool)

(assert (=> b!928605 m!863719))

(declare-fun m!863721 () Bool)

(assert (=> b!928605 m!863721))

(declare-fun m!863723 () Bool)

(assert (=> b!928605 m!863723))

(declare-fun m!863725 () Bool)

(assert (=> b!928605 m!863725))

(declare-fun m!863727 () Bool)

(assert (=> b!928605 m!863727))

(assert (=> b!928605 m!863723))

(declare-fun m!863729 () Bool)

(assert (=> b!928605 m!863729))

(declare-fun m!863731 () Bool)

(assert (=> start!79254 m!863731))

(declare-fun m!863733 () Bool)

(assert (=> start!79254 m!863733))

(declare-fun m!863735 () Bool)

(assert (=> start!79254 m!863735))

(declare-fun m!863737 () Bool)

(assert (=> b!928598 m!863737))

(declare-fun m!863739 () Bool)

(assert (=> b!928591 m!863739))

(declare-fun m!863741 () Bool)

(assert (=> b!928601 m!863741))

(declare-fun m!863743 () Bool)

(assert (=> b!928607 m!863743))

(declare-fun m!863745 () Bool)

(assert (=> b!928597 m!863745))

(declare-fun m!863747 () Bool)

(assert (=> b!928597 m!863747))

(declare-fun m!863749 () Bool)

(assert (=> mapNonEmpty!31467 m!863749))

(declare-fun m!863751 () Bool)

(assert (=> b!928603 m!863751))

(assert (=> b!928603 m!863713))

(declare-fun m!863753 () Bool)

(assert (=> b!928590 m!863753))

(declare-fun m!863755 () Bool)

(assert (=> b!928593 m!863755))

(declare-fun m!863757 () Bool)

(assert (=> b!928596 m!863757))

(check-sat (not start!79254) (not b!928594) (not b!928588) (not b!928601) (not b_next!17299) (not b!928596) (not b!928590) (not b!928605) (not mapNonEmpty!31467) (not b!928607) (not b!928598) b_and!28347 (not b!928603) (not b_lambda!13815) (not b!928597) tp_is_empty!19807 (not b!928593) (not b!928591))
(check-sat b_and!28347 (not b_next!17299))
