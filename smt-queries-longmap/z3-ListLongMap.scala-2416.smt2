; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38210 () Bool)

(assert start!38210)

(declare-fun b_free!9061 () Bool)

(declare-fun b_next!9061 () Bool)

(assert (=> start!38210 (= b_free!9061 (not b_next!9061))))

(declare-fun tp!31971 () Bool)

(declare-fun b_and!16461 () Bool)

(assert (=> start!38210 (= tp!31971 b_and!16461)))

(declare-fun b!394189 () Bool)

(declare-fun e!238629 () Bool)

(declare-fun e!238630 () Bool)

(declare-fun mapRes!16200 () Bool)

(assert (=> b!394189 (= e!238629 (and e!238630 mapRes!16200))))

(declare-fun condMapEmpty!16200 () Bool)

(declare-datatypes ((V!14083 0))(
  ( (V!14084 (val!4911 Int)) )
))
(declare-datatypes ((ValueCell!4523 0))(
  ( (ValueCellFull!4523 (v!7157 V!14083)) (EmptyCell!4523) )
))
(declare-datatypes ((array!23364 0))(
  ( (array!23365 (arr!11138 (Array (_ BitVec 32) ValueCell!4523)) (size!11490 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23364)

(declare-fun mapDefault!16200 () ValueCell!4523)

(assert (=> b!394189 (= condMapEmpty!16200 (= (arr!11138 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4523)) mapDefault!16200)))))

(declare-fun b!394190 () Bool)

(declare-fun res!225915 () Bool)

(declare-fun e!238631 () Bool)

(assert (=> b!394190 (=> (not res!225915) (not e!238631))))

(declare-datatypes ((array!23366 0))(
  ( (array!23367 (arr!11139 (Array (_ BitVec 32) (_ BitVec 64))) (size!11491 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23366)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!23366 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394190 (= res!225915 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!394191 () Bool)

(declare-fun tp_is_empty!9733 () Bool)

(assert (=> b!394191 (= e!238630 tp_is_empty!9733)))

(declare-fun mapIsEmpty!16200 () Bool)

(assert (=> mapIsEmpty!16200 mapRes!16200))

(declare-fun b!394192 () Bool)

(declare-fun e!238626 () Bool)

(assert (=> b!394192 (= e!238626 tp_is_empty!9733)))

(declare-fun b!394193 () Bool)

(declare-fun res!225919 () Bool)

(assert (=> b!394193 (=> (not res!225919) (not e!238631))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!394193 (= res!225919 (and (= (size!11490 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11491 _keys!658) (size!11490 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!394194 () Bool)

(declare-fun res!225922 () Bool)

(assert (=> b!394194 (=> (not res!225922) (not e!238631))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394194 (= res!225922 (validKeyInArray!0 k0!778))))

(declare-fun b!394188 () Bool)

(declare-fun e!238627 () Bool)

(assert (=> b!394188 (= e!238627 true)))

(declare-datatypes ((tuple2!6498 0))(
  ( (tuple2!6499 (_1!3260 (_ BitVec 64)) (_2!3260 V!14083)) )
))
(declare-datatypes ((List!6346 0))(
  ( (Nil!6343) (Cons!6342 (h!7198 tuple2!6498) (t!11512 List!6346)) )
))
(declare-datatypes ((ListLongMap!5413 0))(
  ( (ListLongMap!5414 (toList!2722 List!6346)) )
))
(declare-fun lt!186785 () ListLongMap!5413)

(declare-fun lt!186789 () ListLongMap!5413)

(declare-fun lt!186786 () tuple2!6498)

(declare-fun +!1076 (ListLongMap!5413 tuple2!6498) ListLongMap!5413)

(assert (=> b!394188 (= lt!186785 (+!1076 lt!186789 lt!186786))))

(declare-fun lt!186781 () ListLongMap!5413)

(declare-fun lt!186787 () ListLongMap!5413)

(assert (=> b!394188 (= lt!186781 lt!186787)))

(declare-fun res!225913 () Bool)

(assert (=> start!38210 (=> (not res!225913) (not e!238631))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38210 (= res!225913 (validMask!0 mask!970))))

(assert (=> start!38210 e!238631))

(declare-fun array_inv!8234 (array!23364) Bool)

(assert (=> start!38210 (and (array_inv!8234 _values!506) e!238629)))

(assert (=> start!38210 tp!31971))

(assert (=> start!38210 true))

(assert (=> start!38210 tp_is_empty!9733))

(declare-fun array_inv!8235 (array!23366) Bool)

(assert (=> start!38210 (array_inv!8235 _keys!658)))

(declare-fun b!394195 () Bool)

(declare-fun e!238632 () Bool)

(assert (=> b!394195 (= e!238632 (not e!238627))))

(declare-fun res!225920 () Bool)

(assert (=> b!394195 (=> res!225920 e!238627)))

(declare-fun lt!186784 () Bool)

(assert (=> b!394195 (= res!225920 (or (and (not lt!186784) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186784) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186784)))))

(assert (=> b!394195 (= lt!186784 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14083)

(declare-fun minValue!472 () V!14083)

(declare-fun getCurrentListMap!2094 (array!23366 array!23364 (_ BitVec 32) (_ BitVec 32) V!14083 V!14083 (_ BitVec 32) Int) ListLongMap!5413)

(assert (=> b!394195 (= lt!186789 (getCurrentListMap!2094 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186782 () array!23364)

(declare-fun lt!186780 () array!23366)

(assert (=> b!394195 (= lt!186781 (getCurrentListMap!2094 lt!186780 lt!186782 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186783 () ListLongMap!5413)

(assert (=> b!394195 (and (= lt!186787 lt!186783) (= lt!186783 lt!186787))))

(declare-fun lt!186788 () ListLongMap!5413)

(assert (=> b!394195 (= lt!186783 (+!1076 lt!186788 lt!186786))))

(declare-fun v!373 () V!14083)

(assert (=> b!394195 (= lt!186786 (tuple2!6499 k0!778 v!373))))

(declare-datatypes ((Unit!12021 0))(
  ( (Unit!12022) )
))
(declare-fun lt!186790 () Unit!12021)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!285 (array!23366 array!23364 (_ BitVec 32) (_ BitVec 32) V!14083 V!14083 (_ BitVec 32) (_ BitVec 64) V!14083 (_ BitVec 32) Int) Unit!12021)

(assert (=> b!394195 (= lt!186790 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!285 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!983 (array!23366 array!23364 (_ BitVec 32) (_ BitVec 32) V!14083 V!14083 (_ BitVec 32) Int) ListLongMap!5413)

(assert (=> b!394195 (= lt!186787 (getCurrentListMapNoExtraKeys!983 lt!186780 lt!186782 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!394195 (= lt!186782 (array!23365 (store (arr!11138 _values!506) i!548 (ValueCellFull!4523 v!373)) (size!11490 _values!506)))))

(assert (=> b!394195 (= lt!186788 (getCurrentListMapNoExtraKeys!983 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394196 () Bool)

(declare-fun res!225923 () Bool)

(assert (=> b!394196 (=> (not res!225923) (not e!238631))))

(assert (=> b!394196 (= res!225923 (or (= (select (arr!11139 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11139 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!394197 () Bool)

(declare-fun res!225918 () Bool)

(assert (=> b!394197 (=> (not res!225918) (not e!238631))))

(assert (=> b!394197 (= res!225918 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11491 _keys!658))))))

(declare-fun b!394198 () Bool)

(declare-fun res!225921 () Bool)

(assert (=> b!394198 (=> (not res!225921) (not e!238631))))

(declare-datatypes ((List!6347 0))(
  ( (Nil!6344) (Cons!6343 (h!7199 (_ BitVec 64)) (t!11513 List!6347)) )
))
(declare-fun arrayNoDuplicates!0 (array!23366 (_ BitVec 32) List!6347) Bool)

(assert (=> b!394198 (= res!225921 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6344))))

(declare-fun b!394199 () Bool)

(declare-fun res!225916 () Bool)

(assert (=> b!394199 (=> (not res!225916) (not e!238631))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23366 (_ BitVec 32)) Bool)

(assert (=> b!394199 (= res!225916 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!394200 () Bool)

(declare-fun res!225917 () Bool)

(assert (=> b!394200 (=> (not res!225917) (not e!238632))))

(assert (=> b!394200 (= res!225917 (arrayNoDuplicates!0 lt!186780 #b00000000000000000000000000000000 Nil!6344))))

(declare-fun b!394201 () Bool)

(assert (=> b!394201 (= e!238631 e!238632)))

(declare-fun res!225914 () Bool)

(assert (=> b!394201 (=> (not res!225914) (not e!238632))))

(assert (=> b!394201 (= res!225914 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186780 mask!970))))

(assert (=> b!394201 (= lt!186780 (array!23367 (store (arr!11139 _keys!658) i!548 k0!778) (size!11491 _keys!658)))))

(declare-fun mapNonEmpty!16200 () Bool)

(declare-fun tp!31970 () Bool)

(assert (=> mapNonEmpty!16200 (= mapRes!16200 (and tp!31970 e!238626))))

(declare-fun mapRest!16200 () (Array (_ BitVec 32) ValueCell!4523))

(declare-fun mapValue!16200 () ValueCell!4523)

(declare-fun mapKey!16200 () (_ BitVec 32))

(assert (=> mapNonEmpty!16200 (= (arr!11138 _values!506) (store mapRest!16200 mapKey!16200 mapValue!16200))))

(assert (= (and start!38210 res!225913) b!394193))

(assert (= (and b!394193 res!225919) b!394199))

(assert (= (and b!394199 res!225916) b!394198))

(assert (= (and b!394198 res!225921) b!394197))

(assert (= (and b!394197 res!225918) b!394194))

(assert (= (and b!394194 res!225922) b!394196))

(assert (= (and b!394196 res!225923) b!394190))

(assert (= (and b!394190 res!225915) b!394201))

(assert (= (and b!394201 res!225914) b!394200))

(assert (= (and b!394200 res!225917) b!394195))

(assert (= (and b!394195 (not res!225920)) b!394188))

(assert (= (and b!394189 condMapEmpty!16200) mapIsEmpty!16200))

(assert (= (and b!394189 (not condMapEmpty!16200)) mapNonEmpty!16200))

(get-info :version)

(assert (= (and mapNonEmpty!16200 ((_ is ValueCellFull!4523) mapValue!16200)) b!394192))

(assert (= (and b!394189 ((_ is ValueCellFull!4523) mapDefault!16200)) b!394191))

(assert (= start!38210 b!394189))

(declare-fun m!390909 () Bool)

(assert (=> b!394188 m!390909))

(declare-fun m!390911 () Bool)

(assert (=> b!394196 m!390911))

(declare-fun m!390913 () Bool)

(assert (=> b!394201 m!390913))

(declare-fun m!390915 () Bool)

(assert (=> b!394201 m!390915))

(declare-fun m!390917 () Bool)

(assert (=> b!394195 m!390917))

(declare-fun m!390919 () Bool)

(assert (=> b!394195 m!390919))

(declare-fun m!390921 () Bool)

(assert (=> b!394195 m!390921))

(declare-fun m!390923 () Bool)

(assert (=> b!394195 m!390923))

(declare-fun m!390925 () Bool)

(assert (=> b!394195 m!390925))

(declare-fun m!390927 () Bool)

(assert (=> b!394195 m!390927))

(declare-fun m!390929 () Bool)

(assert (=> b!394195 m!390929))

(declare-fun m!390931 () Bool)

(assert (=> mapNonEmpty!16200 m!390931))

(declare-fun m!390933 () Bool)

(assert (=> b!394190 m!390933))

(declare-fun m!390935 () Bool)

(assert (=> b!394200 m!390935))

(declare-fun m!390937 () Bool)

(assert (=> start!38210 m!390937))

(declare-fun m!390939 () Bool)

(assert (=> start!38210 m!390939))

(declare-fun m!390941 () Bool)

(assert (=> start!38210 m!390941))

(declare-fun m!390943 () Bool)

(assert (=> b!394198 m!390943))

(declare-fun m!390945 () Bool)

(assert (=> b!394199 m!390945))

(declare-fun m!390947 () Bool)

(assert (=> b!394194 m!390947))

(check-sat (not start!38210) (not b!394194) (not b!394198) (not b!394199) tp_is_empty!9733 (not b!394188) (not b!394201) (not b!394200) (not b!394190) b_and!16461 (not b!394195) (not b_next!9061) (not mapNonEmpty!16200))
(check-sat b_and!16461 (not b_next!9061))
