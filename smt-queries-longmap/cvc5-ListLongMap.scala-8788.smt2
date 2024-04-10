; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106922 () Bool)

(assert start!106922)

(declare-fun b!1268151 () Bool)

(declare-fun res!844091 () Bool)

(declare-fun e!722569 () Bool)

(assert (=> b!1268151 (=> (not res!844091) (not e!722569))))

(declare-datatypes ((array!82550 0))(
  ( (array!82551 (arr!39815 (Array (_ BitVec 32) (_ BitVec 64))) (size!40351 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82550)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82550 (_ BitVec 32)) Bool)

(assert (=> b!1268151 (= res!844091 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun mapIsEmpty!50533 () Bool)

(declare-fun mapRes!50533 () Bool)

(assert (=> mapIsEmpty!50533 mapRes!50533))

(declare-fun b!1268152 () Bool)

(declare-fun res!844092 () Bool)

(assert (=> b!1268152 (=> (not res!844092) (not e!722569))))

(declare-datatypes ((V!48715 0))(
  ( (V!48716 (val!16395 Int)) )
))
(declare-datatypes ((ValueCell!15467 0))(
  ( (ValueCellFull!15467 (v!19031 V!48715)) (EmptyCell!15467) )
))
(declare-datatypes ((array!82552 0))(
  ( (array!82553 (arr!39816 (Array (_ BitVec 32) ValueCell!15467)) (size!40352 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82552)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1268152 (= res!844092 (and (= (size!40352 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40351 _keys!1364) (size!40352 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268153 () Bool)

(declare-fun e!722568 () Bool)

(declare-fun tp_is_empty!32641 () Bool)

(assert (=> b!1268153 (= e!722568 tp_is_empty!32641)))

(declare-fun b!1268154 () Bool)

(declare-fun e!722565 () Bool)

(assert (=> b!1268154 (= e!722565 tp_is_empty!32641)))

(declare-fun b!1268155 () Bool)

(declare-fun e!722566 () Bool)

(assert (=> b!1268155 (= e!722566 (and e!722565 mapRes!50533))))

(declare-fun condMapEmpty!50533 () Bool)

(declare-fun mapDefault!50533 () ValueCell!15467)

