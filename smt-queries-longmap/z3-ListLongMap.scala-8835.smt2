; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107458 () Bool)

(assert start!107458)

(declare-fun b!1272434 () Bool)

(declare-fun e!725604 () Bool)

(declare-fun e!725602 () Bool)

(declare-fun mapRes!50965 () Bool)

(assert (=> b!1272434 (= e!725604 (and e!725602 mapRes!50965))))

(declare-fun condMapEmpty!50965 () Bool)

(declare-datatypes ((V!49091 0))(
  ( (V!49092 (val!16536 Int)) )
))
(declare-datatypes ((ValueCell!15608 0))(
  ( (ValueCellFull!15608 (v!19168 V!49091)) (EmptyCell!15608) )
))
(declare-datatypes ((array!83127 0))(
  ( (array!83128 (arr!40096 (Array (_ BitVec 32) ValueCell!15608)) (size!40633 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83127)

(declare-fun mapDefault!50965 () ValueCell!15608)

(assert (=> b!1272434 (= condMapEmpty!50965 (= (arr!40096 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15608)) mapDefault!50965)))))

(declare-fun b!1272435 () Bool)

(declare-fun tp_is_empty!32923 () Bool)

(assert (=> b!1272435 (= e!725602 tp_is_empty!32923)))

(declare-fun b!1272436 () Bool)

(declare-fun res!846277 () Bool)

(declare-fun e!725601 () Bool)

(assert (=> b!1272436 (=> (not res!846277) (not e!725601))))

(declare-datatypes ((array!83129 0))(
  ( (array!83130 (arr!40097 (Array (_ BitVec 32) (_ BitVec 64))) (size!40634 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83129)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83129 (_ BitVec 32)) Bool)

(assert (=> b!1272436 (= res!846277 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272437 () Bool)

(declare-fun e!725603 () Bool)

(assert (=> b!1272437 (= e!725603 tp_is_empty!32923)))

(declare-fun mapNonEmpty!50965 () Bool)

(declare-fun tp!97306 () Bool)

(assert (=> mapNonEmpty!50965 (= mapRes!50965 (and tp!97306 e!725603))))

(declare-fun mapKey!50965 () (_ BitVec 32))

(declare-fun mapRest!50965 () (Array (_ BitVec 32) ValueCell!15608))

(declare-fun mapValue!50965 () ValueCell!15608)

(assert (=> mapNonEmpty!50965 (= (arr!40096 _values!1134) (store mapRest!50965 mapKey!50965 mapValue!50965))))

(declare-fun res!846278 () Bool)

(assert (=> start!107458 (=> (not res!846278) (not e!725601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107458 (= res!846278 (validMask!0 mask!1730))))

(assert (=> start!107458 e!725601))

(declare-fun array_inv!30665 (array!83127) Bool)

(assert (=> start!107458 (and (array_inv!30665 _values!1134) e!725604)))

(assert (=> start!107458 true))

(declare-fun array_inv!30666 (array!83129) Bool)

(assert (=> start!107458 (array_inv!30666 _keys!1364)))

(declare-fun mapIsEmpty!50965 () Bool)

(assert (=> mapIsEmpty!50965 mapRes!50965))

(declare-fun b!1272438 () Bool)

(assert (=> b!1272438 (= e!725601 false)))

(declare-fun lt!575305 () Bool)

(declare-datatypes ((List!28546 0))(
  ( (Nil!28543) (Cons!28542 (h!29760 (_ BitVec 64)) (t!42067 List!28546)) )
))
(declare-fun arrayNoDuplicates!0 (array!83129 (_ BitVec 32) List!28546) Bool)

(assert (=> b!1272438 (= lt!575305 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28543))))

(declare-fun b!1272439 () Bool)

(declare-fun res!846279 () Bool)

(assert (=> b!1272439 (=> (not res!846279) (not e!725601))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272439 (= res!846279 (and (= (size!40633 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40634 _keys!1364) (size!40633 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107458 res!846278) b!1272439))

(assert (= (and b!1272439 res!846279) b!1272436))

(assert (= (and b!1272436 res!846277) b!1272438))

(assert (= (and b!1272434 condMapEmpty!50965) mapIsEmpty!50965))

(assert (= (and b!1272434 (not condMapEmpty!50965)) mapNonEmpty!50965))

(get-info :version)

(assert (= (and mapNonEmpty!50965 ((_ is ValueCellFull!15608) mapValue!50965)) b!1272437))

(assert (= (and b!1272434 ((_ is ValueCellFull!15608) mapDefault!50965)) b!1272435))

(assert (= start!107458 b!1272434))

(declare-fun m!1170795 () Bool)

(assert (=> b!1272436 m!1170795))

(declare-fun m!1170797 () Bool)

(assert (=> mapNonEmpty!50965 m!1170797))

(declare-fun m!1170799 () Bool)

(assert (=> start!107458 m!1170799))

(declare-fun m!1170801 () Bool)

(assert (=> start!107458 m!1170801))

(declare-fun m!1170803 () Bool)

(assert (=> start!107458 m!1170803))

(declare-fun m!1170805 () Bool)

(assert (=> b!1272438 m!1170805))

(check-sat tp_is_empty!32923 (not start!107458) (not b!1272436) (not b!1272438) (not mapNonEmpty!50965))
(check-sat)
