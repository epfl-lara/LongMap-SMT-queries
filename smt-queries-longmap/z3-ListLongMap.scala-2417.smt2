; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38216 () Bool)

(assert start!38216)

(declare-fun b_free!9067 () Bool)

(declare-fun b_next!9067 () Bool)

(assert (=> start!38216 (= b_free!9067 (not b_next!9067))))

(declare-fun tp!31988 () Bool)

(declare-fun b_and!16467 () Bool)

(assert (=> start!38216 (= tp!31988 b_and!16467)))

(declare-fun b!394316 () Bool)

(declare-fun e!238692 () Bool)

(declare-fun e!238695 () Bool)

(declare-fun mapRes!16209 () Bool)

(assert (=> b!394316 (= e!238692 (and e!238695 mapRes!16209))))

(declare-fun condMapEmpty!16209 () Bool)

(declare-datatypes ((V!14091 0))(
  ( (V!14092 (val!4914 Int)) )
))
(declare-datatypes ((ValueCell!4526 0))(
  ( (ValueCellFull!4526 (v!7160 V!14091)) (EmptyCell!4526) )
))
(declare-datatypes ((array!23376 0))(
  ( (array!23377 (arr!11144 (Array (_ BitVec 32) ValueCell!4526)) (size!11496 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23376)

(declare-fun mapDefault!16209 () ValueCell!4526)

(assert (=> b!394316 (= condMapEmpty!16209 (= (arr!11144 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4526)) mapDefault!16209)))))

(declare-fun b!394317 () Bool)

(declare-fun tp_is_empty!9739 () Bool)

(assert (=> b!394317 (= e!238695 tp_is_empty!9739)))

(declare-fun mapNonEmpty!16209 () Bool)

(declare-fun tp!31989 () Bool)

(declare-fun e!238693 () Bool)

(assert (=> mapNonEmpty!16209 (= mapRes!16209 (and tp!31989 e!238693))))

(declare-fun mapRest!16209 () (Array (_ BitVec 32) ValueCell!4526))

(declare-fun mapKey!16209 () (_ BitVec 32))

(declare-fun mapValue!16209 () ValueCell!4526)

(assert (=> mapNonEmpty!16209 (= (arr!11144 _values!506) (store mapRest!16209 mapKey!16209 mapValue!16209))))

(declare-fun b!394318 () Bool)

(declare-fun e!238694 () Bool)

(declare-fun e!238691 () Bool)

(assert (=> b!394318 (= e!238694 e!238691)))

(declare-fun res!226022 () Bool)

(assert (=> b!394318 (=> (not res!226022) (not e!238691))))

(declare-datatypes ((array!23378 0))(
  ( (array!23379 (arr!11145 (Array (_ BitVec 32) (_ BitVec 64))) (size!11497 (_ BitVec 32))) )
))
(declare-fun lt!186883 () array!23378)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23378 (_ BitVec 32)) Bool)

(assert (=> b!394318 (= res!226022 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!186883 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun _keys!658 () array!23378)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!394318 (= lt!186883 (array!23379 (store (arr!11145 _keys!658) i!548 k0!778) (size!11497 _keys!658)))))

(declare-fun res!226024 () Bool)

(assert (=> start!38216 (=> (not res!226024) (not e!238694))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38216 (= res!226024 (validMask!0 mask!970))))

(assert (=> start!38216 e!238694))

(declare-fun array_inv!8238 (array!23376) Bool)

(assert (=> start!38216 (and (array_inv!8238 _values!506) e!238692)))

(assert (=> start!38216 tp!31988))

(assert (=> start!38216 true))

(assert (=> start!38216 tp_is_empty!9739))

(declare-fun array_inv!8239 (array!23378) Bool)

(assert (=> start!38216 (array_inv!8239 _keys!658)))

(declare-fun b!394319 () Bool)

(declare-fun res!226018 () Bool)

(assert (=> b!394319 (=> (not res!226018) (not e!238694))))

