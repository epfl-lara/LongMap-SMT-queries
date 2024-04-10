; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!95488 () Bool)

(assert start!95488)

(declare-fun b!1078319 () Bool)

(declare-fun res!718525 () Bool)

(declare-fun e!616552 () Bool)

(assert (=> b!1078319 (=> (not res!718525) (not e!616552))))

(declare-datatypes ((array!69273 0))(
  ( (array!69274 (arr!33311 (Array (_ BitVec 32) (_ BitVec 64))) (size!33847 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!69273)

(declare-fun k!904 () (_ BitVec 64))

(declare-fun i!650 () (_ BitVec 32))

(assert (=> b!1078319 (= res!718525 (= (select (arr!33311 _keys!1070) i!650) k!904))))

(declare-fun b!1078320 () Bool)

(declare-fun res!718524 () Bool)

(assert (=> b!1078320 (=> (not res!718524) (not e!616552))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1078320 (= res!718524 (validKeyInArray!0 k!904))))

(declare-fun b!1078321 () Bool)

(declare-fun res!718523 () Bool)

(assert (=> b!1078321 (=> (not res!718523) (not e!616552))))

(declare-datatypes ((List!23235 0))(
  ( (Nil!23232) (Cons!23231 (h!24440 (_ BitVec 64)) (t!32594 List!23235)) )
))
(declare-fun arrayNoDuplicates!0 (array!69273 (_ BitVec 32) List!23235) Bool)

(assert (=> b!1078321 (= res!718523 (arrayNoDuplicates!0 _keys!1070 #b00000000000000000000000000000000 Nil!23232))))

(declare-fun b!1078322 () Bool)

(declare-fun res!718520 () Bool)

(assert (=> b!1078322 (=> (not res!718520) (not e!616552))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-fun extraKeys!811 () (_ BitVec 32))

(declare-datatypes ((V!40005 0))(
  ( (V!40006 (val!13136 Int)) )
))
(declare-datatypes ((ValueCell!12370 0))(
  ( (ValueCellFull!12370 (v!15757 V!40005)) (EmptyCell!12370) )
))
(declare-datatypes ((array!69275 0))(
  ( (array!69276 (arr!33312 (Array (_ BitVec 32) ValueCell!12370)) (size!33848 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!69275)

(assert (=> b!1078322 (= res!718520 (and (= (size!33848 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!33847 _keys!1070) (size!33848 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1078324 () Bool)

(declare-fun e!616550 () Bool)

(declare-fun tp_is_empty!26159 () Bool)

(assert (=> b!1078324 (= e!616550 tp_is_empty!26159)))

(declare-fun mapIsEmpty!40990 () Bool)

(declare-fun mapRes!40990 () Bool)

(assert (=> mapIsEmpty!40990 mapRes!40990))

(declare-fun b!1078325 () Bool)

(declare-fun e!616555 () Bool)

(assert (=> b!1078325 (= e!616555 tp_is_empty!26159)))

(declare-fun b!1078326 () Bool)

(declare-fun res!718521 () Bool)

(assert (=> b!1078326 (=> (not res!718521) (not e!616552))))

(assert (=> b!1078326 (= res!718521 (and (bvsge i!650 #b00000000000000000000000000000000) (bvslt i!650 (size!33847 _keys!1070))))))

(declare-fun mapNonEmpty!40990 () Bool)

(declare-fun tp!78452 () Bool)

(assert (=> mapNonEmpty!40990 (= mapRes!40990 (and tp!78452 e!616555))))

(declare-fun mapValue!40990 () ValueCell!12370)

(declare-fun mapKey!40990 () (_ BitVec 32))

(declare-fun mapRest!40990 () (Array (_ BitVec 32) ValueCell!12370))

(assert (=> mapNonEmpty!40990 (= (arr!33312 _values!874) (store mapRest!40990 mapKey!40990 mapValue!40990))))

(declare-fun b!1078327 () Bool)

(declare-fun e!616553 () Bool)

(assert (=> b!1078327 (= e!616553 false)))

(declare-fun lt!478615 () Bool)

(declare-fun lt!478614 () array!69273)

(assert (=> b!1078327 (= lt!478615 (arrayNoDuplicates!0 lt!478614 #b00000000000000000000000000000000 Nil!23232))))

(declare-fun b!1078328 () Bool)

(assert (=> b!1078328 (= e!616552 e!616553)))

(declare-fun res!718522 () Bool)

(assert (=> b!1078328 (=> (not res!718522) (not e!616553))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!69273 (_ BitVec 32)) Bool)

(assert (=> b!1078328 (= res!718522 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!478614 mask!1414))))

(assert (=> b!1078328 (= lt!478614 (array!69274 (store (arr!33311 _keys!1070) i!650 #b1000000000000000000000000000000000000000000000000000000000000000) (size!33847 _keys!1070)))))

(declare-fun b!1078329 () Bool)

(declare-fun e!616554 () Bool)

(assert (=> b!1078329 (= e!616554 (and e!616550 mapRes!40990))))

(declare-fun condMapEmpty!40990 () Bool)

(declare-fun mapDefault!40990 () ValueCell!12370)

