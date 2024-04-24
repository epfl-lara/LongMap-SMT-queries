; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!41226 () Bool)

(assert start!41226)

(declare-fun b_free!11083 () Bool)

(declare-fun b_next!11083 () Bool)

(assert (=> start!41226 (= b_free!11083 (not b_next!11083))))

(declare-fun tp!39088 () Bool)

(declare-fun b_and!19413 () Bool)

(assert (=> start!41226 (= tp!39088 b_and!19413)))

(declare-fun b!461328 () Bool)

(declare-fun e!269051 () Bool)

(declare-fun tp_is_empty!12421 () Bool)

(assert (=> b!461328 (= e!269051 tp_is_empty!12421)))

(declare-fun b!461329 () Bool)

(declare-fun e!269057 () Bool)

(assert (=> b!461329 (= e!269057 (not true))))

(declare-datatypes ((V!17667 0))(
  ( (V!17668 (val!6255 Int)) )
))
(declare-fun minValue!515 () V!17667)

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((ValueCell!5867 0))(
  ( (ValueCellFull!5867 (v!8538 V!17667)) (EmptyCell!5867) )
))
(declare-datatypes ((array!28636 0))(
  ( (array!28637 (arr!13757 (Array (_ BitVec 32) ValueCell!5867)) (size!14109 (_ BitVec 32))) )
))
(declare-fun lt!208988 () array!28636)

(declare-datatypes ((array!28638 0))(
  ( (array!28639 (arr!13758 (Array (_ BitVec 32) (_ BitVec 64))) (size!14110 (_ BitVec 32))) )
))
(declare-fun lt!208989 () array!28638)

(declare-fun _values!549 () array!28636)

(declare-fun zeroValue!515 () V!17667)

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun v!412 () V!17667)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun _keys!709 () array!28638)

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((tuple2!8186 0))(
  ( (tuple2!8187 (_1!4104 (_ BitVec 64)) (_2!4104 V!17667)) )
))
(declare-datatypes ((List!8248 0))(
  ( (Nil!8245) (Cons!8244 (h!9100 tuple2!8186) (t!14182 List!8248)) )
))
(declare-datatypes ((ListLongMap!7101 0))(
  ( (ListLongMap!7102 (toList!3566 List!8248)) )
))
(declare-fun getCurrentListMapNoExtraKeys!1793 (array!28638 array!28636 (_ BitVec 32) (_ BitVec 32) V!17667 V!17667 (_ BitVec 32) Int) ListLongMap!7101)

(declare-fun +!1641 (ListLongMap!7101 tuple2!8186) ListLongMap!7101)

