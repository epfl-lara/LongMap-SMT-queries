; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40984 () Bool)

(assert start!40984)

(declare-fun b_free!10933 () Bool)

(declare-fun b_next!10933 () Bool)

(assert (=> start!40984 (= b_free!10933 (not b_next!10933))))

(declare-fun tp!38625 () Bool)

(declare-fun b_and!19085 () Bool)

(assert (=> start!40984 (= tp!38625 b_and!19085)))

(declare-fun b!456578 () Bool)

(declare-fun res!272530 () Bool)

(declare-fun e!266733 () Bool)

(assert (=> b!456578 (=> (not res!272530) (not e!266733))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!456578 (= res!272530 (bvsle from!863 i!563))))

(declare-fun b!456579 () Bool)

(declare-fun e!266738 () Bool)

(declare-fun tp_is_empty!12271 () Bool)

(assert (=> b!456579 (= e!266738 tp_is_empty!12271)))

(declare-fun b!456580 () Bool)

(declare-fun res!272528 () Bool)

(declare-fun e!266739 () Bool)

(assert (=> b!456580 (=> (not res!272528) (not e!266739))))

(declare-datatypes ((array!28336 0))(
  ( (array!28337 (arr!13611 (Array (_ BitVec 32) (_ BitVec 64))) (size!13963 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28336)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17467 0))(
  ( (V!17468 (val!6180 Int)) )
))
(declare-datatypes ((ValueCell!5792 0))(
  ( (ValueCellFull!5792 (v!8447 V!17467)) (EmptyCell!5792) )
))
(declare-datatypes ((array!28338 0))(
  ( (array!28339 (arr!13612 (Array (_ BitVec 32) ValueCell!5792)) (size!13964 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28338)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!456580 (= res!272528 (and (= (size!13964 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13963 _keys!709) (size!13964 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!456581 () Bool)

(declare-fun e!266735 () Bool)

(assert (=> b!456581 (= e!266733 e!266735)))

(declare-fun res!272527 () Bool)

(assert (=> b!456581 (=> (not res!272527) (not e!266735))))

(assert (=> b!456581 (= res!272527 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun minValue!515 () V!17467)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!206623 () array!28336)

(declare-fun zeroValue!515 () V!17467)

(declare-datatypes ((tuple2!8054 0))(
  ( (tuple2!8055 (_1!4038 (_ BitVec 64)) (_2!4038 V!17467)) )
))
(declare-datatypes ((List!8127 0))(
  ( (Nil!8124) (Cons!8123 (h!8979 tuple2!8054) (t!13947 List!8127)) )
))
(declare-datatypes ((ListLongMap!6969 0))(
  ( (ListLongMap!6970 (toList!3500 List!8127)) )
))
(declare-fun lt!206624 () ListLongMap!6969)

(declare-fun lt!206626 () array!28338)

(declare-fun getCurrentListMapNoExtraKeys!1729 (array!28336 array!28338 (_ BitVec 32) (_ BitVec 32) V!17467 V!17467 (_ BitVec 32) Int) ListLongMap!6969)

(assert (=> b!456581 (= lt!206624 (getCurrentListMapNoExtraKeys!1729 lt!206623 lt!206626 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun v!412 () V!17467)

(assert (=> b!456581 (= lt!206626 (array!28339 (store (arr!13612 _values!549) i!563 (ValueCellFull!5792 v!412)) (size!13964 _values!549)))))

(declare-fun lt!206627 () ListLongMap!6969)

(assert (=> b!456581 (= lt!206627 (getCurrentListMapNoExtraKeys!1729 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun mapIsEmpty!20047 () Bool)

(declare-fun mapRes!20047 () Bool)

(assert (=> mapIsEmpty!20047 mapRes!20047))

(declare-fun b!456582 () Bool)

(declare-fun res!272533 () Bool)

(assert (=> b!456582 (=> (not res!272533) (not e!266739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28336 (_ BitVec 32)) Bool)

(assert (=> b!456582 (= res!272533 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!456583 () Bool)

(declare-fun e!266737 () Bool)

(assert (=> b!456583 (= e!266737 (and e!266738 mapRes!20047))))

(declare-fun condMapEmpty!20047 () Bool)

(declare-fun mapDefault!20047 () ValueCell!5792)

(assert (=> b!456583 (= condMapEmpty!20047 (= (arr!13612 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5792)) mapDefault!20047)))))

(declare-fun b!456584 () Bool)

(assert (=> b!456584 (= e!266739 e!266733)))

(declare-fun res!272524 () Bool)

(assert (=> b!456584 (=> (not res!272524) (not e!266733))))

(assert (=> b!456584 (= res!272524 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206623 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!456584 (= lt!206623 (array!28337 (store (arr!13611 _keys!709) i!563 k0!794) (size!13963 _keys!709)))))

(declare-fun b!456585 () Bool)

(declare-fun res!272534 () Bool)

(assert (=> b!456585 (=> (not res!272534) (not e!266739))))

(declare-fun arrayContainsKey!0 (array!28336 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!456585 (= res!272534 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!456586 () Bool)

(declare-fun res!272526 () Bool)

(assert (=> b!456586 (=> (not res!272526) (not e!266733))))

(declare-datatypes ((List!8128 0))(
  ( (Nil!8125) (Cons!8124 (h!8980 (_ BitVec 64)) (t!13948 List!8128)) )
))
(declare-fun arrayNoDuplicates!0 (array!28336 (_ BitVec 32) List!8128) Bool)

(assert (=> b!456586 (= res!272526 (arrayNoDuplicates!0 lt!206623 #b00000000000000000000000000000000 Nil!8125))))

(declare-fun b!456587 () Bool)

(declare-fun e!266736 () Bool)

(assert (=> b!456587 (= e!266736 (bvslt i!563 (size!13964 _values!549)))))

(declare-fun b!456588 () Bool)

(declare-fun res!272529 () Bool)

(assert (=> b!456588 (=> (not res!272529) (not e!266739))))

(assert (=> b!456588 (= res!272529 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8125))))

(declare-fun b!456589 () Bool)

(declare-fun res!272532 () Bool)

(assert (=> b!456589 (=> (not res!272532) (not e!266739))))

(assert (=> b!456589 (= res!272532 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13963 _keys!709))))))

(declare-fun b!456590 () Bool)

(declare-fun res!272531 () Bool)

(assert (=> b!456590 (=> (not res!272531) (not e!266739))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!456590 (= res!272531 (validKeyInArray!0 k0!794))))

(declare-fun b!456591 () Bool)

(declare-fun res!272536 () Bool)

(assert (=> b!456591 (=> (not res!272536) (not e!266739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!456591 (= res!272536 (validMask!0 mask!1025))))

(declare-fun b!456592 () Bool)

(assert (=> b!456592 (= e!266735 (not e!266736))))

(declare-fun res!272525 () Bool)

(assert (=> b!456592 (=> res!272525 e!266736)))

(assert (=> b!456592 (= res!272525 (not (validKeyInArray!0 (select (arr!13611 _keys!709) from!863))))))

(declare-fun +!1583 (ListLongMap!6969 tuple2!8054) ListLongMap!6969)

(assert (=> b!456592 (= (getCurrentListMapNoExtraKeys!1729 lt!206623 lt!206626 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1583 (getCurrentListMapNoExtraKeys!1729 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8055 k0!794 v!412)))))

(declare-datatypes ((Unit!13271 0))(
  ( (Unit!13272) )
))
(declare-fun lt!206625 () Unit!13271)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!743 (array!28336 array!28338 (_ BitVec 32) (_ BitVec 32) V!17467 V!17467 (_ BitVec 32) (_ BitVec 64) V!17467 (_ BitVec 32) Int) Unit!13271)

(assert (=> b!456592 (= lt!206625 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!743 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!20047 () Bool)

(declare-fun tp!38626 () Bool)

(declare-fun e!266740 () Bool)

(assert (=> mapNonEmpty!20047 (= mapRes!20047 (and tp!38626 e!266740))))

(declare-fun mapValue!20047 () ValueCell!5792)

(declare-fun mapKey!20047 () (_ BitVec 32))

(declare-fun mapRest!20047 () (Array (_ BitVec 32) ValueCell!5792))

(assert (=> mapNonEmpty!20047 (= (arr!13612 _values!549) (store mapRest!20047 mapKey!20047 mapValue!20047))))

(declare-fun res!272535 () Bool)

(assert (=> start!40984 (=> (not res!272535) (not e!266739))))

(assert (=> start!40984 (= res!272535 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13963 _keys!709))))))

(assert (=> start!40984 e!266739))

(assert (=> start!40984 tp_is_empty!12271))

(assert (=> start!40984 tp!38625))

(assert (=> start!40984 true))

(declare-fun array_inv!9926 (array!28338) Bool)

(assert (=> start!40984 (and (array_inv!9926 _values!549) e!266737)))

(declare-fun array_inv!9927 (array!28336) Bool)

(assert (=> start!40984 (array_inv!9927 _keys!709)))

(declare-fun b!456593 () Bool)

(assert (=> b!456593 (= e!266740 tp_is_empty!12271)))

(declare-fun b!456594 () Bool)

(declare-fun res!272523 () Bool)

(assert (=> b!456594 (=> (not res!272523) (not e!266739))))

(assert (=> b!456594 (= res!272523 (or (= (select (arr!13611 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13611 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40984 res!272535) b!456591))

(assert (= (and b!456591 res!272536) b!456580))

(assert (= (and b!456580 res!272528) b!456582))

(assert (= (and b!456582 res!272533) b!456588))

(assert (= (and b!456588 res!272529) b!456589))

(assert (= (and b!456589 res!272532) b!456590))

(assert (= (and b!456590 res!272531) b!456594))

(assert (= (and b!456594 res!272523) b!456585))

(assert (= (and b!456585 res!272534) b!456584))

(assert (= (and b!456584 res!272524) b!456586))

(assert (= (and b!456586 res!272526) b!456578))

(assert (= (and b!456578 res!272530) b!456581))

(assert (= (and b!456581 res!272527) b!456592))

(assert (= (and b!456592 (not res!272525)) b!456587))

(assert (= (and b!456583 condMapEmpty!20047) mapIsEmpty!20047))

(assert (= (and b!456583 (not condMapEmpty!20047)) mapNonEmpty!20047))

(get-info :version)

(assert (= (and mapNonEmpty!20047 ((_ is ValueCellFull!5792) mapValue!20047)) b!456593))

(assert (= (and b!456583 ((_ is ValueCellFull!5792) mapDefault!20047)) b!456579))

(assert (= start!40984 b!456583))

(declare-fun m!440241 () Bool)

(assert (=> b!456594 m!440241))

(declare-fun m!440243 () Bool)

(assert (=> b!456586 m!440243))

(declare-fun m!440245 () Bool)

(assert (=> b!456581 m!440245))

(declare-fun m!440247 () Bool)

(assert (=> b!456581 m!440247))

(declare-fun m!440249 () Bool)

(assert (=> b!456581 m!440249))

(declare-fun m!440251 () Bool)

(assert (=> b!456584 m!440251))

(declare-fun m!440253 () Bool)

(assert (=> b!456584 m!440253))

(declare-fun m!440255 () Bool)

(assert (=> b!456590 m!440255))

(declare-fun m!440257 () Bool)

(assert (=> start!40984 m!440257))

(declare-fun m!440259 () Bool)

(assert (=> start!40984 m!440259))

(declare-fun m!440261 () Bool)

(assert (=> mapNonEmpty!20047 m!440261))

(declare-fun m!440263 () Bool)

(assert (=> b!456592 m!440263))

(declare-fun m!440265 () Bool)

(assert (=> b!456592 m!440265))

(declare-fun m!440267 () Bool)

(assert (=> b!456592 m!440267))

(assert (=> b!456592 m!440267))

(declare-fun m!440269 () Bool)

(assert (=> b!456592 m!440269))

(assert (=> b!456592 m!440263))

(declare-fun m!440271 () Bool)

(assert (=> b!456592 m!440271))

(declare-fun m!440273 () Bool)

(assert (=> b!456592 m!440273))

(declare-fun m!440275 () Bool)

(assert (=> b!456585 m!440275))

(declare-fun m!440277 () Bool)

(assert (=> b!456582 m!440277))

(declare-fun m!440279 () Bool)

(assert (=> b!456588 m!440279))

(declare-fun m!440281 () Bool)

(assert (=> b!456591 m!440281))

(check-sat (not start!40984) (not mapNonEmpty!20047) (not b!456592) (not b!456591) b_and!19085 tp_is_empty!12271 (not b!456582) (not b!456586) (not b!456588) (not b_next!10933) (not b!456590) (not b!456584) (not b!456581) (not b!456585))
(check-sat b_and!19085 (not b_next!10933))
