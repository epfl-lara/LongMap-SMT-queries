; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41194 () Bool)

(assert start!41194)

(declare-fun b_free!11063 () Bool)

(declare-fun b_next!11063 () Bool)

(assert (=> start!41194 (= b_free!11063 (not b_next!11063))))

(declare-fun tp!39025 () Bool)

(declare-fun b_and!19365 () Bool)

(assert (=> start!41194 (= tp!39025 b_and!19365)))

(declare-fun b!460743 () Bool)

(declare-datatypes ((Unit!13420 0))(
  ( (Unit!13421) )
))
(declare-fun e!268775 () Unit!13420)

(declare-fun Unit!13422 () Unit!13420)

(assert (=> b!460743 (= e!268775 Unit!13422)))

(declare-fun b!460744 () Bool)

(declare-fun res!275520 () Bool)

(declare-fun e!268774 () Bool)

(assert (=> b!460744 (=> (not res!275520) (not e!268774))))

(declare-datatypes ((array!28601 0))(
  ( (array!28602 (arr!13741 (Array (_ BitVec 32) (_ BitVec 64))) (size!14093 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28601)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!28601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!460744 (= res!275520 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-datatypes ((V!17639 0))(
  ( (V!17640 (val!6245 Int)) )
))
(declare-datatypes ((tuple2!8240 0))(
  ( (tuple2!8241 (_1!4131 (_ BitVec 64)) (_2!4131 V!17639)) )
))
(declare-fun lt!208723 () tuple2!8240)

(declare-fun b!460745 () Bool)

(declare-datatypes ((List!8311 0))(
  ( (Nil!8308) (Cons!8307 (h!9163 tuple2!8240) (t!14253 List!8311)) )
))
(declare-datatypes ((ListLongMap!7153 0))(
  ( (ListLongMap!7154 (toList!3592 List!8311)) )
))
(declare-fun lt!208730 () ListLongMap!7153)

(declare-fun lt!208732 () ListLongMap!7153)

(declare-fun e!268777 () Bool)

(declare-fun +!1628 (ListLongMap!7153 tuple2!8240) ListLongMap!7153)

(assert (=> b!460745 (= e!268777 (= lt!208730 (+!1628 lt!208732 lt!208723)))))

(declare-fun lt!208733 () tuple2!8240)

(declare-fun lt!208722 () ListLongMap!7153)

(declare-fun lt!208734 () ListLongMap!7153)

(assert (=> b!460745 (= lt!208734 (+!1628 (+!1628 lt!208722 lt!208733) lt!208723))))

(declare-fun lt!208731 () V!17639)

(declare-fun v!412 () V!17639)

(declare-fun lt!208728 () Unit!13420)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun addCommutativeForDiffKeys!436 (ListLongMap!7153 (_ BitVec 64) V!17639 (_ BitVec 64) V!17639) Unit!13420)

(assert (=> b!460745 (= lt!208728 (addCommutativeForDiffKeys!436 lt!208722 k!794 v!412 (select (arr!13741 _keys!709) from!863) lt!208731))))

(declare-fun res!275519 () Bool)

(assert (=> start!41194 (=> (not res!275519) (not e!268774))))

(assert (=> start!41194 (= res!275519 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14093 _keys!709))))))

(assert (=> start!41194 e!268774))

(declare-fun tp_is_empty!12401 () Bool)

(assert (=> start!41194 tp_is_empty!12401))

(assert (=> start!41194 tp!39025))

(assert (=> start!41194 true))

