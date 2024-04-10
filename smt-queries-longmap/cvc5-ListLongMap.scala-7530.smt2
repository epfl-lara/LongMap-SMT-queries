; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95484 () Bool)

(assert start!95484)

(declare-fun b!1078253 () Bool)

(declare-fun res!718476 () Bool)

(declare-fun e!616518 () Bool)

(assert (=> b!1078253 (=> (not res!718476) (not e!616518))))

(declare-datatypes ((array!69265 0))(
  ( (array!69266 (arr!33307 (Array (_ BitVec 32) (_ BitVec 64))) (size!33843 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69265)

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69265 (_ BitVec 32)) Bool)

(assert (=> b!1078253 (= res!718476 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1070 mask!1414))))

(declare-fun b!1078254 () Bool)

(declare-fun res!718475 () Bool)

(assert (=> b!1078254 (=> (not res!718475) (not e!616518))))

(declare-fun k!904 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078254 (= res!718475 (validKeyInArray!0 k!904))))

(declare-fun mapNonEmpty!40984 () Bool)

(declare-fun mapRes!40984 () Bool)

(declare-fun tp!78446 () Bool)

(declare-fun e!616514 () Bool)

(assert (=> mapNonEmpty!40984 (= mapRes!40984 (and tp!78446 e!616514))))

(declare-datatypes ((V!40001 0))(
  ( (V!40002 (val!13134 Int)) )
))
(declare-datatypes ((ValueCell!12368 0))(
  ( (ValueCellFull!12368 (v!15755 V!40001)) (EmptyCell!12368) )
))
(declare-fun mapRest!40984 () (Array (_ BitVec 32) ValueCell!12368))

(declare-datatypes ((array!69267 0))(
  ( (array!69268 (arr!33308 (Array (_ BitVec 32) ValueCell!12368)) (size!33844 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69267)

(declare-fun mapKey!40984 () (_ BitVec 32))

(declare-fun mapValue!40984 () ValueCell!12368)

(assert (=> mapNonEmpty!40984 (= (arr!33308 _values!874) (store mapRest!40984 mapKey!40984 mapValue!40984))))

(declare-fun b!1078255 () Bool)

(declare-fun res!718474 () Bool)

(assert (=> b!1078255 (=> (not res!718474) (not e!616518))))

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1078255 (= res!718474 (and (= (size!33844 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33843 _keys!1070) (size!33844 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078256 () Bool)

(declare-fun tp_is_empty!26155 () Bool)

(assert (=> b!1078256 (= e!616514 tp_is_empty!26155)))

(declare-fun b!1078257 () Bool)

(declare-fun e!616519 () Bool)

(assert (=> b!1078257 (= e!616519 false)))

(declare-fun lt!478602 () Bool)

(declare-fun lt!478603 () array!69265)

(declare-datatypes ((List!23233 0))(
  ( (Nil!23230) (Cons!23229 (h!24438 (_ BitVec 64)) (t!32592 List!23233)) )
))
(declare-fun arrayNoDuplicates!0 (array!69265 (_ BitVec 32) List!23233) Bool)

(assert (=> b!1078257 (= lt!478602 (arrayNoDuplicates!0 lt!478603 #b00000000000000000000000000000000 Nil!23230))))

(declare-fun b!1078258 () Bool)

(declare-fun e!616516 () Bool)

(assert (=> b!1078258 (= e!616516 tp_is_empty!26155)))

(declare-fun b!1078259 () Bool)

(assert (=> b!1078259 (= e!616518 e!616519)))

(declare-fun res!718472 () Bool)

(assert (=> b!1078259 (=> (not res!718472) (not e!616519))))

(assert (=> b!1078259 (= res!718472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478603 mask!1414))))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078259 (= lt!478603 (array!69266 (store (arr!33307 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33843 _keys!1070)))))

(declare-fun b!1078260 () Bool)

(declare-fun res!718471 () Bool)

(assert (=> b!1078260 (=> (not res!718471) (not e!616518))))

(assert (=> b!1078260 (= res!718471 (= (select (arr!33307 _keys!1070) i!650) k!904))))

(declare-fun b!1078261 () Bool)

(declare-fun e!616517 () Bool)

(assert (=> b!1078261 (= e!616517 (and e!616516 mapRes!40984))))

(declare-fun condMapEmpty!40984 () Bool)

(declare-fun mapDefault!40984 () ValueCell!12368)

