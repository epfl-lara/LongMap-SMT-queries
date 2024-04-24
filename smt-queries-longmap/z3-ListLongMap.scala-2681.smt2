; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39890 () Bool)

(assert start!39890)

(declare-fun b_free!10171 () Bool)

(declare-fun b_next!10171 () Bool)

(assert (=> start!39890 (= b_free!10171 (not b_next!10171))))

(declare-fun tp!36041 () Bool)

(declare-fun b_and!18015 () Bool)

(assert (=> start!39890 (= tp!36041 b_and!18015)))

(declare-fun mapNonEmpty!18606 () Bool)

(declare-fun mapRes!18606 () Bool)

(declare-fun tp!36042 () Bool)

(declare-fun e!255798 () Bool)

(assert (=> mapNonEmpty!18606 (= mapRes!18606 (and tp!36042 e!255798))))

(declare-datatypes ((V!16203 0))(
  ( (V!16204 (val!5706 Int)) )
))
(declare-datatypes ((ValueCell!5318 0))(
  ( (ValueCellFull!5318 (v!7954 V!16203)) (EmptyCell!5318) )
))
(declare-fun mapValue!18606 () ValueCell!5318)

(declare-datatypes ((array!26482 0))(
  ( (array!26483 (arr!12690 (Array (_ BitVec 32) ValueCell!5318)) (size!13042 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26482)

(declare-fun mapRest!18606 () (Array (_ BitVec 32) ValueCell!5318))

(declare-fun mapKey!18606 () (_ BitVec 32))

(assert (=> mapNonEmpty!18606 (= (arr!12690 _values!549) (store mapRest!18606 mapKey!18606 mapValue!18606))))

(declare-fun b!432453 () Bool)

(declare-datatypes ((Unit!12775 0))(
  ( (Unit!12776) )
))
(declare-fun e!255797 () Unit!12775)

(declare-fun Unit!12777 () Unit!12775)

(assert (=> b!432453 (= e!255797 Unit!12777)))

(declare-fun lt!198382 () Unit!12775)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!26484 0))(
  ( (array!26485 (arr!12691 (Array (_ BitVec 32) (_ BitVec 64))) (size!13043 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26484)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26484 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12775)

(assert (=> b!432453 (= lt!198382 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k0!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432453 false))

(declare-fun b!432454 () Bool)

(declare-fun res!254422 () Bool)

(declare-fun e!255790 () Bool)

(assert (=> b!432454 (=> (not res!254422) (not e!255790))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432454 (= res!254422 (bvsle from!863 i!563))))

(declare-fun b!432455 () Bool)

(declare-fun e!255793 () Bool)

(assert (=> b!432455 (= e!255793 true)))

(declare-datatypes ((tuple2!7440 0))(
  ( (tuple2!7441 (_1!3731 (_ BitVec 64)) (_2!3731 V!16203)) )
))
(declare-datatypes ((List!7432 0))(
  ( (Nil!7429) (Cons!7428 (h!8284 tuple2!7440) (t!13044 List!7432)) )
))
(declare-datatypes ((ListLongMap!6355 0))(
  ( (ListLongMap!6356 (toList!3193 List!7432)) )
))
(declare-fun lt!198370 () ListLongMap!6355)

(declare-fun lt!198381 () ListLongMap!6355)

(declare-fun lt!198383 () tuple2!7440)

(declare-fun lt!198375 () tuple2!7440)

(declare-fun +!1400 (ListLongMap!6355 tuple2!7440) ListLongMap!6355)

(assert (=> b!432455 (= lt!198381 (+!1400 (+!1400 lt!198370 lt!198375) lt!198383))))

(declare-fun lt!198377 () Unit!12775)

(declare-fun lt!198371 () V!16203)

(declare-fun v!412 () V!16203)

(declare-fun addCommutativeForDiffKeys!378 (ListLongMap!6355 (_ BitVec 64) V!16203 (_ BitVec 64) V!16203) Unit!12775)

(assert (=> b!432455 (= lt!198377 (addCommutativeForDiffKeys!378 lt!198370 k0!794 v!412 (select (arr!12691 _keys!709) from!863) lt!198371))))

(declare-fun b!432456 () Bool)

(declare-fun res!254419 () Bool)

(declare-fun e!255799 () Bool)

(assert (=> b!432456 (=> (not res!254419) (not e!255799))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26484 (_ BitVec 32)) Bool)

(assert (=> b!432456 (= res!254419 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!432457 () Bool)

(declare-fun res!254416 () Bool)

(assert (=> b!432457 (=> (not res!254416) (not e!255799))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!432457 (= res!254416 (and (= (size!13042 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13043 _keys!709) (size!13042 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18606 () Bool)

(assert (=> mapIsEmpty!18606 mapRes!18606))

(declare-fun b!432458 () Bool)

(assert (=> b!432458 (= e!255799 e!255790)))

(declare-fun res!254426 () Bool)

(assert (=> b!432458 (=> (not res!254426) (not e!255790))))

(declare-fun lt!198372 () array!26484)

(assert (=> b!432458 (= res!254426 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198372 mask!1025))))

(assert (=> b!432458 (= lt!198372 (array!26485 (store (arr!12691 _keys!709) i!563 k0!794) (size!13043 _keys!709)))))

(declare-fun b!432459 () Bool)

(declare-fun res!254423 () Bool)

(assert (=> b!432459 (=> (not res!254423) (not e!255790))))

(declare-datatypes ((List!7433 0))(
  ( (Nil!7430) (Cons!7429 (h!8285 (_ BitVec 64)) (t!13045 List!7433)) )
))
(declare-fun arrayNoDuplicates!0 (array!26484 (_ BitVec 32) List!7433) Bool)

(assert (=> b!432459 (= res!254423 (arrayNoDuplicates!0 lt!198372 #b00000000000000000000000000000000 Nil!7430))))

(declare-fun b!432460 () Bool)

(declare-fun res!254421 () Bool)

(assert (=> b!432460 (=> (not res!254421) (not e!255799))))

(assert (=> b!432460 (= res!254421 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7430))))

(declare-fun res!254420 () Bool)

(assert (=> start!39890 (=> (not res!254420) (not e!255799))))

(assert (=> start!39890 (= res!254420 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13043 _keys!709))))))

(assert (=> start!39890 e!255799))

(declare-fun tp_is_empty!11323 () Bool)

(assert (=> start!39890 tp_is_empty!11323))

(assert (=> start!39890 tp!36041))

(assert (=> start!39890 true))

(declare-fun e!255796 () Bool)

(declare-fun array_inv!9290 (array!26482) Bool)

(assert (=> start!39890 (and (array_inv!9290 _values!549) e!255796)))

(declare-fun array_inv!9291 (array!26484) Bool)

(assert (=> start!39890 (array_inv!9291 _keys!709)))

(declare-fun b!432461 () Bool)

(assert (=> b!432461 (= e!255798 tp_is_empty!11323)))

(declare-fun b!432462 () Bool)

(declare-fun e!255794 () Bool)

(declare-fun e!255791 () Bool)

(assert (=> b!432462 (= e!255794 (not e!255791))))

(declare-fun res!254417 () Bool)

(assert (=> b!432462 (=> res!254417 e!255791)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432462 (= res!254417 (not (validKeyInArray!0 (select (arr!12691 _keys!709) from!863))))))

(declare-fun lt!198376 () ListLongMap!6355)

(declare-fun lt!198384 () ListLongMap!6355)

(assert (=> b!432462 (= lt!198376 lt!198384)))

(assert (=> b!432462 (= lt!198384 (+!1400 lt!198370 lt!198383))))

(declare-fun minValue!515 () V!16203)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!198380 () array!26482)

(declare-fun zeroValue!515 () V!16203)

(declare-fun getCurrentListMapNoExtraKeys!1432 (array!26484 array!26482 (_ BitVec 32) (_ BitVec 32) V!16203 V!16203 (_ BitVec 32) Int) ListLongMap!6355)

(assert (=> b!432462 (= lt!198376 (getCurrentListMapNoExtraKeys!1432 lt!198372 lt!198380 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!432462 (= lt!198383 (tuple2!7441 k0!794 v!412))))

(assert (=> b!432462 (= lt!198370 (getCurrentListMapNoExtraKeys!1432 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198379 () Unit!12775)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!571 (array!26484 array!26482 (_ BitVec 32) (_ BitVec 32) V!16203 V!16203 (_ BitVec 32) (_ BitVec 64) V!16203 (_ BitVec 32) Int) Unit!12775)

(assert (=> b!432462 (= lt!198379 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!571 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432463 () Bool)

(declare-fun res!254425 () Bool)

(assert (=> b!432463 (=> (not res!254425) (not e!255799))))

(assert (=> b!432463 (= res!254425 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13043 _keys!709))))))

(declare-fun b!432464 () Bool)

(declare-fun res!254415 () Bool)

(assert (=> b!432464 (=> (not res!254415) (not e!255799))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432464 (= res!254415 (validMask!0 mask!1025))))

(declare-fun b!432465 () Bool)

(declare-fun Unit!12778 () Unit!12775)

(assert (=> b!432465 (= e!255797 Unit!12778)))

(declare-fun b!432466 () Bool)

(declare-fun res!254427 () Bool)

(assert (=> b!432466 (=> (not res!254427) (not e!255799))))

(assert (=> b!432466 (= res!254427 (or (= (select (arr!12691 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12691 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432467 () Bool)

(assert (=> b!432467 (= e!255790 e!255794)))

(declare-fun res!254414 () Bool)

(assert (=> b!432467 (=> (not res!254414) (not e!255794))))

(assert (=> b!432467 (= res!254414 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!198378 () ListLongMap!6355)

(assert (=> b!432467 (= lt!198378 (getCurrentListMapNoExtraKeys!1432 lt!198372 lt!198380 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!432467 (= lt!198380 (array!26483 (store (arr!12690 _values!549) i!563 (ValueCellFull!5318 v!412)) (size!13042 _values!549)))))

(declare-fun lt!198373 () ListLongMap!6355)

(assert (=> b!432467 (= lt!198373 (getCurrentListMapNoExtraKeys!1432 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!432468 () Bool)

(assert (=> b!432468 (= e!255791 e!255793)))

(declare-fun res!254424 () Bool)

(assert (=> b!432468 (=> res!254424 e!255793)))

(assert (=> b!432468 (= res!254424 (= k0!794 (select (arr!12691 _keys!709) from!863)))))

(assert (=> b!432468 (not (= (select (arr!12691 _keys!709) from!863) k0!794))))

(declare-fun lt!198374 () Unit!12775)

(assert (=> b!432468 (= lt!198374 e!255797)))

(declare-fun c!55569 () Bool)

(assert (=> b!432468 (= c!55569 (= (select (arr!12691 _keys!709) from!863) k0!794))))

(assert (=> b!432468 (= lt!198378 lt!198381)))

(assert (=> b!432468 (= lt!198381 (+!1400 lt!198384 lt!198375))))

(assert (=> b!432468 (= lt!198375 (tuple2!7441 (select (arr!12691 _keys!709) from!863) lt!198371))))

(declare-fun get!6316 (ValueCell!5318 V!16203) V!16203)

(declare-fun dynLambda!805 (Int (_ BitVec 64)) V!16203)

(assert (=> b!432468 (= lt!198371 (get!6316 (select (arr!12690 _values!549) from!863) (dynLambda!805 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432469 () Bool)

(declare-fun res!254418 () Bool)

(assert (=> b!432469 (=> (not res!254418) (not e!255799))))

(declare-fun arrayContainsKey!0 (array!26484 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!432469 (= res!254418 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!432470 () Bool)

(declare-fun e!255792 () Bool)

(assert (=> b!432470 (= e!255796 (and e!255792 mapRes!18606))))

(declare-fun condMapEmpty!18606 () Bool)

(declare-fun mapDefault!18606 () ValueCell!5318)

(assert (=> b!432470 (= condMapEmpty!18606 (= (arr!12690 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5318)) mapDefault!18606)))))

(declare-fun b!432471 () Bool)

(declare-fun res!254413 () Bool)

(assert (=> b!432471 (=> (not res!254413) (not e!255799))))

(assert (=> b!432471 (= res!254413 (validKeyInArray!0 k0!794))))

(declare-fun b!432472 () Bool)

(assert (=> b!432472 (= e!255792 tp_is_empty!11323)))

(assert (= (and start!39890 res!254420) b!432464))

(assert (= (and b!432464 res!254415) b!432457))

(assert (= (and b!432457 res!254416) b!432456))

(assert (= (and b!432456 res!254419) b!432460))

(assert (= (and b!432460 res!254421) b!432463))

(assert (= (and b!432463 res!254425) b!432471))

(assert (= (and b!432471 res!254413) b!432466))

(assert (= (and b!432466 res!254427) b!432469))

(assert (= (and b!432469 res!254418) b!432458))

(assert (= (and b!432458 res!254426) b!432459))

(assert (= (and b!432459 res!254423) b!432454))

(assert (= (and b!432454 res!254422) b!432467))

(assert (= (and b!432467 res!254414) b!432462))

(assert (= (and b!432462 (not res!254417)) b!432468))

(assert (= (and b!432468 c!55569) b!432453))

(assert (= (and b!432468 (not c!55569)) b!432465))

(assert (= (and b!432468 (not res!254424)) b!432455))

(assert (= (and b!432470 condMapEmpty!18606) mapIsEmpty!18606))

(assert (= (and b!432470 (not condMapEmpty!18606)) mapNonEmpty!18606))

(get-info :version)

(assert (= (and mapNonEmpty!18606 ((_ is ValueCellFull!5318) mapValue!18606)) b!432461))

(assert (= (and b!432470 ((_ is ValueCellFull!5318) mapDefault!18606)) b!432472))

(assert (= start!39890 b!432470))

(declare-fun b_lambda!9281 () Bool)

(assert (=> (not b_lambda!9281) (not b!432468)))

(declare-fun t!13043 () Bool)

(declare-fun tb!3569 () Bool)

(assert (=> (and start!39890 (= defaultEntry!557 defaultEntry!557) t!13043) tb!3569))

(declare-fun result!6673 () Bool)

(assert (=> tb!3569 (= result!6673 tp_is_empty!11323)))

(assert (=> b!432468 t!13043))

(declare-fun b_and!18017 () Bool)

(assert (= b_and!18015 (and (=> t!13043 result!6673) b_and!18017)))

(declare-fun m!420797 () Bool)

(assert (=> b!432467 m!420797))

(declare-fun m!420799 () Bool)

(assert (=> b!432467 m!420799))

(declare-fun m!420801 () Bool)

(assert (=> b!432467 m!420801))

(declare-fun m!420803 () Bool)

(assert (=> b!432469 m!420803))

(declare-fun m!420805 () Bool)

(assert (=> b!432453 m!420805))

(declare-fun m!420807 () Bool)

(assert (=> mapNonEmpty!18606 m!420807))

(declare-fun m!420809 () Bool)

(assert (=> b!432468 m!420809))

(declare-fun m!420811 () Bool)

(assert (=> b!432468 m!420811))

(declare-fun m!420813 () Bool)

(assert (=> b!432468 m!420813))

(declare-fun m!420815 () Bool)

(assert (=> b!432468 m!420815))

(assert (=> b!432468 m!420815))

(assert (=> b!432468 m!420811))

(declare-fun m!420817 () Bool)

(assert (=> b!432468 m!420817))

(declare-fun m!420819 () Bool)

(assert (=> b!432466 m!420819))

(declare-fun m!420821 () Bool)

(assert (=> b!432458 m!420821))

(declare-fun m!420823 () Bool)

(assert (=> b!432458 m!420823))

(declare-fun m!420825 () Bool)

(assert (=> b!432456 m!420825))

(declare-fun m!420827 () Bool)

(assert (=> b!432455 m!420827))

(assert (=> b!432455 m!420827))

(declare-fun m!420829 () Bool)

(assert (=> b!432455 m!420829))

(assert (=> b!432455 m!420809))

(assert (=> b!432455 m!420809))

(declare-fun m!420831 () Bool)

(assert (=> b!432455 m!420831))

(declare-fun m!420833 () Bool)

(assert (=> b!432459 m!420833))

(declare-fun m!420835 () Bool)

(assert (=> start!39890 m!420835))

(declare-fun m!420837 () Bool)

(assert (=> start!39890 m!420837))

(declare-fun m!420839 () Bool)

(assert (=> b!432471 m!420839))

(declare-fun m!420841 () Bool)

(assert (=> b!432460 m!420841))

(declare-fun m!420843 () Bool)

(assert (=> b!432464 m!420843))

(assert (=> b!432462 m!420809))

(declare-fun m!420845 () Bool)

(assert (=> b!432462 m!420845))

(declare-fun m!420847 () Bool)

(assert (=> b!432462 m!420847))

(declare-fun m!420849 () Bool)

(assert (=> b!432462 m!420849))

(assert (=> b!432462 m!420809))

(declare-fun m!420851 () Bool)

(assert (=> b!432462 m!420851))

(declare-fun m!420853 () Bool)

(assert (=> b!432462 m!420853))

(check-sat (not start!39890) (not b!432469) (not b!432467) (not b!432462) (not b!432468) (not b_next!10171) (not b!432456) (not b!432464) (not b!432460) tp_is_empty!11323 (not b!432455) (not b!432471) (not b!432459) (not mapNonEmpty!18606) (not b!432453) (not b_lambda!9281) (not b!432458) b_and!18017)
(check-sat b_and!18017 (not b_next!10171))
