; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14426 () Bool)

(assert start!14426)

(declare-fun b!135902 () Bool)

(declare-fun b_free!2937 () Bool)

(declare-fun b_next!2937 () Bool)

(assert (=> b!135902 (= b_free!2937 (not b_next!2937))))

(declare-fun tp!11265 () Bool)

(declare-fun b_and!8403 () Bool)

(assert (=> b!135902 (= tp!11265 b_and!8403)))

(declare-fun b!135893 () Bool)

(declare-fun b_free!2939 () Bool)

(declare-fun b_next!2939 () Bool)

(assert (=> b!135893 (= b_free!2939 (not b_next!2939))))

(declare-fun tp!11266 () Bool)

(declare-fun b_and!8405 () Bool)

(assert (=> b!135893 (= tp!11266 b_and!8405)))

(declare-fun b!135889 () Bool)

(declare-fun res!65234 () Bool)

(declare-fun e!88507 () Bool)

(assert (=> b!135889 (=> (not res!65234) (not e!88507))))

(declare-datatypes ((V!3493 0))(
  ( (V!3494 (val!1487 Int)) )
))
(declare-datatypes ((array!4799 0))(
  ( (array!4800 (arr!2269 (Array (_ BitVec 32) (_ BitVec 64))) (size!2539 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1099 0))(
  ( (ValueCellFull!1099 (v!3217 V!3493)) (EmptyCell!1099) )
))
(declare-datatypes ((array!4801 0))(
  ( (array!4802 (arr!2270 (Array (_ BitVec 32) ValueCell!1099)) (size!2540 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1106 0))(
  ( (LongMapFixedSize!1107 (defaultEntry!2887 Int) (mask!7199 (_ BitVec 32)) (extraKeys!2648 (_ BitVec 32)) (zeroValue!2740 V!3493) (minValue!2740 V!3493) (_size!602 (_ BitVec 32)) (_keys!4640 array!4799) (_values!2870 array!4801) (_vacant!602 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!1106)

(declare-fun valid!529 (LongMapFixedSize!1106) Bool)

(assert (=> b!135889 (= res!65234 (valid!529 newMap!16))))

(declare-fun b!135890 () Bool)

(declare-fun e!88503 () Bool)

(declare-fun e!88504 () Bool)

(declare-fun mapRes!4677 () Bool)

(assert (=> b!135890 (= e!88503 (and e!88504 mapRes!4677))))

(declare-fun condMapEmpty!4677 () Bool)

(declare-fun mapDefault!4677 () ValueCell!1099)

