; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95890 () Bool)

(assert start!95890)

(declare-fun b_free!22543 () Bool)

(declare-fun b_next!22543 () Bool)

(assert (=> start!95890 (= b_free!22543 (not b_next!22543))))

(declare-fun tp!79478 () Bool)

(declare-fun b_and!35761 () Bool)

(assert (=> start!95890 (= tp!79478 b_and!35761)))

(declare-fun b!1085677 () Bool)

(declare-fun e!620208 () Bool)

(declare-fun e!620205 () Bool)

(assert (=> b!1085677 (= e!620208 e!620205)))

(declare-fun res!723875 () Bool)

(assert (=> b!1085677 (=> res!723875 e!620205)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1085677 (= res!723875 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((V!40521 0))(
  ( (V!40522 (val!13329 Int)) )
))
(declare-datatypes ((tuple2!16902 0))(
  ( (tuple2!16903 (_1!8462 (_ BitVec 64)) (_2!8462 V!40521)) )
))
(declare-datatypes ((List!23491 0))(
  ( (Nil!23488) (Cons!23487 (h!24696 tuple2!16902) (t!33092 List!23491)) )
))
(declare-datatypes ((ListLongMap!14871 0))(
  ( (ListLongMap!14872 (toList!7451 List!23491)) )
))
(declare-fun lt!481961 () ListLongMap!14871)

(declare-fun lt!481966 () ListLongMap!14871)

(assert (=> b!1085677 (= lt!481961 lt!481966)))

(declare-fun lt!481974 () ListLongMap!14871)

(declare-fun -!777 (ListLongMap!14871 (_ BitVec 64)) ListLongMap!14871)

(assert (=> b!1085677 (= lt!481961 (-!777 lt!481974 k!904))))

(declare-datatypes ((Unit!35720 0))(
  ( (Unit!35721) )
))
(declare-fun lt!481967 () Unit!35720)

(declare-fun zeroValue!831 () V!40521)

(declare-fun lt!481964 () ListLongMap!14871)

(declare-fun addRemoveCommutativeForDiffKeys!15 (ListLongMap!14871 (_ BitVec 64) V!40521 (_ BitVec 64)) Unit!35720)

(assert (=> b!1085677 (= lt!481967 (addRemoveCommutativeForDiffKeys!15 lt!481964 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!481962 () ListLongMap!14871)

(declare-fun lt!481970 () tuple2!16902)

(declare-fun +!3259 (ListLongMap!14871 tuple2!16902) ListLongMap!14871)

(assert (=> b!1085677 (= lt!481962 (+!3259 lt!481966 lt!481970))))

(declare-fun lt!481971 () ListLongMap!14871)

(declare-fun lt!481959 () tuple2!16902)

(assert (=> b!1085677 (= lt!481966 (+!3259 lt!481971 lt!481959))))

(declare-fun lt!481973 () ListLongMap!14871)

(declare-fun lt!481969 () ListLongMap!14871)

(assert (=> b!1085677 (= lt!481973 lt!481969)))

(assert (=> b!1085677 (= lt!481969 (+!3259 lt!481974 lt!481970))))

(assert (=> b!1085677 (= lt!481974 (+!3259 lt!481964 lt!481959))))

(declare-fun lt!481972 () ListLongMap!14871)

(assert (=> b!1085677 (= lt!481962 (+!3259 (+!3259 lt!481972 lt!481959) lt!481970))))

(declare-fun minValue!831 () V!40521)

(assert (=> b!1085677 (= lt!481970 (tuple2!16903 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1085677 (= lt!481959 (tuple2!16903 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!723885 () Bool)

(declare-fun e!620206 () Bool)

(assert (=> start!95890 (=> (not res!723885) (not e!620206))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95890 (= res!723885 (validMask!0 mask!1414))))

(assert (=> start!95890 e!620206))

(assert (=> start!95890 tp!79478))

(assert (=> start!95890 true))

(declare-fun tp_is_empty!26545 () Bool)

(assert (=> start!95890 tp_is_empty!26545))

(declare-datatypes ((array!70025 0))(
  ( (array!70026 (arr!33686 (Array (_ BitVec 32) (_ BitVec 64))) (size!34222 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70025)

(declare-fun array_inv!25996 (array!70025) Bool)

(assert (=> start!95890 (array_inv!25996 _keys!1070)))

(declare-datatypes ((ValueCell!12563 0))(
  ( (ValueCellFull!12563 (v!15950 V!40521)) (EmptyCell!12563) )
))
(declare-datatypes ((array!70027 0))(
  ( (array!70028 (arr!33687 (Array (_ BitVec 32) ValueCell!12563)) (size!34223 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70027)

(declare-fun e!620204 () Bool)

(declare-fun array_inv!25997 (array!70027) Bool)

(assert (=> start!95890 (and (array_inv!25997 _values!874) e!620204)))

(declare-fun b!1085678 () Bool)

(declare-fun e!620210 () Bool)

(assert (=> b!1085678 (= e!620210 tp_is_empty!26545)))

(declare-fun b!1085679 () Bool)

(declare-fun res!723880 () Bool)

(declare-fun e!620207 () Bool)

(assert (=> b!1085679 (=> (not res!723880) (not e!620207))))

(declare-fun lt!481965 () array!70025)

(declare-datatypes ((List!23492 0))(
  ( (Nil!23489) (Cons!23488 (h!24697 (_ BitVec 64)) (t!33093 List!23492)) )
))
(declare-fun arrayNoDuplicates!0 (array!70025 (_ BitVec 32) List!23492) Bool)

(assert (=> b!1085679 (= res!723880 (arrayNoDuplicates!0 lt!481965 #b00000000000000000000000000000000 Nil!23489))))

(declare-fun b!1085680 () Bool)

(declare-fun e!620203 () Bool)

(assert (=> b!1085680 (= e!620203 tp_is_empty!26545)))

(declare-fun b!1085681 () Bool)

(declare-fun res!723879 () Bool)

(assert (=> b!1085681 (=> (not res!723879) (not e!620206))))

(assert (=> b!1085681 (= res!723879 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23489))))

(declare-fun b!1085682 () Bool)

(declare-fun res!723882 () Bool)

(assert (=> b!1085682 (=> (not res!723882) (not e!620206))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1085682 (= res!723882 (= (select (arr!33686 _keys!1070) i!650) k!904))))

(declare-fun b!1085683 () Bool)

(declare-fun res!723876 () Bool)

(assert (=> b!1085683 (=> (not res!723876) (not e!620206))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70025 (_ BitVec 32)) Bool)

(assert (=> b!1085683 (= res!723876 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1085684 () Bool)

(assert (=> b!1085684 (= e!620206 e!620207)))

(declare-fun res!723883 () Bool)

(assert (=> b!1085684 (=> (not res!723883) (not e!620207))))

(assert (=> b!1085684 (= res!723883 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!481965 mask!1414))))

(assert (=> b!1085684 (= lt!481965 (array!70026 (store (arr!33686 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34222 _keys!1070)))))

(declare-fun b!1085685 () Bool)

(declare-fun res!723881 () Bool)

(assert (=> b!1085685 (=> (not res!723881) (not e!620206))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1085685 (= res!723881 (and (= (size!34223 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34222 _keys!1070) (size!34223 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1085686 () Bool)

(declare-fun mapRes!41572 () Bool)

(assert (=> b!1085686 (= e!620204 (and e!620203 mapRes!41572))))

(declare-fun condMapEmpty!41572 () Bool)

(declare-fun mapDefault!41572 () ValueCell!12563)

