; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77054 () Bool)

(assert start!77054)

(declare-fun b!899904 () Bool)

(declare-fun b_free!16043 () Bool)

(declare-fun b_next!16043 () Bool)

(assert (=> b!899904 (= b_free!16043 (not b_next!16043))))

(declare-fun tp!56212 () Bool)

(declare-fun b_and!26357 () Bool)

(assert (=> b!899904 (= tp!56212 b_and!26357)))

(declare-fun res!607826 () Bool)

(declare-fun e!503614 () Bool)

(assert (=> start!77054 (=> (not res!607826) (not e!503614))))

(declare-datatypes ((array!52788 0))(
  ( (array!52789 (arr!25367 (Array (_ BitVec 32) (_ BitVec 64))) (size!25825 (_ BitVec 32))) )
))
(declare-datatypes ((V!29459 0))(
  ( (V!29460 (val!9236 Int)) )
))
(declare-datatypes ((ValueCell!8704 0))(
  ( (ValueCellFull!8704 (v!11731 V!29459)) (EmptyCell!8704) )
))
(declare-datatypes ((array!52790 0))(
  ( (array!52791 (arr!25368 (Array (_ BitVec 32) ValueCell!8704)) (size!25826 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4424 0))(
  ( (LongMapFixedSize!4425 (defaultEntry!5440 Int) (mask!26209 (_ BitVec 32)) (extraKeys!5163 (_ BitVec 32)) (zeroValue!5267 V!29459) (minValue!5267 V!29459) (_size!2267 (_ BitVec 32)) (_keys!10235 array!52788) (_values!5454 array!52790) (_vacant!2267 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4424)

(declare-fun valid!1699 (LongMapFixedSize!4424) Bool)

(assert (=> start!77054 (= res!607826 (valid!1699 thiss!1181))))

(assert (=> start!77054 e!503614))

(declare-fun e!503610 () Bool)

(assert (=> start!77054 e!503610))

(assert (=> start!77054 true))

(declare-fun b!899897 () Bool)

(declare-fun e!503612 () Bool)

(assert (=> b!899897 (= e!503612 (or (not (= (size!25826 (_values!5454 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!26209 thiss!1181)))) (not (= (size!25825 (_keys!10235 thiss!1181)) (size!25826 (_values!5454 thiss!1181)))) (bvslt (mask!26209 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!5163 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!5163 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!899898 () Bool)

(declare-fun e!503615 () Bool)

(declare-fun tp_is_empty!18371 () Bool)

(assert (=> b!899898 (= e!503615 tp_is_empty!18371)))

(declare-fun b!899899 () Bool)

(declare-fun e!503607 () Bool)

(declare-fun mapRes!29226 () Bool)

(assert (=> b!899899 (= e!503607 (and e!503615 mapRes!29226))))

(declare-fun condMapEmpty!29226 () Bool)

(declare-fun mapDefault!29226 () ValueCell!8704)

