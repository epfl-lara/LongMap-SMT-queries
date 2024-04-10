; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107164 () Bool)

(assert start!107164)

(declare-fun b!1270499 () Bool)

(declare-fun e!724231 () Bool)

(declare-fun e!724232 () Bool)

(declare-fun mapRes!50860 () Bool)

(assert (=> b!1270499 (= e!724231 (and e!724232 mapRes!50860))))

(declare-fun condMapEmpty!50860 () Bool)

(declare-datatypes ((V!48997 0))(
  ( (V!48998 (val!16501 Int)) )
))
(declare-datatypes ((ValueCell!15573 0))(
  ( (ValueCellFull!15573 (v!19138 V!48997)) (EmptyCell!15573) )
))
(declare-datatypes ((array!82968 0))(
  ( (array!82969 (arr!40021 (Array (_ BitVec 32) ValueCell!15573)) (size!40557 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82968)

(declare-fun mapDefault!50860 () ValueCell!15573)

(assert (=> b!1270499 (= condMapEmpty!50860 (= (arr!40021 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15573)) mapDefault!50860)))))

(declare-fun b!1270500 () Bool)

(declare-fun res!845443 () Bool)

(declare-fun e!724233 () Bool)

(assert (=> b!1270500 (=> (not res!845443) (not e!724233))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-datatypes ((array!82970 0))(
  ( (array!82971 (arr!40022 (Array (_ BitVec 32) (_ BitVec 64))) (size!40558 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82970)

(assert (=> b!1270500 (= res!845443 (and (= (size!40557 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40558 _keys!1364) (size!40557 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50860 () Bool)

(assert (=> mapIsEmpty!50860 mapRes!50860))

(declare-fun b!1270501 () Bool)

(declare-fun e!724229 () Bool)

(declare-fun tp_is_empty!32853 () Bool)

(assert (=> b!1270501 (= e!724229 tp_is_empty!32853)))

(declare-fun b!1270502 () Bool)

(assert (=> b!1270502 (= e!724232 tp_is_empty!32853)))

(declare-fun res!845442 () Bool)

(assert (=> start!107164 (=> (not res!845442) (not e!724233))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107164 (= res!845442 (validMask!0 mask!1730))))

(assert (=> start!107164 e!724233))

(declare-fun array_inv!30443 (array!82968) Bool)

(assert (=> start!107164 (and (array_inv!30443 _values!1134) e!724231)))

(assert (=> start!107164 true))

(declare-fun array_inv!30444 (array!82970) Bool)

(assert (=> start!107164 (array_inv!30444 _keys!1364)))

(declare-fun mapNonEmpty!50860 () Bool)

(declare-fun tp!97201 () Bool)

(assert (=> mapNonEmpty!50860 (= mapRes!50860 (and tp!97201 e!724229))))

(declare-fun mapKey!50860 () (_ BitVec 32))

(declare-fun mapRest!50860 () (Array (_ BitVec 32) ValueCell!15573))

(declare-fun mapValue!50860 () ValueCell!15573)

(assert (=> mapNonEmpty!50860 (= (arr!40021 _values!1134) (store mapRest!50860 mapKey!50860 mapValue!50860))))

(declare-fun b!1270503 () Bool)

(declare-fun res!845444 () Bool)

(assert (=> b!1270503 (=> (not res!845444) (not e!724233))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82970 (_ BitVec 32)) Bool)

(assert (=> b!1270503 (= res!845444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270504 () Bool)

(assert (=> b!1270504 (= e!724233 false)))

(declare-fun lt!574716 () Bool)

(declare-datatypes ((List!28490 0))(
  ( (Nil!28487) (Cons!28486 (h!29695 (_ BitVec 64)) (t!42019 List!28490)) )
))
(declare-fun arrayNoDuplicates!0 (array!82970 (_ BitVec 32) List!28490) Bool)

(assert (=> b!1270504 (= lt!574716 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28487))))

(assert (= (and start!107164 res!845442) b!1270500))

(assert (= (and b!1270500 res!845443) b!1270503))

(assert (= (and b!1270503 res!845444) b!1270504))

(assert (= (and b!1270499 condMapEmpty!50860) mapIsEmpty!50860))

(assert (= (and b!1270499 (not condMapEmpty!50860)) mapNonEmpty!50860))

(get-info :version)

(assert (= (and mapNonEmpty!50860 ((_ is ValueCellFull!15573) mapValue!50860)) b!1270501))

(assert (= (and b!1270499 ((_ is ValueCellFull!15573) mapDefault!50860)) b!1270502))

(assert (= start!107164 b!1270499))

(declare-fun m!1168763 () Bool)

(assert (=> start!107164 m!1168763))

(declare-fun m!1168765 () Bool)

(assert (=> start!107164 m!1168765))

(declare-fun m!1168767 () Bool)

(assert (=> start!107164 m!1168767))

(declare-fun m!1168769 () Bool)

(assert (=> mapNonEmpty!50860 m!1168769))

(declare-fun m!1168771 () Bool)

(assert (=> b!1270503 m!1168771))

(declare-fun m!1168773 () Bool)

(assert (=> b!1270504 m!1168773))

(check-sat tp_is_empty!32853 (not b!1270503) (not mapNonEmpty!50860) (not start!107164) (not b!1270504))
(check-sat)
