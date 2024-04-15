; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108158 () Bool)

(assert start!108158)

(declare-fun b_free!27853 () Bool)

(declare-fun b_next!27853 () Bool)

(assert (=> start!108158 (= b_free!27853 (not b_next!27853))))

(declare-fun tp!98516 () Bool)

(declare-fun b_and!45893 () Bool)

(assert (=> start!108158 (= tp!98516 b_and!45893)))

(declare-fun b!1277192 () Bool)

(declare-fun res!848697 () Bool)

(declare-fun e!729384 () Bool)

(assert (=> b!1277192 (=> (not res!848697) (not e!729384))))

(declare-datatypes ((array!83799 0))(
  ( (array!83800 (arr!40410 (Array (_ BitVec 32) (_ BitVec 64))) (size!40962 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83799)

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83799 (_ BitVec 32)) Bool)

(assert (=> b!1277192 (= res!848697 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1277193 () Bool)

(declare-fun e!729385 () Bool)

(declare-fun tp_is_empty!33403 () Bool)

(assert (=> b!1277193 (= e!729385 tp_is_empty!33403)))

(declare-fun b!1277194 () Bool)

(declare-fun res!848698 () Bool)

(assert (=> b!1277194 (=> (not res!848698) (not e!729384))))

(declare-fun extraKeys!1108 () (_ BitVec 32))

(declare-datatypes ((V!49641 0))(
  ( (V!49642 (val!16776 Int)) )
))
(declare-datatypes ((ValueCell!15803 0))(
  ( (ValueCellFull!15803 (v!19373 V!49641)) (EmptyCell!15803) )
))
(declare-datatypes ((array!83801 0))(
  ( (array!83802 (arr!40411 (Array (_ BitVec 32) ValueCell!15803)) (size!40963 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83801)

(assert (=> b!1277194 (= res!848698 (and (= (size!40963 _values!1187) (bvadd #b00000000000000000000000000000001 mask!1805)) (= (size!40962 _keys!1427) (size!40963 _values!1187)) (bvsge mask!1805 #b00000000000000000000000000000000) (bvsge extraKeys!1108 #b00000000000000000000000000000000) (bvsle extraKeys!1108 #b00000000000000000000000000000011)))))

(declare-fun b!1277195 () Bool)

(assert (=> b!1277195 (= e!729384 false)))

(declare-fun defaultEntry!1195 () Int)

(declare-fun lt!575493 () Bool)

(declare-fun minValue!1129 () V!49641)

(declare-fun k0!1053 () (_ BitVec 64))

(declare-fun zeroValue!1129 () V!49641)

(declare-datatypes ((tuple2!21596 0))(
  ( (tuple2!21597 (_1!10809 (_ BitVec 64)) (_2!10809 V!49641)) )
))
(declare-datatypes ((List!28767 0))(
  ( (Nil!28764) (Cons!28763 (h!29972 tuple2!21596) (t!42297 List!28767)) )
))
(declare-datatypes ((ListLongMap!19253 0))(
  ( (ListLongMap!19254 (toList!9642 List!28767)) )
))
(declare-fun contains!7683 (ListLongMap!19253 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4616 (array!83799 array!83801 (_ BitVec 32) (_ BitVec 32) V!49641 V!49641 (_ BitVec 32) Int) ListLongMap!19253)

(assert (=> b!1277195 (= lt!575493 (contains!7683 (getCurrentListMap!4616 _keys!1427 _values!1187 mask!1805 extraKeys!1108 zeroValue!1129 minValue!1129 #b00000000000000000000000000000000 defaultEntry!1195) k0!1053))))

(declare-fun b!1277196 () Bool)

(declare-fun e!729382 () Bool)

(declare-fun mapRes!51638 () Bool)

(assert (=> b!1277196 (= e!729382 (and e!729385 mapRes!51638))))

(declare-fun condMapEmpty!51638 () Bool)

(declare-fun mapDefault!51638 () ValueCell!15803)

(assert (=> b!1277196 (= condMapEmpty!51638 (= (arr!40411 _values!1187) ((as const (Array (_ BitVec 32) ValueCell!15803)) mapDefault!51638)))))

(declare-fun res!848700 () Bool)

(assert (=> start!108158 (=> (not res!848700) (not e!729384))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108158 (= res!848700 (validMask!0 mask!1805))))

(assert (=> start!108158 e!729384))

(assert (=> start!108158 true))

(assert (=> start!108158 tp!98516))

(assert (=> start!108158 tp_is_empty!33403))

(declare-fun array_inv!30863 (array!83801) Bool)

(assert (=> start!108158 (and (array_inv!30863 _values!1187) e!729382)))

(declare-fun array_inv!30864 (array!83799) Bool)

(assert (=> start!108158 (array_inv!30864 _keys!1427)))

(declare-fun mapIsEmpty!51638 () Bool)

(assert (=> mapIsEmpty!51638 mapRes!51638))

(declare-fun mapNonEmpty!51638 () Bool)

(declare-fun tp!98517 () Bool)

(declare-fun e!729381 () Bool)

(assert (=> mapNonEmpty!51638 (= mapRes!51638 (and tp!98517 e!729381))))

(declare-fun mapValue!51638 () ValueCell!15803)

(declare-fun mapKey!51638 () (_ BitVec 32))

(declare-fun mapRest!51638 () (Array (_ BitVec 32) ValueCell!15803))

(assert (=> mapNonEmpty!51638 (= (arr!40411 _values!1187) (store mapRest!51638 mapKey!51638 mapValue!51638))))

(declare-fun b!1277197 () Bool)

(assert (=> b!1277197 (= e!729381 tp_is_empty!33403)))

(declare-fun b!1277198 () Bool)

(declare-fun res!848699 () Bool)

(assert (=> b!1277198 (=> (not res!848699) (not e!729384))))

(declare-datatypes ((List!28768 0))(
  ( (Nil!28765) (Cons!28764 (h!29973 (_ BitVec 64)) (t!42298 List!28768)) )
))
(declare-fun arrayNoDuplicates!0 (array!83799 (_ BitVec 32) List!28768) Bool)

(assert (=> b!1277198 (= res!848699 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28765))))

(assert (= (and start!108158 res!848700) b!1277194))

(assert (= (and b!1277194 res!848698) b!1277192))

(assert (= (and b!1277192 res!848697) b!1277198))

(assert (= (and b!1277198 res!848699) b!1277195))

(assert (= (and b!1277196 condMapEmpty!51638) mapIsEmpty!51638))

(assert (= (and b!1277196 (not condMapEmpty!51638)) mapNonEmpty!51638))

(get-info :version)

(assert (= (and mapNonEmpty!51638 ((_ is ValueCellFull!15803) mapValue!51638)) b!1277197))

(assert (= (and b!1277196 ((_ is ValueCellFull!15803) mapDefault!51638)) b!1277193))

(assert (= start!108158 b!1277196))

(declare-fun m!1172421 () Bool)

(assert (=> mapNonEmpty!51638 m!1172421))

(declare-fun m!1172423 () Bool)

(assert (=> b!1277195 m!1172423))

(assert (=> b!1277195 m!1172423))

(declare-fun m!1172425 () Bool)

(assert (=> b!1277195 m!1172425))

(declare-fun m!1172427 () Bool)

(assert (=> b!1277198 m!1172427))

(declare-fun m!1172429 () Bool)

(assert (=> b!1277192 m!1172429))

(declare-fun m!1172431 () Bool)

(assert (=> start!108158 m!1172431))

(declare-fun m!1172433 () Bool)

(assert (=> start!108158 m!1172433))

(declare-fun m!1172435 () Bool)

(assert (=> start!108158 m!1172435))

(check-sat tp_is_empty!33403 (not b!1277195) (not start!108158) (not mapNonEmpty!51638) (not b!1277198) b_and!45893 (not b_next!27853) (not b!1277192))
(check-sat b_and!45893 (not b_next!27853))
