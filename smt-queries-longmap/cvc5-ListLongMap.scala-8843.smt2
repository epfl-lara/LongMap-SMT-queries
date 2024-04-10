; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107282 () Bool)

(assert start!107282)

(declare-fun b!1271561 () Bool)

(declare-fun res!845975 () Bool)

(declare-fun e!725117 () Bool)

(assert (=> b!1271561 (=> (not res!845975) (not e!725117))))

(declare-datatypes ((array!83190 0))(
  ( (array!83191 (arr!40132 (Array (_ BitVec 32) (_ BitVec 64))) (size!40668 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83190)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83190 (_ BitVec 32)) Bool)

(assert (=> b!1271561 (= res!845975 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271563 () Bool)

(declare-fun res!845974 () Bool)

(assert (=> b!1271563 (=> (not res!845974) (not e!725117))))

(declare-datatypes ((V!49155 0))(
  ( (V!49156 (val!16560 Int)) )
))
(declare-datatypes ((ValueCell!15632 0))(
  ( (ValueCellFull!15632 (v!19197 V!49155)) (EmptyCell!15632) )
))
(declare-datatypes ((array!83192 0))(
  ( (array!83193 (arr!40133 (Array (_ BitVec 32) ValueCell!15632)) (size!40669 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83192)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1271563 (= res!845974 (and (= (size!40669 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40668 _keys!1364) (size!40669 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!51037 () Bool)

(declare-fun mapRes!51037 () Bool)

(assert (=> mapIsEmpty!51037 mapRes!51037))

(declare-fun b!1271564 () Bool)

(declare-fun e!725114 () Bool)

(declare-fun tp_is_empty!32971 () Bool)

(assert (=> b!1271564 (= e!725114 tp_is_empty!32971)))

(declare-fun b!1271565 () Bool)

(declare-fun e!725115 () Bool)

(assert (=> b!1271565 (= e!725115 (and e!725114 mapRes!51037))))

(declare-fun condMapEmpty!51037 () Bool)

(declare-fun mapDefault!51037 () ValueCell!15632)

