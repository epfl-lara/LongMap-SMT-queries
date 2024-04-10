; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!133642 () Bool)

(assert start!133642)

(declare-fun b!1562634 () Bool)

(declare-fun e!870778 () Bool)

(declare-fun tp_is_empty!38725 () Bool)

(assert (=> b!1562634 (= e!870778 tp_is_empty!38725)))

(declare-fun b!1562635 () Bool)

(declare-fun e!870776 () Bool)

(assert (=> b!1562635 (= e!870776 false)))

(declare-fun lt!671757 () Bool)

(declare-datatypes ((array!104164 0))(
  ( (array!104165 (arr!50274 (Array (_ BitVec 32) (_ BitVec 64))) (size!50824 (_ BitVec 32))) )
))
(declare-fun _keys!637 () array!104164)

(declare-datatypes ((List!36494 0))(
  ( (Nil!36491) (Cons!36490 (h!37936 (_ BitVec 64)) (t!51341 List!36494)) )
))
(declare-fun arrayNoDuplicates!0 (array!104164 (_ BitVec 32) List!36494) Bool)

(assert (=> b!1562635 (= lt!671757 (arrayNoDuplicates!0 _keys!637 #b00000000000000000000000000000000 Nil!36491))))

(declare-fun mapNonEmpty!59463 () Bool)

(declare-fun mapRes!59463 () Bool)

(declare-fun tp!113298 () Bool)

(declare-fun e!870775 () Bool)

(assert (=> mapNonEmpty!59463 (= mapRes!59463 (and tp!113298 e!870775))))

(declare-datatypes ((V!59841 0))(
  ( (V!59842 (val!19446 Int)) )
))
(declare-datatypes ((ValueCell!18332 0))(
  ( (ValueCellFull!18332 (v!22198 V!59841)) (EmptyCell!18332) )
))
(declare-fun mapRest!59463 () (Array (_ BitVec 32) ValueCell!18332))

(declare-fun mapKey!59463 () (_ BitVec 32))

(declare-datatypes ((array!104166 0))(
  ( (array!104167 (arr!50275 (Array (_ BitVec 32) ValueCell!18332)) (size!50825 (_ BitVec 32))) )
))
(declare-fun _values!487 () array!104166)

(declare-fun mapValue!59463 () ValueCell!18332)

(assert (=> mapNonEmpty!59463 (= (arr!50275 _values!487) (store mapRest!59463 mapKey!59463 mapValue!59463))))

(declare-fun res!1068369 () Bool)

(assert (=> start!133642 (=> (not res!1068369) (not e!870776))))

(declare-fun mask!947 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!133642 (= res!1068369 (validMask!0 mask!947))))

(assert (=> start!133642 e!870776))

(assert (=> start!133642 true))

(declare-fun e!870774 () Bool)

(declare-fun array_inv!39075 (array!104166) Bool)

(assert (=> start!133642 (and (array_inv!39075 _values!487) e!870774)))

(declare-fun array_inv!39076 (array!104164) Bool)

(assert (=> start!133642 (array_inv!39076 _keys!637)))

(declare-fun b!1562636 () Bool)

(assert (=> b!1562636 (= e!870775 tp_is_empty!38725)))

(declare-fun mapIsEmpty!59463 () Bool)

(assert (=> mapIsEmpty!59463 mapRes!59463))

(declare-fun b!1562637 () Bool)

(declare-fun res!1068368 () Bool)

(assert (=> b!1562637 (=> (not res!1068368) (not e!870776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!104164 (_ BitVec 32)) Bool)

(assert (=> b!1562637 (= res!1068368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!637 mask!947))))

(declare-fun b!1562638 () Bool)

(assert (=> b!1562638 (= e!870774 (and e!870778 mapRes!59463))))

(declare-fun condMapEmpty!59463 () Bool)

(declare-fun mapDefault!59463 () ValueCell!18332)

