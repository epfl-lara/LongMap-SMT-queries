; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39774 () Bool)

(assert start!39774)

(declare-fun b_free!10041 () Bool)

(declare-fun b_next!10041 () Bool)

(assert (=> start!39774 (= b_free!10041 (not b_next!10041))))

(declare-fun tp!35652 () Bool)

(declare-fun b_and!17741 () Bool)

(assert (=> start!39774 (= tp!35652 b_and!17741)))

(declare-fun b!428548 () Bool)

(declare-fun res!251568 () Bool)

(declare-fun e!253952 () Bool)

(assert (=> b!428548 (=> (not res!251568) (not e!253952))))

(declare-datatypes ((array!26223 0))(
  ( (array!26224 (arr!12561 (Array (_ BitVec 32) (_ BitVec 64))) (size!12913 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26223)

(declare-datatypes ((List!7439 0))(
  ( (Nil!7436) (Cons!7435 (h!8291 (_ BitVec 64)) (t!12929 List!7439)) )
))
(declare-fun arrayNoDuplicates!0 (array!26223 (_ BitVec 32) List!7439) Bool)

(assert (=> b!428548 (= res!251568 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7436))))

(declare-fun b!428549 () Bool)

(declare-fun res!251569 () Bool)

(assert (=> b!428549 (=> (not res!251569) (not e!253952))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!428549 (= res!251569 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12913 _keys!709))))))

(declare-fun b!428550 () Bool)

(declare-fun e!253950 () Bool)

(assert (=> b!428550 (= e!253950 true)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!428550 (not (= (select (arr!12561 _keys!709) from!863) k0!794))))

(declare-datatypes ((Unit!12578 0))(
  ( (Unit!12579) )
))
(declare-fun lt!195809 () Unit!12578)

(declare-fun e!253948 () Unit!12578)

(assert (=> b!428550 (= lt!195809 e!253948)))

(declare-fun c!55397 () Bool)

(assert (=> b!428550 (= c!55397 (= (select (arr!12561 _keys!709) from!863) k0!794))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!16029 0))(
  ( (V!16030 (val!5641 Int)) )
))
(declare-datatypes ((tuple2!7426 0))(
  ( (tuple2!7427 (_1!3724 (_ BitVec 64)) (_2!3724 V!16029)) )
))
(declare-datatypes ((List!7440 0))(
  ( (Nil!7437) (Cons!7436 (h!8292 tuple2!7426) (t!12930 List!7440)) )
))
(declare-datatypes ((ListLongMap!6339 0))(
  ( (ListLongMap!6340 (toList!3185 List!7440)) )
))
(declare-fun lt!195812 () ListLongMap!6339)

(declare-fun lt!195813 () ListLongMap!6339)

