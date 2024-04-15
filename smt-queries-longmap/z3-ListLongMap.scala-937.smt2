; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20722 () Bool)

(assert start!20722)

(declare-fun b_free!5377 () Bool)

(declare-fun b_next!5377 () Bool)

(assert (=> start!20722 (= b_free!5377 (not b_next!5377))))

(declare-fun tp!19162 () Bool)

(declare-fun b_and!12097 () Bool)

(assert (=> start!20722 (= tp!19162 b_and!12097)))

(declare-fun b!207119 () Bool)

(declare-fun res!100491 () Bool)

(declare-fun e!135242 () Bool)

(assert (=> b!207119 (=> (not res!100491) (not e!135242))))

(declare-datatypes ((array!9661 0))(
  ( (array!9662 (arr!4580 (Array (_ BitVec 32) (_ BitVec 64))) (size!4906 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9661)

(declare-datatypes ((List!2920 0))(
  ( (Nil!2917) (Cons!2916 (h!3558 (_ BitVec 64)) (t!7842 List!2920)) )
))
(declare-fun arrayNoDuplicates!0 (array!9661 (_ BitVec 32) List!2920) Bool)

(assert (=> b!207119 (= res!100491 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2917))))

(declare-fun b!207120 () Bool)

(declare-fun e!135239 () Bool)

(declare-fun tp_is_empty!5233 () Bool)

(assert (=> b!207120 (= e!135239 tp_is_empty!5233)))

(declare-fun b!207121 () Bool)

(declare-fun res!100495 () Bool)

(assert (=> b!207121 (=> (not res!100495) (not e!135242))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!207121 (= res!100495 (= (select (arr!4580 _keys!825) i!601) k0!843))))

(declare-fun b!207122 () Bool)

(declare-fun res!100494 () Bool)

(assert (=> b!207122 (=> (not res!100494) (not e!135242))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!6625 0))(
  ( (V!6626 (val!2661 Int)) )
))
(declare-datatypes ((ValueCell!2273 0))(
  ( (ValueCellFull!2273 (v!4625 V!6625)) (EmptyCell!2273) )
))
(declare-datatypes ((array!9663 0))(
  ( (array!9664 (arr!4581 (Array (_ BitVec 32) ValueCell!2273)) (size!4907 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9663)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!207122 (= res!100494 (and (= (size!4907 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4906 _keys!825) (size!4907 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!8918 () Bool)

(declare-fun mapRes!8918 () Bool)

(declare-fun tp!19163 () Bool)

(assert (=> mapNonEmpty!8918 (= mapRes!8918 (and tp!19163 e!135239))))

(declare-fun mapValue!8918 () ValueCell!2273)

(declare-fun mapRest!8918 () (Array (_ BitVec 32) ValueCell!2273))

(declare-fun mapKey!8918 () (_ BitVec 32))

(assert (=> mapNonEmpty!8918 (= (arr!4581 _values!649) (store mapRest!8918 mapKey!8918 mapValue!8918))))

(declare-fun b!207123 () Bool)

(declare-fun e!135240 () Bool)

(declare-fun e!135243 () Bool)

(assert (=> b!207123 (= e!135240 (and e!135243 mapRes!8918))))

(declare-fun condMapEmpty!8918 () Bool)

(declare-fun mapDefault!8918 () ValueCell!2273)

(assert (=> b!207123 (= condMapEmpty!8918 (= (arr!4581 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2273)) mapDefault!8918)))))

(declare-fun b!207124 () Bool)

(assert (=> b!207124 (= e!135243 tp_is_empty!5233)))

(declare-fun b!207125 () Bool)

(declare-fun res!100496 () Bool)

(assert (=> b!207125 (=> (not res!100496) (not e!135242))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207125 (= res!100496 (validKeyInArray!0 k0!843))))

(declare-fun b!207126 () Bool)

(declare-fun res!100490 () Bool)

(assert (=> b!207126 (=> (not res!100490) (not e!135242))))

(assert (=> b!207126 (= res!100490 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4906 _keys!825))))))

(declare-fun b!207127 () Bool)

(assert (=> b!207127 (= e!135242 (not true))))

(declare-datatypes ((tuple2!4016 0))(
  ( (tuple2!4017 (_1!2019 (_ BitVec 64)) (_2!2019 V!6625)) )
))
(declare-datatypes ((List!2921 0))(
  ( (Nil!2918) (Cons!2917 (h!3559 tuple2!4016) (t!7843 List!2921)) )
))
(declare-datatypes ((ListLongMap!2919 0))(
  ( (ListLongMap!2920 (toList!1475 List!2921)) )
))
(declare-fun lt!105981 () ListLongMap!2919)

(declare-fun zeroValue!615 () V!6625)

(declare-fun defaultEntry!657 () Int)

(declare-fun minValue!615 () V!6625)

(declare-fun getCurrentListMap!1016 (array!9661 array!9663 (_ BitVec 32) (_ BitVec 32) V!6625 V!6625 (_ BitVec 32) Int) ListLongMap!2919)

(assert (=> b!207127 (= lt!105981 (getCurrentListMap!1016 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105983 () array!9663)

(declare-fun lt!105977 () ListLongMap!2919)

(assert (=> b!207127 (= lt!105977 (getCurrentListMap!1016 _keys!825 lt!105983 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!105978 () ListLongMap!2919)

(declare-fun lt!105980 () ListLongMap!2919)

(assert (=> b!207127 (and (= lt!105978 lt!105980) (= lt!105980 lt!105978))))

(declare-fun lt!105979 () ListLongMap!2919)

(declare-fun v!520 () V!6625)

(declare-fun +!524 (ListLongMap!2919 tuple2!4016) ListLongMap!2919)

(assert (=> b!207127 (= lt!105980 (+!524 lt!105979 (tuple2!4017 k0!843 v!520)))))

(declare-datatypes ((Unit!6288 0))(
  ( (Unit!6289) )
))
(declare-fun lt!105982 () Unit!6288)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!175 (array!9661 array!9663 (_ BitVec 32) (_ BitVec 32) V!6625 V!6625 (_ BitVec 32) (_ BitVec 64) V!6625 (_ BitVec 32) Int) Unit!6288)

(assert (=> b!207127 (= lt!105982 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!175 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!426 (array!9661 array!9663 (_ BitVec 32) (_ BitVec 32) V!6625 V!6625 (_ BitVec 32) Int) ListLongMap!2919)

(assert (=> b!207127 (= lt!105978 (getCurrentListMapNoExtraKeys!426 _keys!825 lt!105983 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207127 (= lt!105983 (array!9664 (store (arr!4581 _values!649) i!601 (ValueCellFull!2273 v!520)) (size!4907 _values!649)))))

(assert (=> b!207127 (= lt!105979 (getCurrentListMapNoExtraKeys!426 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun b!207128 () Bool)

(declare-fun res!100493 () Bool)

(assert (=> b!207128 (=> (not res!100493) (not e!135242))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9661 (_ BitVec 32)) Bool)

(assert (=> b!207128 (= res!100493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun mapIsEmpty!8918 () Bool)

(assert (=> mapIsEmpty!8918 mapRes!8918))

(declare-fun res!100492 () Bool)

(assert (=> start!20722 (=> (not res!100492) (not e!135242))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20722 (= res!100492 (validMask!0 mask!1149))))

(assert (=> start!20722 e!135242))

(declare-fun array_inv!3009 (array!9663) Bool)

(assert (=> start!20722 (and (array_inv!3009 _values!649) e!135240)))

(assert (=> start!20722 true))

(assert (=> start!20722 tp_is_empty!5233))

(declare-fun array_inv!3010 (array!9661) Bool)

(assert (=> start!20722 (array_inv!3010 _keys!825)))

(assert (=> start!20722 tp!19162))

(assert (= (and start!20722 res!100492) b!207122))

(assert (= (and b!207122 res!100494) b!207128))

(assert (= (and b!207128 res!100493) b!207119))

(assert (= (and b!207119 res!100491) b!207126))

(assert (= (and b!207126 res!100490) b!207125))

(assert (= (and b!207125 res!100496) b!207121))

(assert (= (and b!207121 res!100495) b!207127))

(assert (= (and b!207123 condMapEmpty!8918) mapIsEmpty!8918))

(assert (= (and b!207123 (not condMapEmpty!8918)) mapNonEmpty!8918))

(get-info :version)

(assert (= (and mapNonEmpty!8918 ((_ is ValueCellFull!2273) mapValue!8918)) b!207120))

(assert (= (and b!207123 ((_ is ValueCellFull!2273) mapDefault!8918)) b!207124))

(assert (= start!20722 b!207123))

(declare-fun m!234393 () Bool)

(assert (=> b!207127 m!234393))

(declare-fun m!234395 () Bool)

(assert (=> b!207127 m!234395))

(declare-fun m!234397 () Bool)

(assert (=> b!207127 m!234397))

(declare-fun m!234399 () Bool)

(assert (=> b!207127 m!234399))

(declare-fun m!234401 () Bool)

(assert (=> b!207127 m!234401))

(declare-fun m!234403 () Bool)

(assert (=> b!207127 m!234403))

(declare-fun m!234405 () Bool)

(assert (=> b!207127 m!234405))

(declare-fun m!234407 () Bool)

(assert (=> b!207125 m!234407))

(declare-fun m!234409 () Bool)

(assert (=> start!20722 m!234409))

(declare-fun m!234411 () Bool)

(assert (=> start!20722 m!234411))

(declare-fun m!234413 () Bool)

(assert (=> start!20722 m!234413))

(declare-fun m!234415 () Bool)

(assert (=> b!207128 m!234415))

(declare-fun m!234417 () Bool)

(assert (=> b!207121 m!234417))

(declare-fun m!234419 () Bool)

(assert (=> mapNonEmpty!8918 m!234419))

(declare-fun m!234421 () Bool)

(assert (=> b!207119 m!234421))

(check-sat (not mapNonEmpty!8918) (not start!20722) (not b!207128) tp_is_empty!5233 (not b!207125) (not b!207119) b_and!12097 (not b_next!5377) (not b!207127))
(check-sat b_and!12097 (not b_next!5377))
