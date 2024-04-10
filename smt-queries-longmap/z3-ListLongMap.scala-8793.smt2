; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!106984 () Bool)

(assert start!106984)

(declare-fun mapNonEmpty!50590 () Bool)

(declare-fun mapRes!50590 () Bool)

(declare-fun tp!96769 () Bool)

(declare-fun e!722882 () Bool)

(assert (=> mapNonEmpty!50590 (= mapRes!50590 (and tp!96769 e!722882))))

(declare-datatypes ((V!48757 0))(
  ( (V!48758 (val!16411 Int)) )
))
(declare-datatypes ((ValueCell!15483 0))(
  ( (ValueCellFull!15483 (v!19048 V!48757)) (EmptyCell!15483) )
))
(declare-datatypes ((array!82620 0))(
  ( (array!82621 (arr!39847 (Array (_ BitVec 32) ValueCell!15483)) (size!40383 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82620)

(declare-fun mapValue!50590 () ValueCell!15483)

(declare-fun mapRest!50590 () (Array (_ BitVec 32) ValueCell!15483))

(declare-fun mapKey!50590 () (_ BitVec 32))

(assert (=> mapNonEmpty!50590 (= (arr!39847 _values!1134) (store mapRest!50590 mapKey!50590 mapValue!50590))))

(declare-fun res!844309 () Bool)

(declare-fun e!722881 () Bool)

(assert (=> start!106984 (=> (not res!844309) (not e!722881))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!106984 (= res!844309 (validMask!0 mask!1730))))

(assert (=> start!106984 e!722881))

(declare-fun e!722880 () Bool)

(declare-fun array_inv!30319 (array!82620) Bool)

(assert (=> start!106984 (and (array_inv!30319 _values!1134) e!722880)))

(assert (=> start!106984 true))

(declare-datatypes ((array!82622 0))(
  ( (array!82623 (arr!39848 (Array (_ BitVec 32) (_ BitVec 64))) (size!40384 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82622)

(declare-fun array_inv!30320 (array!82622) Bool)

(assert (=> start!106984 (array_inv!30320 _keys!1364)))

(declare-fun b!1268555 () Bool)

(declare-fun e!722883 () Bool)

(declare-fun tp_is_empty!32673 () Bool)

(assert (=> b!1268555 (= e!722883 tp_is_empty!32673)))

(declare-fun b!1268556 () Bool)

(assert (=> b!1268556 (= e!722881 false)))

(declare-fun lt!574446 () Bool)

(declare-datatypes ((List!28386 0))(
  ( (Nil!28383) (Cons!28382 (h!29591 (_ BitVec 64)) (t!41915 List!28386)) )
))
(declare-fun arrayNoDuplicates!0 (array!82622 (_ BitVec 32) List!28386) Bool)

(assert (=> b!1268556 (= lt!574446 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28383))))

(declare-fun b!1268557 () Bool)

(assert (=> b!1268557 (= e!722882 tp_is_empty!32673)))

(declare-fun b!1268558 () Bool)

(declare-fun res!844308 () Bool)

(assert (=> b!1268558 (=> (not res!844308) (not e!722881))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82622 (_ BitVec 32)) Bool)

(assert (=> b!1268558 (= res!844308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50590 () Bool)

(assert (=> mapIsEmpty!50590 mapRes!50590))

(declare-fun b!1268559 () Bool)

(assert (=> b!1268559 (= e!722880 (and e!722883 mapRes!50590))))

(declare-fun condMapEmpty!50590 () Bool)

(declare-fun mapDefault!50590 () ValueCell!15483)

(assert (=> b!1268559 (= condMapEmpty!50590 (= (arr!39847 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15483)) mapDefault!50590)))))

(declare-fun b!1268560 () Bool)

(declare-fun res!844310 () Bool)

(assert (=> b!1268560 (=> (not res!844310) (not e!722881))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268560 (= res!844310 (and (= (size!40383 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40384 _keys!1364) (size!40383 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!106984 res!844309) b!1268560))

(assert (= (and b!1268560 res!844310) b!1268558))

(assert (= (and b!1268558 res!844308) b!1268556))

(assert (= (and b!1268559 condMapEmpty!50590) mapIsEmpty!50590))

(assert (= (and b!1268559 (not condMapEmpty!50590)) mapNonEmpty!50590))

(get-info :version)

(assert (= (and mapNonEmpty!50590 ((_ is ValueCellFull!15483) mapValue!50590)) b!1268557))

(assert (= (and b!1268559 ((_ is ValueCellFull!15483) mapDefault!50590)) b!1268555))

(assert (= start!106984 b!1268559))

(declare-fun m!1167359 () Bool)

(assert (=> mapNonEmpty!50590 m!1167359))

(declare-fun m!1167361 () Bool)

(assert (=> start!106984 m!1167361))

(declare-fun m!1167363 () Bool)

(assert (=> start!106984 m!1167363))

(declare-fun m!1167365 () Bool)

(assert (=> start!106984 m!1167365))

(declare-fun m!1167367 () Bool)

(assert (=> b!1268556 m!1167367))

(declare-fun m!1167369 () Bool)

(assert (=> b!1268558 m!1167369))

(check-sat tp_is_empty!32673 (not mapNonEmpty!50590) (not b!1268558) (not start!106984) (not b!1268556))
(check-sat)
