; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81950 () Bool)

(assert start!81950)

(declare-fun b!955933 () Bool)

(declare-fun res!640148 () Bool)

(declare-fun e!538524 () Bool)

(assert (=> b!955933 (=> (not res!640148) (not e!538524))))

(declare-fun extraKeys!1118 () (_ BitVec 32))

(declare-datatypes ((array!58079 0))(
  ( (array!58080 (arr!27919 (Array (_ BitVec 32) (_ BitVec 64))) (size!28398 (_ BitVec 32))) )
))
(declare-fun _keys!1441 () array!58079)

(declare-datatypes ((V!32969 0))(
  ( (V!32970 (val!10545 Int)) )
))
(declare-datatypes ((ValueCell!10013 0))(
  ( (ValueCellFull!10013 (v!13100 V!32969)) (EmptyCell!10013) )
))
(declare-datatypes ((array!58081 0))(
  ( (array!58082 (arr!27920 (Array (_ BitVec 32) ValueCell!10013)) (size!28399 (_ BitVec 32))) )
))
(declare-fun _values!1197 () array!58081)

(declare-fun mask!1823 () (_ BitVec 32))

(assert (=> b!955933 (= res!640148 (and (= (size!28399 _values!1197) (bvadd #b00000000000000000000000000000001 mask!1823)) (= (size!28398 _keys!1441) (size!28399 _values!1197)) (bvsge mask!1823 #b00000000000000000000000000000000) (bvsge extraKeys!1118 #b00000000000000000000000000000000) (bvsle extraKeys!1118 #b00000000000000000000000000000011)))))

(declare-fun b!955934 () Bool)

(assert (=> b!955934 (= e!538524 false)))

(declare-fun lt!430061 () Bool)

(declare-datatypes ((List!19460 0))(
  ( (Nil!19457) (Cons!19456 (h!20618 (_ BitVec 64)) (t!27821 List!19460)) )
))
(declare-fun arrayNoDuplicates!0 (array!58079 (_ BitVec 32) List!19460) Bool)

(assert (=> b!955934 (= lt!430061 (arrayNoDuplicates!0 _keys!1441 #b00000000000000000000000000000000 Nil!19457))))

(declare-fun b!955935 () Bool)

(declare-fun e!538528 () Bool)

(declare-fun e!538527 () Bool)

(declare-fun mapRes!33445 () Bool)

(assert (=> b!955935 (= e!538528 (and e!538527 mapRes!33445))))

(declare-fun condMapEmpty!33445 () Bool)

(declare-fun mapDefault!33445 () ValueCell!10013)

