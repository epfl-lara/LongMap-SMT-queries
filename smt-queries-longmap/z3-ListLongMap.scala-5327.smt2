; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!71224 () Bool)

(assert start!71224)

(declare-fun b_free!13371 () Bool)

(declare-fun b_next!13371 () Bool)

(assert (=> start!71224 (= b_free!13371 (not b_next!13371))))

(declare-fun tp!46876 () Bool)

(declare-fun b_and!22309 () Bool)

(assert (=> start!71224 (= tp!46876 b_and!22309)))

(declare-fun b!827344 () Bool)

(declare-fun res!563922 () Bool)

(declare-fun e!460872 () Bool)

(assert (=> b!827344 (=> (not res!563922) (not e!460872))))

(declare-datatypes ((array!46338 0))(
  ( (array!46339 (arr!22213 (Array (_ BitVec 32) (_ BitVec 64))) (size!22634 (_ BitVec 32))) )
))
(declare-fun _keys!976 () array!46338)

(declare-fun mask!1312 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!46338 (_ BitVec 32)) Bool)

(assert (=> b!827344 (= res!563922 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!976 mask!1312))))

(declare-fun res!563921 () Bool)

(assert (=> start!71224 (=> (not res!563921) (not e!460872))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!71224 (= res!563921 (validMask!0 mask!1312))))

(assert (=> start!71224 e!460872))

(declare-fun tp_is_empty!15081 () Bool)

(assert (=> start!71224 tp_is_empty!15081))

(declare-fun array_inv!17701 (array!46338) Bool)

(assert (=> start!71224 (array_inv!17701 _keys!976)))

(assert (=> start!71224 true))

(declare-datatypes ((V!25109 0))(
  ( (V!25110 (val!7588 Int)) )
))
(declare-datatypes ((ValueCell!7125 0))(
  ( (ValueCellFull!7125 (v!10023 V!25109)) (EmptyCell!7125) )
))
(declare-datatypes ((array!46340 0))(
  ( (array!46341 (arr!22214 (Array (_ BitVec 32) ValueCell!7125)) (size!22635 (_ BitVec 32))) )
))
(declare-fun _values!788 () array!46340)

(declare-fun e!460870 () Bool)

(declare-fun array_inv!17702 (array!46340) Bool)

(assert (=> start!71224 (and (array_inv!17702 _values!788) e!460870)))

(assert (=> start!71224 tp!46876))

(declare-fun b!827345 () Bool)

(declare-fun e!460874 () Bool)

(assert (=> b!827345 (= e!460874 tp_is_empty!15081)))

(declare-fun b!827346 () Bool)

(declare-fun e!460871 () Bool)

(assert (=> b!827346 (= e!460871 tp_is_empty!15081)))

(declare-fun b!827347 () Bool)

(declare-fun mapRes!24250 () Bool)

(assert (=> b!827347 (= e!460870 (and e!460871 mapRes!24250))))

(declare-fun condMapEmpty!24250 () Bool)

(declare-fun mapDefault!24250 () ValueCell!7125)

(assert (=> b!827347 (= condMapEmpty!24250 (= (arr!22214 _values!788) ((as const (Array (_ BitVec 32) ValueCell!7125)) mapDefault!24250)))))

(declare-fun mapNonEmpty!24250 () Bool)

(declare-fun tp!46875 () Bool)

(assert (=> mapNonEmpty!24250 (= mapRes!24250 (and tp!46875 e!460874))))

(declare-fun mapRest!24250 () (Array (_ BitVec 32) ValueCell!7125))

(declare-fun mapKey!24250 () (_ BitVec 32))

(declare-fun mapValue!24250 () ValueCell!7125)

(assert (=> mapNonEmpty!24250 (= (arr!22214 _values!788) (store mapRest!24250 mapKey!24250 mapValue!24250))))

(declare-fun mapIsEmpty!24250 () Bool)

(assert (=> mapIsEmpty!24250 mapRes!24250))

(declare-fun b!827348 () Bool)

(declare-fun res!563923 () Bool)

(assert (=> b!827348 (=> (not res!563923) (not e!460872))))

(declare-fun extraKeysBefore!61 () (_ BitVec 32))

(declare-fun extraKeysAfter!53 () (_ BitVec 32))

