; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97672 () Bool)

(assert start!97672)

(declare-fun mapNonEmpty!43672 () Bool)

(declare-fun mapRes!43672 () Bool)

(declare-fun tp!82916 () Bool)

(declare-fun e!636050 () Bool)

(assert (=> mapNonEmpty!43672 (= mapRes!43672 (and tp!82916 e!636050))))

(declare-datatypes ((V!42331 0))(
  ( (V!42332 (val!14008 Int)) )
))
(declare-datatypes ((ValueCell!13242 0))(
  ( (ValueCellFull!13242 (v!16641 V!42331)) (EmptyCell!13242) )
))
(declare-fun mapValue!43672 () ValueCell!13242)

(declare-fun mapRest!43672 () (Array (_ BitVec 32) ValueCell!13242))

(declare-fun mapKey!43672 () (_ BitVec 32))

(declare-datatypes ((array!72703 0))(
  ( (array!72704 (arr!35004 (Array (_ BitVec 32) ValueCell!13242)) (size!35540 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72703)

(assert (=> mapNonEmpty!43672 (= (arr!35004 _values!996) (store mapRest!43672 mapKey!43672 mapValue!43672))))

(declare-fun b!1116342 () Bool)

(declare-fun res!745372 () Bool)

(declare-fun e!636049 () Bool)

(assert (=> b!1116342 (=> (not res!745372) (not e!636049))))

(declare-datatypes ((array!72705 0))(
  ( (array!72706 (arr!35005 (Array (_ BitVec 32) (_ BitVec 64))) (size!35541 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72705)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1116342 (= res!745372 (= (select (arr!35005 _keys!1208) i!673) k0!934))))

(declare-fun b!1116343 () Bool)

(declare-fun res!745369 () Bool)

(assert (=> b!1116343 (=> (not res!745369) (not e!636049))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72705 (_ BitVec 32)) Bool)

(assert (=> b!1116343 (= res!745369 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapIsEmpty!43672 () Bool)

(assert (=> mapIsEmpty!43672 mapRes!43672))

(declare-fun b!1116344 () Bool)

(declare-fun res!745366 () Bool)

(assert (=> b!1116344 (=> (not res!745366) (not e!636049))))

(declare-datatypes ((List!24365 0))(
  ( (Nil!24362) (Cons!24361 (h!25570 (_ BitVec 64)) (t!34846 List!24365)) )
))
(declare-fun arrayNoDuplicates!0 (array!72705 (_ BitVec 32) List!24365) Bool)

(assert (=> b!1116344 (= res!745366 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24362))))

(declare-fun b!1116345 () Bool)

(declare-fun res!745370 () Bool)

(assert (=> b!1116345 (=> (not res!745370) (not e!636049))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1116345 (= res!745370 (and (= (size!35540 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35541 _keys!1208) (size!35540 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1116346 () Bool)

(declare-fun res!745367 () Bool)

(assert (=> b!1116346 (=> (not res!745367) (not e!636049))))

(assert (=> b!1116346 (= res!745367 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35541 _keys!1208))))))

(declare-fun b!1116347 () Bool)

(declare-fun res!745363 () Bool)

(declare-fun e!636047 () Bool)

(assert (=> b!1116347 (=> (not res!745363) (not e!636047))))

(declare-fun lt!497120 () array!72705)

(assert (=> b!1116347 (= res!745363 (arrayNoDuplicates!0 lt!497120 #b00000000000000000000000000000000 Nil!24362))))

(declare-fun b!1116348 () Bool)

(assert (=> b!1116348 (= e!636047 (not true))))

(declare-fun arrayContainsKey!0 (array!72705 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1116348 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36638 0))(
  ( (Unit!36639) )
))
(declare-fun lt!497119 () Unit!36638)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72705 (_ BitVec 64) (_ BitVec 32)) Unit!36638)

(assert (=> b!1116348 (= lt!497119 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1116349 () Bool)

(declare-fun tp_is_empty!27903 () Bool)

(assert (=> b!1116349 (= e!636050 tp_is_empty!27903)))

(declare-fun b!1116350 () Bool)

(declare-fun res!745364 () Bool)

(assert (=> b!1116350 (=> (not res!745364) (not e!636049))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1116350 (= res!745364 (validKeyInArray!0 k0!934))))

(declare-fun res!745371 () Bool)

(assert (=> start!97672 (=> (not res!745371) (not e!636049))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97672 (= res!745371 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35541 _keys!1208))))))

(assert (=> start!97672 e!636049))

(declare-fun array_inv!26902 (array!72705) Bool)

(assert (=> start!97672 (array_inv!26902 _keys!1208)))

(assert (=> start!97672 true))

(declare-fun e!636051 () Bool)

(declare-fun array_inv!26903 (array!72703) Bool)

(assert (=> start!97672 (and (array_inv!26903 _values!996) e!636051)))

(declare-fun b!1116351 () Bool)

(assert (=> b!1116351 (= e!636049 e!636047)))

(declare-fun res!745368 () Bool)

(assert (=> b!1116351 (=> (not res!745368) (not e!636047))))

(assert (=> b!1116351 (= res!745368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!497120 mask!1564))))

(assert (=> b!1116351 (= lt!497120 (array!72706 (store (arr!35005 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35541 _keys!1208)))))

(declare-fun b!1116352 () Bool)

(declare-fun e!636046 () Bool)

(assert (=> b!1116352 (= e!636046 tp_is_empty!27903)))

(declare-fun b!1116353 () Bool)

(declare-fun res!745365 () Bool)

(assert (=> b!1116353 (=> (not res!745365) (not e!636049))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1116353 (= res!745365 (validMask!0 mask!1564))))

(declare-fun b!1116354 () Bool)

(assert (=> b!1116354 (= e!636051 (and e!636046 mapRes!43672))))

(declare-fun condMapEmpty!43672 () Bool)

(declare-fun mapDefault!43672 () ValueCell!13242)

(assert (=> b!1116354 (= condMapEmpty!43672 (= (arr!35004 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13242)) mapDefault!43672)))))

(assert (= (and start!97672 res!745371) b!1116353))

(assert (= (and b!1116353 res!745365) b!1116345))

(assert (= (and b!1116345 res!745370) b!1116343))

(assert (= (and b!1116343 res!745369) b!1116344))

(assert (= (and b!1116344 res!745366) b!1116346))

(assert (= (and b!1116346 res!745367) b!1116350))

(assert (= (and b!1116350 res!745364) b!1116342))

(assert (= (and b!1116342 res!745372) b!1116351))

(assert (= (and b!1116351 res!745368) b!1116347))

(assert (= (and b!1116347 res!745363) b!1116348))

(assert (= (and b!1116354 condMapEmpty!43672) mapIsEmpty!43672))

(assert (= (and b!1116354 (not condMapEmpty!43672)) mapNonEmpty!43672))

(get-info :version)

(assert (= (and mapNonEmpty!43672 ((_ is ValueCellFull!13242) mapValue!43672)) b!1116349))

(assert (= (and b!1116354 ((_ is ValueCellFull!13242) mapDefault!43672)) b!1116352))

(assert (= start!97672 b!1116354))

(declare-fun m!1032583 () Bool)

(assert (=> start!97672 m!1032583))

(declare-fun m!1032585 () Bool)

(assert (=> start!97672 m!1032585))

(declare-fun m!1032587 () Bool)

(assert (=> b!1116353 m!1032587))

(declare-fun m!1032589 () Bool)

(assert (=> b!1116342 m!1032589))

(declare-fun m!1032591 () Bool)

(assert (=> b!1116347 m!1032591))

(declare-fun m!1032593 () Bool)

(assert (=> b!1116344 m!1032593))

(declare-fun m!1032595 () Bool)

(assert (=> b!1116350 m!1032595))

(declare-fun m!1032597 () Bool)

(assert (=> b!1116348 m!1032597))

(declare-fun m!1032599 () Bool)

(assert (=> b!1116348 m!1032599))

(declare-fun m!1032601 () Bool)

(assert (=> b!1116351 m!1032601))

(declare-fun m!1032603 () Bool)

(assert (=> b!1116351 m!1032603))

(declare-fun m!1032605 () Bool)

(assert (=> mapNonEmpty!43672 m!1032605))

(declare-fun m!1032607 () Bool)

(assert (=> b!1116343 m!1032607))

(check-sat tp_is_empty!27903 (not b!1116353) (not b!1116351) (not b!1116347) (not mapNonEmpty!43672) (not start!97672) (not b!1116348) (not b!1116343) (not b!1116344) (not b!1116350))
(check-sat)
