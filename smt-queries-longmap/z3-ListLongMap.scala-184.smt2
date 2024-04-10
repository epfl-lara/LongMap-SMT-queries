; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3682 () Bool)

(assert start!3682)

(declare-fun res!15367 () Bool)

(declare-fun e!16700 () Bool)

(assert (=> start!3682 (=> (not res!15367) (not e!16700))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3682 (= res!15367 (validMask!0 mask!2294))))

(assert (=> start!3682 e!16700))

(assert (=> start!3682 true))

(declare-datatypes ((V!1221 0))(
  ( (V!1222 (val!550 Int)) )
))
(declare-datatypes ((ValueCell!324 0))(
  ( (ValueCellFull!324 (v!1635 V!1221)) (EmptyCell!324) )
))
(declare-datatypes ((array!1333 0))(
  ( (array!1334 (arr!629 (Array (_ BitVec 32) ValueCell!324)) (size!730 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1333)

(declare-fun e!16702 () Bool)

(declare-fun array_inv!423 (array!1333) Bool)

(assert (=> start!3682 (and (array_inv!423 _values!1501) e!16702)))

(declare-datatypes ((array!1335 0))(
  ( (array!1336 (arr!630 (Array (_ BitVec 32) (_ BitVec 64))) (size!731 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1335)

(declare-fun array_inv!424 (array!1335) Bool)

(assert (=> start!3682 (array_inv!424 _keys!1833)))

(declare-fun b!25792 () Bool)

(declare-fun e!16703 () Bool)

(declare-fun tp_is_empty!1047 () Bool)

(assert (=> b!25792 (= e!16703 tp_is_empty!1047)))

(declare-fun mapIsEmpty!1072 () Bool)

(declare-fun mapRes!1072 () Bool)

(assert (=> mapIsEmpty!1072 mapRes!1072))

(declare-fun mapNonEmpty!1072 () Bool)

(declare-fun tp!3592 () Bool)

(declare-fun e!16701 () Bool)

(assert (=> mapNonEmpty!1072 (= mapRes!1072 (and tp!3592 e!16701))))

(declare-fun mapKey!1072 () (_ BitVec 32))

(declare-fun mapRest!1072 () (Array (_ BitVec 32) ValueCell!324))

(declare-fun mapValue!1072 () ValueCell!324)

(assert (=> mapNonEmpty!1072 (= (arr!629 _values!1501) (store mapRest!1072 mapKey!1072 mapValue!1072))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun b!25793 () Bool)

(assert (=> b!25793 (= e!16700 (and (= (size!730 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!731 _keys!1833) (size!730 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011) (= (size!731 _keys!1833) (bvadd #b00000000000000000000000000000001 mask!2294)) (bvsgt #b00000000000000000000000000000000 (size!731 _keys!1833))))))

(declare-fun b!25794 () Bool)

(assert (=> b!25794 (= e!16701 tp_is_empty!1047)))

(declare-fun b!25795 () Bool)

(assert (=> b!25795 (= e!16702 (and e!16703 mapRes!1072))))

(declare-fun condMapEmpty!1072 () Bool)

(declare-fun mapDefault!1072 () ValueCell!324)

(assert (=> b!25795 (= condMapEmpty!1072 (= (arr!629 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!324)) mapDefault!1072)))))

(assert (= (and start!3682 res!15367) b!25793))

(assert (= (and b!25795 condMapEmpty!1072) mapIsEmpty!1072))

(assert (= (and b!25795 (not condMapEmpty!1072)) mapNonEmpty!1072))

(get-info :version)

(assert (= (and mapNonEmpty!1072 ((_ is ValueCellFull!324) mapValue!1072)) b!25794))

(assert (= (and b!25795 ((_ is ValueCellFull!324) mapDefault!1072)) b!25792))

(assert (= start!3682 b!25795))

(declare-fun m!20805 () Bool)

(assert (=> start!3682 m!20805))

(declare-fun m!20807 () Bool)

(assert (=> start!3682 m!20807))

(declare-fun m!20809 () Bool)

(assert (=> start!3682 m!20809))

(declare-fun m!20811 () Bool)

(assert (=> mapNonEmpty!1072 m!20811))

(check-sat (not start!3682) (not mapNonEmpty!1072) tp_is_empty!1047)
(check-sat)
(get-model)

(declare-fun d!4823 () Bool)

(assert (=> d!4823 (= (validMask!0 mask!2294) (and (or (= mask!2294 #b00000000000000000000000000000111) (= mask!2294 #b00000000000000000000000000001111) (= mask!2294 #b00000000000000000000000000011111) (= mask!2294 #b00000000000000000000000000111111) (= mask!2294 #b00000000000000000000000001111111) (= mask!2294 #b00000000000000000000000011111111) (= mask!2294 #b00000000000000000000000111111111) (= mask!2294 #b00000000000000000000001111111111) (= mask!2294 #b00000000000000000000011111111111) (= mask!2294 #b00000000000000000000111111111111) (= mask!2294 #b00000000000000000001111111111111) (= mask!2294 #b00000000000000000011111111111111) (= mask!2294 #b00000000000000000111111111111111) (= mask!2294 #b00000000000000001111111111111111) (= mask!2294 #b00000000000000011111111111111111) (= mask!2294 #b00000000000000111111111111111111) (= mask!2294 #b00000000000001111111111111111111) (= mask!2294 #b00000000000011111111111111111111) (= mask!2294 #b00000000000111111111111111111111) (= mask!2294 #b00000000001111111111111111111111) (= mask!2294 #b00000000011111111111111111111111) (= mask!2294 #b00000000111111111111111111111111) (= mask!2294 #b00000001111111111111111111111111) (= mask!2294 #b00000011111111111111111111111111) (= mask!2294 #b00000111111111111111111111111111) (= mask!2294 #b00001111111111111111111111111111) (= mask!2294 #b00011111111111111111111111111111) (= mask!2294 #b00111111111111111111111111111111)) (bvsle mask!2294 #b00111111111111111111111111111111)))))

(assert (=> start!3682 d!4823))

(declare-fun d!4825 () Bool)

(assert (=> d!4825 (= (array_inv!423 _values!1501) (bvsge (size!730 _values!1501) #b00000000000000000000000000000000))))

(assert (=> start!3682 d!4825))

(declare-fun d!4827 () Bool)

(assert (=> d!4827 (= (array_inv!424 _keys!1833) (bvsge (size!731 _keys!1833) #b00000000000000000000000000000000))))

(assert (=> start!3682 d!4827))

(declare-fun mapNonEmpty!1078 () Bool)

(declare-fun mapRes!1078 () Bool)

(declare-fun tp!3598 () Bool)

(declare-fun e!16724 () Bool)

(assert (=> mapNonEmpty!1078 (= mapRes!1078 (and tp!3598 e!16724))))

(declare-fun mapKey!1078 () (_ BitVec 32))

(declare-fun mapRest!1078 () (Array (_ BitVec 32) ValueCell!324))

(declare-fun mapValue!1078 () ValueCell!324)

(assert (=> mapNonEmpty!1078 (= mapRest!1072 (store mapRest!1078 mapKey!1078 mapValue!1078))))

(declare-fun mapIsEmpty!1078 () Bool)

(assert (=> mapIsEmpty!1078 mapRes!1078))

(declare-fun b!25814 () Bool)

(assert (=> b!25814 (= e!16724 tp_is_empty!1047)))

(declare-fun b!25815 () Bool)

(declare-fun e!16725 () Bool)

(assert (=> b!25815 (= e!16725 tp_is_empty!1047)))

(declare-fun condMapEmpty!1078 () Bool)

(declare-fun mapDefault!1078 () ValueCell!324)

(assert (=> mapNonEmpty!1072 (= condMapEmpty!1078 (= mapRest!1072 ((as const (Array (_ BitVec 32) ValueCell!324)) mapDefault!1078)))))

(assert (=> mapNonEmpty!1072 (= tp!3592 (and e!16725 mapRes!1078))))

(assert (= (and mapNonEmpty!1072 condMapEmpty!1078) mapIsEmpty!1078))

(assert (= (and mapNonEmpty!1072 (not condMapEmpty!1078)) mapNonEmpty!1078))

(assert (= (and mapNonEmpty!1078 ((_ is ValueCellFull!324) mapValue!1078)) b!25814))

(assert (= (and mapNonEmpty!1072 ((_ is ValueCellFull!324) mapDefault!1078)) b!25815))

(declare-fun m!20821 () Bool)

(assert (=> mapNonEmpty!1078 m!20821))

(check-sat (not mapNonEmpty!1078) tp_is_empty!1047)
(check-sat)
