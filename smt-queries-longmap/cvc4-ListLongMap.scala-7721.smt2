; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!97004 () Bool)

(assert start!97004)

(declare-fun b!1103437 () Bool)

(declare-fun e!629887 () Bool)

(declare-fun tp_is_empty!27305 () Bool)

(assert (=> b!1103437 (= e!629887 tp_is_empty!27305)))

(declare-fun b!1103438 () Bool)

(declare-fun res!736159 () Bool)

(declare-fun e!629882 () Bool)

(assert (=> b!1103438 (=> (not res!736159) (not e!629882))))

(declare-datatypes ((array!71533 0))(
  ( (array!71534 (arr!34424 (Array (_ BitVec 32) (_ BitVec 64))) (size!34960 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!71533)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!41533 0))(
  ( (V!41534 (val!13709 Int)) )
))
(declare-datatypes ((ValueCell!12943 0))(
  ( (ValueCellFull!12943 (v!16340 V!41533)) (EmptyCell!12943) )
))
(declare-datatypes ((array!71535 0))(
  ( (array!71536 (arr!34425 (Array (_ BitVec 32) ValueCell!12943)) (size!34961 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!71535)

(assert (=> b!1103438 (= res!736159 (and (= (size!34961 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!34960 _keys!1208) (size!34961 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1103439 () Bool)

(declare-fun res!736157 () Bool)

(assert (=> b!1103439 (=> (not res!736157) (not e!629882))))

(declare-datatypes ((List!24039 0))(
  ( (Nil!24036) (Cons!24035 (h!25244 (_ BitVec 64)) (t!34304 List!24039)) )
))
(declare-fun noDuplicate!1585 (List!24039) Bool)

(assert (=> b!1103439 (= res!736157 (noDuplicate!1585 Nil!24036))))

(declare-fun b!1103440 () Bool)

(declare-fun e!629885 () Bool)

(assert (=> b!1103440 (= e!629882 e!629885)))

(declare-fun res!736154 () Bool)

(assert (=> b!1103440 (=> res!736154 e!629885)))

(declare-fun contains!6413 (List!24039 (_ BitVec 64)) Bool)

(assert (=> b!1103440 (= res!736154 (contains!6413 Nil!24036 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1103441 () Bool)

(declare-fun e!629884 () Bool)

(assert (=> b!1103441 (= e!629884 tp_is_empty!27305)))

(declare-fun res!736153 () Bool)

(assert (=> start!97004 (=> (not res!736153) (not e!629882))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97004 (= res!736153 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!34960 _keys!1208))))))

(assert (=> start!97004 e!629882))

(declare-fun array_inv!26510 (array!71533) Bool)

(assert (=> start!97004 (array_inv!26510 _keys!1208)))

(assert (=> start!97004 true))

(declare-fun e!629883 () Bool)

(declare-fun array_inv!26511 (array!71535) Bool)

(assert (=> start!97004 (and (array_inv!26511 _values!996) e!629883)))

(declare-fun mapNonEmpty!42760 () Bool)

(declare-fun mapRes!42760 () Bool)

(declare-fun tp!81680 () Bool)

(assert (=> mapNonEmpty!42760 (= mapRes!42760 (and tp!81680 e!629884))))

(declare-fun mapKey!42760 () (_ BitVec 32))

(declare-fun mapRest!42760 () (Array (_ BitVec 32) ValueCell!12943))

(declare-fun mapValue!42760 () ValueCell!12943)

(assert (=> mapNonEmpty!42760 (= (arr!34425 _values!996) (store mapRest!42760 mapKey!42760 mapValue!42760))))

(declare-fun b!1103442 () Bool)

(assert (=> b!1103442 (= e!629883 (and e!629887 mapRes!42760))))

(declare-fun condMapEmpty!42760 () Bool)

(declare-fun mapDefault!42760 () ValueCell!12943)

