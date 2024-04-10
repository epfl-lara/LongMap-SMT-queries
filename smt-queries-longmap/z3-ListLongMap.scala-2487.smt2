; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38742 () Bool)

(assert start!38742)

(declare-fun b_free!9279 () Bool)

(declare-fun b_next!9279 () Bool)

(assert (=> start!38742 (= b_free!9279 (not b_next!9279))))

(declare-fun tp!32961 () Bool)

(declare-fun b_and!16665 () Bool)

(assert (=> start!38742 (= tp!32961 b_and!16665)))

(declare-fun b!403573 () Bool)

(declare-fun e!242935 () Bool)

(declare-fun tp_is_empty!10161 () Bool)

(assert (=> b!403573 (= e!242935 tp_is_empty!10161)))

(declare-datatypes ((V!14653 0))(
  ( (V!14654 (val!5125 Int)) )
))
(declare-datatypes ((tuple2!6812 0))(
  ( (tuple2!6813 (_1!3417 (_ BitVec 64)) (_2!3417 V!14653)) )
))
(declare-datatypes ((List!6730 0))(
  ( (Nil!6727) (Cons!6726 (h!7582 tuple2!6812) (t!11904 List!6730)) )
))
(declare-datatypes ((ListLongMap!5725 0))(
  ( (ListLongMap!5726 (toList!2878 List!6730)) )
))
(declare-fun call!28501 () ListLongMap!5725)

(declare-fun e!242934 () Bool)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun call!28502 () ListLongMap!5725)

(declare-fun v!412 () V!14653)

(declare-fun b!403574 () Bool)

(declare-fun +!1152 (ListLongMap!5725 tuple2!6812) ListLongMap!5725)

(assert (=> b!403574 (= e!242934 (= call!28502 (+!1152 call!28501 (tuple2!6813 k0!794 v!412))))))

(declare-fun b!403575 () Bool)

(declare-fun e!242932 () Bool)

(assert (=> b!403575 (= e!242932 (not true))))

(assert (=> b!403575 e!242934))

(declare-fun c!54875 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!403575 (= c!54875 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12208 0))(
  ( (Unit!12209) )
))
(declare-fun lt!188063 () Unit!12208)

