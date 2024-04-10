; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89046 () Bool)

(assert start!89046)

(declare-fun b!1020985 () Bool)

(declare-fun b_free!20107 () Bool)

(declare-fun b_next!20107 () Bool)

(assert (=> b!1020985 (= b_free!20107 (not b_next!20107))))

(declare-fun tp!71350 () Bool)

(declare-fun b_and!32295 () Bool)

(assert (=> b!1020985 (= tp!71350 b_and!32295)))

(declare-fun res!684314 () Bool)

(declare-fun e!574836 () Bool)

(assert (=> start!89046 (=> (not res!684314) (not e!574836))))

(declare-datatypes ((V!36643 0))(
  ( (V!36644 (val!11964 Int)) )
))
(declare-datatypes ((array!63694 0))(
  ( (array!63695 (arr!30661 (Array (_ BitVec 32) (_ BitVec 64))) (size!31172 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11210 0))(
  ( (ValueCellFull!11210 (v!14515 V!36643)) (EmptyCell!11210) )
))
(declare-datatypes ((array!63696 0))(
  ( (array!63697 (arr!30662 (Array (_ BitVec 32) ValueCell!11210)) (size!31173 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5014 0))(
  ( (LongMapFixedSize!5015 (defaultEntry!5859 Int) (mask!29418 (_ BitVec 32)) (extraKeys!5591 (_ BitVec 32)) (zeroValue!5695 V!36643) (minValue!5695 V!36643) (_size!2562 (_ BitVec 32)) (_keys!11004 array!63694) (_values!5882 array!63696) (_vacant!2562 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1088 0))(
  ( (Cell!1089 (v!14516 LongMapFixedSize!5014)) )
))
(declare-datatypes ((LongMap!1088 0))(
  ( (LongMap!1089 (underlying!555 Cell!1088)) )
))
(declare-fun thiss!908 () LongMap!1088)

(declare-fun valid!1909 (LongMap!1088) Bool)

(assert (=> start!89046 (= res!684314 (valid!1909 thiss!908))))

(assert (=> start!89046 e!574836))

(declare-fun e!574838 () Bool)

(assert (=> start!89046 e!574838))

(assert (=> start!89046 true))

(declare-fun b!1020982 () Bool)

(declare-fun e!574833 () Bool)

(assert (=> b!1020982 (= e!574838 e!574833)))

(declare-fun b!1020983 () Bool)

(declare-fun e!574835 () Bool)

(declare-fun tp_is_empty!23827 () Bool)

(assert (=> b!1020983 (= e!574835 tp_is_empty!23827)))

(declare-fun b!1020984 () Bool)

(declare-fun e!574837 () Bool)

(assert (=> b!1020984 (= e!574837 tp_is_empty!23827)))

(declare-fun mapIsEmpty!37152 () Bool)

(declare-fun mapRes!37152 () Bool)

(assert (=> mapIsEmpty!37152 mapRes!37152))

(declare-fun e!574839 () Bool)

(declare-fun e!574834 () Bool)

(declare-fun array_inv!23783 (array!63694) Bool)

(declare-fun array_inv!23784 (array!63696) Bool)

(assert (=> b!1020985 (= e!574839 (and tp!71350 tp_is_empty!23827 (array_inv!23783 (_keys!11004 (v!14516 (underlying!555 thiss!908)))) (array_inv!23784 (_values!5882 (v!14516 (underlying!555 thiss!908)))) e!574834))))

(declare-fun mapNonEmpty!37152 () Bool)

(declare-fun tp!71349 () Bool)

(assert (=> mapNonEmpty!37152 (= mapRes!37152 (and tp!71349 e!574835))))

(declare-fun mapValue!37152 () ValueCell!11210)

(declare-fun mapKey!37152 () (_ BitVec 32))

(declare-fun mapRest!37152 () (Array (_ BitVec 32) ValueCell!11210))

(assert (=> mapNonEmpty!37152 (= (arr!30662 (_values!5882 (v!14516 (underlying!555 thiss!908)))) (store mapRest!37152 mapKey!37152 mapValue!37152))))

(declare-fun b!1020986 () Bool)

(assert (=> b!1020986 (= e!574834 (and e!574837 mapRes!37152))))

(declare-fun condMapEmpty!37152 () Bool)

(declare-fun mapDefault!37152 () ValueCell!11210)

