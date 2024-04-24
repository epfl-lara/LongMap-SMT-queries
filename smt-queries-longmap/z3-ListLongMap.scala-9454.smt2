; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!112556 () Bool)

(assert start!112556)

(declare-fun b_free!30727 () Bool)

(declare-fun b_next!30727 () Bool)

(assert (=> start!112556 (= b_free!30727 (not b_next!30727))))

(declare-fun tp!107817 () Bool)

(declare-fun b_and!49511 () Bool)

(assert (=> start!112556 (= tp!107817 b_and!49511)))

(declare-fun b!1332674 () Bool)

(declare-fun e!759496 () Bool)

(declare-fun e!759498 () Bool)

(declare-fun mapRes!56629 () Bool)

(assert (=> b!1332674 (= e!759496 (and e!759498 mapRes!56629))))

(declare-fun condMapEmpty!56629 () Bool)

(declare-datatypes ((V!53953 0))(
  ( (V!53954 (val!18393 Int)) )
))
(declare-datatypes ((ValueCell!17420 0))(
  ( (ValueCellFull!17420 (v!21025 V!53953)) (EmptyCell!17420) )
))
(declare-datatypes ((array!90263 0))(
  ( (array!90264 (arr!43593 (Array (_ BitVec 32) ValueCell!17420)) (size!44144 (_ BitVec 32))) )
))
(declare-fun _values!1320 () array!90263)

(declare-fun mapDefault!56629 () ValueCell!17420)

(assert (=> b!1332674 (= condMapEmpty!56629 (= (arr!43593 _values!1320) ((as const (Array (_ BitVec 32) ValueCell!17420)) mapDefault!56629)))))

(declare-fun b!1332675 () Bool)

(declare-fun res!883995 () Bool)

(declare-fun e!759497 () Bool)

(assert (=> b!1332675 (=> (not res!883995) (not e!759497))))

(declare-datatypes ((array!90265 0))(
  ( (array!90266 (arr!43594 (Array (_ BitVec 32) (_ BitVec 64))) (size!44145 (_ BitVec 32))) )
))
(declare-fun _keys!1590 () array!90265)

(declare-datatypes ((List!30889 0))(
  ( (Nil!30886) (Cons!30885 (h!32103 (_ BitVec 64)) (t!45021 List!30889)) )
))
(declare-fun arrayNoDuplicates!0 (array!90265 (_ BitVec 32) List!30889) Bool)

