; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107398 () Bool)

(assert start!107398)

(declare-fun b!1271894 () Bool)

(declare-fun e!725153 () Bool)

(declare-fun e!725151 () Bool)

(declare-fun mapRes!50875 () Bool)

(assert (=> b!1271894 (= e!725153 (and e!725151 mapRes!50875))))

(declare-fun condMapEmpty!50875 () Bool)

(declare-datatypes ((V!49011 0))(
  ( (V!49012 (val!16506 Int)) )
))
(declare-datatypes ((ValueCell!15578 0))(
  ( (ValueCellFull!15578 (v!19138 V!49011)) (EmptyCell!15578) )
))
(declare-datatypes ((array!83015 0))(
  ( (array!83016 (arr!40040 (Array (_ BitVec 32) ValueCell!15578)) (size!40577 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83015)

(declare-fun mapDefault!50875 () ValueCell!15578)

(assert (=> b!1271894 (= condMapEmpty!50875 (= (arr!40040 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15578)) mapDefault!50875)))))

(declare-fun mapIsEmpty!50875 () Bool)

(assert (=> mapIsEmpty!50875 mapRes!50875))

(declare-fun res!846007 () Bool)

(declare-fun e!725155 () Bool)

(assert (=> start!107398 (=> (not res!846007) (not e!725155))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107398 (= res!846007 (validMask!0 mask!1730))))

(assert (=> start!107398 e!725155))

(declare-fun array_inv!30625 (array!83015) Bool)

(assert (=> start!107398 (and (array_inv!30625 _values!1134) e!725153)))

(assert (=> start!107398 true))

(declare-datatypes ((array!83017 0))(
  ( (array!83018 (arr!40041 (Array (_ BitVec 32) (_ BitVec 64))) (size!40578 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83017)

(declare-fun array_inv!30626 (array!83017) Bool)

(assert (=> start!107398 (array_inv!30626 _keys!1364)))

(declare-fun b!1271895 () Bool)

(declare-fun tp_is_empty!32863 () Bool)

(assert (=> b!1271895 (= e!725151 tp_is_empty!32863)))

(declare-fun b!1271896 () Bool)

(assert (=> b!1271896 (= e!725155 false)))

(declare-fun lt!575215 () Bool)

(declare-datatypes ((List!28527 0))(
  ( (Nil!28524) (Cons!28523 (h!29741 (_ BitVec 64)) (t!42048 List!28527)) )
))
(declare-fun arrayNoDuplicates!0 (array!83017 (_ BitVec 32) List!28527) Bool)

(assert (=> b!1271896 (= lt!575215 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28524))))

(declare-fun b!1271897 () Bool)

(declare-fun res!846008 () Bool)

(assert (=> b!1271897 (=> (not res!846008) (not e!725155))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83017 (_ BitVec 32)) Bool)

(assert (=> b!1271897 (= res!846008 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271898 () Bool)

(declare-fun res!846009 () Bool)

(assert (=> b!1271898 (=> (not res!846009) (not e!725155))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271898 (= res!846009 (and (= (size!40577 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40578 _keys!1364) (size!40577 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271899 () Bool)

(declare-fun e!725152 () Bool)

(assert (=> b!1271899 (= e!725152 tp_is_empty!32863)))

(declare-fun mapNonEmpty!50875 () Bool)

(declare-fun tp!97216 () Bool)

(assert (=> mapNonEmpty!50875 (= mapRes!50875 (and tp!97216 e!725152))))

(declare-fun mapKey!50875 () (_ BitVec 32))

(declare-fun mapValue!50875 () ValueCell!15578)

(declare-fun mapRest!50875 () (Array (_ BitVec 32) ValueCell!15578))

(assert (=> mapNonEmpty!50875 (= (arr!40040 _values!1134) (store mapRest!50875 mapKey!50875 mapValue!50875))))

(assert (= (and start!107398 res!846007) b!1271898))

(assert (= (and b!1271898 res!846009) b!1271897))

(assert (= (and b!1271897 res!846008) b!1271896))

(assert (= (and b!1271894 condMapEmpty!50875) mapIsEmpty!50875))

(assert (= (and b!1271894 (not condMapEmpty!50875)) mapNonEmpty!50875))

(get-info :version)

(assert (= (and mapNonEmpty!50875 ((_ is ValueCellFull!15578) mapValue!50875)) b!1271899))

(assert (= (and b!1271894 ((_ is ValueCellFull!15578) mapDefault!50875)) b!1271895))

(assert (= start!107398 b!1271894))

(declare-fun m!1170435 () Bool)

(assert (=> start!107398 m!1170435))

(declare-fun m!1170437 () Bool)

(assert (=> start!107398 m!1170437))

(declare-fun m!1170439 () Bool)

(assert (=> start!107398 m!1170439))

(declare-fun m!1170441 () Bool)

(assert (=> b!1271896 m!1170441))

(declare-fun m!1170443 () Bool)

(assert (=> b!1271897 m!1170443))

(declare-fun m!1170445 () Bool)

(assert (=> mapNonEmpty!50875 m!1170445))

(check-sat (not mapNonEmpty!50875) (not b!1271896) (not start!107398) tp_is_empty!32863 (not b!1271897))
(check-sat)