(assert (=> b!394319 (= res!226018 (or (= (select (arr!11145 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11145 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!394320 () Bool)

(declare-fun res!226014 () Bool)

(assert (=> b!394320 (=> (not res!226014) (not e!238691))))

(declare-datatypes ((List!6351 0))(
  ( (Nil!6348) (Cons!6347 (h!7203 (_ BitVec 64)) (t!11517 List!6351)) )
))
(declare-fun arrayNoDuplicates!0 (array!23378 (_ BitVec 32) List!6351) Bool)

(assert (=> b!394320 (= res!226014 (arrayNoDuplicates!0 lt!186883 #b00000000000000000000000000000000 Nil!6348))))

(declare-fun b!394321 () Bool)

(declare-fun e!238696 () Bool)

(assert (=> b!394321 (= e!238691 (not e!238696))))

(declare-fun res!226019 () Bool)

(assert (=> b!394321 (=> res!226019 e!238696)))

(declare-fun lt!186878 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!394321 (= res!226019 (or (and (not lt!186878) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!186878) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!186878)))))

(assert (=> b!394321 (= lt!186878 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun zeroValue!472 () V!14091)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6502 0))(
  ( (tuple2!6503 (_1!3262 (_ BitVec 64)) (_2!3262 V!14091)) )
))
(declare-datatypes ((List!6352 0))(
  ( (Nil!6349) (Cons!6348 (h!7204 tuple2!6502) (t!11518 List!6352)) )
))
(declare-datatypes ((ListLongMap!5417 0))(
  ( (ListLongMap!5418 (toList!2724 List!6352)) )
))
(declare-fun lt!186877 () ListLongMap!5417)

(declare-fun minValue!472 () V!14091)

(declare-fun getCurrentListMap!2096 (array!23378 array!23376 (_ BitVec 32) (_ BitVec 32) V!14091 V!14091 (_ BitVec 32) Int) ListLongMap!5417)

(assert (=> b!394321 (= lt!186877 (getCurrentListMap!2096 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186879 () array!23376)

(declare-fun lt!186885 () ListLongMap!5417)

(assert (=> b!394321 (= lt!186885 (getCurrentListMap!2096 lt!186883 lt!186879 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!186882 () ListLongMap!5417)

(declare-fun lt!186881 () ListLongMap!5417)

(assert (=> b!394321 (and (= lt!186882 lt!186881) (= lt!186881 lt!186882))))

(declare-fun lt!186884 () ListLongMap!5417)

(declare-fun lt!186880 () tuple2!6502)

(declare-fun +!1078 (ListLongMap!5417 tuple2!6502) ListLongMap!5417)

(assert (=> b!394321 (= lt!186881 (+!1078 lt!186884 lt!186880))))

(declare-fun v!373 () V!14091)

(assert (=> b!394321 (= lt!186880 (tuple2!6503 k0!778 v!373))))

(declare-datatypes ((Unit!12025 0))(
  ( (Unit!12026) )
))
(declare-fun lt!186886 () Unit!12025)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!287 (array!23378 array!23376 (_ BitVec 32) (_ BitVec 32) V!14091 V!14091 (_ BitVec 32) (_ BitVec 64) V!14091 (_ BitVec 32) Int) Unit!12025)

(assert (=> b!394321 (= lt!186886 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!287 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!985 (array!23378 array!23376 (_ BitVec 32) (_ BitVec 32) V!14091 V!14091 (_ BitVec 32) Int) ListLongMap!5417)

(assert (=> b!394321 (= lt!186882 (getCurrentListMapNoExtraKeys!985 lt!186883 lt!186879 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!394321 (= lt!186879 (array!23377 (store (arr!11144 _values!506) i!548 (ValueCellFull!4526 v!373)) (size!11496 _values!506)))))

(assert (=> b!394321 (= lt!186884 (getCurrentListMapNoExtraKeys!985 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!394322 () Bool)

(declare-fun e!238697 () Bool)

(assert (=> b!394322 (= e!238696 e!238697)))

(declare-fun res!226016 () Bool)

(assert (=> b!394322 (=> res!226016 e!238697)))

(assert (=> b!394322 (= res!226016 (not (= (+!1078 lt!186877 lt!186880) lt!186885)))))

(assert (=> b!394322 (= lt!186885 lt!186882)))

(declare-fun b!394323 () Bool)

(declare-fun res!226015 () Bool)

(assert (=> b!394323 (=> (not res!226015) (not e!238694))))

(assert (=> b!394323 (= res!226015 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!394324 () Bool)

(declare-fun res!226017 () Bool)

(assert (=> b!394324 (=> (not res!226017) (not e!238694))))

(declare-fun arrayContainsKey!0 (array!23378 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!394324 (= res!226017 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!394325 () Bool)

(declare-fun res!226023 () Bool)

(assert (=> b!394325 (=> (not res!226023) (not e!238694))))

(assert (=> b!394325 (= res!226023 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6348))))

(declare-fun b!394326 () Bool)

(declare-fun res!226021 () Bool)

(assert (=> b!394326 (=> (not res!226021) (not e!238694))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!394326 (= res!226021 (validKeyInArray!0 k0!778))))

(declare-fun b!394327 () Bool)

(declare-fun res!226020 () Bool)

(assert (=> b!394327 (=> (not res!226020) (not e!238694))))

(assert (=> b!394327 (= res!226020 (and (= (size!11496 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11497 _keys!658) (size!11496 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!394328 () Bool)

(assert (=> b!394328 (= e!238693 tp_is_empty!9739)))

(declare-fun b!394329 () Bool)

(declare-fun res!226025 () Bool)

(assert (=> b!394329 (=> (not res!226025) (not e!238694))))

(assert (=> b!394329 (= res!226025 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11497 _keys!658))))))

(declare-fun mapIsEmpty!16209 () Bool)

(assert (=> mapIsEmpty!16209 mapRes!16209))

(declare-fun b!394330 () Bool)

(assert (=> b!394330 (= e!238697 (bvslt i!548 (size!11496 _values!506)))))

(assert (= (and start!38216 res!226024) b!394327))

(assert (= (and b!394327 res!226020) b!394323))

(assert (= (and b!394323 res!226015) b!394325))

(assert (= (and b!394325 res!226023) b!394329))

(assert (= (and b!394329 res!226025) b!394326))

(assert (= (and b!394326 res!226021) b!394319))

(assert (= (and b!394319 res!226018) b!394324))

(assert (= (and b!394324 res!226017) b!394318))

(assert (= (and b!394318 res!226022) b!394320))

(assert (= (and b!394320 res!226014) b!394321))

(assert (= (and b!394321 (not res!226019)) b!394322))

(assert (= (and b!394322 (not res!226016)) b!394330))

(assert (= (and b!394316 condMapEmpty!16209) mapIsEmpty!16209))

(assert (= (and b!394316 (not condMapEmpty!16209)) mapNonEmpty!16209))

(get-info :version)

(assert (= (and mapNonEmpty!16209 ((_ is ValueCellFull!4526) mapValue!16209)) b!394328))

(assert (= (and b!394316 ((_ is ValueCellFull!4526) mapDefault!16209)) b!394317))

(assert (= start!38216 b!394316))

(declare-fun m!391029 () Bool)

(assert (=> b!394325 m!391029))

(declare-fun m!391031 () Bool)

(assert (=> b!394326 m!391031))

(declare-fun m!391033 () Bool)

(assert (=> b!394318 m!391033))

(declare-fun m!391035 () Bool)

(assert (=> b!394318 m!391035))

(declare-fun m!391037 () Bool)

(assert (=> b!394322 m!391037))

(declare-fun m!391039 () Bool)

(assert (=> b!394321 m!391039))

(declare-fun m!391041 () Bool)

(assert (=> b!394321 m!391041))

(declare-fun m!391043 () Bool)

(assert (=> b!394321 m!391043))

(declare-fun m!391045 () Bool)

(assert (=> b!394321 m!391045))

(declare-fun m!391047 () Bool)

(assert (=> b!394321 m!391047))

(declare-fun m!391049 () Bool)

(assert (=> b!394321 m!391049))

(declare-fun m!391051 () Bool)

(assert (=> b!394321 m!391051))

(declare-fun m!391053 () Bool)

(assert (=> b!394323 m!391053))

(declare-fun m!391055 () Bool)

(assert (=> start!38216 m!391055))

(declare-fun m!391057 () Bool)

(assert (=> start!38216 m!391057))

(declare-fun m!391059 () Bool)

(assert (=> start!38216 m!391059))

(declare-fun m!391061 () Bool)

(assert (=> b!394324 m!391061))

(declare-fun m!391063 () Bool)

(assert (=> mapNonEmpty!16209 m!391063))

(declare-fun m!391065 () Bool)

(assert (=> b!394320 m!391065))

(declare-fun m!391067 () Bool)

(assert (=> b!394319 m!391067))

(check-sat (not b!394324) (not b!394322) (not mapNonEmpty!16209) b_and!16467 (not b_next!9067) (not b!394325) tp_is_empty!9739 (not b!394321) (not b!394318) (not b!394320) (not start!38216) (not b!394326) (not b!394323))
(check-sat b_and!16467 (not b_next!9067))
