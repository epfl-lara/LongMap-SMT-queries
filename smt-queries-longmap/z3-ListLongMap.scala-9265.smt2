; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!110938 () Bool)

(assert start!110938)

(declare-fun b_free!29773 () Bool)

(declare-fun b_next!29773 () Bool)

(assert (=> start!110938 (= b_free!29773 (not b_next!29773))))

(declare-fun tp!104642 () Bool)

(declare-fun b_and!47963 () Bool)

(assert (=> start!110938 (= tp!104642 b_and!47963)))

(declare-fun b!1313344 () Bool)

(declare-fun res!871950 () Bool)

(declare-fun e!749126 () Bool)

(assert (=> b!1313344 (=> (not res!871950) (not e!749126))))

(declare-datatypes ((array!87889 0))(
  ( (array!87890 (arr!42425 (Array (_ BitVec 32) (_ BitVec 64))) (size!42977 (_ BitVec 32))) )
))
(declare-fun _keys!1628 () array!87889)

(declare-fun mask!2040 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!87889 (_ BitVec 32)) Bool)

(assert (=> b!1313344 (= res!871950 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1628 mask!2040))))

(declare-fun b!1313345 () Bool)

(declare-fun res!871953 () Bool)

(assert (=> b!1313345 (=> (not res!871953) (not e!749126))))

(declare-datatypes ((List!30186 0))(
  ( (Nil!30183) (Cons!30182 (h!31391 (_ BitVec 64)) (t!43784 List!30186)) )
))
(declare-fun arrayNoDuplicates!0 (array!87889 (_ BitVec 32) List!30186) Bool)

