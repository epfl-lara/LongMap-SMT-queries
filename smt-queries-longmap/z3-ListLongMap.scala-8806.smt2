; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107060 () Bool)

(assert start!107060)

(declare-fun b_free!27565 () Bool)

(declare-fun b_next!27565 () Bool)

(assert (=> start!107060 (= b_free!27565 (not b_next!27565))))

(declare-fun tp!96923 () Bool)

(declare-fun b_and!45579 () Bool)

(assert (=> start!107060 (= tp!96923 b_and!45579)))

(declare-fun b!1269251 () Bool)

(declare-fun res!844699 () Bool)

(declare-fun e!723422 () Bool)

(assert (=> b!1269251 (=> (not res!844699) (not e!723422))))

(declare-datatypes ((V!48859 0))(
  ( (V!48860 (val!16449 Int)) )
))
(declare-datatypes ((ValueCell!15521 0))(
  ( (ValueCellFull!15521 (v!19085 V!48859)) (EmptyCell!15521) )
))
(declare-datatypes ((array!82681 0))(
  ( (array!82682 (arr!39878 (Array (_ BitVec 32) ValueCell!15521)) (size!40416 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82681)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82683 0))(
  ( (array!82684 (arr!39879 (Array (_ BitVec 32) (_ BitVec 64))) (size!40417 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82683)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269251 (= res!844699 (and (= (size!40416 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40417 _keys!1364) (size!40416 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269252 () Bool)

(declare-fun res!844703 () Bool)

(assert (=> b!1269252 (=> (not res!844703) (not e!723422))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82683 (_ BitVec 32)) Bool)

(assert (=> b!1269252 (= res!844703 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269253 () Bool)

(declare-fun e!723423 () Bool)

(declare-fun tp_is_empty!32749 () Bool)

(assert (=> b!1269253 (= e!723423 tp_is_empty!32749)))

(declare-fun b!1269254 () Bool)

(assert (=> b!1269254 (= e!723422 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48859)

(declare-fun minValueBefore!52 () V!48859)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48859)

(declare-fun zeroValueBefore!52 () V!48859)

(declare-datatypes ((tuple2!21390 0))(
  ( (tuple2!21391 (_1!10706 (_ BitVec 64)) (_2!10706 V!48859)) )
))
(declare-datatypes ((List!28505 0))(
  ( (Nil!28502) (Cons!28501 (h!29710 tuple2!21390) (t!42026 List!28505)) )
))
(declare-datatypes ((ListLongMap!19119 0))(
  ( (ListLongMap!19120 (toList!9575 List!28505)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5908 (array!82683 array!82681 (_ BitVec 32) (_ BitVec 32) V!48859 V!48859 (_ BitVec 32) Int) ListLongMap!19119)

(assert (=> b!1269254 (= (getCurrentListMapNoExtraKeys!5908 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5908 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42104 0))(
  ( (Unit!42105) )
))
(declare-fun lt!574382 () Unit!42104)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1208 (array!82683 array!82681 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48859 V!48859 V!48859 V!48859 (_ BitVec 32) Int) Unit!42104)

(assert (=> b!1269254 (= lt!574382 (lemmaNoChangeToArrayThenSameMapNoExtras!1208 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapIsEmpty!50704 () Bool)

(declare-fun mapRes!50704 () Bool)

(assert (=> mapIsEmpty!50704 mapRes!50704))

(declare-fun b!1269255 () Bool)

(declare-fun e!723424 () Bool)

(assert (=> b!1269255 (= e!723424 tp_is_empty!32749)))

(declare-fun res!844700 () Bool)

(assert (=> start!107060 (=> (not res!844700) (not e!723422))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107060 (= res!844700 (validMask!0 mask!1730))))

(assert (=> start!107060 e!723422))

(declare-fun e!723420 () Bool)

(declare-fun array_inv!30505 (array!82681) Bool)

(assert (=> start!107060 (and (array_inv!30505 _values!1134) e!723420)))

(assert (=> start!107060 true))

(declare-fun array_inv!30506 (array!82683) Bool)

(assert (=> start!107060 (array_inv!30506 _keys!1364)))

(assert (=> start!107060 tp_is_empty!32749))

(assert (=> start!107060 tp!96923))

(declare-fun b!1269256 () Bool)

(declare-fun res!844701 () Bool)

(assert (=> b!1269256 (=> (not res!844701) (not e!723422))))

(assert (=> b!1269256 (= res!844701 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40417 _keys!1364)) (bvslt from!1698 (size!40417 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269257 () Bool)

(declare-fun res!844702 () Bool)

(assert (=> b!1269257 (=> (not res!844702) (not e!723422))))

(declare-datatypes ((List!28506 0))(
  ( (Nil!28503) (Cons!28502 (h!29711 (_ BitVec 64)) (t!42027 List!28506)) )
))
(declare-fun arrayNoDuplicates!0 (array!82683 (_ BitVec 32) List!28506) Bool)

(assert (=> b!1269257 (= res!844702 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28503))))

(declare-fun mapNonEmpty!50704 () Bool)

(declare-fun tp!96922 () Bool)

(assert (=> mapNonEmpty!50704 (= mapRes!50704 (and tp!96922 e!723424))))

(declare-fun mapRest!50704 () (Array (_ BitVec 32) ValueCell!15521))

(declare-fun mapKey!50704 () (_ BitVec 32))

(declare-fun mapValue!50704 () ValueCell!15521)

(assert (=> mapNonEmpty!50704 (= (arr!39878 _values!1134) (store mapRest!50704 mapKey!50704 mapValue!50704))))

(declare-fun b!1269258 () Bool)

(assert (=> b!1269258 (= e!723420 (and e!723423 mapRes!50704))))

(declare-fun condMapEmpty!50704 () Bool)

(declare-fun mapDefault!50704 () ValueCell!15521)

(assert (=> b!1269258 (= condMapEmpty!50704 (= (arr!39878 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15521)) mapDefault!50704)))))

(assert (= (and start!107060 res!844700) b!1269251))

(assert (= (and b!1269251 res!844699) b!1269252))

(assert (= (and b!1269252 res!844703) b!1269257))

(assert (= (and b!1269257 res!844702) b!1269256))

(assert (= (and b!1269256 res!844701) b!1269254))

(assert (= (and b!1269258 condMapEmpty!50704) mapIsEmpty!50704))

(assert (= (and b!1269258 (not condMapEmpty!50704)) mapNonEmpty!50704))

(get-info :version)

(assert (= (and mapNonEmpty!50704 ((_ is ValueCellFull!15521) mapValue!50704)) b!1269255))

(assert (= (and b!1269258 ((_ is ValueCellFull!15521) mapDefault!50704)) b!1269253))

(assert (= start!107060 b!1269258))

(declare-fun m!1167387 () Bool)

(assert (=> mapNonEmpty!50704 m!1167387))

(declare-fun m!1167389 () Bool)

(assert (=> b!1269254 m!1167389))

(declare-fun m!1167391 () Bool)

(assert (=> b!1269254 m!1167391))

(declare-fun m!1167393 () Bool)

(assert (=> b!1269254 m!1167393))

(declare-fun m!1167395 () Bool)

(assert (=> start!107060 m!1167395))

(declare-fun m!1167397 () Bool)

(assert (=> start!107060 m!1167397))

(declare-fun m!1167399 () Bool)

(assert (=> start!107060 m!1167399))

(declare-fun m!1167401 () Bool)

(assert (=> b!1269252 m!1167401))

(declare-fun m!1167403 () Bool)

(assert (=> b!1269257 m!1167403))

(check-sat (not mapNonEmpty!50704) (not b!1269254) (not b!1269252) tp_is_empty!32749 b_and!45579 (not b!1269257) (not b_next!27565) (not start!107060))
(check-sat b_and!45579 (not b_next!27565))
