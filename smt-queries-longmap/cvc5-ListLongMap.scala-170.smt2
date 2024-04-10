; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!3256 () Bool)

(assert start!3256)

(declare-fun b!19917 () Bool)

(declare-fun b_free!697 () Bool)

(declare-fun b_next!697 () Bool)

(assert (=> b!19917 (= b_free!697 (not b_next!697))))

(declare-fun tp!3312 () Bool)

(declare-fun b_and!1365 () Bool)

(assert (=> b!19917 (= tp!3312 b_and!1365)))

(declare-fun b!19911 () Bool)

(declare-fun e!12936 () Bool)

(declare-fun e!12944 () Bool)

(assert (=> b!19911 (= e!12936 e!12944)))

(declare-fun res!13339 () Bool)

(assert (=> b!19911 (=> (not res!13339) (not e!12944))))

(declare-datatypes ((V!1107 0))(
  ( (V!1108 (val!507 Int)) )
))
(declare-datatypes ((ValueCell!281 0))(
  ( (ValueCellFull!281 (v!1531 V!1107)) (EmptyCell!281) )
))
(declare-datatypes ((array!1143 0))(
  ( (array!1144 (arr!545 (Array (_ BitVec 32) ValueCell!281)) (size!638 (_ BitVec 32))) )
))
(declare-datatypes ((array!1145 0))(
  ( (array!1146 (arr!546 (Array (_ BitVec 32) (_ BitVec 64))) (size!639 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!148 0))(
  ( (LongMapFixedSize!149 (defaultEntry!1695 Int) (mask!4653 (_ BitVec 32)) (extraKeys!1603 (_ BitVec 32)) (zeroValue!1627 V!1107) (minValue!1627 V!1107) (_size!110 (_ BitVec 32)) (_keys!3121 array!1145) (_values!1689 array!1143) (_vacant!110 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!148 0))(
  ( (Cell!149 (v!1532 LongMapFixedSize!148)) )
))
(declare-datatypes ((LongMap!148 0))(
  ( (LongMap!149 (underlying!85 Cell!148)) )
))
(declare-fun thiss!938 () LongMap!148)

(assert (=> b!19911 (= res!13339 (and (= (bvand (extraKeys!1603 (v!1532 (underlying!85 thiss!938))) #b00000000000000000000000000000010) #b00000000000000000000000000000000) (not (= (bvand (extraKeys!1603 (v!1532 (underlying!85 thiss!938))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun lt!5682 () LongMapFixedSize!148)

(declare-fun getNewLongMapFixedSize!14 ((_ BitVec 32) Int) LongMapFixedSize!148)

(declare-fun computeNewMask!10 (LongMap!148 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!19911 (= lt!5682 (getNewLongMapFixedSize!14 (computeNewMask!10 thiss!938 (mask!4653 (v!1532 (underlying!85 thiss!938))) (_vacant!110 (v!1532 (underlying!85 thiss!938))) (_size!110 (v!1532 (underlying!85 thiss!938)))) (defaultEntry!1695 (v!1532 (underlying!85 thiss!938)))))))

(declare-fun b!19912 () Bool)

(declare-fun e!12940 () Bool)

(declare-fun tp_is_empty!961 () Bool)

(assert (=> b!19912 (= e!12940 tp_is_empty!961)))

(declare-fun mapIsEmpty!907 () Bool)

(declare-fun mapRes!907 () Bool)

(assert (=> mapIsEmpty!907 mapRes!907))

(declare-fun b!19913 () Bool)

(declare-fun e!12943 () Bool)

(declare-fun e!12942 () Bool)

(assert (=> b!19913 (= e!12943 e!12942)))

(declare-fun b!19914 () Bool)

(declare-fun e!12937 () Bool)

(assert (=> b!19914 (= e!12937 (and e!12940 mapRes!907))))

(declare-fun condMapEmpty!907 () Bool)

(declare-fun mapDefault!907 () ValueCell!281)

