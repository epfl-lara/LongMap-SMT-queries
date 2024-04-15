; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37988 () Bool)

(assert start!37988)

(declare-fun b_free!8971 () Bool)

(declare-fun b_next!8971 () Bool)

(assert (=> start!37988 (= b_free!8971 (not b_next!8971))))

(declare-fun tp!31683 () Bool)

(declare-fun b_and!16259 () Bool)

(assert (=> start!37988 (= tp!31683 b_and!16259)))

(declare-fun b!390774 () Bool)

(declare-fun res!223681 () Bool)

(declare-fun e!236685 () Bool)

(assert (=> b!390774 (=> (not res!223681) (not e!236685))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!23173 0))(
  ( (array!23174 (arr!11049 (Array (_ BitVec 32) (_ BitVec 64))) (size!11402 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23173)

(assert (=> b!390774 (= res!223681 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11402 _keys!658))))))

(declare-fun b!390775 () Bool)

(declare-fun res!223677 () Bool)

(declare-fun e!236689 () Bool)

(assert (=> b!390775 (=> (not res!223677) (not e!236689))))

(declare-datatypes ((V!13963 0))(
  ( (V!13964 (val!4866 Int)) )
))
(declare-datatypes ((tuple2!6524 0))(
  ( (tuple2!6525 (_1!3273 (_ BitVec 64)) (_2!3273 V!13963)) )
))
(declare-datatypes ((List!6369 0))(
  ( (Nil!6366) (Cons!6365 (h!7221 tuple2!6524) (t!11522 List!6369)) )
))
(declare-datatypes ((ListLongMap!5427 0))(
  ( (ListLongMap!5428 (toList!2729 List!6369)) )
))
(declare-fun lt!184190 () ListLongMap!5427)

(declare-fun lt!184197 () ListLongMap!5427)

(declare-fun lt!184193 () tuple2!6524)

(declare-fun +!1049 (ListLongMap!5427 tuple2!6524) ListLongMap!5427)

(assert (=> b!390775 (= res!223677 (= lt!184197 (+!1049 lt!184190 lt!184193)))))

(declare-fun mapNonEmpty!16047 () Bool)

(declare-fun mapRes!16047 () Bool)

(declare-fun tp!31682 () Bool)

(declare-fun e!236691 () Bool)

(assert (=> mapNonEmpty!16047 (= mapRes!16047 (and tp!31682 e!236691))))

