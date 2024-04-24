; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37988 () Bool)

(assert start!37988)

(declare-fun b_free!8971 () Bool)

(declare-fun b_next!8971 () Bool)

(assert (=> start!37988 (= b_free!8971 (not b_next!8971))))

(declare-fun tp!31682 () Bool)

(declare-fun b_and!16299 () Bool)

(assert (=> start!37988 (= tp!31682 b_and!16299)))

(declare-fun b!390996 () Bool)

(declare-fun res!223805 () Bool)

(declare-fun e!236831 () Bool)

(assert (=> b!390996 (=> (not res!223805) (not e!236831))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390996 (= res!223805 (validKeyInArray!0 k0!778))))

(declare-fun b!390997 () Bool)

(declare-fun res!223806 () Bool)

(declare-fun e!236830 () Bool)

(assert (=> b!390997 (=> (not res!223806) (not e!236830))))

(declare-datatypes ((array!23172 0))(
  ( (array!23173 (arr!11048 (Array (_ BitVec 32) (_ BitVec 64))) (size!11400 (_ BitVec 32))) )
))
(declare-fun lt!184444 () array!23172)

(declare-datatypes ((List!6267 0))(
  ( (Nil!6264) (Cons!6263 (h!7119 (_ BitVec 64)) (t!11421 List!6267)) )
))
(declare-fun arrayNoDuplicates!0 (array!23172 (_ BitVec 32) List!6267) Bool)

