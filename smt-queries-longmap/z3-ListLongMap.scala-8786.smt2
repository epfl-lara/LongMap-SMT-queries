; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106898 () Bool)

(assert start!106898)

(declare-datatypes ((V!48701 0))(
  ( (V!48702 (val!16390 Int)) )
))
(declare-datatypes ((ValueCell!15462 0))(
  ( (ValueCellFull!15462 (v!19026 V!48701)) (EmptyCell!15462) )
))
(declare-datatypes ((array!82528 0))(
  ( (array!82529 (arr!39806 (Array (_ BitVec 32) ValueCell!15462)) (size!40342 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82528)

(declare-fun e!722473 () Bool)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82530 0))(
  ( (array!82531 (arr!39807 (Array (_ BitVec 32) (_ BitVec 64))) (size!40343 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82530)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun b!1268041 () Bool)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268041 (= e!722473 (and (= (size!40342 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40343 _keys!1364) (size!40342 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011) (= (size!40343 _keys!1364) (bvadd #b00000000000000000000000000000001 mask!1730)) (bvsgt #b00000000000000000000000000000000 (size!40343 _keys!1364))))))

(declare-fun b!1268042 () Bool)

(declare-fun e!722469 () Bool)

(declare-fun e!722470 () Bool)

(declare-fun mapRes!50512 () Bool)

(assert (=> b!1268042 (= e!722469 (and e!722470 mapRes!50512))))

(declare-fun condMapEmpty!50512 () Bool)

(declare-fun mapDefault!50512 () ValueCell!15462)

(assert (=> b!1268042 (= condMapEmpty!50512 (= (arr!39806 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15462)) mapDefault!50512)))))

(declare-fun mapIsEmpty!50512 () Bool)

(assert (=> mapIsEmpty!50512 mapRes!50512))

(declare-fun b!1268043 () Bool)

(declare-fun tp_is_empty!32631 () Bool)

(assert (=> b!1268043 (= e!722470 tp_is_empty!32631)))

(declare-fun b!1268044 () Bool)

(declare-fun e!722472 () Bool)

(assert (=> b!1268044 (= e!722472 tp_is_empty!32631)))

(declare-fun res!844047 () Bool)

(assert (=> start!106898 (=> (not res!844047) (not e!722473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106898 (= res!844047 (validMask!0 mask!1730))))

(assert (=> start!106898 e!722473))

(declare-fun array_inv!30295 (array!82528) Bool)

(assert (=> start!106898 (and (array_inv!30295 _values!1134) e!722469)))

(assert (=> start!106898 true))

(declare-fun array_inv!30296 (array!82530) Bool)

(assert (=> start!106898 (array_inv!30296 _keys!1364)))

(declare-fun mapNonEmpty!50512 () Bool)

(declare-fun tp!96691 () Bool)

(assert (=> mapNonEmpty!50512 (= mapRes!50512 (and tp!96691 e!722472))))

(declare-fun mapValue!50512 () ValueCell!15462)

(declare-fun mapKey!50512 () (_ BitVec 32))

(declare-fun mapRest!50512 () (Array (_ BitVec 32) ValueCell!15462))

(assert (=> mapNonEmpty!50512 (= (arr!39806 _values!1134) (store mapRest!50512 mapKey!50512 mapValue!50512))))

(assert (= (and start!106898 res!844047) b!1268041))

(assert (= (and b!1268042 condMapEmpty!50512) mapIsEmpty!50512))

(assert (= (and b!1268042 (not condMapEmpty!50512)) mapNonEmpty!50512))

(get-info :version)

(assert (= (and mapNonEmpty!50512 ((_ is ValueCellFull!15462) mapValue!50512)) b!1268044))

(assert (= (and b!1268042 ((_ is ValueCellFull!15462) mapDefault!50512)) b!1268043))

(assert (= start!106898 b!1268042))

(declare-fun m!1167039 () Bool)

(assert (=> start!106898 m!1167039))

(declare-fun m!1167041 () Bool)

(assert (=> start!106898 m!1167041))

(declare-fun m!1167043 () Bool)

(assert (=> start!106898 m!1167043))

(declare-fun m!1167045 () Bool)

(assert (=> mapNonEmpty!50512 m!1167045))

(check-sat (not start!106898) (not mapNonEmpty!50512) tp_is_empty!32631)
(check-sat)
(get-model)

(declare-fun d!139631 () Bool)

(assert (=> d!139631 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!106898 d!139631))

(declare-fun d!139633 () Bool)

(assert (=> d!139633 (= (array_inv!30295 _values!1134) (bvsge (size!40342 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!106898 d!139633))

(declare-fun d!139635 () Bool)

(assert (=> d!139635 (= (array_inv!30296 _keys!1364) (bvsge (size!40343 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!106898 d!139635))

(declare-fun condMapEmpty!50518 () Bool)

(declare-fun mapDefault!50518 () ValueCell!15462)

(assert (=> mapNonEmpty!50512 (= condMapEmpty!50518 (= mapRest!50512 ((as const (Array (_ BitVec 32) ValueCell!15462)) mapDefault!50518)))))

(declare-fun e!722494 () Bool)

(declare-fun mapRes!50518 () Bool)

(assert (=> mapNonEmpty!50512 (= tp!96691 (and e!722494 mapRes!50518))))

(declare-fun mapIsEmpty!50518 () Bool)

(assert (=> mapIsEmpty!50518 mapRes!50518))

(declare-fun b!1268064 () Bool)

(assert (=> b!1268064 (= e!722494 tp_is_empty!32631)))

(declare-fun b!1268063 () Bool)

(declare-fun e!722493 () Bool)

(assert (=> b!1268063 (= e!722493 tp_is_empty!32631)))

(declare-fun mapNonEmpty!50518 () Bool)

(declare-fun tp!96697 () Bool)

(assert (=> mapNonEmpty!50518 (= mapRes!50518 (and tp!96697 e!722493))))

(declare-fun mapRest!50518 () (Array (_ BitVec 32) ValueCell!15462))

(declare-fun mapKey!50518 () (_ BitVec 32))

(declare-fun mapValue!50518 () ValueCell!15462)

(assert (=> mapNonEmpty!50518 (= mapRest!50512 (store mapRest!50518 mapKey!50518 mapValue!50518))))

(assert (= (and mapNonEmpty!50512 condMapEmpty!50518) mapIsEmpty!50518))

(assert (= (and mapNonEmpty!50512 (not condMapEmpty!50518)) mapNonEmpty!50518))

(assert (= (and mapNonEmpty!50518 ((_ is ValueCellFull!15462) mapValue!50518)) b!1268063))

(assert (= (and mapNonEmpty!50512 ((_ is ValueCellFull!15462) mapDefault!50518)) b!1268064))

(declare-fun m!1167055 () Bool)

(assert (=> mapNonEmpty!50518 m!1167055))

(check-sat (not mapNonEmpty!50518) tp_is_empty!32631)
(check-sat)
