; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38618 () Bool)

(assert start!38618)

(declare-fun b_free!9169 () Bool)

(declare-fun b_next!9169 () Bool)

(assert (=> start!38618 (= b_free!9169 (not b_next!9169))))

(declare-fun tp!32631 () Bool)

(declare-fun b_and!16569 () Bool)

(assert (=> start!38618 (= tp!32631 b_and!16569)))

(declare-fun b!400719 () Bool)

(declare-fun res!230622 () Bool)

(declare-fun e!241750 () Bool)

(assert (=> b!400719 (=> (not res!230622) (not e!241750))))

(declare-datatypes ((array!23988 0))(
  ( (array!23989 (arr!11443 (Array (_ BitVec 32) (_ BitVec 64))) (size!11795 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23988)

(declare-datatypes ((List!6508 0))(
  ( (Nil!6505) (Cons!6504 (h!7360 (_ BitVec 64)) (t!11674 List!6508)) )
))
(declare-fun arrayNoDuplicates!0 (array!23988 (_ BitVec 32) List!6508) Bool)

(assert (=> b!400719 (= res!230622 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6505))))

(declare-fun b!400720 () Bool)

(declare-fun res!230615 () Bool)

(assert (=> b!400720 (=> (not res!230615) (not e!241750))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!400720 (= res!230615 (validKeyInArray!0 k0!794))))

(declare-fun b!400721 () Bool)

(declare-fun res!230618 () Bool)

(declare-fun e!241745 () Bool)

(assert (=> b!400721 (=> (not res!230618) (not e!241745))))

(declare-fun lt!187752 () array!23988)

(assert (=> b!400721 (= res!230618 (arrayNoDuplicates!0 lt!187752 #b00000000000000000000000000000000 Nil!6505))))

(declare-fun b!400722 () Bool)

(declare-fun res!230613 () Bool)

(assert (=> b!400722 (=> (not res!230613) (not e!241750))))

(declare-fun arrayContainsKey!0 (array!23988 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!400722 (= res!230613 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!400723 () Bool)

(declare-datatypes ((V!14507 0))(
  ( (V!14508 (val!5070 Int)) )
))
(declare-datatypes ((tuple2!6588 0))(
  ( (tuple2!6589 (_1!3305 (_ BitVec 64)) (_2!3305 V!14507)) )
))
(declare-datatypes ((List!6509 0))(
  ( (Nil!6506) (Cons!6505 (h!7361 tuple2!6588) (t!11675 List!6509)) )
))
(declare-datatypes ((ListLongMap!5503 0))(
  ( (ListLongMap!5504 (toList!2767 List!6509)) )
))
(declare-fun call!28159 () ListLongMap!5503)

(declare-fun call!28158 () ListLongMap!5503)

(declare-fun e!241748 () Bool)

(declare-fun v!412 () V!14507)

(declare-fun +!1113 (ListLongMap!5503 tuple2!6588) ListLongMap!5503)

(assert (=> b!400723 (= e!241748 (= call!28159 (+!1113 call!28158 (tuple2!6589 k0!794 v!412))))))

(declare-fun b!400724 () Bool)

(declare-fun res!230616 () Bool)

(assert (=> b!400724 (=> (not res!230616) (not e!241750))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23988 (_ BitVec 32)) Bool)

(assert (=> b!400724 (= res!230616 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!400725 () Bool)

(declare-fun res!230619 () Bool)

(assert (=> b!400725 (=> (not res!230619) (not e!241750))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!400725 (= res!230619 (validMask!0 mask!1025))))

(declare-fun b!400726 () Bool)

(declare-fun e!241749 () Bool)

(declare-fun tp_is_empty!10051 () Bool)

(assert (=> b!400726 (= e!241749 tp_is_empty!10051)))

(declare-fun b!400727 () Bool)

(assert (=> b!400727 (= e!241750 e!241745)))

(declare-fun res!230620 () Bool)

(assert (=> b!400727 (=> (not res!230620) (not e!241745))))

(assert (=> b!400727 (= res!230620 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!187752 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!400727 (= lt!187752 (array!23989 (store (arr!11443 _keys!709) i!563 k0!794) (size!11795 _keys!709)))))

(declare-fun b!400728 () Bool)

(declare-fun e!241746 () Bool)

(assert (=> b!400728 (= e!241746 tp_is_empty!10051)))

(declare-fun mapIsEmpty!16698 () Bool)

(declare-fun mapRes!16698 () Bool)

(assert (=> mapIsEmpty!16698 mapRes!16698))

(declare-fun mapNonEmpty!16698 () Bool)

(declare-fun tp!32630 () Bool)

(assert (=> mapNonEmpty!16698 (= mapRes!16698 (and tp!32630 e!241749))))

(declare-fun mapKey!16698 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4682 0))(
  ( (ValueCellFull!4682 (v!7318 V!14507)) (EmptyCell!4682) )
))
(declare-datatypes ((array!23990 0))(
  ( (array!23991 (arr!11444 (Array (_ BitVec 32) ValueCell!4682)) (size!11796 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23990)

(declare-fun mapValue!16698 () ValueCell!4682)

(declare-fun mapRest!16698 () (Array (_ BitVec 32) ValueCell!4682))

(assert (=> mapNonEmpty!16698 (= (arr!11444 _values!549) (store mapRest!16698 mapKey!16698 mapValue!16698))))

(declare-fun b!400729 () Bool)

(declare-fun res!230614 () Bool)

(assert (=> b!400729 (=> (not res!230614) (not e!241750))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!400729 (= res!230614 (and (= (size!11796 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11795 _keys!709) (size!11796 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun res!230617 () Bool)

(assert (=> start!38618 (=> (not res!230617) (not e!241750))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38618 (= res!230617 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11795 _keys!709))))))

(assert (=> start!38618 e!241750))

(assert (=> start!38618 tp_is_empty!10051))

(assert (=> start!38618 tp!32631))

(assert (=> start!38618 true))

(declare-fun e!241744 () Bool)

(declare-fun array_inv!8450 (array!23990) Bool)

(assert (=> start!38618 (and (array_inv!8450 _values!549) e!241744)))

(declare-fun array_inv!8451 (array!23988) Bool)

(assert (=> start!38618 (array_inv!8451 _keys!709)))

(declare-fun b!400730 () Bool)

(assert (=> b!400730 (= e!241745 (not true))))

(assert (=> b!400730 e!241748))

(declare-fun c!54687 () Bool)

(assert (=> b!400730 (= c!54687 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-fun minValue!515 () V!14507)

(declare-fun defaultEntry!557 () Int)

(declare-fun zeroValue!515 () V!14507)

(declare-datatypes ((Unit!12111 0))(
  ( (Unit!12112) )
))
(declare-fun lt!187751 () Unit!12111)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!323 (array!23988 array!23990 (_ BitVec 32) (_ BitVec 32) V!14507 V!14507 (_ BitVec 32) (_ BitVec 64) V!14507 (_ BitVec 32) Int) Unit!12111)

(assert (=> b!400730 (= lt!187751 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!323 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400731 () Bool)

(declare-fun res!230612 () Bool)

(assert (=> b!400731 (=> (not res!230612) (not e!241750))))

(assert (=> b!400731 (= res!230612 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11795 _keys!709))))))

(declare-fun b!400732 () Bool)

(declare-fun res!230611 () Bool)

(assert (=> b!400732 (=> (not res!230611) (not e!241745))))

(assert (=> b!400732 (= res!230611 (and (bvsgt from!863 i!563) (bvsle (bvadd #b00000000000000000000000000000001 from!863) (size!11795 _keys!709)) (bvsge (bvadd #b00000000000000000000000000000001 from!863) #b00000000000000000000000000000000)))))

(declare-fun bm!28155 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!1024 (array!23988 array!23990 (_ BitVec 32) (_ BitVec 32) V!14507 V!14507 (_ BitVec 32) Int) ListLongMap!5503)

(assert (=> bm!28155 (= call!28158 (getCurrentListMapNoExtraKeys!1024 (ite c!54687 _keys!709 lt!187752) (ite c!54687 _values!549 (array!23991 (store (arr!11444 _values!549) i!563 (ValueCellFull!4682 v!412)) (size!11796 _values!549))) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400733 () Bool)

(declare-fun res!230621 () Bool)

(assert (=> b!400733 (=> (not res!230621) (not e!241750))))

(assert (=> b!400733 (= res!230621 (or (= (select (arr!11443 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11443 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun bm!28156 () Bool)

(assert (=> bm!28156 (= call!28159 (getCurrentListMapNoExtraKeys!1024 (ite c!54687 lt!187752 _keys!709) (ite c!54687 (array!23991 (store (arr!11444 _values!549) i!563 (ValueCellFull!4682 v!412)) (size!11796 _values!549)) _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!400734 () Bool)

(assert (=> b!400734 (= e!241748 (= call!28158 call!28159))))

(declare-fun b!400735 () Bool)

(assert (=> b!400735 (= e!241744 (and e!241746 mapRes!16698))))

(declare-fun condMapEmpty!16698 () Bool)

(declare-fun mapDefault!16698 () ValueCell!4682)

(assert (=> b!400735 (= condMapEmpty!16698 (= (arr!11444 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4682)) mapDefault!16698)))))

(assert (= (and start!38618 res!230617) b!400725))

(assert (= (and b!400725 res!230619) b!400729))

(assert (= (and b!400729 res!230614) b!400724))

(assert (= (and b!400724 res!230616) b!400719))

(assert (= (and b!400719 res!230622) b!400731))

(assert (= (and b!400731 res!230612) b!400720))

(assert (= (and b!400720 res!230615) b!400733))

(assert (= (and b!400733 res!230621) b!400722))

(assert (= (and b!400722 res!230613) b!400727))

(assert (= (and b!400727 res!230620) b!400721))

(assert (= (and b!400721 res!230618) b!400732))

(assert (= (and b!400732 res!230611) b!400730))

(assert (= (and b!400730 c!54687) b!400723))

(assert (= (and b!400730 (not c!54687)) b!400734))

(assert (= (or b!400723 b!400734) bm!28156))

(assert (= (or b!400723 b!400734) bm!28155))

(assert (= (and b!400735 condMapEmpty!16698) mapIsEmpty!16698))

(assert (= (and b!400735 (not condMapEmpty!16698)) mapNonEmpty!16698))

(get-info :version)

(assert (= (and mapNonEmpty!16698 ((_ is ValueCellFull!4682) mapValue!16698)) b!400726))

(assert (= (and b!400735 ((_ is ValueCellFull!4682) mapDefault!16698)) b!400728))

(assert (= start!38618 b!400735))

(declare-fun m!395079 () Bool)

(assert (=> b!400730 m!395079))

(declare-fun m!395081 () Bool)

(assert (=> start!38618 m!395081))

(declare-fun m!395083 () Bool)

(assert (=> start!38618 m!395083))

(declare-fun m!395085 () Bool)

(assert (=> b!400733 m!395085))

(declare-fun m!395087 () Bool)

(assert (=> b!400725 m!395087))

(declare-fun m!395089 () Bool)

(assert (=> b!400722 m!395089))

(declare-fun m!395091 () Bool)

(assert (=> b!400727 m!395091))

(declare-fun m!395093 () Bool)

(assert (=> b!400727 m!395093))

(declare-fun m!395095 () Bool)

(assert (=> b!400720 m!395095))

(declare-fun m!395097 () Bool)

(assert (=> b!400724 m!395097))

(declare-fun m!395099 () Bool)

(assert (=> bm!28155 m!395099))

(declare-fun m!395101 () Bool)

(assert (=> bm!28155 m!395101))

(assert (=> bm!28156 m!395099))

(declare-fun m!395103 () Bool)

(assert (=> bm!28156 m!395103))

(declare-fun m!395105 () Bool)

(assert (=> b!400721 m!395105))

(declare-fun m!395107 () Bool)

(assert (=> b!400723 m!395107))

(declare-fun m!395109 () Bool)

(assert (=> mapNonEmpty!16698 m!395109))

(declare-fun m!395111 () Bool)

(assert (=> b!400719 m!395111))

(check-sat (not b!400730) b_and!16569 (not b!400722) (not b!400721) (not bm!28155) (not b!400725) (not b!400719) (not b_next!9169) (not b!400724) (not bm!28156) (not start!38618) (not b!400727) tp_is_empty!10051 (not mapNonEmpty!16698) (not b!400720) (not b!400723))
(check-sat b_and!16569 (not b_next!9169))
