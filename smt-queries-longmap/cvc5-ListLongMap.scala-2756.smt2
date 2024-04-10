; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40388 () Bool)

(assert start!40388)

(declare-fun mapNonEmpty!19287 () Bool)

(declare-fun mapRes!19287 () Bool)

(declare-fun tp!37269 () Bool)

(declare-fun e!261133 () Bool)

(assert (=> mapNonEmpty!19287 (= mapRes!19287 (and tp!37269 e!261133))))

(declare-datatypes ((V!16803 0))(
  ( (V!16804 (val!5931 Int)) )
))
(declare-datatypes ((ValueCell!5543 0))(
  ( (ValueCellFull!5543 (v!8182 V!16803)) (EmptyCell!5543) )
))
(declare-fun mapValue!19287 () ValueCell!5543)

(declare-fun mapRest!19287 () (Array (_ BitVec 32) ValueCell!5543))

(declare-datatypes ((array!27355 0))(
  ( (array!27356 (arr!13125 (Array (_ BitVec 32) ValueCell!5543)) (size!13477 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!27355)

(declare-fun mapKey!19287 () (_ BitVec 32))

(assert (=> mapNonEmpty!19287 (= (arr!13125 _values!549) (store mapRest!19287 mapKey!19287 mapValue!19287))))

(declare-fun b!443912 () Bool)

(declare-fun res!263136 () Bool)

(declare-fun e!261131 () Bool)

(assert (=> b!443912 (=> (not res!263136) (not e!261131))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!443912 (= res!263136 (validKeyInArray!0 k!794))))

(declare-fun b!443913 () Bool)

(declare-fun res!263131 () Bool)

(assert (=> b!443913 (=> (not res!263131) (not e!261131))))

(declare-datatypes ((array!27357 0))(
  ( (array!27358 (arr!13126 (Array (_ BitVec 32) (_ BitVec 64))) (size!13478 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!27357)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!27357 (_ BitVec 32)) Bool)

(assert (=> b!443913 (= res!263131 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!443914 () Bool)

(declare-fun res!263134 () Bool)

(assert (=> b!443914 (=> (not res!263134) (not e!261131))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!443914 (= res!263134 (validMask!0 mask!1025))))

(declare-fun res!263135 () Bool)

(assert (=> start!40388 (=> (not res!263135) (not e!261131))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!40388 (= res!263135 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!13478 _keys!709))))))

(assert (=> start!40388 e!261131))

(assert (=> start!40388 true))

(declare-fun e!261132 () Bool)

(declare-fun array_inv!9524 (array!27355) Bool)

(assert (=> start!40388 (and (array_inv!9524 _values!549) e!261132)))

(declare-fun array_inv!9525 (array!27357) Bool)

(assert (=> start!40388 (array_inv!9525 _keys!709)))

(declare-fun b!443915 () Bool)

(declare-fun e!261134 () Bool)

(assert (=> b!443915 (= e!261132 (and e!261134 mapRes!19287))))

(declare-fun condMapEmpty!19287 () Bool)

(declare-fun mapDefault!19287 () ValueCell!5543)

