; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80234 () Bool)

(assert start!80234)

(declare-fun b!942455 () Bool)

(declare-fun b_free!17947 () Bool)

(declare-fun b_next!17947 () Bool)

(assert (=> b!942455 (= b_free!17947 (not b_next!17947))))

(declare-fun tp!62344 () Bool)

(declare-fun b_and!29359 () Bool)

(assert (=> b!942455 (= tp!62344 b_and!29359)))

(declare-fun mapIsEmpty!32501 () Bool)

(declare-fun mapRes!32501 () Bool)

(assert (=> mapIsEmpty!32501 mapRes!32501))

(declare-fun b!942447 () Bool)

(declare-fun e!529895 () Bool)

(declare-datatypes ((V!32239 0))(
  ( (V!32240 (val!10278 Int)) )
))
(declare-datatypes ((ValueCell!9746 0))(
  ( (ValueCellFull!9746 (v!12809 V!32239)) (EmptyCell!9746) )
))
(declare-datatypes ((array!56874 0))(
  ( (array!56875 (arr!27364 (Array (_ BitVec 32) ValueCell!9746)) (size!27829 (_ BitVec 32))) )
))
(declare-datatypes ((array!56876 0))(
  ( (array!56877 (arr!27365 (Array (_ BitVec 32) (_ BitVec 64))) (size!27830 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4642 0))(
  ( (LongMapFixedSize!4643 (defaultEntry!5612 Int) (mask!27219 (_ BitVec 32)) (extraKeys!5344 (_ BitVec 32)) (zeroValue!5448 V!32239) (minValue!5448 V!32239) (_size!2376 (_ BitVec 32)) (_keys!10484 array!56876) (_values!5635 array!56874) (_vacant!2376 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4642)

(assert (=> b!942447 (= e!529895 (bvsgt #b00000000000000000000000000000000 (size!27830 (_keys!10484 thiss!1141))))))

(declare-fun b!942448 () Bool)

(declare-fun res!633309 () Bool)

(assert (=> b!942448 (=> (not res!633309) (not e!529895))))

(assert (=> b!942448 (= res!633309 (and (= (size!27829 (_values!5635 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27219 thiss!1141))) (= (size!27830 (_keys!10484 thiss!1141)) (size!27829 (_values!5635 thiss!1141))) (bvsge (mask!27219 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5344 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5344 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!942449 () Bool)

(declare-fun e!529898 () Bool)

(declare-fun tp_is_empty!20455 () Bool)

(assert (=> b!942449 (= e!529898 tp_is_empty!20455)))

(declare-fun b!942450 () Bool)

(declare-fun res!633308 () Bool)

(assert (=> b!942450 (=> (not res!633308) (not e!529895))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56876 (_ BitVec 32)) Bool)

(assert (=> b!942450 (= res!633308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10484 thiss!1141) (mask!27219 thiss!1141)))))

(declare-fun b!942451 () Bool)

(declare-fun e!529896 () Bool)

(assert (=> b!942451 (= e!529896 tp_is_empty!20455)))

(declare-fun b!942452 () Bool)

(declare-fun res!633310 () Bool)

(assert (=> b!942452 (=> (not res!633310) (not e!529895))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!942452 (= res!633310 (validMask!0 (mask!27219 thiss!1141)))))

(declare-fun b!942453 () Bool)

(declare-fun res!633314 () Bool)

(assert (=> b!942453 (=> (not res!633314) (not e!529895))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!942453 (= res!633314 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!633312 () Bool)

(assert (=> start!80234 (=> (not res!633312) (not e!529895))))

(declare-fun valid!1776 (LongMapFixedSize!4642) Bool)

(assert (=> start!80234 (= res!633312 (valid!1776 thiss!1141))))

(assert (=> start!80234 e!529895))

(declare-fun e!529897 () Bool)

(assert (=> start!80234 e!529897))

(assert (=> start!80234 true))

(declare-fun b!942446 () Bool)

(declare-fun res!633313 () Bool)

(assert (=> b!942446 (=> (not res!633313) (not e!529895))))

(declare-datatypes ((List!19214 0))(
  ( (Nil!19211) (Cons!19210 (h!20360 (_ BitVec 64)) (t!27529 List!19214)) )
))
(declare-fun arrayNoDuplicates!0 (array!56876 (_ BitVec 32) List!19214) Bool)

(assert (=> b!942446 (= res!633313 (arrayNoDuplicates!0 (_keys!10484 thiss!1141) #b00000000000000000000000000000000 Nil!19211))))

(declare-fun b!942454 () Bool)

(declare-fun e!529894 () Bool)

(assert (=> b!942454 (= e!529894 (and e!529896 mapRes!32501))))

(declare-fun condMapEmpty!32501 () Bool)

(declare-fun mapDefault!32501 () ValueCell!9746)

