; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96710 () Bool)

(assert start!96710)

(declare-fun b_free!23131 () Bool)

(declare-fun b_next!23131 () Bool)

(assert (=> start!96710 (= b_free!23131 (not b_next!23131))))

(declare-fun tp!81338 () Bool)

(declare-fun b_and!37009 () Bool)

(assert (=> start!96710 (= tp!81338 b_and!37009)))

(declare-fun b!1099954 () Bool)

(declare-fun e!627817 () Bool)

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1099954 (= e!627817 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904)))))

(declare-fun e!627819 () Bool)

(assert (=> b!1099954 e!627819))

(declare-fun res!734006 () Bool)

(assert (=> b!1099954 (=> (not res!734006) (not e!627819))))

(declare-datatypes ((V!41369 0))(
  ( (V!41370 (val!13647 Int)) )
))
(declare-datatypes ((tuple2!17346 0))(
  ( (tuple2!17347 (_1!8684 (_ BitVec 64)) (_2!8684 V!41369)) )
))
(declare-datatypes ((List!23964 0))(
  ( (Nil!23961) (Cons!23960 (h!25169 tuple2!17346) (t!34141 List!23964)) )
))
(declare-datatypes ((ListLongMap!15315 0))(
  ( (ListLongMap!15316 (toList!7673 List!23964)) )
))
(declare-fun lt!492676 () ListLongMap!15315)

(declare-fun lt!492680 () tuple2!17346)

(declare-fun lt!492675 () ListLongMap!15315)

(declare-fun +!3380 (ListLongMap!15315 tuple2!17346) ListLongMap!15315)

(assert (=> b!1099954 (= res!734006 (= lt!492675 (+!3380 lt!492676 lt!492680)))))

(declare-fun zeroValue!831 () V!41369)

(assert (=> b!1099954 (= lt!492680 (tuple2!17347 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1099955 () Bool)

(declare-fun e!627816 () Bool)

(declare-fun e!627818 () Bool)

(assert (=> b!1099955 (= e!627816 e!627818)))

(declare-fun res!734016 () Bool)

(assert (=> b!1099955 (=> (not res!734016) (not e!627818))))

(declare-datatypes ((array!71279 0))(
  ( (array!71280 (arr!34305 (Array (_ BitVec 32) (_ BitVec 64))) (size!34841 (_ BitVec 32))) )
))
(declare-fun lt!492681 () array!71279)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71279 (_ BitVec 32)) Bool)

(assert (=> b!1099955 (= res!734016 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!492681 mask!1414))))

(declare-fun _keys!1070 () array!71279)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1099955 (= lt!492681 (array!71280 (store (arr!34305 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34841 _keys!1070)))))

(declare-fun b!1099956 () Bool)

(declare-fun res!734014 () Bool)

(assert (=> b!1099956 (=> (not res!734014) (not e!627816))))

(assert (=> b!1099956 (= res!734014 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34841 _keys!1070))))))

(declare-fun mapNonEmpty!42550 () Bool)

(declare-fun mapRes!42550 () Bool)

(declare-fun tp!81337 () Bool)

(declare-fun e!627821 () Bool)

(assert (=> mapNonEmpty!42550 (= mapRes!42550 (and tp!81337 e!627821))))

(declare-datatypes ((ValueCell!12881 0))(
  ( (ValueCellFull!12881 (v!16274 V!41369)) (EmptyCell!12881) )
))
(declare-datatypes ((array!71281 0))(
  ( (array!71282 (arr!34306 (Array (_ BitVec 32) ValueCell!12881)) (size!34842 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71281)

(declare-fun mapValue!42550 () ValueCell!12881)

(declare-fun mapKey!42550 () (_ BitVec 32))

(declare-fun mapRest!42550 () (Array (_ BitVec 32) ValueCell!12881))

(assert (=> mapNonEmpty!42550 (= (arr!34306 _values!874) (store mapRest!42550 mapKey!42550 mapValue!42550))))

(declare-fun b!1099957 () Bool)

(declare-fun res!734010 () Bool)

(assert (=> b!1099957 (=> (not res!734010) (not e!627819))))

(declare-fun lt!492683 () ListLongMap!15315)

(declare-fun lt!492678 () ListLongMap!15315)

(assert (=> b!1099957 (= res!734010 (= lt!492678 (+!3380 lt!492683 lt!492680)))))

(declare-fun b!1099958 () Bool)

(declare-fun res!734007 () Bool)

(assert (=> b!1099958 (=> (not res!734007) (not e!627816))))

(assert (=> b!1099958 (= res!734007 (= (select (arr!34305 _keys!1070) i!650) k!904))))

(declare-fun b!1099960 () Bool)

(declare-fun res!734017 () Bool)

(assert (=> b!1099960 (=> (not res!734017) (not e!627816))))

(declare-datatypes ((List!23965 0))(
  ( (Nil!23962) (Cons!23961 (h!25170 (_ BitVec 64)) (t!34142 List!23965)) )
))
(declare-fun arrayNoDuplicates!0 (array!71279 (_ BitVec 32) List!23965) Bool)

(assert (=> b!1099960 (= res!734017 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23962))))

(declare-fun b!1099961 () Bool)

(declare-fun e!627823 () Bool)

(declare-fun e!627822 () Bool)

(assert (=> b!1099961 (= e!627823 (and e!627822 mapRes!42550))))

(declare-fun condMapEmpty!42550 () Bool)

(declare-fun mapDefault!42550 () ValueCell!12881)

