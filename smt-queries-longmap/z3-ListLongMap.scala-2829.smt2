; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!40940 () Bool)

(assert start!40940)

(declare-fun b_free!10875 () Bool)

(declare-fun b_next!10875 () Bool)

(assert (=> start!40940 (= b_free!10875 (not b_next!10875))))

(declare-fun tp!38451 () Bool)

(declare-fun b_and!19017 () Bool)

(assert (=> start!40940 (= tp!38451 b_and!19017)))

(declare-fun b!455313 () Bool)

(declare-fun res!271466 () Bool)

(declare-fun e!266231 () Bool)

(assert (=> b!455313 (=> (not res!271466) (not e!266231))))

(declare-datatypes ((array!28229 0))(
  ( (array!28230 (arr!13558 (Array (_ BitVec 32) (_ BitVec 64))) (size!13910 (_ BitVec 32))) )
))
(declare-fun lt!206311 () array!28229)

(declare-datatypes ((List!8170 0))(
  ( (Nil!8167) (Cons!8166 (h!9022 (_ BitVec 64)) (t!13998 List!8170)) )
))
(declare-fun arrayNoDuplicates!0 (array!28229 (_ BitVec 32) List!8170) Bool)

(assert (=> b!455313 (= res!271466 (arrayNoDuplicates!0 lt!206311 #b00000000000000000000000000000000 Nil!8167))))

(declare-fun b!455314 () Bool)

(assert (=> b!455314 (= e!266231 false)))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun defaultEntry!557 () Int)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!17389 0))(
  ( (V!17390 (val!6151 Int)) )
))
(declare-datatypes ((ValueCell!5763 0))(
  ( (ValueCellFull!5763 (v!8417 V!17389)) (EmptyCell!5763) )
))
(declare-datatypes ((array!28231 0))(
  ( (array!28232 (arr!13559 (Array (_ BitVec 32) ValueCell!5763)) (size!13911 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28231)

(declare-fun zeroValue!515 () V!17389)

(declare-fun i!563 () (_ BitVec 32))

(declare-fun v!412 () V!17389)

(declare-datatypes ((tuple2!8106 0))(
  ( (tuple2!8107 (_1!4064 (_ BitVec 64)) (_2!4064 V!17389)) )
))
(declare-datatypes ((List!8171 0))(
  ( (Nil!8168) (Cons!8167 (h!9023 tuple2!8106) (t!13999 List!8171)) )
))
(declare-datatypes ((ListLongMap!7019 0))(
  ( (ListLongMap!7020 (toList!3525 List!8171)) )
))
(declare-fun lt!206312 () ListLongMap!7019)

(declare-fun minValue!515 () V!17389)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!1708 (array!28229 array!28231 (_ BitVec 32) (_ BitVec 32) V!17389 V!17389 (_ BitVec 32) Int) ListLongMap!7019)

(assert (=> b!455314 (= lt!206312 (getCurrentListMapNoExtraKeys!1708 lt!206311 (array!28232 (store (arr!13559 _values!549) i!563 (ValueCellFull!5763 v!412)) (size!13911 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!206310 () ListLongMap!7019)

(declare-fun _keys!709 () array!28229)

(assert (=> b!455314 (= lt!206310 (getCurrentListMapNoExtraKeys!1708 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!455315 () Bool)

(declare-fun res!271464 () Bool)

(declare-fun e!266229 () Bool)

(assert (=> b!455315 (=> (not res!271464) (not e!266229))))

(assert (=> b!455315 (= res!271464 (or (= (select (arr!13558 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!13558 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!455316 () Bool)

(declare-fun res!271465 () Bool)

(assert (=> b!455316 (=> (not res!271465) (not e!266229))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!455316 (= res!271465 (validKeyInArray!0 k0!794))))

(declare-fun b!455317 () Bool)

(declare-fun e!266230 () Bool)

(declare-fun e!266228 () Bool)

(declare-fun mapRes!19960 () Bool)

(assert (=> b!455317 (= e!266230 (and e!266228 mapRes!19960))))

(declare-fun condMapEmpty!19960 () Bool)

(declare-fun mapDefault!19960 () ValueCell!5763)

(assert (=> b!455317 (= condMapEmpty!19960 (= (arr!13559 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5763)) mapDefault!19960)))))

(declare-fun b!455318 () Bool)

(declare-fun res!271472 () Bool)

(assert (=> b!455318 (=> (not res!271472) (not e!266229))))

(declare-fun arrayContainsKey!0 (array!28229 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!455318 (= res!271472 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!455319 () Bool)

(declare-fun res!271473 () Bool)

(assert (=> b!455319 (=> (not res!271473) (not e!266231))))

(assert (=> b!455319 (= res!271473 (bvsle from!863 i!563))))

(declare-fun b!455320 () Bool)

(declare-fun res!271467 () Bool)

(assert (=> b!455320 (=> (not res!271467) (not e!266229))))

(assert (=> b!455320 (= res!271467 (and (= (size!13911 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!13910 _keys!709) (size!13911 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!455312 () Bool)

(assert (=> b!455312 (= e!266229 e!266231)))

(declare-fun res!271469 () Bool)

(assert (=> b!455312 (=> (not res!271469) (not e!266231))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28229 (_ BitVec 32)) Bool)

(assert (=> b!455312 (= res!271469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!206311 mask!1025))))

(assert (=> b!455312 (= lt!206311 (array!28230 (store (arr!13558 _keys!709) i!563 k0!794) (size!13910 _keys!709)))))

(declare-fun res!271470 () Bool)

(assert (=> start!40940 (=> (not res!271470) (not e!266229))))

(assert (=> start!40940 (= res!271470 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13910 _keys!709))))))

(assert (=> start!40940 e!266229))

(declare-fun tp_is_empty!12213 () Bool)

(assert (=> start!40940 tp_is_empty!12213))

(assert (=> start!40940 tp!38451))

(assert (=> start!40940 true))

(declare-fun array_inv!9822 (array!28231) Bool)

(assert (=> start!40940 (and (array_inv!9822 _values!549) e!266230)))

(declare-fun array_inv!9823 (array!28229) Bool)

(assert (=> start!40940 (array_inv!9823 _keys!709)))

(declare-fun b!455321 () Bool)

(declare-fun res!271471 () Bool)

(assert (=> b!455321 (=> (not res!271471) (not e!266229))))

(assert (=> b!455321 (= res!271471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!455322 () Bool)

(assert (=> b!455322 (= e!266228 tp_is_empty!12213)))

(declare-fun b!455323 () Bool)

(declare-fun res!271468 () Bool)

(assert (=> b!455323 (=> (not res!271468) (not e!266229))))

(assert (=> b!455323 (= res!271468 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!13910 _keys!709))))))

(declare-fun b!455324 () Bool)

(declare-fun res!271475 () Bool)

(assert (=> b!455324 (=> (not res!271475) (not e!266229))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!455324 (= res!271475 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!19960 () Bool)

(assert (=> mapIsEmpty!19960 mapRes!19960))

(declare-fun b!455325 () Bool)

(declare-fun e!266232 () Bool)

(assert (=> b!455325 (= e!266232 tp_is_empty!12213)))

(declare-fun mapNonEmpty!19960 () Bool)

(declare-fun tp!38452 () Bool)

(assert (=> mapNonEmpty!19960 (= mapRes!19960 (and tp!38452 e!266232))))

(declare-fun mapValue!19960 () ValueCell!5763)

(declare-fun mapKey!19960 () (_ BitVec 32))

(declare-fun mapRest!19960 () (Array (_ BitVec 32) ValueCell!5763))

(assert (=> mapNonEmpty!19960 (= (arr!13559 _values!549) (store mapRest!19960 mapKey!19960 mapValue!19960))))

(declare-fun b!455326 () Bool)

(declare-fun res!271474 () Bool)

(assert (=> b!455326 (=> (not res!271474) (not e!266229))))

(assert (=> b!455326 (= res!271474 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8167))))

(assert (= (and start!40940 res!271470) b!455324))

(assert (= (and b!455324 res!271475) b!455320))

(assert (= (and b!455320 res!271467) b!455321))

(assert (= (and b!455321 res!271471) b!455326))

(assert (= (and b!455326 res!271474) b!455323))

(assert (= (and b!455323 res!271468) b!455316))

(assert (= (and b!455316 res!271465) b!455315))

(assert (= (and b!455315 res!271464) b!455318))

(assert (= (and b!455318 res!271472) b!455312))

(assert (= (and b!455312 res!271469) b!455313))

(assert (= (and b!455313 res!271466) b!455319))

(assert (= (and b!455319 res!271473) b!455314))

(assert (= (and b!455317 condMapEmpty!19960) mapIsEmpty!19960))

(assert (= (and b!455317 (not condMapEmpty!19960)) mapNonEmpty!19960))

(get-info :version)

(assert (= (and mapNonEmpty!19960 ((_ is ValueCellFull!5763) mapValue!19960)) b!455325))

(assert (= (and b!455317 ((_ is ValueCellFull!5763) mapDefault!19960)) b!455322))

(assert (= start!40940 b!455317))

(declare-fun m!439141 () Bool)

(assert (=> mapNonEmpty!19960 m!439141))

(declare-fun m!439143 () Bool)

(assert (=> b!455318 m!439143))

(declare-fun m!439145 () Bool)

(assert (=> b!455324 m!439145))

(declare-fun m!439147 () Bool)

(assert (=> b!455326 m!439147))

(declare-fun m!439149 () Bool)

(assert (=> b!455312 m!439149))

(declare-fun m!439151 () Bool)

(assert (=> b!455312 m!439151))

(declare-fun m!439153 () Bool)

(assert (=> b!455314 m!439153))

(declare-fun m!439155 () Bool)

(assert (=> b!455314 m!439155))

(declare-fun m!439157 () Bool)

(assert (=> b!455314 m!439157))

(declare-fun m!439159 () Bool)

(assert (=> b!455321 m!439159))

(declare-fun m!439161 () Bool)

(assert (=> start!40940 m!439161))

(declare-fun m!439163 () Bool)

(assert (=> start!40940 m!439163))

(declare-fun m!439165 () Bool)

(assert (=> b!455313 m!439165))

(declare-fun m!439167 () Bool)

(assert (=> b!455316 m!439167))

(declare-fun m!439169 () Bool)

(assert (=> b!455315 m!439169))

(check-sat (not b!455318) b_and!19017 (not b!455316) (not b!455321) (not b!455324) (not b!455313) tp_is_empty!12213 (not b_next!10875) (not mapNonEmpty!19960) (not b!455314) (not start!40940) (not b!455312) (not b!455326))
(check-sat b_and!19017 (not b_next!10875))
