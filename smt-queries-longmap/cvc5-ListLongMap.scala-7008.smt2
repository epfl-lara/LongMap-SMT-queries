; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!89032 () Bool)

(assert start!89032)

(declare-fun b!1020902 () Bool)

(declare-fun b_free!20101 () Bool)

(declare-fun b_next!20101 () Bool)

(assert (=> b!1020902 (= b_free!20101 (not b_next!20101))))

(declare-fun tp!71329 () Bool)

(declare-fun b_and!32289 () Bool)

(assert (=> b!1020902 (= tp!71329 b_and!32289)))

(declare-fun e!574752 () Bool)

(declare-fun e!574755 () Bool)

(declare-datatypes ((V!36635 0))(
  ( (V!36636 (val!11961 Int)) )
))
(declare-datatypes ((array!63680 0))(
  ( (array!63681 (arr!30655 (Array (_ BitVec 32) (_ BitVec 64))) (size!31166 (_ BitVec 32))) )
))
(declare-datatypes ((ValueCell!11207 0))(
  ( (ValueCellFull!11207 (v!14509 V!36635)) (EmptyCell!11207) )
))
(declare-datatypes ((array!63682 0))(
  ( (array!63683 (arr!30656 (Array (_ BitVec 32) ValueCell!11207)) (size!31167 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!5008 0))(
  ( (LongMapFixedSize!5009 (defaultEntry!5856 Int) (mask!29413 (_ BitVec 32)) (extraKeys!5588 (_ BitVec 32)) (zeroValue!5692 V!36635) (minValue!5692 V!36635) (_size!2559 (_ BitVec 32)) (_keys!11001 array!63680) (_values!5879 array!63682) (_vacant!2559 (_ BitVec 32))) )
))
(declare-datatypes ((Cell!1082 0))(
  ( (Cell!1083 (v!14510 LongMapFixedSize!5008)) )
))
(declare-datatypes ((LongMap!1082 0))(
  ( (LongMap!1083 (underlying!552 Cell!1082)) )
))
(declare-fun thiss!908 () LongMap!1082)

(declare-fun tp_is_empty!23821 () Bool)

(declare-fun array_inv!23779 (array!63680) Bool)

(declare-fun array_inv!23780 (array!63682) Bool)

(assert (=> b!1020902 (= e!574755 (and tp!71329 tp_is_empty!23821 (array_inv!23779 (_keys!11001 (v!14510 (underlying!552 thiss!908)))) (array_inv!23780 (_values!5879 (v!14510 (underlying!552 thiss!908)))) e!574752))))

(declare-fun b!1020903 () Bool)

(declare-fun e!574753 () Bool)

(assert (=> b!1020903 (= e!574753 tp_is_empty!23821)))

(declare-fun b!1020904 () Bool)

(declare-fun e!574757 () Bool)

(assert (=> b!1020904 (= e!574757 tp_is_empty!23821)))

(declare-fun res!684296 () Bool)

(declare-fun e!574758 () Bool)

(assert (=> start!89032 (=> (not res!684296) (not e!574758))))

(declare-fun valid!1906 (LongMap!1082) Bool)

(assert (=> start!89032 (= res!684296 (valid!1906 thiss!908))))

(assert (=> start!89032 e!574758))

(declare-fun e!574756 () Bool)

(assert (=> start!89032 e!574756))

(declare-fun b!1020905 () Bool)

(declare-fun e!574754 () Bool)

(assert (=> b!1020905 (= e!574754 e!574755)))

(declare-fun b!1020906 () Bool)

(assert (=> b!1020906 (= e!574756 e!574754)))

(declare-fun b!1020907 () Bool)

(declare-fun mapRes!37140 () Bool)

(assert (=> b!1020907 (= e!574752 (and e!574757 mapRes!37140))))

(declare-fun condMapEmpty!37140 () Bool)

(declare-fun mapDefault!37140 () ValueCell!11207)

