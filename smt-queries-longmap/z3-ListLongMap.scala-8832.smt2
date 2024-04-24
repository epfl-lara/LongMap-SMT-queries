; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107440 () Bool)

(assert start!107440)

(declare-fun b!1272272 () Bool)

(declare-fun res!846198 () Bool)

(declare-fun e!725469 () Bool)

(assert (=> b!1272272 (=> (not res!846198) (not e!725469))))

(declare-datatypes ((array!83093 0))(
  ( (array!83094 (arr!40079 (Array (_ BitVec 32) (_ BitVec 64))) (size!40616 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83093)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83093 (_ BitVec 32)) Bool)

(assert (=> b!1272272 (= res!846198 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!846196 () Bool)

(assert (=> start!107440 (=> (not res!846196) (not e!725469))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107440 (= res!846196 (validMask!0 mask!1730))))

(assert (=> start!107440 e!725469))

(declare-datatypes ((V!49067 0))(
  ( (V!49068 (val!16527 Int)) )
))
(declare-datatypes ((ValueCell!15599 0))(
  ( (ValueCellFull!15599 (v!19159 V!49067)) (EmptyCell!15599) )
))
(declare-datatypes ((array!83095 0))(
  ( (array!83096 (arr!40080 (Array (_ BitVec 32) ValueCell!15599)) (size!40617 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83095)

(declare-fun e!725466 () Bool)

(declare-fun array_inv!30655 (array!83095) Bool)

(assert (=> start!107440 (and (array_inv!30655 _values!1134) e!725466)))

(assert (=> start!107440 true))

(declare-fun array_inv!30656 (array!83093) Bool)

(assert (=> start!107440 (array_inv!30656 _keys!1364)))

(declare-fun mapIsEmpty!50938 () Bool)

(declare-fun mapRes!50938 () Bool)

(assert (=> mapIsEmpty!50938 mapRes!50938))

(declare-fun b!1272273 () Bool)

(declare-fun e!725470 () Bool)

(declare-fun tp_is_empty!32905 () Bool)

(assert (=> b!1272273 (= e!725470 tp_is_empty!32905)))

(declare-fun b!1272274 () Bool)

(declare-fun e!725467 () Bool)

(assert (=> b!1272274 (= e!725467 tp_is_empty!32905)))

(declare-fun mapNonEmpty!50938 () Bool)

(declare-fun tp!97279 () Bool)

(assert (=> mapNonEmpty!50938 (= mapRes!50938 (and tp!97279 e!725470))))

(declare-fun mapValue!50938 () ValueCell!15599)

(declare-fun mapKey!50938 () (_ BitVec 32))

(declare-fun mapRest!50938 () (Array (_ BitVec 32) ValueCell!15599))

(assert (=> mapNonEmpty!50938 (= (arr!40080 _values!1134) (store mapRest!50938 mapKey!50938 mapValue!50938))))

(declare-fun b!1272275 () Bool)

(declare-fun res!846197 () Bool)

(assert (=> b!1272275 (=> (not res!846197) (not e!725469))))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(assert (=> b!1272275 (= res!846197 (and (= (size!40617 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40616 _keys!1364) (size!40617 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1272276 () Bool)

(assert (=> b!1272276 (= e!725466 (and e!725467 mapRes!50938))))

(declare-fun condMapEmpty!50938 () Bool)

(declare-fun mapDefault!50938 () ValueCell!15599)

(assert (=> b!1272276 (= condMapEmpty!50938 (= (arr!40080 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15599)) mapDefault!50938)))))

(declare-fun b!1272277 () Bool)

(assert (=> b!1272277 (= e!725469 false)))

(declare-fun lt!575278 () Bool)

(declare-datatypes ((List!28539 0))(
  ( (Nil!28536) (Cons!28535 (h!29753 (_ BitVec 64)) (t!42060 List!28539)) )
))
(declare-fun arrayNoDuplicates!0 (array!83093 (_ BitVec 32) List!28539) Bool)

(assert (=> b!1272277 (= lt!575278 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28536))))

(assert (= (and start!107440 res!846196) b!1272275))

(assert (= (and b!1272275 res!846197) b!1272272))

(assert (= (and b!1272272 res!846198) b!1272277))

(assert (= (and b!1272276 condMapEmpty!50938) mapIsEmpty!50938))

(assert (= (and b!1272276 (not condMapEmpty!50938)) mapNonEmpty!50938))

(get-info :version)

(assert (= (and mapNonEmpty!50938 ((_ is ValueCellFull!15599) mapValue!50938)) b!1272273))

(assert (= (and b!1272276 ((_ is ValueCellFull!15599) mapDefault!50938)) b!1272274))

(assert (= start!107440 b!1272276))

(declare-fun m!1170687 () Bool)

(assert (=> b!1272272 m!1170687))

(declare-fun m!1170689 () Bool)

(assert (=> start!107440 m!1170689))

(declare-fun m!1170691 () Bool)

(assert (=> start!107440 m!1170691))

(declare-fun m!1170693 () Bool)

(assert (=> start!107440 m!1170693))

(declare-fun m!1170695 () Bool)

(assert (=> mapNonEmpty!50938 m!1170695))

(declare-fun m!1170697 () Bool)

(assert (=> b!1272277 m!1170697))

(check-sat (not mapNonEmpty!50938) (not start!107440) (not b!1272272) tp_is_empty!32905 (not b!1272277))
(check-sat)
