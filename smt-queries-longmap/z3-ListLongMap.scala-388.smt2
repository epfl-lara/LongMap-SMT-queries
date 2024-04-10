; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!7326 () Bool)

(assert start!7326)

(declare-fun b!47082 () Bool)

(declare-fun e!30096 () Bool)

(declare-fun e!30098 () Bool)

(declare-fun mapRes!2039 () Bool)

(assert (=> b!47082 (= e!30096 (and e!30098 mapRes!2039))))

(declare-fun condMapEmpty!2039 () Bool)

(declare-datatypes ((V!2409 0))(
  ( (V!2410 (val!1042 Int)) )
))
(declare-datatypes ((ValueCell!714 0))(
  ( (ValueCellFull!714 (v!2102 V!2409)) (EmptyCell!714) )
))
(declare-datatypes ((array!3073 0))(
  ( (array!3074 (arr!1476 (Array (_ BitVec 32) ValueCell!714)) (size!1698 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3073)

(declare-fun mapDefault!2039 () ValueCell!714)

(assert (=> b!47082 (= condMapEmpty!2039 (= (arr!1476 _values!1550) ((as const (Array (_ BitVec 32) ValueCell!714)) mapDefault!2039)))))

(declare-fun res!27420 () Bool)

(declare-fun e!30095 () Bool)

(assert (=> start!7326 (=> (not res!27420) (not e!30095))))

(declare-fun mask!2458 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7326 (= res!27420 (validMask!0 mask!2458))))

(assert (=> start!7326 e!30095))

(assert (=> start!7326 true))

(declare-fun array_inv!884 (array!3073) Bool)

(assert (=> start!7326 (and (array_inv!884 _values!1550) e!30096)))

(declare-datatypes ((array!3075 0))(
  ( (array!3076 (arr!1477 (Array (_ BitVec 32) (_ BitVec 64))) (size!1699 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3075)

(declare-fun array_inv!885 (array!3075) Bool)

(assert (=> start!7326 (array_inv!885 _keys!1940)))

(declare-fun mapIsEmpty!2039 () Bool)

(assert (=> mapIsEmpty!2039 mapRes!2039))

(declare-fun b!47083 () Bool)

(declare-fun e!30097 () Bool)

(declare-fun tp_is_empty!2007 () Bool)

(assert (=> b!47083 (= e!30097 tp_is_empty!2007)))

(declare-fun mapNonEmpty!2039 () Bool)

(declare-fun tp!6188 () Bool)

(assert (=> mapNonEmpty!2039 (= mapRes!2039 (and tp!6188 e!30097))))

(declare-fun mapRest!2039 () (Array (_ BitVec 32) ValueCell!714))

(declare-fun mapKey!2039 () (_ BitVec 32))

(declare-fun mapValue!2039 () ValueCell!714)

(assert (=> mapNonEmpty!2039 (= (arr!1476 _values!1550) (store mapRest!2039 mapKey!2039 mapValue!2039))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(declare-fun b!47084 () Bool)

(assert (=> b!47084 (= e!30095 (and (= (size!1698 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1699 _keys!1940) (size!1698 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011) (= (size!1699 _keys!1940) (bvadd #b00000000000000000000000000000001 mask!2458)) (bvsgt #b00000000000000000000000000000000 (size!1699 _keys!1940))))))

(declare-fun b!47085 () Bool)

(assert (=> b!47085 (= e!30098 tp_is_empty!2007)))

(assert (= (and start!7326 res!27420) b!47084))

(assert (= (and b!47082 condMapEmpty!2039) mapIsEmpty!2039))

(assert (= (and b!47082 (not condMapEmpty!2039)) mapNonEmpty!2039))

(get-info :version)

(assert (= (and mapNonEmpty!2039 ((_ is ValueCellFull!714) mapValue!2039)) b!47083))

(assert (= (and b!47082 ((_ is ValueCellFull!714) mapDefault!2039)) b!47085))

(assert (= start!7326 b!47082))

(declare-fun m!41441 () Bool)

(assert (=> start!7326 m!41441))

(declare-fun m!41443 () Bool)

(assert (=> start!7326 m!41443))

(declare-fun m!41445 () Bool)

(assert (=> start!7326 m!41445))

(declare-fun m!41447 () Bool)

(assert (=> mapNonEmpty!2039 m!41447))

(check-sat (not start!7326) (not mapNonEmpty!2039) tp_is_empty!2007)
(check-sat)
(get-model)

(declare-fun d!9407 () Bool)

(assert (=> d!9407 (= (validMask!0 mask!2458) (and (or (= mask!2458 #b00000000000000000000000000000111) (= mask!2458 #b00000000000000000000000000001111) (= mask!2458 #b00000000000000000000000000011111) (= mask!2458 #b00000000000000000000000000111111) (= mask!2458 #b00000000000000000000000001111111) (= mask!2458 #b00000000000000000000000011111111) (= mask!2458 #b00000000000000000000000111111111) (= mask!2458 #b00000000000000000000001111111111) (= mask!2458 #b00000000000000000000011111111111) (= mask!2458 #b00000000000000000000111111111111) (= mask!2458 #b00000000000000000001111111111111) (= mask!2458 #b00000000000000000011111111111111) (= mask!2458 #b00000000000000000111111111111111) (= mask!2458 #b00000000000000001111111111111111) (= mask!2458 #b00000000000000011111111111111111) (= mask!2458 #b00000000000000111111111111111111) (= mask!2458 #b00000000000001111111111111111111) (= mask!2458 #b00000000000011111111111111111111) (= mask!2458 #b00000000000111111111111111111111) (= mask!2458 #b00000000001111111111111111111111) (= mask!2458 #b00000000011111111111111111111111) (= mask!2458 #b00000000111111111111111111111111) (= mask!2458 #b00000001111111111111111111111111) (= mask!2458 #b00000011111111111111111111111111) (= mask!2458 #b00000111111111111111111111111111) (= mask!2458 #b00001111111111111111111111111111) (= mask!2458 #b00011111111111111111111111111111) (= mask!2458 #b00111111111111111111111111111111)) (bvsle mask!2458 #b00111111111111111111111111111111)))))

(assert (=> start!7326 d!9407))

(declare-fun d!9409 () Bool)

(assert (=> d!9409 (= (array_inv!884 _values!1550) (bvsge (size!1698 _values!1550) #b00000000000000000000000000000000))))

(assert (=> start!7326 d!9409))

(declare-fun d!9411 () Bool)

(assert (=> d!9411 (= (array_inv!885 _keys!1940) (bvsge (size!1699 _keys!1940) #b00000000000000000000000000000000))))

(assert (=> start!7326 d!9411))

(declare-fun condMapEmpty!2045 () Bool)

(declare-fun mapDefault!2045 () ValueCell!714)

(assert (=> mapNonEmpty!2039 (= condMapEmpty!2045 (= mapRest!2039 ((as const (Array (_ BitVec 32) ValueCell!714)) mapDefault!2045)))))

(declare-fun e!30118 () Bool)

(declare-fun mapRes!2045 () Bool)

(assert (=> mapNonEmpty!2039 (= tp!6188 (and e!30118 mapRes!2045))))

(declare-fun mapNonEmpty!2045 () Bool)

(declare-fun tp!6194 () Bool)

(declare-fun e!30119 () Bool)

(assert (=> mapNonEmpty!2045 (= mapRes!2045 (and tp!6194 e!30119))))

(declare-fun mapValue!2045 () ValueCell!714)

(declare-fun mapRest!2045 () (Array (_ BitVec 32) ValueCell!714))

(declare-fun mapKey!2045 () (_ BitVec 32))

(assert (=> mapNonEmpty!2045 (= mapRest!2039 (store mapRest!2045 mapKey!2045 mapValue!2045))))

(declare-fun b!47105 () Bool)

(assert (=> b!47105 (= e!30118 tp_is_empty!2007)))

(declare-fun mapIsEmpty!2045 () Bool)

(assert (=> mapIsEmpty!2045 mapRes!2045))

(declare-fun b!47104 () Bool)

(assert (=> b!47104 (= e!30119 tp_is_empty!2007)))

(assert (= (and mapNonEmpty!2039 condMapEmpty!2045) mapIsEmpty!2045))

(assert (= (and mapNonEmpty!2039 (not condMapEmpty!2045)) mapNonEmpty!2045))

(assert (= (and mapNonEmpty!2045 ((_ is ValueCellFull!714) mapValue!2045)) b!47104))

(assert (= (and mapNonEmpty!2039 ((_ is ValueCellFull!714) mapDefault!2045)) b!47105))

(declare-fun m!41457 () Bool)

(assert (=> mapNonEmpty!2045 m!41457))

(check-sat (not mapNonEmpty!2045) tp_is_empty!2007)
(check-sat)
