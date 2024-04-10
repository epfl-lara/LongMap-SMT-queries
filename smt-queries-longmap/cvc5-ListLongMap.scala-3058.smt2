; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!43190 () Bool)

(assert start!43190)

(declare-fun b!478696 () Bool)

(declare-fun e!281489 () Bool)

(assert (=> b!478696 (= e!281489 false)))

(declare-fun lt!217753 () Bool)

(declare-datatypes ((array!30835 0))(
  ( (array!30836 (arr!14825 (Array (_ BitVec 32) (_ BitVec 64))) (size!15183 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30835)

(declare-datatypes ((List!9065 0))(
  ( (Nil!9062) (Cons!9061 (h!9917 (_ BitVec 64)) (t!15271 List!9065)) )
))
(declare-fun arrayNoDuplicates!0 (array!30835 (_ BitVec 32) List!9065) Bool)

(assert (=> b!478696 (= lt!217753 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9062))))

(declare-fun mapIsEmpty!22063 () Bool)

(declare-fun mapRes!22063 () Bool)

(assert (=> mapIsEmpty!22063 mapRes!22063))

(declare-fun b!478697 () Bool)

(declare-fun e!281490 () Bool)

(declare-fun tp_is_empty!13579 () Bool)

(assert (=> b!478697 (= e!281490 tp_is_empty!13579)))

(declare-fun mapNonEmpty!22063 () Bool)

(declare-fun tp!42538 () Bool)

(declare-fun e!281492 () Bool)

(assert (=> mapNonEmpty!22063 (= mapRes!22063 (and tp!42538 e!281492))))

(declare-datatypes ((V!19177 0))(
  ( (V!19178 (val!6837 Int)) )
))
(declare-datatypes ((ValueCell!6428 0))(
  ( (ValueCellFull!6428 (v!9126 V!19177)) (EmptyCell!6428) )
))
(declare-fun mapValue!22063 () ValueCell!6428)

(declare-fun mapRest!22063 () (Array (_ BitVec 32) ValueCell!6428))

(declare-fun mapKey!22063 () (_ BitVec 32))

(declare-datatypes ((array!30837 0))(
  ( (array!30838 (arr!14826 (Array (_ BitVec 32) ValueCell!6428)) (size!15184 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30837)

(assert (=> mapNonEmpty!22063 (= (arr!14826 _values!1516) (store mapRest!22063 mapKey!22063 mapValue!22063))))

(declare-fun b!478698 () Bool)

(declare-fun res!285595 () Bool)

(assert (=> b!478698 (=> (not res!285595) (not e!281489))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30835 (_ BitVec 32)) Bool)

(assert (=> b!478698 (= res!285595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!478699 () Bool)

(assert (=> b!478699 (= e!281492 tp_is_empty!13579)))

(declare-fun b!478700 () Bool)

(declare-fun e!281491 () Bool)

(assert (=> b!478700 (= e!281491 (and e!281490 mapRes!22063))))

(declare-fun condMapEmpty!22063 () Bool)

(declare-fun mapDefault!22063 () ValueCell!6428)

