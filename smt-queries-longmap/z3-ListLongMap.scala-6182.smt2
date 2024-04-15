; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79182 () Bool)

(assert start!79182)

(declare-fun b_free!17413 () Bool)

(declare-fun b_next!17413 () Bool)

(assert (=> start!79182 (= b_free!17413 (not b_next!17413))))

(declare-fun tp!60680 () Bool)

(declare-fun b_and!28453 () Bool)

(assert (=> start!79182 (= tp!60680 b_and!28453)))

(declare-fun res!626061 () Bool)

(declare-fun e!521994 () Bool)

(assert (=> start!79182 (=> (not res!626061) (not e!521994))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79182 (= res!626061 (validMask!0 mask!1881))))

(assert (=> start!79182 e!521994))

(assert (=> start!79182 true))

(declare-fun tp_is_empty!19921 () Bool)

(assert (=> start!79182 tp_is_empty!19921))

(declare-datatypes ((V!31527 0))(
  ( (V!31528 (val!10011 Int)) )
))
(declare-datatypes ((ValueCell!9479 0))(
  ( (ValueCellFull!9479 (v!12528 V!31527)) (EmptyCell!9479) )
))
(declare-datatypes ((array!55759 0))(
  ( (array!55760 (arr!26825 (Array (_ BitVec 32) ValueCell!9479)) (size!27286 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55759)

(declare-fun e!521993 () Bool)

(declare-fun array_inv!20960 (array!55759) Bool)

(assert (=> start!79182 (and (array_inv!20960 _values!1231) e!521993)))

(assert (=> start!79182 tp!60680))

(declare-datatypes ((array!55761 0))(
  ( (array!55762 (arr!26826 (Array (_ BitVec 32) (_ BitVec 64))) (size!27287 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55761)

(declare-fun array_inv!20961 (array!55761) Bool)

(assert (=> start!79182 (array_inv!20961 _keys!1487)))

(declare-fun b!929591 () Bool)

(declare-fun res!626060 () Bool)

(declare-fun e!521996 () Bool)

(assert (=> b!929591 (=> (not res!626060) (not e!521996))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!929591 (= res!626060 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!929592 () Bool)

(declare-fun res!626063 () Bool)

(assert (=> b!929592 (=> (not res!626063) (not e!521994))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55761 (_ BitVec 32)) Bool)

(assert (=> b!929592 (= res!626063 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!31638 () Bool)

(declare-fun mapRes!31638 () Bool)

(declare-fun tp!60681 () Bool)

(declare-fun e!521992 () Bool)

(assert (=> mapNonEmpty!31638 (= mapRes!31638 (and tp!60681 e!521992))))

(declare-fun mapRest!31638 () (Array (_ BitVec 32) ValueCell!9479))

(declare-fun mapKey!31638 () (_ BitVec 32))

(declare-fun mapValue!31638 () ValueCell!9479)

(assert (=> mapNonEmpty!31638 (= (arr!26825 _values!1231) (store mapRest!31638 mapKey!31638 mapValue!31638))))

(declare-fun b!929593 () Bool)

(assert (=> b!929593 (= e!521992 tp_is_empty!19921)))

(declare-fun b!929594 () Bool)

(declare-fun e!521995 () Bool)

(assert (=> b!929594 (= e!521995 tp_is_empty!19921)))

(declare-fun mapIsEmpty!31638 () Bool)

(assert (=> mapIsEmpty!31638 mapRes!31638))

(declare-fun b!929595 () Bool)

(assert (=> b!929595 (= e!521996 false)))

(declare-fun lt!418901 () Bool)

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun zeroValue!1173 () V!31527)

(declare-fun minValue!1173 () V!31527)

(declare-datatypes ((tuple2!13142 0))(
  ( (tuple2!13143 (_1!6582 (_ BitVec 64)) (_2!6582 V!31527)) )
))
(declare-datatypes ((List!18904 0))(
  ( (Nil!18901) (Cons!18900 (h!20046 tuple2!13142) (t!26952 List!18904)) )
))
(declare-datatypes ((ListLongMap!11829 0))(
  ( (ListLongMap!11830 (toList!5930 List!18904)) )
))
(declare-fun contains!4936 (ListLongMap!11829 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3110 (array!55761 array!55759 (_ BitVec 32) (_ BitVec 32) V!31527 V!31527 (_ BitVec 32) Int) ListLongMap!11829)

(assert (=> b!929595 (= lt!418901 (contains!4936 (getCurrentListMap!3110 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235) k0!1099))))

(declare-fun b!929596 () Bool)

(declare-fun res!626057 () Bool)

(assert (=> b!929596 (=> (not res!626057) (not e!521994))))

(assert (=> b!929596 (= res!626057 (and (= (size!27286 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27287 _keys!1487) (size!27286 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!929597 () Bool)

(declare-fun res!626062 () Bool)

(assert (=> b!929597 (=> (not res!626062) (not e!521996))))

(declare-fun v!791 () V!31527)

(declare-fun lt!418900 () ListLongMap!11829)

(declare-fun apply!734 (ListLongMap!11829 (_ BitVec 64)) V!31527)

(assert (=> b!929597 (= res!626062 (= (apply!734 lt!418900 k0!1099) v!791))))

(declare-fun b!929598 () Bool)

(declare-fun res!626058 () Bool)

(assert (=> b!929598 (=> (not res!626058) (not e!521994))))

(assert (=> b!929598 (= res!626058 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27287 _keys!1487))))))

(declare-fun b!929599 () Bool)

(assert (=> b!929599 (= e!521994 e!521996)))

(declare-fun res!626059 () Bool)

(assert (=> b!929599 (=> (not res!626059) (not e!521996))))

(assert (=> b!929599 (= res!626059 (contains!4936 lt!418900 k0!1099))))

(assert (=> b!929599 (= lt!418900 (getCurrentListMap!3110 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!929600 () Bool)

(declare-fun res!626056 () Bool)

(assert (=> b!929600 (=> (not res!626056) (not e!521994))))

(declare-datatypes ((List!18905 0))(
  ( (Nil!18902) (Cons!18901 (h!20047 (_ BitVec 64)) (t!26953 List!18905)) )
))
(declare-fun arrayNoDuplicates!0 (array!55761 (_ BitVec 32) List!18905) Bool)

(assert (=> b!929600 (= res!626056 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18902))))

(declare-fun b!929601 () Bool)

(assert (=> b!929601 (= e!521993 (and e!521995 mapRes!31638))))

(declare-fun condMapEmpty!31638 () Bool)

(declare-fun mapDefault!31638 () ValueCell!9479)

(assert (=> b!929601 (= condMapEmpty!31638 (= (arr!26825 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9479)) mapDefault!31638)))))

(assert (= (and start!79182 res!626061) b!929596))

(assert (= (and b!929596 res!626057) b!929592))

(assert (= (and b!929592 res!626063) b!929600))

(assert (= (and b!929600 res!626056) b!929598))

(assert (= (and b!929598 res!626058) b!929599))

(assert (= (and b!929599 res!626059) b!929597))

(assert (= (and b!929597 res!626062) b!929591))

(assert (= (and b!929591 res!626060) b!929595))

(assert (= (and b!929601 condMapEmpty!31638) mapIsEmpty!31638))

(assert (= (and b!929601 (not condMapEmpty!31638)) mapNonEmpty!31638))

(get-info :version)

(assert (= (and mapNonEmpty!31638 ((_ is ValueCellFull!9479) mapValue!31638)) b!929593))

(assert (= (and b!929601 ((_ is ValueCellFull!9479) mapDefault!31638)) b!929594))

(assert (= start!79182 b!929601))

(declare-fun m!863503 () Bool)

(assert (=> start!79182 m!863503))

(declare-fun m!863505 () Bool)

(assert (=> start!79182 m!863505))

(declare-fun m!863507 () Bool)

(assert (=> start!79182 m!863507))

(declare-fun m!863509 () Bool)

(assert (=> b!929599 m!863509))

(declare-fun m!863511 () Bool)

(assert (=> b!929599 m!863511))

(declare-fun m!863513 () Bool)

(assert (=> b!929592 m!863513))

(declare-fun m!863515 () Bool)

(assert (=> mapNonEmpty!31638 m!863515))

(declare-fun m!863517 () Bool)

(assert (=> b!929595 m!863517))

(assert (=> b!929595 m!863517))

(declare-fun m!863519 () Bool)

(assert (=> b!929595 m!863519))

(declare-fun m!863521 () Bool)

(assert (=> b!929597 m!863521))

(declare-fun m!863523 () Bool)

(assert (=> b!929600 m!863523))

(check-sat (not b!929597) (not b!929600) (not mapNonEmpty!31638) (not start!79182) (not b!929599) (not b!929595) (not b_next!17413) (not b!929592) tp_is_empty!19921 b_and!28453)
(check-sat b_and!28453 (not b_next!17413))
