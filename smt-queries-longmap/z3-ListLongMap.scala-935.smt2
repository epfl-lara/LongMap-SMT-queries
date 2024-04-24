; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20710 () Bool)

(assert start!20710)

(declare-fun b_free!5365 () Bool)

(declare-fun b_next!5365 () Bool)

(assert (=> start!20710 (= b_free!5365 (not b_next!5365))))

(declare-fun tp!19126 () Bool)

(declare-fun b_and!12125 () Bool)

(assert (=> start!20710 (= tp!19126 b_and!12125)))

(declare-fun b!207133 () Bool)

(declare-fun e!135275 () Bool)

(declare-fun tp_is_empty!5221 () Bool)

(assert (=> b!207133 (= e!135275 tp_is_empty!5221)))

(declare-fun mapNonEmpty!8900 () Bool)

(declare-fun mapRes!8900 () Bool)

(declare-fun tp!19127 () Bool)

(assert (=> mapNonEmpty!8900 (= mapRes!8900 (and tp!19127 e!135275))))

(declare-datatypes ((V!6609 0))(
  ( (V!6610 (val!2655 Int)) )
))
(declare-datatypes ((ValueCell!2267 0))(
  ( (ValueCellFull!2267 (v!4626 V!6609)) (EmptyCell!2267) )
))
(declare-fun mapValue!8900 () ValueCell!2267)

