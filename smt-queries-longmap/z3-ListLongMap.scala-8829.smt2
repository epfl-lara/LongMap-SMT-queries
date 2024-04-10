; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107200 () Bool)

(assert start!107200)

(declare-fun b!1270823 () Bool)

(declare-fun res!845606 () Bool)

(declare-fun e!724503 () Bool)

(assert (=> b!1270823 (=> (not res!845606) (not e!724503))))

(declare-datatypes ((V!49045 0))(
  ( (V!49046 (val!16519 Int)) )
))
(declare-datatypes ((ValueCell!15591 0))(
  ( (ValueCellFull!15591 (v!19156 V!49045)) (EmptyCell!15591) )
))
(declare-datatypes ((array!83036 0))(
  ( (array!83037 (arr!40055 (Array (_ BitVec 32) ValueCell!15591)) (size!40591 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83036)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83038 0))(
  ( (array!83039 (arr!40056 (Array (_ BitVec 32) (_ BitVec 64))) (size!40592 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83038)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270823 (= res!845606 (and (= (size!40591 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40592 _keys!1364) (size!40591 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50914 () Bool)

(declare-fun mapRes!50914 () Bool)

(declare-fun tp!97255 () Bool)

(declare-fun e!724501 () Bool)

(assert (=> mapNonEmpty!50914 (= mapRes!50914 (and tp!97255 e!724501))))

(declare-fun mapValue!50914 () ValueCell!15591)

(declare-fun mapKey!50914 () (_ BitVec 32))

(declare-fun mapRest!50914 () (Array (_ BitVec 32) ValueCell!15591))

(assert (=> mapNonEmpty!50914 (= (arr!40055 _values!1134) (store mapRest!50914 mapKey!50914 mapValue!50914))))

(declare-fun mapIsEmpty!50914 () Bool)

(assert (=> mapIsEmpty!50914 mapRes!50914))

(declare-fun b!1270825 () Bool)

(declare-fun e!724502 () Bool)

(declare-fun tp_is_empty!32889 () Bool)

(assert (=> b!1270825 (= e!724502 tp_is_empty!32889)))

(declare-fun b!1270826 () Bool)

(assert (=> b!1270826 (= e!724501 tp_is_empty!32889)))

(declare-fun b!1270824 () Bool)

(declare-fun e!724500 () Bool)

(assert (=> b!1270824 (= e!724500 (and e!724502 mapRes!50914))))

(declare-fun condMapEmpty!50914 () Bool)

(declare-fun mapDefault!50914 () ValueCell!15591)

(assert (=> b!1270824 (= condMapEmpty!50914 (= (arr!40055 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15591)) mapDefault!50914)))))

(declare-fun res!845604 () Bool)

(assert (=> start!107200 (=> (not res!845604) (not e!724503))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107200 (= res!845604 (validMask!0 mask!1730))))

(assert (=> start!107200 e!724503))

(declare-fun array_inv!30467 (array!83036) Bool)

(assert (=> start!107200 (and (array_inv!30467 _values!1134) e!724500)))

(assert (=> start!107200 true))

(declare-fun array_inv!30468 (array!83038) Bool)

(assert (=> start!107200 (array_inv!30468 _keys!1364)))

(declare-fun b!1270827 () Bool)

(assert (=> b!1270827 (= e!724503 false)))

(declare-fun lt!574770 () Bool)

(declare-datatypes ((List!28503 0))(
  ( (Nil!28500) (Cons!28499 (h!29708 (_ BitVec 64)) (t!42032 List!28503)) )
))
(declare-fun arrayNoDuplicates!0 (array!83038 (_ BitVec 32) List!28503) Bool)

(assert (=> b!1270827 (= lt!574770 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28500))))

(declare-fun b!1270828 () Bool)

(declare-fun res!845605 () Bool)

(assert (=> b!1270828 (=> (not res!845605) (not e!724503))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83038 (_ BitVec 32)) Bool)

(assert (=> b!1270828 (= res!845605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107200 res!845604) b!1270823))

(assert (= (and b!1270823 res!845606) b!1270828))

(assert (= (and b!1270828 res!845605) b!1270827))

(assert (= (and b!1270824 condMapEmpty!50914) mapIsEmpty!50914))

(assert (= (and b!1270824 (not condMapEmpty!50914)) mapNonEmpty!50914))

(get-info :version)

(assert (= (and mapNonEmpty!50914 ((_ is ValueCellFull!15591) mapValue!50914)) b!1270826))

(assert (= (and b!1270824 ((_ is ValueCellFull!15591) mapDefault!50914)) b!1270825))

(assert (= start!107200 b!1270824))

(declare-fun m!1168979 () Bool)

(assert (=> mapNonEmpty!50914 m!1168979))

(declare-fun m!1168981 () Bool)

(assert (=> start!107200 m!1168981))

(declare-fun m!1168983 () Bool)

(assert (=> start!107200 m!1168983))

(declare-fun m!1168985 () Bool)

(assert (=> start!107200 m!1168985))

(declare-fun m!1168987 () Bool)

(assert (=> b!1270827 m!1168987))

(declare-fun m!1168989 () Bool)

(assert (=> b!1270828 m!1168989))

(check-sat (not b!1270827) (not b!1270828) tp_is_empty!32889 (not start!107200) (not mapNonEmpty!50914))
(check-sat)
