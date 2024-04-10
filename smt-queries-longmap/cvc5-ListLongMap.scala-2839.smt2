; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40998 () Bool)

(assert start!40998)

(declare-fun b_free!10933 () Bool)

(declare-fun b_next!10933 () Bool)

(assert (=> start!40998 (= b_free!10933 (not b_next!10933))))

(declare-fun tp!38625 () Bool)

(declare-fun b_and!19075 () Bool)

(assert (=> start!40998 (= tp!38625 b_and!19075)))

(declare-fun b!456639 () Bool)

(declare-fun res!272531 () Bool)

(declare-fun e!266775 () Bool)

(assert (=> b!456639 (=> (not res!272531) (not e!266775))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456639 (= res!272531 (validKeyInArray!0 k!794))))

(declare-fun b!456640 () Bool)

(declare-fun e!266779 () Bool)

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((V!17467 0))(
  ( (V!17468 (val!6180 Int)) )
))
(declare-datatypes ((ValueCell!5792 0))(
  ( (ValueCellFull!5792 (v!8446 V!17467)) (EmptyCell!5792) )
))
(declare-datatypes ((array!28343 0))(
  ( (array!28344 (arr!13615 (Array (_ BitVec 32) ValueCell!5792)) (size!13967 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28343)

(assert (=> b!456640 (= e!266779 (bvslt i!563 (size!13967 _values!549)))))

(declare-fun b!456641 () Bool)

(declare-fun res!272533 () Bool)

(assert (=> b!456641 (=> (not res!272533) (not e!266775))))

(declare-datatypes ((array!28345 0))(
  ( (array!28346 (arr!13616 (Array (_ BitVec 32) (_ BitVec 64))) (size!13968 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28345)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!456641 (= res!272533 (and (= (size!13967 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13968 _keys!709) (size!13967 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456642 () Bool)

(declare-fun res!272539 () Bool)

(assert (=> b!456642 (=> (not res!272539) (not e!266775))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28345 (_ BitVec 32)) Bool)

(assert (=> b!456642 (= res!272539 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!20047 () Bool)

(declare-fun mapRes!20047 () Bool)

(declare-fun tp!38626 () Bool)

(declare-fun e!266773 () Bool)

(assert (=> mapNonEmpty!20047 (= mapRes!20047 (and tp!38626 e!266773))))

(declare-fun mapRest!20047 () (Array (_ BitVec 32) ValueCell!5792))

(declare-fun mapKey!20047 () (_ BitVec 32))

(declare-fun mapValue!20047 () ValueCell!5792)

(assert (=> mapNonEmpty!20047 (= (arr!13615 _values!549) (store mapRest!20047 mapKey!20047 mapValue!20047))))

(declare-fun b!456643 () Bool)

(declare-fun e!266777 () Bool)

(assert (=> b!456643 (= e!266775 e!266777)))

(declare-fun res!272538 () Bool)

(assert (=> b!456643 (=> (not res!272538) (not e!266777))))

(declare-fun lt!206614 () array!28345)

(assert (=> b!456643 (= res!272538 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206614 mask!1025))))

(assert (=> b!456643 (= lt!206614 (array!28346 (store (arr!13616 _keys!709) i!563 k!794) (size!13968 _keys!709)))))

(declare-fun b!456644 () Bool)

(declare-fun res!272534 () Bool)

(assert (=> b!456644 (=> (not res!272534) (not e!266777))))

(declare-datatypes ((List!8213 0))(
  ( (Nil!8210) (Cons!8209 (h!9065 (_ BitVec 64)) (t!14041 List!8213)) )
))
(declare-fun arrayNoDuplicates!0 (array!28345 (_ BitVec 32) List!8213) Bool)

(assert (=> b!456644 (= res!272534 (arrayNoDuplicates!0 lt!206614 #b00000000000000000000000000000000 Nil!8210))))

(declare-fun b!456645 () Bool)

(declare-fun e!266778 () Bool)

(assert (=> b!456645 (= e!266777 e!266778)))

(declare-fun res!272530 () Bool)

(assert (=> b!456645 (=> (not res!272530) (not e!266778))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!456645 (= res!272530 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17467)

(declare-datatypes ((tuple2!8142 0))(
  ( (tuple2!8143 (_1!4082 (_ BitVec 64)) (_2!4082 V!17467)) )
))
(declare-datatypes ((List!8214 0))(
  ( (Nil!8211) (Cons!8210 (h!9066 tuple2!8142) (t!14042 List!8214)) )
))
(declare-datatypes ((ListLongMap!7055 0))(
  ( (ListLongMap!7056 (toList!3543 List!8214)) )
))
(declare-fun lt!206611 () ListLongMap!7055)

(declare-fun minValue!515 () V!17467)

(declare-fun lt!206615 () array!28343)

(declare-fun getCurrentListMapNoExtraKeys!1726 (array!28345 array!28343 (_ BitVec 32) (_ BitVec 32) V!17467 V!17467 (_ BitVec 32) Int) ListLongMap!7055)

(assert (=> b!456645 (= lt!206611 (getCurrentListMapNoExtraKeys!1726 lt!206614 lt!206615 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17467)

(assert (=> b!456645 (= lt!206615 (array!28344 (store (arr!13615 _values!549) i!563 (ValueCellFull!5792 v!412)) (size!13967 _values!549)))))

(declare-fun lt!206613 () ListLongMap!7055)

(assert (=> b!456645 (= lt!206613 (getCurrentListMapNoExtraKeys!1726 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!456646 () Bool)

(declare-fun res!272540 () Bool)

(assert (=> b!456646 (=> (not res!272540) (not e!266775))))

(declare-fun arrayContainsKey!0 (array!28345 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456646 (= res!272540 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!456647 () Bool)

(declare-fun res!272541 () Bool)

(assert (=> b!456647 (=> (not res!272541) (not e!266775))))

(assert (=> b!456647 (= res!272541 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8210))))

(declare-fun b!456648 () Bool)

(declare-fun res!272532 () Bool)

(assert (=> b!456648 (=> (not res!272532) (not e!266775))))

(assert (=> b!456648 (= res!272532 (or (= (select (arr!13616 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13616 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!456649 () Bool)

(declare-fun tp_is_empty!12271 () Bool)

(assert (=> b!456649 (= e!266773 tp_is_empty!12271)))

(declare-fun b!456650 () Bool)

(declare-fun e!266776 () Bool)

(declare-fun e!266774 () Bool)

(assert (=> b!456650 (= e!266776 (and e!266774 mapRes!20047))))

(declare-fun condMapEmpty!20047 () Bool)

(declare-fun mapDefault!20047 () ValueCell!5792)

