; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20590 () Bool)

(assert start!20590)

(declare-fun b_free!5245 () Bool)

(declare-fun b_next!5245 () Bool)

(assert (=> start!20590 (= b_free!5245 (not b_next!5245))))

(declare-fun tp!18767 () Bool)

(declare-fun b_and!12005 () Bool)

(assert (=> start!20590 (= tp!18767 b_and!12005)))

(declare-fun b!205103 () Bool)

(declare-fun res!98990 () Bool)

(declare-fun e!134147 () Bool)

(assert (=> b!205103 (=> (not res!98990) (not e!134147))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6449 0))(
  ( (V!6450 (val!2595 Int)) )
))
(declare-datatypes ((ValueCell!2207 0))(
  ( (ValueCellFull!2207 (v!4566 V!6449)) (EmptyCell!2207) )
))
(declare-datatypes ((array!9411 0))(
  ( (array!9412 (arr!4456 (Array (_ BitVec 32) ValueCell!2207)) (size!4781 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9411)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((array!9413 0))(
  ( (array!9414 (arr!4457 (Array (_ BitVec 32) (_ BitVec 64))) (size!4782 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9413)

(assert (=> b!205103 (= res!98990 (and (= (size!4781 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4782 _keys!825) (size!4781 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205104 () Bool)

(declare-fun res!98998 () Bool)

(assert (=> b!205104 (=> (not res!98998) (not e!134147))))

(declare-datatypes ((List!2779 0))(
  ( (Nil!2776) (Cons!2775 (h!3417 (_ BitVec 64)) (t!7702 List!2779)) )
))
(declare-fun arrayNoDuplicates!0 (array!9413 (_ BitVec 32) List!2779) Bool)

(assert (=> b!205104 (= res!98998 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2776))))

(declare-fun b!205105 () Bool)

(declare-fun e!134150 () Bool)

(declare-fun e!134146 () Bool)

(assert (=> b!205105 (= e!134150 e!134146)))

(declare-fun res!98994 () Bool)

(assert (=> b!205105 (=> res!98994 e!134146)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!205105 (= res!98994 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3884 0))(
  ( (tuple2!3885 (_1!1953 (_ BitVec 64)) (_2!1953 V!6449)) )
))
(declare-datatypes ((List!2780 0))(
  ( (Nil!2777) (Cons!2776 (h!3418 tuple2!3884) (t!7703 List!2780)) )
))
(declare-datatypes ((ListLongMap!2799 0))(
  ( (ListLongMap!2800 (toList!1415 List!2780)) )
))
(declare-fun lt!104247 () ListLongMap!2799)

(declare-fun lt!104254 () ListLongMap!2799)

(assert (=> b!205105 (= lt!104247 lt!104254)))

(declare-fun lt!104255 () ListLongMap!2799)

(declare-fun lt!104252 () tuple2!3884)

(declare-fun +!469 (ListLongMap!2799 tuple2!3884) ListLongMap!2799)

(assert (=> b!205105 (= lt!104254 (+!469 lt!104255 lt!104252))))

(declare-fun lt!104248 () ListLongMap!2799)

(declare-fun lt!104251 () ListLongMap!2799)

(assert (=> b!205105 (= lt!104248 lt!104251)))

(declare-fun lt!104253 () ListLongMap!2799)

(assert (=> b!205105 (= lt!104251 (+!469 lt!104253 lt!104252))))

(declare-fun lt!104249 () ListLongMap!2799)

(assert (=> b!205105 (= lt!104248 (+!469 lt!104249 lt!104252))))

(declare-fun minValue!615 () V!6449)

(assert (=> b!205105 (= lt!104252 (tuple2!3885 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun res!98997 () Bool)

(assert (=> start!20590 (=> (not res!98997) (not e!134147))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20590 (= res!98997 (validMask!0 mask!1149))))

(assert (=> start!20590 e!134147))

(declare-fun e!134144 () Bool)

(declare-fun array_inv!2917 (array!9411) Bool)

(assert (=> start!20590 (and (array_inv!2917 _values!649) e!134144)))

(assert (=> start!20590 true))

(declare-fun tp_is_empty!5101 () Bool)

(assert (=> start!20590 tp_is_empty!5101))

(declare-fun array_inv!2918 (array!9413) Bool)

(assert (=> start!20590 (array_inv!2918 _keys!825)))

(assert (=> start!20590 tp!18767))

(declare-fun mapIsEmpty!8720 () Bool)

(declare-fun mapRes!8720 () Bool)

(assert (=> mapIsEmpty!8720 mapRes!8720))

(declare-fun b!205106 () Bool)

(declare-fun e!134148 () Bool)

(assert (=> b!205106 (= e!134148 tp_is_empty!5101)))

(declare-fun mapNonEmpty!8720 () Bool)

(declare-fun tp!18766 () Bool)

(declare-fun e!134145 () Bool)

(assert (=> mapNonEmpty!8720 (= mapRes!8720 (and tp!18766 e!134145))))

(declare-fun mapKey!8720 () (_ BitVec 32))

(declare-fun mapValue!8720 () ValueCell!2207)

(declare-fun mapRest!8720 () (Array (_ BitVec 32) ValueCell!2207))

(assert (=> mapNonEmpty!8720 (= (arr!4456 _values!649) (store mapRest!8720 mapKey!8720 mapValue!8720))))

(declare-fun b!205107 () Bool)

(assert (=> b!205107 (= e!134146 true)))

(declare-fun lt!104257 () tuple2!3884)

(assert (=> b!205107 (= lt!104251 (+!469 lt!104254 lt!104257))))

(declare-fun v!520 () V!6449)

(declare-datatypes ((Unit!6216 0))(
  ( (Unit!6217) )
))
(declare-fun lt!104250 () Unit!6216)

(declare-fun addCommutativeForDiffKeys!177 (ListLongMap!2799 (_ BitVec 64) V!6449 (_ BitVec 64) V!6449) Unit!6216)

(assert (=> b!205107 (= lt!104250 (addCommutativeForDiffKeys!177 lt!104255 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205108 () Bool)

(declare-fun res!98996 () Bool)

(assert (=> b!205108 (=> (not res!98996) (not e!134147))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9413 (_ BitVec 32)) Bool)

(assert (=> b!205108 (= res!98996 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205109 () Bool)

(declare-fun res!98993 () Bool)

(assert (=> b!205109 (=> (not res!98993) (not e!134147))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205109 (= res!98993 (validKeyInArray!0 k0!843))))

(declare-fun b!205110 () Bool)

(assert (=> b!205110 (= e!134147 (not e!134150))))

(declare-fun res!98992 () Bool)

(assert (=> b!205110 (=> res!98992 e!134150)))

(assert (=> b!205110 (= res!98992 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun zeroValue!615 () V!6449)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!989 (array!9413 array!9411 (_ BitVec 32) (_ BitVec 32) V!6449 V!6449 (_ BitVec 32) Int) ListLongMap!2799)

(assert (=> b!205110 (= lt!104247 (getCurrentListMap!989 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104258 () array!9411)

(assert (=> b!205110 (= lt!104248 (getCurrentListMap!989 _keys!825 lt!104258 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205110 (and (= lt!104249 lt!104253) (= lt!104253 lt!104249))))

(assert (=> b!205110 (= lt!104253 (+!469 lt!104255 lt!104257))))

(assert (=> b!205110 (= lt!104257 (tuple2!3885 k0!843 v!520))))

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lt!104256 () Unit!6216)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!125 (array!9413 array!9411 (_ BitVec 32) (_ BitVec 32) V!6449 V!6449 (_ BitVec 32) (_ BitVec 64) V!6449 (_ BitVec 32) Int) Unit!6216)

(assert (=> b!205110 (= lt!104256 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!125 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!382 (array!9413 array!9411 (_ BitVec 32) (_ BitVec 32) V!6449 V!6449 (_ BitVec 32) Int) ListLongMap!2799)

(assert (=> b!205110 (= lt!104249 (getCurrentListMapNoExtraKeys!382 _keys!825 lt!104258 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205110 (= lt!104258 (array!9412 (store (arr!4456 _values!649) i!601 (ValueCellFull!2207 v!520)) (size!4781 _values!649)))))

(assert (=> b!205110 (= lt!104255 (getCurrentListMapNoExtraKeys!382 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205111 () Bool)

(assert (=> b!205111 (= e!134145 tp_is_empty!5101)))

(declare-fun b!205112 () Bool)

(declare-fun res!98991 () Bool)

(assert (=> b!205112 (=> (not res!98991) (not e!134147))))

(assert (=> b!205112 (= res!98991 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4782 _keys!825))))))

(declare-fun b!205113 () Bool)

(assert (=> b!205113 (= e!134144 (and e!134148 mapRes!8720))))

(declare-fun condMapEmpty!8720 () Bool)

(declare-fun mapDefault!8720 () ValueCell!2207)

(assert (=> b!205113 (= condMapEmpty!8720 (= (arr!4456 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2207)) mapDefault!8720)))))

(declare-fun b!205114 () Bool)

(declare-fun res!98995 () Bool)

(assert (=> b!205114 (=> (not res!98995) (not e!134147))))

(assert (=> b!205114 (= res!98995 (= (select (arr!4457 _keys!825) i!601) k0!843))))

(assert (= (and start!20590 res!98997) b!205103))

(assert (= (and b!205103 res!98990) b!205108))

(assert (= (and b!205108 res!98996) b!205104))

(assert (= (and b!205104 res!98998) b!205112))

(assert (= (and b!205112 res!98991) b!205109))

(assert (= (and b!205109 res!98993) b!205114))

(assert (= (and b!205114 res!98995) b!205110))

(assert (= (and b!205110 (not res!98992)) b!205105))

(assert (= (and b!205105 (not res!98994)) b!205107))

(assert (= (and b!205113 condMapEmpty!8720) mapIsEmpty!8720))

(assert (= (and b!205113 (not condMapEmpty!8720)) mapNonEmpty!8720))

(get-info :version)

(assert (= (and mapNonEmpty!8720 ((_ is ValueCellFull!2207) mapValue!8720)) b!205111))

(assert (= (and b!205113 ((_ is ValueCellFull!2207) mapDefault!8720)) b!205106))

(assert (= start!20590 b!205113))

(declare-fun m!232821 () Bool)

(assert (=> start!20590 m!232821))

(declare-fun m!232823 () Bool)

(assert (=> start!20590 m!232823))

(declare-fun m!232825 () Bool)

(assert (=> start!20590 m!232825))

(declare-fun m!232827 () Bool)

(assert (=> b!205110 m!232827))

(declare-fun m!232829 () Bool)

(assert (=> b!205110 m!232829))

(declare-fun m!232831 () Bool)

(assert (=> b!205110 m!232831))

(declare-fun m!232833 () Bool)

(assert (=> b!205110 m!232833))

(declare-fun m!232835 () Bool)

(assert (=> b!205110 m!232835))

(declare-fun m!232837 () Bool)

(assert (=> b!205110 m!232837))

(declare-fun m!232839 () Bool)

(assert (=> b!205110 m!232839))

(declare-fun m!232841 () Bool)

(assert (=> b!205107 m!232841))

(declare-fun m!232843 () Bool)

(assert (=> b!205107 m!232843))

(declare-fun m!232845 () Bool)

(assert (=> b!205109 m!232845))

(declare-fun m!232847 () Bool)

(assert (=> b!205105 m!232847))

(declare-fun m!232849 () Bool)

(assert (=> b!205105 m!232849))

(declare-fun m!232851 () Bool)

(assert (=> b!205105 m!232851))

(declare-fun m!232853 () Bool)

(assert (=> mapNonEmpty!8720 m!232853))

(declare-fun m!232855 () Bool)

(assert (=> b!205114 m!232855))

(declare-fun m!232857 () Bool)

(assert (=> b!205104 m!232857))

(declare-fun m!232859 () Bool)

(assert (=> b!205108 m!232859))

(check-sat (not b!205109) (not b!205108) (not start!20590) (not b!205105) (not b!205110) tp_is_empty!5101 (not b_next!5245) (not b!205104) b_and!12005 (not b!205107) (not mapNonEmpty!8720))
(check-sat b_and!12005 (not b_next!5245))
