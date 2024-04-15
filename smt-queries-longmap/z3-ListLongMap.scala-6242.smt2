; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79858 () Bool)

(assert start!79858)

(declare-fun b_free!17773 () Bool)

(declare-fun b_next!17773 () Bool)

(assert (=> start!79858 (= b_free!17773 (not b_next!17773))))

(declare-fun tp!61784 () Bool)

(declare-fun b_and!29159 () Bool)

(assert (=> start!79858 (= tp!61784 b_and!29159)))

(declare-fun b!939199 () Bool)

(declare-fun res!631781 () Bool)

(declare-fun e!527513 () Bool)

(assert (=> b!939199 (=> (not res!631781) (not e!527513))))

(declare-fun from!1844 () (_ BitVec 32))

(declare-datatypes ((array!56469 0))(
  ( (array!56470 (arr!27173 (Array (_ BitVec 32) (_ BitVec 64))) (size!27634 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56469)

(assert (=> b!939199 (= res!631781 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27634 _keys!1487))))))

(declare-fun b!939200 () Bool)

(declare-fun e!527518 () Bool)

(declare-fun tp_is_empty!20281 () Bool)

(assert (=> b!939200 (= e!527518 tp_is_empty!20281)))

(declare-fun res!631775 () Bool)

(assert (=> start!79858 (=> (not res!631775) (not e!527513))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79858 (= res!631775 (validMask!0 mask!1881))))

(assert (=> start!79858 e!527513))

(assert (=> start!79858 true))

(assert (=> start!79858 tp_is_empty!20281))

(declare-datatypes ((V!32007 0))(
  ( (V!32008 (val!10191 Int)) )
))
(declare-datatypes ((ValueCell!9659 0))(
  ( (ValueCellFull!9659 (v!12721 V!32007)) (EmptyCell!9659) )
))
(declare-datatypes ((array!56471 0))(
  ( (array!56472 (arr!27174 (Array (_ BitVec 32) ValueCell!9659)) (size!27635 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56471)

(declare-fun e!527515 () Bool)

(declare-fun array_inv!21200 (array!56471) Bool)

(assert (=> start!79858 (and (array_inv!21200 _values!1231) e!527515)))

(assert (=> start!79858 tp!61784))

(declare-fun array_inv!21201 (array!56469) Bool)

(assert (=> start!79858 (array_inv!21201 _keys!1487)))

(declare-fun b!939201 () Bool)

(declare-fun res!631779 () Bool)

(assert (=> b!939201 (=> (not res!631779) (not e!527513))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!939201 (= res!631779 (and (= (size!27635 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27634 _keys!1487) (size!27635 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!939202 () Bool)

(declare-fun e!527517 () Bool)

(declare-fun e!527516 () Bool)

(assert (=> b!939202 (= e!527517 e!527516)))

(declare-fun res!631774 () Bool)

(assert (=> b!939202 (=> res!631774 e!527516)))

(declare-datatypes ((tuple2!13448 0))(
  ( (tuple2!13449 (_1!6735 (_ BitVec 64)) (_2!6735 V!32007)) )
))
(declare-datatypes ((List!19189 0))(
  ( (Nil!19186) (Cons!19185 (h!20331 tuple2!13448) (t!27495 List!19189)) )
))
(declare-datatypes ((ListLongMap!12135 0))(
  ( (ListLongMap!12136 (toList!6083 List!19189)) )
))
(declare-fun lt!424298 () ListLongMap!12135)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!5088 (ListLongMap!12135 (_ BitVec 64)) Bool)

(assert (=> b!939202 (= res!631774 (not (contains!5088 lt!424298 k0!1099)))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!32007)

(declare-fun minValue!1173 () V!32007)

(declare-fun getCurrentListMap!3246 (array!56469 array!56471 (_ BitVec 32) (_ BitVec 32) V!32007 V!32007 (_ BitVec 32) Int) ListLongMap!12135)

(assert (=> b!939202 (= lt!424298 (getCurrentListMap!3246 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun mapIsEmpty!32201 () Bool)

(declare-fun mapRes!32201 () Bool)

(assert (=> mapIsEmpty!32201 mapRes!32201))

(declare-fun b!939203 () Bool)

(declare-fun res!631777 () Bool)

(assert (=> b!939203 (=> (not res!631777) (not e!527517))))

(declare-fun v!791 () V!32007)

(declare-fun lt!424297 () ListLongMap!12135)

(declare-fun apply!856 (ListLongMap!12135 (_ BitVec 64)) V!32007)

(assert (=> b!939203 (= res!631777 (= (apply!856 lt!424297 k0!1099) v!791))))

(declare-fun b!939204 () Bool)

(assert (=> b!939204 (= e!527516 (not (= (apply!856 lt!424298 k0!1099) v!791)))))

(declare-fun b!939205 () Bool)

(declare-fun e!527514 () Bool)

(assert (=> b!939205 (= e!527515 (and e!527514 mapRes!32201))))

(declare-fun condMapEmpty!32201 () Bool)

(declare-fun mapDefault!32201 () ValueCell!9659)

(assert (=> b!939205 (= condMapEmpty!32201 (= (arr!27174 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9659)) mapDefault!32201)))))

(declare-fun mapNonEmpty!32201 () Bool)

(declare-fun tp!61783 () Bool)

(assert (=> mapNonEmpty!32201 (= mapRes!32201 (and tp!61783 e!527518))))

(declare-fun mapValue!32201 () ValueCell!9659)

(declare-fun mapRest!32201 () (Array (_ BitVec 32) ValueCell!9659))

(declare-fun mapKey!32201 () (_ BitVec 32))

(assert (=> mapNonEmpty!32201 (= (arr!27174 _values!1231) (store mapRest!32201 mapKey!32201 mapValue!32201))))

(declare-fun b!939206 () Bool)

(declare-fun res!631780 () Bool)

(assert (=> b!939206 (=> (not res!631780) (not e!527513))))

(declare-datatypes ((List!19190 0))(
  ( (Nil!19187) (Cons!19186 (h!20332 (_ BitVec 64)) (t!27496 List!19190)) )
))
(declare-fun arrayNoDuplicates!0 (array!56469 (_ BitVec 32) List!19190) Bool)

(assert (=> b!939206 (= res!631780 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19187))))

(declare-fun b!939207 () Bool)

(declare-fun res!631778 () Bool)

(assert (=> b!939207 (=> (not res!631778) (not e!527513))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56469 (_ BitVec 32)) Bool)

(assert (=> b!939207 (= res!631778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!939208 () Bool)

(declare-fun res!631776 () Bool)

(assert (=> b!939208 (=> (not res!631776) (not e!527517))))

(assert (=> b!939208 (= res!631776 (bvsle from!1844 #b00000000000000000000000000000000))))

(declare-fun b!939209 () Bool)

(assert (=> b!939209 (= e!527513 e!527517)))

(declare-fun res!631773 () Bool)

(assert (=> b!939209 (=> (not res!631773) (not e!527517))))

(assert (=> b!939209 (= res!631773 (contains!5088 lt!424297 k0!1099))))

(assert (=> b!939209 (= lt!424297 (getCurrentListMap!3246 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!939210 () Bool)

(assert (=> b!939210 (= e!527514 tp_is_empty!20281)))

(assert (= (and start!79858 res!631775) b!939201))

(assert (= (and b!939201 res!631779) b!939207))

(assert (= (and b!939207 res!631778) b!939206))

(assert (= (and b!939206 res!631780) b!939199))

(assert (= (and b!939199 res!631781) b!939209))

(assert (= (and b!939209 res!631773) b!939203))

(assert (= (and b!939203 res!631777) b!939208))

(assert (= (and b!939208 res!631776) b!939202))

(assert (= (and b!939202 (not res!631774)) b!939204))

(assert (= (and b!939205 condMapEmpty!32201) mapIsEmpty!32201))

(assert (= (and b!939205 (not condMapEmpty!32201)) mapNonEmpty!32201))

(get-info :version)

(assert (= (and mapNonEmpty!32201 ((_ is ValueCellFull!9659) mapValue!32201)) b!939200))

(assert (= (and b!939205 ((_ is ValueCellFull!9659) mapDefault!32201)) b!939210))

(assert (= start!79858 b!939205))

(declare-fun m!874545 () Bool)

(assert (=> b!939206 m!874545))

(declare-fun m!874547 () Bool)

(assert (=> mapNonEmpty!32201 m!874547))

(declare-fun m!874549 () Bool)

(assert (=> b!939207 m!874549))

(declare-fun m!874551 () Bool)

(assert (=> b!939204 m!874551))

(declare-fun m!874553 () Bool)

(assert (=> b!939202 m!874553))

(declare-fun m!874555 () Bool)

(assert (=> b!939202 m!874555))

(declare-fun m!874557 () Bool)

(assert (=> start!79858 m!874557))

(declare-fun m!874559 () Bool)

(assert (=> start!79858 m!874559))

(declare-fun m!874561 () Bool)

(assert (=> start!79858 m!874561))

(declare-fun m!874563 () Bool)

(assert (=> b!939209 m!874563))

(declare-fun m!874565 () Bool)

(assert (=> b!939209 m!874565))

(declare-fun m!874567 () Bool)

(assert (=> b!939203 m!874567))

(check-sat (not start!79858) (not b!939209) (not b!939202) tp_is_empty!20281 (not b!939204) (not b!939207) b_and!29159 (not b!939203) (not mapNonEmpty!32201) (not b!939206) (not b_next!17773))
(check-sat b_and!29159 (not b_next!17773))
