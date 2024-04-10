; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75774 () Bool)

(assert start!75774)

(declare-fun b!891165 () Bool)

(declare-fun b_free!15745 () Bool)

(declare-fun b_next!15745 () Bool)

(assert (=> b!891165 (= b_free!15745 (not b_next!15745))))

(declare-fun tp!55203 () Bool)

(declare-fun b_and!25985 () Bool)

(assert (=> b!891165 (= tp!55203 b_and!25985)))

(declare-fun b!891158 () Bool)

(declare-fun e!497222 () Bool)

(declare-fun e!497217 () Bool)

(assert (=> b!891158 (= e!497222 e!497217)))

(declare-fun res!603783 () Bool)

(assert (=> b!891158 (=> res!603783 e!497217)))

(declare-datatypes ((array!52126 0))(
  ( (array!52127 (arr!25069 (Array (_ BitVec 32) (_ BitVec 64))) (size!25513 (_ BitVec 32))) )
))
(declare-datatypes ((V!29063 0))(
  ( (V!29064 (val!9087 Int)) )
))
(declare-datatypes ((ValueCell!8555 0))(
  ( (ValueCellFull!8555 (v!11565 V!29063)) (EmptyCell!8555) )
))
(declare-datatypes ((array!52128 0))(
  ( (array!52129 (arr!25070 (Array (_ BitVec 32) ValueCell!8555)) (size!25514 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4126 0))(
  ( (LongMapFixedSize!4127 (defaultEntry!5260 Int) (mask!25749 (_ BitVec 32)) (extraKeys!4954 (_ BitVec 32)) (zeroValue!5058 V!29063) (minValue!5058 V!29063) (_size!2118 (_ BitVec 32)) (_keys!9943 array!52126) (_values!5245 array!52128) (_vacant!2118 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4126)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!891158 (= res!603783 (not (validMask!0 (mask!25749 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52126 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!891158 (arrayContainsKey!0 (_keys!9943 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((SeekEntryResult!8817 0))(
  ( (MissingZero!8817 (index!37639 (_ BitVec 32))) (Found!8817 (index!37640 (_ BitVec 32))) (Intermediate!8817 (undefined!9629 Bool) (index!37641 (_ BitVec 32)) (x!75721 (_ BitVec 32))) (Undefined!8817) (MissingVacant!8817 (index!37642 (_ BitVec 32))) )
))
(declare-fun lt!402561 () SeekEntryResult!8817)

(declare-datatypes ((Unit!30330 0))(
  ( (Unit!30331) )
))
(declare-fun lt!402560 () Unit!30330)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52126 (_ BitVec 64) (_ BitVec 32)) Unit!30330)

(assert (=> b!891158 (= lt!402560 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9943 thiss!1181) key!785 (index!37640 lt!402561)))))

(declare-fun b!891159 () Bool)

(declare-fun e!497223 () Bool)

(declare-fun tp_is_empty!18073 () Bool)

(assert (=> b!891159 (= e!497223 tp_is_empty!18073)))

(declare-fun b!891160 () Bool)

(assert (=> b!891160 (= e!497217 true)))

(declare-fun lt!402559 () Bool)

(declare-datatypes ((List!17734 0))(
  ( (Nil!17731) (Cons!17730 (h!18861 (_ BitVec 64)) (t!25033 List!17734)) )
))
(declare-fun arrayNoDuplicates!0 (array!52126 (_ BitVec 32) List!17734) Bool)

(assert (=> b!891160 (= lt!402559 (arrayNoDuplicates!0 (_keys!9943 thiss!1181) #b00000000000000000000000000000000 Nil!17731))))

(declare-fun res!603781 () Bool)

(declare-fun e!497218 () Bool)

(assert (=> start!75774 (=> (not res!603781) (not e!497218))))

(declare-fun valid!1601 (LongMapFixedSize!4126) Bool)

(assert (=> start!75774 (= res!603781 (valid!1601 thiss!1181))))

(assert (=> start!75774 e!497218))

(declare-fun e!497220 () Bool)

(assert (=> start!75774 e!497220))

(assert (=> start!75774 true))

(declare-fun b!891161 () Bool)

(declare-fun res!603784 () Bool)

(assert (=> b!891161 (=> (not res!603784) (not e!497218))))

(assert (=> b!891161 (= res!603784 (not (= key!785 (bvneg key!785))))))

(declare-fun b!891162 () Bool)

(declare-fun e!497219 () Bool)

(assert (=> b!891162 (= e!497219 tp_is_empty!18073)))

(declare-fun b!891163 () Bool)

(declare-fun res!603782 () Bool)

(assert (=> b!891163 (=> res!603782 e!497217)))

(assert (=> b!891163 (= res!603782 (or (not (= (size!25514 (_values!5245 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25749 thiss!1181)))) (not (= (size!25513 (_keys!9943 thiss!1181)) (size!25514 (_values!5245 thiss!1181)))) (bvslt (mask!25749 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4954 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4954 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!28664 () Bool)

(declare-fun mapRes!28664 () Bool)

(assert (=> mapIsEmpty!28664 mapRes!28664))

(declare-fun mapNonEmpty!28664 () Bool)

(declare-fun tp!55204 () Bool)

(assert (=> mapNonEmpty!28664 (= mapRes!28664 (and tp!55204 e!497223))))

(declare-fun mapRest!28664 () (Array (_ BitVec 32) ValueCell!8555))

(declare-fun mapKey!28664 () (_ BitVec 32))

(declare-fun mapValue!28664 () ValueCell!8555)

(assert (=> mapNonEmpty!28664 (= (arr!25070 (_values!5245 thiss!1181)) (store mapRest!28664 mapKey!28664 mapValue!28664))))

(declare-fun b!891164 () Bool)

(declare-fun e!497221 () Bool)

(assert (=> b!891164 (= e!497221 (and e!497219 mapRes!28664))))

(declare-fun condMapEmpty!28664 () Bool)

(declare-fun mapDefault!28664 () ValueCell!8555)

