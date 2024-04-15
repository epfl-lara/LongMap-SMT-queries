; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20924 () Bool)

(assert start!20924)

(declare-fun b_free!5533 () Bool)

(declare-fun b_next!5533 () Bool)

(assert (=> start!20924 (= b_free!5533 (not b_next!5533))))

(declare-fun tp!19645 () Bool)

(declare-fun b_and!12277 () Bool)

(assert (=> start!20924 (= tp!19645 b_and!12277)))

(declare-fun b!209915 () Bool)

(declare-fun e!136715 () Bool)

(declare-fun tp_is_empty!5395 () Bool)

(assert (=> b!209915 (= e!136715 tp_is_empty!5395)))

(declare-fun b!209916 () Bool)

(declare-fun e!136719 () Bool)

(declare-fun e!136720 () Bool)

(declare-fun mapRes!9167 () Bool)

(assert (=> b!209916 (= e!136719 (and e!136720 mapRes!9167))))

(declare-fun condMapEmpty!9167 () Bool)

(declare-datatypes ((V!6841 0))(
  ( (V!6842 (val!2742 Int)) )
))
(declare-datatypes ((ValueCell!2354 0))(
  ( (ValueCellFull!2354 (v!4714 V!6841)) (EmptyCell!2354) )
))
(declare-datatypes ((array!9977 0))(
  ( (array!9978 (arr!4736 (Array (_ BitVec 32) ValueCell!2354)) (size!5062 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9977)

(declare-fun mapDefault!9167 () ValueCell!2354)

(assert (=> b!209916 (= condMapEmpty!9167 (= (arr!4736 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2354)) mapDefault!9167)))))

(declare-fun mapIsEmpty!9167 () Bool)

(assert (=> mapIsEmpty!9167 mapRes!9167))

(declare-datatypes ((tuple2!4120 0))(
  ( (tuple2!4121 (_1!2071 (_ BitVec 64)) (_2!2071 V!6841)) )
))
(declare-fun lt!107318 () tuple2!4120)

(declare-fun b!209917 () Bool)

(declare-datatypes ((List!3030 0))(
  ( (Nil!3027) (Cons!3026 (h!3668 tuple2!4120) (t!7956 List!3030)) )
))
(declare-datatypes ((ListLongMap!3023 0))(
  ( (ListLongMap!3024 (toList!1527 List!3030)) )
))
(declare-fun lt!107313 () ListLongMap!3023)

(declare-fun lt!107319 () ListLongMap!3023)

(declare-fun lt!107317 () tuple2!4120)

(declare-fun e!136718 () Bool)

(declare-fun +!551 (ListLongMap!3023 tuple2!4120) ListLongMap!3023)

(assert (=> b!209917 (= e!136718 (= lt!107313 (+!551 (+!551 lt!107319 lt!107318) lt!107317)))))

(declare-fun b!209918 () Bool)

(assert (=> b!209918 (= e!136720 tp_is_empty!5395)))

(declare-fun b!209919 () Bool)

(declare-fun res!102349 () Bool)

(declare-fun e!136714 () Bool)

(assert (=> b!209919 (=> (not res!102349) (not e!136714))))

(declare-datatypes ((array!9979 0))(
  ( (array!9980 (arr!4737 (Array (_ BitVec 32) (_ BitVec 64))) (size!5063 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9979)

(declare-datatypes ((List!3031 0))(
  ( (Nil!3028) (Cons!3027 (h!3669 (_ BitVec 64)) (t!7957 List!3031)) )
))
(declare-fun arrayNoDuplicates!0 (array!9979 (_ BitVec 32) List!3031) Bool)

(assert (=> b!209919 (= res!102349 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3028))))

(declare-fun b!209920 () Bool)

(declare-fun res!102347 () Bool)

(assert (=> b!209920 (=> (not res!102347) (not e!136714))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9979 (_ BitVec 32)) Bool)

(assert (=> b!209920 (= res!102347 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!102345 () Bool)

(assert (=> start!20924 (=> (not res!102345) (not e!136714))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20924 (= res!102345 (validMask!0 mask!1149))))

(assert (=> start!20924 e!136714))

(declare-fun array_inv!3111 (array!9977) Bool)

(assert (=> start!20924 (and (array_inv!3111 _values!649) e!136719)))

(assert (=> start!20924 true))

(assert (=> start!20924 tp_is_empty!5395))

(declare-fun array_inv!3112 (array!9979) Bool)

(assert (=> start!20924 (array_inv!3112 _keys!825)))

(assert (=> start!20924 tp!19645))

(declare-fun b!209921 () Bool)

(declare-fun res!102348 () Bool)

(assert (=> b!209921 (=> (not res!102348) (not e!136714))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!209921 (= res!102348 (and (= (size!5062 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5063 _keys!825) (size!5062 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209922 () Bool)

(declare-fun res!102343 () Bool)

(assert (=> b!209922 (=> (not res!102343) (not e!136714))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209922 (= res!102343 (validKeyInArray!0 k0!843))))

(declare-fun b!209923 () Bool)

(declare-fun res!102341 () Bool)

(assert (=> b!209923 (=> (not res!102341) (not e!136714))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209923 (= res!102341 (= (select (arr!4737 _keys!825) i!601) k0!843))))

(declare-fun mapNonEmpty!9167 () Bool)

(declare-fun tp!19646 () Bool)

(assert (=> mapNonEmpty!9167 (= mapRes!9167 (and tp!19646 e!136715))))

(declare-fun mapKey!9167 () (_ BitVec 32))

(declare-fun mapRest!9167 () (Array (_ BitVec 32) ValueCell!2354))

(declare-fun mapValue!9167 () ValueCell!2354)

(assert (=> mapNonEmpty!9167 (= (arr!4736 _values!649) (store mapRest!9167 mapKey!9167 mapValue!9167))))

(declare-fun b!209924 () Bool)

(declare-fun lt!107316 () ListLongMap!3023)

(declare-fun lt!107314 () ListLongMap!3023)

(declare-fun e!136717 () Bool)

(assert (=> b!209924 (= e!136717 (= lt!107316 (+!551 (+!551 lt!107314 lt!107318) lt!107317)))))

(assert (=> b!209924 e!136718))

(declare-fun res!102346 () Bool)

(assert (=> b!209924 (=> (not res!102346) (not e!136718))))

(declare-fun lt!107312 () ListLongMap!3023)

(assert (=> b!209924 (= res!102346 (= lt!107316 (+!551 (+!551 lt!107312 lt!107318) lt!107317)))))

(declare-fun minValue!615 () V!6841)

(assert (=> b!209924 (= lt!107317 (tuple2!4121 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun zeroValue!615 () V!6841)

(assert (=> b!209924 (= lt!107318 (tuple2!4121 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!209925 () Bool)

(assert (=> b!209925 (= e!136714 (not e!136717))))

(declare-fun res!102344 () Bool)

(assert (=> b!209925 (=> res!102344 e!136717)))

(assert (=> b!209925 (= res!102344 (or (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!1041 (array!9979 array!9977 (_ BitVec 32) (_ BitVec 32) V!6841 V!6841 (_ BitVec 32) Int) ListLongMap!3023)

(assert (=> b!209925 (= lt!107313 (getCurrentListMap!1041 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!107311 () array!9977)

(assert (=> b!209925 (= lt!107316 (getCurrentListMap!1041 _keys!825 lt!107311 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209925 (and (= lt!107312 lt!107314) (= lt!107314 lt!107312))))

(declare-fun v!520 () V!6841)

(assert (=> b!209925 (= lt!107314 (+!551 lt!107319 (tuple2!4121 k0!843 v!520)))))

(declare-datatypes ((Unit!6346 0))(
  ( (Unit!6347) )
))
(declare-fun lt!107315 () Unit!6346)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!202 (array!9979 array!9977 (_ BitVec 32) (_ BitVec 32) V!6841 V!6841 (_ BitVec 32) (_ BitVec 64) V!6841 (_ BitVec 32) Int) Unit!6346)

(assert (=> b!209925 (= lt!107315 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!202 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!478 (array!9979 array!9977 (_ BitVec 32) (_ BitVec 32) V!6841 V!6841 (_ BitVec 32) Int) ListLongMap!3023)

(assert (=> b!209925 (= lt!107312 (getCurrentListMapNoExtraKeys!478 _keys!825 lt!107311 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209925 (= lt!107311 (array!9978 (store (arr!4736 _values!649) i!601 (ValueCellFull!2354 v!520)) (size!5062 _values!649)))))

(assert (=> b!209925 (= lt!107319 (getCurrentListMapNoExtraKeys!478 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209926 () Bool)

(declare-fun res!102342 () Bool)

(assert (=> b!209926 (=> (not res!102342) (not e!136714))))

(assert (=> b!209926 (= res!102342 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5063 _keys!825))))))

(assert (= (and start!20924 res!102345) b!209921))

(assert (= (and b!209921 res!102348) b!209920))

(assert (= (and b!209920 res!102347) b!209919))

(assert (= (and b!209919 res!102349) b!209926))

(assert (= (and b!209926 res!102342) b!209922))

(assert (= (and b!209922 res!102343) b!209923))

(assert (= (and b!209923 res!102341) b!209925))

(assert (= (and b!209925 (not res!102344)) b!209924))

(assert (= (and b!209924 res!102346) b!209917))

(assert (= (and b!209916 condMapEmpty!9167) mapIsEmpty!9167))

(assert (= (and b!209916 (not condMapEmpty!9167)) mapNonEmpty!9167))

(get-info :version)

(assert (= (and mapNonEmpty!9167 ((_ is ValueCellFull!2354) mapValue!9167)) b!209915))

(assert (= (and b!209916 ((_ is ValueCellFull!2354) mapDefault!9167)) b!209918))

(assert (= start!20924 b!209916))

(declare-fun m!236885 () Bool)

(assert (=> b!209917 m!236885))

(assert (=> b!209917 m!236885))

(declare-fun m!236887 () Bool)

(assert (=> b!209917 m!236887))

(declare-fun m!236889 () Bool)

(assert (=> mapNonEmpty!9167 m!236889))

(declare-fun m!236891 () Bool)

(assert (=> start!20924 m!236891))

(declare-fun m!236893 () Bool)

(assert (=> start!20924 m!236893))

(declare-fun m!236895 () Bool)

(assert (=> start!20924 m!236895))

(declare-fun m!236897 () Bool)

(assert (=> b!209923 m!236897))

(declare-fun m!236899 () Bool)

(assert (=> b!209925 m!236899))

(declare-fun m!236901 () Bool)

(assert (=> b!209925 m!236901))

(declare-fun m!236903 () Bool)

(assert (=> b!209925 m!236903))

(declare-fun m!236905 () Bool)

(assert (=> b!209925 m!236905))

(declare-fun m!236907 () Bool)

(assert (=> b!209925 m!236907))

(declare-fun m!236909 () Bool)

(assert (=> b!209925 m!236909))

(declare-fun m!236911 () Bool)

(assert (=> b!209925 m!236911))

(declare-fun m!236913 () Bool)

(assert (=> b!209919 m!236913))

(declare-fun m!236915 () Bool)

(assert (=> b!209922 m!236915))

(declare-fun m!236917 () Bool)

(assert (=> b!209920 m!236917))

(declare-fun m!236919 () Bool)

(assert (=> b!209924 m!236919))

(assert (=> b!209924 m!236919))

(declare-fun m!236921 () Bool)

(assert (=> b!209924 m!236921))

(declare-fun m!236923 () Bool)

(assert (=> b!209924 m!236923))

(assert (=> b!209924 m!236923))

(declare-fun m!236925 () Bool)

(assert (=> b!209924 m!236925))

(check-sat (not b_next!5533) tp_is_empty!5395 (not b!209924) (not b!209925) b_and!12277 (not mapNonEmpty!9167) (not b!209919) (not start!20924) (not b!209922) (not b!209920) (not b!209917))
(check-sat b_and!12277 (not b_next!5533))
