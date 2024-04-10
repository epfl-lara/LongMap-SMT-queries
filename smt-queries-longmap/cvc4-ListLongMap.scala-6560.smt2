; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83248 () Bool)

(assert start!83248)

(declare-fun b_free!19241 () Bool)

(declare-fun b_next!19241 () Bool)

(assert (=> start!83248 (= b_free!19241 (not b_next!19241))))

(declare-fun tp!67002 () Bool)

(declare-fun b_and!30729 () Bool)

(assert (=> start!83248 (= tp!67002 b_and!30729)))

(declare-fun b!971419 () Bool)

(declare-fun res!650202 () Bool)

(declare-fun e!547607 () Bool)

(assert (=> b!971419 (=> (not res!650202) (not e!547607))))

(declare-datatypes ((array!60325 0))(
  ( (array!60326 (arr!29026 (Array (_ BitVec 32) (_ BitVec 64))) (size!29505 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60325)

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60325 (_ BitVec 32)) Bool)

(assert (=> b!971419 (= res!650202 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!971420 () Bool)

(assert (=> b!971420 (= e!547607 false)))

(declare-datatypes ((V!34501 0))(
  ( (V!34502 (val!11120 Int)) )
))
(declare-datatypes ((ValueCell!10588 0))(
  ( (ValueCellFull!10588 (v!13679 V!34501)) (EmptyCell!10588) )
))
(declare-datatypes ((array!60327 0))(
  ( (array!60328 (arr!29027 (Array (_ BitVec 32) ValueCell!10588)) (size!29506 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60327)

(declare-fun zeroValue!1367 () V!34501)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34501)

(declare-datatypes ((tuple2!14252 0))(
  ( (tuple2!14253 (_1!7137 (_ BitVec 64)) (_2!7137 V!34501)) )
))
(declare-datatypes ((List!20120 0))(
  ( (Nil!20117) (Cons!20116 (h!21278 tuple2!14252) (t!28483 List!20120)) )
))
(declare-datatypes ((ListLongMap!12949 0))(
  ( (ListLongMap!12950 (toList!6490 List!20120)) )
))
(declare-fun lt!431831 () ListLongMap!12949)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3723 (array!60325 array!60327 (_ BitVec 32) (_ BitVec 32) V!34501 V!34501 (_ BitVec 32) Int) ListLongMap!12949)

(assert (=> b!971420 (= lt!431831 (getCurrentListMap!3723 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!971422 () Bool)

(declare-fun res!650207 () Bool)

(assert (=> b!971422 (=> (not res!650207) (not e!547607))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!971422 (= res!650207 (validKeyInArray!0 (select (arr!29026 _keys!1717) i!822)))))

(declare-fun mapIsEmpty!35218 () Bool)

(declare-fun mapRes!35218 () Bool)

(assert (=> mapIsEmpty!35218 mapRes!35218))

(declare-fun b!971423 () Bool)

(declare-fun res!650205 () Bool)

(assert (=> b!971423 (=> (not res!650205) (not e!547607))))

(assert (=> b!971423 (= res!650205 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29505 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29505 _keys!1717))))))

(declare-fun b!971424 () Bool)

(declare-fun e!547609 () Bool)

(declare-fun e!547608 () Bool)

(assert (=> b!971424 (= e!547609 (and e!547608 mapRes!35218))))

(declare-fun condMapEmpty!35218 () Bool)

(declare-fun mapDefault!35218 () ValueCell!10588)

