; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107120 () Bool)

(assert start!107120)

(declare-datatypes ((V!48699 0))(
  ( (V!48700 (val!16389 Int)) )
))
(declare-datatypes ((ValueCell!15461 0))(
  ( (ValueCellFull!15461 (v!19020 V!48699)) (EmptyCell!15461) )
))
(declare-datatypes ((array!82569 0))(
  ( (array!82570 (arr!39822 (Array (_ BitVec 32) ValueCell!15461)) (size!40359 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82569)

(declare-fun e!723305 () Bool)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82571 0))(
  ( (array!82572 (arr!39823 (Array (_ BitVec 32) (_ BitVec 64))) (size!40360 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82571)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun b!1269334 () Bool)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269334 (= e!723305 (and (= (size!40359 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40360 _keys!1364) (size!40359 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011) (= (size!40360 _keys!1364) (bvadd #b00000000000000000000000000000001 mask!1730)) (bvsgt #b00000000000000000000000000000000 (size!40360 _keys!1364))))))

(declare-fun b!1269335 () Bool)

(declare-fun e!723302 () Bool)

(declare-fun tp_is_empty!32629 () Bool)

(assert (=> b!1269335 (= e!723302 tp_is_empty!32629)))

(declare-fun b!1269336 () Bool)

(declare-fun e!723303 () Bool)

(declare-fun mapRes!50509 () Bool)

(assert (=> b!1269336 (= e!723303 (and e!723302 mapRes!50509))))

(declare-fun condMapEmpty!50509 () Bool)

(declare-fun mapDefault!50509 () ValueCell!15461)

(assert (=> b!1269336 (= condMapEmpty!50509 (= (arr!39822 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15461)) mapDefault!50509)))))

(declare-fun res!844564 () Bool)

(assert (=> start!107120 (=> (not res!844564) (not e!723305))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107120 (= res!844564 (validMask!0 mask!1730))))

(assert (=> start!107120 e!723305))

(declare-fun array_inv!30471 (array!82569) Bool)

(assert (=> start!107120 (and (array_inv!30471 _values!1134) e!723303)))

(assert (=> start!107120 true))

(declare-fun array_inv!30472 (array!82571) Bool)

(assert (=> start!107120 (array_inv!30472 _keys!1364)))

(declare-fun mapIsEmpty!50509 () Bool)

(assert (=> mapIsEmpty!50509 mapRes!50509))

(declare-fun b!1269337 () Bool)

(declare-fun e!723304 () Bool)

(assert (=> b!1269337 (= e!723304 tp_is_empty!32629)))

(declare-fun mapNonEmpty!50509 () Bool)

(declare-fun tp!96688 () Bool)

(assert (=> mapNonEmpty!50509 (= mapRes!50509 (and tp!96688 e!723304))))

(declare-fun mapKey!50509 () (_ BitVec 32))

(declare-fun mapRest!50509 () (Array (_ BitVec 32) ValueCell!15461))

(declare-fun mapValue!50509 () ValueCell!15461)

(assert (=> mapNonEmpty!50509 (= (arr!39822 _values!1134) (store mapRest!50509 mapKey!50509 mapValue!50509))))

(assert (= (and start!107120 res!844564) b!1269334))

(assert (= (and b!1269336 condMapEmpty!50509) mapIsEmpty!50509))

(assert (= (and b!1269336 (not condMapEmpty!50509)) mapNonEmpty!50509))

(get-info :version)

(assert (= (and mapNonEmpty!50509 ((_ is ValueCellFull!15461) mapValue!50509)) b!1269337))

(assert (= (and b!1269336 ((_ is ValueCellFull!15461) mapDefault!50509)) b!1269335))

(assert (= start!107120 b!1269336))

(declare-fun m!1168643 () Bool)

(assert (=> start!107120 m!1168643))

(declare-fun m!1168645 () Bool)

(assert (=> start!107120 m!1168645))

(declare-fun m!1168647 () Bool)

(assert (=> start!107120 m!1168647))

(declare-fun m!1168649 () Bool)

(assert (=> mapNonEmpty!50509 m!1168649))

(check-sat (not start!107120) (not mapNonEmpty!50509) tp_is_empty!32629)
(check-sat)
(get-model)

(declare-fun d!140079 () Bool)

(assert (=> d!140079 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!107120 d!140079))

(declare-fun d!140081 () Bool)

(assert (=> d!140081 (= (array_inv!30471 _values!1134) (bvsge (size!40359 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!107120 d!140081))

(declare-fun d!140083 () Bool)

(assert (=> d!140083 (= (array_inv!30472 _keys!1364) (bvsge (size!40360 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!107120 d!140083))

(declare-fun b!1269368 () Bool)

(declare-fun e!723341 () Bool)

(assert (=> b!1269368 (= e!723341 tp_is_empty!32629)))

(declare-fun mapNonEmpty!50518 () Bool)

(declare-fun mapRes!50518 () Bool)

(declare-fun tp!96697 () Bool)

(assert (=> mapNonEmpty!50518 (= mapRes!50518 (and tp!96697 e!723341))))

(declare-fun mapKey!50518 () (_ BitVec 32))

(declare-fun mapRest!50518 () (Array (_ BitVec 32) ValueCell!15461))

(declare-fun mapValue!50518 () ValueCell!15461)

(assert (=> mapNonEmpty!50518 (= mapRest!50509 (store mapRest!50518 mapKey!50518 mapValue!50518))))

(declare-fun mapIsEmpty!50518 () Bool)

(assert (=> mapIsEmpty!50518 mapRes!50518))

(declare-fun b!1269369 () Bool)

(declare-fun e!723340 () Bool)

(assert (=> b!1269369 (= e!723340 tp_is_empty!32629)))

(declare-fun condMapEmpty!50518 () Bool)

(declare-fun mapDefault!50518 () ValueCell!15461)

(assert (=> mapNonEmpty!50509 (= condMapEmpty!50518 (= mapRest!50509 ((as const (Array (_ BitVec 32) ValueCell!15461)) mapDefault!50518)))))

(assert (=> mapNonEmpty!50509 (= tp!96688 (and e!723340 mapRes!50518))))

(assert (= (and mapNonEmpty!50509 condMapEmpty!50518) mapIsEmpty!50518))

(assert (= (and mapNonEmpty!50509 (not condMapEmpty!50518)) mapNonEmpty!50518))

(assert (= (and mapNonEmpty!50518 ((_ is ValueCellFull!15461) mapValue!50518)) b!1269368))

(assert (= (and mapNonEmpty!50509 ((_ is ValueCellFull!15461) mapDefault!50518)) b!1269369))

(declare-fun m!1168667 () Bool)

(assert (=> mapNonEmpty!50518 m!1168667))

(check-sat (not mapNonEmpty!50518) tp_is_empty!32629)
(check-sat)
