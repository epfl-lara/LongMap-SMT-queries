; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107368 () Bool)

(assert start!107368)

(declare-fun b!1271624 () Bool)

(declare-fun e!724926 () Bool)

(declare-fun e!724928 () Bool)

(declare-fun mapRes!50830 () Bool)

(assert (=> b!1271624 (= e!724926 (and e!724928 mapRes!50830))))

(declare-fun condMapEmpty!50830 () Bool)

(declare-datatypes ((V!48971 0))(
  ( (V!48972 (val!16491 Int)) )
))
(declare-datatypes ((ValueCell!15563 0))(
  ( (ValueCellFull!15563 (v!19123 V!48971)) (EmptyCell!15563) )
))
(declare-datatypes ((array!82959 0))(
  ( (array!82960 (arr!40012 (Array (_ BitVec 32) ValueCell!15563)) (size!40549 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82959)

(declare-fun mapDefault!50830 () ValueCell!15563)

(assert (=> b!1271624 (= condMapEmpty!50830 (= (arr!40012 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15563)) mapDefault!50830)))))

(declare-fun b!1271625 () Bool)

(declare-fun e!724930 () Bool)

(assert (=> b!1271625 (= e!724930 false)))

(declare-fun lt!575170 () Bool)

(declare-datatypes ((array!82961 0))(
  ( (array!82962 (arr!40013 (Array (_ BitVec 32) (_ BitVec 64))) (size!40550 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82961)

(declare-datatypes ((List!28516 0))(
  ( (Nil!28513) (Cons!28512 (h!29730 (_ BitVec 64)) (t!42037 List!28516)) )
))
(declare-fun arrayNoDuplicates!0 (array!82961 (_ BitVec 32) List!28516) Bool)

(assert (=> b!1271625 (= lt!575170 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28513))))

(declare-fun res!845874 () Bool)

(assert (=> start!107368 (=> (not res!845874) (not e!724930))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107368 (= res!845874 (validMask!0 mask!1730))))

(assert (=> start!107368 e!724930))

(declare-fun array_inv!30609 (array!82959) Bool)

(assert (=> start!107368 (and (array_inv!30609 _values!1134) e!724926)))

(assert (=> start!107368 true))

(declare-fun array_inv!30610 (array!82961) Bool)

(assert (=> start!107368 (array_inv!30610 _keys!1364)))

(declare-fun b!1271626 () Bool)

(declare-fun res!845873 () Bool)

(assert (=> b!1271626 (=> (not res!845873) (not e!724930))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271626 (= res!845873 (and (= (size!40549 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40550 _keys!1364) (size!40549 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271627 () Bool)

(declare-fun e!724927 () Bool)

(declare-fun tp_is_empty!32833 () Bool)

(assert (=> b!1271627 (= e!724927 tp_is_empty!32833)))

(declare-fun b!1271628 () Bool)

(declare-fun res!845872 () Bool)

(assert (=> b!1271628 (=> (not res!845872) (not e!724930))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82961 (_ BitVec 32)) Bool)

(assert (=> b!1271628 (= res!845872 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50830 () Bool)

(declare-fun tp!97171 () Bool)

(assert (=> mapNonEmpty!50830 (= mapRes!50830 (and tp!97171 e!724927))))

(declare-fun mapKey!50830 () (_ BitVec 32))

(declare-fun mapValue!50830 () ValueCell!15563)

(declare-fun mapRest!50830 () (Array (_ BitVec 32) ValueCell!15563))

(assert (=> mapNonEmpty!50830 (= (arr!40012 _values!1134) (store mapRest!50830 mapKey!50830 mapValue!50830))))

(declare-fun b!1271629 () Bool)

(assert (=> b!1271629 (= e!724928 tp_is_empty!32833)))

(declare-fun mapIsEmpty!50830 () Bool)

(assert (=> mapIsEmpty!50830 mapRes!50830))

(assert (= (and start!107368 res!845874) b!1271626))

(assert (= (and b!1271626 res!845873) b!1271628))

(assert (= (and b!1271628 res!845872) b!1271625))

(assert (= (and b!1271624 condMapEmpty!50830) mapIsEmpty!50830))

(assert (= (and b!1271624 (not condMapEmpty!50830)) mapNonEmpty!50830))

(get-info :version)

(assert (= (and mapNonEmpty!50830 ((_ is ValueCellFull!15563) mapValue!50830)) b!1271627))

(assert (= (and b!1271624 ((_ is ValueCellFull!15563) mapDefault!50830)) b!1271629))

(assert (= start!107368 b!1271624))

(declare-fun m!1170255 () Bool)

(assert (=> b!1271625 m!1170255))

(declare-fun m!1170257 () Bool)

(assert (=> start!107368 m!1170257))

(declare-fun m!1170259 () Bool)

(assert (=> start!107368 m!1170259))

(declare-fun m!1170261 () Bool)

(assert (=> start!107368 m!1170261))

(declare-fun m!1170263 () Bool)

(assert (=> b!1271628 m!1170263))

(declare-fun m!1170265 () Bool)

(assert (=> mapNonEmpty!50830 m!1170265))

(check-sat (not mapNonEmpty!50830) (not b!1271625) (not start!107368) (not b!1271628) tp_is_empty!32833)
(check-sat)
