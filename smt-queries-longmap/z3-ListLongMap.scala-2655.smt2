; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39750 () Bool)

(assert start!39750)

(declare-fun b_free!10017 () Bool)

(declare-fun b_next!10017 () Bool)

(assert (=> start!39750 (= b_free!10017 (not b_next!10017))))

(declare-fun tp!35580 () Bool)

(declare-fun b_and!17693 () Bool)

(assert (=> start!39750 (= tp!35580 b_and!17693)))

(declare-fun b!427884 () Bool)

(declare-fun e!253653 () Bool)

(declare-fun e!253650 () Bool)

(assert (=> b!427884 (= e!253653 e!253650)))

(declare-fun res!251074 () Bool)

(assert (=> b!427884 (=> (not res!251074) (not e!253650))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!427884 (= res!251074 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!15997 0))(
  ( (V!15998 (val!5629 Int)) )
))
(declare-fun minValue!515 () V!15997)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!15997)

(declare-datatypes ((ValueCell!5241 0))(
  ( (ValueCellFull!5241 (v!7876 V!15997)) (EmptyCell!5241) )
))
(declare-datatypes ((array!26175 0))(
  ( (array!26176 (arr!12537 (Array (_ BitVec 32) ValueCell!5241)) (size!12889 (_ BitVec 32))) )
))
(declare-fun lt!195497 () array!26175)

(declare-datatypes ((array!26177 0))(
  ( (array!26178 (arr!12538 (Array (_ BitVec 32) (_ BitVec 64))) (size!12890 (_ BitVec 32))) )
))
(declare-fun lt!195491 () array!26177)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((tuple2!7402 0))(
  ( (tuple2!7403 (_1!3712 (_ BitVec 64)) (_2!3712 V!15997)) )
))
(declare-datatypes ((List!7416 0))(
  ( (Nil!7413) (Cons!7412 (h!8268 tuple2!7402) (t!12882 List!7416)) )
))
(declare-datatypes ((ListLongMap!6315 0))(
  ( (ListLongMap!6316 (toList!3173 List!7416)) )
))
(declare-fun lt!195490 () ListLongMap!6315)

(declare-fun getCurrentListMapNoExtraKeys!1375 (array!26177 array!26175 (_ BitVec 32) (_ BitVec 32) V!15997 V!15997 (_ BitVec 32) Int) ListLongMap!6315)

