; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!107338 () Bool)

(assert start!107338)

(declare-fun b_free!27619 () Bool)

(declare-fun b_next!27619 () Bool)

(assert (=> start!107338 (= b_free!27619 (not b_next!27619))))

(declare-fun tp!97083 () Bool)

(declare-fun b_and!45653 () Bool)

(assert (=> start!107338 (= tp!97083 b_and!45653)))

(declare-fun b!1271268 () Bool)

(declare-fun res!845651 () Bool)

(declare-fun e!724703 () Bool)

(assert (=> b!1271268 (=> (not res!845651) (not e!724703))))

(declare-fun from!1698 () (_ BitVec 32))

(declare-datatypes ((array!82901 0))(
  ( (array!82902 (arr!39983 (Array (_ BitVec 32) (_ BitVec 64))) (size!40520 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82901)

(assert (=> b!1271268 (= res!845651 (and (bvsge from!1698 #b00000000000000000000000000000000) (bvsle from!1698 (size!40520 _keys!1364)) (bvslt from!1698 (size!40520 _keys!1364)) (bvsge (bvadd #b00000000000000000000000000000001 from!1698) #b00000000000000000000000000000000)))))

(declare-fun b!1271269 () Bool)

(declare-fun e!724705 () Bool)

(declare-fun e!724701 () Bool)

(declare-fun mapRes!50785 () Bool)

(assert (=> b!1271269 (= e!724705 (and e!724701 mapRes!50785))))

(declare-fun condMapEmpty!50785 () Bool)

(declare-datatypes ((V!48931 0))(
  ( (V!48932 (val!16476 Int)) )
))
(declare-datatypes ((ValueCell!15548 0))(
  ( (ValueCellFull!15548 (v!19108 V!48931)) (EmptyCell!15548) )
))
(declare-datatypes ((array!82903 0))(
  ( (array!82904 (arr!39984 (Array (_ BitVec 32) ValueCell!15548)) (size!40521 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82903)

(declare-fun mapDefault!50785 () ValueCell!15548)

(assert (=> b!1271269 (= condMapEmpty!50785 (= (arr!39984 _values!1134) ((as const (Array (_ BitVec 32) ValueCell!15548)) mapDefault!50785)))))

(declare-fun mapIsEmpty!50785 () Bool)

(assert (=> mapIsEmpty!50785 mapRes!50785))

(declare-fun b!1271270 () Bool)

(declare-fun res!845655 () Bool)

(assert (=> b!1271270 (=> (not res!845655) (not e!724703))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271270 (= res!845655 (and (= (size!40521 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40520 _keys!1364) (size!40521 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1271271 () Bool)

(declare-fun e!724704 () Bool)

(declare-fun tp_is_empty!32803 () Bool)

(assert (=> b!1271271 (= e!724704 tp_is_empty!32803)))

(declare-fun b!1271272 () Bool)

(assert (=> b!1271272 (= e!724701 tp_is_empty!32803)))

(declare-fun b!1271273 () Bool)

(declare-fun res!845654 () Bool)

(assert (=> b!1271273 (=> (not res!845654) (not e!724703))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82901 (_ BitVec 32)) Bool)

(assert (=> b!1271273 (= res!845654 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapNonEmpty!50785 () Bool)

(declare-fun tp!97084 () Bool)

(assert (=> mapNonEmpty!50785 (= mapRes!50785 (and tp!97084 e!724704))))

(declare-fun mapKey!50785 () (_ BitVec 32))

(declare-fun mapRest!50785 () (Array (_ BitVec 32) ValueCell!15548))

(declare-fun mapValue!50785 () ValueCell!15548)

(assert (=> mapNonEmpty!50785 (= (arr!39984 _values!1134) (store mapRest!50785 mapKey!50785 mapValue!50785))))

(declare-fun res!845652 () Bool)

(assert (=> start!107338 (=> (not res!845652) (not e!724703))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107338 (= res!845652 (validMask!0 mask!1730))))

(assert (=> start!107338 e!724703))

(declare-fun array_inv!30587 (array!82903) Bool)

(assert (=> start!107338 (and (array_inv!30587 _values!1134) e!724705)))

(assert (=> start!107338 true))

(declare-fun array_inv!30588 (array!82901) Bool)

(assert (=> start!107338 (array_inv!30588 _keys!1364)))

(assert (=> start!107338 tp_is_empty!32803))

(assert (=> start!107338 tp!97083))

(declare-fun b!1271274 () Bool)

(assert (=> b!1271274 (= e!724703 (not true))))

(declare-fun minValueAfter!52 () V!48931)

(declare-fun minValueBefore!52 () V!48931)

(declare-fun defaultEntry!1142 () Int)

(declare-fun zeroValueAfter!52 () V!48931)

(declare-fun zeroValueBefore!52 () V!48931)

(declare-datatypes ((tuple2!21348 0))(
  ( (tuple2!21349 (_1!10685 (_ BitVec 64)) (_2!10685 V!48931)) )
))
(declare-datatypes ((List!28492 0))(
  ( (Nil!28489) (Cons!28488 (h!29706 tuple2!21348) (t!42013 List!28492)) )
))
(declare-datatypes ((ListLongMap!19085 0))(
  ( (ListLongMap!19086 (toList!9558 List!28492)) )
))
(declare-fun getCurrentListMapNoExtraKeys!5930 (array!82901 array!82903 (_ BitVec 32) (_ BitVec 32) V!48931 V!48931 (_ BitVec 32) Int) ListLongMap!19085)

(assert (=> b!1271274 (= (getCurrentListMapNoExtraKeys!5930 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 zeroValueBefore!52 minValueBefore!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142) (getCurrentListMapNoExtraKeys!5930 _keys!1364 _values!1134 mask!1730 extraKeysAfter!73 zeroValueAfter!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-datatypes ((Unit!42257 0))(
  ( (Unit!42258) )
))
(declare-fun lt!575125 () Unit!42257)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!1220 (array!82901 array!82903 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!48931 V!48931 V!48931 V!48931 (_ BitVec 32) Int) Unit!42257)

(assert (=> b!1271274 (= lt!575125 (lemmaNoChangeToArrayThenSameMapNoExtras!1220 _keys!1364 _values!1134 mask!1730 extraKeysBefore!81 extraKeysAfter!73 zeroValueBefore!52 zeroValueAfter!52 minValueBefore!52 minValueAfter!52 (bvadd #b00000000000000000000000000000001 from!1698) defaultEntry!1142))))

(declare-fun b!1271275 () Bool)

(declare-fun res!845653 () Bool)

(assert (=> b!1271275 (=> (not res!845653) (not e!724703))))

(declare-datatypes ((List!28493 0))(
  ( (Nil!28490) (Cons!28489 (h!29707 (_ BitVec 64)) (t!42014 List!28493)) )
))
(declare-fun arrayNoDuplicates!0 (array!82901 (_ BitVec 32) List!28493) Bool)

(assert (=> b!1271275 (= res!845653 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28490))))

(assert (= (and start!107338 res!845652) b!1271270))

(assert (= (and b!1271270 res!845655) b!1271273))

(assert (= (and b!1271273 res!845654) b!1271275))

(assert (= (and b!1271275 res!845653) b!1271268))

(assert (= (and b!1271268 res!845651) b!1271274))

(assert (= (and b!1271269 condMapEmpty!50785) mapIsEmpty!50785))

(assert (= (and b!1271269 (not condMapEmpty!50785)) mapNonEmpty!50785))

(get-info :version)

(assert (= (and mapNonEmpty!50785 ((_ is ValueCellFull!15548) mapValue!50785)) b!1271271))

(assert (= (and b!1271269 ((_ is ValueCellFull!15548) mapDefault!50785)) b!1271272))

(assert (= start!107338 b!1271269))

(declare-fun m!1169985 () Bool)

(assert (=> mapNonEmpty!50785 m!1169985))

(declare-fun m!1169987 () Bool)

(assert (=> b!1271273 m!1169987))

(declare-fun m!1169989 () Bool)

(assert (=> start!107338 m!1169989))

(declare-fun m!1169991 () Bool)

(assert (=> start!107338 m!1169991))

(declare-fun m!1169993 () Bool)

(assert (=> start!107338 m!1169993))

(declare-fun m!1169995 () Bool)

(assert (=> b!1271275 m!1169995))

(declare-fun m!1169997 () Bool)

(assert (=> b!1271274 m!1169997))

(declare-fun m!1169999 () Bool)

(assert (=> b!1271274 m!1169999))

(declare-fun m!1170001 () Bool)

(assert (=> b!1271274 m!1170001))

(check-sat (not b!1271274) tp_is_empty!32803 (not b!1271275) (not mapNonEmpty!50785) b_and!45653 (not b_next!27619) (not start!107338) (not b!1271273))
(check-sat b_and!45653 (not b_next!27619))
