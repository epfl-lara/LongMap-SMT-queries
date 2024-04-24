; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107302 () Bool)

(assert start!107302)

(declare-fun b_free!27583 () Bool)

(declare-fun b_next!27583 () Bool)

(assert (=> start!107302 (= b_free!27583 (not b_next!27583))))

(declare-fun tp!96976 () Bool)

(declare-fun b_and!45617 () Bool)

(assert (=> start!107302 (= tp!96976 b_and!45617)))

(declare-fun b!1270836 () Bool)

(declare-fun e!724431 () Bool)

(declare-fun tp_is_empty!32767 () Bool)

(assert (=> b!1270836 (= e!724431 tp_is_empty!32767)))

(declare-fun b!1270837 () Bool)

(declare-fun res!845385 () Bool)

(declare-fun e!724435 () Bool)

(assert (=> b!1270837 (=> (not res!845385) (not e!724435))))

(declare-datatypes ((V!48883 0))(
  ( (V!48884 (val!16458 Int)) )
))
(declare-datatypes ((ValueCell!15530 0))(
  ( (ValueCellFull!15530 (v!19090 V!48883)) (EmptyCell!15530) )
))
(declare-datatypes ((array!82835 0))(
  ( (array!82836 (arr!39950 (Array (_ BitVec 32) ValueCell!15530)) (size!40487 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82835)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82837 0))(
  ( (array!82838 (arr!39951 (Array (_ BitVec 32) (_ BitVec 64))) (size!40488 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82837)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270837 (= res!845385 (and (= (size!40487 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40488 _keys!1364) (size!40487 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun res!845381 () Bool)

(assert (=> start!107302 (=> (not res!845381) (not e!724435))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107302 (= res!845381 (validMask!0 mask!1730))))

(assert (=> start!107302 e!724435))

(declare-fun e!724432 () Bool)

(declare-fun array_inv!30563 (array!82835) Bool)

(assert (=> start!107302 (and (array_inv!30563 _values!1134) e!724432)))

(assert (=> start!107302 true))

(declare-fun array_inv!30564 (array!82837) Bool)

(assert (=> start!107302 (array_inv!30564 _keys!1364)))

(assert (=> start!107302 tp_is_empty!32767))

(assert (=> start!107302 tp!96976))

(declare-fun mapNonEmpty!50731 () Bool)

(declare-fun mapRes!50731 () Bool)

(declare-fun tp!96975 () Bool)

(assert (=> mapNonEmpty!50731 (= mapRes!50731 (and tp!96975 e!724431))))

(declare-fun mapRest!50731 () (Array (_ BitVec 32) ValueCell!15530))

(declare-fun mapKey!50731 () (_ BitVec 32))

(declare-fun mapValue!50731 () ValueCell!15530)

(assert (=> mapNonEmpty!50731 (= (arr!39950 _values!1134) (store mapRest!50731 mapKey!50731 mapValue!50731))))

(declare-fun b!1270838 () Bool)

(declare-fun res!845384 () Bool)

(assert (=> b!1270838 (=> (not res!845384) (not e!724435))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1270838 (= res!845384 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40488 _keys!1364)) (bvslt from!1698 (size!40488 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270839 () Bool)

(declare-fun e!724434 () Bool)

(assert (=> b!1270839 (= e!724434 tp_is_empty!32767)))

(declare-fun mapIsEmpty!50731 () Bool)

(assert (=> mapIsEmpty!50731 mapRes!50731))

(declare-fun b!1270840 () Bool)

(declare-fun res!845382 () Bool)

(assert (=> b!1270840 (=> (not res!845382) (not e!724435))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82837 (_ BitVec 32)) Bool)

(assert (=> b!1270840 (= res!845382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270841 () Bool)

(assert (=> b!1270841 (= e!724432 (and e!724434 mapRes!50731))))

(declare-fun condMapEmpty!50731 () Bool)

(declare-fun mapDefault!50731 () ValueCell!15530)

(assert (=> b!1270841 (= condMapEmpty!50731 (= (arr!39950 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15530)) mapDefault!50731)))))

(declare-fun b!1270842 () Bool)

(assert (=> b!1270842 (= e!724435 (not true))))

(declare-fun minValueAfter!52 () V!48883)

(declare-fun minValueBefore!52 () V!48883)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48883)

(declare-fun zeroValueBefore!52 () V!48883)

(declare-datatypes ((tuple2!21324 0))(
  ( (tuple2!21325 (_1!10673 (_ BitVec 64)) (_2!10673 V!48883)) )
))
(declare-datatypes ((List!28467 0))(
  ( (Nil!28464) (Cons!28463 (h!29681 tuple2!21324) (t!41988 List!28467)) )
))
(declare-datatypes ((ListLongMap!19061 0))(
  ( (ListLongMap!19062 (toList!9546 List!28467)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5918 (array!82837 array!82835 (_ BitVec 32) (_ BitVec 32) V!48883 V!48883 (_ BitVec 32) Int) ListLongMap!19061)

(assert (=> b!1270842 (= (getCurrentListMapNoExtraKeys!5918 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5918 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42233 0))(
  ( (Unit!42234) )
))
(declare-fun lt!575071 () Unit!42233)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1208 (array!82837 array!82835 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48883 V!48883 V!48883 V!48883 (_ BitVec 32) Int) Unit!42233)

(assert (=> b!1270842 (= lt!575071 (lemmaNoChangeToArrayThenSameMapNoExtras!1208 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1270843 () Bool)

(declare-fun res!845383 () Bool)

(assert (=> b!1270843 (=> (not res!845383) (not e!724435))))

(declare-datatypes ((List!28468 0))(
  ( (Nil!28465) (Cons!28464 (h!29682 (_ BitVec 64)) (t!41989 List!28468)) )
))
(declare-fun arrayNoDuplicates!0 (array!82837 (_ BitVec 32) List!28468) Bool)

(assert (=> b!1270843 (= res!845383 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28465))))

(assert (= (and start!107302 res!845381) b!1270837))

(assert (= (and b!1270837 res!845385) b!1270840))

(assert (= (and b!1270840 res!845382) b!1270843))

(assert (= (and b!1270843 res!845383) b!1270838))

(assert (= (and b!1270838 res!845384) b!1270842))

(assert (= (and b!1270841 condMapEmpty!50731) mapIsEmpty!50731))

(assert (= (and b!1270841 (not condMapEmpty!50731)) mapNonEmpty!50731))

(get-info :version)

(assert (= (and mapNonEmpty!50731 ((_ is ValueCellFull!15530) mapValue!50731)) b!1270836))

(assert (= (and b!1270841 ((_ is ValueCellFull!15530) mapDefault!50731)) b!1270839))

(assert (= start!107302 b!1270841))

(declare-fun m!1169661 () Bool)

(assert (=> b!1270843 m!1169661))

(declare-fun m!1169663 () Bool)

(assert (=> mapNonEmpty!50731 m!1169663))

(declare-fun m!1169665 () Bool)

(assert (=> start!107302 m!1169665))

(declare-fun m!1169667 () Bool)

(assert (=> start!107302 m!1169667))

(declare-fun m!1169669 () Bool)

(assert (=> start!107302 m!1169669))

(declare-fun m!1169671 () Bool)

(assert (=> b!1270842 m!1169671))

(declare-fun m!1169673 () Bool)

(assert (=> b!1270842 m!1169673))

(declare-fun m!1169675 () Bool)

(assert (=> b!1270842 m!1169675))

(declare-fun m!1169677 () Bool)

(assert (=> b!1270840 m!1169677))

(check-sat (not mapNonEmpty!50731) (not b_next!27583) (not b!1270843) (not b!1270840) b_and!45617 tp_is_empty!32767 (not start!107302) (not b!1270842))
(check-sat b_and!45617 (not b_next!27583))
