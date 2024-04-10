; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76394 () Bool)

(assert start!76394)

(declare-fun b!896128 () Bool)

(declare-fun b_free!15941 () Bool)

(declare-fun b_next!15941 () Bool)

(assert (=> b!896128 (= b_free!15941 (not b_next!15941))))

(declare-fun tp!55848 () Bool)

(declare-fun b_and!26233 () Bool)

(assert (=> b!896128 (= tp!55848 b_and!26233)))

(declare-fun b!896123 () Bool)

(declare-fun res!606014 () Bool)

(declare-fun e!500832 () Bool)

(assert (=> b!896123 (=> (not res!606014) (not e!500832))))

(declare-fun key!785 () (_ BitVec 64))

(assert (=> b!896123 (= res!606014 (not (= key!785 (bvneg key!785))))))

(declare-fun res!606012 () Bool)

(assert (=> start!76394 (=> (not res!606012) (not e!500832))))

(declare-datatypes ((array!52550 0))(
  ( (array!52551 (arr!25265 (Array (_ BitVec 32) (_ BitVec 64))) (size!25715 (_ BitVec 32))) )
))
(declare-datatypes ((V!29323 0))(
  ( (V!29324 (val!9185 Int)) )
))
(declare-datatypes ((ValueCell!8653 0))(
  ( (ValueCellFull!8653 (v!11675 V!29323)) (EmptyCell!8653) )
))
(declare-datatypes ((array!52552 0))(
  ( (array!52553 (arr!25266 (Array (_ BitVec 32) ValueCell!8653)) (size!25716 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4322 0))(
  ( (LongMapFixedSize!4323 (defaultEntry!5373 Int) (mask!25997 (_ BitVec 32)) (extraKeys!5071 (_ BitVec 32)) (zeroValue!5175 V!29323) (minValue!5175 V!29323) (_size!2216 (_ BitVec 32)) (_keys!10098 array!52550) (_values!5362 array!52552) (_vacant!2216 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4322)

(declare-fun valid!1667 (LongMapFixedSize!4322) Bool)

(assert (=> start!76394 (= res!606012 (valid!1667 thiss!1181))))

(assert (=> start!76394 e!500832))

(declare-fun e!500830 () Bool)

(assert (=> start!76394 e!500830))

(assert (=> start!76394 true))

(declare-fun b!896124 () Bool)

(declare-datatypes ((SeekEntryResult!8892 0))(
  ( (MissingZero!8892 (index!37939 (_ BitVec 32))) (Found!8892 (index!37940 (_ BitVec 32))) (Intermediate!8892 (undefined!9704 Bool) (index!37941 (_ BitVec 32)) (x!76284 (_ BitVec 32))) (Undefined!8892) (MissingVacant!8892 (index!37942 (_ BitVec 32))) )
))
(declare-fun lt!404710 () SeekEntryResult!8892)

(assert (=> b!896124 (= e!500832 (not (or (not (is-Found!8892 lt!404710)) (bvslt (index!37940 lt!404710) #b00000000000000000000000000000000) (bvsge (index!37940 lt!404710) (size!25715 (_keys!10098 thiss!1181))) (bvslt (size!25715 (_keys!10098 thiss!1181)) #b01111111111111111111111111111111))))))

(declare-fun e!500828 () Bool)

(assert (=> b!896124 e!500828))

(declare-fun res!606013 () Bool)

(assert (=> b!896124 (=> res!606013 e!500828)))

(assert (=> b!896124 (= res!606013 (not (is-Found!8892 lt!404710)))))

(declare-datatypes ((Unit!30476 0))(
  ( (Unit!30477) )
))
(declare-fun lt!404709 () Unit!30476)

(declare-fun lemmaSeekEntryGivesInRangeIndex!66 (array!52550 array!52552 (_ BitVec 32) (_ BitVec 32) V!29323 V!29323 (_ BitVec 64)) Unit!30476)

(assert (=> b!896124 (= lt!404709 (lemmaSeekEntryGivesInRangeIndex!66 (_keys!10098 thiss!1181) (_values!5362 thiss!1181) (mask!25997 thiss!1181) (extraKeys!5071 thiss!1181) (zeroValue!5175 thiss!1181) (minValue!5175 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52550 (_ BitVec 32)) SeekEntryResult!8892)

(assert (=> b!896124 (= lt!404710 (seekEntry!0 key!785 (_keys!10098 thiss!1181) (mask!25997 thiss!1181)))))

(declare-fun b!896125 () Bool)

(declare-fun e!500831 () Bool)

(declare-fun tp_is_empty!18269 () Bool)

(assert (=> b!896125 (= e!500831 tp_is_empty!18269)))

(declare-fun b!896126 () Bool)

(declare-fun e!500829 () Bool)

(assert (=> b!896126 (= e!500829 tp_is_empty!18269)))

(declare-fun mapIsEmpty!29014 () Bool)

(declare-fun mapRes!29014 () Bool)

(assert (=> mapIsEmpty!29014 mapRes!29014))

(declare-fun mapNonEmpty!29014 () Bool)

(declare-fun tp!55847 () Bool)

(assert (=> mapNonEmpty!29014 (= mapRes!29014 (and tp!55847 e!500831))))

(declare-fun mapValue!29014 () ValueCell!8653)

(declare-fun mapKey!29014 () (_ BitVec 32))

(declare-fun mapRest!29014 () (Array (_ BitVec 32) ValueCell!8653))

(assert (=> mapNonEmpty!29014 (= (arr!25266 (_values!5362 thiss!1181)) (store mapRest!29014 mapKey!29014 mapValue!29014))))

(declare-fun b!896127 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!896127 (= e!500828 (inRange!0 (index!37940 lt!404710) (mask!25997 thiss!1181)))))

(declare-fun e!500833 () Bool)

(declare-fun array_inv!19834 (array!52550) Bool)

(declare-fun array_inv!19835 (array!52552) Bool)

(assert (=> b!896128 (= e!500830 (and tp!55848 tp_is_empty!18269 (array_inv!19834 (_keys!10098 thiss!1181)) (array_inv!19835 (_values!5362 thiss!1181)) e!500833))))

(declare-fun b!896129 () Bool)

(assert (=> b!896129 (= e!500833 (and e!500829 mapRes!29014))))

(declare-fun condMapEmpty!29014 () Bool)

(declare-fun mapDefault!29014 () ValueCell!8653)

