; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!81176 () Bool)

(assert start!81176)

(declare-fun b!949964 () Bool)

(declare-fun b_free!18229 () Bool)

(declare-fun b_next!18229 () Bool)

(assert (=> b!949964 (= b_free!18229 (not b_next!18229))))

(declare-fun tp!63280 () Bool)

(declare-fun b_and!29683 () Bool)

(assert (=> b!949964 (= tp!63280 b_and!29683)))

(declare-fun b!949959 () Bool)

(declare-fun e!534822 () Bool)

(declare-datatypes ((V!32615 0))(
  ( (V!32616 (val!10419 Int)) )
))
(declare-datatypes ((ValueCell!9887 0))(
  ( (ValueCellFull!9887 (v!12961 V!32615)) (EmptyCell!9887) )
))
(declare-datatypes ((array!57490 0))(
  ( (array!57491 (arr!27646 (Array (_ BitVec 32) ValueCell!9887)) (size!28123 (_ BitVec 32))) )
))
(declare-datatypes ((array!57492 0))(
  ( (array!57493 (arr!27647 (Array (_ BitVec 32) (_ BitVec 64))) (size!28124 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4924 0))(
  ( (LongMapFixedSize!4925 (defaultEntry!5772 Int) (mask!27565 (_ BitVec 32)) (extraKeys!5504 (_ BitVec 32)) (zeroValue!5608 V!32615) (minValue!5608 V!32615) (_size!2517 (_ BitVec 32)) (_keys!10706 array!57492) (_values!5795 array!57490) (_vacant!2517 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4924)

(declare-datatypes ((List!19332 0))(
  ( (Nil!19329) (Cons!19328 (h!20488 (_ BitVec 64)) (t!27669 List!19332)) )
))
(declare-fun arrayNoDuplicates!0 (array!57492 (_ BitVec 32) List!19332) Bool)

(assert (=> b!949959 (= e!534822 (not (arrayNoDuplicates!0 (_keys!10706 thiss!1141) #b00000000000000000000000000000000 Nil!19329)))))

(declare-fun b!949960 () Bool)

(declare-fun res!636968 () Bool)

(assert (=> b!949960 (=> (not res!636968) (not e!534822))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!949960 (= res!636968 (validMask!0 (mask!27565 thiss!1141)))))

(declare-fun mapIsEmpty!33014 () Bool)

(declare-fun mapRes!33014 () Bool)

(assert (=> mapIsEmpty!33014 mapRes!33014))

(declare-fun b!949961 () Bool)

(declare-fun res!636973 () Bool)

(assert (=> b!949961 (=> (not res!636973) (not e!534822))))

(declare-fun key!756 () (_ BitVec 64))

(declare-datatypes ((SeekEntryResult!9135 0))(
  ( (MissingZero!9135 (index!38911 (_ BitVec 32))) (Found!9135 (index!38912 (_ BitVec 32))) (Intermediate!9135 (undefined!9947 Bool) (index!38913 (_ BitVec 32)) (x!81727 (_ BitVec 32))) (Undefined!9135) (MissingVacant!9135 (index!38914 (_ BitVec 32))) )
))
(declare-fun seekEntry!0 ((_ BitVec 64) array!57492 (_ BitVec 32)) SeekEntryResult!9135)

(assert (=> b!949961 (= res!636973 (not (is-Found!9135 (seekEntry!0 key!756 (_keys!10706 thiss!1141) (mask!27565 thiss!1141)))))))

(declare-fun b!949962 () Bool)

(declare-fun res!636969 () Bool)

(assert (=> b!949962 (=> (not res!636969) (not e!534822))))

(assert (=> b!949962 (= res!636969 (and (= (size!28123 (_values!5795 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27565 thiss!1141))) (= (size!28124 (_keys!10706 thiss!1141)) (size!28123 (_values!5795 thiss!1141))) (bvsge (mask!27565 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5504 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5504 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!949963 () Bool)

(declare-fun res!636970 () Bool)

(assert (=> b!949963 (=> (not res!636970) (not e!534822))))

(assert (=> b!949963 (= res!636970 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun e!534825 () Bool)

(declare-fun tp_is_empty!20737 () Bool)

(declare-fun e!534824 () Bool)

(declare-fun array_inv!21458 (array!57492) Bool)

(declare-fun array_inv!21459 (array!57490) Bool)

(assert (=> b!949964 (= e!534825 (and tp!63280 tp_is_empty!20737 (array_inv!21458 (_keys!10706 thiss!1141)) (array_inv!21459 (_values!5795 thiss!1141)) e!534824))))

(declare-fun mapNonEmpty!33014 () Bool)

(declare-fun tp!63279 () Bool)

(declare-fun e!534820 () Bool)

(assert (=> mapNonEmpty!33014 (= mapRes!33014 (and tp!63279 e!534820))))

(declare-fun mapRest!33014 () (Array (_ BitVec 32) ValueCell!9887))

(declare-fun mapValue!33014 () ValueCell!9887)

(declare-fun mapKey!33014 () (_ BitVec 32))

(assert (=> mapNonEmpty!33014 (= (arr!27646 (_values!5795 thiss!1141)) (store mapRest!33014 mapKey!33014 mapValue!33014))))

(declare-fun b!949965 () Bool)

(declare-fun e!534821 () Bool)

(assert (=> b!949965 (= e!534821 tp_is_empty!20737)))

(declare-fun b!949966 () Bool)

(assert (=> b!949966 (= e!534824 (and e!534821 mapRes!33014))))

(declare-fun condMapEmpty!33014 () Bool)

(declare-fun mapDefault!33014 () ValueCell!9887)

