; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!96714 () Bool)

(assert start!96714)

(declare-fun b_free!23135 () Bool)

(declare-fun b_next!23135 () Bool)

(assert (=> start!96714 (= b_free!23135 (not b_next!23135))))

(declare-fun tp!81350 () Bool)

(declare-fun b_and!37017 () Bool)

(assert (=> start!96714 (= tp!81350 b_and!37017)))

(declare-fun b!1100048 () Bool)

(declare-fun res!734080 () Bool)

(declare-fun e!627871 () Bool)

(assert (=> b!1100048 (=> (not res!734080) (not e!627871))))

(declare-fun mask!1414 () (_ BitVec 32))

(declare-datatypes ((array!71287 0))(
  ( (array!71288 (arr!34309 (Array (_ BitVec 32) (_ BitVec 64))) (size!34845 (_ BitVec 32))) )
))
(declare-fun _keys!1070 () array!71287)

(declare-datatypes ((V!41373 0))(
  ( (V!41374 (val!13649 Int)) )
))
(declare-datatypes ((ValueCell!12883 0))(
  ( (ValueCellFull!12883 (v!16276 V!41373)) (EmptyCell!12883) )
))
(declare-datatypes ((array!71289 0))(
  ( (array!71290 (arr!34310 (Array (_ BitVec 32) ValueCell!12883)) (size!34846 (_ BitVec 32))) )
))
(declare-fun _values!874 () array!71289)

(declare-fun extraKeys!811 () (_ BitVec 32))

(assert (=> b!1100048 (= res!734080 (and (= (size!34846 _values!874) (bvadd #b00000000000000000000000000000001 mask!1414)) (= (size!34845 _keys!1070) (size!34846 _values!874)) (bvsge mask!1414 #b00000000000000000000000000000000) (bvsge extraKeys!811 #b00000000000000000000000000000000) (bvsle extraKeys!811 #b00000000000000000000000000000011)))))

(declare-fun b!1100049 () Bool)

(declare-fun e!627866 () Bool)

(declare-fun k!904 () (_ BitVec 64))

(assert (=> b!1100049 (= e!627866 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k!904)))))

(declare-fun e!627868 () Bool)

(assert (=> b!1100049 e!627868))

(declare-fun res!734079 () Bool)

(assert (=> b!1100049 (=> (not res!734079) (not e!627868))))

(declare-datatypes ((tuple2!17350 0))(
  ( (tuple2!17351 (_1!8686 (_ BitVec 64)) (_2!8686 V!41373)) )
))
(declare-datatypes ((List!23968 0))(
  ( (Nil!23965) (Cons!23964 (h!25173 tuple2!17350) (t!34149 List!23968)) )
))
(declare-datatypes ((ListLongMap!15319 0))(
  ( (ListLongMap!15320 (toList!7675 List!23968)) )
))
(declare-fun lt!492742 () ListLongMap!15319)

(declare-fun lt!492735 () tuple2!17350)

(declare-fun lt!492736 () ListLongMap!15319)

(declare-fun +!3382 (ListLongMap!15319 tuple2!17350) ListLongMap!15319)

(assert (=> b!1100049 (= res!734079 (= lt!492736 (+!3382 lt!492742 lt!492735)))))

(declare-fun zeroValue!831 () V!41373)

(assert (=> b!1100049 (= lt!492735 (tuple2!17351 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!831))))

(declare-fun b!1100050 () Bool)

(declare-fun e!627864 () Bool)

(declare-fun tp_is_empty!27185 () Bool)

(assert (=> b!1100050 (= e!627864 tp_is_empty!27185)))

(declare-fun b!1100051 () Bool)

(declare-fun lt!492739 () ListLongMap!15319)

(assert (=> b!1100051 (= e!627868 (= lt!492736 (+!3382 lt!492739 lt!492735)))))

(declare-fun b!1100052 () Bool)

(declare-fun e!627870 () Bool)

(declare-fun e!627865 () Bool)

(declare-fun mapRes!42556 () Bool)

(assert (=> b!1100052 (= e!627870 (and e!627865 mapRes!42556))))

(declare-fun condMapEmpty!42556 () Bool)

(declare-fun mapDefault!42556 () ValueCell!12883)

