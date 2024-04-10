; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107116 () Bool)

(assert start!107116)

(declare-fun b_free!27621 () Bool)

(declare-fun b_next!27621 () Bool)

(assert (=> start!107116 (= b_free!27621 (not b_next!27621))))

(declare-fun tp!97089 () Bool)

(declare-fun b_and!45653 () Bool)

(assert (=> start!107116 (= tp!97089 b_and!45653)))

(declare-fun b!1269987 () Bool)

(declare-fun e!723870 () Bool)

(declare-fun tp_is_empty!32805 () Bool)

(assert (=> b!1269987 (= e!723870 tp_is_empty!32805)))

(declare-fun b!1269988 () Bool)

(declare-fun res!845150 () Bool)

(declare-fun e!723869 () Bool)

(assert (=> b!1269988 (=> (not res!845150) (not e!723869))))

(declare-datatypes ((array!82872 0))(
  ( (array!82873 (arr!39973 (Array (_ BitVec 32) (_ BitVec 64))) (size!40509 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82872)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82872 (_ BitVec 32)) Bool)

(assert (=> b!1269988 (= res!845150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1269989 () Bool)

(declare-fun res!845149 () Bool)

(assert (=> b!1269989 (=> (not res!845149) (not e!723869))))

(declare-datatypes ((List!28460 0))(
  ( (Nil!28457) (Cons!28456 (h!29665 (_ BitVec 64)) (t!41989 List!28460)) )
))
(declare-fun arrayNoDuplicates!0 (array!82872 (_ BitVec 32) List!28460) Bool)

(assert (=> b!1269989 (= res!845149 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28457))))

(declare-fun b!1269990 () Bool)

(declare-fun res!845146 () Bool)

(assert (=> b!1269990 (=> (not res!845146) (not e!723869))))

(declare-datatypes ((V!48933 0))(
  ( (V!48934 (val!16477 Int)) )
))
(declare-datatypes ((ValueCell!15549 0))(
  ( (ValueCellFull!15549 (v!19114 V!48933)) (EmptyCell!15549) )
))
(declare-datatypes ((array!82874 0))(
  ( (array!82875 (arr!39974 (Array (_ BitVec 32) ValueCell!15549)) (size!40510 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82874)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1269990 (= res!845146 (and (= (size!40510 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40509 _keys!1364) (size!40510 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50788 () Bool)

(declare-fun mapRes!50788 () Bool)

(assert (=> mapIsEmpty!50788 mapRes!50788))

(declare-fun b!1269991 () Bool)

(declare-fun e!723872 () Bool)

(assert (=> b!1269991 (= e!723872 (and e!723870 mapRes!50788))))

(declare-fun condMapEmpty!50788 () Bool)

(declare-fun mapDefault!50788 () ValueCell!15549)

(assert (=> b!1269991 (= condMapEmpty!50788 (= (arr!39974 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15549)) mapDefault!50788)))))

(declare-fun res!845148 () Bool)

(assert (=> start!107116 (=> (not res!845148) (not e!723869))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107116 (= res!845148 (validMask!0 mask!1730))))

(assert (=> start!107116 e!723869))

(declare-fun array_inv!30407 (array!82874) Bool)

(assert (=> start!107116 (and (array_inv!30407 _values!1134) e!723872)))

(assert (=> start!107116 true))

(declare-fun array_inv!30408 (array!82872) Bool)

(assert (=> start!107116 (array_inv!30408 _keys!1364)))

(assert (=> start!107116 tp_is_empty!32805))

(assert (=> start!107116 tp!97089))

(declare-fun b!1269992 () Bool)

(declare-fun e!723873 () Bool)

(assert (=> b!1269992 (= e!723873 tp_is_empty!32805)))

(declare-fun b!1269993 () Bool)

(declare-fun res!845147 () Bool)

(assert (=> b!1269993 (=> (not res!845147) (not e!723869))))

(declare-fun from!1698 () (_ BitVec 32))

(assert (=> b!1269993 (= res!845147 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40509 _keys!1364)) (bvslt from!1698 (size!40509 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1269994 () Bool)

(assert (=> b!1269994 (= e!723869 (not true))))

(declare-fun minValueAfter!52 () V!48933)

(declare-fun minValueBefore!52 () V!48933)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48933)

(declare-fun zeroValueBefore!52 () V!48933)

(declare-datatypes ((tuple2!21344 0))(
  ( (tuple2!21345 (_1!10683 (_ BitVec 64)) (_2!10683 V!48933)) )
))
(declare-datatypes ((List!28461 0))(
  ( (Nil!28458) (Cons!28457 (h!29666 tuple2!21344) (t!41990 List!28461)) )
))
(declare-datatypes ((ListLongMap!19073 0))(
  ( (ListLongMap!19074 (toList!9552 List!28461)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5884 (array!82872 array!82874 (_ BitVec 32) (_ BitVec 32) V!48933 V!48933 (_ BitVec 32) Int) ListLongMap!19073)

(assert (=> b!1269994 (= (getCurrentListMapNoExtraKeys!5884 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5884 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42290 0))(
  ( (Unit!42291) )
))
(declare-fun lt!574644 () Unit!42290)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1226 (array!82872 array!82874 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48933 V!48933 V!48933 V!48933 (_ BitVec 32) Int) Unit!42290)

(assert (=> b!1269994 (= lt!574644 (lemmaNoChangeToArrayThenSameMapNoExtras!1226 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun mapNonEmpty!50788 () Bool)

(declare-fun tp!97090 () Bool)

(assert (=> mapNonEmpty!50788 (= mapRes!50788 (and tp!97090 e!723873))))

(declare-fun mapRest!50788 () (Array (_ BitVec 32) ValueCell!15549))

(declare-fun mapKey!50788 () (_ BitVec 32))

(declare-fun mapValue!50788 () ValueCell!15549)

(assert (=> mapNonEmpty!50788 (= (arr!39974 _values!1134) (store mapRest!50788 mapKey!50788 mapValue!50788))))

(assert (= (and start!107116 res!845148) b!1269990))

(assert (= (and b!1269990 res!845146) b!1269988))

(assert (= (and b!1269988 res!845150) b!1269989))

(assert (= (and b!1269989 res!845149) b!1269993))

(assert (= (and b!1269993 res!845147) b!1269994))

(assert (= (and b!1269991 condMapEmpty!50788) mapIsEmpty!50788))

(assert (= (and b!1269991 (not condMapEmpty!50788)) mapNonEmpty!50788))

(get-info :version)

(assert (= (and mapNonEmpty!50788 ((_ is ValueCellFull!15549) mapValue!50788)) b!1269992))

(assert (= (and b!1269991 ((_ is ValueCellFull!15549) mapDefault!50788)) b!1269987))

(assert (= start!107116 b!1269991))

(declare-fun m!1168391 () Bool)

(assert (=> b!1269994 m!1168391))

(declare-fun m!1168393 () Bool)

(assert (=> b!1269994 m!1168393))

(declare-fun m!1168395 () Bool)

(assert (=> b!1269994 m!1168395))

(declare-fun m!1168397 () Bool)

(assert (=> b!1269989 m!1168397))

(declare-fun m!1168399 () Bool)

(assert (=> b!1269988 m!1168399))

(declare-fun m!1168401 () Bool)

(assert (=> start!107116 m!1168401))

(declare-fun m!1168403 () Bool)

(assert (=> start!107116 m!1168403))

(declare-fun m!1168405 () Bool)

(assert (=> start!107116 m!1168405))

(declare-fun m!1168407 () Bool)

(assert (=> mapNonEmpty!50788 m!1168407))

(check-sat (not start!107116) (not b!1269989) tp_is_empty!32805 (not b!1269994) (not b_next!27621) (not mapNonEmpty!50788) b_and!45653 (not b!1269988))
(check-sat b_and!45653 (not b_next!27621))
