; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83320 () Bool)

(assert start!83320)

(declare-fun b_free!19313 () Bool)

(declare-fun b_next!19313 () Bool)

(assert (=> start!83320 (= b_free!19313 (not b_next!19313))))

(declare-fun tp!67218 () Bool)

(declare-fun b_and!30847 () Bool)

(assert (=> start!83320 (= tp!67218 b_and!30847)))

(declare-fun b!972616 () Bool)

(declare-fun e!548221 () Bool)

(declare-fun e!548220 () Bool)

(assert (=> b!972616 (= e!548221 e!548220)))

(declare-fun res!651034 () Bool)

(assert (=> b!972616 (=> (not res!651034) (not e!548220))))

(declare-fun lt!432082 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!972616 (= res!651034 (validKeyInArray!0 lt!432082))))

(declare-datatypes ((array!60469 0))(
  ( (array!60470 (arr!29098 (Array (_ BitVec 32) (_ BitVec 64))) (size!29577 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60469)

(declare-fun from!2118 () (_ BitVec 32))

(assert (=> b!972616 (= lt!432082 (select (arr!29098 _keys!1717) (bvsub from!2118 #b00000000000000000000000000000001)))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34597 0))(
  ( (V!34598 (val!11156 Int)) )
))
(declare-datatypes ((ValueCell!10624 0))(
  ( (ValueCellFull!10624 (v!13715 V!34597)) (EmptyCell!10624) )
))
(declare-datatypes ((array!60471 0))(
  ( (array!60472 (arr!29099 (Array (_ BitVec 32) ValueCell!10624)) (size!29578 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60471)

(declare-fun zeroValue!1367 () V!34597)

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34597)

(declare-datatypes ((tuple2!14312 0))(
  ( (tuple2!14313 (_1!7167 (_ BitVec 64)) (_2!7167 V!34597)) )
))
(declare-datatypes ((List!20177 0))(
  ( (Nil!20174) (Cons!20173 (h!21335 tuple2!14312) (t!28588 List!20177)) )
))
(declare-datatypes ((ListLongMap!13009 0))(
  ( (ListLongMap!13010 (toList!6520 List!20177)) )
))
(declare-fun lt!432083 () ListLongMap!13009)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-fun getCurrentListMap!3753 (array!60469 array!60471 (_ BitVec 32) (_ BitVec 32) V!34597 V!34597 (_ BitVec 32) Int) ListLongMap!13009)

(assert (=> b!972616 (= lt!432083 (getCurrentListMap!3753 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 (bvsub from!2118 #b00000000000000000000000000000001) defaultEntry!1428))))

(declare-fun b!972617 () Bool)

(declare-fun e!548216 () Bool)

(declare-fun e!548217 () Bool)

(declare-fun mapRes!35326 () Bool)

(assert (=> b!972617 (= e!548216 (and e!548217 mapRes!35326))))

(declare-fun condMapEmpty!35326 () Bool)

(declare-fun mapDefault!35326 () ValueCell!10624)

