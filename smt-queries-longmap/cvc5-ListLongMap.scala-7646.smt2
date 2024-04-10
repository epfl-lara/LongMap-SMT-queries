; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96196 () Bool)

(assert start!96196)

(declare-fun b_free!22849 () Bool)

(declare-fun b_next!22849 () Bool)

(assert (=> start!96196 (= b_free!22849 (not b_next!22849))))

(declare-fun tp!80396 () Bool)

(declare-fun b_and!36373 () Bool)

(assert (=> start!96196 (= tp!80396 b_and!36373)))

(declare-fun b!1092405 () Bool)

(declare-fun e!623858 () Bool)

(declare-fun e!623855 () Bool)

(assert (=> b!1092405 (= e!623858 e!623855)))

(declare-fun res!728928 () Bool)

(assert (=> b!1092405 (=> (not res!728928) (not e!623855))))

(declare-datatypes ((array!70621 0))(
  ( (array!70622 (arr!33984 (Array (_ BitVec 32) (_ BitVec 64))) (size!34520 (_ BitVec 32))) )
))
(declare-fun lt!488259 () array!70621)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!70621 (_ BitVec 32)) Bool)

(assert (=> b!1092405 (= res!728928 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!488259 mask!1414))))

(declare-fun _keys!1070 () array!70621)

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1092405 (= lt!488259 (array!70622 (store (arr!33984 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!34520 _keys!1070)))))

(declare-fun b!1092406 () Bool)

(declare-fun e!623853 () Bool)

(declare-fun tp_is_empty!26851 () Bool)

(assert (=> b!1092406 (= e!623853 tp_is_empty!26851)))

(declare-fun b!1092407 () Bool)

(declare-fun res!728927 () Bool)

(assert (=> b!1092407 (=> (not res!728927) (not e!623858))))

(assert (=> b!1092407 (= res!728927 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!34520 _keys!1070))))))

(declare-fun b!1092408 () Bool)

(declare-fun e!623856 () Bool)

(assert (=> b!1092408 (= e!623856 tp_is_empty!26851)))

(declare-fun b!1092409 () Bool)

(declare-fun res!728923 () Bool)

(assert (=> b!1092409 (=> (not res!728923) (not e!623858))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40929 0))(
  ( (V!40930 (val!13482 Int)) )
))
(declare-datatypes ((ValueCell!12716 0))(
  ( (ValueCellFull!12716 (v!16103 V!40929)) (EmptyCell!12716) )
))
(declare-datatypes ((array!70623 0))(
  ( (array!70624 (arr!33985 (Array (_ BitVec 32) ValueCell!12716)) (size!34521 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!70623)

(assert (=> b!1092409 (= res!728923 (and (= (size!34521 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34520 _keys!1070) (size!34521 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1092410 () Bool)

(declare-fun res!728926 () Bool)

(assert (=> b!1092410 (=> (not res!728926) (not e!623858))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1092410 (= res!728926 (validKeyInArray!0 k!904))))

(declare-fun b!1092411 () Bool)

(declare-fun res!728925 () Bool)

(assert (=> b!1092411 (=> (not res!728925) (not e!623855))))

(declare-datatypes ((List!23740 0))(
  ( (Nil!23737) (Cons!23736 (h!24945 (_ BitVec 64)) (t!33647 List!23740)) )
))
(declare-fun arrayNoDuplicates!0 (array!70621 (_ BitVec 32) List!23740) Bool)

(assert (=> b!1092411 (= res!728925 (arrayNoDuplicates!0 lt!488259 #b00000000000000000000000000000000 Nil!23737))))

(declare-fun res!728924 () Bool)

(assert (=> start!96196 (=> (not res!728924) (not e!623858))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!96196 (= res!728924 (validMask!0 mask!1414))))

(assert (=> start!96196 e!623858))

(assert (=> start!96196 tp!80396))

(assert (=> start!96196 true))

(assert (=> start!96196 tp_is_empty!26851))

(declare-fun array_inv!26200 (array!70621) Bool)

(assert (=> start!96196 (array_inv!26200 _keys!1070)))

(declare-fun e!623857 () Bool)

(declare-fun array_inv!26201 (array!70623) Bool)

(assert (=> start!96196 (and (array_inv!26201 _values!874) e!623857)))

(declare-fun b!1092412 () Bool)

(declare-fun res!728920 () Bool)

(assert (=> b!1092412 (=> (not res!728920) (not e!623858))))

(assert (=> b!1092412 (= res!728920 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23737))))

(declare-fun b!1092413 () Bool)

(declare-fun mapRes!42031 () Bool)

(assert (=> b!1092413 (= e!623857 (and e!623856 mapRes!42031))))

(declare-fun condMapEmpty!42031 () Bool)

(declare-fun mapDefault!42031 () ValueCell!12716)

