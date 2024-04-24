; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37776 () Bool)

(assert start!37776)

(declare-fun b_free!8893 () Bool)

(declare-fun b_next!8893 () Bool)

(assert (=> start!37776 (= b_free!8893 (not b_next!8893))))

(declare-fun tp!31430 () Bool)

(declare-fun b_and!16149 () Bool)

(assert (=> start!37776 (= tp!31430 b_and!16149)))

(declare-fun b!388069 () Bool)

(declare-fun e!235174 () Bool)

(declare-fun e!235171 () Bool)

(declare-fun mapRes!15912 () Bool)

(assert (=> b!388069 (= e!235174 (and e!235171 mapRes!15912))))

(declare-fun condMapEmpty!15912 () Bool)

(declare-datatypes ((V!13859 0))(
  ( (V!13860 (val!4827 Int)) )
))
(declare-datatypes ((ValueCell!4439 0))(
  ( (ValueCellFull!4439 (v!7025 V!13859)) (EmptyCell!4439) )
))
(declare-datatypes ((array!23008 0))(
  ( (array!23009 (arr!10972 (Array (_ BitVec 32) ValueCell!4439)) (size!11324 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23008)

(declare-fun mapDefault!15912 () ValueCell!4439)

(assert (=> b!388069 (= condMapEmpty!15912 (= (arr!10972 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4439)) mapDefault!15912)))))

(declare-fun b!388070 () Bool)

(declare-fun e!235176 () Bool)

(assert (=> b!388070 (= e!235176 (not true))))

(declare-datatypes ((tuple2!6352 0))(
  ( (tuple2!6353 (_1!3187 (_ BitVec 64)) (_2!3187 V!13859)) )
))
(declare-datatypes ((List!6202 0))(
  ( (Nil!6199) (Cons!6198 (h!7054 tuple2!6352) (t!11344 List!6202)) )
))
(declare-datatypes ((ListLongMap!5267 0))(
  ( (ListLongMap!5268 (toList!2649 List!6202)) )
))
(declare-fun lt!182239 () ListLongMap!5267)

(declare-fun lt!182236 () ListLongMap!5267)

(assert (=> b!388070 (and (= lt!182239 lt!182236) (= lt!182236 lt!182239))))

(declare-fun v!373 () V!13859)

(declare-fun lt!182238 () ListLongMap!5267)

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun +!1003 (ListLongMap!5267 tuple2!6352) ListLongMap!5267)

(assert (=> b!388070 (= lt!182236 (+!1003 lt!182238 (tuple2!6353 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13859)

(declare-datatypes ((array!23010 0))(
  ( (array!23011 (arr!10973 (Array (_ BitVec 32) (_ BitVec 64))) (size!11325 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23010)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((Unit!11873 0))(
  ( (Unit!11874) )
))
(declare-fun lt!182235 () Unit!11873)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!13859)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!226 (array!23010 array!23008 (_ BitVec 32) (_ BitVec 32) V!13859 V!13859 (_ BitVec 32) (_ BitVec 64) V!13859 (_ BitVec 32) Int) Unit!11873)

(assert (=> b!388070 (= lt!182235 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!226 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182237 () array!23010)

(declare-fun getCurrentListMapNoExtraKeys!924 (array!23010 array!23008 (_ BitVec 32) (_ BitVec 32) V!13859 V!13859 (_ BitVec 32) Int) ListLongMap!5267)

(assert (=> b!388070 (= lt!182239 (getCurrentListMapNoExtraKeys!924 lt!182237 (array!23009 (store (arr!10972 _values!506) i!548 (ValueCellFull!4439 v!373)) (size!11324 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!388070 (= lt!182238 (getCurrentListMapNoExtraKeys!924 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!388071 () Bool)

(declare-fun res!221899 () Bool)

(declare-fun e!235172 () Bool)

(assert (=> b!388071 (=> (not res!221899) (not e!235172))))

(declare-datatypes ((List!6203 0))(
  ( (Nil!6200) (Cons!6199 (h!7055 (_ BitVec 64)) (t!11345 List!6203)) )
))
(declare-fun arrayNoDuplicates!0 (array!23010 (_ BitVec 32) List!6203) Bool)

(assert (=> b!388071 (= res!221899 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6200))))

(declare-fun b!388072 () Bool)

(declare-fun res!221900 () Bool)

(assert (=> b!388072 (=> (not res!221900) (not e!235176))))

(assert (=> b!388072 (= res!221900 (arrayNoDuplicates!0 lt!182237 #b00000000000000000000000000000000 Nil!6200))))

(declare-fun b!388073 () Bool)

(declare-fun res!221897 () Bool)

(assert (=> b!388073 (=> (not res!221897) (not e!235172))))

(assert (=> b!388073 (= res!221897 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11325 _keys!658))))))

(declare-fun b!388074 () Bool)

(declare-fun res!221901 () Bool)

(assert (=> b!388074 (=> (not res!221901) (not e!235172))))

(assert (=> b!388074 (= res!221901 (or (= (select (arr!10973 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10973 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!388075 () Bool)

(declare-fun res!221894 () Bool)

(assert (=> b!388075 (=> (not res!221894) (not e!235172))))

(declare-fun arrayContainsKey!0 (array!23010 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!388075 (= res!221894 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!388076 () Bool)

(assert (=> b!388076 (= e!235172 e!235176)))

(declare-fun res!221902 () Bool)

(assert (=> b!388076 (=> (not res!221902) (not e!235176))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23010 (_ BitVec 32)) Bool)

(assert (=> b!388076 (= res!221902 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182237 mask!970))))

(assert (=> b!388076 (= lt!182237 (array!23011 (store (arr!10973 _keys!658) i!548 k0!778) (size!11325 _keys!658)))))

(declare-fun b!388077 () Bool)

(declare-fun e!235175 () Bool)

(declare-fun tp_is_empty!9565 () Bool)

(assert (=> b!388077 (= e!235175 tp_is_empty!9565)))

(declare-fun b!388078 () Bool)

(declare-fun res!221903 () Bool)

(assert (=> b!388078 (=> (not res!221903) (not e!235172))))

(assert (=> b!388078 (= res!221903 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!221896 () Bool)

(assert (=> start!37776 (=> (not res!221896) (not e!235172))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37776 (= res!221896 (validMask!0 mask!970))))

(assert (=> start!37776 e!235172))

(declare-fun array_inv!8108 (array!23008) Bool)

(assert (=> start!37776 (and (array_inv!8108 _values!506) e!235174)))

(assert (=> start!37776 tp!31430))

(assert (=> start!37776 true))

(assert (=> start!37776 tp_is_empty!9565))

(declare-fun array_inv!8109 (array!23010) Bool)

(assert (=> start!37776 (array_inv!8109 _keys!658)))

(declare-fun b!388079 () Bool)

(assert (=> b!388079 (= e!235171 tp_is_empty!9565)))

(declare-fun mapIsEmpty!15912 () Bool)

(assert (=> mapIsEmpty!15912 mapRes!15912))

(declare-fun b!388080 () Bool)

(declare-fun res!221895 () Bool)

(assert (=> b!388080 (=> (not res!221895) (not e!235172))))

(assert (=> b!388080 (= res!221895 (and (= (size!11324 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11325 _keys!658) (size!11324 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!15912 () Bool)

(declare-fun tp!31431 () Bool)

(assert (=> mapNonEmpty!15912 (= mapRes!15912 (and tp!31431 e!235175))))

(declare-fun mapValue!15912 () ValueCell!4439)

(declare-fun mapRest!15912 () (Array (_ BitVec 32) ValueCell!4439))

(declare-fun mapKey!15912 () (_ BitVec 32))

(assert (=> mapNonEmpty!15912 (= (arr!10972 _values!506) (store mapRest!15912 mapKey!15912 mapValue!15912))))

(declare-fun b!388081 () Bool)

(declare-fun res!221898 () Bool)

(assert (=> b!388081 (=> (not res!221898) (not e!235172))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!388081 (= res!221898 (validKeyInArray!0 k0!778))))

(assert (= (and start!37776 res!221896) b!388080))

(assert (= (and b!388080 res!221895) b!388078))

(assert (= (and b!388078 res!221903) b!388071))

(assert (= (and b!388071 res!221899) b!388073))

(assert (= (and b!388073 res!221897) b!388081))

(assert (= (and b!388081 res!221898) b!388074))

(assert (= (and b!388074 res!221901) b!388075))

(assert (= (and b!388075 res!221894) b!388076))

(assert (= (and b!388076 res!221902) b!388072))

(assert (= (and b!388072 res!221900) b!388070))

(assert (= (and b!388069 condMapEmpty!15912) mapIsEmpty!15912))

(assert (= (and b!388069 (not condMapEmpty!15912)) mapNonEmpty!15912))

(get-info :version)

(assert (= (and mapNonEmpty!15912 ((_ is ValueCellFull!4439) mapValue!15912)) b!388077))

(assert (= (and b!388069 ((_ is ValueCellFull!4439) mapDefault!15912)) b!388079))

(assert (= start!37776 b!388069))

(declare-fun m!384317 () Bool)

(assert (=> b!388075 m!384317))

(declare-fun m!384319 () Bool)

(assert (=> b!388070 m!384319))

(declare-fun m!384321 () Bool)

(assert (=> b!388070 m!384321))

(declare-fun m!384323 () Bool)

(assert (=> b!388070 m!384323))

(declare-fun m!384325 () Bool)

(assert (=> b!388070 m!384325))

(declare-fun m!384327 () Bool)

(assert (=> b!388070 m!384327))

(declare-fun m!384329 () Bool)

(assert (=> start!37776 m!384329))

(declare-fun m!384331 () Bool)

(assert (=> start!37776 m!384331))

(declare-fun m!384333 () Bool)

(assert (=> start!37776 m!384333))

(declare-fun m!384335 () Bool)

(assert (=> b!388076 m!384335))

(declare-fun m!384337 () Bool)

(assert (=> b!388076 m!384337))

(declare-fun m!384339 () Bool)

(assert (=> b!388074 m!384339))

(declare-fun m!384341 () Bool)

(assert (=> b!388081 m!384341))

(declare-fun m!384343 () Bool)

(assert (=> mapNonEmpty!15912 m!384343))

(declare-fun m!384345 () Bool)

(assert (=> b!388071 m!384345))

(declare-fun m!384347 () Bool)

(assert (=> b!388072 m!384347))

(declare-fun m!384349 () Bool)

(assert (=> b!388078 m!384349))

(check-sat tp_is_empty!9565 b_and!16149 (not b!388070) (not b!388076) (not b!388071) (not start!37776) (not b_next!8893) (not mapNonEmpty!15912) (not b!388081) (not b!388075) (not b!388078) (not b!388072))
(check-sat b_and!16149 (not b_next!8893))
