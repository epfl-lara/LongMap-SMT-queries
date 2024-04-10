; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8294 () Bool)

(assert start!8294)

(declare-fun b!53941 () Bool)

(declare-fun b_free!1753 () Bool)

(declare-fun b_next!1753 () Bool)

(assert (=> b!53941 (= b_free!1753 (not b_next!1753))))

(declare-fun tp!7360 () Bool)

(declare-fun b_and!3047 () Bool)

(assert (=> b!53941 (= tp!7360 b_and!3047)))

(declare-fun b!53927 () Bool)

(declare-fun b_free!1755 () Bool)

(declare-fun b_next!1755 () Bool)

(assert (=> b!53927 (= b_free!1755 (not b_next!1755))))

(declare-fun tp!7362 () Bool)

(declare-fun b_and!3049 () Bool)

(assert (=> b!53927 (= tp!7362 b_and!3049)))

(declare-fun b!53925 () Bool)

(declare-fun e!35196 () Bool)

(declare-fun e!35193 () Bool)

(assert (=> b!53925 (= e!35196 e!35193)))

(declare-fun b!53926 () Bool)

(declare-fun res!30551 () Bool)

(declare-fun e!35202 () Bool)

(assert (=> b!53926 (=> (not res!30551) (not e!35202))))

(declare-datatypes ((V!2705 0))(
  ( (V!2706 (val!1191 Int)) )
))
(declare-datatypes ((array!3509 0))(
  ( (array!3510 (arr!1677 (Array (_ BitVec 32) (_ BitVec 64))) (size!1906 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!803 0))(
  ( (ValueCellFull!803 (v!2268 V!2705)) (EmptyCell!803) )
))
(declare-datatypes ((array!3511 0))(
  ( (array!3512 (arr!1678 (Array (_ BitVec 32) ValueCell!803)) (size!1907 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!514 0))(
  ( (LongMapFixedSize!515 (defaultEntry!1971 Int) (mask!5812 (_ BitVec 32)) (extraKeys!1862 (_ BitVec 32)) (zeroValue!1889 V!2705) (minValue!1889 V!2705) (_size!306 (_ BitVec 32)) (_keys!3591 array!3509) (_values!1954 array!3511) (_vacant!306 (_ BitVec 32))) )
))
(declare-fun newMap!16 () LongMapFixedSize!514)

(declare-fun valid!195 (LongMapFixedSize!514) Bool)

(assert (=> b!53926 (= res!30551 (valid!195 newMap!16))))

(declare-fun e!35199 () Bool)

(declare-fun e!35195 () Bool)

(declare-fun tp_is_empty!2293 () Bool)

(declare-fun array_inv!1035 (array!3509) Bool)

(declare-fun array_inv!1036 (array!3511) Bool)

(assert (=> b!53927 (= e!35199 (and tp!7362 tp_is_empty!2293 (array_inv!1035 (_keys!3591 newMap!16)) (array_inv!1036 (_values!1954 newMap!16)) e!35195))))

(declare-fun res!30554 () Bool)

(assert (=> start!8294 (=> (not res!30554) (not e!35202))))

(declare-datatypes ((Cell!330 0))(
  ( (Cell!331 (v!2269 LongMapFixedSize!514)) )
))
(declare-datatypes ((LongMap!330 0))(
  ( (LongMap!331 (underlying!176 Cell!330)) )
))
(declare-fun thiss!992 () LongMap!330)

(declare-fun valid!196 (LongMap!330) Bool)

(assert (=> start!8294 (= res!30554 (valid!196 thiss!992))))

(assert (=> start!8294 e!35202))

(declare-fun e!35207 () Bool)

(assert (=> start!8294 e!35207))

(assert (=> start!8294 true))

(assert (=> start!8294 e!35199))

(declare-fun b!53928 () Bool)

(declare-fun e!35205 () Bool)

(declare-fun mapRes!2550 () Bool)

(assert (=> b!53928 (= e!35195 (and e!35205 mapRes!2550))))

(declare-fun condMapEmpty!2550 () Bool)

(declare-fun mapDefault!2549 () ValueCell!803)

