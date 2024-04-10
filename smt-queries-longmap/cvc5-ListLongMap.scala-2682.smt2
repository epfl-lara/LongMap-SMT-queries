; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39910 () Bool)

(assert start!39910)

(declare-fun b_free!10177 () Bool)

(declare-fun b_next!10177 () Bool)

(assert (=> start!39910 (= b_free!10177 (not b_next!10177))))

(declare-fun tp!36060 () Bool)

(declare-fun b_and!18013 () Bool)

(assert (=> start!39910 (= tp!36060 b_and!18013)))

(declare-fun b!432688 () Bool)

(declare-datatypes ((Unit!12786 0))(
  ( (Unit!12787) )
))
(declare-fun e!255913 () Unit!12786)

(declare-fun Unit!12788 () Unit!12786)

(assert (=> b!432688 (= e!255913 Unit!12788)))

(declare-fun b!432689 () Bool)

(declare-fun res!254555 () Bool)

(declare-fun e!255914 () Bool)

(assert (=> b!432689 (=> (not res!254555) (not e!255914))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!432689 (= res!254555 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!18615 () Bool)

(declare-fun mapRes!18615 () Bool)

(assert (=> mapIsEmpty!18615 mapRes!18615))

(declare-fun b!432690 () Bool)

(declare-fun res!254551 () Bool)

(declare-fun e!255912 () Bool)

(assert (=> b!432690 (=> (not res!254551) (not e!255912))))

(declare-datatypes ((array!26491 0))(
  ( (array!26492 (arr!12695 (Array (_ BitVec 32) (_ BitVec 64))) (size!13047 (_ BitVec 32))) )
))
(declare-fun lt!198492 () array!26491)

(declare-datatypes ((List!7550 0))(
  ( (Nil!7547) (Cons!7546 (h!8402 (_ BitVec 64)) (t!13176 List!7550)) )
))
(declare-fun arrayNoDuplicates!0 (array!26491 (_ BitVec 32) List!7550) Bool)

(assert (=> b!432690 (= res!254551 (arrayNoDuplicates!0 lt!198492 #b00000000000000000000000000000000 Nil!7547))))

(declare-fun b!432691 () Bool)

(assert (=> b!432691 (= e!255914 e!255912)))

(declare-fun res!254552 () Bool)

(assert (=> b!432691 (=> (not res!254552) (not e!255912))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26491 (_ BitVec 32)) Bool)

(assert (=> b!432691 (= res!254552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!198492 mask!1025))))

(declare-fun _keys!709 () array!26491)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!432691 (= lt!198492 (array!26492 (store (arr!12695 _keys!709) i!563 k!794) (size!13047 _keys!709)))))

(declare-fun b!432692 () Bool)

(declare-fun e!255920 () Bool)

(declare-fun tp_is_empty!11329 () Bool)

(assert (=> b!432692 (= e!255920 tp_is_empty!11329)))

(declare-fun b!432693 () Bool)

(declare-fun res!254564 () Bool)

(assert (=> b!432693 (=> (not res!254564) (not e!255914))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!16211 0))(
  ( (V!16212 (val!5709 Int)) )
))
(declare-datatypes ((ValueCell!5321 0))(
  ( (ValueCellFull!5321 (v!7956 V!16211)) (EmptyCell!5321) )
))
(declare-datatypes ((array!26493 0))(
  ( (array!26494 (arr!12696 (Array (_ BitVec 32) ValueCell!5321)) (size!13048 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26493)

(assert (=> b!432693 (= res!254564 (and (= (size!13048 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13047 _keys!709) (size!13048 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!432694 () Bool)

(declare-fun res!254556 () Bool)

(assert (=> b!432694 (=> (not res!254556) (not e!255914))))

(assert (=> b!432694 (= res!254556 (or (= (select (arr!12695 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12695 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!432695 () Bool)

(declare-fun res!254565 () Bool)

(assert (=> b!432695 (=> (not res!254565) (not e!255914))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!432695 (= res!254565 (validKeyInArray!0 k!794))))

(declare-fun b!432696 () Bool)

(declare-fun res!254557 () Bool)

(assert (=> b!432696 (=> (not res!254557) (not e!255914))))

(assert (=> b!432696 (= res!254557 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7547))))

(declare-fun b!432697 () Bool)

(declare-fun Unit!12789 () Unit!12786)

(assert (=> b!432697 (= e!255913 Unit!12789)))

(declare-fun lt!198486 () Unit!12786)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26491 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12786)

(assert (=> b!432697 (= lt!198486 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!432697 false))

(declare-fun b!432698 () Bool)

(declare-fun e!255917 () Bool)

(assert (=> b!432698 (= e!255917 true)))

(declare-datatypes ((tuple2!7536 0))(
  ( (tuple2!7537 (_1!3779 (_ BitVec 64)) (_2!3779 V!16211)) )
))
(declare-datatypes ((List!7551 0))(
  ( (Nil!7548) (Cons!7547 (h!8403 tuple2!7536) (t!13177 List!7551)) )
))
(declare-datatypes ((ListLongMap!6449 0))(
  ( (ListLongMap!6450 (toList!3240 List!7551)) )
))
(declare-fun lt!198500 () ListLongMap!6449)

(declare-fun lt!198494 () ListLongMap!6449)

(declare-fun lt!198488 () tuple2!7536)

(declare-fun lt!198499 () tuple2!7536)

(declare-fun +!1388 (ListLongMap!6449 tuple2!7536) ListLongMap!6449)

(assert (=> b!432698 (= lt!198500 (+!1388 (+!1388 lt!198494 lt!198499) lt!198488))))

(declare-fun lt!198495 () Unit!12786)

(declare-fun lt!198498 () V!16211)

(declare-fun v!412 () V!16211)

(declare-fun addCommutativeForDiffKeys!377 (ListLongMap!6449 (_ BitVec 64) V!16211 (_ BitVec 64) V!16211) Unit!12786)

(assert (=> b!432698 (= lt!198495 (addCommutativeForDiffKeys!377 lt!198494 k!794 v!412 (select (arr!12695 _keys!709) from!863) lt!198498))))

(declare-fun b!432699 () Bool)

(declare-fun res!254560 () Bool)

(assert (=> b!432699 (=> (not res!254560) (not e!255914))))

(assert (=> b!432699 (= res!254560 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13047 _keys!709))))))

(declare-fun b!432700 () Bool)

(declare-fun res!254559 () Bool)

(assert (=> b!432700 (=> (not res!254559) (not e!255912))))

(assert (=> b!432700 (= res!254559 (bvsle from!863 i!563))))

(declare-fun b!432701 () Bool)

(declare-fun e!255915 () Bool)

(assert (=> b!432701 (= e!255915 e!255917)))

(declare-fun res!254561 () Bool)

(assert (=> b!432701 (=> res!254561 e!255917)))

(assert (=> b!432701 (= res!254561 (= k!794 (select (arr!12695 _keys!709) from!863)))))

(assert (=> b!432701 (not (= (select (arr!12695 _keys!709) from!863) k!794))))

(declare-fun lt!198496 () Unit!12786)

(assert (=> b!432701 (= lt!198496 e!255913)))

(declare-fun c!55601 () Bool)

(assert (=> b!432701 (= c!55601 (= (select (arr!12695 _keys!709) from!863) k!794))))

(declare-fun lt!198487 () ListLongMap!6449)

(assert (=> b!432701 (= lt!198487 lt!198500)))

(declare-fun lt!198497 () ListLongMap!6449)

(assert (=> b!432701 (= lt!198500 (+!1388 lt!198497 lt!198499))))

(assert (=> b!432701 (= lt!198499 (tuple2!7537 (select (arr!12695 _keys!709) from!863) lt!198498))))

(declare-fun defaultEntry!557 () Int)

(declare-fun get!6313 (ValueCell!5321 V!16211) V!16211)

(declare-fun dynLambda!806 (Int (_ BitVec 64)) V!16211)

(assert (=> b!432701 (= lt!198498 (get!6313 (select (arr!12696 _values!549) from!863) (dynLambda!806 defaultEntry!557 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!18615 () Bool)

(declare-fun tp!36059 () Bool)

(assert (=> mapNonEmpty!18615 (= mapRes!18615 (and tp!36059 e!255920))))

(declare-fun mapValue!18615 () ValueCell!5321)

(declare-fun mapKey!18615 () (_ BitVec 32))

(declare-fun mapRest!18615 () (Array (_ BitVec 32) ValueCell!5321))

(assert (=> mapNonEmpty!18615 (= (arr!12696 _values!549) (store mapRest!18615 mapKey!18615 mapValue!18615))))

(declare-fun b!432702 () Bool)

(declare-fun e!255916 () Bool)

(assert (=> b!432702 (= e!255916 (not e!255915))))

(declare-fun res!254562 () Bool)

(assert (=> b!432702 (=> res!254562 e!255915)))

(assert (=> b!432702 (= res!254562 (not (validKeyInArray!0 (select (arr!12695 _keys!709) from!863))))))

(declare-fun lt!198490 () ListLongMap!6449)

(assert (=> b!432702 (= lt!198490 lt!198497)))

(assert (=> b!432702 (= lt!198497 (+!1388 lt!198494 lt!198488))))

(declare-fun minValue!515 () V!16211)

(declare-fun zeroValue!515 () V!16211)

(declare-fun lt!198489 () array!26493)

(declare-fun getCurrentListMapNoExtraKeys!1438 (array!26491 array!26493 (_ BitVec 32) (_ BitVec 32) V!16211 V!16211 (_ BitVec 32) Int) ListLongMap!6449)

(assert (=> b!432702 (= lt!198490 (getCurrentListMapNoExtraKeys!1438 lt!198492 lt!198489 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!432702 (= lt!198488 (tuple2!7537 k!794 v!412))))

(assert (=> b!432702 (= lt!198494 (getCurrentListMapNoExtraKeys!1438 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!198493 () Unit!12786)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!571 (array!26491 array!26493 (_ BitVec 32) (_ BitVec 32) V!16211 V!16211 (_ BitVec 32) (_ BitVec 64) V!16211 (_ BitVec 32) Int) Unit!12786)

(assert (=> b!432702 (= lt!198493 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!571 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!432703 () Bool)

(declare-fun e!255918 () Bool)

(assert (=> b!432703 (= e!255918 tp_is_empty!11329)))

(declare-fun res!254553 () Bool)

(assert (=> start!39910 (=> (not res!254553) (not e!255914))))

(assert (=> start!39910 (= res!254553 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13047 _keys!709))))))

(assert (=> start!39910 e!255914))

(assert (=> start!39910 tp_is_empty!11329))

(assert (=> start!39910 tp!36060))

(assert (=> start!39910 true))

(declare-fun e!255919 () Bool)

(declare-fun array_inv!9234 (array!26493) Bool)

(assert (=> start!39910 (and (array_inv!9234 _values!549) e!255919)))

(declare-fun array_inv!9235 (array!26491) Bool)

(assert (=> start!39910 (array_inv!9235 _keys!709)))

(declare-fun b!432704 () Bool)

(assert (=> b!432704 (= e!255919 (and e!255918 mapRes!18615))))

(declare-fun condMapEmpty!18615 () Bool)

(declare-fun mapDefault!18615 () ValueCell!5321)

