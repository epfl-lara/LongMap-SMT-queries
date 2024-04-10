; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89178 () Bool)

(assert start!89178)

(declare-fun b!1022475 () Bool)

(declare-fun b_free!20219 () Bool)

(declare-fun b_next!20219 () Bool)

(assert (=> b!1022475 (= b_free!20219 (not b_next!20219))))

(declare-fun tp!71692 () Bool)

(declare-fun b_and!32421 () Bool)

(assert (=> b!1022475 (= tp!71692 b_and!32421)))

(declare-fun mapNonEmpty!37326 () Bool)

(declare-fun mapRes!37326 () Bool)

(declare-fun tp!71691 () Bool)

(declare-fun e!576006 () Bool)

(assert (=> mapNonEmpty!37326 (= mapRes!37326 (and tp!71691 e!576006))))

(declare-datatypes ((V!36791 0))(
  ( (V!36792 (val!12020 Int)) )
))
(declare-datatypes ((ValueCell!11266 0))(
  ( (ValueCellFull!11266 (v!14589 V!36791)) (EmptyCell!11266) )
))
(declare-fun mapRest!37326 () (Array (_ BitVec 32) ValueCell!11266))

(declare-datatypes ((array!63922 0))(
  ( (array!63923 (arr!30773 (Array (_ BitVec 32) (_ BitVec 64))) (size!31284 (_ BitVec 32))) )
))
(declare-datatypes ((array!63924 0))(
  ( (array!63925 (arr!30774 (Array (_ BitVec 32) ValueCell!11266)) (size!31285 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5126 0))(
  ( (LongMapFixedSize!5127 (defaultEntry!5915 Int) (mask!29510 (_ BitVec 32)) (extraKeys!5647 (_ BitVec 32)) (zeroValue!5751 V!36791) (minValue!5751 V!36791) (_size!2618 (_ BitVec 32)) (_keys!11060 array!63922) (_values!5938 array!63924) (_vacant!2618 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5126)

(declare-fun mapKey!37326 () (_ BitVec 32))

(declare-fun mapValue!37326 () ValueCell!11266)

(assert (=> mapNonEmpty!37326 (= (arr!30774 (_values!5938 thiss!1427)) (store mapRest!37326 mapKey!37326 mapValue!37326))))

(declare-fun e!576005 () Bool)

(declare-fun tp_is_empty!23939 () Bool)

(declare-fun e!576004 () Bool)

(declare-fun array_inv!23855 (array!63922) Bool)

(declare-fun array_inv!23856 (array!63924) Bool)

(assert (=> b!1022475 (= e!576004 (and tp!71692 tp_is_empty!23939 (array_inv!23855 (_keys!11060 thiss!1427)) (array_inv!23856 (_values!5938 thiss!1427)) e!576005))))

(declare-fun b!1022476 () Bool)

(declare-fun e!576009 () Bool)

(assert (=> b!1022476 (= e!576009 tp_is_empty!23939)))

(declare-fun res!684943 () Bool)

(declare-fun e!576007 () Bool)

(assert (=> start!89178 (=> (not res!684943) (not e!576007))))

(declare-fun valid!1952 (LongMapFixedSize!5126) Bool)

(assert (=> start!89178 (= res!684943 (valid!1952 thiss!1427))))

(assert (=> start!89178 e!576007))

(assert (=> start!89178 e!576004))

(assert (=> start!89178 true))

(declare-fun b!1022477 () Bool)

(declare-fun res!684944 () Bool)

(assert (=> b!1022477 (=> (not res!684944) (not e!576007))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1022477 (= res!684944 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1022478 () Bool)

(assert (=> b!1022478 (= e!576005 (and e!576009 mapRes!37326))))

(declare-fun condMapEmpty!37326 () Bool)

(declare-fun mapDefault!37326 () ValueCell!11266)

