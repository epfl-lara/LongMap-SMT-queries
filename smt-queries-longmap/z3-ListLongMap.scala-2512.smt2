; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38876 () Bool)

(assert start!38876)

(declare-fun b!406276 () Bool)

(declare-fun res!234732 () Bool)

(declare-fun e!244116 () Bool)

(assert (=> b!406276 (=> (not res!234732) (not e!244116))))

(declare-datatypes ((array!24493 0))(
  ( (array!24494 (arr!11696 (Array (_ BitVec 32) (_ BitVec 64))) (size!12049 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24493)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24493 (_ BitVec 32)) Bool)

(assert (=> b!406276 (= res!234732 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!406277 () Bool)

(declare-fun e!244114 () Bool)

(declare-fun tp_is_empty!10309 () Bool)

(assert (=> b!406277 (= e!244114 tp_is_empty!10309)))

(declare-fun b!406278 () Bool)

(declare-fun res!234734 () Bool)

(assert (=> b!406278 (=> (not res!234734) (not e!244116))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!406278 (= res!234734 (validKeyInArray!0 k0!794))))

(declare-fun b!406279 () Bool)

(declare-fun res!234730 () Bool)

(assert (=> b!406279 (=> (not res!234730) (not e!244116))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!406279 (= res!234730 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12049 _keys!709))))))

(declare-fun res!234737 () Bool)

(assert (=> start!38876 (=> (not res!234737) (not e!244116))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38876 (= res!234737 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12049 _keys!709))))))

(assert (=> start!38876 e!244116))

(assert (=> start!38876 true))

