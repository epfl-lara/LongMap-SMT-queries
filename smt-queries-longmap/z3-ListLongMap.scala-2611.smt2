; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39470 () Bool)

(assert start!39470)

(declare-fun b_free!9751 () Bool)

(declare-fun b_next!9751 () Bool)

(assert (=> start!39470 (= b_free!9751 (not b_next!9751))))

(declare-fun tp!34782 () Bool)

(declare-fun b_and!17351 () Bool)

(assert (=> start!39470 (= tp!34782 b_and!17351)))

(declare-fun b!421171 () Bool)

(declare-fun res!245833 () Bool)

(declare-fun e!250716 () Bool)

(assert (=> b!421171 (=> (not res!245833) (not e!250716))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!421171 (= res!245833 (validKeyInArray!0 k0!794))))

(declare-datatypes ((V!15643 0))(
  ( (V!15644 (val!5496 Int)) )
))
(declare-fun minValue!515 () V!15643)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((array!25639 0))(
  ( (array!25640 (arr!12269 (Array (_ BitVec 32) (_ BitVec 64))) (size!12622 (_ BitVec 32))) )
))
(declare-fun lt!193240 () array!25639)

(declare-datatypes ((tuple2!7194 0))(
  ( (tuple2!7195 (_1!3608 (_ BitVec 64)) (_2!3608 V!15643)) )
))
(declare-datatypes ((List!7187 0))(
  ( (Nil!7184) (Cons!7183 (h!8039 tuple2!7194) (t!12594 List!7187)) )
))
(declare-datatypes ((ListLongMap!6097 0))(
  ( (ListLongMap!6098 (toList!3064 List!7187)) )
))
(declare-fun call!29407 () ListLongMap!6097)

