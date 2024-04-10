; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!34182 () Bool)

(assert start!34182)

(declare-fun b_free!7205 () Bool)

(declare-fun b_next!7205 () Bool)

(assert (=> start!34182 (= b_free!7205 (not b_next!7205))))

(declare-fun tp!25149 () Bool)

(declare-fun b_and!14405 () Bool)

(assert (=> start!34182 (= tp!25149 b_and!14405)))

(declare-fun b!340726 () Bool)

(declare-fun res!188238 () Bool)

(declare-fun e!209005 () Bool)

(assert (=> b!340726 (=> (not res!188238) (not e!209005))))

(declare-datatypes ((array!17917 0))(
  ( (array!17918 (arr!8479 (Array (_ BitVec 32) (_ BitVec 64))) (size!8831 (_ BitVec 32))) )
))
(declare-fun _keys!1895 () array!17917)

(declare-fun k!1348 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!17917 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!340726 (= res!188238 (arrayContainsKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun mapIsEmpty!12162 () Bool)

(declare-fun mapRes!12162 () Bool)

(assert (=> mapIsEmpty!12162 mapRes!12162))

(declare-fun b!340727 () Bool)

(declare-fun e!209007 () Bool)

(declare-fun tp_is_empty!7157 () Bool)

(assert (=> b!340727 (= e!209007 tp_is_empty!7157)))

(declare-fun res!188233 () Bool)

(declare-fun e!209008 () Bool)

(assert (=> start!34182 (=> (not res!188233) (not e!209008))))

(declare-fun mask!2385 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!34182 (= res!188233 (validMask!0 mask!2385))))

(assert (=> start!34182 e!209008))

(assert (=> start!34182 true))

(assert (=> start!34182 tp_is_empty!7157))

(assert (=> start!34182 tp!25149))

(declare-datatypes ((V!10519 0))(
  ( (V!10520 (val!3623 Int)) )
))
(declare-datatypes ((ValueCell!3235 0))(
  ( (ValueCellFull!3235 (v!5795 V!10519)) (EmptyCell!3235) )
))
(declare-datatypes ((array!17919 0))(
  ( (array!17920 (arr!8480 (Array (_ BitVec 32) ValueCell!3235)) (size!8832 (_ BitVec 32))) )
))
(declare-fun _values!1525 () array!17919)

(declare-fun e!209010 () Bool)

(declare-fun array_inv!6282 (array!17919) Bool)

(assert (=> start!34182 (and (array_inv!6282 _values!1525) e!209010)))

(declare-fun array_inv!6283 (array!17917) Bool)

(assert (=> start!34182 (array_inv!6283 _keys!1895)))

(declare-fun b!340728 () Bool)

(declare-fun res!188237 () Bool)

(assert (=> b!340728 (=> (not res!188237) (not e!209008))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!17917 (_ BitVec 32)) Bool)

(assert (=> b!340728 (= res!188237 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1895 mask!2385))))

(declare-fun b!340729 () Bool)

(assert (=> b!340729 (= e!209005 false)))

(declare-fun lt!161640 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!17917 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!340729 (= lt!161640 (arrayScanForKey!0 _keys!1895 k!1348 #b00000000000000000000000000000000))))

(declare-fun b!340730 () Bool)

(declare-fun e!209006 () Bool)

(assert (=> b!340730 (= e!209006 tp_is_empty!7157)))

(declare-fun b!340731 () Bool)

(declare-fun res!188236 () Bool)

(assert (=> b!340731 (=> (not res!188236) (not e!209008))))

(declare-datatypes ((List!4878 0))(
  ( (Nil!4875) (Cons!4874 (h!5730 (_ BitVec 64)) (t!9986 List!4878)) )
))
(declare-fun arrayNoDuplicates!0 (array!17917 (_ BitVec 32) List!4878) Bool)

(assert (=> b!340731 (= res!188236 (arrayNoDuplicates!0 _keys!1895 #b00000000000000000000000000000000 Nil!4875))))

(declare-fun b!340732 () Bool)

(assert (=> b!340732 (= e!209010 (and e!209006 mapRes!12162))))

(declare-fun condMapEmpty!12162 () Bool)

(declare-fun mapDefault!12162 () ValueCell!3235)

