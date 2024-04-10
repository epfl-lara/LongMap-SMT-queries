; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108098 () Bool)

(assert start!108098)

(declare-fun b_free!27811 () Bool)

(declare-fun b_next!27811 () Bool)

(assert (=> start!108098 (= b_free!27811 (not b_next!27811))))

(declare-fun tp!98386 () Bool)

(declare-fun b_and!45867 () Bool)

(assert (=> start!108098 (= tp!98386 b_and!45867)))

(declare-fun mapIsEmpty!51572 () Bool)

(declare-fun mapRes!51572 () Bool)

(assert (=> mapIsEmpty!51572 mapRes!51572))

(declare-fun res!848370 () Bool)

(declare-fun e!728990 () Bool)

(assert (=> start!108098 (=> (not res!848370) (not e!728990))))

(declare-fun mask!1805 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108098 (= res!848370 (validMask!0 mask!1805))))

(assert (=> start!108098 e!728990))

(assert (=> start!108098 true))

(assert (=> start!108098 tp!98386))

(declare-fun tp_is_empty!33361 () Bool)

(assert (=> start!108098 tp_is_empty!33361))

(declare-datatypes ((V!49585 0))(
  ( (V!49586 (val!16755 Int)) )
))
(declare-datatypes ((ValueCell!15782 0))(
  ( (ValueCellFull!15782 (v!19352 V!49585)) (EmptyCell!15782) )
))
(declare-datatypes ((array!83816 0))(
  ( (array!83817 (arr!40419 (Array (_ BitVec 32) ValueCell!15782)) (size!40969 (_ BitVec 32))) )
))
(declare-fun _values!1187 () array!83816)

(declare-fun e!728988 () Bool)

(declare-fun array_inv!30719 (array!83816) Bool)

(assert (=> start!108098 (and (array_inv!30719 _values!1187) e!728988)))

(declare-datatypes ((array!83818 0))(
  ( (array!83819 (arr!40420 (Array (_ BitVec 32) (_ BitVec 64))) (size!40970 (_ BitVec 32))) )
))
(declare-fun _keys!1427 () array!83818)

(declare-fun array_inv!30720 (array!83818) Bool)

(assert (=> start!108098 (array_inv!30720 _keys!1427)))

(declare-fun b!1276586 () Bool)

(declare-fun res!848368 () Bool)

(assert (=> b!1276586 (=> (not res!848368) (not e!728990))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!83818 (_ BitVec 32)) Bool)

(assert (=> b!1276586 (= res!848368 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1427 mask!1805))))

(declare-fun b!1276587 () Bool)

(declare-fun res!848367 () Bool)

(assert (=> b!1276587 (=> (not res!848367) (not e!728990))))

(declare-datatypes ((List!28666 0))(
  ( (Nil!28663) (Cons!28662 (h!29871 (_ BitVec 64)) (t!42202 List!28666)) )
))
(declare-fun arrayNoDuplicates!0 (array!83818 (_ BitVec 32) List!28666) Bool)

(assert (=> b!1276587 (= res!848367 (arrayNoDuplicates!0 _keys!1427 #b00000000000000000000000000000000 Nil!28663))))

(declare-fun b!1276588 () Bool)

(declare-fun e!728991 () Bool)

(assert (=> b!1276588 (= e!728988 (and e!728991 mapRes!51572))))

(declare-fun condMapEmpty!51572 () Bool)

(declare-fun mapDefault!51572 () ValueCell!15782)

