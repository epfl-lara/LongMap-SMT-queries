; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107132 () Bool)

(assert start!107132)

(declare-fun b_free!27637 () Bool)

(declare-fun b_next!27637 () Bool)

(assert (=> start!107132 (= b_free!27637 (not b_next!27637))))

(declare-fun tp!97138 () Bool)

(declare-fun b_and!45651 () Bool)

(assert (=> start!107132 (= tp!97138 b_and!45651)))

(declare-fun mapIsEmpty!50812 () Bool)

(declare-fun mapRes!50812 () Bool)

(assert (=> mapIsEmpty!50812 mapRes!50812))

(declare-fun b!1270115 () Bool)

(declare-fun e!723964 () Bool)

(declare-fun e!723963 () Bool)

(assert (=> b!1270115 (= e!723964 (and e!723963 mapRes!50812))))

(declare-fun condMapEmpty!50812 () Bool)

(declare-datatypes ((V!48955 0))(
  ( (V!48956 (val!16485 Int)) )
))
(declare-datatypes ((ValueCell!15557 0))(
  ( (ValueCellFull!15557 (v!19121 V!48955)) (EmptyCell!15557) )
))
(declare-datatypes ((array!82817 0))(
  ( (array!82818 (arr!39946 (Array (_ BitVec 32) ValueCell!15557)) (size!40484 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82817)

(declare-fun mapDefault!50812 () ValueCell!15557)

(assert (=> b!1270115 (= condMapEmpty!50812 (= (arr!39946 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15557)) mapDefault!50812)))))

(declare-fun b!1270116 () Bool)

(declare-fun e!723962 () Bool)

(declare-fun tp_is_empty!32821 () Bool)

(assert (=> b!1270116 (= e!723962 tp_is_empty!32821)))

(declare-fun b!1270117 () Bool)

(declare-fun res!845240 () Bool)

(declare-fun e!723961 () Bool)

(assert (=> b!1270117 (=> (not res!845240) (not e!723961))))

(declare-datatypes ((array!82819 0))(
  ( (array!82820 (arr!39947 (Array (_ BitVec 32) (_ BitVec 64))) (size!40485 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82819)

(declare-datatypes ((List!28550 0))(
  ( (Nil!28547) (Cons!28546 (h!29755 (_ BitVec 64)) (t!42071 List!28550)) )
))
(declare-fun arrayNoDuplicates!0 (array!82819 (_ BitVec 32) List!28550) Bool)

(assert (=> b!1270117 (= res!845240 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28547))))

(declare-fun b!1270118 () Bool)

(assert (=> b!1270118 (= e!723963 tp_is_empty!32821)))

(declare-fun b!1270119 () Bool)

(assert (=> b!1270119 (= e!723961 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48955)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48955)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48955)

(declare-fun zeroValueBefore!52 () V!48955)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21434 0))(
  ( (tuple2!21435 (_1!10728 (_ BitVec 64)) (_2!10728 V!48955)) )
))
(declare-datatypes ((List!28551 0))(
  ( (Nil!28548) (Cons!28547 (h!29756 tuple2!21434) (t!42072 List!28551)) )
))
(declare-datatypes ((ListLongMap!19163 0))(
  ( (ListLongMap!19164 (toList!9597 List!28551)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5930 (array!82819 array!82817 (_ BitVec 32) (_ BitVec 32) V!48955 V!48955 (_ BitVec 32) Int) ListLongMap!19163)

(assert (=> b!1270119 (= (getCurrentListMapNoExtraKeys!5930 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5930 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42148 0))(
  ( (Unit!42149) )
))
(declare-fun lt!574490 () Unit!42148)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1230 (array!82819 array!82817 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48955 V!48955 V!48955 V!48955 (_ BitVec 32) Int) Unit!42148)

(assert (=> b!1270119 (= lt!574490 (lemmaNoChangeToArrayThenSameMapNoExtras!1230 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun res!845241 () Bool)

(assert (=> start!107132 (=> (not res!845241) (not e!723961))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107132 (= res!845241 (validMask!0 mask!1730))))

(assert (=> start!107132 e!723961))

(declare-fun array_inv!30549 (array!82817) Bool)

(assert (=> start!107132 (and (array_inv!30549 _values!1134) e!723964)))

(assert (=> start!107132 true))

(declare-fun array_inv!30550 (array!82819) Bool)

(assert (=> start!107132 (array_inv!30550 _keys!1364)))

(assert (=> start!107132 tp_is_empty!32821))

(assert (=> start!107132 tp!97138))

(declare-fun b!1270120 () Bool)

(declare-fun res!845243 () Bool)

(assert (=> b!1270120 (=> (not res!845243) (not e!723961))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82819 (_ BitVec 32)) Bool)

(assert (=> b!1270120 (= res!845243 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50812 () Bool)

(declare-fun tp!97139 () Bool)

(assert (=> mapNonEmpty!50812 (= mapRes!50812 (and tp!97139 e!723962))))

(declare-fun mapRest!50812 () (Array (_ BitVec 32) ValueCell!15557))

(declare-fun mapKey!50812 () (_ BitVec 32))

(declare-fun mapValue!50812 () ValueCell!15557)

(assert (=> mapNonEmpty!50812 (= (arr!39946 _values!1134) (store mapRest!50812 mapKey!50812 mapValue!50812))))

(declare-fun b!1270121 () Bool)

(declare-fun res!845239 () Bool)

(assert (=> b!1270121 (=> (not res!845239) (not e!723961))))

(assert (=> b!1270121 (= res!845239 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40485 _keys!1364)) (bvslt from!1698 (size!40485 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270122 () Bool)

(declare-fun res!845242 () Bool)

(assert (=> b!1270122 (=> (not res!845242) (not e!723961))))

(assert (=> b!1270122 (= res!845242 (and (= (size!40484 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40485 _keys!1364) (size!40484 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(assert (= (and start!107132 res!845241) b!1270122))

(assert (= (and b!1270122 res!845242) b!1270120))

(assert (= (and b!1270120 res!845243) b!1270117))

(assert (= (and b!1270117 res!845240) b!1270121))

(assert (= (and b!1270121 res!845239) b!1270119))

(assert (= (and b!1270115 condMapEmpty!50812) mapIsEmpty!50812))

(assert (= (and b!1270115 (not condMapEmpty!50812)) mapNonEmpty!50812))

(get-info :version)

(assert (= (and mapNonEmpty!50812 ((_ is ValueCellFull!15557) mapValue!50812)) b!1270116))

(assert (= (and b!1270115 ((_ is ValueCellFull!15557) mapDefault!50812)) b!1270118))

(assert (= start!107132 b!1270115))

(declare-fun m!1168035 () Bool)

(assert (=> b!1270117 m!1168035))

(declare-fun m!1168037 () Bool)

(assert (=> b!1270119 m!1168037))

(declare-fun m!1168039 () Bool)

(assert (=> b!1270119 m!1168039))

(declare-fun m!1168041 () Bool)

(assert (=> b!1270119 m!1168041))

(declare-fun m!1168043 () Bool)

(assert (=> start!107132 m!1168043))

(declare-fun m!1168045 () Bool)

(assert (=> start!107132 m!1168045))

(declare-fun m!1168047 () Bool)

(assert (=> start!107132 m!1168047))

(declare-fun m!1168049 () Bool)

(assert (=> b!1270120 m!1168049))

(declare-fun m!1168051 () Bool)

(assert (=> mapNonEmpty!50812 m!1168051))

(check-sat (not b!1270120) (not b_next!27637) (not b!1270117) tp_is_empty!32821 (not mapNonEmpty!50812) b_and!45651 (not b!1270119) (not start!107132))
(check-sat b_and!45651 (not b_next!27637))
