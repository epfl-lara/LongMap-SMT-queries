; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106998 () Bool)

(assert start!106998)

(declare-fun b!1268681 () Bool)

(declare-fun res!844373 () Bool)

(declare-fun e!722987 () Bool)

(assert (=> b!1268681 (=> (not res!844373) (not e!722987))))

(declare-datatypes ((V!48775 0))(
  ( (V!48776 (val!16418 Int)) )
))
(declare-datatypes ((ValueCell!15490 0))(
  ( (ValueCellFull!15490 (v!19055 V!48775)) (EmptyCell!15490) )
))
(declare-datatypes ((array!82644 0))(
  ( (array!82645 (arr!39859 (Array (_ BitVec 32) ValueCell!15490)) (size!40395 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82644)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82646 0))(
  ( (array!82647 (arr!39860 (Array (_ BitVec 32) (_ BitVec 64))) (size!40396 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82646)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268681 (= res!844373 (and (= (size!40395 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40396 _keys!1364) (size!40395 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268682 () Bool)

(assert (=> b!1268682 (= e!722987 false)))

(declare-fun lt!574467 () Bool)

(declare-datatypes ((List!28390 0))(
  ( (Nil!28387) (Cons!28386 (h!29595 (_ BitVec 64)) (t!41919 List!28390)) )
))
(declare-fun arrayNoDuplicates!0 (array!82646 (_ BitVec 32) List!28390) Bool)

(assert (=> b!1268682 (= lt!574467 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28387))))

(declare-fun mapNonEmpty!50611 () Bool)

(declare-fun mapRes!50611 () Bool)

(declare-fun tp!96790 () Bool)

(declare-fun e!722985 () Bool)

(assert (=> mapNonEmpty!50611 (= mapRes!50611 (and tp!96790 e!722985))))

(declare-fun mapKey!50611 () (_ BitVec 32))

(declare-fun mapRest!50611 () (Array (_ BitVec 32) ValueCell!15490))

(declare-fun mapValue!50611 () ValueCell!15490)

(assert (=> mapNonEmpty!50611 (= (arr!39859 _values!1134) (store mapRest!50611 mapKey!50611 mapValue!50611))))

(declare-fun mapIsEmpty!50611 () Bool)

(assert (=> mapIsEmpty!50611 mapRes!50611))

(declare-fun b!1268684 () Bool)

(declare-fun tp_is_empty!32687 () Bool)

(assert (=> b!1268684 (= e!722985 tp_is_empty!32687)))

(declare-fun b!1268685 () Bool)

(declare-fun e!722988 () Bool)

(declare-fun e!722984 () Bool)

(assert (=> b!1268685 (= e!722988 (and e!722984 mapRes!50611))))

(declare-fun condMapEmpty!50611 () Bool)

(declare-fun mapDefault!50611 () ValueCell!15490)

