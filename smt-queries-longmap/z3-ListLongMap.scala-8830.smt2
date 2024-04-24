; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107428 () Bool)

(assert start!107428)

(declare-fun b!1272164 () Bool)

(declare-fun e!725377 () Bool)

(assert (=> b!1272164 (= e!725377 false)))

(declare-fun lt!575260 () Bool)

(declare-datatypes ((array!83071 0))(
  ( (array!83072 (arr!40068 (Array (_ BitVec 32) (_ BitVec 64))) (size!40605 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83071)

(declare-datatypes ((List!28535 0))(
  ( (Nil!28532) (Cons!28531 (h!29749 (_ BitVec 64)) (t!42056 List!28535)) )
))
(declare-fun arrayNoDuplicates!0 (array!83071 (_ BitVec 32) List!28535) Bool)

(assert (=> b!1272164 (= lt!575260 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28532))))

(declare-fun b!1272165 () Bool)

(declare-fun e!725376 () Bool)

(declare-fun tp_is_empty!32893 () Bool)

(assert (=> b!1272165 (= e!725376 tp_is_empty!32893)))

(declare-fun b!1272166 () Bool)

(declare-fun e!725379 () Bool)

(declare-fun e!725378 () Bool)

(declare-fun mapRes!50920 () Bool)

(assert (=> b!1272166 (= e!725379 (and e!725378 mapRes!50920))))

(declare-fun condMapEmpty!50920 () Bool)

(declare-datatypes ((V!49051 0))(
  ( (V!49052 (val!16521 Int)) )
))
(declare-datatypes ((ValueCell!15593 0))(
  ( (ValueCellFull!15593 (v!19153 V!49051)) (EmptyCell!15593) )
))
(declare-datatypes ((array!83073 0))(
  ( (array!83074 (arr!40069 (Array (_ BitVec 32) ValueCell!15593)) (size!40606 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83073)

(declare-fun mapDefault!50920 () ValueCell!15593)

(assert (=> b!1272166 (= condMapEmpty!50920 (= (arr!40069 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15593)) mapDefault!50920)))))

(declare-fun mapNonEmpty!50920 () Bool)

(declare-fun tp!97261 () Bool)

(assert (=> mapNonEmpty!50920 (= mapRes!50920 (and tp!97261 e!725376))))

(declare-fun mapRest!50920 () (Array (_ BitVec 32) ValueCell!15593))

(declare-fun mapValue!50920 () ValueCell!15593)

(declare-fun mapKey!50920 () (_ BitVec 32))

(assert (=> mapNonEmpty!50920 (= (arr!40069 _values!1134) (store mapRest!50920 mapKey!50920 mapValue!50920))))

(declare-fun b!1272167 () Bool)

(declare-fun res!846142 () Bool)

(assert (=> b!1272167 (=> (not res!846142) (not e!725377))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272167 (= res!846142 (and (= (size!40606 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40605 _keys!1364) (size!40606 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1272168 () Bool)

(declare-fun res!846144 () Bool)

(assert (=> b!1272168 (=> (not res!846144) (not e!725377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83071 (_ BitVec 32)) Bool)

(assert (=> b!1272168 (= res!846144 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50920 () Bool)

(assert (=> mapIsEmpty!50920 mapRes!50920))

(declare-fun res!846143 () Bool)

(assert (=> start!107428 (=> (not res!846143) (not e!725377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107428 (= res!846143 (validMask!0 mask!1730))))

(assert (=> start!107428 e!725377))

(declare-fun array_inv!30649 (array!83073) Bool)

(assert (=> start!107428 (and (array_inv!30649 _values!1134) e!725379)))

(assert (=> start!107428 true))

(declare-fun array_inv!30650 (array!83071) Bool)

(assert (=> start!107428 (array_inv!30650 _keys!1364)))

(declare-fun b!1272169 () Bool)

(assert (=> b!1272169 (= e!725378 tp_is_empty!32893)))

(assert (= (and start!107428 res!846143) b!1272167))

(assert (= (and b!1272167 res!846142) b!1272168))

(assert (= (and b!1272168 res!846144) b!1272164))

(assert (= (and b!1272166 condMapEmpty!50920) mapIsEmpty!50920))

(assert (= (and b!1272166 (not condMapEmpty!50920)) mapNonEmpty!50920))

(get-info :version)

(assert (= (and mapNonEmpty!50920 ((_ is ValueCellFull!15593) mapValue!50920)) b!1272165))

(assert (= (and b!1272166 ((_ is ValueCellFull!15593) mapDefault!50920)) b!1272169))

(assert (= start!107428 b!1272166))

(declare-fun m!1170615 () Bool)

(assert (=> b!1272164 m!1170615))

(declare-fun m!1170617 () Bool)

(assert (=> mapNonEmpty!50920 m!1170617))

(declare-fun m!1170619 () Bool)

(assert (=> b!1272168 m!1170619))

(declare-fun m!1170621 () Bool)

(assert (=> start!107428 m!1170621))

(declare-fun m!1170623 () Bool)

(assert (=> start!107428 m!1170623))

(declare-fun m!1170625 () Bool)

(assert (=> start!107428 m!1170625))

(check-sat (not mapNonEmpty!50920) (not b!1272168) (not start!107428) (not b!1272164) tp_is_empty!32893)
(check-sat)
