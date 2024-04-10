; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96124 () Bool)

(assert start!96124)

(declare-fun b_free!22777 () Bool)

(declare-fun b_next!22777 () Bool)

(assert (=> start!96124 (= b_free!22777 (not b_next!22777))))

(declare-fun tp!80180 () Bool)

(declare-fun b_and!36229 () Bool)

(assert (=> start!96124 (= tp!80180 b_and!36229)))

(declare-fun b!1090843 () Bool)

(declare-fun e!623018 () Bool)

(declare-fun tp_is_empty!26779 () Bool)

(assert (=> b!1090843 (= e!623018 tp_is_empty!26779)))

(declare-fun b!1090844 () Bool)

(declare-fun res!727761 () Bool)

(declare-fun e!623017 () Bool)

(assert (=> b!1090844 (=> (not res!727761) (not e!623017))))

(declare-datatypes ((array!70479 0))(
  ( (array!70480 (arr!33913 (Array (_ BitVec 32) (_ BitVec 64))) (size!34449 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!70479)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70479 (_ BitVec 32)) Bool)

(assert (=> b!1090844 (= res!727761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1090845 () Bool)

(declare-fun e!623012 () Bool)

(declare-fun e!623014 () Bool)

(assert (=> b!1090845 (= e!623012 e!623014)))

(declare-fun res!727758 () Bool)

(assert (=> b!1090845 (=> res!727758 e!623014)))

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1090845 (= res!727758 (= #b1000000000000000000000000000000000000000000000000000000000000000 k!904))))

(declare-datatypes ((V!40833 0))(
  ( (V!40834 (val!13446 Int)) )
))
(declare-datatypes ((tuple2!17096 0))(
  ( (tuple2!17097 (_1!8559 (_ BitVec 64)) (_2!8559 V!40833)) )
))
(declare-datatypes ((List!23683 0))(
  ( (Nil!23680) (Cons!23679 (h!24888 tuple2!17096) (t!33518 List!23683)) )
))
(declare-datatypes ((ListLongMap!15065 0))(
  ( (ListLongMap!15066 (toList!7548 List!23683)) )
))
(declare-fun lt!486892 () ListLongMap!15065)

(declare-fun lt!486894 () ListLongMap!15065)

(assert (=> b!1090845 (= lt!486892 lt!486894)))

(declare-fun lt!486904 () ListLongMap!15065)

(declare-fun lt!486901 () tuple2!17096)

(declare-fun +!3335 (ListLongMap!15065 tuple2!17096) ListLongMap!15065)

(assert (=> b!1090845 (= lt!486894 (+!3335 lt!486904 lt!486901))))

(declare-fun lt!486899 () ListLongMap!15065)

(declare-fun lt!486897 () ListLongMap!15065)

(assert (=> b!1090845 (= lt!486899 lt!486897)))

(declare-fun lt!486893 () ListLongMap!15065)

(assert (=> b!1090845 (= lt!486897 (+!3335 lt!486893 lt!486901))))

(declare-fun lt!486898 () ListLongMap!15065)

(assert (=> b!1090845 (= lt!486899 (+!3335 lt!486898 lt!486901))))

(declare-fun minValue!831 () V!40833)

(assert (=> b!1090845 (= lt!486901 (tuple2!17097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!831))))

(declare-fun b!1090846 () Bool)

(declare-fun res!727757 () Bool)

(declare-fun e!623015 () Bool)

(assert (=> b!1090846 (=> (not res!727757) (not e!623015))))

(declare-fun lt!486895 () array!70479)

(declare-datatypes ((List!23684 0))(
  ( (Nil!23681) (Cons!23680 (h!24889 (_ BitVec 64)) (t!33519 List!23684)) )
))
(declare-fun arrayNoDuplicates!0 (array!70479 (_ BitVec 32) List!23684) Bool)

(assert (=> b!1090846 (= res!727757 (arrayNoDuplicates!0 lt!486895 #b00000000000000000000000000000000 Nil!23681))))

(declare-fun mapNonEmpty!41923 () Bool)

(declare-fun mapRes!41923 () Bool)

(declare-fun tp!80179 () Bool)

(assert (=> mapNonEmpty!41923 (= mapRes!41923 (and tp!80179 e!623018))))

(declare-datatypes ((ValueCell!12680 0))(
  ( (ValueCellFull!12680 (v!16067 V!40833)) (EmptyCell!12680) )
))
(declare-datatypes ((array!70481 0))(
  ( (array!70482 (arr!33914 (Array (_ BitVec 32) ValueCell!12680)) (size!34450 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70481)

(declare-fun mapValue!41923 () ValueCell!12680)

(declare-fun mapRest!41923 () (Array (_ BitVec 32) ValueCell!12680))

(declare-fun mapKey!41923 () (_ BitVec 32))

(assert (=> mapNonEmpty!41923 (= (arr!33914 _values!874) (store mapRest!41923 mapKey!41923 mapValue!41923))))

(declare-fun b!1090847 () Bool)

(declare-fun res!727763 () Bool)

(assert (=> b!1090847 (=> (not res!727763) (not e!623017))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1090847 (= res!727763 (and (= (size!34450 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34449 _keys!1070) (size!34450 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!41923 () Bool)

(assert (=> mapIsEmpty!41923 mapRes!41923))

(declare-fun b!1090848 () Bool)

(declare-fun res!727754 () Bool)

(assert (=> b!1090848 (=> (not res!727754) (not e!623017))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1090848 (= res!727754 (validKeyInArray!0 k!904))))

(declare-fun b!1090849 () Bool)

(declare-fun res!727755 () Bool)

(assert (=> b!1090849 (=> (not res!727755) (not e!623017))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1090849 (= res!727755 (= (select (arr!33913 _keys!1070) i!650) k!904))))

(declare-fun res!727764 () Bool)

(assert (=> start!96124 (=> (not res!727764) (not e!623017))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96124 (= res!727764 (validMask!0 mask!1414))))

(assert (=> start!96124 e!623017))

(assert (=> start!96124 tp!80180))

(assert (=> start!96124 true))

(assert (=> start!96124 tp_is_empty!26779))

(declare-fun array_inv!26150 (array!70479) Bool)

(assert (=> start!96124 (array_inv!26150 _keys!1070)))

(declare-fun e!623013 () Bool)

(declare-fun array_inv!26151 (array!70481) Bool)

(assert (=> start!96124 (and (array_inv!26151 _values!874) e!623013)))

(declare-fun b!1090850 () Bool)

(declare-fun e!623016 () Bool)

(assert (=> b!1090850 (= e!623013 (and e!623016 mapRes!41923))))

(declare-fun condMapEmpty!41923 () Bool)

(declare-fun mapDefault!41923 () ValueCell!12680)

