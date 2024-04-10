; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35322 () Bool)

(assert start!35322)

(declare-fun b!353810 () Bool)

(declare-fun res!196154 () Bool)

(declare-fun e!216734 () Bool)

(assert (=> b!353810 (=> (not res!196154) (not e!216734))))

(declare-datatypes ((List!5282 0))(
  ( (Nil!5279) (Cons!5278 (h!6134 (_ BitVec 64)) (t!10432 List!5282)) )
))
(declare-fun noDuplicate!179 (List!5282) Bool)

(assert (=> b!353810 (= res!196154 (noDuplicate!179 Nil!5279))))

(declare-fun b!353811 () Bool)

(declare-fun e!216730 () Bool)

(assert (=> b!353811 (= e!216734 e!216730)))

(declare-fun res!196153 () Bool)

(assert (=> b!353811 (=> res!196153 e!216730)))

(declare-fun contains!2380 (List!5282 (_ BitVec 64)) Bool)

(assert (=> b!353811 (= res!196153 (contains!2380 Nil!5279 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun mapIsEmpty!13200 () Bool)

(declare-fun mapRes!13200 () Bool)

(assert (=> mapIsEmpty!13200 mapRes!13200))

(declare-fun b!353812 () Bool)

(declare-fun res!196152 () Bool)

(assert (=> b!353812 (=> (not res!196152) (not e!216734))))

(declare-datatypes ((array!19191 0))(
  ( (array!19192 (arr!9091 (Array (_ BitVec 32) (_ BitVec 64))) (size!9443 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19191)

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!19191 (_ BitVec 32)) Bool)

(assert (=> b!353812 (= res!196152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1456 mask!1842))))

(declare-fun b!353813 () Bool)

(declare-fun res!196156 () Bool)

(assert (=> b!353813 (=> (not res!196156) (not e!216734))))

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-datatypes ((V!11375 0))(
  ( (V!11376 (val!3944 Int)) )
))
(declare-datatypes ((ValueCell!3556 0))(
  ( (ValueCellFull!3556 (v!6137 V!11375)) (EmptyCell!3556) )
))
(declare-datatypes ((array!19193 0))(
  ( (array!19194 (arr!9092 (Array (_ BitVec 32) ValueCell!3556)) (size!9444 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19193)

(assert (=> b!353813 (= res!196156 (and (= (size!9444 _values!1208) (bvadd #b00000000000000000000000000000001 mask!1842)) (= (size!9443 _keys!1456) (size!9444 _values!1208)) (bvsge mask!1842 #b00000000000000000000000000000000) (bvsge extraKeys!1129 #b00000000000000000000000000000000) (bvsle extraKeys!1129 #b00000000000000000000000000000011)))))

(declare-fun b!353814 () Bool)

(declare-fun e!216735 () Bool)

(declare-fun tp_is_empty!7799 () Bool)

(assert (=> b!353814 (= e!216735 tp_is_empty!7799)))

(declare-fun b!353815 () Bool)

(declare-fun e!216733 () Bool)

(assert (=> b!353815 (= e!216733 tp_is_empty!7799)))

(declare-fun b!353816 () Bool)

(declare-fun e!216732 () Bool)

(assert (=> b!353816 (= e!216732 (and e!216735 mapRes!13200))))

(declare-fun condMapEmpty!13200 () Bool)

(declare-fun mapDefault!13200 () ValueCell!3556)

