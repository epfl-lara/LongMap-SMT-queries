; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107488 () Bool)

(assert start!107488)

(declare-fun b!1272705 () Bool)

(declare-fun e!725829 () Bool)

(assert (=> b!1272705 (= e!725829 false)))

(declare-fun lt!575350 () Bool)

(declare-datatypes ((array!83181 0))(
  ( (array!83182 (arr!40123 (Array (_ BitVec 32) (_ BitVec 64))) (size!40660 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83181)

(declare-datatypes ((List!28552 0))(
  ( (Nil!28549) (Cons!28548 (h!29766 (_ BitVec 64)) (t!42073 List!28552)) )
))
(declare-fun arrayNoDuplicates!0 (array!83181 (_ BitVec 32) List!28552) Bool)

(assert (=> b!1272705 (= lt!575350 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28549))))

(declare-fun b!1272706 () Bool)

(declare-fun e!725830 () Bool)

(declare-fun tp_is_empty!32953 () Bool)

(assert (=> b!1272706 (= e!725830 tp_is_empty!32953)))

(declare-fun mapIsEmpty!51010 () Bool)

(declare-fun mapRes!51010 () Bool)

(assert (=> mapIsEmpty!51010 mapRes!51010))

(declare-fun mapNonEmpty!51010 () Bool)

(declare-fun tp!97351 () Bool)

(assert (=> mapNonEmpty!51010 (= mapRes!51010 (and tp!97351 e!725830))))

(declare-datatypes ((V!49131 0))(
  ( (V!49132 (val!16551 Int)) )
))
(declare-datatypes ((ValueCell!15623 0))(
  ( (ValueCellFull!15623 (v!19183 V!49131)) (EmptyCell!15623) )
))
(declare-datatypes ((array!83183 0))(
  ( (array!83184 (arr!40124 (Array (_ BitVec 32) ValueCell!15623)) (size!40661 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83183)

(declare-fun mapKey!51010 () (_ BitVec 32))

(declare-fun mapValue!51010 () ValueCell!15623)

(declare-fun mapRest!51010 () (Array (_ BitVec 32) ValueCell!15623))

(assert (=> mapNonEmpty!51010 (= (arr!40124 _values!1134) (store mapRest!51010 mapKey!51010 mapValue!51010))))

(declare-fun b!1272707 () Bool)

(declare-fun res!846414 () Bool)

(assert (=> b!1272707 (=> (not res!846414) (not e!725829))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272707 (= res!846414 (and (= (size!40661 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40660 _keys!1364) (size!40661 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1272708 () Bool)

(declare-fun res!846413 () Bool)

(assert (=> b!1272708 (=> (not res!846413) (not e!725829))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83181 (_ BitVec 32)) Bool)

(assert (=> b!1272708 (= res!846413 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272709 () Bool)

(declare-fun e!725826 () Bool)

(declare-fun e!725827 () Bool)

(assert (=> b!1272709 (= e!725826 (and e!725827 mapRes!51010))))

(declare-fun condMapEmpty!51010 () Bool)

(declare-fun mapDefault!51010 () ValueCell!15623)

(assert (=> b!1272709 (= condMapEmpty!51010 (= (arr!40124 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15623)) mapDefault!51010)))))

(declare-fun res!846412 () Bool)

(assert (=> start!107488 (=> (not res!846412) (not e!725829))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107488 (= res!846412 (validMask!0 mask!1730))))

(assert (=> start!107488 e!725829))

(declare-fun array_inv!30681 (array!83183) Bool)

(assert (=> start!107488 (and (array_inv!30681 _values!1134) e!725826)))

(assert (=> start!107488 true))

(declare-fun array_inv!30682 (array!83181) Bool)

(assert (=> start!107488 (array_inv!30682 _keys!1364)))

(declare-fun b!1272704 () Bool)

(assert (=> b!1272704 (= e!725827 tp_is_empty!32953)))

(assert (= (and start!107488 res!846412) b!1272707))

(assert (= (and b!1272707 res!846414) b!1272708))

(assert (= (and b!1272708 res!846413) b!1272705))

(assert (= (and b!1272709 condMapEmpty!51010) mapIsEmpty!51010))

(assert (= (and b!1272709 (not condMapEmpty!51010)) mapNonEmpty!51010))

(get-info :version)

(assert (= (and mapNonEmpty!51010 ((_ is ValueCellFull!15623) mapValue!51010)) b!1272706))

(assert (= (and b!1272709 ((_ is ValueCellFull!15623) mapDefault!51010)) b!1272704))

(assert (= start!107488 b!1272709))

(declare-fun m!1170975 () Bool)

(assert (=> b!1272705 m!1170975))

(declare-fun m!1170977 () Bool)

(assert (=> mapNonEmpty!51010 m!1170977))

(declare-fun m!1170979 () Bool)

(assert (=> b!1272708 m!1170979))

(declare-fun m!1170981 () Bool)

(assert (=> start!107488 m!1170981))

(declare-fun m!1170983 () Bool)

(assert (=> start!107488 m!1170983))

(declare-fun m!1170985 () Bool)

(assert (=> start!107488 m!1170985))

(check-sat (not b!1272705) (not b!1272708) (not start!107488) (not mapNonEmpty!51010) tp_is_empty!32953)
(check-sat)
