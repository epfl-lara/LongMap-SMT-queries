; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43500 () Bool)

(assert start!43500)

(declare-fun b_free!12279 () Bool)

(declare-fun b_next!12279 () Bool)

(assert (=> start!43500 (= b_free!12279 (not b_next!12279))))

(declare-fun tp!43120 () Bool)

(declare-fun b_and!21039 () Bool)

(assert (=> start!43500 (= tp!43120 b_and!21039)))

(declare-fun b!481985 () Bool)

(declare-fun res!287326 () Bool)

(declare-fun e!283598 () Bool)

(assert (=> b!481985 (=> (not res!287326) (not e!283598))))

(declare-datatypes ((array!31241 0))(
  ( (array!31242 (arr!15023 (Array (_ BitVec 32) (_ BitVec 64))) (size!15381 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31241)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31241 (_ BitVec 32)) Bool)

(assert (=> b!481985 (= res!287326 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun res!287328 () Bool)

(assert (=> start!43500 (=> (not res!287328) (not e!283598))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43500 (= res!287328 (validMask!0 mask!2352))))

(assert (=> start!43500 e!283598))

(assert (=> start!43500 true))

(declare-fun tp_is_empty!13791 () Bool)

(assert (=> start!43500 tp_is_empty!13791))

(declare-datatypes ((V!19459 0))(
  ( (V!19460 (val!6943 Int)) )
))
(declare-datatypes ((ValueCell!6534 0))(
  ( (ValueCellFull!6534 (v!9236 V!19459)) (EmptyCell!6534) )
))
(declare-datatypes ((array!31243 0))(
  ( (array!31244 (arr!15024 (Array (_ BitVec 32) ValueCell!6534)) (size!15382 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31243)

(declare-fun e!283599 () Bool)

(declare-fun array_inv!10834 (array!31243) Bool)

(assert (=> start!43500 (and (array_inv!10834 _values!1516) e!283599)))

(assert (=> start!43500 tp!43120))

(declare-fun array_inv!10835 (array!31241) Bool)

(assert (=> start!43500 (array_inv!10835 _keys!1874)))

(declare-fun mapNonEmpty!22396 () Bool)

(declare-fun mapRes!22396 () Bool)

(declare-fun tp!43119 () Bool)

(declare-fun e!283596 () Bool)

(assert (=> mapNonEmpty!22396 (= mapRes!22396 (and tp!43119 e!283596))))

(declare-fun mapRest!22396 () (Array (_ BitVec 32) ValueCell!6534))

(declare-fun mapKey!22396 () (_ BitVec 32))

(declare-fun mapValue!22396 () ValueCell!6534)

(assert (=> mapNonEmpty!22396 (= (arr!15024 _values!1516) (store mapRest!22396 mapKey!22396 mapValue!22396))))

(declare-fun b!481986 () Bool)

(assert (=> b!481986 (= e!283596 tp_is_empty!13791)))

(declare-fun b!481987 () Bool)

(declare-fun e!283595 () Bool)

(assert (=> b!481987 (= e!283595 tp_is_empty!13791)))

(declare-fun b!481988 () Bool)

(assert (=> b!481988 (= e!283598 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!218656 () Bool)

(declare-fun minValue!1458 () V!19459)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19459)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9108 0))(
  ( (tuple2!9109 (_1!4565 (_ BitVec 64)) (_2!4565 V!19459)) )
))
(declare-datatypes ((List!9188 0))(
  ( (Nil!9185) (Cons!9184 (h!10040 tuple2!9108) (t!15402 List!9188)) )
))
(declare-datatypes ((ListLongMap!8021 0))(
  ( (ListLongMap!8022 (toList!4026 List!9188)) )
))
(declare-fun contains!2640 (ListLongMap!8021 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2345 (array!31241 array!31243 (_ BitVec 32) (_ BitVec 32) V!19459 V!19459 (_ BitVec 32) Int) ListLongMap!8021)

(assert (=> b!481988 (= lt!218656 (contains!2640 (getCurrentListMap!2345 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!481989 () Bool)

(assert (=> b!481989 (= e!283599 (and e!283595 mapRes!22396))))

(declare-fun condMapEmpty!22396 () Bool)

(declare-fun mapDefault!22396 () ValueCell!6534)

(assert (=> b!481989 (= condMapEmpty!22396 (= (arr!15024 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6534)) mapDefault!22396)))))

(declare-fun b!481990 () Bool)

(declare-fun res!287329 () Bool)

(assert (=> b!481990 (=> (not res!287329) (not e!283598))))

(declare-datatypes ((List!9189 0))(
  ( (Nil!9186) (Cons!9185 (h!10041 (_ BitVec 64)) (t!15403 List!9189)) )
))
(declare-fun arrayNoDuplicates!0 (array!31241 (_ BitVec 32) List!9189) Bool)

(assert (=> b!481990 (= res!287329 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9186))))

(declare-fun b!481991 () Bool)

(declare-fun res!287327 () Bool)

(assert (=> b!481991 (=> (not res!287327) (not e!283598))))

(assert (=> b!481991 (= res!287327 (and (= (size!15382 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15381 _keys!1874) (size!15382 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!22396 () Bool)

(assert (=> mapIsEmpty!22396 mapRes!22396))

(assert (= (and start!43500 res!287328) b!481991))

(assert (= (and b!481991 res!287327) b!481985))

(assert (= (and b!481985 res!287326) b!481990))

(assert (= (and b!481990 res!287329) b!481988))

(assert (= (and b!481989 condMapEmpty!22396) mapIsEmpty!22396))

(assert (= (and b!481989 (not condMapEmpty!22396)) mapNonEmpty!22396))

(get-info :version)

(assert (= (and mapNonEmpty!22396 ((_ is ValueCellFull!6534) mapValue!22396)) b!481986))

(assert (= (and b!481989 ((_ is ValueCellFull!6534) mapDefault!22396)) b!481987))

(assert (= start!43500 b!481989))

(declare-fun m!463347 () Bool)

(assert (=> mapNonEmpty!22396 m!463347))

(declare-fun m!463349 () Bool)

(assert (=> b!481988 m!463349))

(assert (=> b!481988 m!463349))

(declare-fun m!463351 () Bool)

(assert (=> b!481988 m!463351))

(declare-fun m!463353 () Bool)

(assert (=> b!481990 m!463353))

(declare-fun m!463355 () Bool)

(assert (=> start!43500 m!463355))

(declare-fun m!463357 () Bool)

(assert (=> start!43500 m!463357))

(declare-fun m!463359 () Bool)

(assert (=> start!43500 m!463359))

(declare-fun m!463361 () Bool)

(assert (=> b!481985 m!463361))

(check-sat (not b!481985) tp_is_empty!13791 (not b!481990) (not mapNonEmpty!22396) (not b_next!12279) (not start!43500) b_and!21039 (not b!481988))
(check-sat b_and!21039 (not b_next!12279))
