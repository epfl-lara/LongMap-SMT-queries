; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35426 () Bool)

(assert start!35426)

(declare-fun b_free!7813 () Bool)

(declare-fun b_next!7813 () Bool)

(assert (=> start!35426 (= b_free!7813 (not b_next!7813))))

(declare-fun tp!27225 () Bool)

(declare-fun b_and!15055 () Bool)

(assert (=> start!35426 (= tp!27225 b_and!15055)))

(declare-fun b!354632 () Bool)

(declare-fun e!217388 () Bool)

(declare-fun tp_is_empty!7879 () Bool)

(assert (=> b!354632 (= e!217388 tp_is_empty!7879)))

(declare-fun res!196587 () Bool)

(declare-fun e!217391 () Bool)

(assert (=> start!35426 (=> (not res!196587) (not e!217391))))

(declare-fun mask!1842 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!35426 (= res!196587 (validMask!0 mask!1842))))

(assert (=> start!35426 e!217391))

(assert (=> start!35426 tp_is_empty!7879))

(assert (=> start!35426 true))

(assert (=> start!35426 tp!27225))

(declare-datatypes ((array!19339 0))(
  ( (array!19340 (arr!9163 (Array (_ BitVec 32) (_ BitVec 64))) (size!9515 (_ BitVec 32))) )
))
(declare-fun _keys!1456 () array!19339)

(declare-fun array_inv!6736 (array!19339) Bool)

(assert (=> start!35426 (array_inv!6736 _keys!1456)))

(declare-datatypes ((V!11483 0))(
  ( (V!11484 (val!3984 Int)) )
))
(declare-datatypes ((ValueCell!3596 0))(
  ( (ValueCellFull!3596 (v!6178 V!11483)) (EmptyCell!3596) )
))
(declare-datatypes ((array!19341 0))(
  ( (array!19342 (arr!9164 (Array (_ BitVec 32) ValueCell!3596)) (size!9516 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19341)

(declare-fun e!217390 () Bool)

(declare-fun array_inv!6737 (array!19341) Bool)

(assert (=> start!35426 (and (array_inv!6737 _values!1208) e!217390)))

(declare-fun mapIsEmpty!13326 () Bool)

(declare-fun mapRes!13326 () Bool)

(assert (=> mapIsEmpty!13326 mapRes!13326))

(declare-fun b!354633 () Bool)

(declare-fun res!196585 () Bool)

(assert (=> b!354633 (=> (not res!196585) (not e!217391))))

(declare-fun from!1805 () (_ BitVec 32))

(declare-fun k!1077 () (_ BitVec 64))

(assert (=> b!354633 (= res!196585 (= (select (arr!9163 _keys!1456) from!1805) k!1077))))

(declare-fun b!354634 () Bool)

(assert (=> b!354634 (= e!217391 (not true))))

(declare-fun minValue!1150 () V!11483)

(declare-fun defaultEntry!1216 () Int)

(declare-fun extraKeys!1129 () (_ BitVec 32))

(declare-fun zeroValue!1150 () V!11483)

(declare-datatypes ((tuple2!5660 0))(
  ( (tuple2!5661 (_1!2841 (_ BitVec 64)) (_2!2841 V!11483)) )
))
(declare-datatypes ((List!5303 0))(
  ( (Nil!5300) (Cons!5299 (h!6155 tuple2!5660) (t!10453 List!5303)) )
))
(declare-datatypes ((ListLongMap!4573 0))(
  ( (ListLongMap!4574 (toList!2302 List!5303)) )
))
(declare-fun contains!2382 (ListLongMap!4573 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!1823 (array!19339 array!19341 (_ BitVec 32) (_ BitVec 32) V!11483 V!11483 (_ BitVec 32) Int) ListLongMap!4573)

(assert (=> b!354634 (contains!2382 (getCurrentListMap!1823 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 #b00000000000000000000000000000000 defaultEntry!1216) (select (arr!9163 _keys!1456) from!1805))))

(declare-datatypes ((Unit!10926 0))(
  ( (Unit!10927) )
))
(declare-fun lt!165734 () Unit!10926)

(declare-fun lemmaValidKeyInArrayIsInListMap!180 (array!19339 array!19341 (_ BitVec 32) (_ BitVec 32) V!11483 V!11483 (_ BitVec 32) Int) Unit!10926)

(assert (=> b!354634 (= lt!165734 (lemmaValidKeyInArrayIsInListMap!180 _keys!1456 _values!1208 mask!1842 extraKeys!1129 zeroValue!1150 minValue!1150 from!1805 defaultEntry!1216))))

(declare-fun mapNonEmpty!13326 () Bool)

(declare-fun tp!27224 () Bool)

(assert (=> mapNonEmpty!13326 (= mapRes!13326 (and tp!27224 e!217388))))

(declare-fun mapRest!13326 () (Array (_ BitVec 32) ValueCell!3596))

(declare-fun mapValue!13326 () ValueCell!3596)

(declare-fun mapKey!13326 () (_ BitVec 32))

(assert (=> mapNonEmpty!13326 (= (arr!9164 _values!1208) (store mapRest!13326 mapKey!13326 mapValue!13326))))

(declare-fun b!354635 () Bool)

(declare-fun res!196580 () Bool)

(assert (=> b!354635 (=> (not res!196580) (not e!217391))))

(declare-datatypes ((List!5304 0))(
  ( (Nil!5301) (Cons!5300 (h!6156 (_ BitVec 64)) (t!10454 List!5304)) )
))
(declare-fun arrayNoDuplicates!0 (array!19339 (_ BitVec 32) List!5304) Bool)

(assert (=> b!354635 (= res!196580 (arrayNoDuplicates!0 _keys!1456 #b00000000000000000000000000000000 Nil!5301))))

(declare-fun b!354636 () Bool)

(declare-fun e!217387 () Bool)

(assert (=> b!354636 (= e!217387 tp_is_empty!7879)))

(declare-fun b!354637 () Bool)

(declare-fun res!196583 () Bool)

(assert (=> b!354637 (=> (not res!196583) (not e!217391))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!354637 (= res!196583 (validKeyInArray!0 k!1077))))

(declare-fun b!354638 () Bool)

(assert (=> b!354638 (= e!217390 (and e!217387 mapRes!13326))))

(declare-fun condMapEmpty!13326 () Bool)

(declare-fun mapDefault!13326 () ValueCell!3596)

