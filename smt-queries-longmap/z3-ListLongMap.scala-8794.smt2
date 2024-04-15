; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106988 () Bool)

(assert start!106988)

(declare-fun mapNonEmpty!50596 () Bool)

(declare-fun mapRes!50596 () Bool)

(declare-fun tp!96776 () Bool)

(declare-fun e!722880 () Bool)

(assert (=> mapNonEmpty!50596 (= mapRes!50596 (and tp!96776 e!722880))))

(declare-datatypes ((V!48763 0))(
  ( (V!48764 (val!16413 Int)) )
))
(declare-datatypes ((ValueCell!15485 0))(
  ( (ValueCellFull!15485 (v!19049 V!48763)) (EmptyCell!15485) )
))
(declare-datatypes ((array!82547 0))(
  ( (array!82548 (arr!39811 (Array (_ BitVec 32) ValueCell!15485)) (size!40349 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82547)

(declare-fun mapKey!50596 () (_ BitVec 32))

(declare-fun mapRest!50596 () (Array (_ BitVec 32) ValueCell!15485))

(declare-fun mapValue!50596 () ValueCell!15485)

(assert (=> mapNonEmpty!50596 (= (arr!39811 _values!1134) (store mapRest!50596 mapKey!50596 mapValue!50596))))

(declare-fun res!844300 () Bool)

(declare-fun e!722884 () Bool)

(assert (=> start!106988 (=> (not res!844300) (not e!722884))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106988 (= res!844300 (validMask!0 mask!1730))))

(assert (=> start!106988 e!722884))

(declare-fun e!722882 () Bool)

(declare-fun array_inv!30459 (array!82547) Bool)

(assert (=> start!106988 (and (array_inv!30459 _values!1134) e!722882)))

(assert (=> start!106988 true))

(declare-datatypes ((array!82549 0))(
  ( (array!82550 (arr!39812 (Array (_ BitVec 32) (_ BitVec 64))) (size!40350 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82549)

(declare-fun array_inv!30460 (array!82549) Bool)

(assert (=> start!106988 (array_inv!30460 _keys!1364)))

(declare-fun b!1268527 () Bool)

(declare-fun e!722883 () Bool)

(declare-fun tp_is_empty!32677 () Bool)

(assert (=> b!1268527 (= e!722883 tp_is_empty!32677)))

(declare-fun mapIsEmpty!50596 () Bool)

(assert (=> mapIsEmpty!50596 mapRes!50596))

(declare-fun b!1268528 () Bool)

(declare-fun res!844299 () Bool)

(assert (=> b!1268528 (=> (not res!844299) (not e!722884))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268528 (= res!844299 (and (= (size!40349 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40350 _keys!1364) (size!40349 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268529 () Bool)

(assert (=> b!1268529 (= e!722882 (and e!722883 mapRes!50596))))

(declare-fun condMapEmpty!50596 () Bool)

(declare-fun mapDefault!50596 () ValueCell!15485)

(assert (=> b!1268529 (= condMapEmpty!50596 (= (arr!39811 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15485)) mapDefault!50596)))))

(declare-fun b!1268530 () Bool)

(assert (=> b!1268530 (= e!722880 tp_is_empty!32677)))

(declare-fun b!1268531 () Bool)

(declare-fun res!844301 () Bool)

(assert (=> b!1268531 (=> (not res!844301) (not e!722884))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82549 (_ BitVec 32)) Bool)

(assert (=> b!1268531 (= res!844301 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268532 () Bool)

(assert (=> b!1268532 (= e!722884 false)))

(declare-fun lt!574274 () Bool)

(declare-datatypes ((List!28473 0))(
  ( (Nil!28470) (Cons!28469 (h!29678 (_ BitVec 64)) (t!41994 List!28473)) )
))
(declare-fun arrayNoDuplicates!0 (array!82549 (_ BitVec 32) List!28473) Bool)

(assert (=> b!1268532 (= lt!574274 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28470))))

(assert (= (and start!106988 res!844300) b!1268528))

(assert (= (and b!1268528 res!844299) b!1268531))

(assert (= (and b!1268531 res!844301) b!1268532))

(assert (= (and b!1268529 condMapEmpty!50596) mapIsEmpty!50596))

(assert (= (and b!1268529 (not condMapEmpty!50596)) mapNonEmpty!50596))

(get-info :version)

(assert (= (and mapNonEmpty!50596 ((_ is ValueCellFull!15485) mapValue!50596)) b!1268530))

(assert (= (and b!1268529 ((_ is ValueCellFull!15485) mapDefault!50596)) b!1268527))

(assert (= start!106988 b!1268529))

(declare-fun m!1166883 () Bool)

(assert (=> mapNonEmpty!50596 m!1166883))

(declare-fun m!1166885 () Bool)

(assert (=> start!106988 m!1166885))

(declare-fun m!1166887 () Bool)

(assert (=> start!106988 m!1166887))

(declare-fun m!1166889 () Bool)

(assert (=> start!106988 m!1166889))

(declare-fun m!1166891 () Bool)

(assert (=> b!1268531 m!1166891))

(declare-fun m!1166893 () Bool)

(assert (=> b!1268532 m!1166893))

(check-sat (not b!1268532) (not b!1268531) (not mapNonEmpty!50596) tp_is_empty!32677 (not start!106988))
(check-sat)
