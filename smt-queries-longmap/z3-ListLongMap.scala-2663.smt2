; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39782 () Bool)

(assert start!39782)

(declare-fun b_free!10063 () Bool)

(declare-fun b_next!10063 () Bool)

(assert (=> start!39782 (= b_free!10063 (not b_next!10063))))

(declare-fun tp!35717 () Bool)

(declare-fun b_and!17799 () Bool)

(assert (=> start!39782 (= tp!35717 b_and!17799)))

(declare-fun b!429148 () Bool)

(declare-fun res!252032 () Bool)

(declare-fun e!254221 () Bool)

(assert (=> b!429148 (=> (not res!252032) (not e!254221))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429148 (= res!252032 (bvsle from!863 i!563))))

(declare-fun b!429149 () Bool)

(declare-fun res!252038 () Bool)

(declare-fun e!254218 () Bool)

(assert (=> b!429149 (=> (not res!252038) (not e!254218))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429149 (= res!252038 (validMask!0 mask!1025))))

(declare-fun b!429150 () Bool)

(declare-fun res!252033 () Bool)

(assert (=> b!429150 (=> (not res!252033) (not e!254221))))

(declare-datatypes ((array!26270 0))(
  ( (array!26271 (arr!12584 (Array (_ BitVec 32) (_ BitVec 64))) (size!12936 (_ BitVec 32))) )
))
(declare-fun lt!196155 () array!26270)

(declare-datatypes ((List!7341 0))(
  ( (Nil!7338) (Cons!7337 (h!8193 (_ BitVec 64)) (t!12845 List!7341)) )
))
(declare-fun arrayNoDuplicates!0 (array!26270 (_ BitVec 32) List!7341) Bool)

(assert (=> b!429150 (= res!252033 (arrayNoDuplicates!0 lt!196155 #b00000000000000000000000000000000 Nil!7338))))

(declare-fun b!429151 () Bool)

(declare-fun e!254219 () Bool)

(declare-fun e!254215 () Bool)

(assert (=> b!429151 (= e!254219 (not e!254215))))

(declare-fun res!252028 () Bool)

(assert (=> b!429151 (=> res!252028 e!254215)))

(declare-fun _keys!709 () array!26270)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429151 (= res!252028 (not (validKeyInArray!0 (select (arr!12584 _keys!709) from!863))))))

(declare-datatypes ((V!16059 0))(
  ( (V!16060 (val!5652 Int)) )
))
(declare-datatypes ((tuple2!7340 0))(
  ( (tuple2!7341 (_1!3681 (_ BitVec 64)) (_2!3681 V!16059)) )
))
(declare-datatypes ((List!7342 0))(
  ( (Nil!7339) (Cons!7338 (h!8194 tuple2!7340) (t!12846 List!7342)) )
))
(declare-datatypes ((ListLongMap!6255 0))(
  ( (ListLongMap!6256 (toList!3143 List!7342)) )
))
(declare-fun lt!196162 () ListLongMap!6255)

(declare-fun lt!196158 () ListLongMap!6255)

(assert (=> b!429151 (= lt!196162 lt!196158)))

(declare-fun lt!196160 () ListLongMap!6255)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16059)

(declare-fun +!1355 (ListLongMap!6255 tuple2!7340) ListLongMap!6255)

(assert (=> b!429151 (= lt!196158 (+!1355 lt!196160 (tuple2!7341 k0!794 v!412)))))

(declare-fun minValue!515 () V!16059)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5264 0))(
  ( (ValueCellFull!5264 (v!7900 V!16059)) (EmptyCell!5264) )
))
(declare-datatypes ((array!26272 0))(
  ( (array!26273 (arr!12585 (Array (_ BitVec 32) ValueCell!5264)) (size!12937 (_ BitVec 32))) )
))
(declare-fun lt!196157 () array!26272)

(declare-fun zeroValue!515 () V!16059)

(declare-fun getCurrentListMapNoExtraKeys!1387 (array!26270 array!26272 (_ BitVec 32) (_ BitVec 32) V!16059 V!16059 (_ BitVec 32) Int) ListLongMap!6255)

