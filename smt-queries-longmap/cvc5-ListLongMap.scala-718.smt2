; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16812 () Bool)

(assert start!16812)

(declare-fun b!169456 () Bool)

(declare-fun b_free!4135 () Bool)

(declare-fun b_next!4135 () Bool)

(assert (=> b!169456 (= b_free!4135 (not b_next!4135))))

(declare-fun tp!15009 () Bool)

(declare-fun b_and!10549 () Bool)

(assert (=> b!169456 (= tp!15009 b_and!10549)))

(declare-fun b!169462 () Bool)

(declare-fun b_free!4137 () Bool)

(declare-fun b_next!4137 () Bool)

(assert (=> b!169462 (= b_free!4137 (not b_next!4137))))

(declare-fun tp!15012 () Bool)

(declare-fun b_and!10551 () Bool)

(assert (=> b!169462 (= tp!15012 b_and!10551)))

(declare-fun b!169454 () Bool)

(declare-fun e!111671 () Bool)

(declare-fun e!111678 () Bool)

(assert (=> b!169454 (= e!111671 e!111678)))

(declare-fun res!80602 () Bool)

(assert (=> b!169454 (=> (not res!80602) (not e!111678))))

(declare-datatypes ((SeekEntryResult!524 0))(
  ( (MissingZero!524 (index!4264 (_ BitVec 32))) (Found!524 (index!4265 (_ BitVec 32))) (Intermediate!524 (undefined!1336 Bool) (index!4266 (_ BitVec 32)) (x!18720 (_ BitVec 32))) (Undefined!524) (MissingVacant!524 (index!4267 (_ BitVec 32))) )
))
(declare-fun lt!84918 () SeekEntryResult!524)

(assert (=> b!169454 (= res!80602 (and (not (is-Undefined!524 lt!84918)) (not (is-MissingVacant!524 lt!84918)) (not (is-MissingZero!524 lt!84918)) (not (is-Found!524 lt!84918))))))

(declare-fun key!828 () (_ BitVec 64))

(declare-datatypes ((V!4873 0))(
  ( (V!4874 (val!2004 Int)) )
))
(declare-datatypes ((ValueCell!1616 0))(
  ( (ValueCellFull!1616 (v!3869 V!4873)) (EmptyCell!1616) )
))
(declare-datatypes ((array!6935 0))(
  ( (array!6936 (arr!3303 (Array (_ BitVec 32) (_ BitVec 64))) (size!3591 (_ BitVec 32))) )
))
(declare-datatypes ((array!6937 0))(
  ( (array!6938 (arr!3304 (Array (_ BitVec 32) ValueCell!1616)) (size!3592 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!2140 0))(
  ( (LongMapFixedSize!2141 (defaultEntry!3512 Int) (mask!8297 (_ BitVec 32)) (extraKeys!3253 (_ BitVec 32)) (zeroValue!3355 V!4873) (minValue!3355 V!4873) (_size!1119 (_ BitVec 32)) (_keys!5337 array!6935) (_values!3495 array!6937) (_vacant!1119 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!2140)

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6935 (_ BitVec 32)) SeekEntryResult!524)

(assert (=> b!169454 (= lt!84918 (seekEntryOrOpen!0 key!828 (_keys!5337 thiss!1248) (mask!8297 thiss!1248)))))

(declare-fun b!169455 () Bool)

(declare-fun e!111672 () Bool)

(declare-fun e!111669 () Bool)

(declare-fun mapRes!6626 () Bool)

(assert (=> b!169455 (= e!111672 (and e!111669 mapRes!6626))))

(declare-fun condMapEmpty!6626 () Bool)

(declare-datatypes ((tuple2!3220 0))(
  ( (tuple2!3221 (_1!1621 Bool) (_2!1621 LongMapFixedSize!2140)) )
))
(declare-fun err!75 () tuple2!3220)

(declare-fun mapDefault!6626 () ValueCell!1616)

