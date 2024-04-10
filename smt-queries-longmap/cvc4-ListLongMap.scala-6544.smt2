; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83152 () Bool)

(assert start!83152)

(declare-fun b_free!19145 () Bool)

(declare-fun b_next!19145 () Bool)

(assert (=> start!83152 (= b_free!19145 (not b_next!19145))))

(declare-fun tp!66714 () Bool)

(declare-fun b_and!30633 () Bool)

(assert (=> start!83152 (= tp!66714 b_and!30633)))

(declare-fun res!649268 () Bool)

(declare-fun e!546886 () Bool)

(assert (=> start!83152 (=> (not res!649268) (not e!546886))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!83152 (= res!649268 (validMask!0 mask!2147))))

(assert (=> start!83152 e!546886))

(assert (=> start!83152 true))

(declare-datatypes ((V!34373 0))(
  ( (V!34374 (val!11072 Int)) )
))
(declare-datatypes ((ValueCell!10540 0))(
  ( (ValueCellFull!10540 (v!13631 V!34373)) (EmptyCell!10540) )
))
(declare-datatypes ((array!60147 0))(
  ( (array!60148 (arr!28937 (Array (_ BitVec 32) ValueCell!10540)) (size!29416 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!60147)

(declare-fun e!546889 () Bool)

(declare-fun array_inv!22399 (array!60147) Bool)

(assert (=> start!83152 (and (array_inv!22399 _values!1425) e!546889)))

(declare-fun tp_is_empty!22043 () Bool)

(assert (=> start!83152 tp_is_empty!22043))

(assert (=> start!83152 tp!66714))

(declare-datatypes ((array!60149 0))(
  ( (array!60150 (arr!28938 (Array (_ BitVec 32) (_ BitVec 64))) (size!29417 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!60149)

(declare-fun array_inv!22400 (array!60149) Bool)

(assert (=> start!83152 (array_inv!22400 _keys!1717)))

(declare-fun mapNonEmpty!35074 () Bool)

(declare-fun mapRes!35074 () Bool)

(declare-fun tp!66713 () Bool)

(declare-fun e!546887 () Bool)

(assert (=> mapNonEmpty!35074 (= mapRes!35074 (and tp!66713 e!546887))))

(declare-fun mapValue!35074 () ValueCell!10540)

(declare-fun mapKey!35074 () (_ BitVec 32))

(declare-fun mapRest!35074 () (Array (_ BitVec 32) ValueCell!10540))

(assert (=> mapNonEmpty!35074 (= (arr!28937 _values!1425) (store mapRest!35074 mapKey!35074 mapValue!35074))))

(declare-fun b!970052 () Bool)

(declare-fun res!649269 () Bool)

(assert (=> b!970052 (=> (not res!649269) (not e!546886))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!60149 (_ BitVec 32)) Bool)

(assert (=> b!970052 (= res!649269 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun b!970053 () Bool)

(declare-fun res!649271 () Bool)

(assert (=> b!970053 (=> (not res!649271) (not e!546886))))

(declare-datatypes ((List!20056 0))(
  ( (Nil!20053) (Cons!20052 (h!21214 (_ BitVec 64)) (t!28419 List!20056)) )
))
(declare-fun arrayNoDuplicates!0 (array!60149 (_ BitVec 32) List!20056) Bool)

(assert (=> b!970053 (= res!649271 (arrayNoDuplicates!0 _keys!1717 #b00000000000000000000000000000000 Nil!20053))))

(declare-fun b!970054 () Bool)

(assert (=> b!970054 (= e!546887 tp_is_empty!22043)))

(declare-fun b!970055 () Bool)

(declare-fun res!649272 () Bool)

(assert (=> b!970055 (=> (not res!649272) (not e!546886))))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!970055 (= res!649272 (and (= (size!29416 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29417 _keys!1717) (size!29416 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!970056 () Bool)

(declare-fun e!546885 () Bool)

(assert (=> b!970056 (= e!546889 (and e!546885 mapRes!35074))))

(declare-fun condMapEmpty!35074 () Bool)

(declare-fun mapDefault!35074 () ValueCell!10540)

