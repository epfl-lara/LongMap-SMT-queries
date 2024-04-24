; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107272 () Bool)

(assert start!107272)

(declare-fun b_free!27553 () Bool)

(declare-fun b_next!27553 () Bool)

(assert (=> start!107272 (= b_free!27553 (not b_next!27553))))

(declare-fun tp!96885 () Bool)

(declare-fun b_and!45587 () Bool)

(assert (=> start!107272 (= tp!96885 b_and!45587)))

(declare-fun b!1270476 () Bool)

(declare-fun e!724208 () Bool)

(declare-fun tp_is_empty!32737 () Bool)

(assert (=> b!1270476 (= e!724208 tp_is_empty!32737)))

(declare-fun b!1270477 () Bool)

(declare-fun e!724206 () Bool)

(declare-fun mapRes!50686 () Bool)

(assert (=> b!1270477 (= e!724206 (and e!724208 mapRes!50686))))

(declare-fun condMapEmpty!50686 () Bool)

(declare-datatypes ((V!48843 0))(
  ( (V!48844 (val!16443 Int)) )
))
(declare-datatypes ((ValueCell!15515 0))(
  ( (ValueCellFull!15515 (v!19075 V!48843)) (EmptyCell!15515) )
))
(declare-datatypes ((array!82779 0))(
  ( (array!82780 (arr!39922 (Array (_ BitVec 32) ValueCell!15515)) (size!40459 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82779)

(declare-fun mapDefault!50686 () ValueCell!15515)

(assert (=> b!1270477 (= condMapEmpty!50686 (= (arr!39922 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15515)) mapDefault!50686)))))

(declare-fun mapIsEmpty!50686 () Bool)

(assert (=> mapIsEmpty!50686 mapRes!50686))

(declare-fun b!1270478 () Bool)

(declare-fun res!845156 () Bool)

(declare-fun e!724209 () Bool)

(assert (=> b!1270478 (=> (not res!845156) (not e!724209))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82781 0))(
  ( (array!82782 (arr!39923 (Array (_ BitVec 32) (_ BitVec 64))) (size!40460 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82781)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270478 (= res!845156 (and (= (size!40459 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40460 _keys!1364) (size!40459 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270479 () Bool)

(assert (=> b!1270479 (= e!724209 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48843)

(declare-fun minValueBefore!52 () V!48843)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48843)

(declare-fun zeroValueBefore!52 () V!48843)

(declare-datatypes ((tuple2!21306 0))(
  ( (tuple2!21307 (_1!10664 (_ BitVec 64)) (_2!10664 V!48843)) )
))
(declare-datatypes ((List!28447 0))(
  ( (Nil!28444) (Cons!28443 (h!29661 tuple2!21306) (t!41968 List!28447)) )
))
(declare-datatypes ((ListLongMap!19043 0))(
  ( (ListLongMap!19044 (toList!9537 List!28447)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5909 (array!82781 array!82779 (_ BitVec 32) (_ BitVec 32) V!48843 V!48843 (_ BitVec 32) Int) ListLongMap!19043)

(assert (=> b!1270479 (= (getCurrentListMapNoExtraKeys!5909 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5909 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42215 0))(
  ( (Unit!42216) )
))
(declare-fun lt!575026 () Unit!42215)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1199 (array!82781 array!82779 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48843 V!48843 V!48843 V!48843 (_ BitVec 32) Int) Unit!42215)

(assert (=> b!1270479 (= lt!575026 (lemmaNoChangeToArrayThenSameMapNoExtras!1199 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun res!845158 () Bool)

(assert (=> start!107272 (=> (not res!845158) (not e!724209))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107272 (= res!845158 (validMask!0 mask!1730))))

(assert (=> start!107272 e!724209))

(declare-fun array_inv!30541 (array!82779) Bool)

(assert (=> start!107272 (and (array_inv!30541 _values!1134) e!724206)))

(assert (=> start!107272 true))

(declare-fun array_inv!30542 (array!82781) Bool)

(assert (=> start!107272 (array_inv!30542 _keys!1364)))

(assert (=> start!107272 tp_is_empty!32737))

(assert (=> start!107272 tp!96885))

(declare-fun b!1270480 () Bool)

(declare-fun res!845157 () Bool)

(assert (=> b!1270480 (=> (not res!845157) (not e!724209))))

(assert (=> b!1270480 (= res!845157 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40460 _keys!1364)) (bvslt from!1698 (size!40460 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270481 () Bool)

(declare-fun res!845159 () Bool)

(assert (=> b!1270481 (=> (not res!845159) (not e!724209))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82781 (_ BitVec 32)) Bool)

(assert (=> b!1270481 (= res!845159 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270482 () Bool)

(declare-fun e!724207 () Bool)

(assert (=> b!1270482 (= e!724207 tp_is_empty!32737)))

(declare-fun mapNonEmpty!50686 () Bool)

(declare-fun tp!96886 () Bool)

(assert (=> mapNonEmpty!50686 (= mapRes!50686 (and tp!96886 e!724207))))

(declare-fun mapKey!50686 () (_ BitVec 32))

(declare-fun mapRest!50686 () (Array (_ BitVec 32) ValueCell!15515))

(declare-fun mapValue!50686 () ValueCell!15515)

(assert (=> mapNonEmpty!50686 (= (arr!39922 _values!1134) (store mapRest!50686 mapKey!50686 mapValue!50686))))

(declare-fun b!1270483 () Bool)

(declare-fun res!845160 () Bool)

(assert (=> b!1270483 (=> (not res!845160) (not e!724209))))

(declare-datatypes ((List!28448 0))(
  ( (Nil!28445) (Cons!28444 (h!29662 (_ BitVec 64)) (t!41969 List!28448)) )
))
(declare-fun arrayNoDuplicates!0 (array!82781 (_ BitVec 32) List!28448) Bool)

(assert (=> b!1270483 (= res!845160 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28445))))

(assert (= (and start!107272 res!845158) b!1270478))

(assert (= (and b!1270478 res!845156) b!1270481))

(assert (= (and b!1270481 res!845159) b!1270483))

(assert (= (and b!1270483 res!845160) b!1270480))

(assert (= (and b!1270480 res!845157) b!1270479))

(assert (= (and b!1270477 condMapEmpty!50686) mapIsEmpty!50686))

(assert (= (and b!1270477 (not condMapEmpty!50686)) mapNonEmpty!50686))

(get-info :version)

(assert (= (and mapNonEmpty!50686 ((_ is ValueCellFull!15515) mapValue!50686)) b!1270482))

(assert (= (and b!1270477 ((_ is ValueCellFull!15515) mapDefault!50686)) b!1270476))

(assert (= start!107272 b!1270477))

(declare-fun m!1169391 () Bool)

(assert (=> b!1270483 m!1169391))

(declare-fun m!1169393 () Bool)

(assert (=> b!1270481 m!1169393))

(declare-fun m!1169395 () Bool)

(assert (=> b!1270479 m!1169395))

(declare-fun m!1169397 () Bool)

(assert (=> b!1270479 m!1169397))

(declare-fun m!1169399 () Bool)

(assert (=> b!1270479 m!1169399))

(declare-fun m!1169401 () Bool)

(assert (=> mapNonEmpty!50686 m!1169401))

(declare-fun m!1169403 () Bool)

(assert (=> start!107272 m!1169403))

(declare-fun m!1169405 () Bool)

(assert (=> start!107272 m!1169405))

(declare-fun m!1169407 () Bool)

(assert (=> start!107272 m!1169407))

(check-sat b_and!45587 (not start!107272) tp_is_empty!32737 (not b!1270481) (not b!1270479) (not b_next!27553) (not b!1270483) (not mapNonEmpty!50686))
(check-sat b_and!45587 (not b_next!27553))
