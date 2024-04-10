; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89232 () Bool)

(assert start!89232)

(declare-fun b!1023140 () Bool)

(declare-fun b_free!20273 () Bool)

(declare-fun b_next!20273 () Bool)

(assert (=> b!1023140 (= b_free!20273 (not b_next!20273))))

(declare-fun tp!71854 () Bool)

(declare-fun b_and!32495 () Bool)

(assert (=> b!1023140 (= tp!71854 b_and!32495)))

(declare-fun tp_is_empty!23993 () Bool)

(declare-datatypes ((V!36863 0))(
  ( (V!36864 (val!12047 Int)) )
))
(declare-datatypes ((ValueCell!11293 0))(
  ( (ValueCellFull!11293 (v!14616 V!36863)) (EmptyCell!11293) )
))
(declare-datatypes ((array!64030 0))(
  ( (array!64031 (arr!30827 (Array (_ BitVec 32) (_ BitVec 64))) (size!31338 (_ BitVec 32))) )
))
(declare-datatypes ((array!64032 0))(
  ( (array!64033 (arr!30828 (Array (_ BitVec 32) ValueCell!11293)) (size!31339 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5180 0))(
  ( (LongMapFixedSize!5181 (defaultEntry!5942 Int) (mask!29555 (_ BitVec 32)) (extraKeys!5674 (_ BitVec 32)) (zeroValue!5778 V!36863) (minValue!5778 V!36863) (_size!2645 (_ BitVec 32)) (_keys!11087 array!64030) (_values!5965 array!64032) (_vacant!2645 (_ BitVec 32))) )
))
(declare-fun thiss!1427 () LongMapFixedSize!5180)

(declare-fun e!576494 () Bool)

(declare-fun e!576490 () Bool)

(declare-fun array_inv!23885 (array!64030) Bool)

(declare-fun array_inv!23886 (array!64032) Bool)

(assert (=> b!1023140 (= e!576490 (and tp!71854 tp_is_empty!23993 (array_inv!23885 (_keys!11087 thiss!1427)) (array_inv!23886 (_values!5965 thiss!1427)) e!576494))))

(declare-fun b!1023141 () Bool)

(declare-fun e!576491 () Bool)

(assert (=> b!1023141 (= e!576491 false)))

(declare-fun lt!450375 () Bool)

(declare-datatypes ((List!21705 0))(
  ( (Nil!21702) (Cons!21701 (h!22899 (_ BitVec 64)) (t!30743 List!21705)) )
))
(declare-fun arrayNoDuplicates!0 (array!64030 (_ BitVec 32) List!21705) Bool)

(assert (=> b!1023141 (= lt!450375 (arrayNoDuplicates!0 (_keys!11087 thiss!1427) #b00000000000000000000000000000000 Nil!21702))))

(declare-fun b!1023142 () Bool)

(declare-fun res!685264 () Bool)

(assert (=> b!1023142 (=> (not res!685264) (not e!576491))))

(declare-fun key!909 () (_ BitVec 64))

(assert (=> b!1023142 (= res!685264 (and (= key!909 (bvneg key!909)) (not (= key!909 #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!1023143 () Bool)

(declare-fun res!685266 () Bool)

(assert (=> b!1023143 (=> (not res!685266) (not e!576491))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!64030 (_ BitVec 32)) Bool)

(assert (=> b!1023143 (= res!685266 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!11087 thiss!1427) (mask!29555 thiss!1427)))))

(declare-fun mapIsEmpty!37407 () Bool)

(declare-fun mapRes!37407 () Bool)

(assert (=> mapIsEmpty!37407 mapRes!37407))

(declare-fun b!1023144 () Bool)

(declare-fun e!576493 () Bool)

(assert (=> b!1023144 (= e!576494 (and e!576493 mapRes!37407))))

(declare-fun condMapEmpty!37407 () Bool)

(declare-fun mapDefault!37407 () ValueCell!11293)

