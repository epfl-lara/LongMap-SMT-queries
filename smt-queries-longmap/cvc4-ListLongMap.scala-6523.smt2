; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82982 () Bool)

(assert start!82982)

(declare-fun mapIsEmpty!34870 () Bool)

(declare-fun mapRes!34870 () Bool)

(assert (=> mapIsEmpty!34870 mapRes!34870))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-datatypes ((V!34205 0))(
  ( (V!34206 (val!11009 Int)) )
))
(declare-datatypes ((ValueCell!10477 0))(
  ( (ValueCellFull!10477 (v!13567 V!34205)) (EmptyCell!10477) )
))
(declare-datatypes ((array!59903 0))(
  ( (array!59904 (arr!28820 (Array (_ BitVec 32) ValueCell!10477)) (size!29299 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59903)

(declare-fun e!545847 () Bool)

(declare-fun b!968536 () Bool)

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59905 0))(
  ( (array!59906 (arr!28821 (Array (_ BitVec 32) (_ BitVec 64))) (size!29300 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59905)

(assert (=> b!968536 (= e!545847 (and (= (size!29299 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29300 _keys!1717) (size!29299 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011) (= (size!29300 _keys!1717) (bvadd #b00000000000000000000000000000001 mask!2147)) (bvsgt #b00000000000000000000000000000000 (size!29300 _keys!1717))))))

(declare-fun mapNonEmpty!34870 () Bool)

(declare-fun tp!66438 () Bool)

(declare-fun e!545846 () Bool)

(assert (=> mapNonEmpty!34870 (= mapRes!34870 (and tp!66438 e!545846))))

(declare-fun mapValue!34870 () ValueCell!10477)

(declare-fun mapRest!34870 () (Array (_ BitVec 32) ValueCell!10477))

(declare-fun mapKey!34870 () (_ BitVec 32))

(assert (=> mapNonEmpty!34870 (= (arr!28820 _values!1425) (store mapRest!34870 mapKey!34870 mapValue!34870))))

(declare-fun b!968537 () Bool)

(declare-fun tp_is_empty!21917 () Bool)

(assert (=> b!968537 (= e!545846 tp_is_empty!21917)))

(declare-fun res!648382 () Bool)

(assert (=> start!82982 (=> (not res!648382) (not e!545847))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82982 (= res!648382 (validMask!0 mask!2147))))

(assert (=> start!82982 e!545847))

(assert (=> start!82982 true))

(declare-fun e!545848 () Bool)

(declare-fun array_inv!22311 (array!59903) Bool)

(assert (=> start!82982 (and (array_inv!22311 _values!1425) e!545848)))

(declare-fun array_inv!22312 (array!59905) Bool)

(assert (=> start!82982 (array_inv!22312 _keys!1717)))

(declare-fun b!968538 () Bool)

(declare-fun e!545849 () Bool)

(assert (=> b!968538 (= e!545849 tp_is_empty!21917)))

(declare-fun b!968539 () Bool)

(assert (=> b!968539 (= e!545848 (and e!545849 mapRes!34870))))

(declare-fun condMapEmpty!34870 () Bool)

(declare-fun mapDefault!34870 () ValueCell!10477)

