; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38804 () Bool)

(assert start!38804)

(declare-fun b!404872 () Bool)

(declare-fun res!233653 () Bool)

(declare-fun e!243464 () Bool)

(assert (=> b!404872 (=> (not res!233653) (not e!243464))))

(declare-datatypes ((array!24349 0))(
  ( (array!24350 (arr!11624 (Array (_ BitVec 32) (_ BitVec 64))) (size!11977 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24349)

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!404872 (= res!233653 (or (= (select (arr!11624 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11624 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!16977 () Bool)

(declare-fun mapRes!16977 () Bool)

(declare-fun tp!33096 () Bool)

(declare-fun e!243465 () Bool)

(assert (=> mapNonEmpty!16977 (= mapRes!16977 (and tp!33096 e!243465))))

(declare-datatypes ((V!14755 0))(
  ( (V!14756 (val!5163 Int)) )
))
(declare-datatypes ((ValueCell!4775 0))(
  ( (ValueCellFull!4775 (v!7404 V!14755)) (EmptyCell!4775) )
))
(declare-fun mapRest!16977 () (Array (_ BitVec 32) ValueCell!4775))

(declare-fun mapKey!16977 () (_ BitVec 32))

(declare-datatypes ((array!24351 0))(
  ( (array!24352 (arr!11625 (Array (_ BitVec 32) ValueCell!4775)) (size!11978 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24351)

(declare-fun mapValue!16977 () ValueCell!4775)

(assert (=> mapNonEmpty!16977 (= (arr!11625 _values!549) (store mapRest!16977 mapKey!16977 mapValue!16977))))

(declare-fun b!404873 () Bool)

(declare-fun res!233656 () Bool)

(assert (=> b!404873 (=> (not res!233656) (not e!243464))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24349 (_ BitVec 32)) Bool)

(assert (=> b!404873 (= res!233656 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!404874 () Bool)

(declare-fun e!243463 () Bool)

(declare-fun tp_is_empty!10237 () Bool)

(assert (=> b!404874 (= e!243463 tp_is_empty!10237)))

(declare-fun b!404875 () Bool)

(declare-fun res!233658 () Bool)

(assert (=> b!404875 (=> (not res!233658) (not e!243464))))

(assert (=> b!404875 (= res!233658 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!11977 _keys!709))))))

(declare-fun b!404876 () Bool)

(declare-fun res!233657 () Bool)

(assert (=> b!404876 (=> (not res!233657) (not e!243464))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!404876 (= res!233657 (validKeyInArray!0 k0!794))))

(declare-fun res!233652 () Bool)

(assert (=> start!38804 (=> (not res!233652) (not e!243464))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38804 (= res!233652 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!11977 _keys!709))))))

(assert (=> start!38804 e!243464))

(assert (=> start!38804 true))

(declare-fun e!243468 () Bool)

(declare-fun array_inv!8532 (array!24351) Bool)

(assert (=> start!38804 (and (array_inv!8532 _values!549) e!243468)))

(declare-fun array_inv!8533 (array!24349) Bool)

(assert (=> start!38804 (array_inv!8533 _keys!709)))

(declare-fun b!404877 () Bool)

(declare-fun res!233650 () Bool)

(assert (=> b!404877 (=> (not res!233650) (not e!243464))))

(declare-datatypes ((List!6739 0))(
  ( (Nil!6736) (Cons!6735 (h!7591 (_ BitVec 64)) (t!11904 List!6739)) )
))
(declare-fun arrayNoDuplicates!0 (array!24349 (_ BitVec 32) List!6739) Bool)

(assert (=> b!404877 (= res!233650 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6736))))

(declare-fun b!404878 () Bool)

(declare-fun e!243466 () Bool)

(assert (=> b!404878 (= e!243464 e!243466)))

(declare-fun res!233651 () Bool)

(assert (=> b!404878 (=> (not res!233651) (not e!243466))))

(declare-fun lt!188057 () array!24349)

(assert (=> b!404878 (= res!233651 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188057 mask!1025))))

(assert (=> b!404878 (= lt!188057 (array!24350 (store (arr!11624 _keys!709) i!563 k0!794) (size!11977 _keys!709)))))

(declare-fun b!404879 () Bool)

(declare-fun res!233649 () Bool)

(assert (=> b!404879 (=> (not res!233649) (not e!243464))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!404879 (= res!233649 (and (= (size!11978 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11977 _keys!709) (size!11978 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!404880 () Bool)

(declare-fun res!233654 () Bool)

(assert (=> b!404880 (=> (not res!233654) (not e!243464))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!404880 (= res!233654 (validMask!0 mask!1025))))

(declare-fun mapIsEmpty!16977 () Bool)

(assert (=> mapIsEmpty!16977 mapRes!16977))

(declare-fun b!404881 () Bool)

(assert (=> b!404881 (= e!243468 (and e!243463 mapRes!16977))))

(declare-fun condMapEmpty!16977 () Bool)

(declare-fun mapDefault!16977 () ValueCell!4775)

(assert (=> b!404881 (= condMapEmpty!16977 (= (arr!11625 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4775)) mapDefault!16977)))))

(declare-fun b!404882 () Bool)

(assert (=> b!404882 (= e!243465 tp_is_empty!10237)))

(declare-fun b!404883 () Bool)

(assert (=> b!404883 (= e!243466 false)))

(declare-fun lt!188056 () Bool)

(assert (=> b!404883 (= lt!188056 (arrayNoDuplicates!0 lt!188057 #b00000000000000000000000000000000 Nil!6736))))

(declare-fun b!404884 () Bool)

(declare-fun res!233655 () Bool)

(assert (=> b!404884 (=> (not res!233655) (not e!243464))))

(declare-fun arrayContainsKey!0 (array!24349 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!404884 (= res!233655 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(assert (= (and start!38804 res!233652) b!404880))

(assert (= (and b!404880 res!233654) b!404879))

(assert (= (and b!404879 res!233649) b!404873))

(assert (= (and b!404873 res!233656) b!404877))

(assert (= (and b!404877 res!233650) b!404875))

(assert (= (and b!404875 res!233658) b!404876))

(assert (= (and b!404876 res!233657) b!404872))

(assert (= (and b!404872 res!233653) b!404884))

(assert (= (and b!404884 res!233655) b!404878))

(assert (= (and b!404878 res!233651) b!404883))

(assert (= (and b!404881 condMapEmpty!16977) mapIsEmpty!16977))

(assert (= (and b!404881 (not condMapEmpty!16977)) mapNonEmpty!16977))

(get-info :version)

(assert (= (and mapNonEmpty!16977 ((_ is ValueCellFull!4775) mapValue!16977)) b!404882))

(assert (= (and b!404881 ((_ is ValueCellFull!4775) mapDefault!16977)) b!404874))

(assert (= start!38804 b!404881))

(declare-fun m!396987 () Bool)

(assert (=> b!404880 m!396987))

(declare-fun m!396989 () Bool)

(assert (=> start!38804 m!396989))

(declare-fun m!396991 () Bool)

(assert (=> start!38804 m!396991))

(declare-fun m!396993 () Bool)

(assert (=> b!404884 m!396993))

(declare-fun m!396995 () Bool)

(assert (=> b!404877 m!396995))

(declare-fun m!396997 () Bool)

(assert (=> b!404873 m!396997))

(declare-fun m!396999 () Bool)

(assert (=> b!404876 m!396999))

(declare-fun m!397001 () Bool)

(assert (=> b!404878 m!397001))

(declare-fun m!397003 () Bool)

(assert (=> b!404878 m!397003))

(declare-fun m!397005 () Bool)

(assert (=> b!404872 m!397005))

(declare-fun m!397007 () Bool)

(assert (=> b!404883 m!397007))

(declare-fun m!397009 () Bool)

(assert (=> mapNonEmpty!16977 m!397009))

(check-sat (not start!38804) (not b!404877) (not b!404880) (not b!404876) tp_is_empty!10237 (not b!404873) (not b!404884) (not mapNonEmpty!16977) (not b!404883) (not b!404878))
(check-sat)
