; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!107390 () Bool)

(assert start!107390)

(declare-fun b!1272469 () Bool)

(declare-fun b_free!27667 () Bool)

(declare-fun b_next!27667 () Bool)

(assert (=> b!1272469 (= b_free!27667 (not b_next!27667))))

(declare-fun tp!97517 () Bool)

(declare-fun b_and!45723 () Bool)

(assert (=> b!1272469 (= tp!97517 b_and!45723)))

(declare-fun b!1272464 () Bool)

(declare-fun res!846411 () Bool)

(declare-fun e!725786 () Bool)

(assert (=> b!1272464 (=> (not res!846411) (not e!725786))))

(declare-datatypes ((V!49243 0))(
  ( (V!49244 (val!16593 Int)) )
))
(declare-datatypes ((ValueCell!15665 0))(
  ( (ValueCellFull!15665 (v!19230 V!49243)) (EmptyCell!15665) )
))
(declare-datatypes ((array!83328 0))(
  ( (array!83329 (arr!40198 (Array (_ BitVec 32) ValueCell!15665)) (size!40735 (_ BitVec 32))) )
))
(declare-datatypes ((array!83330 0))(
  ( (array!83331 (arr!40199 (Array (_ BitVec 32) (_ BitVec 64))) (size!40736 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!6094 0))(
  ( (LongMapFixedSize!6095 (defaultEntry!6693 Int) (mask!34441 (_ BitVec 32)) (extraKeys!6372 (_ BitVec 32)) (zeroValue!6478 V!49243) (minValue!6478 V!49243) (_size!3102 (_ BitVec 32)) (_keys!12100 array!83330) (_values!6716 array!83328) (_vacant!3102 (_ BitVec 32))) )
))
(declare-fun thiss!1559 () LongMapFixedSize!6094)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1272464 (= res!846411 (validMask!0 (mask!34441 thiss!1559)))))

(declare-fun b!1272465 () Bool)

(declare-fun e!725788 () Bool)

(declare-fun e!725789 () Bool)

(declare-fun mapRes!51146 () Bool)

(assert (=> b!1272465 (= e!725788 (and e!725789 mapRes!51146))))

(declare-fun condMapEmpty!51146 () Bool)

(declare-fun mapDefault!51146 () ValueCell!15665)