(declare-datatypes ((ValueCell!4737 0))(
  ( (ValueCellFull!4737 (v!7372 V!14653)) (EmptyCell!4737) )
))
(declare-datatypes ((array!24221 0))(
  ( (array!24222 (arr!11560 (Array (_ BitVec 32) ValueCell!4737)) (size!11912 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24221)

(declare-fun zeroValue!515 () V!14653)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-datatypes ((array!24223 0))(
  ( (array!24224 (arr!11561 (Array (_ BitVec 32) (_ BitVec 64))) (size!11913 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24223)

(declare-fun minValue!515 () V!14653)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!362 (array!24223 array!24221 (_ BitVec 32) (_ BitVec 32) V!14653 V!14653 (_ BitVec 32) (_ BitVec 64) V!14653 (_ BitVec 32) Int) Unit!12208)

(assert (=> b!403575 (= lt!188063 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!362 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapIsEmpty!16863 () Bool)

(declare-fun mapRes!16863 () Bool)

(assert (=> mapIsEmpty!16863 mapRes!16863))

(declare-fun b!403576 () Bool)

(declare-fun res!232596 () Bool)

(declare-fun e!242936 () Bool)

(assert (=> b!403576 (=> (not res!232596) (not e!242936))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!403576 (= res!232596 (validKeyInArray!0 k0!794))))

(declare-fun b!403577 () Bool)

(declare-fun res!232599 () Bool)

(assert (=> b!403577 (=> (not res!232599) (not e!242936))))

(assert (=> b!403577 (= res!232599 (or (= (select (arr!11561 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11561 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16863 () Bool)

(declare-fun tp!32960 () Bool)

(declare-fun e!242937 () Bool)

(assert (=> mapNonEmpty!16863 (= mapRes!16863 (and tp!32960 e!242937))))

(declare-fun mapValue!16863 () ValueCell!4737)

(declare-fun mapRest!16863 () (Array (_ BitVec 32) ValueCell!4737))

(declare-fun mapKey!16863 () (_ BitVec 32))

(assert (=> mapNonEmpty!16863 (= (arr!11560 _values!549) (store mapRest!16863 mapKey!16863 mapValue!16863))))

(declare-fun b!403579 () Bool)

(declare-fun res!232605 () Bool)

(assert (=> b!403579 (=> (not res!232605) (not e!242936))))

(declare-fun arrayContainsKey!0 (array!24223 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!403579 (= res!232605 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!403580 () Bool)

(declare-fun res!232594 () Bool)

(assert (=> b!403580 (=> (not res!232594) (not e!242932))))

(declare-fun lt!188062 () array!24223)

(declare-datatypes ((List!6731 0))(
  ( (Nil!6728) (Cons!6727 (h!7583 (_ BitVec 64)) (t!11905 List!6731)) )
))
(declare-fun arrayNoDuplicates!0 (array!24223 (_ BitVec 32) List!6731) Bool)

(assert (=> b!403580 (= res!232594 (arrayNoDuplicates!0 lt!188062 #b00000000000000000000000000000000 Nil!6728))))

(declare-fun b!403581 () Bool)

(declare-fun res!232601 () Bool)

(assert (=> b!403581 (=> (not res!232601) (not e!242936))))

(assert (=> b!403581 (= res!232601 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6728))))

(declare-fun b!403582 () Bool)

(assert (=> b!403582 (= e!242936 e!242932)))

(declare-fun res!232603 () Bool)

(assert (=> b!403582 (=> (not res!232603) (not e!242932))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24223 (_ BitVec 32)) Bool)

(assert (=> b!403582 (= res!232603 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188062 mask!1025))))

(assert (=> b!403582 (= lt!188062 (array!24224 (store (arr!11561 _keys!709) i!563 k0!794) (size!11913 _keys!709)))))

(declare-fun b!403583 () Bool)

(assert (=> b!403583 (= e!242934 (= call!28501 call!28502))))

(declare-fun b!403584 () Bool)

(declare-fun res!232604 () Bool)

(assert (=> b!403584 (=> (not res!232604) (not e!242936))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!403584 (= res!232604 (validMask!0 mask!1025))))

(declare-fun bm!28498 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1087 (array!24223 array!24221 (_ BitVec 32) (_ BitVec 32) V!14653 V!14653 (_ BitVec 32) Int) ListLongMap!5725)

(assert (=> bm!28498 (= call!28502 (getCurrentListMapNoExtraKeys!1087 (ite c!54875 lt!188062 _keys!709) (ite c!54875 (array!24222 (store (arr!11560 _values!549) i!563 (ValueCellFull!4737 v!412)) (size!11912 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!403585 () Bool)

(declare-fun res!232595 () Bool)

(assert (=> b!403585 (=> (not res!232595) (not e!242936))))

(assert (=> b!403585 (= res!232595 (and (= (size!11912 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11913 _keys!709) (size!11912 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!403586 () Bool)

(declare-fun res!232602 () Bool)

(assert (=> b!403586 (=> (not res!232602) (not e!242932))))

(assert (=> b!403586 (= res!232602 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11913 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun res!232597 () Bool)

(assert (=> start!38742 (=> (not res!232597) (not e!242936))))

(assert (=> start!38742 (= res!232597 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11913 _keys!709))))))

(assert (=> start!38742 e!242936))

(assert (=> start!38742 tp_is_empty!10161))

(assert (=> start!38742 tp!32961))

(assert (=> start!38742 true))

(declare-fun e!242933 () Bool)

(declare-fun array_inv!8456 (array!24221) Bool)

(assert (=> start!38742 (and (array_inv!8456 _values!549) e!242933)))

(declare-fun array_inv!8457 (array!24223) Bool)

(assert (=> start!38742 (array_inv!8457 _keys!709)))

(declare-fun b!403578 () Bool)

(assert (=> b!403578 (= e!242933 (and e!242935 mapRes!16863))))

(declare-fun condMapEmpty!16863 () Bool)

(declare-fun mapDefault!16863 () ValueCell!4737)

(assert (=> b!403578 (= condMapEmpty!16863 (= (arr!11560 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4737)) mapDefault!16863)))))

(declare-fun b!403587 () Bool)

(assert (=> b!403587 (= e!242937 tp_is_empty!10161)))

(declare-fun b!403588 () Bool)

(declare-fun res!232598 () Bool)

(assert (=> b!403588 (=> (not res!232598) (not e!242936))))

(assert (=> b!403588 (= res!232598 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11913 _keys!709))))))

(declare-fun b!403589 () Bool)

(declare-fun res!232600 () Bool)

(assert (=> b!403589 (=> (not res!232600) (not e!242936))))

(assert (=> b!403589 (= res!232600 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun bm!28499 () Bool)

(assert (=> bm!28499 (= call!28501 (getCurrentListMapNoExtraKeys!1087 (ite c!54875 _keys!709 lt!188062) (ite c!54875 _values!549 (array!24222 (store (arr!11560 _values!549) i!563 (ValueCellFull!4737 v!412)) (size!11912 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(assert (= (and start!38742 res!232597) b!403584))

(assert (= (and b!403584 res!232604) b!403585))

(assert (= (and b!403585 res!232595) b!403589))

(assert (= (and b!403589 res!232600) b!403581))

(assert (= (and b!403581 res!232601) b!403588))

(assert (= (and b!403588 res!232598) b!403576))

(assert (= (and b!403576 res!232596) b!403577))

(assert (= (and b!403577 res!232599) b!403579))

(assert (= (and b!403579 res!232605) b!403582))

(assert (= (and b!403582 res!232603) b!403580))

(assert (= (and b!403580 res!232594) b!403586))

(assert (= (and b!403586 res!232602) b!403575))

(assert (= (and b!403575 c!54875) b!403574))

(assert (= (and b!403575 (not c!54875)) b!403583))

(assert (= (or b!403574 b!403583) bm!28498))

(assert (= (or b!403574 b!403583) bm!28499))

(assert (= (and b!403578 condMapEmpty!16863) mapIsEmpty!16863))

(assert (= (and b!403578 (not condMapEmpty!16863)) mapNonEmpty!16863))

(get-info :version)

(assert (= (and mapNonEmpty!16863 ((_ is ValueCellFull!4737) mapValue!16863)) b!403587))

(assert (= (and b!403578 ((_ is ValueCellFull!4737) mapDefault!16863)) b!403573))

(assert (= start!38742 b!403578))

(declare-fun m!396719 () Bool)

(assert (=> b!403576 m!396719))

(declare-fun m!396721 () Bool)

(assert (=> b!403579 m!396721))

(declare-fun m!396723 () Bool)

(assert (=> bm!28498 m!396723))

(declare-fun m!396725 () Bool)

(assert (=> bm!28498 m!396725))

(declare-fun m!396727 () Bool)

(assert (=> mapNonEmpty!16863 m!396727))

(declare-fun m!396729 () Bool)

(assert (=> start!38742 m!396729))

(declare-fun m!396731 () Bool)

(assert (=> start!38742 m!396731))

(declare-fun m!396733 () Bool)

(assert (=> b!403580 m!396733))

(declare-fun m!396735 () Bool)

(assert (=> b!403584 m!396735))

(declare-fun m!396737 () Bool)

(assert (=> b!403574 m!396737))

(declare-fun m!396739 () Bool)

(assert (=> b!403589 m!396739))

(assert (=> bm!28499 m!396723))

(declare-fun m!396741 () Bool)

(assert (=> bm!28499 m!396741))

(declare-fun m!396743 () Bool)

(assert (=> b!403581 m!396743))

(declare-fun m!396745 () Bool)

(assert (=> b!403577 m!396745))

(declare-fun m!396747 () Bool)

(assert (=> b!403575 m!396747))

(declare-fun m!396749 () Bool)

(assert (=> b!403582 m!396749))

(declare-fun m!396751 () Bool)

(assert (=> b!403582 m!396751))

(check-sat (not bm!28499) (not b!403575) (not b_next!9279) tp_is_empty!10161 (not b!403576) (not b!403589) (not mapNonEmpty!16863) (not b!403579) (not b!403581) (not bm!28498) (not b!403582) (not start!38742) (not b!403580) (not b!403584) b_and!16665 (not b!403574))
(check-sat b_and!16665 (not b_next!9279))
