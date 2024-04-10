; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!15202 () Bool)

(assert start!15202)

(declare-fun b!146186 () Bool)

(declare-fun b_free!3109 () Bool)

(declare-fun b_next!3109 () Bool)

(assert (=> b!146186 (= b_free!3109 (not b_next!3109))))

(declare-fun tp!11831 () Bool)

(declare-fun b_and!9135 () Bool)

(assert (=> b!146186 (= tp!11831 b_and!9135)))

(declare-fun b!146177 () Bool)

(declare-fun b_free!3111 () Bool)

(declare-fun b_next!3111 () Bool)

(assert (=> b!146177 (= b_free!3111 (not b_next!3111))))

(declare-fun tp!11829 () Bool)

(declare-fun b_and!9137 () Bool)

(assert (=> b!146177 (= tp!11829 b_and!9137)))

(declare-fun b!146173 () Bool)

(declare-fun e!95331 () Bool)

(declare-fun e!95330 () Bool)

(declare-fun mapRes!4986 () Bool)

(assert (=> b!146173 (= e!95331 (and e!95330 mapRes!4986))))

(declare-fun condMapEmpty!4986 () Bool)

(declare-datatypes ((V!3609 0))(
  ( (V!3610 (val!1530 Int)) )
))
(declare-datatypes ((array!4987 0))(
  ( (array!4988 (arr!2355 (Array (_ BitVec 32) (_ BitVec 64))) (size!2631 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1142 0))(
  ( (ValueCellFull!1142 (v!3350 V!3609)) (EmptyCell!1142) )
))
(declare-datatypes ((array!4989 0))(
  ( (array!4990 (arr!2356 (Array (_ BitVec 32) ValueCell!1142)) (size!2632 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1192 0))(
  ( (LongMapFixedSize!1193 (defaultEntry!3012 Int) (mask!7388 (_ BitVec 32)) (extraKeys!2757 (_ BitVec 32)) (zeroValue!2857 V!3609) (minValue!2857 V!3609) (_size!645 (_ BitVec 32)) (_keys!4781 array!4987) (_values!2995 array!4989) (_vacant!645 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!976 0))(
  ( (Cell!977 (v!3351 LongMapFixedSize!1192)) )
))
(declare-datatypes ((LongMap!976 0))(
  ( (LongMap!977 (underlying!499 Cell!976)) )
))
(declare-fun thiss!992 () LongMap!976)

(declare-fun mapDefault!4985 () ValueCell!1142)

