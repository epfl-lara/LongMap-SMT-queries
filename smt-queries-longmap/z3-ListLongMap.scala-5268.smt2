; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!70744 () Bool)

(assert start!70744)

(declare-fun b_free!13017 () Bool)

(declare-fun b_next!13017 () Bool)

(assert (=> start!70744 (= b_free!13017 (not b_next!13017))))

(declare-fun tp!45792 () Bool)

(declare-fun b_and!21879 () Bool)

(assert (=> start!70744 (= tp!45792 b_and!21879)))

(declare-fun b!821721 () Bool)

(declare-fun res!560537 () Bool)

(declare-fun e!456736 () Bool)

(assert (=> b!821721 (=> (not res!560537) (not e!456736))))

(declare-datatypes ((array!45648 0))(
  ( (array!45649 (arr!21875 (Array (_ BitVec 32) (_ BitVec 64))) (size!22296 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!45648)

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-datatypes ((V!24637 0))(
  ( (V!24638 (val!7411 Int)) )
))
(declare-datatypes ((ValueCell!6948 0))(
  ( (ValueCellFull!6948 (v!9842 V!24637)) (EmptyCell!6948) )
))
(declare-datatypes ((array!45650 0))(
  ( (array!45651 (arr!21876 (Array (_ BitVec 32) ValueCell!6948)) (size!22297 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!45650)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!821721 (= res!560537 (and (= (size!22297 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22296 _keys!976) (size!22297 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun mapIsEmpty!23698 () Bool)

(declare-fun mapRes!23698 () Bool)

(assert (=> mapIsEmpty!23698 mapRes!23698))

(declare-fun b!821722 () Bool)

(declare-fun res!560535 () Bool)

(assert (=> b!821722 (=> (not res!560535) (not e!456736))))

(declare-datatypes ((List!15596 0))(
  ( (Nil!15593) (Cons!15592 (h!16721 (_ BitVec 64)) (t!21931 List!15596)) )
))
(declare-fun arrayNoDuplicates!0 (array!45648 (_ BitVec 32) List!15596) Bool)

(assert (=> b!821722 (= res!560535 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15593))))

(declare-fun b!821723 () Bool)

(declare-fun res!560536 () Bool)

(assert (=> b!821723 (=> (not res!560536) (not e!456736))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!45648 (_ BitVec 32)) Bool)

(assert (=> b!821723 (= res!560536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun b!821724 () Bool)

(declare-fun e!456735 () Bool)

(declare-fun tp_is_empty!14727 () Bool)

(assert (=> b!821724 (= e!456735 tp_is_empty!14727)))

(declare-fun b!821725 () Bool)

(declare-fun e!456739 () Bool)

(assert (=> b!821725 (= e!456739 tp_is_empty!14727)))

(declare-fun res!560534 () Bool)

(assert (=> start!70744 (=> (not res!560534) (not e!456736))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!70744 (= res!560534 (validMask!0 mask!1312))))

(assert (=> start!70744 e!456736))

(assert (=> start!70744 tp_is_empty!14727))

(declare-fun array_inv!17475 (array!45648) Bool)

(assert (=> start!70744 (array_inv!17475 _keys!976)))

(assert (=> start!70744 true))

(declare-fun e!456740 () Bool)

(declare-fun array_inv!17476 (array!45650) Bool)

(assert (=> start!70744 (and (array_inv!17476 _values!788) e!456740)))

(assert (=> start!70744 tp!45792))

(declare-fun b!821726 () Bool)

(assert (=> b!821726 (= e!456740 (and e!456735 mapRes!23698))))

(declare-fun condMapEmpty!23698 () Bool)

(declare-fun mapDefault!23698 () ValueCell!6948)

(assert (=> b!821726 (= condMapEmpty!23698 (= (arr!21876 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6948)) mapDefault!23698)))))

(declare-fun mapNonEmpty!23698 () Bool)

(declare-fun tp!45793 () Bool)

(assert (=> mapNonEmpty!23698 (= mapRes!23698 (and tp!45793 e!456739))))

(declare-fun mapKey!23698 () (_ BitVec 32))

(declare-fun mapValue!23698 () ValueCell!6948)

(declare-fun mapRest!23698 () (Array (_ BitVec 32) ValueCell!6948))

(assert (=> mapNonEmpty!23698 (= (arr!21876 _values!788) (store mapRest!23698 mapKey!23698 mapValue!23698))))

(declare-fun b!821727 () Bool)

(declare-fun e!456738 () Bool)

(assert (=> b!821727 (= e!456738 (bvsle #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(declare-fun zeroValueBefore!34 () V!24637)

(declare-fun minValue!754 () V!24637)

(declare-datatypes ((tuple2!9780 0))(
  ( (tuple2!9781 (_1!4901 (_ BitVec 64)) (_2!4901 V!24637)) )
))
(declare-datatypes ((List!15597 0))(
  ( (Nil!15594) (Cons!15593 (h!16722 tuple2!9780) (t!21932 List!15597)) )
))
(declare-datatypes ((ListLongMap!8603 0))(
  ( (ListLongMap!8604 (toList!4317 List!15597)) )
))
(declare-fun lt!369365 () ListLongMap!8603)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMap!2485 (array!45648 array!45650 (_ BitVec 32) (_ BitVec 32) V!24637 V!24637 (_ BitVec 32) Int) ListLongMap!8603)

(assert (=> b!821727 (= lt!369365 (getCurrentListMap!2485 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821728 () Bool)

(assert (=> b!821728 (= e!456736 (not e!456738))))

(declare-fun res!560533 () Bool)

(assert (=> b!821728 (=> res!560533 e!456738)))

(assert (=> b!821728 (= res!560533 (or (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!369362 () ListLongMap!8603)

(declare-fun lt!369364 () ListLongMap!8603)

(assert (=> b!821728 (= lt!369362 lt!369364)))

(declare-fun zeroValueAfter!34 () V!24637)

(declare-datatypes ((Unit!28101 0))(
  ( (Unit!28102) )
))
(declare-fun lt!369363 () Unit!28101)

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!448 (array!45648 array!45650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24637 V!24637 V!24637 V!24637 (_ BitVec 32) Int) Unit!28101)

(assert (=> b!821728 (= lt!369363 (lemmaNoChangeToArrayThenSameMapNoExtras!448 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun getCurrentListMapNoExtraKeys!2338 (array!45648 array!45650 (_ BitVec 32) (_ BitVec 32) V!24637 V!24637 (_ BitVec 32) Int) ListLongMap!8603)

(assert (=> b!821728 (= lt!369364 (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> b!821728 (= lt!369362 (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!70744 res!560534) b!821721))

(assert (= (and b!821721 res!560537) b!821723))

(assert (= (and b!821723 res!560536) b!821722))

(assert (= (and b!821722 res!560535) b!821728))

(assert (= (and b!821728 (not res!560533)) b!821727))

(assert (= (and b!821726 condMapEmpty!23698) mapIsEmpty!23698))

(assert (= (and b!821726 (not condMapEmpty!23698)) mapNonEmpty!23698))

(get-info :version)

(assert (= (and mapNonEmpty!23698 ((_ is ValueCellFull!6948) mapValue!23698)) b!821725))

(assert (= (and b!821726 ((_ is ValueCellFull!6948) mapDefault!23698)) b!821724))

(assert (= start!70744 b!821726))

(declare-fun m!763469 () Bool)

(assert (=> mapNonEmpty!23698 m!763469))

(declare-fun m!763471 () Bool)

(assert (=> b!821728 m!763471))

(declare-fun m!763473 () Bool)

(assert (=> b!821728 m!763473))

(declare-fun m!763475 () Bool)

(assert (=> b!821728 m!763475))

(declare-fun m!763477 () Bool)

(assert (=> b!821722 m!763477))

(declare-fun m!763479 () Bool)

(assert (=> start!70744 m!763479))

(declare-fun m!763481 () Bool)

(assert (=> start!70744 m!763481))

(declare-fun m!763483 () Bool)

(assert (=> start!70744 m!763483))

(declare-fun m!763485 () Bool)

(assert (=> b!821723 m!763485))

(declare-fun m!763487 () Bool)

(assert (=> b!821727 m!763487))

(check-sat (not b!821728) (not b!821723) (not mapNonEmpty!23698) (not start!70744) tp_is_empty!14727 (not b!821727) b_and!21879 (not b!821722) (not b_next!13017))
(check-sat b_and!21879 (not b_next!13017))
(get-model)

(declare-fun d!104791 () Bool)

(assert (=> d!104791 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!70744 d!104791))

(declare-fun d!104793 () Bool)

(assert (=> d!104793 (= (array_inv!17475 _keys!976) (bvsge (size!22296 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!70744 d!104793))

(declare-fun d!104795 () Bool)

(assert (=> d!104795 (= (array_inv!17476 _values!788) (bvsge (size!22297 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!70744 d!104795))

(declare-fun b!821795 () Bool)

(declare-fun lt!369443 () ListLongMap!8603)

(declare-fun e!456794 () Bool)

(declare-fun apply!357 (ListLongMap!8603 (_ BitVec 64)) V!24637)

(declare-fun get!11642 (ValueCell!6948 V!24637) V!24637)

(declare-fun dynLambda!968 (Int (_ BitVec 64)) V!24637)

(assert (=> b!821795 (= e!456794 (= (apply!357 lt!369443 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)) (get!11642 (select (arr!21876 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!821795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22297 _values!788)))))

(assert (=> b!821795 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(declare-fun b!821796 () Bool)

(declare-fun e!456786 () Bool)

(declare-fun e!456796 () Bool)

(assert (=> b!821796 (= e!456786 e!456796)))

(declare-fun res!560571 () Bool)

(declare-fun call!35739 () Bool)

(assert (=> b!821796 (= res!560571 call!35739)))

(assert (=> b!821796 (=> (not res!560571) (not e!456796))))

(declare-fun b!821797 () Bool)

(declare-fun res!560572 () Bool)

(declare-fun e!456790 () Bool)

(assert (=> b!821797 (=> (not res!560572) (not e!456790))))

(assert (=> b!821797 (= res!560572 e!456786)))

(declare-fun c!89254 () Bool)

(assert (=> b!821797 (= c!89254 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun call!35738 () ListLongMap!8603)

(declare-fun call!35737 () ListLongMap!8603)

(declare-fun bm!35734 () Bool)

(declare-fun c!89251 () Bool)

(declare-fun call!35741 () ListLongMap!8603)

(declare-fun c!89252 () Bool)

(declare-fun call!35743 () ListLongMap!8603)

(declare-fun +!1870 (ListLongMap!8603 tuple2!9780) ListLongMap!8603)

(assert (=> bm!35734 (= call!35741 (+!1870 (ite c!89251 call!35738 (ite c!89252 call!35743 call!35737)) (ite (or c!89251 c!89252) (tuple2!9781 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValueBefore!34) (tuple2!9781 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754))))))

(declare-fun b!821798 () Bool)

(declare-fun e!456797 () ListLongMap!8603)

(declare-fun e!456788 () ListLongMap!8603)

(assert (=> b!821798 (= e!456797 e!456788)))

(assert (=> b!821798 (= c!89252 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun bm!35735 () Bool)

(assert (=> bm!35735 (= call!35737 call!35743)))

(declare-fun b!821799 () Bool)

(declare-fun e!456787 () ListLongMap!8603)

(assert (=> b!821799 (= e!456787 call!35737)))

(declare-fun b!821800 () Bool)

(declare-fun e!456792 () Unit!28101)

(declare-fun Unit!28105 () Unit!28101)

(assert (=> b!821800 (= e!456792 Unit!28105)))

(declare-fun b!821801 () Bool)

(assert (=> b!821801 (= e!456797 (+!1870 call!35741 (tuple2!9781 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!754)))))

(declare-fun b!821802 () Bool)

(declare-fun e!456793 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!821802 (= e!456793 (validKeyInArray!0 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821803 () Bool)

(declare-fun res!560575 () Bool)

(assert (=> b!821803 (=> (not res!560575) (not e!456790))))

(declare-fun e!456791 () Bool)

(assert (=> b!821803 (= res!560575 e!456791)))

(declare-fun res!560578 () Bool)

(assert (=> b!821803 (=> res!560578 e!456791)))

(declare-fun e!456789 () Bool)

(assert (=> b!821803 (= res!560578 (not e!456789))))

(declare-fun res!560576 () Bool)

(assert (=> b!821803 (=> (not res!560576) (not e!456789))))

(assert (=> b!821803 (= res!560576 (bvslt #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(declare-fun b!821804 () Bool)

(declare-fun e!456785 () Bool)

(assert (=> b!821804 (= e!456785 (= (apply!357 lt!369443 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!754))))

(declare-fun bm!35736 () Bool)

(assert (=> bm!35736 (= call!35738 (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun b!821805 () Bool)

(declare-fun e!456795 () Bool)

(assert (=> b!821805 (= e!456795 e!456785)))

(declare-fun res!560579 () Bool)

(declare-fun call!35740 () Bool)

(assert (=> b!821805 (= res!560579 call!35740)))

(assert (=> b!821805 (=> (not res!560579) (not e!456785))))

(declare-fun b!821806 () Bool)

(declare-fun c!89249 () Bool)

(assert (=> b!821806 (= c!89249 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!821806 (= e!456788 e!456787)))

(declare-fun b!821807 () Bool)

(assert (=> b!821807 (= e!456789 (validKeyInArray!0 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821808 () Bool)

(declare-fun call!35742 () ListLongMap!8603)

(assert (=> b!821808 (= e!456788 call!35742)))

(declare-fun bm!35737 () Bool)

(assert (=> bm!35737 (= call!35742 call!35741)))

(declare-fun b!821809 () Bool)

(assert (=> b!821809 (= e!456790 e!456795)))

(declare-fun c!89250 () Bool)

(assert (=> b!821809 (= c!89250 (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!821810 () Bool)

(assert (=> b!821810 (= e!456787 call!35742)))

(declare-fun bm!35738 () Bool)

(assert (=> bm!35738 (= call!35743 call!35738)))

(declare-fun b!821811 () Bool)

(assert (=> b!821811 (= e!456796 (= (apply!357 lt!369443 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValueBefore!34))))

(declare-fun b!821812 () Bool)

(assert (=> b!821812 (= e!456791 e!456794)))

(declare-fun res!560577 () Bool)

(assert (=> b!821812 (=> (not res!560577) (not e!456794))))

(declare-fun contains!4167 (ListLongMap!8603 (_ BitVec 64)) Bool)

(assert (=> b!821812 (= res!560577 (contains!4167 lt!369443 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821812 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(declare-fun bm!35739 () Bool)

(assert (=> bm!35739 (= call!35740 (contains!4167 lt!369443 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!821813 () Bool)

(declare-fun lt!369422 () Unit!28101)

(assert (=> b!821813 (= e!456792 lt!369422)))

(declare-fun lt!369424 () ListLongMap!8603)

(assert (=> b!821813 (= lt!369424 (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369439 () (_ BitVec 64))

(assert (=> b!821813 (= lt!369439 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369428 () (_ BitVec 64))

(assert (=> b!821813 (= lt!369428 (select (arr!21875 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369435 () Unit!28101)

(declare-fun addStillContains!310 (ListLongMap!8603 (_ BitVec 64) V!24637 (_ BitVec 64)) Unit!28101)

(assert (=> b!821813 (= lt!369435 (addStillContains!310 lt!369424 lt!369439 zeroValueBefore!34 lt!369428))))

(assert (=> b!821813 (contains!4167 (+!1870 lt!369424 (tuple2!9781 lt!369439 zeroValueBefore!34)) lt!369428)))

(declare-fun lt!369432 () Unit!28101)

(assert (=> b!821813 (= lt!369432 lt!369435)))

(declare-fun lt!369429 () ListLongMap!8603)

(assert (=> b!821813 (= lt!369429 (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369431 () (_ BitVec 64))

(assert (=> b!821813 (= lt!369431 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369425 () (_ BitVec 64))

(assert (=> b!821813 (= lt!369425 (select (arr!21875 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369423 () Unit!28101)

(declare-fun addApplyDifferent!310 (ListLongMap!8603 (_ BitVec 64) V!24637 (_ BitVec 64)) Unit!28101)

(assert (=> b!821813 (= lt!369423 (addApplyDifferent!310 lt!369429 lt!369431 minValue!754 lt!369425))))

(assert (=> b!821813 (= (apply!357 (+!1870 lt!369429 (tuple2!9781 lt!369431 minValue!754)) lt!369425) (apply!357 lt!369429 lt!369425))))

(declare-fun lt!369441 () Unit!28101)

(assert (=> b!821813 (= lt!369441 lt!369423)))

(declare-fun lt!369440 () ListLongMap!8603)

(assert (=> b!821813 (= lt!369440 (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369427 () (_ BitVec 64))

(assert (=> b!821813 (= lt!369427 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369438 () (_ BitVec 64))

(assert (=> b!821813 (= lt!369438 (select (arr!21875 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369437 () Unit!28101)

(assert (=> b!821813 (= lt!369437 (addApplyDifferent!310 lt!369440 lt!369427 zeroValueBefore!34 lt!369438))))

(assert (=> b!821813 (= (apply!357 (+!1870 lt!369440 (tuple2!9781 lt!369427 zeroValueBefore!34)) lt!369438) (apply!357 lt!369440 lt!369438))))

(declare-fun lt!369430 () Unit!28101)

(assert (=> b!821813 (= lt!369430 lt!369437)))

(declare-fun lt!369436 () ListLongMap!8603)

(assert (=> b!821813 (= lt!369436 (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369442 () (_ BitVec 64))

(assert (=> b!821813 (= lt!369442 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!369434 () (_ BitVec 64))

(assert (=> b!821813 (= lt!369434 (select (arr!21875 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821813 (= lt!369422 (addApplyDifferent!310 lt!369436 lt!369442 minValue!754 lt!369434))))

(assert (=> b!821813 (= (apply!357 (+!1870 lt!369436 (tuple2!9781 lt!369442 minValue!754)) lt!369434) (apply!357 lt!369436 lt!369434))))

(declare-fun b!821814 () Bool)

(assert (=> b!821814 (= e!456786 (not call!35739))))

(declare-fun d!104797 () Bool)

(assert (=> d!104797 e!456790))

(declare-fun res!560574 () Bool)

(assert (=> d!104797 (=> (not res!560574) (not e!456790))))

(assert (=> d!104797 (= res!560574 (or (bvsge #b00000000000000000000000000000000 (size!22296 _keys!976)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22296 _keys!976)))))))

(declare-fun lt!369426 () ListLongMap!8603)

(assert (=> d!104797 (= lt!369443 lt!369426)))

(declare-fun lt!369433 () Unit!28101)

(assert (=> d!104797 (= lt!369433 e!456792)))

(declare-fun c!89253 () Bool)

(assert (=> d!104797 (= c!89253 e!456793)))

(declare-fun res!560573 () Bool)

(assert (=> d!104797 (=> (not res!560573) (not e!456793))))

(assert (=> d!104797 (= res!560573 (bvslt #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(assert (=> d!104797 (= lt!369426 e!456797)))

(assert (=> d!104797 (= c!89251 (and (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!104797 (validMask!0 mask!1312)))

(assert (=> d!104797 (= (getCurrentListMap!2485 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369443)))

(declare-fun b!821815 () Bool)

(assert (=> b!821815 (= e!456795 (not call!35740))))

(declare-fun bm!35740 () Bool)

(assert (=> bm!35740 (= call!35739 (contains!4167 lt!369443 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (= (and d!104797 c!89251) b!821801))

(assert (= (and d!104797 (not c!89251)) b!821798))

(assert (= (and b!821798 c!89252) b!821808))

(assert (= (and b!821798 (not c!89252)) b!821806))

(assert (= (and b!821806 c!89249) b!821810))

(assert (= (and b!821806 (not c!89249)) b!821799))

(assert (= (or b!821810 b!821799) bm!35735))

(assert (= (or b!821808 bm!35735) bm!35738))

(assert (= (or b!821808 b!821810) bm!35737))

(assert (= (or b!821801 bm!35738) bm!35736))

(assert (= (or b!821801 bm!35737) bm!35734))

(assert (= (and d!104797 res!560573) b!821802))

(assert (= (and d!104797 c!89253) b!821813))

(assert (= (and d!104797 (not c!89253)) b!821800))

(assert (= (and d!104797 res!560574) b!821803))

(assert (= (and b!821803 res!560576) b!821807))

(assert (= (and b!821803 (not res!560578)) b!821812))

(assert (= (and b!821812 res!560577) b!821795))

(assert (= (and b!821803 res!560575) b!821797))

(assert (= (and b!821797 c!89254) b!821796))

(assert (= (and b!821797 (not c!89254)) b!821814))

(assert (= (and b!821796 res!560571) b!821811))

(assert (= (or b!821796 b!821814) bm!35740))

(assert (= (and b!821797 res!560572) b!821809))

(assert (= (and b!821809 c!89250) b!821805))

(assert (= (and b!821809 (not c!89250)) b!821815))

(assert (= (and b!821805 res!560579) b!821804))

(assert (= (or b!821805 b!821815) bm!35739))

(declare-fun b_lambda!11011 () Bool)

(assert (=> (not b_lambda!11011) (not b!821795)))

(declare-fun t!21936 () Bool)

(declare-fun tb!4195 () Bool)

(assert (=> (and start!70744 (= defaultEntry!796 defaultEntry!796) t!21936) tb!4195))

(declare-fun result!7925 () Bool)

(assert (=> tb!4195 (= result!7925 tp_is_empty!14727)))

(assert (=> b!821795 t!21936))

(declare-fun b_and!21883 () Bool)

(assert (= b_and!21879 (and (=> t!21936 result!7925) b_and!21883)))

(declare-fun m!763509 () Bool)

(assert (=> b!821795 m!763509))

(declare-fun m!763511 () Bool)

(assert (=> b!821795 m!763511))

(declare-fun m!763513 () Bool)

(assert (=> b!821795 m!763513))

(assert (=> b!821795 m!763513))

(declare-fun m!763515 () Bool)

(assert (=> b!821795 m!763515))

(declare-fun m!763517 () Bool)

(assert (=> b!821795 m!763517))

(assert (=> b!821795 m!763515))

(assert (=> b!821795 m!763509))

(assert (=> b!821812 m!763509))

(assert (=> b!821812 m!763509))

(declare-fun m!763519 () Bool)

(assert (=> b!821812 m!763519))

(assert (=> bm!35736 m!763475))

(declare-fun m!763521 () Bool)

(assert (=> b!821811 m!763521))

(declare-fun m!763523 () Bool)

(assert (=> b!821804 m!763523))

(assert (=> d!104797 m!763479))

(declare-fun m!763525 () Bool)

(assert (=> b!821801 m!763525))

(declare-fun m!763527 () Bool)

(assert (=> bm!35734 m!763527))

(declare-fun m!763529 () Bool)

(assert (=> bm!35739 m!763529))

(assert (=> b!821802 m!763509))

(assert (=> b!821802 m!763509))

(declare-fun m!763531 () Bool)

(assert (=> b!821802 m!763531))

(declare-fun m!763533 () Bool)

(assert (=> b!821813 m!763533))

(declare-fun m!763535 () Bool)

(assert (=> b!821813 m!763535))

(declare-fun m!763537 () Bool)

(assert (=> b!821813 m!763537))

(declare-fun m!763539 () Bool)

(assert (=> b!821813 m!763539))

(declare-fun m!763541 () Bool)

(assert (=> b!821813 m!763541))

(declare-fun m!763543 () Bool)

(assert (=> b!821813 m!763543))

(declare-fun m!763545 () Bool)

(assert (=> b!821813 m!763545))

(assert (=> b!821813 m!763475))

(declare-fun m!763547 () Bool)

(assert (=> b!821813 m!763547))

(assert (=> b!821813 m!763541))

(declare-fun m!763549 () Bool)

(assert (=> b!821813 m!763549))

(declare-fun m!763551 () Bool)

(assert (=> b!821813 m!763551))

(declare-fun m!763553 () Bool)

(assert (=> b!821813 m!763553))

(assert (=> b!821813 m!763545))

(declare-fun m!763555 () Bool)

(assert (=> b!821813 m!763555))

(assert (=> b!821813 m!763535))

(declare-fun m!763557 () Bool)

(assert (=> b!821813 m!763557))

(declare-fun m!763559 () Bool)

(assert (=> b!821813 m!763559))

(assert (=> b!821813 m!763509))

(assert (=> b!821813 m!763551))

(declare-fun m!763561 () Bool)

(assert (=> b!821813 m!763561))

(declare-fun m!763563 () Bool)

(assert (=> bm!35740 m!763563))

(assert (=> b!821807 m!763509))

(assert (=> b!821807 m!763509))

(assert (=> b!821807 m!763531))

(assert (=> b!821727 d!104797))

(declare-fun b!821826 () Bool)

(declare-fun e!456805 () Bool)

(declare-fun call!35746 () Bool)

(assert (=> b!821826 (= e!456805 call!35746)))

(declare-fun b!821827 () Bool)

(declare-fun e!456804 () Bool)

(assert (=> b!821827 (= e!456804 e!456805)))

(declare-fun lt!369452 () (_ BitVec 64))

(assert (=> b!821827 (= lt!369452 (select (arr!21875 _keys!976) #b00000000000000000000000000000000))))

(declare-fun lt!369450 () Unit!28101)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!45648 (_ BitVec 64) (_ BitVec 32)) Unit!28101)

(assert (=> b!821827 (= lt!369450 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!369452 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!45648 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!821827 (arrayContainsKey!0 _keys!976 lt!369452 #b00000000000000000000000000000000)))

(declare-fun lt!369451 () Unit!28101)

(assert (=> b!821827 (= lt!369451 lt!369450)))

(declare-fun res!560584 () Bool)

(declare-datatypes ((SeekEntryResult!8729 0))(
  ( (MissingZero!8729 (index!37287 (_ BitVec 32))) (Found!8729 (index!37288 (_ BitVec 32))) (Intermediate!8729 (undefined!9541 Bool) (index!37289 (_ BitVec 32)) (x!69289 (_ BitVec 32))) (Undefined!8729) (MissingVacant!8729 (index!37290 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!45648 (_ BitVec 32)) SeekEntryResult!8729)

(assert (=> b!821827 (= res!560584 (= (seekEntryOrOpen!0 (select (arr!21875 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8729 #b00000000000000000000000000000000)))))

(assert (=> b!821827 (=> (not res!560584) (not e!456805))))

(declare-fun d!104799 () Bool)

(declare-fun res!560585 () Bool)

(declare-fun e!456806 () Bool)

(assert (=> d!104799 (=> res!560585 e!456806)))

(assert (=> d!104799 (= res!560585 (bvsge #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(assert (=> d!104799 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!456806)))

(declare-fun b!821828 () Bool)

(assert (=> b!821828 (= e!456806 e!456804)))

(declare-fun c!89257 () Bool)

(assert (=> b!821828 (= c!89257 (validKeyInArray!0 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821829 () Bool)

(assert (=> b!821829 (= e!456804 call!35746)))

(declare-fun bm!35743 () Bool)

(assert (=> bm!35743 (= call!35746 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(assert (= (and d!104799 (not res!560585)) b!821828))

(assert (= (and b!821828 c!89257) b!821827))

(assert (= (and b!821828 (not c!89257)) b!821829))

(assert (= (and b!821827 res!560584) b!821826))

(assert (= (or b!821826 b!821829) bm!35743))

(assert (=> b!821827 m!763509))

(declare-fun m!763565 () Bool)

(assert (=> b!821827 m!763565))

(declare-fun m!763567 () Bool)

(assert (=> b!821827 m!763567))

(assert (=> b!821827 m!763509))

(declare-fun m!763569 () Bool)

(assert (=> b!821827 m!763569))

(assert (=> b!821828 m!763509))

(assert (=> b!821828 m!763509))

(assert (=> b!821828 m!763531))

(declare-fun m!763571 () Bool)

(assert (=> bm!35743 m!763571))

(assert (=> b!821723 d!104799))

(declare-fun d!104801 () Bool)

(assert (=> d!104801 (= (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun lt!369455 () Unit!28101)

(declare-fun choose!1398 (array!45648 array!45650 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!24637 V!24637 V!24637 V!24637 (_ BitVec 32) Int) Unit!28101)

(assert (=> d!104801 (= lt!369455 (choose!1398 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (=> d!104801 (validMask!0 mask!1312)))

(assert (=> d!104801 (= (lemmaNoChangeToArrayThenSameMapNoExtras!448 _keys!976 _values!788 mask!1312 extraKeysBefore!61 extraKeysAfter!53 zeroValueBefore!34 zeroValueAfter!34 minValue!754 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369455)))

(declare-fun bs!22926 () Bool)

(assert (= bs!22926 d!104801))

(assert (=> bs!22926 m!763475))

(assert (=> bs!22926 m!763473))

(declare-fun m!763573 () Bool)

(assert (=> bs!22926 m!763573))

(assert (=> bs!22926 m!763479))

(assert (=> b!821728 d!104801))

(declare-fun b!821854 () Bool)

(declare-fun e!456825 () ListLongMap!8603)

(assert (=> b!821854 (= e!456825 (ListLongMap!8604 Nil!15594))))

(declare-fun b!821855 () Bool)

(declare-fun e!456827 () Bool)

(assert (=> b!821855 (= e!456827 (validKeyInArray!0 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821855 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!821856 () Bool)

(declare-fun e!456826 () ListLongMap!8603)

(assert (=> b!821856 (= e!456825 e!456826)))

(declare-fun c!89267 () Bool)

(assert (=> b!821856 (= c!89267 (validKeyInArray!0 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821857 () Bool)

(declare-fun call!35749 () ListLongMap!8603)

(assert (=> b!821857 (= e!456826 call!35749)))

(declare-fun d!104803 () Bool)

(declare-fun e!456823 () Bool)

(assert (=> d!104803 e!456823))

(declare-fun res!560595 () Bool)

(assert (=> d!104803 (=> (not res!560595) (not e!456823))))

(declare-fun lt!369472 () ListLongMap!8603)

(assert (=> d!104803 (= res!560595 (not (contains!4167 lt!369472 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104803 (= lt!369472 e!456825)))

(declare-fun c!89268 () Bool)

(assert (=> d!104803 (= c!89268 (bvsge #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(assert (=> d!104803 (validMask!0 mask!1312)))

(assert (=> d!104803 (= (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369472)))

(declare-fun b!821858 () Bool)

(declare-fun e!456824 () Bool)

(declare-fun e!456822 () Bool)

(assert (=> b!821858 (= e!456824 e!456822)))

(declare-fun c!89269 () Bool)

(assert (=> b!821858 (= c!89269 (bvslt #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(declare-fun bm!35746 () Bool)

(assert (=> bm!35746 (= call!35749 (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!821859 () Bool)

(assert (=> b!821859 (= e!456823 e!456824)))

(declare-fun c!89266 () Bool)

(assert (=> b!821859 (= c!89266 e!456827)))

(declare-fun res!560596 () Bool)

(assert (=> b!821859 (=> (not res!560596) (not e!456827))))

(assert (=> b!821859 (= res!560596 (bvslt #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(declare-fun b!821860 () Bool)

(assert (=> b!821860 (= e!456822 (= lt!369472 (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!821861 () Bool)

(declare-fun res!560594 () Bool)

(assert (=> b!821861 (=> (not res!560594) (not e!456823))))

(assert (=> b!821861 (= res!560594 (not (contains!4167 lt!369472 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!821862 () Bool)

(assert (=> b!821862 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(assert (=> b!821862 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22297 _values!788)))))

(declare-fun e!456821 () Bool)

(assert (=> b!821862 (= e!456821 (= (apply!357 lt!369472 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)) (get!11642 (select (arr!21876 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!821863 () Bool)

(declare-fun isEmpty!639 (ListLongMap!8603) Bool)

(assert (=> b!821863 (= e!456822 (isEmpty!639 lt!369472))))

(declare-fun b!821864 () Bool)

(declare-fun lt!369471 () Unit!28101)

(declare-fun lt!369473 () Unit!28101)

(assert (=> b!821864 (= lt!369471 lt!369473)))

(declare-fun lt!369474 () ListLongMap!8603)

(declare-fun lt!369475 () (_ BitVec 64))

(declare-fun lt!369470 () V!24637)

(declare-fun lt!369476 () (_ BitVec 64))

(assert (=> b!821864 (not (contains!4167 (+!1870 lt!369474 (tuple2!9781 lt!369475 lt!369470)) lt!369476))))

(declare-fun addStillNotContains!182 (ListLongMap!8603 (_ BitVec 64) V!24637 (_ BitVec 64)) Unit!28101)

(assert (=> b!821864 (= lt!369473 (addStillNotContains!182 lt!369474 lt!369475 lt!369470 lt!369476))))

(assert (=> b!821864 (= lt!369476 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!821864 (= lt!369470 (get!11642 (select (arr!21876 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!821864 (= lt!369475 (select (arr!21875 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821864 (= lt!369474 call!35749)))

(assert (=> b!821864 (= e!456826 (+!1870 call!35749 (tuple2!9781 (select (arr!21875 _keys!976) #b00000000000000000000000000000000) (get!11642 (select (arr!21876 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!821865 () Bool)

(assert (=> b!821865 (= e!456824 e!456821)))

(assert (=> b!821865 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(declare-fun res!560597 () Bool)

(assert (=> b!821865 (= res!560597 (contains!4167 lt!369472 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821865 (=> (not res!560597) (not e!456821))))

(assert (= (and d!104803 c!89268) b!821854))

(assert (= (and d!104803 (not c!89268)) b!821856))

(assert (= (and b!821856 c!89267) b!821864))

(assert (= (and b!821856 (not c!89267)) b!821857))

(assert (= (or b!821864 b!821857) bm!35746))

(assert (= (and d!104803 res!560595) b!821861))

(assert (= (and b!821861 res!560594) b!821859))

(assert (= (and b!821859 res!560596) b!821855))

(assert (= (and b!821859 c!89266) b!821865))

(assert (= (and b!821859 (not c!89266)) b!821858))

(assert (= (and b!821865 res!560597) b!821862))

(assert (= (and b!821858 c!89269) b!821860))

(assert (= (and b!821858 (not c!89269)) b!821863))

(declare-fun b_lambda!11013 () Bool)

(assert (=> (not b_lambda!11013) (not b!821862)))

(assert (=> b!821862 t!21936))

(declare-fun b_and!21885 () Bool)

(assert (= b_and!21883 (and (=> t!21936 result!7925) b_and!21885)))

(declare-fun b_lambda!11015 () Bool)

(assert (=> (not b_lambda!11015) (not b!821864)))

(assert (=> b!821864 t!21936))

(declare-fun b_and!21887 () Bool)

(assert (= b_and!21885 (and (=> t!21936 result!7925) b_and!21887)))

(assert (=> b!821862 m!763513))

(assert (=> b!821862 m!763515))

(assert (=> b!821862 m!763517))

(assert (=> b!821862 m!763509))

(assert (=> b!821862 m!763515))

(assert (=> b!821862 m!763513))

(assert (=> b!821862 m!763509))

(declare-fun m!763575 () Bool)

(assert (=> b!821862 m!763575))

(assert (=> b!821855 m!763509))

(assert (=> b!821855 m!763509))

(assert (=> b!821855 m!763531))

(declare-fun m!763577 () Bool)

(assert (=> b!821863 m!763577))

(declare-fun m!763579 () Bool)

(assert (=> b!821861 m!763579))

(assert (=> b!821864 m!763513))

(declare-fun m!763581 () Bool)

(assert (=> b!821864 m!763581))

(assert (=> b!821864 m!763513))

(assert (=> b!821864 m!763515))

(assert (=> b!821864 m!763517))

(assert (=> b!821864 m!763509))

(declare-fun m!763583 () Bool)

(assert (=> b!821864 m!763583))

(declare-fun m!763585 () Bool)

(assert (=> b!821864 m!763585))

(declare-fun m!763587 () Bool)

(assert (=> b!821864 m!763587))

(assert (=> b!821864 m!763515))

(assert (=> b!821864 m!763583))

(declare-fun m!763589 () Bool)

(assert (=> b!821860 m!763589))

(assert (=> b!821865 m!763509))

(assert (=> b!821865 m!763509))

(declare-fun m!763591 () Bool)

(assert (=> b!821865 m!763591))

(assert (=> bm!35746 m!763589))

(declare-fun m!763593 () Bool)

(assert (=> d!104803 m!763593))

(assert (=> d!104803 m!763479))

(assert (=> b!821856 m!763509))

(assert (=> b!821856 m!763509))

(assert (=> b!821856 m!763531))

(assert (=> b!821728 d!104803))

(declare-fun b!821866 () Bool)

(declare-fun e!456832 () ListLongMap!8603)

(assert (=> b!821866 (= e!456832 (ListLongMap!8604 Nil!15594))))

(declare-fun b!821867 () Bool)

(declare-fun e!456834 () Bool)

(assert (=> b!821867 (= e!456834 (validKeyInArray!0 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821867 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!821868 () Bool)

(declare-fun e!456833 () ListLongMap!8603)

(assert (=> b!821868 (= e!456832 e!456833)))

(declare-fun c!89271 () Bool)

(assert (=> b!821868 (= c!89271 (validKeyInArray!0 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821869 () Bool)

(declare-fun call!35750 () ListLongMap!8603)

(assert (=> b!821869 (= e!456833 call!35750)))

(declare-fun d!104805 () Bool)

(declare-fun e!456830 () Bool)

(assert (=> d!104805 e!456830))

(declare-fun res!560599 () Bool)

(assert (=> d!104805 (=> (not res!560599) (not e!456830))))

(declare-fun lt!369479 () ListLongMap!8603)

(assert (=> d!104805 (= res!560599 (not (contains!4167 lt!369479 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!104805 (= lt!369479 e!456832)))

(declare-fun c!89272 () Bool)

(assert (=> d!104805 (= c!89272 (bvsge #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(assert (=> d!104805 (validMask!0 mask!1312)))

(assert (=> d!104805 (= (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796) lt!369479)))

(declare-fun b!821870 () Bool)

(declare-fun e!456831 () Bool)

(declare-fun e!456829 () Bool)

(assert (=> b!821870 (= e!456831 e!456829)))

(declare-fun c!89273 () Bool)

(assert (=> b!821870 (= c!89273 (bvslt #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(declare-fun bm!35747 () Bool)

(assert (=> bm!35747 (= call!35750 (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796))))

(declare-fun b!821871 () Bool)

(assert (=> b!821871 (= e!456830 e!456831)))

(declare-fun c!89270 () Bool)

(assert (=> b!821871 (= c!89270 e!456834)))

(declare-fun res!560600 () Bool)

(assert (=> b!821871 (=> (not res!560600) (not e!456834))))

(assert (=> b!821871 (= res!560600 (bvslt #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(declare-fun b!821872 () Bool)

(assert (=> b!821872 (= e!456829 (= lt!369479 (getCurrentListMapNoExtraKeys!2338 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!796)))))

(declare-fun b!821873 () Bool)

(declare-fun res!560598 () Bool)

(assert (=> b!821873 (=> (not res!560598) (not e!456830))))

(assert (=> b!821873 (= res!560598 (not (contains!4167 lt!369479 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!821874 () Bool)

(assert (=> b!821874 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(assert (=> b!821874 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22297 _values!788)))))

(declare-fun e!456828 () Bool)

(assert (=> b!821874 (= e!456828 (= (apply!357 lt!369479 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)) (get!11642 (select (arr!21876 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!821875 () Bool)

(assert (=> b!821875 (= e!456829 (isEmpty!639 lt!369479))))

(declare-fun b!821876 () Bool)

(declare-fun lt!369478 () Unit!28101)

(declare-fun lt!369480 () Unit!28101)

(assert (=> b!821876 (= lt!369478 lt!369480)))

(declare-fun lt!369482 () (_ BitVec 64))

(declare-fun lt!369481 () ListLongMap!8603)

(declare-fun lt!369483 () (_ BitVec 64))

(declare-fun lt!369477 () V!24637)

(assert (=> b!821876 (not (contains!4167 (+!1870 lt!369481 (tuple2!9781 lt!369482 lt!369477)) lt!369483))))

(assert (=> b!821876 (= lt!369480 (addStillNotContains!182 lt!369481 lt!369482 lt!369477 lt!369483))))

(assert (=> b!821876 (= lt!369483 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!821876 (= lt!369477 (get!11642 (select (arr!21876 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!821876 (= lt!369482 (select (arr!21875 _keys!976) #b00000000000000000000000000000000))))

(assert (=> b!821876 (= lt!369481 call!35750)))

(assert (=> b!821876 (= e!456833 (+!1870 call!35750 (tuple2!9781 (select (arr!21875 _keys!976) #b00000000000000000000000000000000) (get!11642 (select (arr!21876 _values!788) #b00000000000000000000000000000000) (dynLambda!968 defaultEntry!796 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!821877 () Bool)

(assert (=> b!821877 (= e!456831 e!456828)))

(assert (=> b!821877 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(declare-fun res!560601 () Bool)

(assert (=> b!821877 (= res!560601 (contains!4167 lt!369479 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)))))

(assert (=> b!821877 (=> (not res!560601) (not e!456828))))

(assert (= (and d!104805 c!89272) b!821866))

(assert (= (and d!104805 (not c!89272)) b!821868))

(assert (= (and b!821868 c!89271) b!821876))

(assert (= (and b!821868 (not c!89271)) b!821869))

(assert (= (or b!821876 b!821869) bm!35747))

(assert (= (and d!104805 res!560599) b!821873))

(assert (= (and b!821873 res!560598) b!821871))

(assert (= (and b!821871 res!560600) b!821867))

(assert (= (and b!821871 c!89270) b!821877))

(assert (= (and b!821871 (not c!89270)) b!821870))

(assert (= (and b!821877 res!560601) b!821874))

(assert (= (and b!821870 c!89273) b!821872))

(assert (= (and b!821870 (not c!89273)) b!821875))

(declare-fun b_lambda!11017 () Bool)

(assert (=> (not b_lambda!11017) (not b!821874)))

(assert (=> b!821874 t!21936))

(declare-fun b_and!21889 () Bool)

(assert (= b_and!21887 (and (=> t!21936 result!7925) b_and!21889)))

(declare-fun b_lambda!11019 () Bool)

(assert (=> (not b_lambda!11019) (not b!821876)))

(assert (=> b!821876 t!21936))

(declare-fun b_and!21891 () Bool)

(assert (= b_and!21889 (and (=> t!21936 result!7925) b_and!21891)))

(assert (=> b!821874 m!763513))

(assert (=> b!821874 m!763515))

(assert (=> b!821874 m!763517))

(assert (=> b!821874 m!763509))

(assert (=> b!821874 m!763515))

(assert (=> b!821874 m!763513))

(assert (=> b!821874 m!763509))

(declare-fun m!763595 () Bool)

(assert (=> b!821874 m!763595))

(assert (=> b!821867 m!763509))

(assert (=> b!821867 m!763509))

(assert (=> b!821867 m!763531))

(declare-fun m!763597 () Bool)

(assert (=> b!821875 m!763597))

(declare-fun m!763599 () Bool)

(assert (=> b!821873 m!763599))

(assert (=> b!821876 m!763513))

(declare-fun m!763601 () Bool)

(assert (=> b!821876 m!763601))

(assert (=> b!821876 m!763513))

(assert (=> b!821876 m!763515))

(assert (=> b!821876 m!763517))

(assert (=> b!821876 m!763509))

(declare-fun m!763603 () Bool)

(assert (=> b!821876 m!763603))

(declare-fun m!763605 () Bool)

(assert (=> b!821876 m!763605))

(declare-fun m!763607 () Bool)

(assert (=> b!821876 m!763607))

(assert (=> b!821876 m!763515))

(assert (=> b!821876 m!763603))

(declare-fun m!763609 () Bool)

(assert (=> b!821872 m!763609))

(assert (=> b!821877 m!763509))

(assert (=> b!821877 m!763509))

(declare-fun m!763611 () Bool)

(assert (=> b!821877 m!763611))

(assert (=> bm!35747 m!763609))

(declare-fun m!763613 () Bool)

(assert (=> d!104805 m!763613))

(assert (=> d!104805 m!763479))

(assert (=> b!821868 m!763509))

(assert (=> b!821868 m!763509))

(assert (=> b!821868 m!763531))

(assert (=> b!821728 d!104805))

(declare-fun bm!35750 () Bool)

(declare-fun call!35753 () Bool)

(declare-fun c!89276 () Bool)

(assert (=> bm!35750 (= call!35753 (arrayNoDuplicates!0 _keys!976 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!89276 (Cons!15592 (select (arr!21875 _keys!976) #b00000000000000000000000000000000) Nil!15593) Nil!15593)))))

(declare-fun b!821888 () Bool)

(declare-fun e!456843 () Bool)

(declare-fun e!456844 () Bool)

(assert (=> b!821888 (= e!456843 e!456844)))

(declare-fun res!560608 () Bool)

(assert (=> b!821888 (=> (not res!560608) (not e!456844))))

(declare-fun e!456846 () Bool)

(assert (=> b!821888 (= res!560608 (not e!456846))))

(declare-fun res!560610 () Bool)

(assert (=> b!821888 (=> (not res!560610) (not e!456846))))

(assert (=> b!821888 (= res!560610 (validKeyInArray!0 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!821889 () Bool)

(declare-fun e!456845 () Bool)

(assert (=> b!821889 (= e!456844 e!456845)))

(assert (=> b!821889 (= c!89276 (validKeyInArray!0 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun d!104807 () Bool)

(declare-fun res!560609 () Bool)

(assert (=> d!104807 (=> res!560609 e!456843)))

(assert (=> d!104807 (= res!560609 (bvsge #b00000000000000000000000000000000 (size!22296 _keys!976)))))

(assert (=> d!104807 (= (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15593) e!456843)))

(declare-fun b!821890 () Bool)

(assert (=> b!821890 (= e!456845 call!35753)))

(declare-fun b!821891 () Bool)

(assert (=> b!821891 (= e!456845 call!35753)))

(declare-fun b!821892 () Bool)

(declare-fun contains!4168 (List!15596 (_ BitVec 64)) Bool)

(assert (=> b!821892 (= e!456846 (contains!4168 Nil!15593 (select (arr!21875 _keys!976) #b00000000000000000000000000000000)))))

(assert (= (and d!104807 (not res!560609)) b!821888))

(assert (= (and b!821888 res!560610) b!821892))

(assert (= (and b!821888 res!560608) b!821889))

(assert (= (and b!821889 c!89276) b!821890))

(assert (= (and b!821889 (not c!89276)) b!821891))

(assert (= (or b!821890 b!821891) bm!35750))

(assert (=> bm!35750 m!763509))

(declare-fun m!763615 () Bool)

(assert (=> bm!35750 m!763615))

(assert (=> b!821888 m!763509))

(assert (=> b!821888 m!763509))

(assert (=> b!821888 m!763531))

(assert (=> b!821889 m!763509))

(assert (=> b!821889 m!763509))

(assert (=> b!821889 m!763531))

(assert (=> b!821892 m!763509))

(assert (=> b!821892 m!763509))

(declare-fun m!763617 () Bool)

(assert (=> b!821892 m!763617))

(assert (=> b!821722 d!104807))

(declare-fun mapNonEmpty!23704 () Bool)

(declare-fun mapRes!23704 () Bool)

(declare-fun tp!45802 () Bool)

(declare-fun e!456851 () Bool)

(assert (=> mapNonEmpty!23704 (= mapRes!23704 (and tp!45802 e!456851))))

(declare-fun mapValue!23704 () ValueCell!6948)

(declare-fun mapKey!23704 () (_ BitVec 32))

(declare-fun mapRest!23704 () (Array (_ BitVec 32) ValueCell!6948))

(assert (=> mapNonEmpty!23704 (= mapRest!23698 (store mapRest!23704 mapKey!23704 mapValue!23704))))

(declare-fun b!821899 () Bool)

(assert (=> b!821899 (= e!456851 tp_is_empty!14727)))

(declare-fun b!821900 () Bool)

(declare-fun e!456852 () Bool)

(assert (=> b!821900 (= e!456852 tp_is_empty!14727)))

(declare-fun condMapEmpty!23704 () Bool)

(declare-fun mapDefault!23704 () ValueCell!6948)

(assert (=> mapNonEmpty!23698 (= condMapEmpty!23704 (= mapRest!23698 ((as const (Array (_ BitVec 32) ValueCell!6948)) mapDefault!23704)))))

(assert (=> mapNonEmpty!23698 (= tp!45793 (and e!456852 mapRes!23704))))

(declare-fun mapIsEmpty!23704 () Bool)

(assert (=> mapIsEmpty!23704 mapRes!23704))

(assert (= (and mapNonEmpty!23698 condMapEmpty!23704) mapIsEmpty!23704))

(assert (= (and mapNonEmpty!23698 (not condMapEmpty!23704)) mapNonEmpty!23704))

(assert (= (and mapNonEmpty!23704 ((_ is ValueCellFull!6948) mapValue!23704)) b!821899))

(assert (= (and mapNonEmpty!23698 ((_ is ValueCellFull!6948) mapDefault!23704)) b!821900))

(declare-fun m!763619 () Bool)

(assert (=> mapNonEmpty!23704 m!763619))

(declare-fun b_lambda!11021 () Bool)

(assert (= b_lambda!11011 (or (and start!70744 b_free!13017) b_lambda!11021)))

(declare-fun b_lambda!11023 () Bool)

(assert (= b_lambda!11019 (or (and start!70744 b_free!13017) b_lambda!11023)))

(declare-fun b_lambda!11025 () Bool)

(assert (= b_lambda!11013 (or (and start!70744 b_free!13017) b_lambda!11025)))

(declare-fun b_lambda!11027 () Bool)

(assert (= b_lambda!11017 (or (and start!70744 b_free!13017) b_lambda!11027)))

(declare-fun b_lambda!11029 () Bool)

(assert (= b_lambda!11015 (or (and start!70744 b_free!13017) b_lambda!11029)))

(check-sat (not b!821801) (not b!821888) (not b!821876) (not bm!35739) (not b!821865) (not b!821861) (not b!821802) (not b!821804) (not bm!35747) (not b!821813) (not b!821873) (not b_lambda!11025) (not b!821863) (not b!821867) (not b!821862) (not b!821874) (not b!821889) (not bm!35734) (not b_lambda!11027) (not bm!35743) tp_is_empty!14727 (not b!821856) (not b!821807) (not b!821812) (not mapNonEmpty!23704) (not b!821828) (not b!821864) (not b!821795) (not bm!35750) (not b_lambda!11021) (not b_lambda!11023) (not b!821855) (not d!104801) (not b!821892) (not d!104805) b_and!21891 (not d!104803) (not b!821875) (not b!821827) (not b!821811) (not b!821877) (not b!821868) (not d!104797) (not b!821860) (not bm!35746) (not bm!35736) (not b_lambda!11029) (not b_next!13017) (not b!821872) (not bm!35740))
(check-sat b_and!21891 (not b_next!13017))
