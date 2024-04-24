; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20788 () Bool)

(assert start!20788)

(declare-fun b_free!5437 () Bool)

(declare-fun b_next!5437 () Bool)

(assert (=> start!20788 (= b_free!5437 (not b_next!5437))))

(declare-fun tp!19351 () Bool)

(declare-fun b_and!12197 () Bool)

(assert (=> start!20788 (= tp!19351 b_and!12197)))

(declare-fun b!208267 () Bool)

(declare-fun res!101263 () Bool)

(declare-fun e!135861 () Bool)

(assert (=> b!208267 (=> (not res!101263) (not e!135861))))

(declare-datatypes ((array!9797 0))(
  ( (array!9798 (arr!4649 (Array (_ BitVec 32) (_ BitVec 64))) (size!4974 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9797)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9797 (_ BitVec 32)) Bool)

(assert (=> b!208267 (= res!101263 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!208268 () Bool)

(declare-fun e!135862 () Bool)

(declare-fun tp_is_empty!5299 () Bool)

(assert (=> b!208268 (= e!135862 tp_is_empty!5299)))

(declare-fun b!208269 () Bool)

(assert (=> b!208269 (= e!135861 (bvsgt #b00000000000000000000000000000000 (size!4974 _keys!825)))))

(declare-datatypes ((V!6713 0))(
  ( (V!6714 (val!2694 Int)) )
))
(declare-datatypes ((tuple2!4022 0))(
  ( (tuple2!4023 (_1!2022 (_ BitVec 64)) (_2!2022 V!6713)) )
))
(declare-datatypes ((List!2913 0))(
  ( (Nil!2910) (Cons!2909 (h!3551 tuple2!4022) (t!7836 List!2913)) )
))
(declare-datatypes ((ListLongMap!2937 0))(
  ( (ListLongMap!2938 (toList!1484 List!2913)) )
))
(declare-fun lt!106801 () ListLongMap!2937)

(declare-datatypes ((ValueCell!2306 0))(
  ( (ValueCellFull!2306 (v!4665 V!6713)) (EmptyCell!2306) )
))
(declare-datatypes ((array!9799 0))(
  ( (array!9800 (arr!4650 (Array (_ BitVec 32) ValueCell!2306)) (size!4975 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9799)

(declare-fun v!520 () V!6713)

(declare-fun i!601 () (_ BitVec 32))

(declare-fun zeroValue!615 () V!6713)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6713)

(declare-fun getCurrentListMapNoExtraKeys!447 (array!9797 array!9799 (_ BitVec 32) (_ BitVec 32) V!6713 V!6713 (_ BitVec 32) Int) ListLongMap!2937)

(assert (=> b!208269 (= lt!106801 (getCurrentListMapNoExtraKeys!447 _keys!825 (array!9800 (store (arr!4650 _values!649) i!601 (ValueCellFull!2306 v!520)) (size!4975 _values!649)) mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106802 () ListLongMap!2937)

(assert (=> b!208269 (= lt!106802 (getCurrentListMapNoExtraKeys!447 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!208270 () Bool)

(declare-fun res!101267 () Bool)

(assert (=> b!208270 (=> (not res!101267) (not e!135861))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!208270 (= res!101267 (validKeyInArray!0 k0!843))))

(declare-fun b!208271 () Bool)

(declare-fun e!135859 () Bool)

(assert (=> b!208271 (= e!135859 tp_is_empty!5299)))

(declare-fun b!208272 () Bool)

(declare-fun res!101266 () Bool)

(assert (=> b!208272 (=> (not res!101266) (not e!135861))))

(assert (=> b!208272 (= res!101266 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4974 _keys!825))))))

(declare-fun b!208273 () Bool)

(declare-fun res!101264 () Bool)

(assert (=> b!208273 (=> (not res!101264) (not e!135861))))

(assert (=> b!208273 (= res!101264 (= (select (arr!4649 _keys!825) i!601) k0!843))))

(declare-fun mapIsEmpty!9017 () Bool)

(declare-fun mapRes!9017 () Bool)

(assert (=> mapIsEmpty!9017 mapRes!9017))

(declare-fun b!208274 () Bool)

(declare-fun res!101265 () Bool)

(assert (=> b!208274 (=> (not res!101265) (not e!135861))))

(assert (=> b!208274 (= res!101265 (and (= (size!4975 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4974 _keys!825) (size!4975 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!101268 () Bool)

(assert (=> start!20788 (=> (not res!101268) (not e!135861))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20788 (= res!101268 (validMask!0 mask!1149))))

(assert (=> start!20788 e!135861))

(declare-fun e!135860 () Bool)

(declare-fun array_inv!3047 (array!9799) Bool)

(assert (=> start!20788 (and (array_inv!3047 _values!649) e!135860)))

(assert (=> start!20788 true))

(assert (=> start!20788 tp_is_empty!5299))

(declare-fun array_inv!3048 (array!9797) Bool)

(assert (=> start!20788 (array_inv!3048 _keys!825)))

(assert (=> start!20788 tp!19351))

(declare-fun b!208275 () Bool)

(declare-fun res!101269 () Bool)

(assert (=> b!208275 (=> (not res!101269) (not e!135861))))

(declare-datatypes ((List!2914 0))(
  ( (Nil!2911) (Cons!2910 (h!3552 (_ BitVec 64)) (t!7837 List!2914)) )
))
(declare-fun arrayNoDuplicates!0 (array!9797 (_ BitVec 32) List!2914) Bool)

(assert (=> b!208275 (= res!101269 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2911))))

(declare-fun mapNonEmpty!9017 () Bool)

(declare-fun tp!19352 () Bool)

(assert (=> mapNonEmpty!9017 (= mapRes!9017 (and tp!19352 e!135862))))

(declare-fun mapRest!9017 () (Array (_ BitVec 32) ValueCell!2306))

(declare-fun mapKey!9017 () (_ BitVec 32))

(declare-fun mapValue!9017 () ValueCell!2306)

(assert (=> mapNonEmpty!9017 (= (arr!4650 _values!649) (store mapRest!9017 mapKey!9017 mapValue!9017))))

(declare-fun b!208276 () Bool)

(assert (=> b!208276 (= e!135860 (and e!135859 mapRes!9017))))

(declare-fun condMapEmpty!9017 () Bool)

(declare-fun mapDefault!9017 () ValueCell!2306)

(assert (=> b!208276 (= condMapEmpty!9017 (= (arr!4650 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2306)) mapDefault!9017)))))

(assert (= (and start!20788 res!101268) b!208274))

(assert (= (and b!208274 res!101265) b!208267))

(assert (= (and b!208267 res!101263) b!208275))

(assert (= (and b!208275 res!101269) b!208272))

(assert (= (and b!208272 res!101266) b!208270))

(assert (= (and b!208270 res!101267) b!208273))

(assert (= (and b!208273 res!101264) b!208269))

(assert (= (and b!208276 condMapEmpty!9017) mapIsEmpty!9017))

(assert (= (and b!208276 (not condMapEmpty!9017)) mapNonEmpty!9017))

(get-info :version)

(assert (= (and mapNonEmpty!9017 ((_ is ValueCellFull!2306) mapValue!9017)) b!208268))

(assert (= (and b!208276 ((_ is ValueCellFull!2306) mapDefault!9017)) b!208271))

(assert (= start!20788 b!208276))

(declare-fun m!236091 () Bool)

(assert (=> b!208273 m!236091))

(declare-fun m!236093 () Bool)

(assert (=> mapNonEmpty!9017 m!236093))

(declare-fun m!236095 () Bool)

(assert (=> start!20788 m!236095))

(declare-fun m!236097 () Bool)

(assert (=> start!20788 m!236097))

(declare-fun m!236099 () Bool)

(assert (=> start!20788 m!236099))

(declare-fun m!236101 () Bool)

(assert (=> b!208270 m!236101))

(declare-fun m!236103 () Bool)

(assert (=> b!208269 m!236103))

(declare-fun m!236105 () Bool)

(assert (=> b!208269 m!236105))

(declare-fun m!236107 () Bool)

(assert (=> b!208269 m!236107))

(declare-fun m!236109 () Bool)

(assert (=> b!208275 m!236109))

(declare-fun m!236111 () Bool)

(assert (=> b!208267 m!236111))

(check-sat tp_is_empty!5299 (not b!208267) (not b_next!5437) (not b!208270) (not mapNonEmpty!9017) (not b!208275) b_and!12197 (not start!20788) (not b!208269))
(check-sat b_and!12197 (not b_next!5437))
