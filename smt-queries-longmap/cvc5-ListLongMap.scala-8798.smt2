; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107012 () Bool)

(assert start!107012)

(declare-fun res!844434 () Bool)

(declare-fun e!723090 () Bool)

(assert (=> start!107012 (=> (not res!844434) (not e!723090))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107012 (= res!844434 (validMask!0 mask!1730))))

(assert (=> start!107012 e!723090))

(declare-datatypes ((V!48795 0))(
  ( (V!48796 (val!16425 Int)) )
))
(declare-datatypes ((ValueCell!15497 0))(
  ( (ValueCellFull!15497 (v!19062 V!48795)) (EmptyCell!15497) )
))
(declare-datatypes ((array!82672 0))(
  ( (array!82673 (arr!39873 (Array (_ BitVec 32) ValueCell!15497)) (size!40409 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82672)

(declare-fun e!723093 () Bool)

(declare-fun array_inv!30339 (array!82672) Bool)

(assert (=> start!107012 (and (array_inv!30339 _values!1134) e!723093)))

(assert (=> start!107012 true))

(declare-datatypes ((array!82674 0))(
  ( (array!82675 (arr!39874 (Array (_ BitVec 32) (_ BitVec 64))) (size!40410 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82674)

(declare-fun array_inv!30340 (array!82674) Bool)

(assert (=> start!107012 (array_inv!30340 _keys!1364)))

(declare-fun b!1268807 () Bool)

(declare-fun res!844435 () Bool)

(assert (=> b!1268807 (=> (not res!844435) (not e!723090))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268807 (= res!844435 (and (= (size!40409 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40410 _keys!1364) (size!40409 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!50632 () Bool)

(declare-fun mapRes!50632 () Bool)

(declare-fun tp!96811 () Bool)

(declare-fun e!723089 () Bool)

(assert (=> mapNonEmpty!50632 (= mapRes!50632 (and tp!96811 e!723089))))

(declare-fun mapKey!50632 () (_ BitVec 32))

(declare-fun mapValue!50632 () ValueCell!15497)

(declare-fun mapRest!50632 () (Array (_ BitVec 32) ValueCell!15497))

(assert (=> mapNonEmpty!50632 (= (arr!39873 _values!1134) (store mapRest!50632 mapKey!50632 mapValue!50632))))

(declare-fun b!1268808 () Bool)

(declare-fun tp_is_empty!32701 () Bool)

(assert (=> b!1268808 (= e!723089 tp_is_empty!32701)))

(declare-fun mapIsEmpty!50632 () Bool)

(assert (=> mapIsEmpty!50632 mapRes!50632))

(declare-fun b!1268809 () Bool)

(declare-fun res!844436 () Bool)

(assert (=> b!1268809 (=> (not res!844436) (not e!723090))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82674 (_ BitVec 32)) Bool)

(assert (=> b!1268809 (= res!844436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268810 () Bool)

(declare-fun e!723091 () Bool)

(assert (=> b!1268810 (= e!723091 tp_is_empty!32701)))

(declare-fun b!1268811 () Bool)

(assert (=> b!1268811 (= e!723090 false)))

(declare-fun lt!574488 () Bool)

(declare-datatypes ((List!28395 0))(
  ( (Nil!28392) (Cons!28391 (h!29600 (_ BitVec 64)) (t!41924 List!28395)) )
))
(declare-fun arrayNoDuplicates!0 (array!82674 (_ BitVec 32) List!28395) Bool)

(assert (=> b!1268811 (= lt!574488 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28392))))

(declare-fun b!1268812 () Bool)

(assert (=> b!1268812 (= e!723093 (and e!723091 mapRes!50632))))

(declare-fun condMapEmpty!50632 () Bool)

(declare-fun mapDefault!50632 () ValueCell!15497)

