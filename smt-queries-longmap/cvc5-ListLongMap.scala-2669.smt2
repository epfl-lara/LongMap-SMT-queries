; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39832 () Bool)

(assert start!39832)

(declare-fun b_free!10099 () Bool)

(declare-fun b_next!10099 () Bool)

(assert (=> start!39832 (= b_free!10099 (not b_next!10099))))

(declare-fun tp!35826 () Bool)

(declare-fun b_and!17857 () Bool)

(assert (=> start!39832 (= tp!35826 b_and!17857)))

(declare-fun b!430270 () Bool)

(declare-datatypes ((Unit!12658 0))(
  ( (Unit!12659) )
))
(declare-fun e!254748 () Unit!12658)

(declare-fun Unit!12660 () Unit!12658)

(assert (=> b!430270 (= e!254748 Unit!12660)))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun lt!196740 () Unit!12658)

(declare-datatypes ((array!26337 0))(
  ( (array!26338 (arr!12618 (Array (_ BitVec 32) (_ BitVec 64))) (size!12970 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26337)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!26337 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!12658)

(assert (=> b!430270 (= lt!196740 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!430270 false))

(declare-fun b!430271 () Bool)

(declare-fun e!254744 () Bool)

(assert (=> b!430271 (= e!254744 true)))

(declare-datatypes ((V!16107 0))(
  ( (V!16108 (val!5670 Int)) )
))
(declare-datatypes ((tuple2!7466 0))(
  ( (tuple2!7467 (_1!3744 (_ BitVec 64)) (_2!3744 V!16107)) )
))
(declare-fun lt!196739 () tuple2!7466)

(declare-datatypes ((List!7485 0))(
  ( (Nil!7482) (Cons!7481 (h!8337 tuple2!7466) (t!13033 List!7485)) )
))
(declare-datatypes ((ListLongMap!6379 0))(
  ( (ListLongMap!6380 (toList!3205 List!7485)) )
))
(declare-fun lt!196745 () ListLongMap!6379)

(declare-fun lt!196744 () ListLongMap!6379)

(declare-fun lt!196742 () tuple2!7466)

(declare-fun +!1354 (ListLongMap!6379 tuple2!7466) ListLongMap!6379)

(assert (=> b!430271 (= lt!196744 (+!1354 (+!1354 lt!196745 lt!196742) lt!196739))))

(declare-fun lt!196737 () Unit!12658)

(declare-fun lt!196733 () V!16107)

(declare-fun v!412 () V!16107)

(declare-fun addCommutativeForDiffKeys!350 (ListLongMap!6379 (_ BitVec 64) V!16107 (_ BitVec 64) V!16107) Unit!12658)

(assert (=> b!430271 (= lt!196737 (addCommutativeForDiffKeys!350 lt!196745 k!794 v!412 (select (arr!12618 _keys!709) from!863) lt!196733))))

(declare-fun b!430272 () Bool)

(declare-fun e!254750 () Bool)

(declare-fun tp_is_empty!11251 () Bool)

(assert (=> b!430272 (= e!254750 tp_is_empty!11251)))

(declare-fun b!430273 () Bool)

(declare-fun res!252805 () Bool)

(declare-fun e!254747 () Bool)

(assert (=> b!430273 (=> (not res!252805) (not e!254747))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!430273 (= res!252805 (or (= (select (arr!12618 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12618 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!430274 () Bool)

(declare-fun res!252796 () Bool)

(declare-fun e!254749 () Bool)

(assert (=> b!430274 (=> (not res!252796) (not e!254749))))

(assert (=> b!430274 (= res!252796 (bvsle from!863 i!563))))

(declare-fun b!430275 () Bool)

(declare-fun Unit!12661 () Unit!12658)

(assert (=> b!430275 (= e!254748 Unit!12661)))

(declare-fun b!430276 () Bool)

(declare-fun res!252802 () Bool)

(assert (=> b!430276 (=> (not res!252802) (not e!254747))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26337 (_ BitVec 32)) Bool)

(assert (=> b!430276 (= res!252802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!430277 () Bool)

(assert (=> b!430277 (= e!254747 e!254749)))

(declare-fun res!252801 () Bool)

(assert (=> b!430277 (=> (not res!252801) (not e!254749))))

(declare-fun lt!196734 () array!26337)

(assert (=> b!430277 (= res!252801 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!196734 mask!1025))))

(assert (=> b!430277 (= lt!196734 (array!26338 (store (arr!12618 _keys!709) i!563 k!794) (size!12970 _keys!709)))))

(declare-fun b!430278 () Bool)

(declare-fun e!254743 () Bool)

(assert (=> b!430278 (= e!254743 tp_is_empty!11251)))

(declare-fun b!430279 () Bool)

(declare-fun res!252797 () Bool)

(assert (=> b!430279 (=> (not res!252797) (not e!254747))))

(assert (=> b!430279 (= res!252797 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12970 _keys!709))))))

(declare-fun res!252804 () Bool)

(assert (=> start!39832 (=> (not res!252804) (not e!254747))))

(assert (=> start!39832 (= res!252804 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12970 _keys!709))))))

(assert (=> start!39832 e!254747))

(assert (=> start!39832 tp_is_empty!11251))

(assert (=> start!39832 tp!35826))

(assert (=> start!39832 true))

(declare-datatypes ((ValueCell!5282 0))(
  ( (ValueCellFull!5282 (v!7917 V!16107)) (EmptyCell!5282) )
))
(declare-datatypes ((array!26339 0))(
  ( (array!26340 (arr!12619 (Array (_ BitVec 32) ValueCell!5282)) (size!12971 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26339)

(declare-fun e!254742 () Bool)

(declare-fun array_inv!9188 (array!26339) Bool)

(assert (=> start!39832 (and (array_inv!9188 _values!549) e!254742)))

(declare-fun array_inv!9189 (array!26337) Bool)

(assert (=> start!39832 (array_inv!9189 _keys!709)))

(declare-fun b!430280 () Bool)

(declare-fun res!252809 () Bool)

(assert (=> b!430280 (=> (not res!252809) (not e!254747))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!430280 (= res!252809 (validKeyInArray!0 k!794))))

(declare-fun b!430281 () Bool)

(declare-fun e!254746 () Bool)

(assert (=> b!430281 (= e!254749 e!254746)))

(declare-fun res!252800 () Bool)

(assert (=> b!430281 (=> (not res!252800) (not e!254746))))

(assert (=> b!430281 (= res!252800 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!16107)

(declare-fun lt!196738 () array!26339)

(declare-fun minValue!515 () V!16107)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!196732 () ListLongMap!6379)

(declare-fun getCurrentListMapNoExtraKeys!1407 (array!26337 array!26339 (_ BitVec 32) (_ BitVec 32) V!16107 V!16107 (_ BitVec 32) Int) ListLongMap!6379)

(assert (=> b!430281 (= lt!196732 (getCurrentListMapNoExtraKeys!1407 lt!196734 lt!196738 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!430281 (= lt!196738 (array!26340 (store (arr!12619 _values!549) i!563 (ValueCellFull!5282 v!412)) (size!12971 _values!549)))))

(declare-fun lt!196731 () ListLongMap!6379)

(assert (=> b!430281 (= lt!196731 (getCurrentListMapNoExtraKeys!1407 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!430282 () Bool)

(declare-fun res!252808 () Bool)

(assert (=> b!430282 (=> (not res!252808) (not e!254747))))

(declare-datatypes ((List!7486 0))(
  ( (Nil!7483) (Cons!7482 (h!8338 (_ BitVec 64)) (t!13034 List!7486)) )
))
(declare-fun arrayNoDuplicates!0 (array!26337 (_ BitVec 32) List!7486) Bool)

(assert (=> b!430282 (= res!252808 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7483))))

(declare-fun b!430283 () Bool)

(declare-fun e!254751 () Bool)

(assert (=> b!430283 (= e!254746 (not e!254751))))

(declare-fun res!252806 () Bool)

(assert (=> b!430283 (=> res!252806 e!254751)))

(assert (=> b!430283 (= res!252806 (not (validKeyInArray!0 (select (arr!12618 _keys!709) from!863))))))

(declare-fun lt!196736 () ListLongMap!6379)

(declare-fun lt!196735 () ListLongMap!6379)

(assert (=> b!430283 (= lt!196736 lt!196735)))

(assert (=> b!430283 (= lt!196735 (+!1354 lt!196745 lt!196739))))

(assert (=> b!430283 (= lt!196736 (getCurrentListMapNoExtraKeys!1407 lt!196734 lt!196738 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!430283 (= lt!196739 (tuple2!7467 k!794 v!412))))

(assert (=> b!430283 (= lt!196745 (getCurrentListMapNoExtraKeys!1407 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!196741 () Unit!12658)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!543 (array!26337 array!26339 (_ BitVec 32) (_ BitVec 32) V!16107 V!16107 (_ BitVec 32) (_ BitVec 64) V!16107 (_ BitVec 32) Int) Unit!12658)

(assert (=> b!430283 (= lt!196741 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!543 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!18498 () Bool)

(declare-fun mapRes!18498 () Bool)

(assert (=> mapIsEmpty!18498 mapRes!18498))

(declare-fun b!430284 () Bool)

(assert (=> b!430284 (= e!254742 (and e!254750 mapRes!18498))))

(declare-fun condMapEmpty!18498 () Bool)

(declare-fun mapDefault!18498 () ValueCell!5282)