(assert (=> b!827348 (= res!563923 (and (= (size!22635 _values!788) (bvadd #b00000000000000000000000000000001 mask!1312)) (= (size!22634 _keys!976) (size!22635 _values!788)) (bvsge mask!1312 #b00000000000000000000000000000000) (bvsge extraKeysBefore!61 #b00000000000000000000000000000000) (bvsle extraKeysBefore!61 #b00000000000000000000000000000011) (bvsge extraKeysAfter!53 #b00000000000000000000000000000000) (bvsle extraKeysAfter!53 #b00000000000000000000000000000011) (= (bvand extraKeysBefore!61 #b00000000000000000000000000000010) (bvand extraKeysAfter!53 #b00000000000000000000000000000010)) (not (= (bvand extraKeysAfter!53 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(declare-fun b!827349 () Bool)

(declare-fun res!563924 () Bool)

(assert (=> b!827349 (=> (not res!563924) (not e!460872))))

(declare-datatypes ((List!15856 0))(
  ( (Nil!15853) (Cons!15852 (h!16981 (_ BitVec 64)) (t!22205 List!15856)) )
))
(declare-fun arrayNoDuplicates!0 (array!46338 (_ BitVec 32) List!15856) Bool)

(assert (=> b!827349 (= res!563924 (arrayNoDuplicates!0 _keys!976 #b00000000000000000000000000000000 Nil!15853))))

(declare-fun b!827350 () Bool)

(assert (=> b!827350 (= e!460872 false)))

(declare-datatypes ((tuple2!10060 0))(
  ( (tuple2!10061 (_1!5041 (_ BitVec 64)) (_2!5041 V!25109)) )
))
(declare-datatypes ((List!15857 0))(
  ( (Nil!15854) (Cons!15853 (h!16982 tuple2!10060) (t!22206 List!15857)) )
))
(declare-datatypes ((ListLongMap!8883 0))(
  ( (ListLongMap!8884 (toList!4457 List!15857)) )
))
(declare-fun lt!374879 () ListLongMap!8883)

(declare-fun zeroValueAfter!34 () V!25109)

(declare-fun minValue!754 () V!25109)

(declare-fun defaultEntry!796 () Int)

(declare-fun getCurrentListMapNoExtraKeys!2459 (array!46338 array!46340 (_ BitVec 32) (_ BitVec 32) V!25109 V!25109 (_ BitVec 32) Int) ListLongMap!8883)

(assert (=> b!827350 (= lt!374879 (getCurrentListMapNoExtraKeys!2459 _keys!976 _values!788 mask!1312 extraKeysAfter!53 zeroValueAfter!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(declare-fun zeroValueBefore!34 () V!25109)

(declare-fun lt!374878 () ListLongMap!8883)

(assert (=> b!827350 (= lt!374878 (getCurrentListMapNoExtraKeys!2459 _keys!976 _values!788 mask!1312 extraKeysBefore!61 zeroValueBefore!34 minValue!754 #b00000000000000000000000000000000 defaultEntry!796))))

(assert (= (and start!71224 res!563921) b!827348))

(assert (= (and b!827348 res!563923) b!827344))

(assert (= (and b!827344 res!563922) b!827349))

(assert (= (and b!827349 res!563924) b!827350))

(assert (= (and b!827347 condMapEmpty!24250) mapIsEmpty!24250))

(assert (= (and b!827347 (not condMapEmpty!24250)) mapNonEmpty!24250))

(get-info :version)

(assert (= (and mapNonEmpty!24250 ((_ is ValueCellFull!7125) mapValue!24250)) b!827345))

(assert (= (and b!827347 ((_ is ValueCellFull!7125) mapDefault!24250)) b!827346))

(assert (= start!71224 b!827347))

(declare-fun m!770447 () Bool)

(assert (=> b!827344 m!770447))

(declare-fun m!770449 () Bool)

(assert (=> start!71224 m!770449))

(declare-fun m!770451 () Bool)

(assert (=> start!71224 m!770451))

(declare-fun m!770453 () Bool)

(assert (=> start!71224 m!770453))

(declare-fun m!770455 () Bool)

(assert (=> b!827350 m!770455))

(declare-fun m!770457 () Bool)

(assert (=> b!827350 m!770457))

(declare-fun m!770459 () Bool)

(assert (=> mapNonEmpty!24250 m!770459))

(declare-fun m!770461 () Bool)

(assert (=> b!827349 m!770461))

(check-sat (not start!71224) b_and!22309 tp_is_empty!15081 (not b!827344) (not mapNonEmpty!24250) (not b_next!13371) (not b!827349) (not b!827350))
(check-sat b_and!22309 (not b_next!13371))
