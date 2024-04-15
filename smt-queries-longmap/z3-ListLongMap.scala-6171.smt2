; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79116 () Bool)

(assert start!79116)

(declare-fun b_free!17347 () Bool)

(declare-fun b_next!17347 () Bool)

(assert (=> start!79116 (= b_free!17347 (not b_next!17347))))

(declare-fun tp!60483 () Bool)

(declare-fun b_and!28387 () Bool)

(assert (=> start!79116 (= tp!60483 b_and!28387)))

(declare-fun mapIsEmpty!31539 () Bool)

(declare-fun mapRes!31539 () Bool)

(assert (=> mapIsEmpty!31539 mapRes!31539))

(declare-fun b!928597 () Bool)

(declare-fun e!521403 () Bool)

(declare-fun e!521399 () Bool)

(assert (=> b!928597 (= e!521403 e!521399)))

(declare-fun res!625359 () Bool)

(assert (=> b!928597 (=> (not res!625359) (not e!521399))))

(declare-datatypes ((V!31439 0))(
  ( (V!31440 (val!9978 Int)) )
))
(declare-datatypes ((tuple2!13092 0))(
  ( (tuple2!13093 (_1!6557 (_ BitVec 64)) (_2!6557 V!31439)) )
))
(declare-datatypes ((List!18860 0))(
  ( (Nil!18857) (Cons!18856 (h!20002 tuple2!13092) (t!26908 List!18860)) )
))
(declare-datatypes ((ListLongMap!11779 0))(
  ( (ListLongMap!11780 (toList!5905 List!18860)) )
))
(declare-fun lt!418711 () ListLongMap!11779)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4915 (ListLongMap!11779 (_ BitVec 64)) Bool)

(assert (=> b!928597 (= res!625359 (contains!4915 lt!418711 k0!1099))))

