; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38654 () Bool)

(assert start!38654)

(declare-fun b_free!9205 () Bool)

(declare-fun b_next!9205 () Bool)

(assert (=> start!38654 (= b_free!9205 (not b_next!9205))))

(declare-fun tp!32738 () Bool)

(declare-fun b_and!16565 () Bool)

(assert (=> start!38654 (= tp!32738 b_and!16565)))

(declare-fun b!401415 () Bool)

(declare-fun res!231143 () Bool)

(declare-fun e!241984 () Bool)

(assert (=> b!401415 (=> (not res!231143) (not e!241984))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!401415 (= res!231143 (validKeyInArray!0 k0!794))))

(declare-fun b!401416 () Bool)

(declare-fun res!231136 () Bool)

(assert (=> b!401416 (=> (not res!231136) (not e!241984))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!401416 (= res!231136 (validMask!0 mask!1025))))

(declare-fun b!401417 () Bool)

(declare-fun res!231138 () Bool)

(assert (=> b!401417 (=> (not res!231138) (not e!241984))))

(declare-datatypes ((array!24059 0))(
  ( (array!24060 (arr!11479 (Array (_ BitVec 32) (_ BitVec 64))) (size!11832 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24059)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!401417 (= res!231138 (or (= (select (arr!11479 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11479 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!401418 () Bool)

(declare-fun e!241986 () Bool)

(assert (=> b!401418 (= e!241986 (not true))))

(declare-fun e!241980 () Bool)

(assert (=> b!401418 e!241980))

(declare-fun c!54693 () Bool)

(declare-fun from!863 () (_ BitVec 32))

(assert (=> b!401418 (= c!54693 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((V!14555 0))(
  ( (V!14556 (val!5088 Int)) )
))
(declare-fun minValue!515 () V!14555)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((Unit!12136 0))(
  ( (Unit!12137) )
))
(declare-fun lt!187607 () Unit!12136)

(declare-datatypes ((ValueCell!4700 0))(
  ( (ValueCellFull!4700 (v!7329 V!14555)) (EmptyCell!4700) )
))
(declare-datatypes ((array!24061 0))(
  ( (array!24062 (arr!11480 (Array (_ BitVec 32) ValueCell!4700)) (size!11833 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24061)

(declare-fun zeroValue!515 () V!14555)

(declare-fun v!412 () V!14555)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!331 (array!24059 array!24061 (_ BitVec 32) (_ BitVec 32) V!14555 V!14555 (_ BitVec 32) (_ BitVec 64) V!14555 (_ BitVec 32) Int) Unit!12136)

(assert (=> b!401418 (= lt!187607 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!331 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun bm!28251 () Bool)

(declare-fun lt!187606 () array!24059)

(declare-datatypes ((tuple2!6734 0))(
  ( (tuple2!6735 (_1!3378 (_ BitVec 64)) (_2!3378 V!14555)) )
))
(declare-datatypes ((List!6640 0))(
  ( (Nil!6637) (Cons!6636 (h!7492 tuple2!6734) (t!11805 List!6640)) )
))
(declare-datatypes ((ListLongMap!5637 0))(
  ( (ListLongMap!5638 (toList!2834 List!6640)) )
))
(declare-fun call!28255 () ListLongMap!5637)

(declare-fun getCurrentListMapNoExtraKeys!1051 (array!24059 array!24061 (_ BitVec 32) (_ BitVec 32) V!14555 V!14555 (_ BitVec 32) Int) ListLongMap!5637)

(assert (=> bm!28251 (= call!28255 (getCurrentListMapNoExtraKeys!1051 (ite c!54693 _keys!709 lt!187606) (ite c!54693 _values!549 (array!24062 (store (arr!11480 _values!549) i!563 (ValueCellFull!4700 v!412)) (size!11833 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!401419 () Bool)

(declare-fun res!231134 () Bool)

(assert (=> b!401419 (=> (not res!231134) (not e!241984))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24059 (_ BitVec 32)) Bool)

(assert (=> b!401419 (= res!231134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!401420 () Bool)

(declare-fun res!231142 () Bool)

(assert (=> b!401420 (=> (not res!231142) (not e!241986))))

(declare-datatypes ((List!6641 0))(
  ( (Nil!6638) (Cons!6637 (h!7493 (_ BitVec 64)) (t!11806 List!6641)) )
))
(declare-fun arrayNoDuplicates!0 (array!24059 (_ BitVec 32) List!6641) Bool)

(assert (=> b!401420 (= res!231142 (arrayNoDuplicates!0 lt!187606 #b00000000000000000000000000000000 Nil!6638))))

(declare-fun b!401421 () Bool)

(declare-fun res!231144 () Bool)

(assert (=> b!401421 (=> (not res!231144) (not e!241984))))

(assert (=> b!401421 (= res!231144 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11832 _keys!709))))))

(declare-fun b!401422 () Bool)

(declare-fun res!231140 () Bool)

(assert (=> b!401422 (=> (not res!231140) (not e!241984))))

(declare-fun arrayContainsKey!0 (array!24059 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!401422 (= res!231140 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun res!231135 () Bool)

(assert (=> start!38654 (=> (not res!231135) (not e!241984))))

(assert (=> start!38654 (= res!231135 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11832 _keys!709))))))

(assert (=> start!38654 e!241984))

(declare-fun tp_is_empty!10087 () Bool)

(assert (=> start!38654 tp_is_empty!10087))

(assert (=> start!38654 tp!32738))

(assert (=> start!38654 true))

(declare-fun e!241985 () Bool)

(declare-fun array_inv!8420 (array!24061) Bool)

(assert (=> start!38654 (and (array_inv!8420 _values!549) e!241985)))

(declare-fun array_inv!8421 (array!24059) Bool)

(assert (=> start!38654 (array_inv!8421 _keys!709)))

(declare-fun b!401423 () Bool)

(declare-fun e!241983 () Bool)

(assert (=> b!401423 (= e!241983 tp_is_empty!10087)))

(declare-fun b!401424 () Bool)

(declare-fun e!241981 () Bool)

(assert (=> b!401424 (= e!241981 tp_is_empty!10087)))

(declare-fun b!401425 () Bool)

(declare-fun call!28254 () ListLongMap!5637)

(declare-fun +!1139 (ListLongMap!5637 tuple2!6734) ListLongMap!5637)

(assert (=> b!401425 (= e!241980 (= call!28254 (+!1139 call!28255 (tuple2!6735 k0!794 v!412))))))

(declare-fun b!401426 () Bool)

(assert (=> b!401426 (= e!241980 (= call!28255 call!28254))))

(declare-fun b!401427 () Bool)

(declare-fun mapRes!16752 () Bool)

(assert (=> b!401427 (= e!241985 (and e!241981 mapRes!16752))))

(declare-fun condMapEmpty!16752 () Bool)

(declare-fun mapDefault!16752 () ValueCell!4700)

(assert (=> b!401427 (= condMapEmpty!16752 (= (arr!11480 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4700)) mapDefault!16752)))))

(declare-fun b!401428 () Bool)

(assert (=> b!401428 (= e!241984 e!241986)))

(declare-fun res!231133 () Bool)

(assert (=> b!401428 (=> (not res!231133) (not e!241986))))

(assert (=> b!401428 (= res!231133 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187606 mask!1025))))

(assert (=> b!401428 (= lt!187606 (array!24060 (store (arr!11479 _keys!709) i!563 k0!794) (size!11832 _keys!709)))))

(declare-fun b!401429 () Bool)

(declare-fun res!231137 () Bool)

(assert (=> b!401429 (=> (not res!231137) (not e!241986))))

(assert (=> b!401429 (= res!231137 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11832 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun bm!28252 () Bool)

(assert (=> bm!28252 (= call!28254 (getCurrentListMapNoExtraKeys!1051 (ite c!54693 lt!187606 _keys!709) (ite c!54693 (array!24062 (store (arr!11480 _values!549) i!563 (ValueCellFull!4700 v!412)) (size!11833 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun mapNonEmpty!16752 () Bool)

(declare-fun tp!32739 () Bool)

(assert (=> mapNonEmpty!16752 (= mapRes!16752 (and tp!32739 e!241983))))

(declare-fun mapRest!16752 () (Array (_ BitVec 32) ValueCell!4700))

(declare-fun mapValue!16752 () ValueCell!4700)

(declare-fun mapKey!16752 () (_ BitVec 32))

(assert (=> mapNonEmpty!16752 (= (arr!11480 _values!549) (store mapRest!16752 mapKey!16752 mapValue!16752))))

(declare-fun b!401430 () Bool)

(declare-fun res!231139 () Bool)

(assert (=> b!401430 (=> (not res!231139) (not e!241984))))

(assert (=> b!401430 (= res!231139 (and (= (size!11833 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11832 _keys!709) (size!11833 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!401431 () Bool)

(declare-fun res!231141 () Bool)

(assert (=> b!401431 (=> (not res!231141) (not e!241984))))

(assert (=> b!401431 (= res!231141 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6638))))

(declare-fun mapIsEmpty!16752 () Bool)

(assert (=> mapIsEmpty!16752 mapRes!16752))

(assert (= (and start!38654 res!231135) b!401416))

(assert (= (and b!401416 res!231136) b!401430))

(assert (= (and b!401430 res!231139) b!401419))

(assert (= (and b!401419 res!231134) b!401431))

(assert (= (and b!401431 res!231141) b!401421))

(assert (= (and b!401421 res!231144) b!401415))

(assert (= (and b!401415 res!231143) b!401417))

(assert (= (and b!401417 res!231138) b!401422))

(assert (= (and b!401422 res!231140) b!401428))

(assert (= (and b!401428 res!231133) b!401420))

(assert (= (and b!401420 res!231142) b!401429))

(assert (= (and b!401429 res!231137) b!401418))

(assert (= (and b!401418 c!54693) b!401425))

(assert (= (and b!401418 (not c!54693)) b!401426))

(assert (= (or b!401425 b!401426) bm!28252))

(assert (= (or b!401425 b!401426) bm!28251))

(assert (= (and b!401427 condMapEmpty!16752) mapIsEmpty!16752))

(assert (= (and b!401427 (not condMapEmpty!16752)) mapNonEmpty!16752))

(get-info :version)

(assert (= (and mapNonEmpty!16752 ((_ is ValueCellFull!4700) mapValue!16752)) b!401423))

(assert (= (and b!401427 ((_ is ValueCellFull!4700) mapDefault!16752)) b!401424))

(assert (= start!38654 b!401427))

(declare-fun m!394737 () Bool)

(assert (=> b!401431 m!394737))

(declare-fun m!394739 () Bool)

(assert (=> b!401419 m!394739))

(declare-fun m!394741 () Bool)

(assert (=> b!401417 m!394741))

(declare-fun m!394743 () Bool)

(assert (=> b!401425 m!394743))

(declare-fun m!394745 () Bool)

(assert (=> b!401418 m!394745))

(declare-fun m!394747 () Bool)

(assert (=> b!401428 m!394747))

(declare-fun m!394749 () Bool)

(assert (=> b!401428 m!394749))

(declare-fun m!394751 () Bool)

(assert (=> mapNonEmpty!16752 m!394751))

(declare-fun m!394753 () Bool)

(assert (=> b!401422 m!394753))

(declare-fun m!394755 () Bool)

(assert (=> b!401415 m!394755))

(declare-fun m!394757 () Bool)

(assert (=> b!401416 m!394757))

(declare-fun m!394759 () Bool)

(assert (=> bm!28252 m!394759))

(declare-fun m!394761 () Bool)

(assert (=> bm!28252 m!394761))

(assert (=> bm!28251 m!394759))

(declare-fun m!394763 () Bool)

(assert (=> bm!28251 m!394763))

(declare-fun m!394765 () Bool)

(assert (=> b!401420 m!394765))

(declare-fun m!394767 () Bool)

(assert (=> start!38654 m!394767))

(declare-fun m!394769 () Bool)

(assert (=> start!38654 m!394769))

(check-sat tp_is_empty!10087 (not bm!28252) (not b!401431) (not b!401418) (not b!401419) (not b!401420) (not mapNonEmpty!16752) (not b!401428) (not b_next!9205) (not start!38654) (not bm!28251) b_and!16565 (not b!401422) (not b!401416) (not b!401415) (not b!401425))
(check-sat b_and!16565 (not b_next!9205))
