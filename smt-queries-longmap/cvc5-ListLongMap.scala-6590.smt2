; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83424 () Bool)

(assert start!83424)

(declare-fun b_free!19417 () Bool)

(declare-fun b_next!19417 () Bool)

(assert (=> start!83424 (= b_free!19417 (not b_next!19417))))

(declare-fun tp!67530 () Bool)

(declare-fun b_and!31019 () Bool)

(assert (=> start!83424 (= tp!67530 b_and!31019)))

(declare-fun b!974344 () Bool)

(declare-fun res!652221 () Bool)

(declare-fun e!549179 () Bool)

(assert (=> b!974344 (=> (not res!652221) (not e!549179))))

(declare-datatypes ((array!60671 0))(
  ( (array!60672 (arr!29199 (Array (_ BitVec 32) (_ BitVec 64))) (size!29678 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60671)

(declare-datatypes ((List!20260 0))(
  ( (Nil!20257) (Cons!20256 (h!21418 (_ BitVec 64)) (t!28737 List!20260)) )
))
(declare-fun arrayNoDuplicates!0 (array!60671 (_ BitVec 32) List!20260) Bool)

(assert (=> b!974344 (= res!652221 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20257))))

(declare-fun b!974345 () Bool)

(declare-fun res!652226 () Bool)

(assert (=> b!974345 (=> (not res!652226) (not e!549179))))

(declare-fun i!822 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!974345 (= res!652226 (validKeyInArray!0 (select (arr!29199 _keys!1717) i!822)))))

(declare-fun b!974346 () Bool)

(declare-fun e!549181 () Bool)

(declare-fun tp_is_empty!22315 () Bool)

(assert (=> b!974346 (= e!549181 tp_is_empty!22315)))

(declare-fun res!652222 () Bool)

(assert (=> start!83424 (=> (not res!652222) (not e!549179))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83424 (= res!652222 (validMask!0 mask!2147))))

(assert (=> start!83424 e!549179))

(assert (=> start!83424 true))

(declare-datatypes ((V!34737 0))(
  ( (V!34738 (val!11208 Int)) )
))
(declare-datatypes ((ValueCell!10676 0))(
  ( (ValueCellFull!10676 (v!13767 V!34737)) (EmptyCell!10676) )
))
(declare-datatypes ((array!60673 0))(
  ( (array!60674 (arr!29200 (Array (_ BitVec 32) ValueCell!10676)) (size!29679 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60673)

(declare-fun e!549178 () Bool)

(declare-fun array_inv!22581 (array!60673) Bool)

(assert (=> start!83424 (and (array_inv!22581 _values!1425) e!549178)))

(assert (=> start!83424 tp_is_empty!22315))

(assert (=> start!83424 tp!67530))

(declare-fun array_inv!22582 (array!60671) Bool)

(assert (=> start!83424 (array_inv!22582 _keys!1717)))

(declare-fun b!974347 () Bool)

(declare-fun res!652225 () Bool)

(assert (=> b!974347 (=> (not res!652225) (not e!549179))))

(declare-fun zeroValue!1367 () V!34737)

(declare-fun from!2118 () (_ BitVec 32))

(declare-fun defaultEntry!1428 () Int)

(declare-fun minValue!1367 () V!34737)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((tuple2!14406 0))(
  ( (tuple2!14407 (_1!7214 (_ BitVec 64)) (_2!7214 V!34737)) )
))
(declare-datatypes ((List!20261 0))(
  ( (Nil!20258) (Cons!20257 (h!21419 tuple2!14406) (t!28738 List!20261)) )
))
(declare-datatypes ((ListLongMap!13103 0))(
  ( (ListLongMap!13104 (toList!6567 List!20261)) )
))
(declare-fun contains!5654 (ListLongMap!13103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!3800 (array!60671 array!60673 (_ BitVec 32) (_ BitVec 32) V!34737 V!34737 (_ BitVec 32) Int) ListLongMap!13103)

(assert (=> b!974347 (= res!652225 (contains!5654 (getCurrentListMap!3800 _keys!1717 _values!1425 mask!2147 extraKeys!1346 zeroValue!1367 minValue!1367 from!2118 defaultEntry!1428) (select (arr!29199 _keys!1717) i!822)))))

(declare-fun b!974348 () Bool)

(declare-fun e!549180 () Bool)

(declare-fun mapRes!35482 () Bool)

(assert (=> b!974348 (= e!549178 (and e!549180 mapRes!35482))))

(declare-fun condMapEmpty!35482 () Bool)

(declare-fun mapDefault!35482 () ValueCell!10676)