(assert (=> b!1313345 (= res!871953 (arrayNoDuplicates!0 _keys!1628 #b00000000000000000000000000000000 Nil!30183))))

(declare-fun b!1313346 () Bool)

(declare-fun res!871954 () Bool)

(assert (=> b!1313346 (=> (not res!871954) (not e!749126))))

(declare-datatypes ((V!52441 0))(
  ( (V!52442 (val!17826 Int)) )
))
(declare-datatypes ((ValueCell!16853 0))(
  ( (ValueCellFull!16853 (v!20452 V!52441)) (EmptyCell!16853) )
))
(declare-datatypes ((array!87891 0))(
  ( (array!87892 (arr!42426 (Array (_ BitVec 32) ValueCell!16853)) (size!42978 (_ BitVec 32))) )
))
(declare-fun _values!1354 () array!87891)

(declare-fun extraKeys!1275 () (_ BitVec 32))

(assert (=> b!1313346 (= res!871954 (and (= (size!42978 _values!1354) (bvadd #b00000000000000000000000000000001 mask!2040)) (= (size!42977 _keys!1628) (size!42978 _values!1354)) (bvsge mask!2040 #b00000000000000000000000000000000) (bvsge extraKeys!1275 #b00000000000000000000000000000000) (bvsle extraKeys!1275 #b00000000000000000000000000000011)))))

(declare-fun b!1313347 () Bool)

(declare-fun e!749127 () Bool)

(declare-fun tp_is_empty!35503 () Bool)

(assert (=> b!1313347 (= e!749127 tp_is_empty!35503)))

(declare-fun b!1313348 () Bool)

(declare-fun e!749128 () Bool)

(assert (=> b!1313348 (= e!749128 tp_is_empty!35503)))

(declare-fun b!1313349 () Bool)

(declare-fun e!749129 () Bool)

(declare-fun mapRes!54883 () Bool)

(assert (=> b!1313349 (= e!749129 (and e!749127 mapRes!54883))))

(declare-fun condMapEmpty!54883 () Bool)

(declare-fun mapDefault!54883 () ValueCell!16853)

(assert (=> b!1313349 (= condMapEmpty!54883 (= (arr!42426 _values!1354) ((as const (Array (_ BitVec 32) ValueCell!16853)) mapDefault!54883)))))

(declare-fun b!1313350 () Bool)

(assert (=> b!1313350 (= e!749126 false)))

(declare-fun defaultEntry!1357 () Int)

(declare-fun lt!585483 () Bool)

(declare-fun k0!1175 () (_ BitVec 64))

(declare-fun minValue!1296 () V!52441)

(declare-fun zeroValue!1296 () V!52441)

(declare-fun from!2020 () (_ BitVec 32))

(declare-datatypes ((tuple2!23068 0))(
  ( (tuple2!23069 (_1!11545 (_ BitVec 64)) (_2!11545 V!52441)) )
))
(declare-datatypes ((List!30187 0))(
  ( (Nil!30184) (Cons!30183 (h!31392 tuple2!23068) (t!43785 List!30187)) )
))
(declare-datatypes ((ListLongMap!20725 0))(
  ( (ListLongMap!20726 (toList!10378 List!30187)) )
))
(declare-fun contains!8455 (ListLongMap!20725 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5273 (array!87889 array!87891 (_ BitVec 32) (_ BitVec 32) V!52441 V!52441 (_ BitVec 32) Int) ListLongMap!20725)

(assert (=> b!1313350 (= lt!585483 (contains!8455 (getCurrentListMap!5273 _keys!1628 _values!1354 mask!2040 extraKeys!1275 zeroValue!1296 minValue!1296 from!2020 defaultEntry!1357) k0!1175))))

(declare-fun b!1313351 () Bool)

(declare-fun res!871951 () Bool)

(assert (=> b!1313351 (=> (not res!871951) (not e!749126))))

(assert (=> b!1313351 (= res!871951 (and (bvsge from!2020 #b00000000000000000000000000000000) (bvslt from!2020 (size!42977 _keys!1628)) (not (= k0!1175 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1175 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun mapNonEmpty!54883 () Bool)

(declare-fun tp!104641 () Bool)

(assert (=> mapNonEmpty!54883 (= mapRes!54883 (and tp!104641 e!749128))))

(declare-fun mapKey!54883 () (_ BitVec 32))

(declare-fun mapRest!54883 () (Array (_ BitVec 32) ValueCell!16853))

(declare-fun mapValue!54883 () ValueCell!16853)

(assert (=> mapNonEmpty!54883 (= (arr!42426 _values!1354) (store mapRest!54883 mapKey!54883 mapValue!54883))))

(declare-fun mapIsEmpty!54883 () Bool)

(assert (=> mapIsEmpty!54883 mapRes!54883))

(declare-fun res!871952 () Bool)

(assert (=> start!110938 (=> (not res!871952) (not e!749126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110938 (= res!871952 (validMask!0 mask!2040))))

(assert (=> start!110938 e!749126))

(assert (=> start!110938 tp!104642))

(declare-fun array_inv!32235 (array!87889) Bool)

(assert (=> start!110938 (array_inv!32235 _keys!1628)))

(assert (=> start!110938 true))

(assert (=> start!110938 tp_is_empty!35503))

(declare-fun array_inv!32236 (array!87891) Bool)

(assert (=> start!110938 (and (array_inv!32236 _values!1354) e!749129)))

(assert (= (and start!110938 res!871952) b!1313346))

(assert (= (and b!1313346 res!871954) b!1313344))

(assert (= (and b!1313344 res!871950) b!1313345))

(assert (= (and b!1313345 res!871953) b!1313351))

(assert (= (and b!1313351 res!871951) b!1313350))

(assert (= (and b!1313349 condMapEmpty!54883) mapIsEmpty!54883))

(assert (= (and b!1313349 (not condMapEmpty!54883)) mapNonEmpty!54883))

(get-info :version)

(assert (= (and mapNonEmpty!54883 ((_ is ValueCellFull!16853) mapValue!54883)) b!1313348))

(assert (= (and b!1313349 ((_ is ValueCellFull!16853) mapDefault!54883)) b!1313347))

(assert (= start!110938 b!1313349))

(declare-fun m!1201755 () Bool)

(assert (=> b!1313350 m!1201755))

(assert (=> b!1313350 m!1201755))

(declare-fun m!1201757 () Bool)

(assert (=> b!1313350 m!1201757))

(declare-fun m!1201759 () Bool)

(assert (=> start!110938 m!1201759))

(declare-fun m!1201761 () Bool)

(assert (=> start!110938 m!1201761))

(declare-fun m!1201763 () Bool)

(assert (=> start!110938 m!1201763))

(declare-fun m!1201765 () Bool)

(assert (=> mapNonEmpty!54883 m!1201765))

(declare-fun m!1201767 () Bool)

(assert (=> b!1313345 m!1201767))

(declare-fun m!1201769 () Bool)

(assert (=> b!1313344 m!1201769))

(check-sat (not mapNonEmpty!54883) tp_is_empty!35503 b_and!47963 (not b!1313344) (not b_next!29773) (not start!110938) (not b!1313345) (not b!1313350))
(check-sat b_and!47963 (not b_next!29773))
