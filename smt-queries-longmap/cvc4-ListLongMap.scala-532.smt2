; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!13250 () Bool)

(assert start!13250)

(declare-fun b!116994 () Bool)

(declare-fun b_free!2781 () Bool)

(declare-fun b_next!2781 () Bool)

(assert (=> b!116994 (= b_free!2781 (not b_next!2781))))

(declare-fun tp!10719 () Bool)

(declare-fun b_and!7299 () Bool)

(assert (=> b!116994 (= tp!10719 b_and!7299)))

(declare-fun b!116995 () Bool)

(declare-fun b_free!2783 () Bool)

(declare-fun b_next!2783 () Bool)

(assert (=> b!116995 (= b_free!2783 (not b_next!2783))))

(declare-fun tp!10721 () Bool)

(declare-fun b_and!7301 () Bool)

(assert (=> b!116995 (= tp!10721 b_and!7301)))

(declare-fun b!116982 () Bool)

(declare-fun e!76468 () Bool)

(declare-fun e!76478 () Bool)

(declare-fun mapRes!4368 () Bool)

(assert (=> b!116982 (= e!76468 (and e!76478 mapRes!4368))))

(declare-fun condMapEmpty!4367 () Bool)

(declare-datatypes ((V!3389 0))(
  ( (V!3390 (val!1448 Int)) )
))
(declare-datatypes ((array!4623 0))(
  ( (array!4624 (arr!2191 (Array (_ BitVec 32) (_ BitVec 64))) (size!2452 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1060 0))(
  ( (ValueCellFull!1060 (v!3065 V!3389)) (EmptyCell!1060) )
))
(declare-datatypes ((array!4625 0))(
  ( (array!4626 (arr!2192 (Array (_ BitVec 32) ValueCell!1060)) (size!2453 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1028 0))(
  ( (LongMapFixedSize!1029 (defaultEntry!2727 Int) (mask!6949 (_ BitVec 32)) (extraKeys!2516 (_ BitVec 32)) (zeroValue!2594 V!3389) (minValue!2594 V!3389) (_size!563 (_ BitVec 32)) (_keys!4450 array!4623) (_values!2710 array!4625) (_vacant!563 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!826 0))(
  ( (Cell!827 (v!3066 LongMapFixedSize!1028)) )
))
(declare-datatypes ((LongMap!826 0))(
  ( (LongMap!827 (underlying!424 Cell!826)) )
))
(declare-fun thiss!992 () LongMap!826)

(declare-fun mapDefault!4368 () ValueCell!1060)

