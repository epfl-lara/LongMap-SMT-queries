; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42156 () Bool)

(assert start!42156)

(declare-fun b_free!11689 () Bool)

(declare-fun b_next!11689 () Bool)

(assert (=> start!42156 (= b_free!11689 (not b_next!11689))))

(declare-fun tp!41089 () Bool)

(declare-fun b_and!20111 () Bool)

(assert (=> start!42156 (= tp!41089 b_and!20111)))

(declare-fun b!470615 () Bool)

(declare-fun e!275721 () Bool)

(declare-fun tp_is_empty!13117 () Bool)

(assert (=> b!470615 (= e!275721 tp_is_empty!13117)))

(declare-fun b!470616 () Bool)

(declare-fun e!275723 () Bool)

(assert (=> b!470616 (= e!275723 (not true))))

(declare-datatypes ((V!18595 0))(
  ( (V!18596 (val!6603 Int)) )
))
(declare-datatypes ((tuple2!8698 0))(
  ( (tuple2!8699 (_1!4360 (_ BitVec 64)) (_2!4360 V!18595)) )
))
(declare-datatypes ((List!8778 0))(
  ( (Nil!8775) (Cons!8774 (h!9630 tuple2!8698) (t!14740 List!8778)) )
))
(declare-datatypes ((ListLongMap!7611 0))(
  ( (ListLongMap!7612 (toList!3821 List!8778)) )
))
(declare-fun lt!213531 () ListLongMap!7611)

(declare-fun lt!213530 () ListLongMap!7611)

(assert (=> b!470616 (= lt!213531 lt!213530)))

(declare-fun minValueBefore!38 () V!18595)

(declare-fun zeroValue!794 () V!18595)

(declare-fun extraKeysBefore!66 () (_ BitVec 32))

(declare-fun extraKeysAfter!58 () (_ BitVec 32))

(declare-datatypes ((array!30001 0))(
  ( (array!30002 (arr!14424 (Array (_ BitVec 32) (_ BitVec 64))) (size!14776 (_ BitVec 32))) )
))
(declare-fun _keys!1025 () array!30001)

(declare-datatypes ((ValueCell!6215 0))(
  ( (ValueCellFull!6215 (v!8894 V!18595)) (EmptyCell!6215) )
))
(declare-datatypes ((array!30003 0))(
  ( (array!30004 (arr!14425 (Array (_ BitVec 32) ValueCell!6215)) (size!14777 (_ BitVec 32))) )
))
(declare-fun _values!833 () array!30003)

(declare-datatypes ((Unit!13801 0))(
  ( (Unit!13802) )
))
(declare-fun lt!213529 () Unit!13801)

(declare-fun defaultEntry!841 () Int)

(declare-fun minValueAfter!38 () V!18595)

(declare-fun mask!1365 () (_ BitVec 32))

(declare-fun lemmaNoChangeToArrayThenSameMapNoExtras!164 (array!30001 array!30003 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) V!18595 V!18595 V!18595 V!18595 (_ BitVec 32) Int) Unit!13801)

(assert (=> b!470616 (= lt!213529 (lemmaNoChangeToArrayThenSameMapNoExtras!164 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 extraKeysAfter!58 zeroValue!794 zeroValue!794 minValueBefore!38 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun getCurrentListMapNoExtraKeys!1984 (array!30001 array!30003 (_ BitVec 32) (_ BitVec 32) V!18595 V!18595 (_ BitVec 32) Int) ListLongMap!7611)

(assert (=> b!470616 (= lt!213530 (getCurrentListMapNoExtraKeys!1984 _keys!1025 _values!833 mask!1365 extraKeysAfter!58 zeroValue!794 minValueAfter!38 #b00000000000000000000000000000000 defaultEntry!841))))

(assert (=> b!470616 (= lt!213531 (getCurrentListMapNoExtraKeys!1984 _keys!1025 _values!833 mask!1365 extraKeysBefore!66 zeroValue!794 minValueBefore!38 #b00000000000000000000000000000000 defaultEntry!841))))

(declare-fun b!470617 () Bool)

(declare-fun res!281199 () Bool)

(assert (=> b!470617 (=> (not res!281199) (not e!275723))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30001 (_ BitVec 32)) Bool)

(assert (=> b!470617 (= res!281199 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1025 mask!1365))))

(declare-fun b!470618 () Bool)

(declare-fun e!275725 () Bool)

(declare-fun mapRes!21376 () Bool)

(assert (=> b!470618 (= e!275725 (and e!275721 mapRes!21376))))

(declare-fun condMapEmpty!21376 () Bool)

(declare-fun mapDefault!21376 () ValueCell!6215)

