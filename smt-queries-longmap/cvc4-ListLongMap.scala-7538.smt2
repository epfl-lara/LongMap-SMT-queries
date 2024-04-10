; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95552 () Bool)

(assert start!95552)

(declare-fun b!1079205 () Bool)

(declare-fun res!719172 () Bool)

(declare-fun e!617024 () Bool)

(assert (=> b!1079205 (=> (not res!719172) (not e!617024))))

(declare-datatypes ((array!69369 0))(
  ( (array!69370 (arr!33358 (Array (_ BitVec 32) (_ BitVec 64))) (size!33894 (_ BitVec 32))) )
))
(declare-fun lt!478774 () array!69369)

(declare-datatypes ((List!23254 0))(
  ( (Nil!23251) (Cons!23250 (h!24459 (_ BitVec 64)) (t!32613 List!23254)) )
))
(declare-fun arrayNoDuplicates!0 (array!69369 (_ BitVec 32) List!23254) Bool)

(assert (=> b!1079205 (= res!719172 (arrayNoDuplicates!0 lt!478774 #b00000000000000000000000000000000 Nil!23251))))

(declare-fun b!1079206 () Bool)

(declare-fun e!617023 () Bool)

(declare-fun e!617027 () Bool)

(declare-fun mapRes!41065 () Bool)

(assert (=> b!1079206 (= e!617023 (and e!617027 mapRes!41065))))

(declare-fun condMapEmpty!41065 () Bool)

(declare-datatypes ((V!40069 0))(
  ( (V!40070 (val!13160 Int)) )
))
(declare-datatypes ((ValueCell!12394 0))(
  ( (ValueCellFull!12394 (v!15781 V!40069)) (EmptyCell!12394) )
))
(declare-datatypes ((array!69371 0))(
  ( (array!69372 (arr!33359 (Array (_ BitVec 32) ValueCell!12394)) (size!33895 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69371)

(declare-fun mapDefault!41065 () ValueCell!12394)

