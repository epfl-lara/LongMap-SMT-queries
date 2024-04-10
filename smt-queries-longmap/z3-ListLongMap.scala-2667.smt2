; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39822 () Bool)

(assert start!39822)

(declare-fun b_free!10089 () Bool)

(declare-fun b_next!10089 () Bool)

(assert (=> start!39822 (= b_free!10089 (not b_next!10089))))

(declare-fun tp!35795 () Bool)

(declare-fun b_and!17837 () Bool)

(assert (=> start!39822 (= tp!35795 b_and!17837)))

(declare-fun b!429964 () Bool)

(declare-fun res!252575 () Bool)

(declare-fun e!254598 () Bool)

(assert (=> b!429964 (=> (not res!252575) (not e!254598))))

(declare-datatypes ((array!26317 0))(
  ( (array!26318 (arr!12608 (Array (_ BitVec 32) (_ BitVec 64))) (size!12960 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26317)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!429964 (= res!252575 (or (= (select (arr!12608 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12608 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!18483 () Bool)

(declare-fun mapRes!18483 () Bool)

(assert (=> mapIsEmpty!18483 mapRes!18483))

(declare-fun b!429965 () Bool)

(declare-datatypes ((Unit!12644 0))(
  ( (Unit!12645) )
))
(declare-fun e!254603 () Unit!12644)

(declare-fun Unit!12646 () Unit!12644)

(assert (=> b!429965 (= e!254603 Unit!12646)))

(declare-fun b!429966 () Bool)

(declare-fun e!254597 () Bool)

(declare-fun e!254604 () Bool)

(assert (=> b!429966 (= e!254597 (not e!254604))))

(declare-fun res!252588 () Bool)

(assert (=> b!429966 (=> res!252588 e!254604)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!429966 (= res!252588 (not (validKeyInArray!0 (select (arr!12608 _keys!709) from!863))))))

(declare-datatypes ((V!16093 0))(
  ( (V!16094 (val!5665 Int)) )
))
(declare-datatypes ((tuple2!7460 0))(
  ( (tuple2!7461 (_1!3741 (_ BitVec 64)) (_2!3741 V!16093)) )
))
(declare-datatypes ((List!7477 0))(
  ( (Nil!7474) (Cons!7473 (h!8329 tuple2!7460) (t!13015 List!7477)) )
))
(declare-datatypes ((ListLongMap!6373 0))(
  ( (ListLongMap!6374 (toList!3202 List!7477)) )
))
(declare-fun lt!196535 () ListLongMap!6373)

(declare-fun lt!196534 () ListLongMap!6373)

(assert (=> b!429966 (= lt!196535 lt!196534)))

(declare-fun lt!196531 () ListLongMap!6373)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!16093)

(declare-fun +!1351 (ListLongMap!6373 tuple2!7460) ListLongMap!6373)

(assert (=> b!429966 (= lt!196534 (+!1351 lt!196531 (tuple2!7461 k0!794 v!412)))))

(declare-fun lt!196533 () array!26317)

(declare-datatypes ((ValueCell!5277 0))(
  ( (ValueCellFull!5277 (v!7912 V!16093)) (EmptyCell!5277) )
))
(declare-datatypes ((array!26319 0))(
  ( (array!26320 (arr!12609 (Array (_ BitVec 32) ValueCell!5277)) (size!12961 (_ BitVec 32))) )
))
(declare-fun lt!196529 () array!26319)

(declare-fun minValue!515 () V!16093)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun zeroValue!515 () V!16093)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1404 (array!26317 array!26319 (_ BitVec 32) (_ BitVec 32) V!16093 V!16093 (_ BitVec 32) Int) ListLongMap!6373)

(assert (=> b!429966 (= lt!196535 (getCurrentListMapNoExtraKeys!1404 lt!196533 lt!196529 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun _values!549 () array!26319)

(assert (=> b!429966 (= lt!196531 (getCurrentListMapNoExtraKeys!1404 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196526 () Unit!12644)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!540 (array!26317 array!26319 (_ BitVec 32) (_ BitVec 32) V!16093 V!16093 (_ BitVec 32) (_ BitVec 64) V!16093 (_ BitVec 32) Int) Unit!12644)

(assert (=> b!429966 (= lt!196526 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!540 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!429967 () Bool)

(declare-fun e!254596 () Bool)

(declare-fun e!254602 () Bool)

(assert (=> b!429967 (= e!254596 (and e!254602 mapRes!18483))))

(declare-fun condMapEmpty!18483 () Bool)

(declare-fun mapDefault!18483 () ValueCell!5277)

(assert (=> b!429967 (= condMapEmpty!18483 (= (arr!12609 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5277)) mapDefault!18483)))))

(declare-fun b!429968 () Bool)

(declare-fun res!252587 () Bool)

(assert (=> b!429968 (=> (not res!252587) (not e!254598))))

(declare-fun arrayContainsKey!0 (array!26317 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!429968 (= res!252587 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!429969 () Bool)

(declare-fun e!254601 () Bool)

(assert (=> b!429969 (= e!254598 e!254601)))

(declare-fun res!252585 () Bool)

(assert (=> b!429969 (=> (not res!252585) (not e!254601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26317 (_ BitVec 32)) Bool)

(assert (=> b!429969 (= res!252585 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196533 mask!1025))))

(assert (=> b!429969 (= lt!196533 (array!26318 (store (arr!12608 _keys!709) i!563 k0!794) (size!12960 _keys!709)))))

(declare-fun b!429970 () Bool)

(declare-fun Unit!12647 () Unit!12644)

(assert (=> b!429970 (= e!254603 Unit!12647)))

(declare-fun lt!196528 () Unit!12644)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26317 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12644)

(assert (=> b!429970 (= lt!196528 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!429970 false))

(declare-fun b!429972 () Bool)

(declare-fun res!252581 () Bool)

(assert (=> b!429972 (=> (not res!252581) (not e!254598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!429972 (= res!252581 (validMask!0 mask!1025))))

(declare-fun b!429973 () Bool)

(assert (=> b!429973 (= e!254604 true)))

(assert (=> b!429973 (not (= (select (arr!12608 _keys!709) from!863) k0!794))))

(declare-fun lt!196532 () Unit!12644)

(assert (=> b!429973 (= lt!196532 e!254603)))

(declare-fun c!55469 () Bool)

(assert (=> b!429973 (= c!55469 (= (select (arr!12608 _keys!709) from!863) k0!794))))

(declare-fun lt!196527 () ListLongMap!6373)

(declare-fun get!6255 (ValueCell!5277 V!16093) V!16093)

(declare-fun dynLambda!778 (Int (_ BitVec 64)) V!16093)

(assert (=> b!429973 (= lt!196527 (+!1351 lt!196534 (tuple2!7461 (select (arr!12608 _keys!709) from!863) (get!6255 (select (arr!12609 _values!549) from!863) (dynLambda!778 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!429974 () Bool)

(declare-fun res!252578 () Bool)

(assert (=> b!429974 (=> (not res!252578) (not e!254598))))

(assert (=> b!429974 (= res!252578 (validKeyInArray!0 k0!794))))

(declare-fun b!429975 () Bool)

(declare-fun res!252579 () Bool)

(assert (=> b!429975 (=> (not res!252579) (not e!254598))))

(declare-datatypes ((List!7478 0))(
  ( (Nil!7475) (Cons!7474 (h!8330 (_ BitVec 64)) (t!13016 List!7478)) )
))
(declare-fun arrayNoDuplicates!0 (array!26317 (_ BitVec 32) List!7478) Bool)

(assert (=> b!429975 (= res!252579 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7475))))

(declare-fun b!429976 () Bool)

(declare-fun res!252583 () Bool)

(assert (=> b!429976 (=> (not res!252583) (not e!254601))))

(assert (=> b!429976 (= res!252583 (arrayNoDuplicates!0 lt!196533 #b00000000000000000000000000000000 Nil!7475))))

(declare-fun b!429977 () Bool)

(assert (=> b!429977 (= e!254601 e!254597)))

(declare-fun res!252576 () Bool)

(assert (=> b!429977 (=> (not res!252576) (not e!254597))))

(assert (=> b!429977 (= res!252576 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!429977 (= lt!196527 (getCurrentListMapNoExtraKeys!1404 lt!196533 lt!196529 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!429977 (= lt!196529 (array!26320 (store (arr!12609 _values!549) i!563 (ValueCellFull!5277 v!412)) (size!12961 _values!549)))))

(declare-fun lt!196530 () ListLongMap!6373)

(assert (=> b!429977 (= lt!196530 (getCurrentListMapNoExtraKeys!1404 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!429978 () Bool)

(declare-fun res!252582 () Bool)

(assert (=> b!429978 (=> (not res!252582) (not e!254598))))

(assert (=> b!429978 (= res!252582 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18483 () Bool)

(declare-fun tp!35796 () Bool)

(declare-fun e!254599 () Bool)

(assert (=> mapNonEmpty!18483 (= mapRes!18483 (and tp!35796 e!254599))))

(declare-fun mapKey!18483 () (_ BitVec 32))

(declare-fun mapValue!18483 () ValueCell!5277)

(declare-fun mapRest!18483 () (Array (_ BitVec 32) ValueCell!5277))

(assert (=> mapNonEmpty!18483 (= (arr!12609 _values!549) (store mapRest!18483 mapKey!18483 mapValue!18483))))

(declare-fun b!429979 () Bool)

(declare-fun tp_is_empty!11241 () Bool)

(assert (=> b!429979 (= e!254602 tp_is_empty!11241)))

(declare-fun res!252586 () Bool)

(assert (=> start!39822 (=> (not res!252586) (not e!254598))))

(assert (=> start!39822 (= res!252586 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12960 _keys!709))))))

(assert (=> start!39822 e!254598))

(assert (=> start!39822 tp_is_empty!11241))

(assert (=> start!39822 tp!35795))

(assert (=> start!39822 true))

(declare-fun array_inv!9182 (array!26319) Bool)

(assert (=> start!39822 (and (array_inv!9182 _values!549) e!254596)))

(declare-fun array_inv!9183 (array!26317) Bool)

(assert (=> start!39822 (array_inv!9183 _keys!709)))

(declare-fun b!429971 () Bool)

(assert (=> b!429971 (= e!254599 tp_is_empty!11241)))

(declare-fun b!429980 () Bool)

(declare-fun res!252584 () Bool)

(assert (=> b!429980 (=> (not res!252584) (not e!254598))))

(assert (=> b!429980 (= res!252584 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12960 _keys!709))))))

(declare-fun b!429981 () Bool)

(declare-fun res!252580 () Bool)

(assert (=> b!429981 (=> (not res!252580) (not e!254601))))

(assert (=> b!429981 (= res!252580 (bvsle from!863 i!563))))

(declare-fun b!429982 () Bool)

(declare-fun res!252577 () Bool)

(assert (=> b!429982 (=> (not res!252577) (not e!254598))))

(assert (=> b!429982 (= res!252577 (and (= (size!12961 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12960 _keys!709) (size!12961 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(assert (= (and start!39822 res!252586) b!429972))

(assert (= (and b!429972 res!252581) b!429982))

(assert (= (and b!429982 res!252577) b!429978))

(assert (= (and b!429978 res!252582) b!429975))

(assert (= (and b!429975 res!252579) b!429980))

(assert (= (and b!429980 res!252584) b!429974))

(assert (= (and b!429974 res!252578) b!429964))

(assert (= (and b!429964 res!252575) b!429968))

(assert (= (and b!429968 res!252587) b!429969))

(assert (= (and b!429969 res!252585) b!429976))

(assert (= (and b!429976 res!252583) b!429981))

(assert (= (and b!429981 res!252580) b!429977))

(assert (= (and b!429977 res!252576) b!429966))

(assert (= (and b!429966 (not res!252588)) b!429973))

(assert (= (and b!429973 c!55469) b!429970))

(assert (= (and b!429973 (not c!55469)) b!429965))

(assert (= (and b!429967 condMapEmpty!18483) mapIsEmpty!18483))

(assert (= (and b!429967 (not condMapEmpty!18483)) mapNonEmpty!18483))

(get-info :version)

(assert (= (and mapNonEmpty!18483 ((_ is ValueCellFull!5277) mapValue!18483)) b!429971))

(assert (= (and b!429967 ((_ is ValueCellFull!5277) mapDefault!18483)) b!429979))

(assert (= start!39822 b!429967))

(declare-fun b_lambda!9177 () Bool)

(assert (=> (not b_lambda!9177) (not b!429973)))

(declare-fun t!13014 () Bool)

(declare-fun tb!3495 () Bool)

(assert (=> (and start!39822 (= defaultEntry!557 defaultEntry!557) t!13014) tb!3495))

(declare-fun result!6517 () Bool)

(assert (=> tb!3495 (= result!6517 tp_is_empty!11241)))

(assert (=> b!429973 t!13014))

(declare-fun b_and!17839 () Bool)

(assert (= b_and!17837 (and (=> t!13014 result!6517) b_and!17839)))

(declare-fun m!418213 () Bool)

(assert (=> b!429976 m!418213))

(declare-fun m!418215 () Bool)

(assert (=> b!429975 m!418215))

(declare-fun m!418217 () Bool)

(assert (=> b!429974 m!418217))

(declare-fun m!418219 () Bool)

(assert (=> b!429968 m!418219))

(declare-fun m!418221 () Bool)

(assert (=> b!429964 m!418221))

(declare-fun m!418223 () Bool)

(assert (=> b!429966 m!418223))

(declare-fun m!418225 () Bool)

(assert (=> b!429966 m!418225))

(declare-fun m!418227 () Bool)

(assert (=> b!429966 m!418227))

(assert (=> b!429966 m!418223))

(declare-fun m!418229 () Bool)

(assert (=> b!429966 m!418229))

(declare-fun m!418231 () Bool)

(assert (=> b!429966 m!418231))

(declare-fun m!418233 () Bool)

(assert (=> b!429966 m!418233))

(assert (=> b!429973 m!418223))

(declare-fun m!418235 () Bool)

(assert (=> b!429973 m!418235))

(declare-fun m!418237 () Bool)

(assert (=> b!429973 m!418237))

(declare-fun m!418239 () Bool)

(assert (=> b!429973 m!418239))

(assert (=> b!429973 m!418239))

(assert (=> b!429973 m!418235))

(declare-fun m!418241 () Bool)

(assert (=> b!429973 m!418241))

(declare-fun m!418243 () Bool)

(assert (=> b!429978 m!418243))

(declare-fun m!418245 () Bool)

(assert (=> b!429977 m!418245))

(declare-fun m!418247 () Bool)

(assert (=> b!429977 m!418247))

(declare-fun m!418249 () Bool)

(assert (=> b!429977 m!418249))

(declare-fun m!418251 () Bool)

(assert (=> b!429972 m!418251))

(declare-fun m!418253 () Bool)

(assert (=> mapNonEmpty!18483 m!418253))

(declare-fun m!418255 () Bool)

(assert (=> start!39822 m!418255))

(declare-fun m!418257 () Bool)

(assert (=> start!39822 m!418257))

(declare-fun m!418259 () Bool)

(assert (=> b!429969 m!418259))

(declare-fun m!418261 () Bool)

(assert (=> b!429969 m!418261))

(declare-fun m!418263 () Bool)

(assert (=> b!429970 m!418263))

(check-sat tp_is_empty!11241 (not start!39822) (not b!429973) (not b!429968) (not b!429970) (not b!429972) b_and!17839 (not b_lambda!9177) (not mapNonEmpty!18483) (not b_next!10089) (not b!429969) (not b!429976) (not b!429977) (not b!429975) (not b!429966) (not b!429974) (not b!429978))
(check-sat b_and!17839 (not b_next!10089))
