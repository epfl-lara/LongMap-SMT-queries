; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107068 () Bool)

(assert start!107068)

(declare-fun b_free!27573 () Bool)

(declare-fun b_next!27573 () Bool)

(assert (=> start!107068 (= b_free!27573 (not b_next!27573))))

(declare-fun tp!96946 () Bool)

(declare-fun b_and!45605 () Bool)

(assert (=> start!107068 (= tp!96946 b_and!45605)))

(declare-fun b!1269411 () Bool)

(declare-fun e!723509 () Bool)

(assert (=> b!1269411 (= e!723509 (not true))))

(declare-datatypes ((V!48869 0))(
  ( (V!48870 (val!16453 Int)) )
))
(declare-datatypes ((ValueCell!15525 0))(
  ( (ValueCellFull!15525 (v!19090 V!48869)) (EmptyCell!15525) )
))
(declare-datatypes ((array!82776 0))(
  ( (array!82777 (arr!39925 (Array (_ BitVec 32) ValueCell!15525)) (size!40461 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82776)

(declare-fun from!1698 () (_ BitVec 32))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82778 0))(
  ( (array!82779 (arr!39926 (Array (_ BitVec 32) (_ BitVec 64))) (size!40462 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82778)

(declare-fun minValueAfter!52 () V!48869)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48869)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48869)

(declare-fun zeroValueBefore!52 () V!48869)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21310 0))(
  ( (tuple2!21311 (_1!10666 (_ BitVec 64)) (_2!10666 V!48869)) )
))
(declare-datatypes ((List!28423 0))(
  ( (Nil!28420) (Cons!28419 (h!29628 tuple2!21310) (t!41952 List!28423)) )
))
(declare-datatypes ((ListLongMap!19039 0))(
  ( (ListLongMap!19040 (toList!9535 List!28423)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5867 (array!82778 array!82776 (_ BitVec 32) (_ BitVec 32) V!48869 V!48869 (_ BitVec 32) Int) ListLongMap!19039)

(assert (=> b!1269411 (= (getCurrentListMapNoExtraKeys!5867 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5867 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42256 0))(
  ( (Unit!42257) )
))
(declare-fun lt!574572 () Unit!42256)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1209 (array!82778 array!82776 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48869 V!48869 V!48869 V!48869 (_ BitVec 32) Int) Unit!42256)

(assert (=> b!1269411 (= lt!574572 (lemmaNoChangeToArrayThenSameMapNoExtras!1209 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapIsEmpty!50716 () Bool)

(declare-fun mapRes!50716 () Bool)

(assert (=> mapIsEmpty!50716 mapRes!50716))

(declare-fun mapNonEmpty!50716 () Bool)

(declare-fun tp!96945 () Bool)

(declare-fun e!723512 () Bool)

(assert (=> mapNonEmpty!50716 (= mapRes!50716 (and tp!96945 e!723512))))

(declare-fun mapRest!50716 () (Array (_ BitVec 32) ValueCell!15525))

(declare-fun mapValue!50716 () ValueCell!15525)

(declare-fun mapKey!50716 () (_ BitVec 32))

(assert (=> mapNonEmpty!50716 (= (arr!39925 _values!1134) (store mapRest!50716 mapKey!50716 mapValue!50716))))

(declare-fun b!1269412 () Bool)

(declare-fun res!844789 () Bool)

(assert (=> b!1269412 (=> (not res!844789) (not e!723509))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82778 (_ BitVec 32)) Bool)

(assert (=> b!1269412 (= res!844789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269413 () Bool)

(declare-fun e!723513 () Bool)

(declare-fun tp_is_empty!32757 () Bool)

(assert (=> b!1269413 (= e!723513 tp_is_empty!32757)))

(declare-fun res!844790 () Bool)

(assert (=> start!107068 (=> (not res!844790) (not e!723509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107068 (= res!844790 (validMask!0 mask!1730))))

(assert (=> start!107068 e!723509))

(declare-fun e!723510 () Bool)

(declare-fun array_inv!30373 (array!82776) Bool)

(assert (=> start!107068 (and (array_inv!30373 _values!1134) e!723510)))

(assert (=> start!107068 true))

(declare-fun array_inv!30374 (array!82778) Bool)

(assert (=> start!107068 (array_inv!30374 _keys!1364)))

(assert (=> start!107068 tp_is_empty!32757))

(assert (=> start!107068 tp!96946))

(declare-fun b!1269414 () Bool)

(declare-fun res!844788 () Bool)

(assert (=> b!1269414 (=> (not res!844788) (not e!723509))))

(assert (=> b!1269414 (= res!844788 (and (= (size!40461 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40462 _keys!1364) (size!40461 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1269415 () Bool)

(assert (=> b!1269415 (= e!723510 (and e!723513 mapRes!50716))))

(declare-fun condMapEmpty!50716 () Bool)

(declare-fun mapDefault!50716 () ValueCell!15525)

(assert (=> b!1269415 (= condMapEmpty!50716 (= (arr!39925 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15525)) mapDefault!50716)))))

(declare-fun b!1269416 () Bool)

(declare-fun res!844786 () Bool)

(assert (=> b!1269416 (=> (not res!844786) (not e!723509))))

(declare-datatypes ((List!28424 0))(
  ( (Nil!28421) (Cons!28420 (h!29629 (_ BitVec 64)) (t!41953 List!28424)) )
))
(declare-fun arrayNoDuplicates!0 (array!82778 (_ BitVec 32) List!28424) Bool)

(assert (=> b!1269416 (= res!844786 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28421))))

(declare-fun b!1269417 () Bool)

(declare-fun res!844787 () Bool)

(assert (=> b!1269417 (=> (not res!844787) (not e!723509))))

(assert (=> b!1269417 (= res!844787 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40462 _keys!1364)) (bvslt from!1698 (size!40462 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269418 () Bool)

(assert (=> b!1269418 (= e!723512 tp_is_empty!32757)))

(assert (= (and start!107068 res!844790) b!1269414))

(assert (= (and b!1269414 res!844788) b!1269412))

(assert (= (and b!1269412 res!844789) b!1269416))

(assert (= (and b!1269416 res!844786) b!1269417))

(assert (= (and b!1269417 res!844787) b!1269411))

(assert (= (and b!1269415 condMapEmpty!50716) mapIsEmpty!50716))

(assert (= (and b!1269415 (not condMapEmpty!50716)) mapNonEmpty!50716))

(get-info :version)

(assert (= (and mapNonEmpty!50716 ((_ is ValueCellFull!15525) mapValue!50716)) b!1269418))

(assert (= (and b!1269415 ((_ is ValueCellFull!15525) mapDefault!50716)) b!1269413))

(assert (= start!107068 b!1269415))

(declare-fun m!1167959 () Bool)

(assert (=> b!1269411 m!1167959))

(declare-fun m!1167961 () Bool)

(assert (=> b!1269411 m!1167961))

(declare-fun m!1167963 () Bool)

(assert (=> b!1269411 m!1167963))

(declare-fun m!1167965 () Bool)

(assert (=> start!107068 m!1167965))

(declare-fun m!1167967 () Bool)

(assert (=> start!107068 m!1167967))

(declare-fun m!1167969 () Bool)

(assert (=> start!107068 m!1167969))

(declare-fun m!1167971 () Bool)

(assert (=> b!1269416 m!1167971))

(declare-fun m!1167973 () Bool)

(assert (=> b!1269412 m!1167973))

(declare-fun m!1167975 () Bool)

(assert (=> mapNonEmpty!50716 m!1167975))

(check-sat (not b_next!27573) (not mapNonEmpty!50716) (not b!1269411) (not start!107068) (not b!1269412) b_and!45605 tp_is_empty!32757 (not b!1269416))
(check-sat b_and!45605 (not b_next!27573))
