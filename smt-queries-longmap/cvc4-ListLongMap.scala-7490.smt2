; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!94916 () Bool)

(assert start!94916)

(declare-fun b_free!22121 () Bool)

(declare-fun b_next!22121 () Bool)

(assert (=> start!94916 (= b_free!22121 (not b_next!22121))))

(declare-fun tp!77827 () Bool)

(declare-fun b_and!34975 () Bool)

(assert (=> start!94916 (= tp!77827 b_and!34975)))

(declare-fun b!1073216 () Bool)

(declare-fun res!715815 () Bool)

(declare-fun e!613099 () Bool)

(assert (=> b!1073216 (=> (not res!715815) (not e!613099))))

(declare-datatypes ((array!68825 0))(
  ( (array!68826 (arr!33106 (Array (_ BitVec 32) (_ BitVec 64))) (size!33642 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!68825)

(declare-datatypes ((List!23111 0))(
  ( (Nil!23108) (Cons!23107 (h!24316 (_ BitVec 64)) (t!32448 List!23111)) )
))
(declare-fun arrayNoDuplicates!0 (array!68825 (_ BitVec 32) List!23111) Bool)

(assert (=> b!1073216 (= res!715815 (arrayNoDuplicates!0 _keys!1163 #b00000000000000000000000000000000 Nil!23108))))

(declare-fun mapIsEmpty!40609 () Bool)

(declare-fun mapRes!40609 () Bool)

(assert (=> mapIsEmpty!40609 mapRes!40609))

(declare-fun b!1073217 () Bool)

(declare-fun e!613102 () Bool)

(declare-fun e!613100 () Bool)

(assert (=> b!1073217 (= e!613102 (and e!613100 mapRes!40609))))

(declare-fun condMapEmpty!40609 () Bool)

(declare-datatypes ((V!39709 0))(
  ( (V!39710 (val!13016 Int)) )
))
(declare-datatypes ((ValueCell!12262 0))(
  ( (ValueCellFull!12262 (v!15634 V!39709)) (EmptyCell!12262) )
))
(declare-datatypes ((array!68827 0))(
  ( (array!68828 (arr!33107 (Array (_ BitVec 32) ValueCell!12262)) (size!33643 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!68827)

(declare-fun mapDefault!40609 () ValueCell!12262)

