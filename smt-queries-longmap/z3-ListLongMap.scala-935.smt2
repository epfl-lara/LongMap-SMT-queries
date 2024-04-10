; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20708 () Bool)

(assert start!20708)

(declare-fun b_free!5367 () Bool)

(declare-fun b_next!5367 () Bool)

(assert (=> start!20708 (= b_free!5367 (not b_next!5367))))

(declare-fun tp!19133 () Bool)

(declare-fun b_and!12113 () Bool)

(assert (=> start!20708 (= tp!19133 b_and!12113)))

(declare-fun b!207116 () Bool)

(declare-fun res!100483 () Bool)

(declare-fun e!135267 () Bool)

(assert (=> b!207116 (=> (not res!100483) (not e!135267))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!9655 0))(
  ( (array!9656 (arr!4578 (Array (_ BitVec 32) (_ BitVec 64))) (size!4903 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9655)

(assert (=> b!207116 (= res!100483 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4903 _keys!825))))))

(declare-fun b!207117 () Bool)

(assert (=> b!207117 (= e!135267 (not true))))

(declare-datatypes ((V!6611 0))(
  ( (V!6612 (val!2656 Int)) )
))
(declare-datatypes ((ValueCell!2268 0))(
  ( (ValueCellFull!2268 (v!4626 V!6611)) (EmptyCell!2268) )
))
(declare-datatypes ((array!9657 0))(
  ( (array!9658 (arr!4579 (Array (_ BitVec 32) ValueCell!2268)) (size!4904 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9657)

(declare-fun mask!1149 () (_ BitVec 32))

(declare-datatypes ((tuple2!4032 0))(
  ( (tuple2!4033 (_1!2027 (_ BitVec 64)) (_2!2027 V!6611)) )
))
(declare-datatypes ((List!2923 0))(
  ( (Nil!2920) (Cons!2919 (h!3561 tuple2!4032) (t!7854 List!2923)) )
))
(declare-datatypes ((ListLongMap!2945 0))(
  ( (ListLongMap!2946 (toList!1488 List!2923)) )
))
(declare-fun lt!106045 () ListLongMap!2945)

(declare-fun zeroValue!615 () V!6611)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6611)

(declare-fun getCurrentListMap!1055 (array!9655 array!9657 (_ BitVec 32) (_ BitVec 32) V!6611 V!6611 (_ BitVec 32) Int) ListLongMap!2945)

(assert (=> b!207117 (= lt!106045 (getCurrentListMap!1055 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106044 () ListLongMap!2945)

(declare-fun lt!106047 () array!9657)

(assert (=> b!207117 (= lt!106044 (getCurrentListMap!1055 _keys!825 lt!106047 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106050 () ListLongMap!2945)

(declare-fun lt!106049 () ListLongMap!2945)

(assert (=> b!207117 (and (= lt!106050 lt!106049) (= lt!106049 lt!106050))))

(declare-fun lt!106048 () ListLongMap!2945)

(declare-fun v!520 () V!6611)

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun +!515 (ListLongMap!2945 tuple2!4032) ListLongMap!2945)

(assert (=> b!207117 (= lt!106049 (+!515 lt!106048 (tuple2!4033 k0!843 v!520)))))

(declare-datatypes ((Unit!6318 0))(
  ( (Unit!6319) )
))
(declare-fun lt!106046 () Unit!6318)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!168 (array!9655 array!9657 (_ BitVec 32) (_ BitVec 32) V!6611 V!6611 (_ BitVec 32) (_ BitVec 64) V!6611 (_ BitVec 32) Int) Unit!6318)

(assert (=> b!207117 (= lt!106046 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!168 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!429 (array!9655 array!9657 (_ BitVec 32) (_ BitVec 32) V!6611 V!6611 (_ BitVec 32) Int) ListLongMap!2945)

(assert (=> b!207117 (= lt!106050 (getCurrentListMapNoExtraKeys!429 _keys!825 lt!106047 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207117 (= lt!106047 (array!9658 (store (arr!4579 _values!649) i!601 (ValueCellFull!2268 v!520)) (size!4904 _values!649)))))

(assert (=> b!207117 (= lt!106048 (getCurrentListMapNoExtraKeys!429 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207118 () Bool)

(declare-fun res!100482 () Bool)

(assert (=> b!207118 (=> (not res!100482) (not e!135267))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9655 (_ BitVec 32)) Bool)

(assert (=> b!207118 (= res!100482 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207119 () Bool)

(declare-fun res!100485 () Bool)

(assert (=> b!207119 (=> (not res!100485) (not e!135267))))

(declare-datatypes ((List!2924 0))(
  ( (Nil!2921) (Cons!2920 (h!3562 (_ BitVec 64)) (t!7855 List!2924)) )
))
(declare-fun arrayNoDuplicates!0 (array!9655 (_ BitVec 32) List!2924) Bool)

(assert (=> b!207119 (= res!100485 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2921))))

(declare-fun res!100484 () Bool)

(assert (=> start!20708 (=> (not res!100484) (not e!135267))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20708 (= res!100484 (validMask!0 mask!1149))))

(assert (=> start!20708 e!135267))

(declare-fun e!135268 () Bool)

(declare-fun array_inv!3031 (array!9657) Bool)

(assert (=> start!20708 (and (array_inv!3031 _values!649) e!135268)))

(assert (=> start!20708 true))

(declare-fun tp_is_empty!5223 () Bool)

(assert (=> start!20708 tp_is_empty!5223))

(declare-fun array_inv!3032 (array!9655) Bool)

(assert (=> start!20708 (array_inv!3032 _keys!825)))

(assert (=> start!20708 tp!19133))

(declare-fun b!207120 () Bool)

(declare-fun res!100481 () Bool)

(assert (=> b!207120 (=> (not res!100481) (not e!135267))))

(assert (=> b!207120 (= res!100481 (= (select (arr!4578 _keys!825) i!601) k0!843))))

(declare-fun b!207121 () Bool)

(declare-fun res!100480 () Bool)

(assert (=> b!207121 (=> (not res!100480) (not e!135267))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207121 (= res!100480 (validKeyInArray!0 k0!843))))

(declare-fun b!207122 () Bool)

(declare-fun e!135265 () Bool)

(assert (=> b!207122 (= e!135265 tp_is_empty!5223)))

(declare-fun mapNonEmpty!8903 () Bool)

(declare-fun mapRes!8903 () Bool)

(declare-fun tp!19132 () Bool)

(assert (=> mapNonEmpty!8903 (= mapRes!8903 (and tp!19132 e!135265))))

(declare-fun mapKey!8903 () (_ BitVec 32))

(declare-fun mapRest!8903 () (Array (_ BitVec 32) ValueCell!2268))

(declare-fun mapValue!8903 () ValueCell!2268)

(assert (=> mapNonEmpty!8903 (= (arr!4579 _values!649) (store mapRest!8903 mapKey!8903 mapValue!8903))))

(declare-fun b!207123 () Bool)

(declare-fun res!100486 () Bool)

(assert (=> b!207123 (=> (not res!100486) (not e!135267))))

(assert (=> b!207123 (= res!100486 (and (= (size!4904 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4903 _keys!825) (size!4904 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!207124 () Bool)

(declare-fun e!135266 () Bool)

(assert (=> b!207124 (= e!135268 (and e!135266 mapRes!8903))))

(declare-fun condMapEmpty!8903 () Bool)

(declare-fun mapDefault!8903 () ValueCell!2268)

(assert (=> b!207124 (= condMapEmpty!8903 (= (arr!4579 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2268)) mapDefault!8903)))))

(declare-fun b!207125 () Bool)

(assert (=> b!207125 (= e!135266 tp_is_empty!5223)))

(declare-fun mapIsEmpty!8903 () Bool)

(assert (=> mapIsEmpty!8903 mapRes!8903))

(assert (= (and start!20708 res!100484) b!207123))

(assert (= (and b!207123 res!100486) b!207118))

(assert (= (and b!207118 res!100482) b!207119))

(assert (= (and b!207119 res!100485) b!207116))

(assert (= (and b!207116 res!100483) b!207121))

(assert (= (and b!207121 res!100480) b!207120))

(assert (= (and b!207120 res!100481) b!207117))

(assert (= (and b!207124 condMapEmpty!8903) mapIsEmpty!8903))

(assert (= (and b!207124 (not condMapEmpty!8903)) mapNonEmpty!8903))

(get-info :version)

(assert (= (and mapNonEmpty!8903 ((_ is ValueCellFull!2268) mapValue!8903)) b!207122))

(assert (= (and b!207124 ((_ is ValueCellFull!2268) mapDefault!8903)) b!207125))

(assert (= start!20708 b!207124))

(declare-fun m!234859 () Bool)

(assert (=> b!207119 m!234859))

(declare-fun m!234861 () Bool)

(assert (=> b!207120 m!234861))

(declare-fun m!234863 () Bool)

(assert (=> b!207121 m!234863))

(declare-fun m!234865 () Bool)

(assert (=> b!207117 m!234865))

(declare-fun m!234867 () Bool)

(assert (=> b!207117 m!234867))

(declare-fun m!234869 () Bool)

(assert (=> b!207117 m!234869))

(declare-fun m!234871 () Bool)

(assert (=> b!207117 m!234871))

(declare-fun m!234873 () Bool)

(assert (=> b!207117 m!234873))

(declare-fun m!234875 () Bool)

(assert (=> b!207117 m!234875))

(declare-fun m!234877 () Bool)

(assert (=> b!207117 m!234877))

(declare-fun m!234879 () Bool)

(assert (=> mapNonEmpty!8903 m!234879))

(declare-fun m!234881 () Bool)

(assert (=> start!20708 m!234881))

(declare-fun m!234883 () Bool)

(assert (=> start!20708 m!234883))

(declare-fun m!234885 () Bool)

(assert (=> start!20708 m!234885))

(declare-fun m!234887 () Bool)

(assert (=> b!207118 m!234887))

(check-sat b_and!12113 (not b!207121) (not b_next!5367) (not b!207118) (not b!207117) (not mapNonEmpty!8903) tp_is_empty!5223 (not b!207119) (not start!20708))
(check-sat b_and!12113 (not b_next!5367))
