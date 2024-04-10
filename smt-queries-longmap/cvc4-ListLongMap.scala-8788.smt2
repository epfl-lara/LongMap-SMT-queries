; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!106926 () Bool)

(assert start!106926)

(declare-fun b!1268187 () Bool)

(declare-fun e!722597 () Bool)

(declare-fun tp_is_empty!32645 () Bool)

(assert (=> b!1268187 (= e!722597 tp_is_empty!32645)))

(declare-fun mapIsEmpty!50539 () Bool)

(declare-fun mapRes!50539 () Bool)

(assert (=> mapIsEmpty!50539 mapRes!50539))

(declare-fun b!1268188 () Bool)

(declare-fun res!844110 () Bool)

(declare-fun e!722595 () Bool)

(assert (=> b!1268188 (=> (not res!844110) (not e!722595))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!82558 0))(
  ( (array!82559 (arr!39819 (Array (_ BitVec 32) (_ BitVec 64))) (size!40355 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!82558)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(declare-datatypes ((V!48719 0))(
  ( (V!48720 (val!16397 Int)) )
))
(declare-datatypes ((ValueCell!15469 0))(
  ( (ValueCellFull!15469 (v!19033 V!48719)) (EmptyCell!15469) )
))
(declare-datatypes ((array!82560 0))(
  ( (array!82561 (arr!39820 (Array (_ BitVec 32) ValueCell!15469)) (size!40356 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!82560)

(assert (=> b!1268188 (= res!844110 (and (= (size!40356 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40355 _keys!1364) (size!40356 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun b!1268189 () Bool)

(declare-fun e!722599 () Bool)

(assert (=> b!1268189 (= e!722599 tp_is_empty!32645)))

(declare-fun mapNonEmpty!50539 () Bool)

(declare-fun tp!96718 () Bool)

(assert (=> mapNonEmpty!50539 (= mapRes!50539 (and tp!96718 e!722599))))

(declare-fun mapValue!50539 () ValueCell!15469)

(declare-fun mapKey!50539 () (_ BitVec 32))

(declare-fun mapRest!50539 () (Array (_ BitVec 32) ValueCell!15469))

(assert (=> mapNonEmpty!50539 (= (arr!39820 _values!1134) (store mapRest!50539 mapKey!50539 mapValue!50539))))

(declare-fun b!1268191 () Bool)

(declare-fun res!844109 () Bool)

(assert (=> b!1268191 (=> (not res!844109) (not e!722595))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!82558 (_ BitVec 32)) Bool)

(assert (=> b!1268191 (= res!844109 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1268192 () Bool)

(declare-fun e!722596 () Bool)

(assert (=> b!1268192 (= e!722596 (and e!722597 mapRes!50539))))

(declare-fun condMapEmpty!50539 () Bool)

(declare-fun mapDefault!50539 () ValueCell!15469)

