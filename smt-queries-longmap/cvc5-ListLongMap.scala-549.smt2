; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!14580 () Bool)

(assert start!14580)

(declare-fun b!137796 () Bool)

(declare-fun b_free!2977 () Bool)

(declare-fun b_next!2977 () Bool)

(assert (=> b!137796 (= b_free!2977 (not b_next!2977))))

(declare-fun tp!11392 () Bool)

(declare-fun b_and!8563 () Bool)

(assert (=> b!137796 (= tp!11392 b_and!8563)))

(declare-fun b!137791 () Bool)

(declare-fun b_free!2979 () Bool)

(declare-fun b_next!2979 () Bool)

(assert (=> b!137791 (= b_free!2979 (not b_next!2979))))

(declare-fun tp!11394 () Bool)

(declare-fun b_and!8565 () Bool)

(assert (=> b!137791 (= tp!11394 b_and!8565)))

(declare-fun res!66027 () Bool)

(declare-fun e!89790 () Bool)

(assert (=> start!14580 (=> (not res!66027) (not e!89790))))

(declare-datatypes ((V!3521 0))(
  ( (V!3522 (val!1497 Int)) )
))
(declare-datatypes ((array!4841 0))(
  ( (array!4842 (arr!2289 (Array (_ BitVec 32) (_ BitVec 64))) (size!2560 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!1109 0))(
  ( (ValueCellFull!1109 (v!3246 V!3521)) (EmptyCell!1109) )
))
(declare-datatypes ((array!4843 0))(
  ( (array!4844 (arr!2290 (Array (_ BitVec 32) ValueCell!1109)) (size!2561 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!1126 0))(
  ( (LongMapFixedSize!1127 (defaultEntry!2915 Int) (mask!7243 (_ BitVec 32)) (extraKeys!2672 (_ BitVec 32)) (zeroValue!2766 V!3521) (minValue!2766 V!3521) (_size!612 (_ BitVec 32)) (_keys!4672 array!4841) (_values!2898 array!4843) (_vacant!612 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!914 0))(
  ( (Cell!915 (v!3247 LongMapFixedSize!1126)) )
))
(declare-datatypes ((LongMap!914 0))(
  ( (LongMap!915 (underlying!468 Cell!914)) )
))
(declare-fun thiss!992 () LongMap!914)

(declare-fun valid!543 (LongMap!914) Bool)

(assert (=> start!14580 (= res!66027 (valid!543 thiss!992))))

(assert (=> start!14580 e!89790))

(declare-fun e!89787 () Bool)

(assert (=> start!14580 e!89787))

(assert (=> start!14580 true))

(declare-fun e!89788 () Bool)

(assert (=> start!14580 e!89788))

(declare-fun b!137785 () Bool)

(declare-fun e!89782 () Bool)

(declare-fun e!89784 () Bool)

(declare-fun mapRes!4746 () Bool)

(assert (=> b!137785 (= e!89782 (and e!89784 mapRes!4746))))

(declare-fun condMapEmpty!4746 () Bool)

(declare-fun newMap!16 () LongMapFixedSize!1126)

(declare-fun mapDefault!4745 () ValueCell!1109)

