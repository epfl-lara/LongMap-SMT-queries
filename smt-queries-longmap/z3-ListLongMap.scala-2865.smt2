; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41232 () Bool)

(assert start!41232)

(declare-fun b_free!11089 () Bool)

(declare-fun b_next!11089 () Bool)

(assert (=> start!41232 (= b_free!11089 (not b_next!11089))))

(declare-fun tp!39106 () Bool)

(declare-fun b_and!19419 () Bool)

(assert (=> start!41232 (= tp!39106 b_and!19419)))

(declare-fun b!461474 () Bool)

(declare-fun res!276091 () Bool)

(declare-fun e!269118 () Bool)

(assert (=> b!461474 (=> (not res!276091) (not e!269118))))

(declare-datatypes ((array!28648 0))(
  ( (array!28649 (arr!13763 (Array (_ BitVec 32) (_ BitVec 64))) (size!14115 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28648)

(declare-datatypes ((V!17675 0))(
  ( (V!17676 (val!6258 Int)) )
))
(declare-datatypes ((ValueCell!5870 0))(
  ( (ValueCellFull!5870 (v!8541 V!17675)) (EmptyCell!5870) )
))
(declare-datatypes ((array!28650 0))(
  ( (array!28651 (arr!13764 (Array (_ BitVec 32) ValueCell!5870)) (size!14116 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28650)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!461474 (= res!276091 (and (= (size!14116 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14115 _keys!709) (size!14116 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!461475 () Bool)

(declare-fun e!269122 () Bool)

(declare-fun tp_is_empty!12427 () Bool)

(assert (=> b!461475 (= e!269122 tp_is_empty!12427)))

(declare-fun b!461476 () Bool)

(declare-fun res!276100 () Bool)

(assert (=> b!461476 (=> (not res!276100) (not e!269118))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461476 (= res!276100 (validKeyInArray!0 k0!794))))

(declare-fun b!461477 () Bool)

(declare-fun res!276092 () Bool)

(assert (=> b!461477 (=> (not res!276092) (not e!269118))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461477 (= res!276092 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14115 _keys!709))))))

(declare-fun b!461478 () Bool)

(declare-fun e!269116 () Bool)

(declare-fun e!269120 () Bool)

(declare-fun mapRes!20293 () Bool)

(assert (=> b!461478 (= e!269116 (and e!269120 mapRes!20293))))

(declare-fun condMapEmpty!20293 () Bool)

(declare-fun mapDefault!20293 () ValueCell!5870)

(assert (=> b!461478 (= condMapEmpty!20293 (= (arr!13764 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5870)) mapDefault!20293)))))

(declare-fun mapNonEmpty!20293 () Bool)

(declare-fun tp!39105 () Bool)

(assert (=> mapNonEmpty!20293 (= mapRes!20293 (and tp!39105 e!269122))))

(declare-fun mapKey!20293 () (_ BitVec 32))

(declare-fun mapValue!20293 () ValueCell!5870)

(declare-fun mapRest!20293 () (Array (_ BitVec 32) ValueCell!5870))

(assert (=> mapNonEmpty!20293 (= (arr!13764 _values!549) (store mapRest!20293 mapKey!20293 mapValue!20293))))

(declare-fun b!461479 () Bool)

(declare-fun res!276098 () Bool)

(assert (=> b!461479 (=> (not res!276098) (not e!269118))))

(declare-fun arrayContainsKey!0 (array!28648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461479 (= res!276098 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!276096 () Bool)

(assert (=> start!41232 (=> (not res!276096) (not e!269118))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!41232 (= res!276096 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14115 _keys!709))))))

(assert (=> start!41232 e!269118))

(assert (=> start!41232 tp_is_empty!12427))

(assert (=> start!41232 tp!39106))

(assert (=> start!41232 true))

(declare-fun array_inv!10032 (array!28650) Bool)

(assert (=> start!41232 (and (array_inv!10032 _values!549) e!269116)))

(declare-fun array_inv!10033 (array!28648) Bool)

(assert (=> start!41232 (array_inv!10033 _keys!709)))

(declare-fun b!461480 () Bool)

(declare-fun res!276095 () Bool)

(assert (=> b!461480 (=> (not res!276095) (not e!269118))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461480 (= res!276095 (validMask!0 mask!1025))))

(declare-fun b!461481 () Bool)

(declare-fun e!269123 () Bool)

(declare-fun e!269117 () Bool)

(assert (=> b!461481 (= e!269123 e!269117)))

(declare-fun res!276099 () Bool)

(assert (=> b!461481 (=> (not res!276099) (not e!269117))))

(assert (=> b!461481 (= res!276099 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!209034 () array!28648)

(declare-fun minValue!515 () V!17675)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!8190 0))(
  ( (tuple2!8191 (_1!4106 (_ BitVec 64)) (_2!4106 V!17675)) )
))
(declare-datatypes ((List!8251 0))(
  ( (Nil!8248) (Cons!8247 (h!9103 tuple2!8190) (t!14185 List!8251)) )
))
(declare-datatypes ((ListLongMap!7105 0))(
  ( (ListLongMap!7106 (toList!3568 List!8251)) )
))
(declare-fun lt!209035 () ListLongMap!7105)

(declare-fun zeroValue!515 () V!17675)

(declare-fun lt!209037 () array!28650)

(declare-fun getCurrentListMapNoExtraKeys!1795 (array!28648 array!28650 (_ BitVec 32) (_ BitVec 32) V!17675 V!17675 (_ BitVec 32) Int) ListLongMap!7105)

(assert (=> b!461481 (= lt!209035 (getCurrentListMapNoExtraKeys!1795 lt!209034 lt!209037 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17675)

(assert (=> b!461481 (= lt!209037 (array!28651 (store (arr!13764 _values!549) i!563 (ValueCellFull!5870 v!412)) (size!14116 _values!549)))))

(declare-fun lt!209032 () ListLongMap!7105)

(assert (=> b!461481 (= lt!209032 (getCurrentListMapNoExtraKeys!1795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!20293 () Bool)

(assert (=> mapIsEmpty!20293 mapRes!20293))

(declare-fun b!461482 () Bool)

(assert (=> b!461482 (= e!269118 e!269123)))

(declare-fun res!276088 () Bool)

(assert (=> b!461482 (=> (not res!276088) (not e!269123))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28648 (_ BitVec 32)) Bool)

(assert (=> b!461482 (= res!276088 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!209034 mask!1025))))

(assert (=> b!461482 (= lt!209034 (array!28649 (store (arr!13763 _keys!709) i!563 k0!794) (size!14115 _keys!709)))))

(declare-fun b!461483 () Bool)

(declare-fun res!276087 () Bool)

(assert (=> b!461483 (=> (not res!276087) (not e!269118))))

(assert (=> b!461483 (= res!276087 (or (= (select (arr!13763 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13763 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461484 () Bool)

(declare-fun res!276089 () Bool)

(assert (=> b!461484 (=> (not res!276089) (not e!269123))))

(declare-datatypes ((List!8252 0))(
  ( (Nil!8249) (Cons!8248 (h!9104 (_ BitVec 64)) (t!14186 List!8252)) )
))
(declare-fun arrayNoDuplicates!0 (array!28648 (_ BitVec 32) List!8252) Bool)

(assert (=> b!461484 (= res!276089 (arrayNoDuplicates!0 lt!209034 #b00000000000000000000000000000000 Nil!8249))))

(declare-fun b!461485 () Bool)

(assert (=> b!461485 (= e!269120 tp_is_empty!12427)))

(declare-fun b!461486 () Bool)

(declare-fun res!276093 () Bool)

(assert (=> b!461486 (=> (not res!276093) (not e!269123))))

(assert (=> b!461486 (= res!276093 (bvsle from!863 i!563))))

(declare-fun b!461487 () Bool)

(declare-fun e!269121 () Bool)

(assert (=> b!461487 (= e!269117 (not e!269121))))

(declare-fun res!276094 () Bool)

(assert (=> b!461487 (=> res!276094 e!269121)))

(assert (=> b!461487 (= res!276094 (validKeyInArray!0 (select (arr!13763 _keys!709) from!863)))))

(declare-fun lt!209036 () tuple2!8190)

(declare-fun +!1643 (ListLongMap!7105 tuple2!8190) ListLongMap!7105)

(assert (=> b!461487 (= (getCurrentListMapNoExtraKeys!1795 lt!209034 lt!209037 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1643 (getCurrentListMapNoExtraKeys!1795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!209036))))

(assert (=> b!461487 (= lt!209036 (tuple2!8191 k0!794 v!412))))

(declare-datatypes ((Unit!13430 0))(
  ( (Unit!13431) )
))
(declare-fun lt!209033 () Unit!13430)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!797 (array!28648 array!28650 (_ BitVec 32) (_ BitVec 32) V!17675 V!17675 (_ BitVec 32) (_ BitVec 64) V!17675 (_ BitVec 32) Int) Unit!13430)

(assert (=> b!461487 (= lt!209033 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!797 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!461488 () Bool)

(assert (=> b!461488 (= e!269121 (= lt!209035 (+!1643 lt!209032 lt!209036)))))

(declare-fun b!461489 () Bool)

(declare-fun res!276097 () Bool)

(assert (=> b!461489 (=> (not res!276097) (not e!269118))))

(assert (=> b!461489 (= res!276097 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8249))))

(declare-fun b!461490 () Bool)

(declare-fun res!276090 () Bool)

(assert (=> b!461490 (=> (not res!276090) (not e!269118))))

(assert (=> b!461490 (= res!276090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(assert (= (and start!41232 res!276096) b!461480))

(assert (= (and b!461480 res!276095) b!461474))

(assert (= (and b!461474 res!276091) b!461490))

(assert (= (and b!461490 res!276090) b!461489))

(assert (= (and b!461489 res!276097) b!461477))

(assert (= (and b!461477 res!276092) b!461476))

(assert (= (and b!461476 res!276100) b!461483))

(assert (= (and b!461483 res!276087) b!461479))

(assert (= (and b!461479 res!276098) b!461482))

(assert (= (and b!461482 res!276088) b!461484))

(assert (= (and b!461484 res!276089) b!461486))

(assert (= (and b!461486 res!276093) b!461481))

(assert (= (and b!461481 res!276099) b!461487))

(assert (= (and b!461487 (not res!276094)) b!461488))

(assert (= (and b!461478 condMapEmpty!20293) mapIsEmpty!20293))

(assert (= (and b!461478 (not condMapEmpty!20293)) mapNonEmpty!20293))

(get-info :version)

(assert (= (and mapNonEmpty!20293 ((_ is ValueCellFull!5870) mapValue!20293)) b!461475))

(assert (= (and b!461478 ((_ is ValueCellFull!5870) mapDefault!20293)) b!461485))

(assert (= start!41232 b!461478))

(declare-fun m!444851 () Bool)

(assert (=> b!461481 m!444851))

(declare-fun m!444853 () Bool)

(assert (=> b!461481 m!444853))

(declare-fun m!444855 () Bool)

(assert (=> b!461481 m!444855))

(declare-fun m!444857 () Bool)

(assert (=> b!461484 m!444857))

(declare-fun m!444859 () Bool)

(assert (=> mapNonEmpty!20293 m!444859))

(declare-fun m!444861 () Bool)

(assert (=> b!461479 m!444861))

(declare-fun m!444863 () Bool)

(assert (=> start!41232 m!444863))

(declare-fun m!444865 () Bool)

(assert (=> start!41232 m!444865))

(declare-fun m!444867 () Bool)

(assert (=> b!461487 m!444867))

(declare-fun m!444869 () Bool)

(assert (=> b!461487 m!444869))

(declare-fun m!444871 () Bool)

(assert (=> b!461487 m!444871))

(assert (=> b!461487 m!444867))

(declare-fun m!444873 () Bool)

(assert (=> b!461487 m!444873))

(assert (=> b!461487 m!444869))

(declare-fun m!444875 () Bool)

(assert (=> b!461487 m!444875))

(declare-fun m!444877 () Bool)

(assert (=> b!461487 m!444877))

(declare-fun m!444879 () Bool)

(assert (=> b!461476 m!444879))

(declare-fun m!444881 () Bool)

(assert (=> b!461483 m!444881))

(declare-fun m!444883 () Bool)

(assert (=> b!461489 m!444883))

(declare-fun m!444885 () Bool)

(assert (=> b!461480 m!444885))

(declare-fun m!444887 () Bool)

(assert (=> b!461490 m!444887))

(declare-fun m!444889 () Bool)

(assert (=> b!461488 m!444889))

(declare-fun m!444891 () Bool)

(assert (=> b!461482 m!444891))

(declare-fun m!444893 () Bool)

(assert (=> b!461482 m!444893))

(check-sat (not b!461479) (not b!461487) (not start!41232) (not b!461484) (not b!461481) b_and!19419 (not mapNonEmpty!20293) (not b!461488) (not b!461489) (not b!461482) tp_is_empty!12427 (not b_next!11089) (not b!461476) (not b!461480) (not b!461490))
(check-sat b_and!19419 (not b_next!11089))
(get-model)

(declare-fun e!269190 () Bool)

(declare-fun b!461617 () Bool)

(declare-fun lt!209093 () ListLongMap!7105)

(assert (=> b!461617 (= e!269190 (= lt!209093 (getCurrentListMapNoExtraKeys!1795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!461618 () Bool)

(declare-fun e!269186 () ListLongMap!7105)

(assert (=> b!461618 (= e!269186 (ListLongMap!7106 Nil!8248))))

(declare-fun bm!30157 () Bool)

(declare-fun call!30160 () ListLongMap!7105)

(assert (=> bm!30157 (= call!30160 (getCurrentListMapNoExtraKeys!1795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!461619 () Bool)

(declare-fun res!276195 () Bool)

(declare-fun e!269188 () Bool)

(assert (=> b!461619 (=> (not res!276195) (not e!269188))))

(declare-fun contains!2492 (ListLongMap!7105 (_ BitVec 64)) Bool)

(assert (=> b!461619 (= res!276195 (not (contains!2492 lt!209093 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!74893 () Bool)

(assert (=> d!74893 e!269188))

(declare-fun res!276196 () Bool)

(assert (=> d!74893 (=> (not res!276196) (not e!269188))))

(assert (=> d!74893 (= res!276196 (not (contains!2492 lt!209093 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74893 (= lt!209093 e!269186)))

(declare-fun c!56566 () Bool)

(assert (=> d!74893 (= c!56566 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14115 _keys!709)))))

(assert (=> d!74893 (validMask!0 mask!1025)))

(assert (=> d!74893 (= (getCurrentListMapNoExtraKeys!1795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!209093)))

(declare-fun b!461620 () Bool)

(declare-fun e!269187 () ListLongMap!7105)

(assert (=> b!461620 (= e!269186 e!269187)))

(declare-fun c!56565 () Bool)

(assert (=> b!461620 (= c!56565 (validKeyInArray!0 (select (arr!13763 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!461621 () Bool)

(declare-fun lt!209090 () Unit!13430)

(declare-fun lt!209094 () Unit!13430)

(assert (=> b!461621 (= lt!209090 lt!209094)))

(declare-fun lt!209089 () (_ BitVec 64))

(declare-fun lt!209088 () V!17675)

(declare-fun lt!209092 () (_ BitVec 64))

(declare-fun lt!209091 () ListLongMap!7105)

(assert (=> b!461621 (not (contains!2492 (+!1643 lt!209091 (tuple2!8191 lt!209089 lt!209088)) lt!209092))))

(declare-fun addStillNotContains!153 (ListLongMap!7105 (_ BitVec 64) V!17675 (_ BitVec 64)) Unit!13430)

(assert (=> b!461621 (= lt!209094 (addStillNotContains!153 lt!209091 lt!209089 lt!209088 lt!209092))))

(assert (=> b!461621 (= lt!209092 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!6800 (ValueCell!5870 V!17675) V!17675)

(declare-fun dynLambda!908 (Int (_ BitVec 64)) V!17675)

(assert (=> b!461621 (= lt!209088 (get!6800 (select (arr!13764 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!908 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!461621 (= lt!209089 (select (arr!13763 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!461621 (= lt!209091 call!30160)))

(assert (=> b!461621 (= e!269187 (+!1643 call!30160 (tuple2!8191 (select (arr!13763 _keys!709) (bvadd #b00000000000000000000000000000001 from!863)) (get!6800 (select (arr!13764 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!908 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!461622 () Bool)

(declare-fun e!269191 () Bool)

(assert (=> b!461622 (= e!269188 e!269191)))

(declare-fun c!56563 () Bool)

(declare-fun e!269192 () Bool)

(assert (=> b!461622 (= c!56563 e!269192)))

(declare-fun res!276193 () Bool)

(assert (=> b!461622 (=> (not res!276193) (not e!269192))))

(assert (=> b!461622 (= res!276193 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14115 _keys!709)))))

(declare-fun b!461623 () Bool)

(assert (=> b!461623 (= e!269187 call!30160)))

(declare-fun b!461624 () Bool)

(assert (=> b!461624 (= e!269191 e!269190)))

(declare-fun c!56564 () Bool)

(assert (=> b!461624 (= c!56564 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14115 _keys!709)))))

(declare-fun b!461625 () Bool)

(declare-fun e!269189 () Bool)

(assert (=> b!461625 (= e!269191 e!269189)))

(assert (=> b!461625 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14115 _keys!709)))))

(declare-fun res!276194 () Bool)

(assert (=> b!461625 (= res!276194 (contains!2492 lt!209093 (select (arr!13763 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!461625 (=> (not res!276194) (not e!269189))))

(declare-fun b!461626 () Bool)

(declare-fun isEmpty!571 (ListLongMap!7105) Bool)

(assert (=> b!461626 (= e!269190 (isEmpty!571 lt!209093))))

(declare-fun b!461627 () Bool)

(assert (=> b!461627 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14115 _keys!709)))))

(assert (=> b!461627 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14116 _values!549)))))

(declare-fun apply!318 (ListLongMap!7105 (_ BitVec 64)) V!17675)

(assert (=> b!461627 (= e!269189 (= (apply!318 lt!209093 (select (arr!13763 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))) (get!6800 (select (arr!13764 _values!549) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!908 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!461628 () Bool)

(assert (=> b!461628 (= e!269192 (validKeyInArray!0 (select (arr!13763 _keys!709) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!461628 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(assert (= (and d!74893 c!56566) b!461618))

(assert (= (and d!74893 (not c!56566)) b!461620))

(assert (= (and b!461620 c!56565) b!461621))

(assert (= (and b!461620 (not c!56565)) b!461623))

(assert (= (or b!461621 b!461623) bm!30157))

(assert (= (and d!74893 res!276196) b!461619))

(assert (= (and b!461619 res!276195) b!461622))

(assert (= (and b!461622 res!276193) b!461628))

(assert (= (and b!461622 c!56563) b!461625))

(assert (= (and b!461622 (not c!56563)) b!461624))

(assert (= (and b!461625 res!276194) b!461627))

(assert (= (and b!461624 c!56564) b!461617))

(assert (= (and b!461624 (not c!56564)) b!461626))

(declare-fun b_lambda!9947 () Bool)

(assert (=> (not b_lambda!9947) (not b!461621)))

(declare-fun t!14191 () Bool)

(declare-fun tb!3893 () Bool)

(assert (=> (and start!41232 (= defaultEntry!557 defaultEntry!557) t!14191) tb!3893))

(declare-fun result!7341 () Bool)

(assert (=> tb!3893 (= result!7341 tp_is_empty!12427)))

(assert (=> b!461621 t!14191))

(declare-fun b_and!19425 () Bool)

(assert (= b_and!19419 (and (=> t!14191 result!7341) b_and!19425)))

(declare-fun b_lambda!9949 () Bool)

(assert (=> (not b_lambda!9949) (not b!461627)))

(assert (=> b!461627 t!14191))

(declare-fun b_and!19427 () Bool)

(assert (= b_and!19425 (and (=> t!14191 result!7341) b_and!19427)))

(declare-fun m!444983 () Bool)

(assert (=> b!461626 m!444983))

(declare-fun m!444985 () Bool)

(assert (=> b!461627 m!444985))

(declare-fun m!444987 () Bool)

(assert (=> b!461627 m!444987))

(declare-fun m!444989 () Bool)

(assert (=> b!461627 m!444989))

(assert (=> b!461627 m!444985))

(assert (=> b!461627 m!444987))

(declare-fun m!444991 () Bool)

(assert (=> b!461627 m!444991))

(declare-fun m!444993 () Bool)

(assert (=> b!461627 m!444993))

(assert (=> b!461627 m!444991))

(declare-fun m!444995 () Bool)

(assert (=> d!74893 m!444995))

(assert (=> d!74893 m!444885))

(declare-fun m!444997 () Bool)

(assert (=> bm!30157 m!444997))

(assert (=> b!461625 m!444991))

(assert (=> b!461625 m!444991))

(declare-fun m!444999 () Bool)

(assert (=> b!461625 m!444999))

(assert (=> b!461617 m!444997))

(assert (=> b!461628 m!444991))

(assert (=> b!461628 m!444991))

(declare-fun m!445001 () Bool)

(assert (=> b!461628 m!445001))

(declare-fun m!445003 () Bool)

(assert (=> b!461619 m!445003))

(assert (=> b!461621 m!444985))

(assert (=> b!461621 m!444987))

(assert (=> b!461621 m!444989))

(assert (=> b!461621 m!444985))

(declare-fun m!445005 () Bool)

(assert (=> b!461621 m!445005))

(declare-fun m!445007 () Bool)

(assert (=> b!461621 m!445007))

(assert (=> b!461621 m!444987))

(assert (=> b!461621 m!445007))

(declare-fun m!445009 () Bool)

(assert (=> b!461621 m!445009))

(declare-fun m!445011 () Bool)

(assert (=> b!461621 m!445011))

(assert (=> b!461621 m!444991))

(assert (=> b!461620 m!444991))

(assert (=> b!461620 m!444991))

(assert (=> b!461620 m!445001))

(assert (=> b!461487 d!74893))

(declare-fun d!74895 () Bool)

(declare-fun e!269195 () Bool)

(assert (=> d!74895 e!269195))

(declare-fun res!276202 () Bool)

(assert (=> d!74895 (=> (not res!276202) (not e!269195))))

(declare-fun lt!209106 () ListLongMap!7105)

(assert (=> d!74895 (= res!276202 (contains!2492 lt!209106 (_1!4106 lt!209036)))))

(declare-fun lt!209103 () List!8251)

(assert (=> d!74895 (= lt!209106 (ListLongMap!7106 lt!209103))))

(declare-fun lt!209104 () Unit!13430)

(declare-fun lt!209105 () Unit!13430)

(assert (=> d!74895 (= lt!209104 lt!209105)))

(declare-datatypes ((Option!382 0))(
  ( (Some!381 (v!8547 V!17675)) (None!380) )
))
(declare-fun getValueByKey!376 (List!8251 (_ BitVec 64)) Option!382)

(assert (=> d!74895 (= (getValueByKey!376 lt!209103 (_1!4106 lt!209036)) (Some!381 (_2!4106 lt!209036)))))

(declare-fun lemmaContainsTupThenGetReturnValue!198 (List!8251 (_ BitVec 64) V!17675) Unit!13430)

(assert (=> d!74895 (= lt!209105 (lemmaContainsTupThenGetReturnValue!198 lt!209103 (_1!4106 lt!209036) (_2!4106 lt!209036)))))

(declare-fun insertStrictlySorted!201 (List!8251 (_ BitVec 64) V!17675) List!8251)

(assert (=> d!74895 (= lt!209103 (insertStrictlySorted!201 (toList!3568 (getCurrentListMapNoExtraKeys!1795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557)) (_1!4106 lt!209036) (_2!4106 lt!209036)))))

(assert (=> d!74895 (= (+!1643 (getCurrentListMapNoExtraKeys!1795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!209036) lt!209106)))

(declare-fun b!461635 () Bool)

(declare-fun res!276201 () Bool)

(assert (=> b!461635 (=> (not res!276201) (not e!269195))))

(assert (=> b!461635 (= res!276201 (= (getValueByKey!376 (toList!3568 lt!209106) (_1!4106 lt!209036)) (Some!381 (_2!4106 lt!209036))))))

(declare-fun b!461636 () Bool)

(declare-fun contains!2493 (List!8251 tuple2!8190) Bool)

(assert (=> b!461636 (= e!269195 (contains!2493 (toList!3568 lt!209106) lt!209036))))

(assert (= (and d!74895 res!276202) b!461635))

(assert (= (and b!461635 res!276201) b!461636))

(declare-fun m!445013 () Bool)

(assert (=> d!74895 m!445013))

(declare-fun m!445015 () Bool)

(assert (=> d!74895 m!445015))

(declare-fun m!445017 () Bool)

(assert (=> d!74895 m!445017))

(declare-fun m!445019 () Bool)

(assert (=> d!74895 m!445019))

(declare-fun m!445021 () Bool)

(assert (=> b!461635 m!445021))

(declare-fun m!445023 () Bool)

(assert (=> b!461636 m!445023))

(assert (=> b!461487 d!74895))

(declare-fun e!269200 () Bool)

(declare-fun b!461637 () Bool)

(declare-fun lt!209112 () ListLongMap!7105)

(assert (=> b!461637 (= e!269200 (= lt!209112 (getCurrentListMapNoExtraKeys!1795 lt!209034 lt!209037 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!461638 () Bool)

(declare-fun e!269196 () ListLongMap!7105)

(assert (=> b!461638 (= e!269196 (ListLongMap!7106 Nil!8248))))

(declare-fun bm!30158 () Bool)

(declare-fun call!30161 () ListLongMap!7105)

(assert (=> bm!30158 (= call!30161 (getCurrentListMapNoExtraKeys!1795 lt!209034 lt!209037 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!461639 () Bool)

(declare-fun res!276205 () Bool)

(declare-fun e!269198 () Bool)

(assert (=> b!461639 (=> (not res!276205) (not e!269198))))

(assert (=> b!461639 (= res!276205 (not (contains!2492 lt!209112 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!74897 () Bool)

(assert (=> d!74897 e!269198))

(declare-fun res!276206 () Bool)

(assert (=> d!74897 (=> (not res!276206) (not e!269198))))

(assert (=> d!74897 (= res!276206 (not (contains!2492 lt!209112 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74897 (= lt!209112 e!269196)))

(declare-fun c!56570 () Bool)

(assert (=> d!74897 (= c!56570 (bvsge (bvadd #b00000000000000000000000000000001 from!863) (size!14115 lt!209034)))))

(assert (=> d!74897 (validMask!0 mask!1025)))

(assert (=> d!74897 (= (getCurrentListMapNoExtraKeys!1795 lt!209034 lt!209037 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!209112)))

(declare-fun b!461640 () Bool)

(declare-fun e!269197 () ListLongMap!7105)

(assert (=> b!461640 (= e!269196 e!269197)))

(declare-fun c!56569 () Bool)

(assert (=> b!461640 (= c!56569 (validKeyInArray!0 (select (arr!13763 lt!209034) (bvadd #b00000000000000000000000000000001 from!863))))))

(declare-fun b!461641 () Bool)

(declare-fun lt!209109 () Unit!13430)

(declare-fun lt!209113 () Unit!13430)

(assert (=> b!461641 (= lt!209109 lt!209113)))

(declare-fun lt!209111 () (_ BitVec 64))

(declare-fun lt!209107 () V!17675)

(declare-fun lt!209110 () ListLongMap!7105)

(declare-fun lt!209108 () (_ BitVec 64))

(assert (=> b!461641 (not (contains!2492 (+!1643 lt!209110 (tuple2!8191 lt!209108 lt!209107)) lt!209111))))

(assert (=> b!461641 (= lt!209113 (addStillNotContains!153 lt!209110 lt!209108 lt!209107 lt!209111))))

(assert (=> b!461641 (= lt!209111 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!461641 (= lt!209107 (get!6800 (select (arr!13764 lt!209037) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!908 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!461641 (= lt!209108 (select (arr!13763 lt!209034) (bvadd #b00000000000000000000000000000001 from!863)))))

(assert (=> b!461641 (= lt!209110 call!30161)))

(assert (=> b!461641 (= e!269197 (+!1643 call!30161 (tuple2!8191 (select (arr!13763 lt!209034) (bvadd #b00000000000000000000000000000001 from!863)) (get!6800 (select (arr!13764 lt!209037) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!908 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!461642 () Bool)

(declare-fun e!269201 () Bool)

(assert (=> b!461642 (= e!269198 e!269201)))

(declare-fun c!56567 () Bool)

(declare-fun e!269202 () Bool)

(assert (=> b!461642 (= c!56567 e!269202)))

(declare-fun res!276203 () Bool)

(assert (=> b!461642 (=> (not res!276203) (not e!269202))))

(assert (=> b!461642 (= res!276203 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14115 lt!209034)))))

(declare-fun b!461643 () Bool)

(assert (=> b!461643 (= e!269197 call!30161)))

(declare-fun b!461644 () Bool)

(assert (=> b!461644 (= e!269201 e!269200)))

(declare-fun c!56568 () Bool)

(assert (=> b!461644 (= c!56568 (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14115 lt!209034)))))

(declare-fun b!461645 () Bool)

(declare-fun e!269199 () Bool)

(assert (=> b!461645 (= e!269201 e!269199)))

(assert (=> b!461645 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14115 lt!209034)))))

(declare-fun res!276204 () Bool)

(assert (=> b!461645 (= res!276204 (contains!2492 lt!209112 (select (arr!13763 lt!209034) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!461645 (=> (not res!276204) (not e!269199))))

(declare-fun b!461646 () Bool)

(assert (=> b!461646 (= e!269200 (isEmpty!571 lt!209112))))

(declare-fun b!461647 () Bool)

(assert (=> b!461647 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14115 lt!209034)))))

(assert (=> b!461647 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvslt (bvadd #b00000000000000000000000000000001 from!863) (size!14116 lt!209037)))))

(assert (=> b!461647 (= e!269199 (= (apply!318 lt!209112 (select (arr!13763 lt!209034) (bvadd #b00000000000000000000000000000001 from!863))) (get!6800 (select (arr!13764 lt!209037) (bvadd #b00000000000000000000000000000001 from!863)) (dynLambda!908 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!461648 () Bool)

(assert (=> b!461648 (= e!269202 (validKeyInArray!0 (select (arr!13763 lt!209034) (bvadd #b00000000000000000000000000000001 from!863))))))

(assert (=> b!461648 (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))

(assert (= (and d!74897 c!56570) b!461638))

(assert (= (and d!74897 (not c!56570)) b!461640))

(assert (= (and b!461640 c!56569) b!461641))

(assert (= (and b!461640 (not c!56569)) b!461643))

(assert (= (or b!461641 b!461643) bm!30158))

(assert (= (and d!74897 res!276206) b!461639))

(assert (= (and b!461639 res!276205) b!461642))

(assert (= (and b!461642 res!276203) b!461648))

(assert (= (and b!461642 c!56567) b!461645))

(assert (= (and b!461642 (not c!56567)) b!461644))

(assert (= (and b!461645 res!276204) b!461647))

(assert (= (and b!461644 c!56568) b!461637))

(assert (= (and b!461644 (not c!56568)) b!461646))

(declare-fun b_lambda!9951 () Bool)

(assert (=> (not b_lambda!9951) (not b!461641)))

(assert (=> b!461641 t!14191))

(declare-fun b_and!19429 () Bool)

(assert (= b_and!19427 (and (=> t!14191 result!7341) b_and!19429)))

(declare-fun b_lambda!9953 () Bool)

(assert (=> (not b_lambda!9953) (not b!461647)))

(assert (=> b!461647 t!14191))

(declare-fun b_and!19431 () Bool)

(assert (= b_and!19429 (and (=> t!14191 result!7341) b_and!19431)))

(declare-fun m!445025 () Bool)

(assert (=> b!461646 m!445025))

(declare-fun m!445027 () Bool)

(assert (=> b!461647 m!445027))

(assert (=> b!461647 m!444987))

(declare-fun m!445029 () Bool)

(assert (=> b!461647 m!445029))

(assert (=> b!461647 m!445027))

(assert (=> b!461647 m!444987))

(declare-fun m!445031 () Bool)

(assert (=> b!461647 m!445031))

(declare-fun m!445033 () Bool)

(assert (=> b!461647 m!445033))

(assert (=> b!461647 m!445031))

(declare-fun m!445035 () Bool)

(assert (=> d!74897 m!445035))

(assert (=> d!74897 m!444885))

(declare-fun m!445037 () Bool)

(assert (=> bm!30158 m!445037))

(assert (=> b!461645 m!445031))

(assert (=> b!461645 m!445031))

(declare-fun m!445039 () Bool)

(assert (=> b!461645 m!445039))

(assert (=> b!461637 m!445037))

(assert (=> b!461648 m!445031))

(assert (=> b!461648 m!445031))

(declare-fun m!445041 () Bool)

(assert (=> b!461648 m!445041))

(declare-fun m!445043 () Bool)

(assert (=> b!461639 m!445043))

(assert (=> b!461641 m!445027))

(assert (=> b!461641 m!444987))

(assert (=> b!461641 m!445029))

(assert (=> b!461641 m!445027))

(declare-fun m!445045 () Bool)

(assert (=> b!461641 m!445045))

(declare-fun m!445047 () Bool)

(assert (=> b!461641 m!445047))

(assert (=> b!461641 m!444987))

(assert (=> b!461641 m!445047))

(declare-fun m!445049 () Bool)

(assert (=> b!461641 m!445049))

(declare-fun m!445051 () Bool)

(assert (=> b!461641 m!445051))

(assert (=> b!461641 m!445031))

(assert (=> b!461640 m!445031))

(assert (=> b!461640 m!445031))

(assert (=> b!461640 m!445041))

(assert (=> b!461487 d!74897))

(declare-fun d!74899 () Bool)

(assert (=> d!74899 (= (validKeyInArray!0 (select (arr!13763 _keys!709) from!863)) (and (not (= (select (arr!13763 _keys!709) from!863) #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= (select (arr!13763 _keys!709) from!863) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!461487 d!74899))

(declare-fun d!74901 () Bool)

(declare-fun e!269207 () Bool)

(assert (=> d!74901 e!269207))

(declare-fun res!276209 () Bool)

(assert (=> d!74901 (=> (not res!276209) (not e!269207))))

(assert (=> d!74901 (= res!276209 (and (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14115 _keys!709)))) (or (not (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563)) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14116 _values!549)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14115 _keys!709)))) (or (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563) (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14116 _values!549))))))))

(declare-fun lt!209116 () Unit!13430)

(declare-fun choose!1343 (array!28648 array!28650 (_ BitVec 32) (_ BitVec 32) V!17675 V!17675 (_ BitVec 32) (_ BitVec 64) V!17675 (_ BitVec 32) Int) Unit!13430)

(assert (=> d!74901 (= lt!209116 (choose!1343 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> d!74901 (and (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!14115 _keys!709)))))

(assert (=> d!74901 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!797 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) lt!209116)))

(declare-fun call!30166 () ListLongMap!7105)

(declare-fun bm!30163 () Bool)

(assert (=> bm!30163 (= call!30166 (getCurrentListMapNoExtraKeys!1795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun call!30167 () ListLongMap!7105)

(declare-fun b!461655 () Bool)

(declare-fun e!269208 () Bool)

(assert (=> b!461655 (= e!269208 (= call!30167 (+!1643 call!30166 (tuple2!8191 k0!794 v!412))))))

(declare-fun b!461656 () Bool)

(assert (=> b!461656 (= e!269207 e!269208)))

(declare-fun c!56573 () Bool)

(assert (=> b!461656 (= c!56573 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun bm!30164 () Bool)

(assert (=> bm!30164 (= call!30167 (getCurrentListMapNoExtraKeys!1795 (array!28649 (store (arr!13763 _keys!709) i!563 k0!794) (size!14115 _keys!709)) (array!28651 (store (arr!13764 _values!549) i!563 (ValueCellFull!5870 v!412)) (size!14116 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!461657 () Bool)

(assert (=> b!461657 (= e!269208 (= call!30167 call!30166))))

(assert (= (and d!74901 res!276209) b!461656))

(assert (= (and b!461656 c!56573) b!461655))

(assert (= (and b!461656 (not c!56573)) b!461657))

(assert (= (or b!461655 b!461657) bm!30163))

(assert (= (or b!461655 b!461657) bm!30164))

(declare-fun m!445053 () Bool)

(assert (=> d!74901 m!445053))

(assert (=> bm!30163 m!444869))

(declare-fun m!445055 () Bool)

(assert (=> b!461655 m!445055))

(assert (=> bm!30164 m!444893))

(assert (=> bm!30164 m!444853))

(declare-fun m!445057 () Bool)

(assert (=> bm!30164 m!445057))

(assert (=> b!461487 d!74901))

(declare-fun b!461668 () Bool)

(declare-fun e!269220 () Bool)

(declare-fun call!30170 () Bool)

(assert (=> b!461668 (= e!269220 call!30170)))

(declare-fun bm!30167 () Bool)

(declare-fun c!56576 () Bool)

(assert (=> bm!30167 (= call!30170 (arrayNoDuplicates!0 lt!209034 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56576 (Cons!8248 (select (arr!13763 lt!209034) #b00000000000000000000000000000000) Nil!8249) Nil!8249)))))

(declare-fun b!461669 () Bool)

(assert (=> b!461669 (= e!269220 call!30170)))

(declare-fun d!74903 () Bool)

(declare-fun res!276216 () Bool)

(declare-fun e!269219 () Bool)

(assert (=> d!74903 (=> res!276216 e!269219)))

(assert (=> d!74903 (= res!276216 (bvsge #b00000000000000000000000000000000 (size!14115 lt!209034)))))

(assert (=> d!74903 (= (arrayNoDuplicates!0 lt!209034 #b00000000000000000000000000000000 Nil!8249) e!269219)))

(declare-fun b!461670 () Bool)

(declare-fun e!269217 () Bool)

(assert (=> b!461670 (= e!269217 e!269220)))

(assert (=> b!461670 (= c!56576 (validKeyInArray!0 (select (arr!13763 lt!209034) #b00000000000000000000000000000000)))))

(declare-fun b!461671 () Bool)

(declare-fun e!269218 () Bool)

(declare-fun contains!2494 (List!8252 (_ BitVec 64)) Bool)

(assert (=> b!461671 (= e!269218 (contains!2494 Nil!8249 (select (arr!13763 lt!209034) #b00000000000000000000000000000000)))))

(declare-fun b!461672 () Bool)

(assert (=> b!461672 (= e!269219 e!269217)))

(declare-fun res!276218 () Bool)

(assert (=> b!461672 (=> (not res!276218) (not e!269217))))

(assert (=> b!461672 (= res!276218 (not e!269218))))

(declare-fun res!276217 () Bool)

(assert (=> b!461672 (=> (not res!276217) (not e!269218))))

(assert (=> b!461672 (= res!276217 (validKeyInArray!0 (select (arr!13763 lt!209034) #b00000000000000000000000000000000)))))

(assert (= (and d!74903 (not res!276216)) b!461672))

(assert (= (and b!461672 res!276217) b!461671))

(assert (= (and b!461672 res!276218) b!461670))

(assert (= (and b!461670 c!56576) b!461668))

(assert (= (and b!461670 (not c!56576)) b!461669))

(assert (= (or b!461668 b!461669) bm!30167))

(declare-fun m!445059 () Bool)

(assert (=> bm!30167 m!445059))

(declare-fun m!445061 () Bool)

(assert (=> bm!30167 m!445061))

(assert (=> b!461670 m!445059))

(assert (=> b!461670 m!445059))

(declare-fun m!445063 () Bool)

(assert (=> b!461670 m!445063))

(assert (=> b!461671 m!445059))

(assert (=> b!461671 m!445059))

(declare-fun m!445065 () Bool)

(assert (=> b!461671 m!445065))

(assert (=> b!461672 m!445059))

(assert (=> b!461672 m!445059))

(assert (=> b!461672 m!445063))

(assert (=> b!461484 d!74903))

(declare-fun d!74905 () Bool)

(assert (=> d!74905 (= (validKeyInArray!0 k0!794) (and (not (= k0!794 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!794 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!461476 d!74905))

(declare-fun d!74907 () Bool)

(assert (=> d!74907 (= (array_inv!10032 _values!549) (bvsge (size!14116 _values!549) #b00000000000000000000000000000000))))

(assert (=> start!41232 d!74907))

(declare-fun d!74909 () Bool)

(assert (=> d!74909 (= (array_inv!10033 _keys!709) (bvsge (size!14115 _keys!709) #b00000000000000000000000000000000))))

(assert (=> start!41232 d!74909))

(declare-fun b!461681 () Bool)

(declare-fun e!269229 () Bool)

(declare-fun call!30173 () Bool)

(assert (=> b!461681 (= e!269229 call!30173)))

(declare-fun bm!30170 () Bool)

(assert (=> bm!30170 (= call!30173 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!209034 mask!1025))))

(declare-fun b!461682 () Bool)

(declare-fun e!269228 () Bool)

(assert (=> b!461682 (= e!269228 call!30173)))

(declare-fun b!461683 () Bool)

(assert (=> b!461683 (= e!269229 e!269228)))

(declare-fun lt!209124 () (_ BitVec 64))

(assert (=> b!461683 (= lt!209124 (select (arr!13763 lt!209034) #b00000000000000000000000000000000))))

(declare-fun lt!209125 () Unit!13430)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!28648 (_ BitVec 64) (_ BitVec 32)) Unit!13430)

(assert (=> b!461683 (= lt!209125 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!209034 lt!209124 #b00000000000000000000000000000000))))

(assert (=> b!461683 (arrayContainsKey!0 lt!209034 lt!209124 #b00000000000000000000000000000000)))

(declare-fun lt!209123 () Unit!13430)

(assert (=> b!461683 (= lt!209123 lt!209125)))

(declare-fun res!276223 () Bool)

(declare-datatypes ((SeekEntryResult!3486 0))(
  ( (MissingZero!3486 (index!16123 (_ BitVec 32))) (Found!3486 (index!16124 (_ BitVec 32))) (Intermediate!3486 (undefined!4298 Bool) (index!16125 (_ BitVec 32)) (x!42969 (_ BitVec 32))) (Undefined!3486) (MissingVacant!3486 (index!16126 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!28648 (_ BitVec 32)) SeekEntryResult!3486)

(assert (=> b!461683 (= res!276223 (= (seekEntryOrOpen!0 (select (arr!13763 lt!209034) #b00000000000000000000000000000000) lt!209034 mask!1025) (Found!3486 #b00000000000000000000000000000000)))))

(assert (=> b!461683 (=> (not res!276223) (not e!269228))))

(declare-fun b!461684 () Bool)

(declare-fun e!269227 () Bool)

(assert (=> b!461684 (= e!269227 e!269229)))

(declare-fun c!56579 () Bool)

(assert (=> b!461684 (= c!56579 (validKeyInArray!0 (select (arr!13763 lt!209034) #b00000000000000000000000000000000)))))

(declare-fun d!74911 () Bool)

(declare-fun res!276224 () Bool)

(assert (=> d!74911 (=> res!276224 e!269227)))

(assert (=> d!74911 (= res!276224 (bvsge #b00000000000000000000000000000000 (size!14115 lt!209034)))))

(assert (=> d!74911 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!209034 mask!1025) e!269227)))

(assert (= (and d!74911 (not res!276224)) b!461684))

(assert (= (and b!461684 c!56579) b!461683))

(assert (= (and b!461684 (not c!56579)) b!461681))

(assert (= (and b!461683 res!276223) b!461682))

(assert (= (or b!461682 b!461681) bm!30170))

(declare-fun m!445067 () Bool)

(assert (=> bm!30170 m!445067))

(assert (=> b!461683 m!445059))

(declare-fun m!445069 () Bool)

(assert (=> b!461683 m!445069))

(declare-fun m!445071 () Bool)

(assert (=> b!461683 m!445071))

(assert (=> b!461683 m!445059))

(declare-fun m!445073 () Bool)

(assert (=> b!461683 m!445073))

(assert (=> b!461684 m!445059))

(assert (=> b!461684 m!445059))

(assert (=> b!461684 m!445063))

(assert (=> b!461482 d!74911))

(declare-fun lt!209131 () ListLongMap!7105)

(declare-fun e!269234 () Bool)

(declare-fun b!461685 () Bool)

(assert (=> b!461685 (= e!269234 (= lt!209131 (getCurrentListMapNoExtraKeys!1795 lt!209034 lt!209037 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!461686 () Bool)

(declare-fun e!269230 () ListLongMap!7105)

(assert (=> b!461686 (= e!269230 (ListLongMap!7106 Nil!8248))))

(declare-fun call!30174 () ListLongMap!7105)

(declare-fun bm!30171 () Bool)

(assert (=> bm!30171 (= call!30174 (getCurrentListMapNoExtraKeys!1795 lt!209034 lt!209037 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!461687 () Bool)

(declare-fun res!276227 () Bool)

(declare-fun e!269232 () Bool)

(assert (=> b!461687 (=> (not res!276227) (not e!269232))))

(assert (=> b!461687 (= res!276227 (not (contains!2492 lt!209131 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!74913 () Bool)

(assert (=> d!74913 e!269232))

(declare-fun res!276228 () Bool)

(assert (=> d!74913 (=> (not res!276228) (not e!269232))))

(assert (=> d!74913 (= res!276228 (not (contains!2492 lt!209131 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74913 (= lt!209131 e!269230)))

(declare-fun c!56583 () Bool)

(assert (=> d!74913 (= c!56583 (bvsge from!863 (size!14115 lt!209034)))))

(assert (=> d!74913 (validMask!0 mask!1025)))

(assert (=> d!74913 (= (getCurrentListMapNoExtraKeys!1795 lt!209034 lt!209037 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!209131)))

(declare-fun b!461688 () Bool)

(declare-fun e!269231 () ListLongMap!7105)

(assert (=> b!461688 (= e!269230 e!269231)))

(declare-fun c!56582 () Bool)

(assert (=> b!461688 (= c!56582 (validKeyInArray!0 (select (arr!13763 lt!209034) from!863)))))

(declare-fun b!461689 () Bool)

(declare-fun lt!209128 () Unit!13430)

(declare-fun lt!209132 () Unit!13430)

(assert (=> b!461689 (= lt!209128 lt!209132)))

(declare-fun lt!209127 () (_ BitVec 64))

(declare-fun lt!209130 () (_ BitVec 64))

(declare-fun lt!209126 () V!17675)

(declare-fun lt!209129 () ListLongMap!7105)

(assert (=> b!461689 (not (contains!2492 (+!1643 lt!209129 (tuple2!8191 lt!209127 lt!209126)) lt!209130))))

(assert (=> b!461689 (= lt!209132 (addStillNotContains!153 lt!209129 lt!209127 lt!209126 lt!209130))))

(assert (=> b!461689 (= lt!209130 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!461689 (= lt!209126 (get!6800 (select (arr!13764 lt!209037) from!863) (dynLambda!908 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!461689 (= lt!209127 (select (arr!13763 lt!209034) from!863))))

(assert (=> b!461689 (= lt!209129 call!30174)))

(assert (=> b!461689 (= e!269231 (+!1643 call!30174 (tuple2!8191 (select (arr!13763 lt!209034) from!863) (get!6800 (select (arr!13764 lt!209037) from!863) (dynLambda!908 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!461690 () Bool)

(declare-fun e!269235 () Bool)

(assert (=> b!461690 (= e!269232 e!269235)))

(declare-fun c!56580 () Bool)

(declare-fun e!269236 () Bool)

(assert (=> b!461690 (= c!56580 e!269236)))

(declare-fun res!276225 () Bool)

(assert (=> b!461690 (=> (not res!276225) (not e!269236))))

(assert (=> b!461690 (= res!276225 (bvslt from!863 (size!14115 lt!209034)))))

(declare-fun b!461691 () Bool)

(assert (=> b!461691 (= e!269231 call!30174)))

(declare-fun b!461692 () Bool)

(assert (=> b!461692 (= e!269235 e!269234)))

(declare-fun c!56581 () Bool)

(assert (=> b!461692 (= c!56581 (bvslt from!863 (size!14115 lt!209034)))))

(declare-fun b!461693 () Bool)

(declare-fun e!269233 () Bool)

(assert (=> b!461693 (= e!269235 e!269233)))

(assert (=> b!461693 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14115 lt!209034)))))

(declare-fun res!276226 () Bool)

(assert (=> b!461693 (= res!276226 (contains!2492 lt!209131 (select (arr!13763 lt!209034) from!863)))))

(assert (=> b!461693 (=> (not res!276226) (not e!269233))))

(declare-fun b!461694 () Bool)

(assert (=> b!461694 (= e!269234 (isEmpty!571 lt!209131))))

(declare-fun b!461695 () Bool)

(assert (=> b!461695 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14115 lt!209034)))))

(assert (=> b!461695 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14116 lt!209037)))))

(assert (=> b!461695 (= e!269233 (= (apply!318 lt!209131 (select (arr!13763 lt!209034) from!863)) (get!6800 (select (arr!13764 lt!209037) from!863) (dynLambda!908 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!461696 () Bool)

(assert (=> b!461696 (= e!269236 (validKeyInArray!0 (select (arr!13763 lt!209034) from!863)))))

(assert (=> b!461696 (bvsge from!863 #b00000000000000000000000000000000)))

(assert (= (and d!74913 c!56583) b!461686))

(assert (= (and d!74913 (not c!56583)) b!461688))

(assert (= (and b!461688 c!56582) b!461689))

(assert (= (and b!461688 (not c!56582)) b!461691))

(assert (= (or b!461689 b!461691) bm!30171))

(assert (= (and d!74913 res!276228) b!461687))

(assert (= (and b!461687 res!276227) b!461690))

(assert (= (and b!461690 res!276225) b!461696))

(assert (= (and b!461690 c!56580) b!461693))

(assert (= (and b!461690 (not c!56580)) b!461692))

(assert (= (and b!461693 res!276226) b!461695))

(assert (= (and b!461692 c!56581) b!461685))

(assert (= (and b!461692 (not c!56581)) b!461694))

(declare-fun b_lambda!9955 () Bool)

(assert (=> (not b_lambda!9955) (not b!461689)))

(assert (=> b!461689 t!14191))

(declare-fun b_and!19433 () Bool)

(assert (= b_and!19431 (and (=> t!14191 result!7341) b_and!19433)))

(declare-fun b_lambda!9957 () Bool)

(assert (=> (not b_lambda!9957) (not b!461695)))

(assert (=> b!461695 t!14191))

(declare-fun b_and!19435 () Bool)

(assert (= b_and!19433 (and (=> t!14191 result!7341) b_and!19435)))

(declare-fun m!445075 () Bool)

(assert (=> b!461694 m!445075))

(declare-fun m!445077 () Bool)

(assert (=> b!461695 m!445077))

(assert (=> b!461695 m!444987))

(declare-fun m!445079 () Bool)

(assert (=> b!461695 m!445079))

(assert (=> b!461695 m!445077))

(assert (=> b!461695 m!444987))

(declare-fun m!445081 () Bool)

(assert (=> b!461695 m!445081))

(declare-fun m!445083 () Bool)

(assert (=> b!461695 m!445083))

(assert (=> b!461695 m!445081))

(declare-fun m!445085 () Bool)

(assert (=> d!74913 m!445085))

(assert (=> d!74913 m!444885))

(declare-fun m!445087 () Bool)

(assert (=> bm!30171 m!445087))

(assert (=> b!461693 m!445081))

(assert (=> b!461693 m!445081))

(declare-fun m!445089 () Bool)

(assert (=> b!461693 m!445089))

(assert (=> b!461685 m!445087))

(assert (=> b!461696 m!445081))

(assert (=> b!461696 m!445081))

(declare-fun m!445091 () Bool)

(assert (=> b!461696 m!445091))

(declare-fun m!445093 () Bool)

(assert (=> b!461687 m!445093))

(assert (=> b!461689 m!445077))

(assert (=> b!461689 m!444987))

(assert (=> b!461689 m!445079))

(assert (=> b!461689 m!445077))

(declare-fun m!445095 () Bool)

(assert (=> b!461689 m!445095))

(declare-fun m!445097 () Bool)

(assert (=> b!461689 m!445097))

(assert (=> b!461689 m!444987))

(assert (=> b!461689 m!445097))

(declare-fun m!445099 () Bool)

(assert (=> b!461689 m!445099))

(declare-fun m!445101 () Bool)

(assert (=> b!461689 m!445101))

(assert (=> b!461689 m!445081))

(assert (=> b!461688 m!445081))

(assert (=> b!461688 m!445081))

(assert (=> b!461688 m!445091))

(assert (=> b!461481 d!74913))

(declare-fun e!269241 () Bool)

(declare-fun lt!209138 () ListLongMap!7105)

(declare-fun b!461697 () Bool)

(assert (=> b!461697 (= e!269241 (= lt!209138 (getCurrentListMapNoExtraKeys!1795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557)))))

(declare-fun b!461698 () Bool)

(declare-fun e!269237 () ListLongMap!7105)

(assert (=> b!461698 (= e!269237 (ListLongMap!7106 Nil!8248))))

(declare-fun call!30175 () ListLongMap!7105)

(declare-fun bm!30172 () Bool)

(assert (=> bm!30172 (= call!30175 (getCurrentListMapNoExtraKeys!1795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd from!863 #b00000000000000000000000000000001) defaultEntry!557))))

(declare-fun b!461699 () Bool)

(declare-fun res!276231 () Bool)

(declare-fun e!269239 () Bool)

(assert (=> b!461699 (=> (not res!276231) (not e!269239))))

(assert (=> b!461699 (= res!276231 (not (contains!2492 lt!209138 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!74915 () Bool)

(assert (=> d!74915 e!269239))

(declare-fun res!276232 () Bool)

(assert (=> d!74915 (=> (not res!276232) (not e!269239))))

(assert (=> d!74915 (= res!276232 (not (contains!2492 lt!209138 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!74915 (= lt!209138 e!269237)))

(declare-fun c!56587 () Bool)

(assert (=> d!74915 (= c!56587 (bvsge from!863 (size!14115 _keys!709)))))

(assert (=> d!74915 (validMask!0 mask!1025)))

(assert (=> d!74915 (= (getCurrentListMapNoExtraKeys!1795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557) lt!209138)))

(declare-fun b!461700 () Bool)

(declare-fun e!269238 () ListLongMap!7105)

(assert (=> b!461700 (= e!269237 e!269238)))

(declare-fun c!56586 () Bool)

(assert (=> b!461700 (= c!56586 (validKeyInArray!0 (select (arr!13763 _keys!709) from!863)))))

(declare-fun b!461701 () Bool)

(declare-fun lt!209135 () Unit!13430)

(declare-fun lt!209139 () Unit!13430)

(assert (=> b!461701 (= lt!209135 lt!209139)))

(declare-fun lt!209134 () (_ BitVec 64))

(declare-fun lt!209137 () (_ BitVec 64))

(declare-fun lt!209136 () ListLongMap!7105)

(declare-fun lt!209133 () V!17675)

(assert (=> b!461701 (not (contains!2492 (+!1643 lt!209136 (tuple2!8191 lt!209134 lt!209133)) lt!209137))))

(assert (=> b!461701 (= lt!209139 (addStillNotContains!153 lt!209136 lt!209134 lt!209133 lt!209137))))

(assert (=> b!461701 (= lt!209137 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!461701 (= lt!209133 (get!6800 (select (arr!13764 _values!549) from!863) (dynLambda!908 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!461701 (= lt!209134 (select (arr!13763 _keys!709) from!863))))

(assert (=> b!461701 (= lt!209136 call!30175)))

(assert (=> b!461701 (= e!269238 (+!1643 call!30175 (tuple2!8191 (select (arr!13763 _keys!709) from!863) (get!6800 (select (arr!13764 _values!549) from!863) (dynLambda!908 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!461702 () Bool)

(declare-fun e!269242 () Bool)

(assert (=> b!461702 (= e!269239 e!269242)))

(declare-fun c!56584 () Bool)

(declare-fun e!269243 () Bool)

(assert (=> b!461702 (= c!56584 e!269243)))

(declare-fun res!276229 () Bool)

(assert (=> b!461702 (=> (not res!276229) (not e!269243))))

(assert (=> b!461702 (= res!276229 (bvslt from!863 (size!14115 _keys!709)))))

(declare-fun b!461703 () Bool)

(assert (=> b!461703 (= e!269238 call!30175)))

(declare-fun b!461704 () Bool)

(assert (=> b!461704 (= e!269242 e!269241)))

(declare-fun c!56585 () Bool)

(assert (=> b!461704 (= c!56585 (bvslt from!863 (size!14115 _keys!709)))))

(declare-fun b!461705 () Bool)

(declare-fun e!269240 () Bool)

(assert (=> b!461705 (= e!269242 e!269240)))

(assert (=> b!461705 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14115 _keys!709)))))

(declare-fun res!276230 () Bool)

(assert (=> b!461705 (= res!276230 (contains!2492 lt!209138 (select (arr!13763 _keys!709) from!863)))))

(assert (=> b!461705 (=> (not res!276230) (not e!269240))))

(declare-fun b!461706 () Bool)

(assert (=> b!461706 (= e!269241 (isEmpty!571 lt!209138))))

(declare-fun b!461707 () Bool)

(assert (=> b!461707 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14115 _keys!709)))))

(assert (=> b!461707 (and (bvsge from!863 #b00000000000000000000000000000000) (bvslt from!863 (size!14116 _values!549)))))

(assert (=> b!461707 (= e!269240 (= (apply!318 lt!209138 (select (arr!13763 _keys!709) from!863)) (get!6800 (select (arr!13764 _values!549) from!863) (dynLambda!908 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!461708 () Bool)

(assert (=> b!461708 (= e!269243 (validKeyInArray!0 (select (arr!13763 _keys!709) from!863)))))

(assert (=> b!461708 (bvsge from!863 #b00000000000000000000000000000000)))

(assert (= (and d!74915 c!56587) b!461698))

(assert (= (and d!74915 (not c!56587)) b!461700))

(assert (= (and b!461700 c!56586) b!461701))

(assert (= (and b!461700 (not c!56586)) b!461703))

(assert (= (or b!461701 b!461703) bm!30172))

(assert (= (and d!74915 res!276232) b!461699))

(assert (= (and b!461699 res!276231) b!461702))

(assert (= (and b!461702 res!276229) b!461708))

(assert (= (and b!461702 c!56584) b!461705))

(assert (= (and b!461702 (not c!56584)) b!461704))

(assert (= (and b!461705 res!276230) b!461707))

(assert (= (and b!461704 c!56585) b!461697))

(assert (= (and b!461704 (not c!56585)) b!461706))

(declare-fun b_lambda!9959 () Bool)

(assert (=> (not b_lambda!9959) (not b!461701)))

(assert (=> b!461701 t!14191))

(declare-fun b_and!19437 () Bool)

(assert (= b_and!19435 (and (=> t!14191 result!7341) b_and!19437)))

(declare-fun b_lambda!9961 () Bool)

(assert (=> (not b_lambda!9961) (not b!461707)))

(assert (=> b!461707 t!14191))

(declare-fun b_and!19439 () Bool)

(assert (= b_and!19437 (and (=> t!14191 result!7341) b_and!19439)))

(declare-fun m!445103 () Bool)

(assert (=> b!461706 m!445103))

(declare-fun m!445105 () Bool)

(assert (=> b!461707 m!445105))

(assert (=> b!461707 m!444987))

(declare-fun m!445107 () Bool)

(assert (=> b!461707 m!445107))

(assert (=> b!461707 m!445105))

(assert (=> b!461707 m!444987))

(assert (=> b!461707 m!444867))

(declare-fun m!445109 () Bool)

(assert (=> b!461707 m!445109))

(assert (=> b!461707 m!444867))

(declare-fun m!445111 () Bool)

(assert (=> d!74915 m!445111))

(assert (=> d!74915 m!444885))

(declare-fun m!445113 () Bool)

(assert (=> bm!30172 m!445113))

(assert (=> b!461705 m!444867))

(assert (=> b!461705 m!444867))

(declare-fun m!445115 () Bool)

(assert (=> b!461705 m!445115))

(assert (=> b!461697 m!445113))

(assert (=> b!461708 m!444867))

(assert (=> b!461708 m!444867))

(assert (=> b!461708 m!444873))

(declare-fun m!445117 () Bool)

(assert (=> b!461699 m!445117))

(assert (=> b!461701 m!445105))

(assert (=> b!461701 m!444987))

(assert (=> b!461701 m!445107))

(assert (=> b!461701 m!445105))

(declare-fun m!445119 () Bool)

(assert (=> b!461701 m!445119))

(declare-fun m!445121 () Bool)

(assert (=> b!461701 m!445121))

(assert (=> b!461701 m!444987))

(assert (=> b!461701 m!445121))

(declare-fun m!445123 () Bool)

(assert (=> b!461701 m!445123))

(declare-fun m!445125 () Bool)

(assert (=> b!461701 m!445125))

(assert (=> b!461701 m!444867))

(assert (=> b!461700 m!444867))

(assert (=> b!461700 m!444867))

(assert (=> b!461700 m!444873))

(assert (=> b!461481 d!74915))

(declare-fun d!74917 () Bool)

(assert (=> d!74917 (= (validMask!0 mask!1025) (and (or (= mask!1025 #b00000000000000000000000000000111) (= mask!1025 #b00000000000000000000000000001111) (= mask!1025 #b00000000000000000000000000011111) (= mask!1025 #b00000000000000000000000000111111) (= mask!1025 #b00000000000000000000000001111111) (= mask!1025 #b00000000000000000000000011111111) (= mask!1025 #b00000000000000000000000111111111) (= mask!1025 #b00000000000000000000001111111111) (= mask!1025 #b00000000000000000000011111111111) (= mask!1025 #b00000000000000000000111111111111) (= mask!1025 #b00000000000000000001111111111111) (= mask!1025 #b00000000000000000011111111111111) (= mask!1025 #b00000000000000000111111111111111) (= mask!1025 #b00000000000000001111111111111111) (= mask!1025 #b00000000000000011111111111111111) (= mask!1025 #b00000000000000111111111111111111) (= mask!1025 #b00000000000001111111111111111111) (= mask!1025 #b00000000000011111111111111111111) (= mask!1025 #b00000000000111111111111111111111) (= mask!1025 #b00000000001111111111111111111111) (= mask!1025 #b00000000011111111111111111111111) (= mask!1025 #b00000000111111111111111111111111) (= mask!1025 #b00000001111111111111111111111111) (= mask!1025 #b00000011111111111111111111111111) (= mask!1025 #b00000111111111111111111111111111) (= mask!1025 #b00001111111111111111111111111111) (= mask!1025 #b00011111111111111111111111111111) (= mask!1025 #b00111111111111111111111111111111)) (bvsle mask!1025 #b00111111111111111111111111111111)))))

(assert (=> b!461480 d!74917))

(declare-fun b!461709 () Bool)

(declare-fun e!269246 () Bool)

(declare-fun call!30176 () Bool)

(assert (=> b!461709 (= e!269246 call!30176)))

(declare-fun bm!30173 () Bool)

(assert (=> bm!30173 (= call!30176 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!709 mask!1025))))

(declare-fun b!461710 () Bool)

(declare-fun e!269245 () Bool)

(assert (=> b!461710 (= e!269245 call!30176)))

(declare-fun b!461711 () Bool)

(assert (=> b!461711 (= e!269246 e!269245)))

(declare-fun lt!209141 () (_ BitVec 64))

(assert (=> b!461711 (= lt!209141 (select (arr!13763 _keys!709) #b00000000000000000000000000000000))))

(declare-fun lt!209142 () Unit!13430)

(assert (=> b!461711 (= lt!209142 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!709 lt!209141 #b00000000000000000000000000000000))))

(assert (=> b!461711 (arrayContainsKey!0 _keys!709 lt!209141 #b00000000000000000000000000000000)))

(declare-fun lt!209140 () Unit!13430)

(assert (=> b!461711 (= lt!209140 lt!209142)))

(declare-fun res!276233 () Bool)

(assert (=> b!461711 (= res!276233 (= (seekEntryOrOpen!0 (select (arr!13763 _keys!709) #b00000000000000000000000000000000) _keys!709 mask!1025) (Found!3486 #b00000000000000000000000000000000)))))

(assert (=> b!461711 (=> (not res!276233) (not e!269245))))

(declare-fun b!461712 () Bool)

(declare-fun e!269244 () Bool)

(assert (=> b!461712 (= e!269244 e!269246)))

(declare-fun c!56588 () Bool)

(assert (=> b!461712 (= c!56588 (validKeyInArray!0 (select (arr!13763 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun d!74919 () Bool)

(declare-fun res!276234 () Bool)

(assert (=> d!74919 (=> res!276234 e!269244)))

(assert (=> d!74919 (= res!276234 (bvsge #b00000000000000000000000000000000 (size!14115 _keys!709)))))

(assert (=> d!74919 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025) e!269244)))

(assert (= (and d!74919 (not res!276234)) b!461712))

(assert (= (and b!461712 c!56588) b!461711))

(assert (= (and b!461712 (not c!56588)) b!461709))

(assert (= (and b!461711 res!276233) b!461710))

(assert (= (or b!461710 b!461709) bm!30173))

(declare-fun m!445127 () Bool)

(assert (=> bm!30173 m!445127))

(declare-fun m!445129 () Bool)

(assert (=> b!461711 m!445129))

(declare-fun m!445131 () Bool)

(assert (=> b!461711 m!445131))

(declare-fun m!445133 () Bool)

(assert (=> b!461711 m!445133))

(assert (=> b!461711 m!445129))

(declare-fun m!445135 () Bool)

(assert (=> b!461711 m!445135))

(assert (=> b!461712 m!445129))

(assert (=> b!461712 m!445129))

(declare-fun m!445137 () Bool)

(assert (=> b!461712 m!445137))

(assert (=> b!461490 d!74919))

(declare-fun d!74921 () Bool)

(declare-fun e!269247 () Bool)

(assert (=> d!74921 e!269247))

(declare-fun res!276236 () Bool)

(assert (=> d!74921 (=> (not res!276236) (not e!269247))))

(declare-fun lt!209146 () ListLongMap!7105)

(assert (=> d!74921 (= res!276236 (contains!2492 lt!209146 (_1!4106 lt!209036)))))

(declare-fun lt!209143 () List!8251)

(assert (=> d!74921 (= lt!209146 (ListLongMap!7106 lt!209143))))

(declare-fun lt!209144 () Unit!13430)

(declare-fun lt!209145 () Unit!13430)

(assert (=> d!74921 (= lt!209144 lt!209145)))

(assert (=> d!74921 (= (getValueByKey!376 lt!209143 (_1!4106 lt!209036)) (Some!381 (_2!4106 lt!209036)))))

(assert (=> d!74921 (= lt!209145 (lemmaContainsTupThenGetReturnValue!198 lt!209143 (_1!4106 lt!209036) (_2!4106 lt!209036)))))

(assert (=> d!74921 (= lt!209143 (insertStrictlySorted!201 (toList!3568 lt!209032) (_1!4106 lt!209036) (_2!4106 lt!209036)))))

(assert (=> d!74921 (= (+!1643 lt!209032 lt!209036) lt!209146)))

(declare-fun b!461713 () Bool)

(declare-fun res!276235 () Bool)

(assert (=> b!461713 (=> (not res!276235) (not e!269247))))

(assert (=> b!461713 (= res!276235 (= (getValueByKey!376 (toList!3568 lt!209146) (_1!4106 lt!209036)) (Some!381 (_2!4106 lt!209036))))))

(declare-fun b!461714 () Bool)

(assert (=> b!461714 (= e!269247 (contains!2493 (toList!3568 lt!209146) lt!209036))))

(assert (= (and d!74921 res!276236) b!461713))

(assert (= (and b!461713 res!276235) b!461714))

(declare-fun m!445139 () Bool)

(assert (=> d!74921 m!445139))

(declare-fun m!445141 () Bool)

(assert (=> d!74921 m!445141))

(declare-fun m!445143 () Bool)

(assert (=> d!74921 m!445143))

(declare-fun m!445145 () Bool)

(assert (=> d!74921 m!445145))

(declare-fun m!445147 () Bool)

(assert (=> b!461713 m!445147))

(declare-fun m!445149 () Bool)

(assert (=> b!461714 m!445149))

(assert (=> b!461488 d!74921))

(declare-fun b!461715 () Bool)

(declare-fun e!269251 () Bool)

(declare-fun call!30177 () Bool)

(assert (=> b!461715 (= e!269251 call!30177)))

(declare-fun bm!30174 () Bool)

(declare-fun c!56589 () Bool)

(assert (=> bm!30174 (= call!30177 (arrayNoDuplicates!0 _keys!709 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!56589 (Cons!8248 (select (arr!13763 _keys!709) #b00000000000000000000000000000000) Nil!8249) Nil!8249)))))

(declare-fun b!461716 () Bool)

(assert (=> b!461716 (= e!269251 call!30177)))

(declare-fun d!74923 () Bool)

(declare-fun res!276237 () Bool)

(declare-fun e!269250 () Bool)

(assert (=> d!74923 (=> res!276237 e!269250)))

(assert (=> d!74923 (= res!276237 (bvsge #b00000000000000000000000000000000 (size!14115 _keys!709)))))

(assert (=> d!74923 (= (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8249) e!269250)))

(declare-fun b!461717 () Bool)

(declare-fun e!269248 () Bool)

(assert (=> b!461717 (= e!269248 e!269251)))

(assert (=> b!461717 (= c!56589 (validKeyInArray!0 (select (arr!13763 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!461718 () Bool)

(declare-fun e!269249 () Bool)

(assert (=> b!461718 (= e!269249 (contains!2494 Nil!8249 (select (arr!13763 _keys!709) #b00000000000000000000000000000000)))))

(declare-fun b!461719 () Bool)

(assert (=> b!461719 (= e!269250 e!269248)))

(declare-fun res!276239 () Bool)

(assert (=> b!461719 (=> (not res!276239) (not e!269248))))

(assert (=> b!461719 (= res!276239 (not e!269249))))

(declare-fun res!276238 () Bool)

(assert (=> b!461719 (=> (not res!276238) (not e!269249))))

(assert (=> b!461719 (= res!276238 (validKeyInArray!0 (select (arr!13763 _keys!709) #b00000000000000000000000000000000)))))

(assert (= (and d!74923 (not res!276237)) b!461719))

(assert (= (and b!461719 res!276238) b!461718))

(assert (= (and b!461719 res!276239) b!461717))

(assert (= (and b!461717 c!56589) b!461715))

(assert (= (and b!461717 (not c!56589)) b!461716))

(assert (= (or b!461715 b!461716) bm!30174))

(assert (=> bm!30174 m!445129))

(declare-fun m!445151 () Bool)

(assert (=> bm!30174 m!445151))

(assert (=> b!461717 m!445129))

(assert (=> b!461717 m!445129))

(assert (=> b!461717 m!445137))

(assert (=> b!461718 m!445129))

(assert (=> b!461718 m!445129))

(declare-fun m!445153 () Bool)

(assert (=> b!461718 m!445153))

(assert (=> b!461719 m!445129))

(assert (=> b!461719 m!445129))

(assert (=> b!461719 m!445137))

(assert (=> b!461489 d!74923))

(declare-fun d!74925 () Bool)

(declare-fun res!276244 () Bool)

(declare-fun e!269256 () Bool)

(assert (=> d!74925 (=> res!276244 e!269256)))

(assert (=> d!74925 (= res!276244 (= (select (arr!13763 _keys!709) #b00000000000000000000000000000000) k0!794))))

(assert (=> d!74925 (= (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000) e!269256)))

(declare-fun b!461724 () Bool)

(declare-fun e!269257 () Bool)

(assert (=> b!461724 (= e!269256 e!269257)))

(declare-fun res!276245 () Bool)

(assert (=> b!461724 (=> (not res!276245) (not e!269257))))

(assert (=> b!461724 (= res!276245 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!14115 _keys!709)))))

(declare-fun b!461725 () Bool)

(assert (=> b!461725 (= e!269257 (arrayContainsKey!0 _keys!709 k0!794 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!74925 (not res!276244)) b!461724))

(assert (= (and b!461724 res!276245) b!461725))

(assert (=> d!74925 m!445129))

(declare-fun m!445155 () Bool)

(assert (=> b!461725 m!445155))

(assert (=> b!461479 d!74925))

(declare-fun b!461732 () Bool)

(declare-fun e!269263 () Bool)

(assert (=> b!461732 (= e!269263 tp_is_empty!12427)))

(declare-fun b!461733 () Bool)

(declare-fun e!269262 () Bool)

(assert (=> b!461733 (= e!269262 tp_is_empty!12427)))

(declare-fun mapNonEmpty!20302 () Bool)

(declare-fun mapRes!20302 () Bool)

(declare-fun tp!39121 () Bool)

(assert (=> mapNonEmpty!20302 (= mapRes!20302 (and tp!39121 e!269263))))

(declare-fun mapValue!20302 () ValueCell!5870)

(declare-fun mapKey!20302 () (_ BitVec 32))

(declare-fun mapRest!20302 () (Array (_ BitVec 32) ValueCell!5870))

(assert (=> mapNonEmpty!20302 (= mapRest!20293 (store mapRest!20302 mapKey!20302 mapValue!20302))))

(declare-fun condMapEmpty!20302 () Bool)

(declare-fun mapDefault!20302 () ValueCell!5870)

(assert (=> mapNonEmpty!20293 (= condMapEmpty!20302 (= mapRest!20293 ((as const (Array (_ BitVec 32) ValueCell!5870)) mapDefault!20302)))))

(assert (=> mapNonEmpty!20293 (= tp!39105 (and e!269262 mapRes!20302))))

(declare-fun mapIsEmpty!20302 () Bool)

(assert (=> mapIsEmpty!20302 mapRes!20302))

(assert (= (and mapNonEmpty!20293 condMapEmpty!20302) mapIsEmpty!20302))

(assert (= (and mapNonEmpty!20293 (not condMapEmpty!20302)) mapNonEmpty!20302))

(assert (= (and mapNonEmpty!20302 ((_ is ValueCellFull!5870) mapValue!20302)) b!461732))

(assert (= (and mapNonEmpty!20293 ((_ is ValueCellFull!5870) mapDefault!20302)) b!461733))

(declare-fun m!445157 () Bool)

(assert (=> mapNonEmpty!20302 m!445157))

(declare-fun b_lambda!9963 () Bool)

(assert (= b_lambda!9957 (or (and start!41232 b_free!11089) b_lambda!9963)))

(declare-fun b_lambda!9965 () Bool)

(assert (= b_lambda!9953 (or (and start!41232 b_free!11089) b_lambda!9965)))

(declare-fun b_lambda!9967 () Bool)

(assert (= b_lambda!9947 (or (and start!41232 b_free!11089) b_lambda!9967)))

(declare-fun b_lambda!9969 () Bool)

(assert (= b_lambda!9951 (or (and start!41232 b_free!11089) b_lambda!9969)))

(declare-fun b_lambda!9971 () Bool)

(assert (= b_lambda!9959 (or (and start!41232 b_free!11089) b_lambda!9971)))

(declare-fun b_lambda!9973 () Bool)

(assert (= b_lambda!9955 (or (and start!41232 b_free!11089) b_lambda!9973)))

(declare-fun b_lambda!9975 () Bool)

(assert (= b_lambda!9949 (or (and start!41232 b_free!11089) b_lambda!9975)))

(declare-fun b_lambda!9977 () Bool)

(assert (= b_lambda!9961 (or (and start!41232 b_free!11089) b_lambda!9977)))

(check-sat (not bm!30174) (not b!461713) (not b!461647) (not b_lambda!9969) (not b!461717) (not b!461705) (not b!461645) (not b_next!11089) (not b!461706) (not bm!30170) (not d!74915) (not bm!30173) (not b!461617) (not bm!30164) (not b!461699) b_and!19439 (not b!461683) (not b_lambda!9973) (not b!461701) (not b_lambda!9967) (not b!461725) (not d!74913) (not b!461700) (not b!461628) (not d!74897) (not b!461625) (not b!461671) (not b!461635) (not b!461693) (not mapNonEmpty!20302) (not b!461712) (not b!461637) (not b!461655) (not d!74895) (not b!461696) (not b_lambda!9963) (not d!74893) (not b!461707) (not b!461684) (not bm!30158) (not d!74921) (not b!461687) (not b!461646) (not b!461626) (not b!461714) (not b!461685) (not bm!30163) (not b!461641) (not b!461718) (not b!461627) (not b_lambda!9977) (not b!461639) (not b_lambda!9965) (not b!461695) (not b!461697) (not b_lambda!9975) (not b!461672) (not bm!30157) (not b!461619) (not b_lambda!9971) (not d!74901) (not bm!30172) (not b!461719) (not b!461640) (not b!461621) (not b!461670) (not b!461688) (not b!461694) (not bm!30171) (not b!461689) (not b!461648) (not b!461620) (not b!461711) (not b!461636) tp_is_empty!12427 (not b!461708) (not bm!30167))
(check-sat b_and!19439 (not b_next!11089))
