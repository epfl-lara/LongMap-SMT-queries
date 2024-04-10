; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107018 () Bool)

(assert start!107018)

(declare-fun b!1268861 () Bool)

(declare-fun e!723135 () Bool)

(declare-fun tp_is_empty!32707 () Bool)

(assert (=> b!1268861 (= e!723135 tp_is_empty!32707)))

(declare-fun mapNonEmpty!50641 () Bool)

(declare-fun mapRes!50641 () Bool)

(declare-fun tp!96820 () Bool)

(declare-fun e!723137 () Bool)

(assert (=> mapNonEmpty!50641 (= mapRes!50641 (and tp!96820 e!723137))))

(declare-fun mapKey!50641 () (_ BitVec 32))

(declare-datatypes ((V!48803 0))(
  ( (V!48804 (val!16428 Int)) )
))
(declare-datatypes ((ValueCell!15500 0))(
  ( (ValueCellFull!15500 (v!19065 V!48803)) (EmptyCell!15500) )
))
(declare-fun mapValue!50641 () ValueCell!15500)

(declare-fun mapRest!50641 () (Array (_ BitVec 32) ValueCell!15500))

(declare-datatypes ((array!82684 0))(
  ( (array!82685 (arr!39879 (Array (_ BitVec 32) ValueCell!15500)) (size!40415 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82684)

(assert (=> mapNonEmpty!50641 (= (arr!39879 _values!1134) (store mapRest!50641 mapKey!50641 mapValue!50641))))

(declare-fun b!1268862 () Bool)

(declare-fun e!723134 () Bool)

(assert (=> b!1268862 (= e!723134 false)))

(declare-fun lt!574497 () Bool)

(declare-datatypes ((array!82686 0))(
  ( (array!82687 (arr!39880 (Array (_ BitVec 32) (_ BitVec 64))) (size!40416 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82686)

(declare-datatypes ((List!28398 0))(
  ( (Nil!28395) (Cons!28394 (h!29603 (_ BitVec 64)) (t!41927 List!28398)) )
))
(declare-fun arrayNoDuplicates!0 (array!82686 (_ BitVec 32) List!28398) Bool)

(assert (=> b!1268862 (= lt!574497 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28395))))

(declare-fun b!1268863 () Bool)

(declare-fun e!723138 () Bool)

(assert (=> b!1268863 (= e!723138 (and e!723135 mapRes!50641))))

(declare-fun condMapEmpty!50641 () Bool)

(declare-fun mapDefault!50641 () ValueCell!15500)

