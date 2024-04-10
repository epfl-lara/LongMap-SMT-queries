; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80032 () Bool)

(assert start!80032)

(declare-fun b!940992 () Bool)

(declare-fun b_free!17887 () Bool)

(declare-fun b_next!17887 () Bool)

(assert (=> b!940992 (= b_free!17887 (not b_next!17887))))

(declare-fun tp!62136 () Bool)

(declare-fun b_and!29299 () Bool)

(assert (=> b!940992 (= tp!62136 b_and!29299)))

(declare-fun b!940986 () Bool)

(declare-fun e!528937 () Bool)

(declare-fun e!528935 () Bool)

(declare-fun mapRes!32383 () Bool)

(assert (=> b!940986 (= e!528937 (and e!528935 mapRes!32383))))

(declare-fun condMapEmpty!32383 () Bool)

(declare-datatypes ((V!32159 0))(
  ( (V!32160 (val!10248 Int)) )
))
(declare-datatypes ((ValueCell!9716 0))(
  ( (ValueCellFull!9716 (v!12779 V!32159)) (EmptyCell!9716) )
))
(declare-datatypes ((array!56738 0))(
  ( (array!56739 (arr!27304 (Array (_ BitVec 32) ValueCell!9716)) (size!27765 (_ BitVec 32))) )
))
(declare-datatypes ((array!56740 0))(
  ( (array!56741 (arr!27305 (Array (_ BitVec 32) (_ BitVec 64))) (size!27766 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4582 0))(
  ( (LongMapFixedSize!4583 (defaultEntry!5582 Int) (mask!27135 (_ BitVec 32)) (extraKeys!5314 (_ BitVec 32)) (zeroValue!5418 V!32159) (minValue!5418 V!32159) (_size!2346 (_ BitVec 32)) (_keys!10432 array!56740) (_values!5605 array!56738) (_vacant!2346 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4582)

(declare-fun mapDefault!32383 () ValueCell!9716)

