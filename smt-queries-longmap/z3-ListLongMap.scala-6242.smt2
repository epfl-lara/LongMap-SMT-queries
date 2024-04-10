; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79878 () Bool)

(assert start!79878)

(declare-fun b_free!17775 () Bool)

(declare-fun b_next!17775 () Bool)

(assert (=> start!79878 (= b_free!17775 (not b_next!17775))))

(declare-fun tp!61788 () Bool)

(declare-fun b_and!29187 () Bool)

(assert (=> start!79878 (= tp!61788 b_and!29187)))

(declare-fun k0!1099 () (_ BitVec 64))

(declare-datatypes ((V!32009 0))(
  ( (V!32010 (val!10192 Int)) )
))
(declare-fun v!791 () V!32009)

(declare-fun e!527686 () Bool)

(declare-datatypes ((tuple2!13398 0))(
  ( (tuple2!13399 (_1!6710 (_ BitVec 64)) (_2!6710 V!32009)) )
))
(declare-datatypes ((List!19175 0))(
  ( (Nil!19172) (Cons!19171 (h!20317 tuple2!13398) (t!27490 List!19175)) )
))
(declare-datatypes ((ListLongMap!12095 0))(
  ( (ListLongMap!12096 (toList!6063 List!19175)) )
))
(declare-fun lt!424539 () ListLongMap!12095)

(declare-fun b!939474 () Bool)

(declare-fun apply!864 (ListLongMap!12095 (_ BitVec 64)) V!32009)

(assert (=> b!939474 (= e!527686 (not (= (apply!864 lt!424539 k0!1099) v!791)))))

(declare-fun mapIsEmpty!32204 () Bool)

(declare-fun mapRes!32204 () Bool)

(assert (=> mapIsEmpty!32204 mapRes!32204))

(declare-fun b!939475 () Bool)

(declare-fun res!631917 () Bool)

(declare-fun e!527688 () Bool)

(assert (=> b!939475 (=> (not res!631917) (not e!527688))))

(declare-fun lt!424540 () ListLongMap!12095)

(assert (=> b!939475 (= res!631917 (= (apply!864 lt!424540 k0!1099) v!791))))

(declare-fun b!939476 () Bool)

(declare-fun res!631915 () Bool)

(declare-fun e!527683 () Bool)

(assert (=> b!939476 (=> (not res!631915) (not e!527683))))

