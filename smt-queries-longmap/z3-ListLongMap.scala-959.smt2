; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20852 () Bool)

(assert start!20852)

(declare-fun b_free!5505 () Bool)

(declare-fun b_next!5505 () Bool)

(assert (=> start!20852 (= b_free!5505 (not b_next!5505))))

(declare-fun tp!19555 () Bool)

(declare-fun b_and!12251 () Bool)

(assert (=> start!20852 (= tp!19555 b_and!12251)))

(declare-fun b!209240 () Bool)

(declare-fun res!101960 () Bool)

(declare-fun e!136345 () Bool)

(assert (=> b!209240 (=> (not res!101960) (not e!136345))))

(declare-datatypes ((array!9933 0))(
  ( (array!9934 (arr!4717 (Array (_ BitVec 32) (_ BitVec 64))) (size!5042 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9933)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209240 (= res!101960 (= (select (arr!4717 _keys!825) i!601) k0!843))))

(declare-fun res!101956 () Bool)

(assert (=> start!20852 (=> (not res!101956) (not e!136345))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20852 (= res!101956 (validMask!0 mask!1149))))

(assert (=> start!20852 e!136345))

(declare-datatypes ((V!6803 0))(
  ( (V!6804 (val!2728 Int)) )
))
(declare-datatypes ((ValueCell!2340 0))(
  ( (ValueCellFull!2340 (v!4698 V!6803)) (EmptyCell!2340) )
))
(declare-datatypes ((array!9935 0))(
  ( (array!9936 (arr!4718 (Array (_ BitVec 32) ValueCell!2340)) (size!5043 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9935)

(declare-fun e!136347 () Bool)

(declare-fun array_inv!3123 (array!9935) Bool)

(assert (=> start!20852 (and (array_inv!3123 _values!649) e!136347)))

(assert (=> start!20852 true))

(declare-fun tp_is_empty!5367 () Bool)

(assert (=> start!20852 tp_is_empty!5367))

(declare-fun array_inv!3124 (array!9933) Bool)

(assert (=> start!20852 (array_inv!3124 _keys!825)))

(assert (=> start!20852 tp!19555))

(declare-fun b!209241 () Bool)

(declare-fun e!136349 () Bool)

(assert (=> b!209241 (= e!136349 tp_is_empty!5367)))

(declare-fun b!209242 () Bool)

(declare-fun e!136346 () Bool)

(assert (=> b!209242 (= e!136346 tp_is_empty!5367)))

(declare-fun mapIsEmpty!9119 () Bool)

(declare-fun mapRes!9119 () Bool)

(assert (=> mapIsEmpty!9119 mapRes!9119))

(declare-fun b!209243 () Bool)

(declare-fun res!101961 () Bool)

(assert (=> b!209243 (=> (not res!101961) (not e!136345))))

(assert (=> b!209243 (= res!101961 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5042 _keys!825))))))

(declare-fun b!209244 () Bool)

(declare-fun res!101958 () Bool)

(assert (=> b!209244 (=> (not res!101958) (not e!136345))))

(declare-datatypes ((List!3019 0))(
  ( (Nil!3016) (Cons!3015 (h!3657 (_ BitVec 64)) (t!7950 List!3019)) )
))
(declare-fun arrayNoDuplicates!0 (array!9933 (_ BitVec 32) List!3019) Bool)

(assert (=> b!209244 (= res!101958 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3016))))

(declare-fun b!209245 () Bool)

(assert (=> b!209245 (= e!136347 (and e!136349 mapRes!9119))))

(declare-fun condMapEmpty!9119 () Bool)

(declare-fun mapDefault!9119 () ValueCell!2340)

(assert (=> b!209245 (= condMapEmpty!9119 (= (arr!4718 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2340)) mapDefault!9119)))))

(declare-fun mapNonEmpty!9119 () Bool)

(declare-fun tp!19556 () Bool)

(assert (=> mapNonEmpty!9119 (= mapRes!9119 (and tp!19556 e!136346))))

(declare-fun mapKey!9119 () (_ BitVec 32))

(declare-fun mapRest!9119 () (Array (_ BitVec 32) ValueCell!2340))

(declare-fun mapValue!9119 () ValueCell!2340)