(declare-datatypes ((ValueCell!5857 0))(
  ( (ValueCellFull!5857 (v!8523 V!17639)) (EmptyCell!5857) )
))
(declare-datatypes ((array!28603 0))(
  ( (array!28604 (arr!13742 (Array (_ BitVec 32) ValueCell!5857)) (size!14094 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28603)

(declare-fun e!268772 () Bool)

(declare-fun array_inv!9938 (array!28603) Bool)

(assert (=> start!41194 (and (array_inv!9938 _values!549) e!268772)))

(declare-fun array_inv!9939 (array!28601) Bool)

(assert (=> start!41194 (array_inv!9939 _keys!709)))

(declare-fun b!460746 () Bool)

(declare-fun res!275511 () Bool)

(assert (=> b!460746 (=> (not res!275511) (not e!268774))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28601 (_ BitVec 32)) Bool)

(assert (=> b!460746 (= res!275511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460747 () Bool)

(declare-fun res!275514 () Bool)

(assert (=> b!460747 (=> (not res!275514) (not e!268774))))

(declare-datatypes ((List!8312 0))(
  ( (Nil!8309) (Cons!8308 (h!9164 (_ BitVec 64)) (t!14254 List!8312)) )
))
(declare-fun arrayNoDuplicates!0 (array!28601 (_ BitVec 32) List!8312) Bool)

(assert (=> b!460747 (= res!275514 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8309))))

(declare-fun b!460748 () Bool)

(declare-fun e!268773 () Bool)

(assert (=> b!460748 (= e!268773 tp_is_empty!12401)))

(declare-fun b!460749 () Bool)

(declare-fun e!268771 () Bool)

(assert (=> b!460749 (= e!268771 tp_is_empty!12401)))

(declare-fun b!460750 () Bool)

(declare-fun res!275512 () Bool)

(assert (=> b!460750 (=> (not res!275512) (not e!268774))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!460750 (= res!275512 (validKeyInArray!0 k!794))))

(declare-fun b!460751 () Bool)

(declare-fun res!275515 () Bool)

(declare-fun e!268779 () Bool)

(assert (=> b!460751 (=> (not res!275515) (not e!268779))))

(declare-fun lt!208727 () array!28601)

(assert (=> b!460751 (= res!275515 (arrayNoDuplicates!0 lt!208727 #b00000000000000000000000000000000 Nil!8309))))

(declare-fun b!460752 () Bool)

(declare-fun res!275521 () Bool)

(assert (=> b!460752 (=> (not res!275521) (not e!268774))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!460752 (= res!275521 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14093 _keys!709))))))

(declare-fun b!460753 () Bool)

(declare-fun res!275518 () Bool)

(assert (=> b!460753 (=> (not res!275518) (not e!268779))))

(assert (=> b!460753 (= res!275518 (bvsle from!863 i!563))))

(declare-fun b!460754 () Bool)

(assert (=> b!460754 (= e!268774 e!268779)))

(declare-fun res!275513 () Bool)

(assert (=> b!460754 (=> (not res!275513) (not e!268779))))

(assert (=> b!460754 (= res!275513 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208727 mask!1025))))

(assert (=> b!460754 (= lt!208727 (array!28602 (store (arr!13741 _keys!709) i!563 k!794) (size!14093 _keys!709)))))

(declare-fun b!460755 () Bool)

(declare-fun Unit!13423 () Unit!13420)

(assert (=> b!460755 (= e!268775 Unit!13423)))

(declare-fun lt!208736 () Unit!13420)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28601 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13420)

(assert (=> b!460755 (= lt!208736 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460755 false))

(declare-fun b!460756 () Bool)

(declare-fun e!268778 () Bool)

(declare-fun e!268776 () Bool)

(assert (=> b!460756 (= e!268778 (not e!268776))))

(declare-fun res!275516 () Bool)

(assert (=> b!460756 (=> res!275516 e!268776)))

(assert (=> b!460756 (= res!275516 (not (validKeyInArray!0 (select (arr!13741 _keys!709) from!863))))))

(declare-fun lt!208735 () ListLongMap!7153)

(declare-fun lt!208726 () ListLongMap!7153)

(assert (=> b!460756 (= lt!208735 lt!208726)))

(assert (=> b!460756 (= lt!208726 (+!1628 lt!208722 lt!208723))))

(declare-fun minValue!515 () V!17639)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!17639)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun lt!208729 () array!28603)

(declare-fun getCurrentListMapNoExtraKeys!1772 (array!28601 array!28603 (_ BitVec 32) (_ BitVec 32) V!17639 V!17639 (_ BitVec 32) Int) ListLongMap!7153)

(assert (=> b!460756 (= lt!208735 (getCurrentListMapNoExtraKeys!1772 lt!208727 lt!208729 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (=> b!460756 (= lt!208723 (tuple2!8241 k!794 v!412))))

(assert (=> b!460756 (= lt!208722 (getCurrentListMapNoExtraKeys!1772 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun lt!208725 () Unit!13420)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!784 (array!28601 array!28603 (_ BitVec 32) (_ BitVec 32) V!17639 V!17639 (_ BitVec 32) (_ BitVec 64) V!17639 (_ BitVec 32) Int) Unit!13420)

(assert (=> b!460756 (= lt!208725 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!784 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!20251 () Bool)

(declare-fun mapRes!20251 () Bool)

(assert (=> mapIsEmpty!20251 mapRes!20251))

(declare-fun b!460757 () Bool)

(declare-fun res!275509 () Bool)

(assert (=> b!460757 (=> (not res!275509) (not e!268774))))

(assert (=> b!460757 (= res!275509 (or (= (select (arr!13741 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13741 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!460758 () Bool)

(assert (=> b!460758 (= e!268779 e!268778)))

(declare-fun res!275517 () Bool)

(assert (=> b!460758 (=> (not res!275517) (not e!268778))))

(assert (=> b!460758 (= res!275517 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(assert (=> b!460758 (= lt!208730 (getCurrentListMapNoExtraKeys!1772 lt!208727 lt!208729 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!460758 (= lt!208729 (array!28604 (store (arr!13742 _values!549) i!563 (ValueCellFull!5857 v!412)) (size!14094 _values!549)))))

(assert (=> b!460758 (= lt!208732 (getCurrentListMapNoExtraKeys!1772 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!460759 () Bool)

(declare-fun res!275510 () Bool)

(assert (=> b!460759 (=> (not res!275510) (not e!268774))))

(assert (=> b!460759 (= res!275510 (and (= (size!14094 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14093 _keys!709) (size!14094 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!460760 () Bool)

(declare-fun res!275508 () Bool)

(assert (=> b!460760 (=> (not res!275508) (not e!268774))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!460760 (= res!275508 (validMask!0 mask!1025))))

(declare-fun b!460761 () Bool)

(assert (=> b!460761 (= e!268772 (and e!268771 mapRes!20251))))

(declare-fun condMapEmpty!20251 () Bool)

(declare-fun mapDefault!20251 () ValueCell!5857)

