; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107080 () Bool)

(assert start!107080)

(declare-fun b_free!27585 () Bool)

(declare-fun b_next!27585 () Bool)

(assert (=> start!107080 (= b_free!27585 (not b_next!27585))))

(declare-fun tp!96981 () Bool)

(declare-fun b_and!45617 () Bool)

(assert (=> start!107080 (= tp!96981 b_and!45617)))

(declare-fun res!844879 () Bool)

(declare-fun e!723600 () Bool)

(assert (=> start!107080 (=> (not res!844879) (not e!723600))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107080 (= res!844879 (validMask!0 mask!1730))))

(assert (=> start!107080 e!723600))

(declare-datatypes ((V!48885 0))(
  ( (V!48886 (val!16459 Int)) )
))
(declare-datatypes ((ValueCell!15531 0))(
  ( (ValueCellFull!15531 (v!19096 V!48885)) (EmptyCell!15531) )
))
(declare-datatypes ((array!82800 0))(
  ( (array!82801 (arr!39937 (Array (_ BitVec 32) ValueCell!15531)) (size!40473 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82800)

(declare-fun e!723602 () Bool)

(declare-fun array_inv!30381 (array!82800) Bool)

(assert (=> start!107080 (and (array_inv!30381 _values!1134) e!723602)))

(assert (=> start!107080 true))

(declare-datatypes ((array!82802 0))(
  ( (array!82803 (arr!39938 (Array (_ BitVec 32) (_ BitVec 64))) (size!40474 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82802)

(declare-fun array_inv!30382 (array!82802) Bool)

(assert (=> start!107080 (array_inv!30382 _keys!1364)))

(declare-fun tp_is_empty!32769 () Bool)

(assert (=> start!107080 tp_is_empty!32769))

(assert (=> start!107080 tp!96981))

(declare-fun mapNonEmpty!50734 () Bool)

(declare-fun mapRes!50734 () Bool)

(declare-fun tp!96982 () Bool)

(declare-fun e!723601 () Bool)

(assert (=> mapNonEmpty!50734 (= mapRes!50734 (and tp!96982 e!723601))))

(declare-fun mapRest!50734 () (Array (_ BitVec 32) ValueCell!15531))

(declare-fun mapValue!50734 () ValueCell!15531)

(declare-fun mapKey!50734 () (_ BitVec 32))

(assert (=> mapNonEmpty!50734 (= (arr!39937 _values!1134) (store mapRest!50734 mapKey!50734 mapValue!50734))))

(declare-fun b!1269555 () Bool)

(declare-fun e!723599 () Bool)

(assert (=> b!1269555 (= e!723602 (and e!723599 mapRes!50734))))

(declare-fun condMapEmpty!50734 () Bool)

(declare-fun mapDefault!50734 () ValueCell!15531)

(assert (=> b!1269555 (= condMapEmpty!50734 (= (arr!39937 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15531)) mapDefault!50734)))))

(declare-fun b!1269556 () Bool)

(assert (=> b!1269556 (= e!723600 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48885)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48885)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48885)

(declare-fun zeroValueBefore!52 () V!48885)

(declare-datatypes ((tuple2!21320 0))(
  ( (tuple2!21321 (_1!10671 (_ BitVec 64)) (_2!10671 V!48885)) )
))
(declare-datatypes ((List!28432 0))(
  ( (Nil!28429) (Cons!28428 (h!29637 tuple2!21320) (t!41961 List!28432)) )
))
(declare-datatypes ((ListLongMap!19049 0))(
  ( (ListLongMap!19050 (toList!9540 List!28432)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5872 (array!82802 array!82800 (_ BitVec 32) (_ BitVec 32) V!48885 V!48885 (_ BitVec 32) Int) ListLongMap!19049)

(assert (=> b!1269556 (= (getCurrentListMapNoExtraKeys!5872 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5872 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42266 0))(
  ( (Unit!42267) )
))
(declare-fun lt!574590 () Unit!42266)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1214 (array!82802 array!82800 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48885 V!48885 V!48885 V!48885 (_ BitVec 32) Int) Unit!42266)

(assert (=> b!1269556 (= lt!574590 (lemmaNoChangeToArrayThenSameMapNoExtras!1214 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269557 () Bool)

(declare-fun res!844876 () Bool)

(assert (=> b!1269557 (=> (not res!844876) (not e!723600))))

(declare-datatypes ((List!28433 0))(
  ( (Nil!28430) (Cons!28429 (h!29638 (_ BitVec 64)) (t!41962 List!28433)) )
))
(declare-fun arrayNoDuplicates!0 (array!82802 (_ BitVec 32) List!28433) Bool)

(assert (=> b!1269557 (= res!844876 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28430))))

(declare-fun b!1269558 () Bool)

(declare-fun res!844880 () Bool)

(assert (=> b!1269558 (=> (not res!844880) (not e!723600))))

(assert (=> b!1269558 (= res!844880 (and (= (size!40473 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40474 _keys!1364) (size!40473 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269559 () Bool)

(assert (=> b!1269559 (= e!723599 tp_is_empty!32769)))

(declare-fun b!1269560 () Bool)

(assert (=> b!1269560 (= e!723601 tp_is_empty!32769)))

(declare-fun b!1269561 () Bool)

(declare-fun res!844877 () Bool)

(assert (=> b!1269561 (=> (not res!844877) (not e!723600))))

(assert (=> b!1269561 (= res!844877 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40474 _keys!1364)) (bvslt from!1698 (size!40474 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269562 () Bool)

(declare-fun res!844878 () Bool)

(assert (=> b!1269562 (=> (not res!844878) (not e!723600))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82802 (_ BitVec 32)) Bool)

(assert (=> b!1269562 (= res!844878 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50734 () Bool)

(assert (=> mapIsEmpty!50734 mapRes!50734))

(assert (= (and start!107080 res!844879) b!1269558))

(assert (= (and b!1269558 res!844880) b!1269562))

(assert (= (and b!1269562 res!844878) b!1269557))

(assert (= (and b!1269557 res!844876) b!1269561))

(assert (= (and b!1269561 res!844877) b!1269556))

(assert (= (and b!1269555 condMapEmpty!50734) mapIsEmpty!50734))

(assert (= (and b!1269555 (not condMapEmpty!50734)) mapNonEmpty!50734))

(get-info :version)

(assert (= (and mapNonEmpty!50734 ((_ is ValueCellFull!15531) mapValue!50734)) b!1269560))

(assert (= (and b!1269555 ((_ is ValueCellFull!15531) mapDefault!50734)) b!1269559))

(assert (= start!107080 b!1269555))

(declare-fun m!1168067 () Bool)

(assert (=> b!1269557 m!1168067))

(declare-fun m!1168069 () Bool)

(assert (=> start!107080 m!1168069))

(declare-fun m!1168071 () Bool)

(assert (=> start!107080 m!1168071))

(declare-fun m!1168073 () Bool)

(assert (=> start!107080 m!1168073))

(declare-fun m!1168075 () Bool)

(assert (=> b!1269556 m!1168075))

(declare-fun m!1168077 () Bool)

(assert (=> b!1269556 m!1168077))

(declare-fun m!1168079 () Bool)

(assert (=> b!1269556 m!1168079))

(declare-fun m!1168081 () Bool)

(assert (=> b!1269562 m!1168081))

(declare-fun m!1168083 () Bool)

(assert (=> mapNonEmpty!50734 m!1168083))

(check-sat (not b_next!27585) (not start!107080) (not b!1269557) (not mapNonEmpty!50734) b_and!45617 tp_is_empty!32769 (not b!1269556) (not b!1269562))
(check-sat b_and!45617 (not b_next!27585))
