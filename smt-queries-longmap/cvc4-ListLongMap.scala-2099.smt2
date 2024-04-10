; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35766 () Bool)

(assert start!35766)

(declare-fun b!359282 () Bool)

(declare-fun e!220022 () Bool)

(declare-fun tp_is_empty!8219 () Bool)

(assert (=> b!359282 (= e!220022 tp_is_empty!8219)))

(declare-fun mapIsEmpty!13836 () Bool)

(declare-fun mapRes!13836 () Bool)

(assert (=> mapIsEmpty!13836 mapRes!13836))

(declare-fun b!359284 () Bool)

(declare-fun res!199700 () Bool)

(declare-fun e!220018 () Bool)

(assert (=> b!359284 (=> (not res!199700) (not e!220018))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-datatypes ((array!19997 0))(
  ( (array!19998 (arr!9492 (Array (_ BitVec 32) (_ BitVec 64))) (size!9844 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19997)

(declare-datatypes ((V!11935 0))(
  ( (V!11936 (val!4154 Int)) )
))
(declare-datatypes ((ValueCell!3766 0))(
  ( (ValueCellFull!3766 (v!6348 V!11935)) (EmptyCell!3766) )
))
(declare-datatypes ((array!19999 0))(
  ( (array!20000 (arr!9493 (Array (_ BitVec 32) ValueCell!3766)) (size!9845 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19999)

(assert (=> b!359284 (= res!199700 (and (= (size!9845 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9844 _keys!1456) (size!9845 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!359285 () Bool)

(declare-fun e!220021 () Bool)

(assert (=> b!359285 (= e!220021 (and e!220022 mapRes!13836))))

(declare-fun condMapEmpty!13836 () Bool)

(declare-fun mapDefault!13836 () ValueCell!3766)

