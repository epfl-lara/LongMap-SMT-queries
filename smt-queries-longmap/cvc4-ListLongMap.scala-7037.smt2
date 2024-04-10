; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89238 () Bool)

(assert start!89238)

(declare-fun b!1023224 () Bool)

(declare-fun b_free!20279 () Bool)

(declare-fun b_next!20279 () Bool)

(assert (=> b!1023224 (= b_free!20279 (not b_next!20279))))

(declare-fun tp!71872 () Bool)

(declare-fun b_and!32501 () Bool)

(assert (=> b!1023224 (= tp!71872 b_and!32501)))

(declare-fun b!1023221 () Bool)

(declare-fun e!576547 () Bool)

(assert (=> b!1023221 (= e!576547 false)))

(declare-fun lt!450384 () Bool)

(declare-datatypes ((V!36871 0))(
  ( (V!36872 (val!12050 Int)) )
))
(declare-datatypes ((ValueCell!11296 0))(
  ( (ValueCellFull!11296 (v!14619 V!36871)) (EmptyCell!11296) )
))
(declare-datatypes ((array!64042 0))(
  ( (array!64043 (arr!30833 (Array (_ BitVec 32) (_ BitVec 64))) (size!31344 (_ BitVec 32))) )
))
(declare-datatypes ((array!64044 0))(
  ( (array!64045 (arr!30834 (Array (_ BitVec 32) ValueCell!11296)) (size!31345 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5186 0))(
  ( (LongMapFixedSize!5187 (defaultEntry!5945 Int) (mask!29560 (_ BitVec 32)) (extraKeys!5677 (_ BitVec 32)) (zeroValue!5781 V!36871) (minValue!5781 V!36871) (_size!2648 (_ BitVec 32)) (_keys!11090 array!64042) (_values!5968 array!64044) (_vacant!2648 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5186)

(declare-datatypes ((List!21707 0))(
  ( (Nil!21704) (Cons!21703 (h!22901 (_ BitVec 64)) (t!30745 List!21707)) )
))
(declare-fun arrayNoDuplicates!0 (array!64042 (_ BitVec 32) List!21707) Bool)

(assert (=> b!1023221 (= lt!450384 (arrayNoDuplicates!0 (_keys!11090 thiss!1427) #b00000000000000000000000000000000 Nil!21704))))

(declare-fun b!1023222 () Bool)

(declare-fun res!685311 () Bool)

(assert (=> b!1023222 (=> (not res!685311) (not e!576547))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023222 (= res!685311 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!685310 () Bool)

(assert (=> start!89238 (=> (not res!685310) (not e!576547))))

(declare-fun valid!1976 (LongMapFixedSize!5186) Bool)

(assert (=> start!89238 (= res!685310 (valid!1976 thiss!1427))))

(assert (=> start!89238 e!576547))

(declare-fun e!576548 () Bool)

(assert (=> start!89238 e!576548))

(assert (=> start!89238 true))

(declare-fun b!1023223 () Bool)

(declare-fun e!576545 () Bool)

(declare-fun tp_is_empty!23999 () Bool)

(assert (=> b!1023223 (= e!576545 tp_is_empty!23999)))

(declare-fun mapIsEmpty!37416 () Bool)

(declare-fun mapRes!37416 () Bool)

(assert (=> mapIsEmpty!37416 mapRes!37416))

(declare-fun e!576546 () Bool)

(declare-fun array_inv!23891 (array!64042) Bool)

(declare-fun array_inv!23892 (array!64044) Bool)

(assert (=> b!1023224 (= e!576548 (and tp!71872 tp_is_empty!23999 (array_inv!23891 (_keys!11090 thiss!1427)) (array_inv!23892 (_values!5968 thiss!1427)) e!576546))))

(declare-fun b!1023225 () Bool)

(declare-fun e!576544 () Bool)

(assert (=> b!1023225 (= e!576544 tp_is_empty!23999)))

(declare-fun b!1023226 () Bool)

(assert (=> b!1023226 (= e!576546 (and e!576544 mapRes!37416))))

(declare-fun condMapEmpty!37416 () Bool)

(declare-fun mapDefault!37416 () ValueCell!11296)

