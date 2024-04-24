; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107212 () Bool)

(assert start!107212)

(declare-fun res!844848 () Bool)

(declare-fun e!723759 () Bool)

(assert (=> start!107212 (=> (not res!844848) (not e!723759))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107212 (= res!844848 (validMask!0 mask!1730))))

(assert (=> start!107212 e!723759))

(declare-datatypes ((V!48763 0))(
  ( (V!48764 (val!16413 Int)) )
))
(declare-datatypes ((ValueCell!15485 0))(
  ( (ValueCellFull!15485 (v!19045 V!48763)) (EmptyCell!15485) )
))
(declare-datatypes ((array!82671 0))(
  ( (array!82672 (arr!39868 (Array (_ BitVec 32) ValueCell!15485)) (size!40405 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82671)

(declare-fun e!723758 () Bool)

(declare-fun array_inv!30507 (array!82671) Bool)

(assert (=> start!107212 (and (array_inv!30507 _values!1134) e!723758)))

(assert (=> start!107212 true))

(declare-datatypes ((array!82673 0))(
  ( (array!82674 (arr!39869 (Array (_ BitVec 32) (_ BitVec 64))) (size!40406 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82673)

(declare-fun array_inv!30508 (array!82673) Bool)

(assert (=> start!107212 (array_inv!30508 _keys!1364)))

(declare-fun b!1269896 () Bool)

(declare-fun e!723757 () Bool)

(declare-fun tp_is_empty!32677 () Bool)

(assert (=> b!1269896 (= e!723757 tp_is_empty!32677)))

(declare-fun b!1269897 () Bool)

(declare-fun e!723760 () Bool)

(assert (=> b!1269897 (= e!723760 tp_is_empty!32677)))

(declare-fun b!1269898 () Bool)

(declare-fun mapRes!50596 () Bool)

(assert (=> b!1269898 (= e!723758 (and e!723760 mapRes!50596))))

(declare-fun condMapEmpty!50596 () Bool)

(declare-fun mapDefault!50596 () ValueCell!15485)

(assert (=> b!1269898 (= condMapEmpty!50596 (= (arr!39868 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15485)) mapDefault!50596)))))

(declare-fun b!1269899 () Bool)

(declare-fun res!844847 () Bool)

(assert (=> b!1269899 (=> (not res!844847) (not e!723759))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82673 (_ BitVec 32)) Bool)

(assert (=> b!1269899 (= res!844847 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50596 () Bool)

(declare-fun tp!96775 () Bool)

(assert (=> mapNonEmpty!50596 (= mapRes!50596 (and tp!96775 e!723757))))

(declare-fun mapKey!50596 () (_ BitVec 32))

(declare-fun mapRest!50596 () (Array (_ BitVec 32) ValueCell!15485))

(declare-fun mapValue!50596 () ValueCell!15485)

(assert (=> mapNonEmpty!50596 (= (arr!39868 _values!1134) (store mapRest!50596 mapKey!50596 mapValue!50596))))

(declare-fun b!1269900 () Bool)

(assert (=> b!1269900 (= e!723759 false)))

(declare-fun lt!574936 () Bool)

(declare-datatypes ((List!28422 0))(
  ( (Nil!28419) (Cons!28418 (h!29636 (_ BitVec 64)) (t!41943 List!28422)) )
))
(declare-fun arrayNoDuplicates!0 (array!82673 (_ BitVec 32) List!28422) Bool)

(assert (=> b!1269900 (= lt!574936 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28419))))

(declare-fun b!1269901 () Bool)

(declare-fun res!844846 () Bool)

(assert (=> b!1269901 (=> (not res!844846) (not e!723759))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269901 (= res!844846 (and (= (size!40405 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40406 _keys!1364) (size!40405 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50596 () Bool)

(assert (=> mapIsEmpty!50596 mapRes!50596))

(assert (= (and start!107212 res!844848) b!1269901))

(assert (= (and b!1269901 res!844846) b!1269899))

(assert (= (and b!1269899 res!844847) b!1269900))

(assert (= (and b!1269898 condMapEmpty!50596) mapIsEmpty!50596))

(assert (= (and b!1269898 (not condMapEmpty!50596)) mapNonEmpty!50596))

(get-info :version)

(assert (= (and mapNonEmpty!50596 ((_ is ValueCellFull!15485) mapValue!50596)) b!1269896))

(assert (= (and b!1269898 ((_ is ValueCellFull!15485) mapDefault!50596)) b!1269897))

(assert (= start!107212 b!1269898))

(declare-fun m!1168995 () Bool)

(assert (=> start!107212 m!1168995))

(declare-fun m!1168997 () Bool)

(assert (=> start!107212 m!1168997))

(declare-fun m!1168999 () Bool)

(assert (=> start!107212 m!1168999))

(declare-fun m!1169001 () Bool)

(assert (=> b!1269899 m!1169001))

(declare-fun m!1169003 () Bool)

(assert (=> mapNonEmpty!50596 m!1169003))

(declare-fun m!1169005 () Bool)

(assert (=> b!1269900 m!1169005))

(check-sat (not b!1269899) tp_is_empty!32677 (not b!1269900) (not mapNonEmpty!50596) (not start!107212))
(check-sat)
