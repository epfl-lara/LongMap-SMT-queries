; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82994 () Bool)

(assert start!82994)

(declare-fun b!968596 () Bool)

(declare-fun e!545897 () Bool)

(declare-fun tp_is_empty!21923 () Bool)

(assert (=> b!968596 (= e!545897 tp_is_empty!21923)))

(declare-fun b!968597 () Bool)

(declare-fun e!545900 () Bool)

(declare-datatypes ((array!59917 0))(
  ( (array!59918 (arr!28826 (Array (_ BitVec 32) (_ BitVec 64))) (size!29305 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59917)

(assert (=> b!968597 (= e!545900 (bvsgt #b00000000000000000000000000000000 (size!29305 _keys!1717)))))

(declare-fun b!968598 () Bool)

(declare-fun res!648408 () Bool)

(assert (=> b!968598 (=> (not res!648408) (not e!545900))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34213 0))(
  ( (V!34214 (val!11012 Int)) )
))
(declare-datatypes ((ValueCell!10480 0))(
  ( (ValueCellFull!10480 (v!13570 V!34213)) (EmptyCell!10480) )
))
(declare-datatypes ((array!59919 0))(
  ( (array!59920 (arr!28827 (Array (_ BitVec 32) ValueCell!10480)) (size!29306 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59919)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(assert (=> b!968598 (= res!648408 (and (= (size!29306 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29305 _keys!1717) (size!29306 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968599 () Bool)

(declare-fun res!648407 () Bool)

(assert (=> b!968599 (=> (not res!648407) (not e!545900))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59917 (_ BitVec 32)) Bool)

(assert (=> b!968599 (= res!648407 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1717 mask!2147))))

(declare-fun res!648409 () Bool)

(assert (=> start!82994 (=> (not res!648409) (not e!545900))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82994 (= res!648409 (validMask!0 mask!2147))))

(assert (=> start!82994 e!545900))

(assert (=> start!82994 true))

(declare-fun e!545896 () Bool)

(declare-fun array_inv!22317 (array!59919) Bool)

(assert (=> start!82994 (and (array_inv!22317 _values!1425) e!545896)))

(declare-fun array_inv!22318 (array!59917) Bool)

(assert (=> start!82994 (array_inv!22318 _keys!1717)))

(declare-fun mapNonEmpty!34882 () Bool)

(declare-fun mapRes!34882 () Bool)

(declare-fun tp!66450 () Bool)

(assert (=> mapNonEmpty!34882 (= mapRes!34882 (and tp!66450 e!545897))))

(declare-fun mapRest!34882 () (Array (_ BitVec 32) ValueCell!10480))

(declare-fun mapValue!34882 () ValueCell!10480)

(declare-fun mapKey!34882 () (_ BitVec 32))

(assert (=> mapNonEmpty!34882 (= (arr!28827 _values!1425) (store mapRest!34882 mapKey!34882 mapValue!34882))))

(declare-fun b!968600 () Bool)

(declare-fun e!545899 () Bool)

(assert (=> b!968600 (= e!545899 tp_is_empty!21923)))

(declare-fun mapIsEmpty!34882 () Bool)

(assert (=> mapIsEmpty!34882 mapRes!34882))

(declare-fun b!968601 () Bool)

(assert (=> b!968601 (= e!545896 (and e!545899 mapRes!34882))))

(declare-fun condMapEmpty!34882 () Bool)

(declare-fun mapDefault!34882 () ValueCell!10480)

