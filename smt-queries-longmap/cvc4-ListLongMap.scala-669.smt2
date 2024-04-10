; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16522 () Bool)

(assert start!16522)

(declare-fun b!164285 () Bool)

(declare-fun b_free!3827 () Bool)

(declare-fun b_next!3827 () Bool)

(assert (=> b!164285 (= b_free!3827 (not b_next!3827))))

(declare-fun tp!14081 () Bool)

(declare-fun b_and!10241 () Bool)

(assert (=> b!164285 (= tp!14081 b_and!10241)))

(declare-fun b!164282 () Bool)

(declare-fun res!77759 () Bool)

(declare-fun e!107786 () Bool)

(assert (=> b!164282 (=> (not res!77759) (not e!107786))))

(declare-datatypes ((V!4485 0))(
  ( (V!4486 (val!1859 Int)) )
))
(declare-datatypes ((ValueCell!1471 0))(
  ( (ValueCellFull!1471 (v!3724 V!4485)) (EmptyCell!1471) )
))
(declare-datatypes ((array!6355 0))(
  ( (array!6356 (arr!3013 (Array (_ BitVec 32) (_ BitVec 64))) (size!3301 (_ BitVec 32))) )
))
(declare-datatypes ((array!6357 0))(
  ( (array!6358 (arr!3014 (Array (_ BitVec 32) ValueCell!1471)) (size!3302 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1850 0))(
  ( (LongMapFixedSize!1851 (defaultEntry!3367 Int) (mask!8054 (_ BitVec 32)) (extraKeys!3108 (_ BitVec 32)) (zeroValue!3210 V!4485) (minValue!3210 V!4485) (_size!974 (_ BitVec 32)) (_keys!5192 array!6355) (_values!3350 array!6357) (_vacant!974 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1850)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!164282 (= res!77759 (validMask!0 (mask!8054 thiss!1248)))))

(declare-fun b!164283 () Bool)

(declare-fun res!77758 () Bool)

(assert (=> b!164283 (=> (not res!77758) (not e!107786))))

(assert (=> b!164283 (= res!77758 (and (= (size!3302 (_values!3350 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8054 thiss!1248))) (= (size!3301 (_keys!5192 thiss!1248)) (size!3302 (_values!3350 thiss!1248))) (bvsge (mask!8054 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3108 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3108 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun b!164284 () Bool)

(assert (=> b!164284 (= e!107786 false)))

(declare-fun lt!82860 () Bool)

(declare-datatypes ((List!2000 0))(
  ( (Nil!1997) (Cons!1996 (h!2613 (_ BitVec 64)) (t!6802 List!2000)) )
))
(declare-fun arrayNoDuplicates!0 (array!6355 (_ BitVec 32) List!2000) Bool)

(assert (=> b!164284 (= lt!82860 (arrayNoDuplicates!0 (_keys!5192 thiss!1248) #b00000000000000000000000000000000 Nil!1997))))

(declare-fun mapIsEmpty!6162 () Bool)

(declare-fun mapRes!6162 () Bool)

(assert (=> mapIsEmpty!6162 mapRes!6162))

(declare-fun e!107789 () Bool)

(declare-fun e!107787 () Bool)

(declare-fun tp_is_empty!3629 () Bool)

(declare-fun array_inv!1929 (array!6355) Bool)

(declare-fun array_inv!1930 (array!6357) Bool)

(assert (=> b!164285 (= e!107787 (and tp!14081 tp_is_empty!3629 (array_inv!1929 (_keys!5192 thiss!1248)) (array_inv!1930 (_values!3350 thiss!1248)) e!107789))))

(declare-fun b!164286 () Bool)

(declare-fun e!107792 () Bool)

(assert (=> b!164286 (= e!107792 e!107786)))

(declare-fun res!77756 () Bool)

(assert (=> b!164286 (=> (not res!77756) (not e!107786))))

(declare-datatypes ((SeekEntryResult!412 0))(
  ( (MissingZero!412 (index!3816 (_ BitVec 32))) (Found!412 (index!3817 (_ BitVec 32))) (Intermediate!412 (undefined!1224 Bool) (index!3818 (_ BitVec 32)) (x!18216 (_ BitVec 32))) (Undefined!412) (MissingVacant!412 (index!3819 (_ BitVec 32))) )
))
(declare-fun lt!82861 () SeekEntryResult!412)

(assert (=> b!164286 (= res!77756 (and (not (is-Undefined!412 lt!82861)) (not (is-MissingVacant!412 lt!82861)) (not (is-MissingZero!412 lt!82861)) (is-Found!412 lt!82861)))))

(declare-fun key!828 () (_ BitVec 64))

(declare-fun seekEntryOrOpen!0 ((_ BitVec 64) array!6355 (_ BitVec 32)) SeekEntryResult!412)

(assert (=> b!164286 (= lt!82861 (seekEntryOrOpen!0 key!828 (_keys!5192 thiss!1248) (mask!8054 thiss!1248)))))

(declare-fun b!164287 () Bool)

(declare-fun e!107791 () Bool)

(assert (=> b!164287 (= e!107789 (and e!107791 mapRes!6162))))

(declare-fun condMapEmpty!6162 () Bool)

(declare-fun mapDefault!6162 () ValueCell!1471)

