; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39212 () Bool)

(assert start!39212)

(declare-fun b_free!9479 () Bool)

(declare-fun b_next!9479 () Bool)

(assert (=> start!39212 (= b_free!9479 (not b_next!9479))))

(declare-fun tp!33965 () Bool)

(declare-fun b_and!16865 () Bool)

(assert (=> start!39212 (= tp!33965 b_and!16865)))

(declare-fun b!413487 () Bool)

(declare-fun e!247258 () Bool)

(declare-fun tp_is_empty!10631 () Bool)

(assert (=> b!413487 (= e!247258 tp_is_empty!10631)))

(declare-fun b!413488 () Bool)

(declare-fun res!240280 () Bool)

(declare-fun e!247257 () Bool)

(assert (=> b!413488 (=> (not res!240280) (not e!247257))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413488 (= res!240280 (validKeyInArray!0 k!794))))

(declare-fun res!240287 () Bool)

(assert (=> start!39212 (=> (not res!240287) (not e!247257))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25119 0))(
  ( (array!25120 (arr!12009 (Array (_ BitVec 32) (_ BitVec 64))) (size!12361 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25119)

(assert (=> start!39212 (= res!240287 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12361 _keys!709))))))

(assert (=> start!39212 e!247257))

(assert (=> start!39212 tp_is_empty!10631))

(assert (=> start!39212 tp!33965))

(assert (=> start!39212 true))

(declare-datatypes ((V!15279 0))(
  ( (V!15280 (val!5360 Int)) )
))
(declare-datatypes ((ValueCell!4972 0))(
  ( (ValueCellFull!4972 (v!7607 V!15279)) (EmptyCell!4972) )
))
(declare-datatypes ((array!25121 0))(
  ( (array!25122 (arr!12010 (Array (_ BitVec 32) ValueCell!4972)) (size!12362 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25121)

(declare-fun e!247255 () Bool)

(declare-fun array_inv!8760 (array!25121) Bool)

(assert (=> start!39212 (and (array_inv!8760 _values!549) e!247255)))

(declare-fun array_inv!8761 (array!25119) Bool)

(assert (=> start!39212 (array_inv!8761 _keys!709)))

(declare-fun b!413489 () Bool)

(declare-fun e!247253 () Bool)

(declare-datatypes ((tuple2!6964 0))(
  ( (tuple2!6965 (_1!3493 (_ BitVec 64)) (_2!3493 V!15279)) )
))
(declare-datatypes ((List!6989 0))(
  ( (Nil!6986) (Cons!6985 (h!7841 tuple2!6964) (t!12163 List!6989)) )
))
(declare-datatypes ((ListLongMap!5877 0))(
  ( (ListLongMap!5878 (toList!2954 List!6989)) )
))
(declare-fun call!28615 () ListLongMap!5877)

(declare-fun call!28616 () ListLongMap!5877)

(assert (=> b!413489 (= e!247253 (= call!28615 call!28616))))

(declare-fun b!413490 () Bool)

(declare-fun res!240284 () Bool)

(assert (=> b!413490 (=> (not res!240284) (not e!247257))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413490 (= res!240284 (or (= (select (arr!12009 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12009 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!413491 () Bool)

(declare-fun res!240281 () Bool)

(assert (=> b!413491 (=> (not res!240281) (not e!247257))))

(declare-fun arrayContainsKey!0 (array!25119 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413491 (= res!240281 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!413492 () Bool)

(declare-fun res!240289 () Bool)

(assert (=> b!413492 (=> (not res!240289) (not e!247257))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413492 (= res!240289 (validMask!0 mask!1025))))

(declare-fun b!413493 () Bool)

(declare-fun res!240279 () Bool)

(assert (=> b!413493 (=> (not res!240279) (not e!247257))))

(declare-datatypes ((List!6990 0))(
  ( (Nil!6987) (Cons!6986 (h!7842 (_ BitVec 64)) (t!12164 List!6990)) )
))
(declare-fun arrayNoDuplicates!0 (array!25119 (_ BitVec 32) List!6990) Bool)

(assert (=> b!413493 (= res!240279 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6987))))

(declare-fun b!413494 () Bool)

(declare-fun res!240290 () Bool)

(assert (=> b!413494 (=> (not res!240290) (not e!247257))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25119 (_ BitVec 32)) Bool)

(assert (=> b!413494 (= res!240290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!413495 () Bool)

(declare-fun res!240285 () Bool)

(declare-fun e!247254 () Bool)

(assert (=> b!413495 (=> (not res!240285) (not e!247254))))

(assert (=> b!413495 (= res!240285 (bvsle from!863 i!563))))

(declare-fun b!413496 () Bool)

(declare-fun e!247259 () Bool)

(assert (=> b!413496 (= e!247254 e!247259)))

(declare-fun res!240288 () Bool)

(assert (=> b!413496 (=> (not res!240288) (not e!247259))))

(assert (=> b!413496 (= res!240288 (= from!863 i!563))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!189739 () array!25119)

(declare-fun lt!189741 () ListLongMap!5877)

(declare-fun zeroValue!515 () V!15279)

(declare-fun lt!189740 () array!25121)

(declare-fun minValue!515 () V!15279)

(declare-fun getCurrentListMapNoExtraKeys!1162 (array!25119 array!25121 (_ BitVec 32) (_ BitVec 32) V!15279 V!15279 (_ BitVec 32) Int) ListLongMap!5877)

(assert (=> b!413496 (= lt!189741 (getCurrentListMapNoExtraKeys!1162 lt!189739 lt!189740 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!15279)

(assert (=> b!413496 (= lt!189740 (array!25122 (store (arr!12010 _values!549) i!563 (ValueCellFull!4972 v!412)) (size!12362 _values!549)))))

(declare-fun lt!189742 () ListLongMap!5877)

(assert (=> b!413496 (= lt!189742 (getCurrentListMapNoExtraKeys!1162 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!17568 () Bool)

(declare-fun mapRes!17568 () Bool)

(assert (=> mapIsEmpty!17568 mapRes!17568))

(declare-fun b!413497 () Bool)

(declare-fun e!247256 () Bool)

(assert (=> b!413497 (= e!247256 tp_is_empty!10631)))

(declare-fun bm!28612 () Bool)

(assert (=> bm!28612 (= call!28616 (getCurrentListMapNoExtraKeys!1162 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!17568 () Bool)

(declare-fun tp!33966 () Bool)

(assert (=> mapNonEmpty!17568 (= mapRes!17568 (and tp!33966 e!247258))))

(declare-fun mapValue!17568 () ValueCell!4972)

(declare-fun mapKey!17568 () (_ BitVec 32))

(declare-fun mapRest!17568 () (Array (_ BitVec 32) ValueCell!4972))

(assert (=> mapNonEmpty!17568 (= (arr!12010 _values!549) (store mapRest!17568 mapKey!17568 mapValue!17568))))

(declare-fun b!413498 () Bool)

(assert (=> b!413498 (= e!247257 e!247254)))

(declare-fun res!240282 () Bool)

(assert (=> b!413498 (=> (not res!240282) (not e!247254))))

(assert (=> b!413498 (= res!240282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189739 mask!1025))))

(assert (=> b!413498 (= lt!189739 (array!25120 (store (arr!12009 _keys!709) i!563 k!794) (size!12361 _keys!709)))))

(declare-fun b!413499 () Bool)

(assert (=> b!413499 (= e!247255 (and e!247256 mapRes!17568))))

(declare-fun condMapEmpty!17568 () Bool)

(declare-fun mapDefault!17568 () ValueCell!4972)

