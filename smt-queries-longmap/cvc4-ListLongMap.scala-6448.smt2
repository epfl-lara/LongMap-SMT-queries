; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!82532 () Bool)

(assert start!82532)

(declare-fun mapIsEmpty!34195 () Bool)

(declare-fun mapRes!34195 () Bool)

(assert (=> mapIsEmpty!34195 mapRes!34195))

(declare-fun b!961766 () Bool)

(declare-fun e!542371 () Bool)

(assert (=> b!961766 (= e!542371 false)))

(declare-fun lt!430810 () Bool)

(declare-datatypes ((array!59031 0))(
  ( (array!59032 (arr!28384 (Array (_ BitVec 32) (_ BitVec 64))) (size!28863 (_ BitVec 32))) )
))
(declare-fun _keys!1686 () array!59031)

(declare-datatypes ((List!19702 0))(
  ( (Nil!19699) (Cons!19698 (h!20860 (_ BitVec 64)) (t!28065 List!19702)) )
))
(declare-fun arrayNoDuplicates!0 (array!59031 (_ BitVec 32) List!19702) Bool)

(assert (=> b!961766 (= lt!430810 (arrayNoDuplicates!0 _keys!1686 #b00000000000000000000000000000000 Nil!19699))))

(declare-fun b!961767 () Bool)

(declare-fun e!542372 () Bool)

(declare-fun tp_is_empty!21467 () Bool)

(assert (=> b!961767 (= e!542372 tp_is_empty!21467)))

(declare-fun b!961768 () Bool)

(declare-fun res!643638 () Bool)

(assert (=> b!961768 (=> (not res!643638) (not e!542371))))

(declare-fun extraKeys!1321 () (_ BitVec 32))

(declare-datatypes ((V!33605 0))(
  ( (V!33606 (val!10784 Int)) )
))
(declare-datatypes ((ValueCell!10252 0))(
  ( (ValueCellFull!10252 (v!13342 V!33605)) (EmptyCell!10252) )
))
(declare-datatypes ((array!59033 0))(
  ( (array!59034 (arr!28385 (Array (_ BitVec 32) ValueCell!10252)) (size!28864 (_ BitVec 32))) )
))
(declare-fun _values!1400 () array!59033)

(declare-fun mask!2110 () (_ BitVec 32))

(assert (=> b!961768 (= res!643638 (and (= (size!28864 _values!1400) (bvadd #b00000000000000000000000000000001 mask!2110)) (= (size!28863 _keys!1686) (size!28864 _values!1400)) (bvsge mask!2110 #b00000000000000000000000000000000) (bvsge extraKeys!1321 #b00000000000000000000000000000000) (bvsle extraKeys!1321 #b00000000000000000000000000000011)))))

(declare-fun b!961769 () Bool)

(declare-fun e!542374 () Bool)

(assert (=> b!961769 (= e!542374 tp_is_empty!21467)))

(declare-fun b!961770 () Bool)

(declare-fun res!643637 () Bool)

(assert (=> b!961770 (=> (not res!643637) (not e!542371))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!59031 (_ BitVec 32)) Bool)

(assert (=> b!961770 (= res!643637 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1686 mask!2110))))

(declare-fun b!961771 () Bool)

(declare-fun e!542375 () Bool)

(assert (=> b!961771 (= e!542375 (and e!542372 mapRes!34195))))

(declare-fun condMapEmpty!34195 () Bool)

(declare-fun mapDefault!34195 () ValueCell!10252)

