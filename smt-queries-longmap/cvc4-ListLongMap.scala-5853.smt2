; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75652 () Bool)

(assert start!75652)

(declare-fun b!889419 () Bool)

(declare-fun b_free!15623 () Bool)

(declare-fun b_next!15623 () Bool)

(assert (=> b!889419 (= b_free!15623 (not b_next!15623))))

(declare-fun tp!54837 () Bool)

(declare-fun b_and!25863 () Bool)

(assert (=> b!889419 (= tp!54837 b_and!25863)))

(declare-fun b!889417 () Bool)

(declare-fun e!495769 () Bool)

(declare-fun tp_is_empty!17951 () Bool)

(assert (=> b!889417 (= e!495769 tp_is_empty!17951)))

(declare-fun b!889418 () Bool)

(declare-fun res!602773 () Bool)

(declare-fun e!495772 () Bool)

(assert (=> b!889418 (=> (not res!602773) (not e!495772))))

(declare-datatypes ((array!51882 0))(
  ( (array!51883 (arr!24947 (Array (_ BitVec 32) (_ BitVec 64))) (size!25391 (_ BitVec 32))) )
))
(declare-datatypes ((V!28899 0))(
  ( (V!28900 (val!9026 Int)) )
))
(declare-datatypes ((ValueCell!8494 0))(
  ( (ValueCellFull!8494 (v!11504 V!28899)) (EmptyCell!8494) )
))
(declare-datatypes ((array!51884 0))(
  ( (array!51885 (arr!24948 (Array (_ BitVec 32) ValueCell!8494)) (size!25392 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4004 0))(
  ( (LongMapFixedSize!4005 (defaultEntry!5199 Int) (mask!25646 (_ BitVec 32)) (extraKeys!4893 (_ BitVec 32)) (zeroValue!4997 V!28899) (minValue!4997 V!28899) (_size!2057 (_ BitVec 32)) (_keys!9882 array!51882) (_values!5184 array!51884) (_vacant!2057 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4004)

(assert (=> b!889418 (= res!602773 (and (= (size!25392 (_values!5184 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25646 thiss!1181))) (= (size!25391 (_keys!9882 thiss!1181)) (size!25392 (_values!5184 thiss!1181))) (bvsge (mask!25646 thiss!1181) #b00000000000000000000000000000000) (bvsge (extraKeys!4893 thiss!1181) #b00000000000000000000000000000000) (bvsle (extraKeys!4893 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun e!495768 () Bool)

(declare-fun e!495771 () Bool)

(declare-fun array_inv!19624 (array!51882) Bool)

(declare-fun array_inv!19625 (array!51884) Bool)

(assert (=> b!889419 (= e!495771 (and tp!54837 tp_is_empty!17951 (array_inv!19624 (_keys!9882 thiss!1181)) (array_inv!19625 (_values!5184 thiss!1181)) e!495768))))

(declare-fun b!889420 () Bool)

(declare-fun e!495774 () Bool)

(assert (=> b!889420 (= e!495774 e!495772)))

(declare-fun res!602771 () Bool)

(assert (=> b!889420 (=> (not res!602771) (not e!495772))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!889420 (= res!602771 (validMask!0 (mask!25646 thiss!1181)))))

(declare-datatypes ((SeekEntryResult!8773 0))(
  ( (MissingZero!8773 (index!37463 (_ BitVec 32))) (Found!8773 (index!37464 (_ BitVec 32))) (Intermediate!8773 (undefined!9585 Bool) (index!37465 (_ BitVec 32)) (x!75509 (_ BitVec 32))) (Undefined!8773) (MissingVacant!8773 (index!37466 (_ BitVec 32))) )
))
(declare-fun lt!402028 () SeekEntryResult!8773)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun seekEntry!0 ((_ BitVec 64) array!51882 (_ BitVec 32)) SeekEntryResult!8773)

(assert (=> b!889420 (= lt!402028 (seekEntry!0 key!785 (_keys!9882 thiss!1181) (mask!25646 thiss!1181)))))

(declare-fun res!602772 () Bool)

(assert (=> start!75652 (=> (not res!602772) (not e!495774))))

(declare-fun valid!1558 (LongMapFixedSize!4004) Bool)

(assert (=> start!75652 (= res!602772 (valid!1558 thiss!1181))))

(assert (=> start!75652 e!495774))

(assert (=> start!75652 e!495771))

(assert (=> start!75652 true))

(declare-fun b!889421 () Bool)

(declare-fun res!602774 () Bool)

(assert (=> b!889421 (=> (not res!602774) (not e!495772))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!51882 (_ BitVec 32)) Bool)

(assert (=> b!889421 (= res!602774 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9882 thiss!1181) (mask!25646 thiss!1181)))))

(declare-fun mapIsEmpty!28481 () Bool)

(declare-fun mapRes!28481 () Bool)

(assert (=> mapIsEmpty!28481 mapRes!28481))

(declare-fun b!889422 () Bool)

(assert (=> b!889422 (= e!495772 false)))

(declare-fun lt!402027 () Bool)

(declare-datatypes ((List!17701 0))(
  ( (Nil!17698) (Cons!17697 (h!18828 (_ BitVec 64)) (t!25000 List!17701)) )
))
(declare-fun arrayNoDuplicates!0 (array!51882 (_ BitVec 32) List!17701) Bool)

(assert (=> b!889422 (= lt!402027 (arrayNoDuplicates!0 (_keys!9882 thiss!1181) #b00000000000000000000000000000000 Nil!17698))))

(declare-fun b!889423 () Bool)

(declare-fun e!495773 () Bool)

(assert (=> b!889423 (= e!495768 (and e!495773 mapRes!28481))))

(declare-fun condMapEmpty!28481 () Bool)

(declare-fun mapDefault!28481 () ValueCell!8494)

