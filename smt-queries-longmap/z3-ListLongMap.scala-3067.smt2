; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43256 () Bool)

(assert start!43256)

(declare-fun b_free!12123 () Bool)

(declare-fun b_next!12123 () Bool)

(assert (=> start!43256 (= b_free!12123 (not b_next!12123))))

(declare-fun tp!42639 () Bool)

(declare-fun b_and!20875 () Bool)

(assert (=> start!43256 (= tp!42639 b_and!20875)))

(declare-fun b!479258 () Bool)

(declare-fun res!285885 () Bool)

(declare-fun e!281939 () Bool)

(assert (=> b!479258 (=> (not res!285885) (not e!281939))))

(declare-datatypes ((array!30943 0))(
  ( (array!30944 (arr!14878 (Array (_ BitVec 32) (_ BitVec 64))) (size!15236 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!30943)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!30943 (_ BitVec 32)) Bool)

(assert (=> b!479258 (= res!285885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!479259 () Bool)

(declare-fun e!281940 () Bool)

(declare-fun tp_is_empty!13635 () Bool)

(assert (=> b!479259 (= e!281940 tp_is_empty!13635)))

(declare-fun b!479260 () Bool)

(assert (=> b!479260 (= e!281939 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!217837 () Bool)

(declare-datatypes ((V!19251 0))(
  ( (V!19252 (val!6865 Int)) )
))
(declare-fun minValue!1458 () V!19251)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19251)

(declare-datatypes ((ValueCell!6456 0))(
  ( (ValueCellFull!6456 (v!9154 V!19251)) (EmptyCell!6456) )
))
(declare-datatypes ((array!30945 0))(
  ( (array!30946 (arr!14879 (Array (_ BitVec 32) ValueCell!6456)) (size!15237 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!30945)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9010 0))(
  ( (tuple2!9011 (_1!4516 (_ BitVec 64)) (_2!4516 V!19251)) )
))
(declare-datatypes ((List!9089 0))(
  ( (Nil!9086) (Cons!9085 (h!9941 tuple2!9010) (t!15295 List!9089)) )
))
(declare-datatypes ((ListLongMap!7923 0))(
  ( (ListLongMap!7924 (toList!3977 List!9089)) )
))
(declare-fun contains!2587 (ListLongMap!7923 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2296 (array!30943 array!30945 (_ BitVec 32) (_ BitVec 32) V!19251 V!19251 (_ BitVec 32) Int) ListLongMap!7923)

(assert (=> b!479260 (= lt!217837 (contains!2587 (getCurrentListMap!2296 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!479261 () Bool)

(declare-fun res!285886 () Bool)

(assert (=> b!479261 (=> (not res!285886) (not e!281939))))

(declare-datatypes ((List!9090 0))(
  ( (Nil!9087) (Cons!9086 (h!9942 (_ BitVec 64)) (t!15296 List!9090)) )
))
(declare-fun arrayNoDuplicates!0 (array!30943 (_ BitVec 32) List!9090) Bool)

(assert (=> b!479261 (= res!285886 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9087))))

(declare-fun mapNonEmpty!22150 () Bool)

(declare-fun mapRes!22150 () Bool)

(declare-fun tp!42640 () Bool)

(assert (=> mapNonEmpty!22150 (= mapRes!22150 (and tp!42640 e!281940))))

(declare-fun mapKey!22150 () (_ BitVec 32))

(declare-fun mapValue!22150 () ValueCell!6456)

(declare-fun mapRest!22150 () (Array (_ BitVec 32) ValueCell!6456))

(assert (=> mapNonEmpty!22150 (= (arr!14879 _values!1516) (store mapRest!22150 mapKey!22150 mapValue!22150))))

(declare-fun mapIsEmpty!22150 () Bool)

(assert (=> mapIsEmpty!22150 mapRes!22150))

(declare-fun b!479263 () Bool)

(declare-fun res!285888 () Bool)

(assert (=> b!479263 (=> (not res!285888) (not e!281939))))

(assert (=> b!479263 (= res!285888 (and (= (size!15237 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15236 _keys!1874) (size!15237 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!479264 () Bool)

(declare-fun e!281938 () Bool)

(assert (=> b!479264 (= e!281938 tp_is_empty!13635)))

(declare-fun b!479262 () Bool)

(declare-fun e!281936 () Bool)

(assert (=> b!479262 (= e!281936 (and e!281938 mapRes!22150))))

(declare-fun condMapEmpty!22150 () Bool)

(declare-fun mapDefault!22150 () ValueCell!6456)

(assert (=> b!479262 (= condMapEmpty!22150 (= (arr!14879 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6456)) mapDefault!22150)))))

(declare-fun res!285887 () Bool)

(assert (=> start!43256 (=> (not res!285887) (not e!281939))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43256 (= res!285887 (validMask!0 mask!2352))))

(assert (=> start!43256 e!281939))

(assert (=> start!43256 true))

(assert (=> start!43256 tp_is_empty!13635))

(declare-fun array_inv!10734 (array!30945) Bool)

(assert (=> start!43256 (and (array_inv!10734 _values!1516) e!281936)))

(assert (=> start!43256 tp!42639))

(declare-fun array_inv!10735 (array!30943) Bool)

(assert (=> start!43256 (array_inv!10735 _keys!1874)))

(assert (= (and start!43256 res!285887) b!479263))

(assert (= (and b!479263 res!285888) b!479258))

(assert (= (and b!479258 res!285885) b!479261))

(assert (= (and b!479261 res!285886) b!479260))

(assert (= (and b!479262 condMapEmpty!22150) mapIsEmpty!22150))

(assert (= (and b!479262 (not condMapEmpty!22150)) mapNonEmpty!22150))

(get-info :version)

(assert (= (and mapNonEmpty!22150 ((_ is ValueCellFull!6456) mapValue!22150)) b!479259))

(assert (= (and b!479262 ((_ is ValueCellFull!6456) mapDefault!22150)) b!479264))

(assert (= start!43256 b!479262))

(declare-fun m!461247 () Bool)

(assert (=> mapNonEmpty!22150 m!461247))

(declare-fun m!461249 () Bool)

(assert (=> b!479260 m!461249))

(assert (=> b!479260 m!461249))

(declare-fun m!461251 () Bool)

(assert (=> b!479260 m!461251))

(declare-fun m!461253 () Bool)

(assert (=> b!479258 m!461253))

(declare-fun m!461255 () Bool)

(assert (=> b!479261 m!461255))

(declare-fun m!461257 () Bool)

(assert (=> start!43256 m!461257))

(declare-fun m!461259 () Bool)

(assert (=> start!43256 m!461259))

(declare-fun m!461261 () Bool)

(assert (=> start!43256 m!461261))

(check-sat (not b!479258) (not b!479261) (not start!43256) (not b_next!12123) (not b!479260) (not mapNonEmpty!22150) b_and!20875 tp_is_empty!13635)
(check-sat b_and!20875 (not b_next!12123))
