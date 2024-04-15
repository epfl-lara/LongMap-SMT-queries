; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40160 () Bool)

(assert start!40160)

(declare-fun b_free!10441 () Bool)

(declare-fun b_next!10441 () Bool)

(assert (=> start!40160 (= b_free!10441 (not b_next!10441))))

(declare-fun tp!36851 () Bool)

(declare-fun b_and!18383 () Bool)

(assert (=> start!40160 (= tp!36851 b_and!18383)))

(declare-fun b!439669 () Bool)

(declare-fun e!259101 () Bool)

(assert (=> b!439669 (= e!259101 (not true))))

(declare-datatypes ((V!16563 0))(
  ( (V!16564 (val!5841 Int)) )
))
(declare-datatypes ((ValueCell!5453 0))(
  ( (ValueCellFull!5453 (v!8082 V!16563)) (EmptyCell!5453) )
))
(declare-datatypes ((array!27003 0))(
  ( (array!27004 (arr!12951 (Array (_ BitVec 32) ValueCell!5453)) (size!13304 (_ BitVec 32))) )
))
(declare-fun lt!202194 () array!27003)

(declare-fun minValue!515 () V!16563)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun _values!549 () array!27003)

(declare-fun zeroValue!515 () V!16563)

(declare-fun k0!794 () (_ BitVec 64))

(declare-datatypes ((array!27005 0))(
  ( (array!27006 (arr!12952 (Array (_ BitVec 32) (_ BitVec 64))) (size!13305 (_ BitVec 32))) )
))
(declare-fun lt!202193 () array!27005)

