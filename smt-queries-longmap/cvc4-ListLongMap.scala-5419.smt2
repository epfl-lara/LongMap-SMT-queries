; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72302 () Bool)

(assert start!72302)

(declare-fun b!837692 () Bool)

(declare-fun res!569692 () Bool)

(declare-fun e!467560 () Bool)

(assert (=> b!837692 (=> (not res!569692) (not e!467560))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47004 0))(
  ( (array!47005 (arr!22533 (Array (_ BitVec 32) (_ BitVec 64))) (size!22973 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47004)

(declare-datatypes ((V!25517 0))(
  ( (V!25518 (val!7724 Int)) )
))
(declare-datatypes ((ValueCell!7237 0))(
  ( (ValueCellFull!7237 (v!10149 V!25517)) (EmptyCell!7237) )
))
(declare-datatypes ((array!47006 0))(
  ( (array!47007 (arr!22534 (Array (_ BitVec 32) ValueCell!7237)) (size!22974 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47006)

(assert (=> b!837692 (= res!569692 (and (= (size!22974 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!22973 _keys!868) (size!22974 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!837693 () Bool)

(assert (=> b!837693 (= e!467560 false)))

(declare-fun lt!380596 () Bool)

(declare-datatypes ((List!16035 0))(
  ( (Nil!16032) (Cons!16031 (h!17162 (_ BitVec 64)) (t!22406 List!16035)) )
))
(declare-fun arrayNoDuplicates!0 (array!47004 (_ BitVec 32) List!16035) Bool)

(assert (=> b!837693 (= lt!380596 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16032))))

(declare-fun b!837694 () Bool)

(declare-fun e!467561 () Bool)

(declare-fun e!467562 () Bool)

(declare-fun mapRes!24629 () Bool)

(assert (=> b!837694 (= e!467561 (and e!467562 mapRes!24629))))

(declare-fun condMapEmpty!24629 () Bool)

(declare-fun mapDefault!24629 () ValueCell!7237)

