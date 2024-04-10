; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38666 () Bool)

(assert start!38666)

(declare-fun b_free!9203 () Bool)

(declare-fun b_next!9203 () Bool)

(assert (=> start!38666 (= b_free!9203 (not b_next!9203))))

(declare-fun tp!32732 () Bool)

(declare-fun b_and!16589 () Bool)

(assert (=> start!38666 (= tp!32732 b_and!16589)))

(declare-fun b!401635 () Bool)

(declare-fun res!231236 () Bool)

(declare-fun e!242139 () Bool)

(assert (=> b!401635 (=> (not res!231236) (not e!242139))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24077 0))(
  ( (array!24078 (arr!11488 (Array (_ BitVec 32) (_ BitVec 64))) (size!11840 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24077)

(assert (=> b!401635 (= res!231236 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11840 _keys!709))))))

(declare-fun b!401637 () Bool)

(declare-fun res!231233 () Bool)

(assert (=> b!401637 (=> (not res!231233) (not e!242139))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401637 (= res!231233 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!401638 () Bool)

(declare-fun e!242136 () Bool)

(assert (=> b!401638 (= e!242136 (not true))))

(declare-fun e!242134 () Bool)

(assert (=> b!401638 e!242134))

(declare-fun c!54761 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401638 (= c!54761 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14551 0))(
  ( (V!14552 (val!5087 Int)) )
))
(declare-fun minValue!515 () V!14551)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4699 0))(
  ( (ValueCellFull!4699 (v!7334 V!14551)) (EmptyCell!4699) )
))
(declare-datatypes ((array!24079 0))(
  ( (array!24080 (arr!11489 (Array (_ BitVec 32) ValueCell!4699)) (size!11841 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24079)

(declare-datatypes ((Unit!12164 0))(
  ( (Unit!12165) )
))
(declare-fun lt!187834 () Unit!12164)

(declare-fun zeroValue!515 () V!14551)

(declare-fun v!412 () V!14551)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!340 (array!24077 array!24079 (_ BitVec 32) (_ BitVec 32) V!14551 V!14551 (_ BitVec 32) (_ BitVec 64) V!14551 (_ BitVec 32) Int) Unit!12164)

(assert (=> b!401638 (= lt!187834 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!340 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401639 () Bool)

(declare-fun res!231231 () Bool)

(assert (=> b!401639 (=> (not res!231231) (not e!242139))))

(assert (=> b!401639 (= res!231231 (and (= (size!11841 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11840 _keys!709) (size!11841 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401640 () Bool)

(declare-datatypes ((tuple2!6752 0))(
  ( (tuple2!6753 (_1!3387 (_ BitVec 64)) (_2!3387 V!14551)) )
))
(declare-datatypes ((List!6676 0))(
  ( (Nil!6673) (Cons!6672 (h!7528 tuple2!6752) (t!11850 List!6676)) )
))
(declare-datatypes ((ListLongMap!5665 0))(
  ( (ListLongMap!5666 (toList!2848 List!6676)) )
))
(declare-fun call!28273 () ListLongMap!5665)

(declare-fun call!28274 () ListLongMap!5665)

(assert (=> b!401640 (= e!242134 (= call!28273 call!28274))))

(declare-fun bm!28270 () Bool)

(declare-fun lt!187835 () array!24077)

(declare-fun getCurrentListMapNoExtraKeys!1060 (array!24077 array!24079 (_ BitVec 32) (_ BitVec 32) V!14551 V!14551 (_ BitVec 32) Int) ListLongMap!5665)

(assert (=> bm!28270 (= call!28273 (getCurrentListMapNoExtraKeys!1060 (ite c!54761 _keys!709 lt!187835) (ite c!54761 _values!549 (array!24080 (store (arr!11489 _values!549) i!563 (ValueCellFull!4699 v!412)) (size!11841 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28271 () Bool)

(assert (=> bm!28271 (= call!28274 (getCurrentListMapNoExtraKeys!1060 (ite c!54761 lt!187835 _keys!709) (ite c!54761 (array!24080 (store (arr!11489 _values!549) i!563 (ValueCellFull!4699 v!412)) (size!11841 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401641 () Bool)

(declare-fun res!231226 () Bool)

(assert (=> b!401641 (=> (not res!231226) (not e!242136))))

(assert (=> b!401641 (= res!231226 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11840 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun b!401642 () Bool)

(declare-fun e!242138 () Bool)

(declare-fun tp_is_empty!10085 () Bool)

(assert (=> b!401642 (= e!242138 tp_is_empty!10085)))

(declare-fun mapNonEmpty!16749 () Bool)

(declare-fun mapRes!16749 () Bool)

(declare-fun tp!32733 () Bool)

(declare-fun e!242137 () Bool)

(assert (=> mapNonEmpty!16749 (= mapRes!16749 (and tp!32733 e!242137))))

(declare-fun mapRest!16749 () (Array (_ BitVec 32) ValueCell!4699))

(declare-fun mapKey!16749 () (_ BitVec 32))

(declare-fun mapValue!16749 () ValueCell!4699)

(assert (=> mapNonEmpty!16749 (= (arr!11489 _values!549) (store mapRest!16749 mapKey!16749 mapValue!16749))))

(declare-fun res!231237 () Bool)

(assert (=> start!38666 (=> (not res!231237) (not e!242139))))

(assert (=> start!38666 (= res!231237 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11840 _keys!709))))))

(assert (=> start!38666 e!242139))

(assert (=> start!38666 tp_is_empty!10085))

(assert (=> start!38666 tp!32732))

(assert (=> start!38666 true))

(declare-fun e!242135 () Bool)

(declare-fun array_inv!8410 (array!24079) Bool)

(assert (=> start!38666 (and (array_inv!8410 _values!549) e!242135)))

(declare-fun array_inv!8411 (array!24077) Bool)

(assert (=> start!38666 (array_inv!8411 _keys!709)))

(declare-fun b!401636 () Bool)

(assert (=> b!401636 (= e!242137 tp_is_empty!10085)))

(declare-fun b!401643 () Bool)

(assert (=> b!401643 (= e!242139 e!242136)))

(declare-fun res!231227 () Bool)

(assert (=> b!401643 (=> (not res!231227) (not e!242136))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24077 (_ BitVec 32)) Bool)

(assert (=> b!401643 (= res!231227 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187835 mask!1025))))

(assert (=> b!401643 (= lt!187835 (array!24078 (store (arr!11488 _keys!709) i!563 k!794) (size!11840 _keys!709)))))

(declare-fun b!401644 () Bool)

(declare-fun res!231232 () Bool)

(assert (=> b!401644 (=> (not res!231232) (not e!242139))))

(assert (=> b!401644 (= res!231232 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401645 () Bool)

(declare-fun res!231229 () Bool)

(assert (=> b!401645 (=> (not res!231229) (not e!242139))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401645 (= res!231229 (validKeyInArray!0 k!794))))

(declare-fun b!401646 () Bool)

(assert (=> b!401646 (= e!242135 (and e!242138 mapRes!16749))))

(declare-fun condMapEmpty!16749 () Bool)

(declare-fun mapDefault!16749 () ValueCell!4699)

