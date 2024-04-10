; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!4272 () Bool)

(assert start!4272)

(declare-fun b_free!1137 () Bool)

(declare-fun b_next!1137 () Bool)

(assert (=> start!4272 (= b_free!1137 (not b_next!1137))))

(declare-fun tp!4836 () Bool)

(declare-fun b_and!1951 () Bool)

(assert (=> start!4272 (= tp!4836 b_and!1951)))

(declare-fun b!32678 () Bool)

(declare-fun e!20768 () Bool)

(declare-fun tp_is_empty!1491 () Bool)

(assert (=> b!32678 (= e!20768 tp_is_empty!1491)))

(declare-fun mapIsEmpty!1771 () Bool)

(declare-fun mapRes!1771 () Bool)

(assert (=> mapIsEmpty!1771 mapRes!1771))

(declare-fun b!32679 () Bool)

(declare-fun res!19844 () Bool)

(declare-fun e!20769 () Bool)

(assert (=> b!32679 (=> (not res!19844) (not e!20769))))

(declare-datatypes ((array!2195 0))(
  ( (array!2196 (arr!1049 (Array (_ BitVec 32) (_ BitVec 64))) (size!1150 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2195)

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2195 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!32679 (= res!19844 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32680 () Bool)

(declare-fun res!19843 () Bool)

(declare-fun e!20766 () Bool)

(assert (=> b!32680 (=> (not res!19843) (not e!20766))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!2195 (_ BitVec 32)) Bool)

(assert (=> b!32680 (= res!19843 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun res!19845 () Bool)

(assert (=> start!4272 (=> (not res!19845) (not e!20766))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4272 (= res!19845 (validMask!0 mask!2294))))

(assert (=> start!4272 e!20766))

(assert (=> start!4272 true))

(assert (=> start!4272 tp!4836))

(declare-datatypes ((V!1813 0))(
  ( (V!1814 (val!772 Int)) )
))
(declare-datatypes ((ValueCell!546 0))(
  ( (ValueCellFull!546 (v!1863 V!1813)) (EmptyCell!546) )
))
(declare-datatypes ((array!2197 0))(
  ( (array!2198 (arr!1050 (Array (_ BitVec 32) ValueCell!546)) (size!1151 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2197)

(declare-fun e!20767 () Bool)

(declare-fun array_inv!733 (array!2197) Bool)

(assert (=> start!4272 (and (array_inv!733 _values!1501) e!20767)))

(declare-fun array_inv!734 (array!2195) Bool)

(assert (=> start!4272 (array_inv!734 _keys!1833)))

(assert (=> start!4272 tp_is_empty!1491))

(declare-fun b!32681 () Bool)

(assert (=> b!32681 (= e!20767 (and e!20768 mapRes!1771))))

(declare-fun condMapEmpty!1771 () Bool)

(declare-fun mapDefault!1771 () ValueCell!546)

(assert (=> b!32681 (= condMapEmpty!1771 (= (arr!1050 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!546)) mapDefault!1771)))))

(declare-fun b!32682 () Bool)

(declare-fun e!20771 () Bool)

(assert (=> b!32682 (= e!20771 tp_is_empty!1491)))

(declare-fun b!32683 () Bool)

(assert (=> b!32683 (= e!20766 e!20769)))

(declare-fun res!19841 () Bool)

(assert (=> b!32683 (=> (not res!19841) (not e!20769))))

(declare-datatypes ((tuple2!1254 0))(
  ( (tuple2!1255 (_1!638 (_ BitVec 64)) (_2!638 V!1813)) )
))
(declare-datatypes ((List!848 0))(
  ( (Nil!845) (Cons!844 (h!1411 tuple2!1254) (t!3545 List!848)) )
))
(declare-datatypes ((ListLongMap!831 0))(
  ( (ListLongMap!832 (toList!431 List!848)) )
))
(declare-fun lt!11857 () ListLongMap!831)

(declare-fun contains!373 (ListLongMap!831 (_ BitVec 64)) Bool)

(assert (=> b!32683 (= res!19841 (not (contains!373 lt!11857 k0!1304)))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1813)

(declare-fun minValue!1443 () V!1813)

(declare-fun getCurrentListMap!259 (array!2195 array!2197 (_ BitVec 32) (_ BitVec 32) V!1813 V!1813 (_ BitVec 32) Int) ListLongMap!831)

(assert (=> b!32683 (= lt!11857 (getCurrentListMap!259 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504))))

(declare-fun b!32684 () Bool)

(declare-fun res!19840 () Bool)

(assert (=> b!32684 (=> (not res!19840) (not e!20766))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!32684 (= res!19840 (validKeyInArray!0 k0!1304))))

(declare-fun b!32685 () Bool)

(declare-fun res!19839 () Bool)

(assert (=> b!32685 (=> (not res!19839) (not e!20766))))

(declare-datatypes ((List!849 0))(
  ( (Nil!846) (Cons!845 (h!1412 (_ BitVec 64)) (t!3546 List!849)) )
))
(declare-fun arrayNoDuplicates!0 (array!2195 (_ BitVec 32) List!849) Bool)

(assert (=> b!32685 (= res!19839 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!846))))

(declare-fun mapNonEmpty!1771 () Bool)

(declare-fun tp!4837 () Bool)

(assert (=> mapNonEmpty!1771 (= mapRes!1771 (and tp!4837 e!20771))))

(declare-fun mapKey!1771 () (_ BitVec 32))

(declare-fun mapRest!1771 () (Array (_ BitVec 32) ValueCell!546))

(declare-fun mapValue!1771 () ValueCell!546)

(assert (=> mapNonEmpty!1771 (= (arr!1050 _values!1501) (store mapRest!1771 mapKey!1771 mapValue!1771))))

(declare-fun b!32686 () Bool)

(assert (=> b!32686 (= e!20769 (not true))))

(declare-fun lt!11856 () (_ BitVec 32))

(assert (=> b!32686 (contains!373 lt!11857 (select (arr!1049 _keys!1833) lt!11856))))

(declare-datatypes ((Unit!709 0))(
  ( (Unit!710) )
))
(declare-fun lt!11858 () Unit!709)

(declare-fun lemmaValidKeyInArrayIsInListMap!44 (array!2195 array!2197 (_ BitVec 32) (_ BitVec 32) V!1813 V!1813 (_ BitVec 32) Int) Unit!709)

(assert (=> b!32686 (= lt!11858 (lemmaValidKeyInArrayIsInListMap!44 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 lt!11856 defaultEntry!1504))))

(declare-fun arrayScanForKey!0 (array!2195 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!32686 (= lt!11856 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!32687 () Bool)

(declare-fun res!19842 () Bool)

(assert (=> b!32687 (=> (not res!19842) (not e!20766))))

(assert (=> b!32687 (= res!19842 (and (= (size!1151 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1150 _keys!1833) (size!1151 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(assert (= (and start!4272 res!19845) b!32687))

(assert (= (and b!32687 res!19842) b!32680))

(assert (= (and b!32680 res!19843) b!32685))

(assert (= (and b!32685 res!19839) b!32684))

(assert (= (and b!32684 res!19840) b!32683))

(assert (= (and b!32683 res!19841) b!32679))

(assert (= (and b!32679 res!19844) b!32686))

(assert (= (and b!32681 condMapEmpty!1771) mapIsEmpty!1771))

(assert (= (and b!32681 (not condMapEmpty!1771)) mapNonEmpty!1771))

(get-info :version)

(assert (= (and mapNonEmpty!1771 ((_ is ValueCellFull!546) mapValue!1771)) b!32682))

(assert (= (and b!32681 ((_ is ValueCellFull!546) mapDefault!1771)) b!32678))

(assert (= start!4272 b!32681))

(declare-fun m!26133 () Bool)

(assert (=> b!32686 m!26133))

(assert (=> b!32686 m!26133))

(declare-fun m!26135 () Bool)

(assert (=> b!32686 m!26135))

(declare-fun m!26137 () Bool)

(assert (=> b!32686 m!26137))

(declare-fun m!26139 () Bool)

(assert (=> b!32686 m!26139))

(declare-fun m!26141 () Bool)

(assert (=> start!4272 m!26141))

(declare-fun m!26143 () Bool)

(assert (=> start!4272 m!26143))

(declare-fun m!26145 () Bool)

(assert (=> start!4272 m!26145))

(declare-fun m!26147 () Bool)

(assert (=> mapNonEmpty!1771 m!26147))

(declare-fun m!26149 () Bool)

(assert (=> b!32680 m!26149))

(declare-fun m!26151 () Bool)

(assert (=> b!32679 m!26151))

(declare-fun m!26153 () Bool)

(assert (=> b!32683 m!26153))

(declare-fun m!26155 () Bool)

(assert (=> b!32683 m!26155))

(declare-fun m!26157 () Bool)

(assert (=> b!32684 m!26157))

(declare-fun m!26159 () Bool)

(assert (=> b!32685 m!26159))

(check-sat (not b_next!1137) (not b!32683) (not b!32685) (not b!32686) (not start!4272) (not b!32680) (not mapNonEmpty!1771) (not b!32679) tp_is_empty!1491 b_and!1951 (not b!32684))
(check-sat b_and!1951 (not b_next!1137))
