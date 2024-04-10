; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39568 () Bool)

(assert start!39568)

(declare-fun b_free!9835 () Bool)

(declare-fun b_next!9835 () Bool)

(assert (=> start!39568 (= b_free!9835 (not b_next!9835))))

(declare-fun tp!35034 () Bool)

(declare-fun b_and!17491 () Bool)

(assert (=> start!39568 (= tp!35034 b_and!17491)))

(declare-fun mapIsEmpty!18102 () Bool)

(declare-fun mapRes!18102 () Bool)

(assert (=> mapIsEmpty!18102 mapRes!18102))

(declare-fun b!423534 () Bool)

(declare-fun res!247558 () Bool)

(declare-fun e!251775 () Bool)

(assert (=> b!423534 (=> (not res!247558) (not e!251775))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!423534 (= res!247558 (validMask!0 mask!1025))))

(declare-fun b!423535 () Bool)

(declare-fun e!251776 () Bool)

(declare-fun tp_is_empty!10987 () Bool)

(assert (=> b!423535 (= e!251776 tp_is_empty!10987)))

(declare-fun res!247561 () Bool)

(assert (=> start!39568 (=> (not res!247561) (not e!251775))))

(declare-fun from!863 () (_ BitVec 32))

(declare-datatypes ((array!25817 0))(
  ( (array!25818 (arr!12358 (Array (_ BitVec 32) (_ BitVec 64))) (size!12710 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!25817)

(assert (=> start!39568 (= res!247561 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12710 _keys!709))))))

(assert (=> start!39568 e!251775))

(assert (=> start!39568 tp_is_empty!10987))

(assert (=> start!39568 tp!35034))

(assert (=> start!39568 true))

(declare-datatypes ((V!15755 0))(
  ( (V!15756 (val!5538 Int)) )
))
(declare-datatypes ((ValueCell!5150 0))(
  ( (ValueCellFull!5150 (v!7785 V!15755)) (EmptyCell!5150) )
))
(declare-datatypes ((array!25819 0))(
  ( (array!25820 (arr!12359 (Array (_ BitVec 32) ValueCell!5150)) (size!12711 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25819)

(declare-fun e!251773 () Bool)

(declare-fun array_inv!9004 (array!25819) Bool)

(assert (=> start!39568 (and (array_inv!9004 _values!549) e!251773)))

(declare-fun array_inv!9005 (array!25817) Bool)

(assert (=> start!39568 (array_inv!9005 _keys!709)))

(declare-fun b!423536 () Bool)

(declare-fun e!251777 () Bool)

(assert (=> b!423536 (= e!251775 e!251777)))

(declare-fun res!247563 () Bool)

(assert (=> b!423536 (=> (not res!247563) (not e!251777))))

(declare-fun lt!194188 () array!25817)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25817 (_ BitVec 32)) Bool)

(assert (=> b!423536 (= res!247563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194188 mask!1025))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!423536 (= lt!194188 (array!25818 (store (arr!12358 _keys!709) i!563 k!794) (size!12710 _keys!709)))))

(declare-fun b!423537 () Bool)

(declare-fun res!247559 () Bool)

(assert (=> b!423537 (=> (not res!247559) (not e!251775))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!423537 (= res!247559 (and (= (size!12711 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12710 _keys!709) (size!12711 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!423538 () Bool)

(declare-fun res!247560 () Bool)

(assert (=> b!423538 (=> (not res!247560) (not e!251775))))

(assert (=> b!423538 (= res!247560 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12710 _keys!709))))))

(declare-fun b!423539 () Bool)

(declare-fun res!247554 () Bool)

(assert (=> b!423539 (=> (not res!247554) (not e!251777))))

(declare-datatypes ((List!7281 0))(
  ( (Nil!7278) (Cons!7277 (h!8133 (_ BitVec 64)) (t!12725 List!7281)) )
))
(declare-fun arrayNoDuplicates!0 (array!25817 (_ BitVec 32) List!7281) Bool)

(assert (=> b!423539 (= res!247554 (arrayNoDuplicates!0 lt!194188 #b00000000000000000000000000000000 Nil!7278))))

(declare-fun mapNonEmpty!18102 () Bool)

(declare-fun tp!35033 () Bool)

(declare-fun e!251774 () Bool)

(assert (=> mapNonEmpty!18102 (= mapRes!18102 (and tp!35033 e!251774))))

(declare-fun mapKey!18102 () (_ BitVec 32))

(declare-fun mapValue!18102 () ValueCell!5150)

(declare-fun mapRest!18102 () (Array (_ BitVec 32) ValueCell!5150))

(assert (=> mapNonEmpty!18102 (= (arr!12359 _values!549) (store mapRest!18102 mapKey!18102 mapValue!18102))))

(declare-fun b!423540 () Bool)

(declare-fun res!247555 () Bool)

(assert (=> b!423540 (=> (not res!247555) (not e!251775))))

(assert (=> b!423540 (= res!247555 (or (= (select (arr!12358 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12358 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!423541 () Bool)

(declare-fun res!247556 () Bool)

(assert (=> b!423541 (=> (not res!247556) (not e!251775))))

(assert (=> b!423541 (= res!247556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!423542 () Bool)

(declare-fun res!247557 () Bool)

(assert (=> b!423542 (=> (not res!247557) (not e!251775))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!423542 (= res!247557 (validKeyInArray!0 k!794))))

(declare-fun b!423543 () Bool)

(declare-fun res!247552 () Bool)

(assert (=> b!423543 (=> (not res!247552) (not e!251775))))

(declare-fun arrayContainsKey!0 (array!25817 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!423543 (= res!247552 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!423544 () Bool)

(declare-fun res!247562 () Bool)

(assert (=> b!423544 (=> (not res!247562) (not e!251775))))

(assert (=> b!423544 (= res!247562 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7278))))

(declare-fun b!423545 () Bool)

(assert (=> b!423545 (= e!251773 (and e!251776 mapRes!18102))))

(declare-fun condMapEmpty!18102 () Bool)

(declare-fun mapDefault!18102 () ValueCell!5150)

