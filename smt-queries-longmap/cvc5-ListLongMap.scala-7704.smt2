; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96754 () Bool)

(assert start!96754)

(declare-fun b_free!23149 () Bool)

(declare-fun b_next!23149 () Bool)

(assert (=> start!96754 (= b_free!23149 (not b_next!23149))))

(declare-fun tp!81394 () Bool)

(declare-fun b_and!37059 () Bool)

(assert (=> start!96754 (= tp!81394 b_and!37059)))

(declare-fun mapIsEmpty!42580 () Bool)

(declare-fun mapRes!42580 () Bool)

(assert (=> mapIsEmpty!42580 mapRes!42580))

(declare-fun b!1100558 () Bool)

(declare-fun e!628164 () Bool)

(declare-fun e!628168 () Bool)

(assert (=> b!1100558 (= e!628164 e!628168)))

(declare-fun res!734408 () Bool)

(assert (=> b!1100558 (=> res!734408 e!628168)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1100558 (= res!734408 (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((V!41393 0))(
  ( (V!41394 (val!13656 Int)) )
))
(declare-datatypes ((tuple2!17364 0))(
  ( (tuple2!17365 (_1!8693 (_ BitVec 64)) (_2!8693 V!41393)) )
))
(declare-datatypes ((List!23979 0))(
  ( (Nil!23976) (Cons!23975 (h!25184 tuple2!17364) (t!34174 List!23979)) )
))
(declare-datatypes ((ListLongMap!15333 0))(
  ( (ListLongMap!15334 (toList!7682 List!23979)) )
))
(declare-fun lt!493168 () ListLongMap!15333)

(declare-fun lt!493167 () ListLongMap!15333)

(assert (=> b!1100558 (= lt!493168 lt!493167)))

(declare-fun lt!493165 () ListLongMap!15333)

(declare-fun lt!493171 () tuple2!17364)

(declare-fun +!3387 (ListLongMap!15333 tuple2!17364) ListLongMap!15333)

(assert (=> b!1100558 (= lt!493167 (+!3387 lt!493165 lt!493171))))

(declare-fun lt!493169 () ListLongMap!15333)

(declare-fun lt!493166 () ListLongMap!15333)

(assert (=> b!1100558 (= lt!493169 lt!493166)))

(declare-fun lt!493173 () ListLongMap!15333)

(assert (=> b!1100558 (= lt!493166 (+!3387 lt!493173 lt!493171))))

(declare-fun lt!493161 () ListLongMap!15333)

(assert (=> b!1100558 (= lt!493168 (+!3387 lt!493161 lt!493171))))

(declare-fun zeroValue!831 () V!41393)

(assert (=> b!1100558 (= lt!493171 (tuple2!17365 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1100559 () Bool)

(declare-fun res!734411 () Bool)

(declare-fun e!628163 () Bool)

(assert (=> b!1100559 (=> (not res!734411) (not e!628163))))

(declare-datatypes ((array!71317 0))(
  ( (array!71318 (arr!34323 (Array (_ BitVec 32) (_ BitVec 64))) (size!34859 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71317)

(declare-datatypes ((List!23980 0))(
  ( (Nil!23977) (Cons!23976 (h!25185 (_ BitVec 64)) (t!34175 List!23980)) )
))
(declare-fun arrayNoDuplicates!0 (array!71317 (_ BitVec 32) List!23980) Bool)

(assert (=> b!1100559 (= res!734411 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23977))))

(declare-fun b!1100560 () Bool)

(declare-fun res!734403 () Bool)

(declare-fun e!628169 () Bool)

(assert (=> b!1100560 (=> (not res!734403) (not e!628169))))

(declare-fun lt!493163 () array!71317)

(assert (=> b!1100560 (= res!734403 (arrayNoDuplicates!0 lt!493163 #b00000000000000000000000000000000 Nil!23977))))

(declare-fun b!1100561 () Bool)

(declare-fun res!734410 () Bool)

(assert (=> b!1100561 (=> (not res!734410) (not e!628163))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((ValueCell!12890 0))(
  ( (ValueCellFull!12890 (v!16284 V!41393)) (EmptyCell!12890) )
))
(declare-datatypes ((array!71319 0))(
  ( (array!71320 (arr!34324 (Array (_ BitVec 32) ValueCell!12890)) (size!34860 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71319)

(assert (=> b!1100561 (= res!734410 (and (= (size!34860 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34859 _keys!1070) (size!34860 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100563 () Bool)

(declare-fun res!734406 () Bool)

(assert (=> b!1100563 (=> (not res!734406) (not e!628163))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!71317 (_ BitVec 32)) Bool)

(assert (=> b!1100563 (= res!734406 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1100564 () Bool)

(declare-fun e!628170 () Bool)

(declare-fun e!628165 () Bool)

(assert (=> b!1100564 (= e!628170 (and e!628165 mapRes!42580))))

(declare-fun condMapEmpty!42580 () Bool)

(declare-fun mapDefault!42580 () ValueCell!12890)

