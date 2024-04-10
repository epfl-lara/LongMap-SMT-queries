; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83428 () Bool)

(assert start!83428)

(declare-fun b_free!19421 () Bool)

(declare-fun b_next!19421 () Bool)

(assert (=> start!83428 (= b_free!19421 (not b_next!19421))))

(declare-fun tp!67541 () Bool)

(declare-fun b_and!31023 () Bool)

(assert (=> start!83428 (= tp!67541 b_and!31023)))

(declare-fun b!974404 () Bool)

(declare-fun res!652265 () Bool)

(declare-fun e!549210 () Bool)

(assert (=> b!974404 (=> (not res!652265) (not e!549210))))

(declare-datatypes ((array!60679 0))(
  ( (array!60680 (arr!29203 (Array (_ BitVec 32) (_ BitVec 64))) (size!29682 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60679)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun i!822 () (_ BitVec 32))

(assert (=> b!974404 (= res!652265 (and (bvsgt from!2118 #b00000000000000000000000000000000) (bvslt from!2118 (size!29682 _keys!1717)) (bvsge i!822 from!2118) (bvslt i!822 (size!29682 _keys!1717))))))

(declare-fun b!974405 () Bool)

(declare-fun e!549208 () Bool)

(declare-fun tp_is_empty!22319 () Bool)

(assert (=> b!974405 (= e!549208 tp_is_empty!22319)))

(declare-fun b!974406 () Bool)

(declare-fun res!652269 () Bool)

(assert (=> b!974406 (=> (not res!652269) (not e!549210))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974406 (= res!652269 (validKeyInArray!0 (select (arr!29203 _keys!1717) i!822)))))

(declare-fun b!974407 () Bool)

(declare-fun res!652264 () Bool)

(assert (=> b!974407 (=> (not res!652264) (not e!549210))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34741 0))(
  ( (V!34742 (val!11210 Int)) )
))
(declare-datatypes ((ValueCell!10678 0))(
  ( (ValueCellFull!10678 (v!13769 V!34741)) (EmptyCell!10678) )
))
(declare-datatypes ((array!60681 0))(
  ( (array!60682 (arr!29204 (Array (_ BitVec 32) ValueCell!10678)) (size!29683 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60681)

(declare-fun zeroValue!1367 () V!34741)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34741)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14410 0))(
  ( (tuple2!14411 (_1!7216 (_ BitVec 64)) (_2!7216 V!34741)) )
))
(declare-datatypes ((List!20264 0))(
  ( (Nil!20261) (Cons!20260 (h!21422 tuple2!14410) (t!28741 List!20264)) )
))
(declare-datatypes ((ListLongMap!13107 0))(
  ( (ListLongMap!13108 (toList!6569 List!20264)) )
))
(declare-fun contains!5656 (ListLongMap!13107 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3802 (array!60679 array!60681 (_ BitVec 32) (_ BitVec 32) V!34741 V!34741 (_ BitVec 32) Int) ListLongMap!13107)

(assert (=> b!974407 (= res!652264 (contains!5656 (getCurrentListMap!3802 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29203 _keys!1717) i!822)))))

(declare-fun res!652263 () Bool)

(assert (=> start!83428 (=> (not res!652263) (not e!549210))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83428 (= res!652263 (validMask!0 mask!2147))))

(assert (=> start!83428 e!549210))

(assert (=> start!83428 true))

(declare-fun e!549207 () Bool)

(declare-fun array_inv!22585 (array!60681) Bool)

(assert (=> start!83428 (and (array_inv!22585 _values!1425) e!549207)))

(assert (=> start!83428 tp_is_empty!22319))

(assert (=> start!83428 tp!67541))

(declare-fun array_inv!22586 (array!60679) Bool)

(assert (=> start!83428 (array_inv!22586 _keys!1717)))

(declare-fun b!974408 () Bool)

(declare-fun e!549209 () Bool)

(assert (=> b!974408 (= e!549209 tp_is_empty!22319)))

(declare-fun b!974409 () Bool)

(declare-fun mapRes!35488 () Bool)

(assert (=> b!974409 (= e!549207 (and e!549208 mapRes!35488))))

(declare-fun condMapEmpty!35488 () Bool)

(declare-fun mapDefault!35488 () ValueCell!10678)

