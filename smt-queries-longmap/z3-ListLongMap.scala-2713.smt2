; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40082 () Bool)

(assert start!40082)

(declare-fun b_free!10363 () Bool)

(declare-fun b_next!10363 () Bool)

(assert (=> start!40082 (= b_free!10363 (not b_next!10363))))

(declare-fun tp!36618 () Bool)

(declare-fun b_and!18305 () Bool)

(assert (=> start!40082 (= tp!36618 b_and!18305)))

(declare-fun mapIsEmpty!18894 () Bool)

(declare-fun mapRes!18894 () Bool)

(assert (=> mapIsEmpty!18894 mapRes!18894))

(declare-fun b!437797 () Bool)

(declare-fun res!258450 () Bool)

(declare-fun e!258282 () Bool)

(assert (=> b!437797 (=> (not res!258450) (not e!258282))))

(declare-datatypes ((array!26849 0))(
  ( (array!26850 (arr!12874 (Array (_ BitVec 32) (_ BitVec 64))) (size!13227 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!26849)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!437797 (= res!258450 (or (= (select (arr!12874 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12874 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!437798 () Bool)

(declare-fun e!258281 () Bool)

(assert (=> b!437798 (= e!258281 (not true))))

(declare-datatypes ((V!16459 0))(
  ( (V!16460 (val!5802 Int)) )
))
(declare-fun minValue!515 () V!16459)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5414 0))(
  ( (ValueCellFull!5414 (v!8043 V!16459)) (EmptyCell!5414) )
))
(declare-datatypes ((array!26851 0))(
  ( (array!26852 (arr!12875 (Array (_ BitVec 32) ValueCell!5414)) (size!13228 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!26851)

(declare-fun zeroValue!515 () V!16459)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun lt!201608 () array!26849)

(declare-fun lt!201609 () array!26851)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun v!412 () V!16459)

(declare-datatypes ((tuple2!7710 0))(
  ( (tuple2!7711 (_1!3866 (_ BitVec 64)) (_2!3866 V!16459)) )
))
(declare-datatypes ((List!7697 0))(
  ( (Nil!7694) (Cons!7693 (h!8549 tuple2!7710) (t!13444 List!7697)) )
))
(declare-datatypes ((ListLongMap!6613 0))(
  ( (ListLongMap!6614 (toList!3322 List!7697)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1521 (array!26849 array!26851 (_ BitVec 32) (_ BitVec 32) V!16459 V!16459 (_ BitVec 32) Int) ListLongMap!6613)

(declare-fun +!1494 (ListLongMap!6613 tuple2!7710) ListLongMap!6613)

(assert (=> b!437798 (= (getCurrentListMapNoExtraKeys!1521 lt!201608 lt!201609 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1494 (getCurrentListMapNoExtraKeys!1521 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!7711 k0!794 v!412)))))

(declare-datatypes ((Unit!13005 0))(
  ( (Unit!13006) )
))
(declare-fun lt!201607 () Unit!13005)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!632 (array!26849 array!26851 (_ BitVec 32) (_ BitVec 32) V!16459 V!16459 (_ BitVec 32) (_ BitVec 64) V!16459 (_ BitVec 32) Int) Unit!13005)

(assert (=> b!437798 (= lt!201607 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!632 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!437799 () Bool)

(declare-fun res!258444 () Bool)

(assert (=> b!437799 (=> (not res!258444) (not e!258282))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!26849 (_ BitVec 32)) Bool)

(assert (=> b!437799 (= res!258444 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!437800 () Bool)

(declare-fun res!258442 () Bool)

(declare-fun e!258284 () Bool)

(assert (=> b!437800 (=> (not res!258442) (not e!258284))))

(declare-datatypes ((List!7698 0))(
  ( (Nil!7695) (Cons!7694 (h!8550 (_ BitVec 64)) (t!13445 List!7698)) )
))
(declare-fun arrayNoDuplicates!0 (array!26849 (_ BitVec 32) List!7698) Bool)

(assert (=> b!437800 (= res!258442 (arrayNoDuplicates!0 lt!201608 #b00000000000000000000000000000000 Nil!7695))))

(declare-fun b!437801 () Bool)

(declare-fun res!258443 () Bool)

(assert (=> b!437801 (=> (not res!258443) (not e!258282))))

(assert (=> b!437801 (= res!258443 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7695))))

(declare-fun b!437802 () Bool)

(declare-fun res!258451 () Bool)

(assert (=> b!437802 (=> (not res!258451) (not e!258282))))

(assert (=> b!437802 (= res!258451 (and (= (size!13228 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13227 _keys!709) (size!13228 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!437803 () Bool)

(declare-fun res!258449 () Bool)

(assert (=> b!437803 (=> (not res!258449) (not e!258282))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!437803 (= res!258449 (validKeyInArray!0 k0!794))))

(declare-fun b!437804 () Bool)

(declare-fun e!258280 () Bool)

(declare-fun tp_is_empty!11515 () Bool)

(assert (=> b!437804 (= e!258280 tp_is_empty!11515)))

(declare-fun b!437805 () Bool)

(declare-fun res!258446 () Bool)

(assert (=> b!437805 (=> (not res!258446) (not e!258282))))

(declare-fun arrayContainsKey!0 (array!26849 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!437805 (= res!258446 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!437806 () Bool)

(declare-fun res!258448 () Bool)

(assert (=> b!437806 (=> (not res!258448) (not e!258282))))

(assert (=> b!437806 (= res!258448 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13227 _keys!709))))))

(declare-fun b!437807 () Bool)

(declare-fun res!258441 () Bool)

(assert (=> b!437807 (=> (not res!258441) (not e!258282))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!437807 (= res!258441 (validMask!0 mask!1025))))

(declare-fun b!437808 () Bool)

(assert (=> b!437808 (= e!258284 e!258281)))

(declare-fun res!258453 () Bool)

(assert (=> b!437808 (=> (not res!258453) (not e!258281))))

(assert (=> b!437808 (= res!258453 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!201610 () ListLongMap!6613)

(assert (=> b!437808 (= lt!201610 (getCurrentListMapNoExtraKeys!1521 lt!201608 lt!201609 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!437808 (= lt!201609 (array!26852 (store (arr!12875 _values!549) i!563 (ValueCellFull!5414 v!412)) (size!13228 _values!549)))))

(declare-fun lt!201611 () ListLongMap!6613)

(assert (=> b!437808 (= lt!201611 (getCurrentListMapNoExtraKeys!1521 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!258445 () Bool)

(assert (=> start!40082 (=> (not res!258445) (not e!258282))))

(assert (=> start!40082 (= res!258445 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13227 _keys!709))))))

(assert (=> start!40082 e!258282))

(assert (=> start!40082 tp_is_empty!11515))

(assert (=> start!40082 tp!36618))

(assert (=> start!40082 true))

(declare-fun e!258285 () Bool)

(declare-fun array_inv!9398 (array!26851) Bool)

(assert (=> start!40082 (and (array_inv!9398 _values!549) e!258285)))

(declare-fun array_inv!9399 (array!26849) Bool)

(assert (=> start!40082 (array_inv!9399 _keys!709)))

(declare-fun b!437809 () Bool)

(declare-fun e!258279 () Bool)

(assert (=> b!437809 (= e!258279 tp_is_empty!11515)))

(declare-fun b!437810 () Bool)

(assert (=> b!437810 (= e!258282 e!258284)))

(declare-fun res!258447 () Bool)

(assert (=> b!437810 (=> (not res!258447) (not e!258284))))

(assert (=> b!437810 (= res!258447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!201608 mask!1025))))

(assert (=> b!437810 (= lt!201608 (array!26850 (store (arr!12874 _keys!709) i!563 k0!794) (size!13227 _keys!709)))))

(declare-fun b!437811 () Bool)

(assert (=> b!437811 (= e!258285 (and e!258279 mapRes!18894))))

(declare-fun condMapEmpty!18894 () Bool)

(declare-fun mapDefault!18894 () ValueCell!5414)

(assert (=> b!437811 (= condMapEmpty!18894 (= (arr!12875 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5414)) mapDefault!18894)))))

(declare-fun b!437812 () Bool)

(declare-fun res!258452 () Bool)

(assert (=> b!437812 (=> (not res!258452) (not e!258284))))

(assert (=> b!437812 (= res!258452 (bvsle from!863 i!563))))

(declare-fun mapNonEmpty!18894 () Bool)

(declare-fun tp!36617 () Bool)

(assert (=> mapNonEmpty!18894 (= mapRes!18894 (and tp!36617 e!258280))))

(declare-fun mapRest!18894 () (Array (_ BitVec 32) ValueCell!5414))

(declare-fun mapKey!18894 () (_ BitVec 32))

(declare-fun mapValue!18894 () ValueCell!5414)

(assert (=> mapNonEmpty!18894 (= (arr!12875 _values!549) (store mapRest!18894 mapKey!18894 mapValue!18894))))

(assert (= (and start!40082 res!258445) b!437807))

(assert (= (and b!437807 res!258441) b!437802))

(assert (= (and b!437802 res!258451) b!437799))

(assert (= (and b!437799 res!258444) b!437801))

(assert (= (and b!437801 res!258443) b!437806))

(assert (= (and b!437806 res!258448) b!437803))

(assert (= (and b!437803 res!258449) b!437797))

(assert (= (and b!437797 res!258450) b!437805))

(assert (= (and b!437805 res!258446) b!437810))

(assert (= (and b!437810 res!258447) b!437800))

(assert (= (and b!437800 res!258442) b!437812))

(assert (= (and b!437812 res!258452) b!437808))

(assert (= (and b!437808 res!258453) b!437798))

(assert (= (and b!437811 condMapEmpty!18894) mapIsEmpty!18894))

(assert (= (and b!437811 (not condMapEmpty!18894)) mapNonEmpty!18894))

(get-info :version)

(assert (= (and mapNonEmpty!18894 ((_ is ValueCellFull!5414) mapValue!18894)) b!437804))

(assert (= (and b!437811 ((_ is ValueCellFull!5414) mapDefault!18894)) b!437809))

(assert (= start!40082 b!437811))

(declare-fun m!424875 () Bool)

(assert (=> b!437807 m!424875))

(declare-fun m!424877 () Bool)

(assert (=> b!437800 m!424877))

(declare-fun m!424879 () Bool)

(assert (=> b!437798 m!424879))

(declare-fun m!424881 () Bool)

(assert (=> b!437798 m!424881))

(assert (=> b!437798 m!424881))

(declare-fun m!424883 () Bool)

(assert (=> b!437798 m!424883))

(declare-fun m!424885 () Bool)

(assert (=> b!437798 m!424885))

(declare-fun m!424887 () Bool)

(assert (=> b!437808 m!424887))

(declare-fun m!424889 () Bool)

(assert (=> b!437808 m!424889))

(declare-fun m!424891 () Bool)

(assert (=> b!437808 m!424891))

(declare-fun m!424893 () Bool)

(assert (=> start!40082 m!424893))

(declare-fun m!424895 () Bool)

(assert (=> start!40082 m!424895))

(declare-fun m!424897 () Bool)

(assert (=> b!437801 m!424897))

(declare-fun m!424899 () Bool)

(assert (=> b!437803 m!424899))

(declare-fun m!424901 () Bool)

(assert (=> mapNonEmpty!18894 m!424901))

(declare-fun m!424903 () Bool)

(assert (=> b!437805 m!424903))

(declare-fun m!424905 () Bool)

(assert (=> b!437810 m!424905))

(declare-fun m!424907 () Bool)

(assert (=> b!437810 m!424907))

(declare-fun m!424909 () Bool)

(assert (=> b!437797 m!424909))

(declare-fun m!424911 () Bool)

(assert (=> b!437799 m!424911))

(check-sat (not b_next!10363) (not mapNonEmpty!18894) (not b!437800) (not b!437799) (not b!437798) (not b!437808) (not b!437810) (not start!40082) (not b!437807) (not b!437801) (not b!437805) tp_is_empty!11515 (not b!437803) b_and!18305)
(check-sat b_and!18305 (not b_next!10363))
