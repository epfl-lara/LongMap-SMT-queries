; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!83008 () Bool)

(assert start!83008)

(declare-fun mapNonEmpty!34894 () Bool)

(declare-fun mapRes!34894 () Bool)

(declare-fun tp!66462 () Bool)

(declare-fun e!545958 () Bool)

(assert (=> mapNonEmpty!34894 (= mapRes!34894 (and tp!66462 e!545958))))

(declare-datatypes ((V!34221 0))(
  ( (V!34222 (val!11015 Int)) )
))
(declare-datatypes ((ValueCell!10483 0))(
  ( (ValueCellFull!10483 (v!13573 V!34221)) (EmptyCell!10483) )
))
(declare-datatypes ((array!59931 0))(
  ( (array!59932 (arr!28832 (Array (_ BitVec 32) ValueCell!10483)) (size!29311 (_ BitVec 32))) )
))
(declare-fun _values!1425 () array!59931)

(declare-fun mapKey!34894 () (_ BitVec 32))

(declare-fun mapValue!34894 () ValueCell!10483)

(declare-fun mapRest!34894 () (Array (_ BitVec 32) ValueCell!10483))

(assert (=> mapNonEmpty!34894 (= (arr!28832 _values!1425) (store mapRest!34894 mapKey!34894 mapValue!34894))))

(declare-fun b!968671 () Bool)

(declare-fun tp_is_empty!21929 () Bool)

(assert (=> b!968671 (= e!545958 tp_is_empty!21929)))

(declare-fun b!968672 () Bool)

(declare-fun res!648441 () Bool)

(declare-fun e!545959 () Bool)

(assert (=> b!968672 (=> (not res!648441) (not e!545959))))

(declare-fun mask!2147 () (_ BitVec 32))

(declare-fun extraKeys!1346 () (_ BitVec 32))

(declare-datatypes ((array!59933 0))(
  ( (array!59934 (arr!28833 (Array (_ BitVec 32) (_ BitVec 64))) (size!29312 (_ BitVec 32))) )
))
(declare-fun _keys!1717 () array!59933)

(assert (=> b!968672 (= res!648441 (and (= (size!29311 _values!1425) (bvadd #b00000000000000000000000000000001 mask!2147)) (= (size!29312 _keys!1717) (size!29311 _values!1425)) (bvsge mask!2147 #b00000000000000000000000000000000) (bvsge extraKeys!1346 #b00000000000000000000000000000000) (bvsle extraKeys!1346 #b00000000000000000000000000000011)))))

(declare-fun b!968673 () Bool)

(declare-fun e!545957 () Bool)

(declare-fun e!545956 () Bool)

(assert (=> b!968673 (= e!545957 (and e!545956 mapRes!34894))))

(declare-fun condMapEmpty!34894 () Bool)

(declare-fun mapDefault!34894 () ValueCell!10483)