(declare-datatypes ((ValueCell!4478 0))(
  ( (ValueCellFull!4478 (v!7081 V!13963)) (EmptyCell!4478) )
))
(declare-datatypes ((array!23175 0))(
  ( (array!23176 (arr!11050 (Array (_ BitVec 32) ValueCell!4478)) (size!11403 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23175)

(declare-fun mapValue!16047 () ValueCell!4478)

(declare-fun mapKey!16047 () (_ BitVec 32))

(declare-fun mapRest!16047 () (Array (_ BitVec 32) ValueCell!4478))

(assert (=> mapNonEmpty!16047 (= (arr!11050 _values!506) (store mapRest!16047 mapKey!16047 mapValue!16047))))

(declare-fun b!390776 () Bool)

(declare-fun res!223683 () Bool)

(declare-fun e!236688 () Bool)

(assert (=> b!390776 (=> (not res!223683) (not e!236688))))

(declare-fun lt!184195 () array!23173)

(declare-datatypes ((List!6370 0))(
  ( (Nil!6367) (Cons!6366 (h!7222 (_ BitVec 64)) (t!11523 List!6370)) )
))
(declare-fun arrayNoDuplicates!0 (array!23173 (_ BitVec 32) List!6370) Bool)

(assert (=> b!390776 (= res!223683 (arrayNoDuplicates!0 lt!184195 #b00000000000000000000000000000000 Nil!6367))))

(declare-fun lt!184198 () ListLongMap!5427)

(declare-fun b!390777 () Bool)

(declare-fun lt!184196 () ListLongMap!5427)

(assert (=> b!390777 (= e!236689 (= lt!184198 (+!1049 lt!184196 lt!184193)))))

(declare-fun b!390778 () Bool)

(declare-fun e!236690 () Bool)

(declare-fun e!236687 () Bool)

(assert (=> b!390778 (= e!236690 (and e!236687 mapRes!16047))))

(declare-fun condMapEmpty!16047 () Bool)

(declare-fun mapDefault!16047 () ValueCell!4478)

(assert (=> b!390778 (= condMapEmpty!16047 (= (arr!11050 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4478)) mapDefault!16047)))))

(declare-fun b!390779 () Bool)

(declare-fun tp_is_empty!9643 () Bool)

(assert (=> b!390779 (= e!236687 tp_is_empty!9643)))

(declare-fun b!390780 () Bool)

(declare-fun res!223678 () Bool)

(assert (=> b!390780 (=> (not res!223678) (not e!236685))))

(assert (=> b!390780 (= res!223678 (or (= (select (arr!11049 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11049 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!390781 () Bool)

(declare-fun e!236684 () Bool)

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!390781 (= e!236684 (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390781 e!236689))

(declare-fun res!223680 () Bool)

(assert (=> b!390781 (=> (not res!223680) (not e!236689))))

(declare-fun lt!184191 () ListLongMap!5427)

(assert (=> b!390781 (= res!223680 (= lt!184198 (+!1049 lt!184191 lt!184193)))))

(declare-fun zeroValue!472 () V!13963)

(assert (=> b!390781 (= lt!184193 (tuple2!6525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!390782 () Bool)

(declare-fun res!223676 () Bool)

(assert (=> b!390782 (=> (not res!223676) (not e!236685))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23173 (_ BitVec 32)) Bool)

(assert (=> b!390782 (= res!223676 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!390783 () Bool)

(declare-fun res!223684 () Bool)

(assert (=> b!390783 (=> (not res!223684) (not e!236685))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!390783 (= res!223684 (validKeyInArray!0 k0!778))))

(declare-fun b!390784 () Bool)

(assert (=> b!390784 (= e!236685 e!236688)))

(declare-fun res!223679 () Bool)

(assert (=> b!390784 (=> (not res!223679) (not e!236688))))

(assert (=> b!390784 (= res!223679 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184195 mask!970))))

(assert (=> b!390784 (= lt!184195 (array!23174 (store (arr!11049 _keys!658) i!548 k0!778) (size!11402 _keys!658)))))

(declare-fun b!390785 () Bool)

(assert (=> b!390785 (= e!236688 (not e!236684))))

(declare-fun res!223674 () Bool)

(assert (=> b!390785 (=> res!223674 e!236684)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!390785 (= res!223674 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun minValue!472 () V!13963)

(declare-fun getCurrentListMap!2054 (array!23173 array!23175 (_ BitVec 32) (_ BitVec 32) V!13963 V!13963 (_ BitVec 32) Int) ListLongMap!5427)

(assert (=> b!390785 (= lt!184197 (getCurrentListMap!2054 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184192 () array!23175)

(assert (=> b!390785 (= lt!184198 (getCurrentListMap!2054 lt!184195 lt!184192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390785 (and (= lt!184191 lt!184196) (= lt!184196 lt!184191))))

(declare-fun v!373 () V!13963)

(assert (=> b!390785 (= lt!184196 (+!1049 lt!184190 (tuple2!6525 k0!778 v!373)))))

(declare-datatypes ((Unit!11944 0))(
  ( (Unit!11945) )
))
(declare-fun lt!184194 () Unit!11944)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!255 (array!23173 array!23175 (_ BitVec 32) (_ BitVec 32) V!13963 V!13963 (_ BitVec 32) (_ BitVec 64) V!13963 (_ BitVec 32) Int) Unit!11944)

(assert (=> b!390785 (= lt!184194 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!255 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!964 (array!23173 array!23175 (_ BitVec 32) (_ BitVec 32) V!13963 V!13963 (_ BitVec 32) Int) ListLongMap!5427)

(assert (=> b!390785 (= lt!184191 (getCurrentListMapNoExtraKeys!964 lt!184195 lt!184192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!390785 (= lt!184192 (array!23176 (store (arr!11050 _values!506) i!548 (ValueCellFull!4478 v!373)) (size!11403 _values!506)))))

(assert (=> b!390785 (= lt!184190 (getCurrentListMapNoExtraKeys!964 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!390786 () Bool)

(assert (=> b!390786 (= e!236691 tp_is_empty!9643)))

(declare-fun b!390787 () Bool)

(declare-fun res!223673 () Bool)

(assert (=> b!390787 (=> (not res!223673) (not e!236685))))

(assert (=> b!390787 (= res!223673 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6367))))

(declare-fun b!390788 () Bool)

(declare-fun res!223672 () Bool)

(assert (=> b!390788 (=> (not res!223672) (not e!236685))))

(declare-fun arrayContainsKey!0 (array!23173 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!390788 (= res!223672 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!390789 () Bool)

(declare-fun res!223675 () Bool)

(assert (=> b!390789 (=> (not res!223675) (not e!236685))))

(assert (=> b!390789 (= res!223675 (and (= (size!11403 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11402 _keys!658) (size!11403 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun res!223682 () Bool)

(assert (=> start!37988 (=> (not res!223682) (not e!236685))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37988 (= res!223682 (validMask!0 mask!970))))

(assert (=> start!37988 e!236685))

(declare-fun array_inv!8116 (array!23175) Bool)

(assert (=> start!37988 (and (array_inv!8116 _values!506) e!236690)))

(assert (=> start!37988 tp!31683))

(assert (=> start!37988 true))

(assert (=> start!37988 tp_is_empty!9643))

(declare-fun array_inv!8117 (array!23173) Bool)

(assert (=> start!37988 (array_inv!8117 _keys!658)))

(declare-fun mapIsEmpty!16047 () Bool)

(assert (=> mapIsEmpty!16047 mapRes!16047))

(assert (= (and start!37988 res!223682) b!390789))

(assert (= (and b!390789 res!223675) b!390782))

(assert (= (and b!390782 res!223676) b!390787))

(assert (= (and b!390787 res!223673) b!390774))

(assert (= (and b!390774 res!223681) b!390783))

(assert (= (and b!390783 res!223684) b!390780))

(assert (= (and b!390780 res!223678) b!390788))

(assert (= (and b!390788 res!223672) b!390784))

(assert (= (and b!390784 res!223679) b!390776))

(assert (= (and b!390776 res!223683) b!390785))

(assert (= (and b!390785 (not res!223674)) b!390781))

(assert (= (and b!390781 res!223680) b!390775))

(assert (= (and b!390775 res!223677) b!390777))

(assert (= (and b!390778 condMapEmpty!16047) mapIsEmpty!16047))

(assert (= (and b!390778 (not condMapEmpty!16047)) mapNonEmpty!16047))

(get-info :version)

(assert (= (and mapNonEmpty!16047 ((_ is ValueCellFull!4478) mapValue!16047)) b!390786))

(assert (= (and b!390778 ((_ is ValueCellFull!4478) mapDefault!16047)) b!390779))

(assert (= start!37988 b!390778))

(declare-fun m!386667 () Bool)

(assert (=> b!390785 m!386667))

(declare-fun m!386669 () Bool)

(assert (=> b!390785 m!386669))

(declare-fun m!386671 () Bool)

(assert (=> b!390785 m!386671))

(declare-fun m!386673 () Bool)

(assert (=> b!390785 m!386673))

(declare-fun m!386675 () Bool)

(assert (=> b!390785 m!386675))

(declare-fun m!386677 () Bool)

(assert (=> b!390785 m!386677))

(declare-fun m!386679 () Bool)

(assert (=> b!390785 m!386679))

(declare-fun m!386681 () Bool)

(assert (=> b!390780 m!386681))

(declare-fun m!386683 () Bool)

(assert (=> mapNonEmpty!16047 m!386683))

(declare-fun m!386685 () Bool)

(assert (=> b!390784 m!386685))

(declare-fun m!386687 () Bool)

(assert (=> b!390784 m!386687))

(declare-fun m!386689 () Bool)

(assert (=> b!390775 m!386689))

(declare-fun m!386691 () Bool)

(assert (=> b!390781 m!386691))

(declare-fun m!386693 () Bool)

(assert (=> b!390777 m!386693))

(declare-fun m!386695 () Bool)

(assert (=> b!390787 m!386695))

(declare-fun m!386697 () Bool)

(assert (=> start!37988 m!386697))

(declare-fun m!386699 () Bool)

(assert (=> start!37988 m!386699))

(declare-fun m!386701 () Bool)

(assert (=> start!37988 m!386701))

(declare-fun m!386703 () Bool)

(assert (=> b!390788 m!386703))

(declare-fun m!386705 () Bool)

(assert (=> b!390783 m!386705))

(declare-fun m!386707 () Bool)

(assert (=> b!390782 m!386707))

(declare-fun m!386709 () Bool)

(assert (=> b!390776 m!386709))

(check-sat (not b!390783) (not b_next!8971) (not b!390776) (not b!390777) (not b!390785) (not b!390784) tp_is_empty!9643 (not b!390781) (not b!390775) (not mapNonEmpty!16047) (not b!390787) (not b!390782) (not start!37988) b_and!16259 (not b!390788))
(check-sat b_and!16259 (not b_next!8971))
(get-model)

(declare-fun b!390896 () Bool)

(declare-fun e!236749 () Bool)

(declare-fun contains!2448 (List!6370 (_ BitVec 64)) Bool)

(assert (=> b!390896 (= e!236749 (contains!2448 Nil!6367 (select (arr!11049 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390897 () Bool)

(declare-fun e!236750 () Bool)

(declare-fun e!236748 () Bool)

(assert (=> b!390897 (= e!236750 e!236748)))

(declare-fun res!223771 () Bool)

(assert (=> b!390897 (=> (not res!223771) (not e!236748))))

(assert (=> b!390897 (= res!223771 (not e!236749))))

(declare-fun res!223769 () Bool)

(assert (=> b!390897 (=> (not res!223769) (not e!236749))))

(assert (=> b!390897 (= res!223769 (validKeyInArray!0 (select (arr!11049 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390898 () Bool)

(declare-fun e!236751 () Bool)

(declare-fun call!27562 () Bool)

(assert (=> b!390898 (= e!236751 call!27562)))

(declare-fun d!72843 () Bool)

(declare-fun res!223770 () Bool)

(assert (=> d!72843 (=> res!223770 e!236750)))

(assert (=> d!72843 (= res!223770 (bvsge #b00000000000000000000000000000000 (size!11402 _keys!658)))))

(assert (=> d!72843 (= (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6367) e!236750)))

(declare-fun b!390899 () Bool)

(assert (=> b!390899 (= e!236748 e!236751)))

(declare-fun c!54162 () Bool)

(assert (=> b!390899 (= c!54162 (validKeyInArray!0 (select (arr!11049 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390900 () Bool)

(assert (=> b!390900 (= e!236751 call!27562)))

(declare-fun bm!27559 () Bool)

(assert (=> bm!27559 (= call!27562 (arrayNoDuplicates!0 _keys!658 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54162 (Cons!6366 (select (arr!11049 _keys!658) #b00000000000000000000000000000000) Nil!6367) Nil!6367)))))

(assert (= (and d!72843 (not res!223770)) b!390897))

(assert (= (and b!390897 res!223769) b!390896))

(assert (= (and b!390897 res!223771) b!390899))

(assert (= (and b!390899 c!54162) b!390898))

(assert (= (and b!390899 (not c!54162)) b!390900))

(assert (= (or b!390898 b!390900) bm!27559))

(declare-fun m!386799 () Bool)

(assert (=> b!390896 m!386799))

(assert (=> b!390896 m!386799))

(declare-fun m!386801 () Bool)

(assert (=> b!390896 m!386801))

(assert (=> b!390897 m!386799))

(assert (=> b!390897 m!386799))

(declare-fun m!386803 () Bool)

(assert (=> b!390897 m!386803))

(assert (=> b!390899 m!386799))

(assert (=> b!390899 m!386799))

(assert (=> b!390899 m!386803))

(assert (=> bm!27559 m!386799))

(declare-fun m!386805 () Bool)

(assert (=> bm!27559 m!386805))

(assert (=> b!390787 d!72843))

(declare-fun b!390901 () Bool)

(declare-fun e!236753 () Bool)

(assert (=> b!390901 (= e!236753 (contains!2448 Nil!6367 (select (arr!11049 lt!184195) #b00000000000000000000000000000000)))))

(declare-fun b!390902 () Bool)

(declare-fun e!236754 () Bool)

(declare-fun e!236752 () Bool)

(assert (=> b!390902 (= e!236754 e!236752)))

(declare-fun res!223774 () Bool)

(assert (=> b!390902 (=> (not res!223774) (not e!236752))))

(assert (=> b!390902 (= res!223774 (not e!236753))))

(declare-fun res!223772 () Bool)

(assert (=> b!390902 (=> (not res!223772) (not e!236753))))

(assert (=> b!390902 (= res!223772 (validKeyInArray!0 (select (arr!11049 lt!184195) #b00000000000000000000000000000000)))))

(declare-fun b!390903 () Bool)

(declare-fun e!236755 () Bool)

(declare-fun call!27563 () Bool)

(assert (=> b!390903 (= e!236755 call!27563)))

(declare-fun d!72845 () Bool)

(declare-fun res!223773 () Bool)

(assert (=> d!72845 (=> res!223773 e!236754)))

(assert (=> d!72845 (= res!223773 (bvsge #b00000000000000000000000000000000 (size!11402 lt!184195)))))

(assert (=> d!72845 (= (arrayNoDuplicates!0 lt!184195 #b00000000000000000000000000000000 Nil!6367) e!236754)))

(declare-fun b!390904 () Bool)

(assert (=> b!390904 (= e!236752 e!236755)))

(declare-fun c!54163 () Bool)

(assert (=> b!390904 (= c!54163 (validKeyInArray!0 (select (arr!11049 lt!184195) #b00000000000000000000000000000000)))))

(declare-fun b!390905 () Bool)

(assert (=> b!390905 (= e!236755 call!27563)))

(declare-fun bm!27560 () Bool)

(assert (=> bm!27560 (= call!27563 (arrayNoDuplicates!0 lt!184195 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!54163 (Cons!6366 (select (arr!11049 lt!184195) #b00000000000000000000000000000000) Nil!6367) Nil!6367)))))

(assert (= (and d!72845 (not res!223773)) b!390902))

(assert (= (and b!390902 res!223772) b!390901))

(assert (= (and b!390902 res!223774) b!390904))

(assert (= (and b!390904 c!54163) b!390903))

(assert (= (and b!390904 (not c!54163)) b!390905))

(assert (= (or b!390903 b!390905) bm!27560))

(declare-fun m!386807 () Bool)

(assert (=> b!390901 m!386807))

(assert (=> b!390901 m!386807))

(declare-fun m!386809 () Bool)

(assert (=> b!390901 m!386809))

(assert (=> b!390902 m!386807))

(assert (=> b!390902 m!386807))

(declare-fun m!386811 () Bool)

(assert (=> b!390902 m!386811))

(assert (=> b!390904 m!386807))

(assert (=> b!390904 m!386807))

(assert (=> b!390904 m!386811))

(assert (=> bm!27560 m!386807))

(declare-fun m!386813 () Bool)

(assert (=> bm!27560 m!386813))

(assert (=> b!390776 d!72845))

(declare-fun d!72847 () Bool)

(declare-fun e!236758 () Bool)

(assert (=> d!72847 e!236758))

(declare-fun res!223780 () Bool)

(assert (=> d!72847 (=> (not res!223780) (not e!236758))))

(declare-fun lt!184264 () ListLongMap!5427)

(declare-fun contains!2449 (ListLongMap!5427 (_ BitVec 64)) Bool)

(assert (=> d!72847 (= res!223780 (contains!2449 lt!184264 (_1!3273 lt!184193)))))

(declare-fun lt!184261 () List!6369)

(assert (=> d!72847 (= lt!184264 (ListLongMap!5428 lt!184261))))

(declare-fun lt!184262 () Unit!11944)

(declare-fun lt!184263 () Unit!11944)

(assert (=> d!72847 (= lt!184262 lt!184263)))

(declare-datatypes ((Option!365 0))(
  ( (Some!364 (v!7087 V!13963)) (None!363) )
))
(declare-fun getValueByKey!359 (List!6369 (_ BitVec 64)) Option!365)

(assert (=> d!72847 (= (getValueByKey!359 lt!184261 (_1!3273 lt!184193)) (Some!364 (_2!3273 lt!184193)))))

(declare-fun lemmaContainsTupThenGetReturnValue!184 (List!6369 (_ BitVec 64) V!13963) Unit!11944)

(assert (=> d!72847 (= lt!184263 (lemmaContainsTupThenGetReturnValue!184 lt!184261 (_1!3273 lt!184193) (_2!3273 lt!184193)))))

(declare-fun insertStrictlySorted!187 (List!6369 (_ BitVec 64) V!13963) List!6369)

(assert (=> d!72847 (= lt!184261 (insertStrictlySorted!187 (toList!2729 lt!184196) (_1!3273 lt!184193) (_2!3273 lt!184193)))))

(assert (=> d!72847 (= (+!1049 lt!184196 lt!184193) lt!184264)))

(declare-fun b!390910 () Bool)

(declare-fun res!223779 () Bool)

(assert (=> b!390910 (=> (not res!223779) (not e!236758))))

(assert (=> b!390910 (= res!223779 (= (getValueByKey!359 (toList!2729 lt!184264) (_1!3273 lt!184193)) (Some!364 (_2!3273 lt!184193))))))

(declare-fun b!390911 () Bool)

(declare-fun contains!2450 (List!6369 tuple2!6524) Bool)

(assert (=> b!390911 (= e!236758 (contains!2450 (toList!2729 lt!184264) lt!184193))))

(assert (= (and d!72847 res!223780) b!390910))

(assert (= (and b!390910 res!223779) b!390911))

(declare-fun m!386815 () Bool)

(assert (=> d!72847 m!386815))

(declare-fun m!386817 () Bool)

(assert (=> d!72847 m!386817))

(declare-fun m!386819 () Bool)

(assert (=> d!72847 m!386819))

(declare-fun m!386821 () Bool)

(assert (=> d!72847 m!386821))

(declare-fun m!386823 () Bool)

(assert (=> b!390910 m!386823))

(declare-fun m!386825 () Bool)

(assert (=> b!390911 m!386825))

(assert (=> b!390777 d!72847))

(declare-fun d!72849 () Bool)

(declare-fun res!223785 () Bool)

(declare-fun e!236763 () Bool)

(assert (=> d!72849 (=> res!223785 e!236763)))

(assert (=> d!72849 (= res!223785 (= (select (arr!11049 _keys!658) #b00000000000000000000000000000000) k0!778))))

(assert (=> d!72849 (= (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000) e!236763)))

(declare-fun b!390916 () Bool)

(declare-fun e!236764 () Bool)

(assert (=> b!390916 (= e!236763 e!236764)))

(declare-fun res!223786 () Bool)

(assert (=> b!390916 (=> (not res!223786) (not e!236764))))

(assert (=> b!390916 (= res!223786 (bvslt (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (size!11402 _keys!658)))))

(declare-fun b!390917 () Bool)

(assert (=> b!390917 (= e!236764 (arrayContainsKey!0 _keys!658 k0!778 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001)))))

(assert (= (and d!72849 (not res!223785)) b!390916))

(assert (= (and b!390916 res!223786) b!390917))

(assert (=> d!72849 m!386799))

(declare-fun m!386827 () Bool)

(assert (=> b!390917 m!386827))

(assert (=> b!390788 d!72849))

(declare-fun d!72851 () Bool)

(assert (=> d!72851 (= (validMask!0 mask!970) (and (or (= mask!970 #b00000000000000000000000000000111) (= mask!970 #b00000000000000000000000000001111) (= mask!970 #b00000000000000000000000000011111) (= mask!970 #b00000000000000000000000000111111) (= mask!970 #b00000000000000000000000001111111) (= mask!970 #b00000000000000000000000011111111) (= mask!970 #b00000000000000000000000111111111) (= mask!970 #b00000000000000000000001111111111) (= mask!970 #b00000000000000000000011111111111) (= mask!970 #b00000000000000000000111111111111) (= mask!970 #b00000000000000000001111111111111) (= mask!970 #b00000000000000000011111111111111) (= mask!970 #b00000000000000000111111111111111) (= mask!970 #b00000000000000001111111111111111) (= mask!970 #b00000000000000011111111111111111) (= mask!970 #b00000000000000111111111111111111) (= mask!970 #b00000000000001111111111111111111) (= mask!970 #b00000000000011111111111111111111) (= mask!970 #b00000000000111111111111111111111) (= mask!970 #b00000000001111111111111111111111) (= mask!970 #b00000000011111111111111111111111) (= mask!970 #b00000000111111111111111111111111) (= mask!970 #b00000001111111111111111111111111) (= mask!970 #b00000011111111111111111111111111) (= mask!970 #b00000111111111111111111111111111) (= mask!970 #b00001111111111111111111111111111) (= mask!970 #b00011111111111111111111111111111) (= mask!970 #b00111111111111111111111111111111)) (bvsle mask!970 #b00111111111111111111111111111111)))))

(assert (=> start!37988 d!72851))

(declare-fun d!72853 () Bool)

(assert (=> d!72853 (= (array_inv!8116 _values!506) (bvsge (size!11403 _values!506) #b00000000000000000000000000000000))))

(assert (=> start!37988 d!72853))

(declare-fun d!72855 () Bool)

(assert (=> d!72855 (= (array_inv!8117 _keys!658) (bvsge (size!11402 _keys!658) #b00000000000000000000000000000000))))

(assert (=> start!37988 d!72855))

(declare-fun d!72857 () Bool)

(declare-fun e!236765 () Bool)

(assert (=> d!72857 e!236765))

(declare-fun res!223788 () Bool)

(assert (=> d!72857 (=> (not res!223788) (not e!236765))))

(declare-fun lt!184268 () ListLongMap!5427)

(assert (=> d!72857 (= res!223788 (contains!2449 lt!184268 (_1!3273 lt!184193)))))

(declare-fun lt!184265 () List!6369)

(assert (=> d!72857 (= lt!184268 (ListLongMap!5428 lt!184265))))

(declare-fun lt!184266 () Unit!11944)

(declare-fun lt!184267 () Unit!11944)

(assert (=> d!72857 (= lt!184266 lt!184267)))

(assert (=> d!72857 (= (getValueByKey!359 lt!184265 (_1!3273 lt!184193)) (Some!364 (_2!3273 lt!184193)))))

(assert (=> d!72857 (= lt!184267 (lemmaContainsTupThenGetReturnValue!184 lt!184265 (_1!3273 lt!184193) (_2!3273 lt!184193)))))

(assert (=> d!72857 (= lt!184265 (insertStrictlySorted!187 (toList!2729 lt!184191) (_1!3273 lt!184193) (_2!3273 lt!184193)))))

(assert (=> d!72857 (= (+!1049 lt!184191 lt!184193) lt!184268)))

(declare-fun b!390918 () Bool)

(declare-fun res!223787 () Bool)

(assert (=> b!390918 (=> (not res!223787) (not e!236765))))

(assert (=> b!390918 (= res!223787 (= (getValueByKey!359 (toList!2729 lt!184268) (_1!3273 lt!184193)) (Some!364 (_2!3273 lt!184193))))))

(declare-fun b!390919 () Bool)

(assert (=> b!390919 (= e!236765 (contains!2450 (toList!2729 lt!184268) lt!184193))))

(assert (= (and d!72857 res!223788) b!390918))

(assert (= (and b!390918 res!223787) b!390919))

(declare-fun m!386829 () Bool)

(assert (=> d!72857 m!386829))

(declare-fun m!386831 () Bool)

(assert (=> d!72857 m!386831))

(declare-fun m!386833 () Bool)

(assert (=> d!72857 m!386833))

(declare-fun m!386835 () Bool)

(assert (=> d!72857 m!386835))

(declare-fun m!386837 () Bool)

(assert (=> b!390918 m!386837))

(declare-fun m!386839 () Bool)

(assert (=> b!390919 m!386839))

(assert (=> b!390781 d!72857))

(declare-fun bm!27563 () Bool)

(declare-fun call!27566 () Bool)

(assert (=> bm!27563 (= call!27566 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!658 mask!970))))

(declare-fun b!390928 () Bool)

(declare-fun e!236774 () Bool)

(assert (=> b!390928 (= e!236774 call!27566)))

(declare-fun d!72859 () Bool)

(declare-fun res!223793 () Bool)

(declare-fun e!236773 () Bool)

(assert (=> d!72859 (=> res!223793 e!236773)))

(assert (=> d!72859 (= res!223793 (bvsge #b00000000000000000000000000000000 (size!11402 _keys!658)))))

(assert (=> d!72859 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970) e!236773)))

(declare-fun b!390929 () Bool)

(declare-fun e!236772 () Bool)

(assert (=> b!390929 (= e!236772 call!27566)))

(declare-fun b!390930 () Bool)

(assert (=> b!390930 (= e!236773 e!236772)))

(declare-fun c!54166 () Bool)

(assert (=> b!390930 (= c!54166 (validKeyInArray!0 (select (arr!11049 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390931 () Bool)

(assert (=> b!390931 (= e!236772 e!236774)))

(declare-fun lt!184275 () (_ BitVec 64))

(assert (=> b!390931 (= lt!184275 (select (arr!11049 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184276 () Unit!11944)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!23173 (_ BitVec 64) (_ BitVec 32)) Unit!11944)

(assert (=> b!390931 (= lt!184276 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!658 lt!184275 #b00000000000000000000000000000000))))

(assert (=> b!390931 (arrayContainsKey!0 _keys!658 lt!184275 #b00000000000000000000000000000000)))

(declare-fun lt!184277 () Unit!11944)

(assert (=> b!390931 (= lt!184277 lt!184276)))

(declare-fun res!223794 () Bool)

(declare-datatypes ((SeekEntryResult!3509 0))(
  ( (MissingZero!3509 (index!16215 (_ BitVec 32))) (Found!3509 (index!16216 (_ BitVec 32))) (Intermediate!3509 (undefined!4321 Bool) (index!16217 (_ BitVec 32)) (x!38331 (_ BitVec 32))) (Undefined!3509) (MissingVacant!3509 (index!16218 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!23173 (_ BitVec 32)) SeekEntryResult!3509)

(assert (=> b!390931 (= res!223794 (= (seekEntryOrOpen!0 (select (arr!11049 _keys!658) #b00000000000000000000000000000000) _keys!658 mask!970) (Found!3509 #b00000000000000000000000000000000)))))

(assert (=> b!390931 (=> (not res!223794) (not e!236774))))

(assert (= (and d!72859 (not res!223793)) b!390930))

(assert (= (and b!390930 c!54166) b!390931))

(assert (= (and b!390930 (not c!54166)) b!390929))

(assert (= (and b!390931 res!223794) b!390928))

(assert (= (or b!390928 b!390929) bm!27563))

(declare-fun m!386841 () Bool)

(assert (=> bm!27563 m!386841))

(assert (=> b!390930 m!386799))

(assert (=> b!390930 m!386799))

(assert (=> b!390930 m!386803))

(assert (=> b!390931 m!386799))

(declare-fun m!386843 () Bool)

(assert (=> b!390931 m!386843))

(declare-fun m!386845 () Bool)

(assert (=> b!390931 m!386845))

(assert (=> b!390931 m!386799))

(declare-fun m!386847 () Bool)

(assert (=> b!390931 m!386847))

(assert (=> b!390782 d!72859))

(declare-fun d!72861 () Bool)

(assert (=> d!72861 (= (validKeyInArray!0 k0!778) (and (not (= k0!778 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!390783 d!72861))

(declare-fun bm!27564 () Bool)

(declare-fun call!27567 () Bool)

(assert (=> bm!27564 (= call!27567 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) lt!184195 mask!970))))

(declare-fun b!390932 () Bool)

(declare-fun e!236777 () Bool)

(assert (=> b!390932 (= e!236777 call!27567)))

(declare-fun d!72863 () Bool)

(declare-fun res!223795 () Bool)

(declare-fun e!236776 () Bool)

(assert (=> d!72863 (=> res!223795 e!236776)))

(assert (=> d!72863 (= res!223795 (bvsge #b00000000000000000000000000000000 (size!11402 lt!184195)))))

(assert (=> d!72863 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!184195 mask!970) e!236776)))

(declare-fun b!390933 () Bool)

(declare-fun e!236775 () Bool)

(assert (=> b!390933 (= e!236775 call!27567)))

(declare-fun b!390934 () Bool)

(assert (=> b!390934 (= e!236776 e!236775)))

(declare-fun c!54167 () Bool)

(assert (=> b!390934 (= c!54167 (validKeyInArray!0 (select (arr!11049 lt!184195) #b00000000000000000000000000000000)))))

(declare-fun b!390935 () Bool)

(assert (=> b!390935 (= e!236775 e!236777)))

(declare-fun lt!184278 () (_ BitVec 64))

(assert (=> b!390935 (= lt!184278 (select (arr!11049 lt!184195) #b00000000000000000000000000000000))))

(declare-fun lt!184279 () Unit!11944)

(assert (=> b!390935 (= lt!184279 (lemmaArrayContainsFromImpliesContainsFromZero!0 lt!184195 lt!184278 #b00000000000000000000000000000000))))

(assert (=> b!390935 (arrayContainsKey!0 lt!184195 lt!184278 #b00000000000000000000000000000000)))

(declare-fun lt!184280 () Unit!11944)

(assert (=> b!390935 (= lt!184280 lt!184279)))

(declare-fun res!223796 () Bool)

(assert (=> b!390935 (= res!223796 (= (seekEntryOrOpen!0 (select (arr!11049 lt!184195) #b00000000000000000000000000000000) lt!184195 mask!970) (Found!3509 #b00000000000000000000000000000000)))))

(assert (=> b!390935 (=> (not res!223796) (not e!236777))))

(assert (= (and d!72863 (not res!223795)) b!390934))

(assert (= (and b!390934 c!54167) b!390935))

(assert (= (and b!390934 (not c!54167)) b!390933))

(assert (= (and b!390935 res!223796) b!390932))

(assert (= (or b!390932 b!390933) bm!27564))

(declare-fun m!386849 () Bool)

(assert (=> bm!27564 m!386849))

(assert (=> b!390934 m!386807))

(assert (=> b!390934 m!386807))

(assert (=> b!390934 m!386811))

(assert (=> b!390935 m!386807))

(declare-fun m!386851 () Bool)

(assert (=> b!390935 m!386851))

(declare-fun m!386853 () Bool)

(assert (=> b!390935 m!386853))

(assert (=> b!390935 m!386807))

(declare-fun m!386855 () Bool)

(assert (=> b!390935 m!386855))

(assert (=> b!390784 d!72863))

(declare-fun b!390960 () Bool)

(declare-fun e!236798 () Bool)

(declare-fun e!236797 () Bool)

(assert (=> b!390960 (= e!236798 e!236797)))

(declare-fun c!54179 () Bool)

(assert (=> b!390960 (= c!54179 (bvslt #b00000000000000000000000000000000 (size!11402 _keys!658)))))

(declare-fun b!390961 () Bool)

(declare-fun e!236792 () ListLongMap!5427)

(assert (=> b!390961 (= e!236792 (ListLongMap!5428 Nil!6366))))

(declare-fun lt!184298 () ListLongMap!5427)

(declare-fun b!390962 () Bool)

(assert (=> b!390962 (= e!236797 (= lt!184298 (getCurrentListMapNoExtraKeys!964 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!390963 () Bool)

(declare-fun isEmpty!553 (ListLongMap!5427) Bool)

(assert (=> b!390963 (= e!236797 (isEmpty!553 lt!184298))))

(declare-fun bm!27567 () Bool)

(declare-fun call!27570 () ListLongMap!5427)

(assert (=> bm!27567 (= call!27570 (getCurrentListMapNoExtraKeys!964 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!390964 () Bool)

(declare-fun e!236793 () Bool)

(assert (=> b!390964 (= e!236793 (validKeyInArray!0 (select (arr!11049 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390964 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!72865 () Bool)

(declare-fun e!236796 () Bool)

(assert (=> d!72865 e!236796))

(declare-fun res!223808 () Bool)

(assert (=> d!72865 (=> (not res!223808) (not e!236796))))

(assert (=> d!72865 (= res!223808 (not (contains!2449 lt!184298 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72865 (= lt!184298 e!236792)))

(declare-fun c!54178 () Bool)

(assert (=> d!72865 (= c!54178 (bvsge #b00000000000000000000000000000000 (size!11402 _keys!658)))))

(assert (=> d!72865 (validMask!0 mask!970)))

(assert (=> d!72865 (= (getCurrentListMapNoExtraKeys!964 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184298)))

(declare-fun b!390965 () Bool)

(declare-fun e!236795 () Bool)

(assert (=> b!390965 (= e!236798 e!236795)))

(assert (=> b!390965 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11402 _keys!658)))))

(declare-fun res!223806 () Bool)

(assert (=> b!390965 (= res!223806 (contains!2449 lt!184298 (select (arr!11049 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!390965 (=> (not res!223806) (not e!236795))))

(declare-fun b!390966 () Bool)

(assert (=> b!390966 (= e!236796 e!236798)))

(declare-fun c!54177 () Bool)

(assert (=> b!390966 (= c!54177 e!236793)))

(declare-fun res!223805 () Bool)

(assert (=> b!390966 (=> (not res!223805) (not e!236793))))

(assert (=> b!390966 (= res!223805 (bvslt #b00000000000000000000000000000000 (size!11402 _keys!658)))))

(declare-fun b!390967 () Bool)

(declare-fun lt!184297 () Unit!11944)

(declare-fun lt!184299 () Unit!11944)

(assert (=> b!390967 (= lt!184297 lt!184299)))

(declare-fun lt!184301 () (_ BitVec 64))

(declare-fun lt!184295 () (_ BitVec 64))

(declare-fun lt!184300 () V!13963)

(declare-fun lt!184296 () ListLongMap!5427)

(assert (=> b!390967 (not (contains!2449 (+!1049 lt!184296 (tuple2!6525 lt!184295 lt!184300)) lt!184301))))

(declare-fun addStillNotContains!137 (ListLongMap!5427 (_ BitVec 64) V!13963 (_ BitVec 64)) Unit!11944)

(assert (=> b!390967 (= lt!184299 (addStillNotContains!137 lt!184296 lt!184295 lt!184300 lt!184301))))

(assert (=> b!390967 (= lt!184301 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun get!5585 (ValueCell!4478 V!13963) V!13963)

(declare-fun dynLambda!637 (Int (_ BitVec 64)) V!13963)

(assert (=> b!390967 (= lt!184300 (get!5585 (select (arr!11050 _values!506) #b00000000000000000000000000000000) (dynLambda!637 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!390967 (= lt!184295 (select (arr!11049 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!390967 (= lt!184296 call!27570)))

(declare-fun e!236794 () ListLongMap!5427)

(assert (=> b!390967 (= e!236794 (+!1049 call!27570 (tuple2!6525 (select (arr!11049 _keys!658) #b00000000000000000000000000000000) (get!5585 (select (arr!11050 _values!506) #b00000000000000000000000000000000) (dynLambda!637 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!390968 () Bool)

(assert (=> b!390968 (= e!236794 call!27570)))

(declare-fun b!390969 () Bool)

(assert (=> b!390969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11402 _keys!658)))))

(assert (=> b!390969 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11403 _values!506)))))

(declare-fun apply!303 (ListLongMap!5427 (_ BitVec 64)) V!13963)

(assert (=> b!390969 (= e!236795 (= (apply!303 lt!184298 (select (arr!11049 _keys!658) #b00000000000000000000000000000000)) (get!5585 (select (arr!11050 _values!506) #b00000000000000000000000000000000) (dynLambda!637 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!390970 () Bool)

(assert (=> b!390970 (= e!236792 e!236794)))

(declare-fun c!54176 () Bool)

(assert (=> b!390970 (= c!54176 (validKeyInArray!0 (select (arr!11049 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!390971 () Bool)

(declare-fun res!223807 () Bool)

(assert (=> b!390971 (=> (not res!223807) (not e!236796))))

(assert (=> b!390971 (= res!223807 (not (contains!2449 lt!184298 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!72865 c!54178) b!390961))

(assert (= (and d!72865 (not c!54178)) b!390970))

(assert (= (and b!390970 c!54176) b!390967))

(assert (= (and b!390970 (not c!54176)) b!390968))

(assert (= (or b!390967 b!390968) bm!27567))

(assert (= (and d!72865 res!223808) b!390971))

(assert (= (and b!390971 res!223807) b!390966))

(assert (= (and b!390966 res!223805) b!390964))

(assert (= (and b!390966 c!54177) b!390965))

(assert (= (and b!390966 (not c!54177)) b!390960))

(assert (= (and b!390965 res!223806) b!390969))

(assert (= (and b!390960 c!54179) b!390962))

(assert (= (and b!390960 (not c!54179)) b!390963))

(declare-fun b_lambda!8653 () Bool)

(assert (=> (not b_lambda!8653) (not b!390967)))

(declare-fun t!11526 () Bool)

(declare-fun tb!3113 () Bool)

(assert (=> (and start!37988 (= defaultEntry!514 defaultEntry!514) t!11526) tb!3113))

(declare-fun result!5735 () Bool)

(assert (=> tb!3113 (= result!5735 tp_is_empty!9643)))

(assert (=> b!390967 t!11526))

(declare-fun b_and!16265 () Bool)

(assert (= b_and!16259 (and (=> t!11526 result!5735) b_and!16265)))

(declare-fun b_lambda!8655 () Bool)

(assert (=> (not b_lambda!8655) (not b!390969)))

(assert (=> b!390969 t!11526))

(declare-fun b_and!16267 () Bool)

(assert (= b_and!16265 (and (=> t!11526 result!5735) b_and!16267)))

(assert (=> b!390964 m!386799))

(assert (=> b!390964 m!386799))

(assert (=> b!390964 m!386803))

(assert (=> b!390970 m!386799))

(assert (=> b!390970 m!386799))

(assert (=> b!390970 m!386803))

(assert (=> b!390967 m!386799))

(declare-fun m!386857 () Bool)

(assert (=> b!390967 m!386857))

(declare-fun m!386859 () Bool)

(assert (=> b!390967 m!386859))

(declare-fun m!386861 () Bool)

(assert (=> b!390967 m!386861))

(declare-fun m!386863 () Bool)

(assert (=> b!390967 m!386863))

(declare-fun m!386865 () Bool)

(assert (=> b!390967 m!386865))

(declare-fun m!386867 () Bool)

(assert (=> b!390967 m!386867))

(assert (=> b!390967 m!386863))

(assert (=> b!390967 m!386865))

(assert (=> b!390967 m!386857))

(declare-fun m!386869 () Bool)

(assert (=> b!390967 m!386869))

(declare-fun m!386871 () Bool)

(assert (=> d!72865 m!386871))

(assert (=> d!72865 m!386697))

(declare-fun m!386873 () Bool)

(assert (=> b!390962 m!386873))

(declare-fun m!386875 () Bool)

(assert (=> b!390971 m!386875))

(declare-fun m!386877 () Bool)

(assert (=> b!390963 m!386877))

(assert (=> b!390969 m!386799))

(assert (=> b!390969 m!386799))

(declare-fun m!386879 () Bool)

(assert (=> b!390969 m!386879))

(assert (=> b!390969 m!386865))

(assert (=> b!390969 m!386863))

(assert (=> b!390969 m!386865))

(assert (=> b!390969 m!386867))

(assert (=> b!390969 m!386863))

(assert (=> bm!27567 m!386873))

(assert (=> b!390965 m!386799))

(assert (=> b!390965 m!386799))

(declare-fun m!386881 () Bool)

(assert (=> b!390965 m!386881))

(assert (=> b!390785 d!72865))

(declare-fun bm!27582 () Bool)

(declare-fun call!27589 () ListLongMap!5427)

(assert (=> bm!27582 (= call!27589 (getCurrentListMapNoExtraKeys!964 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391016 () Bool)

(declare-fun e!236832 () Unit!11944)

(declare-fun Unit!11948 () Unit!11944)

(assert (=> b!391016 (= e!236832 Unit!11948)))

(declare-fun b!391017 () Bool)

(declare-fun e!236834 () Bool)

(declare-fun e!236829 () Bool)

(assert (=> b!391017 (= e!236834 e!236829)))

(declare-fun res!223834 () Bool)

(declare-fun call!27586 () Bool)

(assert (=> b!391017 (= res!223834 call!27586)))

(assert (=> b!391017 (=> (not res!223834) (not e!236829))))

(declare-fun b!391018 () Bool)

(declare-fun e!236835 () ListLongMap!5427)

(declare-fun e!236833 () ListLongMap!5427)

(assert (=> b!391018 (= e!236835 e!236833)))

(declare-fun c!54196 () Bool)

(assert (=> b!391018 (= c!54196 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391019 () Bool)

(declare-fun lt!184348 () ListLongMap!5427)

(assert (=> b!391019 (= e!236829 (= (apply!303 lt!184348 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!391020 () Bool)

(declare-fun e!236830 () Bool)

(assert (=> b!391020 (= e!236830 (= (apply!303 lt!184348 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27583 () Bool)

(declare-fun call!27591 () ListLongMap!5427)

(declare-fun call!27588 () ListLongMap!5427)

(assert (=> bm!27583 (= call!27591 call!27588)))

(declare-fun b!391021 () Bool)

(assert (=> b!391021 (= e!236834 (not call!27586))))

(declare-fun bm!27584 () Bool)

(declare-fun call!27587 () Bool)

(assert (=> bm!27584 (= call!27587 (contains!2449 lt!184348 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!391022 () Bool)

(declare-fun call!27590 () ListLongMap!5427)

(assert (=> b!391022 (= e!236833 call!27590)))

(declare-fun b!391023 () Bool)

(declare-fun res!223830 () Bool)

(declare-fun e!236831 () Bool)

(assert (=> b!391023 (=> (not res!223830) (not e!236831))))

(declare-fun e!236826 () Bool)

(assert (=> b!391023 (= res!223830 e!236826)))

(declare-fun res!223831 () Bool)

(assert (=> b!391023 (=> res!223831 e!236826)))

(declare-fun e!236836 () Bool)

(assert (=> b!391023 (= res!223831 (not e!236836))))

(declare-fun res!223828 () Bool)

(assert (=> b!391023 (=> (not res!223828) (not e!236836))))

(assert (=> b!391023 (= res!223828 (bvslt #b00000000000000000000000000000000 (size!11402 _keys!658)))))

(declare-fun b!391024 () Bool)

(declare-fun e!236825 () Bool)

(assert (=> b!391024 (= e!236825 (validKeyInArray!0 (select (arr!11049 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun e!236827 () Bool)

(declare-fun b!391025 () Bool)

(assert (=> b!391025 (= e!236827 (= (apply!303 lt!184348 (select (arr!11049 _keys!658) #b00000000000000000000000000000000)) (get!5585 (select (arr!11050 _values!506) #b00000000000000000000000000000000) (dynLambda!637 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11403 _values!506)))))

(assert (=> b!391025 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11402 _keys!658)))))

(declare-fun b!391026 () Bool)

(declare-fun c!54194 () Bool)

(assert (=> b!391026 (= c!54194 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!236837 () ListLongMap!5427)

(assert (=> b!391026 (= e!236833 e!236837)))

(declare-fun d!72867 () Bool)

(assert (=> d!72867 e!236831))

(declare-fun res!223827 () Bool)

(assert (=> d!72867 (=> (not res!223827) (not e!236831))))

(assert (=> d!72867 (= res!223827 (or (bvsge #b00000000000000000000000000000000 (size!11402 _keys!658)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11402 _keys!658)))))))

(declare-fun lt!184359 () ListLongMap!5427)

(assert (=> d!72867 (= lt!184348 lt!184359)))

(declare-fun lt!184366 () Unit!11944)

(assert (=> d!72867 (= lt!184366 e!236832)))

(declare-fun c!54197 () Bool)

(assert (=> d!72867 (= c!54197 e!236825)))

(declare-fun res!223832 () Bool)

(assert (=> d!72867 (=> (not res!223832) (not e!236825))))

(assert (=> d!72867 (= res!223832 (bvslt #b00000000000000000000000000000000 (size!11402 _keys!658)))))

(assert (=> d!72867 (= lt!184359 e!236835)))

(declare-fun c!54193 () Bool)

(assert (=> d!72867 (= c!54193 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72867 (validMask!0 mask!970)))

(assert (=> d!72867 (= (getCurrentListMap!2054 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184348)))

(declare-fun b!391027 () Bool)

(declare-fun e!236828 () Bool)

(assert (=> b!391027 (= e!236828 e!236830)))

(declare-fun res!223829 () Bool)

(assert (=> b!391027 (= res!223829 call!27587)))

(assert (=> b!391027 (=> (not res!223829) (not e!236830))))

(declare-fun bm!27585 () Bool)

(assert (=> bm!27585 (= call!27586 (contains!2449 lt!184348 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!391028 () Bool)

(assert (=> b!391028 (= e!236826 e!236827)))

(declare-fun res!223835 () Bool)

(assert (=> b!391028 (=> (not res!223835) (not e!236827))))

(assert (=> b!391028 (= res!223835 (contains!2449 lt!184348 (select (arr!11049 _keys!658) #b00000000000000000000000000000000)))))

(assert (=> b!391028 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11402 _keys!658)))))

(declare-fun call!27585 () ListLongMap!5427)

(declare-fun bm!27586 () Bool)

(assert (=> bm!27586 (= call!27585 (+!1049 (ite c!54193 call!27589 (ite c!54196 call!27588 call!27591)) (ite (or c!54193 c!54196) (tuple2!6525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!391029 () Bool)

(assert (=> b!391029 (= e!236831 e!236828)))

(declare-fun c!54192 () Bool)

(assert (=> b!391029 (= c!54192 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391030 () Bool)

(assert (=> b!391030 (= e!236837 call!27591)))

(declare-fun b!391031 () Bool)

(assert (=> b!391031 (= e!236837 call!27590)))

(declare-fun b!391032 () Bool)

(assert (=> b!391032 (= e!236835 (+!1049 call!27585 (tuple2!6525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun bm!27587 () Bool)

(assert (=> bm!27587 (= call!27588 call!27589)))

(declare-fun b!391033 () Bool)

(assert (=> b!391033 (= e!236828 (not call!27587))))

(declare-fun b!391034 () Bool)

(assert (=> b!391034 (= e!236836 (validKeyInArray!0 (select (arr!11049 _keys!658) #b00000000000000000000000000000000)))))

(declare-fun b!391035 () Bool)

(declare-fun res!223833 () Bool)

(assert (=> b!391035 (=> (not res!223833) (not e!236831))))

(assert (=> b!391035 (= res!223833 e!236834)))

(declare-fun c!54195 () Bool)

(assert (=> b!391035 (= c!54195 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!391036 () Bool)

(declare-fun lt!184358 () Unit!11944)

(assert (=> b!391036 (= e!236832 lt!184358)))

(declare-fun lt!184360 () ListLongMap!5427)

(assert (=> b!391036 (= lt!184360 (getCurrentListMapNoExtraKeys!964 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184367 () (_ BitVec 64))

(assert (=> b!391036 (= lt!184367 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184355 () (_ BitVec 64))

(assert (=> b!391036 (= lt!184355 (select (arr!11049 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184352 () Unit!11944)

(declare-fun addStillContains!279 (ListLongMap!5427 (_ BitVec 64) V!13963 (_ BitVec 64)) Unit!11944)

(assert (=> b!391036 (= lt!184352 (addStillContains!279 lt!184360 lt!184367 zeroValue!472 lt!184355))))

(assert (=> b!391036 (contains!2449 (+!1049 lt!184360 (tuple2!6525 lt!184367 zeroValue!472)) lt!184355)))

(declare-fun lt!184354 () Unit!11944)

(assert (=> b!391036 (= lt!184354 lt!184352)))

(declare-fun lt!184365 () ListLongMap!5427)

(assert (=> b!391036 (= lt!184365 (getCurrentListMapNoExtraKeys!964 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184364 () (_ BitVec 64))

(assert (=> b!391036 (= lt!184364 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184346 () (_ BitVec 64))

(assert (=> b!391036 (= lt!184346 (select (arr!11049 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184356 () Unit!11944)

(declare-fun addApplyDifferent!279 (ListLongMap!5427 (_ BitVec 64) V!13963 (_ BitVec 64)) Unit!11944)

(assert (=> b!391036 (= lt!184356 (addApplyDifferent!279 lt!184365 lt!184364 minValue!472 lt!184346))))

(assert (=> b!391036 (= (apply!303 (+!1049 lt!184365 (tuple2!6525 lt!184364 minValue!472)) lt!184346) (apply!303 lt!184365 lt!184346))))

(declare-fun lt!184350 () Unit!11944)

(assert (=> b!391036 (= lt!184350 lt!184356)))

(declare-fun lt!184363 () ListLongMap!5427)

(assert (=> b!391036 (= lt!184363 (getCurrentListMapNoExtraKeys!964 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184347 () (_ BitVec 64))

(assert (=> b!391036 (= lt!184347 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184349 () (_ BitVec 64))

(assert (=> b!391036 (= lt!184349 (select (arr!11049 _keys!658) #b00000000000000000000000000000000))))

(declare-fun lt!184362 () Unit!11944)

(assert (=> b!391036 (= lt!184362 (addApplyDifferent!279 lt!184363 lt!184347 zeroValue!472 lt!184349))))

(assert (=> b!391036 (= (apply!303 (+!1049 lt!184363 (tuple2!6525 lt!184347 zeroValue!472)) lt!184349) (apply!303 lt!184363 lt!184349))))

(declare-fun lt!184353 () Unit!11944)

(assert (=> b!391036 (= lt!184353 lt!184362)))

(declare-fun lt!184351 () ListLongMap!5427)

(assert (=> b!391036 (= lt!184351 (getCurrentListMapNoExtraKeys!964 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184357 () (_ BitVec 64))

(assert (=> b!391036 (= lt!184357 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184361 () (_ BitVec 64))

(assert (=> b!391036 (= lt!184361 (select (arr!11049 _keys!658) #b00000000000000000000000000000000))))

(assert (=> b!391036 (= lt!184358 (addApplyDifferent!279 lt!184351 lt!184357 minValue!472 lt!184361))))

(assert (=> b!391036 (= (apply!303 (+!1049 lt!184351 (tuple2!6525 lt!184357 minValue!472)) lt!184361) (apply!303 lt!184351 lt!184361))))

(declare-fun bm!27588 () Bool)

(assert (=> bm!27588 (= call!27590 call!27585)))

(assert (= (and d!72867 c!54193) b!391032))

(assert (= (and d!72867 (not c!54193)) b!391018))

(assert (= (and b!391018 c!54196) b!391022))

(assert (= (and b!391018 (not c!54196)) b!391026))

(assert (= (and b!391026 c!54194) b!391031))

(assert (= (and b!391026 (not c!54194)) b!391030))

(assert (= (or b!391031 b!391030) bm!27583))

(assert (= (or b!391022 bm!27583) bm!27587))

(assert (= (or b!391022 b!391031) bm!27588))

(assert (= (or b!391032 bm!27587) bm!27582))

(assert (= (or b!391032 bm!27588) bm!27586))

(assert (= (and d!72867 res!223832) b!391024))

(assert (= (and d!72867 c!54197) b!391036))

(assert (= (and d!72867 (not c!54197)) b!391016))

(assert (= (and d!72867 res!223827) b!391023))

(assert (= (and b!391023 res!223828) b!391034))

(assert (= (and b!391023 (not res!223831)) b!391028))

(assert (= (and b!391028 res!223835) b!391025))

(assert (= (and b!391023 res!223830) b!391035))

(assert (= (and b!391035 c!54195) b!391017))

(assert (= (and b!391035 (not c!54195)) b!391021))

(assert (= (and b!391017 res!223834) b!391019))

(assert (= (or b!391017 b!391021) bm!27585))

(assert (= (and b!391035 res!223833) b!391029))

(assert (= (and b!391029 c!54192) b!391027))

(assert (= (and b!391029 (not c!54192)) b!391033))

(assert (= (and b!391027 res!223829) b!391020))

(assert (= (or b!391027 b!391033) bm!27584))

(declare-fun b_lambda!8657 () Bool)

(assert (=> (not b_lambda!8657) (not b!391025)))

(assert (=> b!391025 t!11526))

(declare-fun b_and!16269 () Bool)

(assert (= b_and!16267 (and (=> t!11526 result!5735) b_and!16269)))

(assert (=> b!391028 m!386799))

(assert (=> b!391028 m!386799))

(declare-fun m!386883 () Bool)

(assert (=> b!391028 m!386883))

(assert (=> b!391034 m!386799))

(assert (=> b!391034 m!386799))

(assert (=> b!391034 m!386803))

(assert (=> bm!27582 m!386667))

(declare-fun m!386885 () Bool)

(assert (=> b!391032 m!386885))

(assert (=> b!391024 m!386799))

(assert (=> b!391024 m!386799))

(assert (=> b!391024 m!386803))

(declare-fun m!386887 () Bool)

(assert (=> bm!27585 m!386887))

(declare-fun m!386889 () Bool)

(assert (=> b!391020 m!386889))

(assert (=> d!72867 m!386697))

(declare-fun m!386891 () Bool)

(assert (=> b!391036 m!386891))

(declare-fun m!386893 () Bool)

(assert (=> b!391036 m!386893))

(declare-fun m!386895 () Bool)

(assert (=> b!391036 m!386895))

(declare-fun m!386897 () Bool)

(assert (=> b!391036 m!386897))

(declare-fun m!386899 () Bool)

(assert (=> b!391036 m!386899))

(assert (=> b!391036 m!386799))

(declare-fun m!386901 () Bool)

(assert (=> b!391036 m!386901))

(assert (=> b!391036 m!386901))

(declare-fun m!386903 () Bool)

(assert (=> b!391036 m!386903))

(assert (=> b!391036 m!386891))

(declare-fun m!386905 () Bool)

(assert (=> b!391036 m!386905))

(declare-fun m!386907 () Bool)

(assert (=> b!391036 m!386907))

(assert (=> b!391036 m!386907))

(declare-fun m!386909 () Bool)

(assert (=> b!391036 m!386909))

(declare-fun m!386911 () Bool)

(assert (=> b!391036 m!386911))

(assert (=> b!391036 m!386897))

(declare-fun m!386913 () Bool)

(assert (=> b!391036 m!386913))

(declare-fun m!386915 () Bool)

(assert (=> b!391036 m!386915))

(assert (=> b!391036 m!386667))

(declare-fun m!386917 () Bool)

(assert (=> b!391036 m!386917))

(declare-fun m!386919 () Bool)

(assert (=> b!391036 m!386919))

(declare-fun m!386921 () Bool)

(assert (=> bm!27584 m!386921))

(assert (=> b!391025 m!386799))

(assert (=> b!391025 m!386863))

(assert (=> b!391025 m!386799))

(declare-fun m!386923 () Bool)

(assert (=> b!391025 m!386923))

(assert (=> b!391025 m!386863))

(assert (=> b!391025 m!386865))

(assert (=> b!391025 m!386867))

(assert (=> b!391025 m!386865))

(declare-fun m!386925 () Bool)

(assert (=> b!391019 m!386925))

(declare-fun m!386927 () Bool)

(assert (=> bm!27586 m!386927))

(assert (=> b!390785 d!72867))

(declare-fun b!391037 () Bool)

(declare-fun e!236844 () Bool)

(declare-fun e!236843 () Bool)

(assert (=> b!391037 (= e!236844 e!236843)))

(declare-fun c!54201 () Bool)

(assert (=> b!391037 (= c!54201 (bvslt #b00000000000000000000000000000000 (size!11402 lt!184195)))))

(declare-fun b!391038 () Bool)

(declare-fun e!236838 () ListLongMap!5427)

(assert (=> b!391038 (= e!236838 (ListLongMap!5428 Nil!6366))))

(declare-fun b!391039 () Bool)

(declare-fun lt!184371 () ListLongMap!5427)

(assert (=> b!391039 (= e!236843 (= lt!184371 (getCurrentListMapNoExtraKeys!964 lt!184195 lt!184192 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514)))))

(declare-fun b!391040 () Bool)

(assert (=> b!391040 (= e!236843 (isEmpty!553 lt!184371))))

(declare-fun bm!27589 () Bool)

(declare-fun call!27592 () ListLongMap!5427)

(assert (=> bm!27589 (= call!27592 (getCurrentListMapNoExtraKeys!964 lt!184195 lt!184192 mask!970 extraKeys!453 zeroValue!472 minValue!472 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) defaultEntry!514))))

(declare-fun b!391041 () Bool)

(declare-fun e!236839 () Bool)

(assert (=> b!391041 (= e!236839 (validKeyInArray!0 (select (arr!11049 lt!184195) #b00000000000000000000000000000000)))))

(assert (=> b!391041 (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000)))

(declare-fun d!72869 () Bool)

(declare-fun e!236842 () Bool)

(assert (=> d!72869 e!236842))

(declare-fun res!223839 () Bool)

(assert (=> d!72869 (=> (not res!223839) (not e!236842))))

(assert (=> d!72869 (= res!223839 (not (contains!2449 lt!184371 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!72869 (= lt!184371 e!236838)))

(declare-fun c!54200 () Bool)

(assert (=> d!72869 (= c!54200 (bvsge #b00000000000000000000000000000000 (size!11402 lt!184195)))))

(assert (=> d!72869 (validMask!0 mask!970)))

(assert (=> d!72869 (= (getCurrentListMapNoExtraKeys!964 lt!184195 lt!184192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184371)))

(declare-fun b!391042 () Bool)

(declare-fun e!236841 () Bool)

(assert (=> b!391042 (= e!236844 e!236841)))

(assert (=> b!391042 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11402 lt!184195)))))

(declare-fun res!223837 () Bool)

(assert (=> b!391042 (= res!223837 (contains!2449 lt!184371 (select (arr!11049 lt!184195) #b00000000000000000000000000000000)))))

(assert (=> b!391042 (=> (not res!223837) (not e!236841))))

(declare-fun b!391043 () Bool)

(assert (=> b!391043 (= e!236842 e!236844)))

(declare-fun c!54199 () Bool)

(assert (=> b!391043 (= c!54199 e!236839)))

(declare-fun res!223836 () Bool)

(assert (=> b!391043 (=> (not res!223836) (not e!236839))))

(assert (=> b!391043 (= res!223836 (bvslt #b00000000000000000000000000000000 (size!11402 lt!184195)))))

(declare-fun b!391044 () Bool)

(declare-fun lt!184370 () Unit!11944)

(declare-fun lt!184372 () Unit!11944)

(assert (=> b!391044 (= lt!184370 lt!184372)))

(declare-fun lt!184374 () (_ BitVec 64))

(declare-fun lt!184373 () V!13963)

(declare-fun lt!184368 () (_ BitVec 64))

(declare-fun lt!184369 () ListLongMap!5427)

(assert (=> b!391044 (not (contains!2449 (+!1049 lt!184369 (tuple2!6525 lt!184368 lt!184373)) lt!184374))))

(assert (=> b!391044 (= lt!184372 (addStillNotContains!137 lt!184369 lt!184368 lt!184373 lt!184374))))

(assert (=> b!391044 (= lt!184374 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> b!391044 (= lt!184373 (get!5585 (select (arr!11050 lt!184192) #b00000000000000000000000000000000) (dynLambda!637 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!391044 (= lt!184368 (select (arr!11049 lt!184195) #b00000000000000000000000000000000))))

(assert (=> b!391044 (= lt!184369 call!27592)))

(declare-fun e!236840 () ListLongMap!5427)

(assert (=> b!391044 (= e!236840 (+!1049 call!27592 (tuple2!6525 (select (arr!11049 lt!184195) #b00000000000000000000000000000000) (get!5585 (select (arr!11050 lt!184192) #b00000000000000000000000000000000) (dynLambda!637 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!391045 () Bool)

(assert (=> b!391045 (= e!236840 call!27592)))

(declare-fun b!391046 () Bool)

(assert (=> b!391046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11402 lt!184195)))))

(assert (=> b!391046 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11403 lt!184192)))))

(assert (=> b!391046 (= e!236841 (= (apply!303 lt!184371 (select (arr!11049 lt!184195) #b00000000000000000000000000000000)) (get!5585 (select (arr!11050 lt!184192) #b00000000000000000000000000000000) (dynLambda!637 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!391047 () Bool)

(assert (=> b!391047 (= e!236838 e!236840)))

(declare-fun c!54198 () Bool)

(assert (=> b!391047 (= c!54198 (validKeyInArray!0 (select (arr!11049 lt!184195) #b00000000000000000000000000000000)))))

(declare-fun b!391048 () Bool)

(declare-fun res!223838 () Bool)

(assert (=> b!391048 (=> (not res!223838) (not e!236842))))

(assert (=> b!391048 (= res!223838 (not (contains!2449 lt!184371 #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and d!72869 c!54200) b!391038))

(assert (= (and d!72869 (not c!54200)) b!391047))

(assert (= (and b!391047 c!54198) b!391044))

(assert (= (and b!391047 (not c!54198)) b!391045))

(assert (= (or b!391044 b!391045) bm!27589))

(assert (= (and d!72869 res!223839) b!391048))

(assert (= (and b!391048 res!223838) b!391043))

(assert (= (and b!391043 res!223836) b!391041))

(assert (= (and b!391043 c!54199) b!391042))

(assert (= (and b!391043 (not c!54199)) b!391037))

(assert (= (and b!391042 res!223837) b!391046))

(assert (= (and b!391037 c!54201) b!391039))

(assert (= (and b!391037 (not c!54201)) b!391040))

(declare-fun b_lambda!8659 () Bool)

(assert (=> (not b_lambda!8659) (not b!391044)))

(assert (=> b!391044 t!11526))

(declare-fun b_and!16271 () Bool)

(assert (= b_and!16269 (and (=> t!11526 result!5735) b_and!16271)))

(declare-fun b_lambda!8661 () Bool)

(assert (=> (not b_lambda!8661) (not b!391046)))

(assert (=> b!391046 t!11526))

(declare-fun b_and!16273 () Bool)

(assert (= b_and!16271 (and (=> t!11526 result!5735) b_and!16273)))

(assert (=> b!391041 m!386807))

(assert (=> b!391041 m!386807))

(assert (=> b!391041 m!386811))

(assert (=> b!391047 m!386807))

(assert (=> b!391047 m!386807))

(assert (=> b!391047 m!386811))

(assert (=> b!391044 m!386807))

(declare-fun m!386929 () Bool)

(assert (=> b!391044 m!386929))

(declare-fun m!386931 () Bool)

(assert (=> b!391044 m!386931))

(declare-fun m!386933 () Bool)

(assert (=> b!391044 m!386933))

(declare-fun m!386935 () Bool)

(assert (=> b!391044 m!386935))

(assert (=> b!391044 m!386865))

(declare-fun m!386937 () Bool)

(assert (=> b!391044 m!386937))

(assert (=> b!391044 m!386935))

(assert (=> b!391044 m!386865))

(assert (=> b!391044 m!386929))

(declare-fun m!386939 () Bool)

(assert (=> b!391044 m!386939))

(declare-fun m!386941 () Bool)

(assert (=> d!72869 m!386941))

(assert (=> d!72869 m!386697))

(declare-fun m!386943 () Bool)

(assert (=> b!391039 m!386943))

(declare-fun m!386945 () Bool)

(assert (=> b!391048 m!386945))

(declare-fun m!386947 () Bool)

(assert (=> b!391040 m!386947))

(assert (=> b!391046 m!386807))

(assert (=> b!391046 m!386807))

(declare-fun m!386949 () Bool)

(assert (=> b!391046 m!386949))

(assert (=> b!391046 m!386865))

(assert (=> b!391046 m!386935))

(assert (=> b!391046 m!386865))

(assert (=> b!391046 m!386937))

(assert (=> b!391046 m!386935))

(assert (=> bm!27589 m!386943))

(assert (=> b!391042 m!386807))

(assert (=> b!391042 m!386807))

(declare-fun m!386951 () Bool)

(assert (=> b!391042 m!386951))

(assert (=> b!390785 d!72869))

(declare-fun b!391055 () Bool)

(declare-fun e!236850 () Bool)

(declare-fun e!236849 () Bool)

(assert (=> b!391055 (= e!236850 e!236849)))

(declare-fun c!54204 () Bool)

(assert (=> b!391055 (= c!54204 (bvsle #b00000000000000000000000000000000 i!548))))

(declare-fun b!391056 () Bool)

(declare-fun call!27598 () ListLongMap!5427)

(declare-fun call!27597 () ListLongMap!5427)

(assert (=> b!391056 (= e!236849 (= call!27597 (+!1049 call!27598 (tuple2!6525 k0!778 v!373))))))

(declare-fun d!72871 () Bool)

(assert (=> d!72871 e!236850))

(declare-fun res!223842 () Bool)

(assert (=> d!72871 (=> (not res!223842) (not e!236850))))

(assert (=> d!72871 (= res!223842 (and (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11402 _keys!658)))) (or (not (bvsle #b00000000000000000000000000000000 i!548)) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11403 _values!506)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11402 _keys!658)))) (or (bvsle #b00000000000000000000000000000000 i!548) (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11403 _values!506))))))))

(declare-fun lt!184377 () Unit!11944)

(declare-fun choose!1325 (array!23173 array!23175 (_ BitVec 32) (_ BitVec 32) V!13963 V!13963 (_ BitVec 32) (_ BitVec 64) V!13963 (_ BitVec 32) Int) Unit!11944)

(assert (=> d!72871 (= lt!184377 (choose!1325 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> d!72871 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvsle #b00000000000000000000000000000000 (size!11402 _keys!658)))))

(assert (=> d!72871 (= (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!255 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514) lt!184377)))

(declare-fun b!391057 () Bool)

(assert (=> b!391057 (= e!236849 (= call!27597 call!27598))))

(declare-fun bm!27594 () Bool)

(assert (=> bm!27594 (= call!27597 (getCurrentListMapNoExtraKeys!964 (array!23174 (store (arr!11049 _keys!658) i!548 k0!778) (size!11402 _keys!658)) (array!23176 (store (arr!11050 _values!506) i!548 (ValueCellFull!4478 v!373)) (size!11403 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun bm!27595 () Bool)

(assert (=> bm!27595 (= call!27598 (getCurrentListMapNoExtraKeys!964 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and d!72871 res!223842) b!391055))

(assert (= (and b!391055 c!54204) b!391056))

(assert (= (and b!391055 (not c!54204)) b!391057))

(assert (= (or b!391056 b!391057) bm!27595))

(assert (= (or b!391056 b!391057) bm!27594))

(declare-fun m!386953 () Bool)

(assert (=> b!391056 m!386953))

(declare-fun m!386955 () Bool)

(assert (=> d!72871 m!386955))

(assert (=> bm!27594 m!386687))

(assert (=> bm!27594 m!386679))

(declare-fun m!386957 () Bool)

(assert (=> bm!27594 m!386957))

(assert (=> bm!27595 m!386667))

(assert (=> b!390785 d!72871))

(declare-fun call!27603 () ListLongMap!5427)

(declare-fun bm!27596 () Bool)

(assert (=> bm!27596 (= call!27603 (getCurrentListMapNoExtraKeys!964 lt!184195 lt!184192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!391058 () Bool)

(declare-fun e!236858 () Unit!11944)

(declare-fun Unit!11949 () Unit!11944)

(assert (=> b!391058 (= e!236858 Unit!11949)))

(declare-fun b!391059 () Bool)

(declare-fun e!236860 () Bool)

(declare-fun e!236855 () Bool)

(assert (=> b!391059 (= e!236860 e!236855)))

(declare-fun res!223850 () Bool)

(declare-fun call!27600 () Bool)

(assert (=> b!391059 (= res!223850 call!27600)))

(assert (=> b!391059 (=> (not res!223850) (not e!236855))))

(declare-fun b!391060 () Bool)

(declare-fun e!236861 () ListLongMap!5427)

(declare-fun e!236859 () ListLongMap!5427)

(assert (=> b!391060 (= e!236861 e!236859)))

(declare-fun c!54209 () Bool)

(assert (=> b!391060 (= c!54209 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391061 () Bool)

(declare-fun lt!184380 () ListLongMap!5427)

(assert (=> b!391061 (= e!236855 (= (apply!303 lt!184380 #b0000000000000000000000000000000000000000000000000000000000000000) zeroValue!472))))

(declare-fun b!391062 () Bool)

(declare-fun e!236856 () Bool)

(assert (=> b!391062 (= e!236856 (= (apply!303 lt!184380 #b1000000000000000000000000000000000000000000000000000000000000000) minValue!472))))

(declare-fun bm!27597 () Bool)

(declare-fun call!27605 () ListLongMap!5427)

(declare-fun call!27602 () ListLongMap!5427)

(assert (=> bm!27597 (= call!27605 call!27602)))

(declare-fun b!391063 () Bool)

(assert (=> b!391063 (= e!236860 (not call!27600))))

(declare-fun bm!27598 () Bool)

(declare-fun call!27601 () Bool)

(assert (=> bm!27598 (= call!27601 (contains!2449 lt!184380 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!391064 () Bool)

(declare-fun call!27604 () ListLongMap!5427)

(assert (=> b!391064 (= e!236859 call!27604)))

(declare-fun b!391065 () Bool)

(declare-fun res!223846 () Bool)

(declare-fun e!236857 () Bool)

(assert (=> b!391065 (=> (not res!223846) (not e!236857))))

(declare-fun e!236852 () Bool)

(assert (=> b!391065 (= res!223846 e!236852)))

(declare-fun res!223847 () Bool)

(assert (=> b!391065 (=> res!223847 e!236852)))

(declare-fun e!236862 () Bool)

(assert (=> b!391065 (= res!223847 (not e!236862))))

(declare-fun res!223844 () Bool)

(assert (=> b!391065 (=> (not res!223844) (not e!236862))))

(assert (=> b!391065 (= res!223844 (bvslt #b00000000000000000000000000000000 (size!11402 lt!184195)))))

(declare-fun b!391066 () Bool)

(declare-fun e!236851 () Bool)

(assert (=> b!391066 (= e!236851 (validKeyInArray!0 (select (arr!11049 lt!184195) #b00000000000000000000000000000000)))))

(declare-fun b!391067 () Bool)

(declare-fun e!236853 () Bool)

(assert (=> b!391067 (= e!236853 (= (apply!303 lt!184380 (select (arr!11049 lt!184195) #b00000000000000000000000000000000)) (get!5585 (select (arr!11050 lt!184192) #b00000000000000000000000000000000) (dynLambda!637 defaultEntry!514 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!391067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11403 lt!184192)))))

(assert (=> b!391067 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11402 lt!184195)))))

(declare-fun b!391068 () Bool)

(declare-fun c!54207 () Bool)

(assert (=> b!391068 (= c!54207 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun e!236863 () ListLongMap!5427)

(assert (=> b!391068 (= e!236859 e!236863)))

(declare-fun d!72873 () Bool)

(assert (=> d!72873 e!236857))

(declare-fun res!223843 () Bool)

(assert (=> d!72873 (=> (not res!223843) (not e!236857))))

(assert (=> d!72873 (= res!223843 (or (bvsge #b00000000000000000000000000000000 (size!11402 lt!184195)) (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11402 lt!184195)))))))

(declare-fun lt!184391 () ListLongMap!5427)

(assert (=> d!72873 (= lt!184380 lt!184391)))

(declare-fun lt!184398 () Unit!11944)

(assert (=> d!72873 (= lt!184398 e!236858)))

(declare-fun c!54210 () Bool)

(assert (=> d!72873 (= c!54210 e!236851)))

(declare-fun res!223848 () Bool)

(assert (=> d!72873 (=> (not res!223848) (not e!236851))))

(assert (=> d!72873 (= res!223848 (bvslt #b00000000000000000000000000000000 (size!11402 lt!184195)))))

(assert (=> d!72873 (= lt!184391 e!236861)))

(declare-fun c!54206 () Bool)

(assert (=> d!72873 (= c!54206 (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(assert (=> d!72873 (validMask!0 mask!970)))

(assert (=> d!72873 (= (getCurrentListMap!2054 lt!184195 lt!184192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514) lt!184380)))

(declare-fun b!391069 () Bool)

(declare-fun e!236854 () Bool)

(assert (=> b!391069 (= e!236854 e!236856)))

(declare-fun res!223845 () Bool)

(assert (=> b!391069 (= res!223845 call!27601)))

(assert (=> b!391069 (=> (not res!223845) (not e!236856))))

(declare-fun bm!27599 () Bool)

(assert (=> bm!27599 (= call!27600 (contains!2449 lt!184380 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!391070 () Bool)

(assert (=> b!391070 (= e!236852 e!236853)))

(declare-fun res!223851 () Bool)

(assert (=> b!391070 (=> (not res!223851) (not e!236853))))

(assert (=> b!391070 (= res!223851 (contains!2449 lt!184380 (select (arr!11049 lt!184195) #b00000000000000000000000000000000)))))

(assert (=> b!391070 (and (bvsge #b00000000000000000000000000000000 #b00000000000000000000000000000000) (bvslt #b00000000000000000000000000000000 (size!11402 lt!184195)))))

(declare-fun bm!27600 () Bool)

(declare-fun call!27599 () ListLongMap!5427)

(assert (=> bm!27600 (= call!27599 (+!1049 (ite c!54206 call!27603 (ite c!54209 call!27602 call!27605)) (ite (or c!54206 c!54209) (tuple2!6525 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472) (tuple2!6525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))))

(declare-fun b!391071 () Bool)

(assert (=> b!391071 (= e!236857 e!236854)))

(declare-fun c!54205 () Bool)

(assert (=> b!391071 (= c!54205 (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!391072 () Bool)

(assert (=> b!391072 (= e!236863 call!27605)))

(declare-fun b!391073 () Bool)

(assert (=> b!391073 (= e!236863 call!27604)))

(declare-fun b!391074 () Bool)

(assert (=> b!391074 (= e!236861 (+!1049 call!27599 (tuple2!6525 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472)))))

(declare-fun bm!27601 () Bool)

(assert (=> bm!27601 (= call!27602 call!27603)))

(declare-fun b!391075 () Bool)

(assert (=> b!391075 (= e!236854 (not call!27601))))

(declare-fun b!391076 () Bool)

(assert (=> b!391076 (= e!236862 (validKeyInArray!0 (select (arr!11049 lt!184195) #b00000000000000000000000000000000)))))

(declare-fun b!391077 () Bool)

(declare-fun res!223849 () Bool)

(assert (=> b!391077 (=> (not res!223849) (not e!236857))))

(assert (=> b!391077 (= res!223849 e!236860)))

(declare-fun c!54208 () Bool)

(assert (=> b!391077 (= c!54208 (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun b!391078 () Bool)

(declare-fun lt!184390 () Unit!11944)

(assert (=> b!391078 (= e!236858 lt!184390)))

(declare-fun lt!184392 () ListLongMap!5427)

(assert (=> b!391078 (= lt!184392 (getCurrentListMapNoExtraKeys!964 lt!184195 lt!184192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184399 () (_ BitVec 64))

(assert (=> b!391078 (= lt!184399 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184387 () (_ BitVec 64))

(assert (=> b!391078 (= lt!184387 (select (arr!11049 lt!184195) #b00000000000000000000000000000000))))

(declare-fun lt!184384 () Unit!11944)

(assert (=> b!391078 (= lt!184384 (addStillContains!279 lt!184392 lt!184399 zeroValue!472 lt!184387))))

(assert (=> b!391078 (contains!2449 (+!1049 lt!184392 (tuple2!6525 lt!184399 zeroValue!472)) lt!184387)))

(declare-fun lt!184386 () Unit!11944)

(assert (=> b!391078 (= lt!184386 lt!184384)))

(declare-fun lt!184397 () ListLongMap!5427)

(assert (=> b!391078 (= lt!184397 (getCurrentListMapNoExtraKeys!964 lt!184195 lt!184192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184396 () (_ BitVec 64))

(assert (=> b!391078 (= lt!184396 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184378 () (_ BitVec 64))

(assert (=> b!391078 (= lt!184378 (select (arr!11049 lt!184195) #b00000000000000000000000000000000))))

(declare-fun lt!184388 () Unit!11944)

(assert (=> b!391078 (= lt!184388 (addApplyDifferent!279 lt!184397 lt!184396 minValue!472 lt!184378))))

(assert (=> b!391078 (= (apply!303 (+!1049 lt!184397 (tuple2!6525 lt!184396 minValue!472)) lt!184378) (apply!303 lt!184397 lt!184378))))

(declare-fun lt!184382 () Unit!11944)

(assert (=> b!391078 (= lt!184382 lt!184388)))

(declare-fun lt!184395 () ListLongMap!5427)

(assert (=> b!391078 (= lt!184395 (getCurrentListMapNoExtraKeys!964 lt!184195 lt!184192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184379 () (_ BitVec 64))

(assert (=> b!391078 (= lt!184379 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184381 () (_ BitVec 64))

(assert (=> b!391078 (= lt!184381 (select (arr!11049 lt!184195) #b00000000000000000000000000000000))))

(declare-fun lt!184394 () Unit!11944)

(assert (=> b!391078 (= lt!184394 (addApplyDifferent!279 lt!184395 lt!184379 zeroValue!472 lt!184381))))

(assert (=> b!391078 (= (apply!303 (+!1049 lt!184395 (tuple2!6525 lt!184379 zeroValue!472)) lt!184381) (apply!303 lt!184395 lt!184381))))

(declare-fun lt!184385 () Unit!11944)

(assert (=> b!391078 (= lt!184385 lt!184394)))

(declare-fun lt!184383 () ListLongMap!5427)

(assert (=> b!391078 (= lt!184383 (getCurrentListMapNoExtraKeys!964 lt!184195 lt!184192 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!184389 () (_ BitVec 64))

(assert (=> b!391078 (= lt!184389 #b1000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!184393 () (_ BitVec 64))

(assert (=> b!391078 (= lt!184393 (select (arr!11049 lt!184195) #b00000000000000000000000000000000))))

(assert (=> b!391078 (= lt!184390 (addApplyDifferent!279 lt!184383 lt!184389 minValue!472 lt!184393))))

(assert (=> b!391078 (= (apply!303 (+!1049 lt!184383 (tuple2!6525 lt!184389 minValue!472)) lt!184393) (apply!303 lt!184383 lt!184393))))

(declare-fun bm!27602 () Bool)

(assert (=> bm!27602 (= call!27604 call!27599)))

(assert (= (and d!72873 c!54206) b!391074))

(assert (= (and d!72873 (not c!54206)) b!391060))

(assert (= (and b!391060 c!54209) b!391064))

(assert (= (and b!391060 (not c!54209)) b!391068))

(assert (= (and b!391068 c!54207) b!391073))

(assert (= (and b!391068 (not c!54207)) b!391072))

(assert (= (or b!391073 b!391072) bm!27597))

(assert (= (or b!391064 bm!27597) bm!27601))

(assert (= (or b!391064 b!391073) bm!27602))

(assert (= (or b!391074 bm!27601) bm!27596))

(assert (= (or b!391074 bm!27602) bm!27600))

(assert (= (and d!72873 res!223848) b!391066))

(assert (= (and d!72873 c!54210) b!391078))

(assert (= (and d!72873 (not c!54210)) b!391058))

(assert (= (and d!72873 res!223843) b!391065))

(assert (= (and b!391065 res!223844) b!391076))

(assert (= (and b!391065 (not res!223847)) b!391070))

(assert (= (and b!391070 res!223851) b!391067))

(assert (= (and b!391065 res!223846) b!391077))

(assert (= (and b!391077 c!54208) b!391059))

(assert (= (and b!391077 (not c!54208)) b!391063))

(assert (= (and b!391059 res!223850) b!391061))

(assert (= (or b!391059 b!391063) bm!27599))

(assert (= (and b!391077 res!223849) b!391071))

(assert (= (and b!391071 c!54205) b!391069))

(assert (= (and b!391071 (not c!54205)) b!391075))

(assert (= (and b!391069 res!223845) b!391062))

(assert (= (or b!391069 b!391075) bm!27598))

(declare-fun b_lambda!8663 () Bool)

(assert (=> (not b_lambda!8663) (not b!391067)))

(assert (=> b!391067 t!11526))

(declare-fun b_and!16275 () Bool)

(assert (= b_and!16273 (and (=> t!11526 result!5735) b_and!16275)))

(assert (=> b!391070 m!386807))

(assert (=> b!391070 m!386807))

(declare-fun m!386959 () Bool)

(assert (=> b!391070 m!386959))

(assert (=> b!391076 m!386807))

(assert (=> b!391076 m!386807))

(assert (=> b!391076 m!386811))

(assert (=> bm!27596 m!386669))

(declare-fun m!386961 () Bool)

(assert (=> b!391074 m!386961))

(assert (=> b!391066 m!386807))

(assert (=> b!391066 m!386807))

(assert (=> b!391066 m!386811))

(declare-fun m!386963 () Bool)

(assert (=> bm!27599 m!386963))

(declare-fun m!386965 () Bool)

(assert (=> b!391062 m!386965))

(assert (=> d!72873 m!386697))

(declare-fun m!386967 () Bool)

(assert (=> b!391078 m!386967))

(declare-fun m!386969 () Bool)

(assert (=> b!391078 m!386969))

(declare-fun m!386971 () Bool)

(assert (=> b!391078 m!386971))

(declare-fun m!386973 () Bool)

(assert (=> b!391078 m!386973))

(declare-fun m!386975 () Bool)

(assert (=> b!391078 m!386975))

(assert (=> b!391078 m!386807))

(declare-fun m!386977 () Bool)

(assert (=> b!391078 m!386977))

(assert (=> b!391078 m!386977))

(declare-fun m!386979 () Bool)

(assert (=> b!391078 m!386979))

(assert (=> b!391078 m!386967))

(declare-fun m!386981 () Bool)

(assert (=> b!391078 m!386981))

(declare-fun m!386983 () Bool)

(assert (=> b!391078 m!386983))

(assert (=> b!391078 m!386983))

(declare-fun m!386985 () Bool)

(assert (=> b!391078 m!386985))

(declare-fun m!386987 () Bool)

(assert (=> b!391078 m!386987))

(assert (=> b!391078 m!386973))

(declare-fun m!386989 () Bool)

(assert (=> b!391078 m!386989))

(declare-fun m!386991 () Bool)

(assert (=> b!391078 m!386991))

(assert (=> b!391078 m!386669))

(declare-fun m!386993 () Bool)

(assert (=> b!391078 m!386993))

(declare-fun m!386995 () Bool)

(assert (=> b!391078 m!386995))

(declare-fun m!386997 () Bool)

(assert (=> bm!27598 m!386997))

(assert (=> b!391067 m!386807))

(assert (=> b!391067 m!386935))

(assert (=> b!391067 m!386807))

(declare-fun m!386999 () Bool)

(assert (=> b!391067 m!386999))

(assert (=> b!391067 m!386935))

(assert (=> b!391067 m!386865))

(assert (=> b!391067 m!386937))

(assert (=> b!391067 m!386865))

(declare-fun m!387001 () Bool)

(assert (=> b!391061 m!387001))

(declare-fun m!387003 () Bool)

(assert (=> bm!27600 m!387003))

(assert (=> b!390785 d!72873))

(declare-fun d!72875 () Bool)

(declare-fun e!236864 () Bool)

(assert (=> d!72875 e!236864))

(declare-fun res!223853 () Bool)

(assert (=> d!72875 (=> (not res!223853) (not e!236864))))

(declare-fun lt!184403 () ListLongMap!5427)

(assert (=> d!72875 (= res!223853 (contains!2449 lt!184403 (_1!3273 (tuple2!6525 k0!778 v!373))))))

(declare-fun lt!184400 () List!6369)

(assert (=> d!72875 (= lt!184403 (ListLongMap!5428 lt!184400))))

(declare-fun lt!184401 () Unit!11944)

(declare-fun lt!184402 () Unit!11944)

(assert (=> d!72875 (= lt!184401 lt!184402)))

(assert (=> d!72875 (= (getValueByKey!359 lt!184400 (_1!3273 (tuple2!6525 k0!778 v!373))) (Some!364 (_2!3273 (tuple2!6525 k0!778 v!373))))))

(assert (=> d!72875 (= lt!184402 (lemmaContainsTupThenGetReturnValue!184 lt!184400 (_1!3273 (tuple2!6525 k0!778 v!373)) (_2!3273 (tuple2!6525 k0!778 v!373))))))

(assert (=> d!72875 (= lt!184400 (insertStrictlySorted!187 (toList!2729 lt!184190) (_1!3273 (tuple2!6525 k0!778 v!373)) (_2!3273 (tuple2!6525 k0!778 v!373))))))

(assert (=> d!72875 (= (+!1049 lt!184190 (tuple2!6525 k0!778 v!373)) lt!184403)))

(declare-fun b!391079 () Bool)

(declare-fun res!223852 () Bool)

(assert (=> b!391079 (=> (not res!223852) (not e!236864))))

(assert (=> b!391079 (= res!223852 (= (getValueByKey!359 (toList!2729 lt!184403) (_1!3273 (tuple2!6525 k0!778 v!373))) (Some!364 (_2!3273 (tuple2!6525 k0!778 v!373)))))))

(declare-fun b!391080 () Bool)

(assert (=> b!391080 (= e!236864 (contains!2450 (toList!2729 lt!184403) (tuple2!6525 k0!778 v!373)))))

(assert (= (and d!72875 res!223853) b!391079))

(assert (= (and b!391079 res!223852) b!391080))

(declare-fun m!387005 () Bool)

(assert (=> d!72875 m!387005))

(declare-fun m!387007 () Bool)

(assert (=> d!72875 m!387007))

(declare-fun m!387009 () Bool)

(assert (=> d!72875 m!387009))

(declare-fun m!387011 () Bool)

(assert (=> d!72875 m!387011))

(declare-fun m!387013 () Bool)

(assert (=> b!391079 m!387013))

(declare-fun m!387015 () Bool)

(assert (=> b!391080 m!387015))

(assert (=> b!390785 d!72875))

(declare-fun d!72877 () Bool)

(declare-fun e!236865 () Bool)

(assert (=> d!72877 e!236865))

(declare-fun res!223855 () Bool)

(assert (=> d!72877 (=> (not res!223855) (not e!236865))))

(declare-fun lt!184407 () ListLongMap!5427)

(assert (=> d!72877 (= res!223855 (contains!2449 lt!184407 (_1!3273 lt!184193)))))

(declare-fun lt!184404 () List!6369)

(assert (=> d!72877 (= lt!184407 (ListLongMap!5428 lt!184404))))

(declare-fun lt!184405 () Unit!11944)

(declare-fun lt!184406 () Unit!11944)

(assert (=> d!72877 (= lt!184405 lt!184406)))

(assert (=> d!72877 (= (getValueByKey!359 lt!184404 (_1!3273 lt!184193)) (Some!364 (_2!3273 lt!184193)))))

(assert (=> d!72877 (= lt!184406 (lemmaContainsTupThenGetReturnValue!184 lt!184404 (_1!3273 lt!184193) (_2!3273 lt!184193)))))

(assert (=> d!72877 (= lt!184404 (insertStrictlySorted!187 (toList!2729 lt!184190) (_1!3273 lt!184193) (_2!3273 lt!184193)))))

(assert (=> d!72877 (= (+!1049 lt!184190 lt!184193) lt!184407)))

(declare-fun b!391081 () Bool)

(declare-fun res!223854 () Bool)

(assert (=> b!391081 (=> (not res!223854) (not e!236865))))

(assert (=> b!391081 (= res!223854 (= (getValueByKey!359 (toList!2729 lt!184407) (_1!3273 lt!184193)) (Some!364 (_2!3273 lt!184193))))))

(declare-fun b!391082 () Bool)

(assert (=> b!391082 (= e!236865 (contains!2450 (toList!2729 lt!184407) lt!184193))))

(assert (= (and d!72877 res!223855) b!391081))

(assert (= (and b!391081 res!223854) b!391082))

(declare-fun m!387017 () Bool)

(assert (=> d!72877 m!387017))

(declare-fun m!387019 () Bool)

(assert (=> d!72877 m!387019))

(declare-fun m!387021 () Bool)

(assert (=> d!72877 m!387021))

(declare-fun m!387023 () Bool)

(assert (=> d!72877 m!387023))

(declare-fun m!387025 () Bool)

(assert (=> b!391081 m!387025))

(declare-fun m!387027 () Bool)

(assert (=> b!391082 m!387027))

(assert (=> b!390775 d!72877))

(declare-fun b!391090 () Bool)

(declare-fun e!236870 () Bool)

(assert (=> b!391090 (= e!236870 tp_is_empty!9643)))

(declare-fun condMapEmpty!16056 () Bool)

(declare-fun mapDefault!16056 () ValueCell!4478)

(assert (=> mapNonEmpty!16047 (= condMapEmpty!16056 (= mapRest!16047 ((as const (Array (_ BitVec 32) ValueCell!4478)) mapDefault!16056)))))

(declare-fun mapRes!16056 () Bool)

(assert (=> mapNonEmpty!16047 (= tp!31682 (and e!236870 mapRes!16056))))

(declare-fun mapIsEmpty!16056 () Bool)

(assert (=> mapIsEmpty!16056 mapRes!16056))

(declare-fun mapNonEmpty!16056 () Bool)

(declare-fun tp!31698 () Bool)

(declare-fun e!236871 () Bool)

(assert (=> mapNonEmpty!16056 (= mapRes!16056 (and tp!31698 e!236871))))

(declare-fun mapValue!16056 () ValueCell!4478)

(declare-fun mapKey!16056 () (_ BitVec 32))

(declare-fun mapRest!16056 () (Array (_ BitVec 32) ValueCell!4478))

(assert (=> mapNonEmpty!16056 (= mapRest!16047 (store mapRest!16056 mapKey!16056 mapValue!16056))))

(declare-fun b!391089 () Bool)

(assert (=> b!391089 (= e!236871 tp_is_empty!9643)))

(assert (= (and mapNonEmpty!16047 condMapEmpty!16056) mapIsEmpty!16056))

(assert (= (and mapNonEmpty!16047 (not condMapEmpty!16056)) mapNonEmpty!16056))

(assert (= (and mapNonEmpty!16056 ((_ is ValueCellFull!4478) mapValue!16056)) b!391089))

(assert (= (and mapNonEmpty!16047 ((_ is ValueCellFull!4478) mapDefault!16056)) b!391090))

(declare-fun m!387029 () Bool)

(assert (=> mapNonEmpty!16056 m!387029))

(declare-fun b_lambda!8665 () Bool)

(assert (= b_lambda!8655 (or (and start!37988 b_free!8971) b_lambda!8665)))

(declare-fun b_lambda!8667 () Bool)

(assert (= b_lambda!8659 (or (and start!37988 b_free!8971) b_lambda!8667)))

(declare-fun b_lambda!8669 () Bool)

(assert (= b_lambda!8657 (or (and start!37988 b_free!8971) b_lambda!8669)))

(declare-fun b_lambda!8671 () Bool)

(assert (= b_lambda!8663 (or (and start!37988 b_free!8971) b_lambda!8671)))

(declare-fun b_lambda!8673 () Bool)

(assert (= b_lambda!8661 (or (and start!37988 b_free!8971) b_lambda!8673)))

(declare-fun b_lambda!8675 () Bool)

(assert (= b_lambda!8653 (or (and start!37988 b_free!8971) b_lambda!8675)))

(check-sat (not b!391076) (not b_lambda!8675) (not b!391067) (not bm!27589) (not bm!27594) (not b_next!8971) b_and!16275 (not b!390901) (not bm!27596) (not b_lambda!8673) (not b!390918) (not b_lambda!8671) (not b!391074) (not b!391056) (not b!391025) (not b!391040) (not b!390964) (not bm!27567) (not b!390970) (not b!390967) (not d!72875) (not b!391020) (not b!391036) (not b!391034) (not b!390910) (not b!391066) (not d!72871) (not bm!27564) (not bm!27559) (not b!390902) (not b!391079) (not mapNonEmpty!16056) (not bm!27598) (not b!390969) (not b!390931) (not b_lambda!8667) (not b!390965) (not b!390897) (not b!391081) (not b!390930) (not bm!27563) (not b!391041) (not b!391061) (not b!390911) (not b!391070) (not d!72877) (not b!391080) (not bm!27584) (not b!390935) (not b!391078) (not b!391028) (not b!390962) (not b!391048) (not b!390904) (not b!390963) (not bm!27585) (not b!391062) (not bm!27582) (not d!72867) (not d!72873) (not b!391042) (not bm!27600) (not b!390899) (not b!391024) (not b!390971) (not b!390934) (not b!390917) (not b!390919) (not b_lambda!8665) (not b!391044) (not bm!27595) (not d!72865) (not bm!27586) (not b_lambda!8669) (not b!391019) (not b!391046) (not d!72857) (not b!391047) (not b!390896) tp_is_empty!9643 (not d!72847) (not bm!27599) (not b!391082) (not d!72869) (not b!391039) (not b!391032) (not bm!27560))
(check-sat b_and!16275 (not b_next!8971))
