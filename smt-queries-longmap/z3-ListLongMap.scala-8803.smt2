; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107042 () Bool)

(assert start!107042)

(declare-fun b_free!27547 () Bool)

(declare-fun b_next!27547 () Bool)

(assert (=> start!107042 (= b_free!27547 (not b_next!27547))))

(declare-fun tp!96869 () Bool)

(declare-fun b_and!45561 () Bool)

(assert (=> start!107042 (= tp!96869 b_and!45561)))

(declare-fun res!844564 () Bool)

(declare-fun e!723288 () Bool)

(assert (=> start!107042 (=> (not res!844564) (not e!723288))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107042 (= res!844564 (validMask!0 mask!1730))))

(assert (=> start!107042 e!723288))

(declare-datatypes ((V!48835 0))(
  ( (V!48836 (val!16440 Int)) )
))
(declare-datatypes ((ValueCell!15512 0))(
  ( (ValueCellFull!15512 (v!19076 V!48835)) (EmptyCell!15512) )
))
(declare-datatypes ((array!82647 0))(
  ( (array!82648 (arr!39861 (Array (_ BitVec 32) ValueCell!15512)) (size!40399 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82647)

(declare-fun e!723285 () Bool)

(declare-fun array_inv!30497 (array!82647) Bool)

(assert (=> start!107042 (and (array_inv!30497 _values!1134) e!723285)))

(assert (=> start!107042 true))

(declare-datatypes ((array!82649 0))(
  ( (array!82650 (arr!39862 (Array (_ BitVec 32) (_ BitVec 64))) (size!40400 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82649)

(declare-fun array_inv!30498 (array!82649) Bool)

(assert (=> start!107042 (array_inv!30498 _keys!1364)))

(declare-fun tp_is_empty!32731 () Bool)

(assert (=> start!107042 tp_is_empty!32731))

(assert (=> start!107042 tp!96869))

(declare-fun mapIsEmpty!50677 () Bool)

(declare-fun mapRes!50677 () Bool)

(assert (=> mapIsEmpty!50677 mapRes!50677))

(declare-fun b!1269035 () Bool)

(assert (=> b!1269035 (= e!723288 (not true))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48835)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48835)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48835)

(declare-fun zeroValueBefore!52 () V!48835)

(declare-datatypes ((tuple2!21378 0))(
  ( (tuple2!21379 (_1!10700 (_ BitVec 64)) (_2!10700 V!48835)) )
))
(declare-datatypes ((List!28494 0))(
  ( (Nil!28491) (Cons!28490 (h!29699 tuple2!21378) (t!42015 List!28494)) )
))
(declare-datatypes ((ListLongMap!19107 0))(
  ( (ListLongMap!19108 (toList!9569 List!28494)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5902 (array!82649 array!82647 (_ BitVec 32) (_ BitVec 32) V!48835 V!48835 (_ BitVec 32) Int) ListLongMap!19107)

(assert (=> b!1269035 (= (getCurrentListMapNoExtraKeys!5902 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5902 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42092 0))(
  ( (Unit!42093) )
))
(declare-fun lt!574355 () Unit!42092)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1202 (array!82649 array!82647 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48835 V!48835 V!48835 V!48835 (_ BitVec 32) Int) Unit!42092)

(assert (=> b!1269035 (= lt!574355 (lemmaNoChangeToArrayThenSameMapNoExtras!1202 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1269036 () Bool)

(declare-fun e!723289 () Bool)

(assert (=> b!1269036 (= e!723289 tp_is_empty!32731)))

(declare-fun b!1269037 () Bool)

(declare-fun res!844566 () Bool)

(assert (=> b!1269037 (=> (not res!844566) (not e!723288))))

(declare-datatypes ((List!28495 0))(
  ( (Nil!28492) (Cons!28491 (h!29700 (_ BitVec 64)) (t!42016 List!28495)) )
))
(declare-fun arrayNoDuplicates!0 (array!82649 (_ BitVec 32) List!28495) Bool)

(assert (=> b!1269037 (= res!844566 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28492))))

(declare-fun b!1269038 () Bool)

(declare-fun res!844567 () Bool)

(assert (=> b!1269038 (=> (not res!844567) (not e!723288))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82649 (_ BitVec 32)) Bool)

(assert (=> b!1269038 (= res!844567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269039 () Bool)

(declare-fun res!844565 () Bool)

(assert (=> b!1269039 (=> (not res!844565) (not e!723288))))

(assert (=> b!1269039 (= res!844565 (and (= (size!40399 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40400 _keys!1364) (size!40399 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269040 () Bool)

(assert (=> b!1269040 (= e!723285 (and e!723289 mapRes!50677))))

(declare-fun condMapEmpty!50677 () Bool)

(declare-fun mapDefault!50677 () ValueCell!15512)

(assert (=> b!1269040 (= condMapEmpty!50677 (= (arr!39861 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15512)) mapDefault!50677)))))

(declare-fun b!1269041 () Bool)

(declare-fun e!723287 () Bool)

(assert (=> b!1269041 (= e!723287 tp_is_empty!32731)))

(declare-fun b!1269042 () Bool)

(declare-fun res!844568 () Bool)

(assert (=> b!1269042 (=> (not res!844568) (not e!723288))))

(assert (=> b!1269042 (= res!844568 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40400 _keys!1364)) (bvslt from!1698 (size!40400 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!50677 () Bool)

(declare-fun tp!96868 () Bool)

(assert (=> mapNonEmpty!50677 (= mapRes!50677 (and tp!96868 e!723287))))

(declare-fun mapValue!50677 () ValueCell!15512)

(declare-fun mapRest!50677 () (Array (_ BitVec 32) ValueCell!15512))

(declare-fun mapKey!50677 () (_ BitVec 32))

(assert (=> mapNonEmpty!50677 (= (arr!39861 _values!1134) (store mapRest!50677 mapKey!50677 mapValue!50677))))

(assert (= (and start!107042 res!844564) b!1269039))

(assert (= (and b!1269039 res!844565) b!1269038))

(assert (= (and b!1269038 res!844567) b!1269037))

(assert (= (and b!1269037 res!844566) b!1269042))

(assert (= (and b!1269042 res!844568) b!1269035))

(assert (= (and b!1269040 condMapEmpty!50677) mapIsEmpty!50677))

(assert (= (and b!1269040 (not condMapEmpty!50677)) mapNonEmpty!50677))

(get-info :version)

(assert (= (and mapNonEmpty!50677 ((_ is ValueCellFull!15512) mapValue!50677)) b!1269041))

(assert (= (and b!1269040 ((_ is ValueCellFull!15512) mapDefault!50677)) b!1269036))

(assert (= start!107042 b!1269040))

(declare-fun m!1167225 () Bool)

(assert (=> start!107042 m!1167225))

(declare-fun m!1167227 () Bool)

(assert (=> start!107042 m!1167227))

(declare-fun m!1167229 () Bool)

(assert (=> start!107042 m!1167229))

(declare-fun m!1167231 () Bool)

(assert (=> b!1269038 m!1167231))

(declare-fun m!1167233 () Bool)

(assert (=> b!1269035 m!1167233))

(declare-fun m!1167235 () Bool)

(assert (=> b!1269035 m!1167235))

(declare-fun m!1167237 () Bool)

(assert (=> b!1269035 m!1167237))

(declare-fun m!1167239 () Bool)

(assert (=> b!1269037 m!1167239))

(declare-fun m!1167241 () Bool)

(assert (=> mapNonEmpty!50677 m!1167241))

(check-sat b_and!45561 tp_is_empty!32731 (not b_next!27547) (not b!1269035) (not b!1269038) (not b!1269037) (not mapNonEmpty!50677) (not start!107042))
(check-sat b_and!45561 (not b_next!27547))
