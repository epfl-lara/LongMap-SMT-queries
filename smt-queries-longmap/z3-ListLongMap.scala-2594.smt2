; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39368 () Bool)

(assert start!39368)

(declare-fun b_free!9649 () Bool)

(declare-fun b_next!9649 () Bool)

(assert (=> start!39368 (= b_free!9649 (not b_next!9649))))

(declare-fun tp!34476 () Bool)

(declare-fun b_and!17187 () Bool)

(assert (=> start!39368 (= tp!34476 b_and!17187)))

(declare-fun mapIsEmpty!17823 () Bool)

(declare-fun mapRes!17823 () Bool)

(assert (=> mapIsEmpty!17823 mapRes!17823))

(declare-fun b!418384 () Bool)

(declare-fun res!243812 () Bool)

(declare-fun e!249486 () Bool)

(assert (=> b!418384 (=> (not res!243812) (not e!249486))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15507 0))(
  ( (V!15508 (val!5445 Int)) )
))
(declare-datatypes ((ValueCell!5057 0))(
  ( (ValueCellFull!5057 (v!7693 V!15507)) (EmptyCell!5057) )
))
(declare-datatypes ((array!25460 0))(
  ( (array!25461 (arr!12179 (Array (_ BitVec 32) ValueCell!5057)) (size!12531 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25460)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!25462 0))(
  ( (array!25463 (arr!12180 (Array (_ BitVec 32) (_ BitVec 64))) (size!12532 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25462)

(assert (=> b!418384 (= res!243812 (and (= (size!12531 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12532 _keys!709) (size!12531 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!418385 () Bool)

(declare-fun e!249481 () Bool)

(declare-fun tp_is_empty!10801 () Bool)

(assert (=> b!418385 (= e!249481 tp_is_empty!10801)))

(declare-fun b!418386 () Bool)

(declare-fun e!249482 () Bool)

(declare-fun e!249484 () Bool)

(assert (=> b!418386 (= e!249482 e!249484)))

(declare-fun res!243815 () Bool)

(assert (=> b!418386 (=> (not res!243815) (not e!249484))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!418386 (= res!243815 (= from!863 i!563))))

(declare-fun minValue!515 () V!15507)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15507)

(declare-fun lt!191804 () array!25460)

(declare-fun lt!191809 () array!25462)

(declare-datatypes ((tuple2!6996 0))(
  ( (tuple2!6997 (_1!3509 (_ BitVec 64)) (_2!3509 V!15507)) )
))
(declare-datatypes ((List!7009 0))(
  ( (Nil!7006) (Cons!7005 (h!7861 tuple2!6996) (t!12315 List!7009)) )
))
(declare-datatypes ((ListLongMap!5911 0))(
  ( (ListLongMap!5912 (toList!2971 List!7009)) )
))
(declare-fun lt!191810 () ListLongMap!5911)

(declare-fun getCurrentListMapNoExtraKeys!1217 (array!25462 array!25460 (_ BitVec 32) (_ BitVec 32) V!15507 V!15507 (_ BitVec 32) Int) ListLongMap!5911)

(assert (=> b!418386 (= lt!191810 (getCurrentListMapNoExtraKeys!1217 lt!191809 lt!191804 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15507)

(assert (=> b!418386 (= lt!191804 (array!25461 (store (arr!12179 _values!549) i!563 (ValueCellFull!5057 v!412)) (size!12531 _values!549)))))

(declare-fun lt!191811 () ListLongMap!5911)

(assert (=> b!418386 (= lt!191811 (getCurrentListMapNoExtraKeys!1217 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!29110 () Bool)

(declare-fun call!29112 () ListLongMap!5911)

(declare-fun c!55164 () Bool)

(assert (=> bm!29110 (= call!29112 (getCurrentListMapNoExtraKeys!1217 (ite c!55164 lt!191809 _keys!709) (ite c!55164 lt!191804 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418387 () Bool)

(declare-fun e!249485 () Bool)

(assert (=> b!418387 (= e!249484 (not e!249485))))

(declare-fun res!243811 () Bool)

(assert (=> b!418387 (=> res!243811 e!249485)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!418387 (= res!243811 (validKeyInArray!0 (select (arr!12180 _keys!709) from!863)))))

(declare-fun e!249487 () Bool)

(assert (=> b!418387 e!249487))

(assert (=> b!418387 (= c!55164 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((Unit!12349 0))(
  ( (Unit!12350) )
))
(declare-fun lt!191806 () Unit!12349)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!432 (array!25462 array!25460 (_ BitVec 32) (_ BitVec 32) V!15507 V!15507 (_ BitVec 32) (_ BitVec 64) V!15507 (_ BitVec 32) Int) Unit!12349)

(assert (=> b!418387 (= lt!191806 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!432 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418388 () Bool)

(declare-fun res!243809 () Bool)

(assert (=> b!418388 (=> (not res!243809) (not e!249486))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!418388 (= res!243809 (validMask!0 mask!1025))))

(declare-fun b!418389 () Bool)

(declare-fun res!243821 () Bool)

(assert (=> b!418389 (=> (not res!243821) (not e!249486))))

(assert (=> b!418389 (= res!243821 (or (= (select (arr!12180 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12180 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!418390 () Bool)

(assert (=> b!418390 (= e!249486 e!249482)))

(declare-fun res!243816 () Bool)

(assert (=> b!418390 (=> (not res!243816) (not e!249482))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25462 (_ BitVec 32)) Bool)

(assert (=> b!418390 (= res!243816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!191809 mask!1025))))

(assert (=> b!418390 (= lt!191809 (array!25463 (store (arr!12180 _keys!709) i!563 k0!794) (size!12532 _keys!709)))))

(declare-fun res!243814 () Bool)

(assert (=> start!39368 (=> (not res!243814) (not e!249486))))

(assert (=> start!39368 (= res!243814 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12532 _keys!709))))))

(assert (=> start!39368 e!249486))

(assert (=> start!39368 tp_is_empty!10801))

(assert (=> start!39368 tp!34476))

(assert (=> start!39368 true))

(declare-fun e!249479 () Bool)

(declare-fun array_inv!8956 (array!25460) Bool)

(assert (=> start!39368 (and (array_inv!8956 _values!549) e!249479)))

(declare-fun array_inv!8957 (array!25462) Bool)

(assert (=> start!39368 (array_inv!8957 _keys!709)))

(declare-fun bm!29109 () Bool)

(declare-fun call!29113 () ListLongMap!5911)

(assert (=> bm!29109 (= call!29113 (getCurrentListMapNoExtraKeys!1217 (ite c!55164 _keys!709 lt!191809) (ite c!55164 _values!549 lt!191804) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418391 () Bool)

(declare-fun res!243820 () Bool)

(assert (=> b!418391 (=> (not res!243820) (not e!249486))))

(assert (=> b!418391 (= res!243820 (validKeyInArray!0 k0!794))))

(declare-fun b!418392 () Bool)

(assert (=> b!418392 (= e!249479 (and e!249481 mapRes!17823))))

(declare-fun condMapEmpty!17823 () Bool)

(declare-fun mapDefault!17823 () ValueCell!5057)

(assert (=> b!418392 (= condMapEmpty!17823 (= (arr!12179 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5057)) mapDefault!17823)))))

(declare-fun b!418393 () Bool)

(declare-fun res!243810 () Bool)

(assert (=> b!418393 (=> (not res!243810) (not e!249486))))

(declare-fun arrayContainsKey!0 (array!25462 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!418393 (= res!243810 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!418394 () Bool)

(declare-fun e!249483 () Bool)

(assert (=> b!418394 (= e!249483 tp_is_empty!10801)))

(declare-fun b!418395 () Bool)

(declare-fun res!243813 () Bool)

(assert (=> b!418395 (=> (not res!243813) (not e!249482))))

(assert (=> b!418395 (= res!243813 (bvsle from!863 i!563))))

(declare-fun b!418396 () Bool)

(assert (=> b!418396 (= e!249485 true)))

(declare-fun lt!191801 () tuple2!6996)

(declare-fun lt!191808 () ListLongMap!5911)

(declare-fun lt!191805 () V!15507)

(declare-fun +!1240 (ListLongMap!5911 tuple2!6996) ListLongMap!5911)

(assert (=> b!418396 (= (+!1240 lt!191808 lt!191801) (+!1240 (+!1240 lt!191808 (tuple2!6997 k0!794 lt!191805)) lt!191801))))

(declare-fun lt!191802 () V!15507)

(assert (=> b!418396 (= lt!191801 (tuple2!6997 k0!794 lt!191802))))

(declare-fun lt!191807 () Unit!12349)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!30 (ListLongMap!5911 (_ BitVec 64) V!15507 V!15507) Unit!12349)

(assert (=> b!418396 (= lt!191807 (addSameAsAddTwiceSameKeyDiffValues!30 lt!191808 k0!794 lt!191805 lt!191802))))

(declare-fun lt!191803 () V!15507)

(declare-fun get!6034 (ValueCell!5057 V!15507) V!15507)

(assert (=> b!418396 (= lt!191805 (get!6034 (select (arr!12179 _values!549) from!863) lt!191803))))

(assert (=> b!418396 (= lt!191810 (+!1240 lt!191808 (tuple2!6997 (select (arr!12180 lt!191809) from!863) lt!191802)))))

(assert (=> b!418396 (= lt!191802 (get!6034 (select (store (arr!12179 _values!549) i!563 (ValueCellFull!5057 v!412)) from!863) lt!191803))))

(declare-fun dynLambda!697 (Int (_ BitVec 64)) V!15507)

(assert (=> b!418396 (= lt!191803 (dynLambda!697 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!418396 (= lt!191808 (getCurrentListMapNoExtraKeys!1217 lt!191809 lt!191804 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!418397 () Bool)

(declare-fun res!243818 () Bool)

(assert (=> b!418397 (=> (not res!243818) (not e!249482))))

(declare-datatypes ((List!7010 0))(
  ( (Nil!7007) (Cons!7006 (h!7862 (_ BitVec 64)) (t!12316 List!7010)) )
))
(declare-fun arrayNoDuplicates!0 (array!25462 (_ BitVec 32) List!7010) Bool)

(assert (=> b!418397 (= res!243818 (arrayNoDuplicates!0 lt!191809 #b00000000000000000000000000000000 Nil!7007))))

(declare-fun b!418398 () Bool)

(declare-fun res!243819 () Bool)

(assert (=> b!418398 (=> (not res!243819) (not e!249486))))

(assert (=> b!418398 (= res!243819 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12532 _keys!709))))))

(declare-fun b!418399 () Bool)

(assert (=> b!418399 (= e!249487 (= call!29113 call!29112))))

(declare-fun b!418400 () Bool)

(assert (=> b!418400 (= e!249487 (= call!29112 (+!1240 call!29113 (tuple2!6997 k0!794 v!412))))))

(declare-fun mapNonEmpty!17823 () Bool)

(declare-fun tp!34475 () Bool)

(assert (=> mapNonEmpty!17823 (= mapRes!17823 (and tp!34475 e!249483))))

(declare-fun mapKey!17823 () (_ BitVec 32))

(declare-fun mapValue!17823 () ValueCell!5057)

(declare-fun mapRest!17823 () (Array (_ BitVec 32) ValueCell!5057))

(assert (=> mapNonEmpty!17823 (= (arr!12179 _values!549) (store mapRest!17823 mapKey!17823 mapValue!17823))))

(declare-fun b!418401 () Bool)

(declare-fun res!243817 () Bool)

(assert (=> b!418401 (=> (not res!243817) (not e!249486))))

(assert (=> b!418401 (= res!243817 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7007))))

(declare-fun b!418402 () Bool)

(declare-fun res!243822 () Bool)

(assert (=> b!418402 (=> (not res!243822) (not e!249486))))

(assert (=> b!418402 (= res!243822 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!39368 res!243814) b!418388))

(assert (= (and b!418388 res!243809) b!418384))

(assert (= (and b!418384 res!243812) b!418402))

(assert (= (and b!418402 res!243822) b!418401))

(assert (= (and b!418401 res!243817) b!418398))

(assert (= (and b!418398 res!243819) b!418391))

(assert (= (and b!418391 res!243820) b!418389))

(assert (= (and b!418389 res!243821) b!418393))

(assert (= (and b!418393 res!243810) b!418390))

(assert (= (and b!418390 res!243816) b!418397))

(assert (= (and b!418397 res!243818) b!418395))

(assert (= (and b!418395 res!243813) b!418386))

(assert (= (and b!418386 res!243815) b!418387))

(assert (= (and b!418387 c!55164) b!418400))

(assert (= (and b!418387 (not c!55164)) b!418399))

(assert (= (or b!418400 b!418399) bm!29110))

(assert (= (or b!418400 b!418399) bm!29109))

(assert (= (and b!418387 (not res!243811)) b!418396))

(assert (= (and b!418392 condMapEmpty!17823) mapIsEmpty!17823))

(assert (= (and b!418392 (not condMapEmpty!17823)) mapNonEmpty!17823))

(get-info :version)

(assert (= (and mapNonEmpty!17823 ((_ is ValueCellFull!5057) mapValue!17823)) b!418394))

(assert (= (and b!418392 ((_ is ValueCellFull!5057) mapDefault!17823)) b!418385))

(assert (= start!39368 b!418392))

(declare-fun b_lambda!8975 () Bool)

(assert (=> (not b_lambda!8975) (not b!418396)))

(declare-fun t!12314 () Bool)

(declare-fun tb!3263 () Bool)

(assert (=> (and start!39368 (= defaultEntry!557 defaultEntry!557) t!12314) tb!3263))

(declare-fun result!6061 () Bool)

(assert (=> tb!3263 (= result!6061 tp_is_empty!10801)))

(assert (=> b!418396 t!12314))

(declare-fun b_and!17189 () Bool)

(assert (= b_and!17187 (and (=> t!12314 result!6061) b_and!17189)))

(declare-fun m!408041 () Bool)

(assert (=> start!39368 m!408041))

(declare-fun m!408043 () Bool)

(assert (=> start!39368 m!408043))

(declare-fun m!408045 () Bool)

(assert (=> b!418387 m!408045))

(assert (=> b!418387 m!408045))

(declare-fun m!408047 () Bool)

(assert (=> b!418387 m!408047))

(declare-fun m!408049 () Bool)

(assert (=> b!418387 m!408049))

(declare-fun m!408051 () Bool)

(assert (=> b!418396 m!408051))

(declare-fun m!408053 () Bool)

(assert (=> b!418396 m!408053))

(declare-fun m!408055 () Bool)

(assert (=> b!418396 m!408055))

(declare-fun m!408057 () Bool)

(assert (=> b!418396 m!408057))

(assert (=> b!418396 m!408051))

(declare-fun m!408059 () Bool)

(assert (=> b!418396 m!408059))

(declare-fun m!408061 () Bool)

(assert (=> b!418396 m!408061))

(declare-fun m!408063 () Bool)

(assert (=> b!418396 m!408063))

(declare-fun m!408065 () Bool)

(assert (=> b!418396 m!408065))

(declare-fun m!408067 () Bool)

(assert (=> b!418396 m!408067))

(declare-fun m!408069 () Bool)

(assert (=> b!418396 m!408069))

(declare-fun m!408071 () Bool)

(assert (=> b!418396 m!408071))

(assert (=> b!418396 m!408061))

(declare-fun m!408073 () Bool)

(assert (=> b!418396 m!408073))

(assert (=> b!418396 m!408065))

(declare-fun m!408075 () Bool)

(assert (=> b!418396 m!408075))

(declare-fun m!408077 () Bool)

(assert (=> b!418393 m!408077))

(declare-fun m!408079 () Bool)

(assert (=> b!418400 m!408079))

(declare-fun m!408081 () Bool)

(assert (=> b!418386 m!408081))

(assert (=> b!418386 m!408057))

(declare-fun m!408083 () Bool)

(assert (=> b!418386 m!408083))

(declare-fun m!408085 () Bool)

(assert (=> bm!29109 m!408085))

(declare-fun m!408087 () Bool)

(assert (=> b!418402 m!408087))

(declare-fun m!408089 () Bool)

(assert (=> bm!29110 m!408089))

(declare-fun m!408091 () Bool)

(assert (=> mapNonEmpty!17823 m!408091))

(declare-fun m!408093 () Bool)

(assert (=> b!418391 m!408093))

(declare-fun m!408095 () Bool)

(assert (=> b!418389 m!408095))

(declare-fun m!408097 () Bool)

(assert (=> b!418401 m!408097))

(declare-fun m!408099 () Bool)

(assert (=> b!418397 m!408099))

(declare-fun m!408101 () Bool)

(assert (=> b!418390 m!408101))

(declare-fun m!408103 () Bool)

(assert (=> b!418390 m!408103))

(declare-fun m!408105 () Bool)

(assert (=> b!418388 m!408105))

(check-sat tp_is_empty!10801 (not start!39368) (not b!418400) b_and!17189 (not b!418401) (not b!418402) (not b_next!9649) (not b!418396) (not b!418391) (not mapNonEmpty!17823) (not b!418397) (not b!418386) (not b!418388) (not bm!29110) (not bm!29109) (not b_lambda!8975) (not b!418390) (not b!418393) (not b!418387))
(check-sat b_and!17189 (not b_next!9649))
