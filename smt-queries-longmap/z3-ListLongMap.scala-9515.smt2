; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112930 () Bool)

(assert start!112930)

(declare-fun b!1338777 () Bool)

(declare-fun res!888212 () Bool)

(declare-fun e!762408 () Bool)

(assert (=> b!1338777 (=> (not res!888212) (not e!762408))))

(declare-datatypes ((array!90813 0))(
  ( (array!90814 (arr!43865 (Array (_ BitVec 32) (_ BitVec 64))) (size!44417 (_ BitVec 32))) )
))
(declare-fun _keys!1571 () array!90813)

(assert (=> b!1338777 (= res!888212 (and (bvsle #b00000000000000000000000000000000 (size!44417 _keys!1571)) (bvslt (size!44417 _keys!1571) #b01111111111111111111111111111111)))))

(declare-fun b!1338778 () Bool)

(declare-fun e!762409 () Bool)

(declare-fun tp_is_empty!37003 () Bool)

(assert (=> b!1338778 (= e!762409 tp_is_empty!37003)))

(declare-fun b!1338779 () Bool)

(declare-fun e!762407 () Bool)

(declare-fun mapRes!57205 () Bool)

(assert (=> b!1338779 (= e!762407 (and e!762409 mapRes!57205))))

(declare-fun condMapEmpty!57205 () Bool)

(declare-datatypes ((V!54441 0))(
  ( (V!54442 (val!18576 Int)) )
))
(declare-datatypes ((ValueCell!17603 0))(
  ( (ValueCellFull!17603 (v!21222 V!54441)) (EmptyCell!17603) )
))
(declare-datatypes ((array!90815 0))(
  ( (array!90816 (arr!43866 (Array (_ BitVec 32) ValueCell!17603)) (size!44418 (_ BitVec 32))) )
))
(declare-fun _values!1303 () array!90815)

(declare-fun mapDefault!57205 () ValueCell!17603)

(assert (=> b!1338779 (= condMapEmpty!57205 (= (arr!43866 _values!1303) ((as const (Array (_ BitVec 32) ValueCell!17603)) mapDefault!57205)))))

(declare-fun b!1338780 () Bool)

(declare-fun res!888215 () Bool)

(assert (=> b!1338780 (=> (not res!888215) (not e!762408))))

(declare-fun mask!1977 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90813 (_ BitVec 32)) Bool)

(assert (=> b!1338780 (= res!888215 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977))))

(declare-fun mapIsEmpty!57205 () Bool)

(assert (=> mapIsEmpty!57205 mapRes!57205))

(declare-fun mapNonEmpty!57205 () Bool)

(declare-fun tp!108905 () Bool)

(declare-fun e!762411 () Bool)

(assert (=> mapNonEmpty!57205 (= mapRes!57205 (and tp!108905 e!762411))))

(declare-fun mapValue!57205 () ValueCell!17603)

(declare-fun mapKey!57205 () (_ BitVec 32))

(declare-fun mapRest!57205 () (Array (_ BitVec 32) ValueCell!17603))

(assert (=> mapNonEmpty!57205 (= (arr!43866 _values!1303) (store mapRest!57205 mapKey!57205 mapValue!57205))))

(declare-fun b!1338781 () Bool)

(declare-fun res!888214 () Bool)

(assert (=> b!1338781 (=> (not res!888214) (not e!762408))))

(declare-fun extraKeys!1224 () (_ BitVec 32))

(assert (=> b!1338781 (= res!888214 (and (= (size!44418 _values!1303) (bvadd #b00000000000000000000000000000001 mask!1977)) (= (size!44417 _keys!1571) (size!44418 _values!1303)) (bvsge mask!1977 #b00000000000000000000000000000000) (bvsge extraKeys!1224 #b00000000000000000000000000000000) (bvsle extraKeys!1224 #b00000000000000000000000000000011)))))

(declare-fun res!888213 () Bool)

(assert (=> start!112930 (=> (not res!888213) (not e!762408))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112930 (= res!888213 (validMask!0 mask!1977))))

(assert (=> start!112930 e!762408))

(assert (=> start!112930 true))

(declare-fun array_inv!33271 (array!90815) Bool)

(assert (=> start!112930 (and (array_inv!33271 _values!1303) e!762407)))

(declare-fun array_inv!33272 (array!90813) Bool)

(assert (=> start!112930 (array_inv!33272 _keys!1571)))

(declare-fun b!1338782 () Bool)

(assert (=> b!1338782 (= e!762411 tp_is_empty!37003)))

(declare-fun b!1338783 () Bool)

(declare-datatypes ((List!31136 0))(
  ( (Nil!31133) (Cons!31132 (h!32341 (_ BitVec 64)) (t!45460 List!31136)) )
))
(declare-fun noDuplicate!2092 (List!31136) Bool)

(assert (=> b!1338783 (= e!762408 (not (noDuplicate!2092 Nil!31133)))))

(assert (= (and start!112930 res!888213) b!1338781))

(assert (= (and b!1338781 res!888214) b!1338780))

(assert (= (and b!1338780 res!888215) b!1338777))

(assert (= (and b!1338777 res!888212) b!1338783))

(assert (= (and b!1338779 condMapEmpty!57205) mapIsEmpty!57205))

(assert (= (and b!1338779 (not condMapEmpty!57205)) mapNonEmpty!57205))

(get-info :version)

(assert (= (and mapNonEmpty!57205 ((_ is ValueCellFull!17603) mapValue!57205)) b!1338782))

(assert (= (and b!1338779 ((_ is ValueCellFull!17603) mapDefault!57205)) b!1338778))

(assert (= start!112930 b!1338779))

(declare-fun m!1226595 () Bool)

(assert (=> b!1338780 m!1226595))

(declare-fun m!1226597 () Bool)

(assert (=> mapNonEmpty!57205 m!1226597))

(declare-fun m!1226599 () Bool)

(assert (=> start!112930 m!1226599))

(declare-fun m!1226601 () Bool)

(assert (=> start!112930 m!1226601))

(declare-fun m!1226603 () Bool)

(assert (=> start!112930 m!1226603))

(declare-fun m!1226605 () Bool)

(assert (=> b!1338783 m!1226605))

(check-sat (not mapNonEmpty!57205) (not b!1338783) (not b!1338780) tp_is_empty!37003 (not start!112930))
(check-sat)
(get-model)

(declare-fun d!143985 () Bool)

(declare-fun res!888245 () Bool)

(declare-fun e!762450 () Bool)

(assert (=> d!143985 (=> res!888245 e!762450)))

(assert (=> d!143985 (= res!888245 (bvsge #b00000000000000000000000000000000 (size!44417 _keys!1571)))))

(assert (=> d!143985 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1571 mask!1977) e!762450)))

(declare-fun b!1338834 () Bool)

(declare-fun e!762449 () Bool)

(assert (=> b!1338834 (= e!762450 e!762449)))

(declare-fun c!126277 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1338834 (= c!126277 (validKeyInArray!0 (select (arr!43865 _keys!1571) #b00000000000000000000000000000000)))))

(declare-fun bm!65012 () Bool)

(declare-fun call!65015 () Bool)

(assert (=> bm!65012 (= call!65015 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1571 mask!1977))))

(declare-fun b!1338835 () Bool)

(assert (=> b!1338835 (= e!762449 call!65015)))

(declare-fun b!1338836 () Bool)

(declare-fun e!762448 () Bool)

(assert (=> b!1338836 (= e!762449 e!762448)))

(declare-fun lt!593624 () (_ BitVec 64))

(assert (=> b!1338836 (= lt!593624 (select (arr!43865 _keys!1571) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!43792 0))(
  ( (Unit!43793) )
))
(declare-fun lt!593623 () Unit!43792)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!90813 (_ BitVec 64) (_ BitVec 32)) Unit!43792)

(assert (=> b!1338836 (= lt!593623 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1571 lt!593624 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!90813 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1338836 (arrayContainsKey!0 _keys!1571 lt!593624 #b00000000000000000000000000000000)))

(declare-fun lt!593622 () Unit!43792)

(assert (=> b!1338836 (= lt!593622 lt!593623)))

(declare-fun res!888244 () Bool)

(declare-datatypes ((SeekEntryResult!10053 0))(
  ( (MissingZero!10053 (index!42583 (_ BitVec 32))) (Found!10053 (index!42584 (_ BitVec 32))) (Intermediate!10053 (undefined!10865 Bool) (index!42585 (_ BitVec 32)) (x!119597 (_ BitVec 32))) (Undefined!10053) (MissingVacant!10053 (index!42586 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!90813 (_ BitVec 32)) SeekEntryResult!10053)

(assert (=> b!1338836 (= res!888244 (= (seekEntryOrOpen!0 (select (arr!43865 _keys!1571) #b00000000000000000000000000000000) _keys!1571 mask!1977) (Found!10053 #b00000000000000000000000000000000)))))

(assert (=> b!1338836 (=> (not res!888244) (not e!762448))))

(declare-fun b!1338837 () Bool)

(assert (=> b!1338837 (= e!762448 call!65015)))

(assert (= (and d!143985 (not res!888245)) b!1338834))

(assert (= (and b!1338834 c!126277) b!1338836))

(assert (= (and b!1338834 (not c!126277)) b!1338835))

(assert (= (and b!1338836 res!888244) b!1338837))

(assert (= (or b!1338837 b!1338835) bm!65012))

(declare-fun m!1226631 () Bool)

(assert (=> b!1338834 m!1226631))

(assert (=> b!1338834 m!1226631))

(declare-fun m!1226633 () Bool)

(assert (=> b!1338834 m!1226633))

(declare-fun m!1226635 () Bool)

(assert (=> bm!65012 m!1226635))

(assert (=> b!1338836 m!1226631))

(declare-fun m!1226637 () Bool)

(assert (=> b!1338836 m!1226637))

(declare-fun m!1226639 () Bool)

(assert (=> b!1338836 m!1226639))

(assert (=> b!1338836 m!1226631))

(declare-fun m!1226641 () Bool)

(assert (=> b!1338836 m!1226641))

(assert (=> b!1338780 d!143985))

(declare-fun d!143987 () Bool)

(declare-fun res!888250 () Bool)

(declare-fun e!762455 () Bool)

(assert (=> d!143987 (=> res!888250 e!762455)))

(assert (=> d!143987 (= res!888250 ((_ is Nil!31133) Nil!31133))))

(assert (=> d!143987 (= (noDuplicate!2092 Nil!31133) e!762455)))

(declare-fun b!1338842 () Bool)

(declare-fun e!762456 () Bool)

(assert (=> b!1338842 (= e!762455 e!762456)))

(declare-fun res!888251 () Bool)

(assert (=> b!1338842 (=> (not res!888251) (not e!762456))))

(declare-fun contains!8950 (List!31136 (_ BitVec 64)) Bool)

(assert (=> b!1338842 (= res!888251 (not (contains!8950 (t!45460 Nil!31133) (h!32341 Nil!31133))))))

(declare-fun b!1338843 () Bool)

(assert (=> b!1338843 (= e!762456 (noDuplicate!2092 (t!45460 Nil!31133)))))

(assert (= (and d!143987 (not res!888250)) b!1338842))

(assert (= (and b!1338842 res!888251) b!1338843))

(declare-fun m!1226643 () Bool)

(assert (=> b!1338842 m!1226643))

(declare-fun m!1226645 () Bool)

(assert (=> b!1338843 m!1226645))

(assert (=> b!1338783 d!143987))

(declare-fun d!143989 () Bool)

(assert (=> d!143989 (= (validMask!0 mask!1977) (and (or (= mask!1977 #b00000000000000000000000000000111) (= mask!1977 #b00000000000000000000000000001111) (= mask!1977 #b00000000000000000000000000011111) (= mask!1977 #b00000000000000000000000000111111) (= mask!1977 #b00000000000000000000000001111111) (= mask!1977 #b00000000000000000000000011111111) (= mask!1977 #b00000000000000000000000111111111) (= mask!1977 #b00000000000000000000001111111111) (= mask!1977 #b00000000000000000000011111111111) (= mask!1977 #b00000000000000000000111111111111) (= mask!1977 #b00000000000000000001111111111111) (= mask!1977 #b00000000000000000011111111111111) (= mask!1977 #b00000000000000000111111111111111) (= mask!1977 #b00000000000000001111111111111111) (= mask!1977 #b00000000000000011111111111111111) (= mask!1977 #b00000000000000111111111111111111) (= mask!1977 #b00000000000001111111111111111111) (= mask!1977 #b00000000000011111111111111111111) (= mask!1977 #b00000000000111111111111111111111) (= mask!1977 #b00000000001111111111111111111111) (= mask!1977 #b00000000011111111111111111111111) (= mask!1977 #b00000000111111111111111111111111) (= mask!1977 #b00000001111111111111111111111111) (= mask!1977 #b00000011111111111111111111111111) (= mask!1977 #b00000111111111111111111111111111) (= mask!1977 #b00001111111111111111111111111111) (= mask!1977 #b00011111111111111111111111111111) (= mask!1977 #b00111111111111111111111111111111)) (bvsle mask!1977 #b00111111111111111111111111111111)))))

(assert (=> start!112930 d!143989))

(declare-fun d!143991 () Bool)

(assert (=> d!143991 (= (array_inv!33271 _values!1303) (bvsge (size!44418 _values!1303) #b00000000000000000000000000000000))))

(assert (=> start!112930 d!143991))

(declare-fun d!143993 () Bool)

(assert (=> d!143993 (= (array_inv!33272 _keys!1571) (bvsge (size!44417 _keys!1571) #b00000000000000000000000000000000))))

(assert (=> start!112930 d!143993))

(declare-fun b!1338850 () Bool)

(declare-fun e!762462 () Bool)

(assert (=> b!1338850 (= e!762462 tp_is_empty!37003)))

(declare-fun mapNonEmpty!57214 () Bool)

(declare-fun mapRes!57214 () Bool)

(declare-fun tp!108914 () Bool)

(assert (=> mapNonEmpty!57214 (= mapRes!57214 (and tp!108914 e!762462))))

(declare-fun mapValue!57214 () ValueCell!17603)

(declare-fun mapKey!57214 () (_ BitVec 32))

(declare-fun mapRest!57214 () (Array (_ BitVec 32) ValueCell!17603))

(assert (=> mapNonEmpty!57214 (= mapRest!57205 (store mapRest!57214 mapKey!57214 mapValue!57214))))

(declare-fun b!1338851 () Bool)

(declare-fun e!762461 () Bool)

(assert (=> b!1338851 (= e!762461 tp_is_empty!37003)))

(declare-fun condMapEmpty!57214 () Bool)

(declare-fun mapDefault!57214 () ValueCell!17603)

(assert (=> mapNonEmpty!57205 (= condMapEmpty!57214 (= mapRest!57205 ((as const (Array (_ BitVec 32) ValueCell!17603)) mapDefault!57214)))))

(assert (=> mapNonEmpty!57205 (= tp!108905 (and e!762461 mapRes!57214))))

(declare-fun mapIsEmpty!57214 () Bool)

(assert (=> mapIsEmpty!57214 mapRes!57214))

(assert (= (and mapNonEmpty!57205 condMapEmpty!57214) mapIsEmpty!57214))

(assert (= (and mapNonEmpty!57205 (not condMapEmpty!57214)) mapNonEmpty!57214))

(assert (= (and mapNonEmpty!57214 ((_ is ValueCellFull!17603) mapValue!57214)) b!1338850))

(assert (= (and mapNonEmpty!57205 ((_ is ValueCellFull!17603) mapDefault!57214)) b!1338851))

(declare-fun m!1226647 () Bool)

(assert (=> mapNonEmpty!57214 m!1226647))

(check-sat (not b!1338842) (not b!1338834) (not bm!65012) (not b!1338836) (not mapNonEmpty!57214) tp_is_empty!37003 (not b!1338843))
(check-sat)
