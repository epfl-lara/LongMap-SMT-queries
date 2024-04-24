; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107434 () Bool)

(assert start!107434)

(declare-fun res!846170 () Bool)

(declare-fun e!725421 () Bool)

(assert (=> start!107434 (=> (not res!846170) (not e!725421))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107434 (= res!846170 (validMask!0 mask!1730))))

(assert (=> start!107434 e!725421))

(declare-datatypes ((V!49059 0))(
  ( (V!49060 (val!16524 Int)) )
))
(declare-datatypes ((ValueCell!15596 0))(
  ( (ValueCellFull!15596 (v!19156 V!49059)) (EmptyCell!15596) )
))
(declare-datatypes ((array!83081 0))(
  ( (array!83082 (arr!40073 (Array (_ BitVec 32) ValueCell!15596)) (size!40610 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83081)

(declare-fun e!725422 () Bool)

(declare-fun array_inv!30653 (array!83081) Bool)

(assert (=> start!107434 (and (array_inv!30653 _values!1134) e!725422)))

(assert (=> start!107434 true))

(declare-datatypes ((array!83083 0))(
  ( (array!83084 (arr!40074 (Array (_ BitVec 32) (_ BitVec 64))) (size!40611 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83083)

(declare-fun array_inv!30654 (array!83083) Bool)

(assert (=> start!107434 (array_inv!30654 _keys!1364)))

(declare-fun b!1272218 () Bool)

(declare-fun res!846171 () Bool)

(assert (=> b!1272218 (=> (not res!846171) (not e!725421))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1272218 (= res!846171 (and (= (size!40610 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40611 _keys!1364) (size!40610 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1272219 () Bool)

(declare-fun e!725423 () Bool)

(declare-fun tp_is_empty!32899 () Bool)

(assert (=> b!1272219 (= e!725423 tp_is_empty!32899)))

(declare-fun b!1272220 () Bool)

(declare-fun res!846169 () Bool)

(assert (=> b!1272220 (=> (not res!846169) (not e!725421))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83083 (_ BitVec 32)) Bool)

(assert (=> b!1272220 (= res!846169 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1272221 () Bool)

(declare-fun e!725424 () Bool)

(assert (=> b!1272221 (= e!725424 tp_is_empty!32899)))

(declare-fun b!1272222 () Bool)

(assert (=> b!1272222 (= e!725421 false)))

(declare-fun lt!575269 () Bool)

(declare-datatypes ((List!28537 0))(
  ( (Nil!28534) (Cons!28533 (h!29751 (_ BitVec 64)) (t!42058 List!28537)) )
))
(declare-fun arrayNoDuplicates!0 (array!83083 (_ BitVec 32) List!28537) Bool)

(assert (=> b!1272222 (= lt!575269 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28534))))

(declare-fun mapIsEmpty!50929 () Bool)

(declare-fun mapRes!50929 () Bool)

(assert (=> mapIsEmpty!50929 mapRes!50929))

(declare-fun mapNonEmpty!50929 () Bool)

(declare-fun tp!97270 () Bool)

(assert (=> mapNonEmpty!50929 (= mapRes!50929 (and tp!97270 e!725424))))

(declare-fun mapRest!50929 () (Array (_ BitVec 32) ValueCell!15596))

(declare-fun mapKey!50929 () (_ BitVec 32))

(declare-fun mapValue!50929 () ValueCell!15596)

(assert (=> mapNonEmpty!50929 (= (arr!40073 _values!1134) (store mapRest!50929 mapKey!50929 mapValue!50929))))

(declare-fun b!1272223 () Bool)

(assert (=> b!1272223 (= e!725422 (and e!725423 mapRes!50929))))

(declare-fun condMapEmpty!50929 () Bool)

(declare-fun mapDefault!50929 () ValueCell!15596)

(assert (=> b!1272223 (= condMapEmpty!50929 (= (arr!40073 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15596)) mapDefault!50929)))))

(assert (= (and start!107434 res!846170) b!1272218))

(assert (= (and b!1272218 res!846171) b!1272220))

(assert (= (and b!1272220 res!846169) b!1272222))

(assert (= (and b!1272223 condMapEmpty!50929) mapIsEmpty!50929))

(assert (= (and b!1272223 (not condMapEmpty!50929)) mapNonEmpty!50929))

(get-info :version)

(assert (= (and mapNonEmpty!50929 ((_ is ValueCellFull!15596) mapValue!50929)) b!1272221))

(assert (= (and b!1272223 ((_ is ValueCellFull!15596) mapDefault!50929)) b!1272219))

(assert (= start!107434 b!1272223))

(declare-fun m!1170651 () Bool)

(assert (=> start!107434 m!1170651))

(declare-fun m!1170653 () Bool)

(assert (=> start!107434 m!1170653))

(declare-fun m!1170655 () Bool)

(assert (=> start!107434 m!1170655))

(declare-fun m!1170657 () Bool)

(assert (=> b!1272220 m!1170657))

(declare-fun m!1170659 () Bool)

(assert (=> b!1272222 m!1170659))

(declare-fun m!1170661 () Bool)

(assert (=> mapNonEmpty!50929 m!1170661))

(check-sat (not start!107434) (not b!1272220) (not mapNonEmpty!50929) (not b!1272222) tp_is_empty!32899)
(check-sat)