(declare-datatypes ((ValueCell!5253 0))(
  ( (ValueCellFull!5253 (v!7888 V!16029)) (EmptyCell!5253) )
))
(declare-datatypes ((array!26225 0))(
  ( (array!26226 (arr!12562 (Array (_ BitVec 32) ValueCell!5253)) (size!12914 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26225)

(declare-fun +!1338 (ListLongMap!6339 tuple2!7426) ListLongMap!6339)

(declare-fun get!6226 (ValueCell!5253 V!16029) V!16029)

(declare-fun dynLambda!765 (Int (_ BitVec 64)) V!16029)

(assert (=> b!428550 (= lt!195813 (+!1338 lt!195812 (tuple2!7427 (select (arr!12561 _keys!709) from!863) (get!6226 (select (arr!12562 _values!549) from!863) (dynLambda!765 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!428551 () Bool)

(declare-fun res!251571 () Bool)

(assert (=> b!428551 (=> (not res!251571) (not e!253952))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!428551 (= res!251571 (validKeyInArray!0 k0!794))))

(declare-fun res!251570 () Bool)

(assert (=> start!39774 (=> (not res!251570) (not e!253952))))

(assert (=> start!39774 (= res!251570 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12913 _keys!709))))))

(assert (=> start!39774 e!253952))

(declare-fun tp_is_empty!11193 () Bool)

(assert (=> start!39774 tp_is_empty!11193))

(assert (=> start!39774 tp!35652))

(assert (=> start!39774 true))

(declare-fun e!253951 () Bool)

(declare-fun array_inv!9156 (array!26225) Bool)

(assert (=> start!39774 (and (array_inv!9156 _values!549) e!253951)))

(declare-fun array_inv!9157 (array!26223) Bool)

(assert (=> start!39774 (array_inv!9157 _keys!709)))

(declare-fun b!428552 () Bool)

(declare-fun res!251575 () Bool)

(assert (=> b!428552 (=> (not res!251575) (not e!253952))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!428552 (= res!251575 (and (= (size!12914 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12913 _keys!709) (size!12914 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!428553 () Bool)

(declare-fun Unit!12580 () Unit!12578)

(assert (=> b!428553 (= e!253948 Unit!12580)))

(declare-fun lt!195810 () Unit!12578)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26223 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12578)

(assert (=> b!428553 (= lt!195810 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!428553 false))

(declare-fun b!428554 () Bool)

(declare-fun e!253954 () Bool)

(assert (=> b!428554 (= e!253954 tp_is_empty!11193)))

(declare-fun b!428555 () Bool)

(declare-fun e!253956 () Bool)

(declare-fun mapRes!18411 () Bool)

(assert (=> b!428555 (= e!253951 (and e!253956 mapRes!18411))))

(declare-fun condMapEmpty!18411 () Bool)

(declare-fun mapDefault!18411 () ValueCell!5253)

(assert (=> b!428555 (= condMapEmpty!18411 (= (arr!12562 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5253)) mapDefault!18411)))))

(declare-fun b!428556 () Bool)

(declare-fun res!251578 () Bool)

(assert (=> b!428556 (=> (not res!251578) (not e!253952))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!428556 (= res!251578 (validMask!0 mask!1025))))

(declare-fun b!428557 () Bool)

(declare-fun res!251573 () Bool)

(assert (=> b!428557 (=> (not res!251573) (not e!253952))))

(assert (=> b!428557 (= res!251573 (or (= (select (arr!12561 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12561 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!428558 () Bool)

(declare-fun e!253955 () Bool)

(assert (=> b!428558 (= e!253952 e!253955)))

(declare-fun res!251577 () Bool)

(assert (=> b!428558 (=> (not res!251577) (not e!253955))))

(declare-fun lt!195808 () array!26223)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26223 (_ BitVec 32)) Bool)

(assert (=> b!428558 (= res!251577 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195808 mask!1025))))

(assert (=> b!428558 (= lt!195808 (array!26224 (store (arr!12561 _keys!709) i!563 k0!794) (size!12913 _keys!709)))))

(declare-fun b!428559 () Bool)

(declare-fun res!251572 () Bool)

(assert (=> b!428559 (=> (not res!251572) (not e!253955))))

(assert (=> b!428559 (= res!251572 (arrayNoDuplicates!0 lt!195808 #b00000000000000000000000000000000 Nil!7436))))

(declare-fun b!428560 () Bool)

(declare-fun e!253953 () Bool)

(assert (=> b!428560 (= e!253953 (not e!253950))))

(declare-fun res!251580 () Bool)

(assert (=> b!428560 (=> res!251580 e!253950)))

(assert (=> b!428560 (= res!251580 (not (validKeyInArray!0 (select (arr!12561 _keys!709) from!863))))))

(declare-fun lt!195814 () ListLongMap!6339)

(assert (=> b!428560 (= lt!195814 lt!195812)))

(declare-fun lt!195806 () ListLongMap!6339)

(declare-fun v!412 () V!16029)

(assert (=> b!428560 (= lt!195812 (+!1338 lt!195806 (tuple2!7427 k0!794 v!412)))))

(declare-fun minValue!515 () V!16029)

(declare-fun zeroValue!515 () V!16029)

(declare-fun lt!195815 () array!26225)

(declare-fun getCurrentListMapNoExtraKeys!1387 (array!26223 array!26225 (_ BitVec 32) (_ BitVec 32) V!16029 V!16029 (_ BitVec 32) Int) ListLongMap!6339)

(assert (=> b!428560 (= lt!195814 (getCurrentListMapNoExtraKeys!1387 lt!195808 lt!195815 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!428560 (= lt!195806 (getCurrentListMapNoExtraKeys!1387 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!195811 () Unit!12578)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!529 (array!26223 array!26225 (_ BitVec 32) (_ BitVec 32) V!16029 V!16029 (_ BitVec 32) (_ BitVec 64) V!16029 (_ BitVec 32) Int) Unit!12578)

(assert (=> b!428560 (= lt!195811 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!529 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!428561 () Bool)

(assert (=> b!428561 (= e!253955 e!253953)))

(declare-fun res!251574 () Bool)

(assert (=> b!428561 (=> (not res!251574) (not e!253953))))

(assert (=> b!428561 (= res!251574 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!428561 (= lt!195813 (getCurrentListMapNoExtraKeys!1387 lt!195808 lt!195815 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!428561 (= lt!195815 (array!26226 (store (arr!12562 _values!549) i!563 (ValueCellFull!5253 v!412)) (size!12914 _values!549)))))

(declare-fun lt!195807 () ListLongMap!6339)

(assert (=> b!428561 (= lt!195807 (getCurrentListMapNoExtraKeys!1387 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!428562 () Bool)

(assert (=> b!428562 (= e!253956 tp_is_empty!11193)))

(declare-fun mapIsEmpty!18411 () Bool)

(assert (=> mapIsEmpty!18411 mapRes!18411))

(declare-fun b!428563 () Bool)

(declare-fun Unit!12581 () Unit!12578)

(assert (=> b!428563 (= e!253948 Unit!12581)))

(declare-fun mapNonEmpty!18411 () Bool)

(declare-fun tp!35651 () Bool)

(assert (=> mapNonEmpty!18411 (= mapRes!18411 (and tp!35651 e!253954))))

(declare-fun mapKey!18411 () (_ BitVec 32))

(declare-fun mapValue!18411 () ValueCell!5253)

(declare-fun mapRest!18411 () (Array (_ BitVec 32) ValueCell!5253))

(assert (=> mapNonEmpty!18411 (= (arr!12562 _values!549) (store mapRest!18411 mapKey!18411 mapValue!18411))))

(declare-fun b!428564 () Bool)

(declare-fun res!251579 () Bool)

(assert (=> b!428564 (=> (not res!251579) (not e!253955))))

(assert (=> b!428564 (= res!251579 (bvsle from!863 i!563))))

(declare-fun b!428565 () Bool)

(declare-fun res!251567 () Bool)

(assert (=> b!428565 (=> (not res!251567) (not e!253952))))

(assert (=> b!428565 (= res!251567 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!428566 () Bool)

(declare-fun res!251576 () Bool)

(assert (=> b!428566 (=> (not res!251576) (not e!253952))))

(declare-fun arrayContainsKey!0 (array!26223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!428566 (= res!251576 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!39774 res!251570) b!428556))

(assert (= (and b!428556 res!251578) b!428552))

(assert (= (and b!428552 res!251575) b!428565))

(assert (= (and b!428565 res!251567) b!428548))

(assert (= (and b!428548 res!251568) b!428549))

(assert (= (and b!428549 res!251569) b!428551))

(assert (= (and b!428551 res!251571) b!428557))

(assert (= (and b!428557 res!251573) b!428566))

(assert (= (and b!428566 res!251576) b!428558))

(assert (= (and b!428558 res!251577) b!428559))

(assert (= (and b!428559 res!251572) b!428564))

(assert (= (and b!428564 res!251579) b!428561))

(assert (= (and b!428561 res!251574) b!428560))

(assert (= (and b!428560 (not res!251580)) b!428550))

(assert (= (and b!428550 c!55397) b!428553))

(assert (= (and b!428550 (not c!55397)) b!428563))

(assert (= (and b!428555 condMapEmpty!18411) mapIsEmpty!18411))

(assert (= (and b!428555 (not condMapEmpty!18411)) mapNonEmpty!18411))

(get-info :version)

(assert (= (and mapNonEmpty!18411 ((_ is ValueCellFull!5253) mapValue!18411)) b!428554))

(assert (= (and b!428555 ((_ is ValueCellFull!5253) mapDefault!18411)) b!428562))

(assert (= start!39774 b!428555))

(declare-fun b_lambda!9129 () Bool)

(assert (=> (not b_lambda!9129) (not b!428550)))

(declare-fun t!12928 () Bool)

(declare-fun tb!3447 () Bool)

(assert (=> (and start!39774 (= defaultEntry!557 defaultEntry!557) t!12928) tb!3447))

(declare-fun result!6421 () Bool)

(assert (=> tb!3447 (= result!6421 tp_is_empty!11193)))

(assert (=> b!428550 t!12928))

(declare-fun b_and!17743 () Bool)

(assert (= b_and!17741 (and (=> t!12928 result!6421) b_and!17743)))

(declare-fun m!416965 () Bool)

(assert (=> b!428548 m!416965))

(declare-fun m!416967 () Bool)

(assert (=> b!428560 m!416967))

(declare-fun m!416969 () Bool)

(assert (=> b!428560 m!416969))

(declare-fun m!416971 () Bool)

(assert (=> b!428560 m!416971))

(declare-fun m!416973 () Bool)

(assert (=> b!428560 m!416973))

(assert (=> b!428560 m!416967))

(declare-fun m!416975 () Bool)

(assert (=> b!428560 m!416975))

(declare-fun m!416977 () Bool)

(assert (=> b!428560 m!416977))

(declare-fun m!416979 () Bool)

(assert (=> b!428557 m!416979))

(declare-fun m!416981 () Bool)

(assert (=> b!428558 m!416981))

(declare-fun m!416983 () Bool)

(assert (=> b!428558 m!416983))

(declare-fun m!416985 () Bool)

(assert (=> b!428556 m!416985))

(declare-fun m!416987 () Bool)

(assert (=> b!428553 m!416987))

(declare-fun m!416989 () Bool)

(assert (=> mapNonEmpty!18411 m!416989))

(declare-fun m!416991 () Bool)

(assert (=> start!39774 m!416991))

(declare-fun m!416993 () Bool)

(assert (=> start!39774 m!416993))

(declare-fun m!416995 () Bool)

(assert (=> b!428566 m!416995))

(declare-fun m!416997 () Bool)

(assert (=> b!428559 m!416997))

(declare-fun m!416999 () Bool)

(assert (=> b!428551 m!416999))

(declare-fun m!417001 () Bool)

(assert (=> b!428565 m!417001))

(declare-fun m!417003 () Bool)

(assert (=> b!428561 m!417003))

(declare-fun m!417005 () Bool)

(assert (=> b!428561 m!417005))

(declare-fun m!417007 () Bool)

(assert (=> b!428561 m!417007))

(assert (=> b!428550 m!416967))

(declare-fun m!417009 () Bool)

(assert (=> b!428550 m!417009))

(declare-fun m!417011 () Bool)

(assert (=> b!428550 m!417011))

(declare-fun m!417013 () Bool)

(assert (=> b!428550 m!417013))

(assert (=> b!428550 m!417013))

(assert (=> b!428550 m!417011))

(declare-fun m!417015 () Bool)

(assert (=> b!428550 m!417015))

(check-sat (not b!428560) (not mapNonEmpty!18411) (not b!428551) (not b_next!10041) (not b_lambda!9129) (not b!428561) (not b!428553) (not start!39774) (not b!428566) (not b!428558) (not b!428559) b_and!17743 (not b!428550) (not b!428548) tp_is_empty!11193 (not b!428565) (not b!428556))
(check-sat b_and!17743 (not b_next!10041))
