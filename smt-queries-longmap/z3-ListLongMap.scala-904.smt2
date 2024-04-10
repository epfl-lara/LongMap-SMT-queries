; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20522 () Bool)

(assert start!20522)

(declare-fun b_free!5181 () Bool)

(declare-fun b_next!5181 () Bool)

(assert (=> start!20522 (= b_free!5181 (not b_next!5181))))

(declare-fun tp!18574 () Bool)

(declare-fun b_and!11927 () Bool)

(assert (=> start!20522 (= tp!18574 b_and!11927)))

(declare-fun b!203895 () Bool)

(declare-fun res!98100 () Bool)

(declare-fun e!133451 () Bool)

(assert (=> b!203895 (=> (not res!98100) (not e!133451))))

(declare-datatypes ((array!9293 0))(
  ( (array!9294 (arr!4397 (Array (_ BitVec 32) (_ BitVec 64))) (size!4722 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9293)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6363 0))(
  ( (V!6364 (val!2563 Int)) )
))
(declare-datatypes ((ValueCell!2175 0))(
  ( (ValueCellFull!2175 (v!4533 V!6363)) (EmptyCell!2175) )
))
(declare-datatypes ((array!9295 0))(
  ( (array!9296 (arr!4398 (Array (_ BitVec 32) ValueCell!2175)) (size!4723 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9295)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!203895 (= res!98100 (and (= (size!4723 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4722 _keys!825) (size!4723 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!98097 () Bool)

(assert (=> start!20522 (=> (not res!98097) (not e!133451))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20522 (= res!98097 (validMask!0 mask!1149))))

(assert (=> start!20522 e!133451))

(declare-fun e!133448 () Bool)

(declare-fun array_inv!2903 (array!9295) Bool)

(assert (=> start!20522 (and (array_inv!2903 _values!649) e!133448)))

(assert (=> start!20522 true))

(declare-fun tp_is_empty!5037 () Bool)

(assert (=> start!20522 tp_is_empty!5037))

(declare-fun array_inv!2904 (array!9293) Bool)

(assert (=> start!20522 (array_inv!2904 _keys!825)))

(assert (=> start!20522 tp!18574))

(declare-fun mapNonEmpty!8624 () Bool)

(declare-fun mapRes!8624 () Bool)

(declare-fun tp!18575 () Bool)

(declare-fun e!133450 () Bool)

(assert (=> mapNonEmpty!8624 (= mapRes!8624 (and tp!18575 e!133450))))

(declare-fun mapValue!8624 () ValueCell!2175)

(declare-fun mapKey!8624 () (_ BitVec 32))

(declare-fun mapRest!8624 () (Array (_ BitVec 32) ValueCell!2175))

(assert (=> mapNonEmpty!8624 (= (arr!4398 _values!649) (store mapRest!8624 mapKey!8624 mapValue!8624))))

(declare-fun b!203896 () Bool)

(declare-fun e!133452 () Bool)

(declare-fun e!133454 () Bool)

(assert (=> b!203896 (= e!133452 e!133454)))

(declare-fun res!98102 () Bool)

(assert (=> b!203896 (=> res!98102 e!133454)))

(declare-fun k0!843 () (_ BitVec 64))

(assert (=> b!203896 (= res!98102 (= k0!843 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!3886 0))(
  ( (tuple2!3887 (_1!1954 (_ BitVec 64)) (_2!1954 V!6363)) )
))
(declare-datatypes ((List!2786 0))(
  ( (Nil!2783) (Cons!2782 (h!3424 tuple2!3886) (t!7717 List!2786)) )
))
(declare-datatypes ((ListLongMap!2799 0))(
  ( (ListLongMap!2800 (toList!1415 List!2786)) )
))
(declare-fun lt!103081 () ListLongMap!2799)

(declare-fun lt!103077 () ListLongMap!2799)

(assert (=> b!203896 (= lt!103081 lt!103077)))

(declare-fun lt!103083 () ListLongMap!2799)

(declare-fun lt!103080 () tuple2!3886)

(declare-fun +!442 (ListLongMap!2799 tuple2!3886) ListLongMap!2799)

(assert (=> b!203896 (= lt!103077 (+!442 lt!103083 lt!103080))))

(declare-fun lt!103079 () ListLongMap!2799)

(declare-fun lt!103073 () ListLongMap!2799)

(assert (=> b!203896 (= lt!103079 lt!103073)))

(declare-fun lt!103075 () ListLongMap!2799)

(assert (=> b!203896 (= lt!103073 (+!442 lt!103075 lt!103080))))

(declare-fun lt!103072 () ListLongMap!2799)

(assert (=> b!203896 (= lt!103081 (+!442 lt!103072 lt!103080))))

(declare-fun zeroValue!615 () V!6363)

(assert (=> b!203896 (= lt!103080 (tuple2!3887 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203897 () Bool)

(declare-fun res!98096 () Bool)

(assert (=> b!203897 (=> (not res!98096) (not e!133451))))

(declare-datatypes ((List!2787 0))(
  ( (Nil!2784) (Cons!2783 (h!3425 (_ BitVec 64)) (t!7718 List!2787)) )
))
(declare-fun arrayNoDuplicates!0 (array!9293 (_ BitVec 32) List!2787) Bool)

(assert (=> b!203897 (= res!98096 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2784))))

(declare-fun b!203898 () Bool)

(declare-fun res!98101 () Bool)

(assert (=> b!203898 (=> (not res!98101) (not e!133451))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!203898 (= res!98101 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4722 _keys!825))))))

(declare-fun b!203899 () Bool)

(declare-fun e!133449 () Bool)

(assert (=> b!203899 (= e!133448 (and e!133449 mapRes!8624))))

(declare-fun condMapEmpty!8624 () Bool)

(declare-fun mapDefault!8624 () ValueCell!2175)

(assert (=> b!203899 (= condMapEmpty!8624 (= (arr!4398 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2175)) mapDefault!8624)))))

(declare-fun b!203900 () Bool)

(assert (=> b!203900 (= e!133449 tp_is_empty!5037)))

(declare-fun b!203901 () Bool)

(declare-fun res!98103 () Bool)

(assert (=> b!203901 (=> (not res!98103) (not e!133451))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9293 (_ BitVec 32)) Bool)

(assert (=> b!203901 (= res!98103 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!203902 () Bool)

(declare-fun res!98098 () Bool)

(assert (=> b!203902 (=> (not res!98098) (not e!133451))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!203902 (= res!98098 (validKeyInArray!0 k0!843))))

(declare-fun b!203903 () Bool)

(assert (=> b!203903 (= e!133454 true)))

(declare-fun lt!103082 () tuple2!3886)

(assert (=> b!203903 (= lt!103077 (+!442 lt!103073 lt!103082))))

(declare-datatypes ((Unit!6178 0))(
  ( (Unit!6179) )
))
(declare-fun lt!103074 () Unit!6178)

(declare-fun v!520 () V!6363)

(declare-fun addCommutativeForDiffKeys!153 (ListLongMap!2799 (_ BitVec 64) V!6363 (_ BitVec 64) V!6363) Unit!6178)

(assert (=> b!203903 (= lt!103074 (addCommutativeForDiffKeys!153 lt!103075 k0!843 v!520 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!615))))

(declare-fun b!203904 () Bool)

(declare-fun res!98104 () Bool)

(assert (=> b!203904 (=> (not res!98104) (not e!133451))))

(assert (=> b!203904 (= res!98104 (= (select (arr!4397 _keys!825) i!601) k0!843))))

(declare-fun b!203905 () Bool)

(assert (=> b!203905 (= e!133451 (not e!133452))))

(declare-fun res!98099 () Bool)

(assert (=> b!203905 (=> res!98099 e!133452)))

(assert (=> b!203905 (= res!98099 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6363)

(declare-fun getCurrentListMap!989 (array!9293 array!9295 (_ BitVec 32) (_ BitVec 32) V!6363 V!6363 (_ BitVec 32) Int) ListLongMap!2799)

(assert (=> b!203905 (= lt!103079 (getCurrentListMap!989 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!103078 () array!9295)

(assert (=> b!203905 (= lt!103081 (getCurrentListMap!989 _keys!825 lt!103078 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203905 (and (= lt!103072 lt!103083) (= lt!103083 lt!103072))))

(assert (=> b!203905 (= lt!103083 (+!442 lt!103075 lt!103082))))

(assert (=> b!203905 (= lt!103082 (tuple2!3887 k0!843 v!520))))

(declare-fun lt!103076 () Unit!6178)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!102 (array!9293 array!9295 (_ BitVec 32) (_ BitVec 32) V!6363 V!6363 (_ BitVec 32) (_ BitVec 64) V!6363 (_ BitVec 32) Int) Unit!6178)

(assert (=> b!203905 (= lt!103076 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!102 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!363 (array!9293 array!9295 (_ BitVec 32) (_ BitVec 32) V!6363 V!6363 (_ BitVec 32) Int) ListLongMap!2799)

(assert (=> b!203905 (= lt!103072 (getCurrentListMapNoExtraKeys!363 _keys!825 lt!103078 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!203905 (= lt!103078 (array!9296 (store (arr!4398 _values!649) i!601 (ValueCellFull!2175 v!520)) (size!4723 _values!649)))))

(assert (=> b!203905 (= lt!103075 (getCurrentListMapNoExtraKeys!363 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8624 () Bool)

(assert (=> mapIsEmpty!8624 mapRes!8624))

(declare-fun b!203906 () Bool)

(assert (=> b!203906 (= e!133450 tp_is_empty!5037)))

(assert (= (and start!20522 res!98097) b!203895))

(assert (= (and b!203895 res!98100) b!203901))

(assert (= (and b!203901 res!98103) b!203897))

(assert (= (and b!203897 res!98096) b!203898))

(assert (= (and b!203898 res!98101) b!203902))

(assert (= (and b!203902 res!98098) b!203904))

(assert (= (and b!203904 res!98104) b!203905))

(assert (= (and b!203905 (not res!98099)) b!203896))

(assert (= (and b!203896 (not res!98102)) b!203903))

(assert (= (and b!203899 condMapEmpty!8624) mapIsEmpty!8624))

(assert (= (and b!203899 (not condMapEmpty!8624)) mapNonEmpty!8624))

(get-info :version)

(assert (= (and mapNonEmpty!8624 ((_ is ValueCellFull!2175) mapValue!8624)) b!203906))

(assert (= (and b!203899 ((_ is ValueCellFull!2175) mapDefault!8624)) b!203900))

(assert (= start!20522 b!203899))

(declare-fun m!231371 () Bool)

(assert (=> b!203905 m!231371))

(declare-fun m!231373 () Bool)

(assert (=> b!203905 m!231373))

(declare-fun m!231375 () Bool)

(assert (=> b!203905 m!231375))

(declare-fun m!231377 () Bool)

(assert (=> b!203905 m!231377))

(declare-fun m!231379 () Bool)

(assert (=> b!203905 m!231379))

(declare-fun m!231381 () Bool)

(assert (=> b!203905 m!231381))

(declare-fun m!231383 () Bool)

(assert (=> b!203905 m!231383))

(declare-fun m!231385 () Bool)

(assert (=> b!203901 m!231385))

(declare-fun m!231387 () Bool)

(assert (=> b!203897 m!231387))

(declare-fun m!231389 () Bool)

(assert (=> start!20522 m!231389))

(declare-fun m!231391 () Bool)

(assert (=> start!20522 m!231391))

(declare-fun m!231393 () Bool)

(assert (=> start!20522 m!231393))

(declare-fun m!231395 () Bool)

(assert (=> mapNonEmpty!8624 m!231395))

(declare-fun m!231397 () Bool)

(assert (=> b!203896 m!231397))

(declare-fun m!231399 () Bool)

(assert (=> b!203896 m!231399))

(declare-fun m!231401 () Bool)

(assert (=> b!203896 m!231401))

(declare-fun m!231403 () Bool)

(assert (=> b!203904 m!231403))

(declare-fun m!231405 () Bool)

(assert (=> b!203902 m!231405))

(declare-fun m!231407 () Bool)

(assert (=> b!203903 m!231407))

(declare-fun m!231409 () Bool)

(assert (=> b!203903 m!231409))

(check-sat (not start!20522) (not mapNonEmpty!8624) b_and!11927 tp_is_empty!5037 (not b!203897) (not b!203905) (not b!203896) (not b!203903) (not b!203901) (not b_next!5181) (not b!203902))
(check-sat b_and!11927 (not b_next!5181))
