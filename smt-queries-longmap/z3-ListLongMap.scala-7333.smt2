; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93674 () Bool)

(assert start!93674)

(declare-fun b!1059638 () Bool)

(declare-fun res!707830 () Bool)

(declare-fun e!603178 () Bool)

(assert (=> b!1059638 (=> (not res!707830) (not e!603178))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-datatypes ((V!38449 0))(
  ( (V!38450 (val!12543 Int)) )
))
(declare-datatypes ((ValueCell!11789 0))(
  ( (ValueCellFull!11789 (v!15152 V!38449)) (EmptyCell!11789) )
))
(declare-datatypes ((array!66932 0))(
  ( (array!66933 (arr!32176 (Array (_ BitVec 32) ValueCell!11789)) (size!32714 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66932)

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(declare-datatypes ((array!66934 0))(
  ( (array!66935 (arr!32177 (Array (_ BitVec 32) (_ BitVec 64))) (size!32715 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66934)

(assert (=> b!1059638 (= res!707830 (and (= (size!32714 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32715 _keys!1163) (size!32714 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!39142 () Bool)

(declare-fun mapRes!39142 () Bool)

(assert (=> mapIsEmpty!39142 mapRes!39142))

(declare-fun res!707832 () Bool)

(assert (=> start!93674 (=> (not res!707832) (not e!603178))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93674 (= res!707832 (validMask!0 mask!1515))))

(assert (=> start!93674 e!603178))

(assert (=> start!93674 true))

(declare-fun e!603179 () Bool)

(declare-fun array_inv!24946 (array!66932) Bool)

(assert (=> start!93674 (and (array_inv!24946 _values!955) e!603179)))

(declare-fun array_inv!24947 (array!66934) Bool)

(assert (=> start!93674 (array_inv!24947 _keys!1163)))

(declare-fun mapNonEmpty!39142 () Bool)

(declare-fun tp!74948 () Bool)

(declare-fun e!603180 () Bool)

(assert (=> mapNonEmpty!39142 (= mapRes!39142 (and tp!74948 e!603180))))

(declare-fun mapRest!39142 () (Array (_ BitVec 32) ValueCell!11789))

(declare-fun mapValue!39142 () ValueCell!11789)

(declare-fun mapKey!39142 () (_ BitVec 32))

(assert (=> mapNonEmpty!39142 (= (arr!32176 _values!955) (store mapRest!39142 mapKey!39142 mapValue!39142))))

(declare-fun b!1059639 () Bool)

(declare-fun e!603176 () Bool)

(declare-fun tp_is_empty!24985 () Bool)

(assert (=> b!1059639 (= e!603176 tp_is_empty!24985)))

(declare-fun b!1059640 () Bool)

(declare-fun res!707833 () Bool)

(assert (=> b!1059640 (=> (not res!707833) (not e!603178))))

(declare-datatypes ((List!22470 0))(
  ( (Nil!22467) (Cons!22466 (h!23675 (_ BitVec 64)) (t!31768 List!22470)) )
))
(declare-fun arrayNoDuplicates!0 (array!66934 (_ BitVec 32) List!22470) Bool)

(assert (=> b!1059640 (= res!707833 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22467))))

(declare-fun b!1059641 () Bool)

(declare-fun res!707831 () Bool)

(assert (=> b!1059641 (=> (not res!707831) (not e!603178))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!66934 (_ BitVec 32)) Bool)

(assert (=> b!1059641 (= res!707831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515))))

(declare-fun b!1059642 () Bool)

(assert (=> b!1059642 (= e!603178 (bvsgt #b00000000000000000000000000000000 (size!32715 _keys!1163)))))

(declare-fun b!1059643 () Bool)

(assert (=> b!1059643 (= e!603180 tp_is_empty!24985)))

(declare-fun b!1059644 () Bool)

(assert (=> b!1059644 (= e!603179 (and e!603176 mapRes!39142))))

(declare-fun condMapEmpty!39142 () Bool)

(declare-fun mapDefault!39142 () ValueCell!11789)

(assert (=> b!1059644 (= condMapEmpty!39142 (= (arr!32176 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11789)) mapDefault!39142)))))

(assert (= (and start!93674 res!707832) b!1059638))

(assert (= (and b!1059638 res!707830) b!1059641))

(assert (= (and b!1059641 res!707831) b!1059640))

(assert (= (and b!1059640 res!707833) b!1059642))

(assert (= (and b!1059644 condMapEmpty!39142) mapIsEmpty!39142))

(assert (= (and b!1059644 (not condMapEmpty!39142)) mapNonEmpty!39142))

(get-info :version)

(assert (= (and mapNonEmpty!39142 ((_ is ValueCellFull!11789) mapValue!39142)) b!1059643))

(assert (= (and b!1059644 ((_ is ValueCellFull!11789) mapDefault!39142)) b!1059639))

(assert (= start!93674 b!1059644))

(declare-fun m!978473 () Bool)

(assert (=> start!93674 m!978473))

(declare-fun m!978475 () Bool)

(assert (=> start!93674 m!978475))

(declare-fun m!978477 () Bool)

(assert (=> start!93674 m!978477))

(declare-fun m!978479 () Bool)

(assert (=> mapNonEmpty!39142 m!978479))

(declare-fun m!978481 () Bool)

(assert (=> b!1059640 m!978481))

(declare-fun m!978483 () Bool)

(assert (=> b!1059641 m!978483))

(check-sat (not start!93674) (not b!1059640) tp_is_empty!24985 (not b!1059641) (not mapNonEmpty!39142))
(check-sat)
(get-model)

(declare-fun d!128591 () Bool)

(assert (=> d!128591 (= (validMask!0 mask!1515) (and (or (= mask!1515 #b00000000000000000000000000000111) (= mask!1515 #b00000000000000000000000000001111) (= mask!1515 #b00000000000000000000000000011111) (= mask!1515 #b00000000000000000000000000111111) (= mask!1515 #b00000000000000000000000001111111) (= mask!1515 #b00000000000000000000000011111111) (= mask!1515 #b00000000000000000000000111111111) (= mask!1515 #b00000000000000000000001111111111) (= mask!1515 #b00000000000000000000011111111111) (= mask!1515 #b00000000000000000000111111111111) (= mask!1515 #b00000000000000000001111111111111) (= mask!1515 #b00000000000000000011111111111111) (= mask!1515 #b00000000000000000111111111111111) (= mask!1515 #b00000000000000001111111111111111) (= mask!1515 #b00000000000000011111111111111111) (= mask!1515 #b00000000000000111111111111111111) (= mask!1515 #b00000000000001111111111111111111) (= mask!1515 #b00000000000011111111111111111111) (= mask!1515 #b00000000000111111111111111111111) (= mask!1515 #b00000000001111111111111111111111) (= mask!1515 #b00000000011111111111111111111111) (= mask!1515 #b00000000111111111111111111111111) (= mask!1515 #b00000001111111111111111111111111) (= mask!1515 #b00000011111111111111111111111111) (= mask!1515 #b00000111111111111111111111111111) (= mask!1515 #b00001111111111111111111111111111) (= mask!1515 #b00011111111111111111111111111111) (= mask!1515 #b00111111111111111111111111111111)) (bvsle mask!1515 #b00111111111111111111111111111111)))))

(assert (=> start!93674 d!128591))

(declare-fun d!128593 () Bool)

(assert (=> d!128593 (= (array_inv!24946 _values!955) (bvsge (size!32714 _values!955) #b00000000000000000000000000000000))))

(assert (=> start!93674 d!128593))

(declare-fun d!128595 () Bool)

(assert (=> d!128595 (= (array_inv!24947 _keys!1163) (bvsge (size!32715 _keys!1163) #b00000000000000000000000000000000))))

(assert (=> start!93674 d!128595))

(declare-fun b!1059695 () Bool)

(declare-fun e!603219 () Bool)

(declare-fun call!44864 () Bool)

(assert (=> b!1059695 (= e!603219 call!44864)))

(declare-fun d!128597 () Bool)

(declare-fun res!707863 () Bool)

(declare-fun e!603218 () Bool)

(assert (=> d!128597 (=> res!707863 e!603218)))

(assert (=> d!128597 (= res!707863 (bvsge #b00000000000000000000000000000000 (size!32715 _keys!1163)))))

(assert (=> d!128597 (= (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1163 mask!1515) e!603218)))

(declare-fun b!1059696 () Bool)

(declare-fun e!603217 () Bool)

(assert (=> b!1059696 (= e!603217 e!603219)))

(declare-fun lt!466988 () (_ BitVec 64))

(assert (=> b!1059696 (= lt!466988 (select (arr!32177 _keys!1163) #b00000000000000000000000000000000))))

(declare-datatypes ((Unit!34597 0))(
  ( (Unit!34598) )
))
(declare-fun lt!466986 () Unit!34597)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!66934 (_ BitVec 64) (_ BitVec 32)) Unit!34597)

(assert (=> b!1059696 (= lt!466986 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1163 lt!466988 #b00000000000000000000000000000000))))

(declare-fun arrayContainsKey!0 (array!66934 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1059696 (arrayContainsKey!0 _keys!1163 lt!466988 #b00000000000000000000000000000000)))

(declare-fun lt!466987 () Unit!34597)

(assert (=> b!1059696 (= lt!466987 lt!466986)))

(declare-fun res!707862 () Bool)

(declare-datatypes ((SeekEntryResult!9868 0))(
  ( (MissingZero!9868 (index!41843 (_ BitVec 32))) (Found!9868 (index!41844 (_ BitVec 32))) (Intermediate!9868 (undefined!10680 Bool) (index!41845 (_ BitVec 32)) (x!94726 (_ BitVec 32))) (Undefined!9868) (MissingVacant!9868 (index!41846 (_ BitVec 32))) )
))
(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!66934 (_ BitVec 32)) SeekEntryResult!9868)

(assert (=> b!1059696 (= res!707862 (= (seekEntryOrOpen!0 (select (arr!32177 _keys!1163) #b00000000000000000000000000000000) _keys!1163 mask!1515) (Found!9868 #b00000000000000000000000000000000)))))

(assert (=> b!1059696 (=> (not res!707862) (not e!603219))))

(declare-fun b!1059697 () Bool)

(assert (=> b!1059697 (= e!603217 call!44864)))

(declare-fun bm!44861 () Bool)

(assert (=> bm!44861 (= call!44864 (arrayForallSeekEntryOrOpenFound!0 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) _keys!1163 mask!1515))))

(declare-fun b!1059698 () Bool)

(assert (=> b!1059698 (= e!603218 e!603217)))

(declare-fun c!107157 () Bool)

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1059698 (= c!107157 (validKeyInArray!0 (select (arr!32177 _keys!1163) #b00000000000000000000000000000000)))))

(assert (= (and d!128597 (not res!707863)) b!1059698))

(assert (= (and b!1059698 c!107157) b!1059696))

(assert (= (and b!1059698 (not c!107157)) b!1059697))

(assert (= (and b!1059696 res!707862) b!1059695))

(assert (= (or b!1059695 b!1059697) bm!44861))

(declare-fun m!978509 () Bool)

(assert (=> b!1059696 m!978509))

(declare-fun m!978511 () Bool)

(assert (=> b!1059696 m!978511))

(declare-fun m!978513 () Bool)

(assert (=> b!1059696 m!978513))

(assert (=> b!1059696 m!978509))

(declare-fun m!978515 () Bool)

(assert (=> b!1059696 m!978515))

(declare-fun m!978517 () Bool)

(assert (=> bm!44861 m!978517))

(assert (=> b!1059698 m!978509))

(assert (=> b!1059698 m!978509))

(declare-fun m!978519 () Bool)

(assert (=> b!1059698 m!978519))

(assert (=> b!1059641 d!128597))

(declare-fun b!1059709 () Bool)

(declare-fun e!603229 () Bool)

(declare-fun contains!6185 (List!22470 (_ BitVec 64)) Bool)

(assert (=> b!1059709 (= e!603229 (contains!6185 Nil!22467 (select (arr!32177 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1059710 () Bool)

(declare-fun e!603231 () Bool)

(declare-fun e!603230 () Bool)

(assert (=> b!1059710 (= e!603231 e!603230)))

(declare-fun c!107160 () Bool)

(assert (=> b!1059710 (= c!107160 (validKeyInArray!0 (select (arr!32177 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun d!128599 () Bool)

(declare-fun res!707871 () Bool)

(declare-fun e!603228 () Bool)

(assert (=> d!128599 (=> res!707871 e!603228)))

(assert (=> d!128599 (= res!707871 (bvsge #b00000000000000000000000000000000 (size!32715 _keys!1163)))))

(assert (=> d!128599 (= (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!22467) e!603228)))

(declare-fun bm!44864 () Bool)

(declare-fun call!44867 () Bool)

(assert (=> bm!44864 (= call!44867 (arrayNoDuplicates!0 _keys!1163 (bvadd #b00000000000000000000000000000000 #b00000000000000000000000000000001) (ite c!107160 (Cons!22466 (select (arr!32177 _keys!1163) #b00000000000000000000000000000000) Nil!22467) Nil!22467)))))

(declare-fun b!1059711 () Bool)

(assert (=> b!1059711 (= e!603228 e!603231)))

(declare-fun res!707872 () Bool)

(assert (=> b!1059711 (=> (not res!707872) (not e!603231))))

(assert (=> b!1059711 (= res!707872 (not e!603229))))

(declare-fun res!707870 () Bool)

(assert (=> b!1059711 (=> (not res!707870) (not e!603229))))

(assert (=> b!1059711 (= res!707870 (validKeyInArray!0 (select (arr!32177 _keys!1163) #b00000000000000000000000000000000)))))

(declare-fun b!1059712 () Bool)

(assert (=> b!1059712 (= e!603230 call!44867)))

(declare-fun b!1059713 () Bool)

(assert (=> b!1059713 (= e!603230 call!44867)))

(assert (= (and d!128599 (not res!707871)) b!1059711))

(assert (= (and b!1059711 res!707870) b!1059709))

(assert (= (and b!1059711 res!707872) b!1059710))

(assert (= (and b!1059710 c!107160) b!1059712))

(assert (= (and b!1059710 (not c!107160)) b!1059713))

(assert (= (or b!1059712 b!1059713) bm!44864))

(assert (=> b!1059709 m!978509))

(assert (=> b!1059709 m!978509))

(declare-fun m!978521 () Bool)

(assert (=> b!1059709 m!978521))

(assert (=> b!1059710 m!978509))

(assert (=> b!1059710 m!978509))

(assert (=> b!1059710 m!978519))

(assert (=> bm!44864 m!978509))

(declare-fun m!978523 () Bool)

(assert (=> bm!44864 m!978523))

(assert (=> b!1059711 m!978509))

(assert (=> b!1059711 m!978509))

(assert (=> b!1059711 m!978519))

(assert (=> b!1059640 d!128599))

(declare-fun condMapEmpty!39151 () Bool)

(declare-fun mapDefault!39151 () ValueCell!11789)

(assert (=> mapNonEmpty!39142 (= condMapEmpty!39151 (= mapRest!39142 ((as const (Array (_ BitVec 32) ValueCell!11789)) mapDefault!39151)))))

(declare-fun e!603236 () Bool)

(declare-fun mapRes!39151 () Bool)

(assert (=> mapNonEmpty!39142 (= tp!74948 (and e!603236 mapRes!39151))))

(declare-fun mapNonEmpty!39151 () Bool)

(declare-fun tp!74957 () Bool)

(declare-fun e!603237 () Bool)

(assert (=> mapNonEmpty!39151 (= mapRes!39151 (and tp!74957 e!603237))))

(declare-fun mapValue!39151 () ValueCell!11789)

(declare-fun mapRest!39151 () (Array (_ BitVec 32) ValueCell!11789))

(declare-fun mapKey!39151 () (_ BitVec 32))

(assert (=> mapNonEmpty!39151 (= mapRest!39142 (store mapRest!39151 mapKey!39151 mapValue!39151))))

(declare-fun b!1059721 () Bool)

(assert (=> b!1059721 (= e!603236 tp_is_empty!24985)))

(declare-fun b!1059720 () Bool)

(assert (=> b!1059720 (= e!603237 tp_is_empty!24985)))

(declare-fun mapIsEmpty!39151 () Bool)

(assert (=> mapIsEmpty!39151 mapRes!39151))

(assert (= (and mapNonEmpty!39142 condMapEmpty!39151) mapIsEmpty!39151))

(assert (= (and mapNonEmpty!39142 (not condMapEmpty!39151)) mapNonEmpty!39151))

(assert (= (and mapNonEmpty!39151 ((_ is ValueCellFull!11789) mapValue!39151)) b!1059720))

(assert (= (and mapNonEmpty!39142 ((_ is ValueCellFull!11789) mapDefault!39151)) b!1059721))

(declare-fun m!978525 () Bool)

(assert (=> mapNonEmpty!39151 m!978525))

(check-sat (not b!1059698) tp_is_empty!24985 (not mapNonEmpty!39151) (not b!1059710) (not b!1059711) (not bm!44864) (not b!1059709) (not bm!44861) (not b!1059696))
(check-sat)
