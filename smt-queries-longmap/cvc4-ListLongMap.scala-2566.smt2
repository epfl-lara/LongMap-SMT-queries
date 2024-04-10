; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39218 () Bool)

(assert start!39218)

(declare-fun b_free!9485 () Bool)

(declare-fun b_next!9485 () Bool)

(assert (=> start!39218 (= b_free!9485 (not b_next!9485))))

(declare-fun tp!33983 () Bool)

(declare-fun b_and!16871 () Bool)

(assert (=> start!39218 (= tp!33983 b_and!16871)))

(declare-fun b!413649 () Bool)

(declare-fun res!240404 () Bool)

(declare-fun e!247328 () Bool)

(assert (=> b!413649 (=> (not res!240404) (not e!247328))))

(declare-datatypes ((array!25131 0))(
  ( (array!25132 (arr!12015 (Array (_ BitVec 32) (_ BitVec 64))) (size!12367 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25131)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!25131 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!413649 (= res!240404 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!413650 () Bool)

(declare-fun res!240402 () Bool)

(declare-fun e!247327 () Bool)

(assert (=> b!413650 (=> (not res!240402) (not e!247327))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!413650 (= res!240402 (bvsle from!863 i!563))))

(declare-fun b!413651 () Bool)

(declare-fun e!247325 () Bool)

(declare-fun tp_is_empty!10637 () Bool)

(assert (=> b!413651 (= e!247325 tp_is_empty!10637)))

(declare-fun b!413652 () Bool)

(declare-fun res!240396 () Bool)

(assert (=> b!413652 (=> (not res!240396) (not e!247328))))

(declare-datatypes ((List!6994 0))(
  ( (Nil!6991) (Cons!6990 (h!7846 (_ BitVec 64)) (t!12168 List!6994)) )
))
(declare-fun arrayNoDuplicates!0 (array!25131 (_ BitVec 32) List!6994) Bool)

(assert (=> b!413652 (= res!240396 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6991))))

(declare-fun mapIsEmpty!17577 () Bool)

(declare-fun mapRes!17577 () Bool)

(assert (=> mapIsEmpty!17577 mapRes!17577))

(declare-fun b!413653 () Bool)

(declare-fun res!240405 () Bool)

(assert (=> b!413653 (=> (not res!240405) (not e!247327))))

(declare-fun lt!189786 () array!25131)

(assert (=> b!413653 (= res!240405 (arrayNoDuplicates!0 lt!189786 #b00000000000000000000000000000000 Nil!6991))))

(declare-fun b!413654 () Bool)

(declare-fun res!240407 () Bool)

(assert (=> b!413654 (=> (not res!240407) (not e!247328))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!413654 (= res!240407 (validKeyInArray!0 k!794))))

(declare-fun b!413655 () Bool)

(declare-fun res!240406 () Bool)

(assert (=> b!413655 (=> (not res!240406) (not e!247328))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15287 0))(
  ( (V!15288 (val!5363 Int)) )
))
(declare-datatypes ((ValueCell!4975 0))(
  ( (ValueCellFull!4975 (v!7610 V!15287)) (EmptyCell!4975) )
))
(declare-datatypes ((array!25133 0))(
  ( (array!25134 (arr!12016 (Array (_ BitVec 32) ValueCell!4975)) (size!12368 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25133)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!413655 (= res!240406 (and (= (size!12368 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12367 _keys!709) (size!12368 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!413656 () Bool)

(declare-fun res!240398 () Bool)

(assert (=> b!413656 (=> (not res!240398) (not e!247328))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!413656 (= res!240398 (validMask!0 mask!1025))))

(declare-datatypes ((tuple2!6970 0))(
  ( (tuple2!6971 (_1!3496 (_ BitVec 64)) (_2!3496 V!15287)) )
))
(declare-datatypes ((List!6995 0))(
  ( (Nil!6992) (Cons!6991 (h!7847 tuple2!6970) (t!12169 List!6995)) )
))
(declare-datatypes ((ListLongMap!5883 0))(
  ( (ListLongMap!5884 (toList!2957 List!6995)) )
))
(declare-fun call!28634 () ListLongMap!5883)

(declare-fun b!413657 () Bool)

(declare-fun e!247331 () Bool)

(declare-fun call!28633 () ListLongMap!5883)

(declare-fun v!412 () V!15287)

(declare-fun +!1167 (ListLongMap!5883 tuple2!6970) ListLongMap!5883)

(assert (=> b!413657 (= e!247331 (= call!28633 (+!1167 call!28634 (tuple2!6971 k!794 v!412))))))

(declare-fun b!413658 () Bool)

(declare-fun e!247329 () Bool)

(assert (=> b!413658 (= e!247327 e!247329)))

(declare-fun res!240401 () Bool)

(assert (=> b!413658 (=> (not res!240401) (not e!247329))))

(assert (=> b!413658 (= res!240401 (= from!863 i!563))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!15287)

(declare-fun lt!189788 () array!25133)

(declare-fun minValue!515 () V!15287)

(declare-fun lt!189787 () ListLongMap!5883)

(declare-fun getCurrentListMapNoExtraKeys!1164 (array!25131 array!25133 (_ BitVec 32) (_ BitVec 32) V!15287 V!15287 (_ BitVec 32) Int) ListLongMap!5883)

(assert (=> b!413658 (= lt!189787 (getCurrentListMapNoExtraKeys!1164 lt!189786 lt!189788 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!413658 (= lt!189788 (array!25134 (store (arr!12016 _values!549) i!563 (ValueCellFull!4975 v!412)) (size!12368 _values!549)))))

(declare-fun lt!189784 () ListLongMap!5883)

(assert (=> b!413658 (= lt!189784 (getCurrentListMapNoExtraKeys!1164 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun bm!28630 () Bool)

(declare-fun c!54941 () Bool)

(assert (=> bm!28630 (= call!28633 (getCurrentListMapNoExtraKeys!1164 (ite c!54941 lt!189786 _keys!709) (ite c!54941 lt!189788 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413659 () Bool)

(assert (=> b!413659 (= e!247329 (not true))))

(assert (=> b!413659 e!247331))

(assert (=> b!413659 (= c!54941 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!12238 0))(
  ( (Unit!12239) )
))
(declare-fun lt!189785 () Unit!12238)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!377 (array!25131 array!25133 (_ BitVec 32) (_ BitVec 32) V!15287 V!15287 (_ BitVec 32) (_ BitVec 64) V!15287 (_ BitVec 32) Int) Unit!12238)

(assert (=> b!413659 (= lt!189785 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!377 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413660 () Bool)

(declare-fun res!240399 () Bool)

(assert (=> b!413660 (=> (not res!240399) (not e!247328))))

(assert (=> b!413660 (= res!240399 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12367 _keys!709))))))

(declare-fun b!413661 () Bool)

(assert (=> b!413661 (= e!247328 e!247327)))

(declare-fun res!240403 () Bool)

(assert (=> b!413661 (=> (not res!240403) (not e!247327))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25131 (_ BitVec 32)) Bool)

(assert (=> b!413661 (= res!240403 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189786 mask!1025))))

(assert (=> b!413661 (= lt!189786 (array!25132 (store (arr!12015 _keys!709) i!563 k!794) (size!12367 _keys!709)))))

(declare-fun b!413662 () Bool)

(declare-fun e!247332 () Bool)

(assert (=> b!413662 (= e!247332 tp_is_empty!10637)))

(declare-fun bm!28631 () Bool)

(assert (=> bm!28631 (= call!28634 (getCurrentListMapNoExtraKeys!1164 (ite c!54941 _keys!709 lt!189786) (ite c!54941 _values!549 lt!189788) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!413663 () Bool)

(declare-fun e!247330 () Bool)

(assert (=> b!413663 (= e!247330 (and e!247332 mapRes!17577))))

(declare-fun condMapEmpty!17577 () Bool)

(declare-fun mapDefault!17577 () ValueCell!4975)

