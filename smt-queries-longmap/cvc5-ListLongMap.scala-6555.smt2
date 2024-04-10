; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83214 () Bool)

(assert start!83214)

(declare-fun b_free!19207 () Bool)

(declare-fun b_next!19207 () Bool)

(assert (=> start!83214 (= b_free!19207 (not b_next!19207))))

(declare-fun tp!66900 () Bool)

(declare-fun b_and!30695 () Bool)

(assert (=> start!83214 (= tp!66900 b_and!30695)))

(declare-fun mapNonEmpty!35167 () Bool)

(declare-fun mapRes!35167 () Bool)

(declare-fun tp!66899 () Bool)

(declare-fun e!547350 () Bool)

(assert (=> mapNonEmpty!35167 (= mapRes!35167 (and tp!66899 e!547350))))

(declare-datatypes ((V!34457 0))(
  ( (V!34458 (val!11103 Int)) )
))
(declare-datatypes ((ValueCell!10571 0))(
  ( (ValueCellFull!10571 (v!13662 V!34457)) (EmptyCell!10571) )
))
(declare-fun mapRest!35167 () (Array (_ BitVec 32) ValueCell!10571))

(declare-fun mapKey!35167 () (_ BitVec 32))

(declare-fun mapValue!35167 () ValueCell!10571)

(declare-datatypes ((array!60263 0))(
  ( (array!60264 (arr!28995 (Array (_ BitVec 32) ValueCell!10571)) (size!29474 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60263)

(assert (=> mapNonEmpty!35167 (= (arr!28995 _values!1425) (store mapRest!35167 mapKey!35167 mapValue!35167))))

(declare-fun b!970909 () Bool)

(declare-fun e!547352 () Bool)

(assert (=> b!970909 (= e!547352 false)))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun zeroValue!1367 () V!34457)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34457)

(declare-datatypes ((tuple2!14228 0))(
  ( (tuple2!14229 (_1!7125 (_ BitVec 64)) (_2!7125 V!34457)) )
))
(declare-datatypes ((List!20098 0))(
  ( (Nil!20095) (Cons!20094 (h!21256 tuple2!14228) (t!28461 List!20098)) )
))
(declare-datatypes ((ListLongMap!12925 0))(
  ( (ListLongMap!12926 (toList!6478 List!20098)) )
))
(declare-fun lt!431780 () ListLongMap!12925)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!60265 0))(
  ( (array!60266 (arr!28996 (Array (_ BitVec 32) (_ BitVec 64))) (size!29475 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60265)

(declare-fun getCurrentListMap!3711 (array!60265 array!60263 (_ BitVec 32) (_ BitVec 32) V!34457 V!34457 (_ BitVec 32) Int) ListLongMap!12925)

(assert (=> b!970909 (= lt!431780 (getCurrentListMap!3711 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!970910 () Bool)

(declare-fun e!547354 () Bool)

(declare-fun e!547353 () Bool)

(assert (=> b!970910 (= e!547354 (and e!547353 mapRes!35167))))

(declare-fun condMapEmpty!35167 () Bool)

(declare-fun mapDefault!35167 () ValueCell!10571)

