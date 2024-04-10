; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!93554 () Bool)

(assert start!93554)

(declare-fun b!1058933 () Bool)

(declare-fun e!602561 () Bool)

(declare-fun tp_is_empty!24903 () Bool)

(assert (=> b!1058933 (= e!602561 tp_is_empty!24903)))

(declare-fun res!707474 () Bool)

(declare-fun e!602562 () Bool)

(assert (=> start!93554 (=> (not res!707474) (not e!602562))))

(declare-fun mask!1515 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!93554 (= res!707474 (validMask!0 mask!1515))))

(assert (=> start!93554 e!602562))

(assert (=> start!93554 true))

(declare-datatypes ((V!38339 0))(
  ( (V!38340 (val!12502 Int)) )
))
(declare-datatypes ((ValueCell!11748 0))(
  ( (ValueCellFull!11748 (v!15111 V!38339)) (EmptyCell!11748) )
))
(declare-datatypes ((array!66831 0))(
  ( (array!66832 (arr!32130 (Array (_ BitVec 32) ValueCell!11748)) (size!32666 (_ BitVec 32))) )
))
(declare-fun _values!955 () array!66831)

(declare-fun e!602563 () Bool)

(declare-fun array_inv!24910 (array!66831) Bool)

(assert (=> start!93554 (and (array_inv!24910 _values!955) e!602563)))

(declare-datatypes ((array!66833 0))(
  ( (array!66834 (arr!32131 (Array (_ BitVec 32) (_ BitVec 64))) (size!32667 (_ BitVec 32))) )
))
(declare-fun _keys!1163 () array!66833)

(declare-fun array_inv!24911 (array!66833) Bool)

(assert (=> start!93554 (array_inv!24911 _keys!1163)))

(declare-fun mapIsEmpty!39004 () Bool)

(declare-fun mapRes!39004 () Bool)

(assert (=> mapIsEmpty!39004 mapRes!39004))

(declare-fun b!1058934 () Bool)

(declare-fun e!602559 () Bool)

(assert (=> b!1058934 (= e!602559 tp_is_empty!24903)))

(declare-fun extraKeysAfter!68 () (_ BitVec 32))

(declare-fun b!1058935 () Bool)

(declare-fun extraKeysBefore!76 () (_ BitVec 32))

(assert (=> b!1058935 (= e!602562 (and (= (size!32666 _values!955) (bvadd #b00000000000000000000000000000001 mask!1515)) (= (size!32667 _keys!1163) (size!32666 _values!955)) (bvsge mask!1515 #b00000000000000000000000000000000) (bvsge extraKeysBefore!76 #b00000000000000000000000000000000) (bvsle extraKeysBefore!76 #b00000000000000000000000000000011) (bvsge extraKeysAfter!68 #b00000000000000000000000000000000) (bvsle extraKeysAfter!68 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!76 #b00000000000000000000000000000010) (bvand extraKeysAfter!68 #b00000000000000000000000000000010)) (= (bvand extraKeysAfter!68 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (not (= (size!32667 _keys!1163) (bvadd #b00000000000000000000000000000001 mask!1515)))))))

(declare-fun mapNonEmpty!39004 () Bool)

(declare-fun tp!74810 () Bool)

(assert (=> mapNonEmpty!39004 (= mapRes!39004 (and tp!74810 e!602561))))

(declare-fun mapRest!39004 () (Array (_ BitVec 32) ValueCell!11748))

(declare-fun mapKey!39004 () (_ BitVec 32))

(declare-fun mapValue!39004 () ValueCell!11748)

(assert (=> mapNonEmpty!39004 (= (arr!32130 _values!955) (store mapRest!39004 mapKey!39004 mapValue!39004))))

(declare-fun b!1058936 () Bool)

(assert (=> b!1058936 (= e!602563 (and e!602559 mapRes!39004))))

(declare-fun condMapEmpty!39004 () Bool)

(declare-fun mapDefault!39004 () ValueCell!11748)

(assert (=> b!1058936 (= condMapEmpty!39004 (= (arr!32130 _values!955) ((as const (Array (_ BitVec 32) ValueCell!11748)) mapDefault!39004)))))

(assert (= (and start!93554 res!707474) b!1058935))

(assert (= (and b!1058936 condMapEmpty!39004) mapIsEmpty!39004))

(assert (= (and b!1058936 (not condMapEmpty!39004)) mapNonEmpty!39004))

(get-info :version)

(assert (= (and mapNonEmpty!39004 ((_ is ValueCellFull!11748) mapValue!39004)) b!1058933))

(assert (= (and b!1058936 ((_ is ValueCellFull!11748) mapDefault!39004)) b!1058934))

(assert (= start!93554 b!1058936))

(declare-fun m!978551 () Bool)

(assert (=> start!93554 m!978551))

(declare-fun m!978553 () Bool)

(assert (=> start!93554 m!978553))

(declare-fun m!978555 () Bool)

(assert (=> start!93554 m!978555))

(declare-fun m!978557 () Bool)

(assert (=> mapNonEmpty!39004 m!978557))

(check-sat (not start!93554) (not mapNonEmpty!39004) tp_is_empty!24903)
(check-sat)
