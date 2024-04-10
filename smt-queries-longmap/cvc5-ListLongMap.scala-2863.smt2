; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41234 () Bool)

(assert start!41234)

(declare-fun b_free!11077 () Bool)

(declare-fun b_next!11077 () Bool)

(assert (=> start!41234 (= b_free!11077 (not b_next!11077))))

(declare-fun tp!39070 () Bool)

(declare-fun b_and!19397 () Bool)

(assert (=> start!41234 (= tp!39070 b_and!19397)))

(declare-fun b!461245 () Bool)

(declare-fun res!275858 () Bool)

(declare-fun e!269031 () Bool)

(assert (=> b!461245 (=> (not res!275858) (not e!269031))))

(declare-datatypes ((array!28629 0))(
  ( (array!28630 (arr!13754 (Array (_ BitVec 32) (_ BitVec 64))) (size!14106 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!28629)

(declare-datatypes ((List!8322 0))(
  ( (Nil!8319) (Cons!8318 (h!9174 (_ BitVec 64)) (t!14264 List!8322)) )
))
(declare-fun arrayNoDuplicates!0 (array!28629 (_ BitVec 32) List!8322) Bool)

(assert (=> b!461245 (= res!275858 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!8319))))

(declare-fun b!461246 () Bool)

(declare-fun e!269028 () Bool)

(declare-fun e!269027 () Bool)

(assert (=> b!461246 (= e!269028 e!269027)))

(declare-fun res!275861 () Bool)

(assert (=> b!461246 (=> (not res!275861) (not e!269027))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!461246 (= res!275861 (and (not (= from!863 i!563)) (bvslt from!863 i!563)))))

(declare-datatypes ((V!17659 0))(
  ( (V!17660 (val!6252 Int)) )
))
(declare-fun minValue!515 () V!17659)

(declare-fun defaultEntry!557 () Int)

(declare-fun lt!208929 () array!28629)

(declare-fun zeroValue!515 () V!17659)

(declare-datatypes ((ValueCell!5864 0))(
  ( (ValueCellFull!5864 (v!8534 V!17659)) (EmptyCell!5864) )
))
(declare-datatypes ((array!28631 0))(
  ( (array!28632 (arr!13755 (Array (_ BitVec 32) ValueCell!5864)) (size!14107 (_ BitVec 32))) )
))
(declare-fun lt!208931 () array!28631)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((tuple2!8250 0))(
  ( (tuple2!8251 (_1!4136 (_ BitVec 64)) (_2!4136 V!17659)) )
))
(declare-datatypes ((List!8323 0))(
  ( (Nil!8320) (Cons!8319 (h!9175 tuple2!8250) (t!14265 List!8323)) )
))
(declare-datatypes ((ListLongMap!7163 0))(
  ( (ListLongMap!7164 (toList!3597 List!8323)) )
))
(declare-fun lt!208932 () ListLongMap!7163)

(declare-fun getCurrentListMapNoExtraKeys!1777 (array!28629 array!28631 (_ BitVec 32) (_ BitVec 32) V!17659 V!17659 (_ BitVec 32) Int) ListLongMap!7163)

(assert (=> b!461246 (= lt!208932 (getCurrentListMapNoExtraKeys!1777 lt!208929 lt!208931 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun _values!549 () array!28631)

(declare-fun v!412 () V!17659)

(assert (=> b!461246 (= lt!208931 (array!28632 (store (arr!13755 _values!549) i!563 (ValueCellFull!5864 v!412)) (size!14107 _values!549)))))

(declare-fun lt!208930 () ListLongMap!7163)

(assert (=> b!461246 (= lt!208930 (getCurrentListMapNoExtraKeys!1777 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun res!275862 () Bool)

(assert (=> start!41234 (=> (not res!275862) (not e!269031))))

(assert (=> start!41234 (= res!275862 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!14106 _keys!709))))))

(assert (=> start!41234 e!269031))

(declare-fun tp_is_empty!12415 () Bool)

(assert (=> start!41234 tp_is_empty!12415))

(assert (=> start!41234 tp!39070))

(assert (=> start!41234 true))

(declare-fun e!269032 () Bool)

(declare-fun array_inv!9950 (array!28631) Bool)

(assert (=> start!41234 (and (array_inv!9950 _values!549) e!269032)))

(declare-fun array_inv!9951 (array!28629) Bool)

(assert (=> start!41234 (array_inv!9951 _keys!709)))

(declare-fun b!461247 () Bool)

(declare-fun e!269033 () Bool)

(declare-fun mapRes!20275 () Bool)

(assert (=> b!461247 (= e!269032 (and e!269033 mapRes!20275))))

(declare-fun condMapEmpty!20275 () Bool)

(declare-fun mapDefault!20275 () ValueCell!5864)

