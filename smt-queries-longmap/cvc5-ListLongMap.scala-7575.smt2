; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95770 () Bool)

(assert start!95770)

(declare-fun b_free!22423 () Bool)

(declare-fun b_next!22423 () Bool)

(assert (=> start!95770 (= b_free!22423 (not b_next!22423))))

(declare-fun tp!79118 () Bool)

(declare-fun b_and!35521 () Bool)

(assert (=> start!95770 (= tp!79118 b_and!35521)))

(declare-fun b!1083249 () Bool)

(declare-fun res!722111 () Bool)

(declare-fun e!618984 () Bool)

(assert (=> b!1083249 (=> (not res!722111) (not e!618984))))

(declare-datatypes ((array!69793 0))(
  ( (array!69794 (arr!33570 (Array (_ BitVec 32) (_ BitVec 64))) (size!34106 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69793)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1083249 (= res!722111 (= (select (arr!33570 _keys!1070) i!650) k!904))))

(declare-fun b!1083250 () Bool)

(declare-fun e!618988 () Bool)

(declare-fun tp_is_empty!26425 () Bool)

(assert (=> b!1083250 (= e!618988 tp_is_empty!26425)))

(declare-fun b!1083251 () Bool)

(declare-fun e!618987 () Bool)

(assert (=> b!1083251 (= e!618987 tp_is_empty!26425)))

(declare-fun b!1083252 () Bool)

(declare-fun res!722112 () Bool)

(assert (=> b!1083252 (=> (not res!722112) (not e!618984))))

(assert (=> b!1083252 (= res!722112 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34106 _keys!1070))))))

(declare-fun b!1083253 () Bool)

(declare-fun res!722108 () Bool)

(assert (=> b!1083253 (=> (not res!722108) (not e!618984))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69793 (_ BitVec 32)) Bool)

(assert (=> b!1083253 (= res!722108 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1083254 () Bool)

(declare-fun res!722109 () Bool)

(declare-fun e!618989 () Bool)

(assert (=> b!1083254 (=> (not res!722109) (not e!618989))))

(declare-fun lt!479989 () array!69793)

(declare-datatypes ((List!23400 0))(
  ( (Nil!23397) (Cons!23396 (h!24605 (_ BitVec 64)) (t!32881 List!23400)) )
))
(declare-fun arrayNoDuplicates!0 (array!69793 (_ BitVec 32) List!23400) Bool)

(assert (=> b!1083254 (= res!722109 (arrayNoDuplicates!0 lt!479989 #b00000000000000000000000000000000 Nil!23397))))

(declare-fun b!1083255 () Bool)

(declare-fun res!722110 () Bool)

(assert (=> b!1083255 (=> (not res!722110) (not e!618984))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1083255 (= res!722110 (validKeyInArray!0 k!904))))

(declare-fun b!1083256 () Bool)

(declare-fun res!722114 () Bool)

(assert (=> b!1083256 (=> (not res!722114) (not e!618984))))

(assert (=> b!1083256 (= res!722114 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23397))))

(declare-fun res!722113 () Bool)

(assert (=> start!95770 (=> (not res!722113) (not e!618984))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95770 (= res!722113 (validMask!0 mask!1414))))

(assert (=> start!95770 e!618984))

(assert (=> start!95770 tp!79118))

(assert (=> start!95770 true))

(assert (=> start!95770 tp_is_empty!26425))

(declare-fun array_inv!25908 (array!69793) Bool)

(assert (=> start!95770 (array_inv!25908 _keys!1070)))

(declare-datatypes ((V!40361 0))(
  ( (V!40362 (val!13269 Int)) )
))
(declare-datatypes ((ValueCell!12503 0))(
  ( (ValueCellFull!12503 (v!15890 V!40361)) (EmptyCell!12503) )
))
(declare-datatypes ((array!69795 0))(
  ( (array!69796 (arr!33571 (Array (_ BitVec 32) ValueCell!12503)) (size!34107 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69795)

(declare-fun e!618986 () Bool)

(declare-fun array_inv!25909 (array!69795) Bool)

(assert (=> start!95770 (and (array_inv!25909 _values!874) e!618986)))

(declare-fun b!1083257 () Bool)

(declare-fun mapRes!41392 () Bool)

(assert (=> b!1083257 (= e!618986 (and e!618988 mapRes!41392))))

(declare-fun condMapEmpty!41392 () Bool)

(declare-fun mapDefault!41392 () ValueCell!12503)

