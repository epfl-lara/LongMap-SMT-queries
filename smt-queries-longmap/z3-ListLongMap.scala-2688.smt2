; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39932 () Bool)

(assert start!39932)

(declare-fun b_free!10213 () Bool)

(declare-fun b_next!10213 () Bool)

(assert (=> start!39932 (= b_free!10213 (not b_next!10213))))

(declare-fun tp!36167 () Bool)

(declare-fun b_and!18099 () Bool)

(assert (=> start!39932 (= tp!36167 b_and!18099)))

(declare-fun b!433755 () Bool)

(declare-fun e!256427 () Bool)

(declare-fun e!256425 () Bool)

(declare-fun mapRes!18669 () Bool)

(assert (=> b!433755 (= e!256427 (and e!256425 mapRes!18669))))

(declare-fun condMapEmpty!18669 () Bool)

(declare-datatypes ((V!16259 0))(
  ( (V!16260 (val!5727 Int)) )
))
(declare-datatypes ((ValueCell!5339 0))(
  ( (ValueCellFull!5339 (v!7975 V!16259)) (EmptyCell!5339) )
))
(declare-datatypes ((array!26566 0))(
  ( (array!26567 (arr!12732 (Array (_ BitVec 32) ValueCell!5339)) (size!13084 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26566)

(declare-fun mapDefault!18669 () ValueCell!5339)

(assert (=> b!433755 (= condMapEmpty!18669 (= (arr!12732 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5339)) mapDefault!18669)))))

(declare-fun b!433756 () Bool)

(declare-fun e!256420 () Bool)

(declare-fun e!256421 () Bool)

(assert (=> b!433756 (= e!256420 e!256421)))

(declare-fun res!255371 () Bool)

(assert (=> b!433756 (=> (not res!255371) (not e!256421))))

(declare-datatypes ((array!26568 0))(
  ( (array!26569 (arr!12733 (Array (_ BitVec 32) (_ BitVec 64))) (size!13085 (_ BitVec 32))) )
))
(declare-fun lt!199329 () array!26568)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26568 (_ BitVec 32)) Bool)

(assert (=> b!433756 (= res!255371 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!199329 mask!1025))))

(declare-fun _keys!709 () array!26568)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!433756 (= lt!199329 (array!26569 (store (arr!12733 _keys!709) i!563 k0!794) (size!13085 _keys!709)))))

(declare-fun b!433757 () Bool)

(declare-fun res!255360 () Bool)

(assert (=> b!433757 (=> (not res!255360) (not e!256420))))

