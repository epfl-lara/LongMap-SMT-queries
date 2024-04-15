; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107126 () Bool)

(assert start!107126)

(declare-fun b_free!27631 () Bool)

(declare-fun b_next!27631 () Bool)

(assert (=> start!107126 (= b_free!27631 (not b_next!27631))))

(declare-fun tp!97120 () Bool)

(declare-fun b_and!45645 () Bool)

(assert (=> start!107126 (= tp!97120 b_and!45645)))

(declare-fun b!1270043 () Bool)

(declare-fun res!845195 () Bool)

(declare-fun e!723915 () Bool)

(assert (=> b!1270043 (=> (not res!845195) (not e!723915))))

(declare-datatypes ((array!82805 0))(
  ( (array!82806 (arr!39940 (Array (_ BitVec 32) (_ BitVec 64))) (size!40478 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82805)

(declare-datatypes ((List!28546 0))(
  ( (Nil!28543) (Cons!28542 (h!29751 (_ BitVec 64)) (t!42067 List!28546)) )
))
(declare-fun arrayNoDuplicates!0 (array!82805 (_ BitVec 32) List!28546) Bool)

(assert (=> b!1270043 (= res!845195 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28543))))

(declare-fun b!1270044 () Bool)

(declare-fun e!723917 () Bool)

(declare-fun tp_is_empty!32815 () Bool)

(assert (=> b!1270044 (= e!723917 tp_is_empty!32815)))

(declare-fun b!1270046 () Bool)

(declare-fun res!845197 () Bool)

(assert (=> b!1270046 (=> (not res!845197) (not e!723915))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1270046 (= res!845197 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40478 _keys!1364)) (bvslt from!1698 (size!40478 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1270047 () Bool)

(assert (=> b!1270047 (= e!723915 (not true))))

(declare-datatypes ((V!48947 0))(
  ( (V!48948 (val!16482 Int)) )
))
(declare-datatypes ((ValueCell!15554 0))(
  ( (ValueCellFull!15554 (v!19118 V!48947)) (EmptyCell!15554) )
))
(declare-datatypes ((array!82807 0))(
  ( (array!82808 (arr!39941 (Array (_ BitVec 32) ValueCell!15554)) (size!40479 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82807)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48947)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48947)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48947)

(declare-fun zeroValueBefore!52 () V!48947)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-datatypes ((tuple2!21432 0))(
  ( (tuple2!21433 (_1!10727 (_ BitVec 64)) (_2!10727 V!48947)) )
))
(declare-datatypes ((List!28547 0))(
  ( (Nil!28544) (Cons!28543 (h!29752 tuple2!21432) (t!42068 List!28547)) )
))
(declare-datatypes ((ListLongMap!19161 0))(
  ( (ListLongMap!19162 (toList!9596 List!28547)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5929 (array!82805 array!82807 (_ BitVec 32) (_ BitVec 32) V!48947 V!48947 (_ BitVec 32) Int) ListLongMap!19161)

(assert (=> b!1270047 (= (getCurrentListMapNoExtraKeys!5929 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5929 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42146 0))(
  ( (Unit!42147) )
))
(declare-fun lt!574481 () Unit!42146)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1229 (array!82805 array!82807 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48947 V!48947 V!48947 V!48947 (_ BitVec 32) Int) Unit!42146)

(assert (=> b!1270047 (= lt!574481 (lemmaNoChangeToArrayThenSameMapNoExtras!1229 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapIsEmpty!50803 () Bool)

(declare-fun mapRes!50803 () Bool)

(assert (=> mapIsEmpty!50803 mapRes!50803))

(declare-fun b!1270048 () Bool)

(declare-fun e!723916 () Bool)

(declare-fun e!723919 () Bool)

(assert (=> b!1270048 (= e!723916 (and e!723919 mapRes!50803))))

(declare-fun condMapEmpty!50803 () Bool)

(declare-fun mapDefault!50803 () ValueCell!15554)

(assert (=> b!1270048 (= condMapEmpty!50803 (= (arr!39941 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15554)) mapDefault!50803)))))

(declare-fun b!1270049 () Bool)

(assert (=> b!1270049 (= e!723919 tp_is_empty!32815)))

(declare-fun res!845194 () Bool)

(assert (=> start!107126 (=> (not res!845194) (not e!723915))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107126 (= res!845194 (validMask!0 mask!1730))))

(assert (=> start!107126 e!723915))

(declare-fun array_inv!30545 (array!82807) Bool)

(assert (=> start!107126 (and (array_inv!30545 _values!1134) e!723916)))

(assert (=> start!107126 true))

(declare-fun array_inv!30546 (array!82805) Bool)

(assert (=> start!107126 (array_inv!30546 _keys!1364)))

(assert (=> start!107126 tp_is_empty!32815))

(assert (=> start!107126 tp!97120))

(declare-fun b!1270045 () Bool)

(declare-fun res!845196 () Bool)

(assert (=> b!1270045 (=> (not res!845196) (not e!723915))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82805 (_ BitVec 32)) Bool)

(assert (=> b!1270045 (= res!845196 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270050 () Bool)

(declare-fun res!845198 () Bool)

(assert (=> b!1270050 (=> (not res!845198) (not e!723915))))

(assert (=> b!1270050 (= res!845198 (and (= (size!40479 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40478 _keys!1364) (size!40479 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50803 () Bool)

(declare-fun tp!97121 () Bool)

(assert (=> mapNonEmpty!50803 (= mapRes!50803 (and tp!97121 e!723917))))

(declare-fun mapKey!50803 () (_ BitVec 32))

(declare-fun mapRest!50803 () (Array (_ BitVec 32) ValueCell!15554))

(declare-fun mapValue!50803 () ValueCell!15554)

(assert (=> mapNonEmpty!50803 (= (arr!39941 _values!1134) (store mapRest!50803 mapKey!50803 mapValue!50803))))

(assert (= (and start!107126 res!845194) b!1270050))

(assert (= (and b!1270050 res!845198) b!1270045))

(assert (= (and b!1270045 res!845196) b!1270043))

(assert (= (and b!1270043 res!845195) b!1270046))

(assert (= (and b!1270046 res!845197) b!1270047))

(assert (= (and b!1270048 condMapEmpty!50803) mapIsEmpty!50803))

(assert (= (and b!1270048 (not condMapEmpty!50803)) mapNonEmpty!50803))

(get-info :version)

(assert (= (and mapNonEmpty!50803 ((_ is ValueCellFull!15554) mapValue!50803)) b!1270044))

(assert (= (and b!1270048 ((_ is ValueCellFull!15554) mapDefault!50803)) b!1270049))

(assert (= start!107126 b!1270048))

(declare-fun m!1167981 () Bool)

(assert (=> b!1270043 m!1167981))

(declare-fun m!1167983 () Bool)

(assert (=> b!1270047 m!1167983))

(declare-fun m!1167985 () Bool)

(assert (=> b!1270047 m!1167985))

(declare-fun m!1167987 () Bool)

(assert (=> b!1270047 m!1167987))

(declare-fun m!1167989 () Bool)

(assert (=> start!107126 m!1167989))

(declare-fun m!1167991 () Bool)

(assert (=> start!107126 m!1167991))

(declare-fun m!1167993 () Bool)

(assert (=> start!107126 m!1167993))

(declare-fun m!1167995 () Bool)

(assert (=> mapNonEmpty!50803 m!1167995))

(declare-fun m!1167997 () Bool)

(assert (=> b!1270045 m!1167997))

(check-sat (not b!1270043) (not b!1270045) (not start!107126) (not mapNonEmpty!50803) (not b!1270047) b_and!45645 tp_is_empty!32815 (not b_next!27631))
(check-sat b_and!45645 (not b_next!27631))
