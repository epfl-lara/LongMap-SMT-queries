; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107048 () Bool)

(assert start!107048)

(declare-fun b_free!27553 () Bool)

(declare-fun b_next!27553 () Bool)

(assert (=> start!107048 (= b_free!27553 (not b_next!27553))))

(declare-fun tp!96886 () Bool)

(declare-fun b_and!45567 () Bool)

(assert (=> start!107048 (= tp!96886 b_and!45567)))

(declare-fun b!1269107 () Bool)

(declare-fun e!723333 () Bool)

(assert (=> b!1269107 (= e!723333 (not true))))

(declare-datatypes ((V!48843 0))(
  ( (V!48844 (val!16443 Int)) )
))
(declare-datatypes ((ValueCell!15515 0))(
  ( (ValueCellFull!15515 (v!19079 V!48843)) (EmptyCell!15515) )
))
(declare-datatypes ((array!82659 0))(
  ( (array!82660 (arr!39867 (Array (_ BitVec 32) ValueCell!15515)) (size!40405 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82659)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82661 0))(
  ( (array!82662 (arr!39868 (Array (_ BitVec 32) (_ BitVec 64))) (size!40406 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82661)

(declare-fun minValueAfter!52 () V!48843)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48843)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48843)

(declare-fun zeroValueBefore!52 () V!48843)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21382 0))(
  ( (tuple2!21383 (_1!10702 (_ BitVec 64)) (_2!10702 V!48843)) )
))
(declare-datatypes ((List!28499 0))(
  ( (Nil!28496) (Cons!28495 (h!29704 tuple2!21382) (t!42020 List!28499)) )
))
(declare-datatypes ((ListLongMap!19111 0))(
  ( (ListLongMap!19112 (toList!9571 List!28499)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5904 (array!82661 array!82659 (_ BitVec 32) (_ BitVec 32) V!48843 V!48843 (_ BitVec 32) Int) ListLongMap!19111)

(assert (=> b!1269107 (= (getCurrentListMapNoExtraKeys!5904 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5904 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42096 0))(
  ( (Unit!42097) )
))
(declare-fun lt!574364 () Unit!42096)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1204 (array!82661 array!82659 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48843 V!48843 V!48843 V!48843 (_ BitVec 32) Int) Unit!42096)

(assert (=> b!1269107 (= lt!574364 (lemmaNoChangeToArrayThenSameMapNoExtras!1204 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!50686 () Bool)

(declare-fun mapRes!50686 () Bool)

(declare-fun tp!96887 () Bool)

(declare-fun e!723334 () Bool)

(assert (=> mapNonEmpty!50686 (= mapRes!50686 (and tp!96887 e!723334))))

(declare-fun mapRest!50686 () (Array (_ BitVec 32) ValueCell!15515))

(declare-fun mapValue!50686 () ValueCell!15515)

(declare-fun mapKey!50686 () (_ BitVec 32))

(assert (=> mapNonEmpty!50686 (= (arr!39867 _values!1134) (store mapRest!50686 mapKey!50686 mapValue!50686))))

(declare-fun b!1269108 () Bool)

(declare-fun tp_is_empty!32737 () Bool)

(assert (=> b!1269108 (= e!723334 tp_is_empty!32737)))

(declare-fun b!1269109 () Bool)

(declare-fun e!723332 () Bool)

(assert (=> b!1269109 (= e!723332 tp_is_empty!32737)))

(declare-fun b!1269110 () Bool)

(declare-fun res!844610 () Bool)

(assert (=> b!1269110 (=> (not res!844610) (not e!723333))))

(assert (=> b!1269110 (= res!844610 (and (= (size!40405 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40406 _keys!1364) (size!40405 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269111 () Bool)

(declare-fun e!723331 () Bool)

(assert (=> b!1269111 (= e!723331 (and e!723332 mapRes!50686))))

(declare-fun condMapEmpty!50686 () Bool)

(declare-fun mapDefault!50686 () ValueCell!15515)

(assert (=> b!1269111 (= condMapEmpty!50686 (= (arr!39867 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15515)) mapDefault!50686)))))

(declare-fun res!844612 () Bool)

(assert (=> start!107048 (=> (not res!844612) (not e!723333))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107048 (= res!844612 (validMask!0 mask!1730))))

(assert (=> start!107048 e!723333))

(declare-fun array_inv!30499 (array!82659) Bool)

(assert (=> start!107048 (and (array_inv!30499 _values!1134) e!723331)))

(assert (=> start!107048 true))

(declare-fun array_inv!30500 (array!82661) Bool)

(assert (=> start!107048 (array_inv!30500 _keys!1364)))

(assert (=> start!107048 tp_is_empty!32737))

(assert (=> start!107048 tp!96886))

(declare-fun b!1269112 () Bool)

(declare-fun res!844609 () Bool)

(assert (=> b!1269112 (=> (not res!844609) (not e!723333))))

(assert (=> b!1269112 (= res!844609 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40406 _keys!1364)) (bvslt from!1698 (size!40406 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!50686 () Bool)

(assert (=> mapIsEmpty!50686 mapRes!50686))

(declare-fun b!1269113 () Bool)

(declare-fun res!844611 () Bool)

(assert (=> b!1269113 (=> (not res!844611) (not e!723333))))

(declare-datatypes ((List!28500 0))(
  ( (Nil!28497) (Cons!28496 (h!29705 (_ BitVec 64)) (t!42021 List!28500)) )
))
(declare-fun arrayNoDuplicates!0 (array!82661 (_ BitVec 32) List!28500) Bool)

(assert (=> b!1269113 (= res!844611 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28497))))

(declare-fun b!1269114 () Bool)

(declare-fun res!844613 () Bool)

(assert (=> b!1269114 (=> (not res!844613) (not e!723333))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82661 (_ BitVec 32)) Bool)

(assert (=> b!1269114 (= res!844613 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107048 res!844612) b!1269110))

(assert (= (and b!1269110 res!844610) b!1269114))

(assert (= (and b!1269114 res!844613) b!1269113))

(assert (= (and b!1269113 res!844611) b!1269112))

(assert (= (and b!1269112 res!844609) b!1269107))

(assert (= (and b!1269111 condMapEmpty!50686) mapIsEmpty!50686))

(assert (= (and b!1269111 (not condMapEmpty!50686)) mapNonEmpty!50686))

(get-info :version)

(assert (= (and mapNonEmpty!50686 ((_ is ValueCellFull!15515) mapValue!50686)) b!1269108))

(assert (= (and b!1269111 ((_ is ValueCellFull!15515) mapDefault!50686)) b!1269109))

(assert (= start!107048 b!1269111))

(declare-fun m!1167279 () Bool)

(assert (=> start!107048 m!1167279))

(declare-fun m!1167281 () Bool)

(assert (=> start!107048 m!1167281))

(declare-fun m!1167283 () Bool)

(assert (=> start!107048 m!1167283))

(declare-fun m!1167285 () Bool)

(assert (=> b!1269113 m!1167285))

(declare-fun m!1167287 () Bool)

(assert (=> mapNonEmpty!50686 m!1167287))

(declare-fun m!1167289 () Bool)

(assert (=> b!1269114 m!1167289))

(declare-fun m!1167291 () Bool)

(assert (=> b!1269107 m!1167291))

(declare-fun m!1167293 () Bool)

(assert (=> b!1269107 m!1167293))

(declare-fun m!1167295 () Bool)

(assert (=> b!1269107 m!1167295))

(check-sat (not mapNonEmpty!50686) (not b!1269114) tp_is_empty!32737 b_and!45567 (not b!1269107) (not start!107048) (not b_next!27553) (not b!1269113))
(check-sat b_and!45567 (not b_next!27553))
