; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!80294 () Bool)

(assert start!80294)

(declare-fun b!943267 () Bool)

(declare-fun b_free!17993 () Bool)

(declare-fun b_next!17993 () Bool)

(assert (=> b!943267 (= b_free!17993 (not b_next!17993))))

(declare-fun tp!62484 () Bool)

(declare-fun b_and!29405 () Bool)

(assert (=> b!943267 (= tp!62484 b_and!29405)))

(declare-fun tp_is_empty!20501 () Bool)

(declare-datatypes ((V!32299 0))(
  ( (V!32300 (val!10301 Int)) )
))
(declare-datatypes ((ValueCell!9769 0))(
  ( (ValueCellFull!9769 (v!12832 V!32299)) (EmptyCell!9769) )
))
(declare-datatypes ((array!56968 0))(
  ( (array!56969 (arr!27410 (Array (_ BitVec 32) ValueCell!9769)) (size!27875 (_ BitVec 32))) )
))
(declare-datatypes ((array!56970 0))(
  ( (array!56971 (arr!27411 (Array (_ BitVec 32) (_ BitVec 64))) (size!27876 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4688 0))(
  ( (LongMapFixedSize!4689 (defaultEntry!5635 Int) (mask!27259 (_ BitVec 32)) (extraKeys!5367 (_ BitVec 32)) (zeroValue!5471 V!32299) (minValue!5471 V!32299) (_size!2399 (_ BitVec 32)) (_keys!10509 array!56970) (_values!5658 array!56968) (_vacant!2399 (_ BitVec 32))) )
))
(declare-fun thiss!1141 () LongMapFixedSize!4688)

(declare-fun e!530347 () Bool)

(declare-fun e!530352 () Bool)

(declare-fun array_inv!21298 (array!56970) Bool)

(declare-fun array_inv!21299 (array!56968) Bool)

(assert (=> b!943267 (= e!530352 (and tp!62484 tp_is_empty!20501 (array_inv!21298 (_keys!10509 thiss!1141)) (array_inv!21299 (_values!5658 thiss!1141)) e!530347))))

(declare-fun res!633817 () Bool)

(declare-fun e!530351 () Bool)

(assert (=> start!80294 (=> (not res!633817) (not e!530351))))

(declare-fun valid!1791 (LongMapFixedSize!4688) Bool)

(assert (=> start!80294 (= res!633817 (valid!1791 thiss!1141))))

(assert (=> start!80294 e!530351))

(assert (=> start!80294 e!530352))

(assert (=> start!80294 true))

(declare-fun b!943268 () Bool)

(declare-fun e!530350 () Bool)

(assert (=> b!943268 (= e!530350 tp_is_empty!20501)))

(declare-fun b!943269 () Bool)

(declare-fun res!633820 () Bool)

(assert (=> b!943269 (=> (not res!633820) (not e!530351))))

(assert (=> b!943269 (= res!633820 (and (= (size!27875 (_values!5658 thiss!1141)) (bvadd #b00000000000000000000000000000001 (mask!27259 thiss!1141))) (= (size!27876 (_keys!10509 thiss!1141)) (size!27875 (_values!5658 thiss!1141))) (bvsge (mask!27259 thiss!1141) #b00000000000000000000000000000000) (bvsge (extraKeys!5367 thiss!1141) #b00000000000000000000000000000000) (bvsle (extraKeys!5367 thiss!1141) #b00000000000000000000000000000011)))))

(declare-fun b!943270 () Bool)

(declare-fun res!633821 () Bool)

(assert (=> b!943270 (=> (not res!633821) (not e!530351))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!943270 (= res!633821 (validMask!0 (mask!27259 thiss!1141)))))

(declare-fun b!943271 () Bool)

(declare-fun res!633816 () Bool)

(assert (=> b!943271 (=> (not res!633816) (not e!530351))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!56970 (_ BitVec 32)) Bool)

(assert (=> b!943271 (= res!633816 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!10509 thiss!1141) (mask!27259 thiss!1141)))))

(declare-fun b!943272 () Bool)

(assert (=> b!943272 (= e!530351 false)))

(declare-fun lt!425239 () Bool)

(declare-datatypes ((List!19246 0))(
  ( (Nil!19243) (Cons!19242 (h!20392 (_ BitVec 64)) (t!27561 List!19246)) )
))
(declare-fun arrayNoDuplicates!0 (array!56970 (_ BitVec 32) List!19246) Bool)

(assert (=> b!943272 (= lt!425239 (arrayNoDuplicates!0 (_keys!10509 thiss!1141) #b00000000000000000000000000000000 Nil!19243))))

(declare-fun b!943273 () Bool)

(declare-fun res!633819 () Bool)

(assert (=> b!943273 (=> (not res!633819) (not e!530351))))

(declare-fun key!756 () (_ BitVec 64))

(assert (=> b!943273 (= res!633819 (and (not (= key!756 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= key!756 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun b!943274 () Bool)

(declare-fun mapRes!32573 () Bool)

(assert (=> b!943274 (= e!530347 (and e!530350 mapRes!32573))))

(declare-fun condMapEmpty!32573 () Bool)

(declare-fun mapDefault!32573 () ValueCell!9769)

