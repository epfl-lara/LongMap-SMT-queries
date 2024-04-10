; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14970 () Bool)

(assert start!14970)

(declare-fun b!143772 () Bool)

(declare-fun b_free!3049 () Bool)

(declare-fun b_next!3049 () Bool)

(assert (=> b!143772 (= b_free!3049 (not b_next!3049))))

(declare-fun tp!11634 () Bool)

(declare-fun b_and!8959 () Bool)

(assert (=> b!143772 (= tp!11634 b_and!8959)))

(declare-fun b!143763 () Bool)

(declare-fun b_free!3051 () Bool)

(declare-fun b_next!3051 () Bool)

(assert (=> b!143763 (= b_free!3051 (not b_next!3051))))

(declare-fun tp!11635 () Bool)

(declare-fun b_and!8961 () Bool)

(assert (=> b!143763 (= tp!11635 b_and!8961)))

(declare-fun e!93693 () Bool)

(declare-fun tp_is_empty!2941 () Bool)

(declare-datatypes ((V!3569 0))(
  ( (V!3570 (val!1515 Int)) )
))
(declare-datatypes ((array!4921 0))(
  ( (array!4922 (arr!2325 (Array (_ BitVec 32) (_ BitVec 64))) (size!2599 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1127 0))(
  ( (ValueCellFull!1127 (v!3306 V!3569)) (EmptyCell!1127) )
))
(declare-datatypes ((array!4923 0))(
  ( (array!4924 (arr!2326 (Array (_ BitVec 32) ValueCell!1127)) (size!2600 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1162 0))(
  ( (LongMapFixedSize!1163 (defaultEntry!2975 Int) (mask!7333 (_ BitVec 32)) (extraKeys!2724 (_ BitVec 32)) (zeroValue!2822 V!3569) (minValue!2822 V!3569) (_size!630 (_ BitVec 32)) (_keys!4740 array!4921) (_values!2958 array!4923) (_vacant!630 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1162)

(declare-fun e!93687 () Bool)

(declare-fun array_inv!1461 (array!4921) Bool)

(declare-fun array_inv!1462 (array!4923) Bool)

(assert (=> b!143763 (= e!93693 (and tp!11635 tp_is_empty!2941 (array_inv!1461 (_keys!4740 newMap!16)) (array_inv!1462 (_values!2958 newMap!16)) e!93687))))

(declare-fun b!143764 () Bool)

(declare-fun e!93688 () Bool)

(assert (=> b!143764 (= e!93688 tp_is_empty!2941)))

(declare-fun b!143765 () Bool)

(declare-fun e!93686 () Bool)

(declare-fun mapRes!4880 () Bool)

(assert (=> b!143765 (= e!93687 (and e!93686 mapRes!4880))))

(declare-fun condMapEmpty!4880 () Bool)

(declare-fun mapDefault!4879 () ValueCell!1127)