(assert (=> b!1332675 (= res!883995 (arrayNoDuplicates!0 _keys!1590 #b00000000000000000000000000000000 Nil!30886))))

(declare-fun b!1332676 () Bool)

(declare-fun tp_is_empty!36637 () Bool)

(assert (=> b!1332676 (= e!759498 tp_is_empty!36637)))

(declare-fun mapIsEmpty!56629 () Bool)

(assert (=> mapIsEmpty!56629 mapRes!56629))

(declare-fun res!883997 () Bool)

(assert (=> start!112556 (=> (not res!883997) (not e!759497))))

(declare-fun mask!1998 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!112556 (= res!883997 (validMask!0 mask!1998))))

(assert (=> start!112556 e!759497))

(declare-fun array_inv!33161 (array!90263) Bool)

(assert (=> start!112556 (and (array_inv!33161 _values!1320) e!759496)))

(assert (=> start!112556 true))

(declare-fun array_inv!33162 (array!90265) Bool)

(assert (=> start!112556 (array_inv!33162 _keys!1590)))

(assert (=> start!112556 tp!107817))

(assert (=> start!112556 tp_is_empty!36637))

(declare-fun b!1332677 () Bool)

(declare-fun res!883992 () Bool)

(assert (=> b!1332677 (=> (not res!883992) (not e!759497))))

(declare-fun extraKeys!1241 () (_ BitVec 32))

(assert (=> b!1332677 (= res!883992 (not (= (bvand extraKeys!1241 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun b!1332678 () Bool)

(assert (=> b!1332678 (= e!759497 (not true))))

(declare-datatypes ((tuple2!23724 0))(
  ( (tuple2!23725 (_1!11873 (_ BitVec 64)) (_2!11873 V!53953)) )
))
(declare-datatypes ((List!30890 0))(
  ( (Nil!30887) (Cons!30886 (h!32104 tuple2!23724) (t!45022 List!30890)) )
))
(declare-datatypes ((ListLongMap!21389 0))(
  ( (ListLongMap!21390 (toList!10710 List!30890)) )
))
(declare-fun lt!591986 () ListLongMap!21389)

(declare-fun k0!1153 () (_ BitVec 64))

(declare-fun contains!8886 (ListLongMap!21389 (_ BitVec 64)) Bool)

(assert (=> b!1332678 (contains!8886 lt!591986 k0!1153)))

(declare-datatypes ((Unit!43758 0))(
  ( (Unit!43759) )
))
(declare-fun lt!591990 () Unit!43758)

(declare-fun from!1980 () (_ BitVec 32))

(declare-fun lt!591988 () V!53953)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!267 ((_ BitVec 64) (_ BitVec 64) V!53953 ListLongMap!21389) Unit!43758)

(assert (=> b!1332678 (= lt!591990 (lemmaInListMapAfterAddingDiffThenInBefore!267 k0!1153 (select (arr!43594 _keys!1590) from!1980) lt!591988 lt!591986))))

(declare-fun lt!591987 () ListLongMap!21389)

(assert (=> b!1332678 (contains!8886 lt!591987 k0!1153)))

(declare-fun lt!591989 () Unit!43758)

(declare-fun minValue!1262 () V!53953)

(assert (=> b!1332678 (= lt!591989 (lemmaInListMapAfterAddingDiffThenInBefore!267 k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1262 lt!591987))))

(declare-fun +!4724 (ListLongMap!21389 tuple2!23724) ListLongMap!21389)

(assert (=> b!1332678 (= lt!591987 (+!4724 lt!591986 (tuple2!23725 (select (arr!43594 _keys!1590) from!1980) lt!591988)))))

(declare-fun defaultEntry!1323 () Int)

(declare-fun get!21999 (ValueCell!17420 V!53953) V!53953)

(declare-fun dynLambda!3678 (Int (_ BitVec 64)) V!53953)

(assert (=> b!1332678 (= lt!591988 (get!21999 (select (arr!43593 _values!1320) from!1980) (dynLambda!3678 defaultEntry!1323 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun zeroValue!1262 () V!53953)

(declare-fun getCurrentListMapNoExtraKeys!6368 (array!90265 array!90263 (_ BitVec 32) (_ BitVec 32) V!53953 V!53953 (_ BitVec 32) Int) ListLongMap!21389)

(assert (=> b!1332678 (= lt!591986 (getCurrentListMapNoExtraKeys!6368 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 (bvadd #b00000000000000000000000000000001 from!1980) defaultEntry!1323))))

(declare-fun b!1332679 () Bool)

(declare-fun res!883990 () Bool)

(assert (=> b!1332679 (=> (not res!883990) (not e!759497))))

(assert (=> b!1332679 (= res!883990 (and (= (bvand extraKeys!1241 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (bvsge from!1980 #b00000000000000000000000000000000) (bvslt from!1980 (size!44145 _keys!1590)) (not (= k0!1153 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1153 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1332680 () Bool)

(declare-fun res!883989 () Bool)

(assert (=> b!1332680 (=> (not res!883989) (not e!759497))))

(assert (=> b!1332680 (= res!883989 (not (= (select (arr!43594 _keys!1590) from!1980) k0!1153)))))

(declare-fun b!1332681 () Bool)

(declare-fun res!883994 () Bool)

(assert (=> b!1332681 (=> (not res!883994) (not e!759497))))

(assert (=> b!1332681 (= res!883994 (and (= (size!44144 _values!1320) (bvadd #b00000000000000000000000000000001 mask!1998)) (= (size!44145 _keys!1590) (size!44144 _values!1320)) (bvsge mask!1998 #b00000000000000000000000000000000) (bvsge extraKeys!1241 #b00000000000000000000000000000000) (bvsle extraKeys!1241 #b00000000000000000000000000000011)))))

(declare-fun b!1332682 () Bool)

(declare-fun e!759499 () Bool)

(assert (=> b!1332682 (= e!759499 tp_is_empty!36637)))

(declare-fun mapNonEmpty!56629 () Bool)

(declare-fun tp!107818 () Bool)

(assert (=> mapNonEmpty!56629 (= mapRes!56629 (and tp!107818 e!759499))))

(declare-fun mapRest!56629 () (Array (_ BitVec 32) ValueCell!17420))

(declare-fun mapValue!56629 () ValueCell!17420)

(declare-fun mapKey!56629 () (_ BitVec 32))

(assert (=> mapNonEmpty!56629 (= (arr!43593 _values!1320) (store mapRest!56629 mapKey!56629 mapValue!56629))))

(declare-fun b!1332683 () Bool)

(declare-fun res!883991 () Bool)

(assert (=> b!1332683 (=> (not res!883991) (not e!759497))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!90265 (_ BitVec 32)) Bool)

(assert (=> b!1332683 (= res!883991 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1590 mask!1998))))

(declare-fun b!1332684 () Bool)

(declare-fun res!883993 () Bool)

(assert (=> b!1332684 (=> (not res!883993) (not e!759497))))

(declare-fun getCurrentListMap!5679 (array!90265 array!90263 (_ BitVec 32) (_ BitVec 32) V!53953 V!53953 (_ BitVec 32) Int) ListLongMap!21389)

(assert (=> b!1332684 (= res!883993 (contains!8886 (getCurrentListMap!5679 _keys!1590 _values!1320 mask!1998 extraKeys!1241 zeroValue!1262 minValue!1262 from!1980 defaultEntry!1323) k0!1153))))

(declare-fun b!1332685 () Bool)

(declare-fun res!883996 () Bool)

(assert (=> b!1332685 (=> (not res!883996) (not e!759497))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1332685 (= res!883996 (validKeyInArray!0 (select (arr!43594 _keys!1590) from!1980)))))

(assert (= (and start!112556 res!883997) b!1332681))

(assert (= (and b!1332681 res!883994) b!1332683))

(assert (= (and b!1332683 res!883991) b!1332675))

(assert (= (and b!1332675 res!883995) b!1332679))

(assert (= (and b!1332679 res!883990) b!1332684))

(assert (= (and b!1332684 res!883993) b!1332680))

(assert (= (and b!1332680 res!883989) b!1332685))

(assert (= (and b!1332685 res!883996) b!1332677))

(assert (= (and b!1332677 res!883992) b!1332678))

(assert (= (and b!1332674 condMapEmpty!56629) mapIsEmpty!56629))

(assert (= (and b!1332674 (not condMapEmpty!56629)) mapNonEmpty!56629))

(get-info :version)

(assert (= (and mapNonEmpty!56629 ((_ is ValueCellFull!17420) mapValue!56629)) b!1332682))

(assert (= (and b!1332674 ((_ is ValueCellFull!17420) mapDefault!56629)) b!1332676))

(assert (= start!112556 b!1332674))

(declare-fun b_lambda!23981 () Bool)

(assert (=> (not b_lambda!23981) (not b!1332678)))

(declare-fun t!45020 () Bool)

(declare-fun tb!11935 () Bool)

(assert (=> (and start!112556 (= defaultEntry!1323 defaultEntry!1323) t!45020) tb!11935))

(declare-fun result!24949 () Bool)

(assert (=> tb!11935 (= result!24949 tp_is_empty!36637)))

(assert (=> b!1332678 t!45020))

(declare-fun b_and!49513 () Bool)

(assert (= b_and!49511 (and (=> t!45020 result!24949) b_and!49513)))

(declare-fun m!1221635 () Bool)

(assert (=> b!1332685 m!1221635))

(assert (=> b!1332685 m!1221635))

(declare-fun m!1221637 () Bool)

(assert (=> b!1332685 m!1221637))

(declare-fun m!1221639 () Bool)

(assert (=> mapNonEmpty!56629 m!1221639))

(declare-fun m!1221641 () Bool)

(assert (=> b!1332678 m!1221641))

(declare-fun m!1221643 () Bool)

(assert (=> b!1332678 m!1221643))

(declare-fun m!1221645 () Bool)

(assert (=> b!1332678 m!1221645))

(assert (=> b!1332678 m!1221643))

(declare-fun m!1221647 () Bool)

(assert (=> b!1332678 m!1221647))

(assert (=> b!1332678 m!1221645))

(declare-fun m!1221649 () Bool)

(assert (=> b!1332678 m!1221649))

(declare-fun m!1221651 () Bool)

(assert (=> b!1332678 m!1221651))

(declare-fun m!1221653 () Bool)

(assert (=> b!1332678 m!1221653))

(assert (=> b!1332678 m!1221635))

(declare-fun m!1221655 () Bool)

(assert (=> b!1332678 m!1221655))

(declare-fun m!1221657 () Bool)

(assert (=> b!1332678 m!1221657))

(assert (=> b!1332678 m!1221635))

(declare-fun m!1221659 () Bool)

(assert (=> b!1332683 m!1221659))

(declare-fun m!1221661 () Bool)

(assert (=> start!112556 m!1221661))

(declare-fun m!1221663 () Bool)

(assert (=> start!112556 m!1221663))

(declare-fun m!1221665 () Bool)

(assert (=> start!112556 m!1221665))

(assert (=> b!1332680 m!1221635))

(declare-fun m!1221667 () Bool)

(assert (=> b!1332675 m!1221667))

(declare-fun m!1221669 () Bool)

(assert (=> b!1332684 m!1221669))

(assert (=> b!1332684 m!1221669))

(declare-fun m!1221671 () Bool)

(assert (=> b!1332684 m!1221671))

(check-sat (not b!1332685) (not start!112556) tp_is_empty!36637 (not b!1332684) (not b!1332683) b_and!49513 (not b_next!30727) (not b!1332675) (not b!1332678) (not b_lambda!23981) (not mapNonEmpty!56629))
(check-sat b_and!49513 (not b_next!30727))
