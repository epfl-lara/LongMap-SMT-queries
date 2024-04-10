; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!76716 () Bool)

(assert start!76716)

(declare-fun b!897883 () Bool)

(declare-fun b_free!15997 () Bool)

(declare-fun b_next!15997 () Bool)

(assert (=> b!897883 (= b_free!15997 (not b_next!15997))))

(declare-fun tp!56051 () Bool)

(declare-fun b_and!26289 () Bool)

(assert (=> b!897883 (= tp!56051 b_and!26289)))

(declare-fun b!897878 () Bool)

(declare-fun e!502169 () Bool)

(declare-fun e!502166 () Bool)

(assert (=> b!897878 (= e!502169 e!502166)))

(declare-fun res!606855 () Bool)

(assert (=> b!897878 (=> res!606855 e!502166)))

(declare-datatypes ((array!52682 0))(
  ( (array!52683 (arr!25321 (Array (_ BitVec 32) (_ BitVec 64))) (size!25776 (_ BitVec 32))) )
))
(declare-datatypes ((V!29399 0))(
  ( (V!29400 (val!9213 Int)) )
))
(declare-datatypes ((ValueCell!8681 0))(
  ( (ValueCellFull!8681 (v!11703 V!29399)) (EmptyCell!8681) )
))
(declare-datatypes ((array!52684 0))(
  ( (array!52685 (arr!25322 (Array (_ BitVec 32) ValueCell!8681)) (size!25777 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4378 0))(
  ( (LongMapFixedSize!4379 (defaultEntry!5401 Int) (mask!26111 (_ BitVec 32)) (extraKeys!5114 (_ BitVec 32)) (zeroValue!5218 V!29399) (minValue!5218 V!29399) (_size!2244 (_ BitVec 32)) (_keys!10168 array!52682) (_values!5405 array!52684) (_vacant!2244 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4378)

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!897878 (= res!606855 (not (validMask!0 (mask!26111 thiss!1181))))))

(declare-fun key!785 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!52682 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!897878 (arrayContainsKey!0 (_keys!10168 thiss!1181) key!785 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!30522 0))(
  ( (Unit!30523) )
))
(declare-fun lt!405338 () Unit!30522)

(declare-datatypes ((SeekEntryResult!8916 0))(
  ( (MissingZero!8916 (index!38035 (_ BitVec 32))) (Found!8916 (index!38036 (_ BitVec 32))) (Intermediate!8916 (undefined!9728 Bool) (index!38037 (_ BitVec 32)) (x!76513 (_ BitVec 32))) (Undefined!8916) (MissingVacant!8916 (index!38038 (_ BitVec 32))) )
))
(declare-fun lt!405339 () SeekEntryResult!8916)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!52682 (_ BitVec 64) (_ BitVec 32)) Unit!30522)

(assert (=> b!897878 (= lt!405338 (lemmaArrayContainsFromImpliesContainsFromZero!0 (_keys!10168 thiss!1181) key!785 (index!38036 lt!405339)))))

(declare-fun b!897879 () Bool)

(declare-fun e!502168 () Bool)

(declare-fun tp_is_empty!18325 () Bool)

(assert (=> b!897879 (= e!502168 tp_is_empty!18325)))

(declare-fun b!897880 () Bool)

(declare-fun e!502167 () Bool)

(assert (=> b!897880 (= e!502167 (not e!502169))))

(declare-fun res!606854 () Bool)

(assert (=> b!897880 (=> res!606854 e!502169)))

(assert (=> b!897880 (= res!606854 (not (is-Found!8916 lt!405339)))))

(declare-fun e!502164 () Bool)

(assert (=> b!897880 e!502164))

(declare-fun res!606851 () Bool)

(assert (=> b!897880 (=> res!606851 e!502164)))

(assert (=> b!897880 (= res!606851 (not (is-Found!8916 lt!405339)))))

(declare-fun lt!405340 () Unit!30522)

(declare-fun lemmaSeekEntryGivesInRangeIndex!86 (array!52682 array!52684 (_ BitVec 32) (_ BitVec 32) V!29399 V!29399 (_ BitVec 64)) Unit!30522)

(assert (=> b!897880 (= lt!405340 (lemmaSeekEntryGivesInRangeIndex!86 (_keys!10168 thiss!1181) (_values!5405 thiss!1181) (mask!26111 thiss!1181) (extraKeys!5114 thiss!1181) (zeroValue!5218 thiss!1181) (minValue!5218 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52682 (_ BitVec 32)) SeekEntryResult!8916)

(assert (=> b!897880 (= lt!405339 (seekEntry!0 key!785 (_keys!10168 thiss!1181) (mask!26111 thiss!1181)))))

(declare-fun res!606850 () Bool)

(assert (=> start!76716 (=> (not res!606850) (not e!502167))))

(declare-fun valid!1686 (LongMapFixedSize!4378) Bool)

(assert (=> start!76716 (= res!606850 (valid!1686 thiss!1181))))

(assert (=> start!76716 e!502167))

(declare-fun e!502162 () Bool)

(assert (=> start!76716 e!502162))

(assert (=> start!76716 true))

(declare-fun b!897881 () Bool)

(declare-fun res!606849 () Bool)

(assert (=> b!897881 (=> res!606849 e!502166)))

(declare-datatypes ((List!17832 0))(
  ( (Nil!17829) (Cons!17828 (h!18970 (_ BitVec 64)) (t!25171 List!17832)) )
))
(declare-fun arrayNoDuplicates!0 (array!52682 (_ BitVec 32) List!17832) Bool)

(assert (=> b!897881 (= res!606849 (not (arrayNoDuplicates!0 (_keys!10168 thiss!1181) #b00000000000000000000000000000000 Nil!17829)))))

(declare-fun b!897882 () Bool)

(declare-fun res!606852 () Bool)

(assert (=> b!897882 (=> (not res!606852) (not e!502167))))

(assert (=> b!897882 (= res!606852 (not (= key!785 (bvneg key!785))))))

(declare-fun e!502161 () Bool)

(declare-fun array_inv!19874 (array!52682) Bool)

(declare-fun array_inv!19875 (array!52684) Bool)

(assert (=> b!897883 (= e!502162 (and tp!56051 tp_is_empty!18325 (array_inv!19874 (_keys!10168 thiss!1181)) (array_inv!19875 (_values!5405 thiss!1181)) e!502161))))

(declare-fun mapIsEmpty!29133 () Bool)

(declare-fun mapRes!29133 () Bool)

(assert (=> mapIsEmpty!29133 mapRes!29133))

(declare-fun b!897884 () Bool)

(assert (=> b!897884 (= e!502161 (and e!502168 mapRes!29133))))

(declare-fun condMapEmpty!29133 () Bool)

(declare-fun mapDefault!29133 () ValueCell!8681)

