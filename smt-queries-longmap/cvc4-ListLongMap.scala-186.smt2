; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3710 () Bool)

(assert start!3710)

(declare-fun b!25938 () Bool)

(declare-fun res!15428 () Bool)

(declare-fun e!16828 () Bool)

(assert (=> b!25938 (=> (not res!15428) (not e!16828))))

(declare-datatypes ((V!1239 0))(
  ( (V!1240 (val!557 Int)) )
))
(declare-datatypes ((ValueCell!331 0))(
  ( (ValueCellFull!331 (v!1642 V!1239)) (EmptyCell!331) )
))
(declare-datatypes ((array!1363 0))(
  ( (array!1364 (arr!642 (Array (_ BitVec 32) ValueCell!331)) (size!743 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1363)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-datatypes ((array!1365 0))(
  ( (array!1366 (arr!643 (Array (_ BitVec 32) (_ BitVec 64))) (size!744 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1365)

(declare-fun mask!2294 () (_ BitVec 32))

(assert (=> b!25938 (= res!15428 (and (= (size!743 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!744 _keys!1833) (size!743 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!25939 () Bool)

(declare-fun res!15430 () Bool)

(assert (=> b!25939 (=> (not res!15430) (not e!16828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1365 (_ BitVec 32)) Bool)

(assert (=> b!25939 (= res!15430 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!25940 () Bool)

(declare-fun e!16827 () Bool)

(declare-fun e!16830 () Bool)

(declare-fun mapRes!1099 () Bool)

(assert (=> b!25940 (= e!16827 (and e!16830 mapRes!1099))))

(declare-fun condMapEmpty!1099 () Bool)

(declare-fun mapDefault!1099 () ValueCell!331)

