; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!20722 () Bool)

(assert start!20722)

(declare-fun b_free!5377 () Bool)

(declare-fun b_next!5377 () Bool)

(assert (=> start!20722 (= b_free!5377 (not b_next!5377))))

(declare-fun tp!19162 () Bool)

(declare-fun b_and!12137 () Bool)

(assert (=> start!20722 (= tp!19162 b_and!12137)))

(declare-fun b!207313 () Bool)

(declare-fun res!100610 () Bool)

(declare-fun e!135368 () Bool)

(assert (=> b!207313 (=> (not res!100610) (not e!135368))))

(declare-datatypes ((array!9669 0))(
  ( (array!9670 (arr!4585 (Array (_ BitVec 32) (_ BitVec 64))) (size!4910 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!9669)

(declare-datatypes ((List!2874 0))(
  ( (Nil!2871) (Cons!2870 (h!3512 (_ BitVec 64)) (t!7797 List!2874)) )
))
(declare-fun arrayNoDuplicates!0 (array!9669 (_ BitVec 32) List!2874) Bool)

(assert (=> b!207313 (= res!100610 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2871))))

(declare-fun b!207314 () Bool)

(declare-fun e!135365 () Bool)

(declare-fun tp_is_empty!5233 () Bool)

(assert (=> b!207314 (= e!135365 tp_is_empty!5233)))

(declare-fun res!100612 () Bool)

(assert (=> start!20722 (=> (not res!100612) (not e!135368))))

(declare-fun mask!1149 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!20722 (= res!100612 (validMask!0 mask!1149))))

(assert (=> start!20722 e!135368))

(declare-datatypes ((V!6625 0))(
  ( (V!6626 (val!2661 Int)) )
))
(declare-datatypes ((ValueCell!2273 0))(
  ( (ValueCellFull!2273 (v!4632 V!6625)) (EmptyCell!2273) )
))
(declare-datatypes ((array!9671 0))(
  ( (array!9672 (arr!4586 (Array (_ BitVec 32) ValueCell!2273)) (size!4911 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!9671)

(declare-fun e!135367 () Bool)

(declare-fun array_inv!3003 (array!9671) Bool)

(assert (=> start!20722 (and (array_inv!3003 _values!649) e!135367)))

(assert (=> start!20722 true))

(assert (=> start!20722 tp_is_empty!5233))

(declare-fun array_inv!3004 (array!9669) Bool)

(assert (=> start!20722 (array_inv!3004 _keys!825)))

(assert (=> start!20722 tp!19162))

(declare-fun b!207315 () Bool)

(declare-fun res!100609 () Bool)

(assert (=> b!207315 (=> (not res!100609) (not e!135368))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!9669 (_ BitVec 32)) Bool)

(assert (=> b!207315 (= res!100609 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!207316 () Bool)

(declare-fun res!100607 () Bool)

(assert (=> b!207316 (=> (not res!100607) (not e!135368))))

(declare-fun k0!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!207316 (= res!100607 (validKeyInArray!0 k0!843))))

(declare-fun b!207317 () Bool)

(assert (=> b!207317 (= e!135368 (not true))))

(declare-datatypes ((tuple2!3984 0))(
  ( (tuple2!3985 (_1!2003 (_ BitVec 64)) (_2!2003 V!6625)) )
))
(declare-datatypes ((List!2875 0))(
  ( (Nil!2872) (Cons!2871 (h!3513 tuple2!3984) (t!7798 List!2875)) )
))
(declare-datatypes ((ListLongMap!2899 0))(
  ( (ListLongMap!2900 (toList!1465 List!2875)) )
))
(declare-fun lt!106219 () ListLongMap!2899)

(declare-fun zeroValue!615 () V!6625)

(declare-fun defaultEntry!657 () Int)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-fun minValue!615 () V!6625)

(declare-fun getCurrentListMap!1035 (array!9669 array!9671 (_ BitVec 32) (_ BitVec 32) V!6625 V!6625 (_ BitVec 32) Int) ListLongMap!2899)

(assert (=> b!207317 (= lt!106219 (getCurrentListMap!1035 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106221 () ListLongMap!2899)

(declare-fun lt!106217 () array!9671)

(assert (=> b!207317 (= lt!106221 (getCurrentListMap!1035 _keys!825 lt!106217 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun lt!106222 () ListLongMap!2899)

(declare-fun lt!106220 () ListLongMap!2899)

(assert (=> b!207317 (and (= lt!106222 lt!106220) (= lt!106220 lt!106222))))

(declare-fun lt!106223 () ListLongMap!2899)

(declare-fun v!520 () V!6625)

(declare-fun +!519 (ListLongMap!2899 tuple2!3984) ListLongMap!2899)

(assert (=> b!207317 (= lt!106220 (+!519 lt!106223 (tuple2!3985 k0!843 v!520)))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((Unit!6314 0))(
  ( (Unit!6315) )
))
(declare-fun lt!106218 () Unit!6314)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!171 (array!9669 array!9671 (_ BitVec 32) (_ BitVec 32) V!6625 V!6625 (_ BitVec 32) (_ BitVec 64) V!6625 (_ BitVec 32) Int) Unit!6314)

(assert (=> b!207317 (= lt!106218 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!171 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 i!601 k0!843 v!520 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun getCurrentListMapNoExtraKeys!428 (array!9669 array!9671 (_ BitVec 32) (_ BitVec 32) V!6625 V!6625 (_ BitVec 32) Int) ListLongMap!2899)

(assert (=> b!207317 (= lt!106222 (getCurrentListMapNoExtraKeys!428 _keys!825 lt!106217 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(assert (=> b!207317 (= lt!106217 (array!9672 (store (arr!4586 _values!649) i!601 (ValueCellFull!2273 v!520)) (size!4911 _values!649)))))

(assert (=> b!207317 (= lt!106223 (getCurrentListMapNoExtraKeys!428 _keys!825 _values!649 mask!1149 extraKeys!596 zeroValue!615 minValue!615 #b00000000000000000000000000000000 defaultEntry!657))))

(declare-fun mapNonEmpty!8918 () Bool)

(declare-fun mapRes!8918 () Bool)

(declare-fun tp!19163 () Bool)

(assert (=> mapNonEmpty!8918 (= mapRes!8918 (and tp!19163 e!135365))))

(declare-fun mapRest!8918 () (Array (_ BitVec 32) ValueCell!2273))

(declare-fun mapValue!8918 () ValueCell!2273)

(declare-fun mapKey!8918 () (_ BitVec 32))

(assert (=> mapNonEmpty!8918 (= (arr!4586 _values!649) (store mapRest!8918 mapKey!8918 mapValue!8918))))

(declare-fun b!207318 () Bool)

(declare-fun e!135364 () Bool)

(assert (=> b!207318 (= e!135367 (and e!135364 mapRes!8918))))

(declare-fun condMapEmpty!8918 () Bool)

(declare-fun mapDefault!8918 () ValueCell!2273)

(assert (=> b!207318 (= condMapEmpty!8918 (= (arr!4586 _values!649) ((as const (Array (_ BitVec 32) ValueCell!2273)) mapDefault!8918)))))

(declare-fun b!207319 () Bool)

(declare-fun res!100608 () Bool)

(assert (=> b!207319 (=> (not res!100608) (not e!135368))))

(assert (=> b!207319 (= res!100608 (= (select (arr!4585 _keys!825) i!601) k0!843))))

(declare-fun b!207320 () Bool)

(declare-fun res!100606 () Bool)

(assert (=> b!207320 (=> (not res!100606) (not e!135368))))

(assert (=> b!207320 (= res!100606 (and (= (size!4911 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4910 _keys!825) (size!4911 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!8918 () Bool)

(assert (=> mapIsEmpty!8918 mapRes!8918))

(declare-fun b!207321 () Bool)

(declare-fun res!100611 () Bool)

(assert (=> b!207321 (=> (not res!100611) (not e!135368))))

(assert (=> b!207321 (= res!100611 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4910 _keys!825))))))

(declare-fun b!207322 () Bool)

(assert (=> b!207322 (= e!135364 tp_is_empty!5233)))

(assert (= (and start!20722 res!100612) b!207320))

(assert (= (and b!207320 res!100606) b!207315))

(assert (= (and b!207315 res!100609) b!207313))

(assert (= (and b!207313 res!100610) b!207321))

(assert (= (and b!207321 res!100611) b!207316))

(assert (= (and b!207316 res!100607) b!207319))

(assert (= (and b!207319 res!100608) b!207317))

(assert (= (and b!207318 condMapEmpty!8918) mapIsEmpty!8918))

(assert (= (and b!207318 (not condMapEmpty!8918)) mapNonEmpty!8918))

(get-info :version)

(assert (= (and mapNonEmpty!8918 ((_ is ValueCellFull!2273) mapValue!8918)) b!207314))

(assert (= (and b!207318 ((_ is ValueCellFull!2273) mapDefault!8918)) b!207322))

(assert (= start!20722 b!207318))

(declare-fun m!235191 () Bool)

(assert (=> start!20722 m!235191))

(declare-fun m!235193 () Bool)

(assert (=> start!20722 m!235193))

(declare-fun m!235195 () Bool)

(assert (=> start!20722 m!235195))

(declare-fun m!235197 () Bool)

(assert (=> b!207316 m!235197))

(declare-fun m!235199 () Bool)

(assert (=> b!207313 m!235199))

(declare-fun m!235201 () Bool)

(assert (=> b!207317 m!235201))

(declare-fun m!235203 () Bool)

(assert (=> b!207317 m!235203))

(declare-fun m!235205 () Bool)

(assert (=> b!207317 m!235205))

(declare-fun m!235207 () Bool)

(assert (=> b!207317 m!235207))

(declare-fun m!235209 () Bool)

(assert (=> b!207317 m!235209))

(declare-fun m!235211 () Bool)

(assert (=> b!207317 m!235211))

(declare-fun m!235213 () Bool)

(assert (=> b!207317 m!235213))

(declare-fun m!235215 () Bool)

(assert (=> b!207315 m!235215))

(declare-fun m!235217 () Bool)

(assert (=> mapNonEmpty!8918 m!235217))

(declare-fun m!235219 () Bool)

(assert (=> b!207319 m!235219))

(check-sat tp_is_empty!5233 (not mapNonEmpty!8918) (not b!207315) (not b!207316) (not start!20722) (not b!207313) b_and!12137 (not b_next!5377) (not b!207317))
(check-sat b_and!12137 (not b_next!5377))
