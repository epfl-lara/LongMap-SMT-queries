; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79160 () Bool)

(assert start!79160)

(declare-fun b_free!17373 () Bool)

(declare-fun b_next!17373 () Bool)

(assert (=> start!79160 (= b_free!17373 (not b_next!17373))))

(declare-fun tp!60560 () Bool)

(declare-fun b_and!28439 () Bool)

(assert (=> start!79160 (= tp!60560 b_and!28439)))

(declare-fun b!929187 () Bool)

(declare-fun e!521780 () Bool)

(assert (=> b!929187 (= e!521780 false)))

(declare-datatypes ((V!31473 0))(
  ( (V!31474 (val!9991 Int)) )
))
(declare-fun lt!419025 () V!31473)

(declare-datatypes ((tuple2!13062 0))(
  ( (tuple2!13063 (_1!6542 (_ BitVec 64)) (_2!6542 V!31473)) )
))
(declare-datatypes ((List!18855 0))(
  ( (Nil!18852) (Cons!18851 (h!19997 tuple2!13062) (t!26912 List!18855)) )
))
(declare-datatypes ((ListLongMap!11759 0))(
  ( (ListLongMap!11760 (toList!5895 List!18855)) )
))
(declare-fun lt!419026 () ListLongMap!11759)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun apply!721 (ListLongMap!11759 (_ BitVec 64)) V!31473)

(assert (=> b!929187 (= lt!419025 (apply!721 lt!419026 k0!1099))))

(declare-fun b!929188 () Bool)

(declare-fun e!521785 () Bool)

(declare-fun e!521784 () Bool)

(declare-fun mapRes!31578 () Bool)

(assert (=> b!929188 (= e!521785 (and e!521784 mapRes!31578))))

(declare-fun condMapEmpty!31578 () Bool)

