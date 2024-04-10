; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107144 () Bool)

(assert start!107144)

(declare-fun b!1270319 () Bool)

(declare-fun e!724081 () Bool)

(declare-fun tp_is_empty!32833 () Bool)

(assert (=> b!1270319 (= e!724081 tp_is_empty!32833)))

(declare-fun mapIsEmpty!50830 () Bool)

(declare-fun mapRes!50830 () Bool)

(assert (=> mapIsEmpty!50830 mapRes!50830))

(declare-fun b!1270320 () Bool)

(declare-fun e!724082 () Bool)

(assert (=> b!1270320 (= e!724082 false)))

(declare-fun lt!574686 () Bool)

(declare-datatypes ((array!82928 0))(
  ( (array!82929 (arr!40001 (Array (_ BitVec 32) (_ BitVec 64))) (size!40537 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82928)

(declare-datatypes ((List!28482 0))(
  ( (Nil!28479) (Cons!28478 (h!29687 (_ BitVec 64)) (t!42011 List!28482)) )
))
(declare-fun arrayNoDuplicates!0 (array!82928 (_ BitVec 32) List!28482) Bool)

(assert (=> b!1270320 (= lt!574686 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28479))))

(declare-fun res!845352 () Bool)

(assert (=> start!107144 (=> (not res!845352) (not e!724082))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107144 (= res!845352 (validMask!0 mask!1730))))

(assert (=> start!107144 e!724082))

(declare-datatypes ((V!48971 0))(
  ( (V!48972 (val!16491 Int)) )
))
(declare-datatypes ((ValueCell!15563 0))(
  ( (ValueCellFull!15563 (v!19128 V!48971)) (EmptyCell!15563) )
))
(declare-datatypes ((array!82930 0))(
  ( (array!82931 (arr!40002 (Array (_ BitVec 32) ValueCell!15563)) (size!40538 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82930)

(declare-fun e!724083 () Bool)

(declare-fun array_inv!30425 (array!82930) Bool)

(assert (=> start!107144 (and (array_inv!30425 _values!1134) e!724083)))

(assert (=> start!107144 true))

(declare-fun array_inv!30426 (array!82928) Bool)

(assert (=> start!107144 (array_inv!30426 _keys!1364)))

(declare-fun b!1270321 () Bool)

(declare-fun res!845354 () Bool)

(assert (=> b!1270321 (=> (not res!845354) (not e!724082))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270321 (= res!845354 (and (= (size!40538 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40537 _keys!1364) (size!40538 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1270322 () Bool)

(declare-fun res!845353 () Bool)

(assert (=> b!1270322 (=> (not res!845353) (not e!724082))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82928 (_ BitVec 32)) Bool)

(assert (=> b!1270322 (= res!845353 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270323 () Bool)

(declare-fun e!724079 () Bool)

(assert (=> b!1270323 (= e!724079 tp_is_empty!32833)))

(declare-fun mapNonEmpty!50830 () Bool)

(declare-fun tp!97171 () Bool)

(assert (=> mapNonEmpty!50830 (= mapRes!50830 (and tp!97171 e!724079))))

(declare-fun mapValue!50830 () ValueCell!15563)

(declare-fun mapKey!50830 () (_ BitVec 32))

(declare-fun mapRest!50830 () (Array (_ BitVec 32) ValueCell!15563))

(assert (=> mapNonEmpty!50830 (= (arr!40002 _values!1134) (store mapRest!50830 mapKey!50830 mapValue!50830))))

(declare-fun b!1270324 () Bool)

(assert (=> b!1270324 (= e!724083 (and e!724081 mapRes!50830))))

(declare-fun condMapEmpty!50830 () Bool)

(declare-fun mapDefault!50830 () ValueCell!15563)

