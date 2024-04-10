; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!16590 () Bool)

(assert start!16590)

(declare-fun b!165409 () Bool)

(declare-fun b_free!3895 () Bool)

(declare-fun b_next!3895 () Bool)

(assert (=> b!165409 (= b_free!3895 (not b_next!3895))))

(declare-fun tp!14286 () Bool)

(declare-fun b_and!10309 () Bool)

(assert (=> b!165409 (= tp!14286 b_and!10309)))

(declare-fun b!165404 () Bool)

(declare-fun res!78471 () Bool)

(declare-fun e!108505 () Bool)

(assert (=> b!165404 (=> (not res!78471) (not e!108505))))

(declare-fun key!828 () (_ BitVec 64))

(assert (=> b!165404 (= res!78471 (not (= key!828 (bvneg key!828))))))

(declare-fun b!165405 () Bool)

(declare-fun e!108503 () Bool)

(declare-fun tp_is_empty!3697 () Bool)

(assert (=> b!165405 (= e!108503 tp_is_empty!3697)))

(declare-fun b!165406 () Bool)

(declare-fun e!108504 () Bool)

(assert (=> b!165406 (= e!108504 tp_is_empty!3697)))

(declare-fun mapIsEmpty!6264 () Bool)

(declare-fun mapRes!6264 () Bool)

(assert (=> mapIsEmpty!6264 mapRes!6264))

(declare-fun b!165407 () Bool)

(declare-fun res!78473 () Bool)

(declare-fun e!108500 () Bool)

(assert (=> b!165407 (=> (not res!78473) (not e!108500))))

(declare-datatypes ((V!4577 0))(
  ( (V!4578 (val!1893 Int)) )
))
(declare-datatypes ((ValueCell!1505 0))(
  ( (ValueCellFull!1505 (v!3758 V!4577)) (EmptyCell!1505) )
))
(declare-datatypes ((array!6491 0))(
  ( (array!6492 (arr!3081 (Array (_ BitVec 32) (_ BitVec 64))) (size!3369 (_ BitVec 32))) )
))
(declare-datatypes ((array!6493 0))(
  ( (array!6494 (arr!3082 (Array (_ BitVec 32) ValueCell!1505)) (size!3370 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1918 0))(
  ( (LongMapFixedSize!1919 (defaultEntry!3401 Int) (mask!8112 (_ BitVec 32)) (extraKeys!3142 (_ BitVec 32)) (zeroValue!3244 V!4577) (minValue!3244 V!4577) (_size!1008 (_ BitVec 32)) (_keys!5226 array!6491) (_values!3384 array!6493) (_vacant!1008 (_ BitVec 32))) )
))
(declare-fun thiss!1248 () LongMapFixedSize!1918)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!165407 (= res!78473 (validMask!0 (mask!8112 thiss!1248)))))

(declare-fun b!165408 () Bool)

(declare-fun res!78472 () Bool)

(assert (=> b!165408 (=> (not res!78472) (not e!108500))))

(assert (=> b!165408 (= res!78472 (and (= (size!3370 (_values!3384 thiss!1248)) (bvadd #b00000000000000000000000000000001 (mask!8112 thiss!1248))) (= (size!3369 (_keys!5226 thiss!1248)) (size!3370 (_values!3384 thiss!1248))) (bvsge (mask!8112 thiss!1248) #b00000000000000000000000000000000) (bvsge (extraKeys!3142 thiss!1248) #b00000000000000000000000000000000) (bvsle (extraKeys!3142 thiss!1248) #b00000000000000000000000000000011)))))

(declare-fun e!108506 () Bool)

(declare-fun e!108502 () Bool)

(declare-fun array_inv!1979 (array!6491) Bool)

(declare-fun array_inv!1980 (array!6493) Bool)

(assert (=> b!165409 (= e!108506 (and tp!14286 tp_is_empty!3697 (array_inv!1979 (_keys!5226 thiss!1248)) (array_inv!1980 (_values!3384 thiss!1248)) e!108502))))

(declare-fun res!78470 () Bool)

(assert (=> start!16590 (=> (not res!78470) (not e!108505))))

(declare-fun valid!849 (LongMapFixedSize!1918) Bool)

(assert (=> start!16590 (= res!78470 (valid!849 thiss!1248))))

(assert (=> start!16590 e!108505))

(assert (=> start!16590 e!108506))

(assert (=> start!16590 true))

(declare-fun b!165410 () Bool)

(assert (=> b!165410 (= e!108500 false)))

(declare-fun lt!83064 () Bool)

(declare-datatypes ((List!2051 0))(
  ( (Nil!2048) (Cons!2047 (h!2664 (_ BitVec 64)) (t!6853 List!2051)) )
))
(declare-fun arrayNoDuplicates!0 (array!6491 (_ BitVec 32) List!2051) Bool)

(assert (=> b!165410 (= lt!83064 (arrayNoDuplicates!0 (_keys!5226 thiss!1248) #b00000000000000000000000000000000 Nil!2048))))

(declare-fun b!165411 () Bool)

(declare-fun res!78469 () Bool)

(assert (=> b!165411 (=> (not res!78469) (not e!108500))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!6491 (_ BitVec 32)) Bool)

(assert (=> b!165411 (= res!78469 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!5226 thiss!1248) (mask!8112 thiss!1248)))))

(declare-fun b!165412 () Bool)

(declare-fun res!78468 () Bool)

(assert (=> b!165412 (=> (not res!78468) (not e!108500))))

(declare-datatypes ((tuple2!3068 0))(
  ( (tuple2!3069 (_1!1545 (_ BitVec 64)) (_2!1545 V!4577)) )
))
(declare-datatypes ((List!2052 0))(
  ( (Nil!2049) (Cons!2048 (h!2665 tuple2!3068) (t!6854 List!2052)) )
))
(declare-datatypes ((ListLongMap!2023 0))(
  ( (ListLongMap!2024 (toList!1027 List!2052)) )
))
(declare-fun contains!1069 (ListLongMap!2023 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!685 (array!6491 array!6493 (_ BitVec 32) (_ BitVec 32) V!4577 V!4577 (_ BitVec 32) Int) ListLongMap!2023)

(assert (=> b!165412 (= res!78468 (not (contains!1069 (getCurrentListMap!685 (_keys!5226 thiss!1248) (_values!3384 thiss!1248) (mask!8112 thiss!1248) (extraKeys!3142 thiss!1248) (zeroValue!3244 thiss!1248) (minValue!3244 thiss!1248) #b00000000000000000000000000000000 (defaultEntry!3401 thiss!1248)) key!828)))))

(declare-fun b!165413 () Bool)

(assert (=> b!165413 (= e!108502 (and e!108503 mapRes!6264))))

(declare-fun condMapEmpty!6264 () Bool)

(declare-fun mapDefault!6264 () ValueCell!1505)

