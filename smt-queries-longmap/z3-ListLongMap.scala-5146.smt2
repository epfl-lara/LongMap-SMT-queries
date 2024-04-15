; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!69782 () Bool)

(assert start!69782)

(declare-fun b!811742 () Bool)

(declare-fun e!449492 () Bool)

(declare-datatypes ((array!44207 0))(
  ( (array!44208 (arr!21170 (Array (_ BitVec 32) (_ BitVec 64))) (size!21591 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!44207)

(assert (=> b!811742 (= e!449492 (bvsgt #b00000000000000000000000000000000 (size!21591 _keys!976)))))

(declare-fun b!811743 () Bool)

(declare-fun e!449494 () Bool)

(declare-fun tp_is_empty!13993 () Bool)

(assert (=> b!811743 (= e!449494 tp_is_empty!13993)))

(declare-fun b!811744 () Bool)

(declare-fun res!554833 () Bool)

(assert (=> b!811744 (=> (not res!554833) (not e!449492))))

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!44207 (_ BitVec 32)) Bool)

(assert (=> b!811744 (= res!554833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!554834 () Bool)

(assert (=> start!69782 (=> (not res!554834) (not e!449492))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!69782 (= res!554834 (validMask!0 mask!1312))))

(assert (=> start!69782 e!449492))

(declare-fun array_inv!17051 (array!44207) Bool)

(assert (=> start!69782 (array_inv!17051 _keys!976)))

(assert (=> start!69782 true))

(declare-datatypes ((V!23659 0))(
  ( (V!23660 (val!7044 Int)) )
))
(declare-datatypes ((ValueCell!6581 0))(
  ( (ValueCellFull!6581 (v!9464 V!23659)) (EmptyCell!6581) )
))
(declare-datatypes ((array!44209 0))(
  ( (array!44210 (arr!21171 (Array (_ BitVec 32) ValueCell!6581)) (size!21592 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!44209)

(declare-fun e!449491 () Bool)

(declare-fun array_inv!17052 (array!44209) Bool)

(assert (=> start!69782 (and (array_inv!17052 _values!788) e!449491)))

(declare-fun b!811745 () Bool)

(declare-fun e!449493 () Bool)

(assert (=> b!811745 (= e!449493 tp_is_empty!13993)))

(declare-fun mapIsEmpty!22552 () Bool)

(declare-fun mapRes!22552 () Bool)

(assert (=> mapIsEmpty!22552 mapRes!22552))

(declare-fun b!811746 () Bool)

(assert (=> b!811746 (= e!449491 (and e!449493 mapRes!22552))))

(declare-fun condMapEmpty!22552 () Bool)

(declare-fun mapDefault!22552 () ValueCell!6581)

(assert (=> b!811746 (= condMapEmpty!22552 (= (arr!21171 _values!788) ((as const (Array (_ BitVec 32) ValueCell!6581)) mapDefault!22552)))))

(declare-fun mapNonEmpty!22552 () Bool)

(declare-fun tp!43660 () Bool)

(assert (=> mapNonEmpty!22552 (= mapRes!22552 (and tp!43660 e!449494))))

(declare-fun mapRest!22552 () (Array (_ BitVec 32) ValueCell!6581))

(declare-fun mapKey!22552 () (_ BitVec 32))

(declare-fun mapValue!22552 () ValueCell!6581)

(assert (=> mapNonEmpty!22552 (= (arr!21171 _values!788) (store mapRest!22552 mapKey!22552 mapValue!22552))))

(declare-fun b!811747 () Bool)

(declare-fun res!554835 () Bool)

(assert (=> b!811747 (=> (not res!554835) (not e!449492))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!811747 (= res!554835 (and (= (size!21592 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!21591 _keys!976) (size!21592 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (= (and start!69782 res!554834) b!811747))

(assert (= (and b!811747 res!554835) b!811744))

(assert (= (and b!811744 res!554833) b!811742))

(assert (= (and b!811746 condMapEmpty!22552) mapIsEmpty!22552))

(assert (= (and b!811746 (not condMapEmpty!22552)) mapNonEmpty!22552))

(get-info :version)

(assert (= (and mapNonEmpty!22552 ((_ is ValueCellFull!6581) mapValue!22552)) b!811743))

(assert (= (and b!811746 ((_ is ValueCellFull!6581) mapDefault!22552)) b!811745))

(assert (= start!69782 b!811746))

(declare-fun m!753791 () Bool)

(assert (=> b!811744 m!753791))

(declare-fun m!753793 () Bool)

(assert (=> start!69782 m!753793))

(declare-fun m!753795 () Bool)

(assert (=> start!69782 m!753795))

(declare-fun m!753797 () Bool)

(assert (=> start!69782 m!753797))

(declare-fun m!753799 () Bool)

(assert (=> mapNonEmpty!22552 m!753799))

(check-sat (not start!69782) (not b!811744) (not mapNonEmpty!22552) tp_is_empty!13993)
(check-sat)
(get-model)

(declare-fun d!104095 () Bool)

(assert (=> d!104095 (= (validMask!0 mask!1312) (and (or (= mask!1312 #b00000000000000000000000000000111) (= mask!1312 #b00000000000000000000000000001111) (= mask!1312 #b00000000000000000000000000011111) (= mask!1312 #b00000000000000000000000000111111) (= mask!1312 #b00000000000000000000000001111111) (= mask!1312 #b00000000000000000000000011111111) (= mask!1312 #b00000000000000000000000111111111) (= mask!1312 #b00000000000000000000001111111111) (= mask!1312 #b00000000000000000000011111111111) (= mask!1312 #b00000000000000000000111111111111) (= mask!1312 #b00000000000000000001111111111111) (= mask!1312 #b00000000000000000011111111111111) (= mask!1312 #b00000000000000000111111111111111) (= mask!1312 #b00000000000000001111111111111111) (= mask!1312 #b00000000000000011111111111111111) (= mask!1312 #b00000000000000111111111111111111) (= mask!1312 #b00000000000001111111111111111111) (= mask!1312 #b00000000000011111111111111111111) (= mask!1312 #b00000000000111111111111111111111) (= mask!1312 #b00000000001111111111111111111111) (= mask!1312 #b00000000011111111111111111111111) (= mask!1312 #b00000000111111111111111111111111) (= mask!1312 #b00000001111111111111111111111111) (= mask!1312 #b00000011111111111111111111111111) (= mask!1312 #b00000111111111111111111111111111) (= mask!1312 #b00001111111111111111111111111111) (= mask!1312 #b00011111111111111111111111111111) (= mask!1312 #b00111111111111111111111111111111)) (bvsle mask!1312 #b00111111111111111111111111111111)))))

(assert (=> start!69782 d!104095))

(declare-fun d!104097 () Bool)

(assert (=> d!104097 (= (array_inv!17051 _keys!976) (bvsge (size!21591 _keys!976) #b00000000000000000000000000000000))))

(assert (=> start!69782 d!104097))

(declare-fun d!104099 () Bool)

(assert (=> d!104099 (= (array_inv!17052 _values!788) (bvsge (size!21592 _values!788) #b00000000000000000000000000000000))))

(assert (=> start!69782 d!104099))

(declare-fun b!811792 () Bool)

(declare-fun e!449532 () Bool)

(declare-fun call!35449 () Bool)

(assert (=> b!811792 (= e!449532 call!35449)))

(declare-fun bm!35446 () Bool)

(assert (=> bm!35446 (= call!35449 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!976 mask!1312))))

(declare-fun d!104101 () Bool)

(declare-fun res!554858 () Bool)

(declare-fun e!449531 () Bool)

(assert (=> d!104101 (=> res!554858 e!449531)))

(assert (=> d!104101 (= res!554858 (bvsge #b00000000000000000000000000000000 (size!21591 _keys!976)))))

(assert (=> d!104101 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312) e!449531)))

(declare-fun b!811793 () Bool)

(declare-fun e!449533 () Bool)

(assert (=> b!811793 (= e!449532 e!449533)))

(declare-fun lt!363845 () (_ BitVec 64))

(assert (=> b!811793 (= lt!363845 (select (arr!21170 _keys!976) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!27660 0))(
  ( (Unit!27661) )
))
(declare-fun lt!363843 () Unit!27660)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!44207 (_ BitVec 64) (_ BitVec 32)) Unit!27660)

(assert (=> b!811793 (= lt!363843 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!976 lt!363845 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!44207 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!811793 (arrayContainsKey!0 _keys!976 lt!363845 #b00000000000000000000000000000000)))

(declare-fun lt!363844 () Unit!27660)

(assert (=> b!811793 (= lt!363844 lt!363843)))

(declare-fun res!554859 () Bool)

(declare-datatypes ((SeekEntryResult!8710 0))(
  ( (MissingZero!8710 (index!37211 (_ BitVec 32))) (Found!8710 (index!37212 (_ BitVec 32))) (Intermediate!8710 (undefined!9522 Bool) (index!37213 (_ BitVec 32)) (x!68160 (_ BitVec 32))) (Undefined!8710) (MissingVacant!8710 (index!37214 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!44207 (_ BitVec 32)) SeekEntryResult!8710)

(assert (=> b!811793 (= res!554859 (= (seekEntryOrOpen!0 (select (arr!21170 _keys!976) #b00000000000000000000000000000000) _keys!976 mask!1312) (Found!8710 #b00000000000000000000000000000000)))))

(assert (=> b!811793 (=> (not res!554859) (not e!449533))))

(declare-fun b!811794 () Bool)

(assert (=> b!811794 (= e!449531 e!449532)))

(declare-fun c!88821 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!811794 (= c!88821 (validKeyInArray!0 (select (arr!21170 _keys!976) #b00000000000000000000000000000000)))))

(declare-fun b!811795 () Bool)

(assert (=> b!811795 (= e!449533 call!35449)))

(assert (= (and d!104101 (not res!554858)) b!811794))

(assert (= (and b!811794 c!88821) b!811793))

(assert (= (and b!811794 (not c!88821)) b!811792))

(assert (= (and b!811793 res!554859) b!811795))

(assert (= (or b!811795 b!811792) bm!35446))

(declare-fun m!753821 () Bool)

(assert (=> bm!35446 m!753821))

(declare-fun m!753823 () Bool)

(assert (=> b!811793 m!753823))

(declare-fun m!753825 () Bool)

(assert (=> b!811793 m!753825))

(declare-fun m!753827 () Bool)

(assert (=> b!811793 m!753827))

(assert (=> b!811793 m!753823))

(declare-fun m!753829 () Bool)

(assert (=> b!811793 m!753829))

(assert (=> b!811794 m!753823))

(assert (=> b!811794 m!753823))

(declare-fun m!753831 () Bool)

(assert (=> b!811794 m!753831))

(assert (=> b!811744 d!104101))

(declare-fun b!811802 () Bool)

(declare-fun e!449538 () Bool)

(assert (=> b!811802 (= e!449538 tp_is_empty!13993)))

(declare-fun b!811803 () Bool)

(declare-fun e!449539 () Bool)

(assert (=> b!811803 (= e!449539 tp_is_empty!13993)))

(declare-fun condMapEmpty!22561 () Bool)

(declare-fun mapDefault!22561 () ValueCell!6581)

(assert (=> mapNonEmpty!22552 (= condMapEmpty!22561 (= mapRest!22552 ((as const (Array (_ BitVec 32) ValueCell!6581)) mapDefault!22561)))))

(declare-fun mapRes!22561 () Bool)

(assert (=> mapNonEmpty!22552 (= tp!43660 (and e!449539 mapRes!22561))))

(declare-fun mapIsEmpty!22561 () Bool)

(assert (=> mapIsEmpty!22561 mapRes!22561))

(declare-fun mapNonEmpty!22561 () Bool)

(declare-fun tp!43669 () Bool)

(assert (=> mapNonEmpty!22561 (= mapRes!22561 (and tp!43669 e!449538))))

(declare-fun mapKey!22561 () (_ BitVec 32))

(declare-fun mapRest!22561 () (Array (_ BitVec 32) ValueCell!6581))

(declare-fun mapValue!22561 () ValueCell!6581)

(assert (=> mapNonEmpty!22561 (= mapRest!22552 (store mapRest!22561 mapKey!22561 mapValue!22561))))

(assert (= (and mapNonEmpty!22552 condMapEmpty!22561) mapIsEmpty!22561))

(assert (= (and mapNonEmpty!22552 (not condMapEmpty!22561)) mapNonEmpty!22561))

(assert (= (and mapNonEmpty!22561 ((_ is ValueCellFull!6581) mapValue!22561)) b!811802))

(assert (= (and mapNonEmpty!22552 ((_ is ValueCellFull!6581) mapDefault!22561)) b!811803))

(declare-fun m!753833 () Bool)

(assert (=> mapNonEmpty!22561 m!753833))

(check-sat (not b!811794) (not b!811793) (not mapNonEmpty!22561) tp_is_empty!13993 (not bm!35446))
(check-sat)
