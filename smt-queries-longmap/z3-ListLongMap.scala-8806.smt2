; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107062 () Bool)

(assert start!107062)

(declare-fun b_free!27567 () Bool)

(declare-fun b_next!27567 () Bool)

(assert (=> start!107062 (= b_free!27567 (not b_next!27567))))

(declare-fun tp!96927 () Bool)

(declare-fun b_and!45599 () Bool)

(assert (=> start!107062 (= tp!96927 b_and!45599)))

(declare-fun b!1269339 () Bool)

(declare-fun e!723468 () Bool)

(declare-fun tp_is_empty!32751 () Bool)

(assert (=> b!1269339 (= e!723468 tp_is_empty!32751)))

(declare-fun b!1269340 () Bool)

(declare-fun res!844744 () Bool)

(declare-fun e!723466 () Bool)

(assert (=> b!1269340 (=> (not res!844744) (not e!723466))))

(declare-datatypes ((V!48861 0))(
  ( (V!48862 (val!16450 Int)) )
))
(declare-datatypes ((ValueCell!15522 0))(
  ( (ValueCellFull!15522 (v!19087 V!48861)) (EmptyCell!15522) )
))
(declare-datatypes ((array!82766 0))(
  ( (array!82767 (arr!39920 (Array (_ BitVec 32) ValueCell!15522)) (size!40456 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82766)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82768 0))(
  ( (array!82769 (arr!39921 (Array (_ BitVec 32) (_ BitVec 64))) (size!40457 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82768)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269340 (= res!844744 (and (= (size!40456 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40457 _keys!1364) (size!40456 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!844743 () Bool)

(assert (=> start!107062 (=> (not res!844743) (not e!723466))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107062 (= res!844743 (validMask!0 mask!1730))))

(assert (=> start!107062 e!723466))

(declare-fun e!723467 () Bool)

(declare-fun array_inv!30371 (array!82766) Bool)

(assert (=> start!107062 (and (array_inv!30371 _values!1134) e!723467)))

(assert (=> start!107062 true))

(declare-fun array_inv!30372 (array!82768) Bool)

(assert (=> start!107062 (array_inv!30372 _keys!1364)))

(assert (=> start!107062 tp_is_empty!32751))

(assert (=> start!107062 tp!96927))

(declare-fun b!1269341 () Bool)

(declare-fun res!844745 () Bool)

(assert (=> b!1269341 (=> (not res!844745) (not e!723466))))

(declare-datatypes ((List!28421 0))(
  ( (Nil!28418) (Cons!28417 (h!29626 (_ BitVec 64)) (t!41950 List!28421)) )
))
(declare-fun arrayNoDuplicates!0 (array!82768 (_ BitVec 32) List!28421) Bool)

(assert (=> b!1269341 (= res!844745 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28418))))

(declare-fun mapIsEmpty!50707 () Bool)

(declare-fun mapRes!50707 () Bool)

(assert (=> mapIsEmpty!50707 mapRes!50707))

(declare-fun b!1269342 () Bool)

(declare-fun res!844741 () Bool)

(assert (=> b!1269342 (=> (not res!844741) (not e!723466))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1269342 (= res!844741 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40457 _keys!1364)) (bvslt from!1698 (size!40457 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269343 () Bool)

(declare-fun e!723465 () Bool)

(assert (=> b!1269343 (= e!723467 (and e!723465 mapRes!50707))))

(declare-fun condMapEmpty!50707 () Bool)

(declare-fun mapDefault!50707 () ValueCell!15522)

(assert (=> b!1269343 (= condMapEmpty!50707 (= (arr!39920 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15522)) mapDefault!50707)))))

(declare-fun b!1269344 () Bool)

(assert (=> b!1269344 (= e!723466 (not true))))

(declare-fun minValueBefore!52 () V!48861)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48861)

(declare-fun zeroValueBefore!52 () V!48861)

(declare-fun minValueAfter!52 () V!48861)

(declare-datatypes ((tuple2!21308 0))(
  ( (tuple2!21309 (_1!10665 (_ BitVec 64)) (_2!10665 V!48861)) )
))
(declare-datatypes ((List!28422 0))(
  ( (Nil!28419) (Cons!28418 (h!29627 tuple2!21308) (t!41951 List!28422)) )
))
(declare-datatypes ((ListLongMap!19037 0))(
  ( (ListLongMap!19038 (toList!9534 List!28422)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5866 (array!82768 array!82766 (_ BitVec 32) (_ BitVec 32) V!48861 V!48861 (_ BitVec 32) Int) ListLongMap!19037)

(assert (=> b!1269344 (= (getCurrentListMapNoExtraKeys!5866 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5866 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42254 0))(
  ( (Unit!42255) )
))
(declare-fun lt!574563 () Unit!42254)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1208 (array!82768 array!82766 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48861 V!48861 V!48861 V!48861 (_ BitVec 32) Int) Unit!42254)

(assert (=> b!1269344 (= lt!574563 (lemmaNoChangeToArrayThenSameMapNoExtras!1208 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269345 () Bool)

(assert (=> b!1269345 (= e!723465 tp_is_empty!32751)))

(declare-fun b!1269346 () Bool)

(declare-fun res!844742 () Bool)

(assert (=> b!1269346 (=> (not res!844742) (not e!723466))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82768 (_ BitVec 32)) Bool)

(assert (=> b!1269346 (= res!844742 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50707 () Bool)

(declare-fun tp!96928 () Bool)

(assert (=> mapNonEmpty!50707 (= mapRes!50707 (and tp!96928 e!723468))))

(declare-fun mapRest!50707 () (Array (_ BitVec 32) ValueCell!15522))

(declare-fun mapKey!50707 () (_ BitVec 32))

(declare-fun mapValue!50707 () ValueCell!15522)

(assert (=> mapNonEmpty!50707 (= (arr!39920 _values!1134) (store mapRest!50707 mapKey!50707 mapValue!50707))))

(assert (= (and start!107062 res!844743) b!1269340))

(assert (= (and b!1269340 res!844744) b!1269346))

(assert (= (and b!1269346 res!844742) b!1269341))

(assert (= (and b!1269341 res!844745) b!1269342))

(assert (= (and b!1269342 res!844741) b!1269344))

(assert (= (and b!1269343 condMapEmpty!50707) mapIsEmpty!50707))

(assert (= (and b!1269343 (not condMapEmpty!50707)) mapNonEmpty!50707))

(get-info :version)

(assert (= (and mapNonEmpty!50707 ((_ is ValueCellFull!15522) mapValue!50707)) b!1269339))

(assert (= (and b!1269343 ((_ is ValueCellFull!15522) mapDefault!50707)) b!1269345))

(assert (= start!107062 b!1269343))

(declare-fun m!1167905 () Bool)

(assert (=> b!1269344 m!1167905))

(declare-fun m!1167907 () Bool)

(assert (=> b!1269344 m!1167907))

(declare-fun m!1167909 () Bool)

(assert (=> b!1269344 m!1167909))

(declare-fun m!1167911 () Bool)

(assert (=> b!1269341 m!1167911))

(declare-fun m!1167913 () Bool)

(assert (=> b!1269346 m!1167913))

(declare-fun m!1167915 () Bool)

(assert (=> start!107062 m!1167915))

(declare-fun m!1167917 () Bool)

(assert (=> start!107062 m!1167917))

(declare-fun m!1167919 () Bool)

(assert (=> start!107062 m!1167919))

(declare-fun m!1167921 () Bool)

(assert (=> mapNonEmpty!50707 m!1167921))

(check-sat tp_is_empty!32751 b_and!45599 (not mapNonEmpty!50707) (not b_next!27567) (not b!1269344) (not b!1269341) (not start!107062) (not b!1269346))
(check-sat b_and!45599 (not b_next!27567))
