; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38958 () Bool)

(assert start!38958)

(declare-fun b!407873 () Bool)

(declare-fun res!235881 () Bool)

(declare-fun e!244897 () Bool)

(assert (=> b!407873 (=> (not res!235881) (not e!244897))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24635 0))(
  ( (array!24636 (arr!11767 (Array (_ BitVec 32) (_ BitVec 64))) (size!12119 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24635)

(assert (=> b!407873 (= res!235881 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12119 _keys!709))))))

(declare-fun b!407874 () Bool)

(declare-fun res!235883 () Bool)

(assert (=> b!407874 (=> (not res!235883) (not e!244897))))

(declare-fun k0!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24635 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407874 (= res!235883 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407875 () Bool)

(declare-fun e!244898 () Bool)

(declare-fun tp_is_empty!10377 () Bool)

(assert (=> b!407875 (= e!244898 tp_is_empty!10377)))

(declare-fun mapNonEmpty!17187 () Bool)

(declare-fun mapRes!17187 () Bool)

(declare-fun tp!33306 () Bool)

(assert (=> mapNonEmpty!17187 (= mapRes!17187 (and tp!33306 e!244898))))

(declare-datatypes ((V!14941 0))(
  ( (V!14942 (val!5233 Int)) )
))
(declare-datatypes ((ValueCell!4845 0))(
  ( (ValueCellFull!4845 (v!7480 V!14941)) (EmptyCell!4845) )
))
(declare-datatypes ((array!24637 0))(
  ( (array!24638 (arr!11768 (Array (_ BitVec 32) ValueCell!4845)) (size!12120 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24637)

(declare-fun mapKey!17187 () (_ BitVec 32))

(declare-fun mapRest!17187 () (Array (_ BitVec 32) ValueCell!4845))

(declare-fun mapValue!17187 () ValueCell!4845)

(assert (=> mapNonEmpty!17187 (= (arr!11768 _values!549) (store mapRest!17187 mapKey!17187 mapValue!17187))))

(declare-fun b!407876 () Bool)

(declare-fun res!235880 () Bool)

(assert (=> b!407876 (=> (not res!235880) (not e!244897))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!407876 (= res!235880 (and (= (size!12120 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12119 _keys!709) (size!12120 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407877 () Bool)

(declare-fun res!235884 () Bool)

(assert (=> b!407877 (=> (not res!235884) (not e!244897))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407877 (= res!235884 (validMask!0 mask!1025))))

(declare-fun b!407878 () Bool)

(declare-fun e!244901 () Bool)

(assert (=> b!407878 (= e!244901 false)))

(declare-fun lt!188711 () Bool)

(declare-fun lt!188710 () array!24635)

(declare-datatypes ((List!6823 0))(
  ( (Nil!6820) (Cons!6819 (h!7675 (_ BitVec 64)) (t!11997 List!6823)) )
))
(declare-fun arrayNoDuplicates!0 (array!24635 (_ BitVec 32) List!6823) Bool)

(assert (=> b!407878 (= lt!188711 (arrayNoDuplicates!0 lt!188710 #b00000000000000000000000000000000 Nil!6820))))

(declare-fun b!407879 () Bool)

(declare-fun res!235879 () Bool)

(assert (=> b!407879 (=> (not res!235879) (not e!244897))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24635 (_ BitVec 32)) Bool)

(assert (=> b!407879 (= res!235879 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407880 () Bool)

(declare-fun e!244899 () Bool)

(assert (=> b!407880 (= e!244899 tp_is_empty!10377)))

(declare-fun b!407881 () Bool)

(declare-fun res!235878 () Bool)

(assert (=> b!407881 (=> (not res!235878) (not e!244897))))

(assert (=> b!407881 (= res!235878 (or (= (select (arr!11767 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11767 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407882 () Bool)

(assert (=> b!407882 (= e!244897 e!244901)))

(declare-fun res!235885 () Bool)

(assert (=> b!407882 (=> (not res!235885) (not e!244901))))

(assert (=> b!407882 (= res!235885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188710 mask!1025))))

(assert (=> b!407882 (= lt!188710 (array!24636 (store (arr!11767 _keys!709) i!563 k0!794) (size!12119 _keys!709)))))

(declare-fun b!407883 () Bool)

(declare-fun res!235886 () Bool)

(assert (=> b!407883 (=> (not res!235886) (not e!244897))))

(assert (=> b!407883 (= res!235886 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6820))))

(declare-fun b!407885 () Bool)

(declare-fun res!235882 () Bool)

(assert (=> b!407885 (=> (not res!235882) (not e!244897))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407885 (= res!235882 (validKeyInArray!0 k0!794))))

(declare-fun mapIsEmpty!17187 () Bool)

(assert (=> mapIsEmpty!17187 mapRes!17187))

(declare-fun b!407884 () Bool)

(declare-fun e!244902 () Bool)

(assert (=> b!407884 (= e!244902 (and e!244899 mapRes!17187))))

(declare-fun condMapEmpty!17187 () Bool)

(declare-fun mapDefault!17187 () ValueCell!4845)

(assert (=> b!407884 (= condMapEmpty!17187 (= (arr!11768 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4845)) mapDefault!17187)))))

(declare-fun res!235887 () Bool)

(assert (=> start!38958 (=> (not res!235887) (not e!244897))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38958 (= res!235887 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12119 _keys!709))))))

(assert (=> start!38958 e!244897))

(assert (=> start!38958 true))

(declare-fun array_inv!8584 (array!24637) Bool)

(assert (=> start!38958 (and (array_inv!8584 _values!549) e!244902)))

(declare-fun array_inv!8585 (array!24635) Bool)

(assert (=> start!38958 (array_inv!8585 _keys!709)))

(assert (= (and start!38958 res!235887) b!407877))

(assert (= (and b!407877 res!235884) b!407876))

(assert (= (and b!407876 res!235880) b!407879))

(assert (= (and b!407879 res!235879) b!407883))

(assert (= (and b!407883 res!235886) b!407873))

(assert (= (and b!407873 res!235881) b!407885))

(assert (= (and b!407885 res!235882) b!407881))

(assert (= (and b!407881 res!235878) b!407874))

(assert (= (and b!407874 res!235883) b!407882))

(assert (= (and b!407882 res!235885) b!407878))

(assert (= (and b!407884 condMapEmpty!17187) mapIsEmpty!17187))

(assert (= (and b!407884 (not condMapEmpty!17187)) mapNonEmpty!17187))

(get-info :version)

(assert (= (and mapNonEmpty!17187 ((_ is ValueCellFull!4845) mapValue!17187)) b!407875))

(assert (= (and b!407884 ((_ is ValueCellFull!4845) mapDefault!17187)) b!407880))

(assert (= start!38958 b!407884))

(declare-fun m!399391 () Bool)

(assert (=> b!407881 m!399391))

(declare-fun m!399393 () Bool)

(assert (=> b!407874 m!399393))

(declare-fun m!399395 () Bool)

(assert (=> b!407885 m!399395))

(declare-fun m!399397 () Bool)

(assert (=> b!407882 m!399397))

(declare-fun m!399399 () Bool)

(assert (=> b!407882 m!399399))

(declare-fun m!399401 () Bool)

(assert (=> b!407883 m!399401))

(declare-fun m!399403 () Bool)

(assert (=> b!407877 m!399403))

(declare-fun m!399405 () Bool)

(assert (=> b!407878 m!399405))

(declare-fun m!399407 () Bool)

(assert (=> start!38958 m!399407))

(declare-fun m!399409 () Bool)

(assert (=> start!38958 m!399409))

(declare-fun m!399411 () Bool)

(assert (=> mapNonEmpty!17187 m!399411))

(declare-fun m!399413 () Bool)

(assert (=> b!407879 m!399413))

(check-sat (not mapNonEmpty!17187) (not start!38958) (not b!407885) (not b!407882) (not b!407877) (not b!407874) (not b!407883) tp_is_empty!10377 (not b!407879) (not b!407878))
(check-sat)
