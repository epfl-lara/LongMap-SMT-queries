; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80480 () Bool)

(assert start!80480)

(declare-fun b!945288 () Bool)

(declare-fun b_free!18095 () Bool)

(declare-fun b_next!18095 () Bool)

(assert (=> b!945288 (= b_free!18095 (not b_next!18095))))

(declare-fun tp!62798 () Bool)

(declare-fun b_and!29515 () Bool)

(assert (=> b!945288 (= tp!62798 b_and!29515)))

(declare-fun mapIsEmpty!32734 () Bool)

(declare-fun mapRes!32734 () Bool)

(assert (=> mapIsEmpty!32734 mapRes!32734))

(declare-fun res!634917 () Bool)

(declare-fun e!531663 () Bool)

(assert (=> start!80480 (=> (not res!634917) (not e!531663))))

(declare-datatypes ((V!32435 0))(
  ( (V!32436 (val!10352 Int)) )
))
(declare-datatypes ((ValueCell!9820 0))(
  ( (ValueCellFull!9820 (v!12885 V!32435)) (EmptyCell!9820) )
))
(declare-datatypes ((array!57176 0))(
  ( (array!57177 (arr!27512 (Array (_ BitVec 32) ValueCell!9820)) (size!27979 (_ BitVec 32))) )
))
(declare-datatypes ((array!57178 0))(
  ( (array!57179 (arr!27513 (Array (_ BitVec 32) (_ BitVec 64))) (size!27980 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4790 0))(
  ( (LongMapFixedSize!4791 (defaultEntry!5691 Int) (mask!27356 (_ BitVec 32)) (extraKeys!5423 (_ BitVec 32)) (zeroValue!5527 V!32435) (minValue!5527 V!32435) (_size!2450 (_ BitVec 32)) (_keys!10570 array!57178) (_values!5714 array!57176) (_vacant!2450 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4790)

(declare-fun valid!1831 (LongMapFixedSize!4790) Bool)

(assert (=> start!80480 (= res!634917 (valid!1831 thiss!1141))))

(assert (=> start!80480 e!531663))

(declare-fun e!531658 () Bool)

(assert (=> start!80480 e!531658))

(assert (=> start!80480 true))

(declare-fun b!945283 () Bool)

(declare-fun e!531660 () Bool)

(declare-fun e!531662 () Bool)

(assert (=> b!945283 (= e!531660 (and e!531662 mapRes!32734))))

(declare-fun condMapEmpty!32734 () Bool)

(declare-fun mapDefault!32734 () ValueCell!9820)

