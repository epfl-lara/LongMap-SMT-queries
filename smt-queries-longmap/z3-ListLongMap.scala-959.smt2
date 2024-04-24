; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20854 () Bool)

(assert start!20854)

(declare-fun b_free!5503 () Bool)

(declare-fun b_next!5503 () Bool)

(assert (=> start!20854 (= b_free!5503 (not b_next!5503))))

(declare-fun tp!19549 () Bool)

(declare-fun b_and!12263 () Bool)

(assert (=> start!20854 (= tp!19549 b_and!12263)))

(declare-fun mapIsEmpty!9116 () Bool)

(declare-fun mapRes!9116 () Bool)

(assert (=> mapIsEmpty!9116 mapRes!9116))

(declare-fun b!209257 () Bool)

(declare-fun e!136356 () Bool)

(declare-fun e!136358 () Bool)

(assert (=> b!209257 (= e!136356 (and e!136358 mapRes!9116))))

(declare-fun condMapEmpty!9116 () Bool)

(declare-datatypes ((V!6801 0))(
  ( (V!6802 (val!2727 Int)) )
))
(declare-datatypes ((ValueCell!2339 0))(
  ( (ValueCellFull!2339 (v!4698 V!6801)) (EmptyCell!2339) )
))
(declare-datatypes ((array!9923 0))(
  ( (array!9924 (arr!4712 (Array (_ BitVec 32) ValueCell!2339)) (size!5037 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9923)

(declare-fun mapDefault!9116 () ValueCell!2339)

(assert (=> b!209257 (= condMapEmpty!9116 (= (arr!4712 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2339)) mapDefault!9116)))))

(declare-fun b!209258 () Bool)

(declare-fun tp_is_empty!5365 () Bool)

(assert (=> b!209258 (= e!136358 tp_is_empty!5365)))

(declare-fun b!209259 () Bool)

(declare-fun res!101958 () Bool)

(declare-fun e!136357 () Bool)

(assert (=> b!209259 (=> (not res!101958) (not e!136357))))

(declare-datatypes ((array!9925 0))(
  ( (array!9926 (arr!4713 (Array (_ BitVec 32) (_ BitVec 64))) (size!5038 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9925)

(declare-datatypes ((List!2953 0))(
  ( (Nil!2950) (Cons!2949 (h!3591 (_ BitVec 64)) (t!7876 List!2953)) )
))
(declare-fun arrayNoDuplicates!0 (array!9925 (_ BitVec 32) List!2953) Bool)

(assert (=> b!209259 (= res!101958 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2950))))

(declare-fun b!209260 () Bool)

(declare-fun res!101960 () Bool)

(assert (=> b!209260 (=> (not res!101960) (not e!136357))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9925 (_ BitVec 32)) Bool)

(assert (=> b!209260 (= res!101960 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209261 () Bool)

(declare-fun e!136355 () Bool)

(assert (=> b!209261 (= e!136355 tp_is_empty!5365)))

(declare-fun b!209262 () Bool)

(declare-fun res!101962 () Bool)

(assert (=> b!209262 (=> (not res!101962) (not e!136357))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209262 (= res!101962 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5038 _keys!825))))))

(declare-fun mapNonEmpty!9116 () Bool)

(declare-fun tp!19550 () Bool)

(assert (=> mapNonEmpty!9116 (= mapRes!9116 (and tp!19550 e!136355))))

(declare-fun mapKey!9116 () (_ BitVec 32))

(declare-fun mapValue!9116 () ValueCell!2339)

(declare-fun mapRest!9116 () (Array (_ BitVec 32) ValueCell!2339))

(assert (=> mapNonEmpty!9116 (= (arr!4712 _values!649) (store mapRest!9116 mapKey!9116 mapValue!9116))))

(declare-fun b!209263 () Bool)

(declare-fun res!101961 () Bool)

(assert (=> b!209263 (=> (not res!101961) (not e!136357))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209263 (= res!101961 (validKeyInArray!0 k0!843))))

(declare-fun res!101957 () Bool)

(assert (=> start!20854 (=> (not res!101957) (not e!136357))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20854 (= res!101957 (validMask!0 mask!1149))))

(assert (=> start!20854 e!136357))

(declare-fun array_inv!3089 (array!9923) Bool)

(assert (=> start!20854 (and (array_inv!3089 _values!649) e!136356)))

(assert (=> start!20854 true))

(assert (=> start!20854 tp_is_empty!5365))

(declare-fun array_inv!3090 (array!9925) Bool)

(assert (=> start!20854 (array_inv!3090 _keys!825)))

(assert (=> start!20854 tp!19549))

(declare-fun b!209264 () Bool)

(declare-fun res!101959 () Bool)

(assert (=> b!209264 (=> (not res!101959) (not e!136357))))

(assert (=> b!209264 (= res!101959 (= (select (arr!4713 _keys!825) i!601) k0!843))))

(declare-fun b!209265 () Bool)

(assert (=> b!209265 (= e!136357 false)))

(declare-datatypes ((tuple2!4066 0))(
  ( (tuple2!4067 (_1!2044 (_ BitVec 64)) (_2!2044 V!6801)) )
))
(declare-datatypes ((List!2954 0))(
  ( (Nil!2951) (Cons!2950 (h!3592 tuple2!4066) (t!7877 List!2954)) )
))
(declare-datatypes ((ListLongMap!2981 0))(
  ( (ListLongMap!2982 (toList!1506 List!2954)) )
))
(declare-fun lt!107000 () ListLongMap!2981)

(declare-fun v!520 () V!6801)

(declare-fun zeroValue!615 () V!6801)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6801)

(declare-fun getCurrentListMapNoExtraKeys!469 (array!9925 array!9923 (_ BitVec 32) (_ BitVec 32) V!6801 V!6801 (_ BitVec 32) Int) ListLongMap!2981)

(assert (=> b!209265 (= lt!107000 (getCurrentListMapNoExtraKeys!469 _keys!825 (array!9924 (store (arr!4712 _values!649) i!601 (ValueCellFull!2339 v!520)) (size!5037 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106999 () ListLongMap!2981)

(assert (=> b!209265 (= lt!106999 (getCurrentListMapNoExtraKeys!469 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209266 () Bool)

(declare-fun res!101956 () Bool)

(assert (=> b!209266 (=> (not res!101956) (not e!136357))))

(assert (=> b!209266 (= res!101956 (and (= (size!5037 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5038 _keys!825) (size!5037 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20854 res!101957) b!209266))

(assert (= (and b!209266 res!101956) b!209260))

(assert (= (and b!209260 res!101960) b!209259))

(assert (= (and b!209259 res!101958) b!209262))

(assert (= (and b!209262 res!101962) b!209263))

(assert (= (and b!209263 res!101961) b!209264))

(assert (= (and b!209264 res!101959) b!209265))

(assert (= (and b!209257 condMapEmpty!9116) mapIsEmpty!9116))

(assert (= (and b!209257 (not condMapEmpty!9116)) mapNonEmpty!9116))

(get-info :version)

(assert (= (and mapNonEmpty!9116 ((_ is ValueCellFull!2339) mapValue!9116)) b!209261))

(assert (= (and b!209257 ((_ is ValueCellFull!2339) mapDefault!9116)) b!209258))

(assert (= start!20854 b!209257))

(declare-fun m!236817 () Bool)

(assert (=> b!209259 m!236817))

(declare-fun m!236819 () Bool)

(assert (=> start!20854 m!236819))

(declare-fun m!236821 () Bool)

(assert (=> start!20854 m!236821))

(declare-fun m!236823 () Bool)

(assert (=> start!20854 m!236823))

(declare-fun m!236825 () Bool)

(assert (=> b!209263 m!236825))

(declare-fun m!236827 () Bool)

(assert (=> b!209260 m!236827))

(declare-fun m!236829 () Bool)

(assert (=> b!209264 m!236829))

(declare-fun m!236831 () Bool)

(assert (=> mapNonEmpty!9116 m!236831))

(declare-fun m!236833 () Bool)

(assert (=> b!209265 m!236833))

(declare-fun m!236835 () Bool)

(assert (=> b!209265 m!236835))

(declare-fun m!236837 () Bool)

(assert (=> b!209265 m!236837))

(check-sat (not b!209260) (not mapNonEmpty!9116) (not start!20854) (not b_next!5503) (not b!209263) (not b!209259) tp_is_empty!5365 (not b!209265) b_and!12263)
(check-sat b_and!12263 (not b_next!5503))
