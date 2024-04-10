; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96622 () Bool)

(assert start!96622)

(declare-fun b_free!23095 () Bool)

(declare-fun b_next!23095 () Bool)

(assert (=> start!96622 (= b_free!23095 (not b_next!23095))))

(declare-fun tp!81224 () Bool)

(declare-fun b_and!36909 () Bool)

(assert (=> start!96622 (= tp!81224 b_and!36909)))

(declare-fun mapNonEmpty!42490 () Bool)

(declare-fun mapRes!42490 () Bool)

(declare-fun tp!81223 () Bool)

(declare-fun e!627143 () Bool)

(assert (=> mapNonEmpty!42490 (= mapRes!42490 (and tp!81223 e!627143))))

(declare-datatypes ((V!41321 0))(
  ( (V!41322 (val!13629 Int)) )
))
(declare-datatypes ((ValueCell!12863 0))(
  ( (ValueCellFull!12863 (v!16254 V!41321)) (EmptyCell!12863) )
))
(declare-datatypes ((array!71205 0))(
  ( (array!71206 (arr!34270 (Array (_ BitVec 32) ValueCell!12863)) (size!34806 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71205)

(declare-fun mapKey!42490 () (_ BitVec 32))

(declare-fun mapValue!42490 () ValueCell!12863)

(declare-fun mapRest!42490 () (Array (_ BitVec 32) ValueCell!12863))

(assert (=> mapNonEmpty!42490 (= (arr!34270 _values!874) (store mapRest!42490 mapKey!42490 mapValue!42490))))

(declare-fun b!1098782 () Bool)

(declare-fun e!627148 () Bool)

(declare-fun e!627147 () Bool)

(assert (=> b!1098782 (= e!627148 e!627147)))

(declare-fun res!733261 () Bool)

(assert (=> b!1098782 (=> res!733261 e!627147)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1098782 (= res!733261 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((tuple2!17312 0))(
  ( (tuple2!17313 (_1!8667 (_ BitVec 64)) (_2!8667 V!41321)) )
))
(declare-datatypes ((List!23932 0))(
  ( (Nil!23929) (Cons!23928 (h!25137 tuple2!17312) (t!34073 List!23932)) )
))
(declare-datatypes ((ListLongMap!15281 0))(
  ( (ListLongMap!15282 (toList!7656 List!23932)) )
))
(declare-fun lt!491673 () ListLongMap!15281)

(declare-fun lt!491675 () ListLongMap!15281)

(assert (=> b!1098782 (= lt!491673 lt!491675)))

(declare-fun lt!491668 () ListLongMap!15281)

(declare-fun -!945 (ListLongMap!15281 (_ BitVec 64)) ListLongMap!15281)

(assert (=> b!1098782 (= lt!491673 (-!945 lt!491668 k!904))))

(declare-datatypes ((Unit!36130 0))(
  ( (Unit!36131) )
))
(declare-fun lt!491667 () Unit!36130)

(declare-fun lt!491678 () ListLongMap!15281)

(declare-fun zeroValue!831 () V!41321)

(declare-fun addRemoveCommutativeForDiffKeys!117 (ListLongMap!15281 (_ BitVec 64) V!41321 (_ BitVec 64)) Unit!36130)

(assert (=> b!1098782 (= lt!491667 (addRemoveCommutativeForDiffKeys!117 lt!491678 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831 k!904))))

(declare-fun lt!491669 () ListLongMap!15281)

(declare-fun lt!491671 () tuple2!17312)

(declare-fun +!3365 (ListLongMap!15281 tuple2!17312) ListLongMap!15281)

(assert (=> b!1098782 (= lt!491669 (+!3365 lt!491675 lt!491671))))

(declare-fun lt!491666 () ListLongMap!15281)

(declare-fun lt!491677 () tuple2!17312)

(assert (=> b!1098782 (= lt!491675 (+!3365 lt!491666 lt!491677))))

(declare-fun lt!491679 () ListLongMap!15281)

(declare-fun lt!491681 () ListLongMap!15281)

(assert (=> b!1098782 (= lt!491679 lt!491681)))

(assert (=> b!1098782 (= lt!491681 (+!3365 lt!491668 lt!491671))))

(assert (=> b!1098782 (= lt!491668 (+!3365 lt!491678 lt!491677))))

(declare-fun lt!491680 () ListLongMap!15281)

(assert (=> b!1098782 (= lt!491669 (+!3365 (+!3365 lt!491680 lt!491677) lt!491671))))

(declare-fun minValue!831 () V!41321)

(assert (=> b!1098782 (= lt!491671 (tuple2!17313 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(assert (=> b!1098782 (= lt!491677 (tuple2!17313 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1098783 () Bool)

(declare-fun tp_is_empty!27145 () Bool)

(assert (=> b!1098783 (= e!627143 tp_is_empty!27145)))

(declare-fun b!1098784 () Bool)

(declare-fun res!733260 () Bool)

(declare-fun e!627150 () Bool)

(assert (=> b!1098784 (=> (not res!733260) (not e!627150))))

(declare-fun i!650 () (_ BitVec 32))

(declare-datatypes ((array!71207 0))(
  ( (array!71208 (arr!34271 (Array (_ BitVec 32) (_ BitVec 64))) (size!34807 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71207)

(assert (=> b!1098784 (= res!733260 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34807 _keys!1070))))))

(declare-fun b!1098785 () Bool)

(declare-fun e!627146 () Bool)

(declare-fun e!627149 () Bool)

(assert (=> b!1098785 (= e!627146 (and e!627149 mapRes!42490))))

(declare-fun condMapEmpty!42490 () Bool)

(declare-fun mapDefault!42490 () ValueCell!12863)

