; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82520 () Bool)

(assert start!82520)

(declare-fun mapNonEmpty!34177 () Bool)

(declare-fun mapRes!34177 () Bool)

(declare-fun tp!65106 () Bool)

(declare-fun e!542282 () Bool)

(assert (=> mapNonEmpty!34177 (= mapRes!34177 (and tp!65106 e!542282))))

(declare-fun mapKey!34177 () (_ BitVec 32))

(declare-datatypes ((V!33589 0))(
  ( (V!33590 (val!10778 Int)) )
))
(declare-datatypes ((ValueCell!10246 0))(
  ( (ValueCellFull!10246 (v!13336 V!33589)) (EmptyCell!10246) )
))
(declare-fun mapValue!34177 () ValueCell!10246)

(declare-datatypes ((array!59007 0))(
  ( (array!59008 (arr!28372 (Array (_ BitVec 32) ValueCell!10246)) (size!28851 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59007)

(declare-fun mapRest!34177 () (Array (_ BitVec 32) ValueCell!10246))

(assert (=> mapNonEmpty!34177 (= (arr!28372 _values!1400) (store mapRest!34177 mapKey!34177 mapValue!34177))))

(declare-fun b!961658 () Bool)

(declare-fun e!542285 () Bool)

(assert (=> b!961658 (= e!542285 false)))

(declare-fun lt!430792 () Bool)

(declare-datatypes ((array!59009 0))(
  ( (array!59010 (arr!28373 (Array (_ BitVec 32) (_ BitVec 64))) (size!28852 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59009)

(declare-datatypes ((List!19698 0))(
  ( (Nil!19695) (Cons!19694 (h!20856 (_ BitVec 64)) (t!28061 List!19698)) )
))
(declare-fun arrayNoDuplicates!0 (array!59009 (_ BitVec 32) List!19698) Bool)

(assert (=> b!961658 (= lt!430792 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19695))))

(declare-fun res!643585 () Bool)

(assert (=> start!82520 (=> (not res!643585) (not e!542285))))

(declare-fun mask!2110 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!82520 (= res!643585 (validMask!0 mask!2110))))

(assert (=> start!82520 e!542285))

(assert (=> start!82520 true))

(declare-fun e!542284 () Bool)

(declare-fun array_inv!21987 (array!59007) Bool)

(assert (=> start!82520 (and (array_inv!21987 _values!1400) e!542284)))

(declare-fun array_inv!21988 (array!59009) Bool)

(assert (=> start!82520 (array_inv!21988 _keys!1686)))

(declare-fun mapIsEmpty!34177 () Bool)

(assert (=> mapIsEmpty!34177 mapRes!34177))

(declare-fun b!961659 () Bool)

(declare-fun e!542281 () Bool)

(declare-fun tp_is_empty!21455 () Bool)

(assert (=> b!961659 (= e!542281 tp_is_empty!21455)))

(declare-fun b!961660 () Bool)

(assert (=> b!961660 (= e!542282 tp_is_empty!21455)))

(declare-fun b!961661 () Bool)

(declare-fun res!643584 () Bool)

(assert (=> b!961661 (=> (not res!643584) (not e!542285))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59009 (_ BitVec 32)) Bool)

(assert (=> b!961661 (= res!643584 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961662 () Bool)

(declare-fun res!643583 () Bool)

(assert (=> b!961662 (=> (not res!643583) (not e!542285))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(assert (=> b!961662 (= res!643583 (and (= (size!28851 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28852 _keys!1686) (size!28851 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961663 () Bool)

(assert (=> b!961663 (= e!542284 (and e!542281 mapRes!34177))))

(declare-fun condMapEmpty!34177 () Bool)

(declare-fun mapDefault!34177 () ValueCell!10246)

