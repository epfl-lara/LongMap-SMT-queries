; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!40798 () Bool)

(assert start!40798)

(declare-fun b_free!10787 () Bool)

(declare-fun b_next!10787 () Bool)

(assert (=> start!40798 (= b_free!10787 (not b_next!10787))))

(declare-fun tp!38183 () Bool)

(declare-fun b_and!18861 () Bool)

(assert (=> start!40798 (= tp!38183 b_and!18861)))

(declare-fun b!452589 () Bool)

(declare-fun e!264978 () Bool)

(declare-datatypes ((V!17271 0))(
  ( (V!17272 (val!6107 Int)) )
))
(declare-datatypes ((tuple2!8040 0))(
  ( (tuple2!8041 (_1!4031 (_ BitVec 64)) (_2!4031 V!17271)) )
))
(declare-datatypes ((List!8098 0))(
  ( (Nil!8095) (Cons!8094 (h!8950 tuple2!8040) (t!13908 List!8098)) )
))
(declare-datatypes ((ListLongMap!6953 0))(
  ( (ListLongMap!6954 (toList!3492 List!8098)) )
))
(declare-fun call!29974 () ListLongMap!6953)

(declare-fun call!29975 () ListLongMap!6953)

(assert (=> b!452589 (= e!264978 (= call!29974 call!29975))))

(declare-fun b!452590 () Bool)

(declare-fun res!269593 () Bool)

(declare-fun e!264979 () Bool)

(assert (=> b!452590 (=> (not res!269593) (not e!264979))))

(declare-datatypes ((array!28057 0))(
  ( (array!28058 (arr!13473 (Array (_ BitVec 32) (_ BitVec 64))) (size!13825 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28057)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!28057 (_ BitVec 32)) Bool)

(assert (=> b!452590 (= res!269593 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!452591 () Bool)

(declare-fun e!264980 () Bool)

(declare-fun e!264984 () Bool)

(declare-fun mapRes!19824 () Bool)

(assert (=> b!452591 (= e!264980 (and e!264984 mapRes!19824))))

(declare-fun condMapEmpty!19824 () Bool)

(declare-datatypes ((ValueCell!5719 0))(
  ( (ValueCellFull!5719 (v!8366 V!17271)) (EmptyCell!5719) )
))
(declare-datatypes ((array!28059 0))(
  ( (array!28060 (arr!13474 (Array (_ BitVec 32) ValueCell!5719)) (size!13826 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!28059)

(declare-fun mapDefault!19824 () ValueCell!5719)

