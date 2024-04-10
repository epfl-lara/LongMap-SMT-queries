; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106996 () Bool)

(assert start!106996)

(declare-fun mapNonEmpty!50608 () Bool)

(declare-fun mapRes!50608 () Bool)

(declare-fun tp!96787 () Bool)

(declare-fun e!722972 () Bool)

(assert (=> mapNonEmpty!50608 (= mapRes!50608 (and tp!96787 e!722972))))

(declare-datatypes ((V!48773 0))(
  ( (V!48774 (val!16417 Int)) )
))
(declare-datatypes ((ValueCell!15489 0))(
  ( (ValueCellFull!15489 (v!19054 V!48773)) (EmptyCell!15489) )
))
(declare-datatypes ((array!82640 0))(
  ( (array!82641 (arr!39857 (Array (_ BitVec 32) ValueCell!15489)) (size!40393 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82640)

(declare-fun mapValue!50608 () ValueCell!15489)

(declare-fun mapKey!50608 () (_ BitVec 32))

(declare-fun mapRest!50608 () (Array (_ BitVec 32) ValueCell!15489))

(assert (=> mapNonEmpty!50608 (= (arr!39857 _values!1134) (store mapRest!50608 mapKey!50608 mapValue!50608))))

(declare-fun b!1268663 () Bool)

(declare-fun e!722973 () Bool)

(assert (=> b!1268663 (= e!722973 false)))

(declare-fun lt!574464 () Bool)

(declare-datatypes ((array!82642 0))(
  ( (array!82643 (arr!39858 (Array (_ BitVec 32) (_ BitVec 64))) (size!40394 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82642)

(declare-datatypes ((List!28389 0))(
  ( (Nil!28386) (Cons!28385 (h!29594 (_ BitVec 64)) (t!41918 List!28389)) )
))
(declare-fun arrayNoDuplicates!0 (array!82642 (_ BitVec 32) List!28389) Bool)

(assert (=> b!1268663 (= lt!574464 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28386))))

(declare-fun b!1268664 () Bool)

(declare-fun tp_is_empty!32685 () Bool)

(assert (=> b!1268664 (= e!722972 tp_is_empty!32685)))

(declare-fun res!844364 () Bool)

(assert (=> start!106996 (=> (not res!844364) (not e!722973))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106996 (= res!844364 (validMask!0 mask!1730))))

(assert (=> start!106996 e!722973))

(declare-fun e!722970 () Bool)

(declare-fun array_inv!30327 (array!82640) Bool)

(assert (=> start!106996 (and (array_inv!30327 _values!1134) e!722970)))

(assert (=> start!106996 true))

(declare-fun array_inv!30328 (array!82642) Bool)

(assert (=> start!106996 (array_inv!30328 _keys!1364)))

(declare-fun b!1268665 () Bool)

(declare-fun e!722969 () Bool)

(assert (=> b!1268665 (= e!722970 (and e!722969 mapRes!50608))))

(declare-fun condMapEmpty!50608 () Bool)

(declare-fun mapDefault!50608 () ValueCell!15489)

(assert (=> b!1268665 (= condMapEmpty!50608 (= (arr!39857 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15489)) mapDefault!50608)))))

(declare-fun b!1268666 () Bool)

(declare-fun res!844363 () Bool)

(assert (=> b!1268666 (=> (not res!844363) (not e!722973))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82642 (_ BitVec 32)) Bool)

(assert (=> b!1268666 (= res!844363 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268667 () Bool)

(declare-fun res!844362 () Bool)

(assert (=> b!1268667 (=> (not res!844362) (not e!722973))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268667 (= res!844362 (and (= (size!40393 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40394 _keys!1364) (size!40393 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268668 () Bool)

(assert (=> b!1268668 (= e!722969 tp_is_empty!32685)))

(declare-fun mapIsEmpty!50608 () Bool)

(assert (=> mapIsEmpty!50608 mapRes!50608))

(assert (= (and start!106996 res!844364) b!1268667))

(assert (= (and b!1268667 res!844362) b!1268666))

(assert (= (and b!1268666 res!844363) b!1268663))

(assert (= (and b!1268665 condMapEmpty!50608) mapIsEmpty!50608))

(assert (= (and b!1268665 (not condMapEmpty!50608)) mapNonEmpty!50608))

(get-info :version)

(assert (= (and mapNonEmpty!50608 ((_ is ValueCellFull!15489) mapValue!50608)) b!1268664))

(assert (= (and b!1268665 ((_ is ValueCellFull!15489) mapDefault!50608)) b!1268668))

(assert (= start!106996 b!1268665))

(declare-fun m!1167431 () Bool)

(assert (=> mapNonEmpty!50608 m!1167431))

(declare-fun m!1167433 () Bool)

(assert (=> b!1268663 m!1167433))

(declare-fun m!1167435 () Bool)

(assert (=> start!106996 m!1167435))

(declare-fun m!1167437 () Bool)

(assert (=> start!106996 m!1167437))

(declare-fun m!1167439 () Bool)

(assert (=> start!106996 m!1167439))

(declare-fun m!1167441 () Bool)

(assert (=> b!1268666 m!1167441))

(check-sat (not start!106996) tp_is_empty!32685 (not b!1268666) (not b!1268663) (not mapNonEmpty!50608))
(check-sat)
