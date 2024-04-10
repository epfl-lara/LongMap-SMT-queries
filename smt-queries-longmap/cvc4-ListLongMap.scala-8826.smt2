; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107184 () Bool)

(assert start!107184)

(declare-fun b!1270679 () Bool)

(declare-fun res!845533 () Bool)

(declare-fun e!724379 () Bool)

(assert (=> b!1270679 (=> (not res!845533) (not e!724379))))

(declare-datatypes ((V!49023 0))(
  ( (V!49024 (val!16511 Int)) )
))
(declare-datatypes ((ValueCell!15583 0))(
  ( (ValueCellFull!15583 (v!19148 V!49023)) (EmptyCell!15583) )
))
(declare-datatypes ((array!83004 0))(
  ( (array!83005 (arr!40039 (Array (_ BitVec 32) ValueCell!15583)) (size!40575 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83004)

(declare-fun extraKeysBefore!81 () (_ BitVec 32))

(declare-datatypes ((array!83006 0))(
  ( (array!83007 (arr!40040 (Array (_ BitVec 32) (_ BitVec 64))) (size!40576 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83006)

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun extraKeysAfter!73 () (_ BitVec 32))

(assert (=> b!1270679 (= res!845533 (and (= (size!40575 _values!1134) (bvadd #b00000000000000000000000000000001 mask!1730)) (= (size!40576 _keys!1364) (size!40575 _values!1134)) (bvsge mask!1730 #b00000000000000000000000000000000) (bvsge extraKeysBefore!81 #b00000000000000000000000000000000) (bvsle extraKeysBefore!81 #b00000000000000000000000000000011) (bvsge extraKeysAfter!73 #b00000000000000000000000000000000) (bvsle extraKeysAfter!73 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!50890 () Bool)

(declare-fun mapRes!50890 () Bool)

(assert (=> mapIsEmpty!50890 mapRes!50890))

(declare-fun b!1270680 () Bool)

(declare-fun e!724383 () Bool)

(declare-fun tp_is_empty!32873 () Bool)

(assert (=> b!1270680 (= e!724383 tp_is_empty!32873)))

(declare-fun b!1270681 () Bool)

(declare-fun res!845532 () Bool)

(assert (=> b!1270681 (=> (not res!845532) (not e!724379))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83006 (_ BitVec 32)) Bool)

(assert (=> b!1270681 (= res!845532 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1364 mask!1730))))

(declare-fun b!1270682 () Bool)

(declare-fun e!724382 () Bool)

(assert (=> b!1270682 (= e!724382 (and e!724383 mapRes!50890))))

(declare-fun condMapEmpty!50890 () Bool)

(declare-fun mapDefault!50890 () ValueCell!15583)

