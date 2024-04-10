; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!8354 () Bool)

(assert start!8354)

(declare-fun b!55709 () Bool)

(declare-fun b_free!1873 () Bool)

(declare-fun b_next!1873 () Bool)

(assert (=> b!55709 (= b_free!1873 (not b_next!1873))))

(declare-fun tp!7719 () Bool)

(declare-fun b_and!3287 () Bool)

(assert (=> b!55709 (= tp!7719 b_and!3287)))

(declare-fun b!55704 () Bool)

(declare-fun b_free!1875 () Bool)

(declare-fun b_next!1875 () Bool)

(assert (=> b!55704 (= b_free!1875 (not b_next!1875))))

(declare-fun tp!7720 () Bool)

(declare-fun b_and!3289 () Bool)

(assert (=> b!55704 (= tp!7720 b_and!3289)))

(declare-fun b!55695 () Bool)

(declare-fun e!36621 () Bool)

(declare-fun e!36620 () Bool)

(declare-fun mapRes!2729 () Bool)

(assert (=> b!55695 (= e!36621 (and e!36620 mapRes!2729))))

(declare-fun condMapEmpty!2729 () Bool)

(declare-datatypes ((V!2785 0))(
  ( (V!2786 (val!1221 Int)) )
))
(declare-datatypes ((array!3629 0))(
  ( (array!3630 (arr!1737 (Array (_ BitVec 32) (_ BitVec 64))) (size!1966 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!833 0))(
  ( (ValueCellFull!833 (v!2328 V!2785)) (EmptyCell!833) )
))
(declare-datatypes ((array!3631 0))(
  ( (array!3632 (arr!1738 (Array (_ BitVec 32) ValueCell!833)) (size!1967 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!574 0))(
  ( (LongMapFixedSize!575 (defaultEntry!2001 Int) (mask!5862 (_ BitVec 32)) (extraKeys!1892 (_ BitVec 32)) (zeroValue!1919 V!2785) (minValue!1919 V!2785) (_size!336 (_ BitVec 32)) (_keys!3621 array!3629) (_values!1984 array!3631) (_vacant!336 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!390 0))(
  ( (Cell!391 (v!2329 LongMapFixedSize!574)) )
))
(declare-datatypes ((LongMap!390 0))(
  ( (LongMap!391 (underlying!206 Cell!390)) )
))
(declare-fun thiss!992 () LongMap!390)

(declare-fun mapDefault!2730 () ValueCell!833)

