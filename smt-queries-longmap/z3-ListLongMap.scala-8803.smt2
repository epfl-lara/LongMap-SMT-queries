; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107266 () Bool)

(assert start!107266)

(declare-fun b_free!27547 () Bool)

(declare-fun b_next!27547 () Bool)

(assert (=> start!107266 (= b_free!27547 (not b_next!27547))))

(declare-fun tp!96868 () Bool)

(declare-fun b_and!45581 () Bool)

(assert (=> start!107266 (= tp!96868 b_and!45581)))

(declare-fun b!1270404 () Bool)

(declare-fun res!845114 () Bool)

(declare-fun e!724161 () Bool)

(assert (=> b!1270404 (=> (not res!845114) (not e!724161))))

(declare-datatypes ((V!48835 0))(
  ( (V!48836 (val!16440 Int)) )
))
(declare-datatypes ((ValueCell!15512 0))(
  ( (ValueCellFull!15512 (v!19072 V!48835)) (EmptyCell!15512) )
))
(declare-datatypes ((array!82767 0))(
  ( (array!82768 (arr!39916 (Array (_ BitVec 32) ValueCell!15512)) (size!40453 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82767)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82769 0))(
  ( (array!82770 (arr!39917 (Array (_ BitVec 32) (_ BitVec 64))) (size!40454 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82769)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270404 (= res!845114 (and (= (size!40453 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40454 _keys!1364) (size!40453 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50677 () Bool)

(declare-fun mapRes!50677 () Bool)

(declare-fun tp!96867 () Bool)

(declare-fun e!724163 () Bool)

(assert (=> mapNonEmpty!50677 (= mapRes!50677 (and tp!96867 e!724163))))

(declare-fun mapRest!50677 () (Array (_ BitVec 32) ValueCell!15512))

(declare-fun mapValue!50677 () ValueCell!15512)

(declare-fun mapKey!50677 () (_ BitVec 32))

(assert (=> mapNonEmpty!50677 (= (arr!39916 _values!1134) (store mapRest!50677 mapKey!50677 mapValue!50677))))

(declare-fun b!1270405 () Bool)

(declare-fun res!845115 () Bool)

(assert (=> b!1270405 (=> (not res!845115) (not e!724161))))

(declare-datatypes ((List!28444 0))(
  ( (Nil!28441) (Cons!28440 (h!29658 (_ BitVec 64)) (t!41965 List!28444)) )
))
(declare-fun arrayNoDuplicates!0 (array!82769 (_ BitVec 32) List!28444) Bool)

(assert (=> b!1270405 (= res!845115 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28441))))

(declare-fun mapIsEmpty!50677 () Bool)

(assert (=> mapIsEmpty!50677 mapRes!50677))

(declare-fun b!1270406 () Bool)

(declare-fun res!845111 () Bool)

(assert (=> b!1270406 (=> (not res!845111) (not e!724161))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82769 (_ BitVec 32)) Bool)

(assert (=> b!1270406 (= res!845111 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun res!845112 () Bool)

(assert (=> start!107266 (=> (not res!845112) (not e!724161))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107266 (= res!845112 (validMask!0 mask!1730))))

(assert (=> start!107266 e!724161))

(declare-fun e!724162 () Bool)

(declare-fun array_inv!30537 (array!82767) Bool)

(assert (=> start!107266 (and (array_inv!30537 _values!1134) e!724162)))

(assert (=> start!107266 true))

(declare-fun array_inv!30538 (array!82769) Bool)

(assert (=> start!107266 (array_inv!30538 _keys!1364)))

(declare-fun tp_is_empty!32731 () Bool)

(assert (=> start!107266 tp_is_empty!32731))

(assert (=> start!107266 tp!96868))

(declare-fun b!1270407 () Bool)

(declare-fun res!845113 () Bool)

(assert (=> b!1270407 (=> (not res!845113) (not e!724161))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1270407 (= res!845113 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40454 _keys!1364)) (bvslt from!1698 (size!40454 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270408 () Bool)

(assert (=> b!1270408 (= e!724161 (not true))))

(declare-fun minValueAfter!52 () V!48835)

(declare-fun minValueBefore!52 () V!48835)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48835)

(declare-fun zeroValueBefore!52 () V!48835)

(declare-datatypes ((tuple2!21304 0))(
  ( (tuple2!21305 (_1!10663 (_ BitVec 64)) (_2!10663 V!48835)) )
))
(declare-datatypes ((List!28445 0))(
  ( (Nil!28442) (Cons!28441 (h!29659 tuple2!21304) (t!41966 List!28445)) )
))
(declare-datatypes ((ListLongMap!19041 0))(
  ( (ListLongMap!19042 (toList!9536 List!28445)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5908 (array!82769 array!82767 (_ BitVec 32) (_ BitVec 32) V!48835 V!48835 (_ BitVec 32) Int) ListLongMap!19041)

(assert (=> b!1270408 (= (getCurrentListMapNoExtraKeys!5908 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5908 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42213 0))(
  ( (Unit!42214) )
))
(declare-fun lt!575017 () Unit!42213)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1198 (array!82769 array!82767 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48835 V!48835 V!48835 V!48835 (_ BitVec 32) Int) Unit!42213)

(assert (=> b!1270408 (= lt!575017 (lemmaNoChangeToArrayThenSameMapNoExtras!1198 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1270409 () Bool)

(declare-fun e!724164 () Bool)

(assert (=> b!1270409 (= e!724164 tp_is_empty!32731)))

(declare-fun b!1270410 () Bool)

(assert (=> b!1270410 (= e!724163 tp_is_empty!32731)))

(declare-fun b!1270411 () Bool)

(assert (=> b!1270411 (= e!724162 (and e!724164 mapRes!50677))))

(declare-fun condMapEmpty!50677 () Bool)

(declare-fun mapDefault!50677 () ValueCell!15512)

(assert (=> b!1270411 (= condMapEmpty!50677 (= (arr!39916 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15512)) mapDefault!50677)))))

(assert (= (and start!107266 res!845112) b!1270404))

(assert (= (and b!1270404 res!845114) b!1270406))

(assert (= (and b!1270406 res!845111) b!1270405))

(assert (= (and b!1270405 res!845115) b!1270407))

(assert (= (and b!1270407 res!845113) b!1270408))

(assert (= (and b!1270411 condMapEmpty!50677) mapIsEmpty!50677))

(assert (= (and b!1270411 (not condMapEmpty!50677)) mapNonEmpty!50677))

(get-info :version)

(assert (= (and mapNonEmpty!50677 ((_ is ValueCellFull!15512) mapValue!50677)) b!1270410))

(assert (= (and b!1270411 ((_ is ValueCellFull!15512) mapDefault!50677)) b!1270409))

(assert (= start!107266 b!1270411))

(declare-fun m!1169337 () Bool)

(assert (=> start!107266 m!1169337))

(declare-fun m!1169339 () Bool)

(assert (=> start!107266 m!1169339))

(declare-fun m!1169341 () Bool)

(assert (=> start!107266 m!1169341))

(declare-fun m!1169343 () Bool)

(assert (=> b!1270405 m!1169343))

(declare-fun m!1169345 () Bool)

(assert (=> b!1270406 m!1169345))

(declare-fun m!1169347 () Bool)

(assert (=> mapNonEmpty!50677 m!1169347))

(declare-fun m!1169349 () Bool)

(assert (=> b!1270408 m!1169349))

(declare-fun m!1169351 () Bool)

(assert (=> b!1270408 m!1169351))

(declare-fun m!1169353 () Bool)

(assert (=> b!1270408 m!1169353))

(check-sat (not b!1270408) (not mapNonEmpty!50677) (not b!1270405) (not b_next!27547) (not b!1270406) (not start!107266) b_and!45581 tp_is_empty!32731)
(check-sat b_and!45581 (not b_next!27547))
