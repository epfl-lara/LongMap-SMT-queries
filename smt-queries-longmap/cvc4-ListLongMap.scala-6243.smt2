; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!79886 () Bool)

(assert start!79886)

(declare-fun b!939555 () Bool)

(declare-fun b_free!17783 () Bool)

(declare-fun b_next!17783 () Bool)

(assert (=> b!939555 (= b_free!17783 (not b_next!17783))))

(declare-fun tp!61813 () Bool)

(declare-fun b_and!29195 () Bool)

(assert (=> b!939555 (= tp!61813 b_and!29195)))

(declare-fun b!939554 () Bool)

(declare-fun e!527752 () Bool)

(declare-fun tp_is_empty!20291 () Bool)

(assert (=> b!939554 (= e!527752 tp_is_empty!20291)))

(declare-fun e!527750 () Bool)

(declare-fun e!527751 () Bool)

(declare-datatypes ((V!32019 0))(
  ( (V!32020 (val!10196 Int)) )
))
(declare-datatypes ((ValueCell!9664 0))(
  ( (ValueCellFull!9664 (v!12727 V!32019)) (EmptyCell!9664) )
))
(declare-datatypes ((array!56524 0))(
  ( (array!56525 (arr!27200 (Array (_ BitVec 32) ValueCell!9664)) (size!27659 (_ BitVec 32))) )
))
(declare-datatypes ((array!56526 0))(
  ( (array!56527 (arr!27201 (Array (_ BitVec 32) (_ BitVec 64))) (size!27660 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4478 0))(
  ( (LongMapFixedSize!4479 (defaultEntry!5530 Int) (mask!27042 (_ BitVec 32)) (extraKeys!5262 (_ BitVec 32)) (zeroValue!5366 V!32019) (minValue!5366 V!32019) (_size!2294 (_ BitVec 32)) (_keys!10378 array!56526) (_values!5553 array!56524) (_vacant!2294 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4478)

(declare-fun array_inv!21156 (array!56526) Bool)

(declare-fun array_inv!21157 (array!56524) Bool)

(assert (=> b!939555 (= e!527751 (and tp!61813 tp_is_empty!20291 (array_inv!21156 (_keys!10378 thiss!1141)) (array_inv!21157 (_values!5553 thiss!1141)) e!527750))))

(declare-fun mapNonEmpty!32216 () Bool)

(declare-fun mapRes!32216 () Bool)

(declare-fun tp!61812 () Bool)

(declare-fun e!527753 () Bool)

(assert (=> mapNonEmpty!32216 (= mapRes!32216 (and tp!61812 e!527753))))

(declare-fun mapRest!32216 () (Array (_ BitVec 32) ValueCell!9664))

(declare-fun mapKey!32216 () (_ BitVec 32))

(declare-fun mapValue!32216 () ValueCell!9664)

(assert (=> mapNonEmpty!32216 (= (arr!27200 (_values!5553 thiss!1141)) (store mapRest!32216 mapKey!32216 mapValue!32216))))

(declare-fun mapIsEmpty!32216 () Bool)

(assert (=> mapIsEmpty!32216 mapRes!32216))

(declare-fun lt!424555 () Bool)

(declare-fun valid!1721 (LongMapFixedSize!4478) Bool)

(assert (=> start!79886 (= lt!424555 (valid!1721 thiss!1141))))

(assert (=> start!79886 false))

(assert (=> start!79886 e!527751))

(declare-fun b!939556 () Bool)

(assert (=> b!939556 (= e!527750 (and e!527752 mapRes!32216))))

(declare-fun condMapEmpty!32216 () Bool)

(declare-fun mapDefault!32216 () ValueCell!9664)

