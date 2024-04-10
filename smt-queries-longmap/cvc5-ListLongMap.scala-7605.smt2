; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95950 () Bool)

(assert start!95950)

(declare-fun b_free!22603 () Bool)

(declare-fun b_next!22603 () Bool)

(assert (=> start!95950 (= b_free!22603 (not b_next!22603))))

(declare-fun tp!79658 () Bool)

(declare-fun b_and!35881 () Bool)

(assert (=> start!95950 (= tp!79658 b_and!35881)))

(declare-fun b!1086997 () Bool)

(declare-fun res!724872 () Bool)

(declare-fun e!620925 () Bool)

(assert (=> b!1086997 (=> (not res!724872) (not e!620925))))

(declare-datatypes ((array!70139 0))(
  ( (array!70140 (arr!33743 (Array (_ BitVec 32) (_ BitVec 64))) (size!34279 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70139)

(declare-fun i!650 () (_ BitVec 32))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1086997 (= res!724872 (= (select (arr!33743 _keys!1070) i!650) k!904))))

(declare-fun b!1086998 () Bool)

(declare-fun res!724874 () Bool)

(assert (=> b!1086998 (=> (not res!724874) (not e!620925))))

(declare-datatypes ((List!23539 0))(
  ( (Nil!23536) (Cons!23535 (h!24744 (_ BitVec 64)) (t!33200 List!23539)) )
))
(declare-fun arrayNoDuplicates!0 (array!70139 (_ BitVec 32) List!23539) Bool)

(assert (=> b!1086998 (= res!724874 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23536))))

(declare-fun b!1086999 () Bool)

(declare-fun res!724866 () Bool)

(assert (=> b!1086999 (=> (not res!724866) (not e!620925))))

(assert (=> b!1086999 (= res!724866 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34279 _keys!1070))))))

(declare-fun b!1087000 () Bool)

(declare-fun res!724875 () Bool)

(assert (=> b!1087000 (=> (not res!724875) (not e!620925))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1087000 (= res!724875 (validKeyInArray!0 k!904))))

(declare-fun b!1087001 () Bool)

(declare-fun e!620923 () Bool)

(declare-fun tp_is_empty!26605 () Bool)

(assert (=> b!1087001 (= e!620923 tp_is_empty!26605)))

(declare-fun b!1087002 () Bool)

(declare-fun e!620929 () Bool)

(assert (=> b!1087002 (= e!620925 e!620929)))

(declare-fun res!724869 () Bool)

(assert (=> b!1087002 (=> (not res!724869) (not e!620929))))

(declare-fun lt!483498 () array!70139)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70139 (_ BitVec 32)) Bool)

(assert (=> b!1087002 (= res!724869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!483498 mask!1414))))

(assert (=> b!1087002 (= lt!483498 (array!70140 (store (arr!33743 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34279 _keys!1070)))))

(declare-fun b!1087003 () Bool)

(declare-fun res!724873 () Bool)

(assert (=> b!1087003 (=> (not res!724873) (not e!620925))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40601 0))(
  ( (V!40602 (val!13359 Int)) )
))
(declare-datatypes ((ValueCell!12593 0))(
  ( (ValueCellFull!12593 (v!15980 V!40601)) (EmptyCell!12593) )
))
(declare-datatypes ((array!70141 0))(
  ( (array!70142 (arr!33744 (Array (_ BitVec 32) ValueCell!12593)) (size!34280 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70141)

(assert (=> b!1087003 (= res!724873 (and (= (size!34280 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34279 _keys!1070) (size!34280 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1087004 () Bool)

(declare-fun e!620924 () Bool)

(declare-fun mapRes!41662 () Bool)

(assert (=> b!1087004 (= e!620924 (and e!620923 mapRes!41662))))

(declare-fun condMapEmpty!41662 () Bool)

(declare-fun mapDefault!41662 () ValueCell!12593)

