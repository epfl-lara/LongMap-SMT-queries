; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!79098 () Bool)

(assert start!79098)

(declare-fun b_free!17329 () Bool)

(declare-fun b_next!17329 () Bool)

(assert (=> start!79098 (= b_free!17329 (not b_next!17329))))

(declare-fun tp!60428 () Bool)

(declare-fun b_and!28369 () Bool)

(assert (=> start!79098 (= tp!60428 b_and!28369)))

(declare-fun b!928354 () Bool)

(declare-fun res!625201 () Bool)

(declare-fun e!521237 () Bool)

(assert (=> b!928354 (=> (not res!625201) (not e!521237))))

(declare-datatypes ((array!55605 0))(
  ( (array!55606 (arr!26748 (Array (_ BitVec 32) (_ BitVec 64))) (size!27209 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!55605)

(declare-datatypes ((List!18848 0))(
  ( (Nil!18845) (Cons!18844 (h!19990 (_ BitVec 64)) (t!26896 List!18848)) )
))
(declare-fun arrayNoDuplicates!0 (array!55605 (_ BitVec 32) List!18848) Bool)

(assert (=> b!928354 (= res!625201 (arrayNoDuplicates!0 _keys!1487 #b00000000000000000000000000000000 Nil!18845))))

(declare-fun mapNonEmpty!31512 () Bool)

(declare-fun mapRes!31512 () Bool)

(declare-fun tp!60429 () Bool)

(declare-fun e!521236 () Bool)

(assert (=> mapNonEmpty!31512 (= mapRes!31512 (and tp!60429 e!521236))))

(declare-fun mapKey!31512 () (_ BitVec 32))

(declare-datatypes ((V!31415 0))(
  ( (V!31416 (val!9969 Int)) )
))
(declare-datatypes ((ValueCell!9437 0))(
  ( (ValueCellFull!9437 (v!12486 V!31415)) (EmptyCell!9437) )
))
(declare-fun mapRest!31512 () (Array (_ BitVec 32) ValueCell!9437))

(declare-fun mapValue!31512 () ValueCell!9437)

(declare-datatypes ((array!55607 0))(
  ( (array!55608 (arr!26749 (Array (_ BitVec 32) ValueCell!9437)) (size!27210 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!55607)

(assert (=> mapNonEmpty!31512 (= (arr!26749 _values!1231) (store mapRest!31512 mapKey!31512 mapValue!31512))))

(declare-fun b!928355 () Bool)

(declare-fun e!521239 () Bool)

(declare-fun e!521240 () Bool)

(assert (=> b!928355 (= e!521239 (and e!521240 mapRes!31512))))

(declare-fun condMapEmpty!31512 () Bool)

(declare-fun mapDefault!31512 () ValueCell!9437)

(assert (=> b!928355 (= condMapEmpty!31512 (= (arr!26749 _values!1231) ((as const (Array (_ BitVec 32) ValueCell!9437)) mapDefault!31512)))))

(declare-fun b!928356 () Bool)

(declare-fun res!625199 () Bool)

(assert (=> b!928356 (=> (not res!625199) (not e!521237))))

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun extraKeys!1152 () (_ BitVec 32))

(assert (=> b!928356 (= res!625199 (and (= (size!27210 _values!1231) (bvadd #b00000000000000000000000000000001 mask!1881)) (= (size!27209 _keys!1487) (size!27210 _values!1231)) (bvsge mask!1881 #b00000000000000000000000000000000) (bvsge extraKeys!1152 #b00000000000000000000000000000000) (bvsle extraKeys!1152 #b00000000000000000000000000000011)))))

(declare-fun b!928357 () Bool)

(declare-fun tp_is_empty!19837 () Bool)

(assert (=> b!928357 (= e!521236 tp_is_empty!19837)))

(declare-fun mapIsEmpty!31512 () Bool)

(assert (=> mapIsEmpty!31512 mapRes!31512))

(declare-fun b!928358 () Bool)

(declare-fun res!625198 () Bool)

(assert (=> b!928358 (=> (not res!625198) (not e!521237))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!928358 (= res!625198 (and (bvsge from!1844 #b00000000000000000000000000000000) (bvslt from!1844 (size!27209 _keys!1487))))))

(declare-fun b!928360 () Bool)

(declare-fun e!521238 () Bool)

(assert (=> b!928360 (= e!521237 e!521238)))

(declare-fun res!625200 () Bool)

(assert (=> b!928360 (=> (not res!625200) (not e!521238))))

(declare-datatypes ((tuple2!13080 0))(
  ( (tuple2!13081 (_1!6551 (_ BitVec 64)) (_2!6551 V!31415)) )
))
(declare-datatypes ((List!18849 0))(
  ( (Nil!18846) (Cons!18845 (h!19991 tuple2!13080) (t!26897 List!18849)) )
))
(declare-datatypes ((ListLongMap!11767 0))(
  ( (ListLongMap!11768 (toList!5899 List!18849)) )
))
(declare-fun lt!418658 () ListLongMap!11767)

(declare-fun k0!1099 () (_ BitVec 64))

(declare-fun contains!4909 (ListLongMap!11767 (_ BitVec 64)) Bool)

(assert (=> b!928360 (= res!625200 (contains!4909 lt!418658 k0!1099))))

(declare-fun defaultEntry!1235 () Int)

(declare-fun zeroValue!1173 () V!31415)

(declare-fun minValue!1173 () V!31415)

(declare-fun getCurrentListMap!3083 (array!55605 array!55607 (_ BitVec 32) (_ BitVec 32) V!31415 V!31415 (_ BitVec 32) Int) ListLongMap!11767)

(assert (=> b!928360 (= lt!418658 (getCurrentListMap!3083 _keys!1487 _values!1231 mask!1881 extraKeys!1152 zeroValue!1173 minValue!1173 from!1844 defaultEntry!1235))))

(declare-fun b!928361 () Bool)

(assert (=> b!928361 (= e!521240 tp_is_empty!19837)))

(declare-fun b!928362 () Bool)

(declare-fun res!625197 () Bool)

(assert (=> b!928362 (=> (not res!625197) (not e!521237))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!55605 (_ BitVec 32)) Bool)

(assert (=> b!928362 (= res!625197 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!928359 () Bool)

(assert (=> b!928359 (= e!521238 false)))

(declare-fun lt!418657 () V!31415)

(declare-fun apply!708 (ListLongMap!11767 (_ BitVec 64)) V!31415)

(assert (=> b!928359 (= lt!418657 (apply!708 lt!418658 k0!1099))))

(declare-fun res!625202 () Bool)

(assert (=> start!79098 (=> (not res!625202) (not e!521237))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!79098 (= res!625202 (validMask!0 mask!1881))))

(assert (=> start!79098 e!521237))

(assert (=> start!79098 true))

(declare-fun array_inv!20914 (array!55607) Bool)

(assert (=> start!79098 (and (array_inv!20914 _values!1231) e!521239)))

(assert (=> start!79098 tp!60428))

(declare-fun array_inv!20915 (array!55605) Bool)

(assert (=> start!79098 (array_inv!20915 _keys!1487)))

(assert (=> start!79098 tp_is_empty!19837))

(assert (= (and start!79098 res!625202) b!928356))

(assert (= (and b!928356 res!625199) b!928362))

(assert (= (and b!928362 res!625197) b!928354))

(assert (= (and b!928354 res!625201) b!928358))

(assert (= (and b!928358 res!625198) b!928360))

(assert (= (and b!928360 res!625200) b!928359))

(assert (= (and b!928355 condMapEmpty!31512) mapIsEmpty!31512))

(assert (= (and b!928355 (not condMapEmpty!31512)) mapNonEmpty!31512))

(get-info :version)

(assert (= (and mapNonEmpty!31512 ((_ is ValueCellFull!9437) mapValue!31512)) b!928357))

(assert (= (and b!928355 ((_ is ValueCellFull!9437) mapDefault!31512)) b!928361))

(assert (= start!79098 b!928355))

(declare-fun m!862687 () Bool)

(assert (=> b!928362 m!862687))

(declare-fun m!862689 () Bool)

(assert (=> b!928359 m!862689))

(declare-fun m!862691 () Bool)

(assert (=> b!928354 m!862691))

(declare-fun m!862693 () Bool)

(assert (=> b!928360 m!862693))

(declare-fun m!862695 () Bool)

(assert (=> b!928360 m!862695))

(declare-fun m!862697 () Bool)

(assert (=> mapNonEmpty!31512 m!862697))

(declare-fun m!862699 () Bool)

(assert (=> start!79098 m!862699))

(declare-fun m!862701 () Bool)

(assert (=> start!79098 m!862701))

(declare-fun m!862703 () Bool)

(assert (=> start!79098 m!862703))

(check-sat (not b!928359) (not b!928362) b_and!28369 (not b_next!17329) (not mapNonEmpty!31512) (not start!79098) (not b!928360) (not b!928354) tp_is_empty!19837)
(check-sat b_and!28369 (not b_next!17329))