(declare-datatypes ((ValueCell!5108 0))(
  ( (ValueCellFull!5108 (v!7737 V!15643)) (EmptyCell!5108) )
))
(declare-datatypes ((array!25641 0))(
  ( (array!25642 (arr!12270 (Array (_ BitVec 32) ValueCell!5108)) (size!12623 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25641)

(declare-fun c!55269 () Bool)

(declare-fun lt!193235 () array!25641)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!25639)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun bm!29403 () Bool)

(declare-fun zeroValue!515 () V!15643)

(declare-fun getCurrentListMapNoExtraKeys!1274 (array!25639 array!25641 (_ BitVec 32) (_ BitVec 32) V!15643 V!15643 (_ BitVec 32) Int) ListLongMap!6097)

(assert (=> bm!29403 (= call!29407 (getCurrentListMapNoExtraKeys!1274 (ite c!55269 lt!193240 _keys!709) (ite c!55269 lt!193235 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421172 () Bool)

(declare-fun res!245829 () Bool)

(declare-fun e!250714 () Bool)

(assert (=> b!421172 (=> (not res!245829) (not e!250714))))

(declare-datatypes ((List!7188 0))(
  ( (Nil!7185) (Cons!7184 (h!8040 (_ BitVec 64)) (t!12595 List!7188)) )
))
(declare-fun arrayNoDuplicates!0 (array!25639 (_ BitVec 32) List!7188) Bool)

(assert (=> b!421172 (= res!245829 (arrayNoDuplicates!0 lt!193240 #b00000000000000000000000000000000 Nil!7185))))

(declare-fun b!421173 () Bool)

(declare-fun e!250715 () Bool)

(declare-fun e!250721 () Bool)

(assert (=> b!421173 (= e!250715 (not e!250721))))

(declare-fun res!245832 () Bool)

(assert (=> b!421173 (=> res!245832 e!250721)))

(assert (=> b!421173 (= res!245832 (validKeyInArray!0 (select (arr!12269 _keys!709) from!863)))))

(declare-fun e!250717 () Bool)

(assert (=> b!421173 e!250717))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!421173 (= c!55269 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12418 0))(
  ( (Unit!12419) )
))
(declare-fun lt!193238 () Unit!12418)

(declare-fun v!412 () V!15643)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!457 (array!25639 array!25641 (_ BitVec 32) (_ BitVec 32) V!15643 V!15643 (_ BitVec 32) (_ BitVec 64) V!15643 (_ BitVec 32) Int) Unit!12418)

(assert (=> b!421173 (= lt!193238 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!457 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421174 () Bool)

(assert (=> b!421174 (= e!250716 e!250714)))

(declare-fun res!245835 () Bool)

(assert (=> b!421174 (=> (not res!245835) (not e!250714))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25639 (_ BitVec 32)) Bool)

(assert (=> b!421174 (= res!245835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!193240 mask!1025))))

(assert (=> b!421174 (= lt!193240 (array!25640 (store (arr!12269 _keys!709) i!563 k0!794) (size!12622 _keys!709)))))

(declare-fun res!245838 () Bool)

(assert (=> start!39470 (=> (not res!245838) (not e!250716))))

(assert (=> start!39470 (= res!245838 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12622 _keys!709))))))

(assert (=> start!39470 e!250716))

(declare-fun tp_is_empty!10903 () Bool)

(assert (=> start!39470 tp_is_empty!10903))

(assert (=> start!39470 tp!34782))

(assert (=> start!39470 true))

(declare-fun e!250718 () Bool)

(declare-fun array_inv!8980 (array!25641) Bool)

(assert (=> start!39470 (and (array_inv!8980 _values!549) e!250718)))

(declare-fun array_inv!8981 (array!25639) Bool)

(assert (=> start!39470 (array_inv!8981 _keys!709)))

(declare-fun b!421175 () Bool)

(assert (=> b!421175 (= e!250721 true)))

(declare-fun lt!193233 () tuple2!7194)

(declare-fun lt!193231 () ListLongMap!6097)

(declare-fun lt!193239 () V!15643)

(declare-fun +!1284 (ListLongMap!6097 tuple2!7194) ListLongMap!6097)

(assert (=> b!421175 (= (+!1284 lt!193231 lt!193233) (+!1284 (+!1284 lt!193231 (tuple2!7195 k0!794 lt!193239)) lt!193233))))

(declare-fun lt!193241 () V!15643)

(assert (=> b!421175 (= lt!193233 (tuple2!7195 k0!794 lt!193241))))

(declare-fun lt!193232 () Unit!12418)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!68 (ListLongMap!6097 (_ BitVec 64) V!15643 V!15643) Unit!12418)

(assert (=> b!421175 (= lt!193232 (addSameAsAddTwiceSameKeyDiffValues!68 lt!193231 k0!794 lt!193239 lt!193241))))

(declare-fun lt!193236 () V!15643)

(declare-fun get!6093 (ValueCell!5108 V!15643) V!15643)

(assert (=> b!421175 (= lt!193239 (get!6093 (select (arr!12270 _values!549) from!863) lt!193236))))

(declare-fun lt!193237 () ListLongMap!6097)

(assert (=> b!421175 (= lt!193237 (+!1284 lt!193231 (tuple2!7195 (select (arr!12269 lt!193240) from!863) lt!193241)))))

(assert (=> b!421175 (= lt!193241 (get!6093 (select (store (arr!12270 _values!549) i!563 (ValueCellFull!5108 v!412)) from!863) lt!193236))))

(declare-fun dynLambda!725 (Int (_ BitVec 64)) V!15643)

(assert (=> b!421175 (= lt!193236 (dynLambda!725 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!421175 (= lt!193231 (getCurrentListMapNoExtraKeys!1274 lt!193240 lt!193235 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421176 () Bool)

(declare-fun res!245827 () Bool)

(assert (=> b!421176 (=> (not res!245827) (not e!250716))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!421176 (= res!245827 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!17976 () Bool)

(declare-fun mapRes!17976 () Bool)

(declare-fun tp!34781 () Bool)

(declare-fun e!250722 () Bool)

(assert (=> mapNonEmpty!17976 (= mapRes!17976 (and tp!34781 e!250722))))

(declare-fun mapValue!17976 () ValueCell!5108)

(declare-fun mapKey!17976 () (_ BitVec 32))

(declare-fun mapRest!17976 () (Array (_ BitVec 32) ValueCell!5108))

(assert (=> mapNonEmpty!17976 (= (arr!12270 _values!549) (store mapRest!17976 mapKey!17976 mapValue!17976))))

(declare-fun b!421177 () Bool)

(declare-fun call!29406 () ListLongMap!6097)

(assert (=> b!421177 (= e!250717 (= call!29406 call!29407))))

(declare-fun b!421178 () Bool)

(declare-fun res!245830 () Bool)

(assert (=> b!421178 (=> (not res!245830) (not e!250716))))

(assert (=> b!421178 (= res!245830 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12622 _keys!709))))))

(declare-fun b!421179 () Bool)

(declare-fun res!245828 () Bool)

(assert (=> b!421179 (=> (not res!245828) (not e!250714))))

(assert (=> b!421179 (= res!245828 (bvsle from!863 i!563))))

(declare-fun b!421180 () Bool)

(assert (=> b!421180 (= e!250714 e!250715)))

(declare-fun res!245826 () Bool)

(assert (=> b!421180 (=> (not res!245826) (not e!250715))))

(assert (=> b!421180 (= res!245826 (= from!863 i!563))))

(assert (=> b!421180 (= lt!193237 (getCurrentListMapNoExtraKeys!1274 lt!193240 lt!193235 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!421180 (= lt!193235 (array!25642 (store (arr!12270 _values!549) i!563 (ValueCellFull!5108 v!412)) (size!12623 _values!549)))))

(declare-fun lt!193234 () ListLongMap!6097)

(assert (=> b!421180 (= lt!193234 (getCurrentListMapNoExtraKeys!1274 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!29404 () Bool)

(assert (=> bm!29404 (= call!29406 (getCurrentListMapNoExtraKeys!1274 (ite c!55269 _keys!709 lt!193240) (ite c!55269 _values!549 lt!193235) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!421181 () Bool)

(declare-fun res!245831 () Bool)

(assert (=> b!421181 (=> (not res!245831) (not e!250716))))

(assert (=> b!421181 (= res!245831 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7185))))

(declare-fun b!421182 () Bool)

(declare-fun e!250720 () Bool)

(assert (=> b!421182 (= e!250718 (and e!250720 mapRes!17976))))

(declare-fun condMapEmpty!17976 () Bool)

(declare-fun mapDefault!17976 () ValueCell!5108)

(assert (=> b!421182 (= condMapEmpty!17976 (= (arr!12270 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5108)) mapDefault!17976)))))

(declare-fun mapIsEmpty!17976 () Bool)

(assert (=> mapIsEmpty!17976 mapRes!17976))

(declare-fun b!421183 () Bool)

(declare-fun res!245825 () Bool)

(assert (=> b!421183 (=> (not res!245825) (not e!250716))))

(assert (=> b!421183 (= res!245825 (and (= (size!12623 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12622 _keys!709) (size!12623 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!421184 () Bool)

(assert (=> b!421184 (= e!250717 (= call!29407 (+!1284 call!29406 (tuple2!7195 k0!794 v!412))))))

(declare-fun b!421185 () Bool)

(assert (=> b!421185 (= e!250722 tp_is_empty!10903)))

(declare-fun b!421186 () Bool)

(declare-fun res!245837 () Bool)

(assert (=> b!421186 (=> (not res!245837) (not e!250716))))

(assert (=> b!421186 (= res!245837 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!421187 () Bool)

(declare-fun res!245836 () Bool)

(assert (=> b!421187 (=> (not res!245836) (not e!250716))))

(declare-fun arrayContainsKey!0 (array!25639 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!421187 (= res!245836 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!421188 () Bool)

(assert (=> b!421188 (= e!250720 tp_is_empty!10903)))

(declare-fun b!421189 () Bool)

(declare-fun res!245834 () Bool)

(assert (=> b!421189 (=> (not res!245834) (not e!250716))))

(assert (=> b!421189 (= res!245834 (or (= (select (arr!12269 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12269 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!39470 res!245838) b!421176))

(assert (= (and b!421176 res!245827) b!421183))

(assert (= (and b!421183 res!245825) b!421186))

(assert (= (and b!421186 res!245837) b!421181))

(assert (= (and b!421181 res!245831) b!421178))

(assert (= (and b!421178 res!245830) b!421171))

(assert (= (and b!421171 res!245833) b!421189))

(assert (= (and b!421189 res!245834) b!421187))

(assert (= (and b!421187 res!245836) b!421174))

(assert (= (and b!421174 res!245835) b!421172))

(assert (= (and b!421172 res!245829) b!421179))

(assert (= (and b!421179 res!245828) b!421180))

(assert (= (and b!421180 res!245826) b!421173))

(assert (= (and b!421173 c!55269) b!421184))

(assert (= (and b!421173 (not c!55269)) b!421177))

(assert (= (or b!421184 b!421177) bm!29403))

(assert (= (or b!421184 b!421177) bm!29404))

(assert (= (and b!421173 (not res!245832)) b!421175))

(assert (= (and b!421182 condMapEmpty!17976) mapIsEmpty!17976))

(assert (= (and b!421182 (not condMapEmpty!17976)) mapNonEmpty!17976))

(get-info :version)

(assert (= (and mapNonEmpty!17976 ((_ is ValueCellFull!5108) mapValue!17976)) b!421185))

(assert (= (and b!421182 ((_ is ValueCellFull!5108) mapDefault!17976)) b!421188))

(assert (= start!39470 b!421182))

(declare-fun b_lambda!9037 () Bool)

(assert (=> (not b_lambda!9037) (not b!421175)))

(declare-fun t!12593 () Bool)

(declare-fun tb!3365 () Bool)

(assert (=> (and start!39470 (= defaultEntry!557 defaultEntry!557) t!12593) tb!3365))

(declare-fun result!6265 () Bool)

(assert (=> tb!3365 (= result!6265 tp_is_empty!10903)))

(assert (=> b!421175 t!12593))

(declare-fun b_and!17353 () Bool)

(assert (= b_and!17351 (and (=> t!12593 result!6265) b_and!17353)))

(declare-fun m!410451 () Bool)

(assert (=> b!421186 m!410451))

(declare-fun m!410453 () Bool)

(assert (=> b!421171 m!410453))

(declare-fun m!410455 () Bool)

(assert (=> b!421174 m!410455))

(declare-fun m!410457 () Bool)

(assert (=> b!421174 m!410457))

(declare-fun m!410459 () Bool)

(assert (=> b!421184 m!410459))

(declare-fun m!410461 () Bool)

(assert (=> b!421176 m!410461))

(declare-fun m!410463 () Bool)

(assert (=> b!421181 m!410463))

(declare-fun m!410465 () Bool)

(assert (=> start!39470 m!410465))

(declare-fun m!410467 () Bool)

(assert (=> start!39470 m!410467))

(declare-fun m!410469 () Bool)

(assert (=> b!421189 m!410469))

(declare-fun m!410471 () Bool)

(assert (=> b!421172 m!410471))

(declare-fun m!410473 () Bool)

(assert (=> bm!29404 m!410473))

(declare-fun m!410475 () Bool)

(assert (=> bm!29403 m!410475))

(declare-fun m!410477 () Bool)

(assert (=> b!421175 m!410477))

(declare-fun m!410479 () Bool)

(assert (=> b!421175 m!410479))

(declare-fun m!410481 () Bool)

(assert (=> b!421175 m!410481))

(declare-fun m!410483 () Bool)

(assert (=> b!421175 m!410483))

(declare-fun m!410485 () Bool)

(assert (=> b!421175 m!410485))

(declare-fun m!410487 () Bool)

(assert (=> b!421175 m!410487))

(declare-fun m!410489 () Bool)

(assert (=> b!421175 m!410489))

(declare-fun m!410491 () Bool)

(assert (=> b!421175 m!410491))

(declare-fun m!410493 () Bool)

(assert (=> b!421175 m!410493))

(declare-fun m!410495 () Bool)

(assert (=> b!421175 m!410495))

(assert (=> b!421175 m!410487))

(declare-fun m!410497 () Bool)

(assert (=> b!421175 m!410497))

(declare-fun m!410499 () Bool)

(assert (=> b!421175 m!410499))

(declare-fun m!410501 () Bool)

(assert (=> b!421175 m!410501))

(assert (=> b!421175 m!410493))

(assert (=> b!421175 m!410479))

(declare-fun m!410503 () Bool)

(assert (=> mapNonEmpty!17976 m!410503))

(declare-fun m!410505 () Bool)

(assert (=> b!421187 m!410505))

(declare-fun m!410507 () Bool)

(assert (=> b!421173 m!410507))

(assert (=> b!421173 m!410507))

(declare-fun m!410509 () Bool)

(assert (=> b!421173 m!410509))

(declare-fun m!410511 () Bool)

(assert (=> b!421173 m!410511))

(declare-fun m!410513 () Bool)

(assert (=> b!421180 m!410513))

(assert (=> b!421180 m!410485))

(declare-fun m!410515 () Bool)

(assert (=> b!421180 m!410515))

(check-sat (not b!421186) (not start!39470) (not b!421171) (not b!421176) (not bm!29403) (not b_lambda!9037) b_and!17353 (not b!421174) (not b!421180) (not b!421187) (not b!421175) (not b!421184) (not b!421172) (not b!421181) tp_is_empty!10903 (not bm!29404) (not b_next!9751) (not b!421173) (not mapNonEmpty!17976))
(check-sat b_and!17353 (not b_next!9751))
