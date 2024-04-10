; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!75760 () Bool)

(assert start!75760)

(declare-fun b!890930 () Bool)

(declare-fun b_free!15731 () Bool)

(declare-fun b_next!15731 () Bool)

(assert (=> b!890930 (= b_free!15731 (not b_next!15731))))

(declare-fun tp!55162 () Bool)

(declare-fun b_and!25971 () Bool)

(assert (=> b!890930 (= tp!55162 b_and!25971)))

(declare-fun b!890927 () Bool)

(declare-fun e!497029 () Bool)

(declare-datatypes ((SeekEntryResult!8812 0))(
  ( (MissingZero!8812 (index!37619 (_ BitVec 32))) (Found!8812 (index!37620 (_ BitVec 32))) (Intermediate!8812 (undefined!9624 Bool) (index!37621 (_ BitVec 32)) (x!75692 (_ BitVec 32))) (Undefined!8812) (MissingVacant!8812 (index!37622 (_ BitVec 32))) )
))
(declare-fun lt!402478 () SeekEntryResult!8812)

(declare-datatypes ((array!52098 0))(
  ( (array!52099 (arr!25055 (Array (_ BitVec 32) (_ BitVec 64))) (size!25499 (_ BitVec 32))) )
))
(declare-datatypes ((V!29043 0))(
  ( (V!29044 (val!9080 Int)) )
))
(declare-datatypes ((ValueCell!8548 0))(
  ( (ValueCellFull!8548 (v!11558 V!29043)) (EmptyCell!8548) )
))
(declare-datatypes ((array!52100 0))(
  ( (array!52101 (arr!25056 (Array (_ BitVec 32) ValueCell!8548)) (size!25500 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4112 0))(
  ( (LongMapFixedSize!4113 (defaultEntry!5253 Int) (mask!25736 (_ BitVec 32)) (extraKeys!4947 (_ BitVec 32)) (zeroValue!5051 V!29043) (minValue!5051 V!29043) (_size!2111 (_ BitVec 32)) (_keys!9936 array!52098) (_values!5238 array!52100) (_vacant!2111 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4112)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!890927 (= e!497029 (inRange!0 (index!37620 lt!402478) (mask!25736 thiss!1181)))))

(declare-fun mapNonEmpty!28643 () Bool)

(declare-fun mapRes!28643 () Bool)

(declare-fun tp!55161 () Bool)

(declare-fun e!497034 () Bool)

(assert (=> mapNonEmpty!28643 (= mapRes!28643 (and tp!55161 e!497034))))

(declare-fun mapRest!28643 () (Array (_ BitVec 32) ValueCell!8548))

(declare-fun mapValue!28643 () ValueCell!8548)

(declare-fun mapKey!28643 () (_ BitVec 32))

(assert (=> mapNonEmpty!28643 (= (arr!25056 (_values!5238 thiss!1181)) (store mapRest!28643 mapKey!28643 mapValue!28643))))

(declare-fun b!890928 () Bool)

(declare-fun res!603636 () Bool)

(declare-fun e!497030 () Bool)

(assert (=> b!890928 (=> res!603636 e!497030)))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!52098 (_ BitVec 32)) Bool)

(assert (=> b!890928 (= res!603636 (not (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 (_keys!9936 thiss!1181) (mask!25736 thiss!1181))))))

(declare-fun b!890929 () Bool)

(declare-fun e!497032 () Bool)

(declare-fun tp_is_empty!18059 () Bool)

(assert (=> b!890929 (= e!497032 tp_is_empty!18059)))

(declare-fun e!497031 () Bool)

(declare-fun e!497026 () Bool)

(declare-fun array_inv!19694 (array!52098) Bool)

(declare-fun array_inv!19695 (array!52100) Bool)

(assert (=> b!890930 (= e!497026 (and tp!55162 tp_is_empty!18059 (array_inv!19694 (_keys!9936 thiss!1181)) (array_inv!19695 (_values!5238 thiss!1181)) e!497031))))

(declare-fun res!603637 () Bool)

(declare-fun e!497027 () Bool)

(assert (=> start!75760 (=> (not res!603637) (not e!497027))))

(declare-fun valid!1596 (LongMapFixedSize!4112) Bool)

(assert (=> start!75760 (= res!603637 (valid!1596 thiss!1181))))

(assert (=> start!75760 e!497027))

(assert (=> start!75760 e!497026))

(assert (=> start!75760 true))

(declare-fun b!890931 () Bool)

(declare-fun res!603632 () Bool)

(assert (=> b!890931 (=> (not res!603632) (not e!497027))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!890931 (= res!603632 (not (= key!785 (bvneg key!785))))))

(declare-fun b!890932 () Bool)

(assert (=> b!890932 (= e!497030 true)))

(declare-fun lt!402475 () Bool)

(declare-datatypes ((List!17730 0))(
  ( (Nil!17727) (Cons!17726 (h!18857 (_ BitVec 64)) (t!25029 List!17730)) )
))
(declare-fun arrayNoDuplicates!0 (array!52098 (_ BitVec 32) List!17730) Bool)

(assert (=> b!890932 (= lt!402475 (arrayNoDuplicates!0 (_keys!9936 thiss!1181) #b00000000000000000000000000000000 Nil!17727))))

(declare-fun b!890933 () Bool)

(declare-fun res!603638 () Bool)

(assert (=> b!890933 (=> res!603638 e!497030)))

(assert (=> b!890933 (= res!603638 (or (not (= (size!25500 (_values!5238 thiss!1181)) (bvadd #b00000000000000000000000000000001 (mask!25736 thiss!1181)))) (not (= (size!25499 (_keys!9936 thiss!1181)) (size!25500 (_values!5238 thiss!1181)))) (bvslt (mask!25736 thiss!1181) #b00000000000000000000000000000000) (bvslt (extraKeys!4947 thiss!1181) #b00000000000000000000000000000000) (bvsgt (extraKeys!4947 thiss!1181) #b00000000000000000000000000000011)))))

(declare-fun b!890934 () Bool)

(declare-fun e!497028 () Bool)

(assert (=> b!890934 (= e!497028 e!497030)))

(declare-fun res!603634 () Bool)

(assert (=> b!890934 (=> res!603634 e!497030)))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!890934 (= res!603634 (not (validMask!0 (mask!25736 thiss!1181))))))

(declare-fun arrayContainsKey!0 (array!52098 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!890934 (arrayContainsKey!0 (_keys!9936 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30322 0))(
  ( (Unit!30323) )
))
(declare-fun lt!402477 () Unit!30322)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52098 (_ BitVec 64) (_ BitVec 32)) Unit!30322)

(assert (=> b!890934 (= lt!402477 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!9936 thiss!1181) key!785 (index!37620 lt!402478)))))

(declare-fun b!890935 () Bool)

(assert (=> b!890935 (= e!497031 (and e!497032 mapRes!28643))))

(declare-fun condMapEmpty!28643 () Bool)

(declare-fun mapDefault!28643 () ValueCell!8548)

