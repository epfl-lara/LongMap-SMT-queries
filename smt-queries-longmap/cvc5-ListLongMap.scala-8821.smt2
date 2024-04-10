; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107150 () Bool)

(assert start!107150)

(declare-fun b!1270373 () Bool)

(declare-fun e!724125 () Bool)

(assert (=> b!1270373 (= e!724125 false)))

(declare-fun lt!574695 () Bool)

(declare-datatypes ((array!82940 0))(
  ( (array!82941 (arr!40007 (Array (_ BitVec 32) (_ BitVec 64))) (size!40543 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82940)

(declare-datatypes ((List!28485 0))(
  ( (Nil!28482) (Cons!28481 (h!29690 (_ BitVec 64)) (t!42014 List!28485)) )
))
(declare-fun arrayNoDuplicates!0 (array!82940 (_ BitVec 32) List!28485) Bool)

(assert (=> b!1270373 (= lt!574695 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28482))))

(declare-fun res!845379 () Bool)

(assert (=> start!107150 (=> (not res!845379) (not e!724125))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107150 (= res!845379 (validMask!0 mask!1730))))

(assert (=> start!107150 e!724125))

(declare-datatypes ((V!48979 0))(
  ( (V!48980 (val!16494 Int)) )
))
(declare-datatypes ((ValueCell!15566 0))(
  ( (ValueCellFull!15566 (v!19131 V!48979)) (EmptyCell!15566) )
))
(declare-datatypes ((array!82942 0))(
  ( (array!82943 (arr!40008 (Array (_ BitVec 32) ValueCell!15566)) (size!40544 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82942)

(declare-fun e!724128 () Bool)

(declare-fun array_inv!30429 (array!82942) Bool)

(assert (=> start!107150 (and (array_inv!30429 _values!1134) e!724128)))

(assert (=> start!107150 true))

(declare-fun array_inv!30430 (array!82940) Bool)

(assert (=> start!107150 (array_inv!30430 _keys!1364)))

(declare-fun mapNonEmpty!50839 () Bool)

(declare-fun mapRes!50839 () Bool)

(declare-fun tp!97180 () Bool)

(declare-fun e!724124 () Bool)

(assert (=> mapNonEmpty!50839 (= mapRes!50839 (and tp!97180 e!724124))))

(declare-fun mapKey!50839 () (_ BitVec 32))

(declare-fun mapRest!50839 () (Array (_ BitVec 32) ValueCell!15566))

(declare-fun mapValue!50839 () ValueCell!15566)

(assert (=> mapNonEmpty!50839 (= (arr!40008 _values!1134) (store mapRest!50839 mapKey!50839 mapValue!50839))))

(declare-fun b!1270374 () Bool)

(declare-fun tp_is_empty!32839 () Bool)

(assert (=> b!1270374 (= e!724124 tp_is_empty!32839)))

(declare-fun mapIsEmpty!50839 () Bool)

(assert (=> mapIsEmpty!50839 mapRes!50839))

(declare-fun b!1270375 () Bool)

(declare-fun e!724127 () Bool)

(assert (=> b!1270375 (= e!724127 tp_is_empty!32839)))

(declare-fun b!1270376 () Bool)

(declare-fun res!845380 () Bool)

(assert (=> b!1270376 (=> (not res!845380) (not e!724125))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82940 (_ BitVec 32)) Bool)

(assert (=> b!1270376 (= res!845380 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270377 () Bool)

(declare-fun res!845381 () Bool)

(assert (=> b!1270377 (=> (not res!845381) (not e!724125))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270377 (= res!845381 (and (= (size!40544 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40543 _keys!1364) (size!40544 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270378 () Bool)

(assert (=> b!1270378 (= e!724128 (and e!724127 mapRes!50839))))

(declare-fun condMapEmpty!50839 () Bool)

(declare-fun mapDefault!50839 () ValueCell!15566)