(assert (=> b!429151 (= lt!196162 (getCurrentListMapNoExtraKeys!1387 lt!196155 lt!196157 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!26272)

(assert (=> b!429151 (= lt!196160 (getCurrentListMapNoExtraKeys!1387 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12601 0))(
  ( (Unit!12602) )
))
(declare-fun lt!196164 () Unit!12601)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!535 (array!26270 array!26272 (_ BitVec 32) (_ BitVec 32) V!16059 V!16059 (_ BitVec 32) (_ BitVec 64) V!16059 (_ BitVec 32) Int) Unit!12601)

(assert (=> b!429151 (= lt!196164 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!535 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429152 () Bool)

(declare-fun e!254220 () Bool)

(declare-fun e!254214 () Bool)

(declare-fun mapRes!18444 () Bool)

(assert (=> b!429152 (= e!254220 (and e!254214 mapRes!18444))))

(declare-fun condMapEmpty!18444 () Bool)

(declare-fun mapDefault!18444 () ValueCell!5264)

(assert (=> b!429152 (= condMapEmpty!18444 (= (arr!12585 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5264)) mapDefault!18444)))))

(declare-fun mapNonEmpty!18444 () Bool)

(declare-fun tp!35718 () Bool)

(declare-fun e!254216 () Bool)

(assert (=> mapNonEmpty!18444 (= mapRes!18444 (and tp!35718 e!254216))))

(declare-fun mapRest!18444 () (Array (_ BitVec 32) ValueCell!5264))

(declare-fun mapKey!18444 () (_ BitVec 32))

(declare-fun mapValue!18444 () ValueCell!5264)

(assert (=> mapNonEmpty!18444 (= (arr!12585 _values!549) (store mapRest!18444 mapKey!18444 mapValue!18444))))

(declare-fun b!429153 () Bool)

(declare-fun res!252034 () Bool)

(assert (=> b!429153 (=> (not res!252034) (not e!254218))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26270 (_ BitVec 32)) Bool)

(assert (=> b!429153 (= res!252034 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!429154 () Bool)

(declare-fun tp_is_empty!11215 () Bool)

(assert (=> b!429154 (= e!254214 tp_is_empty!11215)))

(declare-fun b!429155 () Bool)

(assert (=> b!429155 (= e!254215 true)))

(assert (=> b!429155 (not (= (select (arr!12584 _keys!709) from!863) k0!794))))

(declare-fun lt!196163 () Unit!12601)

(declare-fun e!254213 () Unit!12601)

(assert (=> b!429155 (= lt!196163 e!254213)))

(declare-fun c!55407 () Bool)

(assert (=> b!429155 (= c!55407 (= (select (arr!12584 _keys!709) from!863) k0!794))))

(declare-fun lt!196159 () ListLongMap!6255)

(declare-fun get!6244 (ValueCell!5264 V!16059) V!16059)

(declare-fun dynLambda!769 (Int (_ BitVec 64)) V!16059)

(assert (=> b!429155 (= lt!196159 (+!1355 lt!196158 (tuple2!7341 (select (arr!12584 _keys!709) from!863) (get!6244 (select (arr!12585 _values!549) from!863) (dynLambda!769 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun res!252037 () Bool)

(assert (=> start!39782 (=> (not res!252037) (not e!254218))))

(assert (=> start!39782 (= res!252037 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12936 _keys!709))))))

(assert (=> start!39782 e!254218))

(assert (=> start!39782 tp_is_empty!11215))

(assert (=> start!39782 tp!35717))

(assert (=> start!39782 true))

(declare-fun array_inv!9232 (array!26272) Bool)

(assert (=> start!39782 (and (array_inv!9232 _values!549) e!254220)))

(declare-fun array_inv!9233 (array!26270) Bool)

(assert (=> start!39782 (array_inv!9233 _keys!709)))

(declare-fun b!429156 () Bool)

(declare-fun Unit!12603 () Unit!12601)

(assert (=> b!429156 (= e!254213 Unit!12603)))

(declare-fun lt!196156 () Unit!12601)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26270 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12601)

(assert (=> b!429156 (= lt!196156 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429156 false))

(declare-fun b!429157 () Bool)

(declare-fun res!252036 () Bool)

(assert (=> b!429157 (=> (not res!252036) (not e!254218))))

(assert (=> b!429157 (= res!252036 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7338))))

(declare-fun b!429158 () Bool)

(declare-fun Unit!12604 () Unit!12601)

(assert (=> b!429158 (= e!254213 Unit!12604)))

(declare-fun b!429159 () Bool)

(declare-fun res!252031 () Bool)

(assert (=> b!429159 (=> (not res!252031) (not e!254218))))

(assert (=> b!429159 (= res!252031 (validKeyInArray!0 k0!794))))

(declare-fun b!429160 () Bool)

(assert (=> b!429160 (= e!254221 e!254219)))

(declare-fun res!252030 () Bool)

(assert (=> b!429160 (=> (not res!252030) (not e!254219))))

(assert (=> b!429160 (= res!252030 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!429160 (= lt!196159 (getCurrentListMapNoExtraKeys!1387 lt!196155 lt!196157 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!429160 (= lt!196157 (array!26273 (store (arr!12585 _values!549) i!563 (ValueCellFull!5264 v!412)) (size!12937 _values!549)))))

(declare-fun lt!196161 () ListLongMap!6255)

(assert (=> b!429160 (= lt!196161 (getCurrentListMapNoExtraKeys!1387 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429161 () Bool)

(declare-fun res!252026 () Bool)

(assert (=> b!429161 (=> (not res!252026) (not e!254218))))

(assert (=> b!429161 (= res!252026 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12936 _keys!709))))))

(declare-fun b!429162 () Bool)

(declare-fun res!252039 () Bool)

(assert (=> b!429162 (=> (not res!252039) (not e!254218))))

(declare-fun arrayContainsKey!0 (array!26270 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429162 (= res!252039 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!429163 () Bool)

(assert (=> b!429163 (= e!254216 tp_is_empty!11215)))

(declare-fun b!429164 () Bool)

(declare-fun res!252035 () Bool)

(assert (=> b!429164 (=> (not res!252035) (not e!254218))))

(assert (=> b!429164 (= res!252035 (or (= (select (arr!12584 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12584 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!429165 () Bool)

(declare-fun res!252027 () Bool)

(assert (=> b!429165 (=> (not res!252027) (not e!254218))))

(assert (=> b!429165 (= res!252027 (and (= (size!12937 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12936 _keys!709) (size!12937 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18444 () Bool)

(assert (=> mapIsEmpty!18444 mapRes!18444))

(declare-fun b!429166 () Bool)

(assert (=> b!429166 (= e!254218 e!254221)))

(declare-fun res!252029 () Bool)

(assert (=> b!429166 (=> (not res!252029) (not e!254221))))

(assert (=> b!429166 (= res!252029 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196155 mask!1025))))

(assert (=> b!429166 (= lt!196155 (array!26271 (store (arr!12584 _keys!709) i!563 k0!794) (size!12936 _keys!709)))))

(assert (= (and start!39782 res!252037) b!429149))

(assert (= (and b!429149 res!252038) b!429165))

(assert (= (and b!429165 res!252027) b!429153))

(assert (= (and b!429153 res!252034) b!429157))

(assert (= (and b!429157 res!252036) b!429161))

(assert (= (and b!429161 res!252026) b!429159))

(assert (= (and b!429159 res!252031) b!429164))

(assert (= (and b!429164 res!252035) b!429162))

(assert (= (and b!429162 res!252039) b!429166))

(assert (= (and b!429166 res!252029) b!429150))

(assert (= (and b!429150 res!252033) b!429148))

(assert (= (and b!429148 res!252032) b!429160))

(assert (= (and b!429160 res!252030) b!429151))

(assert (= (and b!429151 (not res!252028)) b!429155))

(assert (= (and b!429155 c!55407) b!429156))

(assert (= (and b!429155 (not c!55407)) b!429158))

(assert (= (and b!429152 condMapEmpty!18444) mapIsEmpty!18444))

(assert (= (and b!429152 (not condMapEmpty!18444)) mapNonEmpty!18444))

(get-info :version)

(assert (= (and mapNonEmpty!18444 ((_ is ValueCellFull!5264) mapValue!18444)) b!429163))

(assert (= (and b!429152 ((_ is ValueCellFull!5264) mapDefault!18444)) b!429154))

(assert (= start!39782 b!429152))

(declare-fun b_lambda!9173 () Bool)

(assert (=> (not b_lambda!9173) (not b!429155)))

(declare-fun t!12844 () Bool)

(declare-fun tb!3461 () Bool)

(assert (=> (and start!39782 (= defaultEntry!557 defaultEntry!557) t!12844) tb!3461))

(declare-fun result!6457 () Bool)

(assert (=> tb!3461 (= result!6457 tp_is_empty!11215)))

(assert (=> b!429155 t!12844))

(declare-fun b_and!17801 () Bool)

(assert (= b_and!17799 (and (=> t!12844 result!6457) b_and!17801)))

(declare-fun m!417755 () Bool)

(assert (=> b!429151 m!417755))

(declare-fun m!417757 () Bool)

(assert (=> b!429151 m!417757))

(declare-fun m!417759 () Bool)

(assert (=> b!429151 m!417759))

(assert (=> b!429151 m!417755))

(declare-fun m!417761 () Bool)

(assert (=> b!429151 m!417761))

(declare-fun m!417763 () Bool)

(assert (=> b!429151 m!417763))

(declare-fun m!417765 () Bool)

(assert (=> b!429151 m!417765))

(declare-fun m!417767 () Bool)

(assert (=> b!429166 m!417767))

(declare-fun m!417769 () Bool)

(assert (=> b!429166 m!417769))

(declare-fun m!417771 () Bool)

(assert (=> b!429157 m!417771))

(assert (=> b!429155 m!417755))

(declare-fun m!417773 () Bool)

(assert (=> b!429155 m!417773))

(declare-fun m!417775 () Bool)

(assert (=> b!429155 m!417775))

(declare-fun m!417777 () Bool)

(assert (=> b!429155 m!417777))

(assert (=> b!429155 m!417775))

(assert (=> b!429155 m!417773))

(declare-fun m!417779 () Bool)

(assert (=> b!429155 m!417779))

(declare-fun m!417781 () Bool)

(assert (=> b!429156 m!417781))

(declare-fun m!417783 () Bool)

(assert (=> b!429162 m!417783))

(declare-fun m!417785 () Bool)

(assert (=> b!429149 m!417785))

(declare-fun m!417787 () Bool)

(assert (=> b!429159 m!417787))

(declare-fun m!417789 () Bool)

(assert (=> b!429164 m!417789))

(declare-fun m!417791 () Bool)

(assert (=> start!39782 m!417791))

(declare-fun m!417793 () Bool)

(assert (=> start!39782 m!417793))

(declare-fun m!417795 () Bool)

(assert (=> b!429160 m!417795))

(declare-fun m!417797 () Bool)

(assert (=> b!429160 m!417797))

(declare-fun m!417799 () Bool)

(assert (=> b!429160 m!417799))

(declare-fun m!417801 () Bool)

(assert (=> b!429153 m!417801))

(declare-fun m!417803 () Bool)

(assert (=> mapNonEmpty!18444 m!417803))

(declare-fun m!417805 () Bool)

(assert (=> b!429150 m!417805))

(check-sat (not b!429151) b_and!17801 (not b!429156) (not b!429149) (not mapNonEmpty!18444) (not b!429155) (not b!429162) (not b!429157) (not b!429153) tp_is_empty!11215 (not b!429160) (not b_lambda!9173) (not b!429159) (not b_next!10063) (not b!429166) (not b!429150) (not start!39782))
(check-sat b_and!17801 (not b_next!10063))
