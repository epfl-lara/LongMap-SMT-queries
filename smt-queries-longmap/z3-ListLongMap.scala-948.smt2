; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20788 () Bool)

(assert start!20788)

(declare-fun b_free!5437 () Bool)

(declare-fun b_next!5437 () Bool)

(assert (=> start!20788 (= b_free!5437 (not b_next!5437))))

(declare-fun tp!19352 () Bool)

(declare-fun b_and!12157 () Bool)

(assert (=> start!20788 (= tp!19352 b_and!12157)))

(declare-fun mapNonEmpty!9017 () Bool)

(declare-fun mapRes!9017 () Bool)

(declare-fun tp!19351 () Bool)

(declare-fun e!135734 () Bool)

(assert (=> mapNonEmpty!9017 (= mapRes!9017 (and tp!19351 e!135734))))

(declare-datatypes ((V!6713 0))(
  ( (V!6714 (val!2694 Int)) )
))
(declare-datatypes ((ValueCell!2306 0))(
  ( (ValueCellFull!2306 (v!4658 V!6713)) (EmptyCell!2306) )
))
(declare-fun mapValue!9017 () ValueCell!2306)

(declare-fun mapRest!9017 () (Array (_ BitVec 32) ValueCell!2306))

(declare-datatypes ((array!9789 0))(
  ( (array!9790 (arr!4644 (Array (_ BitVec 32) ValueCell!2306)) (size!4970 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9789)

(declare-fun mapKey!9017 () (_ BitVec 32))

(assert (=> mapNonEmpty!9017 (= (arr!4644 _values!649) (store mapRest!9017 mapKey!9017 mapValue!9017))))

(declare-fun mapIsEmpty!9017 () Bool)

(assert (=> mapIsEmpty!9017 mapRes!9017))

(declare-fun b!208073 () Bool)

(declare-fun res!101148 () Bool)

(declare-fun e!135738 () Bool)

(assert (=> b!208073 (=> (not res!101148) (not e!135738))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9791 0))(
  ( (array!9792 (arr!4645 (Array (_ BitVec 32) (_ BitVec 64))) (size!4971 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9791)

(assert (=> b!208073 (= res!101148 (= (select (arr!4645 _keys!825) i!601) k0!843))))

(declare-fun b!208074 () Bool)

(declare-fun tp_is_empty!5299 () Bool)

(assert (=> b!208074 (= e!135734 tp_is_empty!5299)))

(declare-fun b!208075 () Bool)

(declare-fun res!101151 () Bool)

(assert (=> b!208075 (=> (not res!101151) (not e!135738))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208075 (= res!101151 (validKeyInArray!0 k0!843))))

(declare-fun b!208076 () Bool)

(declare-fun res!101150 () Bool)

(assert (=> b!208076 (=> (not res!101150) (not e!135738))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9791 (_ BitVec 32)) Bool)

(assert (=> b!208076 (= res!101150 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun res!101147 () Bool)

(assert (=> start!20788 (=> (not res!101147) (not e!135738))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20788 (= res!101147 (validMask!0 mask!1149))))

(assert (=> start!20788 e!135738))

(declare-fun e!135736 () Bool)

(declare-fun array_inv!3051 (array!9789) Bool)

(assert (=> start!20788 (and (array_inv!3051 _values!649) e!135736)))

(assert (=> start!20788 true))

(assert (=> start!20788 tp_is_empty!5299))

(declare-fun array_inv!3052 (array!9791) Bool)

(assert (=> start!20788 (array_inv!3052 _keys!825)))

(assert (=> start!20788 tp!19352))

(declare-fun b!208077 () Bool)

(declare-fun e!135735 () Bool)

(assert (=> b!208077 (= e!135736 (and e!135735 mapRes!9017))))

(declare-fun condMapEmpty!9017 () Bool)

(declare-fun mapDefault!9017 () ValueCell!2306)

(assert (=> b!208077 (= condMapEmpty!9017 (= (arr!4644 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2306)) mapDefault!9017)))))

(declare-fun b!208078 () Bool)

(declare-fun res!101152 () Bool)

(assert (=> b!208078 (=> (not res!101152) (not e!135738))))

(assert (=> b!208078 (= res!101152 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4971 _keys!825))))))

(declare-fun b!208079 () Bool)

(assert (=> b!208079 (= e!135738 (bvsgt #b00000000000000000000000000000000 (size!4971 _keys!825)))))

(declare-fun v!520 () V!6713)

(declare-fun zeroValue!615 () V!6713)

(declare-fun defaultEntry!657 () Int)

(declare-datatypes ((tuple2!4064 0))(
  ( (tuple2!4065 (_1!2043 (_ BitVec 64)) (_2!2043 V!6713)) )
))
(declare-datatypes ((List!2970 0))(
  ( (Nil!2967) (Cons!2966 (h!3608 tuple2!4064) (t!7892 List!2970)) )
))
(declare-datatypes ((ListLongMap!2967 0))(
  ( (ListLongMap!2968 (toList!1499 List!2970)) )
))
(declare-fun lt!106562 () ListLongMap!2967)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6713)

(declare-fun getCurrentListMapNoExtraKeys!450 (array!9791 array!9789 (_ BitVec 32) (_ BitVec 32) V!6713 V!6713 (_ BitVec 32) Int) ListLongMap!2967)

(assert (=> b!208079 (= lt!106562 (getCurrentListMapNoExtraKeys!450 _keys!825 (array!9790 (store (arr!4644 _values!649) i!601 (ValueCellFull!2306 v!520)) (size!4970 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106561 () ListLongMap!2967)

(assert (=> b!208079 (= lt!106561 (getCurrentListMapNoExtraKeys!450 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208080 () Bool)

(declare-fun res!101149 () Bool)

(assert (=> b!208080 (=> (not res!101149) (not e!135738))))

(assert (=> b!208080 (= res!101149 (and (= (size!4970 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4971 _keys!825) (size!4970 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!208081 () Bool)

(declare-fun res!101153 () Bool)

(assert (=> b!208081 (=> (not res!101153) (not e!135738))))

(declare-datatypes ((List!2971 0))(
  ( (Nil!2968) (Cons!2967 (h!3609 (_ BitVec 64)) (t!7893 List!2971)) )
))
(declare-fun arrayNoDuplicates!0 (array!9791 (_ BitVec 32) List!2971) Bool)

(assert (=> b!208081 (= res!101153 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2968))))

(declare-fun b!208082 () Bool)

(assert (=> b!208082 (= e!135735 tp_is_empty!5299)))

(assert (= (and start!20788 res!101147) b!208080))

(assert (= (and b!208080 res!101149) b!208076))

(assert (= (and b!208076 res!101150) b!208081))

(assert (= (and b!208081 res!101153) b!208078))

(assert (= (and b!208078 res!101152) b!208075))

(assert (= (and b!208075 res!101151) b!208073))

(assert (= (and b!208073 res!101148) b!208079))

(assert (= (and b!208077 condMapEmpty!9017) mapIsEmpty!9017))

(assert (= (and b!208077 (not condMapEmpty!9017)) mapNonEmpty!9017))

(get-info :version)

(assert (= (and mapNonEmpty!9017 ((_ is ValueCellFull!2306) mapValue!9017)) b!208074))

(assert (= (and b!208077 ((_ is ValueCellFull!2306) mapDefault!9017)) b!208082))

(assert (= start!20788 b!208077))

(declare-fun m!235293 () Bool)

(assert (=> start!20788 m!235293))

(declare-fun m!235295 () Bool)

(assert (=> start!20788 m!235295))

(declare-fun m!235297 () Bool)

(assert (=> start!20788 m!235297))

(declare-fun m!235299 () Bool)

(assert (=> b!208081 m!235299))

(declare-fun m!235301 () Bool)

(assert (=> b!208073 m!235301))

(declare-fun m!235303 () Bool)

(assert (=> b!208076 m!235303))

(declare-fun m!235305 () Bool)

(assert (=> b!208075 m!235305))

(declare-fun m!235307 () Bool)

(assert (=> mapNonEmpty!9017 m!235307))

(declare-fun m!235309 () Bool)

(assert (=> b!208079 m!235309))

(declare-fun m!235311 () Bool)

(assert (=> b!208079 m!235311))

(declare-fun m!235313 () Bool)

(assert (=> b!208079 m!235313))

(check-sat b_and!12157 (not mapNonEmpty!9017) (not b!208079) (not b!208075) (not b_next!5437) (not b!208081) tp_is_empty!5299 (not b!208076) (not start!20788))
(check-sat b_and!12157 (not b_next!5437))
