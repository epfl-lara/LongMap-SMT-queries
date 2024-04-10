; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20864 () Bool)

(assert start!20864)

(declare-fun b_free!5517 () Bool)

(declare-fun b_next!5517 () Bool)

(assert (=> start!20864 (= b_free!5517 (not b_next!5517))))

(declare-fun tp!19591 () Bool)

(declare-fun b_and!12263 () Bool)

(assert (=> start!20864 (= tp!19591 b_and!12263)))

(declare-fun b!209420 () Bool)

(declare-fun res!102088 () Bool)

(declare-fun e!136438 () Bool)

(assert (=> b!209420 (=> (not res!102088) (not e!136438))))

(declare-datatypes ((array!9955 0))(
  ( (array!9956 (arr!4728 (Array (_ BitVec 32) (_ BitVec 64))) (size!5053 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9955)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9955 (_ BitVec 32)) Bool)

(assert (=> b!209420 (= res!102088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!209421 () Bool)

(declare-fun e!136436 () Bool)

(declare-fun e!136439 () Bool)

(declare-fun mapRes!9137 () Bool)

(assert (=> b!209421 (= e!136436 (and e!136439 mapRes!9137))))

(declare-fun condMapEmpty!9137 () Bool)

(declare-datatypes ((V!6819 0))(
  ( (V!6820 (val!2734 Int)) )
))
(declare-datatypes ((ValueCell!2346 0))(
  ( (ValueCellFull!2346 (v!4704 V!6819)) (EmptyCell!2346) )
))
(declare-datatypes ((array!9957 0))(
  ( (array!9958 (arr!4729 (Array (_ BitVec 32) ValueCell!2346)) (size!5054 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9957)

(declare-fun mapDefault!9137 () ValueCell!2346)

(assert (=> b!209421 (= condMapEmpty!9137 (= (arr!4729 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2346)) mapDefault!9137)))))

(declare-fun b!209422 () Bool)

(declare-fun tp_is_empty!5379 () Bool)

(assert (=> b!209422 (= e!136439 tp_is_empty!5379)))

(declare-fun b!209423 () Bool)

(declare-fun res!102085 () Bool)

(assert (=> b!209423 (=> (not res!102085) (not e!136438))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!209423 (= res!102085 (validKeyInArray!0 k0!843))))

(declare-fun b!209424 () Bool)

(declare-fun res!102087 () Bool)

(assert (=> b!209424 (=> (not res!102087) (not e!136438))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!209424 (= res!102087 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!5053 _keys!825))))))

(declare-fun b!209425 () Bool)

(assert (=> b!209425 (= e!136438 (not (bvslt i!601 (size!5054 _values!649))))))

(declare-datatypes ((tuple2!4132 0))(
  ( (tuple2!4133 (_1!2077 (_ BitVec 64)) (_2!2077 V!6819)) )
))
(declare-datatypes ((List!3027 0))(
  ( (Nil!3024) (Cons!3023 (h!3665 tuple2!4132) (t!7958 List!3027)) )
))
(declare-datatypes ((ListLongMap!3045 0))(
  ( (ListLongMap!3046 (toList!1538 List!3027)) )
))
(declare-fun lt!107011 () ListLongMap!3045)

(declare-fun lt!107013 () ListLongMap!3045)

(assert (=> b!209425 (and (= lt!107011 lt!107013) (= lt!107013 lt!107011))))

(declare-fun lt!107012 () ListLongMap!3045)

(declare-fun v!520 () V!6819)

(declare-fun +!541 (ListLongMap!3045 tuple2!4132) ListLongMap!3045)

(assert (=> b!209425 (= lt!107013 (+!541 lt!107012 (tuple2!4133 k0!843 v!520)))))

(declare-datatypes ((Unit!6370 0))(
  ( (Unit!6371) )
))
(declare-fun lt!107010 () Unit!6370)

(declare-fun zeroValue!615 () V!6819)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6819)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!194 (array!9955 array!9957 (_ BitVec 32) (_ BitVec 32) V!6819 V!6819 (_ BitVec 32) (_ BitVec 64) V!6819 (_ BitVec 32) Int) Unit!6370)

(assert (=> b!209425 (= lt!107010 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!194 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!479 (array!9955 array!9957 (_ BitVec 32) (_ BitVec 32) V!6819 V!6819 (_ BitVec 32) Int) ListLongMap!3045)

(assert (=> b!209425 (= lt!107011 (getCurrentListMapNoExtraKeys!479 _keys!825 (array!9958 (store (arr!4729 _values!649) i!601 (ValueCellFull!2346 v!520)) (size!5054 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!209425 (= lt!107012 (getCurrentListMapNoExtraKeys!479 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun res!102083 () Bool)

(assert (=> start!20864 (=> (not res!102083) (not e!136438))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20864 (= res!102083 (validMask!0 mask!1149))))

(assert (=> start!20864 e!136438))

(declare-fun array_inv!3131 (array!9957) Bool)

(assert (=> start!20864 (and (array_inv!3131 _values!649) e!136436)))

(assert (=> start!20864 true))

(assert (=> start!20864 tp_is_empty!5379))

(declare-fun array_inv!3132 (array!9955) Bool)

(assert (=> start!20864 (array_inv!3132 _keys!825)))

(assert (=> start!20864 tp!19591))

(declare-fun mapIsEmpty!9137 () Bool)

(assert (=> mapIsEmpty!9137 mapRes!9137))

(declare-fun b!209426 () Bool)

(declare-fun res!102082 () Bool)

(assert (=> b!209426 (=> (not res!102082) (not e!136438))))

(assert (=> b!209426 (= res!102082 (= (select (arr!4728 _keys!825) i!601) k0!843))))

(declare-fun b!209427 () Bool)

(declare-fun e!136437 () Bool)

(assert (=> b!209427 (= e!136437 tp_is_empty!5379)))

(declare-fun b!209428 () Bool)

(declare-fun res!102086 () Bool)

(assert (=> b!209428 (=> (not res!102086) (not e!136438))))

(declare-datatypes ((List!3028 0))(
  ( (Nil!3025) (Cons!3024 (h!3666 (_ BitVec 64)) (t!7959 List!3028)) )
))
(declare-fun arrayNoDuplicates!0 (array!9955 (_ BitVec 32) List!3028) Bool)

(assert (=> b!209428 (= res!102086 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!3025))))

(declare-fun b!209429 () Bool)

(declare-fun res!102084 () Bool)

(assert (=> b!209429 (=> (not res!102084) (not e!136438))))

(assert (=> b!209429 (= res!102084 (and (= (size!5054 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!5053 _keys!825) (size!5054 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!9137 () Bool)

(declare-fun tp!19592 () Bool)

(assert (=> mapNonEmpty!9137 (= mapRes!9137 (and tp!19592 e!136437))))

(declare-fun mapValue!9137 () ValueCell!2346)

(declare-fun mapRest!9137 () (Array (_ BitVec 32) ValueCell!2346))

(declare-fun mapKey!9137 () (_ BitVec 32))

(assert (=> mapNonEmpty!9137 (= (arr!4729 _values!649) (store mapRest!9137 mapKey!9137 mapValue!9137))))

(assert (= (and start!20864 res!102083) b!209429))

(assert (= (and b!209429 res!102084) b!209420))

(assert (= (and b!209420 res!102088) b!209428))

(assert (= (and b!209428 res!102086) b!209424))

(assert (= (and b!209424 res!102087) b!209423))

(assert (= (and b!209423 res!102085) b!209426))

(assert (= (and b!209426 res!102082) b!209425))

(assert (= (and b!209421 condMapEmpty!9137) mapIsEmpty!9137))

(assert (= (and b!209421 (not condMapEmpty!9137)) mapNonEmpty!9137))

(get-info :version)

(assert (= (and mapNonEmpty!9137 ((_ is ValueCellFull!2346) mapValue!9137)) b!209427))

(assert (= (and b!209421 ((_ is ValueCellFull!2346) mapDefault!9137)) b!209422))

(assert (= start!20864 b!209421))

(declare-fun m!236805 () Bool)

(assert (=> b!209423 m!236805))

(declare-fun m!236807 () Bool)

(assert (=> start!20864 m!236807))

(declare-fun m!236809 () Bool)

(assert (=> start!20864 m!236809))

(declare-fun m!236811 () Bool)

(assert (=> start!20864 m!236811))

(declare-fun m!236813 () Bool)

(assert (=> b!209425 m!236813))

(declare-fun m!236815 () Bool)

(assert (=> b!209425 m!236815))

(declare-fun m!236817 () Bool)

(assert (=> b!209425 m!236817))

(declare-fun m!236819 () Bool)

(assert (=> b!209425 m!236819))

(declare-fun m!236821 () Bool)

(assert (=> b!209425 m!236821))

(declare-fun m!236823 () Bool)

(assert (=> b!209426 m!236823))

(declare-fun m!236825 () Bool)

(assert (=> mapNonEmpty!9137 m!236825))

(declare-fun m!236827 () Bool)

(assert (=> b!209420 m!236827))

(declare-fun m!236829 () Bool)

(assert (=> b!209428 m!236829))

(check-sat (not start!20864) (not b!209428) tp_is_empty!5379 (not b_next!5517) (not b!209423) (not b!209420) (not b!209425) b_and!12263 (not mapNonEmpty!9137))
(check-sat b_and!12263 (not b_next!5517))
