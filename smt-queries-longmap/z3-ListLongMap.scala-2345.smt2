; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37534 () Bool)

(assert start!37534)

(declare-fun b_free!8661 () Bool)

(declare-fun b_next!8661 () Bool)

(assert (=> start!37534 (= b_free!8661 (not b_next!8661))))

(declare-fun tp!30699 () Bool)

(declare-fun b_and!15903 () Bool)

(assert (=> start!37534 (= tp!30699 b_and!15903)))

(declare-fun b!383158 () Bool)

(declare-fun res!218099 () Bool)

(declare-fun e!232760 () Bool)

(assert (=> b!383158 (=> (not res!218099) (not e!232760))))

(declare-datatypes ((array!22525 0))(
  ( (array!22526 (arr!10731 (Array (_ BitVec 32) (_ BitVec 64))) (size!11083 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22525)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22525 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383158 (= res!218099 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15528 () Bool)

(declare-fun mapRes!15528 () Bool)

(assert (=> mapIsEmpty!15528 mapRes!15528))

(declare-fun b!383159 () Bool)

(declare-fun e!232764 () Bool)

(assert (=> b!383159 (= e!232764 true)))

(declare-datatypes ((V!13517 0))(
  ( (V!13518 (val!4699 Int)) )
))
(declare-datatypes ((tuple2!6320 0))(
  ( (tuple2!6321 (_1!3171 (_ BitVec 64)) (_2!3171 V!13517)) )
))
(declare-datatypes ((List!6153 0))(
  ( (Nil!6150) (Cons!6149 (h!7005 tuple2!6320) (t!11303 List!6153)) )
))
(declare-datatypes ((ListLongMap!5233 0))(
  ( (ListLongMap!5234 (toList!2632 List!6153)) )
))
(declare-fun lt!179896 () ListLongMap!5233)

(declare-fun lt!179900 () ListLongMap!5233)

(declare-fun lt!179897 () tuple2!6320)

(declare-fun +!967 (ListLongMap!5233 tuple2!6320) ListLongMap!5233)

(assert (=> b!383159 (= lt!179896 (+!967 lt!179900 lt!179897))))

(declare-fun lt!179901 () ListLongMap!5233)

(declare-fun lt!179903 () ListLongMap!5233)

(assert (=> b!383159 (= lt!179901 lt!179903)))

(declare-fun b!383160 () Bool)

(declare-fun res!218089 () Bool)

(assert (=> b!383160 (=> (not res!218089) (not e!232760))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((ValueCell!4311 0))(
  ( (ValueCellFull!4311 (v!6896 V!13517)) (EmptyCell!4311) )
))
(declare-datatypes ((array!22527 0))(
  ( (array!22528 (arr!10732 (Array (_ BitVec 32) ValueCell!4311)) (size!11084 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22527)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!383160 (= res!218089 (and (= (size!11084 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11083 _keys!658) (size!11084 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383161 () Bool)

(declare-fun e!232762 () Bool)

(assert (=> b!383161 (= e!232760 e!232762)))

(declare-fun res!218095 () Bool)

(assert (=> b!383161 (=> (not res!218095) (not e!232762))))

(declare-fun lt!179904 () array!22525)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22525 (_ BitVec 32)) Bool)

(assert (=> b!383161 (= res!218095 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179904 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383161 (= lt!179904 (array!22526 (store (arr!10731 _keys!658) i!548 k0!778) (size!11083 _keys!658)))))

(declare-fun b!383162 () Bool)

(assert (=> b!383162 (= e!232762 (not e!232764))))

(declare-fun res!218093 () Bool)

(assert (=> b!383162 (=> res!218093 e!232764)))

(declare-fun lt!179895 () Bool)

(assert (=> b!383162 (= res!218093 (or (and (not lt!179895) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179895) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179895)))))

(assert (=> b!383162 (= lt!179895 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13517)

(declare-fun minValue!472 () V!13517)

(declare-fun getCurrentListMap!2037 (array!22525 array!22527 (_ BitVec 32) (_ BitVec 32) V!13517 V!13517 (_ BitVec 32) Int) ListLongMap!5233)

(assert (=> b!383162 (= lt!179900 (getCurrentListMap!2037 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179894 () array!22527)

(assert (=> b!383162 (= lt!179901 (getCurrentListMap!2037 lt!179904 lt!179894 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179898 () ListLongMap!5233)

(assert (=> b!383162 (and (= lt!179903 lt!179898) (= lt!179898 lt!179903))))

(declare-fun lt!179902 () ListLongMap!5233)

(assert (=> b!383162 (= lt!179898 (+!967 lt!179902 lt!179897))))

(declare-fun v!373 () V!13517)

(assert (=> b!383162 (= lt!179897 (tuple2!6321 k0!778 v!373))))

(declare-datatypes ((Unit!11828 0))(
  ( (Unit!11829) )
))
(declare-fun lt!179899 () Unit!11828)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!195 (array!22525 array!22527 (_ BitVec 32) (_ BitVec 32) V!13517 V!13517 (_ BitVec 32) (_ BitVec 64) V!13517 (_ BitVec 32) Int) Unit!11828)

(assert (=> b!383162 (= lt!179899 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!195 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!871 (array!22525 array!22527 (_ BitVec 32) (_ BitVec 32) V!13517 V!13517 (_ BitVec 32) Int) ListLongMap!5233)

(assert (=> b!383162 (= lt!179903 (getCurrentListMapNoExtraKeys!871 lt!179904 lt!179894 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383162 (= lt!179894 (array!22528 (store (arr!10732 _values!506) i!548 (ValueCellFull!4311 v!373)) (size!11084 _values!506)))))

(assert (=> b!383162 (= lt!179902 (getCurrentListMapNoExtraKeys!871 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383163 () Bool)

(declare-fun res!218092 () Bool)

(assert (=> b!383163 (=> (not res!218092) (not e!232760))))

(assert (=> b!383163 (= res!218092 (or (= (select (arr!10731 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10731 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383164 () Bool)

(declare-fun res!218098 () Bool)

(assert (=> b!383164 (=> (not res!218098) (not e!232760))))

(assert (=> b!383164 (= res!218098 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11083 _keys!658))))))

(declare-fun b!383165 () Bool)

(declare-fun e!232763 () Bool)

(declare-fun tp_is_empty!9309 () Bool)

(assert (=> b!383165 (= e!232763 tp_is_empty!9309)))

(declare-fun res!218091 () Bool)

(assert (=> start!37534 (=> (not res!218091) (not e!232760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37534 (= res!218091 (validMask!0 mask!970))))

(assert (=> start!37534 e!232760))

(declare-fun e!232765 () Bool)

(declare-fun array_inv!7900 (array!22527) Bool)

(assert (=> start!37534 (and (array_inv!7900 _values!506) e!232765)))

(assert (=> start!37534 tp!30699))

(assert (=> start!37534 true))

(assert (=> start!37534 tp_is_empty!9309))

(declare-fun array_inv!7901 (array!22525) Bool)

(assert (=> start!37534 (array_inv!7901 _keys!658)))

(declare-fun b!383166 () Bool)

(declare-fun res!218094 () Bool)

(assert (=> b!383166 (=> (not res!218094) (not e!232760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383166 (= res!218094 (validKeyInArray!0 k0!778))))

(declare-fun b!383167 () Bool)

(declare-fun e!232761 () Bool)

(assert (=> b!383167 (= e!232765 (and e!232761 mapRes!15528))))

(declare-fun condMapEmpty!15528 () Bool)

(declare-fun mapDefault!15528 () ValueCell!4311)

(assert (=> b!383167 (= condMapEmpty!15528 (= (arr!10732 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4311)) mapDefault!15528)))))

(declare-fun b!383168 () Bool)

(assert (=> b!383168 (= e!232761 tp_is_empty!9309)))

(declare-fun mapNonEmpty!15528 () Bool)

(declare-fun tp!30698 () Bool)

(assert (=> mapNonEmpty!15528 (= mapRes!15528 (and tp!30698 e!232763))))

(declare-fun mapRest!15528 () (Array (_ BitVec 32) ValueCell!4311))

(declare-fun mapKey!15528 () (_ BitVec 32))

(declare-fun mapValue!15528 () ValueCell!4311)

(assert (=> mapNonEmpty!15528 (= (arr!10732 _values!506) (store mapRest!15528 mapKey!15528 mapValue!15528))))

(declare-fun b!383169 () Bool)

(declare-fun res!218090 () Bool)

(assert (=> b!383169 (=> (not res!218090) (not e!232760))))

(declare-datatypes ((List!6154 0))(
  ( (Nil!6151) (Cons!6150 (h!7006 (_ BitVec 64)) (t!11304 List!6154)) )
))
(declare-fun arrayNoDuplicates!0 (array!22525 (_ BitVec 32) List!6154) Bool)

(assert (=> b!383169 (= res!218090 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6151))))

(declare-fun b!383170 () Bool)

(declare-fun res!218097 () Bool)

(assert (=> b!383170 (=> (not res!218097) (not e!232762))))

(assert (=> b!383170 (= res!218097 (arrayNoDuplicates!0 lt!179904 #b00000000000000000000000000000000 Nil!6151))))

(declare-fun b!383171 () Bool)

(declare-fun res!218096 () Bool)

(assert (=> b!383171 (=> (not res!218096) (not e!232760))))

(assert (=> b!383171 (= res!218096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(assert (= (and start!37534 res!218091) b!383160))

(assert (= (and b!383160 res!218089) b!383171))

(assert (= (and b!383171 res!218096) b!383169))

(assert (= (and b!383169 res!218090) b!383164))

(assert (= (and b!383164 res!218098) b!383166))

(assert (= (and b!383166 res!218094) b!383163))

(assert (= (and b!383163 res!218092) b!383158))

(assert (= (and b!383158 res!218099) b!383161))

(assert (= (and b!383161 res!218095) b!383170))

(assert (= (and b!383170 res!218097) b!383162))

(assert (= (and b!383162 (not res!218093)) b!383159))

(assert (= (and b!383167 condMapEmpty!15528) mapIsEmpty!15528))

(assert (= (and b!383167 (not condMapEmpty!15528)) mapNonEmpty!15528))

(get-info :version)

(assert (= (and mapNonEmpty!15528 ((_ is ValueCellFull!4311) mapValue!15528)) b!383165))

(assert (= (and b!383167 ((_ is ValueCellFull!4311) mapDefault!15528)) b!383168))

(assert (= start!37534 b!383167))

(declare-fun m!379915 () Bool)

(assert (=> mapNonEmpty!15528 m!379915))

(declare-fun m!379917 () Bool)

(assert (=> b!383171 m!379917))

(declare-fun m!379919 () Bool)

(assert (=> b!383170 m!379919))

(declare-fun m!379921 () Bool)

(assert (=> b!383166 m!379921))

(declare-fun m!379923 () Bool)

(assert (=> b!383158 m!379923))

(declare-fun m!379925 () Bool)

(assert (=> b!383169 m!379925))

(declare-fun m!379927 () Bool)

(assert (=> b!383163 m!379927))

(declare-fun m!379929 () Bool)

(assert (=> b!383161 m!379929))

(declare-fun m!379931 () Bool)

(assert (=> b!383161 m!379931))

(declare-fun m!379933 () Bool)

(assert (=> b!383162 m!379933))

(declare-fun m!379935 () Bool)

(assert (=> b!383162 m!379935))

(declare-fun m!379937 () Bool)

(assert (=> b!383162 m!379937))

(declare-fun m!379939 () Bool)

(assert (=> b!383162 m!379939))

(declare-fun m!379941 () Bool)

(assert (=> b!383162 m!379941))

(declare-fun m!379943 () Bool)

(assert (=> b!383162 m!379943))

(declare-fun m!379945 () Bool)

(assert (=> b!383162 m!379945))

(declare-fun m!379947 () Bool)

(assert (=> start!37534 m!379947))

(declare-fun m!379949 () Bool)

(assert (=> start!37534 m!379949))

(declare-fun m!379951 () Bool)

(assert (=> start!37534 m!379951))

(declare-fun m!379953 () Bool)

(assert (=> b!383159 m!379953))

(check-sat (not b!383169) (not b!383170) (not b!383161) (not mapNonEmpty!15528) (not b!383159) tp_is_empty!9309 (not b_next!8661) (not start!37534) (not b!383171) (not b!383166) b_and!15903 (not b!383162) (not b!383158))
(check-sat b_and!15903 (not b_next!8661))
