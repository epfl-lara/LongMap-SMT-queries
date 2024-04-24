; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39188 () Bool)

(assert start!39188)

(declare-fun b_free!9469 () Bool)

(declare-fun b_next!9469 () Bool)

(assert (=> start!39188 (= b_free!9469 (not b_next!9469))))

(declare-fun tp!33936 () Bool)

(declare-fun b_and!16869 () Bool)

(assert (=> start!39188 (= tp!33936 b_and!16869)))

(declare-fun b!413168 () Bool)

(declare-fun e!247102 () Bool)

(assert (=> b!413168 (= e!247102 (not true))))

(declare-fun e!247105 () Bool)

(assert (=> b!413168 e!247105))

(declare-fun c!54894 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413168 (= c!54894 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!15267 0))(
  ( (V!15268 (val!5355 Int)) )
))
(declare-fun minValue!515 () V!15267)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((ValueCell!4967 0))(
  ( (ValueCellFull!4967 (v!7603 V!15267)) (EmptyCell!4967) )
))
(declare-datatypes ((array!25104 0))(
  ( (array!25105 (arr!12001 (Array (_ BitVec 32) ValueCell!4967)) (size!12353 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25104)

(declare-fun zeroValue!515 () V!15267)

(declare-fun v!412 () V!15267)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!25106 0))(
  ( (array!25107 (arr!12002 (Array (_ BitVec 32) (_ BitVec 64))) (size!12354 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25106)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12221 0))(
  ( (Unit!12222) )
))
(declare-fun lt!189683 () Unit!12221)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!378 (array!25106 array!25104 (_ BitVec 32) (_ BitVec 32) V!15267 V!15267 (_ BitVec 32) (_ BitVec 64) V!15267 (_ BitVec 32) Int) Unit!12221)

(assert (=> b!413168 (= lt!189683 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!378 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!17553 () Bool)

(declare-fun mapRes!17553 () Bool)

(assert (=> mapIsEmpty!17553 mapRes!17553))

(declare-fun b!413169 () Bool)

(declare-fun res!240082 () Bool)

(declare-fun e!247107 () Bool)

(assert (=> b!413169 (=> (not res!240082) (not e!247107))))

(declare-fun arrayContainsKey!0 (array!25106 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413169 (= res!240082 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!413171 () Bool)

(declare-fun e!247106 () Bool)

(declare-fun e!247101 () Bool)

(assert (=> b!413171 (= e!247106 (and e!247101 mapRes!17553))))

(declare-fun condMapEmpty!17553 () Bool)

(declare-fun mapDefault!17553 () ValueCell!4967)

(assert (=> b!413171 (= condMapEmpty!17553 (= (arr!12001 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4967)) mapDefault!17553)))))

(declare-fun b!413172 () Bool)

(declare-fun res!240092 () Bool)

(assert (=> b!413172 (=> (not res!240092) (not e!247107))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413172 (= res!240092 (validMask!0 mask!1025))))

(declare-fun b!413173 () Bool)

(declare-fun res!240083 () Bool)

(declare-fun e!247108 () Bool)

(assert (=> b!413173 (=> (not res!240083) (not e!247108))))

(assert (=> b!413173 (= res!240083 (bvsle from!863 i!563))))

(declare-fun b!413174 () Bool)

(declare-fun tp_is_empty!10621 () Bool)

(assert (=> b!413174 (= e!247101 tp_is_empty!10621)))

(declare-fun b!413175 () Bool)

(assert (=> b!413175 (= e!247108 e!247102)))

(declare-fun res!240084 () Bool)

(assert (=> b!413175 (=> (not res!240084) (not e!247102))))

(assert (=> b!413175 (= res!240084 (= from!863 i!563))))

(declare-fun lt!189685 () array!25104)

(declare-datatypes ((tuple2!6826 0))(
  ( (tuple2!6827 (_1!3424 (_ BitVec 64)) (_2!3424 V!15267)) )
))
(declare-datatypes ((List!6845 0))(
  ( (Nil!6842) (Cons!6841 (h!7697 tuple2!6826) (t!12011 List!6845)) )
))
(declare-datatypes ((ListLongMap!5741 0))(
  ( (ListLongMap!5742 (toList!2886 List!6845)) )
))
(declare-fun lt!189687 () ListLongMap!5741)

(declare-fun lt!189686 () array!25106)

(declare-fun getCurrentListMapNoExtraKeys!1136 (array!25106 array!25104 (_ BitVec 32) (_ BitVec 32) V!15267 V!15267 (_ BitVec 32) Int) ListLongMap!5741)

(assert (=> b!413175 (= lt!189687 (getCurrentListMapNoExtraKeys!1136 lt!189686 lt!189685 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413175 (= lt!189685 (array!25105 (store (arr!12001 _values!549) i!563 (ValueCellFull!4967 v!412)) (size!12353 _values!549)))))

(declare-fun lt!189684 () ListLongMap!5741)

(assert (=> b!413175 (= lt!189684 (getCurrentListMapNoExtraKeys!1136 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!413176 () Bool)

(declare-fun res!240093 () Bool)

(assert (=> b!413176 (=> (not res!240093) (not e!247107))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413176 (= res!240093 (validKeyInArray!0 k0!794))))

(declare-fun b!413177 () Bool)

(declare-fun res!240085 () Bool)

(assert (=> b!413177 (=> (not res!240085) (not e!247107))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25106 (_ BitVec 32)) Bool)

(assert (=> b!413177 (= res!240085 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!28569 () Bool)

(declare-fun call!28573 () ListLongMap!5741)

(assert (=> bm!28569 (= call!28573 (getCurrentListMapNoExtraKeys!1136 (ite c!54894 _keys!709 lt!189686) (ite c!54894 _values!549 lt!189685) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413178 () Bool)

(declare-fun call!28572 () ListLongMap!5741)

(declare-fun +!1165 (ListLongMap!5741 tuple2!6826) ListLongMap!5741)

(assert (=> b!413178 (= e!247105 (= call!28572 (+!1165 call!28573 (tuple2!6827 k0!794 v!412))))))

(declare-fun b!413179 () Bool)

(declare-fun res!240091 () Bool)

(assert (=> b!413179 (=> (not res!240091) (not e!247107))))

(assert (=> b!413179 (= res!240091 (and (= (size!12353 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12354 _keys!709) (size!12353 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413180 () Bool)

(declare-fun res!240089 () Bool)

(assert (=> b!413180 (=> (not res!240089) (not e!247108))))

(declare-datatypes ((List!6846 0))(
  ( (Nil!6843) (Cons!6842 (h!7698 (_ BitVec 64)) (t!12012 List!6846)) )
))
(declare-fun arrayNoDuplicates!0 (array!25106 (_ BitVec 32) List!6846) Bool)

(assert (=> b!413180 (= res!240089 (arrayNoDuplicates!0 lt!189686 #b00000000000000000000000000000000 Nil!6843))))

(declare-fun res!240081 () Bool)

(assert (=> start!39188 (=> (not res!240081) (not e!247107))))

(assert (=> start!39188 (= res!240081 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12354 _keys!709))))))

(assert (=> start!39188 e!247107))

(assert (=> start!39188 tp_is_empty!10621))

(assert (=> start!39188 tp!33936))

(assert (=> start!39188 true))

(declare-fun array_inv!8828 (array!25104) Bool)

(assert (=> start!39188 (and (array_inv!8828 _values!549) e!247106)))

(declare-fun array_inv!8829 (array!25106) Bool)

(assert (=> start!39188 (array_inv!8829 _keys!709)))

(declare-fun b!413170 () Bool)

(declare-fun res!240087 () Bool)

(assert (=> b!413170 (=> (not res!240087) (not e!247107))))

(assert (=> b!413170 (= res!240087 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12354 _keys!709))))))

(declare-fun b!413181 () Bool)

(assert (=> b!413181 (= e!247107 e!247108)))

(declare-fun res!240086 () Bool)

(assert (=> b!413181 (=> (not res!240086) (not e!247108))))

(assert (=> b!413181 (= res!240086 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189686 mask!1025))))

(assert (=> b!413181 (= lt!189686 (array!25107 (store (arr!12002 _keys!709) i!563 k0!794) (size!12354 _keys!709)))))

(declare-fun mapNonEmpty!17553 () Bool)

(declare-fun tp!33935 () Bool)

(declare-fun e!247103 () Bool)

(assert (=> mapNonEmpty!17553 (= mapRes!17553 (and tp!33935 e!247103))))

(declare-fun mapValue!17553 () ValueCell!4967)

(declare-fun mapKey!17553 () (_ BitVec 32))

(declare-fun mapRest!17553 () (Array (_ BitVec 32) ValueCell!4967))

(assert (=> mapNonEmpty!17553 (= (arr!12001 _values!549) (store mapRest!17553 mapKey!17553 mapValue!17553))))

(declare-fun b!413182 () Bool)

(assert (=> b!413182 (= e!247103 tp_is_empty!10621)))

(declare-fun b!413183 () Bool)

(declare-fun res!240090 () Bool)

(assert (=> b!413183 (=> (not res!240090) (not e!247107))))

(assert (=> b!413183 (= res!240090 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6843))))

(declare-fun b!413184 () Bool)

(assert (=> b!413184 (= e!247105 (= call!28573 call!28572))))

(declare-fun bm!28570 () Bool)

(assert (=> bm!28570 (= call!28572 (getCurrentListMapNoExtraKeys!1136 (ite c!54894 lt!189686 _keys!709) (ite c!54894 lt!189685 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413185 () Bool)

(declare-fun res!240088 () Bool)

(assert (=> b!413185 (=> (not res!240088) (not e!247107))))

(assert (=> b!413185 (= res!240088 (or (= (select (arr!12002 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12002 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39188 res!240081) b!413172))

(assert (= (and b!413172 res!240092) b!413179))

(assert (= (and b!413179 res!240091) b!413177))

(assert (= (and b!413177 res!240085) b!413183))

(assert (= (and b!413183 res!240090) b!413170))

(assert (= (and b!413170 res!240087) b!413176))

(assert (= (and b!413176 res!240093) b!413185))

(assert (= (and b!413185 res!240088) b!413169))

(assert (= (and b!413169 res!240082) b!413181))

(assert (= (and b!413181 res!240086) b!413180))

(assert (= (and b!413180 res!240089) b!413173))

(assert (= (and b!413173 res!240083) b!413175))

(assert (= (and b!413175 res!240084) b!413168))

(assert (= (and b!413168 c!54894) b!413178))

(assert (= (and b!413168 (not c!54894)) b!413184))

(assert (= (or b!413178 b!413184) bm!28570))

(assert (= (or b!413178 b!413184) bm!28569))

(assert (= (and b!413171 condMapEmpty!17553) mapIsEmpty!17553))

(assert (= (and b!413171 (not condMapEmpty!17553)) mapNonEmpty!17553))

(get-info :version)

(assert (= (and mapNonEmpty!17553 ((_ is ValueCellFull!4967) mapValue!17553)) b!413182))

(assert (= (and b!413171 ((_ is ValueCellFull!4967) mapDefault!17553)) b!413174))

(assert (= start!39188 b!413171))

(declare-fun m!403011 () Bool)

(assert (=> b!413176 m!403011))

(declare-fun m!403013 () Bool)

(assert (=> b!413185 m!403013))

(declare-fun m!403015 () Bool)

(assert (=> b!413183 m!403015))

(declare-fun m!403017 () Bool)

(assert (=> b!413178 m!403017))

(declare-fun m!403019 () Bool)

(assert (=> start!39188 m!403019))

(declare-fun m!403021 () Bool)

(assert (=> start!39188 m!403021))

(declare-fun m!403023 () Bool)

(assert (=> b!413169 m!403023))

(declare-fun m!403025 () Bool)

(assert (=> b!413175 m!403025))

(declare-fun m!403027 () Bool)

(assert (=> b!413175 m!403027))

(declare-fun m!403029 () Bool)

(assert (=> b!413175 m!403029))

(declare-fun m!403031 () Bool)

(assert (=> b!413168 m!403031))

(declare-fun m!403033 () Bool)

(assert (=> mapNonEmpty!17553 m!403033))

(declare-fun m!403035 () Bool)

(assert (=> bm!28569 m!403035))

(declare-fun m!403037 () Bool)

(assert (=> b!413181 m!403037))

(declare-fun m!403039 () Bool)

(assert (=> b!413181 m!403039))

(declare-fun m!403041 () Bool)

(assert (=> b!413172 m!403041))

(declare-fun m!403043 () Bool)

(assert (=> b!413177 m!403043))

(declare-fun m!403045 () Bool)

(assert (=> bm!28570 m!403045))

(declare-fun m!403047 () Bool)

(assert (=> b!413180 m!403047))

(check-sat (not bm!28569) (not b!413181) (not mapNonEmpty!17553) (not b!413176) (not b_next!9469) (not b!413180) (not b!413177) (not bm!28570) (not start!39188) (not b!413172) (not b!413168) tp_is_empty!10621 b_and!16869 (not b!413178) (not b!413183) (not b!413175) (not b!413169))
(check-sat b_and!16869 (not b_next!9469))