(assert (=> b!390997 (= res!223806 (arrayNoDuplicates!0 lt!184444 #b00000000000000000000000000000000 Nil!6264))))

(declare-fun b!390998 () Bool)

(declare-fun e!236828 () Bool)

(assert (=> b!390998 (= e!236830 (not e!236828))))

(declare-fun res!223799 () Bool)

(assert (=> b!390998 (=> res!223799 e!236828)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390998 (= res!223799 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-datatypes ((V!13963 0))(
  ( (V!13964 (val!4866 Int)) )
))
(declare-datatypes ((ValueCell!4478 0))(
  ( (ValueCellFull!4478 (v!7088 V!13963)) (EmptyCell!4478) )
))
(declare-datatypes ((array!23174 0))(
  ( (array!23175 (arr!11049 (Array (_ BitVec 32) ValueCell!4478)) (size!11401 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23174)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6418 0))(
  ( (tuple2!6419 (_1!3220 (_ BitVec 64)) (_2!3220 V!13963)) )
))
(declare-datatypes ((List!6268 0))(
  ( (Nil!6265) (Cons!6264 (h!7120 tuple2!6418) (t!11422 List!6268)) )
))
(declare-datatypes ((ListLongMap!5333 0))(
  ( (ListLongMap!5334 (toList!2682 List!6268)) )
))
(declare-fun lt!184445 () ListLongMap!5333)

(declare-fun zeroValue!472 () V!13963)

(declare-fun _keys!658 () array!23172)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun minValue!472 () V!13963)

(declare-fun getCurrentListMap!2064 (array!23172 array!23174 (_ BitVec 32) (_ BitVec 32) V!13963 V!13963 (_ BitVec 32) Int) ListLongMap!5333)

(assert (=> b!390998 (= lt!184445 (getCurrentListMap!2064 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184446 () array!23174)

(declare-fun lt!184449 () ListLongMap!5333)

(assert (=> b!390998 (= lt!184449 (getCurrentListMap!2064 lt!184444 lt!184446 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184447 () ListLongMap!5333)

(declare-fun lt!184450 () ListLongMap!5333)

(assert (=> b!390998 (and (= lt!184447 lt!184450) (= lt!184450 lt!184447))))

(declare-fun v!373 () V!13963)

(declare-fun lt!184451 () ListLongMap!5333)

(declare-fun +!1036 (ListLongMap!5333 tuple2!6418) ListLongMap!5333)

(assert (=> b!390998 (= lt!184450 (+!1036 lt!184451 (tuple2!6419 k0!778 v!373)))))

(declare-datatypes ((Unit!11947 0))(
  ( (Unit!11948) )
))
(declare-fun lt!184443 () Unit!11947)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!255 (array!23172 array!23174 (_ BitVec 32) (_ BitVec 32) V!13963 V!13963 (_ BitVec 32) (_ BitVec 64) V!13963 (_ BitVec 32) Int) Unit!11947)

(assert (=> b!390998 (= lt!184443 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!255 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!953 (array!23172 array!23174 (_ BitVec 32) (_ BitVec 32) V!13963 V!13963 (_ BitVec 32) Int) ListLongMap!5333)

(assert (=> b!390998 (= lt!184447 (getCurrentListMapNoExtraKeys!953 lt!184444 lt!184446 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390998 (= lt!184446 (array!23175 (store (arr!11049 _values!506) i!548 (ValueCellFull!4478 v!373)) (size!11401 _values!506)))))

(assert (=> b!390998 (= lt!184451 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390999 () Bool)

(declare-fun e!236832 () Bool)

(declare-fun e!236833 () Bool)

(declare-fun mapRes!16047 () Bool)

(assert (=> b!390999 (= e!236832 (and e!236833 mapRes!16047))))

(declare-fun condMapEmpty!16047 () Bool)

(declare-fun mapDefault!16047 () ValueCell!4478)

(assert (=> b!390999 (= condMapEmpty!16047 (= (arr!11049 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4478)) mapDefault!16047)))))

(declare-fun b!391000 () Bool)

(assert (=> b!391000 (= e!236828 (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!236827 () Bool)

(assert (=> b!391000 e!236827))

(declare-fun res!223810 () Bool)

(assert (=> b!391000 (=> (not res!223810) (not e!236827))))

(declare-fun lt!184448 () tuple2!6418)

(assert (=> b!391000 (= res!223810 (= lt!184449 (+!1036 lt!184447 lt!184448)))))

(assert (=> b!391000 (= lt!184448 (tuple2!6419 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun mapIsEmpty!16047 () Bool)

(assert (=> mapIsEmpty!16047 mapRes!16047))

(declare-fun b!391001 () Bool)

(assert (=> b!391001 (= e!236827 (= lt!184449 (+!1036 lt!184450 lt!184448)))))

(declare-fun b!391002 () Bool)

(declare-fun res!223800 () Bool)

(assert (=> b!391002 (=> (not res!223800) (not e!236831))))

(assert (=> b!391002 (= res!223800 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6264))))

(declare-fun res!223803 () Bool)

(assert (=> start!37988 (=> (not res!223803) (not e!236831))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37988 (= res!223803 (validMask!0 mask!970))))

(assert (=> start!37988 e!236831))

(declare-fun array_inv!8170 (array!23174) Bool)

(assert (=> start!37988 (and (array_inv!8170 _values!506) e!236832)))

(assert (=> start!37988 tp!31682))

(assert (=> start!37988 true))

(declare-fun tp_is_empty!9643 () Bool)

(assert (=> start!37988 tp_is_empty!9643))

(declare-fun array_inv!8171 (array!23172) Bool)

(assert (=> start!37988 (array_inv!8171 _keys!658)))

(declare-fun b!391003 () Bool)

(declare-fun res!223801 () Bool)

(assert (=> b!391003 (=> (not res!223801) (not e!236831))))

(assert (=> b!391003 (= res!223801 (or (= (select (arr!11048 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11048 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391004 () Bool)

(assert (=> b!391004 (= e!236833 tp_is_empty!9643)))

(declare-fun b!391005 () Bool)

(declare-fun e!236826 () Bool)

(assert (=> b!391005 (= e!236826 tp_is_empty!9643)))

(declare-fun b!391006 () Bool)

(declare-fun res!223808 () Bool)

(assert (=> b!391006 (=> (not res!223808) (not e!236831))))

(assert (=> b!391006 (= res!223808 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11400 _keys!658))))))

(declare-fun b!391007 () Bool)

(declare-fun res!223802 () Bool)

(assert (=> b!391007 (=> (not res!223802) (not e!236831))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23172 (_ BitVec 32)) Bool)

(assert (=> b!391007 (= res!223802 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!391008 () Bool)

(assert (=> b!391008 (= e!236831 e!236830)))

(declare-fun res!223809 () Bool)

(assert (=> b!391008 (=> (not res!223809) (not e!236830))))

(assert (=> b!391008 (= res!223809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184444 mask!970))))

(assert (=> b!391008 (= lt!184444 (array!23173 (store (arr!11048 _keys!658) i!548 k0!778) (size!11400 _keys!658)))))

(declare-fun b!391009 () Bool)

(declare-fun res!223807 () Bool)

(assert (=> b!391009 (=> (not res!223807) (not e!236831))))

(assert (=> b!391009 (= res!223807 (and (= (size!11401 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11400 _keys!658) (size!11401 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!391010 () Bool)

(declare-fun res!223798 () Bool)

(assert (=> b!391010 (=> (not res!223798) (not e!236831))))

(declare-fun arrayContainsKey!0 (array!23172 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!391010 (= res!223798 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!391011 () Bool)

(declare-fun res!223804 () Bool)

(assert (=> b!391011 (=> (not res!223804) (not e!236827))))

(assert (=> b!391011 (= res!223804 (= lt!184445 (+!1036 lt!184451 lt!184448)))))

(declare-fun mapNonEmpty!16047 () Bool)

(declare-fun tp!31683 () Bool)

(assert (=> mapNonEmpty!16047 (= mapRes!16047 (and tp!31683 e!236826))))

(declare-fun mapKey!16047 () (_ BitVec 32))

(declare-fun mapRest!16047 () (Array (_ BitVec 32) ValueCell!4478))

(declare-fun mapValue!16047 () ValueCell!4478)

(assert (=> mapNonEmpty!16047 (= (arr!11049 _values!506) (store mapRest!16047 mapKey!16047 mapValue!16047))))

(assert (= (and start!37988 res!223803) b!391009))

(assert (= (and b!391009 res!223807) b!391007))

(assert (= (and b!391007 res!223802) b!391002))

(assert (= (and b!391002 res!223800) b!391006))

(assert (= (and b!391006 res!223808) b!390996))

(assert (= (and b!390996 res!223805) b!391003))

(assert (= (and b!391003 res!223801) b!391010))

(assert (= (and b!391010 res!223798) b!391008))

(assert (= (and b!391008 res!223809) b!390997))

(assert (= (and b!390997 res!223806) b!390998))

(assert (= (and b!390998 (not res!223799)) b!391000))

(assert (= (and b!391000 res!223810) b!391011))

(assert (= (and b!391011 res!223804) b!391001))

(assert (= (and b!390999 condMapEmpty!16047) mapIsEmpty!16047))

(assert (= (and b!390999 (not condMapEmpty!16047)) mapNonEmpty!16047))

(get-info :version)

(assert (= (and mapNonEmpty!16047 ((_ is ValueCellFull!4478) mapValue!16047)) b!391005))

(assert (= (and b!390999 ((_ is ValueCellFull!4478) mapDefault!16047)) b!391004))

(assert (= start!37988 b!390999))

(declare-fun m!387621 () Bool)

(assert (=> start!37988 m!387621))

(declare-fun m!387623 () Bool)

(assert (=> start!37988 m!387623))

(declare-fun m!387625 () Bool)

(assert (=> start!37988 m!387625))

(declare-fun m!387627 () Bool)

(assert (=> b!391008 m!387627))

(declare-fun m!387629 () Bool)

(assert (=> b!391008 m!387629))

(declare-fun m!387631 () Bool)

(assert (=> b!391003 m!387631))

(declare-fun m!387633 () Bool)

(assert (=> b!391007 m!387633))

(declare-fun m!387635 () Bool)

(assert (=> b!391011 m!387635))

(declare-fun m!387637 () Bool)

(assert (=> b!390997 m!387637))

(declare-fun m!387639 () Bool)

(assert (=> b!391002 m!387639))

(declare-fun m!387641 () Bool)

(assert (=> b!390998 m!387641))

(declare-fun m!387643 () Bool)

(assert (=> b!390998 m!387643))

(declare-fun m!387645 () Bool)

(assert (=> b!390998 m!387645))

(declare-fun m!387647 () Bool)

(assert (=> b!390998 m!387647))

(declare-fun m!387649 () Bool)

(assert (=> b!390998 m!387649))

(declare-fun m!387651 () Bool)

(assert (=> b!390998 m!387651))

(declare-fun m!387653 () Bool)

(assert (=> b!390998 m!387653))

(declare-fun m!387655 () Bool)

(assert (=> b!391000 m!387655))

(declare-fun m!387657 () Bool)

(assert (=> b!391001 m!387657))

(declare-fun m!387659 () Bool)

(assert (=> mapNonEmpty!16047 m!387659))

(declare-fun m!387661 () Bool)

(assert (=> b!391010 m!387661))

(declare-fun m!387663 () Bool)

(assert (=> b!390996 m!387663))

(check-sat (not b!390996) (not b!391007) (not b!391002) (not b_next!8971) (not b!391010) (not mapNonEmpty!16047) tp_is_empty!9643 (not b!391001) (not start!37988) (not b!391011) (not b!391008) (not b!390997) (not b!390998) (not b!391000) b_and!16299)
(check-sat b_and!16299 (not b_next!8971))
(get-model)

(declare-fun b!391116 () Bool)

(declare-fun e!236890 () Bool)

(declare-fun call!27574 () Bool)

(assert (=> b!391116 (= e!236890 call!27574)))

(declare-fun d!73077 () Bool)

(declare-fun res!223893 () Bool)

(declare-fun e!236888 () Bool)

(assert (=> d!73077 (=> res!223893 e!236888)))

(assert (=> d!73077 (= res!223893 (bvsge #b00000000000000000000000000000000 (size!11400 _keys!658)))))

(assert (=> d!73077 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!236888)))

(declare-fun b!391117 () Bool)

(declare-fun e!236889 () Bool)

(assert (=> b!391117 (= e!236889 call!27574)))

(declare-fun b!391118 () Bool)

(assert (=> b!391118 (= e!236889 e!236890)))

(declare-fun lt!184513 () (_ BitVec 64))

(assert (=> b!391118 (= lt!184513 (select (arr!11048 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184514 () Unit!11947)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23172 (_ BitVec 64) (_ BitVec 32)) Unit!11947)

(assert (=> b!391118 (= lt!184514 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!184513 #b00000000000000000000000000000000))))

(assert (=> b!391118 (arrayContainsKey!0 _keys!658 lt!184513 #b00000000000000000000000000000000)))

(declare-fun lt!184512 () Unit!11947)

(assert (=> b!391118 (= lt!184512 lt!184514)))

(declare-fun res!223894 () Bool)

(declare-datatypes ((SeekEntryResult!3463 0))(
  ( (MissingZero!3463 (index!16031 (_ BitVec 32))) (Found!3463 (index!16032 (_ BitVec 32))) (Intermediate!3463 (undefined!4275 Bool) (index!16033 (_ BitVec 32)) (x!38287 (_ BitVec 32))) (Undefined!3463) (MissingVacant!3463 (index!16034 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23172 (_ BitVec 32)) SeekEntryResult!3463)

(assert (=> b!391118 (= res!223894 (= (seekEntryOrOpen!0 (select (arr!11048 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3463 #b00000000000000000000000000000000)))))

(assert (=> b!391118 (=> (not res!223894) (not e!236890))))

(declare-fun bm!27571 () Bool)

(assert (=> bm!27571 (= call!27574 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!391119 () Bool)

(assert (=> b!391119 (= e!236888 e!236889)))

(declare-fun c!54210 () Bool)

(assert (=> b!391119 (= c!54210 (validKeyInArray!0 (select (arr!11048 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73077 (not res!223893)) b!391119))

(assert (= (and b!391119 c!54210) b!391118))

(assert (= (and b!391119 (not c!54210)) b!391117))

(assert (= (and b!391118 res!223894) b!391116))

(assert (= (or b!391116 b!391117) bm!27571))

(declare-fun m!387753 () Bool)

(assert (=> b!391118 m!387753))

(declare-fun m!387755 () Bool)

(assert (=> b!391118 m!387755))

(declare-fun m!387757 () Bool)

(assert (=> b!391118 m!387757))

(assert (=> b!391118 m!387753))

(declare-fun m!387759 () Bool)

(assert (=> b!391118 m!387759))

(declare-fun m!387761 () Bool)

(assert (=> bm!27571 m!387761))

(assert (=> b!391119 m!387753))

(assert (=> b!391119 m!387753))

(declare-fun m!387763 () Bool)

(assert (=> b!391119 m!387763))

(assert (=> b!391007 d!73077))

(declare-fun b!391130 () Bool)

(declare-fun e!236902 () Bool)

(declare-fun call!27577 () Bool)

(assert (=> b!391130 (= e!236902 call!27577)))

(declare-fun b!391131 () Bool)

(declare-fun e!236901 () Bool)

(declare-fun e!236899 () Bool)

(assert (=> b!391131 (= e!236901 e!236899)))

(declare-fun res!223903 () Bool)

(assert (=> b!391131 (=> (not res!223903) (not e!236899))))

(declare-fun e!236900 () Bool)

(assert (=> b!391131 (= res!223903 (not e!236900))))

(declare-fun res!223901 () Bool)

(assert (=> b!391131 (=> (not res!223901) (not e!236900))))

(assert (=> b!391131 (= res!223901 (validKeyInArray!0 (select (arr!11048 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391132 () Bool)

(assert (=> b!391132 (= e!236902 call!27577)))

(declare-fun bm!27574 () Bool)

(declare-fun c!54213 () Bool)

(assert (=> bm!27574 (= call!27577 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54213 (Cons!6263 (select (arr!11048 _keys!658) #b00000000000000000000000000000000) Nil!6264) Nil!6264)))))

(declare-fun d!73079 () Bool)

(declare-fun res!223902 () Bool)

(assert (=> d!73079 (=> res!223902 e!236901)))

(assert (=> d!73079 (= res!223902 (bvsge #b00000000000000000000000000000000 (size!11400 _keys!658)))))

(assert (=> d!73079 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6264) e!236901)))

(declare-fun b!391133 () Bool)

(assert (=> b!391133 (= e!236899 e!236902)))

(assert (=> b!391133 (= c!54213 (validKeyInArray!0 (select (arr!11048 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391134 () Bool)

(declare-fun contains!2437 (List!6267 (_ BitVec 64)) Bool)

(assert (=> b!391134 (= e!236900 (contains!2437 Nil!6264 (select (arr!11048 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73079 (not res!223902)) b!391131))

(assert (= (and b!391131 res!223901) b!391134))

(assert (= (and b!391131 res!223903) b!391133))

(assert (= (and b!391133 c!54213) b!391130))

(assert (= (and b!391133 (not c!54213)) b!391132))

(assert (= (or b!391130 b!391132) bm!27574))

(assert (=> b!391131 m!387753))

(assert (=> b!391131 m!387753))

(assert (=> b!391131 m!387763))

(assert (=> bm!27574 m!387753))

(declare-fun m!387765 () Bool)

(assert (=> bm!27574 m!387765))

(assert (=> b!391133 m!387753))

(assert (=> b!391133 m!387753))

(assert (=> b!391133 m!387763))

(assert (=> b!391134 m!387753))

(assert (=> b!391134 m!387753))

(declare-fun m!387767 () Bool)

(assert (=> b!391134 m!387767))

(assert (=> b!391002 d!73079))

(declare-fun d!73081 () Bool)

(assert (=> d!73081 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37988 d!73081))

(declare-fun d!73083 () Bool)

(assert (=> d!73083 (= (array_inv!8170 _values!506) (bvsge (size!11401 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37988 d!73083))

(declare-fun d!73085 () Bool)

(assert (=> d!73085 (= (array_inv!8171 _keys!658) (bvsge (size!11400 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37988 d!73085))

(declare-fun b!391159 () Bool)

(declare-fun lt!184532 () Unit!11947)

(declare-fun lt!184529 () Unit!11947)

(assert (=> b!391159 (= lt!184532 lt!184529)))

(declare-fun lt!184534 () V!13963)

(declare-fun lt!184533 () ListLongMap!5333)

(declare-fun lt!184535 () (_ BitVec 64))

(declare-fun lt!184530 () (_ BitVec 64))

(declare-fun contains!2438 (ListLongMap!5333 (_ BitVec 64)) Bool)

(assert (=> b!391159 (not (contains!2438 (+!1036 lt!184533 (tuple2!6419 lt!184535 lt!184534)) lt!184530))))

(declare-fun addStillNotContains!138 (ListLongMap!5333 (_ BitVec 64) V!13963 (_ BitVec 64)) Unit!11947)

(assert (=> b!391159 (= lt!184529 (addStillNotContains!138 lt!184533 lt!184535 lt!184534 lt!184530))))

(assert (=> b!391159 (= lt!184530 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!5597 (ValueCell!4478 V!13963) V!13963)

(declare-fun dynLambda!646 (Int (_ BitVec 64)) V!13963)

(assert (=> b!391159 (= lt!184534 (get!5597 (select (arr!11049 _values!506) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!391159 (= lt!184535 (select (arr!11048 _keys!658) #b00000000000000000000000000000000))))

(declare-fun call!27580 () ListLongMap!5333)

(assert (=> b!391159 (= lt!184533 call!27580)))

(declare-fun e!236921 () ListLongMap!5333)

(assert (=> b!391159 (= e!236921 (+!1036 call!27580 (tuple2!6419 (select (arr!11048 _keys!658) #b00000000000000000000000000000000) (get!5597 (select (arr!11049 _values!506) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!391160 () Bool)

(declare-fun res!223915 () Bool)

(declare-fun e!236920 () Bool)

(assert (=> b!391160 (=> (not res!223915) (not e!236920))))

(declare-fun lt!184531 () ListLongMap!5333)

(assert (=> b!391160 (= res!223915 (not (contains!2438 lt!184531 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391161 () Bool)

(declare-fun e!236922 () Bool)

(declare-fun isEmpty!555 (ListLongMap!5333) Bool)

(assert (=> b!391161 (= e!236922 (isEmpty!555 lt!184531))))

(declare-fun b!391162 () Bool)

(declare-fun e!236919 () Bool)

(declare-fun e!236917 () Bool)

(assert (=> b!391162 (= e!236919 e!236917)))

(assert (=> b!391162 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11400 _keys!658)))))

(declare-fun res!223912 () Bool)

(assert (=> b!391162 (= res!223912 (contains!2438 lt!184531 (select (arr!11048 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391162 (=> (not res!223912) (not e!236917))))

(declare-fun bm!27577 () Bool)

(assert (=> bm!27577 (= call!27580 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!391163 () Bool)

(assert (=> b!391163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11400 _keys!658)))))

(assert (=> b!391163 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11401 _values!506)))))

(declare-fun apply!303 (ListLongMap!5333 (_ BitVec 64)) V!13963)

(assert (=> b!391163 (= e!236917 (= (apply!303 lt!184531 (select (arr!11048 _keys!658) #b00000000000000000000000000000000)) (get!5597 (select (arr!11049 _values!506) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!73087 () Bool)

(assert (=> d!73087 e!236920))

(declare-fun res!223913 () Bool)

(assert (=> d!73087 (=> (not res!223913) (not e!236920))))

(assert (=> d!73087 (= res!223913 (not (contains!2438 lt!184531 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!236918 () ListLongMap!5333)

(assert (=> d!73087 (= lt!184531 e!236918)))

(declare-fun c!54222 () Bool)

(assert (=> d!73087 (= c!54222 (bvsge #b00000000000000000000000000000000 (size!11400 _keys!658)))))

(assert (=> d!73087 (validMask!0 mask!970)))

(assert (=> d!73087 (= (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184531)))

(declare-fun b!391164 () Bool)

(assert (=> b!391164 (= e!236918 (ListLongMap!5334 Nil!6265))))

(declare-fun b!391165 () Bool)

(assert (=> b!391165 (= e!236921 call!27580)))

(declare-fun b!391166 () Bool)

(assert (=> b!391166 (= e!236922 (= lt!184531 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!391167 () Bool)

(assert (=> b!391167 (= e!236920 e!236919)))

(declare-fun c!54223 () Bool)

(declare-fun e!236923 () Bool)

(assert (=> b!391167 (= c!54223 e!236923)))

(declare-fun res!223914 () Bool)

(assert (=> b!391167 (=> (not res!223914) (not e!236923))))

(assert (=> b!391167 (= res!223914 (bvslt #b00000000000000000000000000000000 (size!11400 _keys!658)))))

(declare-fun b!391168 () Bool)

(assert (=> b!391168 (= e!236923 (validKeyInArray!0 (select (arr!11048 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391168 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!391169 () Bool)

(assert (=> b!391169 (= e!236919 e!236922)))

(declare-fun c!54224 () Bool)

(assert (=> b!391169 (= c!54224 (bvslt #b00000000000000000000000000000000 (size!11400 _keys!658)))))

(declare-fun b!391170 () Bool)

(assert (=> b!391170 (= e!236918 e!236921)))

(declare-fun c!54225 () Bool)

(assert (=> b!391170 (= c!54225 (validKeyInArray!0 (select (arr!11048 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73087 c!54222) b!391164))

(assert (= (and d!73087 (not c!54222)) b!391170))

(assert (= (and b!391170 c!54225) b!391159))

(assert (= (and b!391170 (not c!54225)) b!391165))

(assert (= (or b!391159 b!391165) bm!27577))

(assert (= (and d!73087 res!223913) b!391160))

(assert (= (and b!391160 res!223915) b!391167))

(assert (= (and b!391167 res!223914) b!391168))

(assert (= (and b!391167 c!54223) b!391162))

(assert (= (and b!391167 (not c!54223)) b!391169))

(assert (= (and b!391162 res!223912) b!391163))

(assert (= (and b!391169 c!54224) b!391166))

(assert (= (and b!391169 (not c!54224)) b!391161))

(declare-fun b_lambda!8693 () Bool)

(assert (=> (not b_lambda!8693) (not b!391159)))

(declare-fun t!11428 () Bool)

(declare-fun tb!3113 () Bool)

(assert (=> (and start!37988 (= defaultEntry!514 defaultEntry!514) t!11428) tb!3113))

(declare-fun result!5735 () Bool)

(assert (=> tb!3113 (= result!5735 tp_is_empty!9643)))

(assert (=> b!391159 t!11428))

(declare-fun b_and!16305 () Bool)

(assert (= b_and!16299 (and (=> t!11428 result!5735) b_and!16305)))

(declare-fun b_lambda!8695 () Bool)

(assert (=> (not b_lambda!8695) (not b!391163)))

(assert (=> b!391163 t!11428))

(declare-fun b_and!16307 () Bool)

(assert (= b_and!16305 (and (=> t!11428 result!5735) b_and!16307)))

(declare-fun m!387769 () Bool)

(assert (=> bm!27577 m!387769))

(assert (=> b!391168 m!387753))

(assert (=> b!391168 m!387753))

(assert (=> b!391168 m!387763))

(declare-fun m!387771 () Bool)

(assert (=> b!391160 m!387771))

(declare-fun m!387773 () Bool)

(assert (=> b!391163 m!387773))

(declare-fun m!387775 () Bool)

(assert (=> b!391163 m!387775))

(declare-fun m!387777 () Bool)

(assert (=> b!391163 m!387777))

(assert (=> b!391163 m!387775))

(assert (=> b!391163 m!387753))

(declare-fun m!387779 () Bool)

(assert (=> b!391163 m!387779))

(assert (=> b!391163 m!387753))

(assert (=> b!391163 m!387773))

(assert (=> b!391162 m!387753))

(assert (=> b!391162 m!387753))

(declare-fun m!387781 () Bool)

(assert (=> b!391162 m!387781))

(declare-fun m!387783 () Bool)

(assert (=> b!391161 m!387783))

(assert (=> b!391170 m!387753))

(assert (=> b!391170 m!387753))

(assert (=> b!391170 m!387763))

(declare-fun m!387785 () Bool)

(assert (=> d!73087 m!387785))

(assert (=> d!73087 m!387621))

(declare-fun m!387787 () Bool)

(assert (=> b!391159 m!387787))

(declare-fun m!387789 () Bool)

(assert (=> b!391159 m!387789))

(assert (=> b!391159 m!387789))

(declare-fun m!387791 () Bool)

(assert (=> b!391159 m!387791))

(assert (=> b!391159 m!387773))

(assert (=> b!391159 m!387775))

(assert (=> b!391159 m!387777))

(assert (=> b!391159 m!387775))

(declare-fun m!387793 () Bool)

(assert (=> b!391159 m!387793))

(assert (=> b!391159 m!387753))

(assert (=> b!391159 m!387773))

(assert (=> b!391166 m!387769))

(assert (=> b!390998 d!73087))

(declare-fun b!391215 () Bool)

(declare-fun e!236959 () Bool)

(declare-fun e!236962 () Bool)

(assert (=> b!391215 (= e!236959 e!236962)))

(declare-fun res!223941 () Bool)

(assert (=> b!391215 (=> (not res!223941) (not e!236962))))

(declare-fun lt!184593 () ListLongMap!5333)

(assert (=> b!391215 (= res!223941 (contains!2438 lt!184593 (select (arr!11048 lt!184444) #b00000000000000000000000000000000)))))

(assert (=> b!391215 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11400 lt!184444)))))

(declare-fun b!391216 () Bool)

(declare-fun res!223939 () Bool)

(declare-fun e!236953 () Bool)

(assert (=> b!391216 (=> (not res!223939) (not e!236953))))

(declare-fun e!236950 () Bool)

(assert (=> b!391216 (= res!223939 e!236950)))

(declare-fun c!54238 () Bool)

(assert (=> b!391216 (= c!54238 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!391217 () Bool)

(declare-fun res!223940 () Bool)

(assert (=> b!391217 (=> (not res!223940) (not e!236953))))

(assert (=> b!391217 (= res!223940 e!236959)))

(declare-fun res!223934 () Bool)

(assert (=> b!391217 (=> res!223934 e!236959)))

(declare-fun e!236958 () Bool)

(assert (=> b!391217 (= res!223934 (not e!236958))))

(declare-fun res!223942 () Bool)

(assert (=> b!391217 (=> (not res!223942) (not e!236958))))

(assert (=> b!391217 (= res!223942 (bvslt #b00000000000000000000000000000000 (size!11400 lt!184444)))))

(declare-fun b!391218 () Bool)

(declare-fun e!236956 () ListLongMap!5333)

(declare-fun e!236954 () ListLongMap!5333)

(assert (=> b!391218 (= e!236956 e!236954)))

(declare-fun c!54243 () Bool)

(assert (=> b!391218 (= c!54243 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391219 () Bool)

(declare-fun call!27601 () ListLongMap!5333)

(assert (=> b!391219 (= e!236956 (+!1036 call!27601 (tuple2!6419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!391220 () Bool)

(declare-fun e!236961 () Unit!11947)

(declare-fun Unit!11951 () Unit!11947)

(assert (=> b!391220 (= e!236961 Unit!11951)))

(declare-fun b!391221 () Bool)

(declare-fun call!27598 () Bool)

(assert (=> b!391221 (= e!236950 (not call!27598))))

(declare-fun b!391222 () Bool)

(declare-fun call!27596 () ListLongMap!5333)

(assert (=> b!391222 (= e!236954 call!27596)))

(declare-fun b!391223 () Bool)

(assert (=> b!391223 (= e!236958 (validKeyInArray!0 (select (arr!11048 lt!184444) #b00000000000000000000000000000000)))))

(declare-fun bm!27592 () Bool)

(assert (=> bm!27592 (= call!27596 call!27601)))

(declare-fun b!391224 () Bool)

(declare-fun e!236955 () Bool)

(assert (=> b!391224 (= e!236950 e!236955)))

(declare-fun res!223937 () Bool)

(assert (=> b!391224 (= res!223937 call!27598)))

(assert (=> b!391224 (=> (not res!223937) (not e!236955))))

(declare-fun b!391225 () Bool)

(declare-fun e!236952 () Bool)

(assert (=> b!391225 (= e!236952 (= (apply!303 lt!184593 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27593 () Bool)

(declare-fun call!27595 () Bool)

(assert (=> bm!27593 (= call!27595 (contains!2438 lt!184593 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27594 () Bool)

(declare-fun call!27599 () ListLongMap!5333)

(declare-fun call!27600 () ListLongMap!5333)

(assert (=> bm!27594 (= call!27599 call!27600)))

(declare-fun bm!27595 () Bool)

(declare-fun call!27597 () ListLongMap!5333)

(declare-fun c!54241 () Bool)

(assert (=> bm!27595 (= call!27601 (+!1036 (ite c!54241 call!27600 (ite c!54243 call!27599 call!27597)) (ite (or c!54241 c!54243) (tuple2!6419 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!391226 () Bool)

(declare-fun e!236957 () Bool)

(assert (=> b!391226 (= e!236957 (not call!27595))))

(declare-fun b!391227 () Bool)

(assert (=> b!391227 (= e!236955 (= (apply!303 lt!184593 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27596 () Bool)

(assert (=> bm!27596 (= call!27600 (getCurrentListMapNoExtraKeys!953 lt!184444 lt!184446 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391228 () Bool)

(assert (=> b!391228 (= e!236957 e!236952)))

(declare-fun res!223938 () Bool)

(assert (=> b!391228 (= res!223938 call!27595)))

(assert (=> b!391228 (=> (not res!223938) (not e!236952))))

(declare-fun b!391229 () Bool)

(declare-fun e!236960 () ListLongMap!5333)

(assert (=> b!391229 (= e!236960 call!27596)))

(declare-fun b!391230 () Bool)

(declare-fun c!54240 () Bool)

(assert (=> b!391230 (= c!54240 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!391230 (= e!236954 e!236960)))

(declare-fun bm!27597 () Bool)

(assert (=> bm!27597 (= call!27597 call!27599)))

(declare-fun bm!27598 () Bool)

(assert (=> bm!27598 (= call!27598 (contains!2438 lt!184593 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!391231 () Bool)

(declare-fun lt!184598 () Unit!11947)

(assert (=> b!391231 (= e!236961 lt!184598)))

(declare-fun lt!184600 () ListLongMap!5333)

(assert (=> b!391231 (= lt!184600 (getCurrentListMapNoExtraKeys!953 lt!184444 lt!184446 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184592 () (_ BitVec 64))

(assert (=> b!391231 (= lt!184592 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184599 () (_ BitVec 64))

(assert (=> b!391231 (= lt!184599 (select (arr!11048 lt!184444) #b00000000000000000000000000000000))))

(declare-fun lt!184595 () Unit!11947)

(declare-fun addStillContains!279 (ListLongMap!5333 (_ BitVec 64) V!13963 (_ BitVec 64)) Unit!11947)

(assert (=> b!391231 (= lt!184595 (addStillContains!279 lt!184600 lt!184592 zeroValue!472 lt!184599))))

(assert (=> b!391231 (contains!2438 (+!1036 lt!184600 (tuple2!6419 lt!184592 zeroValue!472)) lt!184599)))

(declare-fun lt!184584 () Unit!11947)

(assert (=> b!391231 (= lt!184584 lt!184595)))

(declare-fun lt!184581 () ListLongMap!5333)

(assert (=> b!391231 (= lt!184581 (getCurrentListMapNoExtraKeys!953 lt!184444 lt!184446 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184591 () (_ BitVec 64))

(assert (=> b!391231 (= lt!184591 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184583 () (_ BitVec 64))

(assert (=> b!391231 (= lt!184583 (select (arr!11048 lt!184444) #b00000000000000000000000000000000))))

(declare-fun lt!184588 () Unit!11947)

(declare-fun addApplyDifferent!279 (ListLongMap!5333 (_ BitVec 64) V!13963 (_ BitVec 64)) Unit!11947)

(assert (=> b!391231 (= lt!184588 (addApplyDifferent!279 lt!184581 lt!184591 minValue!472 lt!184583))))

(assert (=> b!391231 (= (apply!303 (+!1036 lt!184581 (tuple2!6419 lt!184591 minValue!472)) lt!184583) (apply!303 lt!184581 lt!184583))))

(declare-fun lt!184601 () Unit!11947)

(assert (=> b!391231 (= lt!184601 lt!184588)))

(declare-fun lt!184587 () ListLongMap!5333)

(assert (=> b!391231 (= lt!184587 (getCurrentListMapNoExtraKeys!953 lt!184444 lt!184446 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184586 () (_ BitVec 64))

(assert (=> b!391231 (= lt!184586 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184580 () (_ BitVec 64))

(assert (=> b!391231 (= lt!184580 (select (arr!11048 lt!184444) #b00000000000000000000000000000000))))

(declare-fun lt!184585 () Unit!11947)

(assert (=> b!391231 (= lt!184585 (addApplyDifferent!279 lt!184587 lt!184586 zeroValue!472 lt!184580))))

(assert (=> b!391231 (= (apply!303 (+!1036 lt!184587 (tuple2!6419 lt!184586 zeroValue!472)) lt!184580) (apply!303 lt!184587 lt!184580))))

(declare-fun lt!184582 () Unit!11947)

(assert (=> b!391231 (= lt!184582 lt!184585)))

(declare-fun lt!184594 () ListLongMap!5333)

(assert (=> b!391231 (= lt!184594 (getCurrentListMapNoExtraKeys!953 lt!184444 lt!184446 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184596 () (_ BitVec 64))

(assert (=> b!391231 (= lt!184596 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184590 () (_ BitVec 64))

(assert (=> b!391231 (= lt!184590 (select (arr!11048 lt!184444) #b00000000000000000000000000000000))))

(assert (=> b!391231 (= lt!184598 (addApplyDifferent!279 lt!184594 lt!184596 minValue!472 lt!184590))))

(assert (=> b!391231 (= (apply!303 (+!1036 lt!184594 (tuple2!6419 lt!184596 minValue!472)) lt!184590) (apply!303 lt!184594 lt!184590))))

(declare-fun b!391232 () Bool)

(assert (=> b!391232 (= e!236962 (= (apply!303 lt!184593 (select (arr!11048 lt!184444) #b00000000000000000000000000000000)) (get!5597 (select (arr!11049 lt!184446) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391232 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11401 lt!184446)))))

(assert (=> b!391232 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11400 lt!184444)))))

(declare-fun b!391233 () Bool)

(assert (=> b!391233 (= e!236960 call!27597)))

(declare-fun b!391235 () Bool)

(assert (=> b!391235 (= e!236953 e!236957)))

(declare-fun c!54239 () Bool)

(assert (=> b!391235 (= c!54239 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!73089 () Bool)

(assert (=> d!73089 e!236953))

(declare-fun res!223936 () Bool)

(assert (=> d!73089 (=> (not res!223936) (not e!236953))))

(assert (=> d!73089 (= res!223936 (or (bvsge #b00000000000000000000000000000000 (size!11400 lt!184444)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11400 lt!184444)))))))

(declare-fun lt!184597 () ListLongMap!5333)

(assert (=> d!73089 (= lt!184593 lt!184597)))

(declare-fun lt!184589 () Unit!11947)

(assert (=> d!73089 (= lt!184589 e!236961)))

(declare-fun c!54242 () Bool)

(declare-fun e!236951 () Bool)

(assert (=> d!73089 (= c!54242 e!236951)))

(declare-fun res!223935 () Bool)

(assert (=> d!73089 (=> (not res!223935) (not e!236951))))

(assert (=> d!73089 (= res!223935 (bvslt #b00000000000000000000000000000000 (size!11400 lt!184444)))))

(assert (=> d!73089 (= lt!184597 e!236956)))

(assert (=> d!73089 (= c!54241 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73089 (validMask!0 mask!970)))

(assert (=> d!73089 (= (getCurrentListMap!2064 lt!184444 lt!184446 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184593)))

(declare-fun b!391234 () Bool)

(assert (=> b!391234 (= e!236951 (validKeyInArray!0 (select (arr!11048 lt!184444) #b00000000000000000000000000000000)))))

(assert (= (and d!73089 c!54241) b!391219))

(assert (= (and d!73089 (not c!54241)) b!391218))

(assert (= (and b!391218 c!54243) b!391222))

(assert (= (and b!391218 (not c!54243)) b!391230))

(assert (= (and b!391230 c!54240) b!391229))

(assert (= (and b!391230 (not c!54240)) b!391233))

(assert (= (or b!391229 b!391233) bm!27597))

(assert (= (or b!391222 bm!27597) bm!27594))

(assert (= (or b!391222 b!391229) bm!27592))

(assert (= (or b!391219 bm!27594) bm!27596))

(assert (= (or b!391219 bm!27592) bm!27595))

(assert (= (and d!73089 res!223935) b!391234))

(assert (= (and d!73089 c!54242) b!391231))

(assert (= (and d!73089 (not c!54242)) b!391220))

(assert (= (and d!73089 res!223936) b!391217))

(assert (= (and b!391217 res!223942) b!391223))

(assert (= (and b!391217 (not res!223934)) b!391215))

(assert (= (and b!391215 res!223941) b!391232))

(assert (= (and b!391217 res!223940) b!391216))

(assert (= (and b!391216 c!54238) b!391224))

(assert (= (and b!391216 (not c!54238)) b!391221))

(assert (= (and b!391224 res!223937) b!391227))

(assert (= (or b!391224 b!391221) bm!27598))

(assert (= (and b!391216 res!223939) b!391235))

(assert (= (and b!391235 c!54239) b!391228))

(assert (= (and b!391235 (not c!54239)) b!391226))

(assert (= (and b!391228 res!223938) b!391225))

(assert (= (or b!391228 b!391226) bm!27593))

(declare-fun b_lambda!8697 () Bool)

(assert (=> (not b_lambda!8697) (not b!391232)))

(assert (=> b!391232 t!11428))

(declare-fun b_and!16309 () Bool)

(assert (= b_and!16307 (and (=> t!11428 result!5735) b_and!16309)))

(assert (=> bm!27596 m!387643))

(declare-fun m!387795 () Bool)

(assert (=> b!391227 m!387795))

(declare-fun m!387797 () Bool)

(assert (=> bm!27595 m!387797))

(assert (=> d!73089 m!387621))

(declare-fun m!387799 () Bool)

(assert (=> b!391231 m!387799))

(declare-fun m!387801 () Bool)

(assert (=> b!391231 m!387801))

(declare-fun m!387803 () Bool)

(assert (=> b!391231 m!387803))

(assert (=> b!391231 m!387799))

(declare-fun m!387805 () Bool)

(assert (=> b!391231 m!387805))

(declare-fun m!387807 () Bool)

(assert (=> b!391231 m!387807))

(assert (=> b!391231 m!387643))

(declare-fun m!387809 () Bool)

(assert (=> b!391231 m!387809))

(declare-fun m!387811 () Bool)

(assert (=> b!391231 m!387811))

(assert (=> b!391231 m!387805))

(declare-fun m!387813 () Bool)

(assert (=> b!391231 m!387813))

(declare-fun m!387815 () Bool)

(assert (=> b!391231 m!387815))

(declare-fun m!387817 () Bool)

(assert (=> b!391231 m!387817))

(declare-fun m!387819 () Bool)

(assert (=> b!391231 m!387819))

(declare-fun m!387821 () Bool)

(assert (=> b!391231 m!387821))

(assert (=> b!391231 m!387815))

(assert (=> b!391231 m!387803))

(declare-fun m!387823 () Bool)

(assert (=> b!391231 m!387823))

(declare-fun m!387825 () Bool)

(assert (=> b!391231 m!387825))

(declare-fun m!387827 () Bool)

(assert (=> b!391231 m!387827))

(declare-fun m!387829 () Bool)

(assert (=> b!391231 m!387829))

(declare-fun m!387831 () Bool)

(assert (=> bm!27593 m!387831))

(declare-fun m!387833 () Bool)

(assert (=> b!391219 m!387833))

(assert (=> b!391215 m!387829))

(assert (=> b!391215 m!387829))

(declare-fun m!387835 () Bool)

(assert (=> b!391215 m!387835))

(assert (=> b!391234 m!387829))

(assert (=> b!391234 m!387829))

(declare-fun m!387837 () Bool)

(assert (=> b!391234 m!387837))

(assert (=> b!391232 m!387829))

(declare-fun m!387839 () Bool)

(assert (=> b!391232 m!387839))

(declare-fun m!387841 () Bool)

(assert (=> b!391232 m!387841))

(assert (=> b!391232 m!387775))

(assert (=> b!391232 m!387841))

(assert (=> b!391232 m!387775))

(declare-fun m!387843 () Bool)

(assert (=> b!391232 m!387843))

(assert (=> b!391232 m!387829))

(declare-fun m!387845 () Bool)

(assert (=> b!391225 m!387845))

(declare-fun m!387847 () Bool)

(assert (=> bm!27598 m!387847))

(assert (=> b!391223 m!387829))

(assert (=> b!391223 m!387829))

(assert (=> b!391223 m!387837))

(assert (=> b!390998 d!73089))

(declare-fun b!391236 () Bool)

(declare-fun e!236972 () Bool)

(declare-fun e!236975 () Bool)

(assert (=> b!391236 (= e!236972 e!236975)))

(declare-fun res!223950 () Bool)

(assert (=> b!391236 (=> (not res!223950) (not e!236975))))

(declare-fun lt!184615 () ListLongMap!5333)

(assert (=> b!391236 (= res!223950 (contains!2438 lt!184615 (select (arr!11048 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391236 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11400 _keys!658)))))

(declare-fun b!391237 () Bool)

(declare-fun res!223948 () Bool)

(declare-fun e!236966 () Bool)

(assert (=> b!391237 (=> (not res!223948) (not e!236966))))

(declare-fun e!236963 () Bool)

(assert (=> b!391237 (= res!223948 e!236963)))

(declare-fun c!54244 () Bool)

(assert (=> b!391237 (= c!54244 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!391238 () Bool)

(declare-fun res!223949 () Bool)

(assert (=> b!391238 (=> (not res!223949) (not e!236966))))

(assert (=> b!391238 (= res!223949 e!236972)))

(declare-fun res!223943 () Bool)

(assert (=> b!391238 (=> res!223943 e!236972)))

(declare-fun e!236971 () Bool)

(assert (=> b!391238 (= res!223943 (not e!236971))))

(declare-fun res!223951 () Bool)

(assert (=> b!391238 (=> (not res!223951) (not e!236971))))

(assert (=> b!391238 (= res!223951 (bvslt #b00000000000000000000000000000000 (size!11400 _keys!658)))))

(declare-fun b!391239 () Bool)

(declare-fun e!236969 () ListLongMap!5333)

(declare-fun e!236967 () ListLongMap!5333)

(assert (=> b!391239 (= e!236969 e!236967)))

(declare-fun c!54249 () Bool)

(assert (=> b!391239 (= c!54249 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391240 () Bool)

(declare-fun call!27608 () ListLongMap!5333)

(assert (=> b!391240 (= e!236969 (+!1036 call!27608 (tuple2!6419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun b!391241 () Bool)

(declare-fun e!236974 () Unit!11947)

(declare-fun Unit!11952 () Unit!11947)

(assert (=> b!391241 (= e!236974 Unit!11952)))

(declare-fun b!391242 () Bool)

(declare-fun call!27605 () Bool)

(assert (=> b!391242 (= e!236963 (not call!27605))))

(declare-fun b!391243 () Bool)

(declare-fun call!27603 () ListLongMap!5333)

(assert (=> b!391243 (= e!236967 call!27603)))

(declare-fun b!391244 () Bool)

(assert (=> b!391244 (= e!236971 (validKeyInArray!0 (select (arr!11048 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun bm!27599 () Bool)

(assert (=> bm!27599 (= call!27603 call!27608)))

(declare-fun b!391245 () Bool)

(declare-fun e!236968 () Bool)

(assert (=> b!391245 (= e!236963 e!236968)))

(declare-fun res!223946 () Bool)

(assert (=> b!391245 (= res!223946 call!27605)))

(assert (=> b!391245 (=> (not res!223946) (not e!236968))))

(declare-fun b!391246 () Bool)

(declare-fun e!236965 () Bool)

(assert (=> b!391246 (= e!236965 (= (apply!303 lt!184615 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27600 () Bool)

(declare-fun call!27602 () Bool)

(assert (=> bm!27600 (= call!27602 (contains!2438 lt!184615 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun bm!27601 () Bool)

(declare-fun call!27606 () ListLongMap!5333)

(declare-fun call!27607 () ListLongMap!5333)

(assert (=> bm!27601 (= call!27606 call!27607)))

(declare-fun c!54247 () Bool)

(declare-fun call!27604 () ListLongMap!5333)

(declare-fun bm!27602 () Bool)

(assert (=> bm!27602 (= call!27608 (+!1036 (ite c!54247 call!27607 (ite c!54249 call!27606 call!27604)) (ite (or c!54247 c!54249) (tuple2!6419 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6419 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!391247 () Bool)

(declare-fun e!236970 () Bool)

(assert (=> b!391247 (= e!236970 (not call!27602))))

(declare-fun b!391248 () Bool)

(assert (=> b!391248 (= e!236968 (= (apply!303 lt!184615 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun bm!27603 () Bool)

(assert (=> bm!27603 (= call!27607 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391249 () Bool)

(assert (=> b!391249 (= e!236970 e!236965)))

(declare-fun res!223947 () Bool)

(assert (=> b!391249 (= res!223947 call!27602)))

(assert (=> b!391249 (=> (not res!223947) (not e!236965))))

(declare-fun b!391250 () Bool)

(declare-fun e!236973 () ListLongMap!5333)

(assert (=> b!391250 (= e!236973 call!27603)))

(declare-fun b!391251 () Bool)

(declare-fun c!54246 () Bool)

(assert (=> b!391251 (= c!54246 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!391251 (= e!236967 e!236973)))

(declare-fun bm!27604 () Bool)

(assert (=> bm!27604 (= call!27604 call!27606)))

(declare-fun bm!27605 () Bool)

(assert (=> bm!27605 (= call!27605 (contains!2438 lt!184615 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!391252 () Bool)

(declare-fun lt!184620 () Unit!11947)

(assert (=> b!391252 (= e!236974 lt!184620)))

(declare-fun lt!184622 () ListLongMap!5333)

(assert (=> b!391252 (= lt!184622 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184614 () (_ BitVec 64))

(assert (=> b!391252 (= lt!184614 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184621 () (_ BitVec 64))

(assert (=> b!391252 (= lt!184621 (select (arr!11048 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184617 () Unit!11947)

(assert (=> b!391252 (= lt!184617 (addStillContains!279 lt!184622 lt!184614 zeroValue!472 lt!184621))))

(assert (=> b!391252 (contains!2438 (+!1036 lt!184622 (tuple2!6419 lt!184614 zeroValue!472)) lt!184621)))

(declare-fun lt!184606 () Unit!11947)

(assert (=> b!391252 (= lt!184606 lt!184617)))

(declare-fun lt!184603 () ListLongMap!5333)

(assert (=> b!391252 (= lt!184603 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184613 () (_ BitVec 64))

(assert (=> b!391252 (= lt!184613 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184605 () (_ BitVec 64))

(assert (=> b!391252 (= lt!184605 (select (arr!11048 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184610 () Unit!11947)

(assert (=> b!391252 (= lt!184610 (addApplyDifferent!279 lt!184603 lt!184613 minValue!472 lt!184605))))

(assert (=> b!391252 (= (apply!303 (+!1036 lt!184603 (tuple2!6419 lt!184613 minValue!472)) lt!184605) (apply!303 lt!184603 lt!184605))))

(declare-fun lt!184623 () Unit!11947)

(assert (=> b!391252 (= lt!184623 lt!184610)))

(declare-fun lt!184609 () ListLongMap!5333)

(assert (=> b!391252 (= lt!184609 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184608 () (_ BitVec 64))

(assert (=> b!391252 (= lt!184608 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184602 () (_ BitVec 64))

(assert (=> b!391252 (= lt!184602 (select (arr!11048 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184607 () Unit!11947)

(assert (=> b!391252 (= lt!184607 (addApplyDifferent!279 lt!184609 lt!184608 zeroValue!472 lt!184602))))

(assert (=> b!391252 (= (apply!303 (+!1036 lt!184609 (tuple2!6419 lt!184608 zeroValue!472)) lt!184602) (apply!303 lt!184609 lt!184602))))

(declare-fun lt!184604 () Unit!11947)

(assert (=> b!391252 (= lt!184604 lt!184607)))

(declare-fun lt!184616 () ListLongMap!5333)

(assert (=> b!391252 (= lt!184616 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184618 () (_ BitVec 64))

(assert (=> b!391252 (= lt!184618 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184612 () (_ BitVec 64))

(assert (=> b!391252 (= lt!184612 (select (arr!11048 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!391252 (= lt!184620 (addApplyDifferent!279 lt!184616 lt!184618 minValue!472 lt!184612))))

(assert (=> b!391252 (= (apply!303 (+!1036 lt!184616 (tuple2!6419 lt!184618 minValue!472)) lt!184612) (apply!303 lt!184616 lt!184612))))

(declare-fun b!391253 () Bool)

(assert (=> b!391253 (= e!236975 (= (apply!303 lt!184615 (select (arr!11048 _keys!658) #b00000000000000000000000000000000)) (get!5597 (select (arr!11049 _values!506) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391253 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11401 _values!506)))))

(assert (=> b!391253 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11400 _keys!658)))))

(declare-fun b!391254 () Bool)

(assert (=> b!391254 (= e!236973 call!27604)))

(declare-fun b!391256 () Bool)

(assert (=> b!391256 (= e!236966 e!236970)))

(declare-fun c!54245 () Bool)

(assert (=> b!391256 (= c!54245 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun d!73091 () Bool)

(assert (=> d!73091 e!236966))

(declare-fun res!223945 () Bool)

(assert (=> d!73091 (=> (not res!223945) (not e!236966))))

(assert (=> d!73091 (= res!223945 (or (bvsge #b00000000000000000000000000000000 (size!11400 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11400 _keys!658)))))))

(declare-fun lt!184619 () ListLongMap!5333)

(assert (=> d!73091 (= lt!184615 lt!184619)))

(declare-fun lt!184611 () Unit!11947)

(assert (=> d!73091 (= lt!184611 e!236974)))

(declare-fun c!54248 () Bool)

(declare-fun e!236964 () Bool)

(assert (=> d!73091 (= c!54248 e!236964)))

(declare-fun res!223944 () Bool)

(assert (=> d!73091 (=> (not res!223944) (not e!236964))))

(assert (=> d!73091 (= res!223944 (bvslt #b00000000000000000000000000000000 (size!11400 _keys!658)))))

(assert (=> d!73091 (= lt!184619 e!236969)))

(assert (=> d!73091 (= c!54247 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!73091 (validMask!0 mask!970)))

(assert (=> d!73091 (= (getCurrentListMap!2064 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184615)))

(declare-fun b!391255 () Bool)

(assert (=> b!391255 (= e!236964 (validKeyInArray!0 (select (arr!11048 _keys!658) #b00000000000000000000000000000000)))))

(assert (= (and d!73091 c!54247) b!391240))

(assert (= (and d!73091 (not c!54247)) b!391239))

(assert (= (and b!391239 c!54249) b!391243))

(assert (= (and b!391239 (not c!54249)) b!391251))

(assert (= (and b!391251 c!54246) b!391250))

(assert (= (and b!391251 (not c!54246)) b!391254))

(assert (= (or b!391250 b!391254) bm!27604))

(assert (= (or b!391243 bm!27604) bm!27601))

(assert (= (or b!391243 b!391250) bm!27599))

(assert (= (or b!391240 bm!27601) bm!27603))

(assert (= (or b!391240 bm!27599) bm!27602))

(assert (= (and d!73091 res!223944) b!391255))

(assert (= (and d!73091 c!54248) b!391252))

(assert (= (and d!73091 (not c!54248)) b!391241))

(assert (= (and d!73091 res!223945) b!391238))

(assert (= (and b!391238 res!223951) b!391244))

(assert (= (and b!391238 (not res!223943)) b!391236))

(assert (= (and b!391236 res!223950) b!391253))

(assert (= (and b!391238 res!223949) b!391237))

(assert (= (and b!391237 c!54244) b!391245))

(assert (= (and b!391237 (not c!54244)) b!391242))

(assert (= (and b!391245 res!223946) b!391248))

(assert (= (or b!391245 b!391242) bm!27605))

(assert (= (and b!391237 res!223948) b!391256))

(assert (= (and b!391256 c!54245) b!391249))

(assert (= (and b!391256 (not c!54245)) b!391247))

(assert (= (and b!391249 res!223947) b!391246))

(assert (= (or b!391249 b!391247) bm!27600))

(declare-fun b_lambda!8699 () Bool)

(assert (=> (not b_lambda!8699) (not b!391253)))

(assert (=> b!391253 t!11428))

(declare-fun b_and!16311 () Bool)

(assert (= b_and!16309 (and (=> t!11428 result!5735) b_and!16311)))

(assert (=> bm!27603 m!387641))

(declare-fun m!387849 () Bool)

(assert (=> b!391248 m!387849))

(declare-fun m!387851 () Bool)

(assert (=> bm!27602 m!387851))

(assert (=> d!73091 m!387621))

(declare-fun m!387853 () Bool)

(assert (=> b!391252 m!387853))

(declare-fun m!387855 () Bool)

(assert (=> b!391252 m!387855))

(declare-fun m!387857 () Bool)

(assert (=> b!391252 m!387857))

(assert (=> b!391252 m!387853))

(declare-fun m!387859 () Bool)

(assert (=> b!391252 m!387859))

(declare-fun m!387861 () Bool)

(assert (=> b!391252 m!387861))

(assert (=> b!391252 m!387641))

(declare-fun m!387863 () Bool)

(assert (=> b!391252 m!387863))

(declare-fun m!387865 () Bool)

(assert (=> b!391252 m!387865))

(assert (=> b!391252 m!387859))

(declare-fun m!387867 () Bool)

(assert (=> b!391252 m!387867))

(declare-fun m!387869 () Bool)

(assert (=> b!391252 m!387869))

(declare-fun m!387871 () Bool)

(assert (=> b!391252 m!387871))

(declare-fun m!387873 () Bool)

(assert (=> b!391252 m!387873))

(declare-fun m!387875 () Bool)

(assert (=> b!391252 m!387875))

(assert (=> b!391252 m!387869))

(assert (=> b!391252 m!387857))

(declare-fun m!387877 () Bool)

(assert (=> b!391252 m!387877))

(declare-fun m!387879 () Bool)

(assert (=> b!391252 m!387879))

(declare-fun m!387881 () Bool)

(assert (=> b!391252 m!387881))

(assert (=> b!391252 m!387753))

(declare-fun m!387883 () Bool)

(assert (=> bm!27600 m!387883))

(declare-fun m!387885 () Bool)

(assert (=> b!391240 m!387885))

(assert (=> b!391236 m!387753))

(assert (=> b!391236 m!387753))

(declare-fun m!387887 () Bool)

(assert (=> b!391236 m!387887))

(assert (=> b!391255 m!387753))

(assert (=> b!391255 m!387753))

(assert (=> b!391255 m!387763))

(assert (=> b!391253 m!387753))

(declare-fun m!387889 () Bool)

(assert (=> b!391253 m!387889))

(assert (=> b!391253 m!387773))

(assert (=> b!391253 m!387775))

(assert (=> b!391253 m!387773))

(assert (=> b!391253 m!387775))

(assert (=> b!391253 m!387777))

(assert (=> b!391253 m!387753))

(declare-fun m!387891 () Bool)

(assert (=> b!391246 m!387891))

(declare-fun m!387893 () Bool)

(assert (=> bm!27605 m!387893))

(assert (=> b!391244 m!387753))

(assert (=> b!391244 m!387753))

(assert (=> b!391244 m!387763))

(assert (=> b!390998 d!73091))

(declare-fun b!391257 () Bool)

(declare-fun lt!184627 () Unit!11947)

(declare-fun lt!184624 () Unit!11947)

(assert (=> b!391257 (= lt!184627 lt!184624)))

(declare-fun lt!184630 () (_ BitVec 64))

(declare-fun lt!184628 () ListLongMap!5333)

(declare-fun lt!184629 () V!13963)

(declare-fun lt!184625 () (_ BitVec 64))

(assert (=> b!391257 (not (contains!2438 (+!1036 lt!184628 (tuple2!6419 lt!184630 lt!184629)) lt!184625))))

(assert (=> b!391257 (= lt!184624 (addStillNotContains!138 lt!184628 lt!184630 lt!184629 lt!184625))))

(assert (=> b!391257 (= lt!184625 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!391257 (= lt!184629 (get!5597 (select (arr!11049 lt!184446) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!391257 (= lt!184630 (select (arr!11048 lt!184444) #b00000000000000000000000000000000))))

(declare-fun call!27609 () ListLongMap!5333)

(assert (=> b!391257 (= lt!184628 call!27609)))

(declare-fun e!236980 () ListLongMap!5333)

(assert (=> b!391257 (= e!236980 (+!1036 call!27609 (tuple2!6419 (select (arr!11048 lt!184444) #b00000000000000000000000000000000) (get!5597 (select (arr!11049 lt!184446) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!391258 () Bool)

(declare-fun res!223955 () Bool)

(declare-fun e!236979 () Bool)

(assert (=> b!391258 (=> (not res!223955) (not e!236979))))

(declare-fun lt!184626 () ListLongMap!5333)

(assert (=> b!391258 (= res!223955 (not (contains!2438 lt!184626 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!391259 () Bool)

(declare-fun e!236981 () Bool)

(assert (=> b!391259 (= e!236981 (isEmpty!555 lt!184626))))

(declare-fun b!391260 () Bool)

(declare-fun e!236978 () Bool)

(declare-fun e!236976 () Bool)

(assert (=> b!391260 (= e!236978 e!236976)))

(assert (=> b!391260 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11400 lt!184444)))))

(declare-fun res!223952 () Bool)

(assert (=> b!391260 (= res!223952 (contains!2438 lt!184626 (select (arr!11048 lt!184444) #b00000000000000000000000000000000)))))

(assert (=> b!391260 (=> (not res!223952) (not e!236976))))

(declare-fun bm!27606 () Bool)

(assert (=> bm!27606 (= call!27609 (getCurrentListMapNoExtraKeys!953 lt!184444 lt!184446 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!391261 () Bool)

(assert (=> b!391261 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11400 lt!184444)))))

(assert (=> b!391261 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11401 lt!184446)))))

(assert (=> b!391261 (= e!236976 (= (apply!303 lt!184626 (select (arr!11048 lt!184444) #b00000000000000000000000000000000)) (get!5597 (select (arr!11049 lt!184446) #b00000000000000000000000000000000) (dynLambda!646 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun d!73093 () Bool)

(assert (=> d!73093 e!236979))

(declare-fun res!223953 () Bool)

(assert (=> d!73093 (=> (not res!223953) (not e!236979))))

(assert (=> d!73093 (= res!223953 (not (contains!2438 lt!184626 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun e!236977 () ListLongMap!5333)

(assert (=> d!73093 (= lt!184626 e!236977)))

(declare-fun c!54250 () Bool)

(assert (=> d!73093 (= c!54250 (bvsge #b00000000000000000000000000000000 (size!11400 lt!184444)))))

(assert (=> d!73093 (validMask!0 mask!970)))

(assert (=> d!73093 (= (getCurrentListMapNoExtraKeys!953 lt!184444 lt!184446 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184626)))

(declare-fun b!391262 () Bool)

(assert (=> b!391262 (= e!236977 (ListLongMap!5334 Nil!6265))))

(declare-fun b!391263 () Bool)

(assert (=> b!391263 (= e!236980 call!27609)))

(declare-fun b!391264 () Bool)

(assert (=> b!391264 (= e!236981 (= lt!184626 (getCurrentListMapNoExtraKeys!953 lt!184444 lt!184446 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!391265 () Bool)

(assert (=> b!391265 (= e!236979 e!236978)))

(declare-fun c!54251 () Bool)

(declare-fun e!236982 () Bool)

(assert (=> b!391265 (= c!54251 e!236982)))

(declare-fun res!223954 () Bool)

(assert (=> b!391265 (=> (not res!223954) (not e!236982))))

(assert (=> b!391265 (= res!223954 (bvslt #b00000000000000000000000000000000 (size!11400 lt!184444)))))

(declare-fun b!391266 () Bool)

(assert (=> b!391266 (= e!236982 (validKeyInArray!0 (select (arr!11048 lt!184444) #b00000000000000000000000000000000)))))

(assert (=> b!391266 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun b!391267 () Bool)

(assert (=> b!391267 (= e!236978 e!236981)))

(declare-fun c!54252 () Bool)

(assert (=> b!391267 (= c!54252 (bvslt #b00000000000000000000000000000000 (size!11400 lt!184444)))))

(declare-fun b!391268 () Bool)

(assert (=> b!391268 (= e!236977 e!236980)))

(declare-fun c!54253 () Bool)

(assert (=> b!391268 (= c!54253 (validKeyInArray!0 (select (arr!11048 lt!184444) #b00000000000000000000000000000000)))))

(assert (= (and d!73093 c!54250) b!391262))

(assert (= (and d!73093 (not c!54250)) b!391268))

(assert (= (and b!391268 c!54253) b!391257))

(assert (= (and b!391268 (not c!54253)) b!391263))

(assert (= (or b!391257 b!391263) bm!27606))

(assert (= (and d!73093 res!223953) b!391258))

(assert (= (and b!391258 res!223955) b!391265))

(assert (= (and b!391265 res!223954) b!391266))

(assert (= (and b!391265 c!54251) b!391260))

(assert (= (and b!391265 (not c!54251)) b!391267))

(assert (= (and b!391260 res!223952) b!391261))

(assert (= (and b!391267 c!54252) b!391264))

(assert (= (and b!391267 (not c!54252)) b!391259))

(declare-fun b_lambda!8701 () Bool)

(assert (=> (not b_lambda!8701) (not b!391257)))

(assert (=> b!391257 t!11428))

(declare-fun b_and!16313 () Bool)

(assert (= b_and!16311 (and (=> t!11428 result!5735) b_and!16313)))

(declare-fun b_lambda!8703 () Bool)

(assert (=> (not b_lambda!8703) (not b!391261)))

(assert (=> b!391261 t!11428))

(declare-fun b_and!16315 () Bool)

(assert (= b_and!16313 (and (=> t!11428 result!5735) b_and!16315)))

(declare-fun m!387895 () Bool)

(assert (=> bm!27606 m!387895))

(assert (=> b!391266 m!387829))

(assert (=> b!391266 m!387829))

(assert (=> b!391266 m!387837))

(declare-fun m!387897 () Bool)

(assert (=> b!391258 m!387897))

(assert (=> b!391261 m!387841))

(assert (=> b!391261 m!387775))

(assert (=> b!391261 m!387843))

(assert (=> b!391261 m!387775))

(assert (=> b!391261 m!387829))

(declare-fun m!387899 () Bool)

(assert (=> b!391261 m!387899))

(assert (=> b!391261 m!387829))

(assert (=> b!391261 m!387841))

(assert (=> b!391260 m!387829))

(assert (=> b!391260 m!387829))

(declare-fun m!387901 () Bool)

(assert (=> b!391260 m!387901))

(declare-fun m!387903 () Bool)

(assert (=> b!391259 m!387903))

(assert (=> b!391268 m!387829))

(assert (=> b!391268 m!387829))

(assert (=> b!391268 m!387837))

(declare-fun m!387905 () Bool)

(assert (=> d!73093 m!387905))

(assert (=> d!73093 m!387621))

(declare-fun m!387907 () Bool)

(assert (=> b!391257 m!387907))

(declare-fun m!387909 () Bool)

(assert (=> b!391257 m!387909))

(assert (=> b!391257 m!387909))

(declare-fun m!387911 () Bool)

(assert (=> b!391257 m!387911))

(assert (=> b!391257 m!387841))

(assert (=> b!391257 m!387775))

(assert (=> b!391257 m!387843))

(assert (=> b!391257 m!387775))

(declare-fun m!387913 () Bool)

(assert (=> b!391257 m!387913))

(assert (=> b!391257 m!387829))

(assert (=> b!391257 m!387841))

(assert (=> b!391264 m!387895))

(assert (=> b!390998 d!73093))

(declare-fun b!391275 () Bool)

(declare-fun e!236987 () Bool)

(declare-fun e!236988 () Bool)

(assert (=> b!391275 (= e!236987 e!236988)))

(declare-fun c!54256 () Bool)

(assert (=> b!391275 (= c!54256 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun call!27615 () ListLongMap!5333)

(declare-fun b!391276 () Bool)

(declare-fun call!27614 () ListLongMap!5333)

(assert (=> b!391276 (= e!236988 (= call!27615 (+!1036 call!27614 (tuple2!6419 k0!778 v!373))))))

(declare-fun b!391277 () Bool)

(assert (=> b!391277 (= e!236988 (= call!27615 call!27614))))

(declare-fun bm!27611 () Bool)

(assert (=> bm!27611 (= call!27614 (getCurrentListMapNoExtraKeys!953 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27612 () Bool)

(assert (=> bm!27612 (= call!27615 (getCurrentListMapNoExtraKeys!953 (array!23173 (store (arr!11048 _keys!658) i!548 k0!778) (size!11400 _keys!658)) (array!23175 (store (arr!11049 _values!506) i!548 (ValueCellFull!4478 v!373)) (size!11401 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun d!73095 () Bool)

(assert (=> d!73095 e!236987))

(declare-fun res!223958 () Bool)

(assert (=> d!73095 (=> (not res!223958) (not e!236987))))

(assert (=> d!73095 (= res!223958 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11400 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11401 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11400 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11401 _values!506))))))))

(declare-fun lt!184633 () Unit!11947)

(declare-fun choose!1325 (array!23172 array!23174 (_ BitVec 32) (_ BitVec 32) V!13963 V!13963 (_ BitVec 32) (_ BitVec 64) V!13963 (_ BitVec 32) Int) Unit!11947)

(assert (=> d!73095 (= lt!184633 (choose!1325 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!73095 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11400 _keys!658)))))

(assert (=> d!73095 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!255 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!184633)))

(assert (= (and d!73095 res!223958) b!391275))

(assert (= (and b!391275 c!54256) b!391276))

(assert (= (and b!391275 (not c!54256)) b!391277))

(assert (= (or b!391276 b!391277) bm!27611))

(assert (= (or b!391276 b!391277) bm!27612))

(declare-fun m!387915 () Bool)

(assert (=> b!391276 m!387915))

(assert (=> bm!27611 m!387641))

(assert (=> bm!27612 m!387629))

(assert (=> bm!27612 m!387653))

(declare-fun m!387917 () Bool)

(assert (=> bm!27612 m!387917))

(declare-fun m!387919 () Bool)

(assert (=> d!73095 m!387919))

(assert (=> b!390998 d!73095))

(declare-fun d!73097 () Bool)

(declare-fun e!236991 () Bool)

(assert (=> d!73097 e!236991))

(declare-fun res!223964 () Bool)

(assert (=> d!73097 (=> (not res!223964) (not e!236991))))

(declare-fun lt!184645 () ListLongMap!5333)

(assert (=> d!73097 (= res!223964 (contains!2438 lt!184645 (_1!3220 (tuple2!6419 k0!778 v!373))))))

(declare-fun lt!184644 () List!6268)

(assert (=> d!73097 (= lt!184645 (ListLongMap!5334 lt!184644))))

(declare-fun lt!184643 () Unit!11947)

(declare-fun lt!184642 () Unit!11947)

(assert (=> d!73097 (= lt!184643 lt!184642)))

(declare-datatypes ((Option!368 0))(
  ( (Some!367 (v!7094 V!13963)) (None!366) )
))
(declare-fun getValueByKey!362 (List!6268 (_ BitVec 64)) Option!368)

(assert (=> d!73097 (= (getValueByKey!362 lt!184644 (_1!3220 (tuple2!6419 k0!778 v!373))) (Some!367 (_2!3220 (tuple2!6419 k0!778 v!373))))))

(declare-fun lemmaContainsTupThenGetReturnValue!184 (List!6268 (_ BitVec 64) V!13963) Unit!11947)

(assert (=> d!73097 (= lt!184642 (lemmaContainsTupThenGetReturnValue!184 lt!184644 (_1!3220 (tuple2!6419 k0!778 v!373)) (_2!3220 (tuple2!6419 k0!778 v!373))))))

(declare-fun insertStrictlySorted!187 (List!6268 (_ BitVec 64) V!13963) List!6268)

(assert (=> d!73097 (= lt!184644 (insertStrictlySorted!187 (toList!2682 lt!184451) (_1!3220 (tuple2!6419 k0!778 v!373)) (_2!3220 (tuple2!6419 k0!778 v!373))))))

(assert (=> d!73097 (= (+!1036 lt!184451 (tuple2!6419 k0!778 v!373)) lt!184645)))

(declare-fun b!391282 () Bool)

(declare-fun res!223963 () Bool)

(assert (=> b!391282 (=> (not res!223963) (not e!236991))))

(assert (=> b!391282 (= res!223963 (= (getValueByKey!362 (toList!2682 lt!184645) (_1!3220 (tuple2!6419 k0!778 v!373))) (Some!367 (_2!3220 (tuple2!6419 k0!778 v!373)))))))

(declare-fun b!391283 () Bool)

(declare-fun contains!2439 (List!6268 tuple2!6418) Bool)

(assert (=> b!391283 (= e!236991 (contains!2439 (toList!2682 lt!184645) (tuple2!6419 k0!778 v!373)))))

(assert (= (and d!73097 res!223964) b!391282))

(assert (= (and b!391282 res!223963) b!391283))

(declare-fun m!387921 () Bool)

(assert (=> d!73097 m!387921))

(declare-fun m!387923 () Bool)

(assert (=> d!73097 m!387923))

(declare-fun m!387925 () Bool)

(assert (=> d!73097 m!387925))

(declare-fun m!387927 () Bool)

(assert (=> d!73097 m!387927))

(declare-fun m!387929 () Bool)

(assert (=> b!391282 m!387929))

(declare-fun m!387931 () Bool)

(assert (=> b!391283 m!387931))

(assert (=> b!390998 d!73097))

(declare-fun b!391284 () Bool)

(declare-fun e!236994 () Bool)

(declare-fun call!27616 () Bool)

(assert (=> b!391284 (= e!236994 call!27616)))

(declare-fun d!73099 () Bool)

(declare-fun res!223965 () Bool)

(declare-fun e!236992 () Bool)

(assert (=> d!73099 (=> res!223965 e!236992)))

(assert (=> d!73099 (= res!223965 (bvsge #b00000000000000000000000000000000 (size!11400 lt!184444)))))

(assert (=> d!73099 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184444 mask!970) e!236992)))

(declare-fun b!391285 () Bool)

(declare-fun e!236993 () Bool)

(assert (=> b!391285 (= e!236993 call!27616)))

(declare-fun b!391286 () Bool)

(assert (=> b!391286 (= e!236993 e!236994)))

(declare-fun lt!184647 () (_ BitVec 64))

(assert (=> b!391286 (= lt!184647 (select (arr!11048 lt!184444) #b00000000000000000000000000000000))))

(declare-fun lt!184648 () Unit!11947)

(assert (=> b!391286 (= lt!184648 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!184444 lt!184647 #b00000000000000000000000000000000))))

(assert (=> b!391286 (arrayContainsKey!0 lt!184444 lt!184647 #b00000000000000000000000000000000)))

(declare-fun lt!184646 () Unit!11947)

(assert (=> b!391286 (= lt!184646 lt!184648)))

(declare-fun res!223966 () Bool)

(assert (=> b!391286 (= res!223966 (= (seekEntryOrOpen!0 (select (arr!11048 lt!184444) #b00000000000000000000000000000000) lt!184444 mask!970) (Found!3463 #b00000000000000000000000000000000)))))

(assert (=> b!391286 (=> (not res!223966) (not e!236994))))

(declare-fun bm!27613 () Bool)

(assert (=> bm!27613 (= call!27616 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!184444 mask!970))))

(declare-fun b!391287 () Bool)

(assert (=> b!391287 (= e!236992 e!236993)))

(declare-fun c!54257 () Bool)

(assert (=> b!391287 (= c!54257 (validKeyInArray!0 (select (arr!11048 lt!184444) #b00000000000000000000000000000000)))))

(assert (= (and d!73099 (not res!223965)) b!391287))

(assert (= (and b!391287 c!54257) b!391286))

(assert (= (and b!391287 (not c!54257)) b!391285))

(assert (= (and b!391286 res!223966) b!391284))

(assert (= (or b!391284 b!391285) bm!27613))

(assert (=> b!391286 m!387829))

(declare-fun m!387933 () Bool)

(assert (=> b!391286 m!387933))

(declare-fun m!387935 () Bool)

(assert (=> b!391286 m!387935))

(assert (=> b!391286 m!387829))

(declare-fun m!387937 () Bool)

(assert (=> b!391286 m!387937))

(declare-fun m!387939 () Bool)

(assert (=> bm!27613 m!387939))

(assert (=> b!391287 m!387829))

(assert (=> b!391287 m!387829))

(assert (=> b!391287 m!387837))

(assert (=> b!391008 d!73099))

(declare-fun d!73101 () Bool)

(declare-fun e!236995 () Bool)

(assert (=> d!73101 e!236995))

(declare-fun res!223968 () Bool)

(assert (=> d!73101 (=> (not res!223968) (not e!236995))))

(declare-fun lt!184652 () ListLongMap!5333)

(assert (=> d!73101 (= res!223968 (contains!2438 lt!184652 (_1!3220 lt!184448)))))

(declare-fun lt!184651 () List!6268)

(assert (=> d!73101 (= lt!184652 (ListLongMap!5334 lt!184651))))

(declare-fun lt!184650 () Unit!11947)

(declare-fun lt!184649 () Unit!11947)

(assert (=> d!73101 (= lt!184650 lt!184649)))

(assert (=> d!73101 (= (getValueByKey!362 lt!184651 (_1!3220 lt!184448)) (Some!367 (_2!3220 lt!184448)))))

(assert (=> d!73101 (= lt!184649 (lemmaContainsTupThenGetReturnValue!184 lt!184651 (_1!3220 lt!184448) (_2!3220 lt!184448)))))

(assert (=> d!73101 (= lt!184651 (insertStrictlySorted!187 (toList!2682 lt!184447) (_1!3220 lt!184448) (_2!3220 lt!184448)))))

(assert (=> d!73101 (= (+!1036 lt!184447 lt!184448) lt!184652)))

(declare-fun b!391288 () Bool)

(declare-fun res!223967 () Bool)

(assert (=> b!391288 (=> (not res!223967) (not e!236995))))

(assert (=> b!391288 (= res!223967 (= (getValueByKey!362 (toList!2682 lt!184652) (_1!3220 lt!184448)) (Some!367 (_2!3220 lt!184448))))))

(declare-fun b!391289 () Bool)

(assert (=> b!391289 (= e!236995 (contains!2439 (toList!2682 lt!184652) lt!184448))))

(assert (= (and d!73101 res!223968) b!391288))

(assert (= (and b!391288 res!223967) b!391289))

(declare-fun m!387941 () Bool)

(assert (=> d!73101 m!387941))

(declare-fun m!387943 () Bool)

(assert (=> d!73101 m!387943))

(declare-fun m!387945 () Bool)

(assert (=> d!73101 m!387945))

(declare-fun m!387947 () Bool)

(assert (=> d!73101 m!387947))

(declare-fun m!387949 () Bool)

(assert (=> b!391288 m!387949))

(declare-fun m!387951 () Bool)

(assert (=> b!391289 m!387951))

(assert (=> b!391000 d!73101))

(declare-fun d!73103 () Bool)

(declare-fun res!223973 () Bool)

(declare-fun e!237000 () Bool)

(assert (=> d!73103 (=> res!223973 e!237000)))

(assert (=> d!73103 (= res!223973 (= (select (arr!11048 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!73103 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!237000)))

(declare-fun b!391294 () Bool)

(declare-fun e!237001 () Bool)

(assert (=> b!391294 (= e!237000 e!237001)))

(declare-fun res!223974 () Bool)

(assert (=> b!391294 (=> (not res!223974) (not e!237001))))

(assert (=> b!391294 (= res!223974 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11400 _keys!658)))))

(declare-fun b!391295 () Bool)

(assert (=> b!391295 (= e!237001 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!73103 (not res!223973)) b!391294))

(assert (= (and b!391294 res!223974) b!391295))

(assert (=> d!73103 m!387753))

(declare-fun m!387953 () Bool)

(assert (=> b!391295 m!387953))

(assert (=> b!391010 d!73103))

(declare-fun d!73105 () Bool)

(assert (=> d!73105 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390996 d!73105))

(declare-fun d!73107 () Bool)

(declare-fun e!237002 () Bool)

(assert (=> d!73107 e!237002))

(declare-fun res!223976 () Bool)

(assert (=> d!73107 (=> (not res!223976) (not e!237002))))

(declare-fun lt!184656 () ListLongMap!5333)

(assert (=> d!73107 (= res!223976 (contains!2438 lt!184656 (_1!3220 lt!184448)))))

(declare-fun lt!184655 () List!6268)

(assert (=> d!73107 (= lt!184656 (ListLongMap!5334 lt!184655))))

(declare-fun lt!184654 () Unit!11947)

(declare-fun lt!184653 () Unit!11947)

(assert (=> d!73107 (= lt!184654 lt!184653)))

(assert (=> d!73107 (= (getValueByKey!362 lt!184655 (_1!3220 lt!184448)) (Some!367 (_2!3220 lt!184448)))))

(assert (=> d!73107 (= lt!184653 (lemmaContainsTupThenGetReturnValue!184 lt!184655 (_1!3220 lt!184448) (_2!3220 lt!184448)))))

(assert (=> d!73107 (= lt!184655 (insertStrictlySorted!187 (toList!2682 lt!184451) (_1!3220 lt!184448) (_2!3220 lt!184448)))))

(assert (=> d!73107 (= (+!1036 lt!184451 lt!184448) lt!184656)))

(declare-fun b!391296 () Bool)

(declare-fun res!223975 () Bool)

(assert (=> b!391296 (=> (not res!223975) (not e!237002))))

(assert (=> b!391296 (= res!223975 (= (getValueByKey!362 (toList!2682 lt!184656) (_1!3220 lt!184448)) (Some!367 (_2!3220 lt!184448))))))

(declare-fun b!391297 () Bool)

(assert (=> b!391297 (= e!237002 (contains!2439 (toList!2682 lt!184656) lt!184448))))

(assert (= (and d!73107 res!223976) b!391296))

(assert (= (and b!391296 res!223975) b!391297))

(declare-fun m!387955 () Bool)

(assert (=> d!73107 m!387955))

(declare-fun m!387957 () Bool)

(assert (=> d!73107 m!387957))

(declare-fun m!387959 () Bool)

(assert (=> d!73107 m!387959))

(declare-fun m!387961 () Bool)

(assert (=> d!73107 m!387961))

(declare-fun m!387963 () Bool)

(assert (=> b!391296 m!387963))

(declare-fun m!387965 () Bool)

(assert (=> b!391297 m!387965))

(assert (=> b!391011 d!73107))

(declare-fun d!73109 () Bool)

(declare-fun e!237003 () Bool)

(assert (=> d!73109 e!237003))

(declare-fun res!223978 () Bool)

(assert (=> d!73109 (=> (not res!223978) (not e!237003))))

(declare-fun lt!184660 () ListLongMap!5333)

(assert (=> d!73109 (= res!223978 (contains!2438 lt!184660 (_1!3220 lt!184448)))))

(declare-fun lt!184659 () List!6268)

(assert (=> d!73109 (= lt!184660 (ListLongMap!5334 lt!184659))))

(declare-fun lt!184658 () Unit!11947)

(declare-fun lt!184657 () Unit!11947)

(assert (=> d!73109 (= lt!184658 lt!184657)))

(assert (=> d!73109 (= (getValueByKey!362 lt!184659 (_1!3220 lt!184448)) (Some!367 (_2!3220 lt!184448)))))

(assert (=> d!73109 (= lt!184657 (lemmaContainsTupThenGetReturnValue!184 lt!184659 (_1!3220 lt!184448) (_2!3220 lt!184448)))))

(assert (=> d!73109 (= lt!184659 (insertStrictlySorted!187 (toList!2682 lt!184450) (_1!3220 lt!184448) (_2!3220 lt!184448)))))

(assert (=> d!73109 (= (+!1036 lt!184450 lt!184448) lt!184660)))

(declare-fun b!391298 () Bool)

(declare-fun res!223977 () Bool)

(assert (=> b!391298 (=> (not res!223977) (not e!237003))))

(assert (=> b!391298 (= res!223977 (= (getValueByKey!362 (toList!2682 lt!184660) (_1!3220 lt!184448)) (Some!367 (_2!3220 lt!184448))))))

(declare-fun b!391299 () Bool)

(assert (=> b!391299 (= e!237003 (contains!2439 (toList!2682 lt!184660) lt!184448))))

(assert (= (and d!73109 res!223978) b!391298))

(assert (= (and b!391298 res!223977) b!391299))

(declare-fun m!387967 () Bool)

(assert (=> d!73109 m!387967))

(declare-fun m!387969 () Bool)

(assert (=> d!73109 m!387969))

(declare-fun m!387971 () Bool)

(assert (=> d!73109 m!387971))

(declare-fun m!387973 () Bool)

(assert (=> d!73109 m!387973))

(declare-fun m!387975 () Bool)

(assert (=> b!391298 m!387975))

(declare-fun m!387977 () Bool)

(assert (=> b!391299 m!387977))

(assert (=> b!391001 d!73109))

(declare-fun b!391300 () Bool)

(declare-fun e!237007 () Bool)

(declare-fun call!27617 () Bool)

(assert (=> b!391300 (= e!237007 call!27617)))

(declare-fun b!391301 () Bool)

(declare-fun e!237006 () Bool)

(declare-fun e!237004 () Bool)

(assert (=> b!391301 (= e!237006 e!237004)))

(declare-fun res!223981 () Bool)

(assert (=> b!391301 (=> (not res!223981) (not e!237004))))

(declare-fun e!237005 () Bool)

(assert (=> b!391301 (= res!223981 (not e!237005))))

(declare-fun res!223979 () Bool)

(assert (=> b!391301 (=> (not res!223979) (not e!237005))))

(assert (=> b!391301 (= res!223979 (validKeyInArray!0 (select (arr!11048 lt!184444) #b00000000000000000000000000000000)))))

(declare-fun b!391302 () Bool)

(assert (=> b!391302 (= e!237007 call!27617)))

(declare-fun bm!27614 () Bool)

(declare-fun c!54258 () Bool)

(assert (=> bm!27614 (= call!27617 (arrayNoDuplicates!0 lt!184444 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54258 (Cons!6263 (select (arr!11048 lt!184444) #b00000000000000000000000000000000) Nil!6264) Nil!6264)))))

(declare-fun d!73111 () Bool)

(declare-fun res!223980 () Bool)

(assert (=> d!73111 (=> res!223980 e!237006)))

(assert (=> d!73111 (= res!223980 (bvsge #b00000000000000000000000000000000 (size!11400 lt!184444)))))

(assert (=> d!73111 (= (arrayNoDuplicates!0 lt!184444 #b00000000000000000000000000000000 Nil!6264) e!237006)))

(declare-fun b!391303 () Bool)

(assert (=> b!391303 (= e!237004 e!237007)))

(assert (=> b!391303 (= c!54258 (validKeyInArray!0 (select (arr!11048 lt!184444) #b00000000000000000000000000000000)))))

(declare-fun b!391304 () Bool)

(assert (=> b!391304 (= e!237005 (contains!2437 Nil!6264 (select (arr!11048 lt!184444) #b00000000000000000000000000000000)))))

(assert (= (and d!73111 (not res!223980)) b!391301))

(assert (= (and b!391301 res!223979) b!391304))

(assert (= (and b!391301 res!223981) b!391303))

(assert (= (and b!391303 c!54258) b!391300))

(assert (= (and b!391303 (not c!54258)) b!391302))

(assert (= (or b!391300 b!391302) bm!27614))

(assert (=> b!391301 m!387829))

(assert (=> b!391301 m!387829))

(assert (=> b!391301 m!387837))

(assert (=> bm!27614 m!387829))

(declare-fun m!387979 () Bool)

(assert (=> bm!27614 m!387979))

(assert (=> b!391303 m!387829))

(assert (=> b!391303 m!387829))

(assert (=> b!391303 m!387837))

(assert (=> b!391304 m!387829))

(assert (=> b!391304 m!387829))

(declare-fun m!387981 () Bool)

(assert (=> b!391304 m!387981))

(assert (=> b!390997 d!73111))

(declare-fun b!391311 () Bool)

(declare-fun e!237012 () Bool)

(assert (=> b!391311 (= e!237012 tp_is_empty!9643)))

(declare-fun condMapEmpty!16056 () Bool)

(declare-fun mapDefault!16056 () ValueCell!4478)

(assert (=> mapNonEmpty!16047 (= condMapEmpty!16056 (= mapRest!16047 ((as const (Array (_ BitVec 32) ValueCell!4478)) mapDefault!16056)))))

(declare-fun e!237013 () Bool)

(declare-fun mapRes!16056 () Bool)

(assert (=> mapNonEmpty!16047 (= tp!31683 (and e!237013 mapRes!16056))))

(declare-fun mapNonEmpty!16056 () Bool)

(declare-fun tp!31698 () Bool)

(assert (=> mapNonEmpty!16056 (= mapRes!16056 (and tp!31698 e!237012))))

(declare-fun mapKey!16056 () (_ BitVec 32))

(declare-fun mapRest!16056 () (Array (_ BitVec 32) ValueCell!4478))

(declare-fun mapValue!16056 () ValueCell!4478)

(assert (=> mapNonEmpty!16056 (= mapRest!16047 (store mapRest!16056 mapKey!16056 mapValue!16056))))

(declare-fun b!391312 () Bool)

(assert (=> b!391312 (= e!237013 tp_is_empty!9643)))

(declare-fun mapIsEmpty!16056 () Bool)

(assert (=> mapIsEmpty!16056 mapRes!16056))

(assert (= (and mapNonEmpty!16047 condMapEmpty!16056) mapIsEmpty!16056))

(assert (= (and mapNonEmpty!16047 (not condMapEmpty!16056)) mapNonEmpty!16056))

(assert (= (and mapNonEmpty!16056 ((_ is ValueCellFull!4478) mapValue!16056)) b!391311))

(assert (= (and mapNonEmpty!16047 ((_ is ValueCellFull!4478) mapDefault!16056)) b!391312))

(declare-fun m!387983 () Bool)

(assert (=> mapNonEmpty!16056 m!387983))

(declare-fun b_lambda!8705 () Bool)

(assert (= b_lambda!8695 (or (and start!37988 b_free!8971) b_lambda!8705)))

(declare-fun b_lambda!8707 () Bool)

(assert (= b_lambda!8703 (or (and start!37988 b_free!8971) b_lambda!8707)))

(declare-fun b_lambda!8709 () Bool)

(assert (= b_lambda!8701 (or (and start!37988 b_free!8971) b_lambda!8709)))

(declare-fun b_lambda!8711 () Bool)

(assert (= b_lambda!8699 (or (and start!37988 b_free!8971) b_lambda!8711)))

(declare-fun b_lambda!8713 () Bool)

(assert (= b_lambda!8697 (or (and start!37988 b_free!8971) b_lambda!8713)))

(declare-fun b_lambda!8715 () Bool)

(assert (= b_lambda!8693 (or (and start!37988 b_free!8971) b_lambda!8715)))

(check-sat (not d!73091) (not b!391223) (not bm!27593) (not mapNonEmpty!16056) (not b!391168) (not bm!27595) (not b!391253) (not d!73107) (not b!391297) (not b!391287) (not b!391283) (not b!391170) (not bm!27605) (not bm!27612) (not b!391240) (not b!391298) (not b!391215) (not bm!27596) (not d!73097) (not b!391163) (not b_lambda!8713) (not b_next!8971) (not bm!27571) (not bm!27603) (not b!391264) (not b!391133) (not b_lambda!8711) (not b_lambda!8715) (not b!391162) (not b!391227) (not b!391258) (not bm!27611) (not bm!27600) (not bm!27574) (not b!391301) (not b!391160) (not b!391118) (not b!391266) (not b!391286) (not b!391261) tp_is_empty!9643 (not d!73093) (not b!391244) (not b!391282) (not b!391304) (not b!391268) (not b!391288) (not b!391257) (not bm!27606) (not b!391232) (not b!391260) (not b!391231) (not b!391296) (not b_lambda!8707) (not b!391255) (not b!391246) (not b!391225) (not bm!27577) (not d!73089) (not b!391159) (not b!391259) (not b!391295) (not b!391289) (not b_lambda!8709) (not b!391131) (not b!391134) (not d!73095) (not b!391299) (not b!391119) (not b!391161) (not bm!27602) (not bm!27613) (not b!391219) (not b!391252) (not b!391248) (not b!391236) (not b!391303) (not b_lambda!8705) (not d!73101) (not d!73109) (not b!391166) (not bm!27614) (not bm!27598) (not b!391234) (not d!73087) (not b!391276) b_and!16315)
(check-sat b_and!16315 (not b_next!8971))
