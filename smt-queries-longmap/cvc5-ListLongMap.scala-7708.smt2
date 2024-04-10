; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96830 () Bool)

(assert start!96830)

(declare-fun b_free!23173 () Bool)

(declare-fun b_next!23173 () Bool)

(assert (=> start!96830 (= b_free!23173 (not b_next!23173))))

(declare-fun tp!81472 () Bool)

(declare-fun b_and!37135 () Bool)

(assert (=> start!96830 (= tp!81472 b_and!37135)))

(declare-fun b!1101468 () Bool)

(declare-fun res!734969 () Bool)

(declare-fun e!628698 () Bool)

(assert (=> b!1101468 (=> (not res!734969) (not e!628698))))

(declare-datatypes ((V!41425 0))(
  ( (V!41426 (val!13668 Int)) )
))
(declare-datatypes ((tuple2!17380 0))(
  ( (tuple2!17381 (_1!8701 (_ BitVec 64)) (_2!8701 V!41425)) )
))
(declare-datatypes ((List!23996 0))(
  ( (Nil!23993) (Cons!23992 (h!25201 tuple2!17380) (t!34215 List!23996)) )
))
(declare-datatypes ((ListLongMap!15349 0))(
  ( (ListLongMap!15350 (toList!7690 List!23996)) )
))
(declare-fun lt!493842 () ListLongMap!15349)

(declare-fun lt!493847 () tuple2!17380)

(declare-fun lt!493843 () ListLongMap!15349)

(declare-fun +!3395 (ListLongMap!15349 tuple2!17380) ListLongMap!15349)

(assert (=> b!1101468 (= res!734969 (= lt!493843 (+!3395 lt!493842 lt!493847)))))

(declare-fun b!1101469 () Bool)

(declare-fun res!734963 () Bool)

(declare-fun e!628697 () Bool)

(assert (=> b!1101469 (=> (not res!734963) (not e!628697))))

(declare-datatypes ((array!71367 0))(
  ( (array!71368 (arr!34346 (Array (_ BitVec 32) (_ BitVec 64))) (size!34882 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71367)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71367 (_ BitVec 32)) Bool)

(assert (=> b!1101469 (= res!734963 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1101470 () Bool)

(declare-fun res!734966 () Bool)

(assert (=> b!1101470 (=> (not res!734966) (not e!628697))))

(declare-datatypes ((ValueCell!12902 0))(
  ( (ValueCellFull!12902 (v!16298 V!41425)) (EmptyCell!12902) )
))
(declare-datatypes ((array!71369 0))(
  ( (array!71370 (arr!34347 (Array (_ BitVec 32) ValueCell!12902)) (size!34883 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71369)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1101470 (= res!734966 (and (= (size!34883 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34882 _keys!1070) (size!34883 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1101471 () Bool)

(declare-fun e!628699 () Bool)

(declare-fun tp_is_empty!27223 () Bool)

(assert (=> b!1101471 (= e!628699 tp_is_empty!27223)))

(declare-fun b!1101472 () Bool)

(declare-fun e!628695 () Bool)

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1101472 (= e!628695 (not (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904)))))

(assert (=> b!1101472 e!628698))

(declare-fun res!734965 () Bool)

(assert (=> b!1101472 (=> (not res!734965) (not e!628698))))

(declare-fun lt!493840 () ListLongMap!15349)

(assert (=> b!1101472 (= res!734965 (= lt!493843 (+!3395 lt!493840 lt!493847)))))

(declare-fun minValue!831 () V!41425)

(assert (=> b!1101472 (= lt!493847 (tuple2!17381 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1101473 () Bool)

(declare-fun e!628700 () Bool)

(declare-fun mapRes!42622 () Bool)

(assert (=> b!1101473 (= e!628700 (and e!628699 mapRes!42622))))

(declare-fun condMapEmpty!42622 () Bool)

(declare-fun mapDefault!42622 () ValueCell!12902)

