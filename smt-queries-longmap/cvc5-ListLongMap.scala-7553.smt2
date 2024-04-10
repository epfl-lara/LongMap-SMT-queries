; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95638 () Bool)

(assert start!95638)

(declare-fun b_free!22291 () Bool)

(declare-fun b_next!22291 () Bool)

(assert (=> start!95638 (= b_free!22291 (not b_next!22291))))

(declare-fun tp!78722 () Bool)

(declare-fun b_and!35269 () Bool)

(assert (=> start!95638 (= tp!78722 b_and!35269)))

(declare-fun b!1080753 () Bool)

(declare-fun res!720331 () Bool)

(declare-fun e!617798 () Bool)

(assert (=> b!1080753 (=> (not res!720331) (not e!617798))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((array!69537 0))(
  ( (array!69538 (arr!33442 (Array (_ BitVec 32) (_ BitVec 64))) (size!33978 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69537)

(declare-datatypes ((V!40185 0))(
  ( (V!40186 (val!13203 Int)) )
))
(declare-datatypes ((ValueCell!12437 0))(
  ( (ValueCellFull!12437 (v!15824 V!40185)) (EmptyCell!12437) )
))
(declare-datatypes ((array!69539 0))(
  ( (array!69540 (arr!33443 (Array (_ BitVec 32) ValueCell!12437)) (size!33979 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69539)

(assert (=> b!1080753 (= res!720331 (and (= (size!33979 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33978 _keys!1070) (size!33979 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1080754 () Bool)

(declare-fun e!617799 () Bool)

(declare-fun tp_is_empty!26293 () Bool)

(assert (=> b!1080754 (= e!617799 tp_is_empty!26293)))

(declare-fun b!1080755 () Bool)

(declare-fun res!720333 () Bool)

(assert (=> b!1080755 (=> (not res!720333) (not e!617798))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69537 (_ BitVec 32)) Bool)

(assert (=> b!1080755 (= res!720333 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1080756 () Bool)

(declare-fun e!617800 () Bool)

(declare-fun e!617797 () Bool)

(declare-fun mapRes!41194 () Bool)

(assert (=> b!1080756 (= e!617800 (and e!617797 mapRes!41194))))

(declare-fun condMapEmpty!41194 () Bool)

(declare-fun mapDefault!41194 () ValueCell!12437)

