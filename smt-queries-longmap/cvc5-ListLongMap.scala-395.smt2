; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!7410 () Bool)

(assert start!7410)

(declare-fun b!47582 () Bool)

(declare-fun e!30489 () Bool)

(declare-datatypes ((array!3157 0))(
  ( (array!3158 (arr!1513 (Array (_ BitVec 32) (_ BitVec 64))) (size!1735 (_ BitVec 32))) )
))
(declare-fun _keys!1940 () array!3157)

(declare-fun mask!2458 () (_ BitVec 32))

(assert (=> b!47582 (= e!30489 (not (= (size!1735 _keys!1940) (bvadd #b00000000000000000000000000000001 mask!2458))))))

(declare-fun mapIsEmpty!2114 () Bool)

(declare-fun mapRes!2114 () Bool)

(assert (=> mapIsEmpty!2114 mapRes!2114))

(declare-fun mapNonEmpty!2114 () Bool)

(declare-fun tp!6263 () Bool)

(declare-fun e!30493 () Bool)

(assert (=> mapNonEmpty!2114 (= mapRes!2114 (and tp!6263 e!30493))))

(declare-fun mapKey!2114 () (_ BitVec 32))

(declare-datatypes ((V!2463 0))(
  ( (V!2464 (val!1062 Int)) )
))
(declare-datatypes ((ValueCell!734 0))(
  ( (ValueCellFull!734 (v!2123 V!2463)) (EmptyCell!734) )
))
(declare-fun mapValue!2114 () ValueCell!734)

(declare-fun mapRest!2114 () (Array (_ BitVec 32) ValueCell!734))

(declare-datatypes ((array!3159 0))(
  ( (array!3160 (arr!1514 (Array (_ BitVec 32) ValueCell!734)) (size!1736 (_ BitVec 32))) )
))
(declare-fun _values!1550 () array!3159)

(assert (=> mapNonEmpty!2114 (= (arr!1514 _values!1550) (store mapRest!2114 mapKey!2114 mapValue!2114))))

(declare-fun b!47583 () Bool)

(declare-fun res!27680 () Bool)

(assert (=> b!47583 (=> (not res!27680) (not e!30489))))

(declare-datatypes ((List!1264 0))(
  ( (Nil!1261) (Cons!1260 (h!1840 (_ BitVec 64)) (t!4292 List!1264)) )
))
(declare-fun arrayNoDuplicates!0 (array!3157 (_ BitVec 32) List!1264) Bool)

(assert (=> b!47583 (= res!27680 (arrayNoDuplicates!0 _keys!1940 #b00000000000000000000000000000000 Nil!1261))))

(declare-fun b!47584 () Bool)

(declare-fun tp_is_empty!2047 () Bool)

(assert (=> b!47584 (= e!30493 tp_is_empty!2047)))

(declare-fun b!47585 () Bool)

(declare-fun res!27676 () Bool)

(assert (=> b!47585 (=> (not res!27676) (not e!30489))))

(declare-fun k!1421 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!47585 (= res!27676 (validKeyInArray!0 k!1421))))

(declare-fun b!47586 () Bool)

(declare-fun res!27679 () Bool)

(assert (=> b!47586 (=> (not res!27679) (not e!30489))))

(declare-fun extraKeys!1471 () (_ BitVec 32))

(assert (=> b!47586 (= res!27679 (and (= (size!1736 _values!1550) (bvadd #b00000000000000000000000000000001 mask!2458)) (= (size!1735 _keys!1940) (size!1736 _values!1550)) (bvsge mask!2458 #b00000000000000000000000000000000) (bvsge extraKeys!1471 #b00000000000000000000000000000000) (bvsle extraKeys!1471 #b00000000000000000000000000000011)))))

(declare-fun res!27678 () Bool)

(assert (=> start!7410 (=> (not res!27678) (not e!30489))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!7410 (= res!27678 (validMask!0 mask!2458))))

(assert (=> start!7410 e!30489))

(assert (=> start!7410 true))

(declare-fun array_inv!912 (array!3157) Bool)

(assert (=> start!7410 (array_inv!912 _keys!1940)))

(declare-fun e!30490 () Bool)

(declare-fun array_inv!913 (array!3159) Bool)

(assert (=> start!7410 (and (array_inv!913 _values!1550) e!30490)))

(declare-fun b!47587 () Bool)

(declare-fun e!30491 () Bool)

(assert (=> b!47587 (= e!30490 (and e!30491 mapRes!2114))))

(declare-fun condMapEmpty!2114 () Bool)

(declare-fun mapDefault!2114 () ValueCell!734)