(declare-datatypes ((V!14851 0))(
  ( (V!14852 (val!5199 Int)) )
))
(declare-datatypes ((ValueCell!4811 0))(
  ( (ValueCellFull!4811 (v!7440 V!14851)) (EmptyCell!4811) )
))
(declare-datatypes ((array!24495 0))(
  ( (array!24496 (arr!11697 (Array (_ BitVec 32) ValueCell!4811)) (size!12050 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24495)

(declare-fun e!244112 () Bool)

(declare-fun array_inv!8580 (array!24495) Bool)

(assert (=> start!38876 (and (array_inv!8580 _values!549) e!244112)))

(declare-fun array_inv!8581 (array!24493) Bool)

(assert (=> start!38876 (array_inv!8581 _keys!709)))

(declare-fun mapNonEmpty!17085 () Bool)

(declare-fun mapRes!17085 () Bool)

(declare-fun tp!33204 () Bool)

(assert (=> mapNonEmpty!17085 (= mapRes!17085 (and tp!33204 e!244114))))

(declare-fun mapValue!17085 () ValueCell!4811)

(declare-fun mapRest!17085 () (Array (_ BitVec 32) ValueCell!4811))

(declare-fun mapKey!17085 () (_ BitVec 32))

(assert (=> mapNonEmpty!17085 (= (arr!11697 _values!549) (store mapRest!17085 mapKey!17085 mapValue!17085))))

(declare-fun b!406280 () Bool)

(declare-fun e!244115 () Bool)

(assert (=> b!406280 (= e!244116 e!244115)))

(declare-fun res!234735 () Bool)

(assert (=> b!406280 (=> (not res!234735) (not e!244115))))

(declare-fun lt!188272 () array!24493)

(assert (=> b!406280 (= res!234735 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188272 mask!1025))))

(assert (=> b!406280 (= lt!188272 (array!24494 (store (arr!11696 _keys!709) i!563 k0!794) (size!12049 _keys!709)))))

(declare-fun b!406281 () Bool)

(declare-fun res!234731 () Bool)

(assert (=> b!406281 (=> (not res!234731) (not e!244116))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!406281 (= res!234731 (and (= (size!12050 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12049 _keys!709) (size!12050 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!406282 () Bool)

(declare-fun res!234733 () Bool)

(assert (=> b!406282 (=> (not res!234733) (not e!244116))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!406282 (= res!234733 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!17085 () Bool)

(assert (=> mapIsEmpty!17085 mapRes!17085))

(declare-fun b!406283 () Bool)

(declare-fun res!234729 () Bool)

(assert (=> b!406283 (=> (not res!234729) (not e!244116))))

(assert (=> b!406283 (= res!234729 (or (= (select (arr!11696 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11696 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!406284 () Bool)

(declare-fun e!244111 () Bool)

(assert (=> b!406284 (= e!244112 (and e!244111 mapRes!17085))))

(declare-fun condMapEmpty!17085 () Bool)

(declare-fun mapDefault!17085 () ValueCell!4811)

(assert (=> b!406284 (= condMapEmpty!17085 (= (arr!11697 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4811)) mapDefault!17085)))))

(declare-fun b!406285 () Bool)

(declare-fun res!234736 () Bool)

(assert (=> b!406285 (=> (not res!234736) (not e!244116))))

(declare-fun arrayContainsKey!0 (array!24493 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!406285 (= res!234736 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!406286 () Bool)

(assert (=> b!406286 (= e!244111 tp_is_empty!10309)))

(declare-fun b!406287 () Bool)

(assert (=> b!406287 (= e!244115 false)))

(declare-fun lt!188273 () Bool)

(declare-datatypes ((List!6770 0))(
  ( (Nil!6767) (Cons!6766 (h!7622 (_ BitVec 64)) (t!11935 List!6770)) )
))
(declare-fun arrayNoDuplicates!0 (array!24493 (_ BitVec 32) List!6770) Bool)

(assert (=> b!406287 (= lt!188273 (arrayNoDuplicates!0 lt!188272 #b00000000000000000000000000000000 Nil!6767))))

(declare-fun b!406288 () Bool)

(declare-fun res!234738 () Bool)

(assert (=> b!406288 (=> (not res!234738) (not e!244116))))

(assert (=> b!406288 (= res!234738 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6767))))

(assert (= (and start!38876 res!234737) b!406282))

(assert (= (and b!406282 res!234733) b!406281))

(assert (= (and b!406281 res!234731) b!406276))

(assert (= (and b!406276 res!234732) b!406288))

(assert (= (and b!406288 res!234738) b!406279))

(assert (= (and b!406279 res!234730) b!406278))

(assert (= (and b!406278 res!234734) b!406283))

(assert (= (and b!406283 res!234729) b!406285))

(assert (= (and b!406285 res!234736) b!406280))

(assert (= (and b!406280 res!234735) b!406287))

(assert (= (and b!406284 condMapEmpty!17085) mapIsEmpty!17085))

(assert (= (and b!406284 (not condMapEmpty!17085)) mapNonEmpty!17085))

(get-info :version)

(assert (= (and mapNonEmpty!17085 ((_ is ValueCellFull!4811) mapValue!17085)) b!406277))

(assert (= (and b!406284 ((_ is ValueCellFull!4811) mapDefault!17085)) b!406286))

(assert (= start!38876 b!406284))

(declare-fun m!397851 () Bool)

(assert (=> b!406287 m!397851))

(declare-fun m!397853 () Bool)

(assert (=> b!406283 m!397853))

(declare-fun m!397855 () Bool)

(assert (=> b!406288 m!397855))

(declare-fun m!397857 () Bool)

(assert (=> start!38876 m!397857))

(declare-fun m!397859 () Bool)

(assert (=> start!38876 m!397859))

(declare-fun m!397861 () Bool)

(assert (=> b!406278 m!397861))

(declare-fun m!397863 () Bool)

(assert (=> b!406285 m!397863))

(declare-fun m!397865 () Bool)

(assert (=> b!406280 m!397865))

(declare-fun m!397867 () Bool)

(assert (=> b!406280 m!397867))

(declare-fun m!397869 () Bool)

(assert (=> b!406276 m!397869))

(declare-fun m!397871 () Bool)

(assert (=> b!406282 m!397871))

(declare-fun m!397873 () Bool)

(assert (=> mapNonEmpty!17085 m!397873))

(check-sat (not b!406288) (not b!406280) (not b!406285) (not b!406282) tp_is_empty!10309 (not mapNonEmpty!17085) (not start!38876) (not b!406276) (not b!406278) (not b!406287))
(check-sat)
