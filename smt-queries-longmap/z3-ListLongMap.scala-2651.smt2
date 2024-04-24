; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39710 () Bool)

(assert start!39710)

(declare-fun b_free!9991 () Bool)

(declare-fun b_next!9991 () Bool)

(assert (=> start!39710 (= b_free!9991 (not b_next!9991))))

(declare-fun tp!35501 () Bool)

(declare-fun b_and!17661 () Bool)

(assert (=> start!39710 (= tp!35501 b_and!17661)))

(declare-fun b!427152 () Bool)

(declare-fun res!250514 () Bool)

(declare-fun e!253303 () Bool)

(assert (=> b!427152 (=> (not res!250514) (not e!253303))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427152 (= res!250514 (validMask!0 mask!1025))))

(declare-fun b!427153 () Bool)

(declare-fun res!250521 () Bool)

(assert (=> b!427153 (=> (not res!250521) (not e!253303))))

(declare-datatypes ((array!26132 0))(
  ( (array!26133 (arr!12515 (Array (_ BitVec 32) (_ BitVec 64))) (size!12867 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26132)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15963 0))(
  ( (V!15964 (val!5616 Int)) )
))
(declare-datatypes ((ValueCell!5228 0))(
  ( (ValueCellFull!5228 (v!7864 V!15963)) (EmptyCell!5228) )
))
(declare-datatypes ((array!26134 0))(
  ( (array!26135 (arr!12516 (Array (_ BitVec 32) ValueCell!5228)) (size!12868 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26134)

(assert (=> b!427153 (= res!250521 (and (= (size!12868 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12867 _keys!709) (size!12868 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427154 () Bool)

(declare-fun e!253308 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!427154 (= e!253308 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!12867 _keys!709))))))

(declare-fun b!427155 () Bool)

(declare-fun res!250525 () Bool)

(assert (=> b!427155 (=> (not res!250525) (not e!253303))))

(declare-datatypes ((List!7285 0))(
  ( (Nil!7282) (Cons!7281 (h!8137 (_ BitVec 64)) (t!12721 List!7285)) )
))
(declare-fun arrayNoDuplicates!0 (array!26132 (_ BitVec 32) List!7285) Bool)

(assert (=> b!427155 (= res!250525 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7282))))

(declare-fun b!427156 () Bool)

(declare-fun e!253309 () Bool)

(assert (=> b!427156 (= e!253303 e!253309)))

(declare-fun res!250519 () Bool)

(assert (=> b!427156 (=> (not res!250519) (not e!253309))))

(declare-fun lt!195218 () array!26132)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26132 (_ BitVec 32)) Bool)

(assert (=> b!427156 (= res!250519 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195218 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427156 (= lt!195218 (array!26133 (store (arr!12515 _keys!709) i!563 k0!794) (size!12867 _keys!709)))))

(declare-fun b!427157 () Bool)

(declare-fun res!250520 () Bool)

(assert (=> b!427157 (=> (not res!250520) (not e!253309))))

(assert (=> b!427157 (= res!250520 (arrayNoDuplicates!0 lt!195218 #b00000000000000000000000000000000 Nil!7282))))

(declare-fun res!250515 () Bool)

(assert (=> start!39710 (=> (not res!250515) (not e!253303))))

(assert (=> start!39710 (= res!250515 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12867 _keys!709))))))

(assert (=> start!39710 e!253303))

(declare-fun tp_is_empty!11143 () Bool)

(assert (=> start!39710 tp_is_empty!11143))

(assert (=> start!39710 tp!35501))

(assert (=> start!39710 true))

(declare-fun e!253306 () Bool)

(declare-fun array_inv!9184 (array!26134) Bool)

(assert (=> start!39710 (and (array_inv!9184 _values!549) e!253306)))

(declare-fun array_inv!9185 (array!26132) Bool)

(assert (=> start!39710 (array_inv!9185 _keys!709)))

(declare-fun b!427158 () Bool)

(declare-fun e!253307 () Bool)

(assert (=> b!427158 (= e!253309 e!253307)))

(declare-fun res!250523 () Bool)

(assert (=> b!427158 (=> (not res!250523) (not e!253307))))

(assert (=> b!427158 (= res!250523 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!15963)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15963)

(declare-datatypes ((tuple2!7282 0))(
  ( (tuple2!7283 (_1!3652 (_ BitVec 64)) (_2!3652 V!15963)) )
))
(declare-datatypes ((List!7286 0))(
  ( (Nil!7283) (Cons!7282 (h!8138 tuple2!7282) (t!12722 List!7286)) )
))
(declare-datatypes ((ListLongMap!6197 0))(
  ( (ListLongMap!6198 (toList!3114 List!7286)) )
))
(declare-fun lt!195219 () ListLongMap!6197)

(declare-fun lt!195222 () array!26134)

(declare-fun getCurrentListMapNoExtraKeys!1360 (array!26132 array!26134 (_ BitVec 32) (_ BitVec 32) V!15963 V!15963 (_ BitVec 32) Int) ListLongMap!6197)

(assert (=> b!427158 (= lt!195219 (getCurrentListMapNoExtraKeys!1360 lt!195218 lt!195222 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15963)

(assert (=> b!427158 (= lt!195222 (array!26135 (store (arr!12516 _values!549) i!563 (ValueCellFull!5228 v!412)) (size!12868 _values!549)))))

(declare-fun lt!195220 () ListLongMap!6197)

(assert (=> b!427158 (= lt!195220 (getCurrentListMapNoExtraKeys!1360 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18336 () Bool)

(declare-fun mapRes!18336 () Bool)

(assert (=> mapIsEmpty!18336 mapRes!18336))

(declare-fun b!427159 () Bool)

(declare-fun e!253304 () Bool)

(assert (=> b!427159 (= e!253304 tp_is_empty!11143)))

(declare-fun b!427160 () Bool)

(assert (=> b!427160 (= e!253306 (and e!253304 mapRes!18336))))

(declare-fun condMapEmpty!18336 () Bool)

(declare-fun mapDefault!18336 () ValueCell!5228)

(assert (=> b!427160 (= condMapEmpty!18336 (= (arr!12516 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5228)) mapDefault!18336)))))

(declare-fun b!427161 () Bool)

(declare-fun e!253305 () Bool)

(assert (=> b!427161 (= e!253305 tp_is_empty!11143)))

(declare-fun b!427162 () Bool)

(declare-fun res!250517 () Bool)

(assert (=> b!427162 (=> (not res!250517) (not e!253303))))

(declare-fun arrayContainsKey!0 (array!26132 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427162 (= res!250517 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!427163 () Bool)

(assert (=> b!427163 (= e!253307 (not e!253308))))

(declare-fun res!250518 () Bool)

(assert (=> b!427163 (=> res!250518 e!253308)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427163 (= res!250518 (not (validKeyInArray!0 (select (arr!12515 _keys!709) from!863))))))

(declare-fun +!1327 (ListLongMap!6197 tuple2!7282) ListLongMap!6197)

(assert (=> b!427163 (= (getCurrentListMapNoExtraKeys!1360 lt!195218 lt!195222 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1327 (getCurrentListMapNoExtraKeys!1360 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7283 k0!794 v!412)))))

(declare-datatypes ((Unit!12529 0))(
  ( (Unit!12530) )
))
(declare-fun lt!195221 () Unit!12529)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!511 (array!26132 array!26134 (_ BitVec 32) (_ BitVec 32) V!15963 V!15963 (_ BitVec 32) (_ BitVec 64) V!15963 (_ BitVec 32) Int) Unit!12529)

(assert (=> b!427163 (= lt!195221 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!511 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427164 () Bool)

(declare-fun res!250522 () Bool)

(assert (=> b!427164 (=> (not res!250522) (not e!253303))))

(assert (=> b!427164 (= res!250522 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12867 _keys!709))))))

(declare-fun b!427165 () Bool)

(declare-fun res!250527 () Bool)

(assert (=> b!427165 (=> (not res!250527) (not e!253303))))

(assert (=> b!427165 (= res!250527 (validKeyInArray!0 k0!794))))

(declare-fun b!427166 () Bool)

(declare-fun res!250516 () Bool)

(assert (=> b!427166 (=> (not res!250516) (not e!253303))))

(assert (=> b!427166 (= res!250516 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18336 () Bool)

(declare-fun tp!35502 () Bool)

(assert (=> mapNonEmpty!18336 (= mapRes!18336 (and tp!35502 e!253305))))

(declare-fun mapKey!18336 () (_ BitVec 32))

(declare-fun mapRest!18336 () (Array (_ BitVec 32) ValueCell!5228))

(declare-fun mapValue!18336 () ValueCell!5228)

(assert (=> mapNonEmpty!18336 (= (arr!12516 _values!549) (store mapRest!18336 mapKey!18336 mapValue!18336))))

(declare-fun b!427167 () Bool)

(declare-fun res!250524 () Bool)

(assert (=> b!427167 (=> (not res!250524) (not e!253303))))

(assert (=> b!427167 (= res!250524 (or (= (select (arr!12515 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12515 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427168 () Bool)

(declare-fun res!250526 () Bool)

(assert (=> b!427168 (=> (not res!250526) (not e!253309))))

(assert (=> b!427168 (= res!250526 (bvsle from!863 i!563))))

(assert (= (and start!39710 res!250515) b!427152))

(assert (= (and b!427152 res!250514) b!427153))

(assert (= (and b!427153 res!250521) b!427166))

(assert (= (and b!427166 res!250516) b!427155))

(assert (= (and b!427155 res!250525) b!427164))

(assert (= (and b!427164 res!250522) b!427165))

(assert (= (and b!427165 res!250527) b!427167))

(assert (= (and b!427167 res!250524) b!427162))

(assert (= (and b!427162 res!250517) b!427156))

(assert (= (and b!427156 res!250519) b!427157))

(assert (= (and b!427157 res!250520) b!427168))

(assert (= (and b!427168 res!250526) b!427158))

(assert (= (and b!427158 res!250523) b!427163))

(assert (= (and b!427163 (not res!250518)) b!427154))

(assert (= (and b!427160 condMapEmpty!18336) mapIsEmpty!18336))

(assert (= (and b!427160 (not condMapEmpty!18336)) mapNonEmpty!18336))

(get-info :version)

(assert (= (and mapNonEmpty!18336 ((_ is ValueCellFull!5228) mapValue!18336)) b!427161))

(assert (= (and b!427160 ((_ is ValueCellFull!5228) mapDefault!18336)) b!427159))

(assert (= start!39710 b!427160))

(declare-fun m!415949 () Bool)

(assert (=> mapNonEmpty!18336 m!415949))

(declare-fun m!415951 () Bool)

(assert (=> b!427156 m!415951))

(declare-fun m!415953 () Bool)

(assert (=> b!427156 m!415953))

(declare-fun m!415955 () Bool)

(assert (=> b!427167 m!415955))

(declare-fun m!415957 () Bool)

(assert (=> b!427152 m!415957))

(declare-fun m!415959 () Bool)

(assert (=> b!427157 m!415959))

(declare-fun m!415961 () Bool)

(assert (=> b!427166 m!415961))

(declare-fun m!415963 () Bool)

(assert (=> b!427162 m!415963))

(declare-fun m!415965 () Bool)

(assert (=> start!39710 m!415965))

(declare-fun m!415967 () Bool)

(assert (=> start!39710 m!415967))

(declare-fun m!415969 () Bool)

(assert (=> b!427158 m!415969))

(declare-fun m!415971 () Bool)

(assert (=> b!427158 m!415971))

(declare-fun m!415973 () Bool)

(assert (=> b!427158 m!415973))

(declare-fun m!415975 () Bool)

(assert (=> b!427155 m!415975))

(declare-fun m!415977 () Bool)

(assert (=> b!427165 m!415977))

(declare-fun m!415979 () Bool)

(assert (=> b!427163 m!415979))

(declare-fun m!415981 () Bool)

(assert (=> b!427163 m!415981))

(declare-fun m!415983 () Bool)

(assert (=> b!427163 m!415983))

(assert (=> b!427163 m!415981))

(declare-fun m!415985 () Bool)

(assert (=> b!427163 m!415985))

(assert (=> b!427163 m!415979))

(declare-fun m!415987 () Bool)

(assert (=> b!427163 m!415987))

(declare-fun m!415989 () Bool)

(assert (=> b!427163 m!415989))

(check-sat (not b_next!9991) tp_is_empty!11143 (not b!427165) (not start!39710) (not b!427152) (not b!427162) (not b!427155) (not b!427166) (not b!427163) (not b!427158) (not b!427156) b_and!17661 (not b!427157) (not mapNonEmpty!18336))
(check-sat b_and!17661 (not b_next!9991))
