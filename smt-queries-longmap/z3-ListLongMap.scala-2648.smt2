; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39692 () Bool)

(assert start!39692)

(declare-fun b_free!9973 () Bool)

(declare-fun b_next!9973 () Bool)

(assert (=> start!39692 (= b_free!9973 (not b_next!9973))))

(declare-fun tp!35447 () Bool)

(declare-fun b_and!17643 () Bool)

(assert (=> start!39692 (= tp!35447 b_and!17643)))

(declare-fun b!426718 () Bool)

(declare-fun res!250161 () Bool)

(declare-fun e!253111 () Bool)

(assert (=> b!426718 (=> (not res!250161) (not e!253111))))

(declare-datatypes ((array!26096 0))(
  ( (array!26097 (arr!12497 (Array (_ BitVec 32) (_ BitVec 64))) (size!12849 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26096)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!426718 (= res!250161 (or (= (select (arr!12497 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12497 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!426719 () Bool)

(declare-fun res!250164 () Bool)

(declare-fun e!253116 () Bool)

(assert (=> b!426719 (=> (not res!250164) (not e!253116))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!426719 (= res!250164 (bvsle from!863 i!563))))

(declare-fun b!426720 () Bool)

(declare-fun res!250165 () Bool)

(assert (=> b!426720 (=> (not res!250165) (not e!253111))))

(declare-datatypes ((List!7272 0))(
  ( (Nil!7269) (Cons!7268 (h!8124 (_ BitVec 64)) (t!12708 List!7272)) )
))
(declare-fun arrayNoDuplicates!0 (array!26096 (_ BitVec 32) List!7272) Bool)

(assert (=> b!426720 (= res!250165 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7269))))

(declare-fun b!426721 () Bool)

(declare-fun res!250169 () Bool)

(assert (=> b!426721 (=> (not res!250169) (not e!253111))))

(assert (=> b!426721 (= res!250169 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12849 _keys!709))))))

(declare-fun b!426722 () Bool)

(assert (=> b!426722 (= e!253111 e!253116)))

(declare-fun res!250166 () Bool)

(assert (=> b!426722 (=> (not res!250166) (not e!253116))))

(declare-fun lt!195086 () array!26096)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26096 (_ BitVec 32)) Bool)

(assert (=> b!426722 (= res!250166 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!195086 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!426722 (= lt!195086 (array!26097 (store (arr!12497 _keys!709) i!563 k0!794) (size!12849 _keys!709)))))

(declare-fun b!426723 () Bool)

(declare-fun res!250162 () Bool)

(assert (=> b!426723 (=> (not res!250162) (not e!253116))))

(assert (=> b!426723 (= res!250162 (arrayNoDuplicates!0 lt!195086 #b00000000000000000000000000000000 Nil!7269))))

(declare-fun mapIsEmpty!18309 () Bool)

(declare-fun mapRes!18309 () Bool)

(assert (=> mapIsEmpty!18309 mapRes!18309))

(declare-fun b!426724 () Bool)

(declare-fun res!250171 () Bool)

(assert (=> b!426724 (=> (not res!250171) (not e!253111))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!426724 (= res!250171 (validMask!0 mask!1025))))

(declare-fun b!426725 () Bool)

(declare-fun e!253114 () Bool)

(assert (=> b!426725 (= e!253114 (not true))))

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((V!15939 0))(
  ( (V!15940 (val!5607 Int)) )
))
(declare-datatypes ((ValueCell!5219 0))(
  ( (ValueCellFull!5219 (v!7855 V!15939)) (EmptyCell!5219) )
))
(declare-datatypes ((array!26098 0))(
  ( (array!26099 (arr!12498 (Array (_ BitVec 32) ValueCell!5219)) (size!12850 (_ BitVec 32))) )
))
(declare-fun lt!195084 () array!26098)

(declare-fun _values!549 () array!26098)

(declare-fun zeroValue!515 () V!15939)

(declare-fun v!412 () V!15939)

(declare-fun minValue!515 () V!15939)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!7268 0))(
  ( (tuple2!7269 (_1!3645 (_ BitVec 64)) (_2!3645 V!15939)) )
))
(declare-datatypes ((List!7273 0))(
  ( (Nil!7270) (Cons!7269 (h!8125 tuple2!7268) (t!12709 List!7273)) )
))
(declare-datatypes ((ListLongMap!6183 0))(
  ( (ListLongMap!6184 (toList!3107 List!7273)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1353 (array!26096 array!26098 (_ BitVec 32) (_ BitVec 32) V!15939 V!15939 (_ BitVec 32) Int) ListLongMap!6183)

(declare-fun +!1320 (ListLongMap!6183 tuple2!7268) ListLongMap!6183)

(assert (=> b!426725 (= (getCurrentListMapNoExtraKeys!1353 lt!195086 lt!195084 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1320 (getCurrentListMapNoExtraKeys!1353 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7269 k0!794 v!412)))))

(declare-datatypes ((Unit!12515 0))(
  ( (Unit!12516) )
))
(declare-fun lt!195083 () Unit!12515)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!504 (array!26096 array!26098 (_ BitVec 32) (_ BitVec 32) V!15939 V!15939 (_ BitVec 32) (_ BitVec 64) V!15939 (_ BitVec 32) Int) Unit!12515)

(assert (=> b!426725 (= lt!195083 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!504 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!426726 () Bool)

(declare-fun e!253115 () Bool)

(declare-fun tp_is_empty!11125 () Bool)

(assert (=> b!426726 (= e!253115 tp_is_empty!11125)))

(declare-fun res!250167 () Bool)

(assert (=> start!39692 (=> (not res!250167) (not e!253111))))

(assert (=> start!39692 (= res!250167 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12849 _keys!709))))))

(assert (=> start!39692 e!253111))

(assert (=> start!39692 tp_is_empty!11125))

(assert (=> start!39692 tp!35447))

(assert (=> start!39692 true))

(declare-fun e!253112 () Bool)

(declare-fun array_inv!9176 (array!26098) Bool)

(assert (=> start!39692 (and (array_inv!9176 _values!549) e!253112)))

(declare-fun array_inv!9177 (array!26096) Bool)

(assert (=> start!39692 (array_inv!9177 _keys!709)))

(declare-fun b!426727 () Bool)

(declare-fun res!250170 () Bool)

(assert (=> b!426727 (=> (not res!250170) (not e!253111))))

(assert (=> b!426727 (= res!250170 (and (= (size!12850 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12849 _keys!709) (size!12850 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!426728 () Bool)

(declare-fun e!253113 () Bool)

(assert (=> b!426728 (= e!253113 tp_is_empty!11125)))

(declare-fun b!426729 () Bool)

(assert (=> b!426729 (= e!253112 (and e!253113 mapRes!18309))))

(declare-fun condMapEmpty!18309 () Bool)

(declare-fun mapDefault!18309 () ValueCell!5219)

(assert (=> b!426729 (= condMapEmpty!18309 (= (arr!12498 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5219)) mapDefault!18309)))))

(declare-fun b!426730 () Bool)

(declare-fun res!250163 () Bool)

(assert (=> b!426730 (=> (not res!250163) (not e!253111))))

(assert (=> b!426730 (= res!250163 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!18309 () Bool)

(declare-fun tp!35448 () Bool)

(assert (=> mapNonEmpty!18309 (= mapRes!18309 (and tp!35448 e!253115))))

(declare-fun mapValue!18309 () ValueCell!5219)

(declare-fun mapRest!18309 () (Array (_ BitVec 32) ValueCell!5219))

(declare-fun mapKey!18309 () (_ BitVec 32))

(assert (=> mapNonEmpty!18309 (= (arr!12498 _values!549) (store mapRest!18309 mapKey!18309 mapValue!18309))))

(declare-fun b!426731 () Bool)

(declare-fun res!250172 () Bool)

(assert (=> b!426731 (=> (not res!250172) (not e!253111))))

(declare-fun arrayContainsKey!0 (array!26096 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!426731 (= res!250172 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!426732 () Bool)

(assert (=> b!426732 (= e!253116 e!253114)))

(declare-fun res!250168 () Bool)

(assert (=> b!426732 (=> (not res!250168) (not e!253114))))

(assert (=> b!426732 (= res!250168 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!195085 () ListLongMap!6183)

(assert (=> b!426732 (= lt!195085 (getCurrentListMapNoExtraKeys!1353 lt!195086 lt!195084 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!426732 (= lt!195084 (array!26099 (store (arr!12498 _values!549) i!563 (ValueCellFull!5219 v!412)) (size!12850 _values!549)))))

(declare-fun lt!195087 () ListLongMap!6183)

(assert (=> b!426732 (= lt!195087 (getCurrentListMapNoExtraKeys!1353 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!426733 () Bool)

(declare-fun res!250173 () Bool)

(assert (=> b!426733 (=> (not res!250173) (not e!253111))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!426733 (= res!250173 (validKeyInArray!0 k0!794))))

(assert (= (and start!39692 res!250167) b!426724))

(assert (= (and b!426724 res!250171) b!426727))

(assert (= (and b!426727 res!250170) b!426730))

(assert (= (and b!426730 res!250163) b!426720))

(assert (= (and b!426720 res!250165) b!426721))

(assert (= (and b!426721 res!250169) b!426733))

(assert (= (and b!426733 res!250173) b!426718))

(assert (= (and b!426718 res!250161) b!426731))

(assert (= (and b!426731 res!250172) b!426722))

(assert (= (and b!426722 res!250166) b!426723))

(assert (= (and b!426723 res!250162) b!426719))

(assert (= (and b!426719 res!250164) b!426732))

(assert (= (and b!426732 res!250168) b!426725))

(assert (= (and b!426729 condMapEmpty!18309) mapIsEmpty!18309))

(assert (= (and b!426729 (not condMapEmpty!18309)) mapNonEmpty!18309))

(get-info :version)

(assert (= (and mapNonEmpty!18309 ((_ is ValueCellFull!5219) mapValue!18309)) b!426726))

(assert (= (and b!426729 ((_ is ValueCellFull!5219) mapDefault!18309)) b!426728))

(assert (= start!39692 b!426729))

(declare-fun m!415607 () Bool)

(assert (=> b!426720 m!415607))

(declare-fun m!415609 () Bool)

(assert (=> b!426730 m!415609))

(declare-fun m!415611 () Bool)

(assert (=> b!426725 m!415611))

(declare-fun m!415613 () Bool)

(assert (=> b!426725 m!415613))

(assert (=> b!426725 m!415613))

(declare-fun m!415615 () Bool)

(assert (=> b!426725 m!415615))

(declare-fun m!415617 () Bool)

(assert (=> b!426725 m!415617))

(declare-fun m!415619 () Bool)

(assert (=> b!426733 m!415619))

(declare-fun m!415621 () Bool)

(assert (=> b!426723 m!415621))

(declare-fun m!415623 () Bool)

(assert (=> b!426731 m!415623))

(declare-fun m!415625 () Bool)

(assert (=> b!426724 m!415625))

(declare-fun m!415627 () Bool)

(assert (=> b!426732 m!415627))

(declare-fun m!415629 () Bool)

(assert (=> b!426732 m!415629))

(declare-fun m!415631 () Bool)

(assert (=> b!426732 m!415631))

(declare-fun m!415633 () Bool)

(assert (=> b!426722 m!415633))

(declare-fun m!415635 () Bool)

(assert (=> b!426722 m!415635))

(declare-fun m!415637 () Bool)

(assert (=> mapNonEmpty!18309 m!415637))

(declare-fun m!415639 () Bool)

(assert (=> start!39692 m!415639))

(declare-fun m!415641 () Bool)

(assert (=> start!39692 m!415641))

(declare-fun m!415643 () Bool)

(assert (=> b!426718 m!415643))

(check-sat (not b!426724) (not start!39692) tp_is_empty!11125 (not b!426720) (not b!426732) b_and!17643 (not b!426733) (not b!426722) (not mapNonEmpty!18309) (not b!426723) (not b!426730) (not b!426731) (not b_next!9973) (not b!426725))
(check-sat b_and!17643 (not b_next!9973))
