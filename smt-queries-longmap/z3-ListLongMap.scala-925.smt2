; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20650 () Bool)

(assert start!20650)

(declare-fun b_free!5305 () Bool)

(declare-fun b_next!5305 () Bool)

(assert (=> start!20650 (= b_free!5305 (not b_next!5305))))

(declare-fun tp!18947 () Bool)

(declare-fun b_and!12025 () Bool)

(assert (=> start!20650 (= tp!18947 b_and!12025)))

(declare-fun b!205989 () Bool)

(declare-fun e!134652 () Bool)

(declare-fun tp_is_empty!5161 () Bool)

(assert (=> b!205989 (= e!134652 tp_is_empty!5161)))

(declare-fun b!205990 () Bool)

(declare-fun e!134653 () Bool)

(declare-fun mapRes!8810 () Bool)

(assert (=> b!205990 (= e!134653 (and e!134652 mapRes!8810))))

(declare-fun condMapEmpty!8810 () Bool)

(declare-datatypes ((V!6529 0))(
  ( (V!6530 (val!2625 Int)) )
))
(declare-datatypes ((ValueCell!2237 0))(
  ( (ValueCellFull!2237 (v!4589 V!6529)) (EmptyCell!2237) )
))
(declare-datatypes ((array!9519 0))(
  ( (array!9520 (arr!4509 (Array (_ BitVec 32) ValueCell!2237)) (size!4835 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9519)

(declare-fun mapDefault!8810 () ValueCell!2237)

(assert (=> b!205990 (= condMapEmpty!8810 (= (arr!4509 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2237)) mapDefault!8810)))))

(declare-fun b!205991 () Bool)

(declare-fun res!99692 () Bool)

(declare-fun e!134649 () Bool)

(assert (=> b!205991 (=> (not res!99692) (not e!134649))))

(declare-datatypes ((array!9521 0))(
  ( (array!9522 (arr!4510 (Array (_ BitVec 32) (_ BitVec 64))) (size!4836 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9521)

(declare-datatypes ((List!2869 0))(
  ( (Nil!2866) (Cons!2865 (h!3507 (_ BitVec 64)) (t!7791 List!2869)) )
))
(declare-fun arrayNoDuplicates!0 (array!9521 (_ BitVec 32) List!2869) Bool)

(assert (=> b!205991 (= res!99692 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2866))))

(declare-fun mapIsEmpty!8810 () Bool)

(assert (=> mapIsEmpty!8810 mapRes!8810))

(declare-fun b!205992 () Bool)

(declare-fun e!134651 () Bool)

(assert (=> b!205992 (= e!134651 true)))

(declare-datatypes ((tuple2!3968 0))(
  ( (tuple2!3969 (_1!1995 (_ BitVec 64)) (_2!1995 V!6529)) )
))
(declare-datatypes ((List!2870 0))(
  ( (Nil!2867) (Cons!2866 (h!3508 tuple2!3968) (t!7792 List!2870)) )
))
(declare-datatypes ((ListLongMap!2871 0))(
  ( (ListLongMap!2872 (toList!1451 List!2870)) )
))
(declare-fun lt!105088 () ListLongMap!2871)

(declare-fun lt!105094 () ListLongMap!2871)

(declare-fun lt!105098 () tuple2!3968)

(declare-fun +!500 (ListLongMap!2871 tuple2!3968) ListLongMap!2871)

(assert (=> b!205992 (= lt!105088 (+!500 lt!105094 lt!105098))))

(declare-fun minValue!615 () V!6529)

(declare-fun v!520 () V!6529)

(declare-datatypes ((Unit!6240 0))(
  ( (Unit!6241) )
))
(declare-fun lt!105096 () Unit!6240)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun lt!105097 () ListLongMap!2871)

(declare-fun addCommutativeForDiffKeys!185 (ListLongMap!2871 (_ BitVec 64) V!6529 (_ BitVec 64) V!6529) Unit!6240)

(assert (=> b!205992 (= lt!105096 (addCommutativeForDiffKeys!185 lt!105097 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun mapNonEmpty!8810 () Bool)

(declare-fun tp!18946 () Bool)

(declare-fun e!134654 () Bool)

(assert (=> mapNonEmpty!8810 (= mapRes!8810 (and tp!18946 e!134654))))

(declare-fun mapValue!8810 () ValueCell!2237)

(declare-fun mapKey!8810 () (_ BitVec 32))

(declare-fun mapRest!8810 () (Array (_ BitVec 32) ValueCell!2237))

(assert (=> mapNonEmpty!8810 (= (arr!4509 _values!649) (store mapRest!8810 mapKey!8810 mapValue!8810))))

(declare-fun b!205993 () Bool)

(declare-fun e!134650 () Bool)

(assert (=> b!205993 (= e!134649 (not e!134650))))

(declare-fun res!99688 () Bool)

(assert (=> b!205993 (=> res!99688 e!134650)))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205993 (= res!99688 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!105091 () ListLongMap!2871)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6529)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!992 (array!9521 array!9519 (_ BitVec 32) (_ BitVec 32) V!6529 V!6529 (_ BitVec 32) Int) ListLongMap!2871)

(assert (=> b!205993 (= lt!105091 (getCurrentListMap!992 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105090 () ListLongMap!2871)

(declare-fun lt!105095 () array!9519)

(assert (=> b!205993 (= lt!105090 (getCurrentListMap!992 _keys!825 lt!105095 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105093 () ListLongMap!2871)

(declare-fun lt!105087 () ListLongMap!2871)

(assert (=> b!205993 (and (= lt!105093 lt!105087) (= lt!105087 lt!105093))))

(assert (=> b!205993 (= lt!105087 (+!500 lt!105097 lt!105098))))

(assert (=> b!205993 (= lt!105098 (tuple2!3969 k0!843 v!520))))

(declare-fun lt!105092 () Unit!6240)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!151 (array!9521 array!9519 (_ BitVec 32) (_ BitVec 32) V!6529 V!6529 (_ BitVec 32) (_ BitVec 64) V!6529 (_ BitVec 32) Int) Unit!6240)

(assert (=> b!205993 (= lt!105092 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!151 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!402 (array!9521 array!9519 (_ BitVec 32) (_ BitVec 32) V!6529 V!6529 (_ BitVec 32) Int) ListLongMap!2871)

(assert (=> b!205993 (= lt!105093 (getCurrentListMapNoExtraKeys!402 _keys!825 lt!105095 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205993 (= lt!105095 (array!9520 (store (arr!4509 _values!649) i!601 (ValueCellFull!2237 v!520)) (size!4835 _values!649)))))

(assert (=> b!205993 (= lt!105097 (getCurrentListMapNoExtraKeys!402 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!205994 () Bool)

(declare-fun res!99691 () Bool)

(assert (=> b!205994 (=> (not res!99691) (not e!134649))))

(assert (=> b!205994 (= res!99691 (= (select (arr!4510 _keys!825) i!601) k0!843))))

(declare-fun b!205995 () Bool)

(assert (=> b!205995 (= e!134650 e!134651)))

(declare-fun res!99684 () Bool)

(assert (=> b!205995 (=> res!99684 e!134651)))

(assert (=> b!205995 (= res!99684 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!205995 (= lt!105091 lt!105094)))

(declare-fun lt!105089 () tuple2!3968)

(assert (=> b!205995 (= lt!105094 (+!500 lt!105097 lt!105089))))

(assert (=> b!205995 (= lt!105090 lt!105088)))

(assert (=> b!205995 (= lt!105088 (+!500 lt!105087 lt!105089))))

(assert (=> b!205995 (= lt!105090 (+!500 lt!105093 lt!105089))))

(assert (=> b!205995 (= lt!105089 (tuple2!3969 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205997 () Bool)

(declare-fun res!99687 () Bool)

(assert (=> b!205997 (=> (not res!99687) (not e!134649))))

(assert (=> b!205997 (= res!99687 (and (= (size!4835 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4836 _keys!825) (size!4835 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!205998 () Bool)

(declare-fun res!99686 () Bool)

(assert (=> b!205998 (=> (not res!99686) (not e!134649))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9521 (_ BitVec 32)) Bool)

(assert (=> b!205998 (= res!99686 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!205999 () Bool)

(assert (=> b!205999 (= e!134654 tp_is_empty!5161)))

(declare-fun b!206000 () Bool)

(declare-fun res!99685 () Bool)

(assert (=> b!206000 (=> (not res!99685) (not e!134649))))

(assert (=> b!206000 (= res!99685 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4836 _keys!825))))))

(declare-fun res!99689 () Bool)

(assert (=> start!20650 (=> (not res!99689) (not e!134649))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20650 (= res!99689 (validMask!0 mask!1149))))

(assert (=> start!20650 e!134649))

(declare-fun array_inv!2961 (array!9519) Bool)

(assert (=> start!20650 (and (array_inv!2961 _values!649) e!134653)))

(assert (=> start!20650 true))

(assert (=> start!20650 tp_is_empty!5161))

(declare-fun array_inv!2962 (array!9521) Bool)

(assert (=> start!20650 (array_inv!2962 _keys!825)))

(assert (=> start!20650 tp!18947))

(declare-fun b!205996 () Bool)

(declare-fun res!99690 () Bool)

(assert (=> b!205996 (=> (not res!99690) (not e!134649))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205996 (= res!99690 (validKeyInArray!0 k0!843))))

(assert (= (and start!20650 res!99689) b!205997))

(assert (= (and b!205997 res!99687) b!205998))

(assert (= (and b!205998 res!99686) b!205991))

(assert (= (and b!205991 res!99692) b!206000))

(assert (= (and b!206000 res!99685) b!205996))

(assert (= (and b!205996 res!99690) b!205994))

(assert (= (and b!205994 res!99691) b!205993))

(assert (= (and b!205993 (not res!99688)) b!205995))

(assert (= (and b!205995 (not res!99684)) b!205992))

(assert (= (and b!205990 condMapEmpty!8810) mapIsEmpty!8810))

(assert (= (and b!205990 (not condMapEmpty!8810)) mapNonEmpty!8810))

(get-info :version)

(assert (= (and mapNonEmpty!8810 ((_ is ValueCellFull!2237) mapValue!8810)) b!205999))

(assert (= (and b!205990 ((_ is ValueCellFull!2237) mapDefault!8810)) b!205989))

(assert (= start!20650 b!205990))

(declare-fun m!233223 () Bool)

(assert (=> b!205996 m!233223))

(declare-fun m!233225 () Bool)

(assert (=> b!205994 m!233225))

(declare-fun m!233227 () Bool)

(assert (=> b!205992 m!233227))

(declare-fun m!233229 () Bool)

(assert (=> b!205992 m!233229))

(declare-fun m!233231 () Bool)

(assert (=> start!20650 m!233231))

(declare-fun m!233233 () Bool)

(assert (=> start!20650 m!233233))

(declare-fun m!233235 () Bool)

(assert (=> start!20650 m!233235))

(declare-fun m!233237 () Bool)

(assert (=> mapNonEmpty!8810 m!233237))

(declare-fun m!233239 () Bool)

(assert (=> b!205993 m!233239))

(declare-fun m!233241 () Bool)

(assert (=> b!205993 m!233241))

(declare-fun m!233243 () Bool)

(assert (=> b!205993 m!233243))

(declare-fun m!233245 () Bool)

(assert (=> b!205993 m!233245))

(declare-fun m!233247 () Bool)

(assert (=> b!205993 m!233247))

(declare-fun m!233249 () Bool)

(assert (=> b!205993 m!233249))

(declare-fun m!233251 () Bool)

(assert (=> b!205993 m!233251))

(declare-fun m!233253 () Bool)

(assert (=> b!205995 m!233253))

(declare-fun m!233255 () Bool)

(assert (=> b!205995 m!233255))

(declare-fun m!233257 () Bool)

(assert (=> b!205995 m!233257))

(declare-fun m!233259 () Bool)

(assert (=> b!205998 m!233259))

(declare-fun m!233261 () Bool)

(assert (=> b!205991 m!233261))

(check-sat (not b!205993) (not start!20650) (not b!205991) (not b!205992) (not b_next!5305) (not b!205995) (not b!205998) (not mapNonEmpty!8810) b_and!12025 tp_is_empty!5161 (not b!205996))
(check-sat b_and!12025 (not b_next!5305))