(declare-fun v!412 () V!16563)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!27005)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!7774 0))(
  ( (tuple2!7775 (_1!3898 (_ BitVec 64)) (_2!3898 V!16563)) )
))
(declare-datatypes ((List!7761 0))(
  ( (Nil!7758) (Cons!7757 (h!8613 tuple2!7774) (t!13508 List!7761)) )
))
(declare-datatypes ((ListLongMap!6677 0))(
  ( (ListLongMap!6678 (toList!3354 List!7761)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1553 (array!27005 array!27003 (_ BitVec 32) (_ BitVec 32) V!16563 V!16563 (_ BitVec 32) Int) ListLongMap!6677)

(declare-fun +!1516 (ListLongMap!6677 tuple2!7774) ListLongMap!6677)

(assert (=> b!439669 (= (getCurrentListMapNoExtraKeys!1553 lt!202193 lt!202194 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1516 (getCurrentListMapNoExtraKeys!1553 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7775 k0!794 v!412)))))

(declare-datatypes ((Unit!13049 0))(
  ( (Unit!13050) )
))
(declare-fun lt!202192 () Unit!13049)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!654 (array!27005 array!27003 (_ BitVec 32) (_ BitVec 32) V!16563 V!16563 (_ BitVec 32) (_ BitVec 64) V!16563 (_ BitVec 32) Int) Unit!13049)

(assert (=> b!439669 (= lt!202192 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!654 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!439670 () Bool)

(declare-fun e!259100 () Bool)

(assert (=> b!439670 (= e!259100 e!259101)))

(declare-fun res!259968 () Bool)

(assert (=> b!439670 (=> (not res!259968) (not e!259101))))

(assert (=> b!439670 (= res!259968 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!202196 () ListLongMap!6677)

(assert (=> b!439670 (= lt!202196 (getCurrentListMapNoExtraKeys!1553 lt!202193 lt!202194 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!439670 (= lt!202194 (array!27004 (store (arr!12951 _values!549) i!563 (ValueCellFull!5453 v!412)) (size!13304 _values!549)))))

(declare-fun lt!202195 () ListLongMap!6677)

(assert (=> b!439670 (= lt!202195 (getCurrentListMapNoExtraKeys!1553 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapNonEmpty!19011 () Bool)

(declare-fun mapRes!19011 () Bool)

(declare-fun tp!36852 () Bool)

(declare-fun e!259098 () Bool)

(assert (=> mapNonEmpty!19011 (= mapRes!19011 (and tp!36852 e!259098))))

(declare-fun mapKey!19011 () (_ BitVec 32))

(declare-fun mapValue!19011 () ValueCell!5453)

(declare-fun mapRest!19011 () (Array (_ BitVec 32) ValueCell!5453))

(assert (=> mapNonEmpty!19011 (= (arr!12951 _values!549) (store mapRest!19011 mapKey!19011 mapValue!19011))))

(declare-fun b!439671 () Bool)

(declare-fun res!259962 () Bool)

(declare-fun e!259104 () Bool)

(assert (=> b!439671 (=> (not res!259962) (not e!259104))))

(declare-datatypes ((List!7762 0))(
  ( (Nil!7759) (Cons!7758 (h!8614 (_ BitVec 64)) (t!13509 List!7762)) )
))
(declare-fun arrayNoDuplicates!0 (array!27005 (_ BitVec 32) List!7762) Bool)

(assert (=> b!439671 (= res!259962 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7759))))

(declare-fun b!439672 () Bool)

(declare-fun res!259969 () Bool)

(assert (=> b!439672 (=> (not res!259969) (not e!259100))))

(assert (=> b!439672 (= res!259969 (bvsle from!863 i!563))))

(declare-fun b!439673 () Bool)

(declare-fun res!259964 () Bool)

(assert (=> b!439673 (=> (not res!259964) (not e!259104))))

(assert (=> b!439673 (= res!259964 (or (= (select (arr!12952 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12952 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!439674 () Bool)

(declare-fun res!259973 () Bool)

(assert (=> b!439674 (=> (not res!259973) (not e!259100))))

(assert (=> b!439674 (= res!259973 (arrayNoDuplicates!0 lt!202193 #b00000000000000000000000000000000 Nil!7759))))

(declare-fun b!439675 () Bool)

(declare-fun e!259099 () Bool)

(declare-fun e!259102 () Bool)

(assert (=> b!439675 (= e!259099 (and e!259102 mapRes!19011))))

(declare-fun condMapEmpty!19011 () Bool)

(declare-fun mapDefault!19011 () ValueCell!5453)

(assert (=> b!439675 (= condMapEmpty!19011 (= (arr!12951 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5453)) mapDefault!19011)))))

(declare-fun b!439676 () Bool)

(declare-fun tp_is_empty!11593 () Bool)

(assert (=> b!439676 (= e!259098 tp_is_empty!11593)))

(declare-fun res!259965 () Bool)

(assert (=> start!40160 (=> (not res!259965) (not e!259104))))

(assert (=> start!40160 (= res!259965 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13305 _keys!709))))))

(assert (=> start!40160 e!259104))

(assert (=> start!40160 tp_is_empty!11593))

(assert (=> start!40160 tp!36851))

(assert (=> start!40160 true))

(declare-fun array_inv!9450 (array!27003) Bool)

(assert (=> start!40160 (and (array_inv!9450 _values!549) e!259099)))

(declare-fun array_inv!9451 (array!27005) Bool)

(assert (=> start!40160 (array_inv!9451 _keys!709)))

(declare-fun b!439677 () Bool)

(declare-fun res!259974 () Bool)

(assert (=> b!439677 (=> (not res!259974) (not e!259104))))

(assert (=> b!439677 (= res!259974 (and (= (size!13304 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13305 _keys!709) (size!13304 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!19011 () Bool)

(assert (=> mapIsEmpty!19011 mapRes!19011))

(declare-fun b!439678 () Bool)

(declare-fun res!259972 () Bool)

(assert (=> b!439678 (=> (not res!259972) (not e!259104))))

(assert (=> b!439678 (= res!259972 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13305 _keys!709))))))

(declare-fun b!439679 () Bool)

(assert (=> b!439679 (= e!259102 tp_is_empty!11593)))

(declare-fun b!439680 () Bool)

(declare-fun res!259970 () Bool)

(assert (=> b!439680 (=> (not res!259970) (not e!259104))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!439680 (= res!259970 (validKeyInArray!0 k0!794))))

(declare-fun b!439681 () Bool)

(declare-fun res!259967 () Bool)

(assert (=> b!439681 (=> (not res!259967) (not e!259104))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27005 (_ BitVec 32)) Bool)

(assert (=> b!439681 (= res!259967 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!439682 () Bool)

(assert (=> b!439682 (= e!259104 e!259100)))

(declare-fun res!259963 () Bool)

(assert (=> b!439682 (=> (not res!259963) (not e!259100))))

(assert (=> b!439682 (= res!259963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!202193 mask!1025))))

(assert (=> b!439682 (= lt!202193 (array!27006 (store (arr!12952 _keys!709) i!563 k0!794) (size!13305 _keys!709)))))

(declare-fun b!439683 () Bool)

(declare-fun res!259966 () Bool)

(assert (=> b!439683 (=> (not res!259966) (not e!259104))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!439683 (= res!259966 (validMask!0 mask!1025))))

(declare-fun b!439684 () Bool)

(declare-fun res!259971 () Bool)

(assert (=> b!439684 (=> (not res!259971) (not e!259104))))

(declare-fun arrayContainsKey!0 (array!27005 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!439684 (= res!259971 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!40160 res!259965) b!439683))

(assert (= (and b!439683 res!259966) b!439677))

(assert (= (and b!439677 res!259974) b!439681))

(assert (= (and b!439681 res!259967) b!439671))

(assert (= (and b!439671 res!259962) b!439678))

(assert (= (and b!439678 res!259972) b!439680))

(assert (= (and b!439680 res!259970) b!439673))

(assert (= (and b!439673 res!259964) b!439684))

(assert (= (and b!439684 res!259971) b!439682))

(assert (= (and b!439682 res!259963) b!439674))

(assert (= (and b!439674 res!259973) b!439672))

(assert (= (and b!439672 res!259969) b!439670))

(assert (= (and b!439670 res!259968) b!439669))

(assert (= (and b!439675 condMapEmpty!19011) mapIsEmpty!19011))

(assert (= (and b!439675 (not condMapEmpty!19011)) mapNonEmpty!19011))

(get-info :version)

(assert (= (and mapNonEmpty!19011 ((_ is ValueCellFull!5453) mapValue!19011)) b!439676))

(assert (= (and b!439675 ((_ is ValueCellFull!5453) mapDefault!19011)) b!439679))

(assert (= start!40160 b!439675))

(declare-fun m!426357 () Bool)

(assert (=> b!439684 m!426357))

(declare-fun m!426359 () Bool)

(assert (=> b!439670 m!426359))

(declare-fun m!426361 () Bool)

(assert (=> b!439670 m!426361))

(declare-fun m!426363 () Bool)

(assert (=> b!439670 m!426363))

(declare-fun m!426365 () Bool)

(assert (=> b!439681 m!426365))

(declare-fun m!426367 () Bool)

(assert (=> b!439669 m!426367))

(declare-fun m!426369 () Bool)

(assert (=> b!439669 m!426369))

(assert (=> b!439669 m!426369))

(declare-fun m!426371 () Bool)

(assert (=> b!439669 m!426371))

(declare-fun m!426373 () Bool)

(assert (=> b!439669 m!426373))

(declare-fun m!426375 () Bool)

(assert (=> b!439673 m!426375))

(declare-fun m!426377 () Bool)

(assert (=> mapNonEmpty!19011 m!426377))

(declare-fun m!426379 () Bool)

(assert (=> b!439671 m!426379))

(declare-fun m!426381 () Bool)

(assert (=> b!439683 m!426381))

(declare-fun m!426383 () Bool)

(assert (=> b!439674 m!426383))

(declare-fun m!426385 () Bool)

(assert (=> b!439680 m!426385))

(declare-fun m!426387 () Bool)

(assert (=> b!439682 m!426387))

(declare-fun m!426389 () Bool)

(assert (=> b!439682 m!426389))

(declare-fun m!426391 () Bool)

(assert (=> start!40160 m!426391))

(declare-fun m!426393 () Bool)

(assert (=> start!40160 m!426393))

(check-sat (not b!439680) (not b_next!10441) (not b!439681) (not b!439674) (not start!40160) (not mapNonEmpty!19011) (not b!439671) (not b!439669) (not b!439684) tp_is_empty!11593 (not b!439683) (not b!439670) b_and!18383 (not b!439682))
(check-sat b_and!18383 (not b_next!10441))
