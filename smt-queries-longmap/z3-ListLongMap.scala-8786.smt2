; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106896 () Bool)

(assert start!106896)

(declare-fun b!1267965 () Bool)

(declare-fun e!722426 () Bool)

(declare-fun tp_is_empty!32629 () Bool)

(assert (=> b!1267965 (= e!722426 tp_is_empty!32629)))

(declare-datatypes ((V!48699 0))(
  ( (V!48700 (val!16389 Int)) )
))
(declare-datatypes ((ValueCell!15461 0))(
  ( (ValueCellFull!15461 (v!19024 V!48699)) (EmptyCell!15461) )
))
(declare-datatypes ((array!82451 0))(
  ( (array!82452 (arr!39768 (Array (_ BitVec 32) ValueCell!15461)) (size!40306 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82451)

(declare-fun e!722428 () Bool)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82453 0))(
  ( (array!82454 (arr!39769 (Array (_ BitVec 32) (_ BitVec 64))) (size!40307 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82453)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun b!1267966 () Bool)

(assert (=> b!1267966 (= e!722428 (and (= (size!40306 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40307 _keys!1364) (size!40306 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011) (= (size!40307 _keys!1364) (bvadd #b00000000000000000000000000000001 mask!1730)) (bvsgt #b00000000000000000000000000000000 (size!40307 _keys!1364))))))

(declare-fun b!1267967 () Bool)

(declare-fun e!722429 () Bool)

(declare-fun mapRes!50509 () Bool)

(assert (=> b!1267967 (= e!722429 (and e!722426 mapRes!50509))))

(declare-fun condMapEmpty!50509 () Bool)

(declare-fun mapDefault!50509 () ValueCell!15461)

(assert (=> b!1267967 (= condMapEmpty!50509 (= (arr!39768 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15461)) mapDefault!50509)))))

(declare-fun mapNonEmpty!50509 () Bool)

(declare-fun tp!96689 () Bool)

(declare-fun e!722427 () Bool)

(assert (=> mapNonEmpty!50509 (= mapRes!50509 (and tp!96689 e!722427))))

(declare-fun mapValue!50509 () ValueCell!15461)

(declare-fun mapKey!50509 () (_ BitVec 32))

(declare-fun mapRest!50509 () (Array (_ BitVec 32) ValueCell!15461))

(assert (=> mapNonEmpty!50509 (= (arr!39768 _values!1134) (store mapRest!50509 mapKey!50509 mapValue!50509))))

(declare-fun res!844017 () Bool)

(assert (=> start!106896 (=> (not res!844017) (not e!722428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106896 (= res!844017 (validMask!0 mask!1730))))

(assert (=> start!106896 e!722428))

(declare-fun array_inv!30431 (array!82451) Bool)

(assert (=> start!106896 (and (array_inv!30431 _values!1134) e!722429)))

(assert (=> start!106896 true))

(declare-fun array_inv!30432 (array!82453) Bool)

(assert (=> start!106896 (array_inv!30432 _keys!1364)))

(declare-fun mapIsEmpty!50509 () Bool)

(assert (=> mapIsEmpty!50509 mapRes!50509))

(declare-fun b!1267968 () Bool)

(assert (=> b!1267968 (= e!722427 tp_is_empty!32629)))

(assert (= (and start!106896 res!844017) b!1267966))

(assert (= (and b!1267967 condMapEmpty!50509) mapIsEmpty!50509))

(assert (= (and b!1267967 (not condMapEmpty!50509)) mapNonEmpty!50509))

(get-info :version)

(assert (= (and mapNonEmpty!50509 ((_ is ValueCellFull!15461) mapValue!50509)) b!1267968))

(assert (= (and b!1267967 ((_ is ValueCellFull!15461) mapDefault!50509)) b!1267965))

(assert (= start!106896 b!1267967))

(declare-fun m!1166531 () Bool)

(assert (=> mapNonEmpty!50509 m!1166531))

(declare-fun m!1166533 () Bool)

(assert (=> start!106896 m!1166533))

(declare-fun m!1166535 () Bool)

(assert (=> start!106896 m!1166535))

(declare-fun m!1166537 () Bool)

(assert (=> start!106896 m!1166537))

(check-sat (not start!106896) (not mapNonEmpty!50509) tp_is_empty!32629)
(check-sat)
(get-model)

(declare-fun d!139519 () Bool)

(assert (=> d!139519 (= (validMask!0 mask!1730) (and (or (= mask!1730 #b00000000000000000000000000000111) (= mask!1730 #b00000000000000000000000000001111) (= mask!1730 #b00000000000000000000000000011111) (= mask!1730 #b00000000000000000000000000111111) (= mask!1730 #b00000000000000000000000001111111) (= mask!1730 #b00000000000000000000000011111111) (= mask!1730 #b00000000000000000000000111111111) (= mask!1730 #b00000000000000000000001111111111) (= mask!1730 #b00000000000000000000011111111111) (= mask!1730 #b00000000000000000000111111111111) (= mask!1730 #b00000000000000000001111111111111) (= mask!1730 #b00000000000000000011111111111111) (= mask!1730 #b00000000000000000111111111111111) (= mask!1730 #b00000000000000001111111111111111) (= mask!1730 #b00000000000000011111111111111111) (= mask!1730 #b00000000000000111111111111111111) (= mask!1730 #b00000000000001111111111111111111) (= mask!1730 #b00000000000011111111111111111111) (= mask!1730 #b00000000000111111111111111111111) (= mask!1730 #b00000000001111111111111111111111) (= mask!1730 #b00000000011111111111111111111111) (= mask!1730 #b00000000111111111111111111111111) (= mask!1730 #b00000001111111111111111111111111) (= mask!1730 #b00000011111111111111111111111111) (= mask!1730 #b00000111111111111111111111111111) (= mask!1730 #b00001111111111111111111111111111) (= mask!1730 #b00011111111111111111111111111111) (= mask!1730 #b00111111111111111111111111111111)) (bvsle mask!1730 #b00111111111111111111111111111111)))))

(assert (=> start!106896 d!139519))

(declare-fun d!139521 () Bool)

(assert (=> d!139521 (= (array_inv!30431 _values!1134) (bvsge (size!40306 _values!1134) #b00000000000000000000000000000000))))

(assert (=> start!106896 d!139521))

(declare-fun d!139523 () Bool)

(assert (=> d!139523 (= (array_inv!30432 _keys!1364) (bvsge (size!40307 _keys!1364) #b00000000000000000000000000000000))))

(assert (=> start!106896 d!139523))

(declare-fun mapIsEmpty!50518 () Bool)

(declare-fun mapRes!50518 () Bool)

(assert (=> mapIsEmpty!50518 mapRes!50518))

(declare-fun mapNonEmpty!50518 () Bool)

(declare-fun tp!96698 () Bool)

(declare-fun e!722465 () Bool)

(assert (=> mapNonEmpty!50518 (= mapRes!50518 (and tp!96698 e!722465))))

(declare-fun mapValue!50518 () ValueCell!15461)

(declare-fun mapRest!50518 () (Array (_ BitVec 32) ValueCell!15461))

(declare-fun mapKey!50518 () (_ BitVec 32))

(assert (=> mapNonEmpty!50518 (= mapRest!50509 (store mapRest!50518 mapKey!50518 mapValue!50518))))

(declare-fun condMapEmpty!50518 () Bool)

(declare-fun mapDefault!50518 () ValueCell!15461)

(assert (=> mapNonEmpty!50509 (= condMapEmpty!50518 (= mapRest!50509 ((as const (Array (_ BitVec 32) ValueCell!15461)) mapDefault!50518)))))

(declare-fun e!722464 () Bool)

(assert (=> mapNonEmpty!50509 (= tp!96689 (and e!722464 mapRes!50518))))

(declare-fun b!1268000 () Bool)

(assert (=> b!1268000 (= e!722464 tp_is_empty!32629)))

(declare-fun b!1267999 () Bool)

(assert (=> b!1267999 (= e!722465 tp_is_empty!32629)))

(assert (= (and mapNonEmpty!50509 condMapEmpty!50518) mapIsEmpty!50518))

(assert (= (and mapNonEmpty!50509 (not condMapEmpty!50518)) mapNonEmpty!50518))

(assert (= (and mapNonEmpty!50518 ((_ is ValueCellFull!15461) mapValue!50518)) b!1267999))

(assert (= (and mapNonEmpty!50509 ((_ is ValueCellFull!15461) mapDefault!50518)) b!1268000))

(declare-fun m!1166555 () Bool)

(assert (=> mapNonEmpty!50518 m!1166555))

(check-sat (not mapNonEmpty!50518) tp_is_empty!32629)
(check-sat)