(assert (=> mapNonEmpty!9119 (= (arr!4718 _values!649) (store mapRest!9119 mapKey!9119 mapValue!9119))))

(declare-fun b!209246 () Bool)

(declare-fun res!101957 () Bool)

(assert (=> b!209246 (=> (not res!101957) (not e!136345))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!209246 (= res!101957 (and (= (size!5043 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5042 _keys!825) (size!5043 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!209247 () Bool)

(assert (=> b!209247 (= e!136345 false)))

(declare-fun v!520 () V!6803)

(declare-fun zeroValue!615 () V!6803)

(declare-datatypes ((tuple2!4124 0))(
  ( (tuple2!4125 (_1!2073 (_ BitVec 64)) (_2!2073 V!6803)) )
))
(declare-datatypes ((List!3020 0))(
  ( (Nil!3017) (Cons!3016 (h!3658 tuple2!4124) (t!7951 List!3020)) )
))
(declare-datatypes ((ListLongMap!3037 0))(
  ( (ListLongMap!3038 (toList!1534 List!3020)) )
))
(declare-fun lt!106947 () ListLongMap!3037)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6803)

(declare-fun getCurrentListMapNoExtraKeys!475 (array!9933 array!9935 (_ BitVec 32) (_ BitVec 32) V!6803 V!6803 (_ BitVec 32) Int) ListLongMap!3037)

(assert (=> b!209247 (= lt!106947 (getCurrentListMapNoExtraKeys!475 _keys!825 (array!9936 (store (arr!4718 _values!649) i!601 (ValueCellFull!2340 v!520)) (size!5043 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106946 () ListLongMap!3037)

(assert (=> b!209247 (= lt!106946 (getCurrentListMapNoExtraKeys!475 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!209248 () Bool)

(declare-fun res!101959 () Bool)

(assert (=> b!209248 (=> (not res!101959) (not e!136345))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209248 (= res!101959 (validKeyInArray!0 k0!843))))

(declare-fun b!209249 () Bool)

(declare-fun res!101962 () Bool)

(assert (=> b!209249 (=> (not res!101962) (not e!136345))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9933 (_ BitVec 32)) Bool)

(assert (=> b!209249 (= res!101962 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(assert (= (and start!20852 res!101956) b!209246))

(assert (= (and b!209246 res!101957) b!209249))

(assert (= (and b!209249 res!101962) b!209244))

(assert (= (and b!209244 res!101958) b!209243))

(assert (= (and b!209243 res!101961) b!209248))

(assert (= (and b!209248 res!101959) b!209240))

(assert (= (and b!209240 res!101960) b!209247))

(assert (= (and b!209245 condMapEmpty!9119) mapIsEmpty!9119))

(assert (= (and b!209245 (not condMapEmpty!9119)) mapNonEmpty!9119))

(get-info :version)

(assert (= (and mapNonEmpty!9119 ((_ is ValueCellFull!2340) mapValue!9119)) b!209242))

(assert (= (and b!209245 ((_ is ValueCellFull!2340) mapDefault!9119)) b!209241))

(assert (= start!20852 b!209245))

(declare-fun m!236657 () Bool)

(assert (=> start!20852 m!236657))

(declare-fun m!236659 () Bool)

(assert (=> start!20852 m!236659))

(declare-fun m!236661 () Bool)

(assert (=> start!20852 m!236661))

(declare-fun m!236663 () Bool)

(assert (=> b!209244 m!236663))

(declare-fun m!236665 () Bool)

(assert (=> b!209248 m!236665))

(declare-fun m!236667 () Bool)

(assert (=> b!209249 m!236667))

(declare-fun m!236669 () Bool)

(assert (=> b!209247 m!236669))

(declare-fun m!236671 () Bool)

(assert (=> b!209247 m!236671))

(declare-fun m!236673 () Bool)

(assert (=> b!209247 m!236673))

(declare-fun m!236675 () Bool)

(assert (=> mapNonEmpty!9119 m!236675))

(declare-fun m!236677 () Bool)

(assert (=> b!209240 m!236677))

(check-sat (not b!209249) (not mapNonEmpty!9119) (not b!209244) tp_is_empty!5367 (not b!209248) (not start!20852) (not b!209247) b_and!12251 (not b_next!5505))
(check-sat b_and!12251 (not b_next!5505))
