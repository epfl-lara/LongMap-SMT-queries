; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107196 () Bool)

(assert start!107196)

(declare-fun b!1270787 () Bool)

(declare-fun e!724470 () Bool)

(declare-fun tp_is_empty!32885 () Bool)

(assert (=> b!1270787 (= e!724470 tp_is_empty!32885)))

(declare-fun mapIsEmpty!50908 () Bool)

(declare-fun mapRes!50908 () Bool)

(assert (=> mapIsEmpty!50908 mapRes!50908))

(declare-fun res!845588 () Bool)

(declare-fun e!724472 () Bool)

(assert (=> start!107196 (=> (not res!845588) (not e!724472))))

(declare-fun mask!1730 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!107196 (= res!845588 (validMask!0 mask!1730))))

(assert (=> start!107196 e!724472))

(declare-datatypes ((V!49039 0))(
  ( (V!49040 (val!16517 Int)) )
))
(declare-datatypes ((ValueCell!15589 0))(
  ( (ValueCellFull!15589 (v!19154 V!49039)) (EmptyCell!15589) )
))
(declare-datatypes ((array!83028 0))(
  ( (array!83029 (arr!40051 (Array (_ BitVec 32) ValueCell!15589)) (size!40587 (_ BitVec 32))) )
))
(declare-fun _values!1134 () array!83028)

(declare-fun e!724469 () Bool)

(declare-fun array_inv!30463 (array!83028) Bool)

(assert (=> start!107196 (and (array_inv!30463 _values!1134) e!724469)))

(assert (=> start!107196 true))

(declare-datatypes ((array!83030 0))(
  ( (array!83031 (arr!40052 (Array (_ BitVec 32) (_ BitVec 64))) (size!40588 (_ BitVec 32))) )
))
(declare-fun _keys!1364 () array!83030)

(declare-fun array_inv!30464 (array!83030) Bool)

(assert (=> start!107196 (array_inv!30464 _keys!1364)))

(declare-fun b!1270788 () Bool)

(assert (=> b!1270788 (= e!724472 false)))

(declare-fun lt!574764 () Bool)

(declare-datatypes ((List!28501 0))(
  ( (Nil!28498) (Cons!28497 (h!29706 (_ BitVec 64)) (t!42030 List!28501)) )
))
(declare-fun arrayNoDuplicates!0 (array!83030 (_ BitVec 32) List!28501) Bool)

(assert (=> b!1270788 (= lt!574764 (arrayNoDuplicates!0 _keys!1364 #b00000000000000000000000000000000 Nil!28498))))

(declare-fun b!1270789 () Bool)

(assert (=> b!1270789 (= e!724469 (and e!724470 mapRes!50908))))

(declare-fun condMapEmpty!50908 () Bool)

(declare-fun mapDefault!50908 () ValueCell!15589)

