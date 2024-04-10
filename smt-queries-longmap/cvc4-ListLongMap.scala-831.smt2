; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20086 () Bool)

(assert start!20086)

(declare-fun b_free!4745 () Bool)

(declare-fun b_next!4745 () Bool)

(assert (=> start!20086 (= b_free!4745 (not b_next!4745))))

(declare-fun tp!17266 () Bool)

(declare-fun b_and!11491 () Bool)

(assert (=> start!20086 (= tp!17266 b_and!11491)))

(declare-fun mapIsEmpty!7970 () Bool)

(declare-fun mapRes!7970 () Bool)

(assert (=> mapIsEmpty!7970 mapRes!7970))

(declare-fun b!196724 () Bool)

(declare-fun res!92887 () Bool)

(declare-fun e!129565 () Bool)

(assert (=> b!196724 (=> (not res!92887) (not e!129565))))

(declare-fun i!601 () (_ BitVec 32))

(declare-datatypes ((array!8459 0))(
  ( (array!8460 (arr!3980 (Array (_ BitVec 32) (_ BitVec 64))) (size!4305 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8459)

(assert (=> b!196724 (= res!92887 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4305 _keys!825))))))

(declare-fun b!196725 () Bool)

(declare-fun res!92890 () Bool)

(assert (=> b!196725 (=> (not res!92890) (not e!129565))))

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5781 0))(
  ( (V!5782 (val!2345 Int)) )
))
(declare-datatypes ((ValueCell!1957 0))(
  ( (ValueCellFull!1957 (v!4315 V!5781)) (EmptyCell!1957) )
))
(declare-datatypes ((array!8461 0))(
  ( (array!8462 (arr!3981 (Array (_ BitVec 32) ValueCell!1957)) (size!4306 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8461)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!196725 (= res!92890 (and (= (size!4306 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4305 _keys!825) (size!4306 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!196726 () Bool)

(declare-fun res!92893 () Bool)

(assert (=> b!196726 (=> (not res!92893) (not e!129565))))

(declare-datatypes ((List!2485 0))(
  ( (Nil!2482) (Cons!2481 (h!3123 (_ BitVec 64)) (t!7416 List!2485)) )
))
(declare-fun arrayNoDuplicates!0 (array!8459 (_ BitVec 32) List!2485) Bool)

(assert (=> b!196726 (= res!92893 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2482))))

(declare-fun mapNonEmpty!7970 () Bool)

(declare-fun tp!17267 () Bool)

(declare-fun e!129569 () Bool)

(assert (=> mapNonEmpty!7970 (= mapRes!7970 (and tp!17267 e!129569))))

(declare-fun mapValue!7970 () ValueCell!1957)

(declare-fun mapRest!7970 () (Array (_ BitVec 32) ValueCell!1957))

(declare-fun mapKey!7970 () (_ BitVec 32))

(assert (=> mapNonEmpty!7970 (= (arr!3981 _values!649) (store mapRest!7970 mapKey!7970 mapValue!7970))))

(declare-fun b!196727 () Bool)

(declare-fun e!129567 () Bool)

(declare-fun tp_is_empty!4601 () Bool)

(assert (=> b!196727 (= e!129567 tp_is_empty!4601)))

(declare-fun b!196728 () Bool)

(declare-fun e!129568 () Bool)

(assert (=> b!196728 (= e!129568 (and e!129567 mapRes!7970))))

(declare-fun condMapEmpty!7970 () Bool)

(declare-fun mapDefault!7970 () ValueCell!1957)

