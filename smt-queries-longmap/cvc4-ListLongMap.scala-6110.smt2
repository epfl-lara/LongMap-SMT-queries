; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!78772 () Bool)

(assert start!78772)

(declare-fun b_free!16985 () Bool)

(declare-fun b_next!16985 () Bool)

(assert (=> start!78772 (= b_free!16985 (not b_next!16985))))

(declare-fun tp!59395 () Bool)

(declare-fun b_and!27707 () Bool)

(assert (=> start!78772 (= tp!59395 b_and!27707)))

(declare-fun b!919272 () Bool)

(declare-fun res!619843 () Bool)

(declare-fun e!516006 () Bool)

(assert (=> b!919272 (=> (not res!619843) (not e!516006))))

(declare-fun from!1844 () (_ BitVec 32))

(assert (=> b!919272 (= res!619843 (bvsgt from!1844 #b00000000000000000000000000000000))))

(declare-fun b!919273 () Bool)

(declare-fun res!619848 () Bool)

(declare-fun e!516002 () Bool)

(assert (=> b!919273 (=> (not res!619848) (not e!516002))))

(declare-datatypes ((array!54970 0))(
  ( (array!54971 (arr!26430 (Array (_ BitVec 32) (_ BitVec 64))) (size!26889 (_ BitVec 32))) )
))
(declare-fun _keys!1487 () array!54970)

(declare-fun mask!1881 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!54970 (_ BitVec 32)) Bool)

(assert (=> b!919273 (= res!619848 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1487 mask!1881))))

(declare-fun b!919274 () Bool)

(declare-fun res!619842 () Bool)

(assert (=> b!919274 (=> (not res!619842) (not e!516006))))

(declare-fun k!1099 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!919274 (= res!619842 (validKeyInArray!0 k!1099))))

(declare-fun b!919275 () Bool)

(declare-fun e!516001 () Bool)

(declare-fun e!516003 () Bool)

(declare-fun mapRes!30996 () Bool)

(assert (=> b!919275 (= e!516001 (and e!516003 mapRes!30996))))

(declare-fun condMapEmpty!30996 () Bool)

(declare-datatypes ((V!30955 0))(
  ( (V!30956 (val!9797 Int)) )
))
(declare-datatypes ((ValueCell!9265 0))(
  ( (ValueCellFull!9265 (v!12315 V!30955)) (EmptyCell!9265) )
))
(declare-datatypes ((array!54972 0))(
  ( (array!54973 (arr!26431 (Array (_ BitVec 32) ValueCell!9265)) (size!26890 (_ BitVec 32))) )
))
(declare-fun _values!1231 () array!54972)

(declare-fun mapDefault!30996 () ValueCell!9265)

