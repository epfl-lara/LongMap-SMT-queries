; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107054 () Bool)

(assert start!107054)

(declare-fun b_free!27559 () Bool)

(declare-fun b_next!27559 () Bool)

(assert (=> start!107054 (= b_free!27559 (not b_next!27559))))

(declare-fun tp!96905 () Bool)

(declare-fun b_and!45573 () Bool)

(assert (=> start!107054 (= tp!96905 b_and!45573)))

(declare-fun b!1269179 () Bool)

(declare-fun res!844656 () Bool)

(declare-fun e!723378 () Bool)

(assert (=> b!1269179 (=> (not res!844656) (not e!723378))))

(declare-datatypes ((array!82671 0))(
  ( (array!82672 (arr!39873 (Array (_ BitVec 32) (_ BitVec 64))) (size!40411 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82671)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82671 (_ BitVec 32)) Bool)

(assert (=> b!1269179 (= res!844656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269180 () Bool)

(assert (=> b!1269180 (= e!723378 (not true))))

(declare-datatypes ((V!48851 0))(
  ( (V!48852 (val!16446 Int)) )
))
(declare-datatypes ((ValueCell!15518 0))(
  ( (ValueCellFull!15518 (v!19082 V!48851)) (EmptyCell!15518) )
))
(declare-datatypes ((array!82673 0))(
  ( (array!82674 (arr!39874 (Array (_ BitVec 32) ValueCell!15518)) (size!40412 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82673)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48851)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48851)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48851)

(declare-fun zeroValueBefore!52 () V!48851)

(declare-datatypes ((tuple2!21386 0))(
  ( (tuple2!21387 (_1!10704 (_ BitVec 64)) (_2!10704 V!48851)) )
))
(declare-datatypes ((List!28502 0))(
  ( (Nil!28499) (Cons!28498 (h!29707 tuple2!21386) (t!42023 List!28502)) )
))
(declare-datatypes ((ListLongMap!19115 0))(
  ( (ListLongMap!19116 (toList!9573 List!28502)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5906 (array!82671 array!82673 (_ BitVec 32) (_ BitVec 32) V!48851 V!48851 (_ BitVec 32) Int) ListLongMap!19115)

(assert (=> b!1269180 (= (getCurrentListMapNoExtraKeys!5906 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5906 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42100 0))(
  ( (Unit!42101) )
))
(declare-fun lt!574373 () Unit!42100)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1206 (array!82671 array!82673 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48851 V!48851 V!48851 V!48851 (_ BitVec 32) Int) Unit!42100)

(assert (=> b!1269180 (= lt!574373 (lemmaNoChangeToArrayThenSameMapNoExtras!1206 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!50695 () Bool)

(declare-fun mapRes!50695 () Bool)

(declare-fun tp!96904 () Bool)

(declare-fun e!723375 () Bool)

(assert (=> mapNonEmpty!50695 (= mapRes!50695 (and tp!96904 e!723375))))

(declare-fun mapRest!50695 () (Array (_ BitVec 32) ValueCell!15518))

(declare-fun mapKey!50695 () (_ BitVec 32))

(declare-fun mapValue!50695 () ValueCell!15518)

(assert (=> mapNonEmpty!50695 (= (arr!39874 _values!1134) (store mapRest!50695 mapKey!50695 mapValue!50695))))

(declare-fun b!1269181 () Bool)

(declare-fun res!844658 () Bool)

(assert (=> b!1269181 (=> (not res!844658) (not e!723378))))

(assert (=> b!1269181 (= res!844658 (and (= (size!40412 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40411 _keys!1364) (size!40412 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269182 () Bool)

(declare-fun e!723376 () Bool)

(declare-fun e!723379 () Bool)

(assert (=> b!1269182 (= e!723376 (and e!723379 mapRes!50695))))

(declare-fun condMapEmpty!50695 () Bool)

(declare-fun mapDefault!50695 () ValueCell!15518)

(assert (=> b!1269182 (= condMapEmpty!50695 (= (arr!39874 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15518)) mapDefault!50695)))))

(declare-fun b!1269183 () Bool)

(declare-fun tp_is_empty!32743 () Bool)

(assert (=> b!1269183 (= e!723375 tp_is_empty!32743)))

(declare-fun b!1269184 () Bool)

(declare-fun res!844655 () Bool)

(assert (=> b!1269184 (=> (not res!844655) (not e!723378))))

(assert (=> b!1269184 (= res!844655 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40411 _keys!1364)) (bvslt from!1698 (size!40411 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269185 () Bool)

(declare-fun res!844657 () Bool)

(assert (=> b!1269185 (=> (not res!844657) (not e!723378))))

(declare-datatypes ((List!28503 0))(
  ( (Nil!28500) (Cons!28499 (h!29708 (_ BitVec 64)) (t!42024 List!28503)) )
))
(declare-fun arrayNoDuplicates!0 (array!82671 (_ BitVec 32) List!28503) Bool)

(assert (=> b!1269185 (= res!844657 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28500))))

(declare-fun b!1269186 () Bool)

(assert (=> b!1269186 (= e!723379 tp_is_empty!32743)))

(declare-fun res!844654 () Bool)

(assert (=> start!107054 (=> (not res!844654) (not e!723378))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107054 (= res!844654 (validMask!0 mask!1730))))

(assert (=> start!107054 e!723378))

(declare-fun array_inv!30503 (array!82673) Bool)

(assert (=> start!107054 (and (array_inv!30503 _values!1134) e!723376)))

(assert (=> start!107054 true))

(declare-fun array_inv!30504 (array!82671) Bool)

(assert (=> start!107054 (array_inv!30504 _keys!1364)))

(assert (=> start!107054 tp_is_empty!32743))

(assert (=> start!107054 tp!96905))

(declare-fun mapIsEmpty!50695 () Bool)

(assert (=> mapIsEmpty!50695 mapRes!50695))

(assert (= (and start!107054 res!844654) b!1269181))

(assert (= (and b!1269181 res!844658) b!1269179))

(assert (= (and b!1269179 res!844656) b!1269185))

(assert (= (and b!1269185 res!844657) b!1269184))

(assert (= (and b!1269184 res!844655) b!1269180))

(assert (= (and b!1269182 condMapEmpty!50695) mapIsEmpty!50695))

(assert (= (and b!1269182 (not condMapEmpty!50695)) mapNonEmpty!50695))

(get-info :version)

(assert (= (and mapNonEmpty!50695 ((_ is ValueCellFull!15518) mapValue!50695)) b!1269183))

(assert (= (and b!1269182 ((_ is ValueCellFull!15518) mapDefault!50695)) b!1269186))

(assert (= start!107054 b!1269182))

(declare-fun m!1167333 () Bool)

(assert (=> b!1269185 m!1167333))

(declare-fun m!1167335 () Bool)

(assert (=> b!1269180 m!1167335))

(declare-fun m!1167337 () Bool)

(assert (=> b!1269180 m!1167337))

(declare-fun m!1167339 () Bool)

(assert (=> b!1269180 m!1167339))

(declare-fun m!1167341 () Bool)

(assert (=> b!1269179 m!1167341))

(declare-fun m!1167343 () Bool)

(assert (=> mapNonEmpty!50695 m!1167343))

(declare-fun m!1167345 () Bool)

(assert (=> start!107054 m!1167345))

(declare-fun m!1167347 () Bool)

(assert (=> start!107054 m!1167347))

(declare-fun m!1167349 () Bool)

(assert (=> start!107054 m!1167349))

(check-sat (not start!107054) b_and!45573 (not b!1269179) (not b_next!27559) (not b!1269185) (not b!1269180) (not mapNonEmpty!50695) tp_is_empty!32743)
(check-sat b_and!45573 (not b_next!27559))
