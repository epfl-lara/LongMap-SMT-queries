; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39596 () Bool)

(assert start!39596)

(declare-fun b_free!9877 () Bool)

(declare-fun b_next!9877 () Bool)

(assert (=> start!39596 (= b_free!9877 (not b_next!9877))))

(declare-fun tp!35159 () Bool)

(declare-fun b_and!17507 () Bool)

(assert (=> start!39596 (= tp!35159 b_and!17507)))

(declare-fun b!424208 () Bool)

(declare-fun res!248180 () Bool)

(declare-fun e!251980 () Bool)

(assert (=> b!424208 (=> (not res!248180) (not e!251980))))

(declare-datatypes ((array!25887 0))(
  ( (array!25888 (arr!12393 (Array (_ BitVec 32) (_ BitVec 64))) (size!12746 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25887)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!424208 (= res!248180 (or (= (select (arr!12393 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12393 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!248186 () Bool)

(assert (=> start!39596 (=> (not res!248186) (not e!251980))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39596 (= res!248186 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12746 _keys!709))))))

(assert (=> start!39596 e!251980))

(declare-fun tp_is_empty!11029 () Bool)

(assert (=> start!39596 tp_is_empty!11029))

(assert (=> start!39596 tp!35159))

(assert (=> start!39596 true))

(declare-datatypes ((V!15811 0))(
  ( (V!15812 (val!5559 Int)) )
))
(declare-datatypes ((ValueCell!5171 0))(
  ( (ValueCellFull!5171 (v!7800 V!15811)) (EmptyCell!5171) )
))
(declare-datatypes ((array!25889 0))(
  ( (array!25890 (arr!12394 (Array (_ BitVec 32) ValueCell!5171)) (size!12747 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25889)

(declare-fun e!251981 () Bool)

(declare-fun array_inv!9062 (array!25889) Bool)

(assert (=> start!39596 (and (array_inv!9062 _values!549) e!251981)))

(declare-fun array_inv!9063 (array!25887) Bool)

(assert (=> start!39596 (array_inv!9063 _keys!709)))

(declare-fun b!424209 () Bool)

(declare-fun e!251979 () Bool)

(assert (=> b!424209 (= e!251979 false)))

(declare-fun minValue!515 () V!15811)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15811)

(declare-fun lt!194142 () array!25887)

(declare-fun v!412 () V!15811)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7286 0))(
  ( (tuple2!7287 (_1!3654 (_ BitVec 64)) (_2!3654 V!15811)) )
))
(declare-datatypes ((List!7283 0))(
  ( (Nil!7280) (Cons!7279 (h!8135 tuple2!7286) (t!12718 List!7283)) )
))
(declare-datatypes ((ListLongMap!6189 0))(
  ( (ListLongMap!6190 (toList!3110 List!7283)) )
))
(declare-fun lt!194143 () ListLongMap!6189)

(declare-fun getCurrentListMapNoExtraKeys!1318 (array!25887 array!25889 (_ BitVec 32) (_ BitVec 32) V!15811 V!15811 (_ BitVec 32) Int) ListLongMap!6189)

(assert (=> b!424209 (= lt!194143 (getCurrentListMapNoExtraKeys!1318 lt!194142 (array!25890 (store (arr!12394 _values!549) i!563 (ValueCellFull!5171 v!412)) (size!12747 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194144 () ListLongMap!6189)

(assert (=> b!424209 (= lt!194144 (getCurrentListMapNoExtraKeys!1318 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!18165 () Bool)

(declare-fun mapRes!18165 () Bool)

(assert (=> mapIsEmpty!18165 mapRes!18165))

(declare-fun b!424210 () Bool)

(assert (=> b!424210 (= e!251980 e!251979)))

(declare-fun res!248182 () Bool)

(assert (=> b!424210 (=> (not res!248182) (not e!251979))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25887 (_ BitVec 32)) Bool)

(assert (=> b!424210 (= res!248182 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194142 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!424210 (= lt!194142 (array!25888 (store (arr!12393 _keys!709) i!563 k0!794) (size!12746 _keys!709)))))

(declare-fun b!424211 () Bool)

(declare-fun res!248189 () Bool)

(assert (=> b!424211 (=> (not res!248189) (not e!251980))))

(assert (=> b!424211 (= res!248189 (and (= (size!12747 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12746 _keys!709) (size!12747 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!424212 () Bool)

(declare-fun res!248185 () Bool)

(assert (=> b!424212 (=> (not res!248185) (not e!251980))))

(declare-fun arrayContainsKey!0 (array!25887 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!424212 (= res!248185 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!424213 () Bool)

(declare-fun e!251982 () Bool)

(assert (=> b!424213 (= e!251982 tp_is_empty!11029)))

(declare-fun b!424214 () Bool)

(declare-fun res!248179 () Bool)

(assert (=> b!424214 (=> (not res!248179) (not e!251980))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!424214 (= res!248179 (validKeyInArray!0 k0!794))))

(declare-fun b!424215 () Bool)

(declare-fun res!248190 () Bool)

(assert (=> b!424215 (=> (not res!248190) (not e!251979))))

(assert (=> b!424215 (= res!248190 (bvsle from!863 i!563))))

(declare-fun b!424216 () Bool)

(assert (=> b!424216 (= e!251981 (and e!251982 mapRes!18165))))

(declare-fun condMapEmpty!18165 () Bool)

(declare-fun mapDefault!18165 () ValueCell!5171)

(assert (=> b!424216 (= condMapEmpty!18165 (= (arr!12394 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5171)) mapDefault!18165)))))

(declare-fun b!424217 () Bool)

(declare-fun res!248183 () Bool)

(assert (=> b!424217 (=> (not res!248183) (not e!251980))))

(declare-datatypes ((List!7284 0))(
  ( (Nil!7281) (Cons!7280 (h!8136 (_ BitVec 64)) (t!12719 List!7284)) )
))
(declare-fun arrayNoDuplicates!0 (array!25887 (_ BitVec 32) List!7284) Bool)

(assert (=> b!424217 (= res!248183 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7281))))

(declare-fun b!424218 () Bool)

(declare-fun res!248184 () Bool)

(assert (=> b!424218 (=> (not res!248184) (not e!251979))))

(assert (=> b!424218 (= res!248184 (arrayNoDuplicates!0 lt!194142 #b00000000000000000000000000000000 Nil!7281))))

(declare-fun b!424219 () Bool)

(declare-fun res!248181 () Bool)

(assert (=> b!424219 (=> (not res!248181) (not e!251980))))

(assert (=> b!424219 (= res!248181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!424220 () Bool)

(declare-fun res!248188 () Bool)

(assert (=> b!424220 (=> (not res!248188) (not e!251980))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!424220 (= res!248188 (validMask!0 mask!1025))))

(declare-fun b!424221 () Bool)

(declare-fun e!251978 () Bool)

(assert (=> b!424221 (= e!251978 tp_is_empty!11029)))

(declare-fun mapNonEmpty!18165 () Bool)

(declare-fun tp!35160 () Bool)

(assert (=> mapNonEmpty!18165 (= mapRes!18165 (and tp!35160 e!251978))))

(declare-fun mapRest!18165 () (Array (_ BitVec 32) ValueCell!5171))

(declare-fun mapValue!18165 () ValueCell!5171)

(declare-fun mapKey!18165 () (_ BitVec 32))

(assert (=> mapNonEmpty!18165 (= (arr!12394 _values!549) (store mapRest!18165 mapKey!18165 mapValue!18165))))

(declare-fun b!424222 () Bool)

(declare-fun res!248187 () Bool)

(assert (=> b!424222 (=> (not res!248187) (not e!251980))))

(assert (=> b!424222 (= res!248187 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12746 _keys!709))))))

(assert (= (and start!39596 res!248186) b!424220))

(assert (= (and b!424220 res!248188) b!424211))

(assert (= (and b!424211 res!248189) b!424219))

(assert (= (and b!424219 res!248181) b!424217))

(assert (= (and b!424217 res!248183) b!424222))

(assert (= (and b!424222 res!248187) b!424214))

(assert (= (and b!424214 res!248179) b!424208))

(assert (= (and b!424208 res!248180) b!424212))

(assert (= (and b!424212 res!248185) b!424210))

(assert (= (and b!424210 res!248182) b!424218))

(assert (= (and b!424218 res!248184) b!424215))

(assert (= (and b!424215 res!248190) b!424209))

(assert (= (and b!424216 condMapEmpty!18165) mapIsEmpty!18165))

(assert (= (and b!424216 (not condMapEmpty!18165)) mapNonEmpty!18165))

(get-info :version)

(assert (= (and mapNonEmpty!18165 ((_ is ValueCellFull!5171) mapValue!18165)) b!424221))

(assert (= (and b!424216 ((_ is ValueCellFull!5171) mapDefault!18165)) b!424213))

(assert (= start!39596 b!424216))

(declare-fun m!412881 () Bool)

(assert (=> b!424218 m!412881))

(declare-fun m!412883 () Bool)

(assert (=> b!424217 m!412883))

(declare-fun m!412885 () Bool)

(assert (=> b!424208 m!412885))

(declare-fun m!412887 () Bool)

(assert (=> b!424212 m!412887))

(declare-fun m!412889 () Bool)

(assert (=> b!424220 m!412889))

(declare-fun m!412891 () Bool)

(assert (=> mapNonEmpty!18165 m!412891))

(declare-fun m!412893 () Bool)

(assert (=> b!424219 m!412893))

(declare-fun m!412895 () Bool)

(assert (=> b!424214 m!412895))

(declare-fun m!412897 () Bool)

(assert (=> start!39596 m!412897))

(declare-fun m!412899 () Bool)

(assert (=> start!39596 m!412899))

(declare-fun m!412901 () Bool)

(assert (=> b!424210 m!412901))

(declare-fun m!412903 () Bool)

(assert (=> b!424210 m!412903))

(declare-fun m!412905 () Bool)

(assert (=> b!424209 m!412905))

(declare-fun m!412907 () Bool)

(assert (=> b!424209 m!412907))

(declare-fun m!412909 () Bool)

(assert (=> b!424209 m!412909))

(check-sat b_and!17507 (not b!424217) (not b_next!9877) (not mapNonEmpty!18165) (not start!39596) (not b!424214) (not b!424219) (not b!424209) (not b!424218) (not b!424210) (not b!424212) tp_is_empty!11029 (not b!424220))
(check-sat b_and!17507 (not b_next!9877))
