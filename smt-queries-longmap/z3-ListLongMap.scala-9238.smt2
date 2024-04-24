; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!111000 () Bool)

(assert start!111000)

(declare-fun b_free!29611 () Bool)

(declare-fun b_next!29611 () Bool)

(assert (=> start!111000 (= b_free!29611 (not b_next!29611))))

(declare-fun tp!104154 () Bool)

(declare-fun b_and!47821 () Bool)

(assert (=> start!111000 (= tp!104154 b_and!47821)))

(declare-fun b!1312418 () Bool)

(declare-fun res!870934 () Bool)

(declare-fun e!748787 () Bool)

(assert (=> b!1312418 (=> (not res!870934) (not e!748787))))

(declare-datatypes ((array!87723 0))(
  ( (array!87724 (arr!42337 (Array (_ BitVec 32) (_ BitVec 64))) (size!42888 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87723)

(declare-datatypes ((V!52225 0))(
  ( (V!52226 (val!17745 Int)) )
))
(declare-datatypes ((ValueCell!16772 0))(
  ( (ValueCellFull!16772 (v!20367 V!52225)) (EmptyCell!16772) )
))
(declare-datatypes ((array!87725 0))(
  ( (array!87726 (arr!42338 (Array (_ BitVec 32) ValueCell!16772)) (size!42889 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87725)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(declare-fun mask!2040 () (_ BitVec 32))

(assert (=> b!1312418 (= res!870934 (and (= (size!42889 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42888 _keys!1628) (size!42889 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1312419 () Bool)

(declare-fun res!870932 () Bool)

(assert (=> b!1312419 (=> (not res!870932) (not e!748787))))

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun from!2020 () (_ BitVec 32))

(assert (=> b!1312419 (= res!870932 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42888 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapIsEmpty!54640 () Bool)

(declare-fun mapRes!54640 () Bool)

(assert (=> mapIsEmpty!54640 mapRes!54640))

(declare-fun b!1312420 () Bool)

(declare-fun res!870931 () Bool)

(assert (=> b!1312420 (=> (not res!870931) (not e!748787))))

(declare-datatypes ((List!30056 0))(
  ( (Nil!30053) (Cons!30052 (h!31270 (_ BitVec 64)) (t!43654 List!30056)) )
))
(declare-fun arrayNoDuplicates!0 (array!87723 (_ BitVec 32) List!30056) Bool)

(assert (=> b!1312420 (= res!870931 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30053))))

(declare-fun b!1312421 () Bool)

(declare-fun res!870935 () Bool)

(assert (=> b!1312421 (=> (not res!870935) (not e!748787))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87723 (_ BitVec 32)) Bool)

(assert (=> b!1312421 (= res!870935 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun mapNonEmpty!54640 () Bool)

(declare-fun tp!104155 () Bool)

(declare-fun e!748788 () Bool)

(assert (=> mapNonEmpty!54640 (= mapRes!54640 (and tp!104155 e!748788))))

(declare-fun mapKey!54640 () (_ BitVec 32))

(declare-fun mapRest!54640 () (Array (_ BitVec 32) ValueCell!16772))

(declare-fun mapValue!54640 () ValueCell!16772)

(assert (=> mapNonEmpty!54640 (= (arr!42338 _values!1354) (store mapRest!54640 mapKey!54640 mapValue!54640))))

(declare-fun b!1312422 () Bool)

(assert (=> b!1312422 (= e!748787 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun minValue!1296 () V!52225)

(declare-fun zeroValue!1296 () V!52225)

(declare-fun lt!585911 () Bool)

(declare-datatypes ((tuple2!22902 0))(
  ( (tuple2!22903 (_1!11462 (_ BitVec 64)) (_2!11462 V!52225)) )
))
(declare-datatypes ((List!30057 0))(
  ( (Nil!30054) (Cons!30053 (h!31271 tuple2!22902) (t!43655 List!30057)) )
))
(declare-datatypes ((ListLongMap!20567 0))(
  ( (ListLongMap!20568 (toList!10299 List!30057)) )
))
(declare-fun contains!8461 (ListLongMap!20567 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5303 (array!87723 array!87725 (_ BitVec 32) (_ BitVec 32) V!52225 V!52225 (_ BitVec 32) Int) ListLongMap!20567)

(assert (=> b!1312422 (= lt!585911 (contains!8461 (getCurrentListMap!5303 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1312423 () Bool)

(declare-fun e!748786 () Bool)

(declare-fun e!748789 () Bool)

(assert (=> b!1312423 (= e!748786 (and e!748789 mapRes!54640))))

(declare-fun condMapEmpty!54640 () Bool)

(declare-fun mapDefault!54640 () ValueCell!16772)

(assert (=> b!1312423 (= condMapEmpty!54640 (= (arr!42338 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16772)) mapDefault!54640)))))

(declare-fun res!870933 () Bool)

(assert (=> start!111000 (=> (not res!870933) (not e!748787))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!111000 (= res!870933 (validMask!0 mask!2040))))

(assert (=> start!111000 e!748787))

(assert (=> start!111000 tp!104154))

(declare-fun array_inv!32259 (array!87723) Bool)

(assert (=> start!111000 (array_inv!32259 _keys!1628)))

(assert (=> start!111000 true))

(declare-fun tp_is_empty!35341 () Bool)

(assert (=> start!111000 tp_is_empty!35341))

(declare-fun array_inv!32260 (array!87725) Bool)

(assert (=> start!111000 (and (array_inv!32260 _values!1354) e!748786)))

(declare-fun b!1312424 () Bool)

(assert (=> b!1312424 (= e!748788 tp_is_empty!35341)))

(declare-fun b!1312425 () Bool)

(assert (=> b!1312425 (= e!748789 tp_is_empty!35341)))

(assert (= (and start!111000 res!870933) b!1312418))

(assert (= (and b!1312418 res!870934) b!1312421))

(assert (= (and b!1312421 res!870935) b!1312420))

(assert (= (and b!1312420 res!870931) b!1312419))

(assert (= (and b!1312419 res!870932) b!1312422))

(assert (= (and b!1312423 condMapEmpty!54640) mapIsEmpty!54640))

(assert (= (and b!1312423 (not condMapEmpty!54640)) mapNonEmpty!54640))

(get-info :version)

(assert (= (and mapNonEmpty!54640 ((_ is ValueCellFull!16772) mapValue!54640)) b!1312424))

(assert (= (and b!1312423 ((_ is ValueCellFull!16772) mapDefault!54640)) b!1312425))

(assert (= start!111000 b!1312423))

(declare-fun m!1202291 () Bool)

(assert (=> b!1312422 m!1202291))

(assert (=> b!1312422 m!1202291))

(declare-fun m!1202293 () Bool)

(assert (=> b!1312422 m!1202293))

(declare-fun m!1202295 () Bool)

(assert (=> start!111000 m!1202295))

(declare-fun m!1202297 () Bool)

(assert (=> start!111000 m!1202297))

(declare-fun m!1202299 () Bool)

(assert (=> start!111000 m!1202299))

(declare-fun m!1202301 () Bool)

(assert (=> b!1312420 m!1202301))

(declare-fun m!1202303 () Bool)

(assert (=> mapNonEmpty!54640 m!1202303))

(declare-fun m!1202305 () Bool)

(assert (=> b!1312421 m!1202305))

(check-sat (not b!1312420) (not b_next!29611) (not b!1312422) b_and!47821 (not b!1312421) (not start!111000) tp_is_empty!35341 (not mapNonEmpty!54640))
(check-sat b_and!47821 (not b_next!29611))
