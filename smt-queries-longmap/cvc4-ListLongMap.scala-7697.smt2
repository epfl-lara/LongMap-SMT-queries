; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96638 () Bool)

(assert start!96638)

(declare-fun b_free!23111 () Bool)

(declare-fun b_next!23111 () Bool)

(assert (=> start!96638 (= b_free!23111 (not b_next!23111))))

(declare-fun tp!81271 () Bool)

(declare-fun b_and!36941 () Bool)

(assert (=> start!96638 (= tp!81271 b_and!36941)))

(declare-fun b!1099135 () Bool)

(declare-fun e!627342 () Bool)

(declare-fun e!627336 () Bool)

(assert (=> b!1099135 (= e!627342 e!627336)))

(declare-fun res!733517 () Bool)

(assert (=> b!1099135 (=> res!733517 e!627336)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1099135 (= res!733517 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((V!41341 0))(
  ( (V!41342 (val!13637 Int)) )
))
(declare-datatypes ((tuple2!17326 0))(
  ( (tuple2!17327 (_1!8674 (_ BitVec 64)) (_2!8674 V!41341)) )
))
(declare-datatypes ((List!23945 0))(
  ( (Nil!23942) (Cons!23941 (h!25150 tuple2!17326) (t!34102 List!23945)) )
))
(declare-datatypes ((ListLongMap!15295 0))(
  ( (ListLongMap!15296 (toList!7663 List!23945)) )
))
(declare-fun lt!492081 () ListLongMap!15295)

(declare-fun lt!492083 () ListLongMap!15295)

(assert (=> b!1099135 (= lt!492081 lt!492083)))

(declare-fun lt!492086 () ListLongMap!15295)

(declare-fun -!952 (ListLongMap!15295 (_ BitVec 64)) ListLongMap!15295)

(assert (=> b!1099135 (= lt!492081 (-!952 lt!492086 k!904))))

(declare-fun lt!492079 () ListLongMap!15295)

(declare-datatypes ((Unit!36144 0))(
  ( (Unit!36145) )
))
(declare-fun lt!492085 () Unit!36144)

(declare-fun zeroValue!831 () V!41341)

(declare-fun addRemoveCommutativeForDiffKeys!124 (ListLongMap!15295 (_ BitVec 64) V!41341 (_ BitVec 64)) Unit!36144)

(assert (=> b!1099135 (= lt!492085 (addRemoveCommutativeForDiffKeys!124 lt!492079 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!492080 () ListLongMap!15295)

(declare-fun lt!492082 () tuple2!17326)

(declare-fun +!3372 (ListLongMap!15295 tuple2!17326) ListLongMap!15295)

(assert (=> b!1099135 (= lt!492080 (+!3372 lt!492083 lt!492082))))

(declare-fun lt!492089 () ListLongMap!15295)

(declare-fun lt!492078 () tuple2!17326)

(assert (=> b!1099135 (= lt!492083 (+!3372 lt!492089 lt!492078))))

(declare-fun lt!492090 () ListLongMap!15295)

(declare-fun lt!492076 () ListLongMap!15295)

(assert (=> b!1099135 (= lt!492090 lt!492076)))

(assert (=> b!1099135 (= lt!492076 (+!3372 lt!492086 lt!492082))))

(assert (=> b!1099135 (= lt!492086 (+!3372 lt!492079 lt!492078))))

(declare-fun lt!492075 () ListLongMap!15295)

(assert (=> b!1099135 (= lt!492080 (+!3372 (+!3372 lt!492075 lt!492078) lt!492082))))

(declare-fun minValue!831 () V!41341)

(assert (=> b!1099135 (= lt!492082 (tuple2!17327 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1099135 (= lt!492078 (tuple2!17327 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1099136 () Bool)

(declare-fun res!733516 () Bool)

(declare-fun e!627335 () Bool)

(assert (=> b!1099136 (=> (not res!733516) (not e!627335))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1099136 (= res!733516 (validKeyInArray!0 k!904))))

(declare-fun b!1099137 () Bool)

(declare-fun e!627341 () Bool)

(declare-fun e!627340 () Bool)

(declare-fun mapRes!42514 () Bool)

(assert (=> b!1099137 (= e!627341 (and e!627340 mapRes!42514))))

(declare-fun condMapEmpty!42514 () Bool)

(declare-datatypes ((ValueCell!12871 0))(
  ( (ValueCellFull!12871 (v!16262 V!41341)) (EmptyCell!12871) )
))
(declare-datatypes ((array!71237 0))(
  ( (array!71238 (arr!34286 (Array (_ BitVec 32) ValueCell!12871)) (size!34822 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71237)

(declare-fun mapDefault!42514 () ValueCell!12871)

