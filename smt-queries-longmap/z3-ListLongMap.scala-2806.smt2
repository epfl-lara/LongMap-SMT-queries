; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40710 () Bool)

(assert start!40710)

(declare-fun b_free!10735 () Bool)

(declare-fun b_next!10735 () Bool)

(assert (=> start!40710 (= b_free!10735 (not b_next!10735))))

(declare-fun tp!38025 () Bool)

(declare-fun b_and!18717 () Bool)

(assert (=> start!40710 (= tp!38025 b_and!18717)))

(declare-fun b!450633 () Bool)

(declare-fun res!268316 () Bool)

(declare-fun e!264000 () Bool)

(assert (=> b!450633 (=> (not res!268316) (not e!264000))))

(declare-datatypes ((array!27947 0))(
  ( (array!27948 (arr!13419 (Array (_ BitVec 32) (_ BitVec 64))) (size!13772 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27947)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!27947 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!450633 (= res!268316 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!450634 () Bool)

(declare-fun res!268308 () Bool)

(declare-fun e!264006 () Bool)

(assert (=> b!450634 (=> (not res!268308) (not e!264006))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!450634 (= res!268308 (bvsle from!863 i!563))))

(declare-fun b!450635 () Bool)

(declare-fun e!264003 () Bool)

(declare-fun tp_is_empty!12073 () Bool)

(assert (=> b!450635 (= e!264003 tp_is_empty!12073)))

(declare-datatypes ((V!17203 0))(
  ( (V!17204 (val!6081 Int)) )
))
(declare-fun minValue!515 () V!17203)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!8004 0))(
  ( (tuple2!8005 (_1!4013 (_ BitVec 64)) (_2!4013 V!17203)) )
))
(declare-datatypes ((List!8067 0))(
  ( (Nil!8064) (Cons!8063 (h!8919 tuple2!8004) (t!13820 List!8067)) )
))
(declare-datatypes ((ListLongMap!6907 0))(
  ( (ListLongMap!6908 (toList!3469 List!8067)) )
))
(declare-fun call!29773 () ListLongMap!6907)

(declare-fun bm!29769 () Bool)

(declare-datatypes ((ValueCell!5693 0))(
  ( (ValueCellFull!5693 (v!8330 V!17203)) (EmptyCell!5693) )
))
(declare-datatypes ((array!27949 0))(
  ( (array!27950 (arr!13420 (Array (_ BitVec 32) ValueCell!5693)) (size!13773 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27949)

(declare-fun zeroValue!515 () V!17203)

(declare-fun lt!204512 () array!27947)

(declare-fun c!55938 () Bool)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun lt!204513 () array!27949)

(declare-fun defaultEntry!557 () Int)

(declare-fun getCurrentListMapNoExtraKeys!1666 (array!27947 array!27949 (_ BitVec 32) (_ BitVec 32) V!17203 V!17203 (_ BitVec 32) Int) ListLongMap!6907)

(assert (=> bm!29769 (= call!29773 (getCurrentListMapNoExtraKeys!1666 (ite c!55938 lt!204512 _keys!709) (ite c!55938 lt!204513 _values!549) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450636 () Bool)

(declare-fun e!264005 () Bool)

(declare-fun call!29772 () ListLongMap!6907)

(assert (=> b!450636 (= e!264005 (= call!29772 call!29773))))

(declare-fun b!450637 () Bool)

(declare-fun res!268314 () Bool)

(assert (=> b!450637 (=> (not res!268314) (not e!264000))))

(declare-datatypes ((List!8068 0))(
  ( (Nil!8065) (Cons!8064 (h!8920 (_ BitVec 64)) (t!13821 List!8068)) )
))
(declare-fun arrayNoDuplicates!0 (array!27947 (_ BitVec 32) List!8068) Bool)

(assert (=> b!450637 (= res!268314 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8065))))

(declare-fun mapNonEmpty!19743 () Bool)

(declare-fun mapRes!19743 () Bool)

(declare-fun tp!38024 () Bool)

(declare-fun e!264004 () Bool)

(assert (=> mapNonEmpty!19743 (= mapRes!19743 (and tp!38024 e!264004))))

(declare-fun mapValue!19743 () ValueCell!5693)

(declare-fun mapKey!19743 () (_ BitVec 32))

(declare-fun mapRest!19743 () (Array (_ BitVec 32) ValueCell!5693))

(assert (=> mapNonEmpty!19743 (= (arr!13420 _values!549) (store mapRest!19743 mapKey!19743 mapValue!19743))))

(declare-fun b!450638 () Bool)

(declare-fun res!268317 () Bool)

(assert (=> b!450638 (=> (not res!268317) (not e!264000))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27947 (_ BitVec 32)) Bool)

(assert (=> b!450638 (= res!268317 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!450639 () Bool)

(declare-fun res!268305 () Bool)

(assert (=> b!450639 (=> (not res!268305) (not e!264000))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!450639 (= res!268305 (validMask!0 mask!1025))))

(declare-fun b!450640 () Bool)

(assert (=> b!450640 (= e!264004 tp_is_empty!12073)))

(declare-fun b!450642 () Bool)

(declare-fun v!412 () V!17203)

(declare-fun +!1571 (ListLongMap!6907 tuple2!8004) ListLongMap!6907)

(assert (=> b!450642 (= e!264005 (= call!29773 (+!1571 call!29772 (tuple2!8005 k0!794 v!412))))))

(declare-fun b!450643 () Bool)

(assert (=> b!450643 (= e!264000 e!264006)))

(declare-fun res!268309 () Bool)

(assert (=> b!450643 (=> (not res!268309) (not e!264006))))

(assert (=> b!450643 (= res!268309 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!204512 mask!1025))))

(assert (=> b!450643 (= lt!204512 (array!27948 (store (arr!13419 _keys!709) i!563 k0!794) (size!13772 _keys!709)))))

(declare-fun mapIsEmpty!19743 () Bool)

(assert (=> mapIsEmpty!19743 mapRes!19743))

(declare-fun b!450644 () Bool)

(declare-fun e!264001 () Bool)

(assert (=> b!450644 (= e!264001 (and e!264003 mapRes!19743))))

(declare-fun condMapEmpty!19743 () Bool)

(declare-fun mapDefault!19743 () ValueCell!5693)

(assert (=> b!450644 (= condMapEmpty!19743 (= (arr!13420 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5693)) mapDefault!19743)))))

(declare-fun b!450645 () Bool)

(declare-fun e!264008 () Bool)

(assert (=> b!450645 (= e!264008 (bvslt from!863 (size!13773 _values!549)))))

(declare-fun lt!204509 () ListLongMap!6907)

(assert (=> b!450645 (= lt!204509 (getCurrentListMapNoExtraKeys!1666 lt!204512 lt!204513 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450646 () Bool)

(declare-fun e!264002 () Bool)

(assert (=> b!450646 (= e!264002 (not e!264008))))

(declare-fun res!268304 () Bool)

(assert (=> b!450646 (=> res!268304 e!264008)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!450646 (= res!268304 (validKeyInArray!0 (select (arr!13419 _keys!709) from!863)))))

(assert (=> b!450646 e!264005))

(assert (=> b!450646 (= c!55938 (bvsle (bvadd #b00000000000000000000000000000001 from!863) i!563))))

(declare-datatypes ((Unit!13161 0))(
  ( (Unit!13162) )
))
(declare-fun lt!204508 () Unit!13161)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!708 (array!27947 array!27949 (_ BitVec 32) (_ BitVec 32) V!17203 V!17203 (_ BitVec 32) (_ BitVec 64) V!17203 (_ BitVec 32) Int) Unit!13161)

(assert (=> b!450646 (= lt!204508 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!708 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun res!268310 () Bool)

(assert (=> start!40710 (=> (not res!268310) (not e!264000))))

(assert (=> start!40710 (= res!268310 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13772 _keys!709))))))

(assert (=> start!40710 e!264000))

(assert (=> start!40710 tp_is_empty!12073))

(assert (=> start!40710 tp!38025))

(assert (=> start!40710 true))

(declare-fun array_inv!9782 (array!27949) Bool)

(assert (=> start!40710 (and (array_inv!9782 _values!549) e!264001)))

(declare-fun array_inv!9783 (array!27947) Bool)

(assert (=> start!40710 (array_inv!9783 _keys!709)))

(declare-fun b!450641 () Bool)

(declare-fun res!268311 () Bool)

(assert (=> b!450641 (=> (not res!268311) (not e!264006))))

(assert (=> b!450641 (= res!268311 (arrayNoDuplicates!0 lt!204512 #b00000000000000000000000000000000 Nil!8065))))

(declare-fun b!450647 () Bool)

(declare-fun res!268307 () Bool)

(assert (=> b!450647 (=> (not res!268307) (not e!264000))))

(assert (=> b!450647 (= res!268307 (validKeyInArray!0 k0!794))))

(declare-fun b!450648 () Bool)

(assert (=> b!450648 (= e!264006 e!264002)))

(declare-fun res!268313 () Bool)

(assert (=> b!450648 (=> (not res!268313) (not e!264002))))

(assert (=> b!450648 (= res!268313 (= from!863 i!563))))

(declare-fun lt!204511 () ListLongMap!6907)

(assert (=> b!450648 (= lt!204511 (getCurrentListMapNoExtraKeys!1666 lt!204512 lt!204513 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!450648 (= lt!204513 (array!27950 (store (arr!13420 _values!549) i!563 (ValueCellFull!5693 v!412)) (size!13773 _values!549)))))

(declare-fun lt!204510 () ListLongMap!6907)

(assert (=> b!450648 (= lt!204510 (getCurrentListMapNoExtraKeys!1666 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!450649 () Bool)

(declare-fun res!268315 () Bool)

(assert (=> b!450649 (=> (not res!268315) (not e!264000))))

(assert (=> b!450649 (= res!268315 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13772 _keys!709))))))

(declare-fun b!450650 () Bool)

(declare-fun res!268312 () Bool)

(assert (=> b!450650 (=> (not res!268312) (not e!264000))))

(assert (=> b!450650 (= res!268312 (and (= (size!13773 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13772 _keys!709) (size!13773 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun bm!29770 () Bool)

(assert (=> bm!29770 (= call!29772 (getCurrentListMapNoExtraKeys!1666 (ite c!55938 _keys!709 lt!204512) (ite c!55938 _values!549 lt!204513) mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!450651 () Bool)

(declare-fun res!268306 () Bool)

(assert (=> b!450651 (=> (not res!268306) (not e!264000))))

(assert (=> b!450651 (= res!268306 (or (= (select (arr!13419 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13419 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!40710 res!268310) b!450639))

(assert (= (and b!450639 res!268305) b!450650))

(assert (= (and b!450650 res!268312) b!450638))

(assert (= (and b!450638 res!268317) b!450637))

(assert (= (and b!450637 res!268314) b!450649))

(assert (= (and b!450649 res!268315) b!450647))

(assert (= (and b!450647 res!268307) b!450651))

(assert (= (and b!450651 res!268306) b!450633))

(assert (= (and b!450633 res!268316) b!450643))

(assert (= (and b!450643 res!268309) b!450641))

(assert (= (and b!450641 res!268311) b!450634))

(assert (= (and b!450634 res!268308) b!450648))

(assert (= (and b!450648 res!268313) b!450646))

(assert (= (and b!450646 c!55938) b!450642))

(assert (= (and b!450646 (not c!55938)) b!450636))

(assert (= (or b!450642 b!450636) bm!29769))

(assert (= (or b!450642 b!450636) bm!29770))

(assert (= (and b!450646 (not res!268304)) b!450645))

(assert (= (and b!450644 condMapEmpty!19743) mapIsEmpty!19743))

(assert (= (and b!450644 (not condMapEmpty!19743)) mapNonEmpty!19743))

(get-info :version)

(assert (= (and mapNonEmpty!19743 ((_ is ValueCellFull!5693) mapValue!19743)) b!450640))

(assert (= (and b!450644 ((_ is ValueCellFull!5693) mapDefault!19743)) b!450635))

(assert (= start!40710 b!450644))

(declare-fun m!433957 () Bool)

(assert (=> b!450633 m!433957))

(declare-fun m!433959 () Bool)

(assert (=> bm!29769 m!433959))

(declare-fun m!433961 () Bool)

(assert (=> b!450647 m!433961))

(declare-fun m!433963 () Bool)

(assert (=> b!450651 m!433963))

(declare-fun m!433965 () Bool)

(assert (=> b!450639 m!433965))

(declare-fun m!433967 () Bool)

(assert (=> mapNonEmpty!19743 m!433967))

(declare-fun m!433969 () Bool)

(assert (=> bm!29770 m!433969))

(declare-fun m!433971 () Bool)

(assert (=> b!450646 m!433971))

(assert (=> b!450646 m!433971))

(declare-fun m!433973 () Bool)

(assert (=> b!450646 m!433973))

(declare-fun m!433975 () Bool)

(assert (=> b!450646 m!433975))

(declare-fun m!433977 () Bool)

(assert (=> start!40710 m!433977))

(declare-fun m!433979 () Bool)

(assert (=> start!40710 m!433979))

(declare-fun m!433981 () Bool)

(assert (=> b!450637 m!433981))

(declare-fun m!433983 () Bool)

(assert (=> b!450643 m!433983))

(declare-fun m!433985 () Bool)

(assert (=> b!450643 m!433985))

(declare-fun m!433987 () Bool)

(assert (=> b!450642 m!433987))

(declare-fun m!433989 () Bool)

(assert (=> b!450641 m!433989))

(declare-fun m!433991 () Bool)

(assert (=> b!450648 m!433991))

(declare-fun m!433993 () Bool)

(assert (=> b!450648 m!433993))

(declare-fun m!433995 () Bool)

(assert (=> b!450648 m!433995))

(declare-fun m!433997 () Bool)

(assert (=> b!450638 m!433997))

(declare-fun m!433999 () Bool)

(assert (=> b!450645 m!433999))

(check-sat (not bm!29770) tp_is_empty!12073 (not b!450643) b_and!18717 (not bm!29769) (not b!450638) (not b_next!10735) (not b!450641) (not b!450646) (not b!450642) (not b!450645) (not b!450633) (not b!450647) (not mapNonEmpty!19743) (not b!450639) (not b!450637) (not start!40710) (not b!450648))
(check-sat b_and!18717 (not b_next!10735))
