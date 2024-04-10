; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!35726 () Bool)

(assert start!35726)

(declare-fun b!358824 () Bool)

(declare-fun e!219720 () Bool)

(declare-fun tp_is_empty!8179 () Bool)

(assert (=> b!358824 (= e!219720 tp_is_empty!8179)))

(declare-fun mapNonEmpty!13776 () Bool)

(declare-fun mapRes!13776 () Bool)

(declare-fun tp!27834 () Bool)

(assert (=> mapNonEmpty!13776 (= mapRes!13776 (and tp!27834 e!219720))))

(declare-fun mapKey!13776 () (_ BitVec 32))

(declare-datatypes ((V!11883 0))(
  ( (V!11884 (val!4134 Int)) )
))
(declare-datatypes ((ValueCell!3746 0))(
  ( (ValueCellFull!3746 (v!6328 V!11883)) (EmptyCell!3746) )
))
(declare-fun mapValue!13776 () ValueCell!3746)

(declare-datatypes ((array!19921 0))(
  ( (array!19922 (arr!9454 (Array (_ BitVec 32) ValueCell!3746)) (size!9806 (_ BitVec 32))) )
))
(declare-fun _values!1208 () array!19921)

(declare-fun mapRest!13776 () (Array (_ BitVec 32) ValueCell!3746))

(assert (=> mapNonEmpty!13776 (= (arr!9454 _values!1208) (store mapRest!13776 mapKey!13776 mapValue!13776))))

(declare-fun b!358825 () Bool)

(declare-fun e!219721 () Bool)

(declare-fun e!219719 () Bool)

(assert (=> b!358825 (= e!219721 (and e!219719 mapRes!13776))))

(declare-fun condMapEmpty!13776 () Bool)

(declare-fun mapDefault!13776 () ValueCell!3746)

