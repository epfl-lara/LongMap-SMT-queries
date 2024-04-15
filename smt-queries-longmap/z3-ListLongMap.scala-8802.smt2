; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107036 () Bool)

(assert start!107036)

(declare-fun b_free!27541 () Bool)

(declare-fun b_next!27541 () Bool)

(assert (=> start!107036 (= b_free!27541 (not b_next!27541))))

(declare-fun tp!96851 () Bool)

(declare-fun b_and!45555 () Bool)

(assert (=> start!107036 (= tp!96851 b_and!45555)))

(declare-fun b!1268963 () Bool)

(declare-fun e!723243 () Bool)

(declare-fun e!723241 () Bool)

(declare-fun mapRes!50668 () Bool)

(assert (=> b!1268963 (= e!723243 (and e!723241 mapRes!50668))))

(declare-fun condMapEmpty!50668 () Bool)

(declare-datatypes ((V!48827 0))(
  ( (V!48828 (val!16437 Int)) )
))
(declare-datatypes ((ValueCell!15509 0))(
  ( (ValueCellFull!15509 (v!19073 V!48827)) (EmptyCell!15509) )
))
(declare-datatypes ((array!82635 0))(
  ( (array!82636 (arr!39855 (Array (_ BitVec 32) ValueCell!15509)) (size!40393 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82635)

(declare-fun mapDefault!50668 () ValueCell!15509)

(assert (=> b!1268963 (= condMapEmpty!50668 (= (arr!39855 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15509)) mapDefault!50668)))))

(declare-fun res!844523 () Bool)

(declare-fun e!723242 () Bool)

(assert (=> start!107036 (=> (not res!844523) (not e!723242))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107036 (= res!844523 (validMask!0 mask!1730))))

(assert (=> start!107036 e!723242))

(declare-fun array_inv!30491 (array!82635) Bool)

(assert (=> start!107036 (and (array_inv!30491 _values!1134) e!723243)))

(assert (=> start!107036 true))

(declare-datatypes ((array!82637 0))(
  ( (array!82638 (arr!39856 (Array (_ BitVec 32) (_ BitVec 64))) (size!40394 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82637)

(declare-fun array_inv!30492 (array!82637) Bool)

(assert (=> start!107036 (array_inv!30492 _keys!1364)))

(declare-fun tp_is_empty!32725 () Bool)

(assert (=> start!107036 tp_is_empty!32725))

(assert (=> start!107036 tp!96851))

(declare-fun b!1268964 () Bool)

(declare-fun e!723244 () Bool)

(assert (=> b!1268964 (= e!723244 tp_is_empty!32725)))

(declare-fun b!1268965 () Bool)

(assert (=> b!1268965 (= e!723241 tp_is_empty!32725)))

(declare-fun b!1268966 () Bool)

(declare-fun res!844520 () Bool)

(assert (=> b!1268966 (=> (not res!844520) (not e!723242))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1268966 (= res!844520 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40394 _keys!1364)) (bvslt from!1698 (size!40394 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1268967 () Bool)

(assert (=> b!1268967 (= e!723242 (not true))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun minValueAfter!52 () V!48827)

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-fun minValueBefore!52 () V!48827)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48827)

(declare-fun zeroValueBefore!52 () V!48827)

(declare-datatypes ((tuple2!21372 0))(
  ( (tuple2!21373 (_1!10697 (_ BitVec 64)) (_2!10697 V!48827)) )
))
(declare-datatypes ((List!28489 0))(
  ( (Nil!28486) (Cons!28485 (h!29694 tuple2!21372) (t!42010 List!28489)) )
))
(declare-datatypes ((ListLongMap!19101 0))(
  ( (ListLongMap!19102 (toList!9566 List!28489)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5899 (array!82637 array!82635 (_ BitVec 32) (_ BitVec 32) V!48827 V!48827 (_ BitVec 32) Int) ListLongMap!19101)

(assert (=> b!1268967 (= (getCurrentListMapNoExtraKeys!5899 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5899 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42086 0))(
  ( (Unit!42087) )
))
(declare-fun lt!574346 () Unit!42086)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1199 (array!82637 array!82635 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48827 V!48827 V!48827 V!48827 (_ BitVec 32) Int) Unit!42086)

(assert (=> b!1268967 (= lt!574346 (lemmaNoChangeToArrayThenSameMapNoExtras!1199 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!50668 () Bool)

(declare-fun tp!96850 () Bool)

(assert (=> mapNonEmpty!50668 (= mapRes!50668 (and tp!96850 e!723244))))

(declare-fun mapKey!50668 () (_ BitVec 32))

(declare-fun mapRest!50668 () (Array (_ BitVec 32) ValueCell!15509))

(declare-fun mapValue!50668 () ValueCell!15509)

(assert (=> mapNonEmpty!50668 (= (arr!39855 _values!1134) (store mapRest!50668 mapKey!50668 mapValue!50668))))

(declare-fun b!1268968 () Bool)

(declare-fun res!844521 () Bool)

(assert (=> b!1268968 (=> (not res!844521) (not e!723242))))

(declare-datatypes ((List!28490 0))(
  ( (Nil!28487) (Cons!28486 (h!29695 (_ BitVec 64)) (t!42011 List!28490)) )
))
(declare-fun arrayNoDuplicates!0 (array!82637 (_ BitVec 32) List!28490) Bool)

(assert (=> b!1268968 (= res!844521 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28487))))

(declare-fun b!1268969 () Bool)

(declare-fun res!844522 () Bool)

(assert (=> b!1268969 (=> (not res!844522) (not e!723242))))

(assert (=> b!1268969 (= res!844522 (and (= (size!40393 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40394 _keys!1364) (size!40393 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50668 () Bool)

(assert (=> mapIsEmpty!50668 mapRes!50668))

(declare-fun b!1268970 () Bool)

(declare-fun res!844519 () Bool)

(assert (=> b!1268970 (=> (not res!844519) (not e!723242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82637 (_ BitVec 32)) Bool)

(assert (=> b!1268970 (= res!844519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(assert (= (and start!107036 res!844523) b!1268969))

(assert (= (and b!1268969 res!844522) b!1268970))

(assert (= (and b!1268970 res!844519) b!1268968))

(assert (= (and b!1268968 res!844521) b!1268966))

(assert (= (and b!1268966 res!844520) b!1268967))

(assert (= (and b!1268963 condMapEmpty!50668) mapIsEmpty!50668))

(assert (= (and b!1268963 (not condMapEmpty!50668)) mapNonEmpty!50668))

(get-info :version)

(assert (= (and mapNonEmpty!50668 ((_ is ValueCellFull!15509) mapValue!50668)) b!1268964))

(assert (= (and b!1268963 ((_ is ValueCellFull!15509) mapDefault!50668)) b!1268965))

(assert (= start!107036 b!1268963))

(declare-fun m!1167171 () Bool)

(assert (=> b!1268968 m!1167171))

(declare-fun m!1167173 () Bool)

(assert (=> b!1268967 m!1167173))

(declare-fun m!1167175 () Bool)

(assert (=> b!1268967 m!1167175))

(declare-fun m!1167177 () Bool)

(assert (=> b!1268967 m!1167177))

(declare-fun m!1167179 () Bool)

(assert (=> mapNonEmpty!50668 m!1167179))

(declare-fun m!1167181 () Bool)

(assert (=> b!1268970 m!1167181))

(declare-fun m!1167183 () Bool)

(assert (=> start!107036 m!1167183))

(declare-fun m!1167185 () Bool)

(assert (=> start!107036 m!1167185))

(declare-fun m!1167187 () Bool)

(assert (=> start!107036 m!1167187))

(check-sat (not b!1268967) (not start!107036) (not b!1268970) tp_is_empty!32725 b_and!45555 (not mapNonEmpty!50668) (not b_next!27541) (not b!1268968))
(check-sat b_and!45555 (not b_next!27541))
