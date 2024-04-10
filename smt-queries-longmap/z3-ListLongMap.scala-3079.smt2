; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43368 () Bool)

(assert start!43368)

(declare-fun b_free!12195 () Bool)

(declare-fun b_next!12195 () Bool)

(assert (=> start!43368 (= b_free!12195 (not b_next!12195))))

(declare-fun tp!42861 () Bool)

(declare-fun b_and!20951 () Bool)

(assert (=> start!43368 (= tp!42861 b_and!20951)))

(declare-fun b!480429 () Bool)

(declare-fun res!286510 () Bool)

(declare-fun e!282688 () Bool)

(assert (=> b!480429 (=> (not res!286510) (not e!282688))))

(declare-datatypes ((array!31081 0))(
  ( (array!31082 (arr!14945 (Array (_ BitVec 32) (_ BitVec 64))) (size!15303 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31081)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31081 (_ BitVec 32)) Bool)

(assert (=> b!480429 (= res!286510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun mapNonEmpty!22264 () Bool)

(declare-fun mapRes!22264 () Bool)

(declare-fun tp!42862 () Bool)

(declare-fun e!282690 () Bool)

(assert (=> mapNonEmpty!22264 (= mapRes!22264 (and tp!42862 e!282690))))

(declare-datatypes ((V!19347 0))(
  ( (V!19348 (val!6901 Int)) )
))
(declare-datatypes ((ValueCell!6492 0))(
  ( (ValueCellFull!6492 (v!9192 V!19347)) (EmptyCell!6492) )
))
(declare-fun mapValue!22264 () ValueCell!6492)

(declare-fun mapKey!22264 () (_ BitVec 32))

(declare-fun mapRest!22264 () (Array (_ BitVec 32) ValueCell!6492))

(declare-datatypes ((array!31083 0))(
  ( (array!31084 (arr!14946 (Array (_ BitVec 32) ValueCell!6492)) (size!15304 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31083)

(assert (=> mapNonEmpty!22264 (= (arr!14946 _values!1516) (store mapRest!22264 mapKey!22264 mapValue!22264))))

(declare-fun mapIsEmpty!22264 () Bool)

(assert (=> mapIsEmpty!22264 mapRes!22264))

(declare-fun b!480430 () Bool)

(assert (=> b!480430 (= e!282688 (not true))))

(declare-fun lt!218149 () (_ BitVec 32))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!31081 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!480430 (= lt!218149 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun e!282689 () Bool)

(assert (=> b!480430 e!282689))

(declare-fun c!57778 () Bool)

(assert (=> b!480430 (= c!57778 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14086 0))(
  ( (Unit!14087) )
))
(declare-fun lt!218148 () Unit!14086)

(declare-fun minValue!1458 () V!19347)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19347)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!116 (array!31081 array!31083 (_ BitVec 32) (_ BitVec 32) V!19347 V!19347 (_ BitVec 64) Int) Unit!14086)

(assert (=> b!480430 (= lt!218148 (lemmaKeyInListMapIsInArray!116 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!480431 () Bool)

(declare-fun e!282691 () Bool)

(declare-fun e!282692 () Bool)

(assert (=> b!480431 (= e!282691 (and e!282692 mapRes!22264))))

(declare-fun condMapEmpty!22264 () Bool)

(declare-fun mapDefault!22264 () ValueCell!6492)

(assert (=> b!480431 (= condMapEmpty!22264 (= (arr!14946 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6492)) mapDefault!22264)))))

(declare-fun b!480432 () Bool)

(declare-fun arrayContainsKey!0 (array!31081 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!480432 (= e!282689 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun res!286514 () Bool)

(assert (=> start!43368 (=> (not res!286514) (not e!282688))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43368 (= res!286514 (validMask!0 mask!2352))))

(assert (=> start!43368 e!282688))

(assert (=> start!43368 true))

(declare-fun tp_is_empty!13707 () Bool)

(assert (=> start!43368 tp_is_empty!13707))

(declare-fun array_inv!10778 (array!31083) Bool)

(assert (=> start!43368 (and (array_inv!10778 _values!1516) e!282691)))

(assert (=> start!43368 tp!42861))

(declare-fun array_inv!10779 (array!31081) Bool)

(assert (=> start!43368 (array_inv!10779 _keys!1874)))

(declare-fun b!480433 () Bool)

(declare-fun res!286513 () Bool)

(assert (=> b!480433 (=> (not res!286513) (not e!282688))))

(declare-datatypes ((tuple2!9058 0))(
  ( (tuple2!9059 (_1!4540 (_ BitVec 64)) (_2!4540 V!19347)) )
))
(declare-datatypes ((List!9135 0))(
  ( (Nil!9132) (Cons!9131 (h!9987 tuple2!9058) (t!15345 List!9135)) )
))
(declare-datatypes ((ListLongMap!7971 0))(
  ( (ListLongMap!7972 (toList!4001 List!9135)) )
))
(declare-fun contains!2613 (ListLongMap!7971 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2320 (array!31081 array!31083 (_ BitVec 32) (_ BitVec 32) V!19347 V!19347 (_ BitVec 32) Int) ListLongMap!7971)

(assert (=> b!480433 (= res!286513 (contains!2613 (getCurrentListMap!2320 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!480434 () Bool)

(assert (=> b!480434 (= e!282689 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!480435 () Bool)

(declare-fun res!286511 () Bool)

(assert (=> b!480435 (=> (not res!286511) (not e!282688))))

(assert (=> b!480435 (= res!286511 (and (= (size!15304 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15303 _keys!1874) (size!15304 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!480436 () Bool)

(assert (=> b!480436 (= e!282692 tp_is_empty!13707)))

(declare-fun b!480437 () Bool)

(declare-fun res!286515 () Bool)

(assert (=> b!480437 (=> (not res!286515) (not e!282688))))

(declare-datatypes ((List!9136 0))(
  ( (Nil!9133) (Cons!9132 (h!9988 (_ BitVec 64)) (t!15346 List!9136)) )
))
(declare-fun arrayNoDuplicates!0 (array!31081 (_ BitVec 32) List!9136) Bool)

(assert (=> b!480437 (= res!286515 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9133))))

(declare-fun b!480438 () Bool)

(declare-fun res!286512 () Bool)

(assert (=> b!480438 (=> (not res!286512) (not e!282688))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!480438 (= res!286512 (validKeyInArray!0 k0!1332))))

(declare-fun b!480439 () Bool)

(assert (=> b!480439 (= e!282690 tp_is_empty!13707)))

(assert (= (and start!43368 res!286514) b!480435))

(assert (= (and b!480435 res!286511) b!480429))

(assert (= (and b!480429 res!286510) b!480437))

(assert (= (and b!480437 res!286515) b!480433))

(assert (= (and b!480433 res!286513) b!480438))

(assert (= (and b!480438 res!286512) b!480430))

(assert (= (and b!480430 c!57778) b!480432))

(assert (= (and b!480430 (not c!57778)) b!480434))

(assert (= (and b!480431 condMapEmpty!22264) mapIsEmpty!22264))

(assert (= (and b!480431 (not condMapEmpty!22264)) mapNonEmpty!22264))

(get-info :version)

(assert (= (and mapNonEmpty!22264 ((_ is ValueCellFull!6492) mapValue!22264)) b!480439))

(assert (= (and b!480431 ((_ is ValueCellFull!6492) mapDefault!22264)) b!480436))

(assert (= start!43368 b!480431))

(declare-fun m!462083 () Bool)

(assert (=> b!480437 m!462083))

(declare-fun m!462085 () Bool)

(assert (=> start!43368 m!462085))

(declare-fun m!462087 () Bool)

(assert (=> start!43368 m!462087))

(declare-fun m!462089 () Bool)

(assert (=> start!43368 m!462089))

(declare-fun m!462091 () Bool)

(assert (=> b!480430 m!462091))

(declare-fun m!462093 () Bool)

(assert (=> b!480430 m!462093))

(declare-fun m!462095 () Bool)

(assert (=> b!480433 m!462095))

(assert (=> b!480433 m!462095))

(declare-fun m!462097 () Bool)

(assert (=> b!480433 m!462097))

(declare-fun m!462099 () Bool)

(assert (=> b!480438 m!462099))

(declare-fun m!462101 () Bool)

(assert (=> mapNonEmpty!22264 m!462101))

(declare-fun m!462103 () Bool)

(assert (=> b!480429 m!462103))

(declare-fun m!462105 () Bool)

(assert (=> b!480432 m!462105))

(check-sat b_and!20951 (not b!480429) tp_is_empty!13707 (not b!480432) (not b!480438) (not b!480430) (not b!480437) (not start!43368) (not b!480433) (not b_next!12195) (not mapNonEmpty!22264))
(check-sat b_and!20951 (not b_next!12195))
