; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76332 () Bool)

(assert start!76332)

(declare-fun b!895739 () Bool)

(declare-fun b_free!15919 () Bool)

(declare-fun b_next!15919 () Bool)

(assert (=> b!895739 (= b_free!15919 (not b_next!15919))))

(declare-fun tp!55772 () Bool)

(declare-fun b_and!26211 () Bool)

(assert (=> b!895739 (= tp!55772 b_and!26211)))

(declare-fun b!895733 () Bool)

(declare-fun res!605846 () Bool)

(declare-fun e!500521 () Bool)

(assert (=> b!895733 (=> (not res!605846) (not e!500521))))

(declare-datatypes ((array!52500 0))(
  ( (array!52501 (arr!25243 (Array (_ BitVec 32) (_ BitVec 64))) (size!25693 (_ BitVec 32))) )
))
(declare-datatypes ((V!29295 0))(
  ( (V!29296 (val!9174 Int)) )
))
(declare-datatypes ((ValueCell!8642 0))(
  ( (ValueCellFull!8642 (v!11664 V!29295)) (EmptyCell!8642) )
))
(declare-datatypes ((array!52502 0))(
  ( (array!52503 (arr!25244 (Array (_ BitVec 32) ValueCell!8642)) (size!25694 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4300 0))(
  ( (LongMapFixedSize!4301 (defaultEntry!5362 Int) (mask!25971 (_ BitVec 32)) (extraKeys!5058 (_ BitVec 32)) (zeroValue!5162 V!29295) (minValue!5162 V!29295) (_size!2205 (_ BitVec 32)) (_keys!10081 array!52500) (_values!5349 array!52502) (_vacant!2205 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4300)

(declare-datatypes ((List!17816 0))(
  ( (Nil!17813) (Cons!17812 (h!18949 (_ BitVec 64)) (t!25155 List!17816)) )
))
(declare-fun arrayNoDuplicates!0 (array!52500 (_ BitVec 32) List!17816) Bool)

(assert (=> b!895733 (= res!605846 (arrayNoDuplicates!0 (_keys!10081 thiss!1181) #b00000000000000000000000000000000 Nil!17813))))

(declare-fun mapIsEmpty!28972 () Bool)

(declare-fun mapRes!28972 () Bool)

(assert (=> mapIsEmpty!28972 mapRes!28972))

(declare-fun b!895734 () Bool)

(declare-fun e!500518 () Bool)

(declare-fun e!500520 () Bool)

(assert (=> b!895734 (= e!500518 (and e!500520 mapRes!28972))))

(declare-fun condMapEmpty!28972 () Bool)

(declare-fun mapDefault!28972 () ValueCell!8642)

