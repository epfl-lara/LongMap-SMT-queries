; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89130 () Bool)

(assert start!89130)

(declare-fun b!1021851 () Bool)

(declare-fun b_free!20171 () Bool)

(declare-fun b_next!20171 () Bool)

(assert (=> b!1021851 (= b_free!20171 (not b_next!20171))))

(declare-fun tp!71548 () Bool)

(declare-fun b_and!32369 () Bool)

(assert (=> b!1021851 (= tp!71548 b_and!32369)))

(declare-fun b!1021847 () Bool)

(declare-fun res!684611 () Bool)

(declare-fun e!575575 () Bool)

(assert (=> b!1021847 (=> (not res!684611) (not e!575575))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1021847 (= res!684611 (and (= key!909 (bvneg key!909)) (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!1021848 () Bool)

(declare-fun e!575577 () Bool)

(declare-fun tp_is_empty!23891 () Bool)

(assert (=> b!1021848 (= e!575577 tp_is_empty!23891)))

(declare-fun b!1021849 () Bool)

(assert (=> b!1021849 (= e!575575 false)))

(declare-fun lt!450150 () Bool)

(declare-datatypes ((V!36727 0))(
  ( (V!36728 (val!11996 Int)) )
))
(declare-datatypes ((ValueCell!11242 0))(
  ( (ValueCellFull!11242 (v!14565 V!36727)) (EmptyCell!11242) )
))
(declare-datatypes ((array!63826 0))(
  ( (array!63827 (arr!30725 (Array (_ BitVec 32) (_ BitVec 64))) (size!31236 (_ BitVec 32))) )
))
(declare-datatypes ((array!63828 0))(
  ( (array!63829 (arr!30726 (Array (_ BitVec 32) ValueCell!11242)) (size!31237 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5078 0))(
  ( (LongMapFixedSize!5079 (defaultEntry!5891 Int) (mask!29470 (_ BitVec 32)) (extraKeys!5623 (_ BitVec 32)) (zeroValue!5727 V!36727) (minValue!5727 V!36727) (_size!2594 (_ BitVec 32)) (_keys!11036 array!63826) (_values!5914 array!63828) (_vacant!2594 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5078)

(declare-datatypes ((List!21664 0))(
  ( (Nil!21661) (Cons!21660 (h!22858 (_ BitVec 64)) (t!30678 List!21664)) )
))
(declare-fun arrayNoDuplicates!0 (array!63826 (_ BitVec 32) List!21664) Bool)

(assert (=> b!1021849 (= lt!450150 (arrayNoDuplicates!0 (_keys!11036 thiss!1427) #b00000000000000000000000000000000 Nil!21661))))

(declare-fun mapIsEmpty!37254 () Bool)

(declare-fun mapRes!37254 () Bool)

(assert (=> mapIsEmpty!37254 mapRes!37254))

(declare-fun b!1021850 () Bool)

(declare-fun res!684610 () Bool)

(assert (=> b!1021850 (=> (not res!684610) (not e!575575))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1021850 (= res!684610 (validMask!0 (mask!29470 thiss!1427)))))

(declare-fun e!575572 () Bool)

(declare-fun e!575576 () Bool)

(declare-fun array_inv!23821 (array!63826) Bool)

(declare-fun array_inv!23822 (array!63828) Bool)

(assert (=> b!1021851 (= e!575576 (and tp!71548 tp_is_empty!23891 (array_inv!23821 (_keys!11036 thiss!1427)) (array_inv!23822 (_values!5914 thiss!1427)) e!575572))))

(declare-fun res!684609 () Bool)

(assert (=> start!89130 (=> (not res!684609) (not e!575575))))

(declare-fun valid!1937 (LongMapFixedSize!5078) Bool)

(assert (=> start!89130 (= res!684609 (valid!1937 thiss!1427))))

(assert (=> start!89130 e!575575))

(assert (=> start!89130 e!575576))

(assert (=> start!89130 true))

(declare-fun b!1021852 () Bool)

(assert (=> b!1021852 (= e!575572 (and e!575577 mapRes!37254))))

(declare-fun condMapEmpty!37254 () Bool)

(declare-fun mapDefault!37254 () ValueCell!11242)