(assert (=> b!427884 (= lt!195490 (getCurrentListMapNoExtraKeys!1375 lt!195491 lt!195497 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!26175)

(declare-fun v!412 () V!15997)

(assert (=> b!427884 (= lt!195497 (array!26176 (store (arr!12537 _values!549) i!563 (ValueCellFull!5241 v!412)) (size!12889 _values!549)))))

(declare-fun lt!195492 () ListLongMap!6315)

(declare-fun _keys!709 () array!26177)

(assert (=> b!427884 (= lt!195492 (getCurrentListMapNoExtraKeys!1375 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!427885 () Bool)

(declare-fun res!251066 () Bool)

(assert (=> b!427885 (=> (not res!251066) (not e!253653))))

(assert (=> b!427885 (= res!251066 (bvsle from!863 i!563))))

(declare-fun b!427886 () Bool)

(declare-fun res!251068 () Bool)

(declare-fun e!253652 () Bool)

(assert (=> b!427886 (=> (not res!251068) (not e!253652))))

(assert (=> b!427886 (= res!251068 (and (= (size!12889 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12890 _keys!709) (size!12889 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!427887 () Bool)

(assert (=> b!427887 (= e!253652 e!253653)))

(declare-fun res!251075 () Bool)

(assert (=> b!427887 (=> (not res!251075) (not e!253653))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26177 (_ BitVec 32)) Bool)

(assert (=> b!427887 (= res!251075 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195491 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!427887 (= lt!195491 (array!26178 (store (arr!12538 _keys!709) i!563 k0!794) (size!12890 _keys!709)))))

(declare-fun b!427888 () Bool)

(declare-fun e!253646 () Bool)

(assert (=> b!427888 (= e!253646 true)))

(declare-fun lt!195496 () ListLongMap!6315)

(declare-fun +!1328 (ListLongMap!6315 tuple2!7402) ListLongMap!6315)

(declare-fun get!6209 (ValueCell!5241 V!15997) V!15997)

(declare-fun dynLambda!756 (Int (_ BitVec 64)) V!15997)

(assert (=> b!427888 (= lt!195490 (+!1328 lt!195496 (tuple2!7403 (select (arr!12538 _keys!709) from!863) (get!6209 (select (arr!12537 _values!549) from!863) (dynLambda!756 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!427889 () Bool)

(declare-fun res!251070 () Bool)

(assert (=> b!427889 (=> (not res!251070) (not e!253652))))

(assert (=> b!427889 (= res!251070 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!427890 () Bool)

(declare-fun res!251065 () Bool)

(assert (=> b!427890 (=> (not res!251065) (not e!253652))))

(declare-fun arrayContainsKey!0 (array!26177 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!427890 (= res!251065 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18375 () Bool)

(declare-fun mapRes!18375 () Bool)

(assert (=> mapIsEmpty!18375 mapRes!18375))

(declare-fun mapNonEmpty!18375 () Bool)

(declare-fun tp!35579 () Bool)

(declare-fun e!253649 () Bool)

(assert (=> mapNonEmpty!18375 (= mapRes!18375 (and tp!35579 e!253649))))

(declare-fun mapValue!18375 () ValueCell!5241)

(declare-fun mapKey!18375 () (_ BitVec 32))

(declare-fun mapRest!18375 () (Array (_ BitVec 32) ValueCell!5241))

(assert (=> mapNonEmpty!18375 (= (arr!12537 _values!549) (store mapRest!18375 mapKey!18375 mapValue!18375))))

(declare-fun b!427891 () Bool)

(declare-fun res!251076 () Bool)

(assert (=> b!427891 (=> (not res!251076) (not e!253652))))

(declare-datatypes ((List!7417 0))(
  ( (Nil!7414) (Cons!7413 (h!8269 (_ BitVec 64)) (t!12883 List!7417)) )
))
(declare-fun arrayNoDuplicates!0 (array!26177 (_ BitVec 32) List!7417) Bool)

(assert (=> b!427891 (= res!251076 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7414))))

(declare-fun b!427892 () Bool)

(declare-fun tp_is_empty!11169 () Bool)

(assert (=> b!427892 (= e!253649 tp_is_empty!11169)))

(declare-fun b!427893 () Bool)

(declare-fun res!251072 () Bool)

(assert (=> b!427893 (=> (not res!251072) (not e!253652))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!427893 (= res!251072 (validMask!0 mask!1025))))

(declare-fun b!427894 () Bool)

(assert (=> b!427894 (= e!253650 (not e!253646))))

(declare-fun res!251067 () Bool)

(assert (=> b!427894 (=> res!251067 e!253646)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!427894 (= res!251067 (not (validKeyInArray!0 (select (arr!12538 _keys!709) from!863))))))

(declare-fun lt!195495 () ListLongMap!6315)

(assert (=> b!427894 (= lt!195495 lt!195496)))

(declare-fun lt!195494 () ListLongMap!6315)

(assert (=> b!427894 (= lt!195496 (+!1328 lt!195494 (tuple2!7403 k0!794 v!412)))))

(assert (=> b!427894 (= lt!195495 (getCurrentListMapNoExtraKeys!1375 lt!195491 lt!195497 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!427894 (= lt!195494 (getCurrentListMapNoExtraKeys!1375 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12552 0))(
  ( (Unit!12553) )
))
(declare-fun lt!195493 () Unit!12552)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!520 (array!26177 array!26175 (_ BitVec 32) (_ BitVec 32) V!15997 V!15997 (_ BitVec 32) (_ BitVec 64) V!15997 (_ BitVec 32) Int) Unit!12552)

(assert (=> b!427894 (= lt!195493 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!520 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!427895 () Bool)

(declare-fun res!251064 () Bool)

(assert (=> b!427895 (=> (not res!251064) (not e!253653))))

(assert (=> b!427895 (= res!251064 (arrayNoDuplicates!0 lt!195491 #b00000000000000000000000000000000 Nil!7414))))

(declare-fun b!427896 () Bool)

(declare-fun e!253647 () Bool)

(assert (=> b!427896 (= e!253647 tp_is_empty!11169)))

(declare-fun b!427897 () Bool)

(declare-fun e!253648 () Bool)

(assert (=> b!427897 (= e!253648 (and e!253647 mapRes!18375))))

(declare-fun condMapEmpty!18375 () Bool)

(declare-fun mapDefault!18375 () ValueCell!5241)

(assert (=> b!427897 (= condMapEmpty!18375 (= (arr!12537 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5241)) mapDefault!18375)))))

(declare-fun b!427898 () Bool)

(declare-fun res!251069 () Bool)

(assert (=> b!427898 (=> (not res!251069) (not e!253652))))

(assert (=> b!427898 (= res!251069 (validKeyInArray!0 k0!794))))

(declare-fun b!427899 () Bool)

(declare-fun res!251073 () Bool)

(assert (=> b!427899 (=> (not res!251073) (not e!253652))))

(assert (=> b!427899 (= res!251073 (or (= (select (arr!12538 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12538 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!427900 () Bool)

(declare-fun res!251063 () Bool)

(assert (=> b!427900 (=> (not res!251063) (not e!253652))))

(assert (=> b!427900 (= res!251063 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12890 _keys!709))))))

(declare-fun res!251071 () Bool)

(assert (=> start!39750 (=> (not res!251071) (not e!253652))))

(assert (=> start!39750 (= res!251071 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12890 _keys!709))))))

(assert (=> start!39750 e!253652))

(assert (=> start!39750 tp_is_empty!11169))

(assert (=> start!39750 tp!35580))

(assert (=> start!39750 true))

(declare-fun array_inv!9138 (array!26175) Bool)

(assert (=> start!39750 (and (array_inv!9138 _values!549) e!253648)))

(declare-fun array_inv!9139 (array!26177) Bool)

(assert (=> start!39750 (array_inv!9139 _keys!709)))

(assert (= (and start!39750 res!251071) b!427893))

(assert (= (and b!427893 res!251072) b!427886))

(assert (= (and b!427886 res!251068) b!427889))

(assert (= (and b!427889 res!251070) b!427891))

(assert (= (and b!427891 res!251076) b!427900))

(assert (= (and b!427900 res!251063) b!427898))

(assert (= (and b!427898 res!251069) b!427899))

(assert (= (and b!427899 res!251073) b!427890))

(assert (= (and b!427890 res!251065) b!427887))

(assert (= (and b!427887 res!251075) b!427895))

(assert (= (and b!427895 res!251064) b!427885))

(assert (= (and b!427885 res!251066) b!427884))

(assert (= (and b!427884 res!251074) b!427894))

(assert (= (and b!427894 (not res!251067)) b!427888))

(assert (= (and b!427897 condMapEmpty!18375) mapIsEmpty!18375))

(assert (= (and b!427897 (not condMapEmpty!18375)) mapNonEmpty!18375))

(get-info :version)

(assert (= (and mapNonEmpty!18375 ((_ is ValueCellFull!5241) mapValue!18375)) b!427892))

(assert (= (and b!427897 ((_ is ValueCellFull!5241) mapDefault!18375)) b!427896))

(assert (= start!39750 b!427897))

(declare-fun b_lambda!9105 () Bool)

(assert (=> (not b_lambda!9105) (not b!427888)))

(declare-fun t!12881 () Bool)

(declare-fun tb!3423 () Bool)

(assert (=> (and start!39750 (= defaultEntry!557 defaultEntry!557) t!12881) tb!3423))

(declare-fun result!6373 () Bool)

(assert (=> tb!3423 (= result!6373 tp_is_empty!11169)))

(assert (=> b!427888 t!12881))

(declare-fun b_and!17695 () Bool)

(assert (= b_and!17693 (and (=> t!12881 result!6373) b_and!17695)))

(declare-fun m!416357 () Bool)

(assert (=> b!427887 m!416357))

(declare-fun m!416359 () Bool)

(assert (=> b!427887 m!416359))

(declare-fun m!416361 () Bool)

(assert (=> b!427894 m!416361))

(declare-fun m!416363 () Bool)

(assert (=> b!427894 m!416363))

(declare-fun m!416365 () Bool)

(assert (=> b!427894 m!416365))

(assert (=> b!427894 m!416361))

(declare-fun m!416367 () Bool)

(assert (=> b!427894 m!416367))

(declare-fun m!416369 () Bool)

(assert (=> b!427894 m!416369))

(declare-fun m!416371 () Bool)

(assert (=> b!427894 m!416371))

(assert (=> b!427888 m!416361))

(declare-fun m!416373 () Bool)

(assert (=> b!427888 m!416373))

(declare-fun m!416375 () Bool)

(assert (=> b!427888 m!416375))

(declare-fun m!416377 () Bool)

(assert (=> b!427888 m!416377))

(assert (=> b!427888 m!416375))

(assert (=> b!427888 m!416373))

(declare-fun m!416379 () Bool)

(assert (=> b!427888 m!416379))

(declare-fun m!416381 () Bool)

(assert (=> b!427899 m!416381))

(declare-fun m!416383 () Bool)

(assert (=> b!427895 m!416383))

(declare-fun m!416385 () Bool)

(assert (=> b!427898 m!416385))

(declare-fun m!416387 () Bool)

(assert (=> b!427890 m!416387))

(declare-fun m!416389 () Bool)

(assert (=> b!427891 m!416389))

(declare-fun m!416391 () Bool)

(assert (=> b!427884 m!416391))

(declare-fun m!416393 () Bool)

(assert (=> b!427884 m!416393))

(declare-fun m!416395 () Bool)

(assert (=> b!427884 m!416395))

(declare-fun m!416397 () Bool)

(assert (=> b!427889 m!416397))

(declare-fun m!416399 () Bool)

(assert (=> b!427893 m!416399))

(declare-fun m!416401 () Bool)

(assert (=> start!39750 m!416401))

(declare-fun m!416403 () Bool)

(assert (=> start!39750 m!416403))

(declare-fun m!416405 () Bool)

(assert (=> mapNonEmpty!18375 m!416405))

(check-sat (not b!427889) (not b!427888) (not b!427893) tp_is_empty!11169 (not b!427887) (not b!427891) b_and!17695 (not mapNonEmpty!18375) (not b_next!10017) (not b_lambda!9105) (not b!427890) (not start!39750) (not b!427894) (not b!427895) (not b!427884) (not b!427898))
(check-sat b_and!17695 (not b_next!10017))
