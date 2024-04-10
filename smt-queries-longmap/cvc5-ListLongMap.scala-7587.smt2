; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95842 () Bool)

(assert start!95842)

(declare-fun b_free!22495 () Bool)

(declare-fun b_next!22495 () Bool)

(assert (=> start!95842 (= b_free!22495 (not b_next!22495))))

(declare-fun tp!79333 () Bool)

(declare-fun b_and!35665 () Bool)

(assert (=> start!95842 (= tp!79333 b_and!35665)))

(declare-datatypes ((V!40457 0))(
  ( (V!40458 (val!13305 Int)) )
))
(declare-datatypes ((tuple2!16864 0))(
  ( (tuple2!16865 (_1!8443 (_ BitVec 64)) (_2!8443 V!40457)) )
))
(declare-datatypes ((List!23453 0))(
  ( (Nil!23450) (Cons!23449 (h!24658 tuple2!16864) (t!33006 List!23453)) )
))
(declare-datatypes ((ListLongMap!14833 0))(
  ( (ListLongMap!14834 (toList!7432 List!23453)) )
))
(declare-fun lt!480805 () ListLongMap!14833)

(declare-fun lt!480810 () tuple2!16864)

(declare-fun b!1084623 () Bool)

(declare-fun lt!480807 () ListLongMap!14833)

(declare-fun e!619637 () Bool)

(declare-fun lt!480806 () tuple2!16864)

(declare-fun +!3242 (ListLongMap!14833 tuple2!16864) ListLongMap!14833)

(assert (=> b!1084623 (= e!619637 (= lt!480807 (+!3242 (+!3242 lt!480805 lt!480810) lt!480806)))))

(declare-fun b!1084624 () Bool)

(declare-fun res!723093 () Bool)

(declare-fun e!619640 () Bool)

(assert (=> b!1084624 (=> (not res!723093) (not e!619640))))

(declare-datatypes ((array!69931 0))(
  ( (array!69932 (arr!33639 (Array (_ BitVec 32) (_ BitVec 64))) (size!34175 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69931)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69931 (_ BitVec 32)) Bool)

(assert (=> b!1084624 (= res!723093 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1084625 () Bool)

(declare-fun res!723088 () Bool)

(assert (=> b!1084625 (=> (not res!723088) (not e!619640))))

(declare-datatypes ((List!23454 0))(
  ( (Nil!23451) (Cons!23450 (h!24659 (_ BitVec 64)) (t!33007 List!23454)) )
))
(declare-fun arrayNoDuplicates!0 (array!69931 (_ BitVec 32) List!23454) Bool)

(assert (=> b!1084625 (= res!723088 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23451))))

(declare-fun b!1084626 () Bool)

(declare-fun res!723085 () Bool)

(assert (=> b!1084626 (=> (not res!723085) (not e!619637))))

(declare-fun lt!480809 () ListLongMap!14833)

(declare-fun lt!480812 () ListLongMap!14833)

(assert (=> b!1084626 (= res!723085 (= lt!480812 (+!3242 (+!3242 lt!480809 lt!480810) lt!480806)))))

(declare-fun b!1084627 () Bool)

(declare-fun e!619642 () Bool)

(assert (=> b!1084627 (= e!619640 e!619642)))

(declare-fun res!723089 () Bool)

(assert (=> b!1084627 (=> (not res!723089) (not e!619642))))

(declare-fun lt!480814 () array!69931)

(assert (=> b!1084627 (= res!723089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!480814 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1084627 (= lt!480814 (array!69932 (store (arr!33639 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34175 _keys!1070)))))

(declare-fun b!1084628 () Bool)

(declare-fun res!723096 () Bool)

(assert (=> b!1084628 (=> (not res!723096) (not e!619640))))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1084628 (= res!723096 (= (select (arr!33639 _keys!1070) i!650) k!904))))

(declare-fun b!1084629 () Bool)

(declare-fun res!723094 () Bool)

(assert (=> b!1084629 (=> (not res!723094) (not e!619642))))

(assert (=> b!1084629 (= res!723094 (arrayNoDuplicates!0 lt!480814 #b00000000000000000000000000000000 Nil!23451))))

(declare-fun b!1084630 () Bool)

(declare-fun e!619641 () Bool)

(assert (=> b!1084630 (= e!619641 true)))

(assert (=> b!1084630 e!619637))

(declare-fun res!723092 () Bool)

(assert (=> b!1084630 (=> (not res!723092) (not e!619637))))

(declare-fun lt!480813 () ListLongMap!14833)

(assert (=> b!1084630 (= res!723092 (= lt!480807 (+!3242 (+!3242 lt!480813 lt!480810) lt!480806)))))

(declare-fun minValue!831 () V!40457)

(assert (=> b!1084630 (= lt!480806 (tuple2!16865 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun zeroValue!831 () V!40457)

(assert (=> b!1084630 (= lt!480810 (tuple2!16865 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun res!723090 () Bool)

(assert (=> start!95842 (=> (not res!723090) (not e!619640))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!95842 (= res!723090 (validMask!0 mask!1414))))

(assert (=> start!95842 e!619640))

(assert (=> start!95842 tp!79333))

(assert (=> start!95842 true))

(declare-fun tp_is_empty!26497 () Bool)

(assert (=> start!95842 tp_is_empty!26497))

(declare-fun array_inv!25962 (array!69931) Bool)

(assert (=> start!95842 (array_inv!25962 _keys!1070)))

(declare-datatypes ((ValueCell!12539 0))(
  ( (ValueCellFull!12539 (v!15926 V!40457)) (EmptyCell!12539) )
))
(declare-datatypes ((array!69933 0))(
  ( (array!69934 (arr!33640 (Array (_ BitVec 32) ValueCell!12539)) (size!34176 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69933)

(declare-fun e!619643 () Bool)

(declare-fun array_inv!25963 (array!69933) Bool)

(assert (=> start!95842 (and (array_inv!25963 _values!874) e!619643)))

(declare-fun b!1084631 () Bool)

(declare-fun res!723086 () Bool)

(assert (=> b!1084631 (=> (not res!723086) (not e!619640))))

(assert (=> b!1084631 (= res!723086 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34175 _keys!1070))))))

(declare-fun b!1084632 () Bool)

(declare-fun e!619639 () Bool)

(assert (=> b!1084632 (= e!619639 tp_is_empty!26497)))

(declare-fun b!1084633 () Bool)

(declare-fun mapRes!41500 () Bool)

(assert (=> b!1084633 (= e!619643 (and e!619639 mapRes!41500))))

(declare-fun condMapEmpty!41500 () Bool)

(declare-fun mapDefault!41500 () ValueCell!12539)

