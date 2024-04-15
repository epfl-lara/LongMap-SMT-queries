; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39920 () Bool)

(assert start!39920)

(declare-fun b_free!10201 () Bool)

(declare-fun b_next!10201 () Bool)

(assert (=> start!39920 (= b_free!10201 (not b_next!10201))))

(declare-fun tp!36132 () Bool)

(declare-fun b_and!18035 () Bool)

(assert (=> start!39920 (= tp!36132 b_and!18035)))

(declare-fun mapNonEmpty!18651 () Bool)

(declare-fun mapRes!18651 () Bool)

(declare-fun tp!36131 () Bool)

(declare-fun e!256100 () Bool)

(assert (=> mapNonEmpty!18651 (= mapRes!18651 (and tp!36131 e!256100))))

(declare-datatypes ((V!16243 0))(
  ( (V!16244 (val!5721 Int)) )
))
(declare-datatypes ((ValueCell!5333 0))(
  ( (ValueCellFull!5333 (v!7962 V!16243)) (EmptyCell!5333) )
))
(declare-fun mapRest!18651 () (Array (_ BitVec 32) ValueCell!5333))

(declare-fun mapValue!18651 () ValueCell!5333)

(declare-datatypes ((array!26533 0))(
  ( (array!26534 (arr!12716 (Array (_ BitVec 32) ValueCell!5333)) (size!13069 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26533)

(declare-fun mapKey!18651 () (_ BitVec 32))

(assert (=> mapNonEmpty!18651 (= (arr!12716 _values!549) (store mapRest!18651 mapKey!18651 mapValue!18651))))

(declare-fun b!433161 () Bool)

(declare-fun res!254971 () Bool)

(declare-fun e!256107 () Bool)

(assert (=> b!433161 (=> (not res!254971) (not e!256107))))

(declare-datatypes ((array!26535 0))(
  ( (array!26536 (arr!12717 (Array (_ BitVec 32) (_ BitVec 64))) (size!13070 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26535)

(declare-datatypes ((List!7561 0))(
  ( (Nil!7558) (Cons!7557 (h!8413 (_ BitVec 64)) (t!13202 List!7561)) )
))
(declare-fun arrayNoDuplicates!0 (array!26535 (_ BitVec 32) List!7561) Bool)

(assert (=> b!433161 (= res!254971 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7558))))

(declare-fun b!433162 () Bool)

(declare-fun res!254973 () Bool)

(declare-fun e!256104 () Bool)

(assert (=> b!433162 (=> (not res!254973) (not e!256104))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433162 (= res!254973 (bvsle from!863 i!563))))

(declare-fun b!433163 () Bool)

(declare-fun e!256101 () Bool)

(declare-fun e!256105 () Bool)

(assert (=> b!433163 (= e!256101 (and e!256105 mapRes!18651))))

(declare-fun condMapEmpty!18651 () Bool)

(declare-fun mapDefault!18651 () ValueCell!5333)

(assert (=> b!433163 (= condMapEmpty!18651 (= (arr!12716 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5333)) mapDefault!18651)))))

(declare-fun b!433164 () Bool)

(declare-fun e!256098 () Bool)

(declare-fun e!256102 () Bool)

(assert (=> b!433164 (= e!256098 e!256102)))

(declare-fun res!254968 () Bool)

(assert (=> b!433164 (=> res!254968 e!256102)))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!433164 (= res!254968 (= k0!794 (select (arr!12717 _keys!709) from!863)))))

(assert (=> b!433164 (not (= (select (arr!12717 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12797 0))(
  ( (Unit!12798) )
))
(declare-fun lt!198795 () Unit!12797)

(declare-fun e!256106 () Unit!12797)

(assert (=> b!433164 (= lt!198795 e!256106)))

(declare-fun c!55566 () Bool)

(assert (=> b!433164 (= c!55566 (= (select (arr!12717 _keys!709) from!863) k0!794))))

(declare-datatypes ((tuple2!7570 0))(
  ( (tuple2!7571 (_1!3796 (_ BitVec 64)) (_2!3796 V!16243)) )
))
(declare-datatypes ((List!7562 0))(
  ( (Nil!7559) (Cons!7558 (h!8414 tuple2!7570) (t!13203 List!7562)) )
))
(declare-datatypes ((ListLongMap!6473 0))(
  ( (ListLongMap!6474 (toList!3252 List!7562)) )
))
(declare-fun lt!198794 () ListLongMap!6473)

(declare-fun lt!198806 () ListLongMap!6473)

(assert (=> b!433164 (= lt!198794 lt!198806)))

(declare-fun lt!198801 () ListLongMap!6473)

(declare-fun lt!198798 () tuple2!7570)

(declare-fun +!1427 (ListLongMap!6473 tuple2!7570) ListLongMap!6473)

(assert (=> b!433164 (= lt!198806 (+!1427 lt!198801 lt!198798))))

(declare-fun lt!198805 () V!16243)

(assert (=> b!433164 (= lt!198798 (tuple2!7571 (select (arr!12717 _keys!709) from!863) lt!198805))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6327 (ValueCell!5333 V!16243) V!16243)

(declare-fun dynLambda!809 (Int (_ BitVec 64)) V!16243)

(assert (=> b!433164 (= lt!198805 (get!6327 (select (arr!12716 _values!549) from!863) (dynLambda!809 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433165 () Bool)

(declare-fun Unit!12799 () Unit!12797)

(assert (=> b!433165 (= e!256106 Unit!12799)))

(declare-fun lt!198803 () Unit!12797)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26535 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12797)

(assert (=> b!433165 (= lt!198803 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433165 false))

(declare-fun b!433166 () Bool)

(declare-fun res!254972 () Bool)

(assert (=> b!433166 (=> (not res!254972) (not e!256107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433166 (= res!254972 (validKeyInArray!0 k0!794))))

(declare-fun b!433167 () Bool)

(declare-fun res!254967 () Bool)

(assert (=> b!433167 (=> (not res!254967) (not e!256107))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!433167 (= res!254967 (and (= (size!13069 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13070 _keys!709) (size!13069 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!433168 () Bool)

(declare-fun Unit!12800 () Unit!12797)

(assert (=> b!433168 (= e!256106 Unit!12800)))

(declare-fun b!433169 () Bool)

(declare-fun res!254975 () Bool)

(assert (=> b!433169 (=> (not res!254975) (not e!256107))))

(assert (=> b!433169 (= res!254975 (or (= (select (arr!12717 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12717 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433170 () Bool)

(declare-fun res!254963 () Bool)

(assert (=> b!433170 (=> (not res!254963) (not e!256107))))

(assert (=> b!433170 (= res!254963 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13070 _keys!709))))))

(declare-fun b!433171 () Bool)

(declare-fun res!254964 () Bool)

(assert (=> b!433171 (=> (not res!254964) (not e!256107))))

(declare-fun arrayContainsKey!0 (array!26535 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433171 (= res!254964 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!433172 () Bool)

(declare-fun tp_is_empty!11353 () Bool)

(assert (=> b!433172 (= e!256105 tp_is_empty!11353)))

(declare-fun b!433173 () Bool)

(declare-fun res!254962 () Bool)

(assert (=> b!433173 (=> (not res!254962) (not e!256104))))

(declare-fun lt!198797 () array!26535)

(assert (=> b!433173 (= res!254962 (arrayNoDuplicates!0 lt!198797 #b00000000000000000000000000000000 Nil!7558))))

(declare-fun mapIsEmpty!18651 () Bool)

(assert (=> mapIsEmpty!18651 mapRes!18651))

(declare-fun b!433174 () Bool)

(declare-fun e!256099 () Bool)

(assert (=> b!433174 (= e!256099 (not e!256098))))

(declare-fun res!254974 () Bool)

(assert (=> b!433174 (=> res!254974 e!256098)))

(assert (=> b!433174 (= res!254974 (not (validKeyInArray!0 (select (arr!12717 _keys!709) from!863))))))

(declare-fun lt!198793 () ListLongMap!6473)

(assert (=> b!433174 (= lt!198793 lt!198801)))

(declare-fun lt!198792 () ListLongMap!6473)

(declare-fun lt!198804 () tuple2!7570)

(assert (=> b!433174 (= lt!198801 (+!1427 lt!198792 lt!198804))))

(declare-fun minValue!515 () V!16243)

(declare-fun lt!198796 () array!26533)

(declare-fun zeroValue!515 () V!16243)

(declare-fun getCurrentListMapNoExtraKeys!1455 (array!26535 array!26533 (_ BitVec 32) (_ BitVec 32) V!16243 V!16243 (_ BitVec 32) Int) ListLongMap!6473)

(assert (=> b!433174 (= lt!198793 (getCurrentListMapNoExtraKeys!1455 lt!198797 lt!198796 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16243)

(assert (=> b!433174 (= lt!198804 (tuple2!7571 k0!794 v!412))))

(assert (=> b!433174 (= lt!198792 (getCurrentListMapNoExtraKeys!1455 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198802 () Unit!12797)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!578 (array!26535 array!26533 (_ BitVec 32) (_ BitVec 32) V!16243 V!16243 (_ BitVec 32) (_ BitVec 64) V!16243 (_ BitVec 32) Int) Unit!12797)

(assert (=> b!433174 (= lt!198802 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!578 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433175 () Bool)

(assert (=> b!433175 (= e!256104 e!256099)))

(declare-fun res!254965 () Bool)

(assert (=> b!433175 (=> (not res!254965) (not e!256099))))

(assert (=> b!433175 (= res!254965 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!433175 (= lt!198794 (getCurrentListMapNoExtraKeys!1455 lt!198797 lt!198796 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!433175 (= lt!198796 (array!26534 (store (arr!12716 _values!549) i!563 (ValueCellFull!5333 v!412)) (size!13069 _values!549)))))

(declare-fun lt!198800 () ListLongMap!6473)

(assert (=> b!433175 (= lt!198800 (getCurrentListMapNoExtraKeys!1455 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433176 () Bool)

(declare-fun res!254970 () Bool)

(assert (=> b!433176 (=> (not res!254970) (not e!256107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26535 (_ BitVec 32)) Bool)

(assert (=> b!433176 (= res!254970 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433177 () Bool)

(assert (=> b!433177 (= e!256107 e!256104)))

(declare-fun res!254966 () Bool)

(assert (=> b!433177 (=> (not res!254966) (not e!256104))))

(assert (=> b!433177 (= res!254966 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198797 mask!1025))))

(assert (=> b!433177 (= lt!198797 (array!26536 (store (arr!12717 _keys!709) i!563 k0!794) (size!13070 _keys!709)))))

(declare-fun b!433178 () Bool)

(assert (=> b!433178 (= e!256102 true)))

(assert (=> b!433178 (= lt!198806 (+!1427 (+!1427 lt!198792 lt!198798) lt!198804))))

(declare-fun lt!198799 () Unit!12797)

(declare-fun addCommutativeForDiffKeys!383 (ListLongMap!6473 (_ BitVec 64) V!16243 (_ BitVec 64) V!16243) Unit!12797)

(assert (=> b!433178 (= lt!198799 (addCommutativeForDiffKeys!383 lt!198792 k0!794 v!412 (select (arr!12717 _keys!709) from!863) lt!198805))))

(declare-fun b!433179 () Bool)

(declare-fun res!254976 () Bool)

(assert (=> b!433179 (=> (not res!254976) (not e!256107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433179 (= res!254976 (validMask!0 mask!1025))))

(declare-fun b!433180 () Bool)

(assert (=> b!433180 (= e!256100 tp_is_empty!11353)))

(declare-fun res!254969 () Bool)

(assert (=> start!39920 (=> (not res!254969) (not e!256107))))

(assert (=> start!39920 (= res!254969 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13070 _keys!709))))))

(assert (=> start!39920 e!256107))

(assert (=> start!39920 tp_is_empty!11353))

(assert (=> start!39920 tp!36132))

(assert (=> start!39920 true))

(declare-fun array_inv!9284 (array!26533) Bool)

(assert (=> start!39920 (and (array_inv!9284 _values!549) e!256101)))

(declare-fun array_inv!9285 (array!26535) Bool)

(assert (=> start!39920 (array_inv!9285 _keys!709)))

(assert (= (and start!39920 res!254969) b!433179))

(assert (= (and b!433179 res!254976) b!433167))

(assert (= (and b!433167 res!254967) b!433176))

(assert (= (and b!433176 res!254970) b!433161))

(assert (= (and b!433161 res!254971) b!433170))

(assert (= (and b!433170 res!254963) b!433166))

(assert (= (and b!433166 res!254972) b!433169))

(assert (= (and b!433169 res!254975) b!433171))

(assert (= (and b!433171 res!254964) b!433177))

(assert (= (and b!433177 res!254966) b!433173))

(assert (= (and b!433173 res!254962) b!433162))

(assert (= (and b!433162 res!254973) b!433175))

(assert (= (and b!433175 res!254965) b!433174))

(assert (= (and b!433174 (not res!254974)) b!433164))

(assert (= (and b!433164 c!55566) b!433165))

(assert (= (and b!433164 (not c!55566)) b!433168))

(assert (= (and b!433164 (not res!254968)) b!433178))

(assert (= (and b!433163 condMapEmpty!18651) mapIsEmpty!18651))

(assert (= (and b!433163 (not condMapEmpty!18651)) mapNonEmpty!18651))

(get-info :version)

(assert (= (and mapNonEmpty!18651 ((_ is ValueCellFull!5333) mapValue!18651)) b!433180))

(assert (= (and b!433163 ((_ is ValueCellFull!5333) mapDefault!18651)) b!433172))

(assert (= start!39920 b!433163))

(declare-fun b_lambda!9271 () Bool)

(assert (=> (not b_lambda!9271) (not b!433164)))

(declare-fun t!13201 () Bool)

(declare-fun tb!3599 () Bool)

(assert (=> (and start!39920 (= defaultEntry!557 defaultEntry!557) t!13201) tb!3599))

(declare-fun result!6733 () Bool)

(assert (=> tb!3599 (= result!6733 tp_is_empty!11353)))

(assert (=> b!433164 t!13201))

(declare-fun b_and!18037 () Bool)

(assert (= b_and!18035 (and (=> t!13201 result!6733) b_and!18037)))

(declare-fun m!420717 () Bool)

(assert (=> b!433166 m!420717))

(declare-fun m!420719 () Bool)

(assert (=> b!433164 m!420719))

(declare-fun m!420721 () Bool)

(assert (=> b!433164 m!420721))

(declare-fun m!420723 () Bool)

(assert (=> b!433164 m!420723))

(declare-fun m!420725 () Bool)

(assert (=> b!433164 m!420725))

(assert (=> b!433164 m!420723))

(assert (=> b!433164 m!420721))

(declare-fun m!420727 () Bool)

(assert (=> b!433164 m!420727))

(declare-fun m!420729 () Bool)

(assert (=> b!433177 m!420729))

(declare-fun m!420731 () Bool)

(assert (=> b!433177 m!420731))

(declare-fun m!420733 () Bool)

(assert (=> b!433171 m!420733))

(declare-fun m!420735 () Bool)

(assert (=> b!433179 m!420735))

(declare-fun m!420737 () Bool)

(assert (=> b!433165 m!420737))

(declare-fun m!420739 () Bool)

(assert (=> b!433173 m!420739))

(declare-fun m!420741 () Bool)

(assert (=> b!433178 m!420741))

(assert (=> b!433178 m!420741))

(declare-fun m!420743 () Bool)

(assert (=> b!433178 m!420743))

(assert (=> b!433178 m!420719))

(assert (=> b!433178 m!420719))

(declare-fun m!420745 () Bool)

(assert (=> b!433178 m!420745))

(declare-fun m!420747 () Bool)

(assert (=> mapNonEmpty!18651 m!420747))

(declare-fun m!420749 () Bool)

(assert (=> b!433176 m!420749))

(declare-fun m!420751 () Bool)

(assert (=> b!433169 m!420751))

(declare-fun m!420753 () Bool)

(assert (=> b!433161 m!420753))

(declare-fun m!420755 () Bool)

(assert (=> start!39920 m!420755))

(declare-fun m!420757 () Bool)

(assert (=> start!39920 m!420757))

(declare-fun m!420759 () Bool)

(assert (=> b!433175 m!420759))

(declare-fun m!420761 () Bool)

(assert (=> b!433175 m!420761))

(declare-fun m!420763 () Bool)

(assert (=> b!433175 m!420763))

(assert (=> b!433174 m!420719))

(declare-fun m!420765 () Bool)

(assert (=> b!433174 m!420765))

(declare-fun m!420767 () Bool)

(assert (=> b!433174 m!420767))

(declare-fun m!420769 () Bool)

(assert (=> b!433174 m!420769))

(assert (=> b!433174 m!420719))

(declare-fun m!420771 () Bool)

(assert (=> b!433174 m!420771))

(declare-fun m!420773 () Bool)

(assert (=> b!433174 m!420773))

(check-sat (not b!433165) (not b!433161) (not mapNonEmpty!18651) (not b!433175) (not b!433171) (not b_next!10201) tp_is_empty!11353 (not b!433178) (not start!39920) b_and!18037 (not b!433177) (not b!433166) (not b!433174) (not b!433179) (not b_lambda!9271) (not b!433164) (not b!433173) (not b!433176))
(check-sat b_and!18037 (not b_next!10201))
