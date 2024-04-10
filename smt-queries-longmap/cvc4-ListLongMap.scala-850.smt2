; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!20200 () Bool)

(assert start!20200)

(declare-fun b_free!4859 () Bool)

(declare-fun b_next!4859 () Bool)

(assert (=> start!20200 (= b_free!4859 (not b_next!4859))))

(declare-fun tp!17608 () Bool)

(declare-fun b_and!11605 () Bool)

(assert (=> start!20200 (= tp!17608 b_and!11605)))

(declare-fun b!198434 () Bool)

(declare-fun res!94090 () Bool)

(declare-fun e!130423 () Bool)

(assert (=> b!198434 (=> (not res!94090) (not e!130423))))

(declare-datatypes ((array!8679 0))(
  ( (array!8680 (arr!4090 (Array (_ BitVec 32) (_ BitVec 64))) (size!4415 (_ BitVec 32))) )
))
(declare-fun _keys!825 () array!8679)

(declare-fun extraKeys!596 () (_ BitVec 32))

(declare-datatypes ((V!5933 0))(
  ( (V!5934 (val!2402 Int)) )
))
(declare-datatypes ((ValueCell!2014 0))(
  ( (ValueCellFull!2014 (v!4372 V!5933)) (EmptyCell!2014) )
))
(declare-datatypes ((array!8681 0))(
  ( (array!8682 (arr!4091 (Array (_ BitVec 32) ValueCell!2014)) (size!4416 (_ BitVec 32))) )
))
(declare-fun _values!649 () array!8681)

(declare-fun mask!1149 () (_ BitVec 32))

(assert (=> b!198434 (= res!94090 (and (= (size!4416 _values!649) (bvadd #b00000000000000000000000000000001 mask!1149)) (= (size!4415 _keys!825) (size!4416 _values!649)) (bvsge mask!1149 #b00000000000000000000000000000000) (bvsge extraKeys!596 #b00000000000000000000000000000000) (bvsle extraKeys!596 #b00000000000000000000000000000011)))))

(declare-fun b!198435 () Bool)

(declare-fun res!94088 () Bool)

(assert (=> b!198435 (=> (not res!94088) (not e!130423))))

(declare-fun k!843 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!198435 (= res!94088 (validKeyInArray!0 k!843))))

(declare-fun b!198436 () Bool)

(declare-fun res!94089 () Bool)

(assert (=> b!198436 (=> (not res!94089) (not e!130423))))

(declare-datatypes ((List!2559 0))(
  ( (Nil!2556) (Cons!2555 (h!3197 (_ BitVec 64)) (t!7490 List!2559)) )
))
(declare-fun arrayNoDuplicates!0 (array!8679 (_ BitVec 32) List!2559) Bool)

(assert (=> b!198436 (= res!94089 (arrayNoDuplicates!0 _keys!825 #b00000000000000000000000000000000 Nil!2556))))

(declare-fun b!198437 () Bool)

(declare-fun res!94085 () Bool)

(assert (=> b!198437 (=> (not res!94085) (not e!130423))))

(declare-fun i!601 () (_ BitVec 32))

(assert (=> b!198437 (= res!94085 (and (bvsge i!601 #b00000000000000000000000000000000) (bvslt i!601 (size!4415 _keys!825))))))

(declare-fun mapIsEmpty!8141 () Bool)

(declare-fun mapRes!8141 () Bool)

(assert (=> mapIsEmpty!8141 mapRes!8141))

(declare-fun mapNonEmpty!8141 () Bool)

(declare-fun tp!17609 () Bool)

(declare-fun e!130424 () Bool)

(assert (=> mapNonEmpty!8141 (= mapRes!8141 (and tp!17609 e!130424))))

(declare-fun mapRest!8141 () (Array (_ BitVec 32) ValueCell!2014))

(declare-fun mapKey!8141 () (_ BitVec 32))

(declare-fun mapValue!8141 () ValueCell!2014)

(assert (=> mapNonEmpty!8141 (= (arr!4091 _values!649) (store mapRest!8141 mapKey!8141 mapValue!8141))))

(declare-fun b!198438 () Bool)

(declare-fun res!94087 () Bool)

(assert (=> b!198438 (=> (not res!94087) (not e!130423))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!8679 (_ BitVec 32)) Bool)

(assert (=> b!198438 (= res!94087 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!825 mask!1149))))

(declare-fun b!198439 () Bool)

(declare-fun res!94084 () Bool)

(assert (=> b!198439 (=> (not res!94084) (not e!130423))))

(assert (=> b!198439 (= res!94084 (= (select (arr!4090 _keys!825) i!601) k!843))))

(declare-fun b!198440 () Bool)

(declare-fun e!130422 () Bool)

(declare-fun tp_is_empty!4715 () Bool)

(assert (=> b!198440 (= e!130422 tp_is_empty!4715)))

(declare-fun b!198441 () Bool)

(declare-fun e!130420 () Bool)

(assert (=> b!198441 (= e!130420 (and e!130422 mapRes!8141))))

(declare-fun condMapEmpty!8141 () Bool)

(declare-fun mapDefault!8141 () ValueCell!2014)

