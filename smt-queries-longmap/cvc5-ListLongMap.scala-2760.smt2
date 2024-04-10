; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40412 () Bool)

(assert start!40412)

(declare-fun b!444380 () Bool)

(declare-fun res!263497 () Bool)

(declare-fun e!261348 () Bool)

(assert (=> b!444380 (=> (not res!263497) (not e!261348))))

(declare-datatypes ((array!27403 0))(
  ( (array!27404 (arr!13149 (Array (_ BitVec 32) (_ BitVec 64))) (size!13501 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27403)

(declare-datatypes ((List!7872 0))(
  ( (Nil!7869) (Cons!7868 (h!8724 (_ BitVec 64)) (t!13630 List!7872)) )
))
(declare-fun arrayNoDuplicates!0 (array!27403 (_ BitVec 32) List!7872) Bool)

(assert (=> b!444380 (= res!263497 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7869))))

(declare-fun mapNonEmpty!19323 () Bool)

(declare-fun mapRes!19323 () Bool)

(declare-fun tp!37305 () Bool)

(declare-fun e!261350 () Bool)

(assert (=> mapNonEmpty!19323 (= mapRes!19323 (and tp!37305 e!261350))))

(declare-datatypes ((V!16835 0))(
  ( (V!16836 (val!5943 Int)) )
))
(declare-datatypes ((ValueCell!5555 0))(
  ( (ValueCellFull!5555 (v!8194 V!16835)) (EmptyCell!5555) )
))
(declare-fun mapValue!19323 () ValueCell!5555)

(declare-fun mapKey!19323 () (_ BitVec 32))

(declare-datatypes ((array!27405 0))(
  ( (array!27406 (arr!13150 (Array (_ BitVec 32) ValueCell!5555)) (size!13502 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27405)

(declare-fun mapRest!19323 () (Array (_ BitVec 32) ValueCell!5555))

(assert (=> mapNonEmpty!19323 (= (arr!13150 _values!549) (store mapRest!19323 mapKey!19323 mapValue!19323))))

(declare-fun res!263498 () Bool)

(assert (=> start!40412 (=> (not res!263498) (not e!261348))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40412 (= res!263498 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13501 _keys!709))))))

(assert (=> start!40412 e!261348))

(assert (=> start!40412 true))

(declare-fun e!261347 () Bool)

(declare-fun array_inv!9538 (array!27405) Bool)

(assert (=> start!40412 (and (array_inv!9538 _values!549) e!261347)))

(declare-fun array_inv!9539 (array!27403) Bool)

(assert (=> start!40412 (array_inv!9539 _keys!709)))

(declare-fun b!444381 () Bool)

(declare-fun e!261345 () Bool)

(assert (=> b!444381 (= e!261347 (and e!261345 mapRes!19323))))

(declare-fun condMapEmpty!19323 () Bool)

(declare-fun mapDefault!19323 () ValueCell!5555)

