; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83358 () Bool)

(assert start!83358)

(declare-fun b_free!19351 () Bool)

(declare-fun b_next!19351 () Bool)

(assert (=> start!83358 (= b_free!19351 (not b_next!19351))))

(declare-fun tp!67331 () Bool)

(declare-fun b_and!30923 () Bool)

(assert (=> start!83358 (= tp!67331 b_and!30923)))

(declare-fun res!651487 () Bool)

(declare-fun e!548601 () Bool)

(assert (=> start!83358 (=> (not res!651487) (not e!548601))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83358 (= res!651487 (validMask!0 mask!2147))))

(assert (=> start!83358 e!548601))

(assert (=> start!83358 true))

(declare-datatypes ((V!34649 0))(
  ( (V!34650 (val!11175 Int)) )
))
(declare-datatypes ((ValueCell!10643 0))(
  ( (ValueCellFull!10643 (v!13734 V!34649)) (EmptyCell!10643) )
))
(declare-datatypes ((array!60539 0))(
  ( (array!60540 (arr!29133 (Array (_ BitVec 32) ValueCell!10643)) (size!29612 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60539)

(declare-fun e!548596 () Bool)

(declare-fun array_inv!22539 (array!60539) Bool)

(assert (=> start!83358 (and (array_inv!22539 _values!1425) e!548596)))

(declare-fun tp_is_empty!22249 () Bool)

(assert (=> start!83358 tp_is_empty!22249))

(assert (=> start!83358 tp!67331))

(declare-datatypes ((array!60541 0))(
  ( (array!60542 (arr!29134 (Array (_ BitVec 32) (_ BitVec 64))) (size!29613 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60541)

(declare-fun array_inv!22540 (array!60541) Bool)

(assert (=> start!83358 (array_inv!22540 _keys!1717)))

(declare-fun b!973281 () Bool)

(declare-fun res!651489 () Bool)

(assert (=> b!973281 (=> (not res!651489) (not e!548601))))

(declare-datatypes ((List!20205 0))(
  ( (Nil!20202) (Cons!20201 (h!21363 (_ BitVec 64)) (t!28654 List!20205)) )
))
(declare-fun arrayNoDuplicates!0 (array!60541 (_ BitVec 32) List!20205) Bool)

(assert (=> b!973281 (= res!651489 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20202))))

(declare-fun b!973282 () Bool)

(declare-fun res!651490 () Bool)

(assert (=> b!973282 (=> (not res!651490) (not e!548601))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!973282 (= res!651490 (and (= (size!29612 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29613 _keys!1717) (size!29612 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!35383 () Bool)

(declare-fun mapRes!35383 () Bool)

(declare-fun tp!67332 () Bool)

(declare-fun e!548600 () Bool)

(assert (=> mapNonEmpty!35383 (= mapRes!35383 (and tp!67332 e!548600))))

(declare-fun mapValue!35383 () ValueCell!10643)

(declare-fun mapKey!35383 () (_ BitVec 32))

(declare-fun mapRest!35383 () (Array (_ BitVec 32) ValueCell!10643))

(assert (=> mapNonEmpty!35383 (= (arr!29133 _values!1425) (store mapRest!35383 mapKey!35383 mapValue!35383))))

(declare-fun b!973283 () Bool)

(declare-fun e!548597 () Bool)

(assert (=> b!973283 (= e!548597 (not true))))

(declare-datatypes ((tuple2!14344 0))(
  ( (tuple2!14345 (_1!7183 (_ BitVec 64)) (_2!7183 V!34649)) )
))
(declare-datatypes ((List!20206 0))(
  ( (Nil!20203) (Cons!20202 (h!21364 tuple2!14344) (t!28655 List!20206)) )
))
(declare-datatypes ((ListLongMap!13041 0))(
  ( (ListLongMap!13042 (toList!6536 List!20206)) )
))
(declare-fun lt!432409 () ListLongMap!13041)

(declare-fun lt!432408 () tuple2!14344)

(declare-fun i!822 () (_ BitVec 32))

(declare-fun contains!5629 (ListLongMap!13041 (_ BitVec 64)) Bool)

(declare-fun +!2904 (ListLongMap!13041 tuple2!14344) ListLongMap!13041)

(assert (=> b!973283 (contains!5629 (+!2904 lt!432409 lt!432408) (select (arr!29134 _keys!1717) i!822))))

(declare-fun lt!432404 () V!34649)

(declare-datatypes ((Unit!32429 0))(
  ( (Unit!32430) )
))
(declare-fun lt!432406 () Unit!32429)

(declare-fun lt!432405 () (_ BitVec 64))

(declare-fun addStillContains!600 (ListLongMap!13041 (_ BitVec 64) V!34649 (_ BitVec 64)) Unit!32429)

(assert (=> b!973283 (= lt!432406 (addStillContains!600 lt!432409 lt!432405 lt!432404 (select (arr!29134 _keys!1717) i!822)))))

(declare-fun lt!432407 () ListLongMap!13041)

(declare-fun zeroValue!1367 () V!34649)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34649)

(declare-fun getCurrentListMap!3769 (array!60541 array!60539 (_ BitVec 32) (_ BitVec 32) V!34649 V!34649 (_ BitVec 32) Int) ListLongMap!13041)

(assert (=> b!973283 (= lt!432407 (+!2904 (getCurrentListMap!3769 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvadd #b00000000000000000000000000000001 (bvsub from!2118 #b00000000000000000000000000000001)) defaultEntry!1428) lt!432408))))

(assert (=> b!973283 (= lt!432408 (tuple2!14345 lt!432405 lt!432404))))

(declare-fun get!15101 (ValueCell!10643 V!34649) V!34649)

(declare-fun dynLambda!1693 (Int (_ BitVec 64)) V!34649)

(assert (=> b!973283 (= lt!432404 (get!15101 (select (arr!29133 _values!1425) (bvsub from!2118 #b00000000000000000000000000000001)) (dynLambda!1693 defaultEntry!1428 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!432410 () Unit!32429)

(declare-fun lemmaListMapRecursiveValidKeyArray!270 (array!60541 array!60539 (_ BitVec 32) (_ BitVec 32) V!34649 V!34649 (_ BitVec 32) Int) Unit!32429)

(assert (=> b!973283 (= lt!432410 (lemmaListMapRecursiveValidKeyArray!270 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973284 () Bool)

(declare-fun res!651488 () Bool)

(assert (=> b!973284 (=> (not res!651488) (not e!548601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60541 (_ BitVec 32)) Bool)

(assert (=> b!973284 (= res!651488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!973285 () Bool)

(declare-fun e!548602 () Bool)

(assert (=> b!973285 (= e!548601 e!548602)))

(declare-fun res!651486 () Bool)

(assert (=> b!973285 (=> (not res!651486) (not e!548602))))

(assert (=> b!973285 (= res!651486 (contains!5629 lt!432409 (select (arr!29134 _keys!1717) i!822)))))

(assert (=> b!973285 (= lt!432409 (getCurrentListMap!3769 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428))))

(declare-fun b!973286 () Bool)

(assert (=> b!973286 (= e!548602 e!548597)))

(declare-fun res!651491 () Bool)

(assert (=> b!973286 (=> (not res!651491) (not e!548597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!973286 (= res!651491 (validKeyInArray!0 lt!432405))))

(assert (=> b!973286 (= lt!432405 (select (arr!29134 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(assert (=> b!973286 (= lt!432407 (getCurrentListMap!3769 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!973287 () Bool)

(assert (=> b!973287 (= e!548600 tp_is_empty!22249)))

(declare-fun b!973288 () Bool)

(declare-fun res!651492 () Bool)

(assert (=> b!973288 (=> (not res!651492) (not e!548601))))

(assert (=> b!973288 (= res!651492 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29613 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29613 _keys!1717))))))

(declare-fun b!973289 () Bool)

(declare-fun res!651485 () Bool)

(assert (=> b!973289 (=> (not res!651485) (not e!548601))))

(assert (=> b!973289 (= res!651485 (validKeyInArray!0 (select (arr!29134 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35383 () Bool)

(assert (=> mapIsEmpty!35383 mapRes!35383))

(declare-fun b!973290 () Bool)

(declare-fun e!548599 () Bool)

(assert (=> b!973290 (= e!548596 (and e!548599 mapRes!35383))))

(declare-fun condMapEmpty!35383 () Bool)

(declare-fun mapDefault!35383 () ValueCell!10643)

