; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107174 () Bool)

(assert start!107174)

(declare-fun res!845460 () Bool)

(declare-fun e!724275 () Bool)

(assert (=> start!107174 (=> (not res!845460) (not e!724275))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107174 (= res!845460 (validMask!0 mask!1730))))

(assert (=> start!107174 e!724275))

(declare-datatypes ((V!49011 0))(
  ( (V!49012 (val!16506 Int)) )
))
(declare-datatypes ((ValueCell!15578 0))(
  ( (ValueCellFull!15578 (v!19142 V!49011)) (EmptyCell!15578) )
))
(declare-datatypes ((array!82897 0))(
  ( (array!82898 (arr!39986 (Array (_ BitVec 32) ValueCell!15578)) (size!40524 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82897)

(declare-fun e!724278 () Bool)

(declare-fun array_inv!30579 (array!82897) Bool)

(assert (=> start!107174 (and (array_inv!30579 _values!1134) e!724278)))

(assert (=> start!107174 true))

(declare-datatypes ((array!82899 0))(
  ( (array!82900 (arr!39987 (Array (_ BitVec 32) (_ BitVec 64))) (size!40525 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82899)

(declare-fun array_inv!30580 (array!82899) Bool)

(assert (=> start!107174 (array_inv!30580 _keys!1364)))

(declare-fun b!1270525 () Bool)

(declare-fun e!724276 () Bool)

(declare-fun tp_is_empty!32863 () Bool)

(assert (=> b!1270525 (= e!724276 tp_is_empty!32863)))

(declare-fun b!1270526 () Bool)

(declare-fun mapRes!50875 () Bool)

(assert (=> b!1270526 (= e!724278 (and e!724276 mapRes!50875))))

(declare-fun condMapEmpty!50875 () Bool)

(declare-fun mapDefault!50875 () ValueCell!15578)

(assert (=> b!1270526 (= condMapEmpty!50875 (= (arr!39986 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15578)) mapDefault!50875)))))

(declare-fun b!1270527 () Bool)

(assert (=> b!1270527 (= e!724275 false)))

(declare-fun lt!574553 () Bool)

(declare-datatypes ((List!28569 0))(
  ( (Nil!28566) (Cons!28565 (h!29774 (_ BitVec 64)) (t!42090 List!28569)) )
))
(declare-fun arrayNoDuplicates!0 (array!82899 (_ BitVec 32) List!28569) Bool)

(assert (=> b!1270527 (= lt!574553 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28566))))

(declare-fun mapNonEmpty!50875 () Bool)

(declare-fun tp!97217 () Bool)

(declare-fun e!724279 () Bool)

(assert (=> mapNonEmpty!50875 (= mapRes!50875 (and tp!97217 e!724279))))

(declare-fun mapRest!50875 () (Array (_ BitVec 32) ValueCell!15578))

(declare-fun mapKey!50875 () (_ BitVec 32))

(declare-fun mapValue!50875 () ValueCell!15578)

(assert (=> mapNonEmpty!50875 (= (arr!39986 _values!1134) (store mapRest!50875 mapKey!50875 mapValue!50875))))

(declare-fun mapIsEmpty!50875 () Bool)

(assert (=> mapIsEmpty!50875 mapRes!50875))

(declare-fun b!1270528 () Bool)

(declare-fun res!845461 () Bool)

(assert (=> b!1270528 (=> (not res!845461) (not e!724275))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270528 (= res!845461 (and (= (size!40524 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40525 _keys!1364) (size!40524 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270529 () Bool)

(assert (=> b!1270529 (= e!724279 tp_is_empty!32863)))

(declare-fun b!1270530 () Bool)

(declare-fun res!845462 () Bool)

(assert (=> b!1270530 (=> (not res!845462) (not e!724275))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82899 (_ BitVec 32)) Bool)

(assert (=> b!1270530 (= res!845462 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107174 res!845460) b!1270528))

(assert (= (and b!1270528 res!845461) b!1270530))

(assert (= (and b!1270530 res!845462) b!1270527))

(assert (= (and b!1270526 condMapEmpty!50875) mapIsEmpty!50875))

(assert (= (and b!1270526 (not condMapEmpty!50875)) mapNonEmpty!50875))

(get-info :version)

(assert (= (and mapNonEmpty!50875 ((_ is ValueCellFull!15578) mapValue!50875)) b!1270529))

(assert (= (and b!1270526 ((_ is ValueCellFull!15578) mapDefault!50875)) b!1270525))

(assert (= start!107174 b!1270526))

(declare-fun m!1168323 () Bool)

(assert (=> start!107174 m!1168323))

(declare-fun m!1168325 () Bool)

(assert (=> start!107174 m!1168325))

(declare-fun m!1168327 () Bool)

(assert (=> start!107174 m!1168327))

(declare-fun m!1168329 () Bool)

(assert (=> b!1270527 m!1168329))

(declare-fun m!1168331 () Bool)

(assert (=> mapNonEmpty!50875 m!1168331))

(declare-fun m!1168333 () Bool)

(assert (=> b!1270530 m!1168333))

(check-sat (not start!107174) tp_is_empty!32863 (not b!1270527) (not mapNonEmpty!50875) (not b!1270530))
(check-sat)
