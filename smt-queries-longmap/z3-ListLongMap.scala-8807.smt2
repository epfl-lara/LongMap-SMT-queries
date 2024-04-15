; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107066 () Bool)

(assert start!107066)

(declare-fun b_free!27571 () Bool)

(declare-fun b_next!27571 () Bool)

(assert (=> start!107066 (= b_free!27571 (not b_next!27571))))

(declare-fun tp!96940 () Bool)

(declare-fun b_and!45585 () Bool)

(assert (=> start!107066 (= tp!96940 b_and!45585)))

(declare-fun b!1269323 () Bool)

(declare-fun res!844746 () Bool)

(declare-fun e!723465 () Bool)

(assert (=> b!1269323 (=> (not res!844746) (not e!723465))))

(declare-datatypes ((V!48867 0))(
  ( (V!48868 (val!16452 Int)) )
))
(declare-datatypes ((ValueCell!15524 0))(
  ( (ValueCellFull!15524 (v!19088 V!48867)) (EmptyCell!15524) )
))
(declare-datatypes ((array!82691 0))(
  ( (array!82692 (arr!39883 (Array (_ BitVec 32) ValueCell!15524)) (size!40421 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82691)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82693 0))(
  ( (array!82694 (arr!39884 (Array (_ BitVec 32) (_ BitVec 64))) (size!40422 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82693)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269323 (= res!844746 (and (= (size!40421 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40422 _keys!1364) (size!40421 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269324 () Bool)

(declare-fun e!723467 () Bool)

(declare-fun tp_is_empty!32755 () Bool)

(assert (=> b!1269324 (= e!723467 tp_is_empty!32755)))

(declare-fun b!1269325 () Bool)

(declare-fun e!723469 () Bool)

(assert (=> b!1269325 (= e!723469 tp_is_empty!32755)))

(declare-fun mapIsEmpty!50713 () Bool)

(declare-fun mapRes!50713 () Bool)

(assert (=> mapIsEmpty!50713 mapRes!50713))

(declare-fun b!1269326 () Bool)

(declare-fun e!723468 () Bool)

(assert (=> b!1269326 (= e!723468 (and e!723469 mapRes!50713))))

(declare-fun condMapEmpty!50713 () Bool)

(declare-fun mapDefault!50713 () ValueCell!15524)

(assert (=> b!1269326 (= condMapEmpty!50713 (= (arr!39883 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15524)) mapDefault!50713)))))

(declare-fun mapNonEmpty!50713 () Bool)

(declare-fun tp!96941 () Bool)

(assert (=> mapNonEmpty!50713 (= mapRes!50713 (and tp!96941 e!723467))))

(declare-fun mapValue!50713 () ValueCell!15524)

(declare-fun mapRest!50713 () (Array (_ BitVec 32) ValueCell!15524))

(declare-fun mapKey!50713 () (_ BitVec 32))

(assert (=> mapNonEmpty!50713 (= (arr!39883 _values!1134) (store mapRest!50713 mapKey!50713 mapValue!50713))))

(declare-fun b!1269327 () Bool)

(declare-fun res!844745 () Bool)

(assert (=> b!1269327 (=> (not res!844745) (not e!723465))))

(declare-datatypes ((List!28509 0))(
  ( (Nil!28506) (Cons!28505 (h!29714 (_ BitVec 64)) (t!42030 List!28509)) )
))
(declare-fun arrayNoDuplicates!0 (array!82693 (_ BitVec 32) List!28509) Bool)

(assert (=> b!1269327 (= res!844745 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28506))))

(declare-fun b!1269328 () Bool)

(declare-fun res!844744 () Bool)

(assert (=> b!1269328 (=> (not res!844744) (not e!723465))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82693 (_ BitVec 32)) Bool)

(assert (=> b!1269328 (= res!844744 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269330 () Bool)

(assert (=> b!1269330 (= e!723465 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48867)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48867)

(declare-fun zeroValueBefore!52 () V!48867)

(declare-fun minValueBefore!52 () V!48867)

(declare-datatypes ((tuple2!21394 0))(
  ( (tuple2!21395 (_1!10708 (_ BitVec 64)) (_2!10708 V!48867)) )
))
(declare-datatypes ((List!28510 0))(
  ( (Nil!28507) (Cons!28506 (h!29715 tuple2!21394) (t!42031 List!28510)) )
))
(declare-datatypes ((ListLongMap!19123 0))(
  ( (ListLongMap!19124 (toList!9577 List!28510)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5910 (array!82693 array!82691 (_ BitVec 32) (_ BitVec 32) V!48867 V!48867 (_ BitVec 32) Int) ListLongMap!19123)

(assert (=> b!1269330 (= (getCurrentListMapNoExtraKeys!5910 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5910 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42108 0))(
  ( (Unit!42109) )
))
(declare-fun lt!574391 () Unit!42108)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1210 (array!82693 array!82691 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48867 V!48867 V!48867 V!48867 (_ BitVec 32) Int) Unit!42108)

(assert (=> b!1269330 (= lt!574391 (lemmaNoChangeToArrayThenSameMapNoExtras!1210 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun res!844747 () Bool)

(assert (=> start!107066 (=> (not res!844747) (not e!723465))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107066 (= res!844747 (validMask!0 mask!1730))))

(assert (=> start!107066 e!723465))

(declare-fun array_inv!30509 (array!82691) Bool)

(assert (=> start!107066 (and (array_inv!30509 _values!1134) e!723468)))

(assert (=> start!107066 true))

(declare-fun array_inv!30510 (array!82693) Bool)

(assert (=> start!107066 (array_inv!30510 _keys!1364)))

(assert (=> start!107066 tp_is_empty!32755))

(assert (=> start!107066 tp!96940))

(declare-fun b!1269329 () Bool)

(declare-fun res!844748 () Bool)

(assert (=> b!1269329 (=> (not res!844748) (not e!723465))))

(assert (=> b!1269329 (= res!844748 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40422 _keys!1364)) (bvslt from!1698 (size!40422 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(assert (= (and start!107066 res!844747) b!1269323))

(assert (= (and b!1269323 res!844746) b!1269328))

(assert (= (and b!1269328 res!844744) b!1269327))

(assert (= (and b!1269327 res!844745) b!1269329))

(assert (= (and b!1269329 res!844748) b!1269330))

(assert (= (and b!1269326 condMapEmpty!50713) mapIsEmpty!50713))

(assert (= (and b!1269326 (not condMapEmpty!50713)) mapNonEmpty!50713))

(get-info :version)

(assert (= (and mapNonEmpty!50713 ((_ is ValueCellFull!15524) mapValue!50713)) b!1269324))

(assert (= (and b!1269326 ((_ is ValueCellFull!15524) mapDefault!50713)) b!1269325))

(assert (= start!107066 b!1269326))

(declare-fun m!1167441 () Bool)

(assert (=> mapNonEmpty!50713 m!1167441))

(declare-fun m!1167443 () Bool)

(assert (=> b!1269328 m!1167443))

(declare-fun m!1167445 () Bool)

(assert (=> b!1269327 m!1167445))

(declare-fun m!1167447 () Bool)

(assert (=> start!107066 m!1167447))

(declare-fun m!1167449 () Bool)

(assert (=> start!107066 m!1167449))

(declare-fun m!1167451 () Bool)

(assert (=> start!107066 m!1167451))

(declare-fun m!1167453 () Bool)

(assert (=> b!1269330 m!1167453))

(declare-fun m!1167455 () Bool)

(assert (=> b!1269330 m!1167455))

(declare-fun m!1167457 () Bool)

(assert (=> b!1269330 m!1167457))

(check-sat b_and!45585 (not start!107066) (not mapNonEmpty!50713) (not b!1269330) (not b!1269328) tp_is_empty!32755 (not b!1269327) (not b_next!27571))
(check-sat b_and!45585 (not b_next!27571))
