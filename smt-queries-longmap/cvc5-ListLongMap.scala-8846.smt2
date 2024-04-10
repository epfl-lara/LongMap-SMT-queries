; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107300 () Bool)

(assert start!107300)

(declare-fun b!1271723 () Bool)

(declare-fun e!725250 () Bool)

(declare-fun tp_is_empty!32989 () Bool)

(assert (=> b!1271723 (= e!725250 tp_is_empty!32989)))

(declare-fun b!1271724 () Bool)

(declare-fun res!846054 () Bool)

(declare-fun e!725249 () Bool)

(assert (=> b!1271724 (=> (not res!846054) (not e!725249))))

(declare-datatypes ((array!83226 0))(
  ( (array!83227 (arr!40150 (Array (_ BitVec 32) (_ BitVec 64))) (size!40686 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83226)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83226 (_ BitVec 32)) Bool)

(assert (=> b!1271724 (= res!846054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271725 () Bool)

(declare-fun e!725252 () Bool)

(assert (=> b!1271725 (= e!725252 tp_is_empty!32989)))

(declare-fun res!846055 () Bool)

(assert (=> start!107300 (=> (not res!846055) (not e!725249))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107300 (= res!846055 (validMask!0 mask!1730))))

(assert (=> start!107300 e!725249))

(declare-datatypes ((V!49179 0))(
  ( (V!49180 (val!16569 Int)) )
))
(declare-datatypes ((ValueCell!15641 0))(
  ( (ValueCellFull!15641 (v!19206 V!49179)) (EmptyCell!15641) )
))
(declare-datatypes ((array!83228 0))(
  ( (array!83229 (arr!40151 (Array (_ BitVec 32) ValueCell!15641)) (size!40687 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83228)

(declare-fun e!725253 () Bool)

(declare-fun array_inv!30539 (array!83228) Bool)

(assert (=> start!107300 (and (array_inv!30539 _values!1134) e!725253)))

(assert (=> start!107300 true))

(declare-fun array_inv!30540 (array!83226) Bool)

(assert (=> start!107300 (array_inv!30540 _keys!1364)))

(declare-fun b!1271726 () Bool)

(declare-fun res!846056 () Bool)

(assert (=> b!1271726 (=> (not res!846056) (not e!725249))))

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271726 (= res!846056 (and (= (size!40687 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40686 _keys!1364) (size!40687 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!51064 () Bool)

(declare-fun mapRes!51064 () Bool)

(declare-fun tp!97405 () Bool)

(assert (=> mapNonEmpty!51064 (= mapRes!51064 (and tp!97405 e!725252))))

(declare-fun mapRest!51064 () (Array (_ BitVec 32) ValueCell!15641))

(declare-fun mapValue!51064 () ValueCell!15641)

(declare-fun mapKey!51064 () (_ BitVec 32))

(assert (=> mapNonEmpty!51064 (= (arr!40151 _values!1134) (store mapRest!51064 mapKey!51064 mapValue!51064))))

(declare-fun b!1271727 () Bool)

(assert (=> b!1271727 (= e!725253 (and e!725250 mapRes!51064))))

(declare-fun condMapEmpty!51064 () Bool)

(declare-fun mapDefault!51064 () ValueCell!15641)

