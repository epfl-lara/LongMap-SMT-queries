; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107252 () Bool)

(assert start!107252)

(declare-fun b!1271291 () Bool)

(declare-fun res!845838 () Bool)

(declare-fun e!724891 () Bool)

(assert (=> b!1271291 (=> (not res!845838) (not e!724891))))

(declare-datatypes ((array!83132 0))(
  ( (array!83133 (arr!40103 (Array (_ BitVec 32) (_ BitVec 64))) (size!40639 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83132)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83132 (_ BitVec 32)) Bool)

(assert (=> b!1271291 (= res!845838 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1271292 () Bool)

(declare-fun e!724889 () Bool)

(declare-fun tp_is_empty!32941 () Bool)

(assert (=> b!1271292 (= e!724889 tp_is_empty!32941)))

(declare-fun res!845839 () Bool)

(assert (=> start!107252 (=> (not res!845839) (not e!724891))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107252 (= res!845839 (validMask!0 mask!1730))))

(assert (=> start!107252 e!724891))

(declare-datatypes ((V!49115 0))(
  ( (V!49116 (val!16545 Int)) )
))
(declare-datatypes ((ValueCell!15617 0))(
  ( (ValueCellFull!15617 (v!19182 V!49115)) (EmptyCell!15617) )
))
(declare-datatypes ((array!83134 0))(
  ( (array!83135 (arr!40104 (Array (_ BitVec 32) ValueCell!15617)) (size!40640 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83134)

(declare-fun e!724890 () Bool)

(declare-fun array_inv!30501 (array!83134) Bool)

(assert (=> start!107252 (and (array_inv!30501 _values!1134) e!724890)))

(assert (=> start!107252 true))

(declare-fun array_inv!30502 (array!83132) Bool)

(assert (=> start!107252 (array_inv!30502 _keys!1364)))

(declare-fun mapIsEmpty!50992 () Bool)

(declare-fun mapRes!50992 () Bool)

(assert (=> mapIsEmpty!50992 mapRes!50992))

(declare-fun mapNonEmpty!50992 () Bool)

(declare-fun tp!97333 () Bool)

(declare-fun e!724893 () Bool)

(assert (=> mapNonEmpty!50992 (= mapRes!50992 (and tp!97333 e!724893))))

(declare-fun mapKey!50992 () (_ BitVec 32))

(declare-fun mapValue!50992 () ValueCell!15617)

(declare-fun mapRest!50992 () (Array (_ BitVec 32) ValueCell!15617))

(assert (=> mapNonEmpty!50992 (= (arr!40104 _values!1134) (store mapRest!50992 mapKey!50992 mapValue!50992))))

(declare-fun b!1271293 () Bool)

(assert (=> b!1271293 (= e!724890 (and e!724889 mapRes!50992))))

(declare-fun condMapEmpty!50992 () Bool)

(declare-fun mapDefault!50992 () ValueCell!15617)

