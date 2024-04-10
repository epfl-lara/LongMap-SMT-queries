; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37832 () Bool)

(assert start!37832)

(declare-fun b_free!8913 () Bool)

(declare-fun b_next!8913 () Bool)

(assert (=> start!37832 (= b_free!8913 (not b_next!8913))))

(declare-fun tp!31494 () Bool)

(declare-fun b_and!16167 () Bool)

(assert (=> start!37832 (= tp!31494 b_and!16167)))

(declare-fun mapIsEmpty!15945 () Bool)

(declare-fun mapRes!15945 () Bool)

(assert (=> mapIsEmpty!15945 mapRes!15945))

(declare-fun b!388725 () Bool)

(declare-fun res!222308 () Bool)

(declare-fun e!235534 () Bool)

(assert (=> b!388725 (=> (not res!222308) (not e!235534))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23063 0))(
  ( (array!23064 (arr!10999 (Array (_ BitVec 32) (_ BitVec 64))) (size!11351 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23063)

(assert (=> b!388725 (= res!222308 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11351 _keys!658))))))

(declare-fun res!222303 () Bool)

(assert (=> start!37832 (=> (not res!222303) (not e!235534))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37832 (= res!222303 (validMask!0 mask!970))))

(assert (=> start!37832 e!235534))

