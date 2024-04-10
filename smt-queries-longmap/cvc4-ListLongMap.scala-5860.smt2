; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75694 () Bool)

(assert start!75694)

(declare-fun b!889985 () Bool)

(declare-fun b_free!15665 () Bool)

(declare-fun b_next!15665 () Bool)

(assert (=> b!889985 (= b_free!15665 (not b_next!15665))))

(declare-fun tp!54963 () Bool)

(declare-fun b_and!25905 () Bool)

(assert (=> b!889985 (= tp!54963 b_and!25905)))

(declare-fun b!889984 () Bool)

(declare-fun res!603087 () Bool)

(declare-fun e!496212 () Bool)

(assert (=> b!889984 (=> (not res!603087) (not e!496212))))

(declare-datatypes ((array!51966 0))(
  ( (array!51967 (arr!24989 (Array (_ BitVec 32) (_ BitVec 64))) (size!25433 (_ BitVec 32))) )
))
(declare-datatypes ((V!28955 0))(
  ( (V!28956 (val!9047 Int)) )
))
(declare-datatypes ((ValueCell!8515 0))(
  ( (ValueCellFull!8515 (v!11525 V!28955)) (EmptyCell!8515) )
))
(declare-datatypes ((array!51968 0))(
  ( (array!51969 (arr!24990 (Array (_ BitVec 32) ValueCell!8515)) (size!25434 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4046 0))(
  ( (LongMapFixedSize!4047 (defaultEntry!5220 Int) (mask!25681 (_ BitVec 32)) (extraKeys!4914 (_ BitVec 32)) (zeroValue!5018 V!28955) (minValue!5018 V!28955) (_size!2078 (_ BitVec 32)) (_keys!9903 array!51966) (_values!5205 array!51968) (_vacant!2078 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4046)

(assert (=> b!889984 (= res!603087 (and (= (size!25434 (_values!5205 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25681 thiss!1181))) (= (size!25433 (_keys!9903 thiss!1181)) (size!25434 (_values!5205 thiss!1181))) (bvsge (mask!25681 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4914 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4914 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun e!496214 () Bool)

(declare-fun tp_is_empty!17993 () Bool)

(declare-fun e!496215 () Bool)

(declare-fun array_inv!19652 (array!51966) Bool)

(declare-fun array_inv!19653 (array!51968) Bool)

(assert (=> b!889985 (= e!496215 (and tp!54963 tp_is_empty!17993 (array_inv!19652 (_keys!9903 thiss!1181)) (array_inv!19653 (_values!5205 thiss!1181)) e!496214))))

(declare-fun b!889986 () Bool)

(assert (=> b!889986 (= e!496212 false)))

(declare-fun lt!402154 () Bool)

(declare-datatypes ((List!17715 0))(
  ( (Nil!17712) (Cons!17711 (h!18842 (_ BitVec 64)) (t!25014 List!17715)) )
))
(declare-fun arrayNoDuplicates!0 (array!51966 (_ BitVec 32) List!17715) Bool)

(assert (=> b!889986 (= lt!402154 (arrayNoDuplicates!0 (_keys!9903 thiss!1181) #b00000000000000000000000000000000 Nil!17712))))

(declare-fun res!603086 () Bool)

(declare-fun e!496213 () Bool)

(assert (=> start!75694 (=> (not res!603086) (not e!496213))))

(declare-fun valid!1571 (LongMapFixedSize!4046) Bool)

(assert (=> start!75694 (= res!603086 (valid!1571 thiss!1181))))

(assert (=> start!75694 e!496213))

(assert (=> start!75694 e!496215))

(assert (=> start!75694 true))

(declare-fun b!889987 () Bool)

(declare-fun e!496209 () Bool)

(declare-fun mapRes!28544 () Bool)

(assert (=> b!889987 (= e!496214 (and e!496209 mapRes!28544))))

(declare-fun condMapEmpty!28544 () Bool)

(declare-fun mapDefault!28544 () ValueCell!8515)

