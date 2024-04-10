; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83316 () Bool)

(assert start!83316)

(declare-fun b_free!19309 () Bool)

(declare-fun b_next!19309 () Bool)

(assert (=> start!83316 (= b_free!19309 (not b_next!19309))))

(declare-fun tp!67205 () Bool)

(declare-fun b_and!30839 () Bool)

(assert (=> start!83316 (= tp!67205 b_and!30839)))

(declare-fun b!972546 () Bool)

(declare-fun res!650981 () Bool)

(declare-fun e!548180 () Bool)

(assert (=> b!972546 (=> (not res!650981) (not e!548180))))

(declare-datatypes ((array!60461 0))(
  ( (array!60462 (arr!29094 (Array (_ BitVec 32) (_ BitVec 64))) (size!29573 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60461)

(declare-datatypes ((List!20173 0))(
  ( (Nil!20170) (Cons!20169 (h!21331 (_ BitVec 64)) (t!28580 List!20173)) )
))
(declare-fun arrayNoDuplicates!0 (array!60461 (_ BitVec 32) List!20173) Bool)

(assert (=> b!972546 (= res!650981 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20170))))

(declare-fun mapNonEmpty!35320 () Bool)

(declare-fun mapRes!35320 () Bool)

(declare-fun tp!67206 () Bool)

(declare-fun e!548185 () Bool)

(assert (=> mapNonEmpty!35320 (= mapRes!35320 (and tp!67206 e!548185))))

(declare-datatypes ((V!34593 0))(
  ( (V!34594 (val!11154 Int)) )
))
(declare-datatypes ((ValueCell!10622 0))(
  ( (ValueCellFull!10622 (v!13713 V!34593)) (EmptyCell!10622) )
))
(declare-fun mapRest!35320 () (Array (_ BitVec 32) ValueCell!10622))

(declare-datatypes ((array!60463 0))(
  ( (array!60464 (arr!29095 (Array (_ BitVec 32) ValueCell!10622)) (size!29574 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60463)

(declare-fun mapValue!35320 () ValueCell!10622)

(declare-fun mapKey!35320 () (_ BitVec 32))

(assert (=> mapNonEmpty!35320 (= (arr!29095 _values!1425) (store mapRest!35320 mapKey!35320 mapValue!35320))))

(declare-fun b!972548 () Bool)

(declare-fun e!548184 () Bool)

(assert (=> b!972548 (= e!548180 e!548184)))

(declare-fun res!650982 () Bool)

(assert (=> b!972548 (=> (not res!650982) (not e!548184))))

(declare-fun lt!432063 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972548 (= res!650982 (validKeyInArray!0 lt!432063))))

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972548 (= lt!432063 (select (arr!29094 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34593)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34593)

(declare-datatypes ((tuple2!14308 0))(
  ( (tuple2!14309 (_1!7165 (_ BitVec 64)) (_2!7165 V!34593)) )
))
(declare-datatypes ((List!20174 0))(
  ( (Nil!20171) (Cons!20170 (h!21332 tuple2!14308) (t!28581 List!20174)) )
))
(declare-datatypes ((ListLongMap!13005 0))(
  ( (ListLongMap!13006 (toList!6518 List!20174)) )
))
(declare-fun lt!432064 () ListLongMap!13005)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3751 (array!60461 array!60463 (_ BitVec 32) (_ BitVec 32) V!34593 V!34593 (_ BitVec 32) Int) ListLongMap!13005)

(assert (=> b!972548 (= lt!432064 (getCurrentListMap!3751 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972549 () Bool)

(declare-fun e!548182 () Bool)

(declare-fun tp_is_empty!22207 () Bool)

(assert (=> b!972549 (= e!548182 tp_is_empty!22207)))

(declare-fun mapIsEmpty!35320 () Bool)

(assert (=> mapIsEmpty!35320 mapRes!35320))

(declare-fun b!972550 () Bool)

(assert (=> b!972550 (= e!548185 tp_is_empty!22207)))

(declare-fun b!972551 () Bool)

(declare-fun res!650984 () Bool)

(assert (=> b!972551 (=> (not res!650984) (not e!548180))))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!972551 (= res!650984 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29573 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29573 _keys!1717))))))

(declare-fun b!972552 () Bool)

(declare-fun res!650983 () Bool)

(assert (=> b!972552 (=> (not res!650983) (not e!548180))))

(assert (=> b!972552 (= res!650983 (validKeyInArray!0 (select (arr!29094 _keys!1717) i!822)))))

(declare-fun b!972553 () Bool)

(declare-fun res!650987 () Bool)

(assert (=> b!972553 (=> (not res!650987) (not e!548180))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60461 (_ BitVec 32)) Bool)

(assert (=> b!972553 (= res!650987 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!972554 () Bool)

(assert (=> b!972554 (= e!548184 (not true))))

(declare-fun +!2892 (ListLongMap!13005 tuple2!14308) ListLongMap!13005)

(declare-fun get!15075 (ValueCell!10622 V!34593) V!34593)

(declare-fun dynLambda!1681 (Int (_ BitVec 64)) V!34593)

(assert (=> b!972554 (= lt!432064 (+!2892 (getCurrentListMap!3751 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) (tuple2!14309 lt!432063 (get!15075 (select (arr!29095 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1681 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-datatypes ((Unit!32405 0))(
  ( (Unit!32406) )
))
(declare-fun lt!432065 () Unit!32405)

(declare-fun lemmaListMapRecursiveValidKeyArray!258 (array!60461 array!60463 (_ BitVec 32) (_ BitVec 32) V!34593 V!34593 (_ BitVec 32) Int) Unit!32405)

(assert (=> b!972554 (= lt!432065 (lemmaListMapRecursiveValidKeyArray!258 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun res!650986 () Bool)

(assert (=> start!83316 (=> (not res!650986) (not e!548180))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83316 (= res!650986 (validMask!0 mask!2147))))

(assert (=> start!83316 e!548180))

(assert (=> start!83316 true))

(declare-fun e!548183 () Bool)

(declare-fun array_inv!22507 (array!60463) Bool)

(assert (=> start!83316 (and (array_inv!22507 _values!1425) e!548183)))

(assert (=> start!83316 tp_is_empty!22207))

(assert (=> start!83316 tp!67205))

(declare-fun array_inv!22508 (array!60461) Bool)

(assert (=> start!83316 (array_inv!22508 _keys!1717)))

(declare-fun b!972547 () Bool)

(declare-fun res!650985 () Bool)

(assert (=> b!972547 (=> (not res!650985) (not e!548180))))

(assert (=> b!972547 (= res!650985 (and (= (size!29574 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29573 _keys!1717) (size!29574 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!972555 () Bool)

(declare-fun res!650988 () Bool)

(assert (=> b!972555 (=> (not res!650988) (not e!548180))))

(declare-fun contains!5612 (ListLongMap!13005 (_ BitVec 64)) Bool)

(assert (=> b!972555 (= res!650988 (contains!5612 (getCurrentListMap!3751 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29094 _keys!1717) i!822)))))

(declare-fun b!972556 () Bool)

(assert (=> b!972556 (= e!548183 (and e!548182 mapRes!35320))))

(declare-fun condMapEmpty!35320 () Bool)

(declare-fun mapDefault!35320 () ValueCell!10622)