(declare-datatypes ((V!13885 0))(
  ( (V!13886 (val!4837 Int)) )
))
(declare-datatypes ((ValueCell!4449 0))(
  ( (ValueCellFull!4449 (v!7038 V!13885)) (EmptyCell!4449) )
))
(declare-datatypes ((array!23065 0))(
  ( (array!23066 (arr!11000 (Array (_ BitVec 32) ValueCell!4449)) (size!11352 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23065)

(declare-fun e!235532 () Bool)

(declare-fun array_inv!8086 (array!23065) Bool)

(assert (=> start!37832 (and (array_inv!8086 _values!506) e!235532)))

(assert (=> start!37832 tp!31494))

(assert (=> start!37832 true))

(declare-fun tp_is_empty!9585 () Bool)

(assert (=> start!37832 tp_is_empty!9585))

(declare-fun array_inv!8087 (array!23063) Bool)

(assert (=> start!37832 (array_inv!8087 _keys!658)))

(declare-fun b!388726 () Bool)

(declare-fun res!222307 () Bool)

(assert (=> b!388726 (=> (not res!222307) (not e!235534))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!388726 (= res!222307 (and (= (size!11352 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11351 _keys!658) (size!11352 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-datatypes ((tuple2!6504 0))(
  ( (tuple2!6505 (_1!3263 (_ BitVec 64)) (_2!3263 V!13885)) )
))
(declare-fun lt!182569 () tuple2!6504)

(declare-fun e!235533 () Bool)

(declare-fun lt!182572 () tuple2!6504)

(declare-datatypes ((List!6357 0))(
  ( (Nil!6354) (Cons!6353 (h!7209 tuple2!6504) (t!11509 List!6357)) )
))
(declare-datatypes ((ListLongMap!5417 0))(
  ( (ListLongMap!5418 (toList!2724 List!6357)) )
))
(declare-fun lt!182570 () ListLongMap!5417)

(declare-fun b!388727 () Bool)

(declare-fun lt!182576 () ListLongMap!5417)

(declare-fun +!1019 (ListLongMap!5417 tuple2!6504) ListLongMap!5417)

(assert (=> b!388727 (= e!235533 (= lt!182570 (+!1019 (+!1019 lt!182576 lt!182572) lt!182569)))))

(declare-fun lt!182571 () ListLongMap!5417)

(declare-fun lt!182578 () ListLongMap!5417)

(assert (=> b!388727 (= lt!182571 (+!1019 (+!1019 lt!182578 lt!182572) lt!182569))))

(declare-fun minValue!472 () V!13885)

(assert (=> b!388727 (= lt!182569 (tuple2!6505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun zeroValue!472 () V!13885)

(assert (=> b!388727 (= lt!182572 (tuple2!6505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!388728 () Bool)

(declare-fun res!222304 () Bool)

(assert (=> b!388728 (=> (not res!222304) (not e!235534))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388728 (= res!222304 (validKeyInArray!0 k0!778))))

(declare-fun b!388729 () Bool)

(declare-fun res!222310 () Bool)

(declare-fun e!235531 () Bool)

(assert (=> b!388729 (=> (not res!222310) (not e!235531))))

(declare-fun lt!182577 () array!23063)

(declare-datatypes ((List!6358 0))(
  ( (Nil!6355) (Cons!6354 (h!7210 (_ BitVec 64)) (t!11510 List!6358)) )
))
(declare-fun arrayNoDuplicates!0 (array!23063 (_ BitVec 32) List!6358) Bool)

(assert (=> b!388729 (= res!222310 (arrayNoDuplicates!0 lt!182577 #b00000000000000000000000000000000 Nil!6355))))

(declare-fun b!388730 () Bool)

(declare-fun res!222305 () Bool)

(assert (=> b!388730 (=> (not res!222305) (not e!235534))))

(assert (=> b!388730 (= res!222305 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6355))))

(declare-fun b!388731 () Bool)

(assert (=> b!388731 (= e!235534 e!235531)))

(declare-fun res!222302 () Bool)

(assert (=> b!388731 (=> (not res!222302) (not e!235531))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23063 (_ BitVec 32)) Bool)

(assert (=> b!388731 (= res!222302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182577 mask!970))))

(assert (=> b!388731 (= lt!182577 (array!23064 (store (arr!10999 _keys!658) i!548 k0!778) (size!11351 _keys!658)))))

(declare-fun b!388732 () Bool)

(declare-fun e!235529 () Bool)

(assert (=> b!388732 (= e!235529 tp_is_empty!9585)))

(declare-fun b!388733 () Bool)

(assert (=> b!388733 (= e!235531 (not e!235533))))

(declare-fun res!222306 () Bool)

(assert (=> b!388733 (=> res!222306 e!235533)))

(assert (=> b!388733 (= res!222306 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!2073 (array!23063 array!23065 (_ BitVec 32) (_ BitVec 32) V!13885 V!13885 (_ BitVec 32) Int) ListLongMap!5417)

(assert (=> b!388733 (= lt!182570 (getCurrentListMap!2073 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182575 () array!23065)

(assert (=> b!388733 (= lt!182571 (getCurrentListMap!2073 lt!182577 lt!182575 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182574 () ListLongMap!5417)

(assert (=> b!388733 (and (= lt!182578 lt!182574) (= lt!182574 lt!182578))))

(declare-fun v!373 () V!13885)

(assert (=> b!388733 (= lt!182574 (+!1019 lt!182576 (tuple2!6505 k0!778 v!373)))))

(declare-datatypes ((Unit!11914 0))(
  ( (Unit!11915) )
))
(declare-fun lt!182573 () Unit!11914)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!237 (array!23063 array!23065 (_ BitVec 32) (_ BitVec 32) V!13885 V!13885 (_ BitVec 32) (_ BitVec 64) V!13885 (_ BitVec 32) Int) Unit!11914)

(assert (=> b!388733 (= lt!182573 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!237 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!953 (array!23063 array!23065 (_ BitVec 32) (_ BitVec 32) V!13885 V!13885 (_ BitVec 32) Int) ListLongMap!5417)

(assert (=> b!388733 (= lt!182578 (getCurrentListMapNoExtraKeys!953 lt!182577 lt!182575 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388733 (= lt!182575 (array!23066 (store (arr!11000 _values!506) i!548 (ValueCellFull!4449 v!373)) (size!11352 _values!506)))))

(assert (=> b!388733 (= lt!182576 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388734 () Bool)

(declare-fun res!222312 () Bool)

(assert (=> b!388734 (=> (not res!222312) (not e!235534))))

(assert (=> b!388734 (= res!222312 (or (= (select (arr!10999 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10999 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388735 () Bool)

(declare-fun e!235528 () Bool)

(assert (=> b!388735 (= e!235528 tp_is_empty!9585)))

(declare-fun mapNonEmpty!15945 () Bool)

(declare-fun tp!31493 () Bool)

(assert (=> mapNonEmpty!15945 (= mapRes!15945 (and tp!31493 e!235529))))

(declare-fun mapValue!15945 () ValueCell!4449)

(declare-fun mapKey!15945 () (_ BitVec 32))

(declare-fun mapRest!15945 () (Array (_ BitVec 32) ValueCell!4449))

(assert (=> mapNonEmpty!15945 (= (arr!11000 _values!506) (store mapRest!15945 mapKey!15945 mapValue!15945))))

(declare-fun b!388736 () Bool)

(assert (=> b!388736 (= e!235532 (and e!235528 mapRes!15945))))

(declare-fun condMapEmpty!15945 () Bool)

(declare-fun mapDefault!15945 () ValueCell!4449)

(assert (=> b!388736 (= condMapEmpty!15945 (= (arr!11000 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4449)) mapDefault!15945)))))

(declare-fun b!388737 () Bool)

(declare-fun res!222309 () Bool)

(assert (=> b!388737 (=> (not res!222309) (not e!235534))))

(declare-fun arrayContainsKey!0 (array!23063 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388737 (= res!222309 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!388738 () Bool)

(declare-fun res!222311 () Bool)

(assert (=> b!388738 (=> (not res!222311) (not e!235534))))

(assert (=> b!388738 (= res!222311 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37832 res!222303) b!388726))

(assert (= (and b!388726 res!222307) b!388738))

(assert (= (and b!388738 res!222311) b!388730))

(assert (= (and b!388730 res!222305) b!388725))

(assert (= (and b!388725 res!222308) b!388728))

(assert (= (and b!388728 res!222304) b!388734))

(assert (= (and b!388734 res!222312) b!388737))

(assert (= (and b!388737 res!222309) b!388731))

(assert (= (and b!388731 res!222302) b!388729))

(assert (= (and b!388729 res!222310) b!388733))

(assert (= (and b!388733 (not res!222306)) b!388727))

(assert (= (and b!388736 condMapEmpty!15945) mapIsEmpty!15945))

(assert (= (and b!388736 (not condMapEmpty!15945)) mapNonEmpty!15945))

(get-info :version)

(assert (= (and mapNonEmpty!15945 ((_ is ValueCellFull!4449) mapValue!15945)) b!388732))

(assert (= (and b!388736 ((_ is ValueCellFull!4449) mapDefault!15945)) b!388735))

(assert (= start!37832 b!388736))

(declare-fun m!384683 () Bool)

(assert (=> b!388729 m!384683))

(declare-fun m!384685 () Bool)

(assert (=> mapNonEmpty!15945 m!384685))

(declare-fun m!384687 () Bool)

(assert (=> b!388731 m!384687))

(declare-fun m!384689 () Bool)

(assert (=> b!388731 m!384689))

(declare-fun m!384691 () Bool)

(assert (=> b!388733 m!384691))

(declare-fun m!384693 () Bool)

(assert (=> b!388733 m!384693))

(declare-fun m!384695 () Bool)

(assert (=> b!388733 m!384695))

(declare-fun m!384697 () Bool)

(assert (=> b!388733 m!384697))

(declare-fun m!384699 () Bool)

(assert (=> b!388733 m!384699))

(declare-fun m!384701 () Bool)

(assert (=> b!388733 m!384701))

(declare-fun m!384703 () Bool)

(assert (=> b!388733 m!384703))

(declare-fun m!384705 () Bool)

(assert (=> b!388737 m!384705))

(declare-fun m!384707 () Bool)

(assert (=> b!388730 m!384707))

(declare-fun m!384709 () Bool)

(assert (=> b!388738 m!384709))

(declare-fun m!384711 () Bool)

(assert (=> b!388728 m!384711))

(declare-fun m!384713 () Bool)

(assert (=> start!37832 m!384713))

(declare-fun m!384715 () Bool)

(assert (=> start!37832 m!384715))

(declare-fun m!384717 () Bool)

(assert (=> start!37832 m!384717))

(declare-fun m!384719 () Bool)

(assert (=> b!388727 m!384719))

(assert (=> b!388727 m!384719))

(declare-fun m!384721 () Bool)

(assert (=> b!388727 m!384721))

(declare-fun m!384723 () Bool)

(assert (=> b!388727 m!384723))

(assert (=> b!388727 m!384723))

(declare-fun m!384725 () Bool)

(assert (=> b!388727 m!384725))

(declare-fun m!384727 () Bool)

(assert (=> b!388734 m!384727))

(check-sat (not b!388730) (not b!388737) (not start!37832) (not b_next!8913) (not mapNonEmpty!15945) (not b!388738) (not b!388727) (not b!388733) (not b!388729) tp_is_empty!9585 b_and!16167 (not b!388728) (not b!388731))
(check-sat b_and!16167 (not b_next!8913))
(get-model)

(declare-fun d!72835 () Bool)

(declare-fun e!235558 () Bool)

(assert (=> d!72835 e!235558))

(declare-fun res!222350 () Bool)

(assert (=> d!72835 (=> (not res!222350) (not e!235558))))

(declare-fun lt!182617 () ListLongMap!5417)

(declare-fun contains!2443 (ListLongMap!5417 (_ BitVec 64)) Bool)

(assert (=> d!72835 (= res!222350 (contains!2443 lt!182617 (_1!3263 lt!182569)))))

(declare-fun lt!182619 () List!6357)

(assert (=> d!72835 (= lt!182617 (ListLongMap!5418 lt!182619))))

(declare-fun lt!182618 () Unit!11914)

(declare-fun lt!182620 () Unit!11914)

(assert (=> d!72835 (= lt!182618 lt!182620)))

(declare-datatypes ((Option!362 0))(
  ( (Some!361 (v!7043 V!13885)) (None!360) )
))
(declare-fun getValueByKey!356 (List!6357 (_ BitVec 64)) Option!362)

(assert (=> d!72835 (= (getValueByKey!356 lt!182619 (_1!3263 lt!182569)) (Some!361 (_2!3263 lt!182569)))))

(declare-fun lemmaContainsTupThenGetReturnValue!178 (List!6357 (_ BitVec 64) V!13885) Unit!11914)

(assert (=> d!72835 (= lt!182620 (lemmaContainsTupThenGetReturnValue!178 lt!182619 (_1!3263 lt!182569) (_2!3263 lt!182569)))))

(declare-fun insertStrictlySorted!181 (List!6357 (_ BitVec 64) V!13885) List!6357)

(assert (=> d!72835 (= lt!182619 (insertStrictlySorted!181 (toList!2724 (+!1019 lt!182576 lt!182572)) (_1!3263 lt!182569) (_2!3263 lt!182569)))))

(assert (=> d!72835 (= (+!1019 (+!1019 lt!182576 lt!182572) lt!182569) lt!182617)))

(declare-fun b!388785 () Bool)

(declare-fun res!222351 () Bool)

(assert (=> b!388785 (=> (not res!222351) (not e!235558))))

(assert (=> b!388785 (= res!222351 (= (getValueByKey!356 (toList!2724 lt!182617) (_1!3263 lt!182569)) (Some!361 (_2!3263 lt!182569))))))

(declare-fun b!388786 () Bool)

(declare-fun contains!2444 (List!6357 tuple2!6504) Bool)

(assert (=> b!388786 (= e!235558 (contains!2444 (toList!2724 lt!182617) lt!182569))))

(assert (= (and d!72835 res!222350) b!388785))

(assert (= (and b!388785 res!222351) b!388786))

(declare-fun m!384775 () Bool)

(assert (=> d!72835 m!384775))

(declare-fun m!384777 () Bool)

(assert (=> d!72835 m!384777))

(declare-fun m!384779 () Bool)

(assert (=> d!72835 m!384779))

(declare-fun m!384781 () Bool)

(assert (=> d!72835 m!384781))

(declare-fun m!384783 () Bool)

(assert (=> b!388785 m!384783))

(declare-fun m!384785 () Bool)

(assert (=> b!388786 m!384785))

(assert (=> b!388727 d!72835))

(declare-fun d!72837 () Bool)

(declare-fun e!235559 () Bool)

(assert (=> d!72837 e!235559))

(declare-fun res!222352 () Bool)

(assert (=> d!72837 (=> (not res!222352) (not e!235559))))

(declare-fun lt!182621 () ListLongMap!5417)

(assert (=> d!72837 (= res!222352 (contains!2443 lt!182621 (_1!3263 lt!182572)))))

(declare-fun lt!182623 () List!6357)

(assert (=> d!72837 (= lt!182621 (ListLongMap!5418 lt!182623))))

(declare-fun lt!182622 () Unit!11914)

(declare-fun lt!182624 () Unit!11914)

(assert (=> d!72837 (= lt!182622 lt!182624)))

(assert (=> d!72837 (= (getValueByKey!356 lt!182623 (_1!3263 lt!182572)) (Some!361 (_2!3263 lt!182572)))))

(assert (=> d!72837 (= lt!182624 (lemmaContainsTupThenGetReturnValue!178 lt!182623 (_1!3263 lt!182572) (_2!3263 lt!182572)))))

(assert (=> d!72837 (= lt!182623 (insertStrictlySorted!181 (toList!2724 lt!182576) (_1!3263 lt!182572) (_2!3263 lt!182572)))))

(assert (=> d!72837 (= (+!1019 lt!182576 lt!182572) lt!182621)))

(declare-fun b!388787 () Bool)

(declare-fun res!222353 () Bool)

(assert (=> b!388787 (=> (not res!222353) (not e!235559))))

(assert (=> b!388787 (= res!222353 (= (getValueByKey!356 (toList!2724 lt!182621) (_1!3263 lt!182572)) (Some!361 (_2!3263 lt!182572))))))

(declare-fun b!388788 () Bool)

(assert (=> b!388788 (= e!235559 (contains!2444 (toList!2724 lt!182621) lt!182572))))

(assert (= (and d!72837 res!222352) b!388787))

(assert (= (and b!388787 res!222353) b!388788))

(declare-fun m!384787 () Bool)

(assert (=> d!72837 m!384787))

(declare-fun m!384789 () Bool)

(assert (=> d!72837 m!384789))

(declare-fun m!384791 () Bool)

(assert (=> d!72837 m!384791))

(declare-fun m!384793 () Bool)

(assert (=> d!72837 m!384793))

(declare-fun m!384795 () Bool)

(assert (=> b!388787 m!384795))

(declare-fun m!384797 () Bool)

(assert (=> b!388788 m!384797))

(assert (=> b!388727 d!72837))

(declare-fun d!72839 () Bool)

(declare-fun e!235560 () Bool)

(assert (=> d!72839 e!235560))

(declare-fun res!222354 () Bool)

(assert (=> d!72839 (=> (not res!222354) (not e!235560))))

(declare-fun lt!182625 () ListLongMap!5417)

(assert (=> d!72839 (= res!222354 (contains!2443 lt!182625 (_1!3263 lt!182569)))))

(declare-fun lt!182627 () List!6357)

(assert (=> d!72839 (= lt!182625 (ListLongMap!5418 lt!182627))))

(declare-fun lt!182626 () Unit!11914)

(declare-fun lt!182628 () Unit!11914)

(assert (=> d!72839 (= lt!182626 lt!182628)))

(assert (=> d!72839 (= (getValueByKey!356 lt!182627 (_1!3263 lt!182569)) (Some!361 (_2!3263 lt!182569)))))

(assert (=> d!72839 (= lt!182628 (lemmaContainsTupThenGetReturnValue!178 lt!182627 (_1!3263 lt!182569) (_2!3263 lt!182569)))))

(assert (=> d!72839 (= lt!182627 (insertStrictlySorted!181 (toList!2724 (+!1019 lt!182578 lt!182572)) (_1!3263 lt!182569) (_2!3263 lt!182569)))))

(assert (=> d!72839 (= (+!1019 (+!1019 lt!182578 lt!182572) lt!182569) lt!182625)))

(declare-fun b!388789 () Bool)

(declare-fun res!222355 () Bool)

(assert (=> b!388789 (=> (not res!222355) (not e!235560))))

(assert (=> b!388789 (= res!222355 (= (getValueByKey!356 (toList!2724 lt!182625) (_1!3263 lt!182569)) (Some!361 (_2!3263 lt!182569))))))

(declare-fun b!388790 () Bool)

(assert (=> b!388790 (= e!235560 (contains!2444 (toList!2724 lt!182625) lt!182569))))

(assert (= (and d!72839 res!222354) b!388789))

(assert (= (and b!388789 res!222355) b!388790))

(declare-fun m!384799 () Bool)

(assert (=> d!72839 m!384799))

(declare-fun m!384801 () Bool)

(assert (=> d!72839 m!384801))

(declare-fun m!384803 () Bool)

(assert (=> d!72839 m!384803))

(declare-fun m!384805 () Bool)

(assert (=> d!72839 m!384805))

(declare-fun m!384807 () Bool)

(assert (=> b!388789 m!384807))

(declare-fun m!384809 () Bool)

(assert (=> b!388790 m!384809))

(assert (=> b!388727 d!72839))

(declare-fun d!72841 () Bool)

(declare-fun e!235561 () Bool)

(assert (=> d!72841 e!235561))

(declare-fun res!222356 () Bool)

(assert (=> d!72841 (=> (not res!222356) (not e!235561))))

(declare-fun lt!182629 () ListLongMap!5417)

(assert (=> d!72841 (= res!222356 (contains!2443 lt!182629 (_1!3263 lt!182572)))))

(declare-fun lt!182631 () List!6357)

(assert (=> d!72841 (= lt!182629 (ListLongMap!5418 lt!182631))))

(declare-fun lt!182630 () Unit!11914)

(declare-fun lt!182632 () Unit!11914)

(assert (=> d!72841 (= lt!182630 lt!182632)))

(assert (=> d!72841 (= (getValueByKey!356 lt!182631 (_1!3263 lt!182572)) (Some!361 (_2!3263 lt!182572)))))

(assert (=> d!72841 (= lt!182632 (lemmaContainsTupThenGetReturnValue!178 lt!182631 (_1!3263 lt!182572) (_2!3263 lt!182572)))))

(assert (=> d!72841 (= lt!182631 (insertStrictlySorted!181 (toList!2724 lt!182578) (_1!3263 lt!182572) (_2!3263 lt!182572)))))

(assert (=> d!72841 (= (+!1019 lt!182578 lt!182572) lt!182629)))

(declare-fun b!388791 () Bool)

(declare-fun res!222357 () Bool)

(assert (=> b!388791 (=> (not res!222357) (not e!235561))))

(assert (=> b!388791 (= res!222357 (= (getValueByKey!356 (toList!2724 lt!182629) (_1!3263 lt!182572)) (Some!361 (_2!3263 lt!182572))))))

(declare-fun b!388792 () Bool)

(assert (=> b!388792 (= e!235561 (contains!2444 (toList!2724 lt!182629) lt!182572))))

(assert (= (and d!72841 res!222356) b!388791))

(assert (= (and b!388791 res!222357) b!388792))

(declare-fun m!384811 () Bool)

(assert (=> d!72841 m!384811))

(declare-fun m!384813 () Bool)

(assert (=> d!72841 m!384813))

(declare-fun m!384815 () Bool)

(assert (=> d!72841 m!384815))

(declare-fun m!384817 () Bool)

(assert (=> d!72841 m!384817))

(declare-fun m!384819 () Bool)

(assert (=> b!388791 m!384819))

(declare-fun m!384821 () Bool)

(assert (=> b!388792 m!384821))

(assert (=> b!388727 d!72841))

(declare-fun d!72843 () Bool)

(declare-fun e!235562 () Bool)

(assert (=> d!72843 e!235562))

(declare-fun res!222358 () Bool)

(assert (=> d!72843 (=> (not res!222358) (not e!235562))))

(declare-fun lt!182633 () ListLongMap!5417)

(assert (=> d!72843 (= res!222358 (contains!2443 lt!182633 (_1!3263 (tuple2!6505 k0!778 v!373))))))

(declare-fun lt!182635 () List!6357)

(assert (=> d!72843 (= lt!182633 (ListLongMap!5418 lt!182635))))

(declare-fun lt!182634 () Unit!11914)

(declare-fun lt!182636 () Unit!11914)

(assert (=> d!72843 (= lt!182634 lt!182636)))

(assert (=> d!72843 (= (getValueByKey!356 lt!182635 (_1!3263 (tuple2!6505 k0!778 v!373))) (Some!361 (_2!3263 (tuple2!6505 k0!778 v!373))))))

(assert (=> d!72843 (= lt!182636 (lemmaContainsTupThenGetReturnValue!178 lt!182635 (_1!3263 (tuple2!6505 k0!778 v!373)) (_2!3263 (tuple2!6505 k0!778 v!373))))))

(assert (=> d!72843 (= lt!182635 (insertStrictlySorted!181 (toList!2724 lt!182576) (_1!3263 (tuple2!6505 k0!778 v!373)) (_2!3263 (tuple2!6505 k0!778 v!373))))))

(assert (=> d!72843 (= (+!1019 lt!182576 (tuple2!6505 k0!778 v!373)) lt!182633)))

(declare-fun b!388793 () Bool)

(declare-fun res!222359 () Bool)

(assert (=> b!388793 (=> (not res!222359) (not e!235562))))

(assert (=> b!388793 (= res!222359 (= (getValueByKey!356 (toList!2724 lt!182633) (_1!3263 (tuple2!6505 k0!778 v!373))) (Some!361 (_2!3263 (tuple2!6505 k0!778 v!373)))))))

(declare-fun b!388794 () Bool)

(assert (=> b!388794 (= e!235562 (contains!2444 (toList!2724 lt!182633) (tuple2!6505 k0!778 v!373)))))

(assert (= (and d!72843 res!222358) b!388793))

(assert (= (and b!388793 res!222359) b!388794))

(declare-fun m!384823 () Bool)

(assert (=> d!72843 m!384823))

(declare-fun m!384825 () Bool)

(assert (=> d!72843 m!384825))

(declare-fun m!384827 () Bool)

(assert (=> d!72843 m!384827))

(declare-fun m!384829 () Bool)

(assert (=> d!72843 m!384829))

(declare-fun m!384831 () Bool)

(assert (=> b!388793 m!384831))

(declare-fun m!384833 () Bool)

(assert (=> b!388794 m!384833))

(assert (=> b!388733 d!72843))

(declare-fun b!388819 () Bool)

(declare-fun e!235583 () Bool)

(declare-fun e!235581 () Bool)

(assert (=> b!388819 (= e!235583 e!235581)))

(declare-fun c!53987 () Bool)

(declare-fun e!235578 () Bool)

(assert (=> b!388819 (= c!53987 e!235578)))

(declare-fun res!222369 () Bool)

(assert (=> b!388819 (=> (not res!222369) (not e!235578))))

(assert (=> b!388819 (= res!222369 (bvslt #b00000000000000000000000000000000 (size!11351 _keys!658)))))

(declare-fun b!388820 () Bool)

(declare-fun e!235582 () ListLongMap!5417)

(assert (=> b!388820 (= e!235582 (ListLongMap!5418 Nil!6354))))

(declare-fun b!388821 () Bool)

(declare-fun e!235577 () Bool)

(assert (=> b!388821 (= e!235581 e!235577)))

(assert (=> b!388821 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11351 _keys!658)))))

(declare-fun res!222371 () Bool)

(declare-fun lt!182652 () ListLongMap!5417)

(assert (=> b!388821 (= res!222371 (contains!2443 lt!182652 (select (arr!10999 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388821 (=> (not res!222371) (not e!235577))))

(declare-fun b!388822 () Bool)

(declare-fun lt!182656 () Unit!11914)

(declare-fun lt!182651 () Unit!11914)

(assert (=> b!388822 (= lt!182656 lt!182651)))

(declare-fun lt!182657 () V!13885)

(declare-fun lt!182653 () (_ BitVec 64))

(declare-fun lt!182654 () ListLongMap!5417)

(declare-fun lt!182655 () (_ BitVec 64))

(assert (=> b!388822 (not (contains!2443 (+!1019 lt!182654 (tuple2!6505 lt!182655 lt!182657)) lt!182653))))

(declare-fun addStillNotContains!131 (ListLongMap!5417 (_ BitVec 64) V!13885 (_ BitVec 64)) Unit!11914)

(assert (=> b!388822 (= lt!182651 (addStillNotContains!131 lt!182654 lt!182655 lt!182657 lt!182653))))

(assert (=> b!388822 (= lt!182653 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!5566 (ValueCell!4449 V!13885) V!13885)

(declare-fun dynLambda!641 (Int (_ BitVec 64)) V!13885)

(assert (=> b!388822 (= lt!182657 (get!5566 (select (arr!11000 _values!506) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!388822 (= lt!182655 (select (arr!10999 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27357 () ListLongMap!5417)

(assert (=> b!388822 (= lt!182654 call!27357)))

(declare-fun e!235580 () ListLongMap!5417)

(assert (=> b!388822 (= e!235580 (+!1019 call!27357 (tuple2!6505 (select (arr!10999 _keys!658) #b00000000000000000000000000000000) (get!5566 (select (arr!11000 _values!506) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!388823 () Bool)

(declare-fun e!235579 () Bool)

(declare-fun isEmpty!544 (ListLongMap!5417) Bool)

(assert (=> b!388823 (= e!235579 (isEmpty!544 lt!182652))))

(declare-fun b!388824 () Bool)

(assert (=> b!388824 (= e!235580 call!27357)))

(declare-fun b!388825 () Bool)

(declare-fun res!222368 () Bool)

(assert (=> b!388825 (=> (not res!222368) (not e!235583))))

(assert (=> b!388825 (= res!222368 (not (contains!2443 lt!182652 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!72845 () Bool)

(assert (=> d!72845 e!235583))

(declare-fun res!222370 () Bool)

(assert (=> d!72845 (=> (not res!222370) (not e!235583))))

(assert (=> d!72845 (= res!222370 (not (contains!2443 lt!182652 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72845 (= lt!182652 e!235582)))

(declare-fun c!53984 () Bool)

(assert (=> d!72845 (= c!53984 (bvsge #b00000000000000000000000000000000 (size!11351 _keys!658)))))

(assert (=> d!72845 (validMask!0 mask!970)))

(assert (=> d!72845 (= (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182652)))

(declare-fun bm!27354 () Bool)

(assert (=> bm!27354 (= call!27357 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!388826 () Bool)

(assert (=> b!388826 (= e!235579 (= lt!182652 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!388827 () Bool)

(assert (=> b!388827 (= e!235578 (validKeyInArray!0 (select (arr!10999 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388827 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!388828 () Bool)

(assert (=> b!388828 (= e!235582 e!235580)))

(declare-fun c!53985 () Bool)

(assert (=> b!388828 (= c!53985 (validKeyInArray!0 (select (arr!10999 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388829 () Bool)

(assert (=> b!388829 (= e!235581 e!235579)))

(declare-fun c!53986 () Bool)

(assert (=> b!388829 (= c!53986 (bvslt #b00000000000000000000000000000000 (size!11351 _keys!658)))))

(declare-fun b!388830 () Bool)

(assert (=> b!388830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11351 _keys!658)))))

(assert (=> b!388830 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11352 _values!506)))))

(declare-fun apply!298 (ListLongMap!5417 (_ BitVec 64)) V!13885)

(assert (=> b!388830 (= e!235577 (= (apply!298 lt!182652 (select (arr!10999 _keys!658) #b00000000000000000000000000000000)) (get!5566 (select (arr!11000 _values!506) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!72845 c!53984) b!388820))

(assert (= (and d!72845 (not c!53984)) b!388828))

(assert (= (and b!388828 c!53985) b!388822))

(assert (= (and b!388828 (not c!53985)) b!388824))

(assert (= (or b!388822 b!388824) bm!27354))

(assert (= (and d!72845 res!222370) b!388825))

(assert (= (and b!388825 res!222368) b!388819))

(assert (= (and b!388819 res!222369) b!388827))

(assert (= (and b!388819 c!53987) b!388821))

(assert (= (and b!388819 (not c!53987)) b!388829))

(assert (= (and b!388821 res!222371) b!388830))

(assert (= (and b!388829 c!53986) b!388826))

(assert (= (and b!388829 (not c!53986)) b!388823))

(declare-fun b_lambda!8551 () Bool)

(assert (=> (not b_lambda!8551) (not b!388822)))

(declare-fun t!11514 () Bool)

(declare-fun tb!3111 () Bool)

(assert (=> (and start!37832 (= defaultEntry!514 defaultEntry!514) t!11514) tb!3111))

(declare-fun result!5713 () Bool)

(assert (=> tb!3111 (= result!5713 tp_is_empty!9585)))

(assert (=> b!388822 t!11514))

(declare-fun b_and!16171 () Bool)

(assert (= b_and!16167 (and (=> t!11514 result!5713) b_and!16171)))

(declare-fun b_lambda!8553 () Bool)

(assert (=> (not b_lambda!8553) (not b!388830)))

(assert (=> b!388830 t!11514))

(declare-fun b_and!16173 () Bool)

(assert (= b_and!16171 (and (=> t!11514 result!5713) b_and!16173)))

(declare-fun m!384835 () Bool)

(assert (=> d!72845 m!384835))

(assert (=> d!72845 m!384713))

(declare-fun m!384837 () Bool)

(assert (=> b!388821 m!384837))

(assert (=> b!388821 m!384837))

(declare-fun m!384839 () Bool)

(assert (=> b!388821 m!384839))

(declare-fun m!384841 () Bool)

(assert (=> b!388825 m!384841))

(declare-fun m!384843 () Bool)

(assert (=> b!388823 m!384843))

(assert (=> b!388827 m!384837))

(assert (=> b!388827 m!384837))

(declare-fun m!384845 () Bool)

(assert (=> b!388827 m!384845))

(declare-fun m!384847 () Bool)

(assert (=> bm!27354 m!384847))

(assert (=> b!388826 m!384847))

(assert (=> b!388830 m!384837))

(assert (=> b!388830 m!384837))

(declare-fun m!384849 () Bool)

(assert (=> b!388830 m!384849))

(declare-fun m!384851 () Bool)

(assert (=> b!388830 m!384851))

(declare-fun m!384853 () Bool)

(assert (=> b!388830 m!384853))

(assert (=> b!388830 m!384853))

(assert (=> b!388830 m!384851))

(declare-fun m!384855 () Bool)

(assert (=> b!388830 m!384855))

(assert (=> b!388822 m!384837))

(declare-fun m!384857 () Bool)

(assert (=> b!388822 m!384857))

(declare-fun m!384859 () Bool)

(assert (=> b!388822 m!384859))

(assert (=> b!388822 m!384857))

(declare-fun m!384861 () Bool)

(assert (=> b!388822 m!384861))

(assert (=> b!388822 m!384851))

(assert (=> b!388822 m!384853))

(assert (=> b!388822 m!384853))

(assert (=> b!388822 m!384851))

(assert (=> b!388822 m!384855))

(declare-fun m!384863 () Bool)

(assert (=> b!388822 m!384863))

(assert (=> b!388828 m!384837))

(assert (=> b!388828 m!384837))

(assert (=> b!388828 m!384845))

(assert (=> b!388733 d!72845))

(declare-fun bm!27369 () Bool)

(declare-fun call!27373 () Bool)

(declare-fun lt!182714 () ListLongMap!5417)

(assert (=> bm!27369 (= call!27373 (contains!2443 lt!182714 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27370 () Bool)

(declare-fun call!27375 () ListLongMap!5417)

(declare-fun call!27378 () ListLongMap!5417)

(assert (=> bm!27370 (= call!27375 call!27378)))

(declare-fun b!388875 () Bool)

(declare-fun e!235622 () Bool)

(assert (=> b!388875 (= e!235622 (= (apply!298 lt!182714 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27371 () Bool)

(declare-fun call!27376 () ListLongMap!5417)

(assert (=> bm!27371 (= call!27378 call!27376)))

(declare-fun c!54004 () Bool)

(declare-fun bm!27372 () Bool)

(declare-fun call!27372 () ListLongMap!5417)

(declare-fun c!54000 () Bool)

(assert (=> bm!27372 (= call!27372 (+!1019 (ite c!54004 call!27376 (ite c!54000 call!27378 call!27375)) (ite (or c!54004 c!54000) (tuple2!6505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!388876 () Bool)

(declare-fun e!235617 () Bool)

(assert (=> b!388876 (= e!235617 (validKeyInArray!0 (select (arr!10999 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388877 () Bool)

(declare-fun e!235615 () ListLongMap!5417)

(declare-fun call!27374 () ListLongMap!5417)

(assert (=> b!388877 (= e!235615 call!27374)))

(declare-fun b!388878 () Bool)

(declare-fun e!235618 () Bool)

(assert (=> b!388878 (= e!235618 (= (apply!298 lt!182714 (select (arr!10999 _keys!658) #b00000000000000000000000000000000)) (get!5566 (select (arr!11000 _values!506) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11352 _values!506)))))

(assert (=> b!388878 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11351 _keys!658)))))

(declare-fun b!388879 () Bool)

(declare-fun e!235619 () Bool)

(declare-fun call!27377 () Bool)

(assert (=> b!388879 (= e!235619 (not call!27377))))

(declare-fun bm!27373 () Bool)

(assert (=> bm!27373 (= call!27377 (contains!2443 lt!182714 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!388880 () Bool)

(declare-fun c!54001 () Bool)

(assert (=> b!388880 (= c!54001 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!235614 () ListLongMap!5417)

(assert (=> b!388880 (= e!235614 e!235615)))

(declare-fun b!388881 () Bool)

(declare-fun e!235621 () ListLongMap!5417)

(assert (=> b!388881 (= e!235621 (+!1019 call!27372 (tuple2!6505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!388882 () Bool)

(declare-fun e!235613 () Bool)

(assert (=> b!388882 (= e!235613 (not call!27373))))

(declare-fun b!388883 () Bool)

(declare-fun res!222396 () Bool)

(declare-fun e!235611 () Bool)

(assert (=> b!388883 (=> (not res!222396) (not e!235611))))

(assert (=> b!388883 (= res!222396 e!235619)))

(declare-fun c!54002 () Bool)

(assert (=> b!388883 (= c!54002 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!388884 () Bool)

(assert (=> b!388884 (= e!235613 e!235622)))

(declare-fun res!222393 () Bool)

(assert (=> b!388884 (= res!222393 call!27373)))

(assert (=> b!388884 (=> (not res!222393) (not e!235622))))

(declare-fun b!388885 () Bool)

(declare-fun e!235610 () Bool)

(assert (=> b!388885 (= e!235610 e!235618)))

(declare-fun res!222394 () Bool)

(assert (=> b!388885 (=> (not res!222394) (not e!235618))))

(assert (=> b!388885 (= res!222394 (contains!2443 lt!182714 (select (arr!10999 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!388885 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11351 _keys!658)))))

(declare-fun b!388886 () Bool)

(declare-fun e!235616 () Unit!11914)

(declare-fun lt!182710 () Unit!11914)

(assert (=> b!388886 (= e!235616 lt!182710)))

(declare-fun lt!182722 () ListLongMap!5417)

(assert (=> b!388886 (= lt!182722 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182708 () (_ BitVec 64))

(assert (=> b!388886 (= lt!182708 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182718 () (_ BitVec 64))

(assert (=> b!388886 (= lt!182718 (select (arr!10999 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182709 () Unit!11914)

(declare-fun addStillContains!274 (ListLongMap!5417 (_ BitVec 64) V!13885 (_ BitVec 64)) Unit!11914)

(assert (=> b!388886 (= lt!182709 (addStillContains!274 lt!182722 lt!182708 zeroValue!472 lt!182718))))

(assert (=> b!388886 (contains!2443 (+!1019 lt!182722 (tuple2!6505 lt!182708 zeroValue!472)) lt!182718)))

(declare-fun lt!182706 () Unit!11914)

(assert (=> b!388886 (= lt!182706 lt!182709)))

(declare-fun lt!182707 () ListLongMap!5417)

(assert (=> b!388886 (= lt!182707 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182713 () (_ BitVec 64))

(assert (=> b!388886 (= lt!182713 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182712 () (_ BitVec 64))

(assert (=> b!388886 (= lt!182712 (select (arr!10999 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182705 () Unit!11914)

(declare-fun addApplyDifferent!274 (ListLongMap!5417 (_ BitVec 64) V!13885 (_ BitVec 64)) Unit!11914)

(assert (=> b!388886 (= lt!182705 (addApplyDifferent!274 lt!182707 lt!182713 minValue!472 lt!182712))))

(assert (=> b!388886 (= (apply!298 (+!1019 lt!182707 (tuple2!6505 lt!182713 minValue!472)) lt!182712) (apply!298 lt!182707 lt!182712))))

(declare-fun lt!182704 () Unit!11914)

(assert (=> b!388886 (= lt!182704 lt!182705)))

(declare-fun lt!182721 () ListLongMap!5417)

(assert (=> b!388886 (= lt!182721 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182723 () (_ BitVec 64))

(assert (=> b!388886 (= lt!182723 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182716 () (_ BitVec 64))

(assert (=> b!388886 (= lt!182716 (select (arr!10999 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182720 () Unit!11914)

(assert (=> b!388886 (= lt!182720 (addApplyDifferent!274 lt!182721 lt!182723 zeroValue!472 lt!182716))))

(assert (=> b!388886 (= (apply!298 (+!1019 lt!182721 (tuple2!6505 lt!182723 zeroValue!472)) lt!182716) (apply!298 lt!182721 lt!182716))))

(declare-fun lt!182702 () Unit!11914)

(assert (=> b!388886 (= lt!182702 lt!182720)))

(declare-fun lt!182703 () ListLongMap!5417)

(assert (=> b!388886 (= lt!182703 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182715 () (_ BitVec 64))

(assert (=> b!388886 (= lt!182715 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182711 () (_ BitVec 64))

(assert (=> b!388886 (= lt!182711 (select (arr!10999 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!388886 (= lt!182710 (addApplyDifferent!274 lt!182703 lt!182715 minValue!472 lt!182711))))

(assert (=> b!388886 (= (apply!298 (+!1019 lt!182703 (tuple2!6505 lt!182715 minValue!472)) lt!182711) (apply!298 lt!182703 lt!182711))))

(declare-fun b!388887 () Bool)

(assert (=> b!388887 (= e!235611 e!235613)))

(declare-fun c!54003 () Bool)

(assert (=> b!388887 (= c!54003 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388888 () Bool)

(assert (=> b!388888 (= e!235614 call!27374)))

(declare-fun bm!27374 () Bool)

(assert (=> bm!27374 (= call!27374 call!27372)))

(declare-fun b!388889 () Bool)

(declare-fun e!235612 () Bool)

(assert (=> b!388889 (= e!235619 e!235612)))

(declare-fun res!222392 () Bool)

(assert (=> b!388889 (= res!222392 call!27377)))

(assert (=> b!388889 (=> (not res!222392) (not e!235612))))

(declare-fun b!388890 () Bool)

(assert (=> b!388890 (= e!235612 (= (apply!298 lt!182714 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!388891 () Bool)

(assert (=> b!388891 (= e!235621 e!235614)))

(assert (=> b!388891 (= c!54000 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!72847 () Bool)

(assert (=> d!72847 e!235611))

(declare-fun res!222391 () Bool)

(assert (=> d!72847 (=> (not res!222391) (not e!235611))))

(assert (=> d!72847 (= res!222391 (or (bvsge #b00000000000000000000000000000000 (size!11351 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11351 _keys!658)))))))

(declare-fun lt!182719 () ListLongMap!5417)

(assert (=> d!72847 (= lt!182714 lt!182719)))

(declare-fun lt!182717 () Unit!11914)

(assert (=> d!72847 (= lt!182717 e!235616)))

(declare-fun c!54005 () Bool)

(assert (=> d!72847 (= c!54005 e!235617)))

(declare-fun res!222398 () Bool)

(assert (=> d!72847 (=> (not res!222398) (not e!235617))))

(assert (=> d!72847 (= res!222398 (bvslt #b00000000000000000000000000000000 (size!11351 _keys!658)))))

(assert (=> d!72847 (= lt!182719 e!235621)))

(assert (=> d!72847 (= c!54004 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72847 (validMask!0 mask!970)))

(assert (=> d!72847 (= (getCurrentListMap!2073 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182714)))

(declare-fun b!388892 () Bool)

(assert (=> b!388892 (= e!235615 call!27375)))

(declare-fun b!388893 () Bool)

(declare-fun Unit!11918 () Unit!11914)

(assert (=> b!388893 (= e!235616 Unit!11918)))

(declare-fun b!388894 () Bool)

(declare-fun res!222395 () Bool)

(assert (=> b!388894 (=> (not res!222395) (not e!235611))))

(assert (=> b!388894 (= res!222395 e!235610)))

(declare-fun res!222390 () Bool)

(assert (=> b!388894 (=> res!222390 e!235610)))

(declare-fun e!235620 () Bool)

(assert (=> b!388894 (= res!222390 (not e!235620))))

(declare-fun res!222397 () Bool)

(assert (=> b!388894 (=> (not res!222397) (not e!235620))))

(assert (=> b!388894 (= res!222397 (bvslt #b00000000000000000000000000000000 (size!11351 _keys!658)))))

(declare-fun bm!27375 () Bool)

(assert (=> bm!27375 (= call!27376 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388895 () Bool)

(assert (=> b!388895 (= e!235620 (validKeyInArray!0 (select (arr!10999 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72847 c!54004) b!388881))

(assert (= (and d!72847 (not c!54004)) b!388891))

(assert (= (and b!388891 c!54000) b!388888))

(assert (= (and b!388891 (not c!54000)) b!388880))

(assert (= (and b!388880 c!54001) b!388877))

(assert (= (and b!388880 (not c!54001)) b!388892))

(assert (= (or b!388877 b!388892) bm!27370))

(assert (= (or b!388888 bm!27370) bm!27371))

(assert (= (or b!388888 b!388877) bm!27374))

(assert (= (or b!388881 bm!27371) bm!27375))

(assert (= (or b!388881 bm!27374) bm!27372))

(assert (= (and d!72847 res!222398) b!388876))

(assert (= (and d!72847 c!54005) b!388886))

(assert (= (and d!72847 (not c!54005)) b!388893))

(assert (= (and d!72847 res!222391) b!388894))

(assert (= (and b!388894 res!222397) b!388895))

(assert (= (and b!388894 (not res!222390)) b!388885))

(assert (= (and b!388885 res!222394) b!388878))

(assert (= (and b!388894 res!222395) b!388883))

(assert (= (and b!388883 c!54002) b!388889))

(assert (= (and b!388883 (not c!54002)) b!388879))

(assert (= (and b!388889 res!222392) b!388890))

(assert (= (or b!388889 b!388879) bm!27373))

(assert (= (and b!388883 res!222396) b!388887))

(assert (= (and b!388887 c!54003) b!388884))

(assert (= (and b!388887 (not c!54003)) b!388882))

(assert (= (and b!388884 res!222393) b!388875))

(assert (= (or b!388884 b!388882) bm!27369))

(declare-fun b_lambda!8555 () Bool)

(assert (=> (not b_lambda!8555) (not b!388878)))

(assert (=> b!388878 t!11514))

(declare-fun b_and!16175 () Bool)

(assert (= b_and!16173 (and (=> t!11514 result!5713) b_and!16175)))

(declare-fun m!384865 () Bool)

(assert (=> b!388881 m!384865))

(declare-fun m!384867 () Bool)

(assert (=> b!388886 m!384867))

(declare-fun m!384869 () Bool)

(assert (=> b!388886 m!384869))

(declare-fun m!384871 () Bool)

(assert (=> b!388886 m!384871))

(assert (=> b!388886 m!384837))

(declare-fun m!384873 () Bool)

(assert (=> b!388886 m!384873))

(declare-fun m!384875 () Bool)

(assert (=> b!388886 m!384875))

(declare-fun m!384877 () Bool)

(assert (=> b!388886 m!384877))

(declare-fun m!384879 () Bool)

(assert (=> b!388886 m!384879))

(assert (=> b!388886 m!384875))

(declare-fun m!384881 () Bool)

(assert (=> b!388886 m!384881))

(declare-fun m!384883 () Bool)

(assert (=> b!388886 m!384883))

(declare-fun m!384885 () Bool)

(assert (=> b!388886 m!384885))

(assert (=> b!388886 m!384867))

(declare-fun m!384887 () Bool)

(assert (=> b!388886 m!384887))

(assert (=> b!388886 m!384885))

(declare-fun m!384889 () Bool)

(assert (=> b!388886 m!384889))

(declare-fun m!384891 () Bool)

(assert (=> b!388886 m!384891))

(declare-fun m!384893 () Bool)

(assert (=> b!388886 m!384893))

(assert (=> b!388886 m!384691))

(assert (=> b!388886 m!384881))

(declare-fun m!384895 () Bool)

(assert (=> b!388886 m!384895))

(assert (=> b!388895 m!384837))

(assert (=> b!388895 m!384837))

(assert (=> b!388895 m!384845))

(assert (=> b!388878 m!384853))

(assert (=> b!388878 m!384853))

(assert (=> b!388878 m!384851))

(assert (=> b!388878 m!384855))

(assert (=> b!388878 m!384837))

(assert (=> b!388878 m!384851))

(assert (=> b!388878 m!384837))

(declare-fun m!384897 () Bool)

(assert (=> b!388878 m!384897))

(declare-fun m!384899 () Bool)

(assert (=> b!388890 m!384899))

(declare-fun m!384901 () Bool)

(assert (=> bm!27372 m!384901))

(assert (=> b!388876 m!384837))

(assert (=> b!388876 m!384837))

(assert (=> b!388876 m!384845))

(declare-fun m!384903 () Bool)

(assert (=> b!388875 m!384903))

(assert (=> d!72847 m!384713))

(assert (=> b!388885 m!384837))

(assert (=> b!388885 m!384837))

(declare-fun m!384905 () Bool)

(assert (=> b!388885 m!384905))

(declare-fun m!384907 () Bool)

(assert (=> bm!27369 m!384907))

(assert (=> bm!27375 m!384691))

(declare-fun m!384909 () Bool)

(assert (=> bm!27373 m!384909))

(assert (=> b!388733 d!72847))

(declare-fun b!388896 () Bool)

(declare-fun e!235629 () Bool)

(declare-fun e!235627 () Bool)

(assert (=> b!388896 (= e!235629 e!235627)))

(declare-fun c!54009 () Bool)

(declare-fun e!235624 () Bool)

(assert (=> b!388896 (= c!54009 e!235624)))

(declare-fun res!222400 () Bool)

(assert (=> b!388896 (=> (not res!222400) (not e!235624))))

(assert (=> b!388896 (= res!222400 (bvslt #b00000000000000000000000000000000 (size!11351 lt!182577)))))

(declare-fun b!388897 () Bool)

(declare-fun e!235628 () ListLongMap!5417)

(assert (=> b!388897 (= e!235628 (ListLongMap!5418 Nil!6354))))

(declare-fun b!388898 () Bool)

(declare-fun e!235623 () Bool)

(assert (=> b!388898 (= e!235627 e!235623)))

(assert (=> b!388898 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11351 lt!182577)))))

(declare-fun res!222402 () Bool)

(declare-fun lt!182725 () ListLongMap!5417)

(assert (=> b!388898 (= res!222402 (contains!2443 lt!182725 (select (arr!10999 lt!182577) #b00000000000000000000000000000000)))))

(assert (=> b!388898 (=> (not res!222402) (not e!235623))))

(declare-fun b!388899 () Bool)

(declare-fun lt!182729 () Unit!11914)

(declare-fun lt!182724 () Unit!11914)

(assert (=> b!388899 (= lt!182729 lt!182724)))

(declare-fun lt!182728 () (_ BitVec 64))

(declare-fun lt!182727 () ListLongMap!5417)

(declare-fun lt!182730 () V!13885)

(declare-fun lt!182726 () (_ BitVec 64))

(assert (=> b!388899 (not (contains!2443 (+!1019 lt!182727 (tuple2!6505 lt!182728 lt!182730)) lt!182726))))

(assert (=> b!388899 (= lt!182724 (addStillNotContains!131 lt!182727 lt!182728 lt!182730 lt!182726))))

(assert (=> b!388899 (= lt!182726 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!388899 (= lt!182730 (get!5566 (select (arr!11000 lt!182575) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!388899 (= lt!182728 (select (arr!10999 lt!182577) #b00000000000000000000000000000000))))

(declare-fun call!27379 () ListLongMap!5417)

(assert (=> b!388899 (= lt!182727 call!27379)))

(declare-fun e!235626 () ListLongMap!5417)

(assert (=> b!388899 (= e!235626 (+!1019 call!27379 (tuple2!6505 (select (arr!10999 lt!182577) #b00000000000000000000000000000000) (get!5566 (select (arr!11000 lt!182575) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!388900 () Bool)

(declare-fun e!235625 () Bool)

(assert (=> b!388900 (= e!235625 (isEmpty!544 lt!182725))))

(declare-fun b!388901 () Bool)

(assert (=> b!388901 (= e!235626 call!27379)))

(declare-fun b!388902 () Bool)

(declare-fun res!222399 () Bool)

(assert (=> b!388902 (=> (not res!222399) (not e!235629))))

(assert (=> b!388902 (= res!222399 (not (contains!2443 lt!182725 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun d!72849 () Bool)

(assert (=> d!72849 e!235629))

(declare-fun res!222401 () Bool)

(assert (=> d!72849 (=> (not res!222401) (not e!235629))))

(assert (=> d!72849 (= res!222401 (not (contains!2443 lt!182725 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72849 (= lt!182725 e!235628)))

(declare-fun c!54006 () Bool)

(assert (=> d!72849 (= c!54006 (bvsge #b00000000000000000000000000000000 (size!11351 lt!182577)))))

(assert (=> d!72849 (validMask!0 mask!970)))

(assert (=> d!72849 (= (getCurrentListMapNoExtraKeys!953 lt!182577 lt!182575 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182725)))

(declare-fun bm!27376 () Bool)

(assert (=> bm!27376 (= call!27379 (getCurrentListMapNoExtraKeys!953 lt!182577 lt!182575 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!388903 () Bool)

(assert (=> b!388903 (= e!235625 (= lt!182725 (getCurrentListMapNoExtraKeys!953 lt!182577 lt!182575 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!388904 () Bool)

(assert (=> b!388904 (= e!235624 (validKeyInArray!0 (select (arr!10999 lt!182577) #b00000000000000000000000000000000)))))

(assert (=> b!388904 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!388905 () Bool)

(assert (=> b!388905 (= e!235628 e!235626)))

(declare-fun c!54007 () Bool)

(assert (=> b!388905 (= c!54007 (validKeyInArray!0 (select (arr!10999 lt!182577) #b00000000000000000000000000000000)))))

(declare-fun b!388906 () Bool)

(assert (=> b!388906 (= e!235627 e!235625)))

(declare-fun c!54008 () Bool)

(assert (=> b!388906 (= c!54008 (bvslt #b00000000000000000000000000000000 (size!11351 lt!182577)))))

(declare-fun b!388907 () Bool)

(assert (=> b!388907 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11351 lt!182577)))))

(assert (=> b!388907 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11352 lt!182575)))))

(assert (=> b!388907 (= e!235623 (= (apply!298 lt!182725 (select (arr!10999 lt!182577) #b00000000000000000000000000000000)) (get!5566 (select (arr!11000 lt!182575) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (= (and d!72849 c!54006) b!388897))

(assert (= (and d!72849 (not c!54006)) b!388905))

(assert (= (and b!388905 c!54007) b!388899))

(assert (= (and b!388905 (not c!54007)) b!388901))

(assert (= (or b!388899 b!388901) bm!27376))

(assert (= (and d!72849 res!222401) b!388902))

(assert (= (and b!388902 res!222399) b!388896))

(assert (= (and b!388896 res!222400) b!388904))

(assert (= (and b!388896 c!54009) b!388898))

(assert (= (and b!388896 (not c!54009)) b!388906))

(assert (= (and b!388898 res!222402) b!388907))

(assert (= (and b!388906 c!54008) b!388903))

(assert (= (and b!388906 (not c!54008)) b!388900))

(declare-fun b_lambda!8557 () Bool)

(assert (=> (not b_lambda!8557) (not b!388899)))

(assert (=> b!388899 t!11514))

(declare-fun b_and!16177 () Bool)

(assert (= b_and!16175 (and (=> t!11514 result!5713) b_and!16177)))

(declare-fun b_lambda!8559 () Bool)

(assert (=> (not b_lambda!8559) (not b!388907)))

(assert (=> b!388907 t!11514))

(declare-fun b_and!16179 () Bool)

(assert (= b_and!16177 (and (=> t!11514 result!5713) b_and!16179)))

(declare-fun m!384911 () Bool)

(assert (=> d!72849 m!384911))

(assert (=> d!72849 m!384713))

(declare-fun m!384913 () Bool)

(assert (=> b!388898 m!384913))

(assert (=> b!388898 m!384913))

(declare-fun m!384915 () Bool)

(assert (=> b!388898 m!384915))

(declare-fun m!384917 () Bool)

(assert (=> b!388902 m!384917))

(declare-fun m!384919 () Bool)

(assert (=> b!388900 m!384919))

(assert (=> b!388904 m!384913))

(assert (=> b!388904 m!384913))

(declare-fun m!384921 () Bool)

(assert (=> b!388904 m!384921))

(declare-fun m!384923 () Bool)

(assert (=> bm!27376 m!384923))

(assert (=> b!388903 m!384923))

(assert (=> b!388907 m!384913))

(assert (=> b!388907 m!384913))

(declare-fun m!384925 () Bool)

(assert (=> b!388907 m!384925))

(assert (=> b!388907 m!384851))

(declare-fun m!384927 () Bool)

(assert (=> b!388907 m!384927))

(assert (=> b!388907 m!384927))

(assert (=> b!388907 m!384851))

(declare-fun m!384929 () Bool)

(assert (=> b!388907 m!384929))

(assert (=> b!388899 m!384913))

(declare-fun m!384931 () Bool)

(assert (=> b!388899 m!384931))

(declare-fun m!384933 () Bool)

(assert (=> b!388899 m!384933))

(assert (=> b!388899 m!384931))

(declare-fun m!384935 () Bool)

(assert (=> b!388899 m!384935))

(assert (=> b!388899 m!384851))

(assert (=> b!388899 m!384927))

(assert (=> b!388899 m!384927))

(assert (=> b!388899 m!384851))

(assert (=> b!388899 m!384929))

(declare-fun m!384937 () Bool)

(assert (=> b!388899 m!384937))

(assert (=> b!388905 m!384913))

(assert (=> b!388905 m!384913))

(assert (=> b!388905 m!384921))

(assert (=> b!388733 d!72849))

(declare-fun bm!27377 () Bool)

(declare-fun call!27381 () Bool)

(declare-fun lt!182743 () ListLongMap!5417)

(assert (=> bm!27377 (= call!27381 (contains!2443 lt!182743 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27378 () Bool)

(declare-fun call!27383 () ListLongMap!5417)

(declare-fun call!27386 () ListLongMap!5417)

(assert (=> bm!27378 (= call!27383 call!27386)))

(declare-fun b!388908 () Bool)

(declare-fun e!235642 () Bool)

(assert (=> b!388908 (= e!235642 (= (apply!298 lt!182743 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27379 () Bool)

(declare-fun call!27384 () ListLongMap!5417)

(assert (=> bm!27379 (= call!27386 call!27384)))

(declare-fun call!27380 () ListLongMap!5417)

(declare-fun c!54014 () Bool)

(declare-fun bm!27380 () Bool)

(declare-fun c!54010 () Bool)

(assert (=> bm!27380 (= call!27380 (+!1019 (ite c!54014 call!27384 (ite c!54010 call!27386 call!27383)) (ite (or c!54014 c!54010) (tuple2!6505 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!388909 () Bool)

(declare-fun e!235637 () Bool)

(assert (=> b!388909 (= e!235637 (validKeyInArray!0 (select (arr!10999 lt!182577) #b00000000000000000000000000000000)))))

(declare-fun b!388910 () Bool)

(declare-fun e!235635 () ListLongMap!5417)

(declare-fun call!27382 () ListLongMap!5417)

(assert (=> b!388910 (= e!235635 call!27382)))

(declare-fun e!235638 () Bool)

(declare-fun b!388911 () Bool)

(assert (=> b!388911 (= e!235638 (= (apply!298 lt!182743 (select (arr!10999 lt!182577) #b00000000000000000000000000000000)) (get!5566 (select (arr!11000 lt!182575) #b00000000000000000000000000000000) (dynLambda!641 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388911 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11352 lt!182575)))))

(assert (=> b!388911 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11351 lt!182577)))))

(declare-fun b!388912 () Bool)

(declare-fun e!235639 () Bool)

(declare-fun call!27385 () Bool)

(assert (=> b!388912 (= e!235639 (not call!27385))))

(declare-fun bm!27381 () Bool)

(assert (=> bm!27381 (= call!27385 (contains!2443 lt!182743 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!388913 () Bool)

(declare-fun c!54011 () Bool)

(assert (=> b!388913 (= c!54011 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!235634 () ListLongMap!5417)

(assert (=> b!388913 (= e!235634 e!235635)))

(declare-fun b!388914 () Bool)

(declare-fun e!235641 () ListLongMap!5417)

(assert (=> b!388914 (= e!235641 (+!1019 call!27380 (tuple2!6505 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!388915 () Bool)

(declare-fun e!235633 () Bool)

(assert (=> b!388915 (= e!235633 (not call!27381))))

(declare-fun b!388916 () Bool)

(declare-fun res!222409 () Bool)

(declare-fun e!235631 () Bool)

(assert (=> b!388916 (=> (not res!222409) (not e!235631))))

(assert (=> b!388916 (= res!222409 e!235639)))

(declare-fun c!54012 () Bool)

(assert (=> b!388916 (= c!54012 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!388917 () Bool)

(assert (=> b!388917 (= e!235633 e!235642)))

(declare-fun res!222406 () Bool)

(assert (=> b!388917 (= res!222406 call!27381)))

(assert (=> b!388917 (=> (not res!222406) (not e!235642))))

(declare-fun b!388918 () Bool)

(declare-fun e!235630 () Bool)

(assert (=> b!388918 (= e!235630 e!235638)))

(declare-fun res!222407 () Bool)

(assert (=> b!388918 (=> (not res!222407) (not e!235638))))

(assert (=> b!388918 (= res!222407 (contains!2443 lt!182743 (select (arr!10999 lt!182577) #b00000000000000000000000000000000)))))

(assert (=> b!388918 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11351 lt!182577)))))

(declare-fun b!388919 () Bool)

(declare-fun e!235636 () Unit!11914)

(declare-fun lt!182739 () Unit!11914)

(assert (=> b!388919 (= e!235636 lt!182739)))

(declare-fun lt!182751 () ListLongMap!5417)

(assert (=> b!388919 (= lt!182751 (getCurrentListMapNoExtraKeys!953 lt!182577 lt!182575 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182737 () (_ BitVec 64))

(assert (=> b!388919 (= lt!182737 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182747 () (_ BitVec 64))

(assert (=> b!388919 (= lt!182747 (select (arr!10999 lt!182577) #b00000000000000000000000000000000))))

(declare-fun lt!182738 () Unit!11914)

(assert (=> b!388919 (= lt!182738 (addStillContains!274 lt!182751 lt!182737 zeroValue!472 lt!182747))))

(assert (=> b!388919 (contains!2443 (+!1019 lt!182751 (tuple2!6505 lt!182737 zeroValue!472)) lt!182747)))

(declare-fun lt!182735 () Unit!11914)

(assert (=> b!388919 (= lt!182735 lt!182738)))

(declare-fun lt!182736 () ListLongMap!5417)

(assert (=> b!388919 (= lt!182736 (getCurrentListMapNoExtraKeys!953 lt!182577 lt!182575 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182742 () (_ BitVec 64))

(assert (=> b!388919 (= lt!182742 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182741 () (_ BitVec 64))

(assert (=> b!388919 (= lt!182741 (select (arr!10999 lt!182577) #b00000000000000000000000000000000))))

(declare-fun lt!182734 () Unit!11914)

(assert (=> b!388919 (= lt!182734 (addApplyDifferent!274 lt!182736 lt!182742 minValue!472 lt!182741))))

(assert (=> b!388919 (= (apply!298 (+!1019 lt!182736 (tuple2!6505 lt!182742 minValue!472)) lt!182741) (apply!298 lt!182736 lt!182741))))

(declare-fun lt!182733 () Unit!11914)

(assert (=> b!388919 (= lt!182733 lt!182734)))

(declare-fun lt!182750 () ListLongMap!5417)

(assert (=> b!388919 (= lt!182750 (getCurrentListMapNoExtraKeys!953 lt!182577 lt!182575 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182752 () (_ BitVec 64))

(assert (=> b!388919 (= lt!182752 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182745 () (_ BitVec 64))

(assert (=> b!388919 (= lt!182745 (select (arr!10999 lt!182577) #b00000000000000000000000000000000))))

(declare-fun lt!182749 () Unit!11914)

(assert (=> b!388919 (= lt!182749 (addApplyDifferent!274 lt!182750 lt!182752 zeroValue!472 lt!182745))))

(assert (=> b!388919 (= (apply!298 (+!1019 lt!182750 (tuple2!6505 lt!182752 zeroValue!472)) lt!182745) (apply!298 lt!182750 lt!182745))))

(declare-fun lt!182731 () Unit!11914)

(assert (=> b!388919 (= lt!182731 lt!182749)))

(declare-fun lt!182732 () ListLongMap!5417)

(assert (=> b!388919 (= lt!182732 (getCurrentListMapNoExtraKeys!953 lt!182577 lt!182575 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182744 () (_ BitVec 64))

(assert (=> b!388919 (= lt!182744 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!182740 () (_ BitVec 64))

(assert (=> b!388919 (= lt!182740 (select (arr!10999 lt!182577) #b00000000000000000000000000000000))))

(assert (=> b!388919 (= lt!182739 (addApplyDifferent!274 lt!182732 lt!182744 minValue!472 lt!182740))))

(assert (=> b!388919 (= (apply!298 (+!1019 lt!182732 (tuple2!6505 lt!182744 minValue!472)) lt!182740) (apply!298 lt!182732 lt!182740))))

(declare-fun b!388920 () Bool)

(assert (=> b!388920 (= e!235631 e!235633)))

(declare-fun c!54013 () Bool)

(assert (=> b!388920 (= c!54013 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!388921 () Bool)

(assert (=> b!388921 (= e!235634 call!27382)))

(declare-fun bm!27382 () Bool)

(assert (=> bm!27382 (= call!27382 call!27380)))

(declare-fun b!388922 () Bool)

(declare-fun e!235632 () Bool)

(assert (=> b!388922 (= e!235639 e!235632)))

(declare-fun res!222405 () Bool)

(assert (=> b!388922 (= res!222405 call!27385)))

(assert (=> b!388922 (=> (not res!222405) (not e!235632))))

(declare-fun b!388923 () Bool)

(assert (=> b!388923 (= e!235632 (= (apply!298 lt!182743 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!388924 () Bool)

(assert (=> b!388924 (= e!235641 e!235634)))

(assert (=> b!388924 (= c!54010 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!72851 () Bool)

(assert (=> d!72851 e!235631))

(declare-fun res!222404 () Bool)

(assert (=> d!72851 (=> (not res!222404) (not e!235631))))

(assert (=> d!72851 (= res!222404 (or (bvsge #b00000000000000000000000000000000 (size!11351 lt!182577)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11351 lt!182577)))))))

(declare-fun lt!182748 () ListLongMap!5417)

(assert (=> d!72851 (= lt!182743 lt!182748)))

(declare-fun lt!182746 () Unit!11914)

(assert (=> d!72851 (= lt!182746 e!235636)))

(declare-fun c!54015 () Bool)

(assert (=> d!72851 (= c!54015 e!235637)))

(declare-fun res!222411 () Bool)

(assert (=> d!72851 (=> (not res!222411) (not e!235637))))

(assert (=> d!72851 (= res!222411 (bvslt #b00000000000000000000000000000000 (size!11351 lt!182577)))))

(assert (=> d!72851 (= lt!182748 e!235641)))

(assert (=> d!72851 (= c!54014 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72851 (validMask!0 mask!970)))

(assert (=> d!72851 (= (getCurrentListMap!2073 lt!182577 lt!182575 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!182743)))

(declare-fun b!388925 () Bool)

(assert (=> b!388925 (= e!235635 call!27383)))

(declare-fun b!388926 () Bool)

(declare-fun Unit!11919 () Unit!11914)

(assert (=> b!388926 (= e!235636 Unit!11919)))

(declare-fun b!388927 () Bool)

(declare-fun res!222408 () Bool)

(assert (=> b!388927 (=> (not res!222408) (not e!235631))))

(assert (=> b!388927 (= res!222408 e!235630)))

(declare-fun res!222403 () Bool)

(assert (=> b!388927 (=> res!222403 e!235630)))

(declare-fun e!235640 () Bool)

(assert (=> b!388927 (= res!222403 (not e!235640))))

(declare-fun res!222410 () Bool)

(assert (=> b!388927 (=> (not res!222410) (not e!235640))))

(assert (=> b!388927 (= res!222410 (bvslt #b00000000000000000000000000000000 (size!11351 lt!182577)))))

(declare-fun bm!27383 () Bool)

(assert (=> bm!27383 (= call!27384 (getCurrentListMapNoExtraKeys!953 lt!182577 lt!182575 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388928 () Bool)

(assert (=> b!388928 (= e!235640 (validKeyInArray!0 (select (arr!10999 lt!182577) #b00000000000000000000000000000000)))))

(assert (= (and d!72851 c!54014) b!388914))

(assert (= (and d!72851 (not c!54014)) b!388924))

(assert (= (and b!388924 c!54010) b!388921))

(assert (= (and b!388924 (not c!54010)) b!388913))

(assert (= (and b!388913 c!54011) b!388910))

(assert (= (and b!388913 (not c!54011)) b!388925))

(assert (= (or b!388910 b!388925) bm!27378))

(assert (= (or b!388921 bm!27378) bm!27379))

(assert (= (or b!388921 b!388910) bm!27382))

(assert (= (or b!388914 bm!27379) bm!27383))

(assert (= (or b!388914 bm!27382) bm!27380))

(assert (= (and d!72851 res!222411) b!388909))

(assert (= (and d!72851 c!54015) b!388919))

(assert (= (and d!72851 (not c!54015)) b!388926))

(assert (= (and d!72851 res!222404) b!388927))

(assert (= (and b!388927 res!222410) b!388928))

(assert (= (and b!388927 (not res!222403)) b!388918))

(assert (= (and b!388918 res!222407) b!388911))

(assert (= (and b!388927 res!222408) b!388916))

(assert (= (and b!388916 c!54012) b!388922))

(assert (= (and b!388916 (not c!54012)) b!388912))

(assert (= (and b!388922 res!222405) b!388923))

(assert (= (or b!388922 b!388912) bm!27381))

(assert (= (and b!388916 res!222409) b!388920))

(assert (= (and b!388920 c!54013) b!388917))

(assert (= (and b!388920 (not c!54013)) b!388915))

(assert (= (and b!388917 res!222406) b!388908))

(assert (= (or b!388917 b!388915) bm!27377))

(declare-fun b_lambda!8561 () Bool)

(assert (=> (not b_lambda!8561) (not b!388911)))

(assert (=> b!388911 t!11514))

(declare-fun b_and!16181 () Bool)

(assert (= b_and!16179 (and (=> t!11514 result!5713) b_and!16181)))

(declare-fun m!384939 () Bool)

(assert (=> b!388914 m!384939))

(declare-fun m!384941 () Bool)

(assert (=> b!388919 m!384941))

(declare-fun m!384943 () Bool)

(assert (=> b!388919 m!384943))

(declare-fun m!384945 () Bool)

(assert (=> b!388919 m!384945))

(assert (=> b!388919 m!384913))

(declare-fun m!384947 () Bool)

(assert (=> b!388919 m!384947))

(declare-fun m!384949 () Bool)

(assert (=> b!388919 m!384949))

(declare-fun m!384951 () Bool)

(assert (=> b!388919 m!384951))

(declare-fun m!384953 () Bool)

(assert (=> b!388919 m!384953))

(assert (=> b!388919 m!384949))

(declare-fun m!384955 () Bool)

(assert (=> b!388919 m!384955))

(declare-fun m!384957 () Bool)

(assert (=> b!388919 m!384957))

(declare-fun m!384959 () Bool)

(assert (=> b!388919 m!384959))

(assert (=> b!388919 m!384941))

(declare-fun m!384961 () Bool)

(assert (=> b!388919 m!384961))

(assert (=> b!388919 m!384959))

(declare-fun m!384963 () Bool)

(assert (=> b!388919 m!384963))

(declare-fun m!384965 () Bool)

(assert (=> b!388919 m!384965))

(declare-fun m!384967 () Bool)

(assert (=> b!388919 m!384967))

(assert (=> b!388919 m!384697))

(assert (=> b!388919 m!384955))

(declare-fun m!384969 () Bool)

(assert (=> b!388919 m!384969))

(assert (=> b!388928 m!384913))

(assert (=> b!388928 m!384913))

(assert (=> b!388928 m!384921))

(assert (=> b!388911 m!384927))

(assert (=> b!388911 m!384927))

(assert (=> b!388911 m!384851))

(assert (=> b!388911 m!384929))

(assert (=> b!388911 m!384913))

(assert (=> b!388911 m!384851))

(assert (=> b!388911 m!384913))

(declare-fun m!384971 () Bool)

(assert (=> b!388911 m!384971))

(declare-fun m!384973 () Bool)

(assert (=> b!388923 m!384973))

(declare-fun m!384975 () Bool)

(assert (=> bm!27380 m!384975))

(assert (=> b!388909 m!384913))

(assert (=> b!388909 m!384913))

(assert (=> b!388909 m!384921))

(declare-fun m!384977 () Bool)

(assert (=> b!388908 m!384977))

(assert (=> d!72851 m!384713))

(assert (=> b!388918 m!384913))

(assert (=> b!388918 m!384913))

(declare-fun m!384979 () Bool)

(assert (=> b!388918 m!384979))

(declare-fun m!384981 () Bool)

(assert (=> bm!27377 m!384981))

(assert (=> bm!27383 m!384697))

(declare-fun m!384983 () Bool)

(assert (=> bm!27381 m!384983))

(assert (=> b!388733 d!72851))

(declare-fun bm!27388 () Bool)

(declare-fun call!27392 () ListLongMap!5417)

(assert (=> bm!27388 (= call!27392 (getCurrentListMapNoExtraKeys!953 (array!23064 (store (arr!10999 _keys!658) i!548 k0!778) (size!11351 _keys!658)) (array!23066 (store (arr!11000 _values!506) i!548 (ValueCellFull!4449 v!373)) (size!11352 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun call!27391 () ListLongMap!5417)

(declare-fun bm!27389 () Bool)

(assert (=> bm!27389 (= call!27391 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun d!72853 () Bool)

(declare-fun e!235648 () Bool)

(assert (=> d!72853 e!235648))

(declare-fun res!222414 () Bool)

(assert (=> d!72853 (=> (not res!222414) (not e!235648))))

(assert (=> d!72853 (= res!222414 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11351 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11352 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11351 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11352 _values!506))))))))

(declare-fun lt!182755 () Unit!11914)

(declare-fun choose!1312 (array!23063 array!23065 (_ BitVec 32) (_ BitVec 32) V!13885 V!13885 (_ BitVec 32) (_ BitVec 64) V!13885 (_ BitVec 32) Int) Unit!11914)

(assert (=> d!72853 (= lt!182755 (choose!1312 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72853 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11351 _keys!658)))))

(assert (=> d!72853 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!237 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!182755)))

(declare-fun e!235647 () Bool)

(declare-fun b!388935 () Bool)

(assert (=> b!388935 (= e!235647 (= call!27392 (+!1019 call!27391 (tuple2!6505 k0!778 v!373))))))

(declare-fun b!388936 () Bool)

(assert (=> b!388936 (= e!235648 e!235647)))

(declare-fun c!54018 () Bool)

(assert (=> b!388936 (= c!54018 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun b!388937 () Bool)

(assert (=> b!388937 (= e!235647 (= call!27392 call!27391))))

(assert (= (and d!72853 res!222414) b!388936))

(assert (= (and b!388936 c!54018) b!388935))

(assert (= (and b!388936 (not c!54018)) b!388937))

(assert (= (or b!388935 b!388937) bm!27389))

(assert (= (or b!388935 b!388937) bm!27388))

(assert (=> bm!27388 m!384689))

(assert (=> bm!27388 m!384703))

(declare-fun m!384985 () Bool)

(assert (=> bm!27388 m!384985))

(assert (=> bm!27389 m!384691))

(declare-fun m!384987 () Bool)

(assert (=> d!72853 m!384987))

(declare-fun m!384989 () Bool)

(assert (=> b!388935 m!384989))

(assert (=> b!388733 d!72853))

(declare-fun d!72855 () Bool)

(declare-fun res!222419 () Bool)

(declare-fun e!235653 () Bool)

(assert (=> d!72855 (=> res!222419 e!235653)))

(assert (=> d!72855 (= res!222419 (= (select (arr!10999 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72855 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!235653)))

(declare-fun b!388942 () Bool)

(declare-fun e!235654 () Bool)

(assert (=> b!388942 (= e!235653 e!235654)))

(declare-fun res!222420 () Bool)

(assert (=> b!388942 (=> (not res!222420) (not e!235654))))

(assert (=> b!388942 (= res!222420 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11351 _keys!658)))))

(declare-fun b!388943 () Bool)

(assert (=> b!388943 (= e!235654 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72855 (not res!222419)) b!388942))

(assert (= (and b!388942 res!222420) b!388943))

(assert (=> d!72855 m!384837))

(declare-fun m!384991 () Bool)

(assert (=> b!388943 m!384991))

(assert (=> b!388737 d!72855))

(declare-fun b!388952 () Bool)

(declare-fun e!235662 () Bool)

(declare-fun call!27395 () Bool)

(assert (=> b!388952 (= e!235662 call!27395)))

(declare-fun b!388953 () Bool)

(declare-fun e!235661 () Bool)

(assert (=> b!388953 (= e!235661 call!27395)))

(declare-fun d!72857 () Bool)

(declare-fun res!222425 () Bool)

(declare-fun e!235663 () Bool)

(assert (=> d!72857 (=> res!222425 e!235663)))

(assert (=> d!72857 (= res!222425 (bvsge #b00000000000000000000000000000000 (size!11351 lt!182577)))))

(assert (=> d!72857 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182577 mask!970) e!235663)))

(declare-fun b!388954 () Bool)

(assert (=> b!388954 (= e!235662 e!235661)))

(declare-fun lt!182762 () (_ BitVec 64))

(assert (=> b!388954 (= lt!182762 (select (arr!10999 lt!182577) #b00000000000000000000000000000000))))

(declare-fun lt!182764 () Unit!11914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23063 (_ BitVec 64) (_ BitVec 32)) Unit!11914)

(assert (=> b!388954 (= lt!182764 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!182577 lt!182762 #b00000000000000000000000000000000))))

(assert (=> b!388954 (arrayContainsKey!0 lt!182577 lt!182762 #b00000000000000000000000000000000)))

(declare-fun lt!182763 () Unit!11914)

(assert (=> b!388954 (= lt!182763 lt!182764)))

(declare-fun res!222426 () Bool)

(declare-datatypes ((SeekEntryResult!3509 0))(
  ( (MissingZero!3509 (index!16215 (_ BitVec 32))) (Found!3509 (index!16216 (_ BitVec 32))) (Intermediate!3509 (undefined!4321 Bool) (index!16217 (_ BitVec 32)) (x!38201 (_ BitVec 32))) (Undefined!3509) (MissingVacant!3509 (index!16218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23063 (_ BitVec 32)) SeekEntryResult!3509)

(assert (=> b!388954 (= res!222426 (= (seekEntryOrOpen!0 (select (arr!10999 lt!182577) #b00000000000000000000000000000000) lt!182577 mask!970) (Found!3509 #b00000000000000000000000000000000)))))

(assert (=> b!388954 (=> (not res!222426) (not e!235661))))

(declare-fun bm!27392 () Bool)

(assert (=> bm!27392 (= call!27395 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!182577 mask!970))))

(declare-fun b!388955 () Bool)

(assert (=> b!388955 (= e!235663 e!235662)))

(declare-fun c!54021 () Bool)

(assert (=> b!388955 (= c!54021 (validKeyInArray!0 (select (arr!10999 lt!182577) #b00000000000000000000000000000000)))))

(assert (= (and d!72857 (not res!222425)) b!388955))

(assert (= (and b!388955 c!54021) b!388954))

(assert (= (and b!388955 (not c!54021)) b!388952))

(assert (= (and b!388954 res!222426) b!388953))

(assert (= (or b!388953 b!388952) bm!27392))

(assert (=> b!388954 m!384913))

(declare-fun m!384993 () Bool)

(assert (=> b!388954 m!384993))

(declare-fun m!384995 () Bool)

(assert (=> b!388954 m!384995))

(assert (=> b!388954 m!384913))

(declare-fun m!384997 () Bool)

(assert (=> b!388954 m!384997))

(declare-fun m!384999 () Bool)

(assert (=> bm!27392 m!384999))

(assert (=> b!388955 m!384913))

(assert (=> b!388955 m!384913))

(assert (=> b!388955 m!384921))

(assert (=> b!388731 d!72857))

(declare-fun d!72859 () Bool)

(assert (=> d!72859 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37832 d!72859))

(declare-fun d!72861 () Bool)

(assert (=> d!72861 (= (array_inv!8086 _values!506) (bvsge (size!11352 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37832 d!72861))

(declare-fun d!72863 () Bool)

(assert (=> d!72863 (= (array_inv!8087 _keys!658) (bvsge (size!11351 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37832 d!72863))

(declare-fun b!388966 () Bool)

(declare-fun e!235673 () Bool)

(declare-fun e!235675 () Bool)

(assert (=> b!388966 (= e!235673 e!235675)))

(declare-fun c!54024 () Bool)

(assert (=> b!388966 (= c!54024 (validKeyInArray!0 (select (arr!10999 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27395 () Bool)

(declare-fun call!27398 () Bool)

(assert (=> bm!27395 (= call!27398 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54024 (Cons!6354 (select (arr!10999 _keys!658) #b00000000000000000000000000000000) Nil!6355) Nil!6355)))))

(declare-fun b!388967 () Bool)

(assert (=> b!388967 (= e!235675 call!27398)))

(declare-fun d!72865 () Bool)

(declare-fun res!222433 () Bool)

(declare-fun e!235674 () Bool)

(assert (=> d!72865 (=> res!222433 e!235674)))

(assert (=> d!72865 (= res!222433 (bvsge #b00000000000000000000000000000000 (size!11351 _keys!658)))))

(assert (=> d!72865 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6355) e!235674)))

(declare-fun b!388968 () Bool)

(assert (=> b!388968 (= e!235674 e!235673)))

(declare-fun res!222434 () Bool)

(assert (=> b!388968 (=> (not res!222434) (not e!235673))))

(declare-fun e!235672 () Bool)

(assert (=> b!388968 (= res!222434 (not e!235672))))

(declare-fun res!222435 () Bool)

(assert (=> b!388968 (=> (not res!222435) (not e!235672))))

(assert (=> b!388968 (= res!222435 (validKeyInArray!0 (select (arr!10999 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388969 () Bool)

(declare-fun contains!2445 (List!6358 (_ BitVec 64)) Bool)

(assert (=> b!388969 (= e!235672 (contains!2445 Nil!6355 (select (arr!10999 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!388970 () Bool)

(assert (=> b!388970 (= e!235675 call!27398)))

(assert (= (and d!72865 (not res!222433)) b!388968))

(assert (= (and b!388968 res!222435) b!388969))

(assert (= (and b!388968 res!222434) b!388966))

(assert (= (and b!388966 c!54024) b!388970))

(assert (= (and b!388966 (not c!54024)) b!388967))

(assert (= (or b!388970 b!388967) bm!27395))

(assert (=> b!388966 m!384837))

(assert (=> b!388966 m!384837))

(assert (=> b!388966 m!384845))

(assert (=> bm!27395 m!384837))

(declare-fun m!385001 () Bool)

(assert (=> bm!27395 m!385001))

(assert (=> b!388968 m!384837))

(assert (=> b!388968 m!384837))

(assert (=> b!388968 m!384845))

(assert (=> b!388969 m!384837))

(assert (=> b!388969 m!384837))

(declare-fun m!385003 () Bool)

(assert (=> b!388969 m!385003))

(assert (=> b!388730 d!72865))

(declare-fun b!388971 () Bool)

(declare-fun e!235677 () Bool)

(declare-fun call!27399 () Bool)

(assert (=> b!388971 (= e!235677 call!27399)))

(declare-fun b!388972 () Bool)

(declare-fun e!235676 () Bool)

(assert (=> b!388972 (= e!235676 call!27399)))

(declare-fun d!72867 () Bool)

(declare-fun res!222436 () Bool)

(declare-fun e!235678 () Bool)

(assert (=> d!72867 (=> res!222436 e!235678)))

(assert (=> d!72867 (= res!222436 (bvsge #b00000000000000000000000000000000 (size!11351 _keys!658)))))

(assert (=> d!72867 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!235678)))

(declare-fun b!388973 () Bool)

(assert (=> b!388973 (= e!235677 e!235676)))

(declare-fun lt!182765 () (_ BitVec 64))

(assert (=> b!388973 (= lt!182765 (select (arr!10999 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!182767 () Unit!11914)

(assert (=> b!388973 (= lt!182767 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!182765 #b00000000000000000000000000000000))))

(assert (=> b!388973 (arrayContainsKey!0 _keys!658 lt!182765 #b00000000000000000000000000000000)))

(declare-fun lt!182766 () Unit!11914)

(assert (=> b!388973 (= lt!182766 lt!182767)))

(declare-fun res!222437 () Bool)

(assert (=> b!388973 (= res!222437 (= (seekEntryOrOpen!0 (select (arr!10999 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3509 #b00000000000000000000000000000000)))))

(assert (=> b!388973 (=> (not res!222437) (not e!235676))))

(declare-fun bm!27396 () Bool)

(assert (=> bm!27396 (= call!27399 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!388974 () Bool)

(assert (=> b!388974 (= e!235678 e!235677)))

(declare-fun c!54025 () Bool)

(assert (=> b!388974 (= c!54025 (validKeyInArray!0 (select (arr!10999 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!72867 (not res!222436)) b!388974))

(assert (= (and b!388974 c!54025) b!388973))

(assert (= (and b!388974 (not c!54025)) b!388971))

(assert (= (and b!388973 res!222437) b!388972))

(assert (= (or b!388972 b!388971) bm!27396))

(assert (=> b!388973 m!384837))

(declare-fun m!385005 () Bool)

(assert (=> b!388973 m!385005))

(declare-fun m!385007 () Bool)

(assert (=> b!388973 m!385007))

(assert (=> b!388973 m!384837))

(declare-fun m!385009 () Bool)

(assert (=> b!388973 m!385009))

(declare-fun m!385011 () Bool)

(assert (=> bm!27396 m!385011))

(assert (=> b!388974 m!384837))

(assert (=> b!388974 m!384837))

(assert (=> b!388974 m!384845))

(assert (=> b!388738 d!72867))

(declare-fun d!72869 () Bool)

(assert (=> d!72869 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!388728 d!72869))

(declare-fun b!388975 () Bool)

(declare-fun e!235680 () Bool)

(declare-fun e!235682 () Bool)

(assert (=> b!388975 (= e!235680 e!235682)))

(declare-fun c!54026 () Bool)

(assert (=> b!388975 (= c!54026 (validKeyInArray!0 (select (arr!10999 lt!182577) #b00000000000000000000000000000000)))))

(declare-fun bm!27397 () Bool)

(declare-fun call!27400 () Bool)

(assert (=> bm!27397 (= call!27400 (arrayNoDuplicates!0 lt!182577 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54026 (Cons!6354 (select (arr!10999 lt!182577) #b00000000000000000000000000000000) Nil!6355) Nil!6355)))))

(declare-fun b!388976 () Bool)

(assert (=> b!388976 (= e!235682 call!27400)))

(declare-fun d!72871 () Bool)

(declare-fun res!222438 () Bool)

(declare-fun e!235681 () Bool)

(assert (=> d!72871 (=> res!222438 e!235681)))

(assert (=> d!72871 (= res!222438 (bvsge #b00000000000000000000000000000000 (size!11351 lt!182577)))))

(assert (=> d!72871 (= (arrayNoDuplicates!0 lt!182577 #b00000000000000000000000000000000 Nil!6355) e!235681)))

(declare-fun b!388977 () Bool)

(assert (=> b!388977 (= e!235681 e!235680)))

(declare-fun res!222439 () Bool)

(assert (=> b!388977 (=> (not res!222439) (not e!235680))))

(declare-fun e!235679 () Bool)

(assert (=> b!388977 (= res!222439 (not e!235679))))

(declare-fun res!222440 () Bool)

(assert (=> b!388977 (=> (not res!222440) (not e!235679))))

(assert (=> b!388977 (= res!222440 (validKeyInArray!0 (select (arr!10999 lt!182577) #b00000000000000000000000000000000)))))

(declare-fun b!388978 () Bool)

(assert (=> b!388978 (= e!235679 (contains!2445 Nil!6355 (select (arr!10999 lt!182577) #b00000000000000000000000000000000)))))

(declare-fun b!388979 () Bool)

(assert (=> b!388979 (= e!235682 call!27400)))

(assert (= (and d!72871 (not res!222438)) b!388977))

(assert (= (and b!388977 res!222440) b!388978))

(assert (= (and b!388977 res!222439) b!388975))

(assert (= (and b!388975 c!54026) b!388979))

(assert (= (and b!388975 (not c!54026)) b!388976))

(assert (= (or b!388979 b!388976) bm!27397))

(assert (=> b!388975 m!384913))

(assert (=> b!388975 m!384913))

(assert (=> b!388975 m!384921))

(assert (=> bm!27397 m!384913))

(declare-fun m!385013 () Bool)

(assert (=> bm!27397 m!385013))

(assert (=> b!388977 m!384913))

(assert (=> b!388977 m!384913))

(assert (=> b!388977 m!384921))

(assert (=> b!388978 m!384913))

(assert (=> b!388978 m!384913))

(declare-fun m!385015 () Bool)

(assert (=> b!388978 m!385015))

(assert (=> b!388729 d!72871))

(declare-fun b!388987 () Bool)

(declare-fun e!235687 () Bool)

(assert (=> b!388987 (= e!235687 tp_is_empty!9585)))

(declare-fun mapIsEmpty!15951 () Bool)

(declare-fun mapRes!15951 () Bool)

(assert (=> mapIsEmpty!15951 mapRes!15951))

(declare-fun mapNonEmpty!15951 () Bool)

(declare-fun tp!31503 () Bool)

(declare-fun e!235688 () Bool)

(assert (=> mapNonEmpty!15951 (= mapRes!15951 (and tp!31503 e!235688))))

(declare-fun mapRest!15951 () (Array (_ BitVec 32) ValueCell!4449))

(declare-fun mapValue!15951 () ValueCell!4449)

(declare-fun mapKey!15951 () (_ BitVec 32))

(assert (=> mapNonEmpty!15951 (= mapRest!15945 (store mapRest!15951 mapKey!15951 mapValue!15951))))

(declare-fun condMapEmpty!15951 () Bool)

(declare-fun mapDefault!15951 () ValueCell!4449)

(assert (=> mapNonEmpty!15945 (= condMapEmpty!15951 (= mapRest!15945 ((as const (Array (_ BitVec 32) ValueCell!4449)) mapDefault!15951)))))

(assert (=> mapNonEmpty!15945 (= tp!31493 (and e!235687 mapRes!15951))))

(declare-fun b!388986 () Bool)

(assert (=> b!388986 (= e!235688 tp_is_empty!9585)))

(assert (= (and mapNonEmpty!15945 condMapEmpty!15951) mapIsEmpty!15951))

(assert (= (and mapNonEmpty!15945 (not condMapEmpty!15951)) mapNonEmpty!15951))

(assert (= (and mapNonEmpty!15951 ((_ is ValueCellFull!4449) mapValue!15951)) b!388986))

(assert (= (and mapNonEmpty!15945 ((_ is ValueCellFull!4449) mapDefault!15951)) b!388987))

(declare-fun m!385017 () Bool)

(assert (=> mapNonEmpty!15951 m!385017))

(declare-fun b_lambda!8563 () Bool)

(assert (= b_lambda!8557 (or (and start!37832 b_free!8913) b_lambda!8563)))

(declare-fun b_lambda!8565 () Bool)

(assert (= b_lambda!8561 (or (and start!37832 b_free!8913) b_lambda!8565)))

(declare-fun b_lambda!8567 () Bool)

(assert (= b_lambda!8551 (or (and start!37832 b_free!8913) b_lambda!8567)))

(declare-fun b_lambda!8569 () Bool)

(assert (= b_lambda!8553 (or (and start!37832 b_free!8913) b_lambda!8569)))

(declare-fun b_lambda!8571 () Bool)

(assert (= b_lambda!8555 (or (and start!37832 b_free!8913) b_lambda!8571)))

(declare-fun b_lambda!8573 () Bool)

(assert (= b_lambda!8559 (or (and start!37832 b_free!8913) b_lambda!8573)))

(check-sat (not b!388968) (not b!388969) (not bm!27388) (not b_lambda!8571) tp_is_empty!9585 (not b!388790) (not b!388905) (not bm!27383) (not b!388881) (not b!388902) (not mapNonEmpty!15951) (not b!388954) (not bm!27369) (not b!388878) (not d!72835) (not bm!27395) (not b!388792) (not b!388890) (not b!388928) (not b!388787) (not d!72843) (not bm!27396) (not b_lambda!8569) (not bm!27376) (not d!72849) (not b!388955) (not b_next!8913) (not b!388918) (not d!72839) (not b!388978) (not b!388785) (not b!388895) (not b!388974) (not bm!27381) b_and!16181 (not b!388907) (not b_lambda!8567) (not b!388793) (not b!388935) (not d!72851) (not b!388789) (not b!388830) (not b!388973) (not b!388919) (not bm!27389) (not b_lambda!8563) (not b!388909) (not bm!27377) (not d!72847) (not b!388966) (not b!388794) (not b!388822) (not bm!27392) (not b!388876) (not b!388825) (not b!388821) (not b!388975) (not b!388823) (not b_lambda!8565) (not d!72853) (not b!388826) (not b!388885) (not b!388827) (not b!388908) (not bm!27372) (not d!72841) (not bm!27397) (not b!388886) (not b!388943) (not b!388875) (not b!388786) (not bm!27354) (not b_lambda!8573) (not bm!27380) (not b!388923) (not b!388904) (not b!388828) (not b!388977) (not b!388911) (not b!388900) (not b!388898) (not b!388914) (not b!388903) (not d!72845) (not d!72837) (not b!388899) (not b!388788) (not bm!27373) (not b!388791) (not bm!27375))
(check-sat b_and!16181 (not b_next!8913))
