; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89220 () Bool)

(assert start!89220)

(declare-fun b!1022978 () Bool)

(declare-fun b_free!20261 () Bool)

(declare-fun b_next!20261 () Bool)

(assert (=> b!1022978 (= b_free!20261 (not b_next!20261))))

(declare-fun tp!71817 () Bool)

(declare-fun b_and!32483 () Bool)

(assert (=> b!1022978 (= tp!71817 b_and!32483)))

(declare-fun mapNonEmpty!37389 () Bool)

(declare-fun mapRes!37389 () Bool)

(declare-fun tp!71818 () Bool)

(declare-fun e!576384 () Bool)

(assert (=> mapNonEmpty!37389 (= mapRes!37389 (and tp!71818 e!576384))))

(declare-datatypes ((V!36847 0))(
  ( (V!36848 (val!12041 Int)) )
))
(declare-datatypes ((ValueCell!11287 0))(
  ( (ValueCellFull!11287 (v!14610 V!36847)) (EmptyCell!11287) )
))
(declare-fun mapRest!37389 () (Array (_ BitVec 32) ValueCell!11287))

(declare-fun mapValue!37389 () ValueCell!11287)

(declare-fun mapKey!37389 () (_ BitVec 32))

(declare-datatypes ((array!64006 0))(
  ( (array!64007 (arr!30815 (Array (_ BitVec 32) (_ BitVec 64))) (size!31326 (_ BitVec 32))) )
))
(declare-datatypes ((array!64008 0))(
  ( (array!64009 (arr!30816 (Array (_ BitVec 32) ValueCell!11287)) (size!31327 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5168 0))(
  ( (LongMapFixedSize!5169 (defaultEntry!5936 Int) (mask!29545 (_ BitVec 32)) (extraKeys!5668 (_ BitVec 32)) (zeroValue!5772 V!36847) (minValue!5772 V!36847) (_size!2639 (_ BitVec 32)) (_keys!11081 array!64006) (_values!5959 array!64008) (_vacant!2639 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5168)

(assert (=> mapNonEmpty!37389 (= (arr!30816 (_values!5959 thiss!1427)) (store mapRest!37389 mapKey!37389 mapValue!37389))))

(declare-fun e!576386 () Bool)

(declare-fun tp_is_empty!23981 () Bool)

(declare-fun e!576385 () Bool)

(declare-fun array_inv!23877 (array!64006) Bool)

(declare-fun array_inv!23878 (array!64008) Bool)

(assert (=> b!1022978 (= e!576385 (and tp!71817 tp_is_empty!23981 (array_inv!23877 (_keys!11081 thiss!1427)) (array_inv!23878 (_values!5959 thiss!1427)) e!576386))))

(declare-fun b!1022979 () Bool)

(declare-fun res!685177 () Bool)

(declare-fun e!576383 () Bool)

(assert (=> b!1022979 (=> (not res!685177) (not e!576383))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1022979 (= res!685177 (validMask!0 (mask!29545 thiss!1427)))))

(declare-fun b!1022980 () Bool)

(assert (=> b!1022980 (= e!576383 false)))

(declare-fun lt!450357 () Bool)

(declare-datatypes ((List!21700 0))(
  ( (Nil!21697) (Cons!21696 (h!22894 (_ BitVec 64)) (t!30738 List!21700)) )
))
(declare-fun arrayNoDuplicates!0 (array!64006 (_ BitVec 32) List!21700) Bool)

(assert (=> b!1022980 (= lt!450357 (arrayNoDuplicates!0 (_keys!11081 thiss!1427) #b00000000000000000000000000000000 Nil!21697))))

(declare-fun b!1022981 () Bool)

(declare-fun res!685178 () Bool)

(assert (=> b!1022981 (=> (not res!685178) (not e!576383))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022981 (= res!685178 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun res!685176 () Bool)

(assert (=> start!89220 (=> (not res!685176) (not e!576383))))

(declare-fun valid!1969 (LongMapFixedSize!5168) Bool)

(assert (=> start!89220 (= res!685176 (valid!1969 thiss!1427))))

(assert (=> start!89220 e!576383))

(assert (=> start!89220 e!576385))

(assert (=> start!89220 true))

(declare-fun b!1022982 () Bool)

(declare-fun e!576382 () Bool)

(assert (=> b!1022982 (= e!576386 (and e!576382 mapRes!37389))))

(declare-fun condMapEmpty!37389 () Bool)

(declare-fun mapDefault!37389 () ValueCell!11287)