(declare-datatypes ((ValueCell!9459 0))(
  ( (ValueCellFull!9459 (v!12509 V!31473)) (EmptyCell!9459) )
))
(declare-datatypes ((array!55716 0))(
  ( (array!55717 (arr!26803 (Array (_ BitVec 32) ValueCell!9459)) (size!27262 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55716)

(declare-fun mapDefault!31578 () ValueCell!9459)

(assert (=> b!929188 (= condMapEmpty!31578 (= (arr!26803 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9459)) mapDefault!31578)))))

(declare-fun mapIsEmpty!31578 () Bool)

(assert (=> mapIsEmpty!31578 mapRes!31578))

(declare-fun mapNonEmpty!31578 () Bool)

(declare-fun tp!60559 () Bool)

(declare-fun e!521783 () Bool)

(assert (=> mapNonEmpty!31578 (= mapRes!31578 (and tp!60559 e!521783))))

(declare-fun mapRest!31578 () (Array (_ BitVec 32) ValueCell!9459))

(declare-fun mapValue!31578 () ValueCell!9459)

(declare-fun mapKey!31578 () (_ BitVec 32))

(assert (=> mapNonEmpty!31578 (= (arr!26803 _values!1231) (store mapRest!31578 mapKey!31578 mapValue!31578))))

(declare-fun b!929189 () Bool)

(declare-fun res!625708 () Bool)

(declare-fun e!521782 () Bool)

(assert (=> b!929189 (=> (not res!625708) (not e!521782))))

(declare-datatypes ((array!55718 0))(
  ( (array!55719 (arr!26804 (Array (_ BitVec 32) (_ BitVec 64))) (size!27263 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55718)

(declare-datatypes ((List!18856 0))(
  ( (Nil!18853) (Cons!18852 (h!19998 (_ BitVec 64)) (t!26913 List!18856)) )
))
(declare-fun arrayNoDuplicates!0 (array!55718 (_ BitVec 32) List!18856) Bool)

(assert (=> b!929189 (= res!625708 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18853))))

(declare-fun b!929190 () Bool)

(assert (=> b!929190 (= e!521782 e!521780)))

(declare-fun res!625705 () Bool)

(assert (=> b!929190 (=> (not res!625705) (not e!521780))))

(declare-fun contains!4949 (ListLongMap!11759 (_ BitVec 64)) Bool)

(assert (=> b!929190 (= res!625705 (contains!4949 lt!419026 k0!1099))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31473)

(declare-fun minValue!1173 () V!31473)

(declare-fun getCurrentListMap!3140 (array!55718 array!55716 (_ BitVec 32) (_ BitVec 32) V!31473 V!31473 (_ BitVec 32) Int) ListLongMap!11759)

(assert (=> b!929190 (= lt!419026 (getCurrentListMap!3140 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929191 () Bool)

(declare-fun res!625704 () Bool)

(assert (=> b!929191 (=> (not res!625704) (not e!521782))))

(assert (=> b!929191 (= res!625704 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27263 _keys!1487))))))

(declare-fun b!929193 () Bool)

(declare-fun tp_is_empty!19881 () Bool)

(assert (=> b!929193 (= e!521783 tp_is_empty!19881)))

(declare-fun b!929194 () Bool)

(declare-fun res!625706 () Bool)

(assert (=> b!929194 (=> (not res!625706) (not e!521782))))

(assert (=> b!929194 (= res!625706 (and (= (size!27262 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27263 _keys!1487) (size!27262 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929195 () Bool)

(assert (=> b!929195 (= e!521784 tp_is_empty!19881)))

(declare-fun b!929192 () Bool)

(declare-fun res!625707 () Bool)

(assert (=> b!929192 (=> (not res!625707) (not e!521782))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55718 (_ BitVec 32)) Bool)

(assert (=> b!929192 (= res!625707 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun res!625703 () Bool)

(assert (=> start!79160 (=> (not res!625703) (not e!521782))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79160 (= res!625703 (validMask!0 mask!1881))))

(assert (=> start!79160 e!521782))

(assert (=> start!79160 true))

(declare-fun array_inv!20860 (array!55716) Bool)

(assert (=> start!79160 (and (array_inv!20860 _values!1231) e!521785)))

(assert (=> start!79160 tp!60560))

(declare-fun array_inv!20861 (array!55718) Bool)

(assert (=> start!79160 (array_inv!20861 _keys!1487)))

(assert (=> start!79160 tp_is_empty!19881))

(assert (= (and start!79160 res!625703) b!929194))

(assert (= (and b!929194 res!625706) b!929192))

(assert (= (and b!929192 res!625707) b!929189))

(assert (= (and b!929189 res!625708) b!929191))

(assert (= (and b!929191 res!625704) b!929190))

(assert (= (and b!929190 res!625705) b!929187))

(assert (= (and b!929188 condMapEmpty!31578) mapIsEmpty!31578))

(assert (= (and b!929188 (not condMapEmpty!31578)) mapNonEmpty!31578))

(get-info :version)

(assert (= (and mapNonEmpty!31578 ((_ is ValueCellFull!9459) mapValue!31578)) b!929193))

(assert (= (and b!929188 ((_ is ValueCellFull!9459) mapDefault!31578)) b!929195))

(assert (= start!79160 b!929188))

(declare-fun m!863841 () Bool)

(assert (=> b!929189 m!863841))

(declare-fun m!863843 () Bool)

(assert (=> b!929187 m!863843))

(declare-fun m!863845 () Bool)

(assert (=> b!929192 m!863845))

(declare-fun m!863847 () Bool)

(assert (=> b!929190 m!863847))

(declare-fun m!863849 () Bool)

(assert (=> b!929190 m!863849))

(declare-fun m!863851 () Bool)

(assert (=> start!79160 m!863851))

(declare-fun m!863853 () Bool)

(assert (=> start!79160 m!863853))

(declare-fun m!863855 () Bool)

(assert (=> start!79160 m!863855))

(declare-fun m!863857 () Bool)

(assert (=> mapNonEmpty!31578 m!863857))

(check-sat b_and!28439 (not b_next!17373) (not mapNonEmpty!31578) (not start!79160) (not b!929189) (not b!929190) (not b!929192) tp_is_empty!19881 (not b!929187))
(check-sat b_and!28439 (not b_next!17373))