(declare-datatypes ((array!56508 0))(
  ( (array!56509 (arr!27192 (Array (_ BitVec 32) (_ BitVec 64))) (size!27651 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!56508)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56508 (_ BitVec 32)) Bool)

(assert (=> b!939476 (= res!631915 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun mapNonEmpty!32204 () Bool)

(declare-fun tp!61789 () Bool)

(declare-fun e!527685 () Bool)

(assert (=> mapNonEmpty!32204 (= mapRes!32204 (and tp!61789 e!527685))))

(declare-fun mapKey!32204 () (_ BitVec 32))

(declare-datatypes ((ValueCell!9660 0))(
  ( (ValueCellFull!9660 (v!12723 V!32009)) (EmptyCell!9660) )
))
(declare-fun mapRest!32204 () (Array (_ BitVec 32) ValueCell!9660))

(declare-fun mapValue!32204 () ValueCell!9660)

(declare-datatypes ((array!56510 0))(
  ( (array!56511 (arr!27193 (Array (_ BitVec 32) ValueCell!9660)) (size!27652 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!56510)

(assert (=> mapNonEmpty!32204 (= (arr!27193 _values!1231) (store mapRest!32204 mapKey!32204 mapValue!32204))))

(declare-fun b!939477 () Bool)

(declare-fun res!631916 () Bool)

(assert (=> b!939477 (=> (not res!631916) (not e!527683))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!939477 (= res!631916 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27651 _keys!1487))))))

(declare-fun b!939478 () Bool)

(assert (=> b!939478 (= e!527688 e!527686)))

(declare-fun res!631913 () Bool)

(assert (=> b!939478 (=> res!631913 e!527686)))

(declare-fun contains!5125 (ListLongMap!12095 (_ BitVec 64)) Bool)

(assert (=> b!939478 (= res!631913 (not (contains!5125 lt!424539 k0!1099)))))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!32009)

(declare-fun minValue!1173 () V!32009)

(declare-fun getCurrentListMap!3297 (array!56508 array!56510 (_ BitVec 32) (_ BitVec 32) V!32009 V!32009 (_ BitVec 32) Int) ListLongMap!12095)

(assert (=> b!939478 (= lt!424539 (getCurrentListMap!3297 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 #b00000000000000000000000000000000 defaultEntry!1235))))

(declare-fun b!939479 () Bool)

(assert (=> b!939479 (= e!527683 e!527688)))

(declare-fun res!631912 () Bool)

(assert (=> b!939479 (=> (not res!631912) (not e!527688))))

(assert (=> b!939479 (= res!631912 (contains!5125 lt!424540 k0!1099))))

(assert (=> b!939479 (= lt!424540 (getCurrentListMap!3297 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun res!631918 () Bool)

(assert (=> start!79878 (=> (not res!631918) (not e!527683))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79878 (= res!631918 (validMask!0 mask!1881))))

(assert (=> start!79878 e!527683))

(assert (=> start!79878 true))

(declare-fun tp_is_empty!20283 () Bool)

(assert (=> start!79878 tp_is_empty!20283))

(declare-fun e!527684 () Bool)

(declare-fun array_inv!21148 (array!56510) Bool)

(assert (=> start!79878 (and (array_inv!21148 _values!1231) e!527684)))

(assert (=> start!79878 tp!61788))

(declare-fun array_inv!21149 (array!56508) Bool)

(assert (=> start!79878 (array_inv!21149 _keys!1487)))

(declare-fun b!939480 () Bool)

(declare-fun res!631910 () Bool)

(assert (=> b!939480 (=> (not res!631910) (not e!527683))))

(assert (=> b!939480 (= res!631910 (and (= (size!27652 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27651 _keys!1487) (size!27652 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!939481 () Bool)

(assert (=> b!939481 (= e!527685 tp_is_empty!20283)))

(declare-fun b!939482 () Bool)

(declare-fun e!527682 () Bool)

(assert (=> b!939482 (= e!527682 tp_is_empty!20283)))

(declare-fun b!939483 () Bool)

(assert (=> b!939483 (= e!527684 (and e!527682 mapRes!32204))))

(declare-fun condMapEmpty!32204 () Bool)

(declare-fun mapDefault!32204 () ValueCell!9660)

(assert (=> b!939483 (= condMapEmpty!32204 (= (arr!27193 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9660)) mapDefault!32204)))))

(declare-fun b!939484 () Bool)

(declare-fun res!631911 () Bool)

(assert (=> b!939484 (=> (not res!631911) (not e!527683))))

(declare-datatypes ((List!19176 0))(
  ( (Nil!19173) (Cons!19172 (h!20318 (_ BitVec 64)) (t!27491 List!19176)) )
))
(declare-fun arrayNoDuplicates!0 (array!56508 (_ BitVec 32) List!19176) Bool)

(assert (=> b!939484 (= res!631911 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!19173))))

(declare-fun b!939485 () Bool)

(declare-fun res!631914 () Bool)

(assert (=> b!939485 (=> (not res!631914) (not e!527688))))

(assert (=> b!939485 (= res!631914 (bvsle from!1844 #b00000000000000000000000000000000))))

(assert (= (and start!79878 res!631918) b!939480))

(assert (= (and b!939480 res!631910) b!939476))

(assert (= (and b!939476 res!631915) b!939484))

(assert (= (and b!939484 res!631911) b!939477))

(assert (= (and b!939477 res!631916) b!939479))

(assert (= (and b!939479 res!631912) b!939475))

(assert (= (and b!939475 res!631917) b!939485))

(assert (= (and b!939485 res!631914) b!939478))

(assert (= (and b!939478 (not res!631913)) b!939474))

(assert (= (and b!939483 condMapEmpty!32204) mapIsEmpty!32204))

(assert (= (and b!939483 (not condMapEmpty!32204)) mapNonEmpty!32204))

(get-info :version)

(assert (= (and mapNonEmpty!32204 ((_ is ValueCellFull!9660) mapValue!32204)) b!939481))

(assert (= (and b!939483 ((_ is ValueCellFull!9660) mapDefault!32204)) b!939482))

(assert (= start!79878 b!939483))

(declare-fun m!875327 () Bool)

(assert (=> b!939478 m!875327))

(declare-fun m!875329 () Bool)

(assert (=> b!939478 m!875329))

(declare-fun m!875331 () Bool)

(assert (=> b!939474 m!875331))

(declare-fun m!875333 () Bool)

(assert (=> b!939476 m!875333))

(declare-fun m!875335 () Bool)

(assert (=> b!939484 m!875335))

(declare-fun m!875337 () Bool)

(assert (=> mapNonEmpty!32204 m!875337))

(declare-fun m!875339 () Bool)

(assert (=> start!79878 m!875339))

(declare-fun m!875341 () Bool)

(assert (=> start!79878 m!875341))

(declare-fun m!875343 () Bool)

(assert (=> start!79878 m!875343))

(declare-fun m!875345 () Bool)

(assert (=> b!939475 m!875345))

(declare-fun m!875347 () Bool)

(assert (=> b!939479 m!875347))

(declare-fun m!875349 () Bool)

(assert (=> b!939479 m!875349))

(check-sat (not b!939475) (not b_next!17775) (not b!939479) (not mapNonEmpty!32204) b_and!29187 (not start!79878) (not b!939478) (not b!939484) (not b!939476) tp_is_empty!20283 (not b!939474))
(check-sat b_and!29187 (not b_next!17775))
