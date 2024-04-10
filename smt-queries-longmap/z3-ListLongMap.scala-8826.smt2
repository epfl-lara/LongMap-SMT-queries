; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107182 () Bool)

(assert start!107182)

(declare-fun b!1270661 () Bool)

(declare-fun e!724366 () Bool)

(declare-fun e!724368 () Bool)

(declare-fun mapRes!50887 () Bool)

(assert (=> b!1270661 (= e!724366 (and e!724368 mapRes!50887))))

(declare-fun condMapEmpty!50887 () Bool)

(declare-datatypes ((V!49021 0))(
  ( (V!49022 (val!16510 Int)) )
))
(declare-datatypes ((ValueCell!15582 0))(
  ( (ValueCellFull!15582 (v!19147 V!49021)) (EmptyCell!15582) )
))
(declare-datatypes ((array!83000 0))(
  ( (array!83001 (arr!40037 (Array (_ BitVec 32) ValueCell!15582)) (size!40573 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83000)

(declare-fun mapDefault!50887 () ValueCell!15582)

(assert (=> b!1270661 (= condMapEmpty!50887 (= (arr!40037 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15582)) mapDefault!50887)))))

(declare-fun b!1270662 () Bool)

(declare-fun tp_is_empty!32871 () Bool)

(assert (=> b!1270662 (= e!724368 tp_is_empty!32871)))

(declare-fun b!1270663 () Bool)

(declare-fun e!724367 () Bool)

(assert (=> b!1270663 (= e!724367 tp_is_empty!32871)))

(declare-fun b!1270664 () Bool)

(declare-fun res!845523 () Bool)

(declare-fun e!724364 () Bool)

(assert (=> b!1270664 (=> (not res!845523) (not e!724364))))

(declare-datatypes ((array!83002 0))(
  ( (array!83003 (arr!40038 (Array (_ BitVec 32) (_ BitVec 64))) (size!40574 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83002)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83002 (_ BitVec 32)) Bool)

(assert (=> b!1270664 (= res!845523 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!845525 () Bool)

(assert (=> start!107182 (=> (not res!845525) (not e!724364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107182 (= res!845525 (validMask!0 mask!1730))))

(assert (=> start!107182 e!724364))

(declare-fun array_inv!30455 (array!83000) Bool)

(assert (=> start!107182 (and (array_inv!30455 _values!1134) e!724366)))

(assert (=> start!107182 true))

(declare-fun array_inv!30456 (array!83002) Bool)

(assert (=> start!107182 (array_inv!30456 _keys!1364)))

(declare-fun mapNonEmpty!50887 () Bool)

(declare-fun tp!97228 () Bool)

(assert (=> mapNonEmpty!50887 (= mapRes!50887 (and tp!97228 e!724367))))

(declare-fun mapKey!50887 () (_ BitVec 32))

(declare-fun mapRest!50887 () (Array (_ BitVec 32) ValueCell!15582))

(declare-fun mapValue!50887 () ValueCell!15582)

(assert (=> mapNonEmpty!50887 (= (arr!40037 _values!1134) (store mapRest!50887 mapKey!50887 mapValue!50887))))

(declare-fun mapIsEmpty!50887 () Bool)

(assert (=> mapIsEmpty!50887 mapRes!50887))

(declare-fun b!1270665 () Bool)

(assert (=> b!1270665 (= e!724364 false)))

(declare-fun lt!574743 () Bool)

(declare-datatypes ((List!28497 0))(
  ( (Nil!28494) (Cons!28493 (h!29702 (_ BitVec 64)) (t!42026 List!28497)) )
))
(declare-fun arrayNoDuplicates!0 (array!83002 (_ BitVec 32) List!28497) Bool)

(assert (=> b!1270665 (= lt!574743 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28494))))

(declare-fun b!1270666 () Bool)

(declare-fun res!845524 () Bool)

(assert (=> b!1270666 (=> (not res!845524) (not e!724364))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270666 (= res!845524 (and (= (size!40573 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40574 _keys!1364) (size!40573 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107182 res!845525) b!1270666))

(assert (= (and b!1270666 res!845524) b!1270664))

(assert (= (and b!1270664 res!845523) b!1270665))

(assert (= (and b!1270661 condMapEmpty!50887) mapIsEmpty!50887))

(assert (= (and b!1270661 (not condMapEmpty!50887)) mapNonEmpty!50887))

(get-info :version)

(assert (= (and mapNonEmpty!50887 ((_ is ValueCellFull!15582) mapValue!50887)) b!1270663))

(assert (= (and b!1270661 ((_ is ValueCellFull!15582) mapDefault!50887)) b!1270662))

(assert (= start!107182 b!1270661))

(declare-fun m!1168871 () Bool)

(assert (=> b!1270664 m!1168871))

(declare-fun m!1168873 () Bool)

(assert (=> start!107182 m!1168873))

(declare-fun m!1168875 () Bool)

(assert (=> start!107182 m!1168875))

(declare-fun m!1168877 () Bool)

(assert (=> start!107182 m!1168877))

(declare-fun m!1168879 () Bool)

(assert (=> mapNonEmpty!50887 m!1168879))

(declare-fun m!1168881 () Bool)

(assert (=> b!1270665 m!1168881))

(check-sat (not start!107182) (not b!1270664) (not b!1270665) (not mapNonEmpty!50887) tp_is_empty!32871)
(check-sat)
