; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75730 () Bool)

(assert start!75730)

(declare-fun b!890438 () Bool)

(declare-fun b_free!15701 () Bool)

(declare-fun b_next!15701 () Bool)

(assert (=> b!890438 (= b_free!15701 (not b_next!15701))))

(declare-fun tp!55072 () Bool)

(declare-fun b_and!25941 () Bool)

(assert (=> b!890438 (= tp!55072 b_and!25941)))

(declare-fun b!890432 () Bool)

(declare-fun res!603323 () Bool)

(declare-fun e!496622 () Bool)

(assert (=> b!890432 (=> res!603323 e!496622)))

(declare-datatypes ((array!52038 0))(
  ( (array!52039 (arr!25025 (Array (_ BitVec 32) (_ BitVec 64))) (size!25469 (_ BitVec 32))) )
))
(declare-datatypes ((V!29003 0))(
  ( (V!29004 (val!9065 Int)) )
))
(declare-datatypes ((ValueCell!8533 0))(
  ( (ValueCellFull!8533 (v!11543 V!29003)) (EmptyCell!8533) )
))
(declare-datatypes ((array!52040 0))(
  ( (array!52041 (arr!25026 (Array (_ BitVec 32) ValueCell!8533)) (size!25470 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4082 0))(
  ( (LongMapFixedSize!4083 (defaultEntry!5238 Int) (mask!25711 (_ BitVec 32)) (extraKeys!4932 (_ BitVec 32)) (zeroValue!5036 V!29003) (minValue!5036 V!29003) (_size!2096 (_ BitVec 32)) (_keys!9921 array!52038) (_values!5223 array!52040) (_vacant!2096 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4082)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52038 (_ BitVec 32)) Bool)

(assert (=> b!890432 (= res!603323 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9921 thiss!1181) (mask!25711 thiss!1181))))))

(declare-fun b!890433 () Bool)

(declare-fun res!603317 () Bool)

(declare-fun e!496626 () Bool)

(assert (=> b!890433 (=> (not res!603317) (not e!496626))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890433 (= res!603317 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890434 () Bool)

(declare-fun e!496625 () Bool)

(declare-fun e!496623 () Bool)

(declare-fun mapRes!28598 () Bool)

(assert (=> b!890434 (= e!496625 (and e!496623 mapRes!28598))))

(declare-fun condMapEmpty!28598 () Bool)

(declare-fun mapDefault!28598 () ValueCell!8533)

