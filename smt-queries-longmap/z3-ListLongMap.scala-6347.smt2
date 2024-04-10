; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!81820 () Bool)

(assert start!81820)

(declare-fun b_free!18315 () Bool)

(declare-fun b_next!18315 () Bool)

(assert (=> start!81820 (= b_free!18315 (not b_next!18315))))

(declare-fun tp!63644 () Bool)

(declare-fun b_and!29801 () Bool)

(assert (=> start!81820 (= tp!63644 b_and!29801)))

(declare-fun b!954130 () Bool)

(declare-fun res!638929 () Bool)

(declare-fun e!537552 () Bool)

(assert (=> b!954130 (=> (not res!638929) (not e!537552))))

(declare-datatypes ((array!57831 0))(
  ( (array!57832 (arr!27795 (Array (_ BitVec 32) (_ BitVec 64))) (size!28274 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!57831)

(declare-datatypes ((List!19383 0))(
  ( (Nil!19380) (Cons!19379 (h!20541 (_ BitVec 64)) (t!27744 List!19383)) )
))
(declare-fun arrayNoDuplicates!0 (array!57831 (_ BitVec 32) List!19383) Bool)

(assert (=> b!954130 (= res!638929 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19380))))

(declare-fun b!954131 () Bool)

(declare-fun res!638932 () Bool)

(assert (=> b!954131 (=> (not res!638932) (not e!537552))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((V!32795 0))(
  ( (V!32796 (val!10480 Int)) )
))
(declare-datatypes ((ValueCell!9948 0))(
  ( (ValueCellFull!9948 (v!13035 V!32795)) (EmptyCell!9948) )
))
(declare-datatypes ((array!57833 0))(
  ( (array!57834 (arr!27796 (Array (_ BitVec 32) ValueCell!9948)) (size!28275 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!57833)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!954131 (= res!638932 (and (= (size!28275 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28274 _keys!1441) (size!28275 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!33250 () Bool)

(declare-fun mapRes!33250 () Bool)

(assert (=> mapIsEmpty!33250 mapRes!33250))

(declare-fun res!638934 () Bool)

(assert (=> start!81820 (=> (not res!638934) (not e!537552))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!81820 (= res!638934 (validMask!0 mask!1823))))

(assert (=> start!81820 e!537552))

(assert (=> start!81820 true))

(declare-fun tp_is_empty!20859 () Bool)

(assert (=> start!81820 tp_is_empty!20859))

(declare-fun array_inv!21577 (array!57831) Bool)

(assert (=> start!81820 (array_inv!21577 _keys!1441)))

(declare-fun e!537550 () Bool)

(declare-fun array_inv!21578 (array!57833) Bool)

(assert (=> start!81820 (and (array_inv!21578 _values!1197) e!537550)))

(assert (=> start!81820 tp!63644))

(declare-fun b!954132 () Bool)

(declare-fun res!638933 () Bool)

(assert (=> b!954132 (=> (not res!638933) (not e!537552))))

(declare-fun i!735 () (_ BitVec 32))

(assert (=> b!954132 (= res!638933 (and (bvsge i!735 #b00000000000000000000000000000000) (bvslt i!735 (size!28274 _keys!1441))))))

(declare-fun b!954133 () Bool)

(declare-fun res!638930 () Bool)

(assert (=> b!954133 (=> (not res!638930) (not e!537552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!954133 (= res!638930 (validKeyInArray!0 (select (arr!27795 _keys!1441) i!735)))))

(declare-fun b!954134 () Bool)

(declare-fun e!537553 () Bool)

(assert (=> b!954134 (= e!537553 tp_is_empty!20859)))

(declare-fun b!954135 () Bool)

(assert (=> b!954135 (= e!537550 (and e!537553 mapRes!33250))))

(declare-fun condMapEmpty!33250 () Bool)

(declare-fun mapDefault!33250 () ValueCell!9948)

(assert (=> b!954135 (= condMapEmpty!33250 (= (arr!27796 _values!1197) ((as const (Array (_ BitVec 32) ValueCell!9948)) mapDefault!33250)))))

(declare-fun b!954136 () Bool)

(declare-fun res!638931 () Bool)

(assert (=> b!954136 (=> (not res!638931) (not e!537552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!57831 (_ BitVec 32)) Bool)

(assert (=> b!954136 (= res!638931 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1441 mask!1823))))

(declare-fun b!954137 () Bool)

(assert (=> b!954137 (= e!537552 false)))

(declare-fun lt!429866 () Bool)

(declare-fun zeroValue!1139 () V!32795)

(declare-fun minValue!1139 () V!32795)

(declare-fun defaultEntry!1205 () Int)

(declare-datatypes ((tuple2!13604 0))(
  ( (tuple2!13605 (_1!6813 (_ BitVec 64)) (_2!6813 V!32795)) )
))
(declare-datatypes ((List!19384 0))(
  ( (Nil!19381) (Cons!19380 (h!20542 tuple2!13604) (t!27745 List!19384)) )
))
(declare-datatypes ((ListLongMap!12301 0))(
  ( (ListLongMap!12302 (toList!6166 List!19384)) )
))
(declare-fun contains!5264 (ListLongMap!12301 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3399 (array!57831 array!57833 (_ BitVec 32) (_ BitVec 32) V!32795 V!32795 (_ BitVec 32) Int) ListLongMap!12301)

(assert (=> b!954137 (= lt!429866 (contains!5264 (getCurrentListMap!3399 _keys!1441 _values!1197 mask!1823 extraKeys!1118 zeroValue!1139 minValue!1139 i!735 defaultEntry!1205) (select (arr!27795 _keys!1441) i!735)))))

(declare-fun b!954138 () Bool)

(declare-fun e!537551 () Bool)

(assert (=> b!954138 (= e!537551 tp_is_empty!20859)))

(declare-fun mapNonEmpty!33250 () Bool)

(declare-fun tp!63645 () Bool)

(assert (=> mapNonEmpty!33250 (= mapRes!33250 (and tp!63645 e!537551))))

(declare-fun mapValue!33250 () ValueCell!9948)

(declare-fun mapRest!33250 () (Array (_ BitVec 32) ValueCell!9948))

(declare-fun mapKey!33250 () (_ BitVec 32))

(assert (=> mapNonEmpty!33250 (= (arr!27796 _values!1197) (store mapRest!33250 mapKey!33250 mapValue!33250))))

(assert (= (and start!81820 res!638934) b!954131))

(assert (= (and b!954131 res!638932) b!954136))

(assert (= (and b!954136 res!638931) b!954130))

(assert (= (and b!954130 res!638929) b!954132))

(assert (= (and b!954132 res!638933) b!954133))

(assert (= (and b!954133 res!638930) b!954137))

(assert (= (and b!954135 condMapEmpty!33250) mapIsEmpty!33250))

(assert (= (and b!954135 (not condMapEmpty!33250)) mapNonEmpty!33250))

(get-info :version)

(assert (= (and mapNonEmpty!33250 ((_ is ValueCellFull!9948) mapValue!33250)) b!954138))

(assert (= (and b!954135 ((_ is ValueCellFull!9948) mapDefault!33250)) b!954134))

(assert (= start!81820 b!954135))

(declare-fun m!885943 () Bool)

(assert (=> start!81820 m!885943))

(declare-fun m!885945 () Bool)

(assert (=> start!81820 m!885945))

(declare-fun m!885947 () Bool)

(assert (=> start!81820 m!885947))

(declare-fun m!885949 () Bool)

(assert (=> b!954133 m!885949))

(assert (=> b!954133 m!885949))

(declare-fun m!885951 () Bool)

(assert (=> b!954133 m!885951))

(declare-fun m!885953 () Bool)

(assert (=> b!954137 m!885953))

(assert (=> b!954137 m!885949))

(assert (=> b!954137 m!885953))

(assert (=> b!954137 m!885949))

(declare-fun m!885955 () Bool)

(assert (=> b!954137 m!885955))

(declare-fun m!885957 () Bool)

(assert (=> b!954136 m!885957))

(declare-fun m!885959 () Bool)

(assert (=> mapNonEmpty!33250 m!885959))

(declare-fun m!885961 () Bool)

(assert (=> b!954130 m!885961))

(check-sat (not b!954137) (not b!954130) (not mapNonEmpty!33250) tp_is_empty!20859 (not b_next!18315) (not b!954133) (not start!81820) b_and!29801 (not b!954136))
(check-sat b_and!29801 (not b_next!18315))
