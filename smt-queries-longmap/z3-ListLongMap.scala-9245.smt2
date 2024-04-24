; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111042 () Bool)

(assert start!111042)

(declare-fun b_free!29653 () Bool)

(declare-fun b_next!29653 () Bool)

(assert (=> start!111042 (= b_free!29653 (not b_next!29653))))

(declare-fun tp!104280 () Bool)

(declare-fun b_and!47863 () Bool)

(assert (=> start!111042 (= tp!104280 b_and!47863)))

(declare-fun b!1312966 () Bool)

(declare-fun res!871297 () Bool)

(declare-fun e!749103 () Bool)

(assert (=> b!1312966 (=> (not res!871297) (not e!749103))))

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1312966 (= res!871297 (and (not (= (bvand extraKeys!1275 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1275 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun res!871298 () Bool)

(assert (=> start!111042 (=> (not res!871298) (not e!749103))))

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111042 (= res!871298 (validMask!0 mask!2040))))

(assert (=> start!111042 e!749103))

(assert (=> start!111042 tp!104280))

(declare-datatypes ((array!87803 0))(
  ( (array!87804 (arr!42377 (Array (_ BitVec 32) (_ BitVec 64))) (size!42928 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87803)

(declare-fun array_inv!32281 (array!87803) Bool)

(assert (=> start!111042 (array_inv!32281 _keys!1628)))

(assert (=> start!111042 true))

(declare-fun tp_is_empty!35383 () Bool)

(assert (=> start!111042 tp_is_empty!35383))

(declare-datatypes ((V!52281 0))(
  ( (V!52282 (val!17766 Int)) )
))
(declare-datatypes ((ValueCell!16793 0))(
  ( (ValueCellFull!16793 (v!20388 V!52281)) (EmptyCell!16793) )
))
(declare-datatypes ((array!87805 0))(
  ( (array!87806 (arr!42378 (Array (_ BitVec 32) ValueCell!16793)) (size!42929 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87805)

(declare-fun e!749101 () Bool)

(declare-fun array_inv!32282 (array!87805) Bool)

(assert (=> start!111042 (and (array_inv!32282 _values!1354) e!749101)))

(declare-fun b!1312967 () Bool)

(declare-fun res!871296 () Bool)

(assert (=> b!1312967 (=> (not res!871296) (not e!749103))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52281)

(declare-fun zeroValue!1296 () V!52281)

(declare-fun from!2020 () (_ BitVec 32))

(declare-fun defaultEntry!1357 () Int)

(declare-datatypes ((tuple2!22928 0))(
  ( (tuple2!22929 (_1!11475 (_ BitVec 64)) (_2!11475 V!52281)) )
))
(declare-datatypes ((List!30083 0))(
  ( (Nil!30080) (Cons!30079 (h!31297 tuple2!22928) (t!43681 List!30083)) )
))
(declare-datatypes ((ListLongMap!20593 0))(
  ( (ListLongMap!20594 (toList!10312 List!30083)) )
))
(declare-fun contains!8474 (ListLongMap!20593 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5316 (array!87803 array!87805 (_ BitVec 32) (_ BitVec 32) V!52281 V!52281 (_ BitVec 32) Int) ListLongMap!20593)

(assert (=> b!1312967 (= res!871296 (contains!8474 (getCurrentListMap!5316 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun mapIsEmpty!54703 () Bool)

(declare-fun mapRes!54703 () Bool)

(assert (=> mapIsEmpty!54703 mapRes!54703))

(declare-fun b!1312968 () Bool)

(declare-fun res!871294 () Bool)

(assert (=> b!1312968 (=> (not res!871294) (not e!749103))))

(assert (=> b!1312968 (= res!871294 (not (= (select (arr!42377 _keys!1628) from!2020) k0!1175)))))

(declare-fun b!1312969 () Bool)

(declare-fun res!871292 () Bool)

(assert (=> b!1312969 (=> (not res!871292) (not e!749103))))

(assert (=> b!1312969 (= res!871292 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42928 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1312970 () Bool)

(assert (=> b!1312970 (= e!749103 (not true))))

(assert (=> b!1312970 (contains!8474 (getCurrentListMap!5316 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 (bvadd #b00000000000000000000000000000001 from!2020) defaultEntry!1357) k0!1175)))

(declare-datatypes ((Unit!43323 0))(
  ( (Unit!43324) )
))
(declare-fun lt!585974 () Unit!43323)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!2 (array!87803 array!87805 (_ BitVec 32) (_ BitVec 32) V!52281 V!52281 (_ BitVec 64) (_ BitVec 32) Int) Unit!43323)

(assert (=> b!1312970 (= lt!585974 (lemmaInListMapFromThenFromPlsOneIfNotEqToFstXKeys!2 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 k0!1175 from!2020 defaultEntry!1357))))

(declare-fun b!1312971 () Bool)

(declare-fun res!871293 () Bool)

(assert (=> b!1312971 (=> (not res!871293) (not e!749103))))

(assert (=> b!1312971 (= res!871293 (and (= (size!42929 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42928 _keys!1628) (size!42929 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312972 () Bool)

(declare-fun res!871290 () Bool)

(assert (=> b!1312972 (=> (not res!871290) (not e!749103))))

(declare-datatypes ((List!30084 0))(
  ( (Nil!30081) (Cons!30080 (h!31298 (_ BitVec 64)) (t!43682 List!30084)) )
))
(declare-fun arrayNoDuplicates!0 (array!87803 (_ BitVec 32) List!30084) Bool)

(assert (=> b!1312972 (= res!871290 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30081))))

(declare-fun b!1312973 () Bool)

(declare-fun e!749105 () Bool)

(assert (=> b!1312973 (= e!749105 tp_is_empty!35383)))

(declare-fun b!1312974 () Bool)

(declare-fun e!749104 () Bool)

(assert (=> b!1312974 (= e!749104 tp_is_empty!35383)))

(declare-fun b!1312975 () Bool)

(assert (=> b!1312975 (= e!749101 (and e!749104 mapRes!54703))))

(declare-fun condMapEmpty!54703 () Bool)

(declare-fun mapDefault!54703 () ValueCell!16793)

(assert (=> b!1312975 (= condMapEmpty!54703 (= (arr!42378 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16793)) mapDefault!54703)))))

(declare-fun b!1312976 () Bool)

(declare-fun res!871291 () Bool)

(assert (=> b!1312976 (=> (not res!871291) (not e!749103))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1312976 (= res!871291 (validKeyInArray!0 (select (arr!42377 _keys!1628) from!2020)))))

(declare-fun b!1312977 () Bool)

(declare-fun res!871295 () Bool)

(assert (=> b!1312977 (=> (not res!871295) (not e!749103))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87803 (_ BitVec 32)) Bool)

(assert (=> b!1312977 (= res!871295 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54703 () Bool)

(declare-fun tp!104281 () Bool)

(assert (=> mapNonEmpty!54703 (= mapRes!54703 (and tp!104281 e!749105))))

(declare-fun mapKey!54703 () (_ BitVec 32))

(declare-fun mapRest!54703 () (Array (_ BitVec 32) ValueCell!16793))

(declare-fun mapValue!54703 () ValueCell!16793)

(assert (=> mapNonEmpty!54703 (= (arr!42378 _values!1354) (store mapRest!54703 mapKey!54703 mapValue!54703))))

(assert (= (and start!111042 res!871298) b!1312971))

(assert (= (and b!1312971 res!871293) b!1312977))

(assert (= (and b!1312977 res!871295) b!1312972))

(assert (= (and b!1312972 res!871290) b!1312969))

(assert (= (and b!1312969 res!871292) b!1312967))

(assert (= (and b!1312967 res!871296) b!1312968))

(assert (= (and b!1312968 res!871294) b!1312976))

(assert (= (and b!1312976 res!871291) b!1312966))

(assert (= (and b!1312966 res!871297) b!1312970))

(assert (= (and b!1312975 condMapEmpty!54703) mapIsEmpty!54703))

(assert (= (and b!1312975 (not condMapEmpty!54703)) mapNonEmpty!54703))

(get-info :version)

(assert (= (and mapNonEmpty!54703 ((_ is ValueCellFull!16793) mapValue!54703)) b!1312973))

(assert (= (and b!1312975 ((_ is ValueCellFull!16793) mapDefault!54703)) b!1312974))

(assert (= start!111042 b!1312975))

(declare-fun m!1202657 () Bool)

(assert (=> b!1312972 m!1202657))

(declare-fun m!1202659 () Bool)

(assert (=> b!1312968 m!1202659))

(declare-fun m!1202661 () Bool)

(assert (=> start!111042 m!1202661))

(declare-fun m!1202663 () Bool)

(assert (=> start!111042 m!1202663))

(declare-fun m!1202665 () Bool)

(assert (=> start!111042 m!1202665))

(declare-fun m!1202667 () Bool)

(assert (=> b!1312967 m!1202667))

(assert (=> b!1312967 m!1202667))

(declare-fun m!1202669 () Bool)

(assert (=> b!1312967 m!1202669))

(declare-fun m!1202671 () Bool)

(assert (=> mapNonEmpty!54703 m!1202671))

(declare-fun m!1202673 () Bool)

(assert (=> b!1312977 m!1202673))

(declare-fun m!1202675 () Bool)

(assert (=> b!1312970 m!1202675))

(assert (=> b!1312970 m!1202675))

(declare-fun m!1202677 () Bool)

(assert (=> b!1312970 m!1202677))

(declare-fun m!1202679 () Bool)

(assert (=> b!1312970 m!1202679))

(assert (=> b!1312976 m!1202659))

(assert (=> b!1312976 m!1202659))

(declare-fun m!1202681 () Bool)

(assert (=> b!1312976 m!1202681))

(check-sat (not b!1312977) (not b!1312967) tp_is_empty!35383 (not b!1312972) (not b_next!29653) (not b!1312976) (not start!111042) (not mapNonEmpty!54703) (not b!1312970) b_and!47863)
(check-sat b_and!47863 (not b_next!29653))
