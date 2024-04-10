; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!77338 () Bool)

(assert start!77338)

(declare-fun b!901989 () Bool)

(declare-fun b_free!16087 () Bool)

(declare-fun b_next!16087 () Bool)

(assert (=> b!901989 (= b_free!16087 (not b_next!16087))))

(declare-fun tp!56367 () Bool)

(declare-fun b_and!26447 () Bool)

(assert (=> b!901989 (= tp!56367 b_and!26447)))

(declare-fun b!901985 () Bool)

(declare-fun res!608827 () Bool)

(declare-fun e!505043 () Bool)

(assert (=> b!901985 (=> res!608827 e!505043)))

(declare-datatypes ((array!52890 0))(
  ( (array!52891 (arr!25411 (Array (_ BitVec 32) (_ BitVec 64))) (size!25870 (_ BitVec 32))) )
))
(declare-datatypes ((V!29519 0))(
  ( (V!29520 (val!9258 Int)) )
))
(declare-datatypes ((ValueCell!8726 0))(
  ( (ValueCellFull!8726 (v!11760 V!29519)) (EmptyCell!8726) )
))
(declare-datatypes ((array!52892 0))(
  ( (array!52893 (arr!25412 (Array (_ BitVec 32) ValueCell!8726)) (size!25871 (_ BitVec 32))) )
))
(declare-datatypes ((LongMapFixedSize!4468 0))(
  ( (LongMapFixedSize!4469 (defaultEntry!5480 Int) (mask!26300 (_ BitVec 32)) (extraKeys!5211 (_ BitVec 32)) (zeroValue!5315 V!29519) (minValue!5315 V!29519) (_size!2289 (_ BitVec 32)) (_keys!10297 array!52890) (_values!5502 array!52892) (_vacant!2289 (_ BitVec 32))) )
))
(declare-fun thiss!1181 () LongMapFixedSize!4468)

(declare-fun key!785 () (_ BitVec 64))

(declare-fun contains!4446 (LongMapFixedSize!4468 (_ BitVec 64)) Bool)

(assert (=> b!901985 (= res!608827 (not (contains!4446 thiss!1181 key!785)))))

(declare-fun mapIsEmpty!29314 () Bool)

(declare-fun mapRes!29314 () Bool)

(assert (=> mapIsEmpty!29314 mapRes!29314))

(declare-fun b!901986 () Bool)

(declare-fun e!505045 () Bool)

(declare-fun tp_is_empty!18415 () Bool)

(assert (=> b!901986 (= e!505045 tp_is_empty!18415)))

(declare-fun b!901987 () Bool)

(declare-fun res!608825 () Bool)

(declare-fun e!505041 () Bool)

(assert (=> b!901987 (=> (not res!608825) (not e!505041))))

(assert (=> b!901987 (= res!608825 (not (= key!785 (bvneg key!785))))))

(declare-fun b!901988 () Bool)

(assert (=> b!901988 (= e!505041 (not e!505043))))

(declare-fun res!608828 () Bool)

(assert (=> b!901988 (=> res!608828 e!505043)))

(declare-datatypes ((SeekEntryResult!8955 0))(
  ( (MissingZero!8955 (index!38191 (_ BitVec 32))) (Found!8955 (index!38192 (_ BitVec 32))) (Intermediate!8955 (undefined!9767 Bool) (index!38193 (_ BitVec 32)) (x!76854 (_ BitVec 32))) (Undefined!8955) (MissingVacant!8955 (index!38194 (_ BitVec 32))) )
))
(declare-fun lt!407761 () SeekEntryResult!8955)

(assert (=> b!901988 (= res!608828 (is-Found!8955 lt!407761))))

(declare-fun e!505048 () Bool)

(assert (=> b!901988 e!505048))

(declare-fun res!608826 () Bool)

(assert (=> b!901988 (=> res!608826 e!505048)))

(assert (=> b!901988 (= res!608826 (not (is-Found!8955 lt!407761)))))

(declare-datatypes ((Unit!30630 0))(
  ( (Unit!30631) )
))
(declare-fun lt!407762 () Unit!30630)

(declare-fun lemmaSeekEntryGivesInRangeIndex!114 (array!52890 array!52892 (_ BitVec 32) (_ BitVec 32) V!29519 V!29519 (_ BitVec 64)) Unit!30630)

(assert (=> b!901988 (= lt!407762 (lemmaSeekEntryGivesInRangeIndex!114 (_keys!10297 thiss!1181) (_values!5502 thiss!1181) (mask!26300 thiss!1181) (extraKeys!5211 thiss!1181) (zeroValue!5315 thiss!1181) (minValue!5315 thiss!1181) key!785))))

(declare-fun seekEntry!0 ((_ BitVec 64) array!52890 (_ BitVec 32)) SeekEntryResult!8955)

(assert (=> b!901988 (= lt!407761 (seekEntry!0 key!785 (_keys!10297 thiss!1181) (mask!26300 thiss!1181)))))

(declare-fun mapNonEmpty!29314 () Bool)

(declare-fun tp!56366 () Bool)

(declare-fun e!505042 () Bool)

(assert (=> mapNonEmpty!29314 (= mapRes!29314 (and tp!56366 e!505042))))

(declare-fun mapRest!29314 () (Array (_ BitVec 32) ValueCell!8726))

(declare-fun mapKey!29314 () (_ BitVec 32))

(declare-fun mapValue!29314 () ValueCell!8726)

(assert (=> mapNonEmpty!29314 (= (arr!25412 (_values!5502 thiss!1181)) (store mapRest!29314 mapKey!29314 mapValue!29314))))

(declare-fun e!505046 () Bool)

(declare-fun e!505044 () Bool)

(declare-fun array_inv!19928 (array!52890) Bool)

(declare-fun array_inv!19929 (array!52892) Bool)

(assert (=> b!901989 (= e!505044 (and tp!56367 tp_is_empty!18415 (array_inv!19928 (_keys!10297 thiss!1181)) (array_inv!19929 (_values!5502 thiss!1181)) e!505046))))

(declare-fun b!901990 () Bool)

(assert (=> b!901990 (= e!505042 tp_is_empty!18415)))

(declare-fun res!608829 () Bool)

(assert (=> start!77338 (=> (not res!608829) (not e!505041))))

(declare-fun valid!1716 (LongMapFixedSize!4468) Bool)

(assert (=> start!77338 (= res!608829 (valid!1716 thiss!1181))))

(assert (=> start!77338 e!505041))

(assert (=> start!77338 e!505044))

(assert (=> start!77338 true))

(declare-fun b!901991 () Bool)

(declare-fun inRange!0 ((_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!901991 (= e!505048 (inRange!0 (index!38192 lt!407761) (mask!26300 thiss!1181)))))

(declare-fun b!901992 () Bool)

(assert (=> b!901992 (= e!505046 (and e!505045 mapRes!29314))))

(declare-fun condMapEmpty!29314 () Bool)

(declare-fun mapDefault!29314 () ValueCell!8726)

