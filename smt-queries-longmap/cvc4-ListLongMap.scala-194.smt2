; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3788 () Bool)

(assert start!3788)

(declare-fun res!15719 () Bool)

(declare-fun e!17262 () Bool)

(assert (=> start!3788 (=> (not res!15719) (not e!17262))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3788 (= res!15719 (validMask!0 mask!2294))))

(assert (=> start!3788 e!17262))

(assert (=> start!3788 true))

(declare-datatypes ((V!1303 0))(
  ( (V!1304 (val!581 Int)) )
))
(declare-datatypes ((ValueCell!355 0))(
  ( (ValueCellFull!355 (v!1667 V!1303)) (EmptyCell!355) )
))
(declare-datatypes ((array!1461 0))(
  ( (array!1462 (arr!688 (Array (_ BitVec 32) ValueCell!355)) (size!789 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1461)

(declare-fun e!17260 () Bool)

(declare-fun array_inv!471 (array!1461) Bool)

(assert (=> start!3788 (and (array_inv!471 _values!1501) e!17260)))

(declare-datatypes ((array!1463 0))(
  ( (array!1464 (arr!689 (Array (_ BitVec 32) (_ BitVec 64))) (size!790 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1463)

(declare-fun array_inv!472 (array!1463) Bool)

(assert (=> start!3788 (array_inv!472 _keys!1833)))

(declare-fun mapIsEmpty!1180 () Bool)

(declare-fun mapRes!1180 () Bool)

(assert (=> mapIsEmpty!1180 mapRes!1180))

(declare-fun b!26486 () Bool)

(declare-fun res!15718 () Bool)

(assert (=> b!26486 (=> (not res!15718) (not e!17262))))

(declare-fun extraKeys!1422 () (_ BitVec 32))

(assert (=> b!26486 (= res!15718 (and (= (size!789 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!790 _keys!1833) (size!789 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!26487 () Bool)

(declare-fun e!17263 () Bool)

(assert (=> b!26487 (= e!17260 (and e!17263 mapRes!1180))))

(declare-fun condMapEmpty!1180 () Bool)

(declare-fun mapDefault!1180 () ValueCell!355)