(assert (=> b!433757 (= res!255360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!433758 () Bool)

(declare-fun e!256423 () Bool)

(declare-fun e!256429 () Bool)

(assert (=> b!433758 (= e!256423 (not e!256429))))

(declare-fun res!255368 () Bool)

(assert (=> b!433758 (=> res!255368 e!256429)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!433758 (= res!255368 (not (validKeyInArray!0 (select (arr!12733 _keys!709) from!863))))))

(declare-datatypes ((tuple2!7480 0))(
  ( (tuple2!7481 (_1!3751 (_ BitVec 64)) (_2!3751 V!16259)) )
))
(declare-datatypes ((List!7470 0))(
  ( (Nil!7467) (Cons!7466 (h!8322 tuple2!7480) (t!13124 List!7470)) )
))
(declare-datatypes ((ListLongMap!6395 0))(
  ( (ListLongMap!6396 (toList!3213 List!7470)) )
))
(declare-fun lt!199317 () ListLongMap!6395)

(declare-fun lt!199323 () ListLongMap!6395)

(assert (=> b!433758 (= lt!199317 lt!199323)))

(declare-fun lt!199324 () ListLongMap!6395)

(declare-fun lt!199319 () tuple2!7480)

(declare-fun +!1420 (ListLongMap!6395 tuple2!7480) ListLongMap!6395)

(assert (=> b!433758 (= lt!199323 (+!1420 lt!199324 lt!199319))))

(declare-fun minValue!515 () V!16259)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!199315 () array!26566)

(declare-fun zeroValue!515 () V!16259)

(declare-fun getCurrentListMapNoExtraKeys!1449 (array!26568 array!26566 (_ BitVec 32) (_ BitVec 32) V!16259 V!16259 (_ BitVec 32) Int) ListLongMap!6395)

(assert (=> b!433758 (= lt!199317 (getCurrentListMapNoExtraKeys!1449 lt!199329 lt!199315 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun v!412 () V!16259)

(assert (=> b!433758 (= lt!199319 (tuple2!7481 k0!794 v!412))))

(assert (=> b!433758 (= lt!199324 (getCurrentListMapNoExtraKeys!1449 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-datatypes ((Unit!12850 0))(
  ( (Unit!12851) )
))
(declare-fun lt!199322 () Unit!12850)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!586 (array!26568 array!26566 (_ BitVec 32) (_ BitVec 32) V!16259 V!16259 (_ BitVec 32) (_ BitVec 64) V!16259 (_ BitVec 32) Int) Unit!12850)

(assert (=> b!433758 (= lt!199322 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!586 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!433759 () Bool)

(declare-fun e!256426 () Bool)

(assert (=> b!433759 (= e!256429 e!256426)))

(declare-fun res!255361 () Bool)

(assert (=> b!433759 (=> res!255361 e!256426)))

(assert (=> b!433759 (= res!255361 (= k0!794 (select (arr!12733 _keys!709) from!863)))))

(assert (=> b!433759 (not (= (select (arr!12733 _keys!709) from!863) k0!794))))

(declare-fun lt!199316 () Unit!12850)

(declare-fun e!256422 () Unit!12850)

(assert (=> b!433759 (= lt!199316 e!256422)))

(declare-fun c!55632 () Bool)

(assert (=> b!433759 (= c!55632 (= (select (arr!12733 _keys!709) from!863) k0!794))))

(declare-fun lt!199318 () ListLongMap!6395)

(declare-fun lt!199328 () ListLongMap!6395)

(assert (=> b!433759 (= lt!199318 lt!199328)))

(declare-fun lt!199321 () tuple2!7480)

(assert (=> b!433759 (= lt!199328 (+!1420 lt!199323 lt!199321))))

(declare-fun lt!199326 () V!16259)

(assert (=> b!433759 (= lt!199321 (tuple2!7481 (select (arr!12733 _keys!709) from!863) lt!199326))))

(declare-fun get!6349 (ValueCell!5339 V!16259) V!16259)

(declare-fun dynLambda!824 (Int (_ BitVec 64)) V!16259)

(assert (=> b!433759 (= lt!199326 (get!6349 (select (arr!12732 _values!549) from!863) (dynLambda!824 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433760 () Bool)

(declare-fun res!255370 () Bool)

(assert (=> b!433760 (=> (not res!255370) (not e!256420))))

(assert (=> b!433760 (= res!255370 (or (= (select (arr!12733 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12733 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!433761 () Bool)

(declare-fun res!255359 () Bool)

(assert (=> b!433761 (=> (not res!255359) (not e!256420))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!433761 (= res!255359 (validMask!0 mask!1025))))

(declare-fun b!433762 () Bool)

(declare-fun res!255369 () Bool)

(assert (=> b!433762 (=> (not res!255369) (not e!256421))))

(declare-datatypes ((List!7471 0))(
  ( (Nil!7468) (Cons!7467 (h!8323 (_ BitVec 64)) (t!13125 List!7471)) )
))
(declare-fun arrayNoDuplicates!0 (array!26568 (_ BitVec 32) List!7471) Bool)

(assert (=> b!433762 (= res!255369 (arrayNoDuplicates!0 lt!199329 #b00000000000000000000000000000000 Nil!7468))))

(declare-fun b!433763 () Bool)

(declare-fun res!255372 () Bool)

(assert (=> b!433763 (=> (not res!255372) (not e!256420))))

(declare-fun arrayContainsKey!0 (array!26568 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!433763 (= res!255372 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!433764 () Bool)

(declare-fun res!255365 () Bool)

(assert (=> b!433764 (=> (not res!255365) (not e!256420))))

(assert (=> b!433764 (= res!255365 (and (= (size!13084 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13085 _keys!709) (size!13084 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18669 () Bool)

(assert (=> mapIsEmpty!18669 mapRes!18669))

(declare-fun b!433765 () Bool)

(declare-fun e!256428 () Bool)

(declare-fun tp_is_empty!11365 () Bool)

(assert (=> b!433765 (= e!256428 tp_is_empty!11365)))

(declare-fun b!433766 () Bool)

(declare-fun res!255367 () Bool)

(assert (=> b!433766 (=> (not res!255367) (not e!256420))))

(assert (=> b!433766 (= res!255367 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7468))))

(declare-fun b!433767 () Bool)

(declare-fun Unit!12852 () Unit!12850)

(assert (=> b!433767 (= e!256422 Unit!12852)))

(declare-fun lt!199320 () Unit!12850)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26568 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12850)

(assert (=> b!433767 (= lt!199320 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!433767 false))

(declare-fun b!433768 () Bool)

(declare-fun res!255362 () Bool)

(assert (=> b!433768 (=> (not res!255362) (not e!256421))))

(assert (=> b!433768 (= res!255362 (bvsle from!863 i!563))))

(declare-fun b!433769 () Bool)

(declare-fun res!255366 () Bool)

(assert (=> b!433769 (=> (not res!255366) (not e!256420))))

(assert (=> b!433769 (= res!255366 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13085 _keys!709))))))

(declare-fun b!433770 () Bool)

(declare-fun res!255363 () Bool)

(assert (=> b!433770 (=> (not res!255363) (not e!256420))))

(assert (=> b!433770 (= res!255363 (validKeyInArray!0 k0!794))))

(declare-fun b!433771 () Bool)

(assert (=> b!433771 (= e!256421 e!256423)))

(declare-fun res!255364 () Bool)

(assert (=> b!433771 (=> (not res!255364) (not e!256423))))

(assert (=> b!433771 (= res!255364 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!433771 (= lt!199318 (getCurrentListMapNoExtraKeys!1449 lt!199329 lt!199315 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!433771 (= lt!199315 (array!26567 (store (arr!12732 _values!549) i!563 (ValueCellFull!5339 v!412)) (size!13084 _values!549)))))

(declare-fun lt!199327 () ListLongMap!6395)

(assert (=> b!433771 (= lt!199327 (getCurrentListMapNoExtraKeys!1449 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!433772 () Bool)

(declare-fun Unit!12853 () Unit!12850)

(assert (=> b!433772 (= e!256422 Unit!12853)))

(declare-fun mapNonEmpty!18669 () Bool)

(declare-fun tp!36168 () Bool)

(assert (=> mapNonEmpty!18669 (= mapRes!18669 (and tp!36168 e!256428))))

(declare-fun mapValue!18669 () ValueCell!5339)

(declare-fun mapRest!18669 () (Array (_ BitVec 32) ValueCell!5339))

(declare-fun mapKey!18669 () (_ BitVec 32))

(assert (=> mapNonEmpty!18669 (= (arr!12732 _values!549) (store mapRest!18669 mapKey!18669 mapValue!18669))))

(declare-fun b!433773 () Bool)

(assert (=> b!433773 (= e!256425 tp_is_empty!11365)))

(declare-fun b!433774 () Bool)

(assert (=> b!433774 (= e!256426 true)))

(assert (=> b!433774 (= lt!199328 (+!1420 (+!1420 lt!199324 lt!199321) lt!199319))))

(declare-fun lt!199325 () Unit!12850)

(declare-fun addCommutativeForDiffKeys!392 (ListLongMap!6395 (_ BitVec 64) V!16259 (_ BitVec 64) V!16259) Unit!12850)

(assert (=> b!433774 (= lt!199325 (addCommutativeForDiffKeys!392 lt!199324 k0!794 v!412 (select (arr!12733 _keys!709) from!863) lt!199326))))

(declare-fun res!255358 () Bool)

(assert (=> start!39932 (=> (not res!255358) (not e!256420))))

(assert (=> start!39932 (= res!255358 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13085 _keys!709))))))

(assert (=> start!39932 e!256420))

(assert (=> start!39932 tp_is_empty!11365))

(assert (=> start!39932 tp!36167))

(assert (=> start!39932 true))

(declare-fun array_inv!9316 (array!26566) Bool)

(assert (=> start!39932 (and (array_inv!9316 _values!549) e!256427)))

(declare-fun array_inv!9317 (array!26568) Bool)

(assert (=> start!39932 (array_inv!9317 _keys!709)))

(assert (= (and start!39932 res!255358) b!433761))

(assert (= (and b!433761 res!255359) b!433764))

(assert (= (and b!433764 res!255365) b!433757))

(assert (= (and b!433757 res!255360) b!433766))

(assert (= (and b!433766 res!255367) b!433769))

(assert (= (and b!433769 res!255366) b!433770))

(assert (= (and b!433770 res!255363) b!433760))

(assert (= (and b!433760 res!255370) b!433763))

(assert (= (and b!433763 res!255372) b!433756))

(assert (= (and b!433756 res!255371) b!433762))

(assert (= (and b!433762 res!255369) b!433768))

(assert (= (and b!433768 res!255362) b!433771))

(assert (= (and b!433771 res!255364) b!433758))

(assert (= (and b!433758 (not res!255368)) b!433759))

(assert (= (and b!433759 c!55632) b!433767))

(assert (= (and b!433759 (not c!55632)) b!433772))

(assert (= (and b!433759 (not res!255361)) b!433774))

(assert (= (and b!433755 condMapEmpty!18669) mapIsEmpty!18669))

(assert (= (and b!433755 (not condMapEmpty!18669)) mapNonEmpty!18669))

(get-info :version)

(assert (= (and mapNonEmpty!18669 ((_ is ValueCellFull!5339) mapValue!18669)) b!433765))

(assert (= (and b!433755 ((_ is ValueCellFull!5339) mapDefault!18669)) b!433773))

(assert (= start!39932 b!433755))

(declare-fun b_lambda!9323 () Bool)

(assert (=> (not b_lambda!9323) (not b!433759)))

(declare-fun t!13123 () Bool)

(declare-fun tb!3611 () Bool)

(assert (=> (and start!39932 (= defaultEntry!557 defaultEntry!557) t!13123) tb!3611))

(declare-fun result!6757 () Bool)

(assert (=> tb!3611 (= result!6757 tp_is_empty!11365)))

(assert (=> b!433759 t!13123))

(declare-fun b_and!18101 () Bool)

(assert (= b_and!18099 (and (=> t!13123 result!6757) b_and!18101)))

(declare-fun m!422015 () Bool)

(assert (=> b!433767 m!422015))

(declare-fun m!422017 () Bool)

(assert (=> start!39932 m!422017))

(declare-fun m!422019 () Bool)

(assert (=> start!39932 m!422019))

(declare-fun m!422021 () Bool)

(assert (=> b!433762 m!422021))

(declare-fun m!422023 () Bool)

(assert (=> b!433771 m!422023))

(declare-fun m!422025 () Bool)

(assert (=> b!433771 m!422025))

(declare-fun m!422027 () Bool)

(assert (=> b!433771 m!422027))

(declare-fun m!422029 () Bool)

(assert (=> b!433766 m!422029))

(declare-fun m!422031 () Bool)

(assert (=> b!433774 m!422031))

(assert (=> b!433774 m!422031))

(declare-fun m!422033 () Bool)

(assert (=> b!433774 m!422033))

(declare-fun m!422035 () Bool)

(assert (=> b!433774 m!422035))

(assert (=> b!433774 m!422035))

(declare-fun m!422037 () Bool)

(assert (=> b!433774 m!422037))

(assert (=> b!433758 m!422035))

(declare-fun m!422039 () Bool)

(assert (=> b!433758 m!422039))

(declare-fun m!422041 () Bool)

(assert (=> b!433758 m!422041))

(declare-fun m!422043 () Bool)

(assert (=> b!433758 m!422043))

(assert (=> b!433758 m!422035))

(declare-fun m!422045 () Bool)

(assert (=> b!433758 m!422045))

(declare-fun m!422047 () Bool)

(assert (=> b!433758 m!422047))

(declare-fun m!422049 () Bool)

(assert (=> b!433756 m!422049))

(declare-fun m!422051 () Bool)

(assert (=> b!433756 m!422051))

(declare-fun m!422053 () Bool)

(assert (=> b!433761 m!422053))

(assert (=> b!433759 m!422035))

(declare-fun m!422055 () Bool)

(assert (=> b!433759 m!422055))

(declare-fun m!422057 () Bool)

(assert (=> b!433759 m!422057))

(declare-fun m!422059 () Bool)

(assert (=> b!433759 m!422059))

(assert (=> b!433759 m!422059))

(assert (=> b!433759 m!422055))

(declare-fun m!422061 () Bool)

(assert (=> b!433759 m!422061))

(declare-fun m!422063 () Bool)

(assert (=> mapNonEmpty!18669 m!422063))

(declare-fun m!422065 () Bool)

(assert (=> b!433760 m!422065))

(declare-fun m!422067 () Bool)

(assert (=> b!433757 m!422067))

(declare-fun m!422069 () Bool)

(assert (=> b!433763 m!422069))

(declare-fun m!422071 () Bool)

(assert (=> b!433770 m!422071))

(check-sat (not b!433771) (not start!39932) (not b!433767) (not b!433763) b_and!18101 (not b!433774) (not b_lambda!9323) (not b!433759) (not b!433761) (not b!433756) tp_is_empty!11365 (not b!433766) (not b!433762) (not mapNonEmpty!18669) (not b!433757) (not b!433758) (not b_next!10213) (not b!433770))
(check-sat b_and!18101 (not b_next!10213))
