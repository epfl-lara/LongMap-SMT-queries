; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!4462 () Bool)

(assert start!4462)

(declare-fun b_free!1223 () Bool)

(declare-fun b_next!1223 () Bool)

(assert (=> start!4462 (= b_free!1223 (not b_next!1223))))

(declare-fun tp!5106 () Bool)

(declare-fun b_and!2045 () Bool)

(assert (=> start!4462 (= tp!5106 b_and!2045)))

(declare-fun b!34561 () Bool)

(declare-fun res!20976 () Bool)

(declare-fun e!21907 () Bool)

(assert (=> b!34561 (=> (not res!20976) (not e!21907))))

(declare-datatypes ((array!2371 0))(
  ( (array!2372 (arr!1133 (Array (_ BitVec 32) (_ BitVec 64))) (size!1234 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!2371)

(declare-fun k!1304 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!2371 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!34561 (= res!20976 (not (arrayContainsKey!0 _keys!1833 k!1304 #b00000000000000000000000000000000)))))

(declare-fun b!34562 () Bool)

(declare-fun res!20978 () Bool)

(assert (=> b!34562 (=> (not res!20978) (not e!21907))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!34562 (= res!20978 (validKeyInArray!0 k!1304))))

(declare-fun mapIsEmpty!1912 () Bool)

(declare-fun mapRes!1912 () Bool)

(assert (=> mapIsEmpty!1912 mapRes!1912))

(declare-fun b!34563 () Bool)

(declare-fun res!20973 () Bool)

(assert (=> b!34563 (=> (not res!20973) (not e!21907))))

(declare-datatypes ((V!1927 0))(
  ( (V!1928 (val!815 Int)) )
))
(declare-datatypes ((ValueCell!589 0))(
  ( (ValueCellFull!589 (v!1910 V!1927)) (EmptyCell!589) )
))
(declare-datatypes ((array!2373 0))(
  ( (array!2374 (arr!1134 (Array (_ BitVec 32) ValueCell!589)) (size!1235 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!2373)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!34563 (= res!20973 (and (= (size!1235 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!1234 _keys!1833) (size!1235 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!34564 () Bool)

(declare-fun res!20975 () Bool)

(assert (=> b!34564 (=> (not res!20975) (not e!21907))))

(declare-datatypes ((List!914 0))(
  ( (Nil!911) (Cons!910 (h!1477 (_ BitVec 64)) (t!3619 List!914)) )
))
(declare-fun arrayNoDuplicates!0 (array!2371 (_ BitVec 32) List!914) Bool)

(assert (=> b!34564 (= res!20975 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!911))))

(declare-fun res!20974 () Bool)

(assert (=> start!4462 (=> (not res!20974) (not e!21907))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!4462 (= res!20974 (validMask!0 mask!2294))))

(assert (=> start!4462 e!21907))

(assert (=> start!4462 true))

(assert (=> start!4462 tp!5106))

(declare-fun e!21909 () Bool)

(declare-fun array_inv!803 (array!2373) Bool)

(assert (=> start!4462 (and (array_inv!803 _values!1501) e!21909)))

(declare-fun array_inv!804 (array!2371) Bool)

(assert (=> start!4462 (array_inv!804 _keys!1833)))

(declare-fun tp_is_empty!1577 () Bool)

(assert (=> start!4462 tp_is_empty!1577))

(declare-fun b!34565 () Bool)

(declare-fun e!21910 () Bool)

(assert (=> b!34565 (= e!21909 (and e!21910 mapRes!1912))))

(declare-fun condMapEmpty!1912 () Bool)

(declare-fun mapDefault!1912 () ValueCell!589)