(declare-datatypes ((array!55637 0))(
  ( (array!55638 (arr!26764 (Array (_ BitVec 32) (_ BitVec 64))) (size!27225 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55637)

(declare-fun from!1844 () (_ BitVec 32))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9446 0))(
  ( (ValueCellFull!9446 (v!12495 V!31439)) (EmptyCell!9446) )
))
(declare-datatypes ((array!55639 0))(
  ( (array!55640 (arr!26765 (Array (_ BitVec 32) ValueCell!9446)) (size!27226 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55639)

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31439)

(declare-fun minValue!1173 () V!31439)

(declare-fun getCurrentListMap!3089 (array!55637 array!55639 (_ BitVec 32) (_ BitVec 32) V!31439 V!31439 (_ BitVec 32) Int) ListLongMap!11779)

(assert (=> b!928597 (= lt!418711 (getCurrentListMap!3089 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928598 () Bool)

(declare-fun res!625364 () Bool)

(assert (=> b!928598 (=> (not res!625364) (not e!521403))))

(declare-datatypes ((List!18861 0))(
  ( (Nil!18858) (Cons!18857 (h!20003 (_ BitVec 64)) (t!26909 List!18861)) )
))
(declare-fun arrayNoDuplicates!0 (array!55637 (_ BitVec 32) List!18861) Bool)

(assert (=> b!928598 (= res!625364 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18858))))

(declare-fun b!928599 () Bool)

(declare-fun res!625362 () Bool)

(assert (=> b!928599 (=> (not res!625362) (not e!521403))))

(assert (=> b!928599 (= res!625362 (and (= (size!27226 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27225 _keys!1487) (size!27226 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928600 () Bool)

(assert (=> b!928600 (= e!521399 false)))

(declare-fun lt!418712 () V!31439)

(declare-fun apply!713 (ListLongMap!11779 (_ BitVec 64)) V!31439)

(assert (=> b!928600 (= lt!418712 (apply!713 lt!418711 k0!1099))))

(declare-fun b!928601 () Bool)

(declare-fun e!521401 () Bool)

(declare-fun tp_is_empty!19855 () Bool)

(assert (=> b!928601 (= e!521401 tp_is_empty!19855)))

(declare-fun res!625363 () Bool)

(assert (=> start!79116 (=> (not res!625363) (not e!521403))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79116 (= res!625363 (validMask!0 mask!1881))))

(assert (=> start!79116 e!521403))

(assert (=> start!79116 true))

(declare-fun e!521398 () Bool)

(declare-fun array_inv!20926 (array!55639) Bool)

(assert (=> start!79116 (and (array_inv!20926 _values!1231) e!521398)))

(assert (=> start!79116 tp!60483))

(declare-fun array_inv!20927 (array!55637) Bool)

(assert (=> start!79116 (array_inv!20927 _keys!1487)))

(assert (=> start!79116 tp_is_empty!19855))

(declare-fun b!928602 () Bool)

(assert (=> b!928602 (= e!521398 (and e!521401 mapRes!31539))))

(declare-fun condMapEmpty!31539 () Bool)

(declare-fun mapDefault!31539 () ValueCell!9446)

(assert (=> b!928602 (= condMapEmpty!31539 (= (arr!26765 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9446)) mapDefault!31539)))))

(declare-fun mapNonEmpty!31539 () Bool)

(declare-fun tp!60482 () Bool)

(declare-fun e!521402 () Bool)

(assert (=> mapNonEmpty!31539 (= mapRes!31539 (and tp!60482 e!521402))))

(declare-fun mapValue!31539 () ValueCell!9446)

(declare-fun mapRest!31539 () (Array (_ BitVec 32) ValueCell!9446))

(declare-fun mapKey!31539 () (_ BitVec 32))

(assert (=> mapNonEmpty!31539 (= (arr!26765 _values!1231) (store mapRest!31539 mapKey!31539 mapValue!31539))))

(declare-fun b!928603 () Bool)

(declare-fun res!625360 () Bool)

(assert (=> b!928603 (=> (not res!625360) (not e!521403))))

(assert (=> b!928603 (= res!625360 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27225 _keys!1487))))))

(declare-fun b!928604 () Bool)

(assert (=> b!928604 (= e!521402 tp_is_empty!19855)))

(declare-fun b!928605 () Bool)

(declare-fun res!625361 () Bool)

(assert (=> b!928605 (=> (not res!625361) (not e!521403))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55637 (_ BitVec 32)) Bool)

(assert (=> b!928605 (= res!625361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(assert (= (and start!79116 res!625363) b!928599))

(assert (= (and b!928599 res!625362) b!928605))

(assert (= (and b!928605 res!625361) b!928598))

(assert (= (and b!928598 res!625364) b!928603))

(assert (= (and b!928603 res!625360) b!928597))

(assert (= (and b!928597 res!625359) b!928600))

(assert (= (and b!928602 condMapEmpty!31539) mapIsEmpty!31539))

(assert (= (and b!928602 (not condMapEmpty!31539)) mapNonEmpty!31539))

(get-info :version)

(assert (= (and mapNonEmpty!31539 ((_ is ValueCellFull!9446) mapValue!31539)) b!928604))

(assert (= (and b!928602 ((_ is ValueCellFull!9446) mapDefault!31539)) b!928601))

(assert (= start!79116 b!928602))

(declare-fun m!862849 () Bool)

(assert (=> b!928597 m!862849))

(declare-fun m!862851 () Bool)

(assert (=> b!928597 m!862851))

(declare-fun m!862853 () Bool)

(assert (=> start!79116 m!862853))

(declare-fun m!862855 () Bool)

(assert (=> start!79116 m!862855))

(declare-fun m!862857 () Bool)

(assert (=> start!79116 m!862857))

(declare-fun m!862859 () Bool)

(assert (=> b!928600 m!862859))

(declare-fun m!862861 () Bool)

(assert (=> b!928598 m!862861))

(declare-fun m!862863 () Bool)

(assert (=> b!928605 m!862863))

(declare-fun m!862865 () Bool)

(assert (=> mapNonEmpty!31539 m!862865))

(check-sat tp_is_empty!19855 b_and!28387 (not b!928600) (not b!928598) (not b!928597) (not b_next!17347) (not mapNonEmpty!31539) (not start!79116) (not b!928605))
(check-sat b_and!28387 (not b_next!17347))
