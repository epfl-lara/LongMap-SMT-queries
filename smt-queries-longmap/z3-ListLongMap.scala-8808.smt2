; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107072 () Bool)

(assert start!107072)

(declare-fun b_free!27577 () Bool)

(declare-fun b_next!27577 () Bool)

(assert (=> start!107072 (= b_free!27577 (not b_next!27577))))

(declare-fun tp!96958 () Bool)

(declare-fun b_and!45591 () Bool)

(assert (=> start!107072 (= tp!96958 b_and!45591)))

(declare-fun b!1269395 () Bool)

(declare-fun e!723513 () Bool)

(declare-fun tp_is_empty!32761 () Bool)

(assert (=> b!1269395 (= e!723513 tp_is_empty!32761)))

(declare-fun mapNonEmpty!50722 () Bool)

(declare-fun mapRes!50722 () Bool)

(declare-fun tp!96959 () Bool)

(assert (=> mapNonEmpty!50722 (= mapRes!50722 (and tp!96959 e!723513))))

(declare-datatypes ((V!48875 0))(
  ( (V!48876 (val!16455 Int)) )
))
(declare-datatypes ((ValueCell!15527 0))(
  ( (ValueCellFull!15527 (v!19091 V!48875)) (EmptyCell!15527) )
))
(declare-datatypes ((array!82703 0))(
  ( (array!82704 (arr!39889 (Array (_ BitVec 32) ValueCell!15527)) (size!40427 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82703)

(declare-fun mapValue!50722 () ValueCell!15527)

(declare-fun mapRest!50722 () (Array (_ BitVec 32) ValueCell!15527))

(declare-fun mapKey!50722 () (_ BitVec 32))

(assert (=> mapNonEmpty!50722 (= (arr!39889 _values!1134) (store mapRest!50722 mapKey!50722 mapValue!50722))))

(declare-fun mapIsEmpty!50722 () Bool)

(assert (=> mapIsEmpty!50722 mapRes!50722))

(declare-fun b!1269396 () Bool)

(declare-fun res!844791 () Bool)

(declare-fun e!723514 () Bool)

(assert (=> b!1269396 (=> (not res!844791) (not e!723514))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-datatypes ((array!82705 0))(
  ( (array!82706 (arr!39890 (Array (_ BitVec 32) (_ BitVec 64))) (size!40428 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82705)

(assert (=> b!1269396 (= res!844791 (and (= (size!40427 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40428 _keys!1364) (size!40427 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269398 () Bool)

(declare-fun res!844793 () Bool)

(assert (=> b!1269398 (=> (not res!844793) (not e!723514))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82705 (_ BitVec 32)) Bool)

(assert (=> b!1269398 (= res!844793 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269399 () Bool)

(declare-fun res!844792 () Bool)

(assert (=> b!1269399 (=> (not res!844792) (not e!723514))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1269399 (= res!844792 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40428 _keys!1364)) (bvslt from!1698 (size!40428 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269400 () Bool)

(declare-fun res!844789 () Bool)

(assert (=> b!1269400 (=> (not res!844789) (not e!723514))))

(declare-datatypes ((List!28514 0))(
  ( (Nil!28511) (Cons!28510 (h!29719 (_ BitVec 64)) (t!42035 List!28514)) )
))
(declare-fun arrayNoDuplicates!0 (array!82705 (_ BitVec 32) List!28514) Bool)

(assert (=> b!1269400 (= res!844789 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28511))))

(declare-fun b!1269401 () Bool)

(declare-fun e!723511 () Bool)

(assert (=> b!1269401 (= e!723511 tp_is_empty!32761)))

(declare-fun b!1269402 () Bool)

(assert (=> b!1269402 (= e!723514 (not true))))

(declare-fun minValueAfter!52 () V!48875)

(declare-fun minValueBefore!52 () V!48875)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48875)

(declare-fun zeroValueBefore!52 () V!48875)

(declare-datatypes ((tuple2!21398 0))(
  ( (tuple2!21399 (_1!10710 (_ BitVec 64)) (_2!10710 V!48875)) )
))
(declare-datatypes ((List!28515 0))(
  ( (Nil!28512) (Cons!28511 (h!29720 tuple2!21398) (t!42036 List!28515)) )
))
(declare-datatypes ((ListLongMap!19127 0))(
  ( (ListLongMap!19128 (toList!9579 List!28515)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5912 (array!82705 array!82703 (_ BitVec 32) (_ BitVec 32) V!48875 V!48875 (_ BitVec 32) Int) ListLongMap!19127)

(assert (=> b!1269402 (= (getCurrentListMapNoExtraKeys!5912 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5912 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42112 0))(
  ( (Unit!42113) )
))
(declare-fun lt!574400 () Unit!42112)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1212 (array!82705 array!82703 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48875 V!48875 V!48875 V!48875 (_ BitVec 32) Int) Unit!42112)

(assert (=> b!1269402 (= lt!574400 (lemmaNoChangeToArrayThenSameMapNoExtras!1212 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun res!844790 () Bool)

(assert (=> start!107072 (=> (not res!844790) (not e!723514))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107072 (= res!844790 (validMask!0 mask!1730))))

(assert (=> start!107072 e!723514))

(declare-fun e!723512 () Bool)

(declare-fun array_inv!30511 (array!82703) Bool)

(assert (=> start!107072 (and (array_inv!30511 _values!1134) e!723512)))

(assert (=> start!107072 true))

(declare-fun array_inv!30512 (array!82705) Bool)

(assert (=> start!107072 (array_inv!30512 _keys!1364)))

(assert (=> start!107072 tp_is_empty!32761))

(assert (=> start!107072 tp!96958))

(declare-fun b!1269397 () Bool)

(assert (=> b!1269397 (= e!723512 (and e!723511 mapRes!50722))))

(declare-fun condMapEmpty!50722 () Bool)

(declare-fun mapDefault!50722 () ValueCell!15527)

(assert (=> b!1269397 (= condMapEmpty!50722 (= (arr!39889 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15527)) mapDefault!50722)))))

(assert (= (and start!107072 res!844790) b!1269396))

(assert (= (and b!1269396 res!844791) b!1269398))

(assert (= (and b!1269398 res!844793) b!1269400))

(assert (= (and b!1269400 res!844789) b!1269399))

(assert (= (and b!1269399 res!844792) b!1269402))

(assert (= (and b!1269397 condMapEmpty!50722) mapIsEmpty!50722))

(assert (= (and b!1269397 (not condMapEmpty!50722)) mapNonEmpty!50722))

(get-info :version)

(assert (= (and mapNonEmpty!50722 ((_ is ValueCellFull!15527) mapValue!50722)) b!1269395))

(assert (= (and b!1269397 ((_ is ValueCellFull!15527) mapDefault!50722)) b!1269401))

(assert (= start!107072 b!1269397))

(declare-fun m!1167495 () Bool)

(assert (=> b!1269402 m!1167495))

(declare-fun m!1167497 () Bool)

(assert (=> b!1269402 m!1167497))

(declare-fun m!1167499 () Bool)

(assert (=> b!1269402 m!1167499))

(declare-fun m!1167501 () Bool)

(assert (=> b!1269400 m!1167501))

(declare-fun m!1167503 () Bool)

(assert (=> mapNonEmpty!50722 m!1167503))

(declare-fun m!1167505 () Bool)

(assert (=> start!107072 m!1167505))

(declare-fun m!1167507 () Bool)

(assert (=> start!107072 m!1167507))

(declare-fun m!1167509 () Bool)

(assert (=> start!107072 m!1167509))

(declare-fun m!1167511 () Bool)

(assert (=> b!1269398 m!1167511))

(check-sat (not b!1269402) (not b_next!27577) (not b!1269398) tp_is_empty!32761 (not mapNonEmpty!50722) (not start!107072) b_and!45591 (not b!1269400))
(check-sat b_and!45591 (not b_next!27577))