(assert (=> b!461329 (= (getCurrentListMapNoExtraKeys!1793 lt!208989 lt!208988 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (+!1641 (getCurrentListMapNoExtraKeys!1793 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557) (tuple2!8187 k0!794 v!412)))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((Unit!13426 0))(
  ( (Unit!13427) )
))
(declare-fun lt!208987 () Unit!13426)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!795 (array!28638 array!28636 (_ BitVec 32) (_ BitVec 32) V!17667 V!17667 (_ BitVec 32) (_ BitVec 64) V!17667 (_ BitVec 32) Int) Unit!13426)

(assert (=> b!461329 (= lt!208987 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!795 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 i!563 k0!794 v!412 (bvadd #b00000000000000000000000000000001 from!863) defaultEntry!557))))

(declare-fun b!461330 () Bool)

(declare-fun e!269055 () Bool)

(declare-fun e!269052 () Bool)

(assert (=> b!461330 (= e!269055 e!269052)))

(declare-fun res!275977 () Bool)

(assert (=> b!461330 (=> (not res!275977) (not e!269052))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28638 (_ BitVec 32)) Bool)

(assert (=> b!461330 (= res!275977 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!208989 mask!1025))))

(assert (=> b!461330 (= lt!208989 (array!28639 (store (arr!13758 _keys!709) i!563 k0!794) (size!14110 _keys!709)))))

(declare-fun b!461331 () Bool)

(declare-fun e!269053 () Bool)

(declare-fun mapRes!20284 () Bool)

(assert (=> b!461331 (= e!269053 (and e!269051 mapRes!20284))))

(declare-fun condMapEmpty!20284 () Bool)

(declare-fun mapDefault!20284 () ValueCell!5867)

(assert (=> b!461331 (= condMapEmpty!20284 (= (arr!13757 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5867)) mapDefault!20284)))))

(declare-fun b!461332 () Bool)

(declare-fun res!275978 () Bool)

(assert (=> b!461332 (=> (not res!275978) (not e!269055))))

(assert (=> b!461332 (= res!275978 (and (= (size!14109 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!14110 _keys!709) (size!14109 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!461333 () Bool)

(declare-fun res!275970 () Bool)

(assert (=> b!461333 (=> (not res!275970) (not e!269052))))

(assert (=> b!461333 (= res!275970 (bvsle from!863 i!563))))

(declare-fun b!461334 () Bool)

(declare-fun res!275974 () Bool)

(assert (=> b!461334 (=> (not res!275974) (not e!269055))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!461334 (= res!275974 (validKeyInArray!0 k0!794))))

(declare-fun b!461335 () Bool)

(assert (=> b!461335 (= e!269052 e!269057)))

(declare-fun res!275969 () Bool)

(assert (=> b!461335 (=> (not res!275969) (not e!269057))))

(assert (=> b!461335 (= res!275969 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-fun lt!208985 () ListLongMap!7101)

(assert (=> b!461335 (= lt!208985 (getCurrentListMapNoExtraKeys!1793 lt!208989 lt!208988 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(assert (=> b!461335 (= lt!208988 (array!28637 (store (arr!13757 _values!549) i!563 (ValueCellFull!5867 v!412)) (size!14109 _values!549)))))

(declare-fun lt!208986 () ListLongMap!7101)

(assert (=> b!461335 (= lt!208986 (getCurrentListMapNoExtraKeys!1793 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!461336 () Bool)

(declare-fun e!269054 () Bool)

(assert (=> b!461336 (= e!269054 tp_is_empty!12421)))

(declare-fun mapNonEmpty!20284 () Bool)

(declare-fun tp!39087 () Bool)

(assert (=> mapNonEmpty!20284 (= mapRes!20284 (and tp!39087 e!269054))))

(declare-fun mapRest!20284 () (Array (_ BitVec 32) ValueCell!5867))

(declare-fun mapValue!20284 () ValueCell!5867)

(declare-fun mapKey!20284 () (_ BitVec 32))

(assert (=> mapNonEmpty!20284 (= (arr!13757 _values!549) (store mapRest!20284 mapKey!20284 mapValue!20284))))

(declare-fun b!461337 () Bool)

(declare-fun res!275976 () Bool)

(assert (=> b!461337 (=> (not res!275976) (not e!269055))))

(assert (=> b!461337 (= res!275976 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapIsEmpty!20284 () Bool)

(assert (=> mapIsEmpty!20284 mapRes!20284))

(declare-fun b!461338 () Bool)

(declare-fun res!275975 () Bool)

(assert (=> b!461338 (=> (not res!275975) (not e!269055))))

(assert (=> b!461338 (= res!275975 (or (= (select (arr!13758 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13758 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!461339 () Bool)

(declare-fun res!275973 () Bool)

(assert (=> b!461339 (=> (not res!275973) (not e!269055))))

(assert (=> b!461339 (= res!275973 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!14110 _keys!709))))))

(declare-fun res!275980 () Bool)

(assert (=> start!41226 (=> (not res!275980) (not e!269055))))

(assert (=> start!41226 (= res!275980 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14110 _keys!709))))))

(assert (=> start!41226 e!269055))

(assert (=> start!41226 tp_is_empty!12421))

(assert (=> start!41226 tp!39088))

(assert (=> start!41226 true))

(declare-fun array_inv!10030 (array!28636) Bool)

(assert (=> start!41226 (and (array_inv!10030 _values!549) e!269053)))

(declare-fun array_inv!10031 (array!28638) Bool)

(assert (=> start!41226 (array_inv!10031 _keys!709)))

(declare-fun b!461340 () Bool)

(declare-fun res!275979 () Bool)

(assert (=> b!461340 (=> (not res!275979) (not e!269055))))

(declare-fun arrayContainsKey!0 (array!28638 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!461340 (= res!275979 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!461341 () Bool)

(declare-fun res!275971 () Bool)

(assert (=> b!461341 (=> (not res!275971) (not e!269055))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!461341 (= res!275971 (validMask!0 mask!1025))))

(declare-fun b!461342 () Bool)

(declare-fun res!275968 () Bool)

(assert (=> b!461342 (=> (not res!275968) (not e!269055))))

(declare-datatypes ((List!8249 0))(
  ( (Nil!8246) (Cons!8245 (h!9101 (_ BitVec 64)) (t!14183 List!8249)) )
))
(declare-fun arrayNoDuplicates!0 (array!28638 (_ BitVec 32) List!8249) Bool)

(assert (=> b!461342 (= res!275968 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8246))))

(declare-fun b!461343 () Bool)

(declare-fun res!275972 () Bool)

(assert (=> b!461343 (=> (not res!275972) (not e!269052))))

(assert (=> b!461343 (= res!275972 (arrayNoDuplicates!0 lt!208989 #b00000000000000000000000000000000 Nil!8246))))

(assert (= (and start!41226 res!275980) b!461341))

(assert (= (and b!461341 res!275971) b!461332))

(assert (= (and b!461332 res!275978) b!461337))

(assert (= (and b!461337 res!275976) b!461342))

(assert (= (and b!461342 res!275968) b!461339))

(assert (= (and b!461339 res!275973) b!461334))

(assert (= (and b!461334 res!275974) b!461338))

(assert (= (and b!461338 res!275975) b!461340))

(assert (= (and b!461340 res!275979) b!461330))

(assert (= (and b!461330 res!275977) b!461343))

(assert (= (and b!461343 res!275972) b!461333))

(assert (= (and b!461333 res!275970) b!461335))

(assert (= (and b!461335 res!275969) b!461329))

(assert (= (and b!461331 condMapEmpty!20284) mapIsEmpty!20284))

(assert (= (and b!461331 (not condMapEmpty!20284)) mapNonEmpty!20284))

(get-info :version)

(assert (= (and mapNonEmpty!20284 ((_ is ValueCellFull!5867) mapValue!20284)) b!461336))

(assert (= (and b!461331 ((_ is ValueCellFull!5867) mapDefault!20284)) b!461328))

(assert (= start!41226 b!461331))

(declare-fun m!444737 () Bool)

(assert (=> b!461342 m!444737))

(declare-fun m!444739 () Bool)

(assert (=> b!461343 m!444739))

(declare-fun m!444741 () Bool)

(assert (=> b!461330 m!444741))

(declare-fun m!444743 () Bool)

(assert (=> b!461330 m!444743))

(declare-fun m!444745 () Bool)

(assert (=> start!41226 m!444745))

(declare-fun m!444747 () Bool)

(assert (=> start!41226 m!444747))

(declare-fun m!444749 () Bool)

(assert (=> b!461340 m!444749))

(declare-fun m!444751 () Bool)

(assert (=> mapNonEmpty!20284 m!444751))

(declare-fun m!444753 () Bool)

(assert (=> b!461337 m!444753))

(declare-fun m!444755 () Bool)

(assert (=> b!461341 m!444755))

(declare-fun m!444757 () Bool)

(assert (=> b!461334 m!444757))

(declare-fun m!444759 () Bool)

(assert (=> b!461329 m!444759))

(declare-fun m!444761 () Bool)

(assert (=> b!461329 m!444761))

(assert (=> b!461329 m!444761))

(declare-fun m!444763 () Bool)

(assert (=> b!461329 m!444763))

(declare-fun m!444765 () Bool)

(assert (=> b!461329 m!444765))

(declare-fun m!444767 () Bool)

(assert (=> b!461338 m!444767))

(declare-fun m!444769 () Bool)

(assert (=> b!461335 m!444769))

(declare-fun m!444771 () Bool)

(assert (=> b!461335 m!444771))

(declare-fun m!444773 () Bool)

(assert (=> b!461335 m!444773))

(check-sat (not b!461340) (not b!461343) b_and!19413 (not b!461334) (not mapNonEmpty!20284) tp_is_empty!12421 (not start!41226) (not b!461337) (not b!461329) (not b_next!11083) (not b!461330) (not b!461342) (not b!461341) (not b!461335))
(check-sat b_and!19413 (not b_next!11083))
