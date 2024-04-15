; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20644 () Bool)

(assert start!20644)

(declare-fun b_free!5299 () Bool)

(declare-fun b_next!5299 () Bool)

(assert (=> start!20644 (= b_free!5299 (not b_next!5299))))

(declare-fun tp!18929 () Bool)

(declare-fun b_and!12019 () Bool)

(assert (=> start!20644 (= tp!18929 b_and!12019)))

(declare-fun b!205881 () Bool)

(declare-fun e!134592 () Bool)

(declare-fun tp_is_empty!5155 () Bool)

(assert (=> b!205881 (= e!134592 tp_is_empty!5155)))

(declare-fun b!205882 () Bool)

(declare-fun res!99610 () Bool)

(declare-fun e!134591 () Bool)

(assert (=> b!205882 (=> (not res!99610) (not e!134591))))

(declare-datatypes ((array!9507 0))(
  ( (array!9508 (arr!4503 (Array (_ BitVec 32) (_ BitVec 64))) (size!4829 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9507)

(declare-datatypes ((List!2864 0))(
  ( (Nil!2861) (Cons!2860 (h!3502 (_ BitVec 64)) (t!7786 List!2864)) )
))
(declare-fun arrayNoDuplicates!0 (array!9507 (_ BitVec 32) List!2864) Bool)

(assert (=> b!205882 (= res!99610 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2861))))

(declare-fun b!205883 () Bool)

(declare-fun res!99609 () Bool)

(assert (=> b!205883 (=> (not res!99609) (not e!134591))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!205883 (= res!99609 (validKeyInArray!0 k0!843))))

(declare-fun b!205884 () Bool)

(declare-fun res!99606 () Bool)

(assert (=> b!205884 (=> (not res!99606) (not e!134591))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!205884 (= res!99606 (= (select (arr!4503 _keys!825) i!601) k0!843))))

(declare-fun b!205885 () Bool)

(declare-fun e!134588 () Bool)

(declare-fun mapRes!8801 () Bool)

(assert (=> b!205885 (= e!134588 (and e!134592 mapRes!8801))))

(declare-fun condMapEmpty!8801 () Bool)

(declare-datatypes ((V!6521 0))(
  ( (V!6522 (val!2622 Int)) )
))
(declare-datatypes ((ValueCell!2234 0))(
  ( (ValueCellFull!2234 (v!4586 V!6521)) (EmptyCell!2234) )
))
(declare-datatypes ((array!9509 0))(
  ( (array!9510 (arr!4504 (Array (_ BitVec 32) ValueCell!2234)) (size!4830 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9509)

(declare-fun mapDefault!8801 () ValueCell!2234)

(assert (=> b!205885 (= condMapEmpty!8801 (= (arr!4504 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2234)) mapDefault!8801)))))

(declare-fun b!205886 () Bool)

(declare-fun res!99603 () Bool)

(assert (=> b!205886 (=> (not res!99603) (not e!134591))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9507 (_ BitVec 32)) Bool)

(assert (=> b!205886 (= res!99603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapNonEmpty!8801 () Bool)

(declare-fun tp!18928 () Bool)

(declare-fun e!134589 () Bool)

(assert (=> mapNonEmpty!8801 (= mapRes!8801 (and tp!18928 e!134589))))

(declare-fun mapKey!8801 () (_ BitVec 32))

(declare-fun mapValue!8801 () ValueCell!2234)

(declare-fun mapRest!8801 () (Array (_ BitVec 32) ValueCell!2234))

(assert (=> mapNonEmpty!8801 (= (arr!4504 _values!649) (store mapRest!8801 mapKey!8801 mapValue!8801))))

(declare-fun b!205887 () Bool)

(declare-fun res!99604 () Bool)

(assert (=> b!205887 (=> (not res!99604) (not e!134591))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(assert (=> b!205887 (= res!99604 (and (= (size!4830 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4829 _keys!825) (size!4830 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun res!99608 () Bool)

(assert (=> start!20644 (=> (not res!99608) (not e!134591))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20644 (= res!99608 (validMask!0 mask!1149))))

(assert (=> start!20644 e!134591))

(declare-fun array_inv!2959 (array!9509) Bool)

(assert (=> start!20644 (and (array_inv!2959 _values!649) e!134588)))

(assert (=> start!20644 true))

(assert (=> start!20644 tp_is_empty!5155))

(declare-fun array_inv!2960 (array!9507) Bool)

(assert (=> start!20644 (array_inv!2960 _keys!825)))

(assert (=> start!20644 tp!18929))

(declare-fun b!205888 () Bool)

(declare-fun e!134586 () Bool)

(assert (=> b!205888 (= e!134586 true)))

(declare-datatypes ((tuple2!3962 0))(
  ( (tuple2!3963 (_1!1992 (_ BitVec 64)) (_2!1992 V!6521)) )
))
(declare-datatypes ((List!2865 0))(
  ( (Nil!2862) (Cons!2861 (h!3503 tuple2!3962) (t!7787 List!2865)) )
))
(declare-datatypes ((ListLongMap!2865 0))(
  ( (ListLongMap!2866 (toList!1448 List!2865)) )
))
(declare-fun lt!104989 () ListLongMap!2865)

(declare-fun lt!104980 () ListLongMap!2865)

(declare-fun lt!104982 () tuple2!3962)

(declare-fun +!497 (ListLongMap!2865 tuple2!3962) ListLongMap!2865)

(assert (=> b!205888 (= lt!104989 (+!497 lt!104980 lt!104982))))

(declare-fun lt!104990 () ListLongMap!2865)

(declare-fun minValue!615 () V!6521)

(declare-fun v!520 () V!6521)

(declare-datatypes ((Unit!6234 0))(
  ( (Unit!6235) )
))
(declare-fun lt!104983 () Unit!6234)

(declare-fun addCommutativeForDiffKeys!183 (ListLongMap!2865 (_ BitVec 64) V!6521 (_ BitVec 64) V!6521) Unit!6234)

(assert (=> b!205888 (= lt!104983 (addCommutativeForDiffKeys!183 lt!104990 k0!843 v!520 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205889 () Bool)

(declare-fun e!134590 () Bool)

(assert (=> b!205889 (= e!134591 (not e!134590))))

(declare-fun res!99607 () Bool)

(assert (=> b!205889 (=> res!99607 e!134590)))

(assert (=> b!205889 (= res!99607 (or (not (= (bvand extraKeys!596 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!596 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun lt!104984 () ListLongMap!2865)

(declare-fun zeroValue!615 () V!6521)

(declare-fun defaultEntry!657 () Int)

(declare-fun getCurrentListMap!990 (array!9507 array!9509 (_ BitVec 32) (_ BitVec 32) V!6521 V!6521 (_ BitVec 32) Int) ListLongMap!2865)

(assert (=> b!205889 (= lt!104984 (getCurrentListMap!990 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104987 () array!9509)

(declare-fun lt!104988 () ListLongMap!2865)

(assert (=> b!205889 (= lt!104988 (getCurrentListMap!990 _keys!825 lt!104987 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!104985 () ListLongMap!2865)

(declare-fun lt!104979 () ListLongMap!2865)

(assert (=> b!205889 (and (= lt!104985 lt!104979) (= lt!104979 lt!104985))))

(assert (=> b!205889 (= lt!104979 (+!497 lt!104990 lt!104982))))

(assert (=> b!205889 (= lt!104982 (tuple2!3963 k0!843 v!520))))

(declare-fun lt!104986 () Unit!6234)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!149 (array!9507 array!9509 (_ BitVec 32) (_ BitVec 32) V!6521 V!6521 (_ BitVec 32) (_ BitVec 64) V!6521 (_ BitVec 32) Int) Unit!6234)

(assert (=> b!205889 (= lt!104986 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!149 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!400 (array!9507 array!9509 (_ BitVec 32) (_ BitVec 32) V!6521 V!6521 (_ BitVec 32) Int) ListLongMap!2865)

(assert (=> b!205889 (= lt!104985 (getCurrentListMapNoExtraKeys!400 _keys!825 lt!104987 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!205889 (= lt!104987 (array!9510 (store (arr!4504 _values!649) i!601 (ValueCellFull!2234 v!520)) (size!4830 _values!649)))))

(assert (=> b!205889 (= lt!104990 (getCurrentListMapNoExtraKeys!400 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapIsEmpty!8801 () Bool)

(assert (=> mapIsEmpty!8801 mapRes!8801))

(declare-fun b!205890 () Bool)

(assert (=> b!205890 (= e!134589 tp_is_empty!5155)))

(declare-fun b!205891 () Bool)

(assert (=> b!205891 (= e!134590 e!134586)))

(declare-fun res!99605 () Bool)

(assert (=> b!205891 (=> res!99605 e!134586)))

(assert (=> b!205891 (= res!99605 (= k0!843 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!205891 (= lt!104984 lt!104980)))

(declare-fun lt!104981 () tuple2!3962)

(assert (=> b!205891 (= lt!104980 (+!497 lt!104990 lt!104981))))

(assert (=> b!205891 (= lt!104988 lt!104989)))

(assert (=> b!205891 (= lt!104989 (+!497 lt!104979 lt!104981))))

(assert (=> b!205891 (= lt!104988 (+!497 lt!104985 lt!104981))))

(assert (=> b!205891 (= lt!104981 (tuple2!3963 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!615))))

(declare-fun b!205892 () Bool)

(declare-fun res!99611 () Bool)

(assert (=> b!205892 (=> (not res!99611) (not e!134591))))

(assert (=> b!205892 (= res!99611 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4829 _keys!825))))))

(assert (= (and start!20644 res!99608) b!205887))

(assert (= (and b!205887 res!99604) b!205886))

(assert (= (and b!205886 res!99603) b!205882))

(assert (= (and b!205882 res!99610) b!205892))

(assert (= (and b!205892 res!99611) b!205883))

(assert (= (and b!205883 res!99609) b!205884))

(assert (= (and b!205884 res!99606) b!205889))

(assert (= (and b!205889 (not res!99607)) b!205891))

(assert (= (and b!205891 (not res!99605)) b!205888))

(assert (= (and b!205885 condMapEmpty!8801) mapIsEmpty!8801))

(assert (= (and b!205885 (not condMapEmpty!8801)) mapNonEmpty!8801))

(get-info :version)

(assert (= (and mapNonEmpty!8801 ((_ is ValueCellFull!2234) mapValue!8801)) b!205890))

(assert (= (and b!205885 ((_ is ValueCellFull!2234) mapDefault!8801)) b!205881))

(assert (= start!20644 b!205885))

(declare-fun m!233103 () Bool)

(assert (=> mapNonEmpty!8801 m!233103))

(declare-fun m!233105 () Bool)

(assert (=> b!205886 m!233105))

(declare-fun m!233107 () Bool)

(assert (=> b!205891 m!233107))

(declare-fun m!233109 () Bool)

(assert (=> b!205891 m!233109))

(declare-fun m!233111 () Bool)

(assert (=> b!205891 m!233111))

(declare-fun m!233113 () Bool)

(assert (=> b!205888 m!233113))

(declare-fun m!233115 () Bool)

(assert (=> b!205888 m!233115))

(declare-fun m!233117 () Bool)

(assert (=> b!205889 m!233117))

(declare-fun m!233119 () Bool)

(assert (=> b!205889 m!233119))

(declare-fun m!233121 () Bool)

(assert (=> b!205889 m!233121))

(declare-fun m!233123 () Bool)

(assert (=> b!205889 m!233123))

(declare-fun m!233125 () Bool)

(assert (=> b!205889 m!233125))

(declare-fun m!233127 () Bool)

(assert (=> b!205889 m!233127))

(declare-fun m!233129 () Bool)

(assert (=> b!205889 m!233129))

(declare-fun m!233131 () Bool)

(assert (=> start!20644 m!233131))

(declare-fun m!233133 () Bool)

(assert (=> start!20644 m!233133))

(declare-fun m!233135 () Bool)

(assert (=> start!20644 m!233135))

(declare-fun m!233137 () Bool)

(assert (=> b!205882 m!233137))

(declare-fun m!233139 () Bool)

(assert (=> b!205884 m!233139))

(declare-fun m!233141 () Bool)

(assert (=> b!205883 m!233141))

(check-sat (not mapNonEmpty!8801) (not b!205888) b_and!12019 (not b!205889) (not b!205891) (not start!20644) tp_is_empty!5155 (not b!205882) (not b!205883) (not b_next!5299) (not b!205886))
(check-sat b_and!12019 (not b_next!5299))