(declare-datatypes ((array!9645 0))(
  ( (array!9646 (arr!4573 (Array (_ BitVec 32) ValueCell!2267)) (size!4898 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9645)

(declare-fun mapKey!8900 () (_ BitVec 32))

(declare-fun mapRest!8900 () (Array (_ BitVec 32) ValueCell!2267))

(assert (=> mapNonEmpty!8900 (= (arr!4573 _values!649) (store mapRest!8900 mapKey!8900 mapValue!8900))))

(declare-fun b!207134 () Bool)

(declare-fun res!100482 () Bool)

(declare-fun e!135276 () Bool)

(assert (=> b!207134 (=> (not res!100482) (not e!135276))))

(declare-datatypes ((array!9647 0))(
  ( (array!9648 (arr!4574 (Array (_ BitVec 32) (_ BitVec 64))) (size!4899 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9647)

(declare-datatypes ((List!2866 0))(
  ( (Nil!2863) (Cons!2862 (h!3504 (_ BitVec 64)) (t!7789 List!2866)) )
))
(declare-fun arrayNoDuplicates!0 (array!9647 (_ BitVec 32) List!2866) Bool)

(assert (=> b!207134 (= res!100482 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2863))))

(declare-fun b!207135 () Bool)

(declare-fun res!100484 () Bool)

(assert (=> b!207135 (=> (not res!100484) (not e!135276))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207135 (= res!100484 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4899 _keys!825))))))

(declare-fun b!207136 () Bool)

(assert (=> b!207136 (= e!135276 (not true))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!3978 0))(
  ( (tuple2!3979 (_1!2000 (_ BitVec 64)) (_2!2000 V!6609)) )
))
(declare-datatypes ((List!2867 0))(
  ( (Nil!2864) (Cons!2863 (h!3505 tuple2!3978) (t!7790 List!2867)) )
))
(declare-datatypes ((ListLongMap!2893 0))(
  ( (ListLongMap!2894 (toList!1462 List!2867)) )
))
(declare-fun lt!106082 () ListLongMap!2893)

(declare-fun zeroValue!615 () V!6609)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6609)

(declare-fun getCurrentListMap!1032 (array!9647 array!9645 (_ BitVec 32) (_ BitVec 32) V!6609 V!6609 (_ BitVec 32) Int) ListLongMap!2893)

(assert (=> b!207136 (= lt!106082 (getCurrentListMap!1032 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106086 () ListLongMap!2893)

(declare-fun lt!106088 () array!9645)

(assert (=> b!207136 (= lt!106086 (getCurrentListMap!1032 _keys!825 lt!106088 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106087 () ListLongMap!2893)

(declare-fun lt!106085 () ListLongMap!2893)

(assert (=> b!207136 (and (= lt!106087 lt!106085) (= lt!106085 lt!106087))))

(declare-fun lt!106083 () ListLongMap!2893)

(declare-fun v!520 () V!6609)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!516 (ListLongMap!2893 tuple2!3978) ListLongMap!2893)

(assert (=> b!207136 (= lt!106085 (+!516 lt!106083 (tuple2!3979 k0!843 v!520)))))

(declare-datatypes ((Unit!6308 0))(
  ( (Unit!6309) )
))
(declare-fun lt!106084 () Unit!6308)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!168 (array!9647 array!9645 (_ BitVec 32) (_ BitVec 32) V!6609 V!6609 (_ BitVec 32) (_ BitVec 64) V!6609 (_ BitVec 32) Int) Unit!6308)

(assert (=> b!207136 (= lt!106084 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!168 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!425 (array!9647 array!9645 (_ BitVec 32) (_ BitVec 32) V!6609 V!6609 (_ BitVec 32) Int) ListLongMap!2893)

(assert (=> b!207136 (= lt!106087 (getCurrentListMapNoExtraKeys!425 _keys!825 lt!106088 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207136 (= lt!106088 (array!9646 (store (arr!4573 _values!649) i!601 (ValueCellFull!2267 v!520)) (size!4898 _values!649)))))

(assert (=> b!207136 (= lt!106083 (getCurrentListMapNoExtraKeys!425 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207137 () Bool)

(declare-fun res!100485 () Bool)

(assert (=> b!207137 (=> (not res!100485) (not e!135276))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9647 (_ BitVec 32)) Bool)

(assert (=> b!207137 (= res!100485 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207138 () Bool)

(declare-fun res!100486 () Bool)

(assert (=> b!207138 (=> (not res!100486) (not e!135276))))

(assert (=> b!207138 (= res!100486 (= (select (arr!4574 _keys!825) i!601) k0!843))))

(declare-fun res!100483 () Bool)

(assert (=> start!20710 (=> (not res!100483) (not e!135276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20710 (= res!100483 (validMask!0 mask!1149))))

(assert (=> start!20710 e!135276))

(declare-fun e!135277 () Bool)

(declare-fun array_inv!2995 (array!9645) Bool)

(assert (=> start!20710 (and (array_inv!2995 _values!649) e!135277)))

(assert (=> start!20710 true))

(assert (=> start!20710 tp_is_empty!5221))

(declare-fun array_inv!2996 (array!9647) Bool)

(assert (=> start!20710 (array_inv!2996 _keys!825)))

(assert (=> start!20710 tp!19126))

(declare-fun mapIsEmpty!8900 () Bool)

(assert (=> mapIsEmpty!8900 mapRes!8900))

(declare-fun b!207139 () Bool)

(declare-fun e!135274 () Bool)

(assert (=> b!207139 (= e!135274 tp_is_empty!5221)))

(declare-fun b!207140 () Bool)

(declare-fun res!100481 () Bool)

(assert (=> b!207140 (=> (not res!100481) (not e!135276))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207140 (= res!100481 (validKeyInArray!0 k0!843))))

(declare-fun b!207141 () Bool)

(assert (=> b!207141 (= e!135277 (and e!135274 mapRes!8900))))

(declare-fun condMapEmpty!8900 () Bool)

(declare-fun mapDefault!8900 () ValueCell!2267)

(assert (=> b!207141 (= condMapEmpty!8900 (= (arr!4573 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2267)) mapDefault!8900)))))

(declare-fun b!207142 () Bool)

(declare-fun res!100480 () Bool)

(assert (=> b!207142 (=> (not res!100480) (not e!135276))))

(assert (=> b!207142 (= res!100480 (and (= (size!4898 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4899 _keys!825) (size!4898 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(assert (= (and start!20710 res!100483) b!207142))

(assert (= (and b!207142 res!100480) b!207137))

(assert (= (and b!207137 res!100485) b!207134))

(assert (= (and b!207134 res!100482) b!207135))

(assert (= (and b!207135 res!100484) b!207140))

(assert (= (and b!207140 res!100481) b!207138))

(assert (= (and b!207138 res!100486) b!207136))

(assert (= (and b!207141 condMapEmpty!8900) mapIsEmpty!8900))

(assert (= (and b!207141 (not condMapEmpty!8900)) mapNonEmpty!8900))

(get-info :version)

(assert (= (and mapNonEmpty!8900 ((_ is ValueCellFull!2267) mapValue!8900)) b!207133))

(assert (= (and b!207141 ((_ is ValueCellFull!2267) mapDefault!8900)) b!207139))

(assert (= start!20710 b!207141))

(declare-fun m!235011 () Bool)

(assert (=> b!207136 m!235011))

(declare-fun m!235013 () Bool)

(assert (=> b!207136 m!235013))

(declare-fun m!235015 () Bool)

(assert (=> b!207136 m!235015))

(declare-fun m!235017 () Bool)

(assert (=> b!207136 m!235017))

(declare-fun m!235019 () Bool)

(assert (=> b!207136 m!235019))

(declare-fun m!235021 () Bool)

(assert (=> b!207136 m!235021))

(declare-fun m!235023 () Bool)

(assert (=> b!207136 m!235023))

(declare-fun m!235025 () Bool)

(assert (=> b!207137 m!235025))

(declare-fun m!235027 () Bool)

(assert (=> start!20710 m!235027))

(declare-fun m!235029 () Bool)

(assert (=> start!20710 m!235029))

(declare-fun m!235031 () Bool)

(assert (=> start!20710 m!235031))

(declare-fun m!235033 () Bool)

(assert (=> mapNonEmpty!8900 m!235033))

(declare-fun m!235035 () Bool)

(assert (=> b!207134 m!235035))

(declare-fun m!235037 () Bool)

(assert (=> b!207138 m!235037))

(declare-fun m!235039 () Bool)

(assert (=> b!207140 m!235039))

(check-sat (not b!207136) (not b!207134) (not b!207137) (not b_next!5365) tp_is_empty!5221 (not mapNonEmpty!8900) (not b!207140) b_and!12125 (not start!20710))
(check-sat b_and!12125 (not b_next!5365))
