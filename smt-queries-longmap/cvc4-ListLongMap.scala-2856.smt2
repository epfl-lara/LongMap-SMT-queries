; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41170 () Bool)

(assert start!41170)

(declare-fun b_free!11039 () Bool)

(declare-fun b_next!11039 () Bool)

(assert (=> start!41170 (= b_free!11039 (not b_next!11039))))

(declare-fun tp!38952 () Bool)

(declare-fun b_and!19317 () Bool)

(assert (=> start!41170 (= tp!38952 b_and!19317)))

(declare-fun b!459999 () Bool)

(declare-fun res!274977 () Bool)

(declare-fun e!268412 () Bool)

(assert (=> b!459999 (=> (not res!274977) (not e!268412))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!459999 (= res!274977 (validMask!0 mask!1025))))

(declare-fun b!460001 () Bool)

(declare-datatypes ((Unit!13381 0))(
  ( (Unit!13382) )
))
(declare-fun e!268413 () Unit!13381)

(declare-fun Unit!13383 () Unit!13381)

(assert (=> b!460001 (= e!268413 Unit!13383)))

(declare-fun lt!208194 () Unit!13381)

(declare-fun k!794 () (_ BitVec 64))

(declare-datatypes ((array!28555 0))(
  ( (array!28556 (arr!13718 (Array (_ BitVec 32) (_ BitVec 64))) (size!14070 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28555)

(declare-fun from!863 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!28555 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!13381)

(assert (=> b!460001 (= lt!208194 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!709 k!794 from!863 #b00000000000000000000000000000000))))

(assert (=> b!460001 false))

(declare-fun b!460002 () Bool)

(declare-fun e!268410 () Bool)

(declare-fun tp_is_empty!12377 () Bool)

(assert (=> b!460002 (= e!268410 tp_is_empty!12377)))

(declare-fun b!460003 () Bool)

(declare-fun res!274981 () Bool)

(assert (=> b!460003 (=> (not res!274981) (not e!268412))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28555 (_ BitVec 32)) Bool)

(assert (=> b!460003 (= res!274981 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!460004 () Bool)

(declare-fun res!274969 () Bool)

(declare-fun e!268414 () Bool)

(assert (=> b!460004 (=> (not res!274969) (not e!268414))))

(declare-fun lt!208184 () array!28555)

(declare-datatypes ((List!8292 0))(
  ( (Nil!8289) (Cons!8288 (h!9144 (_ BitVec 64)) (t!14210 List!8292)) )
))
(declare-fun arrayNoDuplicates!0 (array!28555 (_ BitVec 32) List!8292) Bool)

(assert (=> b!460004 (= res!274969 (arrayNoDuplicates!0 lt!208184 #b00000000000000000000000000000000 Nil!8289))))

(declare-fun b!460005 () Bool)

(declare-fun e!268411 () Bool)

(assert (=> b!460005 (= e!268411 tp_is_empty!12377)))

(declare-fun b!460006 () Bool)

(declare-fun e!268416 () Bool)

(declare-fun mapRes!20215 () Bool)

(assert (=> b!460006 (= e!268416 (and e!268411 mapRes!20215))))

(declare-fun condMapEmpty!20215 () Bool)

(declare-datatypes ((V!17607 0))(
  ( (V!17608 (val!6233 Int)) )
))
(declare-datatypes ((ValueCell!5845 0))(
  ( (ValueCellFull!5845 (v!8511 V!17607)) (EmptyCell!5845) )
))
(declare-datatypes ((array!28557 0))(
  ( (array!28558 (arr!13719 (Array (_ BitVec 32) ValueCell!5845)) (size!14071 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28557)

(declare-fun mapDefault!20215 () ValueCell!5845)

